#include "../h/syscall_c.hpp"
#include "../h/c_console.hpp"
#include "../h/syscall_cpp.hpp"
#include "../h/c_thread.hpp"
#include "../h/iostream.hpp"
#include "../h/string.hpp"

using namespace stm;

class FibonacciThread : public Thread {
public:
    explicit FibonacciThread(char c) : Thread(), c(c) {}

    void run() override {
        for (int i = 0; i < 10; i++) {
            for (int i = 0; i < 10000000; i++);
            putc(c);
        }
        for (int i = 0; i < 10000000; i++);
        for (int i = 0; i < 10000000; i++);
        cout << fibonacci(static_cast<int>(c)) << endl;
    }

    int fibonacci(int i) {
        if (i < 0) return -1;
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    }
private :
    char c;
};

class SleeperThread : public Thread {
public:
    explicit SleeperThread(int time) : time(time) {}
    void run() override {
        for (int i = 0; i < 200 / time; i++) {
            Thread::sleep(time);
            cout << "Hello thread " << time / 10 << "s!" <<  endl;
        }
    }
private:
    int time;
};

#define THRD 50

int userMain() {
    dramatic_print("Hello There!! Welcome to my Operating System.\n");
    Thread *threads[THRD];
    for (int i = 0; i < THRD; i++) {
        threads[i] = new FibonacciThread('A' + i);
        threads[i]->start();
    }
    for (auto & thread : threads) {
        thread->join();
    }
    Thread *sleeper1 = new SleeperThread(10), *sleeper2 = new SleeperThread(20), *sleeper4 = new SleeperThread(40);
    sleeper1->start();
    sleeper2->start();
    sleeper4->start();
    sleeper1->join();
    sleeper2->join();
    sleeper4->join();
    return 0;
}