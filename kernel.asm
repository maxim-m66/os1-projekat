
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	45013103          	ld	sp,1104(sp) # 8000a450 <_GLOBAL_OFFSET_TABLE_+0x50>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	494050ef          	jal	ra,800054b0 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <supervisorTrap>:
.align 4
.global supervisorTrap
.type supervisorTrap @function
supervisorTrap:
    j ecallHandler
    80001000:	0280006f          	j	80001028 <ecallHandler>
    j timerHandler
    80001004:	1240006f          	j	80001128 <timerHandler>
    sret
    80001008:	10200073          	sret
    sret
    8000100c:	10200073          	sret
    sret
    80001010:	10200073          	sret
    j readHandler
    80001014:	2240006f          	j	80001238 <readHandler>
    sret
    80001018:	10200073          	sret
    j writeHandler
    8000101c:	2240006f          	j	80001240 <writeHandler>
    sret
    80001020:	10200073          	sret
    j consoleHandler
    80001024:	2240006f          	j	80001248 <consoleHandler>

0000000080001028 <ecallHandler>:

ecallHandler:
    addi sp, sp, -256
    80001028:	f0010113          	addi	sp,sp,-256
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000102c:	00113423          	sd	ra,8(sp)
    80001030:	00213823          	sd	sp,16(sp)
    80001034:	00313c23          	sd	gp,24(sp)
    80001038:	02413023          	sd	tp,32(sp)
    8000103c:	02513423          	sd	t0,40(sp)
    80001040:	02613823          	sd	t1,48(sp)
    80001044:	02713c23          	sd	t2,56(sp)
    80001048:	04813023          	sd	s0,64(sp)
    8000104c:	04913423          	sd	s1,72(sp)
    80001050:	04b13c23          	sd	a1,88(sp)
    80001054:	06c13023          	sd	a2,96(sp)
    80001058:	06d13423          	sd	a3,104(sp)
    8000105c:	06e13823          	sd	a4,112(sp)
    80001060:	06f13c23          	sd	a5,120(sp)
    80001064:	09013023          	sd	a6,128(sp)
    80001068:	09113423          	sd	a7,136(sp)
    8000106c:	09213823          	sd	s2,144(sp)
    80001070:	09313c23          	sd	s3,152(sp)
    80001074:	0b413023          	sd	s4,160(sp)
    80001078:	0b513423          	sd	s5,168(sp)
    8000107c:	0b613823          	sd	s6,176(sp)
    80001080:	0b713c23          	sd	s7,184(sp)
    80001084:	0d813023          	sd	s8,192(sp)
    80001088:	0d913423          	sd	s9,200(sp)
    8000108c:	0da13823          	sd	s10,208(sp)
    80001090:	0db13c23          	sd	s11,216(sp)
    80001094:	0fc13023          	sd	t3,224(sp)
    80001098:	0fd13423          	sd	t4,232(sp)
    8000109c:	0fe13823          	sd	t5,240(sp)
    800010a0:	0ff13c23          	sd	t6,248(sp)
    //addi t1, t1, 4
    //sd t0, (sp)
    //sd t1, 8(sp)


    call _ZN5Riscv20handleSupervisorTrapEv
    800010a4:	1d4030ef          	jal	ra,80004278 <_ZN5Riscv20handleSupervisorTrapEv>
    //csrw sstatus, t0
    //csrw sepc, t1
    //addi sp, sp, 16
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010a8:	00813083          	ld	ra,8(sp)
    800010ac:	01013103          	ld	sp,16(sp)
    800010b0:	01813183          	ld	gp,24(sp)
    800010b4:	02013203          	ld	tp,32(sp)
    800010b8:	02813283          	ld	t0,40(sp)
    800010bc:	03013303          	ld	t1,48(sp)
    800010c0:	03813383          	ld	t2,56(sp)
    800010c4:	04013403          	ld	s0,64(sp)
    800010c8:	04813483          	ld	s1,72(sp)
    800010cc:	05813583          	ld	a1,88(sp)
    800010d0:	06013603          	ld	a2,96(sp)
    800010d4:	06813683          	ld	a3,104(sp)
    800010d8:	07013703          	ld	a4,112(sp)
    800010dc:	07813783          	ld	a5,120(sp)
    800010e0:	08013803          	ld	a6,128(sp)
    800010e4:	08813883          	ld	a7,136(sp)
    800010e8:	09013903          	ld	s2,144(sp)
    800010ec:	09813983          	ld	s3,152(sp)
    800010f0:	0a013a03          	ld	s4,160(sp)
    800010f4:	0a813a83          	ld	s5,168(sp)
    800010f8:	0b013b03          	ld	s6,176(sp)
    800010fc:	0b813b83          	ld	s7,184(sp)
    80001100:	0c013c03          	ld	s8,192(sp)
    80001104:	0c813c83          	ld	s9,200(sp)
    80001108:	0d013d03          	ld	s10,208(sp)
    8000110c:	0d813d83          	ld	s11,216(sp)
    80001110:	0e013e03          	ld	t3,224(sp)
    80001114:	0e813e83          	ld	t4,232(sp)
    80001118:	0f013f03          	ld	t5,240(sp)
    8000111c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001120:	10010113          	addi	sp,sp,256
    sret
    80001124:	10200073          	sret

0000000080001128 <timerHandler>:

timerHandler:
    addi sp, sp, -256
    80001128:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000112c:	00013023          	sd	zero,0(sp)
    80001130:	00113423          	sd	ra,8(sp)
    80001134:	00213823          	sd	sp,16(sp)
    80001138:	00313c23          	sd	gp,24(sp)
    8000113c:	02413023          	sd	tp,32(sp)
    80001140:	02513423          	sd	t0,40(sp)
    80001144:	02613823          	sd	t1,48(sp)
    80001148:	02713c23          	sd	t2,56(sp)
    8000114c:	04813023          	sd	s0,64(sp)
    80001150:	04913423          	sd	s1,72(sp)
    80001154:	04a13823          	sd	a0,80(sp)
    80001158:	04b13c23          	sd	a1,88(sp)
    8000115c:	06c13023          	sd	a2,96(sp)
    80001160:	06d13423          	sd	a3,104(sp)
    80001164:	06e13823          	sd	a4,112(sp)
    80001168:	06f13c23          	sd	a5,120(sp)
    8000116c:	09013023          	sd	a6,128(sp)
    80001170:	09113423          	sd	a7,136(sp)
    80001174:	09213823          	sd	s2,144(sp)
    80001178:	09313c23          	sd	s3,152(sp)
    8000117c:	0b413023          	sd	s4,160(sp)
    80001180:	0b513423          	sd	s5,168(sp)
    80001184:	0b613823          	sd	s6,176(sp)
    80001188:	0b713c23          	sd	s7,184(sp)
    8000118c:	0d813023          	sd	s8,192(sp)
    80001190:	0d913423          	sd	s9,200(sp)
    80001194:	0da13823          	sd	s10,208(sp)
    80001198:	0db13c23          	sd	s11,216(sp)
    8000119c:	0fc13023          	sd	t3,224(sp)
    800011a0:	0fd13423          	sd	t4,232(sp)
    800011a4:	0fe13823          	sd	t5,240(sp)
    800011a8:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv15handleTimerTrapEv
    800011ac:	2dc030ef          	jal	ra,80004488 <_ZN5Riscv15handleTimerTrapEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011b0:	00013003          	ld	zero,0(sp)
    800011b4:	00813083          	ld	ra,8(sp)
    800011b8:	01013103          	ld	sp,16(sp)
    800011bc:	01813183          	ld	gp,24(sp)
    800011c0:	02013203          	ld	tp,32(sp)
    800011c4:	02813283          	ld	t0,40(sp)
    800011c8:	03013303          	ld	t1,48(sp)
    800011cc:	03813383          	ld	t2,56(sp)
    800011d0:	04013403          	ld	s0,64(sp)
    800011d4:	04813483          	ld	s1,72(sp)
    800011d8:	05013503          	ld	a0,80(sp)
    800011dc:	05813583          	ld	a1,88(sp)
    800011e0:	06013603          	ld	a2,96(sp)
    800011e4:	06813683          	ld	a3,104(sp)
    800011e8:	07013703          	ld	a4,112(sp)
    800011ec:	07813783          	ld	a5,120(sp)
    800011f0:	08013803          	ld	a6,128(sp)
    800011f4:	08813883          	ld	a7,136(sp)
    800011f8:	09013903          	ld	s2,144(sp)
    800011fc:	09813983          	ld	s3,152(sp)
    80001200:	0a013a03          	ld	s4,160(sp)
    80001204:	0a813a83          	ld	s5,168(sp)
    80001208:	0b013b03          	ld	s6,176(sp)
    8000120c:	0b813b83          	ld	s7,184(sp)
    80001210:	0c013c03          	ld	s8,192(sp)
    80001214:	0c813c83          	ld	s9,200(sp)
    80001218:	0d013d03          	ld	s10,208(sp)
    8000121c:	0d813d83          	ld	s11,216(sp)
    80001220:	0e013e03          	ld	t3,224(sp)
    80001224:	0e813e83          	ld	t4,232(sp)
    80001228:	0f013f03          	ld	t5,240(sp)
    8000122c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001230:	10010113          	addi	sp,sp,256
    sret
    80001234:	10200073          	sret

0000000080001238 <readHandler>:

readHandler:
    call _ZN5Riscv14handleReadTrapEv
    80001238:	43c030ef          	jal	ra,80004674 <_ZN5Riscv14handleReadTrapEv>
    sret
    8000123c:	10200073          	sret

0000000080001240 <writeHandler>:

writeHandler:
    call _ZN5Riscv15handleWriteTrapEv
    80001240:	468030ef          	jal	ra,800046a8 <_ZN5Riscv15handleWriteTrapEv>
    sret
    80001244:	10200073          	sret

0000000080001248 <consoleHandler>:

consoleHandler:
    addi sp, sp, -256
    80001248:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000124c:	00013023          	sd	zero,0(sp)
    80001250:	00113423          	sd	ra,8(sp)
    80001254:	00213823          	sd	sp,16(sp)
    80001258:	00313c23          	sd	gp,24(sp)
    8000125c:	02413023          	sd	tp,32(sp)
    80001260:	02513423          	sd	t0,40(sp)
    80001264:	02613823          	sd	t1,48(sp)
    80001268:	02713c23          	sd	t2,56(sp)
    8000126c:	04813023          	sd	s0,64(sp)
    80001270:	04913423          	sd	s1,72(sp)
    80001274:	04a13823          	sd	a0,80(sp)
    80001278:	04b13c23          	sd	a1,88(sp)
    8000127c:	06c13023          	sd	a2,96(sp)
    80001280:	06d13423          	sd	a3,104(sp)
    80001284:	06e13823          	sd	a4,112(sp)
    80001288:	06f13c23          	sd	a5,120(sp)
    8000128c:	09013023          	sd	a6,128(sp)
    80001290:	09113423          	sd	a7,136(sp)
    80001294:	09213823          	sd	s2,144(sp)
    80001298:	09313c23          	sd	s3,152(sp)
    8000129c:	0b413023          	sd	s4,160(sp)
    800012a0:	0b513423          	sd	s5,168(sp)
    800012a4:	0b613823          	sd	s6,176(sp)
    800012a8:	0b713c23          	sd	s7,184(sp)
    800012ac:	0d813023          	sd	s8,192(sp)
    800012b0:	0d913423          	sd	s9,200(sp)
    800012b4:	0da13823          	sd	s10,208(sp)
    800012b8:	0db13c23          	sd	s11,216(sp)
    800012bc:	0fc13023          	sd	t3,224(sp)
    800012c0:	0fd13423          	sd	t4,232(sp)
    800012c4:	0fe13823          	sd	t5,240(sp)
    800012c8:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv17handleConsoleTrapEv
    800012cc:	2f8030ef          	jal	ra,800045c4 <_ZN5Riscv17handleConsoleTrapEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800012d0:	00013003          	ld	zero,0(sp)
    800012d4:	00813083          	ld	ra,8(sp)
    800012d8:	01013103          	ld	sp,16(sp)
    800012dc:	01813183          	ld	gp,24(sp)
    800012e0:	02013203          	ld	tp,32(sp)
    800012e4:	02813283          	ld	t0,40(sp)
    800012e8:	03013303          	ld	t1,48(sp)
    800012ec:	03813383          	ld	t2,56(sp)
    800012f0:	04013403          	ld	s0,64(sp)
    800012f4:	04813483          	ld	s1,72(sp)
    800012f8:	05013503          	ld	a0,80(sp)
    800012fc:	05813583          	ld	a1,88(sp)
    80001300:	06013603          	ld	a2,96(sp)
    80001304:	06813683          	ld	a3,104(sp)
    80001308:	07013703          	ld	a4,112(sp)
    8000130c:	07813783          	ld	a5,120(sp)
    80001310:	08013803          	ld	a6,128(sp)
    80001314:	08813883          	ld	a7,136(sp)
    80001318:	09013903          	ld	s2,144(sp)
    8000131c:	09813983          	ld	s3,152(sp)
    80001320:	0a013a03          	ld	s4,160(sp)
    80001324:	0a813a83          	ld	s5,168(sp)
    80001328:	0b013b03          	ld	s6,176(sp)
    8000132c:	0b813b83          	ld	s7,184(sp)
    80001330:	0c013c03          	ld	s8,192(sp)
    80001334:	0c813c83          	ld	s9,200(sp)
    80001338:	0d013d03          	ld	s10,208(sp)
    8000133c:	0d813d83          	ld	s11,216(sp)
    80001340:	0e013e03          	ld	t3,224(sp)
    80001344:	0e813e83          	ld	t4,232(sp)
    80001348:	0f013f03          	ld	t5,240(sp)
    8000134c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001350:	10010113          	addi	sp,sp,256
    80001354:	10200073          	sret
	...

0000000080001360 <_ZN5Riscv4pushEv>:
.global _ZN5Riscv4pushEv
.type _ZN5Riscv4pushEv @function
_ZN5Riscv4pushEv:
    addi sp, sp, -256
    80001360:	f0010113          	addi	sp,sp,-256
    .irp index, 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001364:	00213823          	sd	sp,16(sp)
    80001368:	00313c23          	sd	gp,24(sp)
    8000136c:	02413023          	sd	tp,32(sp)
    80001370:	02513423          	sd	t0,40(sp)
    80001374:	02613823          	sd	t1,48(sp)
    80001378:	02713c23          	sd	t2,56(sp)
    8000137c:	04813023          	sd	s0,64(sp)
    80001380:	04913423          	sd	s1,72(sp)
    80001384:	04a13823          	sd	a0,80(sp)
    80001388:	04b13c23          	sd	a1,88(sp)
    8000138c:	06c13023          	sd	a2,96(sp)
    80001390:	06d13423          	sd	a3,104(sp)
    80001394:	06e13823          	sd	a4,112(sp)
    80001398:	06f13c23          	sd	a5,120(sp)
    8000139c:	09013023          	sd	a6,128(sp)
    800013a0:	09113423          	sd	a7,136(sp)
    800013a4:	09213823          	sd	s2,144(sp)
    800013a8:	09313c23          	sd	s3,152(sp)
    800013ac:	0b413023          	sd	s4,160(sp)
    800013b0:	0b513423          	sd	s5,168(sp)
    800013b4:	0b613823          	sd	s6,176(sp)
    800013b8:	0b713c23          	sd	s7,184(sp)
    800013bc:	0d813023          	sd	s8,192(sp)
    800013c0:	0d913423          	sd	s9,200(sp)
    800013c4:	0da13823          	sd	s10,208(sp)
    800013c8:	0db13c23          	sd	s11,216(sp)
    800013cc:	0fc13023          	sd	t3,224(sp)
    800013d0:	0fd13423          	sd	t4,232(sp)
    800013d4:	0fe13823          	sd	t5,240(sp)
    800013d8:	0ff13c23          	sd	t6,248(sp)
    ret
    800013dc:	00008067          	ret

00000000800013e0 <_ZN5Riscv3popEv>:
.global _ZN5Riscv3popEv
.type _ZN5Riscv3popEv @function
_ZN5Riscv3popEv:
    .irp index, 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800013e0:	01013103          	ld	sp,16(sp)
    800013e4:	01813183          	ld	gp,24(sp)
    800013e8:	02013203          	ld	tp,32(sp)
    800013ec:	02813283          	ld	t0,40(sp)
    800013f0:	03013303          	ld	t1,48(sp)
    800013f4:	03813383          	ld	t2,56(sp)
    800013f8:	04013403          	ld	s0,64(sp)
    800013fc:	04813483          	ld	s1,72(sp)
    80001400:	05013503          	ld	a0,80(sp)
    80001404:	05813583          	ld	a1,88(sp)
    80001408:	06013603          	ld	a2,96(sp)
    8000140c:	06813683          	ld	a3,104(sp)
    80001410:	07013703          	ld	a4,112(sp)
    80001414:	07813783          	ld	a5,120(sp)
    80001418:	08013803          	ld	a6,128(sp)
    8000141c:	08813883          	ld	a7,136(sp)
    80001420:	09013903          	ld	s2,144(sp)
    80001424:	09813983          	ld	s3,152(sp)
    80001428:	0a013a03          	ld	s4,160(sp)
    8000142c:	0a813a83          	ld	s5,168(sp)
    80001430:	0b013b03          	ld	s6,176(sp)
    80001434:	0b813b83          	ld	s7,184(sp)
    80001438:	0c013c03          	ld	s8,192(sp)
    8000143c:	0c813c83          	ld	s9,200(sp)
    80001440:	0d013d03          	ld	s10,208(sp)
    80001444:	0d813d83          	ld	s11,216(sp)
    80001448:	0e013e03          	ld	t3,224(sp)
    8000144c:	0e813e83          	ld	t4,232(sp)
    80001450:	0f013f03          	ld	t5,240(sp)
    80001454:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001458:	10010113          	addi	sp,sp,256
    ret
    8000145c:	00008067          	ret

0000000080001460 <_ZN3TCB14context_switchEP7ContextS1_>:

.global _ZN3TCB14context_switchEP7ContextS1_
.type _ZN3TCB14context_switchEP7ContextS1_ @function
_ZN3TCB14context_switchEP7ContextS1_:
    sd ra, 0(a0)
    80001460:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 8(a0)
    80001464:	00253423          	sd	sp,8(a0)

    ld ra, 0(a1)
    80001468:	0005b083          	ld	ra,0(a1)
    ld sp, 8(a1)
    8000146c:	0085b103          	ld	sp,8(a1)
    80001470:	00008067          	ret

0000000080001474 <_Z7syscallmmmmm>:
#include "../h/syscall_c.hpp"
#include "../h/c_console.hpp"


void syscall(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    80001474:	ff010113          	addi	sp,sp,-16
    80001478:	00813423          	sd	s0,8(sp)
    8000147c:	01010413          	addi	s0,sp,16
    __asm__ volatile("ecall");
    80001480:	00000073          	ecall
}
    80001484:	00813403          	ld	s0,8(sp)
    80001488:	01010113          	addi	sp,sp,16
    8000148c:	00008067          	ret

0000000080001490 <_Z9mem_allocm>:

void *mem_alloc(size_t size) {
    if (size == 0) return nullptr;
    80001490:	04050263          	beqz	a0,800014d4 <_Z9mem_allocm+0x44>
void *mem_alloc(size_t size) {
    80001494:	ff010113          	addi	sp,sp,-16
    80001498:	00113423          	sd	ra,8(sp)
    8000149c:	00813023          	sd	s0,0(sp)
    800014a0:	01010413          	addi	s0,sp,16
    800014a4:	00050593          	mv	a1,a0
    void volatile *ret;
    syscall(MEM_ALLOC, size);
    800014a8:	00000713          	li	a4,0
    800014ac:	00000693          	li	a3,0
    800014b0:	00000613          	li	a2,0
    800014b4:	00100513          	li	a0,1
    800014b8:	00000097          	auipc	ra,0x0
    800014bc:	fbc080e7          	jalr	-68(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    800014c0:	00050513          	mv	a0,a0
    return (void *) ret;
}
    800014c4:	00813083          	ld	ra,8(sp)
    800014c8:	00013403          	ld	s0,0(sp)
    800014cc:	01010113          	addi	sp,sp,16
    800014d0:	00008067          	ret
    if (size == 0) return nullptr;
    800014d4:	00000513          	li	a0,0
}
    800014d8:	00008067          	ret

00000000800014dc <_Z8mem_freePv>:

int mem_free(void *mem) {
    800014dc:	fe010113          	addi	sp,sp,-32
    800014e0:	00113c23          	sd	ra,24(sp)
    800014e4:	00813823          	sd	s0,16(sp)
    800014e8:	02010413          	addi	s0,sp,32
    800014ec:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(MEM_FREE, (uint64) mem);
    800014f0:	00000713          	li	a4,0
    800014f4:	00000693          	li	a3,0
    800014f8:	00000613          	li	a2,0
    800014fc:	00200513          	li	a0,2
    80001500:	00000097          	auipc	ra,0x0
    80001504:	f74080e7          	jalr	-140(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001508:	00050793          	mv	a5,a0
    8000150c:	fef42623          	sw	a5,-20(s0)
    return ret;
    80001510:	fec42503          	lw	a0,-20(s0)
}
    80001514:	0005051b          	sext.w	a0,a0
    80001518:	01813083          	ld	ra,24(sp)
    8000151c:	01013403          	ld	s0,16(sp)
    80001520:	02010113          	addi	sp,sp,32
    80001524:	00008067          	ret

0000000080001528 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    80001528:	fc010113          	addi	sp,sp,-64
    8000152c:	02113c23          	sd	ra,56(sp)
    80001530:	02813823          	sd	s0,48(sp)
    80001534:	02913423          	sd	s1,40(sp)
    80001538:	03213023          	sd	s2,32(sp)
    8000153c:	01313c23          	sd	s3,24(sp)
    80001540:	04010413          	addi	s0,sp,64
    80001544:	00050913          	mv	s2,a0
    80001548:	00058493          	mv	s1,a1
    8000154c:	00060993          	mv	s3,a2
    void *stack_space = nullptr;
    if (start_routine) {
    80001550:	04058c63          	beqz	a1,800015a8 <_Z13thread_createPP3TCBPFvPvES2_+0x80>
        stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80001554:	00004537          	lui	a0,0x4
    80001558:	00000097          	auipc	ra,0x0
    8000155c:	f38080e7          	jalr	-200(ra) # 80001490 <_Z9mem_allocm>
    80001560:	00050713          	mv	a4,a0
    }
    int volatile ret;
    syscall(THREAD_CREATE, (uint64) handle, (uint64) start_routine, (uint64) arg, (uint64) stack_space);
    80001564:	00098693          	mv	a3,s3
    80001568:	00048613          	mv	a2,s1
    8000156c:	00090593          	mv	a1,s2
    80001570:	01100513          	li	a0,17
    80001574:	00000097          	auipc	ra,0x0
    80001578:	f00080e7          	jalr	-256(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    8000157c:	00050793          	mv	a5,a0
    80001580:	fcf42623          	sw	a5,-52(s0)
    return ret;
    80001584:	fcc42503          	lw	a0,-52(s0)
}
    80001588:	0005051b          	sext.w	a0,a0
    8000158c:	03813083          	ld	ra,56(sp)
    80001590:	03013403          	ld	s0,48(sp)
    80001594:	02813483          	ld	s1,40(sp)
    80001598:	02013903          	ld	s2,32(sp)
    8000159c:	01813983          	ld	s3,24(sp)
    800015a0:	04010113          	addi	sp,sp,64
    800015a4:	00008067          	ret
    void *stack_space = nullptr;
    800015a8:	00000713          	li	a4,0
    800015ac:	fb9ff06f          	j	80001564 <_Z13thread_createPP3TCBPFvPvES2_+0x3c>

00000000800015b0 <_Z11thread_exitv>:

int thread_exit() {
    800015b0:	fe010113          	addi	sp,sp,-32
    800015b4:	00113c23          	sd	ra,24(sp)
    800015b8:	00813823          	sd	s0,16(sp)
    800015bc:	02010413          	addi	s0,sp,32
    int volatile ret;
    syscall(THREAD_EXIT);
    800015c0:	00000713          	li	a4,0
    800015c4:	00000693          	li	a3,0
    800015c8:	00000613          	li	a2,0
    800015cc:	00000593          	li	a1,0
    800015d0:	01200513          	li	a0,18
    800015d4:	00000097          	auipc	ra,0x0
    800015d8:	ea0080e7          	jalr	-352(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    800015dc:	00050793          	mv	a5,a0
    800015e0:	fef42623          	sw	a5,-20(s0)
    return ret;
    800015e4:	fec42503          	lw	a0,-20(s0)
}
    800015e8:	0005051b          	sext.w	a0,a0
    800015ec:	01813083          	ld	ra,24(sp)
    800015f0:	01013403          	ld	s0,16(sp)
    800015f4:	02010113          	addi	sp,sp,32
    800015f8:	00008067          	ret

00000000800015fc <_Z15thread_dispatchv>:

void thread_dispatch() {
    800015fc:	ff010113          	addi	sp,sp,-16
    80001600:	00113423          	sd	ra,8(sp)
    80001604:	00813023          	sd	s0,0(sp)
    80001608:	01010413          	addi	s0,sp,16
    syscall(THREAD_DISPATCH);
    8000160c:	00000713          	li	a4,0
    80001610:	00000693          	li	a3,0
    80001614:	00000613          	li	a2,0
    80001618:	00000593          	li	a1,0
    8000161c:	01300513          	li	a0,19
    80001620:	00000097          	auipc	ra,0x0
    80001624:	e54080e7          	jalr	-428(ra) # 80001474 <_Z7syscallmmmmm>
}
    80001628:	00813083          	ld	ra,8(sp)
    8000162c:	00013403          	ld	s0,0(sp)
    80001630:	01010113          	addi	sp,sp,16
    80001634:	00008067          	ret

0000000080001638 <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    80001638:	ff010113          	addi	sp,sp,-16
    8000163c:	00113423          	sd	ra,8(sp)
    80001640:	00813023          	sd	s0,0(sp)
    80001644:	01010413          	addi	s0,sp,16
    80001648:	00050593          	mv	a1,a0
    syscall(THREAD_JOIN, (uint64) handle);
    8000164c:	00000713          	li	a4,0
    80001650:	00000693          	li	a3,0
    80001654:	00000613          	li	a2,0
    80001658:	01400513          	li	a0,20
    8000165c:	00000097          	auipc	ra,0x0
    80001660:	e18080e7          	jalr	-488(ra) # 80001474 <_Z7syscallmmmmm>
}
    80001664:	00813083          	ld	ra,8(sp)
    80001668:	00013403          	ld	s0,0(sp)
    8000166c:	01010113          	addi	sp,sp,16
    80001670:	00008067          	ret

0000000080001674 <_Z11thread_joinP3TCBm>:

void thread_join(thread_t handle, time_t time) {
    80001674:	fe010113          	addi	sp,sp,-32
    80001678:	00113c23          	sd	ra,24(sp)
    8000167c:	00813823          	sd	s0,16(sp)
    80001680:	00913423          	sd	s1,8(sp)
    80001684:	01213023          	sd	s2,0(sp)
    80001688:	02010413          	addi	s0,sp,32
    8000168c:	00050913          	mv	s2,a0
    80001690:	00058493          	mv	s1,a1
    if (time == 0) thread_join(handle);
    80001694:	02058c63          	beqz	a1,800016cc <_Z11thread_joinP3TCBm+0x58>
    syscall(THREAD_JOIN_TIME, (uint64) handle, time);
    80001698:	00000713          	li	a4,0
    8000169c:	00000693          	li	a3,0
    800016a0:	00048613          	mv	a2,s1
    800016a4:	00090593          	mv	a1,s2
    800016a8:	01500513          	li	a0,21
    800016ac:	00000097          	auipc	ra,0x0
    800016b0:	dc8080e7          	jalr	-568(ra) # 80001474 <_Z7syscallmmmmm>
}
    800016b4:	01813083          	ld	ra,24(sp)
    800016b8:	01013403          	ld	s0,16(sp)
    800016bc:	00813483          	ld	s1,8(sp)
    800016c0:	00013903          	ld	s2,0(sp)
    800016c4:	02010113          	addi	sp,sp,32
    800016c8:	00008067          	ret
    if (time == 0) thread_join(handle);
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	f6c080e7          	jalr	-148(ra) # 80001638 <_Z11thread_joinP3TCB>
    800016d4:	fc5ff06f          	j	80001698 <_Z11thread_joinP3TCBm+0x24>

00000000800016d8 <_Z4forkv>:

int fork() {
    800016d8:	fe010113          	addi	sp,sp,-32
    800016dc:	00113c23          	sd	ra,24(sp)
    800016e0:	00813823          	sd	s0,16(sp)
    800016e4:	02010413          	addi	s0,sp,32
    int volatile ret;
    syscall(THREAD_FORK);
    800016e8:	00000713          	li	a4,0
    800016ec:	00000693          	li	a3,0
    800016f0:	00000613          	li	a2,0
    800016f4:	00000593          	li	a1,0
    800016f8:	01600513          	li	a0,22
    800016fc:	00000097          	auipc	ra,0x0
    80001700:	d78080e7          	jalr	-648(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001704:	00050793          	mv	a5,a0
    80001708:	fef42623          	sw	a5,-20(s0)
    return ret;
    8000170c:	fec42503          	lw	a0,-20(s0)
}
    80001710:	0005051b          	sext.w	a0,a0
    80001714:	01813083          	ld	ra,24(sp)
    80001718:	01013403          	ld	s0,16(sp)
    8000171c:	02010113          	addi	sp,sp,32
    80001720:	00008067          	ret

0000000080001724 <_Z11thread_killP3TCB>:

int thread_kill(thread_t handle) {
    80001724:	fe010113          	addi	sp,sp,-32
    80001728:	00113c23          	sd	ra,24(sp)
    8000172c:	00813823          	sd	s0,16(sp)
    80001730:	02010413          	addi	s0,sp,32
    80001734:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(THREAD_KILL, (uint64) handle);
    80001738:	00000713          	li	a4,0
    8000173c:	00000693          	li	a3,0
    80001740:	00000613          	li	a2,0
    80001744:	01700513          	li	a0,23
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	d2c080e7          	jalr	-724(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001750:	00050793          	mv	a5,a0
    80001754:	fef42623          	sw	a5,-20(s0)
    return ret;
    80001758:	fec42503          	lw	a0,-20(s0)
}
    8000175c:	0005051b          	sext.w	a0,a0
    80001760:	01813083          	ld	ra,24(sp)
    80001764:	01013403          	ld	s0,16(sp)
    80001768:	02010113          	addi	sp,sp,32
    8000176c:	00008067          	ret

0000000080001770 <_Z8sem_openPP3Semj>:

int sem_open(sem_t *handle, unsigned init) {
    80001770:	fe010113          	addi	sp,sp,-32
    80001774:	00113c23          	sd	ra,24(sp)
    80001778:	00813823          	sd	s0,16(sp)
    8000177c:	02010413          	addi	s0,sp,32
    int volatile ret;
    syscall(SEM_OPEN, (uint64) handle, init);
    80001780:	00000713          	li	a4,0
    80001784:	00000693          	li	a3,0
    80001788:	02059613          	slli	a2,a1,0x20
    8000178c:	02065613          	srli	a2,a2,0x20
    80001790:	00050593          	mv	a1,a0
    80001794:	02100513          	li	a0,33
    80001798:	00000097          	auipc	ra,0x0
    8000179c:	cdc080e7          	jalr	-804(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    800017a0:	00050793          	mv	a5,a0
    800017a4:	fef42623          	sw	a5,-20(s0)
    return ret;
    800017a8:	fec42503          	lw	a0,-20(s0)
}
    800017ac:	0005051b          	sext.w	a0,a0
    800017b0:	01813083          	ld	ra,24(sp)
    800017b4:	01013403          	ld	s0,16(sp)
    800017b8:	02010113          	addi	sp,sp,32
    800017bc:	00008067          	ret

00000000800017c0 <_Z9sem_closeP3Sem>:

int sem_close(sem_t id) {
    800017c0:	fe010113          	addi	sp,sp,-32
    800017c4:	00113c23          	sd	ra,24(sp)
    800017c8:	00813823          	sd	s0,16(sp)
    800017cc:	02010413          	addi	s0,sp,32
    800017d0:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(SEM_CLOSE, (uint64) id);
    800017d4:	00000713          	li	a4,0
    800017d8:	00000693          	li	a3,0
    800017dc:	00000613          	li	a2,0
    800017e0:	02200513          	li	a0,34
    800017e4:	00000097          	auipc	ra,0x0
    800017e8:	c90080e7          	jalr	-880(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    800017ec:	00050793          	mv	a5,a0
    800017f0:	fef42623          	sw	a5,-20(s0)
    return ret;
    800017f4:	fec42503          	lw	a0,-20(s0)
}
    800017f8:	0005051b          	sext.w	a0,a0
    800017fc:	01813083          	ld	ra,24(sp)
    80001800:	01013403          	ld	s0,16(sp)
    80001804:	02010113          	addi	sp,sp,32
    80001808:	00008067          	ret

000000008000180c <_Z8sem_waitP3Sem>:

int sem_wait(sem_t id) {
    8000180c:	fe010113          	addi	sp,sp,-32
    80001810:	00113c23          	sd	ra,24(sp)
    80001814:	00813823          	sd	s0,16(sp)
    80001818:	02010413          	addi	s0,sp,32
    8000181c:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(SEM_WAIT, (uint64) id);
    80001820:	00000713          	li	a4,0
    80001824:	00000693          	li	a3,0
    80001828:	00000613          	li	a2,0
    8000182c:	02300513          	li	a0,35
    80001830:	00000097          	auipc	ra,0x0
    80001834:	c44080e7          	jalr	-956(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001838:	00050793          	mv	a5,a0
    8000183c:	fef42623          	sw	a5,-20(s0)
    return ret;
    80001840:	fec42503          	lw	a0,-20(s0)
}
    80001844:	0005051b          	sext.w	a0,a0
    80001848:	01813083          	ld	ra,24(sp)
    8000184c:	01013403          	ld	s0,16(sp)
    80001850:	02010113          	addi	sp,sp,32
    80001854:	00008067          	ret

0000000080001858 <_Z10sem_signalP3Sem>:

int sem_signal(sem_t id) {
    80001858:	fe010113          	addi	sp,sp,-32
    8000185c:	00113c23          	sd	ra,24(sp)
    80001860:	00813823          	sd	s0,16(sp)
    80001864:	02010413          	addi	s0,sp,32
    80001868:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(SEM_SIGNAL, (uint64) id);
    8000186c:	00000713          	li	a4,0
    80001870:	00000693          	li	a3,0
    80001874:	00000613          	li	a2,0
    80001878:	02400513          	li	a0,36
    8000187c:	00000097          	auipc	ra,0x0
    80001880:	bf8080e7          	jalr	-1032(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001884:	00050793          	mv	a5,a0
    80001888:	fef42623          	sw	a5,-20(s0)
    return ret;
    8000188c:	fec42503          	lw	a0,-20(s0)
}
    80001890:	0005051b          	sext.w	a0,a0
    80001894:	01813083          	ld	ra,24(sp)
    80001898:	01013403          	ld	s0,16(sp)
    8000189c:	02010113          	addi	sp,sp,32
    800018a0:	00008067          	ret

00000000800018a4 <_Z15signal_and_waitP3SemS0_>:

int signal_and_wait(sem_t signal, sem_t wait) {
    800018a4:	fe010113          	addi	sp,sp,-32
    800018a8:	00113c23          	sd	ra,24(sp)
    800018ac:	00813823          	sd	s0,16(sp)
    800018b0:	02010413          	addi	s0,sp,32
    800018b4:	00058613          	mv	a2,a1
    int volatile ret;
    syscall(SIGNAL_WAIT, (uint64) signal, (uint64) wait);
    800018b8:	00000713          	li	a4,0
    800018bc:	00000693          	li	a3,0
    800018c0:	00050593          	mv	a1,a0
    800018c4:	02500513          	li	a0,37
    800018c8:	00000097          	auipc	ra,0x0
    800018cc:	bac080e7          	jalr	-1108(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    800018d0:	00050793          	mv	a5,a0
    800018d4:	fef42623          	sw	a5,-20(s0)
    return ret;
    800018d8:	fec42503          	lw	a0,-20(s0)
}
    800018dc:	0005051b          	sext.w	a0,a0
    800018e0:	01813083          	ld	ra,24(sp)
    800018e4:	01013403          	ld	s0,16(sp)
    800018e8:	02010113          	addi	sp,sp,32
    800018ec:	00008067          	ret

00000000800018f0 <_Z10time_sleepm>:

int time_sleep(time_t ms) {
    if (ms == 0) return -1;
    800018f0:	04050863          	beqz	a0,80001940 <_Z10time_sleepm+0x50>
int time_sleep(time_t ms) {
    800018f4:	fe010113          	addi	sp,sp,-32
    800018f8:	00113c23          	sd	ra,24(sp)
    800018fc:	00813823          	sd	s0,16(sp)
    80001900:	02010413          	addi	s0,sp,32
    80001904:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(TIME_SLEEP, ms);
    80001908:	00000713          	li	a4,0
    8000190c:	00000693          	li	a3,0
    80001910:	00000613          	li	a2,0
    80001914:	03100513          	li	a0,49
    80001918:	00000097          	auipc	ra,0x0
    8000191c:	b5c080e7          	jalr	-1188(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001920:	00050793          	mv	a5,a0
    80001924:	fef42623          	sw	a5,-20(s0)
    return ret;
    80001928:	fec42503          	lw	a0,-20(s0)
    8000192c:	0005051b          	sext.w	a0,a0
}
    80001930:	01813083          	ld	ra,24(sp)
    80001934:	01013403          	ld	s0,16(sp)
    80001938:	02010113          	addi	sp,sp,32
    8000193c:	00008067          	ret
    if (ms == 0) return -1;
    80001940:	fff00513          	li	a0,-1
}
    80001944:	00008067          	ret

0000000080001948 <_Z11thread_wakeP3TCB>:

int thread_wake(thread_t handle) {
    80001948:	fe010113          	addi	sp,sp,-32
    8000194c:	00113c23          	sd	ra,24(sp)
    80001950:	00813823          	sd	s0,16(sp)
    80001954:	02010413          	addi	s0,sp,32
    80001958:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(TIME_SLEEP, (uint64) handle);
    8000195c:	00000713          	li	a4,0
    80001960:	00000693          	li	a3,0
    80001964:	00000613          	li	a2,0
    80001968:	03100513          	li	a0,49
    8000196c:	00000097          	auipc	ra,0x0
    80001970:	b08080e7          	jalr	-1272(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001974:	00050793          	mv	a5,a0
    80001978:	fef42623          	sw	a5,-20(s0)
    return ret;
    8000197c:	fec42503          	lw	a0,-20(s0)
}
    80001980:	0005051b          	sext.w	a0,a0
    80001984:	01813083          	ld	ra,24(sp)
    80001988:	01013403          	ld	s0,16(sp)
    8000198c:	02010113          	addi	sp,sp,32
    80001990:	00008067          	ret

0000000080001994 <_Z4getcv>:

char getc() {
    80001994:	fe010113          	addi	sp,sp,-32
    80001998:	00113c23          	sd	ra,24(sp)
    8000199c:	00813823          	sd	s0,16(sp)
    800019a0:	02010413          	addi	s0,sp,32
    char volatile ret;
    syscall(GETC);
    800019a4:	00000713          	li	a4,0
    800019a8:	00000693          	li	a3,0
    800019ac:	00000613          	li	a2,0
    800019b0:	00000593          	li	a1,0
    800019b4:	04100513          	li	a0,65
    800019b8:	00000097          	auipc	ra,0x0
    800019bc:	abc080e7          	jalr	-1348(ra) # 80001474 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    800019c0:	00050793          	mv	a5,a0
    800019c4:	fef407a3          	sb	a5,-17(s0)
    return ret;
    800019c8:	fef44503          	lbu	a0,-17(s0)
}
    800019cc:	0ff57513          	andi	a0,a0,255
    800019d0:	01813083          	ld	ra,24(sp)
    800019d4:	01013403          	ld	s0,16(sp)
    800019d8:	02010113          	addi	sp,sp,32
    800019dc:	00008067          	ret

00000000800019e0 <_Z4putcc>:

void putc(char c) {
    800019e0:	ff010113          	addi	sp,sp,-16
    800019e4:	00113423          	sd	ra,8(sp)
    800019e8:	00813023          	sd	s0,0(sp)
    800019ec:	01010413          	addi	s0,sp,16
    800019f0:	00050593          	mv	a1,a0
    syscall(PUTC, c);
    800019f4:	00000713          	li	a4,0
    800019f8:	00000693          	li	a3,0
    800019fc:	00000613          	li	a2,0
    80001a00:	04200513          	li	a0,66
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	a70080e7          	jalr	-1424(ra) # 80001474 <_Z7syscallmmmmm>
}
    80001a0c:	00813083          	ld	ra,8(sp)
    80001a10:	00013403          	ld	s0,0(sp)
    80001a14:	01010113          	addi	sp,sp,16
    80001a18:	00008067          	ret

0000000080001a1c <_Z3scsv>:

uint64 scs() {
    80001a1c:	fe010113          	addi	sp,sp,-32
    80001a20:	00813c23          	sd	s0,24(sp)
    80001a24:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
}

inline uint64 Riscv::r_stvec() {
    uint64 volatile stvec;
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    80001a28:	105027f3          	csrr	a5,stvec
    80001a2c:	fef43023          	sd	a5,-32(s0)
    return stvec;
    80001a30:	fe043783          	ld	a5,-32(s0)
    int volatile ret;
    Riscv::r_stvec();
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001a34:	00050793          	mv	a5,a0
    80001a38:	fef42623          	sw	a5,-20(s0)
    return ret;
    80001a3c:	fec42503          	lw	a0,-20(s0)
}
    80001a40:	0005051b          	sext.w	a0,a0
    80001a44:	01813403          	ld	s0,24(sp)
    80001a48:	02010113          	addi	sp,sp,32
    80001a4c:	00008067          	ret

0000000080001a50 <_ZN3stm6strlenEPKc>:
#include "../h/string.hpp"
#include "../h/c_memory.hpp"
#include "../h/iostream.hpp"

int stm::strlen(const char *string) {
    80001a50:	ff010113          	addi	sp,sp,-16
    80001a54:	00813423          	sd	s0,8(sp)
    80001a58:	01010413          	addi	s0,sp,16
    80001a5c:	00050713          	mv	a4,a0
    int size;
    for (size = 0; string[size]; size++);
    80001a60:	00000513          	li	a0,0
    80001a64:	00a707b3          	add	a5,a4,a0
    80001a68:	0007c783          	lbu	a5,0(a5)
    80001a6c:	00078663          	beqz	a5,80001a78 <_ZN3stm6strlenEPKc+0x28>
    80001a70:	0015051b          	addiw	a0,a0,1
    80001a74:	ff1ff06f          	j	80001a64 <_ZN3stm6strlenEPKc+0x14>
    return size;
}
    80001a78:	00813403          	ld	s0,8(sp)
    80001a7c:	01010113          	addi	sp,sp,16
    80001a80:	00008067          	ret

0000000080001a84 <_ZN3stm6strcpyEPKcPc>:

char *stm::strcpy(const char *const src, char *const dst) {
    80001a84:	fe010113          	addi	sp,sp,-32
    80001a88:	00113c23          	sd	ra,24(sp)
    80001a8c:	00813823          	sd	s0,16(sp)
    80001a90:	00913423          	sd	s1,8(sp)
    80001a94:	01213023          	sd	s2,0(sp)
    80001a98:	02010413          	addi	s0,sp,32
    80001a9c:	00050913          	mv	s2,a0
    80001aa0:	00058493          	mv	s1,a1
    memcpy(src, dst, strlen(src) + 1);
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	fac080e7          	jalr	-84(ra) # 80001a50 <_ZN3stm6strlenEPKc>
    80001aac:	0015061b          	addiw	a2,a0,1
    80001ab0:	00048593          	mv	a1,s1
    80001ab4:	00090513          	mv	a0,s2
    80001ab8:	00002097          	auipc	ra,0x2
    80001abc:	d84080e7          	jalr	-636(ra) # 8000383c <_Z6memcpyPKvS0_i>
    return dst;
}
    80001ac0:	00048513          	mv	a0,s1
    80001ac4:	01813083          	ld	ra,24(sp)
    80001ac8:	01013403          	ld	s0,16(sp)
    80001acc:	00813483          	ld	s1,8(sp)
    80001ad0:	00013903          	ld	s2,0(sp)
    80001ad4:	02010113          	addi	sp,sp,32
    80001ad8:	00008067          	ret

0000000080001adc <_ZN3stm7strncpyEPcS0_i>:

void stm::strncpy(char *const src, char *const dst, int max_len) {
    80001adc:	fd010113          	addi	sp,sp,-48
    80001ae0:	02113423          	sd	ra,40(sp)
    80001ae4:	02813023          	sd	s0,32(sp)
    80001ae8:	00913c23          	sd	s1,24(sp)
    80001aec:	01213823          	sd	s2,16(sp)
    80001af0:	01313423          	sd	s3,8(sp)
    80001af4:	01413023          	sd	s4,0(sp)
    80001af8:	03010413          	addi	s0,sp,48
    80001afc:	00050913          	mv	s2,a0
    80001b00:	00058993          	mv	s3,a1
    80001b04:	00060a13          	mv	s4,a2
    for (int i = 0; i < strlen(src) + 1; i++) {
    80001b08:	00000493          	li	s1,0
    80001b0c:	00090513          	mv	a0,s2
    80001b10:	00000097          	auipc	ra,0x0
    80001b14:	f40080e7          	jalr	-192(ra) # 80001a50 <_ZN3stm6strlenEPKc>
    80001b18:	02954463          	blt	a0,s1,80001b40 <_ZN3stm7strncpyEPcS0_i+0x64>
        if (i >= max_len) {
    80001b1c:	0144de63          	bge	s1,s4,80001b38 <_ZN3stm7strncpyEPcS0_i+0x5c>
            dst[i] = '\0';
            return;
        }
        dst[i] = src[i];
    80001b20:	009987b3          	add	a5,s3,s1
    80001b24:	00990733          	add	a4,s2,s1
    80001b28:	00074703          	lbu	a4,0(a4)
    80001b2c:	00e78023          	sb	a4,0(a5)
    for (int i = 0; i < strlen(src) + 1; i++) {
    80001b30:	0014849b          	addiw	s1,s1,1
    80001b34:	fd9ff06f          	j	80001b0c <_ZN3stm7strncpyEPcS0_i+0x30>
            dst[i] = '\0';
    80001b38:	009984b3          	add	s1,s3,s1
    80001b3c:	00048023          	sb	zero,0(s1)
    }
}
    80001b40:	02813083          	ld	ra,40(sp)
    80001b44:	02013403          	ld	s0,32(sp)
    80001b48:	01813483          	ld	s1,24(sp)
    80001b4c:	01013903          	ld	s2,16(sp)
    80001b50:	00813983          	ld	s3,8(sp)
    80001b54:	00013a03          	ld	s4,0(sp)
    80001b58:	03010113          	addi	sp,sp,48
    80001b5c:	00008067          	ret

0000000080001b60 <_ZN3stm6strcatEPKcS1_>:

char *stm::strcat(const char *const base, const char *const tail) {
    80001b60:	fd010113          	addi	sp,sp,-48
    80001b64:	02113423          	sd	ra,40(sp)
    80001b68:	02813023          	sd	s0,32(sp)
    80001b6c:	00913c23          	sd	s1,24(sp)
    80001b70:	01213823          	sd	s2,16(sp)
    80001b74:	01313423          	sd	s3,8(sp)
    80001b78:	01413023          	sd	s4,0(sp)
    80001b7c:	03010413          	addi	s0,sp,48
    80001b80:	00050a13          	mv	s4,a0
    80001b84:	00058913          	mv	s2,a1
    int base_len = strlen(base);
    80001b88:	00000097          	auipc	ra,0x0
    80001b8c:	ec8080e7          	jalr	-312(ra) # 80001a50 <_ZN3stm6strlenEPKc>
    80001b90:	00050993          	mv	s3,a0
    char *new_base = new char[base_len + strlen(tail) + 1];
    80001b94:	00090513          	mv	a0,s2
    80001b98:	00000097          	auipc	ra,0x0
    80001b9c:	eb8080e7          	jalr	-328(ra) # 80001a50 <_ZN3stm6strlenEPKc>
    80001ba0:	0135053b          	addw	a0,a0,s3
    80001ba4:	0015051b          	addiw	a0,a0,1
    80001ba8:	00002097          	auipc	ra,0x2
    80001bac:	248080e7          	jalr	584(ra) # 80003df0 <_Znam>
    80001bb0:	00050493          	mv	s1,a0
    strcpy(base, new_base);
    80001bb4:	00050593          	mv	a1,a0
    80001bb8:	000a0513          	mv	a0,s4
    80001bbc:	00000097          	auipc	ra,0x0
    80001bc0:	ec8080e7          	jalr	-312(ra) # 80001a84 <_ZN3stm6strcpyEPKcPc>
    strcpy(tail, &new_base[base_len]);
    80001bc4:	013485b3          	add	a1,s1,s3
    80001bc8:	00090513          	mv	a0,s2
    80001bcc:	00000097          	auipc	ra,0x0
    80001bd0:	eb8080e7          	jalr	-328(ra) # 80001a84 <_ZN3stm6strcpyEPKcPc>
    return new_base;
}
    80001bd4:	00048513          	mv	a0,s1
    80001bd8:	02813083          	ld	ra,40(sp)
    80001bdc:	02013403          	ld	s0,32(sp)
    80001be0:	01813483          	ld	s1,24(sp)
    80001be4:	01013903          	ld	s2,16(sp)
    80001be8:	00813983          	ld	s3,8(sp)
    80001bec:	00013a03          	ld	s4,0(sp)
    80001bf0:	03010113          	addi	sp,sp,48
    80001bf4:	00008067          	ret

0000000080001bf8 <_ZN3stm6strcmpEPKcS1_>:

int stm::strcmp(const char *str1, const char *str2) { //negative means str1 < str2 (a < b) (a < aa)
    80001bf8:	ff010113          	addi	sp,sp,-16
    80001bfc:	00813423          	sd	s0,8(sp)
    80001c00:	01010413          	addi	s0,sp,16
    80001c04:	00050613          	mv	a2,a0
    int i;
    for (i = 0; str1[i] && str2[i]; i++) {
    80001c08:	00000793          	li	a5,0
    80001c0c:	0080006f          	j	80001c14 <_ZN3stm6strcmpEPKcS1_+0x1c>
    80001c10:	0017879b          	addiw	a5,a5,1
    80001c14:	00078513          	mv	a0,a5
    80001c18:	00f60733          	add	a4,a2,a5
    80001c1c:	00074703          	lbu	a4,0(a4)
    80001c20:	00070e63          	beqz	a4,80001c3c <_ZN3stm6strcmpEPKcS1_+0x44>
    80001c24:	00f586b3          	add	a3,a1,a5
    80001c28:	0006c683          	lbu	a3,0(a3)
    80001c2c:	00068863          	beqz	a3,80001c3c <_ZN3stm6strcmpEPKcS1_+0x44>
        int difference = str1[i] - str2[i];
    80001c30:	40d7053b          	subw	a0,a4,a3
        if (difference) return difference;
    80001c34:	fcd70ee3          	beq	a4,a3,80001c10 <_ZN3stm6strcmpEPKcS1_+0x18>
    80001c38:	01c0006f          	j	80001c54 <_ZN3stm6strcmpEPKcS1_+0x5c>
    }
    if (!str1[i] && !str2[i]) return 0;
    80001c3c:	00071863          	bnez	a4,80001c4c <_ZN3stm6strcmpEPKcS1_+0x54>
    80001c40:	00a585b3          	add	a1,a1,a0
    80001c44:	0005c783          	lbu	a5,0(a1)
    80001c48:	00078c63          	beqz	a5,80001c60 <_ZN3stm6strcmpEPKcS1_+0x68>
    else if (str1[i]) return 1;
    80001c4c:	00070e63          	beqz	a4,80001c68 <_ZN3stm6strcmpEPKcS1_+0x70>
    80001c50:	00100513          	li	a0,1
    else return -1;
}
    80001c54:	00813403          	ld	s0,8(sp)
    80001c58:	01010113          	addi	sp,sp,16
    80001c5c:	00008067          	ret
    if (!str1[i] && !str2[i]) return 0;
    80001c60:	00000513          	li	a0,0
    80001c64:	ff1ff06f          	j	80001c54 <_ZN3stm6strcmpEPKcS1_+0x5c>
    else return -1;
    80001c68:	fff00513          	li	a0,-1
    80001c6c:	fe9ff06f          	j	80001c54 <_ZN3stm6strcmpEPKcS1_+0x5c>

0000000080001c70 <_ZN3stm4ntosExPci>:

char *stm::ntos(long long number, char *buffer, int radix) {
    80001c70:	f7010113          	addi	sp,sp,-144
    80001c74:	08113423          	sd	ra,136(sp)
    80001c78:	08813023          	sd	s0,128(sp)
    80001c7c:	06913c23          	sd	s1,120(sp)
    80001c80:	09010413          	addi	s0,sp,144
    80001c84:	00058493          	mv	s1,a1
    if (radix < 2 || radix > 16) {
    80001c88:	ffe6071b          	addiw	a4,a2,-2
    80001c8c:	00e00793          	li	a5,14
    80001c90:	06e7ec63          	bltu	a5,a4,80001d08 <_ZN3stm4ntosExPci+0x98>
        buffer[0] = 0;
        return buffer;
    }
    if (number == 0) {
    80001c94:	06050e63          	beqz	a0,80001d10 <_ZN3stm4ntosExPci+0xa0>
        buffer[0] = '0';
        buffer[1] = 0;
        return buffer;
    }
    char digits[100] = {};
    80001c98:	f6043c23          	sd	zero,-136(s0)
    80001c9c:	f8043023          	sd	zero,-128(s0)
    80001ca0:	f8043423          	sd	zero,-120(s0)
    80001ca4:	f8043823          	sd	zero,-112(s0)
    80001ca8:	f8043c23          	sd	zero,-104(s0)
    80001cac:	fa043023          	sd	zero,-96(s0)
    80001cb0:	fa043423          	sd	zero,-88(s0)
    80001cb4:	fa043823          	sd	zero,-80(s0)
    80001cb8:	fa043c23          	sd	zero,-72(s0)
    80001cbc:	fc043023          	sd	zero,-64(s0)
    80001cc0:	fc043423          	sd	zero,-56(s0)
    80001cc4:	fc043823          	sd	zero,-48(s0)
    80001cc8:	fc042c23          	sw	zero,-40(s0)
    int i = 98;
    bool negative = number < 0;
    if (negative) number = -number;
    80001ccc:	04054a63          	bltz	a0,80001d20 <_ZN3stm4ntosExPci+0xb0>
    80001cd0:	00050793          	mv	a5,a0
    80001cd4:	06200693          	li	a3,98
    const char *av = "0123456789ABCDEF";
    while (number > 0) {
    80001cd8:	04f05863          	blez	a5,80001d28 <_ZN3stm4ntosExPci+0xb8>
        digits[i--] = av[(number % radix)];
    80001cdc:	02c7e733          	rem	a4,a5,a2
    80001ce0:	00006817          	auipc	a6,0x6
    80001ce4:	34080813          	addi	a6,a6,832 # 80008020 <CONSOLE_STATUS+0x10>
    80001ce8:	01070733          	add	a4,a4,a6
    80001cec:	00074803          	lbu	a6,0(a4)
    80001cf0:	fe040713          	addi	a4,s0,-32
    80001cf4:	00d70733          	add	a4,a4,a3
    80001cf8:	f9070c23          	sb	a6,-104(a4)
        number /= radix;
    80001cfc:	02c7c7b3          	div	a5,a5,a2
        digits[i--] = av[(number % radix)];
    80001d00:	fff6869b          	addiw	a3,a3,-1
    while (number > 0) {
    80001d04:	fd5ff06f          	j	80001cd8 <_ZN3stm4ntosExPci+0x68>
        buffer[0] = 0;
    80001d08:	00058023          	sb	zero,0(a1)
        return buffer;
    80001d0c:	0380006f          	j	80001d44 <_ZN3stm4ntosExPci+0xd4>
        buffer[0] = '0';
    80001d10:	03000793          	li	a5,48
    80001d14:	00f58023          	sb	a5,0(a1)
        buffer[1] = 0;
    80001d18:	000580a3          	sb	zero,1(a1)
        return buffer;
    80001d1c:	0280006f          	j	80001d44 <_ZN3stm4ntosExPci+0xd4>
    if (negative) number = -number;
    80001d20:	40a007b3          	neg	a5,a0
    80001d24:	fb1ff06f          	j	80001cd4 <_ZN3stm4ntosExPci+0x64>
    }
    if (negative) digits[i--] = '-';
    80001d28:	02054a63          	bltz	a0,80001d5c <_ZN3stm4ntosExPci+0xec>
    strcpy(&digits[++i], buffer);
    80001d2c:	0016869b          	addiw	a3,a3,1
    80001d30:	00048593          	mv	a1,s1
    80001d34:	f7840513          	addi	a0,s0,-136
    80001d38:	00d50533          	add	a0,a0,a3
    80001d3c:	00000097          	auipc	ra,0x0
    80001d40:	d48080e7          	jalr	-696(ra) # 80001a84 <_ZN3stm6strcpyEPKcPc>
    return buffer;
}
    80001d44:	00048513          	mv	a0,s1
    80001d48:	08813083          	ld	ra,136(sp)
    80001d4c:	08013403          	ld	s0,128(sp)
    80001d50:	07813483          	ld	s1,120(sp)
    80001d54:	09010113          	addi	sp,sp,144
    80001d58:	00008067          	ret
    if (negative) digits[i--] = '-';
    80001d5c:	fe040793          	addi	a5,s0,-32
    80001d60:	00d787b3          	add	a5,a5,a3
    80001d64:	02d00713          	li	a4,45
    80001d68:	f8e78c23          	sb	a4,-104(a5)
    80001d6c:	fff6869b          	addiw	a3,a3,-1
    80001d70:	fbdff06f          	j	80001d2c <_ZN3stm4ntosExPci+0xbc>

0000000080001d74 <_ZN3stm4utosEmPci>:

char *stm::utos(uint64 number, char *buffer, int radix) {
    80001d74:	f7010113          	addi	sp,sp,-144
    80001d78:	08113423          	sd	ra,136(sp)
    80001d7c:	08813023          	sd	s0,128(sp)
    80001d80:	06913c23          	sd	s1,120(sp)
    80001d84:	09010413          	addi	s0,sp,144
    80001d88:	00058493          	mv	s1,a1
    if (radix < 2 || radix > 16) {
    80001d8c:	ffe6071b          	addiw	a4,a2,-2
    80001d90:	00e00793          	li	a5,14
    80001d94:	04e7e263          	bltu	a5,a4,80001dd8 <_ZN3stm4utosEmPci+0x64>
        buffer[0] = 0;
        return buffer;
    }
    if (number == 0) {
    80001d98:	04050463          	beqz	a0,80001de0 <_ZN3stm4utosEmPci+0x6c>
        buffer[0] = '0';
        buffer[1] = 0;
        return buffer;
    }
    char digits[100] = {};
    80001d9c:	f6043c23          	sd	zero,-136(s0)
    80001da0:	f8043023          	sd	zero,-128(s0)
    80001da4:	f8043423          	sd	zero,-120(s0)
    80001da8:	f8043823          	sd	zero,-112(s0)
    80001dac:	f8043c23          	sd	zero,-104(s0)
    80001db0:	fa043023          	sd	zero,-96(s0)
    80001db4:	fa043423          	sd	zero,-88(s0)
    80001db8:	fa043823          	sd	zero,-80(s0)
    80001dbc:	fa043c23          	sd	zero,-72(s0)
    80001dc0:	fc043023          	sd	zero,-64(s0)
    80001dc4:	fc043423          	sd	zero,-56(s0)
    80001dc8:	fc043823          	sd	zero,-48(s0)
    80001dcc:	fc042c23          	sw	zero,-40(s0)
    int i = 98;
    80001dd0:	06200713          	li	a4,98
    80001dd4:	0440006f          	j	80001e18 <_ZN3stm4utosEmPci+0xa4>
        buffer[0] = 0;
    80001dd8:	00058023          	sb	zero,0(a1)
        return buffer;
    80001ddc:	0580006f          	j	80001e34 <_ZN3stm4utosEmPci+0xc0>
        buffer[0] = '0';
    80001de0:	03000793          	li	a5,48
    80001de4:	00f58023          	sb	a5,0(a1)
        buffer[1] = 0;
    80001de8:	000580a3          	sb	zero,1(a1)
        return buffer;
    80001dec:	0480006f          	j	80001e34 <_ZN3stm4utosEmPci+0xc0>
    const char *av = "0123456789ABCDEF";
    while (number > 0) {
        digits[i--] = av[(number % radix)];
    80001df0:	02c577b3          	remu	a5,a0,a2
    80001df4:	00006697          	auipc	a3,0x6
    80001df8:	22c68693          	addi	a3,a3,556 # 80008020 <CONSOLE_STATUS+0x10>
    80001dfc:	00d787b3          	add	a5,a5,a3
    80001e00:	0007c683          	lbu	a3,0(a5)
    80001e04:	fe040793          	addi	a5,s0,-32
    80001e08:	00e787b3          	add	a5,a5,a4
    80001e0c:	f8d78c23          	sb	a3,-104(a5)
        number /= radix;
    80001e10:	02c55533          	divu	a0,a0,a2
        digits[i--] = av[(number % radix)];
    80001e14:	fff7071b          	addiw	a4,a4,-1
    while (number > 0) {
    80001e18:	fc051ce3          	bnez	a0,80001df0 <_ZN3stm4utosEmPci+0x7c>
    }
    strcpy(&digits[++i], buffer);
    80001e1c:	0017071b          	addiw	a4,a4,1
    80001e20:	00048593          	mv	a1,s1
    80001e24:	f7840513          	addi	a0,s0,-136
    80001e28:	00e50533          	add	a0,a0,a4
    80001e2c:	00000097          	auipc	ra,0x0
    80001e30:	c58080e7          	jalr	-936(ra) # 80001a84 <_ZN3stm6strcpyEPKcPc>
    return buffer;
}
    80001e34:	00048513          	mv	a0,s1
    80001e38:	08813083          	ld	ra,136(sp)
    80001e3c:	08013403          	ld	s0,128(sp)
    80001e40:	07813483          	ld	s1,120(sp)
    80001e44:	09010113          	addi	sp,sp,144
    80001e48:	00008067          	ret

0000000080001e4c <_ZN3stm6String4copyERKS0_>:

void stm::String::copy(const stm::String &string) {
    80001e4c:	fe010113          	addi	sp,sp,-32
    80001e50:	00113c23          	sd	ra,24(sp)
    80001e54:	00813823          	sd	s0,16(sp)
    80001e58:	00913423          	sd	s1,8(sp)
    80001e5c:	01213023          	sd	s2,0(sp)
    80001e60:	02010413          	addi	s0,sp,32
    80001e64:	00050493          	mv	s1,a0
    80001e68:	00058913          	mv	s2,a1
    cout << 101;
    80001e6c:	06500593          	li	a1,101
    80001e70:	00008517          	auipc	a0,0x8
    80001e74:	62053503          	ld	a0,1568(a0) # 8000a490 <_GLOBAL_OFFSET_TABLE_+0x90>
    80001e78:	00002097          	auipc	ra,0x2
    80001e7c:	aec080e7          	jalr	-1300(ra) # 80003964 <_ZNK3stm7istreamlsEi>
    this->size = string.size;
    80001e80:	00092503          	lw	a0,0(s2)
    80001e84:	00a4a023          	sw	a0,0(s1)
    this->actual_string = this->size > String::SMALL_SIZE ? new char[this->size] : this->small_string;
    80001e88:	01e00793          	li	a5,30
    80001e8c:	02a7c863          	blt	a5,a0,80001ebc <_ZN3stm6String4copyERKS0_+0x70>
    80001e90:	01048593          	addi	a1,s1,16
    80001e94:	00b4b423          	sd	a1,8(s1)
    strcpy(string.actual_string, this->actual_string);
    80001e98:	00893503          	ld	a0,8(s2)
    80001e9c:	00000097          	auipc	ra,0x0
    80001ea0:	be8080e7          	jalr	-1048(ra) # 80001a84 <_ZN3stm6strcpyEPKcPc>
}
    80001ea4:	01813083          	ld	ra,24(sp)
    80001ea8:	01013403          	ld	s0,16(sp)
    80001eac:	00813483          	ld	s1,8(sp)
    80001eb0:	00013903          	ld	s2,0(sp)
    80001eb4:	02010113          	addi	sp,sp,32
    80001eb8:	00008067          	ret
    this->actual_string = this->size > String::SMALL_SIZE ? new char[this->size] : this->small_string;
    80001ebc:	00002097          	auipc	ra,0x2
    80001ec0:	f34080e7          	jalr	-204(ra) # 80003df0 <_Znam>
    80001ec4:	00050593          	mv	a1,a0
    80001ec8:	fcdff06f          	j	80001e94 <_ZN3stm6String4copyERKS0_+0x48>

0000000080001ecc <_ZN3stm6String4moveERS0_>:

void stm::String::move(stm::String &string) {
    80001ecc:	fe010113          	addi	sp,sp,-32
    80001ed0:	00113c23          	sd	ra,24(sp)
    80001ed4:	00813823          	sd	s0,16(sp)
    80001ed8:	00913423          	sd	s1,8(sp)
    80001edc:	01213023          	sd	s2,0(sp)
    80001ee0:	02010413          	addi	s0,sp,32
    80001ee4:	00050913          	mv	s2,a0
    80001ee8:	00058493          	mv	s1,a1
    this->size = string.size;
    80001eec:	0005a783          	lw	a5,0(a1)
    80001ef0:	00f52023          	sw	a5,0(a0)
    if(this->size > String::SMALL_SIZE)
    80001ef4:	01e00713          	li	a4,30
    80001ef8:	02f75463          	bge	a4,a5,80001f20 <_ZN3stm6String4moveERS0_+0x54>
        this->actual_string = string.actual_string;
    80001efc:	0085b783          	ld	a5,8(a1)
    80001f00:	00f53423          	sd	a5,8(a0)
    else
        this->actual_string = strcpy(string.actual_string, this->small_string);
    string.actual_string = nullptr;
    80001f04:	0004b423          	sd	zero,8(s1)
}
    80001f08:	01813083          	ld	ra,24(sp)
    80001f0c:	01013403          	ld	s0,16(sp)
    80001f10:	00813483          	ld	s1,8(sp)
    80001f14:	00013903          	ld	s2,0(sp)
    80001f18:	02010113          	addi	sp,sp,32
    80001f1c:	00008067          	ret
        this->actual_string = strcpy(string.actual_string, this->small_string);
    80001f20:	01050593          	addi	a1,a0,16
    80001f24:	0084b503          	ld	a0,8(s1)
    80001f28:	00000097          	auipc	ra,0x0
    80001f2c:	b5c080e7          	jalr	-1188(ra) # 80001a84 <_ZN3stm6strcpyEPKcPc>
    80001f30:	00a93423          	sd	a0,8(s2)
    80001f34:	fd1ff06f          	j	80001f04 <_ZN3stm6String4moveERS0_+0x38>

0000000080001f38 <_ZN3stm6StringC1Ec>:
    this->size = strlen(string);
    this->actual_string = new char[this->size + 1];
    strcpy(string, this->actual_string);
}

stm::String::String(char c) {
    80001f38:	ff010113          	addi	sp,sp,-16
    80001f3c:	00813423          	sd	s0,8(sp)
    80001f40:	01010413          	addi	s0,sp,16
    this->size = 1;
    80001f44:	00100793          	li	a5,1
    80001f48:	00f52023          	sw	a5,0(a0)
    this->actual_string = this->small_string;
    80001f4c:	01050793          	addi	a5,a0,16
    80001f50:	00f53423          	sd	a5,8(a0)
    this->actual_string[0] = c;
    80001f54:	00b50823          	sb	a1,16(a0)
    this->actual_string[1] = 0;
    80001f58:	000508a3          	sb	zero,17(a0)
}
    80001f5c:	00813403          	ld	s0,8(sp)
    80001f60:	01010113          	addi	sp,sp,16
    80001f64:	00008067          	ret

0000000080001f68 <_ZN3stm6StringC1Ex>:

stm::String::String(long long number) {
    80001f68:	fe010113          	addi	sp,sp,-32
    80001f6c:	00113c23          	sd	ra,24(sp)
    80001f70:	00813823          	sd	s0,16(sp)
    80001f74:	00913423          	sd	s1,8(sp)
    80001f78:	02010413          	addi	s0,sp,32
    80001f7c:	00050493          	mv	s1,a0
    80001f80:	00058513          	mv	a0,a1
    this->actual_string = ntos(number, this->small_string, 10);
    80001f84:	00a00613          	li	a2,10
    80001f88:	01048593          	addi	a1,s1,16
    80001f8c:	00000097          	auipc	ra,0x0
    80001f90:	ce4080e7          	jalr	-796(ra) # 80001c70 <_ZN3stm4ntosExPci>
    80001f94:	00a4b423          	sd	a0,8(s1)
    this->size = strlen(this->actual_string);
    80001f98:	00000097          	auipc	ra,0x0
    80001f9c:	ab8080e7          	jalr	-1352(ra) # 80001a50 <_ZN3stm6strlenEPKc>
    80001fa0:	00a4a023          	sw	a0,0(s1)
}
    80001fa4:	01813083          	ld	ra,24(sp)
    80001fa8:	01013403          	ld	s0,16(sp)
    80001fac:	00813483          	ld	s1,8(sp)
    80001fb0:	02010113          	addi	sp,sp,32
    80001fb4:	00008067          	ret

0000000080001fb8 <_ZN3stm6StringC1Ei>:

stm::String::String(int number) : String((long long) number) {}
    80001fb8:	ff010113          	addi	sp,sp,-16
    80001fbc:	00113423          	sd	ra,8(sp)
    80001fc0:	00813023          	sd	s0,0(sp)
    80001fc4:	01010413          	addi	s0,sp,16
    80001fc8:	00000097          	auipc	ra,0x0
    80001fcc:	fa0080e7          	jalr	-96(ra) # 80001f68 <_ZN3stm6StringC1Ex>
    80001fd0:	00813083          	ld	ra,8(sp)
    80001fd4:	00013403          	ld	s0,0(sp)
    80001fd8:	01010113          	addi	sp,sp,16
    80001fdc:	00008067          	ret

0000000080001fe0 <_ZN3stm6StringC1Em>:

stm::String::String(uint64 number) {
    80001fe0:	fe010113          	addi	sp,sp,-32
    80001fe4:	00113c23          	sd	ra,24(sp)
    80001fe8:	00813823          	sd	s0,16(sp)
    80001fec:	00913423          	sd	s1,8(sp)
    80001ff0:	02010413          	addi	s0,sp,32
    80001ff4:	00050493          	mv	s1,a0
    80001ff8:	00058513          	mv	a0,a1
    this->actual_string = utos(number, this->small_string, 10);
    80001ffc:	00a00613          	li	a2,10
    80002000:	01048593          	addi	a1,s1,16
    80002004:	00000097          	auipc	ra,0x0
    80002008:	d70080e7          	jalr	-656(ra) # 80001d74 <_ZN3stm4utosEmPci>
    8000200c:	00a4b423          	sd	a0,8(s1)
    this->size = strlen(this->actual_string);
    80002010:	00000097          	auipc	ra,0x0
    80002014:	a40080e7          	jalr	-1472(ra) # 80001a50 <_ZN3stm6strlenEPKc>
    80002018:	00a4a023          	sw	a0,0(s1)
}
    8000201c:	01813083          	ld	ra,24(sp)
    80002020:	01013403          	ld	s0,16(sp)
    80002024:	00813483          	ld	s1,8(sp)
    80002028:	02010113          	addi	sp,sp,32
    8000202c:	00008067          	ret

0000000080002030 <_ZN3stm6StringaSERKS0_>:

stm::String &stm::String::operator=(const stm::String &string) {
    80002030:	fe010113          	addi	sp,sp,-32
    80002034:	00113c23          	sd	ra,24(sp)
    80002038:	00813823          	sd	s0,16(sp)
    8000203c:	00913423          	sd	s1,8(sp)
    80002040:	01213023          	sd	s2,0(sp)
    80002044:	02010413          	addi	s0,sp,32
    80002048:	00050493          	mv	s1,a0
    if (this == &string) return *this;
    8000204c:	02b50463          	beq	a0,a1,80002074 <_ZN3stm6StringaSERKS0_+0x44>
    80002050:	00058913          	mv	s2,a1
    private:
        void copy(const String &);

        void move(String &);

        void unexist() { delete[] this->actual_string; }
    80002054:	00853503          	ld	a0,8(a0)
    80002058:	00050663          	beqz	a0,80002064 <_ZN3stm6StringaSERKS0_+0x34>
    8000205c:	00002097          	auipc	ra,0x2
    80002060:	eb0080e7          	jalr	-336(ra) # 80003f0c <_ZdaPv>
    this->unexist();
    this->copy(string);
    80002064:	00090593          	mv	a1,s2
    80002068:	00048513          	mv	a0,s1
    8000206c:	00000097          	auipc	ra,0x0
    80002070:	de0080e7          	jalr	-544(ra) # 80001e4c <_ZN3stm6String4copyERKS0_>
    return *this;
}
    80002074:	00048513          	mv	a0,s1
    80002078:	01813083          	ld	ra,24(sp)
    8000207c:	01013403          	ld	s0,16(sp)
    80002080:	00813483          	ld	s1,8(sp)
    80002084:	00013903          	ld	s2,0(sp)
    80002088:	02010113          	addi	sp,sp,32
    8000208c:	00008067          	ret

0000000080002090 <_ZN3stm6StringaSEOS0_>:

stm::String &stm::String::operator=(stm::String &&string) noexcept {
    80002090:	fe010113          	addi	sp,sp,-32
    80002094:	00113c23          	sd	ra,24(sp)
    80002098:	00813823          	sd	s0,16(sp)
    8000209c:	00913423          	sd	s1,8(sp)
    800020a0:	01213023          	sd	s2,0(sp)
    800020a4:	02010413          	addi	s0,sp,32
    800020a8:	00050493          	mv	s1,a0
    if (this == &string) return *this;
    800020ac:	02b50463          	beq	a0,a1,800020d4 <_ZN3stm6StringaSEOS0_+0x44>
    800020b0:	00058913          	mv	s2,a1
    800020b4:	00853503          	ld	a0,8(a0)
    800020b8:	00050663          	beqz	a0,800020c4 <_ZN3stm6StringaSEOS0_+0x34>
    800020bc:	00002097          	auipc	ra,0x2
    800020c0:	e50080e7          	jalr	-432(ra) # 80003f0c <_ZdaPv>
    this->unexist();
    this->move(string);
    800020c4:	00090593          	mv	a1,s2
    800020c8:	00048513          	mv	a0,s1
    800020cc:	00000097          	auipc	ra,0x0
    800020d0:	e00080e7          	jalr	-512(ra) # 80001ecc <_ZN3stm6String4moveERS0_>
    return *this;
}
    800020d4:	00048513          	mv	a0,s1
    800020d8:	01813083          	ld	ra,24(sp)
    800020dc:	01013403          	ld	s0,16(sp)
    800020e0:	00813483          	ld	s1,8(sp)
    800020e4:	00013903          	ld	s2,0(sp)
    800020e8:	02010113          	addi	sp,sp,32
    800020ec:	00008067          	ret

00000000800020f0 <_ZN3stm6String15write_and_countEPKcPci>:

inline bool stm::operator<(const stm::String &string1, const stm::String &string2) {
    return stm::strcmp(string1.actual_string, string2.actual_string) < 0;
}

int stm::String::write_and_count(const char *src, char *dst, int n) {
    800020f0:	ff010113          	addi	sp,sp,-16
    800020f4:	00813423          	sd	s0,8(sp)
    800020f8:	01010413          	addi	s0,sp,16
    800020fc:	00050693          	mv	a3,a0
    int i;
    for (i = 0; src[i]; i++) {
    80002100:	00000513          	li	a0,0
    80002104:	00a68733          	add	a4,a3,a0
    80002108:	00074703          	lbu	a4,0(a4)
    8000210c:	00070c63          	beqz	a4,80002124 <_ZN3stm6String15write_and_countEPKcPci+0x34>
        if (i >= n) return -1;
    80002110:	02c55463          	bge	a0,a2,80002138 <_ZN3stm6String15write_and_countEPKcPci+0x48>
        dst[i] = src[i];
    80002114:	00a587b3          	add	a5,a1,a0
    80002118:	00e78023          	sb	a4,0(a5)
    for (i = 0; src[i]; i++) {
    8000211c:	0015051b          	addiw	a0,a0,1
    80002120:	fe5ff06f          	j	80002104 <_ZN3stm6String15write_and_countEPKcPci+0x14>
    }
    dst[i] = src[i];
    80002124:	00a587b3          	add	a5,a1,a0
    80002128:	00e78023          	sb	a4,0(a5)
    return i;
    8000212c:	00813403          	ld	s0,8(sp)
    80002130:	01010113          	addi	sp,sp,16
    80002134:	00008067          	ret
        if (i >= n) return -1;
    80002138:	fff00513          	li	a0,-1
    8000213c:	ff1ff06f          	j	8000212c <_ZN3stm6String15write_and_countEPKcPci+0x3c>

0000000080002140 <_ZN3stm6StringC1EPKc>:
stm::String::String(const char *string) {
    80002140:	fd010113          	addi	sp,sp,-48
    80002144:	02113423          	sd	ra,40(sp)
    80002148:	02813023          	sd	s0,32(sp)
    8000214c:	00913c23          	sd	s1,24(sp)
    80002150:	01213823          	sd	s2,16(sp)
    80002154:	01313423          	sd	s3,8(sp)
    80002158:	03010413          	addi	s0,sp,48
    8000215c:	00050493          	mv	s1,a0
    80002160:	00058913          	mv	s2,a1
    this->size = String::write_and_count(string, this->small_string, SMALL_SIZE);
    80002164:	01050993          	addi	s3,a0,16
    80002168:	01e00613          	li	a2,30
    8000216c:	00098593          	mv	a1,s3
    80002170:	00090513          	mv	a0,s2
    80002174:	00000097          	auipc	ra,0x0
    80002178:	f7c080e7          	jalr	-132(ra) # 800020f0 <_ZN3stm6String15write_and_countEPKcPci>
    8000217c:	00a4a023          	sw	a0,0(s1)
    if (this->size != -1) {
    80002180:	fff00793          	li	a5,-1
    80002184:	02f50263          	beq	a0,a5,800021a8 <_ZN3stm6StringC1EPKc+0x68>
        this->actual_string = this->small_string;
    80002188:	0134b423          	sd	s3,8(s1)
}
    8000218c:	02813083          	ld	ra,40(sp)
    80002190:	02013403          	ld	s0,32(sp)
    80002194:	01813483          	ld	s1,24(sp)
    80002198:	01013903          	ld	s2,16(sp)
    8000219c:	00813983          	ld	s3,8(sp)
    800021a0:	03010113          	addi	sp,sp,48
    800021a4:	00008067          	ret
    this->size = strlen(string);
    800021a8:	00090513          	mv	a0,s2
    800021ac:	00000097          	auipc	ra,0x0
    800021b0:	8a4080e7          	jalr	-1884(ra) # 80001a50 <_ZN3stm6strlenEPKc>
    800021b4:	00a4a023          	sw	a0,0(s1)
    this->actual_string = new char[this->size + 1];
    800021b8:	0015051b          	addiw	a0,a0,1
    800021bc:	00002097          	auipc	ra,0x2
    800021c0:	c34080e7          	jalr	-972(ra) # 80003df0 <_Znam>
    800021c4:	00050593          	mv	a1,a0
    800021c8:	00a4b423          	sd	a0,8(s1)
    strcpy(string, this->actual_string);
    800021cc:	00090513          	mv	a0,s2
    800021d0:	00000097          	auipc	ra,0x0
    800021d4:	8b4080e7          	jalr	-1868(ra) # 80001a84 <_ZN3stm6strcpyEPKcPc>
    800021d8:	fb5ff06f          	j	8000218c <_ZN3stm6StringC1EPKc+0x4c>

00000000800021dc <_ZN3stmplERKNS_6StringES2_>:
stm::String &stm::operator+(const stm::String &string1, const stm::String &string2) {
    800021dc:	fe010113          	addi	sp,sp,-32
    800021e0:	00113c23          	sd	ra,24(sp)
    800021e4:	00813823          	sd	s0,16(sp)
    800021e8:	00913423          	sd	s1,8(sp)
    800021ec:	01213023          	sd	s2,0(sp)
    800021f0:	02010413          	addi	s0,sp,32
    return *(new stm::String(stm::strcat(string1.actual_string, string2.actual_string)));
    800021f4:	0085b583          	ld	a1,8(a1)
    800021f8:	00853503          	ld	a0,8(a0)
    800021fc:	00000097          	auipc	ra,0x0
    80002200:	964080e7          	jalr	-1692(ra) # 80001b60 <_ZN3stm6strcatEPKcS1_>
    80002204:	00050913          	mv	s2,a0
    80002208:	03000513          	li	a0,48
    8000220c:	00002097          	auipc	ra,0x2
    80002210:	bbc080e7          	jalr	-1092(ra) # 80003dc8 <_Znwm>
    80002214:	00050493          	mv	s1,a0
    80002218:	00090593          	mv	a1,s2
    8000221c:	00000097          	auipc	ra,0x0
    80002220:	f24080e7          	jalr	-220(ra) # 80002140 <_ZN3stm6StringC1EPKc>
    80002224:	0200006f          	j	80002244 <_ZN3stmplERKNS_6StringES2_+0x68>
    80002228:	00050913          	mv	s2,a0
    8000222c:	00048513          	mv	a0,s1
    80002230:	00002097          	auipc	ra,0x2
    80002234:	be8080e7          	jalr	-1048(ra) # 80003e18 <_ZdlPv>
    80002238:	00090513          	mv	a0,s2
    8000223c:	00009097          	auipc	ra,0x9
    80002240:	43c080e7          	jalr	1084(ra) # 8000b678 <_Unwind_Resume>
}
    80002244:	00048513          	mv	a0,s1
    80002248:	01813083          	ld	ra,24(sp)
    8000224c:	01013403          	ld	s0,16(sp)
    80002250:	00813483          	ld	s1,8(sp)
    80002254:	00013903          	ld	s2,0(sp)
    80002258:	02010113          	addi	sp,sp,32
    8000225c:	00008067          	ret

0000000080002260 <_ZN3stm6StringpLERKS0_>:
stm::String &stm::String::operator+=(const stm::String &string) {
    80002260:	fe010113          	addi	sp,sp,-32
    80002264:	00113c23          	sd	ra,24(sp)
    80002268:	00813823          	sd	s0,16(sp)
    8000226c:	00913423          	sd	s1,8(sp)
    80002270:	02010413          	addi	s0,sp,32
    80002274:	00050493          	mv	s1,a0
    *this = *this + string;
    80002278:	00000097          	auipc	ra,0x0
    8000227c:	f64080e7          	jalr	-156(ra) # 800021dc <_ZN3stmplERKNS_6StringES2_>
    80002280:	00050593          	mv	a1,a0
    80002284:	00048513          	mv	a0,s1
    80002288:	00000097          	auipc	ra,0x0
    8000228c:	da8080e7          	jalr	-600(ra) # 80002030 <_ZN3stm6StringaSERKS0_>
}
    80002290:	00048513          	mv	a0,s1
    80002294:	01813083          	ld	ra,24(sp)
    80002298:	01013403          	ld	s0,16(sp)
    8000229c:	00813483          	ld	s1,8(sp)
    800022a0:	02010113          	addi	sp,sp,32
    800022a4:	00008067          	ret

00000000800022a8 <_ZN3Sem9_sem_openEPPS_j>:
#include "../h/c_semaphore.hpp"
#include "../h/c_thread.hpp"
#include "../h/scheduler.hpp"

int Sem::_sem_open(sem_t *handle, unsigned init) {
    800022a8:	fd010113          	addi	sp,sp,-48
    800022ac:	02113423          	sd	ra,40(sp)
    800022b0:	02813023          	sd	s0,32(sp)
    800022b4:	00913c23          	sd	s1,24(sp)
    800022b8:	01213823          	sd	s2,16(sp)
    800022bc:	01313423          	sd	s3,8(sp)
    800022c0:	03010413          	addi	s0,sp,48
    800022c4:	00050913          	mv	s2,a0
    800022c8:	00058993          	mv	s3,a1
    sem_t semaphore = (sem_t) Allocator::_mem_alloc(sizeof(Sem));
    800022cc:	02000513          	li	a0,32
    800022d0:	00001097          	auipc	ra,0x1
    800022d4:	294080e7          	jalr	660(ra) # 80003564 <_ZN9Allocator10_mem_allocEm>
    if (!semaphore) {
    800022d8:	02050e63          	beqz	a0,80002314 <_ZN3Sem9_sem_openEPPS_j+0x6c>
    800022dc:	00050493          	mv	s1,a0
        return 1;
    }
    semaphore->count = init;
    800022e0:	01352023          	sw	s3,0(a0)
    semaphore->blocked.init();
    800022e4:	00850513          	addi	a0,a0,8
    800022e8:	00000097          	auipc	ra,0x0
    800022ec:	1b0080e7          	jalr	432(ra) # 80002498 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    *handle = semaphore;
    800022f0:	00993023          	sd	s1,0(s2)
    return 0;
    800022f4:	00000513          	li	a0,0
}
    800022f8:	02813083          	ld	ra,40(sp)
    800022fc:	02013403          	ld	s0,32(sp)
    80002300:	01813483          	ld	s1,24(sp)
    80002304:	01013903          	ld	s2,16(sp)
    80002308:	00813983          	ld	s3,8(sp)
    8000230c:	03010113          	addi	sp,sp,48
    80002310:	00008067          	ret
        return 1;
    80002314:	00100513          	li	a0,1
    80002318:	fe1ff06f          	j	800022f8 <_ZN3Sem9_sem_openEPPS_j+0x50>

000000008000231c <_ZN3Sem11_sem_signalEPS_>:
    }
    return ret;
}

int Sem::_sem_signal(sem_t id) {
    if (!id) return 1;
    8000231c:	06050263          	beqz	a0,80002380 <_ZN3Sem11_sem_signalEPS_+0x64>
    80002320:	00050793          	mv	a5,a0

        T get();

        T &peek();

        inline bool is_empty() const { return this->size == 0; }
    80002324:	01852503          	lw	a0,24(a0)
    if (!id->blocked.is_empty()) {
    80002328:	00051a63          	bnez	a0,8000233c <_ZN3Sem11_sem_signalEPS_+0x20>
        thread_t next = id->blocked.get();
        next->run();
        Scheduler::put(next);
        TCB::_thread_dispatch();
    } else {
        id->count++;
    8000232c:	0007a703          	lw	a4,0(a5)
    80002330:	0017071b          	addiw	a4,a4,1
    80002334:	00e7a023          	sw	a4,0(a5)
    80002338:	00008067          	ret
int Sem::_sem_signal(sem_t id) {
    8000233c:	ff010113          	addi	sp,sp,-16
    80002340:	00113423          	sd	ra,8(sp)
    80002344:	00813023          	sd	s0,0(sp)
    80002348:	01010413          	addi	s0,sp,16
        thread_t next = id->blocked.get();
    8000234c:	00878513          	addi	a0,a5,8
    80002350:	00000097          	auipc	ra,0x0
    80002354:	198080e7          	jalr	408(ra) # 800024e8 <_ZN3stm14CircularBufferIP3TCBE3getEv>

    bool is_joined() const { return this->status == JOINED; }

    bool is_finished() const { return this->status == FINISHED; }

    void run() { this->status = RUNNABLE; }
    80002358:	04052423          	sw	zero,72(a0)
        Scheduler::put(next);
    8000235c:	00002097          	auipc	ra,0x2
    80002360:	46c080e7          	jalr	1132(ra) # 800047c8 <_ZN9Scheduler3putEP3TCB>
        TCB::_thread_dispatch();
    80002364:	00003097          	auipc	ra,0x3
    80002368:	e00080e7          	jalr	-512(ra) # 80005164 <_ZN3TCB16_thread_dispatchEv>
    }
    return 0;
    8000236c:	00000513          	li	a0,0
    80002370:	00813083          	ld	ra,8(sp)
    80002374:	00013403          	ld	s0,0(sp)
    80002378:	01010113          	addi	sp,sp,16
    8000237c:	00008067          	ret
    if (!id) return 1;
    80002380:	00100513          	li	a0,1
    80002384:	00008067          	ret

0000000080002388 <_ZN3Sem10_sem_closeEPS_>:
int Sem::_sem_close(sem_t id) {
    80002388:	fe010113          	addi	sp,sp,-32
    8000238c:	00113c23          	sd	ra,24(sp)
    80002390:	00813823          	sd	s0,16(sp)
    80002394:	00913423          	sd	s1,8(sp)
    80002398:	02010413          	addi	s0,sp,32
    8000239c:	00050493          	mv	s1,a0
    if (!id) return 1;
    800023a0:	04050a63          	beqz	a0,800023f4 <_ZN3Sem10_sem_closeEPS_+0x6c>
    800023a4:	0184a783          	lw	a5,24(s1)
    while (!id->blocked.is_empty()) {
    800023a8:	00078e63          	beqz	a5,800023c4 <_ZN3Sem10_sem_closeEPS_+0x3c>
        thread_t next = id->blocked.get();
    800023ac:	00848513          	addi	a0,s1,8
    800023b0:	00000097          	auipc	ra,0x0
    800023b4:	138080e7          	jalr	312(ra) # 800024e8 <_ZN3stm14CircularBufferIP3TCBE3getEv>
        Scheduler::put(next);
    800023b8:	00002097          	auipc	ra,0x2
    800023bc:	410080e7          	jalr	1040(ra) # 800047c8 <_ZN9Scheduler3putEP3TCB>
    while (!id->blocked.is_empty()) {
    800023c0:	fe5ff06f          	j	800023a4 <_ZN3Sem10_sem_closeEPS_+0x1c>
    id->blocked.destroy();
    800023c4:	00848513          	addi	a0,s1,8
    800023c8:	00000097          	auipc	ra,0x0
    800023cc:	16c080e7          	jalr	364(ra) # 80002534 <_ZN3stm14CircularBufferIP3TCBE7destroyEv>
    if (Allocator::_mem_free(id)) return 2;
    800023d0:	00048513          	mv	a0,s1
    800023d4:	00001097          	auipc	ra,0x1
    800023d8:	24c080e7          	jalr	588(ra) # 80003620 <_ZN9Allocator9_mem_freeEPKv>
    800023dc:	02051063          	bnez	a0,800023fc <_ZN3Sem10_sem_closeEPS_+0x74>
}
    800023e0:	01813083          	ld	ra,24(sp)
    800023e4:	01013403          	ld	s0,16(sp)
    800023e8:	00813483          	ld	s1,8(sp)
    800023ec:	02010113          	addi	sp,sp,32
    800023f0:	00008067          	ret
    if (!id) return 1;
    800023f4:	00100513          	li	a0,1
    800023f8:	fe9ff06f          	j	800023e0 <_ZN3Sem10_sem_closeEPS_+0x58>
    if (Allocator::_mem_free(id)) return 2;
    800023fc:	00200513          	li	a0,2
    80002400:	fe1ff06f          	j	800023e0 <_ZN3Sem10_sem_closeEPS_+0x58>

0000000080002404 <_ZN3Sem9_sem_waitEPS_>:
    if (!id) return 1;
    80002404:	08050663          	beqz	a0,80002490 <_ZN3Sem9_sem_waitEPS_+0x8c>
    if (id->count == 0) {
    80002408:	00052783          	lw	a5,0(a0)
    8000240c:	00078a63          	beqz	a5,80002420 <_ZN3Sem9_sem_waitEPS_+0x1c>
        id->count--;
    80002410:	fff7879b          	addiw	a5,a5,-1
    80002414:	00f52023          	sw	a5,0(a0)
    int ret = 0;
    80002418:	00000513          	li	a0,0
    8000241c:	00008067          	ret
int Sem::_sem_wait(sem_t id) {
    80002420:	fe010113          	addi	sp,sp,-32
    80002424:	00113c23          	sd	ra,24(sp)
    80002428:	00813823          	sd	s0,16(sp)
    8000242c:	00913423          	sd	s1,8(sp)
    80002430:	02010413          	addi	s0,sp,32
        TCB::running->block();
    80002434:	00008497          	auipc	s1,0x8
    80002438:	03c4b483          	ld	s1,60(s1) # 8000a470 <_GLOBAL_OFFSET_TABLE_+0x70>
    8000243c:	0004b583          	ld	a1,0(s1)

    void block() { this->status = BLOCKED; }
    80002440:	00100793          	li	a5,1
    80002444:	04f5a423          	sw	a5,72(a1)
        id->blocked.put(TCB::running);
    80002448:	00850513          	addi	a0,a0,8
    8000244c:	00000097          	auipc	ra,0x0
    80002450:	1c0080e7          	jalr	448(ra) # 8000260c <_ZN3stm14CircularBufferIP3TCBE3putES2_>
        TCB::_thread_dispatch();
    80002454:	00003097          	auipc	ra,0x3
    80002458:	d10080e7          	jalr	-752(ra) # 80005164 <_ZN3TCB16_thread_dispatchEv>
        if (TCB::running->is_blocked()) {
    8000245c:	0004b783          	ld	a5,0(s1)
    bool is_blocked() const { return this->status == BLOCKED; }
    80002460:	0487a683          	lw	a3,72(a5)
    80002464:	00100713          	li	a4,1
    80002468:	00e68e63          	beq	a3,a4,80002484 <_ZN3Sem9_sem_waitEPS_+0x80>
    int ret = 0;
    8000246c:	00000513          	li	a0,0
}
    80002470:	01813083          	ld	ra,24(sp)
    80002474:	01013403          	ld	s0,16(sp)
    80002478:	00813483          	ld	s1,8(sp)
    8000247c:	02010113          	addi	sp,sp,32
    80002480:	00008067          	ret
    void run() { this->status = RUNNABLE; }
    80002484:	0407a423          	sw	zero,72(a5)
            ret = -1;
    80002488:	fff00513          	li	a0,-1
    8000248c:	fe5ff06f          	j	80002470 <_ZN3Sem9_sem_waitEPS_+0x6c>
    if (!id) return 1;
    80002490:	00100513          	li	a0,1
}
    80002494:	00008067          	ret

0000000080002498 <_ZN3stm14CircularBufferIP3TCBE4initEv>:
        int capacity;
    };
}

template<typename T>
void stm::CircularBuffer<T>::init() {
    80002498:	fe010113          	addi	sp,sp,-32
    8000249c:	00113c23          	sd	ra,24(sp)
    800024a0:	00813823          	sd	s0,16(sp)
    800024a4:	00913423          	sd	s1,8(sp)
    800024a8:	02010413          	addi	s0,sp,32
    800024ac:	00050493          	mv	s1,a0
    this->head = 0;
    800024b0:	00052423          	sw	zero,8(a0)
    this->tail = 0;
    800024b4:	00052623          	sw	zero,12(a0)
    this->size = 0;
    800024b8:	00052823          	sw	zero,16(a0)
    this->capacity = CAPACITY;
    800024bc:	01000793          	li	a5,16
    800024c0:	00f52a23          	sw	a5,20(a0)
    this->queue = (T *) mem_alloc(sizeof(T) * CAPACITY);
    800024c4:	08000513          	li	a0,128
    800024c8:	fffff097          	auipc	ra,0xfffff
    800024cc:	fc8080e7          	jalr	-56(ra) # 80001490 <_Z9mem_allocm>
    800024d0:	00a4b023          	sd	a0,0(s1)
}
    800024d4:	01813083          	ld	ra,24(sp)
    800024d8:	01013403          	ld	s0,16(sp)
    800024dc:	00813483          	ld	s1,8(sp)
    800024e0:	02010113          	addi	sp,sp,32
    800024e4:	00008067          	ret

00000000800024e8 <_ZN3stm14CircularBufferIP3TCBE3getEv>:
    this->tail = (this->tail + 1) % this->capacity;
    this->size++;
}

template<typename T>
T stm::CircularBuffer<T>::get() {
    800024e8:	ff010113          	addi	sp,sp,-16
    800024ec:	00813423          	sd	s0,8(sp)
    800024f0:	01010413          	addi	s0,sp,16
    800024f4:	00050793          	mv	a5,a0
    T ret = this->queue[this->head];
    800024f8:	00053683          	ld	a3,0(a0)
    800024fc:	00852703          	lw	a4,8(a0)
    80002500:	00371613          	slli	a2,a4,0x3
    80002504:	00c686b3          	add	a3,a3,a2
    80002508:	0006b503          	ld	a0,0(a3)
    this->head = (this->head + 1) % this->capacity;
    8000250c:	0017071b          	addiw	a4,a4,1
    80002510:	0147a683          	lw	a3,20(a5)
    80002514:	02d7673b          	remw	a4,a4,a3
    80002518:	00e7a423          	sw	a4,8(a5)
    this->size--;
    8000251c:	0107a703          	lw	a4,16(a5)
    80002520:	fff7071b          	addiw	a4,a4,-1
    80002524:	00e7a823          	sw	a4,16(a5)
    return ret;
}
    80002528:	00813403          	ld	s0,8(sp)
    8000252c:	01010113          	addi	sp,sp,16
    80002530:	00008067          	ret

0000000080002534 <_ZN3stm14CircularBufferIP3TCBE7destroyEv>:
    this->tail = this->capacity;
    this->capacity *= 2;
}

template<typename T>
void stm::CircularBuffer<T>::destroy() {
    80002534:	ff010113          	addi	sp,sp,-16
    80002538:	00113423          	sd	ra,8(sp)
    8000253c:	00813023          	sd	s0,0(sp)
    80002540:	01010413          	addi	s0,sp,16
    mem_free(this->queue);
    80002544:	00053503          	ld	a0,0(a0)
    80002548:	fffff097          	auipc	ra,0xfffff
    8000254c:	f94080e7          	jalr	-108(ra) # 800014dc <_Z8mem_freePv>
}
    80002550:	00813083          	ld	ra,8(sp)
    80002554:	00013403          	ld	s0,0(sp)
    80002558:	01010113          	addi	sp,sp,16
    8000255c:	00008067          	ret

0000000080002560 <_ZN3stm14CircularBufferIP3TCBE6extendEv>:
void stm::CircularBuffer<T>::extend() {
    80002560:	fe010113          	addi	sp,sp,-32
    80002564:	00113c23          	sd	ra,24(sp)
    80002568:	00813823          	sd	s0,16(sp)
    8000256c:	00913423          	sd	s1,8(sp)
    80002570:	01213023          	sd	s2,0(sp)
    80002574:	02010413          	addi	s0,sp,32
    80002578:	00050493          	mv	s1,a0
    T *new_queue = (T *) mem_alloc(sizeof(T *) * this->capacity * 2);
    8000257c:	01452503          	lw	a0,20(a0)
    80002580:	00451513          	slli	a0,a0,0x4
    80002584:	fffff097          	auipc	ra,0xfffff
    80002588:	f0c080e7          	jalr	-244(ra) # 80001490 <_Z9mem_allocm>
    8000258c:	00050913          	mv	s2,a0
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    80002590:	0084a783          	lw	a5,8(s1)
    80002594:	00000713          	li	a4,0
    80002598:	0144a683          	lw	a3,20(s1)
    8000259c:	02d75a63          	bge	a4,a3,800025d0 <_ZN3stm14CircularBufferIP3TCBE6extendEv+0x70>
        new_queue[i] = this->queue[j];
    800025a0:	0004b603          	ld	a2,0(s1)
    800025a4:	00371693          	slli	a3,a4,0x3
    800025a8:	00d906b3          	add	a3,s2,a3
    800025ac:	00379593          	slli	a1,a5,0x3
    800025b0:	00b60633          	add	a2,a2,a1
    800025b4:	00063603          	ld	a2,0(a2)
    800025b8:	00c6b023          	sd	a2,0(a3)
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    800025bc:	0017071b          	addiw	a4,a4,1
    800025c0:	0017879b          	addiw	a5,a5,1
    800025c4:	0144a683          	lw	a3,20(s1)
    800025c8:	02d7e7bb          	remw	a5,a5,a3
    800025cc:	fcdff06f          	j	80002598 <_ZN3stm14CircularBufferIP3TCBE6extendEv+0x38>
    mem_free(queue);
    800025d0:	0004b503          	ld	a0,0(s1)
    800025d4:	fffff097          	auipc	ra,0xfffff
    800025d8:	f08080e7          	jalr	-248(ra) # 800014dc <_Z8mem_freePv>
    this->queue = new_queue;
    800025dc:	0124b023          	sd	s2,0(s1)
    this->head = 0;
    800025e0:	0004a423          	sw	zero,8(s1)
    this->tail = this->capacity;
    800025e4:	0144a783          	lw	a5,20(s1)
    800025e8:	00f4a623          	sw	a5,12(s1)
    this->capacity *= 2;
    800025ec:	0017979b          	slliw	a5,a5,0x1
    800025f0:	00f4aa23          	sw	a5,20(s1)
}
    800025f4:	01813083          	ld	ra,24(sp)
    800025f8:	01013403          	ld	s0,16(sp)
    800025fc:	00813483          	ld	s1,8(sp)
    80002600:	00013903          	ld	s2,0(sp)
    80002604:	02010113          	addi	sp,sp,32
    80002608:	00008067          	ret

000000008000260c <_ZN3stm14CircularBufferIP3TCBE3putES2_>:
void stm::CircularBuffer<T>::put(T element) {
    8000260c:	fe010113          	addi	sp,sp,-32
    80002610:	00113c23          	sd	ra,24(sp)
    80002614:	00813823          	sd	s0,16(sp)
    80002618:	00913423          	sd	s1,8(sp)
    8000261c:	01213023          	sd	s2,0(sp)
    80002620:	02010413          	addi	s0,sp,32
    80002624:	00050493          	mv	s1,a0
    80002628:	00058913          	mv	s2,a1
    if (this->size == this->capacity) {
    8000262c:	01052703          	lw	a4,16(a0)
    80002630:	01452783          	lw	a5,20(a0)
    80002634:	04f70863          	beq	a4,a5,80002684 <_ZN3stm14CircularBufferIP3TCBE3putES2_+0x78>
    this->queue[this->tail] = element;
    80002638:	0004b783          	ld	a5,0(s1)
    8000263c:	00c4a703          	lw	a4,12(s1)
    80002640:	00371713          	slli	a4,a4,0x3
    80002644:	00e787b3          	add	a5,a5,a4
    80002648:	0127b023          	sd	s2,0(a5)
    this->tail = (this->tail + 1) % this->capacity;
    8000264c:	00c4a783          	lw	a5,12(s1)
    80002650:	0017879b          	addiw	a5,a5,1
    80002654:	0144a703          	lw	a4,20(s1)
    80002658:	02e7e7bb          	remw	a5,a5,a4
    8000265c:	00f4a623          	sw	a5,12(s1)
    this->size++;
    80002660:	0104a783          	lw	a5,16(s1)
    80002664:	0017879b          	addiw	a5,a5,1
    80002668:	00f4a823          	sw	a5,16(s1)
}
    8000266c:	01813083          	ld	ra,24(sp)
    80002670:	01013403          	ld	s0,16(sp)
    80002674:	00813483          	ld	s1,8(sp)
    80002678:	00013903          	ld	s2,0(sp)
    8000267c:	02010113          	addi	sp,sp,32
    80002680:	00008067          	ret
        this->extend();
    80002684:	00000097          	auipc	ra,0x0
    80002688:	edc080e7          	jalr	-292(ra) # 80002560 <_ZN3stm14CircularBufferIP3TCBE6extendEv>
    8000268c:	fadff06f          	j	80002638 <_ZN3stm14CircularBufferIP3TCBE3putES2_+0x2c>

0000000080002690 <_Z5printPKc>:
    } else {
        Output.put(c);
    }
}

void print(const char *str) {
    80002690:	fe010113          	addi	sp,sp,-32
    80002694:	00113c23          	sd	ra,24(sp)
    80002698:	00813823          	sd	s0,16(sp)
    8000269c:	00913423          	sd	s1,8(sp)
    800026a0:	01213023          	sd	s2,0(sp)
    800026a4:	02010413          	addi	s0,sp,32
    800026a8:	00050913          	mv	s2,a0
    int i = 0;
    printer->wait();
    800026ac:	00008797          	auipc	a5,0x8
    800026b0:	d7c7b783          	ld	a5,-644(a5) # 8000a428 <_GLOBAL_OFFSET_TABLE_+0x28>
    800026b4:	0007b503          	ld	a0,0(a5)
    800026b8:	00053783          	ld	a5,0(a0)
    800026bc:	0107b783          	ld	a5,16(a5)
    800026c0:	000780e7          	jalr	a5
    int i = 0;
    800026c4:	00000493          	li	s1,0
    while (str[i]) {
    800026c8:	009907b3          	add	a5,s2,s1
    800026cc:	0007c503          	lbu	a0,0(a5)
    800026d0:	00050a63          	beqz	a0,800026e4 <_Z5printPKc+0x54>
        putc(str[i++]);
    800026d4:	0014849b          	addiw	s1,s1,1
    800026d8:	fffff097          	auipc	ra,0xfffff
    800026dc:	308080e7          	jalr	776(ra) # 800019e0 <_Z4putcc>
    while (str[i]) {
    800026e0:	fe9ff06f          	j	800026c8 <_Z5printPKc+0x38>
    }
    printer->signal();
    800026e4:	00008797          	auipc	a5,0x8
    800026e8:	d447b783          	ld	a5,-700(a5) # 8000a428 <_GLOBAL_OFFSET_TABLE_+0x28>
    800026ec:	0007b503          	ld	a0,0(a5)
    800026f0:	00053783          	ld	a5,0(a0)
    800026f4:	0187b783          	ld	a5,24(a5)
    800026f8:	000780e7          	jalr	a5
}
    800026fc:	01813083          	ld	ra,24(sp)
    80002700:	01013403          	ld	s0,16(sp)
    80002704:	00813483          	ld	s1,8(sp)
    80002708:	00013903          	ld	s2,0(sp)
    8000270c:	02010113          	addi	sp,sp,32
    80002710:	00008067          	ret

0000000080002714 <_Z14dramatic_printPKc>:

void dramatic_print(const char *str) {
    80002714:	fe010113          	addi	sp,sp,-32
    80002718:	00113c23          	sd	ra,24(sp)
    8000271c:	00813823          	sd	s0,16(sp)
    80002720:	00913423          	sd	s1,8(sp)
    80002724:	01213023          	sd	s2,0(sp)
    80002728:	02010413          	addi	s0,sp,32
    8000272c:	00050913          	mv	s2,a0
    int i = 0;
    printer->wait();
    80002730:	00008797          	auipc	a5,0x8
    80002734:	cf87b783          	ld	a5,-776(a5) # 8000a428 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002738:	0007b503          	ld	a0,0(a5)
    8000273c:	00053783          	ld	a5,0(a0)
    80002740:	0107b783          	ld	a5,16(a5)
    80002744:	000780e7          	jalr	a5
    int i = 0;
    80002748:	00000493          	li	s1,0
    while (str[i]) {
    8000274c:	009907b3          	add	a5,s2,s1
    80002750:	0007c503          	lbu	a0,0(a5)
    80002754:	02050063          	beqz	a0,80002774 <_Z14dramatic_printPKc+0x60>
        putc(str[i++]);
    80002758:	0014849b          	addiw	s1,s1,1
    8000275c:	fffff097          	auipc	ra,0xfffff
    80002760:	284080e7          	jalr	644(ra) # 800019e0 <_Z4putcc>
        time_sleep(1);
    80002764:	00100513          	li	a0,1
    80002768:	fffff097          	auipc	ra,0xfffff
    8000276c:	188080e7          	jalr	392(ra) # 800018f0 <_Z10time_sleepm>
    while (str[i]) {
    80002770:	fddff06f          	j	8000274c <_Z14dramatic_printPKc+0x38>
    }
    printer->signal();
    80002774:	00008797          	auipc	a5,0x8
    80002778:	cb47b783          	ld	a5,-844(a5) # 8000a428 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000277c:	0007b503          	ld	a0,0(a5)
    80002780:	00053783          	ld	a5,0(a0)
    80002784:	0187b783          	ld	a5,24(a5)
    80002788:	000780e7          	jalr	a5
}
    8000278c:	01813083          	ld	ra,24(sp)
    80002790:	01013403          	ld	s0,16(sp)
    80002794:	00813483          	ld	s1,8(sp)
    80002798:	00013903          	ld	s2,0(sp)
    8000279c:	02010113          	addi	sp,sp,32
    800027a0:	00008067          	ret

00000000800027a4 <_Z5printx>:

void print(long long number) {
    800027a4:	fd010113          	addi	sp,sp,-48
    800027a8:	02113423          	sd	ra,40(sp)
    800027ac:	02813023          	sd	s0,32(sp)
    800027b0:	03010413          	addi	s0,sp,48
    char buff[25] = {};
    800027b4:	fc043823          	sd	zero,-48(s0)
    800027b8:	fc043c23          	sd	zero,-40(s0)
    800027bc:	fe043023          	sd	zero,-32(s0)
    800027c0:	fe040423          	sb	zero,-24(s0)
    print(stm::ntos(number, buff, 10));
    800027c4:	00a00613          	li	a2,10
    800027c8:	fd040593          	addi	a1,s0,-48
    800027cc:	fffff097          	auipc	ra,0xfffff
    800027d0:	4a4080e7          	jalr	1188(ra) # 80001c70 <_ZN3stm4ntosExPci>
    800027d4:	00000097          	auipc	ra,0x0
    800027d8:	ebc080e7          	jalr	-324(ra) # 80002690 <_Z5printPKc>
}
    800027dc:	02813083          	ld	ra,40(sp)
    800027e0:	02013403          	ld	s0,32(sp)
    800027e4:	03010113          	addi	sp,sp,48
    800027e8:	00008067          	ret

00000000800027ec <_Z5printi>:

void print(int number) {
    800027ec:	ff010113          	addi	sp,sp,-16
    800027f0:	00113423          	sd	ra,8(sp)
    800027f4:	00813023          	sd	s0,0(sp)
    800027f8:	01010413          	addi	s0,sp,16
    print((long long) number);
    800027fc:	00000097          	auipc	ra,0x0
    80002800:	fa8080e7          	jalr	-88(ra) # 800027a4 <_Z5printx>
}
    80002804:	00813083          	ld	ra,8(sp)
    80002808:	00013403          	ld	s0,0(sp)
    8000280c:	01010113          	addi	sp,sp,16
    80002810:	00008067          	ret

0000000080002814 <_Z5printm>:

void print(uint64 number) {
    80002814:	fd010113          	addi	sp,sp,-48
    80002818:	02113423          	sd	ra,40(sp)
    8000281c:	02813023          	sd	s0,32(sp)
    80002820:	03010413          	addi	s0,sp,48
    char buff[25] = {};
    80002824:	fc043823          	sd	zero,-48(s0)
    80002828:	fc043c23          	sd	zero,-40(s0)
    8000282c:	fe043023          	sd	zero,-32(s0)
    80002830:	fe040423          	sb	zero,-24(s0)
    print(stm::utos(number, buff, 10));
    80002834:	00a00613          	li	a2,10
    80002838:	fd040593          	addi	a1,s0,-48
    8000283c:	fffff097          	auipc	ra,0xfffff
    80002840:	538080e7          	jalr	1336(ra) # 80001d74 <_ZN3stm4utosEmPci>
    80002844:	00000097          	auipc	ra,0x0
    80002848:	e4c080e7          	jalr	-436(ra) # 80002690 <_Z5printPKc>
}
    8000284c:	02813083          	ld	ra,40(sp)
    80002850:	02013403          	ld	s0,32(sp)
    80002854:	03010113          	addi	sp,sp,48
    80002858:	00008067          	ret

000000008000285c <_Z7print_hm>:

void print_h(uint64 number) {
    8000285c:	fd010113          	addi	sp,sp,-48
    80002860:	02113423          	sd	ra,40(sp)
    80002864:	02813023          	sd	s0,32(sp)
    80002868:	03010413          	addi	s0,sp,48
    char buff[25] = {};
    8000286c:	fc043823          	sd	zero,-48(s0)
    80002870:	fc043c23          	sd	zero,-40(s0)
    80002874:	fe043023          	sd	zero,-32(s0)
    80002878:	fe040423          	sb	zero,-24(s0)
    print(stm::utos(number, buff, 16));
    8000287c:	01000613          	li	a2,16
    80002880:	fd040593          	addi	a1,s0,-48
    80002884:	fffff097          	auipc	ra,0xfffff
    80002888:	4f0080e7          	jalr	1264(ra) # 80001d74 <_ZN3stm4utosEmPci>
    8000288c:	00000097          	auipc	ra,0x0
    80002890:	e04080e7          	jalr	-508(ra) # 80002690 <_Z5printPKc>
    80002894:	02813083          	ld	ra,40(sp)
    80002898:	02013403          	ld	s0,32(sp)
    8000289c:	03010113          	addi	sp,sp,48
    800028a0:	00008067          	ret

00000000800028a4 <_ZN8IOBuffer4initEv>:
void IOBuffer::init() {
    800028a4:	fe010113          	addi	sp,sp,-32
    800028a8:	00113c23          	sd	ra,24(sp)
    800028ac:	00813823          	sd	s0,16(sp)
    800028b0:	00913423          	sd	s1,8(sp)
    800028b4:	02010413          	addi	s0,sp,32
    800028b8:	00050493          	mv	s1,a0
    this->buffer.init();
    800028bc:	00000097          	auipc	ra,0x0
    800028c0:	1a0080e7          	jalr	416(ra) # 80002a5c <_ZN3stm14CircularBufferIcE4initEv>
    sem_open(&this->empty, 0);
    800028c4:	00000593          	li	a1,0
    800028c8:	01848513          	addi	a0,s1,24
    800028cc:	fffff097          	auipc	ra,0xfffff
    800028d0:	ea4080e7          	jalr	-348(ra) # 80001770 <_Z8sem_openPP3Semj>
}
    800028d4:	01813083          	ld	ra,24(sp)
    800028d8:	01013403          	ld	s0,16(sp)
    800028dc:	00813483          	ld	s1,8(sp)
    800028e0:	02010113          	addi	sp,sp,32
    800028e4:	00008067          	ret

00000000800028e8 <_ZN2IO4initEv>:
void IO::init() {
    800028e8:	ff010113          	addi	sp,sp,-16
    800028ec:	00113423          	sd	ra,8(sp)
    800028f0:	00813023          	sd	s0,0(sp)
    800028f4:	01010413          	addi	s0,sp,16
    Input.init();
    800028f8:	00008517          	auipc	a0,0x8
    800028fc:	be850513          	addi	a0,a0,-1048 # 8000a4e0 <_ZN2IO5InputE>
    80002900:	00000097          	auipc	ra,0x0
    80002904:	fa4080e7          	jalr	-92(ra) # 800028a4 <_ZN8IOBuffer4initEv>
    Output.init();
    80002908:	00008517          	auipc	a0,0x8
    8000290c:	bf850513          	addi	a0,a0,-1032 # 8000a500 <_ZN2IO6OutputE>
    80002910:	00000097          	auipc	ra,0x0
    80002914:	f94080e7          	jalr	-108(ra) # 800028a4 <_ZN8IOBuffer4initEv>
}
    80002918:	00813083          	ld	ra,8(sp)
    8000291c:	00013403          	ld	s0,0(sp)
    80002920:	01010113          	addi	sp,sp,16
    80002924:	00008067          	ret

0000000080002928 <_ZN8IOBuffer3getEv>:
char IOBuffer::get() {
    80002928:	fe010113          	addi	sp,sp,-32
    8000292c:	00113c23          	sd	ra,24(sp)
    80002930:	00813823          	sd	s0,16(sp)
    80002934:	00913423          	sd	s1,8(sp)
    80002938:	02010413          	addi	s0,sp,32
    8000293c:	00050493          	mv	s1,a0
    Sem::_sem_wait(this->empty);
    80002940:	01853503          	ld	a0,24(a0)
    80002944:	00000097          	auipc	ra,0x0
    80002948:	ac0080e7          	jalr	-1344(ra) # 80002404 <_ZN3Sem9_sem_waitEPS_>
    char ret = this->buffer.get();
    8000294c:	00048513          	mv	a0,s1
    80002950:	00000097          	auipc	ra,0x0
    80002954:	15c080e7          	jalr	348(ra) # 80002aac <_ZN3stm14CircularBufferIcE3getEv>
}
    80002958:	01813083          	ld	ra,24(sp)
    8000295c:	01013403          	ld	s0,16(sp)
    80002960:	00813483          	ld	s1,8(sp)
    80002964:	02010113          	addi	sp,sp,32
    80002968:	00008067          	ret

000000008000296c <_ZN2IO5_getcEv>:
char IO::_getc() {
    8000296c:	ff010113          	addi	sp,sp,-16
    80002970:	00113423          	sd	ra,8(sp)
    80002974:	00813023          	sd	s0,0(sp)
    80002978:	01010413          	addi	s0,sp,16
    return Input.get();
    8000297c:	00008517          	auipc	a0,0x8
    80002980:	b6450513          	addi	a0,a0,-1180 # 8000a4e0 <_ZN2IO5InputE>
    80002984:	00000097          	auipc	ra,0x0
    80002988:	fa4080e7          	jalr	-92(ra) # 80002928 <_ZN8IOBuffer3getEv>
}
    8000298c:	00813083          	ld	ra,8(sp)
    80002990:	00013403          	ld	s0,0(sp)
    80002994:	01010113          	addi	sp,sp,16
    80002998:	00008067          	ret

000000008000299c <_ZN8IOBuffer3putEc>:
void IOBuffer::put(char c) {
    8000299c:	fe010113          	addi	sp,sp,-32
    800029a0:	00113c23          	sd	ra,24(sp)
    800029a4:	00813823          	sd	s0,16(sp)
    800029a8:	00913423          	sd	s1,8(sp)
    800029ac:	02010413          	addi	s0,sp,32
    800029b0:	00050493          	mv	s1,a0
    this->buffer.put(c);
    800029b4:	00000097          	auipc	ra,0x0
    800029b8:	1e4080e7          	jalr	484(ra) # 80002b98 <_ZN3stm14CircularBufferIcE3putEc>
    Sem::_sem_signal(this->empty);
    800029bc:	0184b503          	ld	a0,24(s1)
    800029c0:	00000097          	auipc	ra,0x0
    800029c4:	95c080e7          	jalr	-1700(ra) # 8000231c <_ZN3Sem11_sem_signalEPS_>
}
    800029c8:	01813083          	ld	ra,24(sp)
    800029cc:	01013403          	ld	s0,16(sp)
    800029d0:	00813483          	ld	s1,8(sp)
    800029d4:	02010113          	addi	sp,sp,32
    800029d8:	00008067          	ret

00000000800029dc <_ZN2IO5_putcEc>:
void IO::_putc(char c) {
    800029dc:	fe010113          	addi	sp,sp,-32
    800029e0:	00113c23          	sd	ra,24(sp)
    800029e4:	00813823          	sd	s0,16(sp)
    800029e8:	00913423          	sd	s1,8(sp)
    800029ec:	02010413          	addi	s0,sp,32
    if (c == 127) {
    800029f0:	07f00793          	li	a5,127
    800029f4:	02f50663          	beq	a0,a5,80002a20 <_ZN2IO5_putcEc+0x44>
    800029f8:	00050593          	mv	a1,a0
        Output.put(c);
    800029fc:	00008517          	auipc	a0,0x8
    80002a00:	b0450513          	addi	a0,a0,-1276 # 8000a500 <_ZN2IO6OutputE>
    80002a04:	00000097          	auipc	ra,0x0
    80002a08:	f98080e7          	jalr	-104(ra) # 8000299c <_ZN8IOBuffer3putEc>
}
    80002a0c:	01813083          	ld	ra,24(sp)
    80002a10:	01013403          	ld	s0,16(sp)
    80002a14:	00813483          	ld	s1,8(sp)
    80002a18:	02010113          	addi	sp,sp,32
    80002a1c:	00008067          	ret
        Output.put(8);
    80002a20:	00008497          	auipc	s1,0x8
    80002a24:	ae048493          	addi	s1,s1,-1312 # 8000a500 <_ZN2IO6OutputE>
    80002a28:	00800593          	li	a1,8
    80002a2c:	00048513          	mv	a0,s1
    80002a30:	00000097          	auipc	ra,0x0
    80002a34:	f6c080e7          	jalr	-148(ra) # 8000299c <_ZN8IOBuffer3putEc>
        Output.put(' ');
    80002a38:	02000593          	li	a1,32
    80002a3c:	00048513          	mv	a0,s1
    80002a40:	00000097          	auipc	ra,0x0
    80002a44:	f5c080e7          	jalr	-164(ra) # 8000299c <_ZN8IOBuffer3putEc>
        Output.put(8);
    80002a48:	00800593          	li	a1,8
    80002a4c:	00048513          	mv	a0,s1
    80002a50:	00000097          	auipc	ra,0x0
    80002a54:	f4c080e7          	jalr	-180(ra) # 8000299c <_ZN8IOBuffer3putEc>
    80002a58:	fb5ff06f          	j	80002a0c <_ZN2IO5_putcEc+0x30>

0000000080002a5c <_ZN3stm14CircularBufferIcE4initEv>:
void stm::CircularBuffer<T>::init() {
    80002a5c:	fe010113          	addi	sp,sp,-32
    80002a60:	00113c23          	sd	ra,24(sp)
    80002a64:	00813823          	sd	s0,16(sp)
    80002a68:	00913423          	sd	s1,8(sp)
    80002a6c:	02010413          	addi	s0,sp,32
    80002a70:	00050493          	mv	s1,a0
    this->head = 0;
    80002a74:	00052423          	sw	zero,8(a0)
    this->tail = 0;
    80002a78:	00052623          	sw	zero,12(a0)
    this->size = 0;
    80002a7c:	00052823          	sw	zero,16(a0)
    this->capacity = CAPACITY;
    80002a80:	01000793          	li	a5,16
    80002a84:	00f52a23          	sw	a5,20(a0)
    this->queue = (T *) mem_alloc(sizeof(T) * CAPACITY);
    80002a88:	01000513          	li	a0,16
    80002a8c:	fffff097          	auipc	ra,0xfffff
    80002a90:	a04080e7          	jalr	-1532(ra) # 80001490 <_Z9mem_allocm>
    80002a94:	00a4b023          	sd	a0,0(s1)
}
    80002a98:	01813083          	ld	ra,24(sp)
    80002a9c:	01013403          	ld	s0,16(sp)
    80002aa0:	00813483          	ld	s1,8(sp)
    80002aa4:	02010113          	addi	sp,sp,32
    80002aa8:	00008067          	ret

0000000080002aac <_ZN3stm14CircularBufferIcE3getEv>:
T stm::CircularBuffer<T>::get() {
    80002aac:	ff010113          	addi	sp,sp,-16
    80002ab0:	00813423          	sd	s0,8(sp)
    80002ab4:	01010413          	addi	s0,sp,16
    80002ab8:	00050793          	mv	a5,a0
    T ret = this->queue[this->head];
    80002abc:	00053683          	ld	a3,0(a0)
    80002ac0:	00852703          	lw	a4,8(a0)
    80002ac4:	00e686b3          	add	a3,a3,a4
    80002ac8:	0006c503          	lbu	a0,0(a3)
    this->head = (this->head + 1) % this->capacity;
    80002acc:	0017071b          	addiw	a4,a4,1
    80002ad0:	0147a683          	lw	a3,20(a5)
    80002ad4:	02d7673b          	remw	a4,a4,a3
    80002ad8:	00e7a423          	sw	a4,8(a5)
    this->size--;
    80002adc:	0107a703          	lw	a4,16(a5)
    80002ae0:	fff7071b          	addiw	a4,a4,-1
    80002ae4:	00e7a823          	sw	a4,16(a5)
}
    80002ae8:	00813403          	ld	s0,8(sp)
    80002aec:	01010113          	addi	sp,sp,16
    80002af0:	00008067          	ret

0000000080002af4 <_ZN3stm14CircularBufferIcE6extendEv>:
void stm::CircularBuffer<T>::extend() {
    80002af4:	fe010113          	addi	sp,sp,-32
    80002af8:	00113c23          	sd	ra,24(sp)
    80002afc:	00813823          	sd	s0,16(sp)
    80002b00:	00913423          	sd	s1,8(sp)
    80002b04:	01213023          	sd	s2,0(sp)
    80002b08:	02010413          	addi	s0,sp,32
    80002b0c:	00050493          	mv	s1,a0
    T *new_queue = (T *) mem_alloc(sizeof(T *) * this->capacity * 2);
    80002b10:	01452503          	lw	a0,20(a0)
    80002b14:	00451513          	slli	a0,a0,0x4
    80002b18:	fffff097          	auipc	ra,0xfffff
    80002b1c:	978080e7          	jalr	-1672(ra) # 80001490 <_Z9mem_allocm>
    80002b20:	00050913          	mv	s2,a0
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    80002b24:	0084a783          	lw	a5,8(s1)
    80002b28:	00000713          	li	a4,0
    80002b2c:	0144a683          	lw	a3,20(s1)
    80002b30:	02d75663          	bge	a4,a3,80002b5c <_ZN3stm14CircularBufferIcE6extendEv+0x68>
        new_queue[i] = this->queue[j];
    80002b34:	0004b683          	ld	a3,0(s1)
    80002b38:	00e90633          	add	a2,s2,a4
    80002b3c:	00f686b3          	add	a3,a3,a5
    80002b40:	0006c683          	lbu	a3,0(a3)
    80002b44:	00d60023          	sb	a3,0(a2)
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    80002b48:	0017071b          	addiw	a4,a4,1
    80002b4c:	0017879b          	addiw	a5,a5,1
    80002b50:	0144a683          	lw	a3,20(s1)
    80002b54:	02d7e7bb          	remw	a5,a5,a3
    80002b58:	fd5ff06f          	j	80002b2c <_ZN3stm14CircularBufferIcE6extendEv+0x38>
    mem_free(queue);
    80002b5c:	0004b503          	ld	a0,0(s1)
    80002b60:	fffff097          	auipc	ra,0xfffff
    80002b64:	97c080e7          	jalr	-1668(ra) # 800014dc <_Z8mem_freePv>
    this->queue = new_queue;
    80002b68:	0124b023          	sd	s2,0(s1)
    this->head = 0;
    80002b6c:	0004a423          	sw	zero,8(s1)
    this->tail = this->capacity;
    80002b70:	0144a783          	lw	a5,20(s1)
    80002b74:	00f4a623          	sw	a5,12(s1)
    this->capacity *= 2;
    80002b78:	0017979b          	slliw	a5,a5,0x1
    80002b7c:	00f4aa23          	sw	a5,20(s1)
}
    80002b80:	01813083          	ld	ra,24(sp)
    80002b84:	01013403          	ld	s0,16(sp)
    80002b88:	00813483          	ld	s1,8(sp)
    80002b8c:	00013903          	ld	s2,0(sp)
    80002b90:	02010113          	addi	sp,sp,32
    80002b94:	00008067          	ret

0000000080002b98 <_ZN3stm14CircularBufferIcE3putEc>:
void stm::CircularBuffer<T>::put(T element) {
    80002b98:	fe010113          	addi	sp,sp,-32
    80002b9c:	00113c23          	sd	ra,24(sp)
    80002ba0:	00813823          	sd	s0,16(sp)
    80002ba4:	00913423          	sd	s1,8(sp)
    80002ba8:	01213023          	sd	s2,0(sp)
    80002bac:	02010413          	addi	s0,sp,32
    80002bb0:	00050493          	mv	s1,a0
    80002bb4:	00058913          	mv	s2,a1
    if (this->size == this->capacity) {
    80002bb8:	01052703          	lw	a4,16(a0)
    80002bbc:	01452783          	lw	a5,20(a0)
    80002bc0:	04f70663          	beq	a4,a5,80002c0c <_ZN3stm14CircularBufferIcE3putEc+0x74>
    this->queue[this->tail] = element;
    80002bc4:	0004b783          	ld	a5,0(s1)
    80002bc8:	00c4a703          	lw	a4,12(s1)
    80002bcc:	00e787b3          	add	a5,a5,a4
    80002bd0:	01278023          	sb	s2,0(a5)
    this->tail = (this->tail + 1) % this->capacity;
    80002bd4:	00c4a783          	lw	a5,12(s1)
    80002bd8:	0017879b          	addiw	a5,a5,1
    80002bdc:	0144a703          	lw	a4,20(s1)
    80002be0:	02e7e7bb          	remw	a5,a5,a4
    80002be4:	00f4a623          	sw	a5,12(s1)
    this->size++;
    80002be8:	0104a783          	lw	a5,16(s1)
    80002bec:	0017879b          	addiw	a5,a5,1
    80002bf0:	00f4a823          	sw	a5,16(s1)
}
    80002bf4:	01813083          	ld	ra,24(sp)
    80002bf8:	01013403          	ld	s0,16(sp)
    80002bfc:	00813483          	ld	s1,8(sp)
    80002c00:	00013903          	ld	s2,0(sp)
    80002c04:	02010113          	addi	sp,sp,32
    80002c08:	00008067          	ret
        this->extend();
    80002c0c:	00000097          	auipc	ra,0x0
    80002c10:	ee8080e7          	jalr	-280(ra) # 80002af4 <_ZN3stm14CircularBufferIcE6extendEv>
    80002c14:	fb1ff06f          	j	80002bc4 <_ZN3stm14CircularBufferIcE3putEc+0x2c>

0000000080002c18 <_ZN6Cradle4elemnwEm>:
#include "../h/scheduler.hpp"

Cradle::elem *Cradle::head = nullptr;
Cradle::elem *Cradle::tail = nullptr;

void *Cradle::elem::operator new(size_t size) {
    80002c18:	ff010113          	addi	sp,sp,-16
    80002c1c:	00113423          	sd	ra,8(sp)
    80002c20:	00813023          	sd	s0,0(sp)
    80002c24:	01010413          	addi	s0,sp,16
    return Allocator::_mem_alloc(size);
    80002c28:	00001097          	auipc	ra,0x1
    80002c2c:	93c080e7          	jalr	-1732(ra) # 80003564 <_ZN9Allocator10_mem_allocEm>
}
    80002c30:	00813083          	ld	ra,8(sp)
    80002c34:	00013403          	ld	s0,0(sp)
    80002c38:	01010113          	addi	sp,sp,16
    80002c3c:	00008067          	ret

0000000080002c40 <_ZN6Cradle4elemdlEPv>:

void Cradle::elem::operator delete(void *mem) {
    80002c40:	ff010113          	addi	sp,sp,-16
    80002c44:	00113423          	sd	ra,8(sp)
    80002c48:	00813023          	sd	s0,0(sp)
    80002c4c:	01010413          	addi	s0,sp,16
    Allocator::_mem_free(mem);
    80002c50:	00001097          	auipc	ra,0x1
    80002c54:	9d0080e7          	jalr	-1584(ra) # 80003620 <_ZN9Allocator9_mem_freeEPKv>
}
    80002c58:	00813083          	ld	ra,8(sp)
    80002c5c:	00013403          	ld	s0,0(sp)
    80002c60:	01010113          	addi	sp,sp,16
    80002c64:	00008067          	ret

0000000080002c68 <_ZN6Cradle6insertEP3TCBm>:

void Cradle::insert(TCB *thread, time_t time) {
    80002c68:	fc010113          	addi	sp,sp,-64
    80002c6c:	02113c23          	sd	ra,56(sp)
    80002c70:	02813823          	sd	s0,48(sp)
    80002c74:	02913423          	sd	s1,40(sp)
    80002c78:	03213023          	sd	s2,32(sp)
    80002c7c:	01313c23          	sd	s3,24(sp)
    80002c80:	01413823          	sd	s4,16(sp)
    80002c84:	01513423          	sd	s5,8(sp)
    80002c88:	04010413          	addi	s0,sp,64
    80002c8c:	00050a93          	mv	s5,a0
    80002c90:	00058913          	mv	s2,a1
    if (head == nullptr) {
    80002c94:	00008797          	auipc	a5,0x8
    80002c98:	88c7b783          	ld	a5,-1908(a5) # 8000a520 <_ZN6Cradle4headE>
    80002c9c:	04078263          	beqz	a5,80002ce0 <_ZN6Cradle6insertEP3TCBm+0x78>
        head = tail = new elem(thread, time);
        return;
    } else if (time < head->time_left) {
    80002ca0:	0087b703          	ld	a4,8(a5)
    80002ca4:	06e5f663          	bgeu	a1,a4,80002d10 <_ZN6Cradle6insertEP3TCBm+0xa8>
        head = new elem(thread, time, head);
    80002ca8:	01800513          	li	a0,24
    80002cac:	00000097          	auipc	ra,0x0
    80002cb0:	f6c080e7          	jalr	-148(ra) # 80002c18 <_ZN6Cradle4elemnwEm>
    80002cb4:	00008717          	auipc	a4,0x8
    80002cb8:	86c70713          	addi	a4,a4,-1940 # 8000a520 <_ZN6Cradle4headE>
    80002cbc:	00073783          	ld	a5,0(a4)
    struct elem {
        void *operator new(size_t size);

        void operator delete(void *mem);

        elem(TCB *handle, time_t time, elem *next = nullptr) : handle(handle), time_left(time), next(next) {}
    80002cc0:	01553023          	sd	s5,0(a0)
    80002cc4:	01253423          	sd	s2,8(a0)
    80002cc8:	00f53823          	sd	a5,16(a0)
    80002ccc:	00a73023          	sd	a0,0(a4)
        head->next->time_left -= time;
    80002cd0:	0087b703          	ld	a4,8(a5)
    80002cd4:	41270933          	sub	s2,a4,s2
    80002cd8:	0127b423          	sd	s2,8(a5)
        return;
    80002cdc:	0b40006f          	j	80002d90 <_ZN6Cradle6insertEP3TCBm+0x128>
        head = tail = new elem(thread, time);
    80002ce0:	01800513          	li	a0,24
    80002ce4:	00000097          	auipc	ra,0x0
    80002ce8:	f34080e7          	jalr	-204(ra) # 80002c18 <_ZN6Cradle4elemnwEm>
    80002cec:	01553023          	sd	s5,0(a0)
    80002cf0:	01253423          	sd	s2,8(a0)
    80002cf4:	00053823          	sd	zero,16(a0)
    80002cf8:	00008797          	auipc	a5,0x8
    80002cfc:	82878793          	addi	a5,a5,-2008 # 8000a520 <_ZN6Cradle4headE>
    80002d00:	00a7b423          	sd	a0,8(a5)
    80002d04:	00a7b023          	sd	a0,0(a5)
        return;
    80002d08:	0880006f          	j	80002d90 <_ZN6Cradle6insertEP3TCBm+0x128>
    }
    for (elem *curr = head; curr->next; curr = curr->next) {
        time -= curr->time_left;
    80002d0c:	00048913          	mv	s2,s1
    for (elem *curr = head; curr->next; curr = curr->next) {
    80002d10:	00078993          	mv	s3,a5
    80002d14:	0107b783          	ld	a5,16(a5)
    80002d18:	04078663          	beqz	a5,80002d64 <_ZN6Cradle6insertEP3TCBm+0xfc>
        time -= curr->time_left;
    80002d1c:	0089ba03          	ld	s4,8(s3)
    80002d20:	414904b3          	sub	s1,s2,s4
        if (time < curr->next->time_left) {
    80002d24:	0087b703          	ld	a4,8(a5)
    80002d28:	fee4f2e3          	bgeu	s1,a4,80002d0c <_ZN6Cradle6insertEP3TCBm+0xa4>
            curr->next = new elem(thread, time, curr->next);
    80002d2c:	01800513          	li	a0,24
    80002d30:	00000097          	auipc	ra,0x0
    80002d34:	ee8080e7          	jalr	-280(ra) # 80002c18 <_ZN6Cradle4elemnwEm>
    80002d38:	0109b783          	ld	a5,16(s3)
    80002d3c:	01553023          	sd	s5,0(a0)
    80002d40:	00953423          	sd	s1,8(a0)
    80002d44:	00f53823          	sd	a5,16(a0)
    80002d48:	00a9b823          	sd	a0,16(s3)
            curr->next->next->time_left -= time;
    80002d4c:	01053783          	ld	a5,16(a0)
    80002d50:	412a0933          	sub	s2,s4,s2
    80002d54:	0087ba03          	ld	s4,8(a5)
    80002d58:	012a0933          	add	s2,s4,s2
    80002d5c:	0127b423          	sd	s2,8(a5)
            return;
    80002d60:	0300006f          	j	80002d90 <_ZN6Cradle6insertEP3TCBm+0x128>
        }
    }
    tail->next = new elem(thread, time);
    80002d64:	01800513          	li	a0,24
    80002d68:	00000097          	auipc	ra,0x0
    80002d6c:	eb0080e7          	jalr	-336(ra) # 80002c18 <_ZN6Cradle4elemnwEm>
    80002d70:	01553023          	sd	s5,0(a0)
    80002d74:	01253423          	sd	s2,8(a0)
    80002d78:	00053823          	sd	zero,16(a0)
    80002d7c:	00007797          	auipc	a5,0x7
    80002d80:	7a478793          	addi	a5,a5,1956 # 8000a520 <_ZN6Cradle4headE>
    80002d84:	0087b703          	ld	a4,8(a5)
    80002d88:	00a73823          	sd	a0,16(a4)
    tail = tail->next;
    80002d8c:	00a7b423          	sd	a0,8(a5)
}
    80002d90:	03813083          	ld	ra,56(sp)
    80002d94:	03013403          	ld	s0,48(sp)
    80002d98:	02813483          	ld	s1,40(sp)
    80002d9c:	02013903          	ld	s2,32(sp)
    80002da0:	01813983          	ld	s3,24(sp)
    80002da4:	01013a03          	ld	s4,16(sp)
    80002da8:	00813a83          	ld	s5,8(sp)
    80002dac:	04010113          	addi	sp,sp,64
    80002db0:	00008067          	ret

0000000080002db4 <_ZN6Cradle6removeEv>:

TCB *Cradle::remove() {
    80002db4:	fe010113          	addi	sp,sp,-32
    80002db8:	00113c23          	sd	ra,24(sp)
    80002dbc:	00813823          	sd	s0,16(sp)
    80002dc0:	00913423          	sd	s1,8(sp)
    80002dc4:	02010413          	addi	s0,sp,32
    elem *old = head;
    80002dc8:	00007797          	auipc	a5,0x7
    80002dcc:	75878793          	addi	a5,a5,1880 # 8000a520 <_ZN6Cradle4headE>
    80002dd0:	0007b503          	ld	a0,0(a5)
    TCB *ret = old->handle;
    80002dd4:	00053483          	ld	s1,0(a0)
    head = head->next;
    80002dd8:	01053703          	ld	a4,16(a0)
    80002ddc:	00e7b023          	sd	a4,0(a5)
    delete old;
    80002de0:	00050663          	beqz	a0,80002dec <_ZN6Cradle6removeEv+0x38>
    80002de4:	00000097          	auipc	ra,0x0
    80002de8:	e5c080e7          	jalr	-420(ra) # 80002c40 <_ZN6Cradle4elemdlEPv>
    return ret;
}
    80002dec:	00048513          	mv	a0,s1
    80002df0:	01813083          	ld	ra,24(sp)
    80002df4:	01013403          	ld	s0,16(sp)
    80002df8:	00813483          	ld	s1,8(sp)
    80002dfc:	02010113          	addi	sp,sp,32
    80002e00:	00008067          	ret

0000000080002e04 <_ZN6Cradle6updateEv>:

void Cradle::update() {
    80002e04:	ff010113          	addi	sp,sp,-16
    80002e08:	00813423          	sd	s0,8(sp)
    80002e0c:	01010413          	addi	s0,sp,16
    if (!head)
    80002e10:	00007797          	auipc	a5,0x7
    80002e14:	7107b783          	ld	a5,1808(a5) # 8000a520 <_ZN6Cradle4headE>
    80002e18:	00078863          	beqz	a5,80002e28 <_ZN6Cradle6updateEv+0x24>
        return;
    head->time_left--;
    80002e1c:	0087b703          	ld	a4,8(a5)
    80002e20:	fff70713          	addi	a4,a4,-1
    80002e24:	00e7b423          	sd	a4,8(a5)
}
    80002e28:	00813403          	ld	s0,8(sp)
    80002e2c:	01010113          	addi	sp,sp,16
    80002e30:	00008067          	ret

0000000080002e34 <_ZN6Cradle4peakEv>:

int Cradle::peak() {
    80002e34:	ff010113          	addi	sp,sp,-16
    80002e38:	00813423          	sd	s0,8(sp)
    80002e3c:	01010413          	addi	s0,sp,16
    if (head)
    80002e40:	00007797          	auipc	a5,0x7
    80002e44:	6e07b783          	ld	a5,1760(a5) # 8000a520 <_ZN6Cradle4headE>
    80002e48:	00078a63          	beqz	a5,80002e5c <_ZN6Cradle4peakEv+0x28>
        return head->time_left;
    80002e4c:	0087a503          	lw	a0,8(a5)
    else
        return -1;
}
    80002e50:	00813403          	ld	s0,8(sp)
    80002e54:	01010113          	addi	sp,sp,16
    80002e58:	00008067          	ret
        return -1;
    80002e5c:	fff00513          	li	a0,-1
    80002e60:	ff1ff06f          	j	80002e50 <_ZN6Cradle4peakEv+0x1c>

0000000080002e64 <_ZN6Cradle8is_emptyEv>:

bool Cradle::is_empty() {
    80002e64:	ff010113          	addi	sp,sp,-16
    80002e68:	00813423          	sd	s0,8(sp)
    80002e6c:	01010413          	addi	s0,sp,16
    return head == nullptr;
}
    80002e70:	00007517          	auipc	a0,0x7
    80002e74:	6b053503          	ld	a0,1712(a0) # 8000a520 <_ZN6Cradle4headE>
    80002e78:	00153513          	seqz	a0,a0
    80002e7c:	00813403          	ld	s0,8(sp)
    80002e80:	01010113          	addi	sp,sp,16
    80002e84:	00008067          	ret

0000000080002e88 <_ZN6Cradle11_time_sleepEm>:

int Cradle::_time_sleep(time_t ms) {
    80002e88:	fe010113          	addi	sp,sp,-32
    80002e8c:	00113c23          	sd	ra,24(sp)
    80002e90:	00813823          	sd	s0,16(sp)
    80002e94:	00913423          	sd	s1,8(sp)
    80002e98:	02010413          	addi	s0,sp,32
    80002e9c:	00050593          	mv	a1,a0
    insert(TCB::running, ms);
    80002ea0:	00007497          	auipc	s1,0x7
    80002ea4:	5d04b483          	ld	s1,1488(s1) # 8000a470 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002ea8:	0004b503          	ld	a0,0(s1)
    80002eac:	00000097          	auipc	ra,0x0
    80002eb0:	dbc080e7          	jalr	-580(ra) # 80002c68 <_ZN6Cradle6insertEP3TCBm>
    TCB::running->sleep();
    80002eb4:	0004b783          	ld	a5,0(s1)

    void sleep() { this->status = SLEEPING; }
    80002eb8:	00200713          	li	a4,2
    80002ebc:	04e7a423          	sw	a4,72(a5)
    TCB::_thread_dispatch();
    80002ec0:	00002097          	auipc	ra,0x2
    80002ec4:	2a4080e7          	jalr	676(ra) # 80005164 <_ZN3TCB16_thread_dispatchEv>
    return 0;
}
    80002ec8:	00000513          	li	a0,0
    80002ecc:	01813083          	ld	ra,24(sp)
    80002ed0:	01013403          	ld	s0,16(sp)
    80002ed4:	00813483          	ld	s1,8(sp)
    80002ed8:	02010113          	addi	sp,sp,32
    80002edc:	00008067          	ret

0000000080002ee0 <_ZN6Cradle12_thread_wakeEP3TCB>:
    bool is_sleeping() const { return this->status == SLEEPING; }
    80002ee0:	04852703          	lw	a4,72(a0)

int Cradle::_thread_wake(thread_t thread) {
    if (!thread->is_sleeping())
    80002ee4:	00200793          	li	a5,2
    80002ee8:	02f71e63          	bne	a4,a5,80002f24 <_ZN6Cradle12_thread_wakeEP3TCB+0x44>
int Cradle::_thread_wake(thread_t thread) {
    80002eec:	ff010113          	addi	sp,sp,-16
    80002ef0:	00113423          	sd	ra,8(sp)
    80002ef4:	00813023          	sd	s0,0(sp)
    80002ef8:	01010413          	addi	s0,sp,16
    void run() { this->status = RUNNABLE; }
    80002efc:	04052423          	sw	zero,72(a0)
        return -1;
    thread->run();
    Scheduler::put(thread);
    80002f00:	00002097          	auipc	ra,0x2
    80002f04:	8c8080e7          	jalr	-1848(ra) # 800047c8 <_ZN9Scheduler3putEP3TCB>
    TCB::_thread_dispatch();
    80002f08:	00002097          	auipc	ra,0x2
    80002f0c:	25c080e7          	jalr	604(ra) # 80005164 <_ZN3TCB16_thread_dispatchEv>
    return 0;
    80002f10:	00000513          	li	a0,0
}
    80002f14:	00813083          	ld	ra,8(sp)
    80002f18:	00013403          	ld	s0,0(sp)
    80002f1c:	01010113          	addi	sp,sp,16
    80002f20:	00008067          	ret
        return -1;
    80002f24:	fff00513          	li	a0,-1
}
    80002f28:	00008067          	ret

0000000080002f2c <_Z8userMainv>:
    int time;
};

#define THRD 50

int userMain() {
    80002f2c:	e4010113          	addi	sp,sp,-448
    80002f30:	1a113c23          	sd	ra,440(sp)
    80002f34:	1a813823          	sd	s0,432(sp)
    80002f38:	1a913423          	sd	s1,424(sp)
    80002f3c:	1b213023          	sd	s2,416(sp)
    80002f40:	19313c23          	sd	s3,408(sp)
    80002f44:	1c010413          	addi	s0,sp,448
    dramatic_print("Hello There!! Welcome to my Operating System.\n");
    80002f48:	00005517          	auipc	a0,0x5
    80002f4c:	10850513          	addi	a0,a0,264 # 80008050 <CONSOLE_STATUS+0x40>
    80002f50:	fffff097          	auipc	ra,0xfffff
    80002f54:	7c4080e7          	jalr	1988(ra) # 80002714 <_Z14dramatic_printPKc>
    Thread *threads[THRD];
    for (int i = 0; i < THRD; i++) {
    80002f58:	00000913          	li	s2,0
    80002f5c:	0340006f          	j	80002f90 <_Z8userMainv+0x64>
    explicit FibonacciThread(char c) : Thread(), c(c) {}
    80002f60:	00007797          	auipc	a5,0x7
    80002f64:	37878793          	addi	a5,a5,888 # 8000a2d8 <_ZTV15FibonacciThread+0x10>
    80002f68:	00f4b023          	sd	a5,0(s1)
    80002f6c:	03348023          	sb	s3,32(s1)
        threads[i] = new FibonacciThread('A' + i);
    80002f70:	00391793          	slli	a5,s2,0x3
    80002f74:	fd040713          	addi	a4,s0,-48
    80002f78:	00f707b3          	add	a5,a4,a5
    80002f7c:	e697b823          	sd	s1,-400(a5)
        threads[i]->start();
    80002f80:	00048513          	mv	a0,s1
    80002f84:	00001097          	auipc	ra,0x1
    80002f88:	fdc080e7          	jalr	-36(ra) # 80003f60 <_ZN6Thread5startEv>
    for (int i = 0; i < THRD; i++) {
    80002f8c:	0019091b          	addiw	s2,s2,1
    80002f90:	03100793          	li	a5,49
    80002f94:	0327c463          	blt	a5,s2,80002fbc <_Z8userMainv+0x90>
        threads[i] = new FibonacciThread('A' + i);
    80002f98:	02800513          	li	a0,40
    80002f9c:	00001097          	auipc	ra,0x1
    80002fa0:	e2c080e7          	jalr	-468(ra) # 80003dc8 <_Znwm>
    80002fa4:	00050493          	mv	s1,a0
    80002fa8:	0419099b          	addiw	s3,s2,65
    80002fac:	0ff9f993          	andi	s3,s3,255
    explicit FibonacciThread(char c) : Thread(), c(c) {}
    80002fb0:	00001097          	auipc	ra,0x1
    80002fb4:	0bc080e7          	jalr	188(ra) # 8000406c <_ZN6ThreadC1Ev>
    80002fb8:	fa9ff06f          	j	80002f60 <_Z8userMainv+0x34>
    }
    for (auto & thread : threads) {
    80002fbc:	e4040493          	addi	s1,s0,-448
    80002fc0:	fd040793          	addi	a5,s0,-48
    80002fc4:	00f48c63          	beq	s1,a5,80002fdc <_Z8userMainv+0xb0>
        thread->join();
    80002fc8:	0004b503          	ld	a0,0(s1)
    80002fcc:	00001097          	auipc	ra,0x1
    80002fd0:	fcc080e7          	jalr	-52(ra) # 80003f98 <_ZN6Thread4joinEv>
    for (auto & thread : threads) {
    80002fd4:	00848493          	addi	s1,s1,8
    80002fd8:	fe9ff06f          	j	80002fc0 <_Z8userMainv+0x94>
    }
    Thread *sleeper1 = new SleeperThread(10), *sleeper2 = new SleeperThread(20), *sleeper4 = new SleeperThread(40);
    80002fdc:	02800513          	li	a0,40
    80002fe0:	00001097          	auipc	ra,0x1
    80002fe4:	de8080e7          	jalr	-536(ra) # 80003dc8 <_Znwm>
    80002fe8:	00050993          	mv	s3,a0
    explicit SleeperThread(int time) : time(time) {}
    80002fec:	00001097          	auipc	ra,0x1
    80002ff0:	080080e7          	jalr	128(ra) # 8000406c <_ZN6ThreadC1Ev>
    80002ff4:	00007797          	auipc	a5,0x7
    80002ff8:	30c78793          	addi	a5,a5,780 # 8000a300 <_ZTV13SleeperThread+0x10>
    80002ffc:	00f9b023          	sd	a5,0(s3)
    80003000:	00a00793          	li	a5,10
    80003004:	02f9a023          	sw	a5,32(s3)
    Thread *sleeper1 = new SleeperThread(10), *sleeper2 = new SleeperThread(20), *sleeper4 = new SleeperThread(40);
    80003008:	02800513          	li	a0,40
    8000300c:	00001097          	auipc	ra,0x1
    80003010:	dbc080e7          	jalr	-580(ra) # 80003dc8 <_Znwm>
    80003014:	00050913          	mv	s2,a0
    explicit SleeperThread(int time) : time(time) {}
    80003018:	00001097          	auipc	ra,0x1
    8000301c:	054080e7          	jalr	84(ra) # 8000406c <_ZN6ThreadC1Ev>
    80003020:	00007797          	auipc	a5,0x7
    80003024:	2e078793          	addi	a5,a5,736 # 8000a300 <_ZTV13SleeperThread+0x10>
    80003028:	00f93023          	sd	a5,0(s2)
    8000302c:	01400793          	li	a5,20
    80003030:	02f92023          	sw	a5,32(s2)
    Thread *sleeper1 = new SleeperThread(10), *sleeper2 = new SleeperThread(20), *sleeper4 = new SleeperThread(40);
    80003034:	02800513          	li	a0,40
    80003038:	00001097          	auipc	ra,0x1
    8000303c:	d90080e7          	jalr	-624(ra) # 80003dc8 <_Znwm>
    80003040:	00050493          	mv	s1,a0
    explicit SleeperThread(int time) : time(time) {}
    80003044:	00001097          	auipc	ra,0x1
    80003048:	028080e7          	jalr	40(ra) # 8000406c <_ZN6ThreadC1Ev>
    8000304c:	0740006f          	j	800030c0 <_Z8userMainv+0x194>
    80003050:	00050913          	mv	s2,a0
        threads[i] = new FibonacciThread('A' + i);
    80003054:	00048513          	mv	a0,s1
    80003058:	00001097          	auipc	ra,0x1
    8000305c:	dc0080e7          	jalr	-576(ra) # 80003e18 <_ZdlPv>
    80003060:	00090513          	mv	a0,s2
    80003064:	00008097          	auipc	ra,0x8
    80003068:	614080e7          	jalr	1556(ra) # 8000b678 <_Unwind_Resume>
    8000306c:	00050493          	mv	s1,a0
    Thread *sleeper1 = new SleeperThread(10), *sleeper2 = new SleeperThread(20), *sleeper4 = new SleeperThread(40);
    80003070:	00098513          	mv	a0,s3
    80003074:	00001097          	auipc	ra,0x1
    80003078:	da4080e7          	jalr	-604(ra) # 80003e18 <_ZdlPv>
    8000307c:	00048513          	mv	a0,s1
    80003080:	00008097          	auipc	ra,0x8
    80003084:	5f8080e7          	jalr	1528(ra) # 8000b678 <_Unwind_Resume>
    80003088:	00050493          	mv	s1,a0
    8000308c:	00090513          	mv	a0,s2
    80003090:	00001097          	auipc	ra,0x1
    80003094:	d88080e7          	jalr	-632(ra) # 80003e18 <_ZdlPv>
    80003098:	00048513          	mv	a0,s1
    8000309c:	00008097          	auipc	ra,0x8
    800030a0:	5dc080e7          	jalr	1500(ra) # 8000b678 <_Unwind_Resume>
    800030a4:	00050913          	mv	s2,a0
    800030a8:	00048513          	mv	a0,s1
    800030ac:	00001097          	auipc	ra,0x1
    800030b0:	d6c080e7          	jalr	-660(ra) # 80003e18 <_ZdlPv>
    800030b4:	00090513          	mv	a0,s2
    800030b8:	00008097          	auipc	ra,0x8
    800030bc:	5c0080e7          	jalr	1472(ra) # 8000b678 <_Unwind_Resume>
    explicit SleeperThread(int time) : time(time) {}
    800030c0:	00007797          	auipc	a5,0x7
    800030c4:	24078793          	addi	a5,a5,576 # 8000a300 <_ZTV13SleeperThread+0x10>
    800030c8:	00f4b023          	sd	a5,0(s1)
    800030cc:	02800793          	li	a5,40
    800030d0:	02f4a023          	sw	a5,32(s1)
    sleeper1->start();
    800030d4:	00098513          	mv	a0,s3
    800030d8:	00001097          	auipc	ra,0x1
    800030dc:	e88080e7          	jalr	-376(ra) # 80003f60 <_ZN6Thread5startEv>
    sleeper2->start();
    800030e0:	00090513          	mv	a0,s2
    800030e4:	00001097          	auipc	ra,0x1
    800030e8:	e7c080e7          	jalr	-388(ra) # 80003f60 <_ZN6Thread5startEv>
    sleeper4->start();
    800030ec:	00048513          	mv	a0,s1
    800030f0:	00001097          	auipc	ra,0x1
    800030f4:	e70080e7          	jalr	-400(ra) # 80003f60 <_ZN6Thread5startEv>
    sleeper1->join();
    800030f8:	00098513          	mv	a0,s3
    800030fc:	00001097          	auipc	ra,0x1
    80003100:	e9c080e7          	jalr	-356(ra) # 80003f98 <_ZN6Thread4joinEv>
    sleeper2->join();
    80003104:	00090513          	mv	a0,s2
    80003108:	00001097          	auipc	ra,0x1
    8000310c:	e90080e7          	jalr	-368(ra) # 80003f98 <_ZN6Thread4joinEv>
    sleeper4->join();
    80003110:	00048513          	mv	a0,s1
    80003114:	00001097          	auipc	ra,0x1
    80003118:	e84080e7          	jalr	-380(ra) # 80003f98 <_ZN6Thread4joinEv>
    return 0;
    8000311c:	00000513          	li	a0,0
    80003120:	1b813083          	ld	ra,440(sp)
    80003124:	1b013403          	ld	s0,432(sp)
    80003128:	1a813483          	ld	s1,424(sp)
    8000312c:	1a013903          	ld	s2,416(sp)
    80003130:	19813983          	ld	s3,408(sp)
    80003134:	1c010113          	addi	sp,sp,448
    80003138:	00008067          	ret

000000008000313c <_ZN15FibonacciThreadD1Ev>:
class FibonacciThread : public Thread {
    8000313c:	ff010113          	addi	sp,sp,-16
    80003140:	00113423          	sd	ra,8(sp)
    80003144:	00813023          	sd	s0,0(sp)
    80003148:	01010413          	addi	s0,sp,16
    8000314c:	00007797          	auipc	a5,0x7
    80003150:	18c78793          	addi	a5,a5,396 # 8000a2d8 <_ZTV15FibonacciThread+0x10>
    80003154:	00f53023          	sd	a5,0(a0)
    80003158:	00001097          	auipc	ra,0x1
    8000315c:	ce8080e7          	jalr	-792(ra) # 80003e40 <_ZN6ThreadD1Ev>
    80003160:	00813083          	ld	ra,8(sp)
    80003164:	00013403          	ld	s0,0(sp)
    80003168:	01010113          	addi	sp,sp,16
    8000316c:	00008067          	ret

0000000080003170 <_ZN15FibonacciThreadD0Ev>:
    80003170:	fe010113          	addi	sp,sp,-32
    80003174:	00113c23          	sd	ra,24(sp)
    80003178:	00813823          	sd	s0,16(sp)
    8000317c:	00913423          	sd	s1,8(sp)
    80003180:	02010413          	addi	s0,sp,32
    80003184:	00050493          	mv	s1,a0
    80003188:	00007797          	auipc	a5,0x7
    8000318c:	15078793          	addi	a5,a5,336 # 8000a2d8 <_ZTV15FibonacciThread+0x10>
    80003190:	00f53023          	sd	a5,0(a0)
    80003194:	00001097          	auipc	ra,0x1
    80003198:	cac080e7          	jalr	-852(ra) # 80003e40 <_ZN6ThreadD1Ev>
    8000319c:	00048513          	mv	a0,s1
    800031a0:	00001097          	auipc	ra,0x1
    800031a4:	c78080e7          	jalr	-904(ra) # 80003e18 <_ZdlPv>
    800031a8:	01813083          	ld	ra,24(sp)
    800031ac:	01013403          	ld	s0,16(sp)
    800031b0:	00813483          	ld	s1,8(sp)
    800031b4:	02010113          	addi	sp,sp,32
    800031b8:	00008067          	ret

00000000800031bc <_ZN13SleeperThreadD1Ev>:
class SleeperThread : public Thread {
    800031bc:	ff010113          	addi	sp,sp,-16
    800031c0:	00113423          	sd	ra,8(sp)
    800031c4:	00813023          	sd	s0,0(sp)
    800031c8:	01010413          	addi	s0,sp,16
    800031cc:	00007797          	auipc	a5,0x7
    800031d0:	13478793          	addi	a5,a5,308 # 8000a300 <_ZTV13SleeperThread+0x10>
    800031d4:	00f53023          	sd	a5,0(a0)
    800031d8:	00001097          	auipc	ra,0x1
    800031dc:	c68080e7          	jalr	-920(ra) # 80003e40 <_ZN6ThreadD1Ev>
    800031e0:	00813083          	ld	ra,8(sp)
    800031e4:	00013403          	ld	s0,0(sp)
    800031e8:	01010113          	addi	sp,sp,16
    800031ec:	00008067          	ret

00000000800031f0 <_ZN13SleeperThreadD0Ev>:
    800031f0:	fe010113          	addi	sp,sp,-32
    800031f4:	00113c23          	sd	ra,24(sp)
    800031f8:	00813823          	sd	s0,16(sp)
    800031fc:	00913423          	sd	s1,8(sp)
    80003200:	02010413          	addi	s0,sp,32
    80003204:	00050493          	mv	s1,a0
    80003208:	00007797          	auipc	a5,0x7
    8000320c:	0f878793          	addi	a5,a5,248 # 8000a300 <_ZTV13SleeperThread+0x10>
    80003210:	00f53023          	sd	a5,0(a0)
    80003214:	00001097          	auipc	ra,0x1
    80003218:	c2c080e7          	jalr	-980(ra) # 80003e40 <_ZN6ThreadD1Ev>
    8000321c:	00048513          	mv	a0,s1
    80003220:	00001097          	auipc	ra,0x1
    80003224:	bf8080e7          	jalr	-1032(ra) # 80003e18 <_ZdlPv>
    80003228:	01813083          	ld	ra,24(sp)
    8000322c:	01013403          	ld	s0,16(sp)
    80003230:	00813483          	ld	s1,8(sp)
    80003234:	02010113          	addi	sp,sp,32
    80003238:	00008067          	ret

000000008000323c <_ZN13SleeperThread3runEv>:
    void run() override {
    8000323c:	fe010113          	addi	sp,sp,-32
    80003240:	00113c23          	sd	ra,24(sp)
    80003244:	00813823          	sd	s0,16(sp)
    80003248:	00913423          	sd	s1,8(sp)
    8000324c:	01213023          	sd	s2,0(sp)
    80003250:	02010413          	addi	s0,sp,32
    80003254:	00050913          	mv	s2,a0
        for (int i = 0; i < 200 / time; i++) {
    80003258:	00000493          	li	s1,0
    8000325c:	02092503          	lw	a0,32(s2)
    80003260:	0c800793          	li	a5,200
    80003264:	02a7c7bb          	divw	a5,a5,a0
    80003268:	06f4d063          	bge	s1,a5,800032c8 <_ZN13SleeperThread3runEv+0x8c>
            Thread::sleep(time);
    8000326c:	00001097          	auipc	ra,0x1
    80003270:	dd8080e7          	jalr	-552(ra) # 80004044 <_ZN6Thread5sleepEm>
            cout << "Hello thread " << time / 10 << "s!" <<  endl;
    80003274:	00005597          	auipc	a1,0x5
    80003278:	dc458593          	addi	a1,a1,-572 # 80008038 <CONSOLE_STATUS+0x28>
    8000327c:	00007517          	auipc	a0,0x7
    80003280:	21453503          	ld	a0,532(a0) # 8000a490 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003284:	00000097          	auipc	ra,0x0
    80003288:	62c080e7          	jalr	1580(ra) # 800038b0 <_ZNK3stm7istreamlsEPKc>
    8000328c:	02092583          	lw	a1,32(s2)
    80003290:	00a00793          	li	a5,10
    80003294:	02f5c5bb          	divw	a1,a1,a5
    80003298:	00000097          	auipc	ra,0x0
    8000329c:	6cc080e7          	jalr	1740(ra) # 80003964 <_ZNK3stm7istreamlsEi>
    800032a0:	00005597          	auipc	a1,0x5
    800032a4:	da858593          	addi	a1,a1,-600 # 80008048 <CONSOLE_STATUS+0x38>
    800032a8:	00000097          	auipc	ra,0x0
    800032ac:	608080e7          	jalr	1544(ra) # 800038b0 <_ZNK3stm7istreamlsEPKc>
    800032b0:	00007597          	auipc	a1,0x7
    800032b4:	1b05b583          	ld	a1,432(a1) # 8000a460 <_GLOBAL_OFFSET_TABLE_+0x60>
    800032b8:	00000097          	auipc	ra,0x0
    800032bc:	7b0080e7          	jalr	1968(ra) # 80003a68 <_ZNK3stm7istreamlsERKNS_7endlineE>
        for (int i = 0; i < 200 / time; i++) {
    800032c0:	0014849b          	addiw	s1,s1,1
    800032c4:	f99ff06f          	j	8000325c <_ZN13SleeperThread3runEv+0x20>
    }
    800032c8:	01813083          	ld	ra,24(sp)
    800032cc:	01013403          	ld	s0,16(sp)
    800032d0:	00813483          	ld	s1,8(sp)
    800032d4:	00013903          	ld	s2,0(sp)
    800032d8:	02010113          	addi	sp,sp,32
    800032dc:	00008067          	ret

00000000800032e0 <_ZN15FibonacciThread9fibonacciEi>:
    int fibonacci(int i) {
    800032e0:	fe010113          	addi	sp,sp,-32
    800032e4:	00113c23          	sd	ra,24(sp)
    800032e8:	00813823          	sd	s0,16(sp)
    800032ec:	00913423          	sd	s1,8(sp)
    800032f0:	02010413          	addi	s0,sp,32
        if (i < 0) return -1;
    800032f4:	0205cc63          	bltz	a1,8000332c <_ZN15FibonacciThread9fibonacciEi+0x4c>
    800032f8:	00058493          	mv	s1,a1
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    800032fc:	00059e63          	bnez	a1,80003318 <_ZN15FibonacciThread9fibonacciEi+0x38>
    }
    80003300:	00048513          	mv	a0,s1
    80003304:	01813083          	ld	ra,24(sp)
    80003308:	01013403          	ld	s0,16(sp)
    8000330c:	00813483          	ld	s1,8(sp)
    80003310:	02010113          	addi	sp,sp,32
    80003314:	00008067          	ret
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003318:	fff5859b          	addiw	a1,a1,-1
    8000331c:	00000097          	auipc	ra,0x0
    80003320:	fc4080e7          	jalr	-60(ra) # 800032e0 <_ZN15FibonacciThread9fibonacciEi>
    80003324:	00a484bb          	addw	s1,s1,a0
    80003328:	fd9ff06f          	j	80003300 <_ZN15FibonacciThread9fibonacciEi+0x20>
        if (i < 0) return -1;
    8000332c:	fff00493          	li	s1,-1
    80003330:	fd1ff06f          	j	80003300 <_ZN15FibonacciThread9fibonacciEi+0x20>

0000000080003334 <_ZN15FibonacciThread3runEv>:
    void run() override {
    80003334:	fb010113          	addi	sp,sp,-80
    80003338:	04113423          	sd	ra,72(sp)
    8000333c:	04813023          	sd	s0,64(sp)
    80003340:	02913c23          	sd	s1,56(sp)
    80003344:	03213823          	sd	s2,48(sp)
    80003348:	03313423          	sd	s3,40(sp)
    8000334c:	03413023          	sd	s4,32(sp)
    80003350:	01513c23          	sd	s5,24(sp)
    80003354:	01613823          	sd	s6,16(sp)
    80003358:	01713423          	sd	s7,8(sp)
    8000335c:	01813023          	sd	s8,0(sp)
    80003360:	05010413          	addi	s0,sp,80
    80003364:	00050493          	mv	s1,a0
        for (int i = 0; i < 10; i++) {
    80003368:	00000913          	li	s2,0
    8000336c:	0140006f          	j	80003380 <_ZN15FibonacciThread3runEv+0x4c>
            putc(c);
    80003370:	0204c503          	lbu	a0,32(s1)
    80003374:	ffffe097          	auipc	ra,0xffffe
    80003378:	66c080e7          	jalr	1644(ra) # 800019e0 <_Z4putcc>
        for (int i = 0; i < 10; i++) {
    8000337c:	0019091b          	addiw	s2,s2,1
    80003380:	00900793          	li	a5,9
    80003384:	0127ce63          	blt	a5,s2,800033a0 <_ZN15FibonacciThread3runEv+0x6c>
            for (int i = 0; i < 10000000; i++);
    80003388:	00000713          	li	a4,0
    8000338c:	009897b7          	lui	a5,0x989
    80003390:	67f78793          	addi	a5,a5,1663 # 98967f <_entry-0x7f676981>
    80003394:	fce7cee3          	blt	a5,a4,80003370 <_ZN15FibonacciThread3runEv+0x3c>
    80003398:	0017071b          	addiw	a4,a4,1
    8000339c:	ff1ff06f          	j	8000338c <_ZN15FibonacciThread3runEv+0x58>
        for (int i = 0; i < 10000000; i++);
    800033a0:	00000713          	li	a4,0
    800033a4:	009897b7          	lui	a5,0x989
    800033a8:	67f78793          	addi	a5,a5,1663 # 98967f <_entry-0x7f676981>
    800033ac:	00e7c663          	blt	a5,a4,800033b8 <_ZN15FibonacciThread3runEv+0x84>
    800033b0:	0017071b          	addiw	a4,a4,1
    800033b4:	ff1ff06f          	j	800033a4 <_ZN15FibonacciThread3runEv+0x70>
        for (int i = 0; i < 10000000; i++);
    800033b8:	00000713          	li	a4,0
    800033bc:	009897b7          	lui	a5,0x989
    800033c0:	67f78793          	addi	a5,a5,1663 # 98967f <_entry-0x7f676981>
    800033c4:	00e7c663          	blt	a5,a4,800033d0 <_ZN15FibonacciThread3runEv+0x9c>
    800033c8:	0017071b          	addiw	a4,a4,1
    800033cc:	ff1ff06f          	j	800033bc <_ZN15FibonacciThread3runEv+0x88>
        cout << fibonacci(static_cast<int>(c)) << endl;
    800033d0:	0204c903          	lbu	s2,32(s1)
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    800033d4:	04091c63          	bnez	s2,8000342c <_ZN15FibonacciThread3runEv+0xf8>
        cout << fibonacci(static_cast<int>(c)) << endl;
    800033d8:	00090593          	mv	a1,s2
    800033dc:	00007517          	auipc	a0,0x7
    800033e0:	0b453503          	ld	a0,180(a0) # 8000a490 <_GLOBAL_OFFSET_TABLE_+0x90>
    800033e4:	00000097          	auipc	ra,0x0
    800033e8:	580080e7          	jalr	1408(ra) # 80003964 <_ZNK3stm7istreamlsEi>
    800033ec:	00007597          	auipc	a1,0x7
    800033f0:	0745b583          	ld	a1,116(a1) # 8000a460 <_GLOBAL_OFFSET_TABLE_+0x60>
    800033f4:	00000097          	auipc	ra,0x0
    800033f8:	674080e7          	jalr	1652(ra) # 80003a68 <_ZNK3stm7istreamlsERKNS_7endlineE>
    }
    800033fc:	04813083          	ld	ra,72(sp)
    80003400:	04013403          	ld	s0,64(sp)
    80003404:	03813483          	ld	s1,56(sp)
    80003408:	03013903          	ld	s2,48(sp)
    8000340c:	02813983          	ld	s3,40(sp)
    80003410:	02013a03          	ld	s4,32(sp)
    80003414:	01813a83          	ld	s5,24(sp)
    80003418:	01013b03          	ld	s6,16(sp)
    8000341c:	00813b83          	ld	s7,8(sp)
    80003420:	00013c03          	ld	s8,0(sp)
    80003424:	05010113          	addi	sp,sp,80
    80003428:	00008067          	ret
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    8000342c:	fff9099b          	addiw	s3,s2,-1
    80003430:	0009879b          	sext.w	a5,s3
        if (i < 0) return -1;
    80003434:	02099713          	slli	a4,s3,0x20
    80003438:	0c074e63          	bltz	a4,80003514 <_ZN15FibonacciThread3runEv+0x1e0>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    8000343c:	00079663          	bnez	a5,80003448 <_ZN15FibonacciThread3runEv+0x114>
    80003440:	00f9093b          	addw	s2,s2,a5
    80003444:	f95ff06f          	j	800033d8 <_ZN15FibonacciThread3runEv+0xa4>
    80003448:	fff98a1b          	addiw	s4,s3,-1
    8000344c:	000a079b          	sext.w	a5,s4
        if (i < 0) return -1;
    80003450:	020a1713          	slli	a4,s4,0x20
    80003454:	0a074c63          	bltz	a4,8000350c <_ZN15FibonacciThread3runEv+0x1d8>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003458:	00079663          	bnez	a5,80003464 <_ZN15FibonacciThread3runEv+0x130>
    8000345c:	00f987bb          	addw	a5,s3,a5
    80003460:	fe1ff06f          	j	80003440 <_ZN15FibonacciThread3runEv+0x10c>
    80003464:	fffa0a9b          	addiw	s5,s4,-1
    80003468:	000a879b          	sext.w	a5,s5
        if (i < 0) return -1;
    8000346c:	020a9713          	slli	a4,s5,0x20
    80003470:	08074a63          	bltz	a4,80003504 <_ZN15FibonacciThread3runEv+0x1d0>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003474:	00079663          	bnez	a5,80003480 <_ZN15FibonacciThread3runEv+0x14c>
    80003478:	00fa07bb          	addw	a5,s4,a5
    8000347c:	fe1ff06f          	j	8000345c <_ZN15FibonacciThread3runEv+0x128>
    80003480:	fffa8b1b          	addiw	s6,s5,-1
    80003484:	000b079b          	sext.w	a5,s6
        if (i < 0) return -1;
    80003488:	020b1713          	slli	a4,s6,0x20
    8000348c:	06074863          	bltz	a4,800034fc <_ZN15FibonacciThread3runEv+0x1c8>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003490:	00079663          	bnez	a5,8000349c <_ZN15FibonacciThread3runEv+0x168>
    80003494:	00fa87bb          	addw	a5,s5,a5
    80003498:	fe1ff06f          	j	80003478 <_ZN15FibonacciThread3runEv+0x144>
    8000349c:	fffb0b9b          	addiw	s7,s6,-1
    800034a0:	000b879b          	sext.w	a5,s7
        if (i < 0) return -1;
    800034a4:	020b9713          	slli	a4,s7,0x20
    800034a8:	04074663          	bltz	a4,800034f4 <_ZN15FibonacciThread3runEv+0x1c0>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    800034ac:	00079663          	bnez	a5,800034b8 <_ZN15FibonacciThread3runEv+0x184>
    800034b0:	00fb07bb          	addw	a5,s6,a5
    800034b4:	fe1ff06f          	j	80003494 <_ZN15FibonacciThread3runEv+0x160>
    800034b8:	fffb8c1b          	addiw	s8,s7,-1
    800034bc:	000c079b          	sext.w	a5,s8
        if (i < 0) return -1;
    800034c0:	020c1713          	slli	a4,s8,0x20
    800034c4:	02074463          	bltz	a4,800034ec <_ZN15FibonacciThread3runEv+0x1b8>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    800034c8:	00079663          	bnez	a5,800034d4 <_ZN15FibonacciThread3runEv+0x1a0>
    800034cc:	00fb87bb          	addw	a5,s7,a5
    800034d0:	fe1ff06f          	j	800034b0 <_ZN15FibonacciThread3runEv+0x17c>
    800034d4:	fffc059b          	addiw	a1,s8,-1
    800034d8:	00048513          	mv	a0,s1
    800034dc:	00000097          	auipc	ra,0x0
    800034e0:	e04080e7          	jalr	-508(ra) # 800032e0 <_ZN15FibonacciThread9fibonacciEi>
    800034e4:	00ac07bb          	addw	a5,s8,a0
    800034e8:	fe5ff06f          	j	800034cc <_ZN15FibonacciThread3runEv+0x198>
        if (i < 0) return -1;
    800034ec:	fff00793          	li	a5,-1
    800034f0:	fddff06f          	j	800034cc <_ZN15FibonacciThread3runEv+0x198>
    800034f4:	fff00793          	li	a5,-1
    800034f8:	fb9ff06f          	j	800034b0 <_ZN15FibonacciThread3runEv+0x17c>
    800034fc:	fff00793          	li	a5,-1
    80003500:	f95ff06f          	j	80003494 <_ZN15FibonacciThread3runEv+0x160>
    80003504:	fff00793          	li	a5,-1
    80003508:	f71ff06f          	j	80003478 <_ZN15FibonacciThread3runEv+0x144>
    8000350c:	fff00793          	li	a5,-1
    80003510:	f4dff06f          	j	8000345c <_ZN15FibonacciThread3runEv+0x128>
    80003514:	fff00793          	li	a5,-1
    80003518:	f29ff06f          	j	80003440 <_ZN15FibonacciThread3runEv+0x10c>

000000008000351c <_ZN9Allocator8mem_initEv>:
#include "../h/c_memory.hpp"
#include "../h/iostream.hpp"

Allocator::MemoryBlock *Allocator::free_pointer = nullptr;

void Allocator::mem_init() {
    8000351c:	ff010113          	addi	sp,sp,-16
    80003520:	00813423          	sd	s0,8(sp)
    80003524:	01010413          	addi	s0,sp,16
    Allocator::free_pointer = (Allocator::MemoryBlock *) HEAP_START_ADDR;
    80003528:	00007797          	auipc	a5,0x7
    8000352c:	f087b783          	ld	a5,-248(a5) # 8000a430 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003530:	0007b703          	ld	a4,0(a5)
    80003534:	00007797          	auipc	a5,0x7
    80003538:	fee7be23          	sd	a4,-4(a5) # 8000a530 <_ZN9Allocator12free_pointerE>
    *Allocator::free_pointer = {nullptr, reinterpret_cast<uint64>(HEAP_END_ADDR) -
    8000353c:	00007797          	auipc	a5,0x7
    80003540:	f3c7b783          	ld	a5,-196(a5) # 8000a478 <_GLOBAL_OFFSET_TABLE_+0x78>
    80003544:	0007b783          	ld	a5,0(a5)
    80003548:	40e787b3          	sub	a5,a5,a4
                                         reinterpret_cast<uint64>(HEAP_START_ADDR) - Allocator::HEADER_SIZE};
    8000354c:	ff078793          	addi	a5,a5,-16
    *Allocator::free_pointer = {nullptr, reinterpret_cast<uint64>(HEAP_END_ADDR) -
    80003550:	00073023          	sd	zero,0(a4)
    80003554:	00f73423          	sd	a5,8(a4)
}
    80003558:	00813403          	ld	s0,8(sp)
    8000355c:	01010113          	addi	sp,sp,16
    80003560:	00008067          	ret

0000000080003564 <_ZN9Allocator10_mem_allocEm>:

void *Allocator::_mem_alloc(size_t size) {
    80003564:	ff010113          	addi	sp,sp,-16
    80003568:	00813423          	sd	s0,8(sp)
    8000356c:	01010413          	addi	s0,sp,16
    80003570:	00050793          	mv	a5,a0
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    80003574:	00007517          	auipc	a0,0x7
    80003578:	fbc53503          	ld	a0,-68(a0) # 8000a530 <_ZN9Allocator12free_pointerE>
    if (available && available->size < size) {
    8000357c:	02050863          	beqz	a0,800035ac <_ZN9Allocator10_mem_allocEm+0x48>
    80003580:	00853703          	ld	a4,8(a0)
    80003584:	02f77863          	bgeu	a4,a5,800035b4 <_ZN9Allocator10_mem_allocEm+0x50>
        for (previous = available, available = available->next; available && available->size < size;
    80003588:	00050693          	mv	a3,a0
    8000358c:	00053503          	ld	a0,0(a0)
    80003590:	00c0006f          	j	8000359c <_ZN9Allocator10_mem_allocEm+0x38>
             previous = available, available = available->next);
    80003594:	00050693          	mv	a3,a0
    80003598:	00053503          	ld	a0,0(a0)
        for (previous = available, available = available->next; available && available->size < size;
    8000359c:	00050e63          	beqz	a0,800035b8 <_ZN9Allocator10_mem_allocEm+0x54>
    800035a0:	00853703          	ld	a4,8(a0)
    800035a4:	fef768e3          	bltu	a4,a5,80003594 <_ZN9Allocator10_mem_allocEm+0x30>
    800035a8:	0100006f          	j	800035b8 <_ZN9Allocator10_mem_allocEm+0x54>
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    800035ac:	00050693          	mv	a3,a0
    800035b0:	0080006f          	j	800035b8 <_ZN9Allocator10_mem_allocEm+0x54>
    800035b4:	00000693          	li	a3,0
    }
    if (!available) return nullptr;
    800035b8:	04050463          	beqz	a0,80003600 <_ZN9Allocator10_mem_allocEm+0x9c>
    if (available->size > Allocator::HEADER_SIZE + size) {
    800035bc:	00853703          	ld	a4,8(a0)
    800035c0:	01078613          	addi	a2,a5,16
    800035c4:	04e67463          	bgeu	a2,a4,8000360c <_ZN9Allocator10_mem_allocEm+0xa8>
        uint64 next_size = available->size - size - Allocator::HEADER_SIZE;
    800035c8:	40f70733          	sub	a4,a4,a5
    800035cc:	ff070713          	addi	a4,a4,-16
        available->size = size;
    800035d0:	00f53423          	sd	a5,8(a0)
        next_node = reinterpret_cast<Allocator::MemoryBlock *>(reinterpret_cast<uint64>(available) +
                                                               Allocator::HEADER_SIZE + size);
    800035d4:	00f507b3          	add	a5,a0,a5
    800035d8:	01078613          	addi	a2,a5,16
        next_node->next = available->next;
    800035dc:	00053583          	ld	a1,0(a0)
    800035e0:	00b7b823          	sd	a1,16(a5)
        next_node->size = next_size;
    800035e4:	00e63423          	sd	a4,8(a2)
    } else {
        next_node = available->next;
    }
    available->next = reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(available) ^ available->size);
    800035e8:	00853783          	ld	a5,8(a0)
    800035ec:	00f547b3          	xor	a5,a0,a5
    800035f0:	00f53023          	sd	a5,0(a0)
    if (previous) previous->next = next_node;
    800035f4:	02068063          	beqz	a3,80003614 <_ZN9Allocator10_mem_allocEm+0xb0>
    800035f8:	00c6b023          	sd	a2,0(a3)
    else Allocator::free_pointer = next_node;
    return (void *) (available + 1);
    800035fc:	01050513          	addi	a0,a0,16
}
    80003600:	00813403          	ld	s0,8(sp)
    80003604:	01010113          	addi	sp,sp,16
    80003608:	00008067          	ret
        next_node = available->next;
    8000360c:	00053603          	ld	a2,0(a0)
    80003610:	fd9ff06f          	j	800035e8 <_ZN9Allocator10_mem_allocEm+0x84>
    else Allocator::free_pointer = next_node;
    80003614:	00007797          	auipc	a5,0x7
    80003618:	f0c7be23          	sd	a2,-228(a5) # 8000a530 <_ZN9Allocator12free_pointerE>
    8000361c:	fe1ff06f          	j	800035fc <_ZN9Allocator10_mem_allocEm+0x98>

0000000080003620 <_ZN9Allocator9_mem_freeEPKv>:

int Allocator::_mem_free(const void *pointer) {
    80003620:	ff010113          	addi	sp,sp,-16
    80003624:	00813423          	sd	s0,8(sp)
    80003628:	01010413          	addi	s0,sp,16
    Allocator::MemoryBlock *freed = (Allocator::MemoryBlock *) pointer - 1;
    8000362c:	ff050693          	addi	a3,a0,-16
    if (freed < HEAP_START_ADDR) return -1;
    80003630:	00007797          	auipc	a5,0x7
    80003634:	e007b783          	ld	a5,-512(a5) # 8000a430 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003638:	0007b783          	ld	a5,0(a5)
    8000363c:	0cf6ec63          	bltu	a3,a5,80003714 <_ZN9Allocator9_mem_freeEPKv+0xf4>
    if (freed->next != reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(freed) ^ freed->size)) return -2;
    80003640:	ff053703          	ld	a4,-16(a0)
    80003644:	ff853783          	ld	a5,-8(a0)
    80003648:	00068813          	mv	a6,a3
    8000364c:	00d7c7b3          	xor	a5,a5,a3
    80003650:	0cf71663          	bne	a4,a5,8000371c <_ZN9Allocator9_mem_freeEPKv+0xfc>
    Allocator::MemoryBlock *previous = Allocator::free_pointer, *next_node;
    80003654:	00007717          	auipc	a4,0x7
    80003658:	edc73703          	ld	a4,-292(a4) # 8000a530 <_ZN9Allocator12free_pointerE>
    if (freed < Allocator::free_pointer) {
    8000365c:	04e6fe63          	bgeu	a3,a4,800036b8 <_ZN9Allocator9_mem_freeEPKv+0x98>
        next_node = Allocator::free_pointer;
        Allocator::free_pointer = freed;
    80003660:	00007797          	auipc	a5,0x7
    80003664:	ecd7b823          	sd	a3,-304(a5) # 8000a530 <_ZN9Allocator12free_pointerE>
        next_node = Allocator::free_pointer;
    80003668:	00070793          	mv	a5,a4
        previous = nullptr;
    8000366c:	00000713          	li	a4,0
inline bool Allocator::adjacent(Allocator::MemoryBlock *block1, Allocator::MemoryBlock *block2) {
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
}

inline void Allocator::merge(MemoryBlock *block1, MemoryBlock *block2) {
    if (!block1) return;
    80003670:	00068e63          	beqz	a3,8000368c <_ZN9Allocator9_mem_freeEPKv+0x6c>
    if (block2 && Allocator::adjacent(block1, block2)) {
    80003674:	00078a63          	beqz	a5,80003688 <_ZN9Allocator9_mem_freeEPKv+0x68>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    80003678:	ff853583          	ld	a1,-8(a0)
    8000367c:	00b68633          	add	a2,a3,a1
    80003680:	01060613          	addi	a2,a2,16
    if (block2 && Allocator::adjacent(block1, block2)) {
    80003684:	04f60a63          	beq	a2,a5,800036d8 <_ZN9Allocator9_mem_freeEPKv+0xb8>
        block1->next = block2->next;
        block1->size += Allocator::HEADER_SIZE + block2->size;
    } else {
        block1->next = block2;
    80003688:	fef53823          	sd	a5,-16(a0)
    if (!block1) return;
    8000368c:	08070c63          	beqz	a4,80003724 <_ZN9Allocator9_mem_freeEPKv+0x104>
    if (block2 && Allocator::adjacent(block1, block2)) {
    80003690:	00068a63          	beqz	a3,800036a4 <_ZN9Allocator9_mem_freeEPKv+0x84>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    80003694:	00873603          	ld	a2,8(a4)
    80003698:	00c707b3          	add	a5,a4,a2
    8000369c:	01078793          	addi	a5,a5,16
    if (block2 && Allocator::adjacent(block1, block2)) {
    800036a0:	04f80a63          	beq	a6,a5,800036f4 <_ZN9Allocator9_mem_freeEPKv+0xd4>
        block1->next = block2;
    800036a4:	00d73023          	sd	a3,0(a4)
    return 0;
    800036a8:	00000513          	li	a0,0
}
    800036ac:	00813403          	ld	s0,8(sp)
    800036b0:	01010113          	addi	sp,sp,16
    800036b4:	00008067          	ret
        for (next_node = previous->next; next_node && !(previous < freed && next_node > freed);
    800036b8:	00073783          	ld	a5,0(a4)
    800036bc:	00c0006f          	j	800036c8 <_ZN9Allocator9_mem_freeEPKv+0xa8>
             previous = next_node, next_node = next_node->next);
    800036c0:	00078713          	mv	a4,a5
    800036c4:	0007b783          	ld	a5,0(a5)
        for (next_node = previous->next; next_node && !(previous < freed && next_node > freed);
    800036c8:	fa0784e3          	beqz	a5,80003670 <_ZN9Allocator9_mem_freeEPKv+0x50>
    800036cc:	fed77ae3          	bgeu	a4,a3,800036c0 <_ZN9Allocator9_mem_freeEPKv+0xa0>
    800036d0:	fef6f8e3          	bgeu	a3,a5,800036c0 <_ZN9Allocator9_mem_freeEPKv+0xa0>
    800036d4:	f9dff06f          	j	80003670 <_ZN9Allocator9_mem_freeEPKv+0x50>
        block1->next = block2->next;
    800036d8:	0007b603          	ld	a2,0(a5)
    800036dc:	fec53823          	sd	a2,-16(a0)
        block1->size += Allocator::HEADER_SIZE + block2->size;
    800036e0:	0087b783          	ld	a5,8(a5)
    800036e4:	00f585b3          	add	a1,a1,a5
    800036e8:	01058593          	addi	a1,a1,16
    800036ec:	feb53c23          	sd	a1,-8(a0)
    800036f0:	f9dff06f          	j	8000368c <_ZN9Allocator9_mem_freeEPKv+0x6c>
        block1->next = block2->next;
    800036f4:	ff053783          	ld	a5,-16(a0)
    800036f8:	00f73023          	sd	a5,0(a4)
        block1->size += Allocator::HEADER_SIZE + block2->size;
    800036fc:	ff853783          	ld	a5,-8(a0)
    80003700:	00f60633          	add	a2,a2,a5
    80003704:	01060613          	addi	a2,a2,16
    80003708:	00c73423          	sd	a2,8(a4)
    return 0;
    8000370c:	00000513          	li	a0,0
    80003710:	f9dff06f          	j	800036ac <_ZN9Allocator9_mem_freeEPKv+0x8c>
    if (freed < HEAP_START_ADDR) return -1;
    80003714:	fff00513          	li	a0,-1
    80003718:	f95ff06f          	j	800036ac <_ZN9Allocator9_mem_freeEPKv+0x8c>
    if (freed->next != reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(freed) ^ freed->size)) return -2;
    8000371c:	ffe00513          	li	a0,-2
    80003720:	f8dff06f          	j	800036ac <_ZN9Allocator9_mem_freeEPKv+0x8c>
    return 0;
    80003724:	00000513          	li	a0,0
    80003728:	f85ff06f          	j	800036ac <_ZN9Allocator9_mem_freeEPKv+0x8c>

000000008000372c <_ZN9Allocator9mem_checkEv>:
    }
}

__attribute__((unused))
bool Allocator::mem_check() {
    8000372c:	ff010113          	addi	sp,sp,-16
    80003730:	00813423          	sd	s0,8(sp)
    80003734:	01010413          	addi	s0,sp,16
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    80003738:	00007717          	auipc	a4,0x7
    8000373c:	df873703          	ld	a4,-520(a4) # 8000a530 <_ZN9Allocator12free_pointerE>
    80003740:	00070793          	mv	a5,a4
    80003744:	00073703          	ld	a4,0(a4)
    80003748:	00070e63          	beqz	a4,80003764 <_ZN9Allocator9mem_checkEv+0x38>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    8000374c:	0087b683          	ld	a3,8(a5)
    80003750:	00d787b3          	add	a5,a5,a3
    80003754:	01078793          	addi	a5,a5,16
        if (Allocator::adjacent(curr, curr->next)) return false;
    80003758:	fee794e3          	bne	a5,a4,80003740 <_ZN9Allocator9mem_checkEv+0x14>
    8000375c:	00000513          	li	a0,0
    80003760:	0080006f          	j	80003768 <_ZN9Allocator9mem_checkEv+0x3c>
    }
    return true;
    80003764:	00100513          	li	a0,1
}
    80003768:	00813403          	ld	s0,8(sp)
    8000376c:	01010113          	addi	sp,sp,16
    80003770:	00008067          	ret

0000000080003774 <_ZN9Allocator8mem_showEv>:

__attribute__((unused))
void Allocator::mem_show() {
    80003774:	fe010113          	addi	sp,sp,-32
    80003778:	00113c23          	sd	ra,24(sp)
    8000377c:	00813823          	sd	s0,16(sp)
    80003780:	00913423          	sd	s1,8(sp)
    80003784:	02010413          	addi	s0,sp,32
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    80003788:	00007497          	auipc	s1,0x7
    8000378c:	da84b483          	ld	s1,-600(s1) # 8000a530 <_ZN9Allocator12free_pointerE>
    80003790:	0004b783          	ld	a5,0(s1)
    80003794:	04078e63          	beqz	a5,800037f0 <_ZN9Allocator8mem_showEv+0x7c>
        stm::cout << curr << stm::endl << curr->next << stm::endl << stm::endl;
    80003798:	00048593          	mv	a1,s1
    8000379c:	00007517          	auipc	a0,0x7
    800037a0:	cf453503          	ld	a0,-780(a0) # 8000a490 <_GLOBAL_OFFSET_TABLE_+0x90>
    800037a4:	00000097          	auipc	ra,0x0
    800037a8:	238080e7          	jalr	568(ra) # 800039dc <_ZNK3stm7istreamlsEPv>
    800037ac:	00007597          	auipc	a1,0x7
    800037b0:	cb45b583          	ld	a1,-844(a1) # 8000a460 <_GLOBAL_OFFSET_TABLE_+0x60>
    800037b4:	00000097          	auipc	ra,0x0
    800037b8:	2b4080e7          	jalr	692(ra) # 80003a68 <_ZNK3stm7istreamlsERKNS_7endlineE>
    800037bc:	0004b583          	ld	a1,0(s1)
    800037c0:	00000097          	auipc	ra,0x0
    800037c4:	21c080e7          	jalr	540(ra) # 800039dc <_ZNK3stm7istreamlsEPv>
    800037c8:	00007597          	auipc	a1,0x7
    800037cc:	c985b583          	ld	a1,-872(a1) # 8000a460 <_GLOBAL_OFFSET_TABLE_+0x60>
    800037d0:	00000097          	auipc	ra,0x0
    800037d4:	298080e7          	jalr	664(ra) # 80003a68 <_ZNK3stm7istreamlsERKNS_7endlineE>
    800037d8:	00007597          	auipc	a1,0x7
    800037dc:	c885b583          	ld	a1,-888(a1) # 8000a460 <_GLOBAL_OFFSET_TABLE_+0x60>
    800037e0:	00000097          	auipc	ra,0x0
    800037e4:	288080e7          	jalr	648(ra) # 80003a68 <_ZNK3stm7istreamlsERKNS_7endlineE>
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    800037e8:	0004b483          	ld	s1,0(s1)
    800037ec:	fa5ff06f          	j	80003790 <_ZN9Allocator8mem_showEv+0x1c>
    }
}
    800037f0:	01813083          	ld	ra,24(sp)
    800037f4:	01013403          	ld	s0,16(sp)
    800037f8:	00813483          	ld	s1,8(sp)
    800037fc:	02010113          	addi	sp,sp,32
    80003800:	00008067          	ret

0000000080003804 <_ZN9Allocator8mem_sizeEv>:

__attribute__((unused))
int Allocator::mem_size() {
    80003804:	ff010113          	addi	sp,sp,-16
    80003808:	00813423          	sd	s0,8(sp)
    8000380c:	01010413          	addi	s0,sp,16
    int i = 0;
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr; i += curr->size, curr = curr->next);
    80003810:	00007797          	auipc	a5,0x7
    80003814:	d207b783          	ld	a5,-736(a5) # 8000a530 <_ZN9Allocator12free_pointerE>
    int i = 0;
    80003818:	00000513          	li	a0,0
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr; i += curr->size, curr = curr->next);
    8000381c:	00078a63          	beqz	a5,80003830 <_ZN9Allocator8mem_sizeEv+0x2c>
    80003820:	0087b703          	ld	a4,8(a5)
    80003824:	00a7053b          	addw	a0,a4,a0
    80003828:	0007b783          	ld	a5,0(a5)
    8000382c:	ff1ff06f          	j	8000381c <_ZN9Allocator8mem_sizeEv+0x18>
    return i;
}
    80003830:	00813403          	ld	s0,8(sp)
    80003834:	01010113          	addi	sp,sp,16
    80003838:	00008067          	ret

000000008000383c <_Z6memcpyPKvS0_i>:

void memcpy(const void *src, const void *dst, int len) {
    8000383c:	ff010113          	addi	sp,sp,-16
    80003840:	00813423          	sd	s0,8(sp)
    80003844:	01010413          	addi	s0,sp,16
    char *src1 = (char *) src;
    char *dst1 = (char *) dst;
    for (int i = 0; i < len; i++)
    80003848:	00000793          	li	a5,0
    8000384c:	00c7de63          	bge	a5,a2,80003868 <_Z6memcpyPKvS0_i+0x2c>
        dst1[i] = src1[i];
    80003850:	00f58733          	add	a4,a1,a5
    80003854:	00f506b3          	add	a3,a0,a5
    80003858:	0006c683          	lbu	a3,0(a3)
    8000385c:	00d70023          	sb	a3,0(a4)
    for (int i = 0; i < len; i++)
    80003860:	0017879b          	addiw	a5,a5,1
    80003864:	fe9ff06f          	j	8000384c <_Z6memcpyPKvS0_i+0x10>
    80003868:	00813403          	ld	s0,8(sp)
    8000386c:	01010113          	addi	sp,sp,16
    80003870:	00008067          	ret

0000000080003874 <_ZNK3stm7istreamlsEc>:
#include "../h/string.hpp"

const stm::istream stm::cout;
const stm::endline stm::endl;

const stm::istream &stm::istream::operator<<(const char c) const {
    80003874:	fe010113          	addi	sp,sp,-32
    80003878:	00113c23          	sd	ra,24(sp)
    8000387c:	00813823          	sd	s0,16(sp)
    80003880:	00913423          	sd	s1,8(sp)
    80003884:	02010413          	addi	s0,sp,32
    80003888:	00050493          	mv	s1,a0
    putc(c);
    8000388c:	00058513          	mv	a0,a1
    80003890:	ffffe097          	auipc	ra,0xffffe
    80003894:	150080e7          	jalr	336(ra) # 800019e0 <_Z4putcc>
    return *this;
}
    80003898:	00048513          	mv	a0,s1
    8000389c:	01813083          	ld	ra,24(sp)
    800038a0:	01013403          	ld	s0,16(sp)
    800038a4:	00813483          	ld	s1,8(sp)
    800038a8:	02010113          	addi	sp,sp,32
    800038ac:	00008067          	ret

00000000800038b0 <_ZNK3stm7istreamlsEPKc>:

const stm::istream &stm::istream::operator<<(const char *string) const {
    800038b0:	fe010113          	addi	sp,sp,-32
    800038b4:	00113c23          	sd	ra,24(sp)
    800038b8:	00813823          	sd	s0,16(sp)
    800038bc:	00913423          	sd	s1,8(sp)
    800038c0:	02010413          	addi	s0,sp,32
    800038c4:	00050493          	mv	s1,a0
    print(string);
    800038c8:	00058513          	mv	a0,a1
    800038cc:	fffff097          	auipc	ra,0xfffff
    800038d0:	dc4080e7          	jalr	-572(ra) # 80002690 <_Z5printPKc>
    return *this;
}
    800038d4:	00048513          	mv	a0,s1
    800038d8:	01813083          	ld	ra,24(sp)
    800038dc:	01013403          	ld	s0,16(sp)
    800038e0:	00813483          	ld	s1,8(sp)
    800038e4:	02010113          	addi	sp,sp,32
    800038e8:	00008067          	ret

00000000800038ec <_ZNK3stm7istreamlsERKNS_6StringE>:

const stm::istream &stm::istream::operator<<(const stm::String &string) const {
    800038ec:	fe010113          	addi	sp,sp,-32
    800038f0:	00113c23          	sd	ra,24(sp)
    800038f4:	00813823          	sd	s0,16(sp)
    800038f8:	00913423          	sd	s1,8(sp)
    800038fc:	02010413          	addi	s0,sp,32
    80003900:	00050493          	mv	s1,a0
    print(string.actual_string);
    80003904:	0085b503          	ld	a0,8(a1)
    80003908:	fffff097          	auipc	ra,0xfffff
    8000390c:	d88080e7          	jalr	-632(ra) # 80002690 <_Z5printPKc>
    return *this;
}
    80003910:	00048513          	mv	a0,s1
    80003914:	01813083          	ld	ra,24(sp)
    80003918:	01013403          	ld	s0,16(sp)
    8000391c:	00813483          	ld	s1,8(sp)
    80003920:	02010113          	addi	sp,sp,32
    80003924:	00008067          	ret

0000000080003928 <_ZNK3stm7istreamlsEx>:

const stm::istream &stm::istream::operator<<(long long number) const {
    80003928:	fe010113          	addi	sp,sp,-32
    8000392c:	00113c23          	sd	ra,24(sp)
    80003930:	00813823          	sd	s0,16(sp)
    80003934:	00913423          	sd	s1,8(sp)
    80003938:	02010413          	addi	s0,sp,32
    8000393c:	00050493          	mv	s1,a0
    print(number);
    80003940:	00058513          	mv	a0,a1
    80003944:	fffff097          	auipc	ra,0xfffff
    80003948:	e60080e7          	jalr	-416(ra) # 800027a4 <_Z5printx>
    return *this;
}
    8000394c:	00048513          	mv	a0,s1
    80003950:	01813083          	ld	ra,24(sp)
    80003954:	01013403          	ld	s0,16(sp)
    80003958:	00813483          	ld	s1,8(sp)
    8000395c:	02010113          	addi	sp,sp,32
    80003960:	00008067          	ret

0000000080003964 <_ZNK3stm7istreamlsEi>:

const stm::istream &stm::istream::operator<<(int number) const {
    80003964:	fe010113          	addi	sp,sp,-32
    80003968:	00113c23          	sd	ra,24(sp)
    8000396c:	00813823          	sd	s0,16(sp)
    80003970:	00913423          	sd	s1,8(sp)
    80003974:	02010413          	addi	s0,sp,32
    80003978:	00050493          	mv	s1,a0
    print(number);
    8000397c:	00058513          	mv	a0,a1
    80003980:	fffff097          	auipc	ra,0xfffff
    80003984:	e6c080e7          	jalr	-404(ra) # 800027ec <_Z5printi>
    return *this;
}
    80003988:	00048513          	mv	a0,s1
    8000398c:	01813083          	ld	ra,24(sp)
    80003990:	01013403          	ld	s0,16(sp)
    80003994:	00813483          	ld	s1,8(sp)
    80003998:	02010113          	addi	sp,sp,32
    8000399c:	00008067          	ret

00000000800039a0 <_ZNK3stm7istreamlsEm>:

const stm::istream &stm::istream::operator<<(uint64 number) const {
    800039a0:	fe010113          	addi	sp,sp,-32
    800039a4:	00113c23          	sd	ra,24(sp)
    800039a8:	00813823          	sd	s0,16(sp)
    800039ac:	00913423          	sd	s1,8(sp)
    800039b0:	02010413          	addi	s0,sp,32
    800039b4:	00050493          	mv	s1,a0
    print(number);
    800039b8:	00058513          	mv	a0,a1
    800039bc:	fffff097          	auipc	ra,0xfffff
    800039c0:	e58080e7          	jalr	-424(ra) # 80002814 <_Z5printm>
    return *this;
}
    800039c4:	00048513          	mv	a0,s1
    800039c8:	01813083          	ld	ra,24(sp)
    800039cc:	01013403          	ld	s0,16(sp)
    800039d0:	00813483          	ld	s1,8(sp)
    800039d4:	02010113          	addi	sp,sp,32
    800039d8:	00008067          	ret

00000000800039dc <_ZNK3stm7istreamlsEPv>:

const stm::istream &stm::istream::operator<<(void *pointer) const {
    800039dc:	fe010113          	addi	sp,sp,-32
    800039e0:	00113c23          	sd	ra,24(sp)
    800039e4:	00813823          	sd	s0,16(sp)
    800039e8:	00913423          	sd	s1,8(sp)
    800039ec:	02010413          	addi	s0,sp,32
    800039f0:	00050493          	mv	s1,a0
    print_h((uint64) pointer);
    800039f4:	00058513          	mv	a0,a1
    800039f8:	fffff097          	auipc	ra,0xfffff
    800039fc:	e64080e7          	jalr	-412(ra) # 8000285c <_Z7print_hm>
    return *this;
}
    80003a00:	00048513          	mv	a0,s1
    80003a04:	01813083          	ld	ra,24(sp)
    80003a08:	01013403          	ld	s0,16(sp)
    80003a0c:	00813483          	ld	s1,8(sp)
    80003a10:	02010113          	addi	sp,sp,32
    80003a14:	00008067          	ret

0000000080003a18 <_ZNK3stm7istreamlsEb>:

const stm::istream &stm::istream::operator<<(bool truth) const {
    80003a18:	fe010113          	addi	sp,sp,-32
    80003a1c:	00113c23          	sd	ra,24(sp)
    80003a20:	00813823          	sd	s0,16(sp)
    80003a24:	00913423          	sd	s1,8(sp)
    80003a28:	02010413          	addi	s0,sp,32
    80003a2c:	00050493          	mv	s1,a0
    print(truth ? "true" : "false");
    80003a30:	02058663          	beqz	a1,80003a5c <_ZNK3stm7istreamlsEb+0x44>
    80003a34:	00004517          	auipc	a0,0x4
    80003a38:	65450513          	addi	a0,a0,1620 # 80008088 <CONSOLE_STATUS+0x78>
    80003a3c:	fffff097          	auipc	ra,0xfffff
    80003a40:	c54080e7          	jalr	-940(ra) # 80002690 <_Z5printPKc>
    return *this;
}
    80003a44:	00048513          	mv	a0,s1
    80003a48:	01813083          	ld	ra,24(sp)
    80003a4c:	01013403          	ld	s0,16(sp)
    80003a50:	00813483          	ld	s1,8(sp)
    80003a54:	02010113          	addi	sp,sp,32
    80003a58:	00008067          	ret
    print(truth ? "true" : "false");
    80003a5c:	00004517          	auipc	a0,0x4
    80003a60:	62450513          	addi	a0,a0,1572 # 80008080 <CONSOLE_STATUS+0x70>
    80003a64:	fd9ff06f          	j	80003a3c <_ZNK3stm7istreamlsEb+0x24>

0000000080003a68 <_ZNK3stm7istreamlsERKNS_7endlineE>:

const stm::istream &stm::istream::operator<<(const stm::endline &) const {
    80003a68:	fe010113          	addi	sp,sp,-32
    80003a6c:	00113c23          	sd	ra,24(sp)
    80003a70:	00813823          	sd	s0,16(sp)
    80003a74:	00913423          	sd	s1,8(sp)
    80003a78:	02010413          	addi	s0,sp,32
    80003a7c:	00050493          	mv	s1,a0
    putc('\n');
    80003a80:	00a00513          	li	a0,10
    80003a84:	ffffe097          	auipc	ra,0xffffe
    80003a88:	f5c080e7          	jalr	-164(ra) # 800019e0 <_Z4putcc>
    return *this;
}
    80003a8c:	00048513          	mv	a0,s1
    80003a90:	01813083          	ld	ra,24(sp)
    80003a94:	01013403          	ld	s0,16(sp)
    80003a98:	00813483          	ld	s1,8(sp)
    80003a9c:	02010113          	addi	sp,sp,32
    80003aa0:	00008067          	ret

0000000080003aa4 <_Z9bleya_nitPv>:
#include "../h/cpp_semaphores.hpp"
#include "../h/scheduler.hpp"
#include "../h/iostream.hpp"

[[noreturn]]
void bleya_nit(void *) {
    80003aa4:	ff010113          	addi	sp,sp,-16
    80003aa8:	00113423          	sd	ra,8(sp)
    80003aac:	00813023          	sd	s0,0(sp)
    80003ab0:	01010413          	addi	s0,sp,16
    while (true) {
        thread_dispatch();
    80003ab4:	ffffe097          	auipc	ra,0xffffe
    80003ab8:	b48080e7          	jalr	-1208(ra) # 800015fc <_Z15thread_dispatchv>
    while (true) {
    80003abc:	ff9ff06f          	j	80003ab4 <_Z9bleya_nitPv+0x10>

0000000080003ac0 <_Z11userWrapperPv>:
    thread_create(&handle_main, nullptr, nullptr);
    TCB::running = handle_main;
    thread_create(&handle_bleya, &bleya_nit, nullptr);
}

void userWrapper(void *ret) {
    80003ac0:	fe010113          	addi	sp,sp,-32
    80003ac4:	00113c23          	sd	ra,24(sp)
    80003ac8:	00813823          	sd	s0,16(sp)
    80003acc:	00913423          	sd	s1,8(sp)
    80003ad0:	02010413          	addi	s0,sp,32
    80003ad4:	00050493          	mv	s1,a0
    *((int *) ret) = userMain();
    80003ad8:	fffff097          	auipc	ra,0xfffff
    80003adc:	454080e7          	jalr	1108(ra) # 80002f2c <_Z8userMainv>
    80003ae0:	00a4a023          	sw	a0,0(s1)
}
    80003ae4:	01813083          	ld	ra,24(sp)
    80003ae8:	01013403          	ld	s0,16(sp)
    80003aec:	00813483          	ld	s1,8(sp)
    80003af0:	02010113          	addi	sp,sp,32
    80003af4:	00008067          	ret

0000000080003af8 <_Z4callv>:

int call() {
    80003af8:	fe010113          	addi	sp,sp,-32
    80003afc:	00113c23          	sd	ra,24(sp)
    80003b00:	00813823          	sd	s0,16(sp)
    80003b04:	02010413          	addi	s0,sp,32
    thread_t userHandle;
    int ret;
    thread_create(&userHandle, userWrapper, &ret);
    80003b08:	fe440613          	addi	a2,s0,-28
    80003b0c:	00000597          	auipc	a1,0x0
    80003b10:	fb458593          	addi	a1,a1,-76 # 80003ac0 <_Z11userWrapperPv>
    80003b14:	fe840513          	addi	a0,s0,-24
    80003b18:	ffffe097          	auipc	ra,0xffffe
    80003b1c:	a10080e7          	jalr	-1520(ra) # 80001528 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_join(userHandle);
    80003b20:	fe843503          	ld	a0,-24(s0)
    80003b24:	ffffe097          	auipc	ra,0xffffe
    80003b28:	b14080e7          	jalr	-1260(ra) # 80001638 <_Z11thread_joinP3TCB>
    return ret;
}
    80003b2c:	fe442503          	lw	a0,-28(s0)
    80003b30:	01813083          	ld	ra,24(sp)
    80003b34:	01013403          	ld	s0,16(sp)
    80003b38:	02010113          	addi	sp,sp,32
    80003b3c:	00008067          	ret

0000000080003b40 <_Z3endi>:

int end(int ret) {
    80003b40:	fe010113          	addi	sp,sp,-32
    80003b44:	00113c23          	sd	ra,24(sp)
    80003b48:	00813823          	sd	s0,16(sp)
    80003b4c:	00913423          	sd	s1,8(sp)
    80003b50:	02010413          	addi	s0,sp,32
    80003b54:	00050493          	mv	s1,a0
inline void Riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80003b58:	00200793          	li	a5,2
    80003b5c:	1007a073          	csrs	sstatus,a5
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    print("\n\nProcess finished with exit code ");
    80003b60:	00004517          	auipc	a0,0x4
    80003b64:	54050513          	addi	a0,a0,1344 # 800080a0 <_ZN3stm4coutE+0x8>
    80003b68:	fffff097          	auipc	ra,0xfffff
    80003b6c:	b28080e7          	jalr	-1240(ra) # 80002690 <_Z5printPKc>
    print(ret);
    80003b70:	00048513          	mv	a0,s1
    80003b74:	fffff097          	auipc	ra,0xfffff
    80003b78:	c78080e7          	jalr	-904(ra) # 800027ec <_Z5printi>
    print("\n\n");
    80003b7c:	00004517          	auipc	a0,0x4
    80003b80:	54c50513          	addi	a0,a0,1356 # 800080c8 <_ZN3stm4coutE+0x30>
    80003b84:	fffff097          	auipc	ra,0xfffff
    80003b88:	b0c080e7          	jalr	-1268(ra) # 80002690 <_Z5printPKc>
        inline bool is_empty() const { return this->size == 0; }
    80003b8c:	00007797          	auipc	a5,0x7
    80003b90:	8847b783          	ld	a5,-1916(a5) # 8000a410 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003b94:	0107a783          	lw	a5,16(a5)
    while (!IO::Output.is_empty());
    80003b98:	fe079ae3          	bnez	a5,80003b8c <_Z3endi+0x4c>
    time_sleep(10);
    80003b9c:	00a00513          	li	a0,10
    80003ba0:	ffffe097          	auipc	ra,0xffffe
    80003ba4:	d50080e7          	jalr	-688(ra) # 800018f0 <_Z10time_sleepm>
    return 0;
}
    80003ba8:	00000513          	li	a0,0
    80003bac:	01813083          	ld	ra,24(sp)
    80003bb0:	01013403          	ld	s0,16(sp)
    80003bb4:	00813483          	ld	s1,8(sp)
    80003bb8:	02010113          	addi	sp,sp,32
    80003bbc:	00008067          	ret

0000000080003bc0 <main>:

int main() {
    80003bc0:	ff010113          	addi	sp,sp,-16
    80003bc4:	00113423          	sd	ra,8(sp)
    80003bc8:	00813023          	sd	s0,0(sp)
    80003bcc:	01010413          	addi	s0,sp,16
    init();
    80003bd0:	00000097          	auipc	ra,0x0
    80003bd4:	028080e7          	jalr	40(ra) # 80003bf8 <_Z4initv>
    int ret = call();
    80003bd8:	00000097          	auipc	ra,0x0
    80003bdc:	f20080e7          	jalr	-224(ra) # 80003af8 <_Z4callv>
    return end(ret);
    80003be0:	00000097          	auipc	ra,0x0
    80003be4:	f60080e7          	jalr	-160(ra) # 80003b40 <_Z3endi>
    80003be8:	00813083          	ld	ra,8(sp)
    80003bec:	00013403          	ld	s0,0(sp)
    80003bf0:	01010113          	addi	sp,sp,16
    80003bf4:	00008067          	ret

0000000080003bf8 <_Z4initv>:
inline void init() {
    80003bf8:	fd010113          	addi	sp,sp,-48
    80003bfc:	02113423          	sd	ra,40(sp)
    80003c00:	02813023          	sd	s0,32(sp)
    80003c04:	00913c23          	sd	s1,24(sp)
    80003c08:	01213823          	sd	s2,16(sp)
    80003c0c:	03010413          	addi	s0,sp,48
    __asm__ volatile("mv t0, %0": : "r" (&supervisorTrap));
    80003c10:	00007797          	auipc	a5,0x7
    80003c14:	8287b783          	ld	a5,-2008(a5) # 8000a438 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003c18:	00078293          	mv	t0,a5
    __asm__ volatile("addi t0, t0, 1");
    80003c1c:	00128293          	addi	t0,t0,1
    __asm__ volatile("csrw stvec, t0");
    80003c20:	10529073          	csrw	stvec,t0
    Allocator::mem_init();
    80003c24:	00000097          	auipc	ra,0x0
    80003c28:	8f8080e7          	jalr	-1800(ra) # 8000351c <_ZN9Allocator8mem_initEv>
    IO::init();
    80003c2c:	fffff097          	auipc	ra,0xfffff
    80003c30:	cbc080e7          	jalr	-836(ra) # 800028e8 <_ZN2IO4initEv>
#include "syscall_c.hpp"

class Scheduler final {
public:

    static void init() { high_priority.init(); mid_priority.init(); low_priority.init(); }
    80003c34:	00007517          	auipc	a0,0x7
    80003c38:	85453503          	ld	a0,-1964(a0) # 8000a488 <_GLOBAL_OFFSET_TABLE_+0x88>
    80003c3c:	fffff097          	auipc	ra,0xfffff
    80003c40:	85c080e7          	jalr	-1956(ra) # 80002498 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    80003c44:	00007517          	auipc	a0,0x7
    80003c48:	82453503          	ld	a0,-2012(a0) # 8000a468 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003c4c:	fffff097          	auipc	ra,0xfffff
    80003c50:	84c080e7          	jalr	-1972(ra) # 80002498 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    80003c54:	00006517          	auipc	a0,0x6
    80003c58:	7ec53503          	ld	a0,2028(a0) # 8000a440 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003c5c:	fffff097          	auipc	ra,0xfffff
    80003c60:	83c080e7          	jalr	-1988(ra) # 80002498 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    printer = new OwnedMutex();
    80003c64:	02000513          	li	a0,32
    80003c68:	00000097          	auipc	ra,0x0
    80003c6c:	160080e7          	jalr	352(ra) # 80003dc8 <_Znwm>
    80003c70:	00050493          	mv	s1,a0
    80003c74:	00001097          	auipc	ra,0x1
    80003c78:	d98080e7          	jalr	-616(ra) # 80004a0c <_ZN10OwnedMutexC1Ev>
    80003c7c:	00007797          	auipc	a5,0x7
    80003c80:	8a97be23          	sd	s1,-1860(a5) # 8000a538 <printer>
    thread_create(&handle_main, nullptr, nullptr);
    80003c84:	00000613          	li	a2,0
    80003c88:	00000593          	li	a1,0
    80003c8c:	fd840513          	addi	a0,s0,-40
    80003c90:	ffffe097          	auipc	ra,0xffffe
    80003c94:	898080e7          	jalr	-1896(ra) # 80001528 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = handle_main;
    80003c98:	00006797          	auipc	a5,0x6
    80003c9c:	7d87b783          	ld	a5,2008(a5) # 8000a470 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003ca0:	fd843703          	ld	a4,-40(s0)
    80003ca4:	00e7b023          	sd	a4,0(a5)
    thread_create(&handle_bleya, &bleya_nit, nullptr);
    80003ca8:	00000613          	li	a2,0
    80003cac:	00000597          	auipc	a1,0x0
    80003cb0:	df858593          	addi	a1,a1,-520 # 80003aa4 <_Z9bleya_nitPv>
    80003cb4:	00007517          	auipc	a0,0x7
    80003cb8:	88c50513          	addi	a0,a0,-1908 # 8000a540 <handle_bleya>
    80003cbc:	ffffe097          	auipc	ra,0xffffe
    80003cc0:	86c080e7          	jalr	-1940(ra) # 80001528 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80003cc4:	02813083          	ld	ra,40(sp)
    80003cc8:	02013403          	ld	s0,32(sp)
    80003ccc:	01813483          	ld	s1,24(sp)
    80003cd0:	01013903          	ld	s2,16(sp)
    80003cd4:	03010113          	addi	sp,sp,48
    80003cd8:	00008067          	ret
    80003cdc:	00050913          	mv	s2,a0
    printer = new OwnedMutex();
    80003ce0:	00048513          	mv	a0,s1
    80003ce4:	00000097          	auipc	ra,0x0
    80003ce8:	134080e7          	jalr	308(ra) # 80003e18 <_ZdlPv>
    80003cec:	00090513          	mv	a0,s2
    80003cf0:	00008097          	auipc	ra,0x8
    80003cf4:	988080e7          	jalr	-1656(ra) # 8000b678 <_Unwind_Resume>

0000000080003cf8 <_ZN6Thread11threadStartEPv>:
Thread::Thread() {
    this->body = nullptr;
    this->arg = nullptr;
}

void Thread::threadStart(void *arg) {
    80003cf8:	ff010113          	addi	sp,sp,-16
    80003cfc:	00113423          	sd	ra,8(sp)
    80003d00:	00813023          	sd	s0,0(sp)
    80003d04:	01010413          	addi	s0,sp,16
    Thread *thread = (Thread *) arg;
    if (thread->body) {
    80003d08:	01053783          	ld	a5,16(a0)
    80003d0c:	00078e63          	beqz	a5,80003d28 <_ZN6Thread11threadStartEPv+0x30>
        thread->body(thread->arg);
    80003d10:	01853503          	ld	a0,24(a0)
    80003d14:	000780e7          	jalr	a5
    } else {
        thread->run();
    }
}
    80003d18:	00813083          	ld	ra,8(sp)
    80003d1c:	00013403          	ld	s0,0(sp)
    80003d20:	01010113          	addi	sp,sp,16
    80003d24:	00008067          	ret
        thread->run();
    80003d28:	00053783          	ld	a5,0(a0)
    80003d2c:	0107b783          	ld	a5,16(a5)
    80003d30:	000780e7          	jalr	a5
}
    80003d34:	fe5ff06f          	j	80003d18 <_ZN6Thread11threadStartEPv+0x20>

0000000080003d38 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80003d38:	ff010113          	addi	sp,sp,-16
    80003d3c:	00113423          	sd	ra,8(sp)
    80003d40:	00813023          	sd	s0,0(sp)
    80003d44:	01010413          	addi	s0,sp,16
    80003d48:	00006797          	auipc	a5,0x6
    80003d4c:	63878793          	addi	a5,a5,1592 # 8000a380 <_ZTV9Semaphore+0x10>
    80003d50:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80003d54:	00853503          	ld	a0,8(a0)
    80003d58:	ffffe097          	auipc	ra,0xffffe
    80003d5c:	a68080e7          	jalr	-1432(ra) # 800017c0 <_Z9sem_closeP3Sem>
}
    80003d60:	00813083          	ld	ra,8(sp)
    80003d64:	00013403          	ld	s0,0(sp)
    80003d68:	01010113          	addi	sp,sp,16
    80003d6c:	00008067          	ret

0000000080003d70 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80003d70:	ff010113          	addi	sp,sp,-16
    80003d74:	00113423          	sd	ra,8(sp)
    80003d78:	00813023          	sd	s0,0(sp)
    80003d7c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80003d80:	00853503          	ld	a0,8(a0)
    80003d84:	ffffe097          	auipc	ra,0xffffe
    80003d88:	a88080e7          	jalr	-1400(ra) # 8000180c <_Z8sem_waitP3Sem>
}
    80003d8c:	00813083          	ld	ra,8(sp)
    80003d90:	00013403          	ld	s0,0(sp)
    80003d94:	01010113          	addi	sp,sp,16
    80003d98:	00008067          	ret

0000000080003d9c <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80003d9c:	ff010113          	addi	sp,sp,-16
    80003da0:	00113423          	sd	ra,8(sp)
    80003da4:	00813023          	sd	s0,0(sp)
    80003da8:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80003dac:	00853503          	ld	a0,8(a0)
    80003db0:	ffffe097          	auipc	ra,0xffffe
    80003db4:	aa8080e7          	jalr	-1368(ra) # 80001858 <_Z10sem_signalP3Sem>
}
    80003db8:	00813083          	ld	ra,8(sp)
    80003dbc:	00013403          	ld	s0,0(sp)
    80003dc0:	01010113          	addi	sp,sp,16
    80003dc4:	00008067          	ret

0000000080003dc8 <_Znwm>:
void *operator new(size_t size) {
    80003dc8:	ff010113          	addi	sp,sp,-16
    80003dcc:	00113423          	sd	ra,8(sp)
    80003dd0:	00813023          	sd	s0,0(sp)
    80003dd4:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003dd8:	ffffd097          	auipc	ra,0xffffd
    80003ddc:	6b8080e7          	jalr	1720(ra) # 80001490 <_Z9mem_allocm>
}
    80003de0:	00813083          	ld	ra,8(sp)
    80003de4:	00013403          	ld	s0,0(sp)
    80003de8:	01010113          	addi	sp,sp,16
    80003dec:	00008067          	ret

0000000080003df0 <_Znam>:
void *operator new[](size_t size) {
    80003df0:	ff010113          	addi	sp,sp,-16
    80003df4:	00113423          	sd	ra,8(sp)
    80003df8:	00813023          	sd	s0,0(sp)
    80003dfc:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003e00:	ffffd097          	auipc	ra,0xffffd
    80003e04:	690080e7          	jalr	1680(ra) # 80001490 <_Z9mem_allocm>
}
    80003e08:	00813083          	ld	ra,8(sp)
    80003e0c:	00013403          	ld	s0,0(sp)
    80003e10:	01010113          	addi	sp,sp,16
    80003e14:	00008067          	ret

0000000080003e18 <_ZdlPv>:
void operator delete(void *mem) {
    80003e18:	ff010113          	addi	sp,sp,-16
    80003e1c:	00113423          	sd	ra,8(sp)
    80003e20:	00813023          	sd	s0,0(sp)
    80003e24:	01010413          	addi	s0,sp,16
    mem_free(mem);
    80003e28:	ffffd097          	auipc	ra,0xffffd
    80003e2c:	6b4080e7          	jalr	1716(ra) # 800014dc <_Z8mem_freePv>
}
    80003e30:	00813083          	ld	ra,8(sp)
    80003e34:	00013403          	ld	s0,0(sp)
    80003e38:	01010113          	addi	sp,sp,16
    80003e3c:	00008067          	ret

0000000080003e40 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80003e40:	00006797          	auipc	a5,0x6
    80003e44:	51878793          	addi	a5,a5,1304 # 8000a358 <_ZTV6Thread+0x10>
    80003e48:	00f53023          	sd	a5,0(a0)
    if (myHandle->is_finished())
    80003e4c:	00853503          	ld	a0,8(a0)
    bool is_finished() const { return this->status == FINISHED; }
    80003e50:	04852703          	lw	a4,72(a0)
    80003e54:	00400793          	li	a5,4
    80003e58:	00f70463          	beq	a4,a5,80003e60 <_ZN6ThreadD1Ev+0x20>
    80003e5c:	00008067          	ret
        delete myHandle;
    80003e60:	fe050ee3          	beqz	a0,80003e5c <_ZN6ThreadD1Ev+0x1c>
Thread::~Thread() {
    80003e64:	ff010113          	addi	sp,sp,-16
    80003e68:	00113423          	sd	ra,8(sp)
    80003e6c:	00813023          	sd	s0,0(sp)
    80003e70:	01010413          	addi	s0,sp,16
        delete myHandle;
    80003e74:	00000097          	auipc	ra,0x0
    80003e78:	fa4080e7          	jalr	-92(ra) # 80003e18 <_ZdlPv>
}
    80003e7c:	00813083          	ld	ra,8(sp)
    80003e80:	00013403          	ld	s0,0(sp)
    80003e84:	01010113          	addi	sp,sp,16
    80003e88:	00008067          	ret

0000000080003e8c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80003e8c:	fe010113          	addi	sp,sp,-32
    80003e90:	00113c23          	sd	ra,24(sp)
    80003e94:	00813823          	sd	s0,16(sp)
    80003e98:	00913423          	sd	s1,8(sp)
    80003e9c:	02010413          	addi	s0,sp,32
    80003ea0:	00050493          	mv	s1,a0
}
    80003ea4:	00000097          	auipc	ra,0x0
    80003ea8:	f9c080e7          	jalr	-100(ra) # 80003e40 <_ZN6ThreadD1Ev>
    80003eac:	00048513          	mv	a0,s1
    80003eb0:	00000097          	auipc	ra,0x0
    80003eb4:	f68080e7          	jalr	-152(ra) # 80003e18 <_ZdlPv>
    80003eb8:	01813083          	ld	ra,24(sp)
    80003ebc:	01013403          	ld	s0,16(sp)
    80003ec0:	00813483          	ld	s1,8(sp)
    80003ec4:	02010113          	addi	sp,sp,32
    80003ec8:	00008067          	ret

0000000080003ecc <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80003ecc:	fe010113          	addi	sp,sp,-32
    80003ed0:	00113c23          	sd	ra,24(sp)
    80003ed4:	00813823          	sd	s0,16(sp)
    80003ed8:	00913423          	sd	s1,8(sp)
    80003edc:	02010413          	addi	s0,sp,32
    80003ee0:	00050493          	mv	s1,a0
}
    80003ee4:	00000097          	auipc	ra,0x0
    80003ee8:	e54080e7          	jalr	-428(ra) # 80003d38 <_ZN9SemaphoreD1Ev>
    80003eec:	00048513          	mv	a0,s1
    80003ef0:	00000097          	auipc	ra,0x0
    80003ef4:	f28080e7          	jalr	-216(ra) # 80003e18 <_ZdlPv>
    80003ef8:	01813083          	ld	ra,24(sp)
    80003efc:	01013403          	ld	s0,16(sp)
    80003f00:	00813483          	ld	s1,8(sp)
    80003f04:	02010113          	addi	sp,sp,32
    80003f08:	00008067          	ret

0000000080003f0c <_ZdaPv>:
void operator delete[](void *mem) {
    80003f0c:	ff010113          	addi	sp,sp,-16
    80003f10:	00113423          	sd	ra,8(sp)
    80003f14:	00813023          	sd	s0,0(sp)
    80003f18:	01010413          	addi	s0,sp,16
    mem_free(mem);
    80003f1c:	ffffd097          	auipc	ra,0xffffd
    80003f20:	5c0080e7          	jalr	1472(ra) # 800014dc <_Z8mem_freePv>
}
    80003f24:	00813083          	ld	ra,8(sp)
    80003f28:	00013403          	ld	s0,0(sp)
    80003f2c:	01010113          	addi	sp,sp,16
    80003f30:	00008067          	ret

0000000080003f34 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80003f34:	ff010113          	addi	sp,sp,-16
    80003f38:	00813423          	sd	s0,8(sp)
    80003f3c:	01010413          	addi	s0,sp,16
    80003f40:	00006797          	auipc	a5,0x6
    80003f44:	41878793          	addi	a5,a5,1048 # 8000a358 <_ZTV6Thread+0x10>
    80003f48:	00f53023          	sd	a5,0(a0)
    this->body = body;
    80003f4c:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    80003f50:	00c53c23          	sd	a2,24(a0)
}
    80003f54:	00813403          	ld	s0,8(sp)
    80003f58:	01010113          	addi	sp,sp,16
    80003f5c:	00008067          	ret

0000000080003f60 <_ZN6Thread5startEv>:
int Thread::start() {
    80003f60:	ff010113          	addi	sp,sp,-16
    80003f64:	00113423          	sd	ra,8(sp)
    80003f68:	00813023          	sd	s0,0(sp)
    80003f6c:	01010413          	addi	s0,sp,16
    return thread_create(&myHandle, &threadStart, this);
    80003f70:	00050613          	mv	a2,a0
    80003f74:	00000597          	auipc	a1,0x0
    80003f78:	d8458593          	addi	a1,a1,-636 # 80003cf8 <_ZN6Thread11threadStartEPv>
    80003f7c:	00850513          	addi	a0,a0,8
    80003f80:	ffffd097          	auipc	ra,0xffffd
    80003f84:	5a8080e7          	jalr	1448(ra) # 80001528 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80003f88:	00813083          	ld	ra,8(sp)
    80003f8c:	00013403          	ld	s0,0(sp)
    80003f90:	01010113          	addi	sp,sp,16
    80003f94:	00008067          	ret

0000000080003f98 <_ZN6Thread4joinEv>:
void Thread::join() {
    80003f98:	ff010113          	addi	sp,sp,-16
    80003f9c:	00113423          	sd	ra,8(sp)
    80003fa0:	00813023          	sd	s0,0(sp)
    80003fa4:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80003fa8:	00853503          	ld	a0,8(a0)
    80003fac:	ffffd097          	auipc	ra,0xffffd
    80003fb0:	68c080e7          	jalr	1676(ra) # 80001638 <_Z11thread_joinP3TCB>
}
    80003fb4:	00813083          	ld	ra,8(sp)
    80003fb8:	00013403          	ld	s0,0(sp)
    80003fbc:	01010113          	addi	sp,sp,16
    80003fc0:	00008067          	ret

0000000080003fc4 <_ZN6Thread4joinEm>:
void Thread::join(time_t time) {
    80003fc4:	ff010113          	addi	sp,sp,-16
    80003fc8:	00113423          	sd	ra,8(sp)
    80003fcc:	00813023          	sd	s0,0(sp)
    80003fd0:	01010413          	addi	s0,sp,16
    thread_join(myHandle, time);
    80003fd4:	00853503          	ld	a0,8(a0)
    80003fd8:	ffffd097          	auipc	ra,0xffffd
    80003fdc:	69c080e7          	jalr	1692(ra) # 80001674 <_Z11thread_joinP3TCBm>
}
    80003fe0:	00813083          	ld	ra,8(sp)
    80003fe4:	00013403          	ld	s0,0(sp)
    80003fe8:	01010113          	addi	sp,sp,16
    80003fec:	00008067          	ret

0000000080003ff0 <_ZN6Thread4killEPS_>:
int Thread::kill(Thread *thread) {
    80003ff0:	ff010113          	addi	sp,sp,-16
    80003ff4:	00113423          	sd	ra,8(sp)
    80003ff8:	00813023          	sd	s0,0(sp)
    80003ffc:	01010413          	addi	s0,sp,16
    return thread_kill(thread->myHandle);
    80004000:	00853503          	ld	a0,8(a0)
    80004004:	ffffd097          	auipc	ra,0xffffd
    80004008:	720080e7          	jalr	1824(ra) # 80001724 <_Z11thread_killP3TCB>
}
    8000400c:	00813083          	ld	ra,8(sp)
    80004010:	00013403          	ld	s0,0(sp)
    80004014:	01010113          	addi	sp,sp,16
    80004018:	00008067          	ret

000000008000401c <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    8000401c:	ff010113          	addi	sp,sp,-16
    80004020:	00113423          	sd	ra,8(sp)
    80004024:	00813023          	sd	s0,0(sp)
    80004028:	01010413          	addi	s0,sp,16
    thread_dispatch();
    8000402c:	ffffd097          	auipc	ra,0xffffd
    80004030:	5d0080e7          	jalr	1488(ra) # 800015fc <_Z15thread_dispatchv>
}
    80004034:	00813083          	ld	ra,8(sp)
    80004038:	00013403          	ld	s0,0(sp)
    8000403c:	01010113          	addi	sp,sp,16
    80004040:	00008067          	ret

0000000080004044 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t ms) {
    80004044:	ff010113          	addi	sp,sp,-16
    80004048:	00113423          	sd	ra,8(sp)
    8000404c:	00813023          	sd	s0,0(sp)
    80004050:	01010413          	addi	s0,sp,16
    return time_sleep(ms);
    80004054:	ffffe097          	auipc	ra,0xffffe
    80004058:	89c080e7          	jalr	-1892(ra) # 800018f0 <_Z10time_sleepm>
}
    8000405c:	00813083          	ld	ra,8(sp)
    80004060:	00013403          	ld	s0,0(sp)
    80004064:	01010113          	addi	sp,sp,16
    80004068:	00008067          	ret

000000008000406c <_ZN6ThreadC1Ev>:
Thread::Thread() {
    8000406c:	ff010113          	addi	sp,sp,-16
    80004070:	00813423          	sd	s0,8(sp)
    80004074:	01010413          	addi	s0,sp,16
    80004078:	00006797          	auipc	a5,0x6
    8000407c:	2e078793          	addi	a5,a5,736 # 8000a358 <_ZTV6Thread+0x10>
    80004080:	00f53023          	sd	a5,0(a0)
    this->body = nullptr;
    80004084:	00053823          	sd	zero,16(a0)
    this->arg = nullptr;
    80004088:	00053c23          	sd	zero,24(a0)
}
    8000408c:	00813403          	ld	s0,8(sp)
    80004090:	01010113          	addi	sp,sp,16
    80004094:	00008067          	ret

0000000080004098 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80004098:	ff010113          	addi	sp,sp,-16
    8000409c:	00113423          	sd	ra,8(sp)
    800040a0:	00813023          	sd	s0,0(sp)
    800040a4:	01010413          	addi	s0,sp,16
    800040a8:	00006797          	auipc	a5,0x6
    800040ac:	2d878793          	addi	a5,a5,728 # 8000a380 <_ZTV9Semaphore+0x10>
    800040b0:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    800040b4:	00850513          	addi	a0,a0,8
    800040b8:	ffffd097          	auipc	ra,0xffffd
    800040bc:	6b8080e7          	jalr	1720(ra) # 80001770 <_Z8sem_openPP3Semj>
}
    800040c0:	00813083          	ld	ra,8(sp)
    800040c4:	00013403          	ld	s0,0(sp)
    800040c8:	01010113          	addi	sp,sp,16
    800040cc:	00008067          	ret

00000000800040d0 <_ZN9Semaphore15signal_and_waitERS_S0_>:

int Semaphore::signal_and_wait(Semaphore &sem1, Semaphore &sem2) {
    800040d0:	ff010113          	addi	sp,sp,-16
    800040d4:	00113423          	sd	ra,8(sp)
    800040d8:	00813023          	sd	s0,0(sp)
    800040dc:	01010413          	addi	s0,sp,16
    return ::signal_and_wait(sem1.myHandle, sem2.myHandle);
    800040e0:	0085b583          	ld	a1,8(a1)
    800040e4:	00853503          	ld	a0,8(a0)
    800040e8:	ffffd097          	auipc	ra,0xffffd
    800040ec:	7bc080e7          	jalr	1980(ra) # 800018a4 <_Z15signal_and_waitP3SemS0_>
}
    800040f0:	00813083          	ld	ra,8(sp)
    800040f4:	00013403          	ld	s0,0(sp)
    800040f8:	01010113          	addi	sp,sp,16
    800040fc:	00008067          	ret

0000000080004100 <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    80004100:	ff010113          	addi	sp,sp,-16
    80004104:	00113423          	sd	ra,8(sp)
    80004108:	00813023          	sd	s0,0(sp)
    8000410c:	01010413          	addi	s0,sp,16
    thread_exit();
    80004110:	ffffd097          	auipc	ra,0xffffd
    80004114:	4a0080e7          	jalr	1184(ra) # 800015b0 <_Z11thread_exitv>
}
    80004118:	00813083          	ld	ra,8(sp)
    8000411c:	00013403          	ld	s0,0(sp)
    80004120:	01010113          	addi	sp,sp,16
    80004124:	00008067          	ret

0000000080004128 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    80004128:	fe010113          	addi	sp,sp,-32
    8000412c:	00113c23          	sd	ra,24(sp)
    80004130:	00813823          	sd	s0,16(sp)
    80004134:	00913423          	sd	s1,8(sp)
    80004138:	01213023          	sd	s2,0(sp)
    8000413c:	02010413          	addi	s0,sp,32
    80004140:	00050493          	mv	s1,a0
    80004144:	00058913          	mv	s2,a1
    80004148:	00000097          	auipc	ra,0x0
    8000414c:	f24080e7          	jalr	-220(ra) # 8000406c <_ZN6ThreadC1Ev>
    80004150:	00006797          	auipc	a5,0x6
    80004154:	1d878793          	addi	a5,a5,472 # 8000a328 <_ZTV14PeriodicThread+0x10>
    80004158:	00f4b023          	sd	a5,0(s1)
    this->period = period;
    8000415c:	0324b023          	sd	s2,32(s1)
}
    80004160:	01813083          	ld	ra,24(sp)
    80004164:	01013403          	ld	s0,16(sp)
    80004168:	00813483          	ld	s1,8(sp)
    8000416c:	00013903          	ld	s2,0(sp)
    80004170:	02010113          	addi	sp,sp,32
    80004174:	00008067          	ret

0000000080004178 <_ZN7Console4getcEv>:

char Console::getc() {
    80004178:	ff010113          	addi	sp,sp,-16
    8000417c:	00113423          	sd	ra,8(sp)
    80004180:	00813023          	sd	s0,0(sp)
    80004184:	01010413          	addi	s0,sp,16
    return getc();
    80004188:	00000097          	auipc	ra,0x0
    8000418c:	ff0080e7          	jalr	-16(ra) # 80004178 <_ZN7Console4getcEv>
}
    80004190:	00813083          	ld	ra,8(sp)
    80004194:	00013403          	ld	s0,0(sp)
    80004198:	01010113          	addi	sp,sp,16
    8000419c:	00008067          	ret

00000000800041a0 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    800041a0:	ff010113          	addi	sp,sp,-16
    800041a4:	00113423          	sd	ra,8(sp)
    800041a8:	00813023          	sd	s0,0(sp)
    800041ac:	01010413          	addi	s0,sp,16
    putc(c);
    800041b0:	00000097          	auipc	ra,0x0
    800041b4:	ff0080e7          	jalr	-16(ra) # 800041a0 <_ZN7Console4putcEc>
    800041b8:	00813083          	ld	ra,8(sp)
    800041bc:	00013403          	ld	s0,0(sp)
    800041c0:	01010113          	addi	sp,sp,16
    800041c4:	00008067          	ret

00000000800041c8 <_ZN6Thread3runEv>:
    static void threadStart(void *);

protected:
    Thread();

    virtual void run() {}
    800041c8:	ff010113          	addi	sp,sp,-16
    800041cc:	00813423          	sd	s0,8(sp)
    800041d0:	01010413          	addi	s0,sp,16
    800041d4:	00813403          	ld	s0,8(sp)
    800041d8:	01010113          	addi	sp,sp,16
    800041dc:	00008067          	ret

00000000800041e0 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    explicit PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    800041e0:	ff010113          	addi	sp,sp,-16
    800041e4:	00813423          	sd	s0,8(sp)
    800041e8:	01010413          	addi	s0,sp,16
    800041ec:	00813403          	ld	s0,8(sp)
    800041f0:	01010113          	addi	sp,sp,16
    800041f4:	00008067          	ret

00000000800041f8 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800041f8:	ff010113          	addi	sp,sp,-16
    800041fc:	00113423          	sd	ra,8(sp)
    80004200:	00813023          	sd	s0,0(sp)
    80004204:	01010413          	addi	s0,sp,16
    80004208:	00006797          	auipc	a5,0x6
    8000420c:	12078793          	addi	a5,a5,288 # 8000a328 <_ZTV14PeriodicThread+0x10>
    80004210:	00f53023          	sd	a5,0(a0)
    80004214:	00000097          	auipc	ra,0x0
    80004218:	c2c080e7          	jalr	-980(ra) # 80003e40 <_ZN6ThreadD1Ev>
    8000421c:	00813083          	ld	ra,8(sp)
    80004220:	00013403          	ld	s0,0(sp)
    80004224:	01010113          	addi	sp,sp,16
    80004228:	00008067          	ret

000000008000422c <_ZN14PeriodicThreadD0Ev>:
    8000422c:	fe010113          	addi	sp,sp,-32
    80004230:	00113c23          	sd	ra,24(sp)
    80004234:	00813823          	sd	s0,16(sp)
    80004238:	00913423          	sd	s1,8(sp)
    8000423c:	02010413          	addi	s0,sp,32
    80004240:	00050493          	mv	s1,a0
    80004244:	00006797          	auipc	a5,0x6
    80004248:	0e478793          	addi	a5,a5,228 # 8000a328 <_ZTV14PeriodicThread+0x10>
    8000424c:	00f53023          	sd	a5,0(a0)
    80004250:	00000097          	auipc	ra,0x0
    80004254:	bf0080e7          	jalr	-1040(ra) # 80003e40 <_ZN6ThreadD1Ev>
    80004258:	00048513          	mv	a0,s1
    8000425c:	00000097          	auipc	ra,0x0
    80004260:	bbc080e7          	jalr	-1092(ra) # 80003e18 <_ZdlPv>
    80004264:	01813083          	ld	ra,24(sp)
    80004268:	01013403          	ld	s0,16(sp)
    8000426c:	00813483          	ld	s1,8(sp)
    80004270:	02010113          	addi	sp,sp,32
    80004274:	00008067          	ret

0000000080004278 <_ZN5Riscv20handleSupervisorTrapEv>:
#include "../h/c_console.hpp"
#include "../h/c_sleep.hpp"
#include "../h/scheduler.hpp"

__attribute__((unused))
void Riscv::handleSupervisorTrap() {
    80004278:	f9010113          	addi	sp,sp,-112
    8000427c:	06113423          	sd	ra,104(sp)
    80004280:	06813023          	sd	s0,96(sp)
    80004284:	04913c23          	sd	s1,88(sp)
    80004288:	05213823          	sd	s2,80(sp)
    8000428c:	05313423          	sd	s3,72(sp)
    80004290:	05413023          	sd	s4,64(sp)
    80004294:	03513c23          	sd	s5,56(sp)
    80004298:	03613823          	sd	s6,48(sp)
    8000429c:	03713423          	sd	s7,40(sp)
    800042a0:	07010413          	addi	s0,sp,112
    uint64 code, arg1, arg2, arg3, arg4, sstatus, sepc;
    __asm__ volatile("mv %[code], a0" : [code] "=r"(code));
    800042a4:	00050493          	mv	s1,a0
    __asm__ volatile("mv %[arg1], a1" : [arg1] "=r"(arg1));
    800042a8:	00058a13          	mv	s4,a1
    __asm__ volatile("mv %[arg2], a2" : [arg2] "=r"(arg2));
    800042ac:	00060a93          	mv	s5,a2
    __asm__ volatile("mv %[arg3], a3" : [arg3] "=r"(arg3));
    800042b0:	00068b13          	mv	s6,a3
    __asm__ volatile("mv %[arg4], a4" : [arg4] "=r"(arg4));
    800042b4:	00070b93          	mv	s7,a4
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800042b8:	100027f3          	csrr	a5,sstatus
    800042bc:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    800042c0:	fa843983          	ld	s3,-88(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800042c4:	141027f3          	csrr	a5,sepc
    800042c8:	faf43023          	sd	a5,-96(s0)
    return sepc;
    800042cc:	fa043903          	ld	s2,-96(s0)
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    800042d0:	142027f3          	csrr	a5,scause
    800042d4:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    800042d8:	f9843703          	ld	a4,-104(s0)
    sstatus = r_sstatus();
    sepc = r_sepc();
    if (r_scause() == 2) {
    800042dc:	00200793          	li	a5,2
    800042e0:	02f70463          	beq	a4,a5,80004308 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
        print("\nIllegal Instruction\n");
        thread_exit();
    }
    switch (code) {
    800042e4:	04200793          	li	a5,66
    800042e8:	0497e463          	bltu	a5,s1,80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
    800042ec:	00249493          	slli	s1,s1,0x2
    800042f0:	00004717          	auipc	a4,0x4
    800042f4:	df870713          	addi	a4,a4,-520 # 800080e8 <_ZN3stm4coutE+0x50>
    800042f8:	00e484b3          	add	s1,s1,a4
    800042fc:	0004a783          	lw	a5,0(s1)
    80004300:	00e787b3          	add	a5,a5,a4
    80004304:	00078067          	jr	a5
        print("\nIllegal Instruction\n");
    80004308:	00004517          	auipc	a0,0x4
    8000430c:	dc850513          	addi	a0,a0,-568 # 800080d0 <_ZN3stm4coutE+0x38>
    80004310:	ffffe097          	auipc	ra,0xffffe
    80004314:	380080e7          	jalr	896(ra) # 80002690 <_Z5printPKc>
        thread_exit();
    80004318:	ffffd097          	auipc	ra,0xffffd
    8000431c:	298080e7          	jalr	664(ra) # 800015b0 <_Z11thread_exitv>
    80004320:	fc5ff06f          	j	800042e4 <_ZN5Riscv20handleSupervisorTrapEv+0x6c>
        case MEM_ALLOC:
            Allocator::_mem_alloc((int) arg1);
    80004324:	000a051b          	sext.w	a0,s4
    80004328:	fffff097          	auipc	ra,0xfffff
    8000432c:	23c080e7          	jalr	572(ra) # 80003564 <_ZN9Allocator10_mem_allocEm>
            break;
        default:
            break;

    }
    w_sepc(sepc + 4);
    80004330:	00490913          	addi	s2,s2,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80004334:	14191073          	csrw	sepc,s2
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80004338:	10099073          	csrw	sstatus,s3
    w_sstatus(sstatus);
}
    8000433c:	06813083          	ld	ra,104(sp)
    80004340:	06013403          	ld	s0,96(sp)
    80004344:	05813483          	ld	s1,88(sp)
    80004348:	05013903          	ld	s2,80(sp)
    8000434c:	04813983          	ld	s3,72(sp)
    80004350:	04013a03          	ld	s4,64(sp)
    80004354:	03813a83          	ld	s5,56(sp)
    80004358:	03013b03          	ld	s6,48(sp)
    8000435c:	02813b83          	ld	s7,40(sp)
    80004360:	07010113          	addi	sp,sp,112
    80004364:	00008067          	ret
            Allocator::_mem_free((void *) arg1);
    80004368:	000a0513          	mv	a0,s4
    8000436c:	fffff097          	auipc	ra,0xfffff
    80004370:	2b4080e7          	jalr	692(ra) # 80003620 <_ZN9Allocator9_mem_freeEPKv>
            break;
    80004374:	fbdff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            TCB::_thread_create((thread_t *) arg1, (run_t) arg2, (void *) arg3, (void *) arg4);
    80004378:	000b8693          	mv	a3,s7
    8000437c:	000b0613          	mv	a2,s6
    80004380:	000a8593          	mv	a1,s5
    80004384:	000a0513          	mv	a0,s4
    80004388:	00001097          	auipc	ra,0x1
    8000438c:	968080e7          	jalr	-1688(ra) # 80004cf0 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_>
            break;
    80004390:	fa1ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            TCB::_thread_exit();
    80004394:	00001097          	auipc	ra,0x1
    80004398:	e08080e7          	jalr	-504(ra) # 8000519c <_ZN3TCB12_thread_exitEv>
            break;
    8000439c:	f95ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            TCB::_thread_dispatch();
    800043a0:	00001097          	auipc	ra,0x1
    800043a4:	dc4080e7          	jalr	-572(ra) # 80005164 <_ZN3TCB16_thread_dispatchEv>
            break;
    800043a8:	f89ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            TCB::_thread_join((thread_t) arg1);
    800043ac:	000a0513          	mv	a0,s4
    800043b0:	00001097          	auipc	ra,0x1
    800043b4:	e2c080e7          	jalr	-468(ra) # 800051dc <_ZN3TCB12_thread_joinEPS_>
            break;
    800043b8:	f79ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            TCB::_thread_join((thread_t) arg1, (time_t) arg2);
    800043bc:	000a8593          	mv	a1,s5
    800043c0:	000a0513          	mv	a0,s4
    800043c4:	00001097          	auipc	ra,0x1
    800043c8:	e6c080e7          	jalr	-404(ra) # 80005230 <_ZN3TCB12_thread_joinEPS_m>
            break;
    800043cc:	f65ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            TCB::_fork();
    800043d0:	00001097          	auipc	ra,0x1
    800043d4:	ae0080e7          	jalr	-1312(ra) # 80004eb0 <_ZN3TCB5_forkEv>
            break;
    800043d8:	f59ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            TCB::_kill((thread_t) arg1);
    800043dc:	000a0513          	mv	a0,s4
    800043e0:	00000097          	auipc	ra,0x0
    800043e4:	7fc080e7          	jalr	2044(ra) # 80004bdc <_ZN3TCB5_killEPS_>
            break;
    800043e8:	f49ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            Sem::_sem_open((sem_t *) arg1, arg2);
    800043ec:	000a859b          	sext.w	a1,s5
    800043f0:	000a0513          	mv	a0,s4
    800043f4:	ffffe097          	auipc	ra,0xffffe
    800043f8:	eb4080e7          	jalr	-332(ra) # 800022a8 <_ZN3Sem9_sem_openEPPS_j>
            break;
    800043fc:	f35ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            Sem::_sem_close((sem_t) arg1);
    80004400:	000a0513          	mv	a0,s4
    80004404:	ffffe097          	auipc	ra,0xffffe
    80004408:	f84080e7          	jalr	-124(ra) # 80002388 <_ZN3Sem10_sem_closeEPS_>
            break;
    8000440c:	f25ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            Sem::_sem_wait((sem_t) arg1);
    80004410:	000a0513          	mv	a0,s4
    80004414:	ffffe097          	auipc	ra,0xffffe
    80004418:	ff0080e7          	jalr	-16(ra) # 80002404 <_ZN3Sem9_sem_waitEPS_>
            break;
    8000441c:	f15ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            Sem::_sem_signal((sem_t) arg1);
    80004420:	000a0513          	mv	a0,s4
    80004424:	ffffe097          	auipc	ra,0xffffe
    80004428:	ef8080e7          	jalr	-264(ra) # 8000231c <_ZN3Sem11_sem_signalEPS_>
            break;
    8000442c:	f05ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            Sem::_sem_signal((sem_t) arg1);
    80004430:	000a0513          	mv	a0,s4
    80004434:	ffffe097          	auipc	ra,0xffffe
    80004438:	ee8080e7          	jalr	-280(ra) # 8000231c <_ZN3Sem11_sem_signalEPS_>
            Sem::_sem_wait((sem_t) arg2);
    8000443c:	000a8513          	mv	a0,s5
    80004440:	ffffe097          	auipc	ra,0xffffe
    80004444:	fc4080e7          	jalr	-60(ra) # 80002404 <_ZN3Sem9_sem_waitEPS_>
            break;
    80004448:	ee9ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            Cradle::_time_sleep((time_t) arg1);
    8000444c:	000a0513          	mv	a0,s4
    80004450:	fffff097          	auipc	ra,0xfffff
    80004454:	a38080e7          	jalr	-1480(ra) # 80002e88 <_ZN6Cradle11_time_sleepEm>
            break;
    80004458:	ed9ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            Cradle::_thread_wake((thread_t) arg1);
    8000445c:	000a0513          	mv	a0,s4
    80004460:	fffff097          	auipc	ra,0xfffff
    80004464:	a80080e7          	jalr	-1408(ra) # 80002ee0 <_ZN6Cradle12_thread_wakeEP3TCB>
            break;
    80004468:	ec9ff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            IO::_getc();
    8000446c:	ffffe097          	auipc	ra,0xffffe
    80004470:	500080e7          	jalr	1280(ra) # 8000296c <_ZN2IO5_getcEv>
            break;
    80004474:	ebdff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>
            IO::_putc((char) arg1);
    80004478:	0ffa7513          	andi	a0,s4,255
    8000447c:	ffffe097          	auipc	ra,0xffffe
    80004480:	560080e7          	jalr	1376(ra) # 800029dc <_ZN2IO5_putcEc>
            break;
    80004484:	eadff06f          	j	80004330 <_ZN5Riscv20handleSupervisorTrapEv+0xb8>

0000000080004488 <_ZN5Riscv15handleTimerTrapEv>:


__attribute__((unused))
void Riscv::handleTimerTrap() {
    80004488:	ff010113          	addi	sp,sp,-16
    8000448c:	00113423          	sd	ra,8(sp)
    80004490:	00813023          	sd	s0,0(sp)
    80004494:	01010413          	addi	s0,sp,16
    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IO::Output.is_empty()) {
    80004498:	00006797          	auipc	a5,0x6
    8000449c:	f807b783          	ld	a5,-128(a5) # 8000a418 <_GLOBAL_OFFSET_TABLE_+0x18>
    800044a0:	0007b783          	ld	a5,0(a5)
    800044a4:	0007c783          	lbu	a5,0(a5)
    800044a8:	0207f793          	andi	a5,a5,32
    800044ac:	02078c63          	beqz	a5,800044e4 <_ZN5Riscv15handleTimerTrapEv+0x5c>
    800044b0:	00006797          	auipc	a5,0x6
    800044b4:	f607b783          	ld	a5,-160(a5) # 8000a410 <_GLOBAL_OFFSET_TABLE_+0x10>
    800044b8:	0107a783          	lw	a5,16(a5)
    800044bc:	02078463          	beqz	a5,800044e4 <_ZN5Riscv15handleTimerTrapEv+0x5c>
        char c = IO::Output.get();
    800044c0:	00006517          	auipc	a0,0x6
    800044c4:	f5053503          	ld	a0,-176(a0) # 8000a410 <_GLOBAL_OFFSET_TABLE_+0x10>
    800044c8:	ffffe097          	auipc	ra,0xffffe
    800044cc:	460080e7          	jalr	1120(ra) # 80002928 <_ZN8IOBuffer3getEv>
        *(volatile char *) CONSOLE_TX_DATA = c;
    800044d0:	00006797          	auipc	a5,0x6
    800044d4:	f787b783          	ld	a5,-136(a5) # 8000a448 <_GLOBAL_OFFSET_TABLE_+0x48>
    800044d8:	0007b783          	ld	a5,0(a5)
    800044dc:	00a78023          	sb	a0,0(a5)
    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IO::Output.is_empty()) {
    800044e0:	fb9ff06f          	j	80004498 <_ZN5Riscv15handleTimerTrapEv+0x10>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800044e4:	00200793          	li	a5,2
    800044e8:	1447b073          	csrc	sip,a5
    }
    mc_sip(SIP_SSIE);
    Cradle::update();
    800044ec:	fffff097          	auipc	ra,0xfffff
    800044f0:	918080e7          	jalr	-1768(ra) # 80002e04 <_ZN6Cradle6updateEv>
    800044f4:	0480006f          	j	8000453c <_ZN5Riscv15handleTimerTrapEv+0xb4>
        if (next->is_joined() || next->is_sleeping()) {
            next->run();
            Scheduler::put(next);
        }
    }
    TCB::timer_counter++;
    800044f8:	00006717          	auipc	a4,0x6
    800044fc:	f8873703          	ld	a4,-120(a4) # 8000a480 <_GLOBAL_OFFSET_TABLE_+0x80>
    80004500:	00073783          	ld	a5,0(a4)
    80004504:	00178793          	addi	a5,a5,1
    80004508:	00f73023          	sd	a5,0(a4)
    if ((time_t) TCB::timer_counter >= TCB::running->get_time_slice() && !Scheduler::is_empty()) {
    8000450c:	00006717          	auipc	a4,0x6
    80004510:	f6473703          	ld	a4,-156(a4) # 8000a470 <_GLOBAL_OFFSET_TABLE_+0x70>
    80004514:	00073703          	ld	a4,0(a4)

    void set_preempted() { this->preempted = true; }

    void reset_preempted() { this->preempted = false; }

    time_t get_time_slice() const { return this->time_slice; }
    80004518:	05073683          	ld	a3,80(a4)
    8000451c:	04d7fc63          	bgeu	a5,a3,80004574 <_ZN5Riscv15handleTimerTrapEv+0xec>
        TCB::timer_counter = 0;
        TCB::running->set_preempted();
        TCB::_thread_dispatch();
    }
}
    80004520:	00813083          	ld	ra,8(sp)
    80004524:	00013403          	ld	s0,0(sp)
    80004528:	01010113          	addi	sp,sp,16
    8000452c:	00008067          	ret
    void run() { this->status = RUNNABLE; }
    80004530:	04052423          	sw	zero,72(a0)
            Scheduler::put(next);
    80004534:	00000097          	auipc	ra,0x0
    80004538:	294080e7          	jalr	660(ra) # 800047c8 <_ZN9Scheduler3putEP3TCB>
    while (!Cradle::is_empty() && Cradle::peak() == 0) {
    8000453c:	fffff097          	auipc	ra,0xfffff
    80004540:	928080e7          	jalr	-1752(ra) # 80002e64 <_ZN6Cradle8is_emptyEv>
    80004544:	fa051ae3          	bnez	a0,800044f8 <_ZN5Riscv15handleTimerTrapEv+0x70>
    80004548:	fffff097          	auipc	ra,0xfffff
    8000454c:	8ec080e7          	jalr	-1812(ra) # 80002e34 <_ZN6Cradle4peakEv>
    80004550:	fa0514e3          	bnez	a0,800044f8 <_ZN5Riscv15handleTimerTrapEv+0x70>
        thread_t next = Cradle::remove();
    80004554:	fffff097          	auipc	ra,0xfffff
    80004558:	860080e7          	jalr	-1952(ra) # 80002db4 <_ZN6Cradle6removeEv>
    bool is_joined() const { return this->status == JOINED; }
    8000455c:	04852783          	lw	a5,72(a0)
        if (next->is_joined() || next->is_sleeping()) {
    80004560:	00300713          	li	a4,3
    80004564:	fce786e3          	beq	a5,a4,80004530 <_ZN5Riscv15handleTimerTrapEv+0xa8>
    80004568:	00200713          	li	a4,2
    8000456c:	fce798e3          	bne	a5,a4,8000453c <_ZN5Riscv15handleTimerTrapEv+0xb4>
    80004570:	fc1ff06f          	j	80004530 <_ZN5Riscv15handleTimerTrapEv+0xa8>
    80004574:	00006797          	auipc	a5,0x6
    80004578:	f147b783          	ld	a5,-236(a5) # 8000a488 <_GLOBAL_OFFSET_TABLE_+0x88>
    8000457c:	0107a783          	lw	a5,16(a5)
    static void put(TCB *thread);

    static TCB *get();

    static inline bool is_empty() {
        return high_priority.is_empty() && mid_priority.is_empty() && low_priority.is_empty();
    80004580:	02079263          	bnez	a5,800045a4 <_ZN5Riscv15handleTimerTrapEv+0x11c>
    80004584:	00006797          	auipc	a5,0x6
    80004588:	ee47b783          	ld	a5,-284(a5) # 8000a468 <_GLOBAL_OFFSET_TABLE_+0x68>
    8000458c:	0107a783          	lw	a5,16(a5)
    80004590:	00079a63          	bnez	a5,800045a4 <_ZN5Riscv15handleTimerTrapEv+0x11c>
    80004594:	00006797          	auipc	a5,0x6
    80004598:	eac7b783          	ld	a5,-340(a5) # 8000a440 <_GLOBAL_OFFSET_TABLE_+0x40>
    8000459c:	0107a783          	lw	a5,16(a5)
    800045a0:	f80780e3          	beqz	a5,80004520 <_ZN5Riscv15handleTimerTrapEv+0x98>
        TCB::timer_counter = 0;
    800045a4:	00006797          	auipc	a5,0x6
    800045a8:	edc7b783          	ld	a5,-292(a5) # 8000a480 <_GLOBAL_OFFSET_TABLE_+0x80>
    800045ac:	0007b023          	sd	zero,0(a5)
    void set_preempted() { this->preempted = true; }
    800045b0:	00100793          	li	a5,1
    800045b4:	04f70c23          	sb	a5,88(a4)
        TCB::_thread_dispatch();
    800045b8:	00001097          	auipc	ra,0x1
    800045bc:	bac080e7          	jalr	-1108(ra) # 80005164 <_ZN3TCB16_thread_dispatchEv>
}
    800045c0:	f61ff06f          	j	80004520 <_ZN5Riscv15handleTimerTrapEv+0x98>

00000000800045c4 <_ZN5Riscv17handleConsoleTrapEv>:

__attribute__((unused))
void Riscv::handleConsoleTrap() {
    800045c4:	fe010113          	addi	sp,sp,-32
    800045c8:	00113c23          	sd	ra,24(sp)
    800045cc:	00813823          	sd	s0,16(sp)
    800045d0:	02010413          	addi	s0,sp,32
    if (plic_claim() == CONSOLE_IRQ) {
    800045d4:	00001097          	auipc	ra,0x1
    800045d8:	730080e7          	jalr	1840(ra) # 80005d04 <plic_claim>
    800045dc:	00a00793          	li	a5,10
    800045e0:	00f50a63          	beq	a0,a5,800045f4 <_ZN5Riscv17handleConsoleTrapEv+0x30>
            volatile char c = *(char *) CONSOLE_RX_DATA;
            IO::Input.put(c);
        }
        plic_complete(CONSOLE_IRQ);
    }
}
    800045e4:	01813083          	ld	ra,24(sp)
    800045e8:	01013403          	ld	s0,16(sp)
    800045ec:	02010113          	addi	sp,sp,32
    800045f0:	00008067          	ret
        while ((*((char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
    800045f4:	00006797          	auipc	a5,0x6
    800045f8:	e247b783          	ld	a5,-476(a5) # 8000a418 <_GLOBAL_OFFSET_TABLE_+0x18>
    800045fc:	0007b783          	ld	a5,0(a5)
    80004600:	0007c783          	lbu	a5,0(a5)
    80004604:	0017f793          	andi	a5,a5,1
    80004608:	02078a63          	beqz	a5,8000463c <_ZN5Riscv17handleConsoleTrapEv+0x78>
            volatile char c = *(char *) CONSOLE_RX_DATA;
    8000460c:	00006797          	auipc	a5,0x6
    80004610:	dfc7b783          	ld	a5,-516(a5) # 8000a408 <_GLOBAL_OFFSET_TABLE_+0x8>
    80004614:	0007b783          	ld	a5,0(a5)
    80004618:	0007c783          	lbu	a5,0(a5)
    8000461c:	fef407a3          	sb	a5,-17(s0)
            IO::Input.put(c);
    80004620:	fef44583          	lbu	a1,-17(s0)
    80004624:	0ff5f593          	andi	a1,a1,255
    80004628:	00006517          	auipc	a0,0x6
    8000462c:	e3053503          	ld	a0,-464(a0) # 8000a458 <_GLOBAL_OFFSET_TABLE_+0x58>
    80004630:	ffffe097          	auipc	ra,0xffffe
    80004634:	36c080e7          	jalr	876(ra) # 8000299c <_ZN8IOBuffer3putEc>
        while ((*((char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
    80004638:	fbdff06f          	j	800045f4 <_ZN5Riscv17handleConsoleTrapEv+0x30>
        plic_complete(CONSOLE_IRQ);
    8000463c:	00a00513          	li	a0,10
    80004640:	00001097          	auipc	ra,0x1
    80004644:	6fc080e7          	jalr	1788(ra) # 80005d3c <plic_complete>
}
    80004648:	f9dff06f          	j	800045e4 <_ZN5Riscv17handleConsoleTrapEv+0x20>

000000008000464c <_ZN5Riscv10popSppSpieEv>:

void Riscv::popSppSpie() {
    8000464c:	ff010113          	addi	sp,sp,-16
    80004650:	00813423          	sd	s0,8(sp)
    80004654:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80004658:	10000793          	li	a5,256
    8000465c:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    80004660:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80004664:	10200073          	sret
}
    80004668:	00813403          	ld	s0,8(sp)
    8000466c:	01010113          	addi	sp,sp,16
    80004670:	00008067          	ret

0000000080004674 <_ZN5Riscv14handleReadTrapEv>:


__attribute__((unused))
void Riscv::handleReadTrap() {
    80004674:	ff010113          	addi	sp,sp,-16
    80004678:	00813423          	sd	s0,8(sp)
    8000467c:	01010413          	addi	s0,sp,16
    *(volatile char *) CONSOLE_TX_DATA = '!';
    80004680:	00006797          	auipc	a5,0x6
    80004684:	dc87b783          	ld	a5,-568(a5) # 8000a448 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004688:	0007b783          	ld	a5,0(a5)
    8000468c:	02100713          	li	a4,33
    80004690:	00e78023          	sb	a4,0(a5)
    *(volatile char *) CONSOLE_TX_DATA = 'r';
    80004694:	07200713          	li	a4,114
    80004698:	00e78023          	sb	a4,0(a5)
}
    8000469c:	00813403          	ld	s0,8(sp)
    800046a0:	01010113          	addi	sp,sp,16
    800046a4:	00008067          	ret

00000000800046a8 <_ZN5Riscv15handleWriteTrapEv>:


__attribute__((unused))
void Riscv::handleWriteTrap() {
    800046a8:	ff010113          	addi	sp,sp,-16
    800046ac:	00813423          	sd	s0,8(sp)
    800046b0:	01010413          	addi	s0,sp,16
    *(volatile char *) CONSOLE_TX_DATA = '!';
    800046b4:	00006797          	auipc	a5,0x6
    800046b8:	d947b783          	ld	a5,-620(a5) # 8000a448 <_GLOBAL_OFFSET_TABLE_+0x48>
    800046bc:	0007b783          	ld	a5,0(a5)
    800046c0:	02100713          	li	a4,33
    800046c4:	00e78023          	sb	a4,0(a5)
    *(volatile char *) CONSOLE_TX_DATA = 'w';
    800046c8:	07700713          	li	a4,119
    800046cc:	00e78023          	sb	a4,0(a5)
    800046d0:	00813403          	ld	s0,8(sp)
    800046d4:	01010113          	addi	sp,sp,16
    800046d8:	00008067          	ret

00000000800046dc <_ZN9Scheduler3getEv>:
    } else {
        Scheduler::low_priority.put(thread);
    }
}

TCB *Scheduler::get() {
    800046dc:	ff010113          	addi	sp,sp,-16
    800046e0:	00113423          	sd	ra,8(sp)
    800046e4:	00813023          	sd	s0,0(sp)
    800046e8:	01010413          	addi	s0,sp,16
    800046ec:	00006797          	auipc	a5,0x6
    800046f0:	e6c7a783          	lw	a5,-404(a5) # 8000a558 <_ZN9Scheduler13high_priorityE+0x10>
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.get();
    800046f4:	02079863          	bnez	a5,80004724 <_ZN9Scheduler3getEv+0x48>
    800046f8:	00006797          	auipc	a5,0x6
    800046fc:	e787a783          	lw	a5,-392(a5) # 8000a570 <_ZN9Scheduler12mid_priorityE+0x10>
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.get();
    80004700:	02078c63          	beqz	a5,80004738 <_ZN9Scheduler3getEv+0x5c>
    80004704:	00006517          	auipc	a0,0x6
    80004708:	e5c50513          	addi	a0,a0,-420 # 8000a560 <_ZN9Scheduler12mid_priorityE>
    8000470c:	ffffe097          	auipc	ra,0xffffe
    80004710:	ddc080e7          	jalr	-548(ra) # 800024e8 <_ZN3stm14CircularBufferIP3TCBE3getEv>
    return Scheduler::low_priority.get();
}
    80004714:	00813083          	ld	ra,8(sp)
    80004718:	00013403          	ld	s0,0(sp)
    8000471c:	01010113          	addi	sp,sp,16
    80004720:	00008067          	ret
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.get();
    80004724:	00006517          	auipc	a0,0x6
    80004728:	e2450513          	addi	a0,a0,-476 # 8000a548 <_ZN9Scheduler13high_priorityE>
    8000472c:	ffffe097          	auipc	ra,0xffffe
    80004730:	dbc080e7          	jalr	-580(ra) # 800024e8 <_ZN3stm14CircularBufferIP3TCBE3getEv>
    80004734:	fe1ff06f          	j	80004714 <_ZN9Scheduler3getEv+0x38>
    return Scheduler::low_priority.get();
    80004738:	00006517          	auipc	a0,0x6
    8000473c:	e4050513          	addi	a0,a0,-448 # 8000a578 <_ZN9Scheduler12low_priorityE>
    80004740:	ffffe097          	auipc	ra,0xffffe
    80004744:	da8080e7          	jalr	-600(ra) # 800024e8 <_ZN3stm14CircularBufferIP3TCBE3getEv>
    80004748:	fcdff06f          	j	80004714 <_ZN9Scheduler3getEv+0x38>

000000008000474c <_ZN9Scheduler4peekEv>:

TCB *Scheduler::peek() {
    8000474c:	ff010113          	addi	sp,sp,-16
    80004750:	00113423          	sd	ra,8(sp)
    80004754:	00813023          	sd	s0,0(sp)
    80004758:	01010413          	addi	s0,sp,16
    8000475c:	00006797          	auipc	a5,0x6
    80004760:	dfc7a783          	lw	a5,-516(a5) # 8000a558 <_ZN9Scheduler13high_priorityE+0x10>
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.peek();
    80004764:	02078463          	beqz	a5,8000478c <_ZN9Scheduler4peekEv+0x40>
    80004768:	00006517          	auipc	a0,0x6
    8000476c:	de050513          	addi	a0,a0,-544 # 8000a548 <_ZN9Scheduler13high_priorityE>
    80004770:	00000097          	auipc	ra,0x0
    80004774:	100080e7          	jalr	256(ra) # 80004870 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    80004778:	00053503          	ld	a0,0(a0)
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.peek();
    return Scheduler::low_priority.peek();
}
    8000477c:	00813083          	ld	ra,8(sp)
    80004780:	00013403          	ld	s0,0(sp)
    80004784:	01010113          	addi	sp,sp,16
    80004788:	00008067          	ret
    8000478c:	00006797          	auipc	a5,0x6
    80004790:	de47a783          	lw	a5,-540(a5) # 8000a570 <_ZN9Scheduler12mid_priorityE+0x10>
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.peek();
    80004794:	00078e63          	beqz	a5,800047b0 <_ZN9Scheduler4peekEv+0x64>
    80004798:	00006517          	auipc	a0,0x6
    8000479c:	dc850513          	addi	a0,a0,-568 # 8000a560 <_ZN9Scheduler12mid_priorityE>
    800047a0:	00000097          	auipc	ra,0x0
    800047a4:	0d0080e7          	jalr	208(ra) # 80004870 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    800047a8:	00053503          	ld	a0,0(a0)
    800047ac:	fd1ff06f          	j	8000477c <_ZN9Scheduler4peekEv+0x30>
    return Scheduler::low_priority.peek();
    800047b0:	00006517          	auipc	a0,0x6
    800047b4:	dc850513          	addi	a0,a0,-568 # 8000a578 <_ZN9Scheduler12low_priorityE>
    800047b8:	00000097          	auipc	ra,0x0
    800047bc:	0b8080e7          	jalr	184(ra) # 80004870 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    800047c0:	00053503          	ld	a0,0(a0)
    800047c4:	fb9ff06f          	j	8000477c <_ZN9Scheduler4peekEv+0x30>

00000000800047c8 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *thread) {
    800047c8:	ff010113          	addi	sp,sp,-16
    800047cc:	00113423          	sd	ra,8(sp)
    800047d0:	00813023          	sd	s0,0(sp)
    800047d4:	01010413          	addi	s0,sp,16
    800047d8:	00050593          	mv	a1,a0
    bool was_preempted() const { return this->preempted; }
    800047dc:	05854783          	lbu	a5,88(a0)
    if (!thread->was_preempted()) {
    800047e0:	02078e63          	beqz	a5,8000481c <_ZN9Scheduler3putEP3TCB+0x54>
    void reset_preempted() { this->preempted = false; }
    800047e4:	04050c23          	sb	zero,88(a0)
    time_t get_time_slice() const { return this->time_slice; }
    800047e8:	05053783          	ld	a5,80(a0)
    if (time_slice == TimeSlice::HIGH_PRIORITY) {
    800047ec:	00100713          	li	a4,1
    800047f0:	04e78463          	beq	a5,a4,80004838 <_ZN9Scheduler3putEP3TCB+0x70>
    } else if (time_slice == TimeSlice::MID_PRIORITY) {
    800047f4:	00200713          	li	a4,2
    800047f8:	04e78e63          	beq	a5,a4,80004854 <_ZN9Scheduler3putEP3TCB+0x8c>
        Scheduler::low_priority.put(thread);
    800047fc:	00006517          	auipc	a0,0x6
    80004800:	d7c50513          	addi	a0,a0,-644 # 8000a578 <_ZN9Scheduler12low_priorityE>
    80004804:	ffffe097          	auipc	ra,0xffffe
    80004808:	e08080e7          	jalr	-504(ra) # 8000260c <_ZN3stm14CircularBufferIP3TCBE3putES2_>
}
    8000480c:	00813083          	ld	ra,8(sp)
    80004810:	00013403          	ld	s0,0(sp)
    80004814:	01010113          	addi	sp,sp,16
    80004818:	00008067          	ret

    void set_time_slice(time_t time) { this->time_slice = time;}
    8000481c:	00100793          	li	a5,1
    80004820:	04f53823          	sd	a5,80(a0)
        Scheduler::high_priority.put(thread);
    80004824:	00006517          	auipc	a0,0x6
    80004828:	d2450513          	addi	a0,a0,-732 # 8000a548 <_ZN9Scheduler13high_priorityE>
    8000482c:	ffffe097          	auipc	ra,0xffffe
    80004830:	de0080e7          	jalr	-544(ra) # 8000260c <_ZN3stm14CircularBufferIP3TCBE3putES2_>
        return;
    80004834:	fd9ff06f          	j	8000480c <_ZN9Scheduler3putEP3TCB+0x44>
    80004838:	00200793          	li	a5,2
    8000483c:	04f53823          	sd	a5,80(a0)
        Scheduler::mid_priority.put(thread);
    80004840:	00006517          	auipc	a0,0x6
    80004844:	d2050513          	addi	a0,a0,-736 # 8000a560 <_ZN9Scheduler12mid_priorityE>
    80004848:	ffffe097          	auipc	ra,0xffffe
    8000484c:	dc4080e7          	jalr	-572(ra) # 8000260c <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    80004850:	fbdff06f          	j	8000480c <_ZN9Scheduler3putEP3TCB+0x44>
    80004854:	00400793          	li	a5,4
    80004858:	04f53823          	sd	a5,80(a0)
        Scheduler::low_priority.put(thread);
    8000485c:	00006517          	auipc	a0,0x6
    80004860:	d1c50513          	addi	a0,a0,-740 # 8000a578 <_ZN9Scheduler12low_priorityE>
    80004864:	ffffe097          	auipc	ra,0xffffe
    80004868:	da8080e7          	jalr	-600(ra) # 8000260c <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    8000486c:	fa1ff06f          	j	8000480c <_ZN9Scheduler3putEP3TCB+0x44>

0000000080004870 <_ZN3stm14CircularBufferIP3TCBE4peekEv>:
T &stm::CircularBuffer<T>::peek() {
    80004870:	ff010113          	addi	sp,sp,-16
    80004874:	00813423          	sd	s0,8(sp)
    80004878:	01010413          	addi	s0,sp,16
    return this->queue[this->head];
    8000487c:	00053703          	ld	a4,0(a0)
    80004880:	00852783          	lw	a5,8(a0)
    80004884:	00379793          	slli	a5,a5,0x3
}
    80004888:	00f70533          	add	a0,a4,a5
    8000488c:	00813403          	ld	s0,8(sp)
    80004890:	01010113          	addi	sp,sp,16
    80004894:	00008067          	ret

0000000080004898 <_ZN10OwnedMutexD1Ev>:

OwnedMutex::OwnedMutex() : owner(nullptr), nesting_count(0) {
    sem_open(&this->myHandle, 1);
}

OwnedMutex::~OwnedMutex() {
    80004898:	fe010113          	addi	sp,sp,-32
    8000489c:	00113c23          	sd	ra,24(sp)
    800048a0:	00813823          	sd	s0,16(sp)
    800048a4:	00913423          	sd	s1,8(sp)
    800048a8:	02010413          	addi	s0,sp,32
    800048ac:	00050493          	mv	s1,a0
    800048b0:	00006797          	auipc	a5,0x6
    800048b4:	b3078793          	addi	a5,a5,-1232 # 8000a3e0 <_ZTV10OwnedMutex+0x10>
    800048b8:	00f53023          	sd	a5,0(a0)
    sem_close(this->myHandle);
    800048bc:	00853503          	ld	a0,8(a0)
    800048c0:	ffffd097          	auipc	ra,0xffffd
    800048c4:	f00080e7          	jalr	-256(ra) # 800017c0 <_Z9sem_closeP3Sem>
class Mutex : public Semaphore {
    800048c8:	00006797          	auipc	a5,0x6
    800048cc:	ae878793          	addi	a5,a5,-1304 # 8000a3b0 <_ZTV5Mutex+0x10>
    800048d0:	00f4b023          	sd	a5,0(s1)
    800048d4:	00048513          	mv	a0,s1
    800048d8:	fffff097          	auipc	ra,0xfffff
    800048dc:	460080e7          	jalr	1120(ra) # 80003d38 <_ZN9SemaphoreD1Ev>
}
    800048e0:	01813083          	ld	ra,24(sp)
    800048e4:	01013403          	ld	s0,16(sp)
    800048e8:	00813483          	ld	s1,8(sp)
    800048ec:	02010113          	addi	sp,sp,32
    800048f0:	00008067          	ret

00000000800048f4 <_ZN10OwnedMutexD0Ev>:
OwnedMutex::~OwnedMutex() {
    800048f4:	fe010113          	addi	sp,sp,-32
    800048f8:	00113c23          	sd	ra,24(sp)
    800048fc:	00813823          	sd	s0,16(sp)
    80004900:	00913423          	sd	s1,8(sp)
    80004904:	02010413          	addi	s0,sp,32
    80004908:	00050493          	mv	s1,a0
}
    8000490c:	00000097          	auipc	ra,0x0
    80004910:	f8c080e7          	jalr	-116(ra) # 80004898 <_ZN10OwnedMutexD1Ev>
    80004914:	00048513          	mv	a0,s1
    80004918:	fffff097          	auipc	ra,0xfffff
    8000491c:	500080e7          	jalr	1280(ra) # 80003e18 <_ZdlPv>
    80004920:	01813083          	ld	ra,24(sp)
    80004924:	01013403          	ld	s0,16(sp)
    80004928:	00813483          	ld	s1,8(sp)
    8000492c:	02010113          	addi	sp,sp,32
    80004930:	00008067          	ret

0000000080004934 <_ZN10OwnedMutex4waitEv>:

int OwnedMutex::wait() {
    if (this->owner == TCB::running) {
    80004934:	01053783          	ld	a5,16(a0)
    80004938:	00006717          	auipc	a4,0x6
    8000493c:	b3873703          	ld	a4,-1224(a4) # 8000a470 <_GLOBAL_OFFSET_TABLE_+0x70>
    80004940:	00073703          	ld	a4,0(a4)
    80004944:	02e78c63          	beq	a5,a4,8000497c <_ZN10OwnedMutex4waitEv+0x48>
int OwnedMutex::wait() {
    80004948:	ff010113          	addi	sp,sp,-16
    8000494c:	00113423          	sd	ra,8(sp)
    80004950:	00813023          	sd	s0,0(sp)
    80004954:	01010413          	addi	s0,sp,16
        this->nesting_count++;
        return 0;
    }
    if (this->owner == nullptr) {
    80004958:	02078c63          	beqz	a5,80004990 <_ZN10OwnedMutex4waitEv+0x5c>
        this->owner = TCB::running;
        this->nesting_count = 1;
    }
    sem_wait(this->myHandle);
    8000495c:	00853503          	ld	a0,8(a0)
    80004960:	ffffd097          	auipc	ra,0xffffd
    80004964:	eac080e7          	jalr	-340(ra) # 8000180c <_Z8sem_waitP3Sem>
    return 0;
}
    80004968:	00000513          	li	a0,0
    8000496c:	00813083          	ld	ra,8(sp)
    80004970:	00013403          	ld	s0,0(sp)
    80004974:	01010113          	addi	sp,sp,16
    80004978:	00008067          	ret
        this->nesting_count++;
    8000497c:	01852783          	lw	a5,24(a0)
    80004980:	0017879b          	addiw	a5,a5,1
    80004984:	00f52c23          	sw	a5,24(a0)
}
    80004988:	00000513          	li	a0,0
    8000498c:	00008067          	ret
        this->owner = TCB::running;
    80004990:	00e53823          	sd	a4,16(a0)
        this->nesting_count = 1;
    80004994:	00100793          	li	a5,1
    80004998:	00f52c23          	sw	a5,24(a0)
    8000499c:	fc1ff06f          	j	8000495c <_ZN10OwnedMutex4waitEv+0x28>

00000000800049a0 <_ZN10OwnedMutex6signalEv>:

int OwnedMutex::signal() {
    if (this->owner != TCB::running) return -1;
    800049a0:	01053703          	ld	a4,16(a0)
    800049a4:	00006797          	auipc	a5,0x6
    800049a8:	acc7b783          	ld	a5,-1332(a5) # 8000a470 <_GLOBAL_OFFSET_TABLE_+0x70>
    800049ac:	0007b783          	ld	a5,0(a5)
    800049b0:	04f71a63          	bne	a4,a5,80004a04 <_ZN10OwnedMutex6signalEv+0x64>
    this->nesting_count --;
    800049b4:	01852783          	lw	a5,24(a0)
    800049b8:	fff7879b          	addiw	a5,a5,-1
    800049bc:	0007871b          	sext.w	a4,a5
    800049c0:	00f52c23          	sw	a5,24(a0)
    if (this->nesting_count == 0) {
    800049c4:	00070663          	beqz	a4,800049d0 <_ZN10OwnedMutex6signalEv+0x30>
        this->owner = nullptr;
        sem_signal(this->myHandle);
    }
    return 0;
    800049c8:	00000513          	li	a0,0
}
    800049cc:	00008067          	ret
int OwnedMutex::signal() {
    800049d0:	ff010113          	addi	sp,sp,-16
    800049d4:	00113423          	sd	ra,8(sp)
    800049d8:	00813023          	sd	s0,0(sp)
    800049dc:	01010413          	addi	s0,sp,16
        this->owner = nullptr;
    800049e0:	00053823          	sd	zero,16(a0)
        sem_signal(this->myHandle);
    800049e4:	00853503          	ld	a0,8(a0)
    800049e8:	ffffd097          	auipc	ra,0xffffd
    800049ec:	e70080e7          	jalr	-400(ra) # 80001858 <_Z10sem_signalP3Sem>
    return 0;
    800049f0:	00000513          	li	a0,0
}
    800049f4:	00813083          	ld	ra,8(sp)
    800049f8:	00013403          	ld	s0,0(sp)
    800049fc:	01010113          	addi	sp,sp,16
    80004a00:	00008067          	ret
    if (this->owner != TCB::running) return -1;
    80004a04:	fff00513          	li	a0,-1
    80004a08:	00008067          	ret

0000000080004a0c <_ZN10OwnedMutexC1Ev>:
OwnedMutex::OwnedMutex() : owner(nullptr), nesting_count(0) {
    80004a0c:	fe010113          	addi	sp,sp,-32
    80004a10:	00113c23          	sd	ra,24(sp)
    80004a14:	00813823          	sd	s0,16(sp)
    80004a18:	00913423          	sd	s1,8(sp)
    80004a1c:	01213023          	sd	s2,0(sp)
    80004a20:	02010413          	addi	s0,sp,32
    80004a24:	00050493          	mv	s1,a0
    Mutex() : Semaphore(1) {}
    80004a28:	00100593          	li	a1,1
    80004a2c:	fffff097          	auipc	ra,0xfffff
    80004a30:	66c080e7          	jalr	1644(ra) # 80004098 <_ZN9SemaphoreC1Ej>
    80004a34:	00006797          	auipc	a5,0x6
    80004a38:	9ac78793          	addi	a5,a5,-1620 # 8000a3e0 <_ZTV10OwnedMutex+0x10>
    80004a3c:	00f4b023          	sd	a5,0(s1)
    80004a40:	0004b823          	sd	zero,16(s1)
    80004a44:	0004ac23          	sw	zero,24(s1)
    sem_open(&this->myHandle, 1);
    80004a48:	00100593          	li	a1,1
    80004a4c:	00848513          	addi	a0,s1,8
    80004a50:	ffffd097          	auipc	ra,0xffffd
    80004a54:	d20080e7          	jalr	-736(ra) # 80001770 <_Z8sem_openPP3Semj>
    80004a58:	02c0006f          	j	80004a84 <_ZN10OwnedMutexC1Ev+0x78>
    80004a5c:	00050913          	mv	s2,a0
class Mutex : public Semaphore {
    80004a60:	00006797          	auipc	a5,0x6
    80004a64:	95078793          	addi	a5,a5,-1712 # 8000a3b0 <_ZTV5Mutex+0x10>
    80004a68:	00f4b023          	sd	a5,0(s1)
    80004a6c:	00048513          	mv	a0,s1
    80004a70:	fffff097          	auipc	ra,0xfffff
    80004a74:	2c8080e7          	jalr	712(ra) # 80003d38 <_ZN9SemaphoreD1Ev>
    80004a78:	00090513          	mv	a0,s2
    80004a7c:	00007097          	auipc	ra,0x7
    80004a80:	bfc080e7          	jalr	-1028(ra) # 8000b678 <_Unwind_Resume>
}
    80004a84:	01813083          	ld	ra,24(sp)
    80004a88:	01013403          	ld	s0,16(sp)
    80004a8c:	00813483          	ld	s1,8(sp)
    80004a90:	00013903          	ld	s2,0(sp)
    80004a94:	02010113          	addi	sp,sp,32
    80004a98:	00008067          	ret

0000000080004a9c <_ZN5MutexD1Ev>:
    80004a9c:	ff010113          	addi	sp,sp,-16
    80004aa0:	00113423          	sd	ra,8(sp)
    80004aa4:	00813023          	sd	s0,0(sp)
    80004aa8:	01010413          	addi	s0,sp,16
    80004aac:	00006797          	auipc	a5,0x6
    80004ab0:	90478793          	addi	a5,a5,-1788 # 8000a3b0 <_ZTV5Mutex+0x10>
    80004ab4:	00f53023          	sd	a5,0(a0)
    80004ab8:	fffff097          	auipc	ra,0xfffff
    80004abc:	280080e7          	jalr	640(ra) # 80003d38 <_ZN9SemaphoreD1Ev>
    80004ac0:	00813083          	ld	ra,8(sp)
    80004ac4:	00013403          	ld	s0,0(sp)
    80004ac8:	01010113          	addi	sp,sp,16
    80004acc:	00008067          	ret

0000000080004ad0 <_ZN5MutexD0Ev>:
    80004ad0:	fe010113          	addi	sp,sp,-32
    80004ad4:	00113c23          	sd	ra,24(sp)
    80004ad8:	00813823          	sd	s0,16(sp)
    80004adc:	00913423          	sd	s1,8(sp)
    80004ae0:	02010413          	addi	s0,sp,32
    80004ae4:	00050493          	mv	s1,a0
    80004ae8:	00006797          	auipc	a5,0x6
    80004aec:	8c878793          	addi	a5,a5,-1848 # 8000a3b0 <_ZTV5Mutex+0x10>
    80004af0:	00f53023          	sd	a5,0(a0)
    80004af4:	fffff097          	auipc	ra,0xfffff
    80004af8:	244080e7          	jalr	580(ra) # 80003d38 <_ZN9SemaphoreD1Ev>
    80004afc:	00048513          	mv	a0,s1
    80004b00:	fffff097          	auipc	ra,0xfffff
    80004b04:	318080e7          	jalr	792(ra) # 80003e18 <_ZdlPv>
    80004b08:	01813083          	ld	ra,24(sp)
    80004b0c:	01013403          	ld	s0,16(sp)
    80004b10:	00813483          	ld	s1,8(sp)
    80004b14:	02010113          	addi	sp,sp,32
    80004b18:	00008067          	ret

0000000080004b1c <_ZN3TCB12thread_startEv>:
    if (TCB::running != thread->parent) return -4;
    thread->finish();
    return 0;
}

void TCB::thread_start() {
    80004b1c:	ff010113          	addi	sp,sp,-16
    80004b20:	00113423          	sd	ra,8(sp)
    80004b24:	00813023          	sd	s0,0(sp)
    80004b28:	01010413          	addi	s0,sp,16
    Riscv::popSppSpie();
    80004b2c:	00000097          	auipc	ra,0x0
    80004b30:	b20080e7          	jalr	-1248(ra) # 8000464c <_ZN5Riscv10popSppSpieEv>
    TCB::running->_run(TCB::running->arg);
    80004b34:	00006797          	auipc	a5,0x6
    80004b38:	a5c7b783          	ld	a5,-1444(a5) # 8000a590 <_ZN3TCB7runningE>
    80004b3c:	0087b703          	ld	a4,8(a5)
    80004b40:	0107b503          	ld	a0,16(a5)
    80004b44:	000700e7          	jalr	a4
    thread_exit();
    80004b48:	ffffd097          	auipc	ra,0xffffd
    80004b4c:	a68080e7          	jalr	-1432(ra) # 800015b0 <_Z11thread_exitv>
    80004b50:	00813083          	ld	ra,8(sp)
    80004b54:	00013403          	ld	s0,0(sp)
    80004b58:	01010113          	addi	sp,sp,16
    80004b5c:	00008067          	ret

0000000080004b60 <_ZN3TCB9duplicateEPS_S0_>:
void TCB::duplicate(TCB *parent, TCB *child) {
    80004b60:	fe010113          	addi	sp,sp,-32
    80004b64:	00113c23          	sd	ra,24(sp)
    80004b68:	00813823          	sd	s0,16(sp)
    80004b6c:	00913423          	sd	s1,8(sp)
    80004b70:	01213023          	sd	s2,0(sp)
    80004b74:	02010413          	addi	s0,sp,32
    80004b78:	00050913          	mv	s2,a0
    80004b7c:	00058493          	mv	s1,a1
    Riscv::push();
    80004b80:	ffffc097          	auipc	ra,0xffffc
    80004b84:	7e0080e7          	jalr	2016(ra) # 80001360 <_ZN5Riscv4pushEv>
    memcpy(parent->stack, child->stack, DEFAULT_STACK_SIZE);
    80004b88:	00004637          	lui	a2,0x4
    80004b8c:	0184b583          	ld	a1,24(s1)
    80004b90:	01893503          	ld	a0,24(s2)
    80004b94:	fffff097          	auipc	ra,0xfffff
    80004b98:	ca8080e7          	jalr	-856(ra) # 8000383c <_Z6memcpyPKvS0_i>
    child->context = parent->context;
    80004b9c:	02893603          	ld	a2,40(s2)
    80004ba0:	03093683          	ld	a3,48(s2)
    80004ba4:	03893703          	ld	a4,56(s2)
    80004ba8:	04093783          	ld	a5,64(s2)
    80004bac:	02c4b423          	sd	a2,40(s1)
    80004bb0:	02d4b823          	sd	a3,48(s1)
    80004bb4:	02e4bc23          	sd	a4,56(s1)
    80004bb8:	04f4b023          	sd	a5,64(s1)
    Riscv::pop();
    80004bbc:	ffffd097          	auipc	ra,0xffffd
    80004bc0:	824080e7          	jalr	-2012(ra) # 800013e0 <_ZN5Riscv3popEv>
}
    80004bc4:	01813083          	ld	ra,24(sp)
    80004bc8:	01013403          	ld	s0,16(sp)
    80004bcc:	00813483          	ld	s1,8(sp)
    80004bd0:	00013903          	ld	s2,0(sp)
    80004bd4:	02010113          	addi	sp,sp,32
    80004bd8:	00008067          	ret

0000000080004bdc <_ZN3TCB5_killEPS_>:
int TCB::_kill(TCB *thread) {
    80004bdc:	ff010113          	addi	sp,sp,-16
    80004be0:	00813423          	sd	s0,8(sp)
    80004be4:	01010413          	addi	s0,sp,16
    if (!thread) return -1;
    80004be8:	02050c63          	beqz	a0,80004c20 <_ZN3TCB5_killEPS_+0x44>
    bool is_finished() const { return this->status == FINISHED; }
    80004bec:	04852703          	lw	a4,72(a0)
    if (thread->is_finished()) return -2;
    80004bf0:	00400793          	li	a5,4
    80004bf4:	02f70a63          	beq	a4,a5,80004c28 <_ZN3TCB5_killEPS_+0x4c>
    if (TCB::running != thread->parent) return -4;
    80004bf8:	02053703          	ld	a4,32(a0)
    80004bfc:	00006797          	auipc	a5,0x6
    80004c00:	9947b783          	ld	a5,-1644(a5) # 8000a590 <_ZN3TCB7runningE>
    80004c04:	02f71663          	bne	a4,a5,80004c30 <_ZN3TCB5_killEPS_+0x54>
    void finish() { this->status = FINISHED; }
    80004c08:	00400793          	li	a5,4
    80004c0c:	04f52423          	sw	a5,72(a0)
    return 0;
    80004c10:	00000513          	li	a0,0
}
    80004c14:	00813403          	ld	s0,8(sp)
    80004c18:	01010113          	addi	sp,sp,16
    80004c1c:	00008067          	ret
    if (!thread) return -1;
    80004c20:	fff00513          	li	a0,-1
    80004c24:	ff1ff06f          	j	80004c14 <_ZN3TCB5_killEPS_+0x38>
    if (thread->is_finished()) return -2;
    80004c28:	ffe00513          	li	a0,-2
    80004c2c:	fe9ff06f          	j	80004c14 <_ZN3TCB5_killEPS_+0x38>
    if (TCB::running != thread->parent) return -4;
    80004c30:	ffc00513          	li	a0,-4
    80004c34:	fe1ff06f          	j	80004c14 <_ZN3TCB5_killEPS_+0x38>

0000000080004c38 <_ZN3TCBC1EPFvPvES0_S0_7Context>:
TCB::TCB(run_t start_routine, void *arg, void *stack, Context context) :
    80004c38:	fe010113          	addi	sp,sp,-32
    80004c3c:	00113c23          	sd	ra,24(sp)
    80004c40:	00813823          	sd	s0,16(sp)
    80004c44:	00913423          	sd	s1,8(sp)
    80004c48:	01213023          	sd	s2,0(sp)
    80004c4c:	02010413          	addi	s0,sp,32
    80004c50:	00050493          	mv	s1,a0
        t_id(TCB::ID++), _run(start_routine), arg(arg),
    80004c54:	00006917          	auipc	s2,0x6
    80004c58:	93c90913          	addi	s2,s2,-1732 # 8000a590 <_ZN3TCB7runningE>
    80004c5c:	00892783          	lw	a5,8(s2)
    80004c60:	0017851b          	addiw	a0,a5,1
    80004c64:	00a92423          	sw	a0,8(s2)
        time_slice(DEFAULT_TIME_SLICE), preempted(false), joiner() {
    80004c68:	00f4a023          	sw	a5,0(s1)
    80004c6c:	00b4b423          	sd	a1,8(s1)
    80004c70:	00c4b823          	sd	a2,16(s1)
    80004c74:	00d4bc23          	sd	a3,24(s1)
    80004c78:	00093783          	ld	a5,0(s2)
    80004c7c:	02f4b023          	sd	a5,32(s1)
    80004c80:	00073583          	ld	a1,0(a4)
    80004c84:	00873603          	ld	a2,8(a4)
    80004c88:	01073683          	ld	a3,16(a4)
    80004c8c:	01873783          	ld	a5,24(a4)
    80004c90:	02b4b423          	sd	a1,40(s1)
    80004c94:	02c4b823          	sd	a2,48(s1)
    80004c98:	02d4bc23          	sd	a3,56(s1)
    80004c9c:	04f4b023          	sd	a5,64(s1)
    80004ca0:	0404a423          	sw	zero,72(s1)
    80004ca4:	00100793          	li	a5,1
    80004ca8:	04f4b823          	sd	a5,80(s1)
    80004cac:	04048c23          	sb	zero,88(s1)
    80004cb0:	0604b023          	sd	zero,96(s1)
    80004cb4:	0604a423          	sw	zero,104(s1)
    80004cb8:	0604a623          	sw	zero,108(s1)
    80004cbc:	0604a823          	sw	zero,112(s1)
    80004cc0:	0604aa23          	sw	zero,116(s1)
    this->joiner.init();
    80004cc4:	06048513          	addi	a0,s1,96
    80004cc8:	ffffd097          	auipc	ra,0xffffd
    80004ccc:	7d0080e7          	jalr	2000(ra) # 80002498 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    this->parent = TCB::running;
    80004cd0:	00093783          	ld	a5,0(s2)
    80004cd4:	02f4b023          	sd	a5,32(s1)
}
    80004cd8:	01813083          	ld	ra,24(sp)
    80004cdc:	01013403          	ld	s0,16(sp)
    80004ce0:	00813483          	ld	s1,8(sp)
    80004ce4:	00013903          	ld	s2,0(sp)
    80004ce8:	02010113          	addi	sp,sp,32
    80004cec:	00008067          	ret

0000000080004cf0 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_>:
int TCB::_thread_create(thread_t *handle, void(*start_routine)(void *), void *arg, void *stack) {
    80004cf0:	f8010113          	addi	sp,sp,-128
    80004cf4:	06113c23          	sd	ra,120(sp)
    80004cf8:	06813823          	sd	s0,112(sp)
    80004cfc:	06913423          	sd	s1,104(sp)
    80004d00:	07213023          	sd	s2,96(sp)
    80004d04:	05313c23          	sd	s3,88(sp)
    80004d08:	05413823          	sd	s4,80(sp)
    80004d0c:	05513423          	sd	s5,72(sp)
    80004d10:	08010413          	addi	s0,sp,128
    80004d14:	00050493          	mv	s1,a0
    80004d18:	00058913          	mv	s2,a1
    80004d1c:	00060a93          	mv	s5,a2
    80004d20:	00068993          	mv	s3,a3
    *handle = new TCB(start_routine, arg, stack, {(uint64) thread_start, (uint64) stack + DEFAULT_STACK_SIZE - 1});
    80004d24:	fa043823          	sd	zero,-80(s0)
    80004d28:	fa043c23          	sd	zero,-72(s0)
    80004d2c:	00000797          	auipc	a5,0x0
    80004d30:	df078793          	addi	a5,a5,-528 # 80004b1c <_ZN3TCB12thread_startEv>
    80004d34:	faf43023          	sd	a5,-96(s0)
    80004d38:	000047b7          	lui	a5,0x4
    80004d3c:	fff78793          	addi	a5,a5,-1 # 3fff <_entry-0x7fffc001>
    80004d40:	00f687b3          	add	a5,a3,a5
    80004d44:	faf43423          	sd	a5,-88(s0)
    80004d48:	07800513          	li	a0,120
    80004d4c:	fffff097          	auipc	ra,0xfffff
    80004d50:	07c080e7          	jalr	124(ra) # 80003dc8 <_Znwm>
    80004d54:	00050a13          	mv	s4,a0
    80004d58:	fa043783          	ld	a5,-96(s0)
    80004d5c:	f8f43023          	sd	a5,-128(s0)
    80004d60:	fa843783          	ld	a5,-88(s0)
    80004d64:	f8f43423          	sd	a5,-120(s0)
    80004d68:	fb043783          	ld	a5,-80(s0)
    80004d6c:	f8f43823          	sd	a5,-112(s0)
    80004d70:	fb843783          	ld	a5,-72(s0)
    80004d74:	f8f43c23          	sd	a5,-104(s0)
    80004d78:	f8040713          	addi	a4,s0,-128
    80004d7c:	00098693          	mv	a3,s3
    80004d80:	000a8613          	mv	a2,s5
    80004d84:	00090593          	mv	a1,s2
    80004d88:	00000097          	auipc	ra,0x0
    80004d8c:	eb0080e7          	jalr	-336(ra) # 80004c38 <_ZN3TCBC1EPFvPvES0_S0_7Context>
    80004d90:	0144b023          	sd	s4,0(s1)
    if (start_routine) Scheduler::put(*handle);
    80004d94:	00090863          	beqz	s2,80004da4 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0xb4>
    80004d98:	000a0513          	mv	a0,s4
    80004d9c:	00000097          	auipc	ra,0x0
    80004da0:	a2c080e7          	jalr	-1492(ra) # 800047c8 <_ZN9Scheduler3putEP3TCB>
    return (*handle)->t_id;
    80004da4:	0004b783          	ld	a5,0(s1)
    80004da8:	0007a503          	lw	a0,0(a5)
}
    80004dac:	07813083          	ld	ra,120(sp)
    80004db0:	07013403          	ld	s0,112(sp)
    80004db4:	06813483          	ld	s1,104(sp)
    80004db8:	06013903          	ld	s2,96(sp)
    80004dbc:	05813983          	ld	s3,88(sp)
    80004dc0:	05013a03          	ld	s4,80(sp)
    80004dc4:	04813a83          	ld	s5,72(sp)
    80004dc8:	08010113          	addi	sp,sp,128
    80004dcc:	00008067          	ret
    80004dd0:	00050493          	mv	s1,a0
    *handle = new TCB(start_routine, arg, stack, {(uint64) thread_start, (uint64) stack + DEFAULT_STACK_SIZE - 1});
    80004dd4:	000a0513          	mv	a0,s4
    80004dd8:	fffff097          	auipc	ra,0xfffff
    80004ddc:	040080e7          	jalr	64(ra) # 80003e18 <_ZdlPv>
    80004de0:	00048513          	mv	a0,s1
    80004de4:	00007097          	auipc	ra,0x7
    80004de8:	894080e7          	jalr	-1900(ra) # 8000b678 <_Unwind_Resume>

0000000080004dec <_ZN3TCBC1ERS_>:
TCB::TCB(TCB &parent) :
    80004dec:	fe010113          	addi	sp,sp,-32
    80004df0:	00113c23          	sd	ra,24(sp)
    80004df4:	00813823          	sd	s0,16(sp)
    80004df8:	00913423          	sd	s1,8(sp)
    80004dfc:	01213023          	sd	s2,0(sp)
    80004e00:	02010413          	addi	s0,sp,32
    80004e04:	00050493          	mv	s1,a0
    80004e08:	00058913          	mv	s2,a1
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    80004e0c:	00005717          	auipc	a4,0x5
    80004e10:	78470713          	addi	a4,a4,1924 # 8000a590 <_ZN3TCB7runningE>
    80004e14:	00872783          	lw	a5,8(a4)
    80004e18:	0017869b          	addiw	a3,a5,1
    80004e1c:	00d72423          	sw	a3,8(a4)
        preempted(false), joiner() {
    80004e20:	00f52023          	sw	a5,0(a0)
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    80004e24:	0085b783          	ld	a5,8(a1)
        preempted(false), joiner() {
    80004e28:	00f53423          	sd	a5,8(a0)
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    80004e2c:	0105b783          	ld	a5,16(a1)
        preempted(false), joiner() {
    80004e30:	00f53823          	sd	a5,16(a0)
        stack(Allocator::_mem_alloc(DEFAULT_STACK_SIZE)),
    80004e34:	00004537          	lui	a0,0x4
    80004e38:	ffffe097          	auipc	ra,0xffffe
    80004e3c:	72c080e7          	jalr	1836(ra) # 80003564 <_ZN9Allocator10_mem_allocEm>
        preempted(false), joiner() {
    80004e40:	00a4bc23          	sd	a0,24(s1)
    80004e44:	0324b023          	sd	s2,32(s1)
    80004e48:	02893603          	ld	a2,40(s2)
    80004e4c:	03093683          	ld	a3,48(s2)
    80004e50:	03893703          	ld	a4,56(s2)
    80004e54:	04093783          	ld	a5,64(s2)
    80004e58:	02c4b423          	sd	a2,40(s1)
    80004e5c:	02d4b823          	sd	a3,48(s1)
    80004e60:	02e4bc23          	sd	a4,56(s1)
    80004e64:	04f4b023          	sd	a5,64(s1)
    80004e68:	0404a423          	sw	zero,72(s1)
    80004e6c:	00100793          	li	a5,1
    80004e70:	04f4b823          	sd	a5,80(s1)
    80004e74:	04048c23          	sb	zero,88(s1)
    80004e78:	0604b023          	sd	zero,96(s1)
    80004e7c:	0604a423          	sw	zero,104(s1)
    80004e80:	0604a623          	sw	zero,108(s1)
    80004e84:	0604a823          	sw	zero,112(s1)
    80004e88:	0604aa23          	sw	zero,116(s1)
    this->joiner.init();
    80004e8c:	06048513          	addi	a0,s1,96
    80004e90:	ffffd097          	auipc	ra,0xffffd
    80004e94:	608080e7          	jalr	1544(ra) # 80002498 <_ZN3stm14CircularBufferIP3TCBE4initEv>
}
    80004e98:	01813083          	ld	ra,24(sp)
    80004e9c:	01013403          	ld	s0,16(sp)
    80004ea0:	00813483          	ld	s1,8(sp)
    80004ea4:	00013903          	ld	s2,0(sp)
    80004ea8:	02010113          	addi	sp,sp,32
    80004eac:	00008067          	ret

0000000080004eb0 <_ZN3TCB5_forkEv>:
int TCB::_fork() {
    80004eb0:	fd010113          	addi	sp,sp,-48
    80004eb4:	02113423          	sd	ra,40(sp)
    80004eb8:	02813023          	sd	s0,32(sp)
    80004ebc:	00913c23          	sd	s1,24(sp)
    80004ec0:	01213823          	sd	s2,16(sp)
    80004ec4:	01313423          	sd	s3,8(sp)
    80004ec8:	03010413          	addi	s0,sp,48
    int id_parent = TCB::running->t_id;
    80004ecc:	00005917          	auipc	s2,0x5
    80004ed0:	6c490913          	addi	s2,s2,1732 # 8000a590 <_ZN3TCB7runningE>
    80004ed4:	00093783          	ld	a5,0(s2)
    80004ed8:	0007a983          	lw	s3,0(a5)
    TCB *handle = new TCB(*TCB::running);
    80004edc:	07800513          	li	a0,120
    80004ee0:	fffff097          	auipc	ra,0xfffff
    80004ee4:	ee8080e7          	jalr	-280(ra) # 80003dc8 <_Znwm>
    80004ee8:	00050493          	mv	s1,a0
    80004eec:	00093583          	ld	a1,0(s2)
    80004ef0:	00000097          	auipc	ra,0x0
    80004ef4:	efc080e7          	jalr	-260(ra) # 80004dec <_ZN3TCBC1ERS_>
    TCB::duplicate(TCB::running, handle);
    80004ef8:	00048593          	mv	a1,s1
    80004efc:	00093503          	ld	a0,0(s2)
    80004f00:	00000097          	auipc	ra,0x0
    80004f04:	c60080e7          	jalr	-928(ra) # 80004b60 <_ZN3TCB9duplicateEPS_S0_>
    print(TCB::running->t_id);
    80004f08:	00093783          	ld	a5,0(s2)
    80004f0c:	0007a503          	lw	a0,0(a5)
    80004f10:	ffffe097          	auipc	ra,0xffffe
    80004f14:	8dc080e7          	jalr	-1828(ra) # 800027ec <_Z5printi>
    putc(' ');
    80004f18:	02000513          	li	a0,32
    80004f1c:	ffffd097          	auipc	ra,0xffffd
    80004f20:	ac4080e7          	jalr	-1340(ra) # 800019e0 <_Z4putcc>
    print(id_parent);
    80004f24:	00098513          	mv	a0,s3
    80004f28:	ffffe097          	auipc	ra,0xffffe
    80004f2c:	8c4080e7          	jalr	-1852(ra) # 800027ec <_Z5printi>
    putc(' ');
    80004f30:	02000513          	li	a0,32
    80004f34:	ffffd097          	auipc	ra,0xffffd
    80004f38:	aac080e7          	jalr	-1364(ra) # 800019e0 <_Z4putcc>
    print(handle->t_id);
    80004f3c:	0004a503          	lw	a0,0(s1)
    80004f40:	ffffe097          	auipc	ra,0xffffe
    80004f44:	8ac080e7          	jalr	-1876(ra) # 800027ec <_Z5printi>
    putc('\n');
    80004f48:	00a00513          	li	a0,10
    80004f4c:	ffffd097          	auipc	ra,0xffffd
    80004f50:	a94080e7          	jalr	-1388(ra) # 800019e0 <_Z4putcc>
    if (TCB::running->t_id == id_parent) {
    80004f54:	00093783          	ld	a5,0(s2)
    80004f58:	0007a503          	lw	a0,0(a5)
    80004f5c:	03350663          	beq	a0,s3,80004f88 <_ZN3TCB5_forkEv+0xd8>
        print(TCB::running->t_id);
    80004f60:	ffffe097          	auipc	ra,0xffffe
    80004f64:	88c080e7          	jalr	-1908(ra) # 800027ec <_Z5printi>
        return 0;
    80004f68:	00000513          	li	a0,0
}
    80004f6c:	02813083          	ld	ra,40(sp)
    80004f70:	02013403          	ld	s0,32(sp)
    80004f74:	01813483          	ld	s1,24(sp)
    80004f78:	01013903          	ld	s2,16(sp)
    80004f7c:	00813983          	ld	s3,8(sp)
    80004f80:	03010113          	addi	sp,sp,48
    80004f84:	00008067          	ret
        Scheduler::put(handle);
    80004f88:	00048513          	mv	a0,s1
    80004f8c:	00000097          	auipc	ra,0x0
    80004f90:	83c080e7          	jalr	-1988(ra) # 800047c8 <_ZN9Scheduler3putEP3TCB>
        return handle->t_id;
    80004f94:	0004a503          	lw	a0,0(s1)
    80004f98:	fd5ff06f          	j	80004f6c <_ZN3TCB5_forkEv+0xbc>
    80004f9c:	00050913          	mv	s2,a0
    TCB *handle = new TCB(*TCB::running);
    80004fa0:	00048513          	mv	a0,s1
    80004fa4:	fffff097          	auipc	ra,0xfffff
    80004fa8:	e74080e7          	jalr	-396(ra) # 80003e18 <_ZdlPv>
    80004fac:	00090513          	mv	a0,s2
    80004fb0:	00006097          	auipc	ra,0x6
    80004fb4:	6c8080e7          	jalr	1736(ra) # 8000b678 <_Unwind_Resume>

0000000080004fb8 <_ZN3TCB14destroy_threadEPS_>:
TCB *TCB::destroy_thread(TCB *thread) {
    80004fb8:	fe010113          	addi	sp,sp,-32
    80004fbc:	00113c23          	sd	ra,24(sp)
    80004fc0:	00813823          	sd	s0,16(sp)
    80004fc4:	00913423          	sd	s1,8(sp)
    80004fc8:	02010413          	addi	s0,sp,32
    80004fcc:	00050493          	mv	s1,a0
        inline bool is_empty() const { return this->size == 0; }
    80004fd0:	0704a783          	lw	a5,112(s1)
    while (!thread->joiner.is_empty()) {
    80004fd4:	02078663          	beqz	a5,80005000 <_ZN3TCB14destroy_threadEPS_+0x48>
        TCB *next = thread->joiner.get();
    80004fd8:	06048513          	addi	a0,s1,96
    80004fdc:	ffffd097          	auipc	ra,0xffffd
    80004fe0:	50c080e7          	jalr	1292(ra) # 800024e8 <_ZN3stm14CircularBufferIP3TCBE3getEv>
    bool is_joined() const { return this->status == JOINED; }
    80004fe4:	04852703          	lw	a4,72(a0) # 4048 <_entry-0x7fffbfb8>
        if (next->is_joined()) {
    80004fe8:	00300793          	li	a5,3
    80004fec:	fef712e3          	bne	a4,a5,80004fd0 <_ZN3TCB14destroy_threadEPS_+0x18>
    void run() { this->status = RUNNABLE; }
    80004ff0:	04052423          	sw	zero,72(a0)
            Scheduler::put(next);
    80004ff4:	fffff097          	auipc	ra,0xfffff
    80004ff8:	7d4080e7          	jalr	2004(ra) # 800047c8 <_ZN9Scheduler3putEP3TCB>
    80004ffc:	fd5ff06f          	j	80004fd0 <_ZN3TCB14destroy_threadEPS_+0x18>
    thread->joiner.destroy();
    80005000:	06048513          	addi	a0,s1,96
    80005004:	ffffd097          	auipc	ra,0xffffd
    80005008:	530080e7          	jalr	1328(ra) # 80002534 <_ZN3stm14CircularBufferIP3TCBE7destroyEv>
}
    8000500c:	00048513          	mv	a0,s1
    80005010:	01813083          	ld	ra,24(sp)
    80005014:	01013403          	ld	s0,16(sp)
    80005018:	00813483          	ld	s1,8(sp)
    8000501c:	02010113          	addi	sp,sp,32
    80005020:	00008067          	ret

0000000080005024 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80005024:	fd010113          	addi	sp,sp,-48
    80005028:	02113423          	sd	ra,40(sp)
    8000502c:	02813023          	sd	s0,32(sp)
    80005030:	00913c23          	sd	s1,24(sp)
    80005034:	03010413          	addi	s0,sp,48
    thread_t old = TCB::running;
    80005038:	00005497          	auipc	s1,0x5
    8000503c:	5584b483          	ld	s1,1368(s1) # 8000a590 <_ZN3TCB7runningE>
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80005040:	100027f3          	csrr	a5,sstatus
    80005044:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80005048:	fd843783          	ld	a5,-40(s0)
    old->context.sstatus = Riscv::r_sstatus();
    8000504c:	02f4bc23          	sd	a5,56(s1)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80005050:	141027f3          	csrr	a5,sepc
    80005054:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80005058:	fd043783          	ld	a5,-48(s0)
    old->context.sepc = Riscv::r_sepc();
    8000505c:	04f4b023          	sd	a5,64(s1)
    bool is_runnable() const { return this->status == RUNNABLE; }
    80005060:	0484a783          	lw	a5,72(s1)
    if (old->is_runnable() && old != handle_bleya) {
    80005064:	02079263          	bnez	a5,80005088 <_ZN3TCB5yieldEv+0x64>
    80005068:	00005717          	auipc	a4,0x5
    8000506c:	3b873703          	ld	a4,952(a4) # 8000a420 <_GLOBAL_OFFSET_TABLE_+0x20>
    80005070:	00073703          	ld	a4,0(a4)
    80005074:	00970a63          	beq	a4,s1,80005088 <_ZN3TCB5yieldEv+0x64>
        Scheduler::put(old);
    80005078:	00048513          	mv	a0,s1
    8000507c:	fffff097          	auipc	ra,0xfffff
    80005080:	74c080e7          	jalr	1868(ra) # 800047c8 <_ZN9Scheduler3putEP3TCB>
    80005084:	00c0006f          	j	80005090 <_ZN3TCB5yieldEv+0x6c>
    } else if (old->is_finished()) {
    80005088:	00400713          	li	a4,4
    8000508c:	04e78663          	beq	a5,a4,800050d8 <_ZN3TCB5yieldEv+0xb4>
    80005090:	00005797          	auipc	a5,0x5
    80005094:	3f87b783          	ld	a5,1016(a5) # 8000a488 <_GLOBAL_OFFSET_TABLE_+0x88>
    80005098:	0107a783          	lw	a5,16(a5)
    8000509c:	06079463          	bnez	a5,80005104 <_ZN3TCB5yieldEv+0xe0>
    800050a0:	00005797          	auipc	a5,0x5
    800050a4:	3c87b783          	ld	a5,968(a5) # 8000a468 <_GLOBAL_OFFSET_TABLE_+0x68>
    800050a8:	0107a783          	lw	a5,16(a5)
    800050ac:	04079c63          	bnez	a5,80005104 <_ZN3TCB5yieldEv+0xe0>
    800050b0:	00005797          	auipc	a5,0x5
    800050b4:	3907b783          	ld	a5,912(a5) # 8000a440 <_GLOBAL_OFFSET_TABLE_+0x40>
    800050b8:	0107a783          	lw	a5,16(a5)
    800050bc:	04079463          	bnez	a5,80005104 <_ZN3TCB5yieldEv+0xe0>
        TCB::running = handle_bleya;
    800050c0:	00005797          	auipc	a5,0x5
    800050c4:	3607b783          	ld	a5,864(a5) # 8000a420 <_GLOBAL_OFFSET_TABLE_+0x20>
    800050c8:	0007b783          	ld	a5,0(a5)
    800050cc:	00005717          	auipc	a4,0x5
    800050d0:	4cf73223          	sd	a5,1220(a4) # 8000a590 <_ZN3TCB7runningE>
    800050d4:	0540006f          	j	80005128 <_ZN3TCB5yieldEv+0x104>
        Allocator::_mem_free(old->stack);
    800050d8:	0184b503          	ld	a0,24(s1)
    800050dc:	ffffe097          	auipc	ra,0xffffe
    800050e0:	544080e7          	jalr	1348(ra) # 80003620 <_ZN9Allocator9_mem_freeEPKv>
    800050e4:	fadff06f          	j	80005090 <_ZN3TCB5yieldEv+0x6c>
            Allocator::_mem_free(TCB::destroy_thread(Scheduler::get())->stack);
    800050e8:	fffff097          	auipc	ra,0xfffff
    800050ec:	5f4080e7          	jalr	1524(ra) # 800046dc <_ZN9Scheduler3getEv>
    800050f0:	00000097          	auipc	ra,0x0
    800050f4:	ec8080e7          	jalr	-312(ra) # 80004fb8 <_ZN3TCB14destroy_threadEPS_>
    800050f8:	01853503          	ld	a0,24(a0)
    800050fc:	ffffe097          	auipc	ra,0xffffe
    80005100:	524080e7          	jalr	1316(ra) # 80003620 <_ZN9Allocator9_mem_freeEPKv>
        while (Scheduler::peek()->is_finished()) {
    80005104:	fffff097          	auipc	ra,0xfffff
    80005108:	648080e7          	jalr	1608(ra) # 8000474c <_ZN9Scheduler4peekEv>
    bool is_finished() const { return this->status == FINISHED; }
    8000510c:	04852703          	lw	a4,72(a0)
    80005110:	00400793          	li	a5,4
    80005114:	fcf70ae3          	beq	a4,a5,800050e8 <_ZN3TCB5yieldEv+0xc4>
        TCB::running = Scheduler::get();
    80005118:	fffff097          	auipc	ra,0xfffff
    8000511c:	5c4080e7          	jalr	1476(ra) # 800046dc <_ZN9Scheduler3getEv>
    80005120:	00005797          	auipc	a5,0x5
    80005124:	46a7b823          	sd	a0,1136(a5) # 8000a590 <_ZN3TCB7runningE>
    Riscv::w_sstatus(TCB::running->context.sstatus);
    80005128:	00005597          	auipc	a1,0x5
    8000512c:	4685b583          	ld	a1,1128(a1) # 8000a590 <_ZN3TCB7runningE>
    80005130:	0385b783          	ld	a5,56(a1)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80005134:	10079073          	csrw	sstatus,a5
    Riscv::w_sepc(TCB::running->context.sepc);
    80005138:	0405b783          	ld	a5,64(a1)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000513c:	14179073          	csrw	sepc,a5
    TCB::context_switch(&old->context, &TCB::running->context);
    80005140:	02858593          	addi	a1,a1,40
    80005144:	02848513          	addi	a0,s1,40
    80005148:	ffffc097          	auipc	ra,0xffffc
    8000514c:	318080e7          	jalr	792(ra) # 80001460 <_ZN3TCB14context_switchEP7ContextS1_>
}
    80005150:	02813083          	ld	ra,40(sp)
    80005154:	02013403          	ld	s0,32(sp)
    80005158:	01813483          	ld	s1,24(sp)
    8000515c:	03010113          	addi	sp,sp,48
    80005160:	00008067          	ret

0000000080005164 <_ZN3TCB16_thread_dispatchEv>:
void TCB::_thread_dispatch() {
    80005164:	ff010113          	addi	sp,sp,-16
    80005168:	00113423          	sd	ra,8(sp)
    8000516c:	00813023          	sd	s0,0(sp)
    80005170:	01010413          	addi	s0,sp,16
    Riscv::push();
    80005174:	ffffc097          	auipc	ra,0xffffc
    80005178:	1ec080e7          	jalr	492(ra) # 80001360 <_ZN5Riscv4pushEv>
    TCB::yield();
    8000517c:	00000097          	auipc	ra,0x0
    80005180:	ea8080e7          	jalr	-344(ra) # 80005024 <_ZN3TCB5yieldEv>
    Riscv::pop();
    80005184:	ffffc097          	auipc	ra,0xffffc
    80005188:	25c080e7          	jalr	604(ra) # 800013e0 <_ZN5Riscv3popEv>
}
    8000518c:	00813083          	ld	ra,8(sp)
    80005190:	00013403          	ld	s0,0(sp)
    80005194:	01010113          	addi	sp,sp,16
    80005198:	00008067          	ret

000000008000519c <_ZN3TCB12_thread_exitEv>:
void TCB::_thread_exit() {
    8000519c:	ff010113          	addi	sp,sp,-16
    800051a0:	00113423          	sd	ra,8(sp)
    800051a4:	00813023          	sd	s0,0(sp)
    800051a8:	01010413          	addi	s0,sp,16
    TCB::running->finish();
    800051ac:	00005517          	auipc	a0,0x5
    800051b0:	3e453503          	ld	a0,996(a0) # 8000a590 <_ZN3TCB7runningE>
    void finish() { this->status = FINISHED; }
    800051b4:	00400793          	li	a5,4
    800051b8:	04f52423          	sw	a5,72(a0)
    TCB::destroy_thread(TCB::running);
    800051bc:	00000097          	auipc	ra,0x0
    800051c0:	dfc080e7          	jalr	-516(ra) # 80004fb8 <_ZN3TCB14destroy_threadEPS_>
    TCB::_thread_dispatch();
    800051c4:	00000097          	auipc	ra,0x0
    800051c8:	fa0080e7          	jalr	-96(ra) # 80005164 <_ZN3TCB16_thread_dispatchEv>
}
    800051cc:	00813083          	ld	ra,8(sp)
    800051d0:	00013403          	ld	s0,0(sp)
    800051d4:	01010113          	addi	sp,sp,16
    800051d8:	00008067          	ret

00000000800051dc <_ZN3TCB12_thread_joinEPS_>:
    bool is_finished() const { return this->status == FINISHED; }
    800051dc:	04852703          	lw	a4,72(a0)
    if (handle->is_finished())
    800051e0:	00400793          	li	a5,4
    800051e4:	04f70463          	beq	a4,a5,8000522c <_ZN3TCB12_thread_joinEPS_+0x50>
void TCB::_thread_join(thread_t handle) {
    800051e8:	ff010113          	addi	sp,sp,-16
    800051ec:	00113423          	sd	ra,8(sp)
    800051f0:	00813023          	sd	s0,0(sp)
    800051f4:	01010413          	addi	s0,sp,16
    TCB::running->enjoin();
    800051f8:	00005597          	auipc	a1,0x5
    800051fc:	3985b583          	ld	a1,920(a1) # 8000a590 <_ZN3TCB7runningE>
    void enjoin() { this->status = JOINED; }
    80005200:	00300793          	li	a5,3
    80005204:	04f5a423          	sw	a5,72(a1)
    handle->joiner.put(TCB::running);
    80005208:	06050513          	addi	a0,a0,96
    8000520c:	ffffd097          	auipc	ra,0xffffd
    80005210:	400080e7          	jalr	1024(ra) # 8000260c <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    TCB::_thread_dispatch();
    80005214:	00000097          	auipc	ra,0x0
    80005218:	f50080e7          	jalr	-176(ra) # 80005164 <_ZN3TCB16_thread_dispatchEv>
}
    8000521c:	00813083          	ld	ra,8(sp)
    80005220:	00013403          	ld	s0,0(sp)
    80005224:	01010113          	addi	sp,sp,16
    80005228:	00008067          	ret
    8000522c:	00008067          	ret

0000000080005230 <_ZN3TCB12_thread_joinEPS_m>:
    bool is_finished() const { return this->status == FINISHED; }
    80005230:	04852703          	lw	a4,72(a0)
    if (handle->is_finished())
    80005234:	00400793          	li	a5,4
    80005238:	06f70863          	beq	a4,a5,800052a8 <_ZN3TCB12_thread_joinEPS_m+0x78>
void TCB::_thread_join(thread_t handle, time_t time) {
    8000523c:	fe010113          	addi	sp,sp,-32
    80005240:	00113c23          	sd	ra,24(sp)
    80005244:	00813823          	sd	s0,16(sp)
    80005248:	00913423          	sd	s1,8(sp)
    8000524c:	01213023          	sd	s2,0(sp)
    80005250:	02010413          	addi	s0,sp,32
    80005254:	00058493          	mv	s1,a1
    TCB::running->enjoin();
    80005258:	00005917          	auipc	s2,0x5
    8000525c:	33890913          	addi	s2,s2,824 # 8000a590 <_ZN3TCB7runningE>
    80005260:	00093583          	ld	a1,0(s2)
    void enjoin() { this->status = JOINED; }
    80005264:	00300793          	li	a5,3
    80005268:	04f5a423          	sw	a5,72(a1)
    handle->joiner.put(TCB::running);
    8000526c:	06050513          	addi	a0,a0,96
    80005270:	ffffd097          	auipc	ra,0xffffd
    80005274:	39c080e7          	jalr	924(ra) # 8000260c <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    Cradle::insert(TCB::running, time);
    80005278:	00048593          	mv	a1,s1
    8000527c:	00093503          	ld	a0,0(s2)
    80005280:	ffffe097          	auipc	ra,0xffffe
    80005284:	9e8080e7          	jalr	-1560(ra) # 80002c68 <_ZN6Cradle6insertEP3TCBm>
    TCB::_thread_dispatch();
    80005288:	00000097          	auipc	ra,0x0
    8000528c:	edc080e7          	jalr	-292(ra) # 80005164 <_ZN3TCB16_thread_dispatchEv>
}
    80005290:	01813083          	ld	ra,24(sp)
    80005294:	01013403          	ld	s0,16(sp)
    80005298:	00813483          	ld	s1,8(sp)
    8000529c:	00013903          	ld	s2,0(sp)
    800052a0:	02010113          	addi	sp,sp,32
    800052a4:	00008067          	ret
    800052a8:	00008067          	ret

00000000800052ac <_ZN12MonitorMutex10relinquishEv>:
#include "../h/monitor.hpp"

int MonitorMutex::relinquish() {
    800052ac:	ff010113          	addi	sp,sp,-16
    800052b0:	00813423          	sd	s0,8(sp)
    800052b4:	01010413          	addi	s0,sp,16
    800052b8:	00050793          	mv	a5,a0
    int ret = this->nesting_count;
    800052bc:	01852503          	lw	a0,24(a0)
    this->nesting_count = 1;
    800052c0:	00100713          	li	a4,1
    800052c4:	00e7ac23          	sw	a4,24(a5)
    return ret;
}
    800052c8:	00813403          	ld	s0,8(sp)
    800052cc:	01010113          	addi	sp,sp,16
    800052d0:	00008067          	ret

00000000800052d4 <_ZN12MonitorMutex9reacquireEi>:

void MonitorMutex::reacquire(int count) {
    800052d4:	ff010113          	addi	sp,sp,-16
    800052d8:	00813423          	sd	s0,8(sp)
    800052dc:	01010413          	addi	s0,sp,16
    this->nesting_count = count;
    800052e0:	00b52c23          	sw	a1,24(a0)
}
    800052e4:	00813403          	ld	s0,8(sp)
    800052e8:	01010113          	addi	sp,sp,16
    800052ec:	00008067          	ret

00000000800052f0 <_ZN11MonitorLockC1ER12MonitorMutex>:

MonitorLock::MonitorLock(MonitorMutex &mutex) : monitorMutex(mutex) {
    800052f0:	ff010113          	addi	sp,sp,-16
    800052f4:	00113423          	sd	ra,8(sp)
    800052f8:	00813023          	sd	s0,0(sp)
    800052fc:	01010413          	addi	s0,sp,16
    80005300:	00b53023          	sd	a1,0(a0)
    this->monitorMutex.wait();
    80005304:	0005b783          	ld	a5,0(a1)
    80005308:	0107b783          	ld	a5,16(a5)
    8000530c:	00058513          	mv	a0,a1
    80005310:	000780e7          	jalr	a5
}
    80005314:	00813083          	ld	ra,8(sp)
    80005318:	00013403          	ld	s0,0(sp)
    8000531c:	01010113          	addi	sp,sp,16
    80005320:	00008067          	ret

0000000080005324 <_ZN11MonitorLockD1Ev>:

MonitorLock::~MonitorLock() {
    80005324:	ff010113          	addi	sp,sp,-16
    80005328:	00113423          	sd	ra,8(sp)
    8000532c:	00813023          	sd	s0,0(sp)
    80005330:	01010413          	addi	s0,sp,16
    this->monitorMutex.signal();
    80005334:	00053503          	ld	a0,0(a0)
    80005338:	00053783          	ld	a5,0(a0)
    8000533c:	0187b783          	ld	a5,24(a5)
    80005340:	000780e7          	jalr	a5
}
    80005344:	00813083          	ld	ra,8(sp)
    80005348:	00013403          	ld	s0,0(sp)
    8000534c:	01010113          	addi	sp,sp,16
    80005350:	00008067          	ret

0000000080005354 <_ZN11ConditionalC1EP7Monitor>:

Conditional::Conditional(Monitor *monitor) : owner(monitor), count(0), blocker(0) {}
    80005354:	ff010113          	addi	sp,sp,-16
    80005358:	00113423          	sd	ra,8(sp)
    8000535c:	00813023          	sd	s0,0(sp)
    80005360:	01010413          	addi	s0,sp,16
    80005364:	00b53023          	sd	a1,0(a0)
    80005368:	00052423          	sw	zero,8(a0)
    8000536c:	00000593          	li	a1,0
    80005370:	01050513          	addi	a0,a0,16
    80005374:	fffff097          	auipc	ra,0xfffff
    80005378:	d24080e7          	jalr	-732(ra) # 80004098 <_ZN9SemaphoreC1Ej>
    8000537c:	00813083          	ld	ra,8(sp)
    80005380:	00013403          	ld	s0,0(sp)
    80005384:	01010113          	addi	sp,sp,16
    80005388:	00008067          	ret

000000008000538c <_ZN11Conditional4waitEv>:

void Conditional::wait() {
    8000538c:	fe010113          	addi	sp,sp,-32
    80005390:	00113c23          	sd	ra,24(sp)
    80005394:	00813823          	sd	s0,16(sp)
    80005398:	00913423          	sd	s1,8(sp)
    8000539c:	01213023          	sd	s2,0(sp)
    800053a0:	02010413          	addi	s0,sp,32
    800053a4:	00050493          	mv	s1,a0
    this->count++;
    800053a8:	00852783          	lw	a5,8(a0)
    800053ac:	0017879b          	addiw	a5,a5,1
    800053b0:	00f52423          	sw	a5,8(a0)
    int nesting = this->owner->monitorMutex.relinquish();
    800053b4:	00053503          	ld	a0,0(a0)
    800053b8:	00000097          	auipc	ra,0x0
    800053bc:	ef4080e7          	jalr	-268(ra) # 800052ac <_ZN12MonitorMutex10relinquishEv>
    800053c0:	00050913          	mv	s2,a0
    Semaphore::signal_and_wait(this->owner->monitorMutex, this->blocker);
    800053c4:	01048593          	addi	a1,s1,16
    800053c8:	0004b503          	ld	a0,0(s1)
    800053cc:	fffff097          	auipc	ra,0xfffff
    800053d0:	d04080e7          	jalr	-764(ra) # 800040d0 <_ZN9Semaphore15signal_and_waitERS_S0_>
    this->owner->monitorMutex.reacquire(nesting);
    800053d4:	00090593          	mv	a1,s2
    800053d8:	0004b503          	ld	a0,0(s1)
    800053dc:	00000097          	auipc	ra,0x0
    800053e0:	ef8080e7          	jalr	-264(ra) # 800052d4 <_ZN12MonitorMutex9reacquireEi>
    this->owner->monitorMutex.wait();
    800053e4:	0004b503          	ld	a0,0(s1)
    800053e8:	fffff097          	auipc	ra,0xfffff
    800053ec:	54c080e7          	jalr	1356(ra) # 80004934 <_ZN10OwnedMutex4waitEv>
}
    800053f0:	01813083          	ld	ra,24(sp)
    800053f4:	01013403          	ld	s0,16(sp)
    800053f8:	00813483          	ld	s1,8(sp)
    800053fc:	00013903          	ld	s2,0(sp)
    80005400:	02010113          	addi	sp,sp,32
    80005404:	00008067          	ret

0000000080005408 <_ZN11Conditional6signalEv>:

void Conditional::signal() {
    if (this->count == 0) return;
    80005408:	00852783          	lw	a5,8(a0)
    8000540c:	00079463          	bnez	a5,80005414 <_ZN11Conditional6signalEv+0xc>
    80005410:	00008067          	ret
void Conditional::signal() {
    80005414:	fe010113          	addi	sp,sp,-32
    80005418:	00113c23          	sd	ra,24(sp)
    8000541c:	00813823          	sd	s0,16(sp)
    80005420:	00913423          	sd	s1,8(sp)
    80005424:	02010413          	addi	s0,sp,32
    80005428:	00050493          	mv	s1,a0
    this->blocker.signal();
    8000542c:	01050513          	addi	a0,a0,16
    80005430:	fffff097          	auipc	ra,0xfffff
    80005434:	96c080e7          	jalr	-1684(ra) # 80003d9c <_ZN9Semaphore6signalEv>
    this->count--;
    80005438:	0084a783          	lw	a5,8(s1)
    8000543c:	fff7879b          	addiw	a5,a5,-1
    80005440:	00f4a423          	sw	a5,8(s1)
}
    80005444:	01813083          	ld	ra,24(sp)
    80005448:	01013403          	ld	s0,16(sp)
    8000544c:	00813483          	ld	s1,8(sp)
    80005450:	02010113          	addi	sp,sp,32
    80005454:	00008067          	ret

0000000080005458 <_ZN11Conditional9signalAllEv>:

void Conditional::signalAll() {
    80005458:	fe010113          	addi	sp,sp,-32
    8000545c:	00113c23          	sd	ra,24(sp)
    80005460:	00813823          	sd	s0,16(sp)
    80005464:	00913423          	sd	s1,8(sp)
    80005468:	01213023          	sd	s2,0(sp)
    8000546c:	02010413          	addi	s0,sp,32
    80005470:	00050913          	mv	s2,a0
    for (unsigned int i = 0; i < this->count; i++)
    80005474:	00000493          	li	s1,0
    80005478:	00892783          	lw	a5,8(s2)
    8000547c:	00f4fc63          	bgeu	s1,a5,80005494 <_ZN11Conditional9signalAllEv+0x3c>
        this->blocker.signal();
    80005480:	01090513          	addi	a0,s2,16
    80005484:	fffff097          	auipc	ra,0xfffff
    80005488:	918080e7          	jalr	-1768(ra) # 80003d9c <_ZN9Semaphore6signalEv>
    for (unsigned int i = 0; i < this->count; i++)
    8000548c:	0014849b          	addiw	s1,s1,1
    80005490:	fe9ff06f          	j	80005478 <_ZN11Conditional9signalAllEv+0x20>
    this->count = 0;
    80005494:	00092423          	sw	zero,8(s2)
    80005498:	01813083          	ld	ra,24(sp)
    8000549c:	01013403          	ld	s0,16(sp)
    800054a0:	00813483          	ld	s1,8(sp)
    800054a4:	00013903          	ld	s2,0(sp)
    800054a8:	02010113          	addi	sp,sp,32
    800054ac:	00008067          	ret

00000000800054b0 <start>:
    800054b0:	ff010113          	addi	sp,sp,-16
    800054b4:	00813423          	sd	s0,8(sp)
    800054b8:	01010413          	addi	s0,sp,16
    800054bc:	300027f3          	csrr	a5,mstatus
    800054c0:	ffffe737          	lui	a4,0xffffe
    800054c4:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff2fef>
    800054c8:	00e7f7b3          	and	a5,a5,a4
    800054cc:	00001737          	lui	a4,0x1
    800054d0:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800054d4:	00e7e7b3          	or	a5,a5,a4
    800054d8:	30079073          	csrw	mstatus,a5
    800054dc:	00000797          	auipc	a5,0x0
    800054e0:	16078793          	addi	a5,a5,352 # 8000563c <system_main>
    800054e4:	34179073          	csrw	mepc,a5
    800054e8:	00000793          	li	a5,0
    800054ec:	18079073          	csrw	satp,a5
    800054f0:	000107b7          	lui	a5,0x10
    800054f4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800054f8:	30279073          	csrw	medeleg,a5
    800054fc:	30379073          	csrw	mideleg,a5
    80005500:	104027f3          	csrr	a5,sie
    80005504:	2227e793          	ori	a5,a5,546
    80005508:	10479073          	csrw	sie,a5
    8000550c:	fff00793          	li	a5,-1
    80005510:	00a7d793          	srli	a5,a5,0xa
    80005514:	3b079073          	csrw	pmpaddr0,a5
    80005518:	00f00793          	li	a5,15
    8000551c:	3a079073          	csrw	pmpcfg0,a5
    80005520:	f14027f3          	csrr	a5,mhartid
    80005524:	0200c737          	lui	a4,0x200c
    80005528:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000552c:	0007869b          	sext.w	a3,a5
    80005530:	00269713          	slli	a4,a3,0x2
    80005534:	000f4637          	lui	a2,0xf4
    80005538:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000553c:	00d70733          	add	a4,a4,a3
    80005540:	0037979b          	slliw	a5,a5,0x3
    80005544:	020046b7          	lui	a3,0x2004
    80005548:	00d787b3          	add	a5,a5,a3
    8000554c:	00c585b3          	add	a1,a1,a2
    80005550:	00371693          	slli	a3,a4,0x3
    80005554:	00005717          	auipc	a4,0x5
    80005558:	05c70713          	addi	a4,a4,92 # 8000a5b0 <timer_scratch>
    8000555c:	00b7b023          	sd	a1,0(a5)
    80005560:	00d70733          	add	a4,a4,a3
    80005564:	00f73c23          	sd	a5,24(a4)
    80005568:	02c73023          	sd	a2,32(a4)
    8000556c:	34071073          	csrw	mscratch,a4
    80005570:	00000797          	auipc	a5,0x0
    80005574:	6e078793          	addi	a5,a5,1760 # 80005c50 <timervec>
    80005578:	30579073          	csrw	mtvec,a5
    8000557c:	300027f3          	csrr	a5,mstatus
    80005580:	0087e793          	ori	a5,a5,8
    80005584:	30079073          	csrw	mstatus,a5
    80005588:	304027f3          	csrr	a5,mie
    8000558c:	0807e793          	ori	a5,a5,128
    80005590:	30479073          	csrw	mie,a5
    80005594:	f14027f3          	csrr	a5,mhartid
    80005598:	0007879b          	sext.w	a5,a5
    8000559c:	00078213          	mv	tp,a5
    800055a0:	30200073          	mret
    800055a4:	00813403          	ld	s0,8(sp)
    800055a8:	01010113          	addi	sp,sp,16
    800055ac:	00008067          	ret

00000000800055b0 <timerinit>:
    800055b0:	ff010113          	addi	sp,sp,-16
    800055b4:	00813423          	sd	s0,8(sp)
    800055b8:	01010413          	addi	s0,sp,16
    800055bc:	f14027f3          	csrr	a5,mhartid
    800055c0:	0200c737          	lui	a4,0x200c
    800055c4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800055c8:	0007869b          	sext.w	a3,a5
    800055cc:	00269713          	slli	a4,a3,0x2
    800055d0:	000f4637          	lui	a2,0xf4
    800055d4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800055d8:	00d70733          	add	a4,a4,a3
    800055dc:	0037979b          	slliw	a5,a5,0x3
    800055e0:	020046b7          	lui	a3,0x2004
    800055e4:	00d787b3          	add	a5,a5,a3
    800055e8:	00c585b3          	add	a1,a1,a2
    800055ec:	00371693          	slli	a3,a4,0x3
    800055f0:	00005717          	auipc	a4,0x5
    800055f4:	fc070713          	addi	a4,a4,-64 # 8000a5b0 <timer_scratch>
    800055f8:	00b7b023          	sd	a1,0(a5)
    800055fc:	00d70733          	add	a4,a4,a3
    80005600:	00f73c23          	sd	a5,24(a4)
    80005604:	02c73023          	sd	a2,32(a4)
    80005608:	34071073          	csrw	mscratch,a4
    8000560c:	00000797          	auipc	a5,0x0
    80005610:	64478793          	addi	a5,a5,1604 # 80005c50 <timervec>
    80005614:	30579073          	csrw	mtvec,a5
    80005618:	300027f3          	csrr	a5,mstatus
    8000561c:	0087e793          	ori	a5,a5,8
    80005620:	30079073          	csrw	mstatus,a5
    80005624:	304027f3          	csrr	a5,mie
    80005628:	0807e793          	ori	a5,a5,128
    8000562c:	30479073          	csrw	mie,a5
    80005630:	00813403          	ld	s0,8(sp)
    80005634:	01010113          	addi	sp,sp,16
    80005638:	00008067          	ret

000000008000563c <system_main>:
    8000563c:	fe010113          	addi	sp,sp,-32
    80005640:	00813823          	sd	s0,16(sp)
    80005644:	00913423          	sd	s1,8(sp)
    80005648:	00113c23          	sd	ra,24(sp)
    8000564c:	02010413          	addi	s0,sp,32
    80005650:	00000097          	auipc	ra,0x0
    80005654:	0c4080e7          	jalr	196(ra) # 80005714 <cpuid>
    80005658:	00005497          	auipc	s1,0x5
    8000565c:	e5848493          	addi	s1,s1,-424 # 8000a4b0 <started>
    80005660:	02050263          	beqz	a0,80005684 <system_main+0x48>
    80005664:	0004a783          	lw	a5,0(s1)
    80005668:	0007879b          	sext.w	a5,a5
    8000566c:	fe078ce3          	beqz	a5,80005664 <system_main+0x28>
    80005670:	0ff0000f          	fence
    80005674:	00003517          	auipc	a0,0x3
    80005678:	bb450513          	addi	a0,a0,-1100 # 80008228 <_ZN3stm4coutE+0x190>
    8000567c:	00001097          	auipc	ra,0x1
    80005680:	a70080e7          	jalr	-1424(ra) # 800060ec <panic>
    80005684:	00001097          	auipc	ra,0x1
    80005688:	9c4080e7          	jalr	-1596(ra) # 80006048 <consoleinit>
    8000568c:	00001097          	auipc	ra,0x1
    80005690:	150080e7          	jalr	336(ra) # 800067dc <printfinit>
    80005694:	00003517          	auipc	a0,0x3
    80005698:	c7450513          	addi	a0,a0,-908 # 80008308 <_ZN3stm4coutE+0x270>
    8000569c:	00001097          	auipc	ra,0x1
    800056a0:	aac080e7          	jalr	-1364(ra) # 80006148 <__printf>
    800056a4:	00003517          	auipc	a0,0x3
    800056a8:	b5450513          	addi	a0,a0,-1196 # 800081f8 <_ZN3stm4coutE+0x160>
    800056ac:	00001097          	auipc	ra,0x1
    800056b0:	a9c080e7          	jalr	-1380(ra) # 80006148 <__printf>
    800056b4:	00003517          	auipc	a0,0x3
    800056b8:	c5450513          	addi	a0,a0,-940 # 80008308 <_ZN3stm4coutE+0x270>
    800056bc:	00001097          	auipc	ra,0x1
    800056c0:	a8c080e7          	jalr	-1396(ra) # 80006148 <__printf>
    800056c4:	00001097          	auipc	ra,0x1
    800056c8:	4a4080e7          	jalr	1188(ra) # 80006b68 <kinit>
    800056cc:	00000097          	auipc	ra,0x0
    800056d0:	148080e7          	jalr	328(ra) # 80005814 <trapinit>
    800056d4:	00000097          	auipc	ra,0x0
    800056d8:	16c080e7          	jalr	364(ra) # 80005840 <trapinithart>
    800056dc:	00000097          	auipc	ra,0x0
    800056e0:	5b4080e7          	jalr	1460(ra) # 80005c90 <plicinit>
    800056e4:	00000097          	auipc	ra,0x0
    800056e8:	5d4080e7          	jalr	1492(ra) # 80005cb8 <plicinithart>
    800056ec:	00000097          	auipc	ra,0x0
    800056f0:	078080e7          	jalr	120(ra) # 80005764 <userinit>
    800056f4:	0ff0000f          	fence
    800056f8:	00100793          	li	a5,1
    800056fc:	00003517          	auipc	a0,0x3
    80005700:	b1450513          	addi	a0,a0,-1260 # 80008210 <_ZN3stm4coutE+0x178>
    80005704:	00f4a023          	sw	a5,0(s1)
    80005708:	00001097          	auipc	ra,0x1
    8000570c:	a40080e7          	jalr	-1472(ra) # 80006148 <__printf>
    80005710:	0000006f          	j	80005710 <system_main+0xd4>

0000000080005714 <cpuid>:
    80005714:	ff010113          	addi	sp,sp,-16
    80005718:	00813423          	sd	s0,8(sp)
    8000571c:	01010413          	addi	s0,sp,16
    80005720:	00020513          	mv	a0,tp
    80005724:	00813403          	ld	s0,8(sp)
    80005728:	0005051b          	sext.w	a0,a0
    8000572c:	01010113          	addi	sp,sp,16
    80005730:	00008067          	ret

0000000080005734 <mycpu>:
    80005734:	ff010113          	addi	sp,sp,-16
    80005738:	00813423          	sd	s0,8(sp)
    8000573c:	01010413          	addi	s0,sp,16
    80005740:	00020793          	mv	a5,tp
    80005744:	00813403          	ld	s0,8(sp)
    80005748:	0007879b          	sext.w	a5,a5
    8000574c:	00779793          	slli	a5,a5,0x7
    80005750:	00006517          	auipc	a0,0x6
    80005754:	e9050513          	addi	a0,a0,-368 # 8000b5e0 <cpus>
    80005758:	00f50533          	add	a0,a0,a5
    8000575c:	01010113          	addi	sp,sp,16
    80005760:	00008067          	ret

0000000080005764 <userinit>:
    80005764:	ff010113          	addi	sp,sp,-16
    80005768:	00813423          	sd	s0,8(sp)
    8000576c:	01010413          	addi	s0,sp,16
    80005770:	00813403          	ld	s0,8(sp)
    80005774:	01010113          	addi	sp,sp,16
    80005778:	ffffe317          	auipc	t1,0xffffe
    8000577c:	44830067          	jr	1096(t1) # 80003bc0 <main>

0000000080005780 <either_copyout>:
    80005780:	ff010113          	addi	sp,sp,-16
    80005784:	00813023          	sd	s0,0(sp)
    80005788:	00113423          	sd	ra,8(sp)
    8000578c:	01010413          	addi	s0,sp,16
    80005790:	02051663          	bnez	a0,800057bc <either_copyout+0x3c>
    80005794:	00058513          	mv	a0,a1
    80005798:	00060593          	mv	a1,a2
    8000579c:	0006861b          	sext.w	a2,a3
    800057a0:	00002097          	auipc	ra,0x2
    800057a4:	c54080e7          	jalr	-940(ra) # 800073f4 <__memmove>
    800057a8:	00813083          	ld	ra,8(sp)
    800057ac:	00013403          	ld	s0,0(sp)
    800057b0:	00000513          	li	a0,0
    800057b4:	01010113          	addi	sp,sp,16
    800057b8:	00008067          	ret
    800057bc:	00003517          	auipc	a0,0x3
    800057c0:	a9450513          	addi	a0,a0,-1388 # 80008250 <_ZN3stm4coutE+0x1b8>
    800057c4:	00001097          	auipc	ra,0x1
    800057c8:	928080e7          	jalr	-1752(ra) # 800060ec <panic>

00000000800057cc <either_copyin>:
    800057cc:	ff010113          	addi	sp,sp,-16
    800057d0:	00813023          	sd	s0,0(sp)
    800057d4:	00113423          	sd	ra,8(sp)
    800057d8:	01010413          	addi	s0,sp,16
    800057dc:	02059463          	bnez	a1,80005804 <either_copyin+0x38>
    800057e0:	00060593          	mv	a1,a2
    800057e4:	0006861b          	sext.w	a2,a3
    800057e8:	00002097          	auipc	ra,0x2
    800057ec:	c0c080e7          	jalr	-1012(ra) # 800073f4 <__memmove>
    800057f0:	00813083          	ld	ra,8(sp)
    800057f4:	00013403          	ld	s0,0(sp)
    800057f8:	00000513          	li	a0,0
    800057fc:	01010113          	addi	sp,sp,16
    80005800:	00008067          	ret
    80005804:	00003517          	auipc	a0,0x3
    80005808:	a7450513          	addi	a0,a0,-1420 # 80008278 <_ZN3stm4coutE+0x1e0>
    8000580c:	00001097          	auipc	ra,0x1
    80005810:	8e0080e7          	jalr	-1824(ra) # 800060ec <panic>

0000000080005814 <trapinit>:
    80005814:	ff010113          	addi	sp,sp,-16
    80005818:	00813423          	sd	s0,8(sp)
    8000581c:	01010413          	addi	s0,sp,16
    80005820:	00813403          	ld	s0,8(sp)
    80005824:	00003597          	auipc	a1,0x3
    80005828:	a7c58593          	addi	a1,a1,-1412 # 800082a0 <_ZN3stm4coutE+0x208>
    8000582c:	00006517          	auipc	a0,0x6
    80005830:	e3450513          	addi	a0,a0,-460 # 8000b660 <tickslock>
    80005834:	01010113          	addi	sp,sp,16
    80005838:	00001317          	auipc	t1,0x1
    8000583c:	5c030067          	jr	1472(t1) # 80006df8 <initlock>

0000000080005840 <trapinithart>:
    80005840:	ff010113          	addi	sp,sp,-16
    80005844:	00813423          	sd	s0,8(sp)
    80005848:	01010413          	addi	s0,sp,16
    8000584c:	00000797          	auipc	a5,0x0
    80005850:	2f478793          	addi	a5,a5,756 # 80005b40 <kernelvec>
    80005854:	10579073          	csrw	stvec,a5
    80005858:	00813403          	ld	s0,8(sp)
    8000585c:	01010113          	addi	sp,sp,16
    80005860:	00008067          	ret

0000000080005864 <usertrap>:
    80005864:	ff010113          	addi	sp,sp,-16
    80005868:	00813423          	sd	s0,8(sp)
    8000586c:	01010413          	addi	s0,sp,16
    80005870:	00813403          	ld	s0,8(sp)
    80005874:	01010113          	addi	sp,sp,16
    80005878:	00008067          	ret

000000008000587c <usertrapret>:
    8000587c:	ff010113          	addi	sp,sp,-16
    80005880:	00813423          	sd	s0,8(sp)
    80005884:	01010413          	addi	s0,sp,16
    80005888:	00813403          	ld	s0,8(sp)
    8000588c:	01010113          	addi	sp,sp,16
    80005890:	00008067          	ret

0000000080005894 <kerneltrap>:
    80005894:	fe010113          	addi	sp,sp,-32
    80005898:	00813823          	sd	s0,16(sp)
    8000589c:	00113c23          	sd	ra,24(sp)
    800058a0:	00913423          	sd	s1,8(sp)
    800058a4:	02010413          	addi	s0,sp,32
    800058a8:	142025f3          	csrr	a1,scause
    800058ac:	100027f3          	csrr	a5,sstatus
    800058b0:	0027f793          	andi	a5,a5,2
    800058b4:	10079c63          	bnez	a5,800059cc <kerneltrap+0x138>
    800058b8:	142027f3          	csrr	a5,scause
    800058bc:	0207ce63          	bltz	a5,800058f8 <kerneltrap+0x64>
    800058c0:	00003517          	auipc	a0,0x3
    800058c4:	a2850513          	addi	a0,a0,-1496 # 800082e8 <_ZN3stm4coutE+0x250>
    800058c8:	00001097          	auipc	ra,0x1
    800058cc:	880080e7          	jalr	-1920(ra) # 80006148 <__printf>
    800058d0:	141025f3          	csrr	a1,sepc
    800058d4:	14302673          	csrr	a2,stval
    800058d8:	00003517          	auipc	a0,0x3
    800058dc:	a2050513          	addi	a0,a0,-1504 # 800082f8 <_ZN3stm4coutE+0x260>
    800058e0:	00001097          	auipc	ra,0x1
    800058e4:	868080e7          	jalr	-1944(ra) # 80006148 <__printf>
    800058e8:	00003517          	auipc	a0,0x3
    800058ec:	a2850513          	addi	a0,a0,-1496 # 80008310 <_ZN3stm4coutE+0x278>
    800058f0:	00000097          	auipc	ra,0x0
    800058f4:	7fc080e7          	jalr	2044(ra) # 800060ec <panic>
    800058f8:	0ff7f713          	andi	a4,a5,255
    800058fc:	00900693          	li	a3,9
    80005900:	04d70063          	beq	a4,a3,80005940 <kerneltrap+0xac>
    80005904:	fff00713          	li	a4,-1
    80005908:	03f71713          	slli	a4,a4,0x3f
    8000590c:	00170713          	addi	a4,a4,1
    80005910:	fae798e3          	bne	a5,a4,800058c0 <kerneltrap+0x2c>
    80005914:	00000097          	auipc	ra,0x0
    80005918:	e00080e7          	jalr	-512(ra) # 80005714 <cpuid>
    8000591c:	06050663          	beqz	a0,80005988 <kerneltrap+0xf4>
    80005920:	144027f3          	csrr	a5,sip
    80005924:	ffd7f793          	andi	a5,a5,-3
    80005928:	14479073          	csrw	sip,a5
    8000592c:	01813083          	ld	ra,24(sp)
    80005930:	01013403          	ld	s0,16(sp)
    80005934:	00813483          	ld	s1,8(sp)
    80005938:	02010113          	addi	sp,sp,32
    8000593c:	00008067          	ret
    80005940:	00000097          	auipc	ra,0x0
    80005944:	3c4080e7          	jalr	964(ra) # 80005d04 <plic_claim>
    80005948:	00a00793          	li	a5,10
    8000594c:	00050493          	mv	s1,a0
    80005950:	06f50863          	beq	a0,a5,800059c0 <kerneltrap+0x12c>
    80005954:	fc050ce3          	beqz	a0,8000592c <kerneltrap+0x98>
    80005958:	00050593          	mv	a1,a0
    8000595c:	00003517          	auipc	a0,0x3
    80005960:	96c50513          	addi	a0,a0,-1684 # 800082c8 <_ZN3stm4coutE+0x230>
    80005964:	00000097          	auipc	ra,0x0
    80005968:	7e4080e7          	jalr	2020(ra) # 80006148 <__printf>
    8000596c:	01013403          	ld	s0,16(sp)
    80005970:	01813083          	ld	ra,24(sp)
    80005974:	00048513          	mv	a0,s1
    80005978:	00813483          	ld	s1,8(sp)
    8000597c:	02010113          	addi	sp,sp,32
    80005980:	00000317          	auipc	t1,0x0
    80005984:	3bc30067          	jr	956(t1) # 80005d3c <plic_complete>
    80005988:	00006517          	auipc	a0,0x6
    8000598c:	cd850513          	addi	a0,a0,-808 # 8000b660 <tickslock>
    80005990:	00001097          	auipc	ra,0x1
    80005994:	48c080e7          	jalr	1164(ra) # 80006e1c <acquire>
    80005998:	00005717          	auipc	a4,0x5
    8000599c:	b1c70713          	addi	a4,a4,-1252 # 8000a4b4 <ticks>
    800059a0:	00072783          	lw	a5,0(a4)
    800059a4:	00006517          	auipc	a0,0x6
    800059a8:	cbc50513          	addi	a0,a0,-836 # 8000b660 <tickslock>
    800059ac:	0017879b          	addiw	a5,a5,1
    800059b0:	00f72023          	sw	a5,0(a4)
    800059b4:	00001097          	auipc	ra,0x1
    800059b8:	534080e7          	jalr	1332(ra) # 80006ee8 <release>
    800059bc:	f65ff06f          	j	80005920 <kerneltrap+0x8c>
    800059c0:	00001097          	auipc	ra,0x1
    800059c4:	090080e7          	jalr	144(ra) # 80006a50 <uartintr>
    800059c8:	fa5ff06f          	j	8000596c <kerneltrap+0xd8>
    800059cc:	00003517          	auipc	a0,0x3
    800059d0:	8dc50513          	addi	a0,a0,-1828 # 800082a8 <_ZN3stm4coutE+0x210>
    800059d4:	00000097          	auipc	ra,0x0
    800059d8:	718080e7          	jalr	1816(ra) # 800060ec <panic>

00000000800059dc <clockintr>:
    800059dc:	fe010113          	addi	sp,sp,-32
    800059e0:	00813823          	sd	s0,16(sp)
    800059e4:	00913423          	sd	s1,8(sp)
    800059e8:	00113c23          	sd	ra,24(sp)
    800059ec:	02010413          	addi	s0,sp,32
    800059f0:	00006497          	auipc	s1,0x6
    800059f4:	c7048493          	addi	s1,s1,-912 # 8000b660 <tickslock>
    800059f8:	00048513          	mv	a0,s1
    800059fc:	00001097          	auipc	ra,0x1
    80005a00:	420080e7          	jalr	1056(ra) # 80006e1c <acquire>
    80005a04:	00005717          	auipc	a4,0x5
    80005a08:	ab070713          	addi	a4,a4,-1360 # 8000a4b4 <ticks>
    80005a0c:	00072783          	lw	a5,0(a4)
    80005a10:	01013403          	ld	s0,16(sp)
    80005a14:	01813083          	ld	ra,24(sp)
    80005a18:	00048513          	mv	a0,s1
    80005a1c:	0017879b          	addiw	a5,a5,1
    80005a20:	00813483          	ld	s1,8(sp)
    80005a24:	00f72023          	sw	a5,0(a4)
    80005a28:	02010113          	addi	sp,sp,32
    80005a2c:	00001317          	auipc	t1,0x1
    80005a30:	4bc30067          	jr	1212(t1) # 80006ee8 <release>

0000000080005a34 <devintr>:
    80005a34:	142027f3          	csrr	a5,scause
    80005a38:	00000513          	li	a0,0
    80005a3c:	0007c463          	bltz	a5,80005a44 <devintr+0x10>
    80005a40:	00008067          	ret
    80005a44:	fe010113          	addi	sp,sp,-32
    80005a48:	00813823          	sd	s0,16(sp)
    80005a4c:	00113c23          	sd	ra,24(sp)
    80005a50:	00913423          	sd	s1,8(sp)
    80005a54:	02010413          	addi	s0,sp,32
    80005a58:	0ff7f713          	andi	a4,a5,255
    80005a5c:	00900693          	li	a3,9
    80005a60:	04d70c63          	beq	a4,a3,80005ab8 <devintr+0x84>
    80005a64:	fff00713          	li	a4,-1
    80005a68:	03f71713          	slli	a4,a4,0x3f
    80005a6c:	00170713          	addi	a4,a4,1
    80005a70:	00e78c63          	beq	a5,a4,80005a88 <devintr+0x54>
    80005a74:	01813083          	ld	ra,24(sp)
    80005a78:	01013403          	ld	s0,16(sp)
    80005a7c:	00813483          	ld	s1,8(sp)
    80005a80:	02010113          	addi	sp,sp,32
    80005a84:	00008067          	ret
    80005a88:	00000097          	auipc	ra,0x0
    80005a8c:	c8c080e7          	jalr	-884(ra) # 80005714 <cpuid>
    80005a90:	06050663          	beqz	a0,80005afc <devintr+0xc8>
    80005a94:	144027f3          	csrr	a5,sip
    80005a98:	ffd7f793          	andi	a5,a5,-3
    80005a9c:	14479073          	csrw	sip,a5
    80005aa0:	01813083          	ld	ra,24(sp)
    80005aa4:	01013403          	ld	s0,16(sp)
    80005aa8:	00813483          	ld	s1,8(sp)
    80005aac:	00200513          	li	a0,2
    80005ab0:	02010113          	addi	sp,sp,32
    80005ab4:	00008067          	ret
    80005ab8:	00000097          	auipc	ra,0x0
    80005abc:	24c080e7          	jalr	588(ra) # 80005d04 <plic_claim>
    80005ac0:	00a00793          	li	a5,10
    80005ac4:	00050493          	mv	s1,a0
    80005ac8:	06f50663          	beq	a0,a5,80005b34 <devintr+0x100>
    80005acc:	00100513          	li	a0,1
    80005ad0:	fa0482e3          	beqz	s1,80005a74 <devintr+0x40>
    80005ad4:	00048593          	mv	a1,s1
    80005ad8:	00002517          	auipc	a0,0x2
    80005adc:	7f050513          	addi	a0,a0,2032 # 800082c8 <_ZN3stm4coutE+0x230>
    80005ae0:	00000097          	auipc	ra,0x0
    80005ae4:	668080e7          	jalr	1640(ra) # 80006148 <__printf>
    80005ae8:	00048513          	mv	a0,s1
    80005aec:	00000097          	auipc	ra,0x0
    80005af0:	250080e7          	jalr	592(ra) # 80005d3c <plic_complete>
    80005af4:	00100513          	li	a0,1
    80005af8:	f7dff06f          	j	80005a74 <devintr+0x40>
    80005afc:	00006517          	auipc	a0,0x6
    80005b00:	b6450513          	addi	a0,a0,-1180 # 8000b660 <tickslock>
    80005b04:	00001097          	auipc	ra,0x1
    80005b08:	318080e7          	jalr	792(ra) # 80006e1c <acquire>
    80005b0c:	00005717          	auipc	a4,0x5
    80005b10:	9a870713          	addi	a4,a4,-1624 # 8000a4b4 <ticks>
    80005b14:	00072783          	lw	a5,0(a4)
    80005b18:	00006517          	auipc	a0,0x6
    80005b1c:	b4850513          	addi	a0,a0,-1208 # 8000b660 <tickslock>
    80005b20:	0017879b          	addiw	a5,a5,1
    80005b24:	00f72023          	sw	a5,0(a4)
    80005b28:	00001097          	auipc	ra,0x1
    80005b2c:	3c0080e7          	jalr	960(ra) # 80006ee8 <release>
    80005b30:	f65ff06f          	j	80005a94 <devintr+0x60>
    80005b34:	00001097          	auipc	ra,0x1
    80005b38:	f1c080e7          	jalr	-228(ra) # 80006a50 <uartintr>
    80005b3c:	fadff06f          	j	80005ae8 <devintr+0xb4>

0000000080005b40 <kernelvec>:
    80005b40:	f0010113          	addi	sp,sp,-256
    80005b44:	00113023          	sd	ra,0(sp)
    80005b48:	00213423          	sd	sp,8(sp)
    80005b4c:	00313823          	sd	gp,16(sp)
    80005b50:	00413c23          	sd	tp,24(sp)
    80005b54:	02513023          	sd	t0,32(sp)
    80005b58:	02613423          	sd	t1,40(sp)
    80005b5c:	02713823          	sd	t2,48(sp)
    80005b60:	02813c23          	sd	s0,56(sp)
    80005b64:	04913023          	sd	s1,64(sp)
    80005b68:	04a13423          	sd	a0,72(sp)
    80005b6c:	04b13823          	sd	a1,80(sp)
    80005b70:	04c13c23          	sd	a2,88(sp)
    80005b74:	06d13023          	sd	a3,96(sp)
    80005b78:	06e13423          	sd	a4,104(sp)
    80005b7c:	06f13823          	sd	a5,112(sp)
    80005b80:	07013c23          	sd	a6,120(sp)
    80005b84:	09113023          	sd	a7,128(sp)
    80005b88:	09213423          	sd	s2,136(sp)
    80005b8c:	09313823          	sd	s3,144(sp)
    80005b90:	09413c23          	sd	s4,152(sp)
    80005b94:	0b513023          	sd	s5,160(sp)
    80005b98:	0b613423          	sd	s6,168(sp)
    80005b9c:	0b713823          	sd	s7,176(sp)
    80005ba0:	0b813c23          	sd	s8,184(sp)
    80005ba4:	0d913023          	sd	s9,192(sp)
    80005ba8:	0da13423          	sd	s10,200(sp)
    80005bac:	0db13823          	sd	s11,208(sp)
    80005bb0:	0dc13c23          	sd	t3,216(sp)
    80005bb4:	0fd13023          	sd	t4,224(sp)
    80005bb8:	0fe13423          	sd	t5,232(sp)
    80005bbc:	0ff13823          	sd	t6,240(sp)
    80005bc0:	cd5ff0ef          	jal	ra,80005894 <kerneltrap>
    80005bc4:	00013083          	ld	ra,0(sp)
    80005bc8:	00813103          	ld	sp,8(sp)
    80005bcc:	01013183          	ld	gp,16(sp)
    80005bd0:	02013283          	ld	t0,32(sp)
    80005bd4:	02813303          	ld	t1,40(sp)
    80005bd8:	03013383          	ld	t2,48(sp)
    80005bdc:	03813403          	ld	s0,56(sp)
    80005be0:	04013483          	ld	s1,64(sp)
    80005be4:	04813503          	ld	a0,72(sp)
    80005be8:	05013583          	ld	a1,80(sp)
    80005bec:	05813603          	ld	a2,88(sp)
    80005bf0:	06013683          	ld	a3,96(sp)
    80005bf4:	06813703          	ld	a4,104(sp)
    80005bf8:	07013783          	ld	a5,112(sp)
    80005bfc:	07813803          	ld	a6,120(sp)
    80005c00:	08013883          	ld	a7,128(sp)
    80005c04:	08813903          	ld	s2,136(sp)
    80005c08:	09013983          	ld	s3,144(sp)
    80005c0c:	09813a03          	ld	s4,152(sp)
    80005c10:	0a013a83          	ld	s5,160(sp)
    80005c14:	0a813b03          	ld	s6,168(sp)
    80005c18:	0b013b83          	ld	s7,176(sp)
    80005c1c:	0b813c03          	ld	s8,184(sp)
    80005c20:	0c013c83          	ld	s9,192(sp)
    80005c24:	0c813d03          	ld	s10,200(sp)
    80005c28:	0d013d83          	ld	s11,208(sp)
    80005c2c:	0d813e03          	ld	t3,216(sp)
    80005c30:	0e013e83          	ld	t4,224(sp)
    80005c34:	0e813f03          	ld	t5,232(sp)
    80005c38:	0f013f83          	ld	t6,240(sp)
    80005c3c:	10010113          	addi	sp,sp,256
    80005c40:	10200073          	sret
    80005c44:	00000013          	nop
    80005c48:	00000013          	nop
    80005c4c:	00000013          	nop

0000000080005c50 <timervec>:
    80005c50:	34051573          	csrrw	a0,mscratch,a0
    80005c54:	00b53023          	sd	a1,0(a0)
    80005c58:	00c53423          	sd	a2,8(a0)
    80005c5c:	00d53823          	sd	a3,16(a0)
    80005c60:	01853583          	ld	a1,24(a0)
    80005c64:	02053603          	ld	a2,32(a0)
    80005c68:	0005b683          	ld	a3,0(a1)
    80005c6c:	00c686b3          	add	a3,a3,a2
    80005c70:	00d5b023          	sd	a3,0(a1)
    80005c74:	00200593          	li	a1,2
    80005c78:	14459073          	csrw	sip,a1
    80005c7c:	01053683          	ld	a3,16(a0)
    80005c80:	00853603          	ld	a2,8(a0)
    80005c84:	00053583          	ld	a1,0(a0)
    80005c88:	34051573          	csrrw	a0,mscratch,a0
    80005c8c:	30200073          	mret

0000000080005c90 <plicinit>:
    80005c90:	ff010113          	addi	sp,sp,-16
    80005c94:	00813423          	sd	s0,8(sp)
    80005c98:	01010413          	addi	s0,sp,16
    80005c9c:	00813403          	ld	s0,8(sp)
    80005ca0:	0c0007b7          	lui	a5,0xc000
    80005ca4:	00100713          	li	a4,1
    80005ca8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80005cac:	00e7a223          	sw	a4,4(a5)
    80005cb0:	01010113          	addi	sp,sp,16
    80005cb4:	00008067          	ret

0000000080005cb8 <plicinithart>:
    80005cb8:	ff010113          	addi	sp,sp,-16
    80005cbc:	00813023          	sd	s0,0(sp)
    80005cc0:	00113423          	sd	ra,8(sp)
    80005cc4:	01010413          	addi	s0,sp,16
    80005cc8:	00000097          	auipc	ra,0x0
    80005ccc:	a4c080e7          	jalr	-1460(ra) # 80005714 <cpuid>
    80005cd0:	0085171b          	slliw	a4,a0,0x8
    80005cd4:	0c0027b7          	lui	a5,0xc002
    80005cd8:	00e787b3          	add	a5,a5,a4
    80005cdc:	40200713          	li	a4,1026
    80005ce0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005ce4:	00813083          	ld	ra,8(sp)
    80005ce8:	00013403          	ld	s0,0(sp)
    80005cec:	00d5151b          	slliw	a0,a0,0xd
    80005cf0:	0c2017b7          	lui	a5,0xc201
    80005cf4:	00a78533          	add	a0,a5,a0
    80005cf8:	00052023          	sw	zero,0(a0)
    80005cfc:	01010113          	addi	sp,sp,16
    80005d00:	00008067          	ret

0000000080005d04 <plic_claim>:
    80005d04:	ff010113          	addi	sp,sp,-16
    80005d08:	00813023          	sd	s0,0(sp)
    80005d0c:	00113423          	sd	ra,8(sp)
    80005d10:	01010413          	addi	s0,sp,16
    80005d14:	00000097          	auipc	ra,0x0
    80005d18:	a00080e7          	jalr	-1536(ra) # 80005714 <cpuid>
    80005d1c:	00813083          	ld	ra,8(sp)
    80005d20:	00013403          	ld	s0,0(sp)
    80005d24:	00d5151b          	slliw	a0,a0,0xd
    80005d28:	0c2017b7          	lui	a5,0xc201
    80005d2c:	00a78533          	add	a0,a5,a0
    80005d30:	00452503          	lw	a0,4(a0)
    80005d34:	01010113          	addi	sp,sp,16
    80005d38:	00008067          	ret

0000000080005d3c <plic_complete>:
    80005d3c:	fe010113          	addi	sp,sp,-32
    80005d40:	00813823          	sd	s0,16(sp)
    80005d44:	00913423          	sd	s1,8(sp)
    80005d48:	00113c23          	sd	ra,24(sp)
    80005d4c:	02010413          	addi	s0,sp,32
    80005d50:	00050493          	mv	s1,a0
    80005d54:	00000097          	auipc	ra,0x0
    80005d58:	9c0080e7          	jalr	-1600(ra) # 80005714 <cpuid>
    80005d5c:	01813083          	ld	ra,24(sp)
    80005d60:	01013403          	ld	s0,16(sp)
    80005d64:	00d5179b          	slliw	a5,a0,0xd
    80005d68:	0c201737          	lui	a4,0xc201
    80005d6c:	00f707b3          	add	a5,a4,a5
    80005d70:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005d74:	00813483          	ld	s1,8(sp)
    80005d78:	02010113          	addi	sp,sp,32
    80005d7c:	00008067          	ret

0000000080005d80 <consolewrite>:
    80005d80:	fb010113          	addi	sp,sp,-80
    80005d84:	04813023          	sd	s0,64(sp)
    80005d88:	04113423          	sd	ra,72(sp)
    80005d8c:	02913c23          	sd	s1,56(sp)
    80005d90:	03213823          	sd	s2,48(sp)
    80005d94:	03313423          	sd	s3,40(sp)
    80005d98:	03413023          	sd	s4,32(sp)
    80005d9c:	01513c23          	sd	s5,24(sp)
    80005da0:	05010413          	addi	s0,sp,80
    80005da4:	06c05c63          	blez	a2,80005e1c <consolewrite+0x9c>
    80005da8:	00060993          	mv	s3,a2
    80005dac:	00050a13          	mv	s4,a0
    80005db0:	00058493          	mv	s1,a1
    80005db4:	00000913          	li	s2,0
    80005db8:	fff00a93          	li	s5,-1
    80005dbc:	01c0006f          	j	80005dd8 <consolewrite+0x58>
    80005dc0:	fbf44503          	lbu	a0,-65(s0)
    80005dc4:	0019091b          	addiw	s2,s2,1
    80005dc8:	00148493          	addi	s1,s1,1
    80005dcc:	00001097          	auipc	ra,0x1
    80005dd0:	a9c080e7          	jalr	-1380(ra) # 80006868 <uartputc>
    80005dd4:	03298063          	beq	s3,s2,80005df4 <consolewrite+0x74>
    80005dd8:	00048613          	mv	a2,s1
    80005ddc:	00100693          	li	a3,1
    80005de0:	000a0593          	mv	a1,s4
    80005de4:	fbf40513          	addi	a0,s0,-65
    80005de8:	00000097          	auipc	ra,0x0
    80005dec:	9e4080e7          	jalr	-1564(ra) # 800057cc <either_copyin>
    80005df0:	fd5518e3          	bne	a0,s5,80005dc0 <consolewrite+0x40>
    80005df4:	04813083          	ld	ra,72(sp)
    80005df8:	04013403          	ld	s0,64(sp)
    80005dfc:	03813483          	ld	s1,56(sp)
    80005e00:	02813983          	ld	s3,40(sp)
    80005e04:	02013a03          	ld	s4,32(sp)
    80005e08:	01813a83          	ld	s5,24(sp)
    80005e0c:	00090513          	mv	a0,s2
    80005e10:	03013903          	ld	s2,48(sp)
    80005e14:	05010113          	addi	sp,sp,80
    80005e18:	00008067          	ret
    80005e1c:	00000913          	li	s2,0
    80005e20:	fd5ff06f          	j	80005df4 <consolewrite+0x74>

0000000080005e24 <consoleread>:
    80005e24:	f9010113          	addi	sp,sp,-112
    80005e28:	06813023          	sd	s0,96(sp)
    80005e2c:	04913c23          	sd	s1,88(sp)
    80005e30:	05213823          	sd	s2,80(sp)
    80005e34:	05313423          	sd	s3,72(sp)
    80005e38:	05413023          	sd	s4,64(sp)
    80005e3c:	03513c23          	sd	s5,56(sp)
    80005e40:	03613823          	sd	s6,48(sp)
    80005e44:	03713423          	sd	s7,40(sp)
    80005e48:	03813023          	sd	s8,32(sp)
    80005e4c:	06113423          	sd	ra,104(sp)
    80005e50:	01913c23          	sd	s9,24(sp)
    80005e54:	07010413          	addi	s0,sp,112
    80005e58:	00060b93          	mv	s7,a2
    80005e5c:	00050913          	mv	s2,a0
    80005e60:	00058c13          	mv	s8,a1
    80005e64:	00060b1b          	sext.w	s6,a2
    80005e68:	00006497          	auipc	s1,0x6
    80005e6c:	82048493          	addi	s1,s1,-2016 # 8000b688 <cons>
    80005e70:	00400993          	li	s3,4
    80005e74:	fff00a13          	li	s4,-1
    80005e78:	00a00a93          	li	s5,10
    80005e7c:	05705e63          	blez	s7,80005ed8 <consoleread+0xb4>
    80005e80:	09c4a703          	lw	a4,156(s1)
    80005e84:	0984a783          	lw	a5,152(s1)
    80005e88:	0007071b          	sext.w	a4,a4
    80005e8c:	08e78463          	beq	a5,a4,80005f14 <consoleread+0xf0>
    80005e90:	07f7f713          	andi	a4,a5,127
    80005e94:	00e48733          	add	a4,s1,a4
    80005e98:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80005e9c:	0017869b          	addiw	a3,a5,1
    80005ea0:	08d4ac23          	sw	a3,152(s1)
    80005ea4:	00070c9b          	sext.w	s9,a4
    80005ea8:	0b370663          	beq	a4,s3,80005f54 <consoleread+0x130>
    80005eac:	00100693          	li	a3,1
    80005eb0:	f9f40613          	addi	a2,s0,-97
    80005eb4:	000c0593          	mv	a1,s8
    80005eb8:	00090513          	mv	a0,s2
    80005ebc:	f8e40fa3          	sb	a4,-97(s0)
    80005ec0:	00000097          	auipc	ra,0x0
    80005ec4:	8c0080e7          	jalr	-1856(ra) # 80005780 <either_copyout>
    80005ec8:	01450863          	beq	a0,s4,80005ed8 <consoleread+0xb4>
    80005ecc:	001c0c13          	addi	s8,s8,1
    80005ed0:	fffb8b9b          	addiw	s7,s7,-1
    80005ed4:	fb5c94e3          	bne	s9,s5,80005e7c <consoleread+0x58>
    80005ed8:	000b851b          	sext.w	a0,s7
    80005edc:	06813083          	ld	ra,104(sp)
    80005ee0:	06013403          	ld	s0,96(sp)
    80005ee4:	05813483          	ld	s1,88(sp)
    80005ee8:	05013903          	ld	s2,80(sp)
    80005eec:	04813983          	ld	s3,72(sp)
    80005ef0:	04013a03          	ld	s4,64(sp)
    80005ef4:	03813a83          	ld	s5,56(sp)
    80005ef8:	02813b83          	ld	s7,40(sp)
    80005efc:	02013c03          	ld	s8,32(sp)
    80005f00:	01813c83          	ld	s9,24(sp)
    80005f04:	40ab053b          	subw	a0,s6,a0
    80005f08:	03013b03          	ld	s6,48(sp)
    80005f0c:	07010113          	addi	sp,sp,112
    80005f10:	00008067          	ret
    80005f14:	00001097          	auipc	ra,0x1
    80005f18:	1d8080e7          	jalr	472(ra) # 800070ec <push_on>
    80005f1c:	0984a703          	lw	a4,152(s1)
    80005f20:	09c4a783          	lw	a5,156(s1)
    80005f24:	0007879b          	sext.w	a5,a5
    80005f28:	fef70ce3          	beq	a4,a5,80005f20 <consoleread+0xfc>
    80005f2c:	00001097          	auipc	ra,0x1
    80005f30:	234080e7          	jalr	564(ra) # 80007160 <pop_on>
    80005f34:	0984a783          	lw	a5,152(s1)
    80005f38:	07f7f713          	andi	a4,a5,127
    80005f3c:	00e48733          	add	a4,s1,a4
    80005f40:	01874703          	lbu	a4,24(a4)
    80005f44:	0017869b          	addiw	a3,a5,1
    80005f48:	08d4ac23          	sw	a3,152(s1)
    80005f4c:	00070c9b          	sext.w	s9,a4
    80005f50:	f5371ee3          	bne	a4,s3,80005eac <consoleread+0x88>
    80005f54:	000b851b          	sext.w	a0,s7
    80005f58:	f96bf2e3          	bgeu	s7,s6,80005edc <consoleread+0xb8>
    80005f5c:	08f4ac23          	sw	a5,152(s1)
    80005f60:	f7dff06f          	j	80005edc <consoleread+0xb8>

0000000080005f64 <consputc>:
    80005f64:	10000793          	li	a5,256
    80005f68:	00f50663          	beq	a0,a5,80005f74 <consputc+0x10>
    80005f6c:	00001317          	auipc	t1,0x1
    80005f70:	9f430067          	jr	-1548(t1) # 80006960 <uartputc_sync>
    80005f74:	ff010113          	addi	sp,sp,-16
    80005f78:	00113423          	sd	ra,8(sp)
    80005f7c:	00813023          	sd	s0,0(sp)
    80005f80:	01010413          	addi	s0,sp,16
    80005f84:	00800513          	li	a0,8
    80005f88:	00001097          	auipc	ra,0x1
    80005f8c:	9d8080e7          	jalr	-1576(ra) # 80006960 <uartputc_sync>
    80005f90:	02000513          	li	a0,32
    80005f94:	00001097          	auipc	ra,0x1
    80005f98:	9cc080e7          	jalr	-1588(ra) # 80006960 <uartputc_sync>
    80005f9c:	00013403          	ld	s0,0(sp)
    80005fa0:	00813083          	ld	ra,8(sp)
    80005fa4:	00800513          	li	a0,8
    80005fa8:	01010113          	addi	sp,sp,16
    80005fac:	00001317          	auipc	t1,0x1
    80005fb0:	9b430067          	jr	-1612(t1) # 80006960 <uartputc_sync>

0000000080005fb4 <consoleintr>:
    80005fb4:	fe010113          	addi	sp,sp,-32
    80005fb8:	00813823          	sd	s0,16(sp)
    80005fbc:	00913423          	sd	s1,8(sp)
    80005fc0:	01213023          	sd	s2,0(sp)
    80005fc4:	00113c23          	sd	ra,24(sp)
    80005fc8:	02010413          	addi	s0,sp,32
    80005fcc:	00005917          	auipc	s2,0x5
    80005fd0:	6bc90913          	addi	s2,s2,1724 # 8000b688 <cons>
    80005fd4:	00050493          	mv	s1,a0
    80005fd8:	00090513          	mv	a0,s2
    80005fdc:	00001097          	auipc	ra,0x1
    80005fe0:	e40080e7          	jalr	-448(ra) # 80006e1c <acquire>
    80005fe4:	02048c63          	beqz	s1,8000601c <consoleintr+0x68>
    80005fe8:	0a092783          	lw	a5,160(s2)
    80005fec:	09892703          	lw	a4,152(s2)
    80005ff0:	07f00693          	li	a3,127
    80005ff4:	40e7873b          	subw	a4,a5,a4
    80005ff8:	02e6e263          	bltu	a3,a4,8000601c <consoleintr+0x68>
    80005ffc:	00d00713          	li	a4,13
    80006000:	04e48063          	beq	s1,a4,80006040 <consoleintr+0x8c>
    80006004:	07f7f713          	andi	a4,a5,127
    80006008:	00e90733          	add	a4,s2,a4
    8000600c:	0017879b          	addiw	a5,a5,1
    80006010:	0af92023          	sw	a5,160(s2)
    80006014:	00970c23          	sb	s1,24(a4)
    80006018:	08f92e23          	sw	a5,156(s2)
    8000601c:	01013403          	ld	s0,16(sp)
    80006020:	01813083          	ld	ra,24(sp)
    80006024:	00813483          	ld	s1,8(sp)
    80006028:	00013903          	ld	s2,0(sp)
    8000602c:	00005517          	auipc	a0,0x5
    80006030:	65c50513          	addi	a0,a0,1628 # 8000b688 <cons>
    80006034:	02010113          	addi	sp,sp,32
    80006038:	00001317          	auipc	t1,0x1
    8000603c:	eb030067          	jr	-336(t1) # 80006ee8 <release>
    80006040:	00a00493          	li	s1,10
    80006044:	fc1ff06f          	j	80006004 <consoleintr+0x50>

0000000080006048 <consoleinit>:
    80006048:	fe010113          	addi	sp,sp,-32
    8000604c:	00113c23          	sd	ra,24(sp)
    80006050:	00813823          	sd	s0,16(sp)
    80006054:	00913423          	sd	s1,8(sp)
    80006058:	02010413          	addi	s0,sp,32
    8000605c:	00005497          	auipc	s1,0x5
    80006060:	62c48493          	addi	s1,s1,1580 # 8000b688 <cons>
    80006064:	00048513          	mv	a0,s1
    80006068:	00002597          	auipc	a1,0x2
    8000606c:	2b858593          	addi	a1,a1,696 # 80008320 <_ZN3stm4coutE+0x288>
    80006070:	00001097          	auipc	ra,0x1
    80006074:	d88080e7          	jalr	-632(ra) # 80006df8 <initlock>
    80006078:	00000097          	auipc	ra,0x0
    8000607c:	7ac080e7          	jalr	1964(ra) # 80006824 <uartinit>
    80006080:	01813083          	ld	ra,24(sp)
    80006084:	01013403          	ld	s0,16(sp)
    80006088:	00000797          	auipc	a5,0x0
    8000608c:	d9c78793          	addi	a5,a5,-612 # 80005e24 <consoleread>
    80006090:	0af4bc23          	sd	a5,184(s1)
    80006094:	00000797          	auipc	a5,0x0
    80006098:	cec78793          	addi	a5,a5,-788 # 80005d80 <consolewrite>
    8000609c:	0cf4b023          	sd	a5,192(s1)
    800060a0:	00813483          	ld	s1,8(sp)
    800060a4:	02010113          	addi	sp,sp,32
    800060a8:	00008067          	ret

00000000800060ac <console_read>:
    800060ac:	ff010113          	addi	sp,sp,-16
    800060b0:	00813423          	sd	s0,8(sp)
    800060b4:	01010413          	addi	s0,sp,16
    800060b8:	00813403          	ld	s0,8(sp)
    800060bc:	00005317          	auipc	t1,0x5
    800060c0:	68433303          	ld	t1,1668(t1) # 8000b740 <devsw+0x10>
    800060c4:	01010113          	addi	sp,sp,16
    800060c8:	00030067          	jr	t1

00000000800060cc <console_write>:
    800060cc:	ff010113          	addi	sp,sp,-16
    800060d0:	00813423          	sd	s0,8(sp)
    800060d4:	01010413          	addi	s0,sp,16
    800060d8:	00813403          	ld	s0,8(sp)
    800060dc:	00005317          	auipc	t1,0x5
    800060e0:	66c33303          	ld	t1,1644(t1) # 8000b748 <devsw+0x18>
    800060e4:	01010113          	addi	sp,sp,16
    800060e8:	00030067          	jr	t1

00000000800060ec <panic>:
    800060ec:	fe010113          	addi	sp,sp,-32
    800060f0:	00113c23          	sd	ra,24(sp)
    800060f4:	00813823          	sd	s0,16(sp)
    800060f8:	00913423          	sd	s1,8(sp)
    800060fc:	02010413          	addi	s0,sp,32
    80006100:	00050493          	mv	s1,a0
    80006104:	00002517          	auipc	a0,0x2
    80006108:	22450513          	addi	a0,a0,548 # 80008328 <_ZN3stm4coutE+0x290>
    8000610c:	00005797          	auipc	a5,0x5
    80006110:	6c07ae23          	sw	zero,1756(a5) # 8000b7e8 <pr+0x18>
    80006114:	00000097          	auipc	ra,0x0
    80006118:	034080e7          	jalr	52(ra) # 80006148 <__printf>
    8000611c:	00048513          	mv	a0,s1
    80006120:	00000097          	auipc	ra,0x0
    80006124:	028080e7          	jalr	40(ra) # 80006148 <__printf>
    80006128:	00002517          	auipc	a0,0x2
    8000612c:	1e050513          	addi	a0,a0,480 # 80008308 <_ZN3stm4coutE+0x270>
    80006130:	00000097          	auipc	ra,0x0
    80006134:	018080e7          	jalr	24(ra) # 80006148 <__printf>
    80006138:	00100793          	li	a5,1
    8000613c:	00004717          	auipc	a4,0x4
    80006140:	36f72e23          	sw	a5,892(a4) # 8000a4b8 <panicked>
    80006144:	0000006f          	j	80006144 <panic+0x58>

0000000080006148 <__printf>:
    80006148:	f3010113          	addi	sp,sp,-208
    8000614c:	08813023          	sd	s0,128(sp)
    80006150:	07313423          	sd	s3,104(sp)
    80006154:	09010413          	addi	s0,sp,144
    80006158:	05813023          	sd	s8,64(sp)
    8000615c:	08113423          	sd	ra,136(sp)
    80006160:	06913c23          	sd	s1,120(sp)
    80006164:	07213823          	sd	s2,112(sp)
    80006168:	07413023          	sd	s4,96(sp)
    8000616c:	05513c23          	sd	s5,88(sp)
    80006170:	05613823          	sd	s6,80(sp)
    80006174:	05713423          	sd	s7,72(sp)
    80006178:	03913c23          	sd	s9,56(sp)
    8000617c:	03a13823          	sd	s10,48(sp)
    80006180:	03b13423          	sd	s11,40(sp)
    80006184:	00005317          	auipc	t1,0x5
    80006188:	64c30313          	addi	t1,t1,1612 # 8000b7d0 <pr>
    8000618c:	01832c03          	lw	s8,24(t1)
    80006190:	00b43423          	sd	a1,8(s0)
    80006194:	00c43823          	sd	a2,16(s0)
    80006198:	00d43c23          	sd	a3,24(s0)
    8000619c:	02e43023          	sd	a4,32(s0)
    800061a0:	02f43423          	sd	a5,40(s0)
    800061a4:	03043823          	sd	a6,48(s0)
    800061a8:	03143c23          	sd	a7,56(s0)
    800061ac:	00050993          	mv	s3,a0
    800061b0:	4a0c1663          	bnez	s8,8000665c <__printf+0x514>
    800061b4:	60098c63          	beqz	s3,800067cc <__printf+0x684>
    800061b8:	0009c503          	lbu	a0,0(s3)
    800061bc:	00840793          	addi	a5,s0,8
    800061c0:	f6f43c23          	sd	a5,-136(s0)
    800061c4:	00000493          	li	s1,0
    800061c8:	22050063          	beqz	a0,800063e8 <__printf+0x2a0>
    800061cc:	00002a37          	lui	s4,0x2
    800061d0:	00018ab7          	lui	s5,0x18
    800061d4:	000f4b37          	lui	s6,0xf4
    800061d8:	00989bb7          	lui	s7,0x989
    800061dc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800061e0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800061e4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800061e8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800061ec:	00148c9b          	addiw	s9,s1,1
    800061f0:	02500793          	li	a5,37
    800061f4:	01998933          	add	s2,s3,s9
    800061f8:	38f51263          	bne	a0,a5,8000657c <__printf+0x434>
    800061fc:	00094783          	lbu	a5,0(s2)
    80006200:	00078c9b          	sext.w	s9,a5
    80006204:	1e078263          	beqz	a5,800063e8 <__printf+0x2a0>
    80006208:	0024849b          	addiw	s1,s1,2
    8000620c:	07000713          	li	a4,112
    80006210:	00998933          	add	s2,s3,s1
    80006214:	38e78a63          	beq	a5,a4,800065a8 <__printf+0x460>
    80006218:	20f76863          	bltu	a4,a5,80006428 <__printf+0x2e0>
    8000621c:	42a78863          	beq	a5,a0,8000664c <__printf+0x504>
    80006220:	06400713          	li	a4,100
    80006224:	40e79663          	bne	a5,a4,80006630 <__printf+0x4e8>
    80006228:	f7843783          	ld	a5,-136(s0)
    8000622c:	0007a603          	lw	a2,0(a5)
    80006230:	00878793          	addi	a5,a5,8
    80006234:	f6f43c23          	sd	a5,-136(s0)
    80006238:	42064a63          	bltz	a2,8000666c <__printf+0x524>
    8000623c:	00a00713          	li	a4,10
    80006240:	02e677bb          	remuw	a5,a2,a4
    80006244:	00002d97          	auipc	s11,0x2
    80006248:	10cd8d93          	addi	s11,s11,268 # 80008350 <digits>
    8000624c:	00900593          	li	a1,9
    80006250:	0006051b          	sext.w	a0,a2
    80006254:	00000c93          	li	s9,0
    80006258:	02079793          	slli	a5,a5,0x20
    8000625c:	0207d793          	srli	a5,a5,0x20
    80006260:	00fd87b3          	add	a5,s11,a5
    80006264:	0007c783          	lbu	a5,0(a5)
    80006268:	02e656bb          	divuw	a3,a2,a4
    8000626c:	f8f40023          	sb	a5,-128(s0)
    80006270:	14c5d863          	bge	a1,a2,800063c0 <__printf+0x278>
    80006274:	06300593          	li	a1,99
    80006278:	00100c93          	li	s9,1
    8000627c:	02e6f7bb          	remuw	a5,a3,a4
    80006280:	02079793          	slli	a5,a5,0x20
    80006284:	0207d793          	srli	a5,a5,0x20
    80006288:	00fd87b3          	add	a5,s11,a5
    8000628c:	0007c783          	lbu	a5,0(a5)
    80006290:	02e6d73b          	divuw	a4,a3,a4
    80006294:	f8f400a3          	sb	a5,-127(s0)
    80006298:	12a5f463          	bgeu	a1,a0,800063c0 <__printf+0x278>
    8000629c:	00a00693          	li	a3,10
    800062a0:	00900593          	li	a1,9
    800062a4:	02d777bb          	remuw	a5,a4,a3
    800062a8:	02079793          	slli	a5,a5,0x20
    800062ac:	0207d793          	srli	a5,a5,0x20
    800062b0:	00fd87b3          	add	a5,s11,a5
    800062b4:	0007c503          	lbu	a0,0(a5)
    800062b8:	02d757bb          	divuw	a5,a4,a3
    800062bc:	f8a40123          	sb	a0,-126(s0)
    800062c0:	48e5f263          	bgeu	a1,a4,80006744 <__printf+0x5fc>
    800062c4:	06300513          	li	a0,99
    800062c8:	02d7f5bb          	remuw	a1,a5,a3
    800062cc:	02059593          	slli	a1,a1,0x20
    800062d0:	0205d593          	srli	a1,a1,0x20
    800062d4:	00bd85b3          	add	a1,s11,a1
    800062d8:	0005c583          	lbu	a1,0(a1)
    800062dc:	02d7d7bb          	divuw	a5,a5,a3
    800062e0:	f8b401a3          	sb	a1,-125(s0)
    800062e4:	48e57263          	bgeu	a0,a4,80006768 <__printf+0x620>
    800062e8:	3e700513          	li	a0,999
    800062ec:	02d7f5bb          	remuw	a1,a5,a3
    800062f0:	02059593          	slli	a1,a1,0x20
    800062f4:	0205d593          	srli	a1,a1,0x20
    800062f8:	00bd85b3          	add	a1,s11,a1
    800062fc:	0005c583          	lbu	a1,0(a1)
    80006300:	02d7d7bb          	divuw	a5,a5,a3
    80006304:	f8b40223          	sb	a1,-124(s0)
    80006308:	46e57663          	bgeu	a0,a4,80006774 <__printf+0x62c>
    8000630c:	02d7f5bb          	remuw	a1,a5,a3
    80006310:	02059593          	slli	a1,a1,0x20
    80006314:	0205d593          	srli	a1,a1,0x20
    80006318:	00bd85b3          	add	a1,s11,a1
    8000631c:	0005c583          	lbu	a1,0(a1)
    80006320:	02d7d7bb          	divuw	a5,a5,a3
    80006324:	f8b402a3          	sb	a1,-123(s0)
    80006328:	46ea7863          	bgeu	s4,a4,80006798 <__printf+0x650>
    8000632c:	02d7f5bb          	remuw	a1,a5,a3
    80006330:	02059593          	slli	a1,a1,0x20
    80006334:	0205d593          	srli	a1,a1,0x20
    80006338:	00bd85b3          	add	a1,s11,a1
    8000633c:	0005c583          	lbu	a1,0(a1)
    80006340:	02d7d7bb          	divuw	a5,a5,a3
    80006344:	f8b40323          	sb	a1,-122(s0)
    80006348:	3eeaf863          	bgeu	s5,a4,80006738 <__printf+0x5f0>
    8000634c:	02d7f5bb          	remuw	a1,a5,a3
    80006350:	02059593          	slli	a1,a1,0x20
    80006354:	0205d593          	srli	a1,a1,0x20
    80006358:	00bd85b3          	add	a1,s11,a1
    8000635c:	0005c583          	lbu	a1,0(a1)
    80006360:	02d7d7bb          	divuw	a5,a5,a3
    80006364:	f8b403a3          	sb	a1,-121(s0)
    80006368:	42eb7e63          	bgeu	s6,a4,800067a4 <__printf+0x65c>
    8000636c:	02d7f5bb          	remuw	a1,a5,a3
    80006370:	02059593          	slli	a1,a1,0x20
    80006374:	0205d593          	srli	a1,a1,0x20
    80006378:	00bd85b3          	add	a1,s11,a1
    8000637c:	0005c583          	lbu	a1,0(a1)
    80006380:	02d7d7bb          	divuw	a5,a5,a3
    80006384:	f8b40423          	sb	a1,-120(s0)
    80006388:	42ebfc63          	bgeu	s7,a4,800067c0 <__printf+0x678>
    8000638c:	02079793          	slli	a5,a5,0x20
    80006390:	0207d793          	srli	a5,a5,0x20
    80006394:	00fd8db3          	add	s11,s11,a5
    80006398:	000dc703          	lbu	a4,0(s11)
    8000639c:	00a00793          	li	a5,10
    800063a0:	00900c93          	li	s9,9
    800063a4:	f8e404a3          	sb	a4,-119(s0)
    800063a8:	00065c63          	bgez	a2,800063c0 <__printf+0x278>
    800063ac:	f9040713          	addi	a4,s0,-112
    800063b0:	00f70733          	add	a4,a4,a5
    800063b4:	02d00693          	li	a3,45
    800063b8:	fed70823          	sb	a3,-16(a4)
    800063bc:	00078c93          	mv	s9,a5
    800063c0:	f8040793          	addi	a5,s0,-128
    800063c4:	01978cb3          	add	s9,a5,s9
    800063c8:	f7f40d13          	addi	s10,s0,-129
    800063cc:	000cc503          	lbu	a0,0(s9)
    800063d0:	fffc8c93          	addi	s9,s9,-1
    800063d4:	00000097          	auipc	ra,0x0
    800063d8:	b90080e7          	jalr	-1136(ra) # 80005f64 <consputc>
    800063dc:	ffac98e3          	bne	s9,s10,800063cc <__printf+0x284>
    800063e0:	00094503          	lbu	a0,0(s2)
    800063e4:	e00514e3          	bnez	a0,800061ec <__printf+0xa4>
    800063e8:	1a0c1663          	bnez	s8,80006594 <__printf+0x44c>
    800063ec:	08813083          	ld	ra,136(sp)
    800063f0:	08013403          	ld	s0,128(sp)
    800063f4:	07813483          	ld	s1,120(sp)
    800063f8:	07013903          	ld	s2,112(sp)
    800063fc:	06813983          	ld	s3,104(sp)
    80006400:	06013a03          	ld	s4,96(sp)
    80006404:	05813a83          	ld	s5,88(sp)
    80006408:	05013b03          	ld	s6,80(sp)
    8000640c:	04813b83          	ld	s7,72(sp)
    80006410:	04013c03          	ld	s8,64(sp)
    80006414:	03813c83          	ld	s9,56(sp)
    80006418:	03013d03          	ld	s10,48(sp)
    8000641c:	02813d83          	ld	s11,40(sp)
    80006420:	0d010113          	addi	sp,sp,208
    80006424:	00008067          	ret
    80006428:	07300713          	li	a4,115
    8000642c:	1ce78a63          	beq	a5,a4,80006600 <__printf+0x4b8>
    80006430:	07800713          	li	a4,120
    80006434:	1ee79e63          	bne	a5,a4,80006630 <__printf+0x4e8>
    80006438:	f7843783          	ld	a5,-136(s0)
    8000643c:	0007a703          	lw	a4,0(a5)
    80006440:	00878793          	addi	a5,a5,8
    80006444:	f6f43c23          	sd	a5,-136(s0)
    80006448:	28074263          	bltz	a4,800066cc <__printf+0x584>
    8000644c:	00002d97          	auipc	s11,0x2
    80006450:	f04d8d93          	addi	s11,s11,-252 # 80008350 <digits>
    80006454:	00f77793          	andi	a5,a4,15
    80006458:	00fd87b3          	add	a5,s11,a5
    8000645c:	0007c683          	lbu	a3,0(a5)
    80006460:	00f00613          	li	a2,15
    80006464:	0007079b          	sext.w	a5,a4
    80006468:	f8d40023          	sb	a3,-128(s0)
    8000646c:	0047559b          	srliw	a1,a4,0x4
    80006470:	0047569b          	srliw	a3,a4,0x4
    80006474:	00000c93          	li	s9,0
    80006478:	0ee65063          	bge	a2,a4,80006558 <__printf+0x410>
    8000647c:	00f6f693          	andi	a3,a3,15
    80006480:	00dd86b3          	add	a3,s11,a3
    80006484:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006488:	0087d79b          	srliw	a5,a5,0x8
    8000648c:	00100c93          	li	s9,1
    80006490:	f8d400a3          	sb	a3,-127(s0)
    80006494:	0cb67263          	bgeu	a2,a1,80006558 <__printf+0x410>
    80006498:	00f7f693          	andi	a3,a5,15
    8000649c:	00dd86b3          	add	a3,s11,a3
    800064a0:	0006c583          	lbu	a1,0(a3)
    800064a4:	00f00613          	li	a2,15
    800064a8:	0047d69b          	srliw	a3,a5,0x4
    800064ac:	f8b40123          	sb	a1,-126(s0)
    800064b0:	0047d593          	srli	a1,a5,0x4
    800064b4:	28f67e63          	bgeu	a2,a5,80006750 <__printf+0x608>
    800064b8:	00f6f693          	andi	a3,a3,15
    800064bc:	00dd86b3          	add	a3,s11,a3
    800064c0:	0006c503          	lbu	a0,0(a3)
    800064c4:	0087d813          	srli	a6,a5,0x8
    800064c8:	0087d69b          	srliw	a3,a5,0x8
    800064cc:	f8a401a3          	sb	a0,-125(s0)
    800064d0:	28b67663          	bgeu	a2,a1,8000675c <__printf+0x614>
    800064d4:	00f6f693          	andi	a3,a3,15
    800064d8:	00dd86b3          	add	a3,s11,a3
    800064dc:	0006c583          	lbu	a1,0(a3)
    800064e0:	00c7d513          	srli	a0,a5,0xc
    800064e4:	00c7d69b          	srliw	a3,a5,0xc
    800064e8:	f8b40223          	sb	a1,-124(s0)
    800064ec:	29067a63          	bgeu	a2,a6,80006780 <__printf+0x638>
    800064f0:	00f6f693          	andi	a3,a3,15
    800064f4:	00dd86b3          	add	a3,s11,a3
    800064f8:	0006c583          	lbu	a1,0(a3)
    800064fc:	0107d813          	srli	a6,a5,0x10
    80006500:	0107d69b          	srliw	a3,a5,0x10
    80006504:	f8b402a3          	sb	a1,-123(s0)
    80006508:	28a67263          	bgeu	a2,a0,8000678c <__printf+0x644>
    8000650c:	00f6f693          	andi	a3,a3,15
    80006510:	00dd86b3          	add	a3,s11,a3
    80006514:	0006c683          	lbu	a3,0(a3)
    80006518:	0147d79b          	srliw	a5,a5,0x14
    8000651c:	f8d40323          	sb	a3,-122(s0)
    80006520:	21067663          	bgeu	a2,a6,8000672c <__printf+0x5e4>
    80006524:	02079793          	slli	a5,a5,0x20
    80006528:	0207d793          	srli	a5,a5,0x20
    8000652c:	00fd8db3          	add	s11,s11,a5
    80006530:	000dc683          	lbu	a3,0(s11)
    80006534:	00800793          	li	a5,8
    80006538:	00700c93          	li	s9,7
    8000653c:	f8d403a3          	sb	a3,-121(s0)
    80006540:	00075c63          	bgez	a4,80006558 <__printf+0x410>
    80006544:	f9040713          	addi	a4,s0,-112
    80006548:	00f70733          	add	a4,a4,a5
    8000654c:	02d00693          	li	a3,45
    80006550:	fed70823          	sb	a3,-16(a4)
    80006554:	00078c93          	mv	s9,a5
    80006558:	f8040793          	addi	a5,s0,-128
    8000655c:	01978cb3          	add	s9,a5,s9
    80006560:	f7f40d13          	addi	s10,s0,-129
    80006564:	000cc503          	lbu	a0,0(s9)
    80006568:	fffc8c93          	addi	s9,s9,-1
    8000656c:	00000097          	auipc	ra,0x0
    80006570:	9f8080e7          	jalr	-1544(ra) # 80005f64 <consputc>
    80006574:	ff9d18e3          	bne	s10,s9,80006564 <__printf+0x41c>
    80006578:	0100006f          	j	80006588 <__printf+0x440>
    8000657c:	00000097          	auipc	ra,0x0
    80006580:	9e8080e7          	jalr	-1560(ra) # 80005f64 <consputc>
    80006584:	000c8493          	mv	s1,s9
    80006588:	00094503          	lbu	a0,0(s2)
    8000658c:	c60510e3          	bnez	a0,800061ec <__printf+0xa4>
    80006590:	e40c0ee3          	beqz	s8,800063ec <__printf+0x2a4>
    80006594:	00005517          	auipc	a0,0x5
    80006598:	23c50513          	addi	a0,a0,572 # 8000b7d0 <pr>
    8000659c:	00001097          	auipc	ra,0x1
    800065a0:	94c080e7          	jalr	-1716(ra) # 80006ee8 <release>
    800065a4:	e49ff06f          	j	800063ec <__printf+0x2a4>
    800065a8:	f7843783          	ld	a5,-136(s0)
    800065ac:	03000513          	li	a0,48
    800065b0:	01000d13          	li	s10,16
    800065b4:	00878713          	addi	a4,a5,8
    800065b8:	0007bc83          	ld	s9,0(a5)
    800065bc:	f6e43c23          	sd	a4,-136(s0)
    800065c0:	00000097          	auipc	ra,0x0
    800065c4:	9a4080e7          	jalr	-1628(ra) # 80005f64 <consputc>
    800065c8:	07800513          	li	a0,120
    800065cc:	00000097          	auipc	ra,0x0
    800065d0:	998080e7          	jalr	-1640(ra) # 80005f64 <consputc>
    800065d4:	00002d97          	auipc	s11,0x2
    800065d8:	d7cd8d93          	addi	s11,s11,-644 # 80008350 <digits>
    800065dc:	03ccd793          	srli	a5,s9,0x3c
    800065e0:	00fd87b3          	add	a5,s11,a5
    800065e4:	0007c503          	lbu	a0,0(a5)
    800065e8:	fffd0d1b          	addiw	s10,s10,-1
    800065ec:	004c9c93          	slli	s9,s9,0x4
    800065f0:	00000097          	auipc	ra,0x0
    800065f4:	974080e7          	jalr	-1676(ra) # 80005f64 <consputc>
    800065f8:	fe0d12e3          	bnez	s10,800065dc <__printf+0x494>
    800065fc:	f8dff06f          	j	80006588 <__printf+0x440>
    80006600:	f7843783          	ld	a5,-136(s0)
    80006604:	0007bc83          	ld	s9,0(a5)
    80006608:	00878793          	addi	a5,a5,8
    8000660c:	f6f43c23          	sd	a5,-136(s0)
    80006610:	000c9a63          	bnez	s9,80006624 <__printf+0x4dc>
    80006614:	1080006f          	j	8000671c <__printf+0x5d4>
    80006618:	001c8c93          	addi	s9,s9,1
    8000661c:	00000097          	auipc	ra,0x0
    80006620:	948080e7          	jalr	-1720(ra) # 80005f64 <consputc>
    80006624:	000cc503          	lbu	a0,0(s9)
    80006628:	fe0518e3          	bnez	a0,80006618 <__printf+0x4d0>
    8000662c:	f5dff06f          	j	80006588 <__printf+0x440>
    80006630:	02500513          	li	a0,37
    80006634:	00000097          	auipc	ra,0x0
    80006638:	930080e7          	jalr	-1744(ra) # 80005f64 <consputc>
    8000663c:	000c8513          	mv	a0,s9
    80006640:	00000097          	auipc	ra,0x0
    80006644:	924080e7          	jalr	-1756(ra) # 80005f64 <consputc>
    80006648:	f41ff06f          	j	80006588 <__printf+0x440>
    8000664c:	02500513          	li	a0,37
    80006650:	00000097          	auipc	ra,0x0
    80006654:	914080e7          	jalr	-1772(ra) # 80005f64 <consputc>
    80006658:	f31ff06f          	j	80006588 <__printf+0x440>
    8000665c:	00030513          	mv	a0,t1
    80006660:	00000097          	auipc	ra,0x0
    80006664:	7bc080e7          	jalr	1980(ra) # 80006e1c <acquire>
    80006668:	b4dff06f          	j	800061b4 <__printf+0x6c>
    8000666c:	40c0053b          	negw	a0,a2
    80006670:	00a00713          	li	a4,10
    80006674:	02e576bb          	remuw	a3,a0,a4
    80006678:	00002d97          	auipc	s11,0x2
    8000667c:	cd8d8d93          	addi	s11,s11,-808 # 80008350 <digits>
    80006680:	ff700593          	li	a1,-9
    80006684:	02069693          	slli	a3,a3,0x20
    80006688:	0206d693          	srli	a3,a3,0x20
    8000668c:	00dd86b3          	add	a3,s11,a3
    80006690:	0006c683          	lbu	a3,0(a3)
    80006694:	02e557bb          	divuw	a5,a0,a4
    80006698:	f8d40023          	sb	a3,-128(s0)
    8000669c:	10b65e63          	bge	a2,a1,800067b8 <__printf+0x670>
    800066a0:	06300593          	li	a1,99
    800066a4:	02e7f6bb          	remuw	a3,a5,a4
    800066a8:	02069693          	slli	a3,a3,0x20
    800066ac:	0206d693          	srli	a3,a3,0x20
    800066b0:	00dd86b3          	add	a3,s11,a3
    800066b4:	0006c683          	lbu	a3,0(a3)
    800066b8:	02e7d73b          	divuw	a4,a5,a4
    800066bc:	00200793          	li	a5,2
    800066c0:	f8d400a3          	sb	a3,-127(s0)
    800066c4:	bca5ece3          	bltu	a1,a0,8000629c <__printf+0x154>
    800066c8:	ce5ff06f          	j	800063ac <__printf+0x264>
    800066cc:	40e007bb          	negw	a5,a4
    800066d0:	00002d97          	auipc	s11,0x2
    800066d4:	c80d8d93          	addi	s11,s11,-896 # 80008350 <digits>
    800066d8:	00f7f693          	andi	a3,a5,15
    800066dc:	00dd86b3          	add	a3,s11,a3
    800066e0:	0006c583          	lbu	a1,0(a3)
    800066e4:	ff100613          	li	a2,-15
    800066e8:	0047d69b          	srliw	a3,a5,0x4
    800066ec:	f8b40023          	sb	a1,-128(s0)
    800066f0:	0047d59b          	srliw	a1,a5,0x4
    800066f4:	0ac75e63          	bge	a4,a2,800067b0 <__printf+0x668>
    800066f8:	00f6f693          	andi	a3,a3,15
    800066fc:	00dd86b3          	add	a3,s11,a3
    80006700:	0006c603          	lbu	a2,0(a3)
    80006704:	00f00693          	li	a3,15
    80006708:	0087d79b          	srliw	a5,a5,0x8
    8000670c:	f8c400a3          	sb	a2,-127(s0)
    80006710:	d8b6e4e3          	bltu	a3,a1,80006498 <__printf+0x350>
    80006714:	00200793          	li	a5,2
    80006718:	e2dff06f          	j	80006544 <__printf+0x3fc>
    8000671c:	00002c97          	auipc	s9,0x2
    80006720:	c14c8c93          	addi	s9,s9,-1004 # 80008330 <_ZN3stm4coutE+0x298>
    80006724:	02800513          	li	a0,40
    80006728:	ef1ff06f          	j	80006618 <__printf+0x4d0>
    8000672c:	00700793          	li	a5,7
    80006730:	00600c93          	li	s9,6
    80006734:	e0dff06f          	j	80006540 <__printf+0x3f8>
    80006738:	00700793          	li	a5,7
    8000673c:	00600c93          	li	s9,6
    80006740:	c69ff06f          	j	800063a8 <__printf+0x260>
    80006744:	00300793          	li	a5,3
    80006748:	00200c93          	li	s9,2
    8000674c:	c5dff06f          	j	800063a8 <__printf+0x260>
    80006750:	00300793          	li	a5,3
    80006754:	00200c93          	li	s9,2
    80006758:	de9ff06f          	j	80006540 <__printf+0x3f8>
    8000675c:	00400793          	li	a5,4
    80006760:	00300c93          	li	s9,3
    80006764:	dddff06f          	j	80006540 <__printf+0x3f8>
    80006768:	00400793          	li	a5,4
    8000676c:	00300c93          	li	s9,3
    80006770:	c39ff06f          	j	800063a8 <__printf+0x260>
    80006774:	00500793          	li	a5,5
    80006778:	00400c93          	li	s9,4
    8000677c:	c2dff06f          	j	800063a8 <__printf+0x260>
    80006780:	00500793          	li	a5,5
    80006784:	00400c93          	li	s9,4
    80006788:	db9ff06f          	j	80006540 <__printf+0x3f8>
    8000678c:	00600793          	li	a5,6
    80006790:	00500c93          	li	s9,5
    80006794:	dadff06f          	j	80006540 <__printf+0x3f8>
    80006798:	00600793          	li	a5,6
    8000679c:	00500c93          	li	s9,5
    800067a0:	c09ff06f          	j	800063a8 <__printf+0x260>
    800067a4:	00800793          	li	a5,8
    800067a8:	00700c93          	li	s9,7
    800067ac:	bfdff06f          	j	800063a8 <__printf+0x260>
    800067b0:	00100793          	li	a5,1
    800067b4:	d91ff06f          	j	80006544 <__printf+0x3fc>
    800067b8:	00100793          	li	a5,1
    800067bc:	bf1ff06f          	j	800063ac <__printf+0x264>
    800067c0:	00900793          	li	a5,9
    800067c4:	00800c93          	li	s9,8
    800067c8:	be1ff06f          	j	800063a8 <__printf+0x260>
    800067cc:	00002517          	auipc	a0,0x2
    800067d0:	b6c50513          	addi	a0,a0,-1172 # 80008338 <_ZN3stm4coutE+0x2a0>
    800067d4:	00000097          	auipc	ra,0x0
    800067d8:	918080e7          	jalr	-1768(ra) # 800060ec <panic>

00000000800067dc <printfinit>:
    800067dc:	fe010113          	addi	sp,sp,-32
    800067e0:	00813823          	sd	s0,16(sp)
    800067e4:	00913423          	sd	s1,8(sp)
    800067e8:	00113c23          	sd	ra,24(sp)
    800067ec:	02010413          	addi	s0,sp,32
    800067f0:	00005497          	auipc	s1,0x5
    800067f4:	fe048493          	addi	s1,s1,-32 # 8000b7d0 <pr>
    800067f8:	00048513          	mv	a0,s1
    800067fc:	00002597          	auipc	a1,0x2
    80006800:	b4c58593          	addi	a1,a1,-1204 # 80008348 <_ZN3stm4coutE+0x2b0>
    80006804:	00000097          	auipc	ra,0x0
    80006808:	5f4080e7          	jalr	1524(ra) # 80006df8 <initlock>
    8000680c:	01813083          	ld	ra,24(sp)
    80006810:	01013403          	ld	s0,16(sp)
    80006814:	0004ac23          	sw	zero,24(s1)
    80006818:	00813483          	ld	s1,8(sp)
    8000681c:	02010113          	addi	sp,sp,32
    80006820:	00008067          	ret

0000000080006824 <uartinit>:
    80006824:	ff010113          	addi	sp,sp,-16
    80006828:	00813423          	sd	s0,8(sp)
    8000682c:	01010413          	addi	s0,sp,16
    80006830:	100007b7          	lui	a5,0x10000
    80006834:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006838:	f8000713          	li	a4,-128
    8000683c:	00e781a3          	sb	a4,3(a5)
    80006840:	00300713          	li	a4,3
    80006844:	00e78023          	sb	a4,0(a5)
    80006848:	000780a3          	sb	zero,1(a5)
    8000684c:	00e781a3          	sb	a4,3(a5)
    80006850:	00700693          	li	a3,7
    80006854:	00d78123          	sb	a3,2(a5)
    80006858:	00e780a3          	sb	a4,1(a5)
    8000685c:	00813403          	ld	s0,8(sp)
    80006860:	01010113          	addi	sp,sp,16
    80006864:	00008067          	ret

0000000080006868 <uartputc>:
    80006868:	00004797          	auipc	a5,0x4
    8000686c:	c507a783          	lw	a5,-944(a5) # 8000a4b8 <panicked>
    80006870:	00078463          	beqz	a5,80006878 <uartputc+0x10>
    80006874:	0000006f          	j	80006874 <uartputc+0xc>
    80006878:	fd010113          	addi	sp,sp,-48
    8000687c:	02813023          	sd	s0,32(sp)
    80006880:	00913c23          	sd	s1,24(sp)
    80006884:	01213823          	sd	s2,16(sp)
    80006888:	01313423          	sd	s3,8(sp)
    8000688c:	02113423          	sd	ra,40(sp)
    80006890:	03010413          	addi	s0,sp,48
    80006894:	00004917          	auipc	s2,0x4
    80006898:	c2c90913          	addi	s2,s2,-980 # 8000a4c0 <uart_tx_r>
    8000689c:	00093783          	ld	a5,0(s2)
    800068a0:	00004497          	auipc	s1,0x4
    800068a4:	c2848493          	addi	s1,s1,-984 # 8000a4c8 <uart_tx_w>
    800068a8:	0004b703          	ld	a4,0(s1)
    800068ac:	02078693          	addi	a3,a5,32
    800068b0:	00050993          	mv	s3,a0
    800068b4:	02e69c63          	bne	a3,a4,800068ec <uartputc+0x84>
    800068b8:	00001097          	auipc	ra,0x1
    800068bc:	834080e7          	jalr	-1996(ra) # 800070ec <push_on>
    800068c0:	00093783          	ld	a5,0(s2)
    800068c4:	0004b703          	ld	a4,0(s1)
    800068c8:	02078793          	addi	a5,a5,32
    800068cc:	00e79463          	bne	a5,a4,800068d4 <uartputc+0x6c>
    800068d0:	0000006f          	j	800068d0 <uartputc+0x68>
    800068d4:	00001097          	auipc	ra,0x1
    800068d8:	88c080e7          	jalr	-1908(ra) # 80007160 <pop_on>
    800068dc:	00093783          	ld	a5,0(s2)
    800068e0:	0004b703          	ld	a4,0(s1)
    800068e4:	02078693          	addi	a3,a5,32
    800068e8:	fce688e3          	beq	a3,a4,800068b8 <uartputc+0x50>
    800068ec:	01f77693          	andi	a3,a4,31
    800068f0:	00005597          	auipc	a1,0x5
    800068f4:	f0058593          	addi	a1,a1,-256 # 8000b7f0 <uart_tx_buf>
    800068f8:	00d586b3          	add	a3,a1,a3
    800068fc:	00170713          	addi	a4,a4,1
    80006900:	01368023          	sb	s3,0(a3)
    80006904:	00e4b023          	sd	a4,0(s1)
    80006908:	10000637          	lui	a2,0x10000
    8000690c:	02f71063          	bne	a4,a5,8000692c <uartputc+0xc4>
    80006910:	0340006f          	j	80006944 <uartputc+0xdc>
    80006914:	00074703          	lbu	a4,0(a4)
    80006918:	00f93023          	sd	a5,0(s2)
    8000691c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006920:	00093783          	ld	a5,0(s2)
    80006924:	0004b703          	ld	a4,0(s1)
    80006928:	00f70e63          	beq	a4,a5,80006944 <uartputc+0xdc>
    8000692c:	00564683          	lbu	a3,5(a2)
    80006930:	01f7f713          	andi	a4,a5,31
    80006934:	00e58733          	add	a4,a1,a4
    80006938:	0206f693          	andi	a3,a3,32
    8000693c:	00178793          	addi	a5,a5,1
    80006940:	fc069ae3          	bnez	a3,80006914 <uartputc+0xac>
    80006944:	02813083          	ld	ra,40(sp)
    80006948:	02013403          	ld	s0,32(sp)
    8000694c:	01813483          	ld	s1,24(sp)
    80006950:	01013903          	ld	s2,16(sp)
    80006954:	00813983          	ld	s3,8(sp)
    80006958:	03010113          	addi	sp,sp,48
    8000695c:	00008067          	ret

0000000080006960 <uartputc_sync>:
    80006960:	ff010113          	addi	sp,sp,-16
    80006964:	00813423          	sd	s0,8(sp)
    80006968:	01010413          	addi	s0,sp,16
    8000696c:	00004717          	auipc	a4,0x4
    80006970:	b4c72703          	lw	a4,-1204(a4) # 8000a4b8 <panicked>
    80006974:	02071663          	bnez	a4,800069a0 <uartputc_sync+0x40>
    80006978:	00050793          	mv	a5,a0
    8000697c:	100006b7          	lui	a3,0x10000
    80006980:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006984:	02077713          	andi	a4,a4,32
    80006988:	fe070ce3          	beqz	a4,80006980 <uartputc_sync+0x20>
    8000698c:	0ff7f793          	andi	a5,a5,255
    80006990:	00f68023          	sb	a5,0(a3)
    80006994:	00813403          	ld	s0,8(sp)
    80006998:	01010113          	addi	sp,sp,16
    8000699c:	00008067          	ret
    800069a0:	0000006f          	j	800069a0 <uartputc_sync+0x40>

00000000800069a4 <uartstart>:
    800069a4:	ff010113          	addi	sp,sp,-16
    800069a8:	00813423          	sd	s0,8(sp)
    800069ac:	01010413          	addi	s0,sp,16
    800069b0:	00004617          	auipc	a2,0x4
    800069b4:	b1060613          	addi	a2,a2,-1264 # 8000a4c0 <uart_tx_r>
    800069b8:	00004517          	auipc	a0,0x4
    800069bc:	b1050513          	addi	a0,a0,-1264 # 8000a4c8 <uart_tx_w>
    800069c0:	00063783          	ld	a5,0(a2)
    800069c4:	00053703          	ld	a4,0(a0)
    800069c8:	04f70263          	beq	a4,a5,80006a0c <uartstart+0x68>
    800069cc:	100005b7          	lui	a1,0x10000
    800069d0:	00005817          	auipc	a6,0x5
    800069d4:	e2080813          	addi	a6,a6,-480 # 8000b7f0 <uart_tx_buf>
    800069d8:	01c0006f          	j	800069f4 <uartstart+0x50>
    800069dc:	0006c703          	lbu	a4,0(a3)
    800069e0:	00f63023          	sd	a5,0(a2)
    800069e4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800069e8:	00063783          	ld	a5,0(a2)
    800069ec:	00053703          	ld	a4,0(a0)
    800069f0:	00f70e63          	beq	a4,a5,80006a0c <uartstart+0x68>
    800069f4:	01f7f713          	andi	a4,a5,31
    800069f8:	00e806b3          	add	a3,a6,a4
    800069fc:	0055c703          	lbu	a4,5(a1)
    80006a00:	00178793          	addi	a5,a5,1
    80006a04:	02077713          	andi	a4,a4,32
    80006a08:	fc071ae3          	bnez	a4,800069dc <uartstart+0x38>
    80006a0c:	00813403          	ld	s0,8(sp)
    80006a10:	01010113          	addi	sp,sp,16
    80006a14:	00008067          	ret

0000000080006a18 <uartgetc>:
    80006a18:	ff010113          	addi	sp,sp,-16
    80006a1c:	00813423          	sd	s0,8(sp)
    80006a20:	01010413          	addi	s0,sp,16
    80006a24:	10000737          	lui	a4,0x10000
    80006a28:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80006a2c:	0017f793          	andi	a5,a5,1
    80006a30:	00078c63          	beqz	a5,80006a48 <uartgetc+0x30>
    80006a34:	00074503          	lbu	a0,0(a4)
    80006a38:	0ff57513          	andi	a0,a0,255
    80006a3c:	00813403          	ld	s0,8(sp)
    80006a40:	01010113          	addi	sp,sp,16
    80006a44:	00008067          	ret
    80006a48:	fff00513          	li	a0,-1
    80006a4c:	ff1ff06f          	j	80006a3c <uartgetc+0x24>

0000000080006a50 <uartintr>:
    80006a50:	100007b7          	lui	a5,0x10000
    80006a54:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006a58:	0017f793          	andi	a5,a5,1
    80006a5c:	0a078463          	beqz	a5,80006b04 <uartintr+0xb4>
    80006a60:	fe010113          	addi	sp,sp,-32
    80006a64:	00813823          	sd	s0,16(sp)
    80006a68:	00913423          	sd	s1,8(sp)
    80006a6c:	00113c23          	sd	ra,24(sp)
    80006a70:	02010413          	addi	s0,sp,32
    80006a74:	100004b7          	lui	s1,0x10000
    80006a78:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80006a7c:	0ff57513          	andi	a0,a0,255
    80006a80:	fffff097          	auipc	ra,0xfffff
    80006a84:	534080e7          	jalr	1332(ra) # 80005fb4 <consoleintr>
    80006a88:	0054c783          	lbu	a5,5(s1)
    80006a8c:	0017f793          	andi	a5,a5,1
    80006a90:	fe0794e3          	bnez	a5,80006a78 <uartintr+0x28>
    80006a94:	00004617          	auipc	a2,0x4
    80006a98:	a2c60613          	addi	a2,a2,-1492 # 8000a4c0 <uart_tx_r>
    80006a9c:	00004517          	auipc	a0,0x4
    80006aa0:	a2c50513          	addi	a0,a0,-1492 # 8000a4c8 <uart_tx_w>
    80006aa4:	00063783          	ld	a5,0(a2)
    80006aa8:	00053703          	ld	a4,0(a0)
    80006aac:	04f70263          	beq	a4,a5,80006af0 <uartintr+0xa0>
    80006ab0:	100005b7          	lui	a1,0x10000
    80006ab4:	00005817          	auipc	a6,0x5
    80006ab8:	d3c80813          	addi	a6,a6,-708 # 8000b7f0 <uart_tx_buf>
    80006abc:	01c0006f          	j	80006ad8 <uartintr+0x88>
    80006ac0:	0006c703          	lbu	a4,0(a3)
    80006ac4:	00f63023          	sd	a5,0(a2)
    80006ac8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006acc:	00063783          	ld	a5,0(a2)
    80006ad0:	00053703          	ld	a4,0(a0)
    80006ad4:	00f70e63          	beq	a4,a5,80006af0 <uartintr+0xa0>
    80006ad8:	01f7f713          	andi	a4,a5,31
    80006adc:	00e806b3          	add	a3,a6,a4
    80006ae0:	0055c703          	lbu	a4,5(a1)
    80006ae4:	00178793          	addi	a5,a5,1
    80006ae8:	02077713          	andi	a4,a4,32
    80006aec:	fc071ae3          	bnez	a4,80006ac0 <uartintr+0x70>
    80006af0:	01813083          	ld	ra,24(sp)
    80006af4:	01013403          	ld	s0,16(sp)
    80006af8:	00813483          	ld	s1,8(sp)
    80006afc:	02010113          	addi	sp,sp,32
    80006b00:	00008067          	ret
    80006b04:	00004617          	auipc	a2,0x4
    80006b08:	9bc60613          	addi	a2,a2,-1604 # 8000a4c0 <uart_tx_r>
    80006b0c:	00004517          	auipc	a0,0x4
    80006b10:	9bc50513          	addi	a0,a0,-1604 # 8000a4c8 <uart_tx_w>
    80006b14:	00063783          	ld	a5,0(a2)
    80006b18:	00053703          	ld	a4,0(a0)
    80006b1c:	04f70263          	beq	a4,a5,80006b60 <uartintr+0x110>
    80006b20:	100005b7          	lui	a1,0x10000
    80006b24:	00005817          	auipc	a6,0x5
    80006b28:	ccc80813          	addi	a6,a6,-820 # 8000b7f0 <uart_tx_buf>
    80006b2c:	01c0006f          	j	80006b48 <uartintr+0xf8>
    80006b30:	0006c703          	lbu	a4,0(a3)
    80006b34:	00f63023          	sd	a5,0(a2)
    80006b38:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006b3c:	00063783          	ld	a5,0(a2)
    80006b40:	00053703          	ld	a4,0(a0)
    80006b44:	02f70063          	beq	a4,a5,80006b64 <uartintr+0x114>
    80006b48:	01f7f713          	andi	a4,a5,31
    80006b4c:	00e806b3          	add	a3,a6,a4
    80006b50:	0055c703          	lbu	a4,5(a1)
    80006b54:	00178793          	addi	a5,a5,1
    80006b58:	02077713          	andi	a4,a4,32
    80006b5c:	fc071ae3          	bnez	a4,80006b30 <uartintr+0xe0>
    80006b60:	00008067          	ret
    80006b64:	00008067          	ret

0000000080006b68 <kinit>:
    80006b68:	fc010113          	addi	sp,sp,-64
    80006b6c:	02913423          	sd	s1,40(sp)
    80006b70:	fffff7b7          	lui	a5,0xfffff
    80006b74:	00006497          	auipc	s1,0x6
    80006b78:	c9b48493          	addi	s1,s1,-869 # 8000c80f <end+0xfff>
    80006b7c:	02813823          	sd	s0,48(sp)
    80006b80:	01313c23          	sd	s3,24(sp)
    80006b84:	00f4f4b3          	and	s1,s1,a5
    80006b88:	02113c23          	sd	ra,56(sp)
    80006b8c:	03213023          	sd	s2,32(sp)
    80006b90:	01413823          	sd	s4,16(sp)
    80006b94:	01513423          	sd	s5,8(sp)
    80006b98:	04010413          	addi	s0,sp,64
    80006b9c:	000017b7          	lui	a5,0x1
    80006ba0:	01100993          	li	s3,17
    80006ba4:	00f487b3          	add	a5,s1,a5
    80006ba8:	01b99993          	slli	s3,s3,0x1b
    80006bac:	06f9e063          	bltu	s3,a5,80006c0c <kinit+0xa4>
    80006bb0:	00005a97          	auipc	s5,0x5
    80006bb4:	c60a8a93          	addi	s5,s5,-928 # 8000b810 <end>
    80006bb8:	0754ec63          	bltu	s1,s5,80006c30 <kinit+0xc8>
    80006bbc:	0734fa63          	bgeu	s1,s3,80006c30 <kinit+0xc8>
    80006bc0:	00088a37          	lui	s4,0x88
    80006bc4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006bc8:	00004917          	auipc	s2,0x4
    80006bcc:	90890913          	addi	s2,s2,-1784 # 8000a4d0 <kmem>
    80006bd0:	00ca1a13          	slli	s4,s4,0xc
    80006bd4:	0140006f          	j	80006be8 <kinit+0x80>
    80006bd8:	000017b7          	lui	a5,0x1
    80006bdc:	00f484b3          	add	s1,s1,a5
    80006be0:	0554e863          	bltu	s1,s5,80006c30 <kinit+0xc8>
    80006be4:	0534f663          	bgeu	s1,s3,80006c30 <kinit+0xc8>
    80006be8:	00001637          	lui	a2,0x1
    80006bec:	00100593          	li	a1,1
    80006bf0:	00048513          	mv	a0,s1
    80006bf4:	00000097          	auipc	ra,0x0
    80006bf8:	5e4080e7          	jalr	1508(ra) # 800071d8 <__memset>
    80006bfc:	00093783          	ld	a5,0(s2)
    80006c00:	00f4b023          	sd	a5,0(s1)
    80006c04:	00993023          	sd	s1,0(s2)
    80006c08:	fd4498e3          	bne	s1,s4,80006bd8 <kinit+0x70>
    80006c0c:	03813083          	ld	ra,56(sp)
    80006c10:	03013403          	ld	s0,48(sp)
    80006c14:	02813483          	ld	s1,40(sp)
    80006c18:	02013903          	ld	s2,32(sp)
    80006c1c:	01813983          	ld	s3,24(sp)
    80006c20:	01013a03          	ld	s4,16(sp)
    80006c24:	00813a83          	ld	s5,8(sp)
    80006c28:	04010113          	addi	sp,sp,64
    80006c2c:	00008067          	ret
    80006c30:	00001517          	auipc	a0,0x1
    80006c34:	73850513          	addi	a0,a0,1848 # 80008368 <digits+0x18>
    80006c38:	fffff097          	auipc	ra,0xfffff
    80006c3c:	4b4080e7          	jalr	1204(ra) # 800060ec <panic>

0000000080006c40 <freerange>:
    80006c40:	fc010113          	addi	sp,sp,-64
    80006c44:	000017b7          	lui	a5,0x1
    80006c48:	02913423          	sd	s1,40(sp)
    80006c4c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006c50:	009504b3          	add	s1,a0,s1
    80006c54:	fffff537          	lui	a0,0xfffff
    80006c58:	02813823          	sd	s0,48(sp)
    80006c5c:	02113c23          	sd	ra,56(sp)
    80006c60:	03213023          	sd	s2,32(sp)
    80006c64:	01313c23          	sd	s3,24(sp)
    80006c68:	01413823          	sd	s4,16(sp)
    80006c6c:	01513423          	sd	s5,8(sp)
    80006c70:	01613023          	sd	s6,0(sp)
    80006c74:	04010413          	addi	s0,sp,64
    80006c78:	00a4f4b3          	and	s1,s1,a0
    80006c7c:	00f487b3          	add	a5,s1,a5
    80006c80:	06f5e463          	bltu	a1,a5,80006ce8 <freerange+0xa8>
    80006c84:	00005a97          	auipc	s5,0x5
    80006c88:	b8ca8a93          	addi	s5,s5,-1140 # 8000b810 <end>
    80006c8c:	0954e263          	bltu	s1,s5,80006d10 <freerange+0xd0>
    80006c90:	01100993          	li	s3,17
    80006c94:	01b99993          	slli	s3,s3,0x1b
    80006c98:	0734fc63          	bgeu	s1,s3,80006d10 <freerange+0xd0>
    80006c9c:	00058a13          	mv	s4,a1
    80006ca0:	00004917          	auipc	s2,0x4
    80006ca4:	83090913          	addi	s2,s2,-2000 # 8000a4d0 <kmem>
    80006ca8:	00002b37          	lui	s6,0x2
    80006cac:	0140006f          	j	80006cc0 <freerange+0x80>
    80006cb0:	000017b7          	lui	a5,0x1
    80006cb4:	00f484b3          	add	s1,s1,a5
    80006cb8:	0554ec63          	bltu	s1,s5,80006d10 <freerange+0xd0>
    80006cbc:	0534fa63          	bgeu	s1,s3,80006d10 <freerange+0xd0>
    80006cc0:	00001637          	lui	a2,0x1
    80006cc4:	00100593          	li	a1,1
    80006cc8:	00048513          	mv	a0,s1
    80006ccc:	00000097          	auipc	ra,0x0
    80006cd0:	50c080e7          	jalr	1292(ra) # 800071d8 <__memset>
    80006cd4:	00093703          	ld	a4,0(s2)
    80006cd8:	016487b3          	add	a5,s1,s6
    80006cdc:	00e4b023          	sd	a4,0(s1)
    80006ce0:	00993023          	sd	s1,0(s2)
    80006ce4:	fcfa76e3          	bgeu	s4,a5,80006cb0 <freerange+0x70>
    80006ce8:	03813083          	ld	ra,56(sp)
    80006cec:	03013403          	ld	s0,48(sp)
    80006cf0:	02813483          	ld	s1,40(sp)
    80006cf4:	02013903          	ld	s2,32(sp)
    80006cf8:	01813983          	ld	s3,24(sp)
    80006cfc:	01013a03          	ld	s4,16(sp)
    80006d00:	00813a83          	ld	s5,8(sp)
    80006d04:	00013b03          	ld	s6,0(sp)
    80006d08:	04010113          	addi	sp,sp,64
    80006d0c:	00008067          	ret
    80006d10:	00001517          	auipc	a0,0x1
    80006d14:	65850513          	addi	a0,a0,1624 # 80008368 <digits+0x18>
    80006d18:	fffff097          	auipc	ra,0xfffff
    80006d1c:	3d4080e7          	jalr	980(ra) # 800060ec <panic>

0000000080006d20 <kfree>:
    80006d20:	fe010113          	addi	sp,sp,-32
    80006d24:	00813823          	sd	s0,16(sp)
    80006d28:	00113c23          	sd	ra,24(sp)
    80006d2c:	00913423          	sd	s1,8(sp)
    80006d30:	02010413          	addi	s0,sp,32
    80006d34:	03451793          	slli	a5,a0,0x34
    80006d38:	04079c63          	bnez	a5,80006d90 <kfree+0x70>
    80006d3c:	00005797          	auipc	a5,0x5
    80006d40:	ad478793          	addi	a5,a5,-1324 # 8000b810 <end>
    80006d44:	00050493          	mv	s1,a0
    80006d48:	04f56463          	bltu	a0,a5,80006d90 <kfree+0x70>
    80006d4c:	01100793          	li	a5,17
    80006d50:	01b79793          	slli	a5,a5,0x1b
    80006d54:	02f57e63          	bgeu	a0,a5,80006d90 <kfree+0x70>
    80006d58:	00001637          	lui	a2,0x1
    80006d5c:	00100593          	li	a1,1
    80006d60:	00000097          	auipc	ra,0x0
    80006d64:	478080e7          	jalr	1144(ra) # 800071d8 <__memset>
    80006d68:	00003797          	auipc	a5,0x3
    80006d6c:	76878793          	addi	a5,a5,1896 # 8000a4d0 <kmem>
    80006d70:	0007b703          	ld	a4,0(a5)
    80006d74:	01813083          	ld	ra,24(sp)
    80006d78:	01013403          	ld	s0,16(sp)
    80006d7c:	00e4b023          	sd	a4,0(s1)
    80006d80:	0097b023          	sd	s1,0(a5)
    80006d84:	00813483          	ld	s1,8(sp)
    80006d88:	02010113          	addi	sp,sp,32
    80006d8c:	00008067          	ret
    80006d90:	00001517          	auipc	a0,0x1
    80006d94:	5d850513          	addi	a0,a0,1496 # 80008368 <digits+0x18>
    80006d98:	fffff097          	auipc	ra,0xfffff
    80006d9c:	354080e7          	jalr	852(ra) # 800060ec <panic>

0000000080006da0 <kalloc>:
    80006da0:	fe010113          	addi	sp,sp,-32
    80006da4:	00813823          	sd	s0,16(sp)
    80006da8:	00913423          	sd	s1,8(sp)
    80006dac:	00113c23          	sd	ra,24(sp)
    80006db0:	02010413          	addi	s0,sp,32
    80006db4:	00003797          	auipc	a5,0x3
    80006db8:	71c78793          	addi	a5,a5,1820 # 8000a4d0 <kmem>
    80006dbc:	0007b483          	ld	s1,0(a5)
    80006dc0:	02048063          	beqz	s1,80006de0 <kalloc+0x40>
    80006dc4:	0004b703          	ld	a4,0(s1)
    80006dc8:	00001637          	lui	a2,0x1
    80006dcc:	00500593          	li	a1,5
    80006dd0:	00048513          	mv	a0,s1
    80006dd4:	00e7b023          	sd	a4,0(a5)
    80006dd8:	00000097          	auipc	ra,0x0
    80006ddc:	400080e7          	jalr	1024(ra) # 800071d8 <__memset>
    80006de0:	01813083          	ld	ra,24(sp)
    80006de4:	01013403          	ld	s0,16(sp)
    80006de8:	00048513          	mv	a0,s1
    80006dec:	00813483          	ld	s1,8(sp)
    80006df0:	02010113          	addi	sp,sp,32
    80006df4:	00008067          	ret

0000000080006df8 <initlock>:
    80006df8:	ff010113          	addi	sp,sp,-16
    80006dfc:	00813423          	sd	s0,8(sp)
    80006e00:	01010413          	addi	s0,sp,16
    80006e04:	00813403          	ld	s0,8(sp)
    80006e08:	00b53423          	sd	a1,8(a0)
    80006e0c:	00052023          	sw	zero,0(a0)
    80006e10:	00053823          	sd	zero,16(a0)
    80006e14:	01010113          	addi	sp,sp,16
    80006e18:	00008067          	ret

0000000080006e1c <acquire>:
    80006e1c:	fe010113          	addi	sp,sp,-32
    80006e20:	00813823          	sd	s0,16(sp)
    80006e24:	00913423          	sd	s1,8(sp)
    80006e28:	00113c23          	sd	ra,24(sp)
    80006e2c:	01213023          	sd	s2,0(sp)
    80006e30:	02010413          	addi	s0,sp,32
    80006e34:	00050493          	mv	s1,a0
    80006e38:	10002973          	csrr	s2,sstatus
    80006e3c:	100027f3          	csrr	a5,sstatus
    80006e40:	ffd7f793          	andi	a5,a5,-3
    80006e44:	10079073          	csrw	sstatus,a5
    80006e48:	fffff097          	auipc	ra,0xfffff
    80006e4c:	8ec080e7          	jalr	-1812(ra) # 80005734 <mycpu>
    80006e50:	07852783          	lw	a5,120(a0)
    80006e54:	06078e63          	beqz	a5,80006ed0 <acquire+0xb4>
    80006e58:	fffff097          	auipc	ra,0xfffff
    80006e5c:	8dc080e7          	jalr	-1828(ra) # 80005734 <mycpu>
    80006e60:	07852783          	lw	a5,120(a0)
    80006e64:	0004a703          	lw	a4,0(s1)
    80006e68:	0017879b          	addiw	a5,a5,1
    80006e6c:	06f52c23          	sw	a5,120(a0)
    80006e70:	04071063          	bnez	a4,80006eb0 <acquire+0x94>
    80006e74:	00100713          	li	a4,1
    80006e78:	00070793          	mv	a5,a4
    80006e7c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006e80:	0007879b          	sext.w	a5,a5
    80006e84:	fe079ae3          	bnez	a5,80006e78 <acquire+0x5c>
    80006e88:	0ff0000f          	fence
    80006e8c:	fffff097          	auipc	ra,0xfffff
    80006e90:	8a8080e7          	jalr	-1880(ra) # 80005734 <mycpu>
    80006e94:	01813083          	ld	ra,24(sp)
    80006e98:	01013403          	ld	s0,16(sp)
    80006e9c:	00a4b823          	sd	a0,16(s1)
    80006ea0:	00013903          	ld	s2,0(sp)
    80006ea4:	00813483          	ld	s1,8(sp)
    80006ea8:	02010113          	addi	sp,sp,32
    80006eac:	00008067          	ret
    80006eb0:	0104b903          	ld	s2,16(s1)
    80006eb4:	fffff097          	auipc	ra,0xfffff
    80006eb8:	880080e7          	jalr	-1920(ra) # 80005734 <mycpu>
    80006ebc:	faa91ce3          	bne	s2,a0,80006e74 <acquire+0x58>
    80006ec0:	00001517          	auipc	a0,0x1
    80006ec4:	4b050513          	addi	a0,a0,1200 # 80008370 <digits+0x20>
    80006ec8:	fffff097          	auipc	ra,0xfffff
    80006ecc:	224080e7          	jalr	548(ra) # 800060ec <panic>
    80006ed0:	00195913          	srli	s2,s2,0x1
    80006ed4:	fffff097          	auipc	ra,0xfffff
    80006ed8:	860080e7          	jalr	-1952(ra) # 80005734 <mycpu>
    80006edc:	00197913          	andi	s2,s2,1
    80006ee0:	07252e23          	sw	s2,124(a0)
    80006ee4:	f75ff06f          	j	80006e58 <acquire+0x3c>

0000000080006ee8 <release>:
    80006ee8:	fe010113          	addi	sp,sp,-32
    80006eec:	00813823          	sd	s0,16(sp)
    80006ef0:	00113c23          	sd	ra,24(sp)
    80006ef4:	00913423          	sd	s1,8(sp)
    80006ef8:	01213023          	sd	s2,0(sp)
    80006efc:	02010413          	addi	s0,sp,32
    80006f00:	00052783          	lw	a5,0(a0)
    80006f04:	00079a63          	bnez	a5,80006f18 <release+0x30>
    80006f08:	00001517          	auipc	a0,0x1
    80006f0c:	47050513          	addi	a0,a0,1136 # 80008378 <digits+0x28>
    80006f10:	fffff097          	auipc	ra,0xfffff
    80006f14:	1dc080e7          	jalr	476(ra) # 800060ec <panic>
    80006f18:	01053903          	ld	s2,16(a0)
    80006f1c:	00050493          	mv	s1,a0
    80006f20:	fffff097          	auipc	ra,0xfffff
    80006f24:	814080e7          	jalr	-2028(ra) # 80005734 <mycpu>
    80006f28:	fea910e3          	bne	s2,a0,80006f08 <release+0x20>
    80006f2c:	0004b823          	sd	zero,16(s1)
    80006f30:	0ff0000f          	fence
    80006f34:	0f50000f          	fence	iorw,ow
    80006f38:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006f3c:	ffffe097          	auipc	ra,0xffffe
    80006f40:	7f8080e7          	jalr	2040(ra) # 80005734 <mycpu>
    80006f44:	100027f3          	csrr	a5,sstatus
    80006f48:	0027f793          	andi	a5,a5,2
    80006f4c:	04079a63          	bnez	a5,80006fa0 <release+0xb8>
    80006f50:	07852783          	lw	a5,120(a0)
    80006f54:	02f05e63          	blez	a5,80006f90 <release+0xa8>
    80006f58:	fff7871b          	addiw	a4,a5,-1
    80006f5c:	06e52c23          	sw	a4,120(a0)
    80006f60:	00071c63          	bnez	a4,80006f78 <release+0x90>
    80006f64:	07c52783          	lw	a5,124(a0)
    80006f68:	00078863          	beqz	a5,80006f78 <release+0x90>
    80006f6c:	100027f3          	csrr	a5,sstatus
    80006f70:	0027e793          	ori	a5,a5,2
    80006f74:	10079073          	csrw	sstatus,a5
    80006f78:	01813083          	ld	ra,24(sp)
    80006f7c:	01013403          	ld	s0,16(sp)
    80006f80:	00813483          	ld	s1,8(sp)
    80006f84:	00013903          	ld	s2,0(sp)
    80006f88:	02010113          	addi	sp,sp,32
    80006f8c:	00008067          	ret
    80006f90:	00001517          	auipc	a0,0x1
    80006f94:	40850513          	addi	a0,a0,1032 # 80008398 <digits+0x48>
    80006f98:	fffff097          	auipc	ra,0xfffff
    80006f9c:	154080e7          	jalr	340(ra) # 800060ec <panic>
    80006fa0:	00001517          	auipc	a0,0x1
    80006fa4:	3e050513          	addi	a0,a0,992 # 80008380 <digits+0x30>
    80006fa8:	fffff097          	auipc	ra,0xfffff
    80006fac:	144080e7          	jalr	324(ra) # 800060ec <panic>

0000000080006fb0 <holding>:
    80006fb0:	00052783          	lw	a5,0(a0)
    80006fb4:	00079663          	bnez	a5,80006fc0 <holding+0x10>
    80006fb8:	00000513          	li	a0,0
    80006fbc:	00008067          	ret
    80006fc0:	fe010113          	addi	sp,sp,-32
    80006fc4:	00813823          	sd	s0,16(sp)
    80006fc8:	00913423          	sd	s1,8(sp)
    80006fcc:	00113c23          	sd	ra,24(sp)
    80006fd0:	02010413          	addi	s0,sp,32
    80006fd4:	01053483          	ld	s1,16(a0)
    80006fd8:	ffffe097          	auipc	ra,0xffffe
    80006fdc:	75c080e7          	jalr	1884(ra) # 80005734 <mycpu>
    80006fe0:	01813083          	ld	ra,24(sp)
    80006fe4:	01013403          	ld	s0,16(sp)
    80006fe8:	40a48533          	sub	a0,s1,a0
    80006fec:	00153513          	seqz	a0,a0
    80006ff0:	00813483          	ld	s1,8(sp)
    80006ff4:	02010113          	addi	sp,sp,32
    80006ff8:	00008067          	ret

0000000080006ffc <push_off>:
    80006ffc:	fe010113          	addi	sp,sp,-32
    80007000:	00813823          	sd	s0,16(sp)
    80007004:	00113c23          	sd	ra,24(sp)
    80007008:	00913423          	sd	s1,8(sp)
    8000700c:	02010413          	addi	s0,sp,32
    80007010:	100024f3          	csrr	s1,sstatus
    80007014:	100027f3          	csrr	a5,sstatus
    80007018:	ffd7f793          	andi	a5,a5,-3
    8000701c:	10079073          	csrw	sstatus,a5
    80007020:	ffffe097          	auipc	ra,0xffffe
    80007024:	714080e7          	jalr	1812(ra) # 80005734 <mycpu>
    80007028:	07852783          	lw	a5,120(a0)
    8000702c:	02078663          	beqz	a5,80007058 <push_off+0x5c>
    80007030:	ffffe097          	auipc	ra,0xffffe
    80007034:	704080e7          	jalr	1796(ra) # 80005734 <mycpu>
    80007038:	07852783          	lw	a5,120(a0)
    8000703c:	01813083          	ld	ra,24(sp)
    80007040:	01013403          	ld	s0,16(sp)
    80007044:	0017879b          	addiw	a5,a5,1
    80007048:	06f52c23          	sw	a5,120(a0)
    8000704c:	00813483          	ld	s1,8(sp)
    80007050:	02010113          	addi	sp,sp,32
    80007054:	00008067          	ret
    80007058:	0014d493          	srli	s1,s1,0x1
    8000705c:	ffffe097          	auipc	ra,0xffffe
    80007060:	6d8080e7          	jalr	1752(ra) # 80005734 <mycpu>
    80007064:	0014f493          	andi	s1,s1,1
    80007068:	06952e23          	sw	s1,124(a0)
    8000706c:	fc5ff06f          	j	80007030 <push_off+0x34>

0000000080007070 <pop_off>:
    80007070:	ff010113          	addi	sp,sp,-16
    80007074:	00813023          	sd	s0,0(sp)
    80007078:	00113423          	sd	ra,8(sp)
    8000707c:	01010413          	addi	s0,sp,16
    80007080:	ffffe097          	auipc	ra,0xffffe
    80007084:	6b4080e7          	jalr	1716(ra) # 80005734 <mycpu>
    80007088:	100027f3          	csrr	a5,sstatus
    8000708c:	0027f793          	andi	a5,a5,2
    80007090:	04079663          	bnez	a5,800070dc <pop_off+0x6c>
    80007094:	07852783          	lw	a5,120(a0)
    80007098:	02f05a63          	blez	a5,800070cc <pop_off+0x5c>
    8000709c:	fff7871b          	addiw	a4,a5,-1
    800070a0:	06e52c23          	sw	a4,120(a0)
    800070a4:	00071c63          	bnez	a4,800070bc <pop_off+0x4c>
    800070a8:	07c52783          	lw	a5,124(a0)
    800070ac:	00078863          	beqz	a5,800070bc <pop_off+0x4c>
    800070b0:	100027f3          	csrr	a5,sstatus
    800070b4:	0027e793          	ori	a5,a5,2
    800070b8:	10079073          	csrw	sstatus,a5
    800070bc:	00813083          	ld	ra,8(sp)
    800070c0:	00013403          	ld	s0,0(sp)
    800070c4:	01010113          	addi	sp,sp,16
    800070c8:	00008067          	ret
    800070cc:	00001517          	auipc	a0,0x1
    800070d0:	2cc50513          	addi	a0,a0,716 # 80008398 <digits+0x48>
    800070d4:	fffff097          	auipc	ra,0xfffff
    800070d8:	018080e7          	jalr	24(ra) # 800060ec <panic>
    800070dc:	00001517          	auipc	a0,0x1
    800070e0:	2a450513          	addi	a0,a0,676 # 80008380 <digits+0x30>
    800070e4:	fffff097          	auipc	ra,0xfffff
    800070e8:	008080e7          	jalr	8(ra) # 800060ec <panic>

00000000800070ec <push_on>:
    800070ec:	fe010113          	addi	sp,sp,-32
    800070f0:	00813823          	sd	s0,16(sp)
    800070f4:	00113c23          	sd	ra,24(sp)
    800070f8:	00913423          	sd	s1,8(sp)
    800070fc:	02010413          	addi	s0,sp,32
    80007100:	100024f3          	csrr	s1,sstatus
    80007104:	100027f3          	csrr	a5,sstatus
    80007108:	0027e793          	ori	a5,a5,2
    8000710c:	10079073          	csrw	sstatus,a5
    80007110:	ffffe097          	auipc	ra,0xffffe
    80007114:	624080e7          	jalr	1572(ra) # 80005734 <mycpu>
    80007118:	07852783          	lw	a5,120(a0)
    8000711c:	02078663          	beqz	a5,80007148 <push_on+0x5c>
    80007120:	ffffe097          	auipc	ra,0xffffe
    80007124:	614080e7          	jalr	1556(ra) # 80005734 <mycpu>
    80007128:	07852783          	lw	a5,120(a0)
    8000712c:	01813083          	ld	ra,24(sp)
    80007130:	01013403          	ld	s0,16(sp)
    80007134:	0017879b          	addiw	a5,a5,1
    80007138:	06f52c23          	sw	a5,120(a0)
    8000713c:	00813483          	ld	s1,8(sp)
    80007140:	02010113          	addi	sp,sp,32
    80007144:	00008067          	ret
    80007148:	0014d493          	srli	s1,s1,0x1
    8000714c:	ffffe097          	auipc	ra,0xffffe
    80007150:	5e8080e7          	jalr	1512(ra) # 80005734 <mycpu>
    80007154:	0014f493          	andi	s1,s1,1
    80007158:	06952e23          	sw	s1,124(a0)
    8000715c:	fc5ff06f          	j	80007120 <push_on+0x34>

0000000080007160 <pop_on>:
    80007160:	ff010113          	addi	sp,sp,-16
    80007164:	00813023          	sd	s0,0(sp)
    80007168:	00113423          	sd	ra,8(sp)
    8000716c:	01010413          	addi	s0,sp,16
    80007170:	ffffe097          	auipc	ra,0xffffe
    80007174:	5c4080e7          	jalr	1476(ra) # 80005734 <mycpu>
    80007178:	100027f3          	csrr	a5,sstatus
    8000717c:	0027f793          	andi	a5,a5,2
    80007180:	04078463          	beqz	a5,800071c8 <pop_on+0x68>
    80007184:	07852783          	lw	a5,120(a0)
    80007188:	02f05863          	blez	a5,800071b8 <pop_on+0x58>
    8000718c:	fff7879b          	addiw	a5,a5,-1
    80007190:	06f52c23          	sw	a5,120(a0)
    80007194:	07853783          	ld	a5,120(a0)
    80007198:	00079863          	bnez	a5,800071a8 <pop_on+0x48>
    8000719c:	100027f3          	csrr	a5,sstatus
    800071a0:	ffd7f793          	andi	a5,a5,-3
    800071a4:	10079073          	csrw	sstatus,a5
    800071a8:	00813083          	ld	ra,8(sp)
    800071ac:	00013403          	ld	s0,0(sp)
    800071b0:	01010113          	addi	sp,sp,16
    800071b4:	00008067          	ret
    800071b8:	00001517          	auipc	a0,0x1
    800071bc:	20850513          	addi	a0,a0,520 # 800083c0 <digits+0x70>
    800071c0:	fffff097          	auipc	ra,0xfffff
    800071c4:	f2c080e7          	jalr	-212(ra) # 800060ec <panic>
    800071c8:	00001517          	auipc	a0,0x1
    800071cc:	1d850513          	addi	a0,a0,472 # 800083a0 <digits+0x50>
    800071d0:	fffff097          	auipc	ra,0xfffff
    800071d4:	f1c080e7          	jalr	-228(ra) # 800060ec <panic>

00000000800071d8 <__memset>:
    800071d8:	ff010113          	addi	sp,sp,-16
    800071dc:	00813423          	sd	s0,8(sp)
    800071e0:	01010413          	addi	s0,sp,16
    800071e4:	1a060e63          	beqz	a2,800073a0 <__memset+0x1c8>
    800071e8:	40a007b3          	neg	a5,a0
    800071ec:	0077f793          	andi	a5,a5,7
    800071f0:	00778693          	addi	a3,a5,7
    800071f4:	00b00813          	li	a6,11
    800071f8:	0ff5f593          	andi	a1,a1,255
    800071fc:	fff6071b          	addiw	a4,a2,-1
    80007200:	1b06e663          	bltu	a3,a6,800073ac <__memset+0x1d4>
    80007204:	1cd76463          	bltu	a4,a3,800073cc <__memset+0x1f4>
    80007208:	1a078e63          	beqz	a5,800073c4 <__memset+0x1ec>
    8000720c:	00b50023          	sb	a1,0(a0)
    80007210:	00100713          	li	a4,1
    80007214:	1ae78463          	beq	a5,a4,800073bc <__memset+0x1e4>
    80007218:	00b500a3          	sb	a1,1(a0)
    8000721c:	00200713          	li	a4,2
    80007220:	1ae78a63          	beq	a5,a4,800073d4 <__memset+0x1fc>
    80007224:	00b50123          	sb	a1,2(a0)
    80007228:	00300713          	li	a4,3
    8000722c:	18e78463          	beq	a5,a4,800073b4 <__memset+0x1dc>
    80007230:	00b501a3          	sb	a1,3(a0)
    80007234:	00400713          	li	a4,4
    80007238:	1ae78263          	beq	a5,a4,800073dc <__memset+0x204>
    8000723c:	00b50223          	sb	a1,4(a0)
    80007240:	00500713          	li	a4,5
    80007244:	1ae78063          	beq	a5,a4,800073e4 <__memset+0x20c>
    80007248:	00b502a3          	sb	a1,5(a0)
    8000724c:	00700713          	li	a4,7
    80007250:	18e79e63          	bne	a5,a4,800073ec <__memset+0x214>
    80007254:	00b50323          	sb	a1,6(a0)
    80007258:	00700e93          	li	t4,7
    8000725c:	00859713          	slli	a4,a1,0x8
    80007260:	00e5e733          	or	a4,a1,a4
    80007264:	01059e13          	slli	t3,a1,0x10
    80007268:	01c76e33          	or	t3,a4,t3
    8000726c:	01859313          	slli	t1,a1,0x18
    80007270:	006e6333          	or	t1,t3,t1
    80007274:	02059893          	slli	a7,a1,0x20
    80007278:	40f60e3b          	subw	t3,a2,a5
    8000727c:	011368b3          	or	a7,t1,a7
    80007280:	02859813          	slli	a6,a1,0x28
    80007284:	0108e833          	or	a6,a7,a6
    80007288:	03059693          	slli	a3,a1,0x30
    8000728c:	003e589b          	srliw	a7,t3,0x3
    80007290:	00d866b3          	or	a3,a6,a3
    80007294:	03859713          	slli	a4,a1,0x38
    80007298:	00389813          	slli	a6,a7,0x3
    8000729c:	00f507b3          	add	a5,a0,a5
    800072a0:	00e6e733          	or	a4,a3,a4
    800072a4:	000e089b          	sext.w	a7,t3
    800072a8:	00f806b3          	add	a3,a6,a5
    800072ac:	00e7b023          	sd	a4,0(a5)
    800072b0:	00878793          	addi	a5,a5,8
    800072b4:	fed79ce3          	bne	a5,a3,800072ac <__memset+0xd4>
    800072b8:	ff8e7793          	andi	a5,t3,-8
    800072bc:	0007871b          	sext.w	a4,a5
    800072c0:	01d787bb          	addw	a5,a5,t4
    800072c4:	0ce88e63          	beq	a7,a4,800073a0 <__memset+0x1c8>
    800072c8:	00f50733          	add	a4,a0,a5
    800072cc:	00b70023          	sb	a1,0(a4)
    800072d0:	0017871b          	addiw	a4,a5,1
    800072d4:	0cc77663          	bgeu	a4,a2,800073a0 <__memset+0x1c8>
    800072d8:	00e50733          	add	a4,a0,a4
    800072dc:	00b70023          	sb	a1,0(a4)
    800072e0:	0027871b          	addiw	a4,a5,2
    800072e4:	0ac77e63          	bgeu	a4,a2,800073a0 <__memset+0x1c8>
    800072e8:	00e50733          	add	a4,a0,a4
    800072ec:	00b70023          	sb	a1,0(a4)
    800072f0:	0037871b          	addiw	a4,a5,3
    800072f4:	0ac77663          	bgeu	a4,a2,800073a0 <__memset+0x1c8>
    800072f8:	00e50733          	add	a4,a0,a4
    800072fc:	00b70023          	sb	a1,0(a4)
    80007300:	0047871b          	addiw	a4,a5,4
    80007304:	08c77e63          	bgeu	a4,a2,800073a0 <__memset+0x1c8>
    80007308:	00e50733          	add	a4,a0,a4
    8000730c:	00b70023          	sb	a1,0(a4)
    80007310:	0057871b          	addiw	a4,a5,5
    80007314:	08c77663          	bgeu	a4,a2,800073a0 <__memset+0x1c8>
    80007318:	00e50733          	add	a4,a0,a4
    8000731c:	00b70023          	sb	a1,0(a4)
    80007320:	0067871b          	addiw	a4,a5,6
    80007324:	06c77e63          	bgeu	a4,a2,800073a0 <__memset+0x1c8>
    80007328:	00e50733          	add	a4,a0,a4
    8000732c:	00b70023          	sb	a1,0(a4)
    80007330:	0077871b          	addiw	a4,a5,7
    80007334:	06c77663          	bgeu	a4,a2,800073a0 <__memset+0x1c8>
    80007338:	00e50733          	add	a4,a0,a4
    8000733c:	00b70023          	sb	a1,0(a4)
    80007340:	0087871b          	addiw	a4,a5,8
    80007344:	04c77e63          	bgeu	a4,a2,800073a0 <__memset+0x1c8>
    80007348:	00e50733          	add	a4,a0,a4
    8000734c:	00b70023          	sb	a1,0(a4)
    80007350:	0097871b          	addiw	a4,a5,9
    80007354:	04c77663          	bgeu	a4,a2,800073a0 <__memset+0x1c8>
    80007358:	00e50733          	add	a4,a0,a4
    8000735c:	00b70023          	sb	a1,0(a4)
    80007360:	00a7871b          	addiw	a4,a5,10
    80007364:	02c77e63          	bgeu	a4,a2,800073a0 <__memset+0x1c8>
    80007368:	00e50733          	add	a4,a0,a4
    8000736c:	00b70023          	sb	a1,0(a4)
    80007370:	00b7871b          	addiw	a4,a5,11
    80007374:	02c77663          	bgeu	a4,a2,800073a0 <__memset+0x1c8>
    80007378:	00e50733          	add	a4,a0,a4
    8000737c:	00b70023          	sb	a1,0(a4)
    80007380:	00c7871b          	addiw	a4,a5,12
    80007384:	00c77e63          	bgeu	a4,a2,800073a0 <__memset+0x1c8>
    80007388:	00e50733          	add	a4,a0,a4
    8000738c:	00b70023          	sb	a1,0(a4)
    80007390:	00d7879b          	addiw	a5,a5,13
    80007394:	00c7f663          	bgeu	a5,a2,800073a0 <__memset+0x1c8>
    80007398:	00f507b3          	add	a5,a0,a5
    8000739c:	00b78023          	sb	a1,0(a5)
    800073a0:	00813403          	ld	s0,8(sp)
    800073a4:	01010113          	addi	sp,sp,16
    800073a8:	00008067          	ret
    800073ac:	00b00693          	li	a3,11
    800073b0:	e55ff06f          	j	80007204 <__memset+0x2c>
    800073b4:	00300e93          	li	t4,3
    800073b8:	ea5ff06f          	j	8000725c <__memset+0x84>
    800073bc:	00100e93          	li	t4,1
    800073c0:	e9dff06f          	j	8000725c <__memset+0x84>
    800073c4:	00000e93          	li	t4,0
    800073c8:	e95ff06f          	j	8000725c <__memset+0x84>
    800073cc:	00000793          	li	a5,0
    800073d0:	ef9ff06f          	j	800072c8 <__memset+0xf0>
    800073d4:	00200e93          	li	t4,2
    800073d8:	e85ff06f          	j	8000725c <__memset+0x84>
    800073dc:	00400e93          	li	t4,4
    800073e0:	e7dff06f          	j	8000725c <__memset+0x84>
    800073e4:	00500e93          	li	t4,5
    800073e8:	e75ff06f          	j	8000725c <__memset+0x84>
    800073ec:	00600e93          	li	t4,6
    800073f0:	e6dff06f          	j	8000725c <__memset+0x84>

00000000800073f4 <__memmove>:
    800073f4:	ff010113          	addi	sp,sp,-16
    800073f8:	00813423          	sd	s0,8(sp)
    800073fc:	01010413          	addi	s0,sp,16
    80007400:	0e060863          	beqz	a2,800074f0 <__memmove+0xfc>
    80007404:	fff6069b          	addiw	a3,a2,-1
    80007408:	0006881b          	sext.w	a6,a3
    8000740c:	0ea5e863          	bltu	a1,a0,800074fc <__memmove+0x108>
    80007410:	00758713          	addi	a4,a1,7
    80007414:	00a5e7b3          	or	a5,a1,a0
    80007418:	40a70733          	sub	a4,a4,a0
    8000741c:	0077f793          	andi	a5,a5,7
    80007420:	00f73713          	sltiu	a4,a4,15
    80007424:	00174713          	xori	a4,a4,1
    80007428:	0017b793          	seqz	a5,a5
    8000742c:	00e7f7b3          	and	a5,a5,a4
    80007430:	10078863          	beqz	a5,80007540 <__memmove+0x14c>
    80007434:	00900793          	li	a5,9
    80007438:	1107f463          	bgeu	a5,a6,80007540 <__memmove+0x14c>
    8000743c:	0036581b          	srliw	a6,a2,0x3
    80007440:	fff8081b          	addiw	a6,a6,-1
    80007444:	02081813          	slli	a6,a6,0x20
    80007448:	01d85893          	srli	a7,a6,0x1d
    8000744c:	00858813          	addi	a6,a1,8
    80007450:	00058793          	mv	a5,a1
    80007454:	00050713          	mv	a4,a0
    80007458:	01088833          	add	a6,a7,a6
    8000745c:	0007b883          	ld	a7,0(a5)
    80007460:	00878793          	addi	a5,a5,8
    80007464:	00870713          	addi	a4,a4,8
    80007468:	ff173c23          	sd	a7,-8(a4)
    8000746c:	ff0798e3          	bne	a5,a6,8000745c <__memmove+0x68>
    80007470:	ff867713          	andi	a4,a2,-8
    80007474:	02071793          	slli	a5,a4,0x20
    80007478:	0207d793          	srli	a5,a5,0x20
    8000747c:	00f585b3          	add	a1,a1,a5
    80007480:	40e686bb          	subw	a3,a3,a4
    80007484:	00f507b3          	add	a5,a0,a5
    80007488:	06e60463          	beq	a2,a4,800074f0 <__memmove+0xfc>
    8000748c:	0005c703          	lbu	a4,0(a1)
    80007490:	00e78023          	sb	a4,0(a5)
    80007494:	04068e63          	beqz	a3,800074f0 <__memmove+0xfc>
    80007498:	0015c603          	lbu	a2,1(a1)
    8000749c:	00100713          	li	a4,1
    800074a0:	00c780a3          	sb	a2,1(a5)
    800074a4:	04e68663          	beq	a3,a4,800074f0 <__memmove+0xfc>
    800074a8:	0025c603          	lbu	a2,2(a1)
    800074ac:	00200713          	li	a4,2
    800074b0:	00c78123          	sb	a2,2(a5)
    800074b4:	02e68e63          	beq	a3,a4,800074f0 <__memmove+0xfc>
    800074b8:	0035c603          	lbu	a2,3(a1)
    800074bc:	00300713          	li	a4,3
    800074c0:	00c781a3          	sb	a2,3(a5)
    800074c4:	02e68663          	beq	a3,a4,800074f0 <__memmove+0xfc>
    800074c8:	0045c603          	lbu	a2,4(a1)
    800074cc:	00400713          	li	a4,4
    800074d0:	00c78223          	sb	a2,4(a5)
    800074d4:	00e68e63          	beq	a3,a4,800074f0 <__memmove+0xfc>
    800074d8:	0055c603          	lbu	a2,5(a1)
    800074dc:	00500713          	li	a4,5
    800074e0:	00c782a3          	sb	a2,5(a5)
    800074e4:	00e68663          	beq	a3,a4,800074f0 <__memmove+0xfc>
    800074e8:	0065c703          	lbu	a4,6(a1)
    800074ec:	00e78323          	sb	a4,6(a5)
    800074f0:	00813403          	ld	s0,8(sp)
    800074f4:	01010113          	addi	sp,sp,16
    800074f8:	00008067          	ret
    800074fc:	02061713          	slli	a4,a2,0x20
    80007500:	02075713          	srli	a4,a4,0x20
    80007504:	00e587b3          	add	a5,a1,a4
    80007508:	f0f574e3          	bgeu	a0,a5,80007410 <__memmove+0x1c>
    8000750c:	02069613          	slli	a2,a3,0x20
    80007510:	02065613          	srli	a2,a2,0x20
    80007514:	fff64613          	not	a2,a2
    80007518:	00e50733          	add	a4,a0,a4
    8000751c:	00c78633          	add	a2,a5,a2
    80007520:	fff7c683          	lbu	a3,-1(a5)
    80007524:	fff78793          	addi	a5,a5,-1
    80007528:	fff70713          	addi	a4,a4,-1
    8000752c:	00d70023          	sb	a3,0(a4)
    80007530:	fec798e3          	bne	a5,a2,80007520 <__memmove+0x12c>
    80007534:	00813403          	ld	s0,8(sp)
    80007538:	01010113          	addi	sp,sp,16
    8000753c:	00008067          	ret
    80007540:	02069713          	slli	a4,a3,0x20
    80007544:	02075713          	srli	a4,a4,0x20
    80007548:	00170713          	addi	a4,a4,1
    8000754c:	00e50733          	add	a4,a0,a4
    80007550:	00050793          	mv	a5,a0
    80007554:	0005c683          	lbu	a3,0(a1)
    80007558:	00178793          	addi	a5,a5,1
    8000755c:	00158593          	addi	a1,a1,1
    80007560:	fed78fa3          	sb	a3,-1(a5)
    80007564:	fee798e3          	bne	a5,a4,80007554 <__memmove+0x160>
    80007568:	f89ff06f          	j	800074f0 <__memmove+0xfc>
	...
