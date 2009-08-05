/*
 * test.c
 * test code for testing C++ module in linux kernel
 */

#ifdef __cplusplus
extern "C" {
#endif
#include <linux/init.h>
//#include <linux/version.h>
#include <linux/slab.h>



/*
 * extern functions
 */

extern void call_constructor(void);
extern void call_destructor(void);

extern int mytest(int, int);

/*
 * global variables
 */
#if 0
Class MyTest 
{
   public:
      MyTest() {printk("init Mytest\n");}
      ~Mytest() { printk("destruct Mytest\n");}
   private:
      MyFun() 
      {
         printk("en .. .my function\n");
      }
}
#endif

/*
 * local funtions
 */
int own_function(void)
{
   int t;
   printk("this is my own %d\n", t);
}

static int __init test_init(void)
{
   int rc;
   call_constructor();
   printk("now i am working ...\n");

   own_function();

   rc = mytest( 3, 4);
   printk("return value from CPP fucntion is %d \n", rc);
   return 0;
}


static void __exit test_exit(void)
{
   printk("call distructor ...\n");
   call_destructor();
}
module_init(test_init)
module_exit(test_exit)

#ifdef __cplusplus
   }
#endif
