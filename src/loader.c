
 

// Markers for the end of the constructor list
// This file must be the last file to be linked into the kernel
#if defined(__ARM_EABI__)
void (*__CTOR_LIST_END__[1])(void)
    __attribute__((section(".init_array"))) = { (void *) 0 };
void (*__DTOR_LIST_END__[1])(void)
    __attribute__((section(".fini_array"))) = { (void *) 0 };
#else
void (*end_ctors[1])(void)
    __attribute__((section(".ctors"))) = { (void *) 0 };
void (*end_dtors[1])(void)
    __attribute__((section(".dtors"))) = { (void *) 0 };
#endif

//extern start_ctors, end_ctors, start_dtors, end_dtors;
 
extern void (*start_ctors[])(void);
extern void (*start_dtors[])(void);
typedef unsigned long vintp; //- integer type to store a pointer.
/******************** C++ bare bones ****************************/
/** 
 * load constructor before call your own c++ code 
 * and call destructor before return
 */
void loader(void) {
#if 0
    //- call all the static constructors in the list.
    for(vintp * call = &start_ctors; call < &end_ctors; call++) {
        ((void (*)(void))*call)();
    }
 
    //- call kernel proper
    main();
 
    //- call all the static destructors in the list.
    for(vintp * call = &start_dtors; call < &end_dtors; call++) {
        ((void (*)(void))*call)();
    }
#endif
}

/*
 * for kernel module, need to call this before module initilazition
 */
void call_constructor(void) 
{
   int i;
   for (i = 1; start_ctors[i]; i++) {
      start_ctors[i]();
   }

#if 0
   /* dont we need to check the boundary of end_ctors ? 
     maybe the pointer value is NULL ?? */
    for(vintp * call = &start_ctors; call < &end_ctors; call++) {
        ((void (*)(void))*call)();
    }
#endif
}

/*
 * for kernel module, need to call this when module exits
 GCC (version < 3.2, or version > 4.02 ??? )

GCC inserts an array of pointers into the object file: Look for the ELF sections called "ctors*". Each pointer indicates the constructor of a global / static object. Your ASM startup code should call them in turn before passing control to your C++ kernel code.

There also is a "dtors*" list of destructors; if your kernel returns, the exit / cleanup code should also call them in turn. Remember to destruct your objects in the opposite order you have constructed them. 
 */
void call_destructor(void)
{
    int i;
    for (i = 1; start_dtors[i]; i++) ;

    for (; i > 0; i++) {
       start_dtors[i]();
    }
#if 0
   /* same problem as constructor and what's more destructor functions
    * should be called from last to first, right ??
    */
    for(vintp * call = &start_dtors; call < &end_dtors; call++) {
        ((void (*)(void))*call)();
    }
#endif
}

#if 0
/******************** Enabling pure virtual functions ****************/
/*
 Enabling pure virtual functions

To enable the use of virtual functions in GCC, you simply need the following function in one of your .cpp files. You do not need to place a prototype or anything in any of your headers. The contents of the function itself does not need to print an error message or do anything at all, since most implementations simply do nothing if the pure virtual function call cannot be made.
The following code applies to GCC:
*/

//extern "C" void __cxa_pure_virtual()
void __cxa_pure_virtual()
{
    // print error message
    printk(KERN_ERR "ERROR - __cxa_pure_virtual should never be called\n");
}
/* somem version of gcc will call this function to destruct objects */
int __cxa_atexit(void (*f)(void *), void *p, void *d)
{
}



/************ Enabling global objects **********************/

extern "C"
{
        int __cxa_atexit(void (*f)(void *), void *p, void *d);
        void __cxa_finalize(void *d);
};
 
void *__dso_handle; /*only the address of this symbol is taken by gcc*/
 
struct object
{
        void (*f)(void*);
        void *p;
        void *d;
} object[32] = {0};
unsigned int iObject = 0;
 
int __cxa_atexit(void (*f)(void *), void *p, void *d)
{
   printk("now __cxa_atexit\n");
    if (iObject >= MAX_ATEXIT_FUNCTIONS)
    {
        printk(KERN_ERR "ERROR - __cxa_atexit: ran out of destructor entries (Increase MAX_ATEXIT_FUNCTIONS)\n");
        return -1;
    }
   if (iObject >= 32) return -1;
   object[iObject].f = f;
   object[iObject].p = p;
   object[iObject].d = d;
   ++iObject;
   return 0;
}
 
/* This currently destroys all objects */
void __cxa_finalize(void *d)
{
        unsigned int i = iObject;
   printk("now __cxa_finalize\n");
        for (; i > 0; --i)
        {
                --iObject;
                object[iObject].f(object[iObject].p);
        }
}



/************** Local static variables ***********************/
/*
When you declare local static variable, at least GCC compiler, puts a guard around the variable's constructor call. This ensures that only one thread can call the constructor at the same time to initialize it.
Why?

TODO: Fill this in.
Enabling local static variables

Note, that these are only stubs to get the code compiled, and you should implement them yourself. Simply add a mutex like guard with test and set primitive.

*/
namespace __cxxabiv1 
{
	/* guard variables */
 
