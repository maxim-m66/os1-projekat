# os1-projekat
This is an operating system for a RiscV processor emulated by QEMU. The project uses no standard C or C++ libraries
It features the following OS functionalities in both C and C++ API:
1.Heap memory
- allocation
- deallocation
2.Threads
- multithreading & scheduling
- synchronous context switching
- asynchronous context swithcing
- joining with and without max waiting time
3.Semaphores
- general purpose semaphores
- owned semaphores
4.Timer
- threads sleeping
- waking threads up
5.Console
- getc
- putc
There are also C++-like libraries implemented
1.String (both C and C++ style)
2.istream (overloaded <<)
