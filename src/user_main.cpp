#include "../h/syscall_c.hpp"
#include "../h/c_console.hpp"
#include "../h/syscall_cpp.hpp"
#include "../h/string.hpp"
#include "../h/c_thread.hpp"
#include "../h/iostream.hpp"
#include "../h/smart_pointer.hpp"

int constexpr CAP = 1000;
using namespace stm;

class MyThread1 : public Thread {
public:
    explicit MyThread1(char c) : Thread(), c(c) {}

protected:
    void run() override {
        for (int i = 0; i < 20; i++) {
            putc(this->c);
            for (uint64 j = 0; j < 30000000; j++);
        }
    }

private:
    char c;
};

class MyThread2 : public Thread {
public:
    explicit MyThread2(int seconds) : Thread(), seconds(seconds) {}

protected:
    void run() override {
        for (int i = 0; i < 24 / seconds; i++) {
            Thread::sleep(seconds * 10);
            print(seconds);
            putc(' ');
        }
    }

private:
    int seconds;
};

void MyRun4(void *) {
    for (long i = 0; i < 10; i++) {
        print("Now we shall test the resilience of the process Scheduler and the printing function. There are a 1000 threads running at once but each copy of this sentence should be printed in full. This is achieved via Semaphores\n");
        thread_dispatch();
    }
}

class HoneyPot {
public:
    HoneyPot() {
        this->honey = 0;
        this->lock = new Semaphore(1);
    }

    void put(int i) {
        this->lock->wait();
        this->honey += i;
        this->lock->signal();
    }

    int empty() {
        this->lock->wait();
        int ret = this->honey;
        this->honey = 0;
        this->lock->signal();
        return ret;
    }

    int getHoney() const {
        return this->honey;
    }

private:
    int honey = 0;
    Semaphore *lock;
};

class Bee : public Thread {
public:
    explicit Bee(HoneyPot *pot) : Thread(), pot(pot), honeyMade(0) {}

    int getHoney() const {
        return this->honeyMade;
    }

protected:
    void run() override {
        for (int i = 0; i < 100; i++) {
            this->pot->put(1);
            this->honeyMade++;
            if (i % 10 == 0)
                Thread::sleep(1);
        }
    }

private:
    HoneyPot *pot;
    int honeyMade;
};

class Bear : public Thread {
public:
    explicit Bear(HoneyPot *pot) : Thread(), pot(pot), honeyEaten(0) {}

    int getHoney() const {
        return this->honeyEaten;
    }

protected:
    void run() override {
        for (int i = 0; i < 800000; i++) {
            this->honeyEaten += this->pot->empty();
        }
    }

private:
    HoneyPot *pot;
    int honeyEaten;
};

void test1() {
    MyThread1 *threads[5];
    for (int i = 0; i < 5; i++) {
        threads[i] = new MyThread1('a' + i);
        threads[i]->start();
    }
    for (auto &thread: threads) {
        thread->join();
        delete thread;
    }
}

void test2() {
    MyThread2 *threads[4];
    for (int i = 0; i < 4; i++) {
        threads[i] = new MyThread2(i + 1);
        threads[i]->start();
    }
    for (auto &thread: threads) {
        thread->join();
        delete thread;
    }
}

void test3() {
    int constexpr BEES = 200;
    auto *pot = new HoneyPot();
    Bee *bees[BEES];
    Bear *bear;
    for (auto &bee: bees) {
        bee = new Bee(pot);
        bee->start();
    }
    bear = new Bear(pot);
    bear->start();
    for (auto &bee: bees) {
        bee->join();
    }
    bear->join();
    print("Bees have made: ");
    int honeyMade = 0;
    for (auto &bee: bees) {
        honeyMade += bee->getHoney();
    }
    print(honeyMade);
    putc('\n');
    print("Bear has eaten: ");
    print(bear->getHoney());
    putc('\n');
    print("In Honeypot there is: ");
    print(pot->getHoney());
    putc('\n');
    print("Pot + Bear: ");
    print(bear->getHoney() + pot->getHoney());
    delete pot;
    delete bear;
    for (auto &bee: bees) {
        delete bee;
    }
}

void test4() {
    for (int i = 0; i < 20; i++)
        putc(getc());
}