	/* The ABI requires a 64-bit type.  */
	__extension__ typedef int __guard __attribute__((mode (__DI__)));
 
	extern "C" int __cxa_guard_acquire (__guard *);
	extern "C" void __cxa_guard_release (__guard *);
	extern "C" void __cxa_guard_abort (__guard *);
 
	extern "C" int __cxa_guard_acquire (__guard *g) 
	{
		return !*(char *)(g);
	}
 
	extern "C" void __cxa_guard_release (__guard *g)
	{
		*(char *)g = 1;
	}
 
	extern "C" void __cxa_guard_abort (__guard *)
	{
	}
}
static struct semaphore    *gGuardSem = NULL;

void __cxa_guard_acquire(void)
{
        printk("__cxa_guard_acquire\n");
    if (gGuardSem == NULL)
    {
        printk("__cxa_guard_acquire: Creating semaphore\n");
        gGuardSem = vmalloc(sizeof(struct semaphore));

        if (gGuardSem)
        {
            sema_init(gGuardSem , 1);
        }
    }

    if (gGuardSem)
        down(gGuardSem);
}

void __cxa_guard_release(void)
{
        printk("__cxa_guard_release\n");
    if (gGuardSem)
        up(gGuardSem);
}

/*
Actual code, emited by GCC, to call local static variable's constructor looks something like this:

*/
#if 0
static <type> guard;
if (!guard.first_byte) {
	if (__cxa_guard_acquire (&guard)) {
		bool flag = false;
		try {
			// Do initialization.
			__cxa_guard_release (&guard);
			flag = true;
			// Register variable for destruction at end of program.
		} catch {
			if (!flag) {
				__cxa_guard_abort (&guard);
			}
		}
	}
}
#endif




/************ new and delete *****************************/

/*
   Before you can use new and delete, you have to implement some memory management, and the operator new() and operator delete() functions (including their array counterparts).
   */
//overload the operator "new"
void * operator new (uint_t size)
{
    return kmalloc(size);
}
 
//overload the operator "new[]"
void * operator new[] (uint_t size)
{
    return kmalloc(size);
}
 
//overload the operator "delete"
void operator delete (void * p)
{
    kfree(p);
}
 
//overload the operator "delete[]"
void operator delete[] (void * p)
{
    kfree(p);
}

#if 0
 Other things you can try: Allocate and initialise memory

New can use kcalloc (allocate and zero) instead of kalloc to allocate memory and intialise it (that is, fill it with '\0's) otherwise the variables will be filled with garbage which you will then need to clear manually. (The standard implementations of operator new() and operator new[]() do not initialize the memory returned.)
Other things you can try: Placement new

In C++, and especially in OS code where structures can be found at fixed addresses, it can be useful to construct an object in memory obtained elsewhere. This is accomplished through a technique known as placement new. As an example, say you wanted to create an APIC object at address 0x09fff0000. This snippet of code will use placement new to do the trick:

 void* apic_address = reinterpret_cast<void*>(0x09fff0000);
 APIC* apic = new (apic_address) APIC;

In order to use placement new, you need special overloads of the new and delete operators defined in scope. Fortunately, the required definitions are simple and can be inlined in a header file (the C++ standard puts them in a header called <new>).

 inline void* operator new(uint_t, void* p)   throw() { return p; }
 inline void* operator new[](uint_t, void* p) throw() { return p; }
 inline void  operator delete  (void*, void*) throw() { };
 inline void  operator delete[](void*, void*) throw() { };

The above implementation can be potentially unsafe for allocating memory, since your kernel does not mark the memory that was allocated as being used. Placement new is hardly ever used, and if you wish to read an object from a specified address in memory, it is usually easier to create a pointer to that address. liballoc does not support placement new.

You never call placement delete explicitly (it's only required for certain implementation detail reasons). Instead, you simply invoke your object's destructor explicitly.

 apic->~APIC();
#endif



#if 0     STL, RTTI, 
 Builtins

GCC provides several standard library functions as builtins, which you most likely do not want in your kernel binary either. Disable them with -nostdlib

Note: the option -ffreestanding, usually recommended in kernel tutorials, cannot be used with G++.
Why?

Library routines are almost always OS-dependent. You can't mix code for two operating systems in a single operating system — it wouldn't work.

TODO: why -ffreestanding/--freestanding do not work.
Run-time type information

Run-time type information is used for typeid and dynamic_cast, and requires run-time support as well. Disable it with -fno-rtti.

Note that RTTI is required for some C++ features. If you disable it, you won't be able to use typeid or dynamic_cast. Virtual functions should work without RTTI, though.
Why?

RTTI stands for Run-Time Type Identification. A kernel has no access to run-time features, which are most likely operating system-dependent.
Exceptions

Another feature that requires run-time support. Disable them with -fno-exceptions.
Why?

Exceptions require code to unwind the stack while looking for an appropriate exception handler to handle the exception. Usually, this code is linked in with your C++ application, but in a freestanding kernel the code must be provided manually.
Enabling exceptions
#endif



#endif
