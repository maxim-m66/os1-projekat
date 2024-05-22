.align 4
.global supervisorTrap
.type supervisorTrap @function
supervisorTrap:
    j ecallHandler
    j timerHandler
    sret
    sret
    sret
    j readHandler
    sret
    j writeHandler
    sret
    j consoleHandler

ecallHandler:
    addi sp, sp, -256
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    //addi sp, sp, -16
    //csrr t0, sstatus
    //csrr t1, sepc
    //addi t1, t1, 4
    //sd t0, (sp)
    //sd t1, 8(sp)


    call _ZN5Riscv20handleSupervisorTrapEv

    //ld t0, (sp)
    //ld t1, 8(sp)
    //csrw sstatus, t0
    //csrw sepc, t1
    //addi sp, sp, 16
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    sret

timerHandler:
    addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    call _ZN5Riscv15handleTimerTrapEv

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    sret

readHandler:
    call _ZN5Riscv14handleReadTrapEv
    sret

writeHandler:
    call _ZN5Riscv15handleWriteTrapEv
    sret

consoleHandler:
    addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    call _ZN5Riscv17handleConsoleTrapEv

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    sret