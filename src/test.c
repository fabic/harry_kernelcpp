/*
 * test.c
 * test code for testing C++ module in linux kernel
 */

#include <linux/init.h>
//#include <linux/version.h>
#include <linux/slab.h>



/*
 * extern functions
 */

extern void call_constructor(void);
extern void call_destructor(void);

/*
 * global variables
 */
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

/*
 * local funtions
 */

static int __init test_init(void)
{
   call_constructor();
   printk("now i am working ...\n");

   class MyTest t;
   t.MyTest();

}


static void __exit test_exit(void)
{
   printk("call distructor ...\n");
   call_destructor();
}
module_init(test_init)
module_exit(test_exit)
