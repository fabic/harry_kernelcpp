# “Harry-hit (?)”´s kernelcpp (2009)

* _**2015-12-04/fabic :** This is an import from SVN to Git of
  [kernelcpp](https://code.google.com/p/kernelcpp/) (by a certain "Harry-hit") for me to look at._

* Official project page is at : <https://code.google.com/p/kernelcpp/>
* Original author page : <https://code.google.com/u/113830570203256823928/> (couldn't find more accurate)

* Other pointers :
	* [/veltzer/kcpp](/veltzer/kcpp)
	* [C++ Exceptions & the Linux Kernel (Halldor Isak Gylfason, September 01, 2005 @ drdobbs.com)](http://www.drdobbs.com/cpp/c-exceptions-the-linux-kernel/229100146)
	* [Why do people still care about C++ for kernel dev? Slashdot thread](http://linux.slashdot.org/story/14/10/03/1832216/object-oriented-linux-kernel-with-c-driver-support)
	* [Is it possible to develop a loadable kernel module (LKM) on Linux with C++? (2012, Stackoverflow)](http://stackoverflow.com/questions/10469188/is-it-possible-to-develop-a-loadable-kernel-module-lkm-on-linux-with-c)


## Original README says :

HOW TO CREATE .ko MODULE

This Makefile will help you to create .ko file for you linux kernel.

DEPENDENCY

kernel headers: depends on which version you are using and which distribution you are using you need install
corespondent linux kernel header for you machine.

libtest.a: This file is your main kernel functions written in CPP compile under ./cpp folder. If you want to know how to
write a CPP function for kernel just jump to ./cpp folder and see ./cpp/README for details.

gcc: whichever version should be OK. just test gcc 4.1 for debian.

__*EOF*__

