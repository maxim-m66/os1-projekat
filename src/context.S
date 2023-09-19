.global _ZN5Riscv4pushEv
.type _ZN5Riscv4pushEv @function
_ZN5Riscv4pushEv:
    addi sp, sp, -256
    .irp index, 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    ret


.global _ZN5Riscv3popEv
.type _ZN5Riscv3popEv @function
_ZN5Riscv3popEv:
    .irp index, 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
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