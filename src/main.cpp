#include "../h/c_console.hpp"
#include "../h/c_thread.hpp"
#include "../h/cpp_semaphores.hpp"
#include "../h/scheduler.hpp"
#include "../h/iostream.hpp"

[[noreturn]]
void bleya_nit(void *) {
    while (true) {
    }
}

thread_t handle_bleya = nullptr;
OwnedMutex *printer;

int userMain();

inline void init() {
    __asm__ volatile("mv t0, %0": : "r" (&supervisorTrap));
    __asm__ volatile("addi t0, t0, 1");
    __asm__ volatile("csrw stvec, t0");
    Allocator::mem_init();
    IO::init();
    Scheduler::init();
    printer = new OwnedMutex();
    thread_t handle_main;
    thread_create(&handle_main, nullptr, nullptr);
    thread_create(&handle_bleya, &bleya_nit, nullptr);
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
}

void userWrapper(void *ret) {
    *((int *) ret) = userMain();
}

int call() {
    thread_t userHandle;
    int ret;
    thread_create(&userHandle, userWrapper, &ret);
    thread_join(userHandle);
    return ret;
}

int end(int ret) {
    print("\n\nProcess finished with exit code ");
    print(ret);
    print("\n\n");
    while (!IO::Output.is_empty());
    time_sleep(10);
    return 0;
}

int main() {
    init();
    int ret = call();
    return end(ret);
}