void test5() {
    Thread *threads[CAP];
    Semaphore *sem = new Semaphore(1);
    sem->wait();
    for (auto &thread: threads) {
        thread = new Thread(MyRun4, nullptr);
        thread->start();
    }
    sem->signal();
    for (auto &thread: threads) {
        thread->join();
        delete thread;
    }
}


class MyThread6a : public Thread {
public:
    MyThread6a() : Thread() {}

protected:
    void run() override {
        for (int i = 0; i < 200000; i++) {
            for (int j = 0; j < 10000; j++);
            if (i % 1000 == 0)
                putc('a');
        }
    }
};

class MyThread6b : public Thread {
public:
    MyThread6b(Thread *joined, time_t time) : Thread(), joined(joined), time(time) {}

protected:
    void run() override {
        bool join = true;
        for (int i = 0; i < 150000; i++) {
            for (int j = 0; j < 10000; j++);
            if (i % 1000 == 0)
                putc('b');
            if (join) {
                this->joined->join(this->time);
                join = false;
            }
        }
    }

private:
    Thread *joined;
    time_t time;
};

void test6(time_t time) {
    Thread *t1 = new MyThread6a();
    Thread *t2 = new MyThread6b(t1, time);
    t1->start();
    t2->start();
    t1->join();
    t2->join();
    delete t1;
    delete t2;
}

class KilledThread : public Thread {
public:
    KilledThread() : Thread() {}

protected:
    void run() override {
        while (true) {
            cout << "a";
            for (int i = 0; i < 10000000; ++i);
        }
    }
};

class KillerThread : public Thread {
public:
    KillerThread(Thread *victim) : Thread(), victim(victim) {}

protected:
    void run() override {
        for (int i = 3; i > 0; i--) {
            cout << i << endl;
            Thread::sleep(10);
        }
        Thread::kill(victim);
        cout << endl << "Goodbye" << endl;
    }

private:
    Thread *victim;
};

void test7() {
    KilledThread *ded = new KilledThread();
    KillerThread *killer = new KillerThread(ded);
    ded->start();
    killer->start();
    ded->join();
    killer->join();
    delete ded;
    delete killer;
}

int constexpr TESTS = 8;

Semaphore *s1, *s2;

class ThreadBlocked : public Thread {
public:
    void run() override {
        cout << "Hello from blocked thread\n";
        getc();
        cout << "Unblocked\n";
    }
};

class ThreadRunning: public Thread {
    void run() override {
        cout << "Hello from nonBlocked Thread. I will calculate now\n";
        for(int i = 0; i < 100000; i++) {
            for(int j = 0; j < 10000; j++) {
            }
        }
        cout << "1";
    }
};

int userMain() {
    s1 = new Semaphore();
    Thread *t1 = new ThreadBlocked;
    Thread *t2 = new ThreadRunning;
    t1->start();
    t2->start();
    t1->join();
    t2->join();
    dramatic_print("Hello There!! Welcome to my Operating System.\n");
    time_sleep(5);
    dramatic_print("Now I am going to create 5 threads. Each will print 20 of its letter and busy wait in between letters. Threads will be swapped out asynchronously:\n\n");
    time_sleep(10);
    test1();
    time_sleep(10);
    dramatic_print("\n\nNow I will show you the timer. Each thread will write out a number of seconds it sleeps:\n\n");
    time_sleep(10);
    test2();
    time_sleep(10);
    dramatic_print("\n\nNow we can see the classic Bees and Bear test:\n\n");
    test3();
    time_sleep(10);
    dramatic_print("\n\nNow you may see the echo of what you type in (20 characters):\n");
    test4();
    putc('\n');
    time_sleep(30);
    test5();
    dramatic_print("\n\nNow you may see the timed join:\n");
    dramatic_print("1. When it is set to wait for 2 seconds:\n");
    time_sleep(10);
    test6(20);
    time_sleep(10);
    dramatic_print("\n\n2. When it is set to wait for 200 seconds:\n");
    time_sleep(10);
    test6(2000);
    dramatic_print("\nNow one thread will kill the other in three seconds:\n");
    time_sleep(10);
    test7();
    return 0;
}