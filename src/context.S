.global _ZN5riscv7setjumpEv
.type _ZN5riscv7setjumpEv @function
_ZN5riscv7setjumpEv:
    li a0, 0
    addi sp, sp, -256
    .irp index, 1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    li a0, 1
    ret


.global _ZN5riscv8longjumpEv
.type _ZN5riscv8longjumpEv @function
_ZN5riscv8longjumpEv:
    .irp index, 1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    ret

.global _ZN3TCB14context_switchEP7ContextS1_
.type _ZN3TCB14context_switchEP7ContextS1_ @function
_ZN3TCB14context_switchEP7ContextS1_:
    sd ra, 0(a0)
    sd sp, 8(a0)

    ld ra, 0(a1)
    ld sp, 8(a1)
    ret

.global _ZN3TCB15context_inheritEP7Context
.type _ZN3TCB15context_inheritEP7Context @function
_ZN3TCB15context_inheritEP7Context:
    sd ra, 0(a0)
    sd sp, 8(a0)
    ret