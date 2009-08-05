/*
 * test.cpp
 * test code for testing C++ module in linux kernel
 */


#ifdef __cplusplus
extern "C" {
#endif

/*
 * extern functions
 */

/*
 * global variables
 */
int mytest(int a, int b) ;
class MyTest {
   public:
  int    MyFun(int a, int b) 
      {
         /* printf("en .. .my function\n"); */
         return (a + b);
      }
};

/* c wrapper ?? */
int mytest(int a, int b) 
{
   class MyTest test;
   return test.MyFun( a , b);
}

#ifdef __cplusplus
}
#endif
