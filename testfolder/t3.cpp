
#if 1
extern "C"
{
//#include <linux/init.h>
//#include <linux/autoconf.h>
#include <linux/kernel.h>
//#include <linux/string.h>

//#include <sw/os/linux/kernel/deskernel.h>
}

#endif
class myTest 
{
   public:
      myTest(){
         //printk(" construction ... \n");
      }
      virtual ~myTest() { 
         //printk(KERN_INFO "destruction...\n");
      }
      static void myPrint(char *a)
      {
         //printk(KERN_INFO"my printk\n");
         //sprintf(a,"test\n");
         a[0] = 'a';
         a[1] = 'b';
         a[2] = 'c';
         a[3] = 0;
      }
};

void testprint(char *a) 
{

      //myTest::myPrint(a);
      return ;
}

