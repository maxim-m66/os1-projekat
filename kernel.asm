
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00009117          	auipc	sp,0x9
    80000004:	23013103          	ld	sp,560(sp) # 80009230 <_GLOBAL_OFFSET_TABLE_+0x50>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	6f1040ef          	jal	ra,80004f0c <start>

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
    80001004:	1340006f          	j	80001138 <timerHandler>
    sret
    80001008:	10200073          	sret
    sret
    8000100c:	10200073          	sret
    sret
    80001010:	10200073          	sret
    j readHandler
    80001014:	2340006f          	j	80001248 <readHandler>
    sret
    80001018:	10200073          	sret
    j writeHandler
    8000101c:	2340006f          	j	80001250 <writeHandler>
    sret
    80001020:	10200073          	sret
    j consoleHandler
    80001024:	2340006f          	j	80001258 <consoleHandler>

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

    csrw sscratch, ra
    800010a4:	14009073          	csrw	sscratch,ra
    csrr t0, sepc
    800010a8:	141022f3          	csrr	t0,sepc
    addi t0, t0, 4
    800010ac:	00428293          	addi	t0,t0,4
    csrw sepc, t0
    800010b0:	14129073          	csrw	sepc,t0

    call _ZN5Riscv20handleSupervisorTrapEv
    800010b4:	459020ef          	jal	ra,80003d0c <_ZN5Riscv20handleSupervisorTrapEv>

    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010b8:	00813083          	ld	ra,8(sp)
    800010bc:	01013103          	ld	sp,16(sp)
    800010c0:	01813183          	ld	gp,24(sp)
    800010c4:	02013203          	ld	tp,32(sp)
    800010c8:	02813283          	ld	t0,40(sp)
    800010cc:	03013303          	ld	t1,48(sp)
    800010d0:	03813383          	ld	t2,56(sp)
    800010d4:	04013403          	ld	s0,64(sp)
    800010d8:	04813483          	ld	s1,72(sp)
    800010dc:	05813583          	ld	a1,88(sp)
    800010e0:	06013603          	ld	a2,96(sp)
    800010e4:	06813683          	ld	a3,104(sp)
    800010e8:	07013703          	ld	a4,112(sp)
    800010ec:	07813783          	ld	a5,120(sp)
    800010f0:	08013803          	ld	a6,128(sp)
    800010f4:	08813883          	ld	a7,136(sp)
    800010f8:	09013903          	ld	s2,144(sp)
    800010fc:	09813983          	ld	s3,152(sp)
    80001100:	0a013a03          	ld	s4,160(sp)
    80001104:	0a813a83          	ld	s5,168(sp)
    80001108:	0b013b03          	ld	s6,176(sp)
    8000110c:	0b813b83          	ld	s7,184(sp)
    80001110:	0c013c03          	ld	s8,192(sp)
    80001114:	0c813c83          	ld	s9,200(sp)
    80001118:	0d013d03          	ld	s10,208(sp)
    8000111c:	0d813d83          	ld	s11,216(sp)
    80001120:	0e013e03          	ld	t3,224(sp)
    80001124:	0e813e83          	ld	t4,232(sp)
    80001128:	0f013f03          	ld	t5,240(sp)
    8000112c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001130:	10010113          	addi	sp,sp,256
    sret
    80001134:	10200073          	sret

0000000080001138 <timerHandler>:

timerHandler:
    addi sp, sp, -256
    80001138:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000113c:	00013023          	sd	zero,0(sp)
    80001140:	00113423          	sd	ra,8(sp)
    80001144:	00213823          	sd	sp,16(sp)
    80001148:	00313c23          	sd	gp,24(sp)
    8000114c:	02413023          	sd	tp,32(sp)
    80001150:	02513423          	sd	t0,40(sp)
    80001154:	02613823          	sd	t1,48(sp)
    80001158:	02713c23          	sd	t2,56(sp)
    8000115c:	04813023          	sd	s0,64(sp)
    80001160:	04913423          	sd	s1,72(sp)
    80001164:	04a13823          	sd	a0,80(sp)
    80001168:	04b13c23          	sd	a1,88(sp)
    8000116c:	06c13023          	sd	a2,96(sp)
    80001170:	06d13423          	sd	a3,104(sp)
    80001174:	06e13823          	sd	a4,112(sp)
    80001178:	06f13c23          	sd	a5,120(sp)
    8000117c:	09013023          	sd	a6,128(sp)
    80001180:	09113423          	sd	a7,136(sp)
    80001184:	09213823          	sd	s2,144(sp)
    80001188:	09313c23          	sd	s3,152(sp)
    8000118c:	0b413023          	sd	s4,160(sp)
    80001190:	0b513423          	sd	s5,168(sp)
    80001194:	0b613823          	sd	s6,176(sp)
    80001198:	0b713c23          	sd	s7,184(sp)
    8000119c:	0d813023          	sd	s8,192(sp)
    800011a0:	0d913423          	sd	s9,200(sp)
    800011a4:	0da13823          	sd	s10,208(sp)
    800011a8:	0db13c23          	sd	s11,216(sp)
    800011ac:	0fc13023          	sd	t3,224(sp)
    800011b0:	0fd13423          	sd	t4,232(sp)
    800011b4:	0fe13823          	sd	t5,240(sp)
    800011b8:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv15handleTimerTrapEv
    800011bc:	525020ef          	jal	ra,80003ee0 <_ZN5Riscv15handleTimerTrapEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011c0:	00013003          	ld	zero,0(sp)
    800011c4:	00813083          	ld	ra,8(sp)
    800011c8:	01013103          	ld	sp,16(sp)
    800011cc:	01813183          	ld	gp,24(sp)
    800011d0:	02013203          	ld	tp,32(sp)
    800011d4:	02813283          	ld	t0,40(sp)
    800011d8:	03013303          	ld	t1,48(sp)
    800011dc:	03813383          	ld	t2,56(sp)
    800011e0:	04013403          	ld	s0,64(sp)
    800011e4:	04813483          	ld	s1,72(sp)
    800011e8:	05013503          	ld	a0,80(sp)
    800011ec:	05813583          	ld	a1,88(sp)
    800011f0:	06013603          	ld	a2,96(sp)
    800011f4:	06813683          	ld	a3,104(sp)
    800011f8:	07013703          	ld	a4,112(sp)
    800011fc:	07813783          	ld	a5,120(sp)
    80001200:	08013803          	ld	a6,128(sp)
    80001204:	08813883          	ld	a7,136(sp)
    80001208:	09013903          	ld	s2,144(sp)
    8000120c:	09813983          	ld	s3,152(sp)
    80001210:	0a013a03          	ld	s4,160(sp)
    80001214:	0a813a83          	ld	s5,168(sp)
    80001218:	0b013b03          	ld	s6,176(sp)
    8000121c:	0b813b83          	ld	s7,184(sp)
    80001220:	0c013c03          	ld	s8,192(sp)
    80001224:	0c813c83          	ld	s9,200(sp)
    80001228:	0d013d03          	ld	s10,208(sp)
    8000122c:	0d813d83          	ld	s11,216(sp)
    80001230:	0e013e03          	ld	t3,224(sp)
    80001234:	0e813e83          	ld	t4,232(sp)
    80001238:	0f013f03          	ld	t5,240(sp)
    8000123c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001240:	10010113          	addi	sp,sp,256
    sret
    80001244:	10200073          	sret

0000000080001248 <readHandler>:

readHandler:
    call _ZN5Riscv14handleReadTrapEv
    80001248:	685020ef          	jal	ra,800040cc <_ZN5Riscv14handleReadTrapEv>
    sret
    8000124c:	10200073          	sret

0000000080001250 <writeHandler>:

writeHandler:
    call _ZN5Riscv15handleWriteTrapEv
    80001250:	6b1020ef          	jal	ra,80004100 <_ZN5Riscv15handleWriteTrapEv>
    sret
    80001254:	10200073          	sret

0000000080001258 <consoleHandler>:

consoleHandler:
    addi sp, sp, -256
    80001258:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000125c:	00013023          	sd	zero,0(sp)
    80001260:	00113423          	sd	ra,8(sp)
    80001264:	00213823          	sd	sp,16(sp)
    80001268:	00313c23          	sd	gp,24(sp)
    8000126c:	02413023          	sd	tp,32(sp)
    80001270:	02513423          	sd	t0,40(sp)
    80001274:	02613823          	sd	t1,48(sp)
    80001278:	02713c23          	sd	t2,56(sp)
    8000127c:	04813023          	sd	s0,64(sp)
    80001280:	04913423          	sd	s1,72(sp)
    80001284:	04a13823          	sd	a0,80(sp)
    80001288:	04b13c23          	sd	a1,88(sp)
    8000128c:	06c13023          	sd	a2,96(sp)
    80001290:	06d13423          	sd	a3,104(sp)
    80001294:	06e13823          	sd	a4,112(sp)
    80001298:	06f13c23          	sd	a5,120(sp)
    8000129c:	09013023          	sd	a6,128(sp)
    800012a0:	09113423          	sd	a7,136(sp)
    800012a4:	09213823          	sd	s2,144(sp)
    800012a8:	09313c23          	sd	s3,152(sp)
    800012ac:	0b413023          	sd	s4,160(sp)
    800012b0:	0b513423          	sd	s5,168(sp)
    800012b4:	0b613823          	sd	s6,176(sp)
    800012b8:	0b713c23          	sd	s7,184(sp)
    800012bc:	0d813023          	sd	s8,192(sp)
    800012c0:	0d913423          	sd	s9,200(sp)
    800012c4:	0da13823          	sd	s10,208(sp)
    800012c8:	0db13c23          	sd	s11,216(sp)
    800012cc:	0fc13023          	sd	t3,224(sp)
    800012d0:	0fd13423          	sd	t4,232(sp)
    800012d4:	0fe13823          	sd	t5,240(sp)
    800012d8:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv17handleConsoleTrapEv
    800012dc:	541020ef          	jal	ra,8000401c <_ZN5Riscv17handleConsoleTrapEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800012e0:	00013003          	ld	zero,0(sp)
    800012e4:	00813083          	ld	ra,8(sp)
    800012e8:	01013103          	ld	sp,16(sp)
    800012ec:	01813183          	ld	gp,24(sp)
    800012f0:	02013203          	ld	tp,32(sp)
    800012f4:	02813283          	ld	t0,40(sp)
    800012f8:	03013303          	ld	t1,48(sp)
    800012fc:	03813383          	ld	t2,56(sp)
    80001300:	04013403          	ld	s0,64(sp)
    80001304:	04813483          	ld	s1,72(sp)
    80001308:	05013503          	ld	a0,80(sp)
    8000130c:	05813583          	ld	a1,88(sp)
    80001310:	06013603          	ld	a2,96(sp)
    80001314:	06813683          	ld	a3,104(sp)
    80001318:	07013703          	ld	a4,112(sp)
    8000131c:	07813783          	ld	a5,120(sp)
    80001320:	08013803          	ld	a6,128(sp)
    80001324:	08813883          	ld	a7,136(sp)
    80001328:	09013903          	ld	s2,144(sp)
    8000132c:	09813983          	ld	s3,152(sp)
    80001330:	0a013a03          	ld	s4,160(sp)
    80001334:	0a813a83          	ld	s5,168(sp)
    80001338:	0b013b03          	ld	s6,176(sp)
    8000133c:	0b813b83          	ld	s7,184(sp)
    80001340:	0c013c03          	ld	s8,192(sp)
    80001344:	0c813c83          	ld	s9,200(sp)
    80001348:	0d013d03          	ld	s10,208(sp)
    8000134c:	0d813d83          	ld	s11,216(sp)
    80001350:	0e013e03          	ld	t3,224(sp)
    80001354:	0e813e83          	ld	t4,232(sp)
    80001358:	0f013f03          	ld	t5,240(sp)
    8000135c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001360:	10010113          	addi	sp,sp,256
    80001364:	10200073          	sret
	...

0000000080001370 <_ZN5Riscv4pushEv>:
.global _ZN5Riscv4pushEv
.type _ZN5Riscv4pushEv @function
_ZN5Riscv4pushEv:
    addi sp, sp, -256
    80001370:	f0010113          	addi	sp,sp,-256
    .irp index, 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001374:	00213823          	sd	sp,16(sp)
    80001378:	00313c23          	sd	gp,24(sp)
    8000137c:	02413023          	sd	tp,32(sp)
    80001380:	02513423          	sd	t0,40(sp)
    80001384:	02613823          	sd	t1,48(sp)
    80001388:	02713c23          	sd	t2,56(sp)
    8000138c:	04813023          	sd	s0,64(sp)
    80001390:	04913423          	sd	s1,72(sp)
    80001394:	04a13823          	sd	a0,80(sp)
    80001398:	04b13c23          	sd	a1,88(sp)
    8000139c:	06c13023          	sd	a2,96(sp)
    800013a0:	06d13423          	sd	a3,104(sp)
    800013a4:	06e13823          	sd	a4,112(sp)
    800013a8:	06f13c23          	sd	a5,120(sp)
    800013ac:	09013023          	sd	a6,128(sp)
    800013b0:	09113423          	sd	a7,136(sp)
    800013b4:	09213823          	sd	s2,144(sp)
    800013b8:	09313c23          	sd	s3,152(sp)
    800013bc:	0b413023          	sd	s4,160(sp)
    800013c0:	0b513423          	sd	s5,168(sp)
    800013c4:	0b613823          	sd	s6,176(sp)
    800013c8:	0b713c23          	sd	s7,184(sp)
    800013cc:	0d813023          	sd	s8,192(sp)
    800013d0:	0d913423          	sd	s9,200(sp)
    800013d4:	0da13823          	sd	s10,208(sp)
    800013d8:	0db13c23          	sd	s11,216(sp)
    800013dc:	0fc13023          	sd	t3,224(sp)
    800013e0:	0fd13423          	sd	t4,232(sp)
    800013e4:	0fe13823          	sd	t5,240(sp)
    800013e8:	0ff13c23          	sd	t6,248(sp)
    ret
    800013ec:	00008067          	ret

00000000800013f0 <_ZN5Riscv3popEv>:
.global _ZN5Riscv3popEv
.type _ZN5Riscv3popEv @function
_ZN5Riscv3popEv:
    .irp index, 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800013f0:	01013103          	ld	sp,16(sp)
    800013f4:	01813183          	ld	gp,24(sp)
    800013f8:	02013203          	ld	tp,32(sp)
    800013fc:	02813283          	ld	t0,40(sp)
    80001400:	03013303          	ld	t1,48(sp)
    80001404:	03813383          	ld	t2,56(sp)
    80001408:	04013403          	ld	s0,64(sp)
    8000140c:	04813483          	ld	s1,72(sp)
    80001410:	05013503          	ld	a0,80(sp)
    80001414:	05813583          	ld	a1,88(sp)
    80001418:	06013603          	ld	a2,96(sp)
    8000141c:	06813683          	ld	a3,104(sp)
    80001420:	07013703          	ld	a4,112(sp)
    80001424:	07813783          	ld	a5,120(sp)
    80001428:	08013803          	ld	a6,128(sp)
    8000142c:	08813883          	ld	a7,136(sp)
    80001430:	09013903          	ld	s2,144(sp)
    80001434:	09813983          	ld	s3,152(sp)
    80001438:	0a013a03          	ld	s4,160(sp)
    8000143c:	0a813a83          	ld	s5,168(sp)
    80001440:	0b013b03          	ld	s6,176(sp)
    80001444:	0b813b83          	ld	s7,184(sp)
    80001448:	0c013c03          	ld	s8,192(sp)
    8000144c:	0c813c83          	ld	s9,200(sp)
    80001450:	0d013d03          	ld	s10,208(sp)
    80001454:	0d813d83          	ld	s11,216(sp)
    80001458:	0e013e03          	ld	t3,224(sp)
    8000145c:	0e813e83          	ld	t4,232(sp)
    80001460:	0f013f03          	ld	t5,240(sp)
    80001464:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001468:	10010113          	addi	sp,sp,256
    ret
    8000146c:	00008067          	ret

0000000080001470 <_ZN3TCB14context_switchEP7ContextS1_>:

.global _ZN3TCB14context_switchEP7ContextS1_
.type _ZN3TCB14context_switchEP7ContextS1_ @function
_ZN3TCB14context_switchEP7ContextS1_:
    sd ra, 0(a0)
    80001470:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 8(a0)
    80001474:	00253423          	sd	sp,8(a0)

    ld ra, 0(a1)
    80001478:	0005b083          	ld	ra,0(a1)
    ld sp, 8(a1)
    8000147c:	0085b103          	ld	sp,8(a1)
    80001480:	00008067          	ret

0000000080001484 <_Z7syscallmmmmm>:
#include "../h/syscall_c.hpp"
#include "../h/c_console.hpp"


void syscall(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    80001484:	ff010113          	addi	sp,sp,-16
    80001488:	00813423          	sd	s0,8(sp)
    8000148c:	01010413          	addi	s0,sp,16
    __asm__ volatile("ecall");
    80001490:	00000073          	ecall
}
    80001494:	00813403          	ld	s0,8(sp)
    80001498:	01010113          	addi	sp,sp,16
    8000149c:	00008067          	ret

00000000800014a0 <_Z9mem_allocm>:

void *mem_alloc(size_t size) {
    if (size == 0) return nullptr;
    800014a0:	04050263          	beqz	a0,800014e4 <_Z9mem_allocm+0x44>
void *mem_alloc(size_t size) {
    800014a4:	ff010113          	addi	sp,sp,-16
    800014a8:	00113423          	sd	ra,8(sp)
    800014ac:	00813023          	sd	s0,0(sp)
    800014b0:	01010413          	addi	s0,sp,16
    800014b4:	00050593          	mv	a1,a0
    void volatile *ret;
    syscall(MEM_ALLOC, size);
    800014b8:	00000713          	li	a4,0
    800014bc:	00000693          	li	a3,0
    800014c0:	00000613          	li	a2,0
    800014c4:	00100513          	li	a0,1
    800014c8:	00000097          	auipc	ra,0x0
    800014cc:	fbc080e7          	jalr	-68(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    800014d0:	00050513          	mv	a0,a0
    return (void *) ret;
}
    800014d4:	00813083          	ld	ra,8(sp)
    800014d8:	00013403          	ld	s0,0(sp)
    800014dc:	01010113          	addi	sp,sp,16
    800014e0:	00008067          	ret
    if (size == 0) return nullptr;
    800014e4:	00000513          	li	a0,0
}
    800014e8:	00008067          	ret

00000000800014ec <_Z8mem_freePv>:

int mem_free(void *mem) {
    800014ec:	fe010113          	addi	sp,sp,-32
    800014f0:	00113c23          	sd	ra,24(sp)
    800014f4:	00813823          	sd	s0,16(sp)
    800014f8:	02010413          	addi	s0,sp,32
    800014fc:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(MEM_FREE, (uint64) mem);
    80001500:	00000713          	li	a4,0
    80001504:	00000693          	li	a3,0
    80001508:	00000613          	li	a2,0
    8000150c:	00200513          	li	a0,2
    80001510:	00000097          	auipc	ra,0x0
    80001514:	f74080e7          	jalr	-140(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001518:	00050793          	mv	a5,a0
    8000151c:	fef42623          	sw	a5,-20(s0)
    return ret;
    80001520:	fec42503          	lw	a0,-20(s0)
}
    80001524:	0005051b          	sext.w	a0,a0
    80001528:	01813083          	ld	ra,24(sp)
    8000152c:	01013403          	ld	s0,16(sp)
    80001530:	02010113          	addi	sp,sp,32
    80001534:	00008067          	ret

0000000080001538 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    80001538:	fc010113          	addi	sp,sp,-64
    8000153c:	02113c23          	sd	ra,56(sp)
    80001540:	02813823          	sd	s0,48(sp)
    80001544:	02913423          	sd	s1,40(sp)
    80001548:	03213023          	sd	s2,32(sp)
    8000154c:	01313c23          	sd	s3,24(sp)
    80001550:	04010413          	addi	s0,sp,64
    80001554:	00050913          	mv	s2,a0
    80001558:	00058493          	mv	s1,a1
    8000155c:	00060993          	mv	s3,a2
    void *stack_space = nullptr;
    if (start_routine) {
    80001560:	04058c63          	beqz	a1,800015b8 <_Z13thread_createPP3TCBPFvPvES2_+0x80>
        stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80001564:	00004537          	lui	a0,0x4
    80001568:	00000097          	auipc	ra,0x0
    8000156c:	f38080e7          	jalr	-200(ra) # 800014a0 <_Z9mem_allocm>
    80001570:	00050713          	mv	a4,a0
    }
    int volatile ret;
    syscall(THREAD_CREATE, (uint64) handle, (uint64) start_routine, (uint64) arg, (uint64) stack_space);
    80001574:	00098693          	mv	a3,s3
    80001578:	00048613          	mv	a2,s1
    8000157c:	00090593          	mv	a1,s2
    80001580:	01100513          	li	a0,17
    80001584:	00000097          	auipc	ra,0x0
    80001588:	f00080e7          	jalr	-256(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    8000158c:	00050793          	mv	a5,a0
    80001590:	fcf42623          	sw	a5,-52(s0)
    return ret;
    80001594:	fcc42503          	lw	a0,-52(s0)
}
    80001598:	0005051b          	sext.w	a0,a0
    8000159c:	03813083          	ld	ra,56(sp)
    800015a0:	03013403          	ld	s0,48(sp)
    800015a4:	02813483          	ld	s1,40(sp)
    800015a8:	02013903          	ld	s2,32(sp)
    800015ac:	01813983          	ld	s3,24(sp)
    800015b0:	04010113          	addi	sp,sp,64
    800015b4:	00008067          	ret
    void *stack_space = nullptr;
    800015b8:	00000713          	li	a4,0
    800015bc:	fb9ff06f          	j	80001574 <_Z13thread_createPP3TCBPFvPvES2_+0x3c>

00000000800015c0 <_Z11thread_exitv>:

int thread_exit() {
    800015c0:	fe010113          	addi	sp,sp,-32
    800015c4:	00113c23          	sd	ra,24(sp)
    800015c8:	00813823          	sd	s0,16(sp)
    800015cc:	02010413          	addi	s0,sp,32
    int volatile ret;
    syscall(THREAD_EXIT);
    800015d0:	00000713          	li	a4,0
    800015d4:	00000693          	li	a3,0
    800015d8:	00000613          	li	a2,0
    800015dc:	00000593          	li	a1,0
    800015e0:	01200513          	li	a0,18
    800015e4:	00000097          	auipc	ra,0x0
    800015e8:	ea0080e7          	jalr	-352(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    800015ec:	00050793          	mv	a5,a0
    800015f0:	fef42623          	sw	a5,-20(s0)
    return ret;
    800015f4:	fec42503          	lw	a0,-20(s0)
}
    800015f8:	0005051b          	sext.w	a0,a0
    800015fc:	01813083          	ld	ra,24(sp)
    80001600:	01013403          	ld	s0,16(sp)
    80001604:	02010113          	addi	sp,sp,32
    80001608:	00008067          	ret

000000008000160c <_Z15thread_dispatchv>:

void thread_dispatch() {
    8000160c:	ff010113          	addi	sp,sp,-16
    80001610:	00113423          	sd	ra,8(sp)
    80001614:	00813023          	sd	s0,0(sp)
    80001618:	01010413          	addi	s0,sp,16
    syscall(THREAD_DISPATCH);
    8000161c:	00000713          	li	a4,0
    80001620:	00000693          	li	a3,0
    80001624:	00000613          	li	a2,0
    80001628:	00000593          	li	a1,0
    8000162c:	01300513          	li	a0,19
    80001630:	00000097          	auipc	ra,0x0
    80001634:	e54080e7          	jalr	-428(ra) # 80001484 <_Z7syscallmmmmm>
}
    80001638:	00813083          	ld	ra,8(sp)
    8000163c:	00013403          	ld	s0,0(sp)
    80001640:	01010113          	addi	sp,sp,16
    80001644:	00008067          	ret

0000000080001648 <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    80001648:	ff010113          	addi	sp,sp,-16
    8000164c:	00113423          	sd	ra,8(sp)
    80001650:	00813023          	sd	s0,0(sp)
    80001654:	01010413          	addi	s0,sp,16
    80001658:	00050593          	mv	a1,a0
    syscall(THREAD_JOIN, (uint64) handle);
    8000165c:	00000713          	li	a4,0
    80001660:	00000693          	li	a3,0
    80001664:	00000613          	li	a2,0
    80001668:	01400513          	li	a0,20
    8000166c:	00000097          	auipc	ra,0x0
    80001670:	e18080e7          	jalr	-488(ra) # 80001484 <_Z7syscallmmmmm>
}
    80001674:	00813083          	ld	ra,8(sp)
    80001678:	00013403          	ld	s0,0(sp)
    8000167c:	01010113          	addi	sp,sp,16
    80001680:	00008067          	ret

0000000080001684 <_Z11thread_joinP3TCBm>:

void thread_join(thread_t handle, time_t time) {
    80001684:	fe010113          	addi	sp,sp,-32
    80001688:	00113c23          	sd	ra,24(sp)
    8000168c:	00813823          	sd	s0,16(sp)
    80001690:	00913423          	sd	s1,8(sp)
    80001694:	01213023          	sd	s2,0(sp)
    80001698:	02010413          	addi	s0,sp,32
    8000169c:	00050913          	mv	s2,a0
    800016a0:	00058493          	mv	s1,a1
    if (time == 0) thread_join(handle);
    800016a4:	02058c63          	beqz	a1,800016dc <_Z11thread_joinP3TCBm+0x58>
    syscall(THREAD_JOIN_TIME, (uint64) handle, time);
    800016a8:	00000713          	li	a4,0
    800016ac:	00000693          	li	a3,0
    800016b0:	00048613          	mv	a2,s1
    800016b4:	00090593          	mv	a1,s2
    800016b8:	01500513          	li	a0,21
    800016bc:	00000097          	auipc	ra,0x0
    800016c0:	dc8080e7          	jalr	-568(ra) # 80001484 <_Z7syscallmmmmm>
}
    800016c4:	01813083          	ld	ra,24(sp)
    800016c8:	01013403          	ld	s0,16(sp)
    800016cc:	00813483          	ld	s1,8(sp)
    800016d0:	00013903          	ld	s2,0(sp)
    800016d4:	02010113          	addi	sp,sp,32
    800016d8:	00008067          	ret
    if (time == 0) thread_join(handle);
    800016dc:	00000097          	auipc	ra,0x0
    800016e0:	f6c080e7          	jalr	-148(ra) # 80001648 <_Z11thread_joinP3TCB>
    800016e4:	fc5ff06f          	j	800016a8 <_Z11thread_joinP3TCBm+0x24>

00000000800016e8 <_Z4forkv>:

int fork() {
    800016e8:	fe010113          	addi	sp,sp,-32
    800016ec:	00113c23          	sd	ra,24(sp)
    800016f0:	00813823          	sd	s0,16(sp)
    800016f4:	02010413          	addi	s0,sp,32
    int volatile ret;
    syscall(THREAD_FORK);
    800016f8:	00000713          	li	a4,0
    800016fc:	00000693          	li	a3,0
    80001700:	00000613          	li	a2,0
    80001704:	00000593          	li	a1,0
    80001708:	01600513          	li	a0,22
    8000170c:	00000097          	auipc	ra,0x0
    80001710:	d78080e7          	jalr	-648(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001714:	00050793          	mv	a5,a0
    80001718:	fef42623          	sw	a5,-20(s0)
    return ret;
    8000171c:	fec42503          	lw	a0,-20(s0)
}
    80001720:	0005051b          	sext.w	a0,a0
    80001724:	01813083          	ld	ra,24(sp)
    80001728:	01013403          	ld	s0,16(sp)
    8000172c:	02010113          	addi	sp,sp,32
    80001730:	00008067          	ret

0000000080001734 <_Z11thread_killP3TCB>:

int thread_kill(thread_t handle) {
    80001734:	fe010113          	addi	sp,sp,-32
    80001738:	00113c23          	sd	ra,24(sp)
    8000173c:	00813823          	sd	s0,16(sp)
    80001740:	02010413          	addi	s0,sp,32
    80001744:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(THREAD_KILL, (uint64) handle);
    80001748:	00000713          	li	a4,0
    8000174c:	00000693          	li	a3,0
    80001750:	00000613          	li	a2,0
    80001754:	01700513          	li	a0,23
    80001758:	00000097          	auipc	ra,0x0
    8000175c:	d2c080e7          	jalr	-724(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001760:	00050793          	mv	a5,a0
    80001764:	fef42623          	sw	a5,-20(s0)
    return ret;
    80001768:	fec42503          	lw	a0,-20(s0)
}
    8000176c:	0005051b          	sext.w	a0,a0
    80001770:	01813083          	ld	ra,24(sp)
    80001774:	01013403          	ld	s0,16(sp)
    80001778:	02010113          	addi	sp,sp,32
    8000177c:	00008067          	ret

0000000080001780 <_Z8sem_openPP3Semj>:

int sem_open(sem_t *handle, unsigned init) {
    80001780:	fe010113          	addi	sp,sp,-32
    80001784:	00113c23          	sd	ra,24(sp)
    80001788:	00813823          	sd	s0,16(sp)
    8000178c:	02010413          	addi	s0,sp,32
    int volatile ret;
    syscall(SEM_OPEN, (uint64) handle, init);
    80001790:	00000713          	li	a4,0
    80001794:	00000693          	li	a3,0
    80001798:	02059613          	slli	a2,a1,0x20
    8000179c:	02065613          	srli	a2,a2,0x20
    800017a0:	00050593          	mv	a1,a0
    800017a4:	02100513          	li	a0,33
    800017a8:	00000097          	auipc	ra,0x0
    800017ac:	cdc080e7          	jalr	-804(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    800017b0:	00050793          	mv	a5,a0
    800017b4:	fef42623          	sw	a5,-20(s0)
    return ret;
    800017b8:	fec42503          	lw	a0,-20(s0)
}
    800017bc:	0005051b          	sext.w	a0,a0
    800017c0:	01813083          	ld	ra,24(sp)
    800017c4:	01013403          	ld	s0,16(sp)
    800017c8:	02010113          	addi	sp,sp,32
    800017cc:	00008067          	ret

00000000800017d0 <_Z9sem_closeP3Sem>:

int sem_close(sem_t id) {
    800017d0:	fe010113          	addi	sp,sp,-32
    800017d4:	00113c23          	sd	ra,24(sp)
    800017d8:	00813823          	sd	s0,16(sp)
    800017dc:	02010413          	addi	s0,sp,32
    800017e0:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(SEM_CLOSE, (uint64) id);
    800017e4:	00000713          	li	a4,0
    800017e8:	00000693          	li	a3,0
    800017ec:	00000613          	li	a2,0
    800017f0:	02200513          	li	a0,34
    800017f4:	00000097          	auipc	ra,0x0
    800017f8:	c90080e7          	jalr	-880(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    800017fc:	00050793          	mv	a5,a0
    80001800:	fef42623          	sw	a5,-20(s0)
    return ret;
    80001804:	fec42503          	lw	a0,-20(s0)
}
    80001808:	0005051b          	sext.w	a0,a0
    8000180c:	01813083          	ld	ra,24(sp)
    80001810:	01013403          	ld	s0,16(sp)
    80001814:	02010113          	addi	sp,sp,32
    80001818:	00008067          	ret

000000008000181c <_Z8sem_waitP3Sem>:

int sem_wait(sem_t id) {
    8000181c:	fe010113          	addi	sp,sp,-32
    80001820:	00113c23          	sd	ra,24(sp)
    80001824:	00813823          	sd	s0,16(sp)
    80001828:	02010413          	addi	s0,sp,32
    8000182c:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(SEM_WAIT, (uint64) id);
    80001830:	00000713          	li	a4,0
    80001834:	00000693          	li	a3,0
    80001838:	00000613          	li	a2,0
    8000183c:	02300513          	li	a0,35
    80001840:	00000097          	auipc	ra,0x0
    80001844:	c44080e7          	jalr	-956(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001848:	00050793          	mv	a5,a0
    8000184c:	fef42623          	sw	a5,-20(s0)
    return ret;
    80001850:	fec42503          	lw	a0,-20(s0)
}
    80001854:	0005051b          	sext.w	a0,a0
    80001858:	01813083          	ld	ra,24(sp)
    8000185c:	01013403          	ld	s0,16(sp)
    80001860:	02010113          	addi	sp,sp,32
    80001864:	00008067          	ret

0000000080001868 <_Z10sem_signalP3Sem>:

int sem_signal(sem_t id) {
    80001868:	fe010113          	addi	sp,sp,-32
    8000186c:	00113c23          	sd	ra,24(sp)
    80001870:	00813823          	sd	s0,16(sp)
    80001874:	02010413          	addi	s0,sp,32
    80001878:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(SEM_SIGNAL, (uint64) id);
    8000187c:	00000713          	li	a4,0
    80001880:	00000693          	li	a3,0
    80001884:	00000613          	li	a2,0
    80001888:	02400513          	li	a0,36
    8000188c:	00000097          	auipc	ra,0x0
    80001890:	bf8080e7          	jalr	-1032(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001894:	00050793          	mv	a5,a0
    80001898:	fef42623          	sw	a5,-20(s0)
    return ret;
    8000189c:	fec42503          	lw	a0,-20(s0)
}
    800018a0:	0005051b          	sext.w	a0,a0
    800018a4:	01813083          	ld	ra,24(sp)
    800018a8:	01013403          	ld	s0,16(sp)
    800018ac:	02010113          	addi	sp,sp,32
    800018b0:	00008067          	ret

00000000800018b4 <_Z15signal_and_waitP3SemS0_>:

int signal_and_wait(sem_t signal, sem_t wait) {
    800018b4:	fe010113          	addi	sp,sp,-32
    800018b8:	00113c23          	sd	ra,24(sp)
    800018bc:	00813823          	sd	s0,16(sp)
    800018c0:	02010413          	addi	s0,sp,32
    800018c4:	00058613          	mv	a2,a1
    int volatile ret;
    syscall(SIGNAL_WAIT, (uint64) signal, (uint64) wait);
    800018c8:	00000713          	li	a4,0
    800018cc:	00000693          	li	a3,0
    800018d0:	00050593          	mv	a1,a0
    800018d4:	02500513          	li	a0,37
    800018d8:	00000097          	auipc	ra,0x0
    800018dc:	bac080e7          	jalr	-1108(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    800018e0:	00050793          	mv	a5,a0
    800018e4:	fef42623          	sw	a5,-20(s0)
    return ret;
    800018e8:	fec42503          	lw	a0,-20(s0)
}
    800018ec:	0005051b          	sext.w	a0,a0
    800018f0:	01813083          	ld	ra,24(sp)
    800018f4:	01013403          	ld	s0,16(sp)
    800018f8:	02010113          	addi	sp,sp,32
    800018fc:	00008067          	ret

0000000080001900 <_Z10time_sleepm>:

int time_sleep(time_t ms) {
    if (ms == 0) return -1;
    80001900:	04050863          	beqz	a0,80001950 <_Z10time_sleepm+0x50>
int time_sleep(time_t ms) {
    80001904:	fe010113          	addi	sp,sp,-32
    80001908:	00113c23          	sd	ra,24(sp)
    8000190c:	00813823          	sd	s0,16(sp)
    80001910:	02010413          	addi	s0,sp,32
    80001914:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(TIME_SLEEP, ms);
    80001918:	00000713          	li	a4,0
    8000191c:	00000693          	li	a3,0
    80001920:	00000613          	li	a2,0
    80001924:	03100513          	li	a0,49
    80001928:	00000097          	auipc	ra,0x0
    8000192c:	b5c080e7          	jalr	-1188(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001930:	00050793          	mv	a5,a0
    80001934:	fef42623          	sw	a5,-20(s0)
    return ret;
    80001938:	fec42503          	lw	a0,-20(s0)
    8000193c:	0005051b          	sext.w	a0,a0
}
    80001940:	01813083          	ld	ra,24(sp)
    80001944:	01013403          	ld	s0,16(sp)
    80001948:	02010113          	addi	sp,sp,32
    8000194c:	00008067          	ret
    if (ms == 0) return -1;
    80001950:	fff00513          	li	a0,-1
}
    80001954:	00008067          	ret

0000000080001958 <_Z11thread_wakeP3TCB>:

int thread_wake(thread_t handle) {
    80001958:	fe010113          	addi	sp,sp,-32
    8000195c:	00113c23          	sd	ra,24(sp)
    80001960:	00813823          	sd	s0,16(sp)
    80001964:	02010413          	addi	s0,sp,32
    80001968:	00050593          	mv	a1,a0
    int volatile ret;
    syscall(TIME_SLEEP, (uint64) handle);
    8000196c:	00000713          	li	a4,0
    80001970:	00000693          	li	a3,0
    80001974:	00000613          	li	a2,0
    80001978:	03100513          	li	a0,49
    8000197c:	00000097          	auipc	ra,0x0
    80001980:	b08080e7          	jalr	-1272(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001984:	00050793          	mv	a5,a0
    80001988:	fef42623          	sw	a5,-20(s0)
    return ret;
    8000198c:	fec42503          	lw	a0,-20(s0)
}
    80001990:	0005051b          	sext.w	a0,a0
    80001994:	01813083          	ld	ra,24(sp)
    80001998:	01013403          	ld	s0,16(sp)
    8000199c:	02010113          	addi	sp,sp,32
    800019a0:	00008067          	ret

00000000800019a4 <_Z4getcv>:

char getc() {
    800019a4:	fe010113          	addi	sp,sp,-32
    800019a8:	00113c23          	sd	ra,24(sp)
    800019ac:	00813823          	sd	s0,16(sp)
    800019b0:	02010413          	addi	s0,sp,32
    char volatile ret;
    syscall(GETC);
    800019b4:	00000713          	li	a4,0
    800019b8:	00000693          	li	a3,0
    800019bc:	00000613          	li	a2,0
    800019c0:	00000593          	li	a1,0
    800019c4:	04100513          	li	a0,65
    800019c8:	00000097          	auipc	ra,0x0
    800019cc:	abc080e7          	jalr	-1348(ra) # 80001484 <_Z7syscallmmmmm>
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    800019d0:	00050793          	mv	a5,a0
    800019d4:	fef407a3          	sb	a5,-17(s0)
    return ret;
    800019d8:	fef44503          	lbu	a0,-17(s0)
}
    800019dc:	0ff57513          	andi	a0,a0,255
    800019e0:	01813083          	ld	ra,24(sp)
    800019e4:	01013403          	ld	s0,16(sp)
    800019e8:	02010113          	addi	sp,sp,32
    800019ec:	00008067          	ret

00000000800019f0 <_Z4putcc>:

void putc(char c) {
    800019f0:	ff010113          	addi	sp,sp,-16
    800019f4:	00113423          	sd	ra,8(sp)
    800019f8:	00813023          	sd	s0,0(sp)
    800019fc:	01010413          	addi	s0,sp,16
    80001a00:	00050593          	mv	a1,a0
    syscall(PUTC, c);
    80001a04:	00000713          	li	a4,0
    80001a08:	00000693          	li	a3,0
    80001a0c:	00000613          	li	a2,0
    80001a10:	04200513          	li	a0,66
    80001a14:	00000097          	auipc	ra,0x0
    80001a18:	a70080e7          	jalr	-1424(ra) # 80001484 <_Z7syscallmmmmm>
}
    80001a1c:	00813083          	ld	ra,8(sp)
    80001a20:	00013403          	ld	s0,0(sp)
    80001a24:	01010113          	addi	sp,sp,16
    80001a28:	00008067          	ret

0000000080001a2c <_Z3scsv>:

uint64 scs() {
    80001a2c:	fe010113          	addi	sp,sp,-32
    80001a30:	00813c23          	sd	s0,24(sp)
    80001a34:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
}

inline uint64 Riscv::r_stvec() {
    uint64 volatile stvec;
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    80001a38:	105027f3          	csrr	a5,stvec
    80001a3c:	fef43023          	sd	a5,-32(s0)
    return stvec;
    80001a40:	fe043783          	ld	a5,-32(s0)
    int volatile ret;
    Riscv::r_stvec();
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001a44:	00050793          	mv	a5,a0
    80001a48:	fef42623          	sw	a5,-20(s0)
    return ret;
    80001a4c:	fec42503          	lw	a0,-20(s0)
}
    80001a50:	0005051b          	sext.w	a0,a0
    80001a54:	01813403          	ld	s0,24(sp)
    80001a58:	02010113          	addi	sp,sp,32
    80001a5c:	00008067          	ret

0000000080001a60 <_ZN3stm6strlenEPKc>:
#include "../h/string.hpp"
#include "../h/c_memory.hpp"
#include "../h/iostream.hpp"

int stm::strlen(const char *string) {
    80001a60:	ff010113          	addi	sp,sp,-16
    80001a64:	00813423          	sd	s0,8(sp)
    80001a68:	01010413          	addi	s0,sp,16
    80001a6c:	00050713          	mv	a4,a0
    int size;
    for (size = 0; string[size]; size++);
    80001a70:	00000513          	li	a0,0
    80001a74:	00a707b3          	add	a5,a4,a0
    80001a78:	0007c783          	lbu	a5,0(a5)
    80001a7c:	00078663          	beqz	a5,80001a88 <_ZN3stm6strlenEPKc+0x28>
    80001a80:	0015051b          	addiw	a0,a0,1
    80001a84:	ff1ff06f          	j	80001a74 <_ZN3stm6strlenEPKc+0x14>
    return size;
}
    80001a88:	00813403          	ld	s0,8(sp)
    80001a8c:	01010113          	addi	sp,sp,16
    80001a90:	00008067          	ret

0000000080001a94 <_ZN3stm6strcpyEPKcPc>:

char *stm::strcpy(const char *const src, char *const dst) {
    80001a94:	fe010113          	addi	sp,sp,-32
    80001a98:	00113c23          	sd	ra,24(sp)
    80001a9c:	00813823          	sd	s0,16(sp)
    80001aa0:	00913423          	sd	s1,8(sp)
    80001aa4:	01213023          	sd	s2,0(sp)
    80001aa8:	02010413          	addi	s0,sp,32
    80001aac:	00050913          	mv	s2,a0
    80001ab0:	00058493          	mv	s1,a1
    memcpy(src, dst, strlen(src) + 1);
    80001ab4:	00000097          	auipc	ra,0x0
    80001ab8:	fac080e7          	jalr	-84(ra) # 80001a60 <_ZN3stm6strlenEPKc>
    80001abc:	0015061b          	addiw	a2,a0,1
    80001ac0:	00048593          	mv	a1,s1
    80001ac4:	00090513          	mv	a0,s2
    80001ac8:	00001097          	auipc	ra,0x1
    80001acc:	7c8080e7          	jalr	1992(ra) # 80003290 <_Z6memcpyPKvS0_i>
    return dst;
}
    80001ad0:	00048513          	mv	a0,s1
    80001ad4:	01813083          	ld	ra,24(sp)
    80001ad8:	01013403          	ld	s0,16(sp)
    80001adc:	00813483          	ld	s1,8(sp)
    80001ae0:	00013903          	ld	s2,0(sp)
    80001ae4:	02010113          	addi	sp,sp,32
    80001ae8:	00008067          	ret

0000000080001aec <_ZN3stm7strncpyEPcS0_i>:

void stm::strncpy(char *const src, char *const dst, int max_len) {
    80001aec:	fd010113          	addi	sp,sp,-48
    80001af0:	02113423          	sd	ra,40(sp)
    80001af4:	02813023          	sd	s0,32(sp)
    80001af8:	00913c23          	sd	s1,24(sp)
    80001afc:	01213823          	sd	s2,16(sp)
    80001b00:	01313423          	sd	s3,8(sp)
    80001b04:	01413023          	sd	s4,0(sp)
    80001b08:	03010413          	addi	s0,sp,48
    80001b0c:	00050913          	mv	s2,a0
    80001b10:	00058993          	mv	s3,a1
    80001b14:	00060a13          	mv	s4,a2
    for (int i = 0; i < strlen(src) + 1; i++) {
    80001b18:	00000493          	li	s1,0
    80001b1c:	00090513          	mv	a0,s2
    80001b20:	00000097          	auipc	ra,0x0
    80001b24:	f40080e7          	jalr	-192(ra) # 80001a60 <_ZN3stm6strlenEPKc>
    80001b28:	02954463          	blt	a0,s1,80001b50 <_ZN3stm7strncpyEPcS0_i+0x64>
        if (i >= max_len) {
    80001b2c:	0144de63          	bge	s1,s4,80001b48 <_ZN3stm7strncpyEPcS0_i+0x5c>
            dst[i] = '\0';
            return;
        }
        dst[i] = src[i];
    80001b30:	009987b3          	add	a5,s3,s1
    80001b34:	00990733          	add	a4,s2,s1
    80001b38:	00074703          	lbu	a4,0(a4)
    80001b3c:	00e78023          	sb	a4,0(a5)
    for (int i = 0; i < strlen(src) + 1; i++) {
    80001b40:	0014849b          	addiw	s1,s1,1
    80001b44:	fd9ff06f          	j	80001b1c <_ZN3stm7strncpyEPcS0_i+0x30>
            dst[i] = '\0';
    80001b48:	009984b3          	add	s1,s3,s1
    80001b4c:	00048023          	sb	zero,0(s1)
    }
}
    80001b50:	02813083          	ld	ra,40(sp)
    80001b54:	02013403          	ld	s0,32(sp)
    80001b58:	01813483          	ld	s1,24(sp)
    80001b5c:	01013903          	ld	s2,16(sp)
    80001b60:	00813983          	ld	s3,8(sp)
    80001b64:	00013a03          	ld	s4,0(sp)
    80001b68:	03010113          	addi	sp,sp,48
    80001b6c:	00008067          	ret

0000000080001b70 <_ZN3stm6strcatEPKcS1_>:

char *stm::strcat(const char *const base, const char *const tail) {
    80001b70:	fd010113          	addi	sp,sp,-48
    80001b74:	02113423          	sd	ra,40(sp)
    80001b78:	02813023          	sd	s0,32(sp)
    80001b7c:	00913c23          	sd	s1,24(sp)
    80001b80:	01213823          	sd	s2,16(sp)
    80001b84:	01313423          	sd	s3,8(sp)
    80001b88:	01413023          	sd	s4,0(sp)
    80001b8c:	03010413          	addi	s0,sp,48
    80001b90:	00050a13          	mv	s4,a0
    80001b94:	00058913          	mv	s2,a1
    int base_len = strlen(base);
    80001b98:	00000097          	auipc	ra,0x0
    80001b9c:	ec8080e7          	jalr	-312(ra) # 80001a60 <_ZN3stm6strlenEPKc>
    80001ba0:	00050993          	mv	s3,a0
    char *new_base = new char[base_len + strlen(tail) + 1];
    80001ba4:	00090513          	mv	a0,s2
    80001ba8:	00000097          	auipc	ra,0x0
    80001bac:	eb8080e7          	jalr	-328(ra) # 80001a60 <_ZN3stm6strlenEPKc>
    80001bb0:	0135053b          	addw	a0,a0,s3
    80001bb4:	0015051b          	addiw	a0,a0,1
    80001bb8:	00002097          	auipc	ra,0x2
    80001bbc:	cd8080e7          	jalr	-808(ra) # 80003890 <_Znam>
    80001bc0:	00050493          	mv	s1,a0
    strcpy(base, new_base);
    80001bc4:	00050593          	mv	a1,a0
    80001bc8:	000a0513          	mv	a0,s4
    80001bcc:	00000097          	auipc	ra,0x0
    80001bd0:	ec8080e7          	jalr	-312(ra) # 80001a94 <_ZN3stm6strcpyEPKcPc>
    strcpy(tail, &new_base[base_len]);
    80001bd4:	013485b3          	add	a1,s1,s3
    80001bd8:	00090513          	mv	a0,s2
    80001bdc:	00000097          	auipc	ra,0x0
    80001be0:	eb8080e7          	jalr	-328(ra) # 80001a94 <_ZN3stm6strcpyEPKcPc>
    return new_base;
}
    80001be4:	00048513          	mv	a0,s1
    80001be8:	02813083          	ld	ra,40(sp)
    80001bec:	02013403          	ld	s0,32(sp)
    80001bf0:	01813483          	ld	s1,24(sp)
    80001bf4:	01013903          	ld	s2,16(sp)
    80001bf8:	00813983          	ld	s3,8(sp)
    80001bfc:	00013a03          	ld	s4,0(sp)
    80001c00:	03010113          	addi	sp,sp,48
    80001c04:	00008067          	ret

0000000080001c08 <_ZN3stm6strcmpEPKcS1_>:

int stm::strcmp(const char *str1, const char *str2) { //negative means str1 < str2 (a < b) (a < aa)
    80001c08:	ff010113          	addi	sp,sp,-16
    80001c0c:	00813423          	sd	s0,8(sp)
    80001c10:	01010413          	addi	s0,sp,16
    80001c14:	00050613          	mv	a2,a0
    int i;
    for (i = 0; str1[i] && str2[i]; i++) {
    80001c18:	00000793          	li	a5,0
    80001c1c:	0080006f          	j	80001c24 <_ZN3stm6strcmpEPKcS1_+0x1c>
    80001c20:	0017879b          	addiw	a5,a5,1
    80001c24:	00078513          	mv	a0,a5
    80001c28:	00f60733          	add	a4,a2,a5
    80001c2c:	00074703          	lbu	a4,0(a4)
    80001c30:	00070e63          	beqz	a4,80001c4c <_ZN3stm6strcmpEPKcS1_+0x44>
    80001c34:	00f586b3          	add	a3,a1,a5
    80001c38:	0006c683          	lbu	a3,0(a3)
    80001c3c:	00068863          	beqz	a3,80001c4c <_ZN3stm6strcmpEPKcS1_+0x44>
        int difference = str1[i] - str2[i];
    80001c40:	40d7053b          	subw	a0,a4,a3
        if (difference) return difference;
    80001c44:	fcd70ee3          	beq	a4,a3,80001c20 <_ZN3stm6strcmpEPKcS1_+0x18>
    80001c48:	01c0006f          	j	80001c64 <_ZN3stm6strcmpEPKcS1_+0x5c>
    }
    if (!str1[i] && !str2[i]) return 0;
    80001c4c:	00071863          	bnez	a4,80001c5c <_ZN3stm6strcmpEPKcS1_+0x54>
    80001c50:	00a585b3          	add	a1,a1,a0
    80001c54:	0005c783          	lbu	a5,0(a1)
    80001c58:	00078c63          	beqz	a5,80001c70 <_ZN3stm6strcmpEPKcS1_+0x68>
    else if (str1[i]) return 1;
    80001c5c:	00070e63          	beqz	a4,80001c78 <_ZN3stm6strcmpEPKcS1_+0x70>
    80001c60:	00100513          	li	a0,1
    else return -1;
}
    80001c64:	00813403          	ld	s0,8(sp)
    80001c68:	01010113          	addi	sp,sp,16
    80001c6c:	00008067          	ret
    if (!str1[i] && !str2[i]) return 0;
    80001c70:	00000513          	li	a0,0
    80001c74:	ff1ff06f          	j	80001c64 <_ZN3stm6strcmpEPKcS1_+0x5c>
    else return -1;
    80001c78:	fff00513          	li	a0,-1
    80001c7c:	fe9ff06f          	j	80001c64 <_ZN3stm6strcmpEPKcS1_+0x5c>

0000000080001c80 <_ZN3stm4ntosExPci>:

char *stm::ntos(long long number, char *buffer, int radix) {
    80001c80:	f7010113          	addi	sp,sp,-144
    80001c84:	08113423          	sd	ra,136(sp)
    80001c88:	08813023          	sd	s0,128(sp)
    80001c8c:	06913c23          	sd	s1,120(sp)
    80001c90:	09010413          	addi	s0,sp,144
    80001c94:	00058493          	mv	s1,a1
    if (radix < 2 || radix > 16) {
    80001c98:	ffe6071b          	addiw	a4,a2,-2
    80001c9c:	00e00793          	li	a5,14
    80001ca0:	06e7ec63          	bltu	a5,a4,80001d18 <_ZN3stm4ntosExPci+0x98>
        buffer[0] = 0;
        return buffer;
    }
    if (number == 0) {
    80001ca4:	06050e63          	beqz	a0,80001d20 <_ZN3stm4ntosExPci+0xa0>
        buffer[0] = '0';
        buffer[1] = 0;
        return buffer;
    }
    char digits[100] = {};
    80001ca8:	f6043c23          	sd	zero,-136(s0)
    80001cac:	f8043023          	sd	zero,-128(s0)
    80001cb0:	f8043423          	sd	zero,-120(s0)
    80001cb4:	f8043823          	sd	zero,-112(s0)
    80001cb8:	f8043c23          	sd	zero,-104(s0)
    80001cbc:	fa043023          	sd	zero,-96(s0)
    80001cc0:	fa043423          	sd	zero,-88(s0)
    80001cc4:	fa043823          	sd	zero,-80(s0)
    80001cc8:	fa043c23          	sd	zero,-72(s0)
    80001ccc:	fc043023          	sd	zero,-64(s0)
    80001cd0:	fc043423          	sd	zero,-56(s0)
    80001cd4:	fc043823          	sd	zero,-48(s0)
    80001cd8:	fc042c23          	sw	zero,-40(s0)
    int i = 98;
    bool negative = number < 0;
    if (negative) number = -number;
    80001cdc:	04054a63          	bltz	a0,80001d30 <_ZN3stm4ntosExPci+0xb0>
    80001ce0:	00050793          	mv	a5,a0
    80001ce4:	06200693          	li	a3,98
    const char *av = "0123456789ABCDEF";
    while (number > 0) {
    80001ce8:	04f05863          	blez	a5,80001d38 <_ZN3stm4ntosExPci+0xb8>
        digits[i--] = av[(number % radix)];
    80001cec:	02c7e733          	rem	a4,a5,a2
    80001cf0:	00005817          	auipc	a6,0x5
    80001cf4:	33080813          	addi	a6,a6,816 # 80007020 <CONSOLE_STATUS+0x10>
    80001cf8:	01070733          	add	a4,a4,a6
    80001cfc:	00074803          	lbu	a6,0(a4)
    80001d00:	fe040713          	addi	a4,s0,-32
    80001d04:	00d70733          	add	a4,a4,a3
    80001d08:	f9070c23          	sb	a6,-104(a4)
        number /= radix;
    80001d0c:	02c7c7b3          	div	a5,a5,a2
        digits[i--] = av[(number % radix)];
    80001d10:	fff6869b          	addiw	a3,a3,-1
    while (number > 0) {
    80001d14:	fd5ff06f          	j	80001ce8 <_ZN3stm4ntosExPci+0x68>
        buffer[0] = 0;
    80001d18:	00058023          	sb	zero,0(a1)
        return buffer;
    80001d1c:	0380006f          	j	80001d54 <_ZN3stm4ntosExPci+0xd4>
        buffer[0] = '0';
    80001d20:	03000793          	li	a5,48
    80001d24:	00f58023          	sb	a5,0(a1)
        buffer[1] = 0;
    80001d28:	000580a3          	sb	zero,1(a1)
        return buffer;
    80001d2c:	0280006f          	j	80001d54 <_ZN3stm4ntosExPci+0xd4>
    if (negative) number = -number;
    80001d30:	40a007b3          	neg	a5,a0
    80001d34:	fb1ff06f          	j	80001ce4 <_ZN3stm4ntosExPci+0x64>
    }
    if (negative) digits[i--] = '-';
    80001d38:	02054a63          	bltz	a0,80001d6c <_ZN3stm4ntosExPci+0xec>
    strcpy(&digits[++i], buffer);
    80001d3c:	0016869b          	addiw	a3,a3,1
    80001d40:	00048593          	mv	a1,s1
    80001d44:	f7840513          	addi	a0,s0,-136
    80001d48:	00d50533          	add	a0,a0,a3
    80001d4c:	00000097          	auipc	ra,0x0
    80001d50:	d48080e7          	jalr	-696(ra) # 80001a94 <_ZN3stm6strcpyEPKcPc>
    return buffer;
}
    80001d54:	00048513          	mv	a0,s1
    80001d58:	08813083          	ld	ra,136(sp)
    80001d5c:	08013403          	ld	s0,128(sp)
    80001d60:	07813483          	ld	s1,120(sp)
    80001d64:	09010113          	addi	sp,sp,144
    80001d68:	00008067          	ret
    if (negative) digits[i--] = '-';
    80001d6c:	fe040793          	addi	a5,s0,-32
    80001d70:	00d787b3          	add	a5,a5,a3
    80001d74:	02d00713          	li	a4,45
    80001d78:	f8e78c23          	sb	a4,-104(a5)
    80001d7c:	fff6869b          	addiw	a3,a3,-1
    80001d80:	fbdff06f          	j	80001d3c <_ZN3stm4ntosExPci+0xbc>

0000000080001d84 <_ZN3stm4utosEmPci>:

char *stm::utos(uint64 number, char *buffer, int radix) {
    80001d84:	f7010113          	addi	sp,sp,-144
    80001d88:	08113423          	sd	ra,136(sp)
    80001d8c:	08813023          	sd	s0,128(sp)
    80001d90:	06913c23          	sd	s1,120(sp)
    80001d94:	09010413          	addi	s0,sp,144
    80001d98:	00058493          	mv	s1,a1
    if (radix < 2 || radix > 16) {
    80001d9c:	ffe6071b          	addiw	a4,a2,-2
    80001da0:	00e00793          	li	a5,14
    80001da4:	04e7e263          	bltu	a5,a4,80001de8 <_ZN3stm4utosEmPci+0x64>
        buffer[0] = 0;
        return buffer;
    }
    if (number == 0) {
    80001da8:	04050463          	beqz	a0,80001df0 <_ZN3stm4utosEmPci+0x6c>
        buffer[0] = '0';
        buffer[1] = 0;
        return buffer;
    }
    char digits[100] = {};
    80001dac:	f6043c23          	sd	zero,-136(s0)
    80001db0:	f8043023          	sd	zero,-128(s0)
    80001db4:	f8043423          	sd	zero,-120(s0)
    80001db8:	f8043823          	sd	zero,-112(s0)
    80001dbc:	f8043c23          	sd	zero,-104(s0)
    80001dc0:	fa043023          	sd	zero,-96(s0)
    80001dc4:	fa043423          	sd	zero,-88(s0)
    80001dc8:	fa043823          	sd	zero,-80(s0)
    80001dcc:	fa043c23          	sd	zero,-72(s0)
    80001dd0:	fc043023          	sd	zero,-64(s0)
    80001dd4:	fc043423          	sd	zero,-56(s0)
    80001dd8:	fc043823          	sd	zero,-48(s0)
    80001ddc:	fc042c23          	sw	zero,-40(s0)
    int i = 98;
    80001de0:	06200713          	li	a4,98
    80001de4:	0440006f          	j	80001e28 <_ZN3stm4utosEmPci+0xa4>
        buffer[0] = 0;
    80001de8:	00058023          	sb	zero,0(a1)
        return buffer;
    80001dec:	0580006f          	j	80001e44 <_ZN3stm4utosEmPci+0xc0>
        buffer[0] = '0';
    80001df0:	03000793          	li	a5,48
    80001df4:	00f58023          	sb	a5,0(a1)
        buffer[1] = 0;
    80001df8:	000580a3          	sb	zero,1(a1)
        return buffer;
    80001dfc:	0480006f          	j	80001e44 <_ZN3stm4utosEmPci+0xc0>
    const char *av = "0123456789ABCDEF";
    while (number > 0) {
        digits[i--] = av[(number % radix)];
    80001e00:	02c577b3          	remu	a5,a0,a2
    80001e04:	00005697          	auipc	a3,0x5
    80001e08:	21c68693          	addi	a3,a3,540 # 80007020 <CONSOLE_STATUS+0x10>
    80001e0c:	00d787b3          	add	a5,a5,a3
    80001e10:	0007c683          	lbu	a3,0(a5)
    80001e14:	fe040793          	addi	a5,s0,-32
    80001e18:	00e787b3          	add	a5,a5,a4
    80001e1c:	f8d78c23          	sb	a3,-104(a5)
        number /= radix;
    80001e20:	02c55533          	divu	a0,a0,a2
        digits[i--] = av[(number % radix)];
    80001e24:	fff7071b          	addiw	a4,a4,-1
    while (number > 0) {
    80001e28:	fc051ce3          	bnez	a0,80001e00 <_ZN3stm4utosEmPci+0x7c>
    }
    strcpy(&digits[++i], buffer);
    80001e2c:	0017071b          	addiw	a4,a4,1
    80001e30:	00048593          	mv	a1,s1
    80001e34:	f7840513          	addi	a0,s0,-136
    80001e38:	00e50533          	add	a0,a0,a4
    80001e3c:	00000097          	auipc	ra,0x0
    80001e40:	c58080e7          	jalr	-936(ra) # 80001a94 <_ZN3stm6strcpyEPKcPc>
    return buffer;
}
    80001e44:	00048513          	mv	a0,s1
    80001e48:	08813083          	ld	ra,136(sp)
    80001e4c:	08013403          	ld	s0,128(sp)
    80001e50:	07813483          	ld	s1,120(sp)
    80001e54:	09010113          	addi	sp,sp,144
    80001e58:	00008067          	ret

0000000080001e5c <_ZN3stm6String4copyERKS0_>:

void stm::String::copy(const stm::String &string) {
    80001e5c:	fe010113          	addi	sp,sp,-32
    80001e60:	00113c23          	sd	ra,24(sp)
    80001e64:	00813823          	sd	s0,16(sp)
    80001e68:	00913423          	sd	s1,8(sp)
    80001e6c:	01213023          	sd	s2,0(sp)
    80001e70:	02010413          	addi	s0,sp,32
    80001e74:	00050493          	mv	s1,a0
    80001e78:	00058913          	mv	s2,a1
    cout << 101;
    80001e7c:	06500593          	li	a1,101
    80001e80:	00007517          	auipc	a0,0x7
    80001e84:	3f053503          	ld	a0,1008(a0) # 80009270 <_GLOBAL_OFFSET_TABLE_+0x90>
    80001e88:	00001097          	auipc	ra,0x1
    80001e8c:	530080e7          	jalr	1328(ra) # 800033b8 <_ZNK3stm7istreamlsEi>
    this->size = string.size;
    80001e90:	00092503          	lw	a0,0(s2)
    80001e94:	00a4a023          	sw	a0,0(s1)
    this->actual_string = this->size > String::SMALL_SIZE ? new char[this->size] : this->small_string;
    80001e98:	01e00793          	li	a5,30
    80001e9c:	02a7c863          	blt	a5,a0,80001ecc <_ZN3stm6String4copyERKS0_+0x70>
    80001ea0:	01048593          	addi	a1,s1,16
    80001ea4:	00b4b423          	sd	a1,8(s1)
    strcpy(string.actual_string, this->actual_string);
    80001ea8:	00893503          	ld	a0,8(s2)
    80001eac:	00000097          	auipc	ra,0x0
    80001eb0:	be8080e7          	jalr	-1048(ra) # 80001a94 <_ZN3stm6strcpyEPKcPc>
}
    80001eb4:	01813083          	ld	ra,24(sp)
    80001eb8:	01013403          	ld	s0,16(sp)
    80001ebc:	00813483          	ld	s1,8(sp)
    80001ec0:	00013903          	ld	s2,0(sp)
    80001ec4:	02010113          	addi	sp,sp,32
    80001ec8:	00008067          	ret
    this->actual_string = this->size > String::SMALL_SIZE ? new char[this->size] : this->small_string;
    80001ecc:	00002097          	auipc	ra,0x2
    80001ed0:	9c4080e7          	jalr	-1596(ra) # 80003890 <_Znam>
    80001ed4:	00050593          	mv	a1,a0
    80001ed8:	fcdff06f          	j	80001ea4 <_ZN3stm6String4copyERKS0_+0x48>

0000000080001edc <_ZN3stm6String4moveERS0_>:

void stm::String::move(stm::String &string) {
    80001edc:	fe010113          	addi	sp,sp,-32
    80001ee0:	00113c23          	sd	ra,24(sp)
    80001ee4:	00813823          	sd	s0,16(sp)
    80001ee8:	00913423          	sd	s1,8(sp)
    80001eec:	01213023          	sd	s2,0(sp)
    80001ef0:	02010413          	addi	s0,sp,32
    80001ef4:	00050913          	mv	s2,a0
    80001ef8:	00058493          	mv	s1,a1
    this->size = string.size;
    80001efc:	0005a783          	lw	a5,0(a1)
    80001f00:	00f52023          	sw	a5,0(a0)
    if(this->size > String::SMALL_SIZE)
    80001f04:	01e00713          	li	a4,30
    80001f08:	02f75463          	bge	a4,a5,80001f30 <_ZN3stm6String4moveERS0_+0x54>
        this->actual_string = string.actual_string;
    80001f0c:	0085b783          	ld	a5,8(a1)
    80001f10:	00f53423          	sd	a5,8(a0)
    else
        this->actual_string = strcpy(string.actual_string, this->small_string);
    string.actual_string = nullptr;
    80001f14:	0004b423          	sd	zero,8(s1)
}
    80001f18:	01813083          	ld	ra,24(sp)
    80001f1c:	01013403          	ld	s0,16(sp)
    80001f20:	00813483          	ld	s1,8(sp)
    80001f24:	00013903          	ld	s2,0(sp)
    80001f28:	02010113          	addi	sp,sp,32
    80001f2c:	00008067          	ret
        this->actual_string = strcpy(string.actual_string, this->small_string);
    80001f30:	01050593          	addi	a1,a0,16
    80001f34:	0084b503          	ld	a0,8(s1)
    80001f38:	00000097          	auipc	ra,0x0
    80001f3c:	b5c080e7          	jalr	-1188(ra) # 80001a94 <_ZN3stm6strcpyEPKcPc>
    80001f40:	00a93423          	sd	a0,8(s2)
    80001f44:	fd1ff06f          	j	80001f14 <_ZN3stm6String4moveERS0_+0x38>

0000000080001f48 <_ZN3stm6StringC1Ec>:
    this->size = strlen(string);
    this->actual_string = new char[this->size + 1];
    strcpy(string, this->actual_string);
}

stm::String::String(char c) {
    80001f48:	ff010113          	addi	sp,sp,-16
    80001f4c:	00813423          	sd	s0,8(sp)
    80001f50:	01010413          	addi	s0,sp,16
    this->size = 1;
    80001f54:	00100793          	li	a5,1
    80001f58:	00f52023          	sw	a5,0(a0)
    this->actual_string = this->small_string;
    80001f5c:	01050793          	addi	a5,a0,16
    80001f60:	00f53423          	sd	a5,8(a0)
    this->actual_string[0] = c;
    80001f64:	00b50823          	sb	a1,16(a0)
    this->actual_string[1] = 0;
    80001f68:	000508a3          	sb	zero,17(a0)
}
    80001f6c:	00813403          	ld	s0,8(sp)
    80001f70:	01010113          	addi	sp,sp,16
    80001f74:	00008067          	ret

0000000080001f78 <_ZN3stm6StringC1Ex>:

stm::String::String(long long number) {
    80001f78:	fe010113          	addi	sp,sp,-32
    80001f7c:	00113c23          	sd	ra,24(sp)
    80001f80:	00813823          	sd	s0,16(sp)
    80001f84:	00913423          	sd	s1,8(sp)
    80001f88:	02010413          	addi	s0,sp,32
    80001f8c:	00050493          	mv	s1,a0
    80001f90:	00058513          	mv	a0,a1
    this->actual_string = ntos(number, this->small_string, 10);
    80001f94:	00a00613          	li	a2,10
    80001f98:	01048593          	addi	a1,s1,16
    80001f9c:	00000097          	auipc	ra,0x0
    80001fa0:	ce4080e7          	jalr	-796(ra) # 80001c80 <_ZN3stm4ntosExPci>
    80001fa4:	00a4b423          	sd	a0,8(s1)
    this->size = strlen(this->actual_string);
    80001fa8:	00000097          	auipc	ra,0x0
    80001fac:	ab8080e7          	jalr	-1352(ra) # 80001a60 <_ZN3stm6strlenEPKc>
    80001fb0:	00a4a023          	sw	a0,0(s1)
}
    80001fb4:	01813083          	ld	ra,24(sp)
    80001fb8:	01013403          	ld	s0,16(sp)
    80001fbc:	00813483          	ld	s1,8(sp)
    80001fc0:	02010113          	addi	sp,sp,32
    80001fc4:	00008067          	ret

0000000080001fc8 <_ZN3stm6StringC1Ei>:

stm::String::String(int number) : String((long long) number) {}
    80001fc8:	ff010113          	addi	sp,sp,-16
    80001fcc:	00113423          	sd	ra,8(sp)
    80001fd0:	00813023          	sd	s0,0(sp)
    80001fd4:	01010413          	addi	s0,sp,16
    80001fd8:	00000097          	auipc	ra,0x0
    80001fdc:	fa0080e7          	jalr	-96(ra) # 80001f78 <_ZN3stm6StringC1Ex>
    80001fe0:	00813083          	ld	ra,8(sp)
    80001fe4:	00013403          	ld	s0,0(sp)
    80001fe8:	01010113          	addi	sp,sp,16
    80001fec:	00008067          	ret

0000000080001ff0 <_ZN3stm6StringC1Em>:

stm::String::String(uint64 number) {
    80001ff0:	fe010113          	addi	sp,sp,-32
    80001ff4:	00113c23          	sd	ra,24(sp)
    80001ff8:	00813823          	sd	s0,16(sp)
    80001ffc:	00913423          	sd	s1,8(sp)
    80002000:	02010413          	addi	s0,sp,32
    80002004:	00050493          	mv	s1,a0
    80002008:	00058513          	mv	a0,a1
    this->actual_string = utos(number, this->small_string, 10);
    8000200c:	00a00613          	li	a2,10
    80002010:	01048593          	addi	a1,s1,16
    80002014:	00000097          	auipc	ra,0x0
    80002018:	d70080e7          	jalr	-656(ra) # 80001d84 <_ZN3stm4utosEmPci>
    8000201c:	00a4b423          	sd	a0,8(s1)
    this->size = strlen(this->actual_string);
    80002020:	00000097          	auipc	ra,0x0
    80002024:	a40080e7          	jalr	-1472(ra) # 80001a60 <_ZN3stm6strlenEPKc>
    80002028:	00a4a023          	sw	a0,0(s1)
}
    8000202c:	01813083          	ld	ra,24(sp)
    80002030:	01013403          	ld	s0,16(sp)
    80002034:	00813483          	ld	s1,8(sp)
    80002038:	02010113          	addi	sp,sp,32
    8000203c:	00008067          	ret

0000000080002040 <_ZN3stm6StringaSERKS0_>:

stm::String &stm::String::operator=(const stm::String &string) {
    80002040:	fe010113          	addi	sp,sp,-32
    80002044:	00113c23          	sd	ra,24(sp)
    80002048:	00813823          	sd	s0,16(sp)
    8000204c:	00913423          	sd	s1,8(sp)
    80002050:	01213023          	sd	s2,0(sp)
    80002054:	02010413          	addi	s0,sp,32
    80002058:	00050493          	mv	s1,a0
    if (this == &string) return *this;
    8000205c:	02b50463          	beq	a0,a1,80002084 <_ZN3stm6StringaSERKS0_+0x44>
    80002060:	00058913          	mv	s2,a1
    private:
        void copy(const String &);

        void move(String &);

        void unexist() { delete[] this->actual_string; }
    80002064:	00853503          	ld	a0,8(a0)
    80002068:	00050663          	beqz	a0,80002074 <_ZN3stm6StringaSERKS0_+0x34>
    8000206c:	00002097          	auipc	ra,0x2
    80002070:	8f4080e7          	jalr	-1804(ra) # 80003960 <_ZdaPv>
    this->unexist();
    this->copy(string);
    80002074:	00090593          	mv	a1,s2
    80002078:	00048513          	mv	a0,s1
    8000207c:	00000097          	auipc	ra,0x0
    80002080:	de0080e7          	jalr	-544(ra) # 80001e5c <_ZN3stm6String4copyERKS0_>
    return *this;
}
    80002084:	00048513          	mv	a0,s1
    80002088:	01813083          	ld	ra,24(sp)
    8000208c:	01013403          	ld	s0,16(sp)
    80002090:	00813483          	ld	s1,8(sp)
    80002094:	00013903          	ld	s2,0(sp)
    80002098:	02010113          	addi	sp,sp,32
    8000209c:	00008067          	ret

00000000800020a0 <_ZN3stm6StringaSEOS0_>:

stm::String &stm::String::operator=(stm::String &&string) noexcept {
    800020a0:	fe010113          	addi	sp,sp,-32
    800020a4:	00113c23          	sd	ra,24(sp)
    800020a8:	00813823          	sd	s0,16(sp)
    800020ac:	00913423          	sd	s1,8(sp)
    800020b0:	01213023          	sd	s2,0(sp)
    800020b4:	02010413          	addi	s0,sp,32
    800020b8:	00050493          	mv	s1,a0
    if (this == &string) return *this;
    800020bc:	02b50463          	beq	a0,a1,800020e4 <_ZN3stm6StringaSEOS0_+0x44>
    800020c0:	00058913          	mv	s2,a1
    800020c4:	00853503          	ld	a0,8(a0)
    800020c8:	00050663          	beqz	a0,800020d4 <_ZN3stm6StringaSEOS0_+0x34>
    800020cc:	00002097          	auipc	ra,0x2
    800020d0:	894080e7          	jalr	-1900(ra) # 80003960 <_ZdaPv>
    this->unexist();
    this->move(string);
    800020d4:	00090593          	mv	a1,s2
    800020d8:	00048513          	mv	a0,s1
    800020dc:	00000097          	auipc	ra,0x0
    800020e0:	e00080e7          	jalr	-512(ra) # 80001edc <_ZN3stm6String4moveERS0_>
    return *this;
}
    800020e4:	00048513          	mv	a0,s1
    800020e8:	01813083          	ld	ra,24(sp)
    800020ec:	01013403          	ld	s0,16(sp)
    800020f0:	00813483          	ld	s1,8(sp)
    800020f4:	00013903          	ld	s2,0(sp)
    800020f8:	02010113          	addi	sp,sp,32
    800020fc:	00008067          	ret

0000000080002100 <_ZN3stm6String15write_and_countEPKcPci>:

inline bool stm::operator<(const stm::String &string1, const stm::String &string2) {
    return stm::strcmp(string1.actual_string, string2.actual_string) < 0;
}

int stm::String::write_and_count(const char *src, char *dst, int n) {
    80002100:	ff010113          	addi	sp,sp,-16
    80002104:	00813423          	sd	s0,8(sp)
    80002108:	01010413          	addi	s0,sp,16
    8000210c:	00050693          	mv	a3,a0
    int i;
    for (i = 0; src[i]; i++) {
    80002110:	00000513          	li	a0,0
    80002114:	00a68733          	add	a4,a3,a0
    80002118:	00074703          	lbu	a4,0(a4)
    8000211c:	00070c63          	beqz	a4,80002134 <_ZN3stm6String15write_and_countEPKcPci+0x34>
        if (i >= n) return -1;
    80002120:	02c55463          	bge	a0,a2,80002148 <_ZN3stm6String15write_and_countEPKcPci+0x48>
        dst[i] = src[i];
    80002124:	00a587b3          	add	a5,a1,a0
    80002128:	00e78023          	sb	a4,0(a5)
    for (i = 0; src[i]; i++) {
    8000212c:	0015051b          	addiw	a0,a0,1
    80002130:	fe5ff06f          	j	80002114 <_ZN3stm6String15write_and_countEPKcPci+0x14>
    }
    dst[i] = src[i];
    80002134:	00a587b3          	add	a5,a1,a0
    80002138:	00e78023          	sb	a4,0(a5)
    return i;
    8000213c:	00813403          	ld	s0,8(sp)
    80002140:	01010113          	addi	sp,sp,16
    80002144:	00008067          	ret
        if (i >= n) return -1;
    80002148:	fff00513          	li	a0,-1
    8000214c:	ff1ff06f          	j	8000213c <_ZN3stm6String15write_and_countEPKcPci+0x3c>

0000000080002150 <_ZN3stm6StringC1EPKc>:
stm::String::String(const char *string) {
    80002150:	fd010113          	addi	sp,sp,-48
    80002154:	02113423          	sd	ra,40(sp)
    80002158:	02813023          	sd	s0,32(sp)
    8000215c:	00913c23          	sd	s1,24(sp)
    80002160:	01213823          	sd	s2,16(sp)
    80002164:	01313423          	sd	s3,8(sp)
    80002168:	03010413          	addi	s0,sp,48
    8000216c:	00050493          	mv	s1,a0
    80002170:	00058913          	mv	s2,a1
    this->size = String::write_and_count(string, this->small_string, SMALL_SIZE);
    80002174:	01050993          	addi	s3,a0,16
    80002178:	01e00613          	li	a2,30
    8000217c:	00098593          	mv	a1,s3
    80002180:	00090513          	mv	a0,s2
    80002184:	00000097          	auipc	ra,0x0
    80002188:	f7c080e7          	jalr	-132(ra) # 80002100 <_ZN3stm6String15write_and_countEPKcPci>
    8000218c:	00a4a023          	sw	a0,0(s1)
    if (this->size != -1) {
    80002190:	fff00793          	li	a5,-1
    80002194:	02f50263          	beq	a0,a5,800021b8 <_ZN3stm6StringC1EPKc+0x68>
        this->actual_string = this->small_string;
    80002198:	0134b423          	sd	s3,8(s1)
}
    8000219c:	02813083          	ld	ra,40(sp)
    800021a0:	02013403          	ld	s0,32(sp)
    800021a4:	01813483          	ld	s1,24(sp)
    800021a8:	01013903          	ld	s2,16(sp)
    800021ac:	00813983          	ld	s3,8(sp)
    800021b0:	03010113          	addi	sp,sp,48
    800021b4:	00008067          	ret
    this->size = strlen(string);
    800021b8:	00090513          	mv	a0,s2
    800021bc:	00000097          	auipc	ra,0x0
    800021c0:	8a4080e7          	jalr	-1884(ra) # 80001a60 <_ZN3stm6strlenEPKc>
    800021c4:	00a4a023          	sw	a0,0(s1)
    this->actual_string = new char[this->size + 1];
    800021c8:	0015051b          	addiw	a0,a0,1
    800021cc:	00001097          	auipc	ra,0x1
    800021d0:	6c4080e7          	jalr	1732(ra) # 80003890 <_Znam>
    800021d4:	00050593          	mv	a1,a0
    800021d8:	00a4b423          	sd	a0,8(s1)
    strcpy(string, this->actual_string);
    800021dc:	00090513          	mv	a0,s2
    800021e0:	00000097          	auipc	ra,0x0
    800021e4:	8b4080e7          	jalr	-1868(ra) # 80001a94 <_ZN3stm6strcpyEPKcPc>
    800021e8:	fb5ff06f          	j	8000219c <_ZN3stm6StringC1EPKc+0x4c>

00000000800021ec <_ZN3stmplERKNS_6StringES2_>:
stm::String &stm::operator+(const stm::String &string1, const stm::String &string2) {
    800021ec:	fe010113          	addi	sp,sp,-32
    800021f0:	00113c23          	sd	ra,24(sp)
    800021f4:	00813823          	sd	s0,16(sp)
    800021f8:	00913423          	sd	s1,8(sp)
    800021fc:	01213023          	sd	s2,0(sp)
    80002200:	02010413          	addi	s0,sp,32
    return *(new stm::String(stm::strcat(string1.actual_string, string2.actual_string)));
    80002204:	0085b583          	ld	a1,8(a1)
    80002208:	00853503          	ld	a0,8(a0)
    8000220c:	00000097          	auipc	ra,0x0
    80002210:	964080e7          	jalr	-1692(ra) # 80001b70 <_ZN3stm6strcatEPKcS1_>
    80002214:	00050913          	mv	s2,a0
    80002218:	03000513          	li	a0,48
    8000221c:	00001097          	auipc	ra,0x1
    80002220:	64c080e7          	jalr	1612(ra) # 80003868 <_Znwm>
    80002224:	00050493          	mv	s1,a0
    80002228:	00090593          	mv	a1,s2
    8000222c:	00000097          	auipc	ra,0x0
    80002230:	f24080e7          	jalr	-220(ra) # 80002150 <_ZN3stm6StringC1EPKc>
    80002234:	0200006f          	j	80002254 <_ZN3stmplERKNS_6StringES2_+0x68>
    80002238:	00050913          	mv	s2,a0
    8000223c:	00048513          	mv	a0,s1
    80002240:	00001097          	auipc	ra,0x1
    80002244:	678080e7          	jalr	1656(ra) # 800038b8 <_ZdlPv>
    80002248:	00090513          	mv	a0,s2
    8000224c:	00008097          	auipc	ra,0x8
    80002250:	20c080e7          	jalr	524(ra) # 8000a458 <_Unwind_Resume>
}
    80002254:	00048513          	mv	a0,s1
    80002258:	01813083          	ld	ra,24(sp)
    8000225c:	01013403          	ld	s0,16(sp)
    80002260:	00813483          	ld	s1,8(sp)
    80002264:	00013903          	ld	s2,0(sp)
    80002268:	02010113          	addi	sp,sp,32
    8000226c:	00008067          	ret

0000000080002270 <_ZN3stm6StringpLERKS0_>:
stm::String &stm::String::operator+=(const stm::String &string) {
    80002270:	fe010113          	addi	sp,sp,-32
    80002274:	00113c23          	sd	ra,24(sp)
    80002278:	00813823          	sd	s0,16(sp)
    8000227c:	00913423          	sd	s1,8(sp)
    80002280:	02010413          	addi	s0,sp,32
    80002284:	00050493          	mv	s1,a0
    *this = *this + string;
    80002288:	00000097          	auipc	ra,0x0
    8000228c:	f64080e7          	jalr	-156(ra) # 800021ec <_ZN3stmplERKNS_6StringES2_>
    80002290:	00050593          	mv	a1,a0
    80002294:	00048513          	mv	a0,s1
    80002298:	00000097          	auipc	ra,0x0
    8000229c:	da8080e7          	jalr	-600(ra) # 80002040 <_ZN3stm6StringaSERKS0_>
}
    800022a0:	00048513          	mv	a0,s1
    800022a4:	01813083          	ld	ra,24(sp)
    800022a8:	01013403          	ld	s0,16(sp)
    800022ac:	00813483          	ld	s1,8(sp)
    800022b0:	02010113          	addi	sp,sp,32
    800022b4:	00008067          	ret

00000000800022b8 <_ZN3Sem9_sem_openEPPS_j>:
#include "../h/c_semaphore.hpp"
#include "../h/c_thread.hpp"
#include "../h/scheduler.hpp"

int Sem::_sem_open(sem_t *handle, unsigned init) {
    800022b8:	fd010113          	addi	sp,sp,-48
    800022bc:	02113423          	sd	ra,40(sp)
    800022c0:	02813023          	sd	s0,32(sp)
    800022c4:	00913c23          	sd	s1,24(sp)
    800022c8:	01213823          	sd	s2,16(sp)
    800022cc:	01313423          	sd	s3,8(sp)
    800022d0:	03010413          	addi	s0,sp,48
    800022d4:	00050913          	mv	s2,a0
    800022d8:	00058993          	mv	s3,a1
    sem_t semaphore = (sem_t) Allocator::_mem_alloc(sizeof(Sem));
    800022dc:	02000513          	li	a0,32
    800022e0:	00001097          	auipc	ra,0x1
    800022e4:	cd8080e7          	jalr	-808(ra) # 80002fb8 <_ZN9Allocator10_mem_allocEm>
    if (!semaphore) {
    800022e8:	02050e63          	beqz	a0,80002324 <_ZN3Sem9_sem_openEPPS_j+0x6c>
    800022ec:	00050493          	mv	s1,a0
        return 1;
    }
    semaphore->count = init;
    800022f0:	01352023          	sw	s3,0(a0)
    semaphore->blocked.init();
    800022f4:	00850513          	addi	a0,a0,8
    800022f8:	00000097          	auipc	ra,0x0
    800022fc:	1b0080e7          	jalr	432(ra) # 800024a8 <_ZN2os14CircularBufferIP3TCBE4initEv>
    *handle = semaphore;
    80002300:	00993023          	sd	s1,0(s2)
    return 0;
    80002304:	00000513          	li	a0,0
}
    80002308:	02813083          	ld	ra,40(sp)
    8000230c:	02013403          	ld	s0,32(sp)
    80002310:	01813483          	ld	s1,24(sp)
    80002314:	01013903          	ld	s2,16(sp)
    80002318:	00813983          	ld	s3,8(sp)
    8000231c:	03010113          	addi	sp,sp,48
    80002320:	00008067          	ret
        return 1;
    80002324:	00100513          	li	a0,1
    80002328:	fe1ff06f          	j	80002308 <_ZN3Sem9_sem_openEPPS_j+0x50>

000000008000232c <_ZN3Sem11_sem_signalEPS_>:
    }
    return ret;
}

int Sem::_sem_signal(sem_t id) {
    if (!id) return 1;
    8000232c:	06050263          	beqz	a0,80002390 <_ZN3Sem11_sem_signalEPS_+0x64>
    80002330:	00050793          	mv	a5,a0

        T get();

        T &peek();

        inline bool is_empty() const { return this->size == 0; }
    80002334:	01852503          	lw	a0,24(a0)
    if (!id->blocked.is_empty()) {
    80002338:	00051a63          	bnez	a0,8000234c <_ZN3Sem11_sem_signalEPS_+0x20>
        thread_t next = id->blocked.get();
        next->run();
        Scheduler::put(next);
        TCB::_thread_dispatch();
    } else {
        id->count++;
    8000233c:	0007a703          	lw	a4,0(a5)
    80002340:	0017071b          	addiw	a4,a4,1
    80002344:	00e7a023          	sw	a4,0(a5)
    80002348:	00008067          	ret
int Sem::_sem_signal(sem_t id) {
    8000234c:	ff010113          	addi	sp,sp,-16
    80002350:	00113423          	sd	ra,8(sp)
    80002354:	00813023          	sd	s0,0(sp)
    80002358:	01010413          	addi	s0,sp,16
        thread_t next = id->blocked.get();
    8000235c:	00878513          	addi	a0,a5,8
    80002360:	00000097          	auipc	ra,0x0
    80002364:	198080e7          	jalr	408(ra) # 800024f8 <_ZN2os14CircularBufferIP3TCBE3getEv>

    bool is_joined() const { return this->status == JOINED; }

    bool is_finished() const { return this->status == FINISHED; }

    void run() { this->status = RUNNABLE; }
    80002368:	04052423          	sw	zero,72(a0)
        Scheduler::put(next);
    8000236c:	00002097          	auipc	ra,0x2
    80002370:	eb4080e7          	jalr	-332(ra) # 80004220 <_ZN9Scheduler3putEP3TCB>
        TCB::_thread_dispatch();
    80002374:	00003097          	auipc	ra,0x3
    80002378:	84c080e7          	jalr	-1972(ra) # 80004bc0 <_ZN3TCB16_thread_dispatchEv>
    }
    return 0;
    8000237c:	00000513          	li	a0,0
    80002380:	00813083          	ld	ra,8(sp)
    80002384:	00013403          	ld	s0,0(sp)
    80002388:	01010113          	addi	sp,sp,16
    8000238c:	00008067          	ret
    if (!id) return 1;
    80002390:	00100513          	li	a0,1
    80002394:	00008067          	ret

0000000080002398 <_ZN3Sem10_sem_closeEPS_>:
int Sem::_sem_close(sem_t id) {
    80002398:	fe010113          	addi	sp,sp,-32
    8000239c:	00113c23          	sd	ra,24(sp)
    800023a0:	00813823          	sd	s0,16(sp)
    800023a4:	00913423          	sd	s1,8(sp)
    800023a8:	02010413          	addi	s0,sp,32
    800023ac:	00050493          	mv	s1,a0
    if (!id) return 1;
    800023b0:	04050a63          	beqz	a0,80002404 <_ZN3Sem10_sem_closeEPS_+0x6c>
    800023b4:	0184a783          	lw	a5,24(s1)
    while (!id->blocked.is_empty()) {
    800023b8:	00078e63          	beqz	a5,800023d4 <_ZN3Sem10_sem_closeEPS_+0x3c>
        thread_t next = id->blocked.get();
    800023bc:	00848513          	addi	a0,s1,8
    800023c0:	00000097          	auipc	ra,0x0
    800023c4:	138080e7          	jalr	312(ra) # 800024f8 <_ZN2os14CircularBufferIP3TCBE3getEv>
        Scheduler::put(next);
    800023c8:	00002097          	auipc	ra,0x2
    800023cc:	e58080e7          	jalr	-424(ra) # 80004220 <_ZN9Scheduler3putEP3TCB>
    while (!id->blocked.is_empty()) {
    800023d0:	fe5ff06f          	j	800023b4 <_ZN3Sem10_sem_closeEPS_+0x1c>
    id->blocked.destroy();
    800023d4:	00848513          	addi	a0,s1,8
    800023d8:	00000097          	auipc	ra,0x0
    800023dc:	16c080e7          	jalr	364(ra) # 80002544 <_ZN2os14CircularBufferIP3TCBE7destroyEv>
    if (Allocator::_mem_free(id)) return 2;
    800023e0:	00048513          	mv	a0,s1
    800023e4:	00001097          	auipc	ra,0x1
    800023e8:	c90080e7          	jalr	-880(ra) # 80003074 <_ZN9Allocator9_mem_freeEPKv>
    800023ec:	02051063          	bnez	a0,8000240c <_ZN3Sem10_sem_closeEPS_+0x74>
}
    800023f0:	01813083          	ld	ra,24(sp)
    800023f4:	01013403          	ld	s0,16(sp)
    800023f8:	00813483          	ld	s1,8(sp)
    800023fc:	02010113          	addi	sp,sp,32
    80002400:	00008067          	ret
    if (!id) return 1;
    80002404:	00100513          	li	a0,1
    80002408:	fe9ff06f          	j	800023f0 <_ZN3Sem10_sem_closeEPS_+0x58>
    if (Allocator::_mem_free(id)) return 2;
    8000240c:	00200513          	li	a0,2
    80002410:	fe1ff06f          	j	800023f0 <_ZN3Sem10_sem_closeEPS_+0x58>

0000000080002414 <_ZN3Sem9_sem_waitEPS_>:
    if (!id) return 1;
    80002414:	08050663          	beqz	a0,800024a0 <_ZN3Sem9_sem_waitEPS_+0x8c>
    if (id->count == 0) {
    80002418:	00052783          	lw	a5,0(a0)
    8000241c:	00078a63          	beqz	a5,80002430 <_ZN3Sem9_sem_waitEPS_+0x1c>
        id->count--;
    80002420:	fff7879b          	addiw	a5,a5,-1
    80002424:	00f52023          	sw	a5,0(a0)
    int ret = 0;
    80002428:	00000513          	li	a0,0
    8000242c:	00008067          	ret
int Sem::_sem_wait(sem_t id) {
    80002430:	fe010113          	addi	sp,sp,-32
    80002434:	00113c23          	sd	ra,24(sp)
    80002438:	00813823          	sd	s0,16(sp)
    8000243c:	00913423          	sd	s1,8(sp)
    80002440:	02010413          	addi	s0,sp,32
        TCB::running->block();
    80002444:	00007497          	auipc	s1,0x7
    80002448:	e0c4b483          	ld	s1,-500(s1) # 80009250 <_GLOBAL_OFFSET_TABLE_+0x70>
    8000244c:	0004b583          	ld	a1,0(s1)

    void block() { this->status = BLOCKED; }
    80002450:	00100793          	li	a5,1
    80002454:	04f5a423          	sw	a5,72(a1)
        id->blocked.put(TCB::running);
    80002458:	00850513          	addi	a0,a0,8
    8000245c:	00000097          	auipc	ra,0x0
    80002460:	1c0080e7          	jalr	448(ra) # 8000261c <_ZN2os14CircularBufferIP3TCBE3putES2_>
        TCB::_thread_dispatch();
    80002464:	00002097          	auipc	ra,0x2
    80002468:	75c080e7          	jalr	1884(ra) # 80004bc0 <_ZN3TCB16_thread_dispatchEv>
        if (TCB::running->is_blocked()) {
    8000246c:	0004b783          	ld	a5,0(s1)
    bool is_blocked() const { return this->status == BLOCKED; }
    80002470:	0487a683          	lw	a3,72(a5)
    80002474:	00100713          	li	a4,1
    80002478:	00e68e63          	beq	a3,a4,80002494 <_ZN3Sem9_sem_waitEPS_+0x80>
    int ret = 0;
    8000247c:	00000513          	li	a0,0
}
    80002480:	01813083          	ld	ra,24(sp)
    80002484:	01013403          	ld	s0,16(sp)
    80002488:	00813483          	ld	s1,8(sp)
    8000248c:	02010113          	addi	sp,sp,32
    80002490:	00008067          	ret
    void run() { this->status = RUNNABLE; }
    80002494:	0407a423          	sw	zero,72(a5)
            ret = -1;
    80002498:	fff00513          	li	a0,-1
    8000249c:	fe5ff06f          	j	80002480 <_ZN3Sem9_sem_waitEPS_+0x6c>
    if (!id) return 1;
    800024a0:	00100513          	li	a0,1
}
    800024a4:	00008067          	ret

00000000800024a8 <_ZN2os14CircularBufferIP3TCBE4initEv>:
        int capacity;
    };
}

template<typename T>
void os::CircularBuffer<T>::init() {
    800024a8:	fe010113          	addi	sp,sp,-32
    800024ac:	00113c23          	sd	ra,24(sp)
    800024b0:	00813823          	sd	s0,16(sp)
    800024b4:	00913423          	sd	s1,8(sp)
    800024b8:	02010413          	addi	s0,sp,32
    800024bc:	00050493          	mv	s1,a0
    this->head = 0;
    800024c0:	00052423          	sw	zero,8(a0)
    this->tail = 0;
    800024c4:	00052623          	sw	zero,12(a0)
    this->size = 0;
    800024c8:	00052823          	sw	zero,16(a0)
    this->capacity = CAPACITY;
    800024cc:	01000793          	li	a5,16
    800024d0:	00f52a23          	sw	a5,20(a0)
    this->queue = (T *) Allocator::_mem_alloc(sizeof(T) * CAPACITY);
    800024d4:	08000513          	li	a0,128
    800024d8:	00001097          	auipc	ra,0x1
    800024dc:	ae0080e7          	jalr	-1312(ra) # 80002fb8 <_ZN9Allocator10_mem_allocEm>
    800024e0:	00a4b023          	sd	a0,0(s1)
}
    800024e4:	01813083          	ld	ra,24(sp)
    800024e8:	01013403          	ld	s0,16(sp)
    800024ec:	00813483          	ld	s1,8(sp)
    800024f0:	02010113          	addi	sp,sp,32
    800024f4:	00008067          	ret

00000000800024f8 <_ZN2os14CircularBufferIP3TCBE3getEv>:
    this->tail = (this->tail + 1) % this->capacity;
    this->size++;
}

template<typename T>
T os::CircularBuffer<T>::get() {
    800024f8:	ff010113          	addi	sp,sp,-16
    800024fc:	00813423          	sd	s0,8(sp)
    80002500:	01010413          	addi	s0,sp,16
    80002504:	00050793          	mv	a5,a0
    T ret = this->queue[this->head];
    80002508:	00053683          	ld	a3,0(a0)
    8000250c:	00852703          	lw	a4,8(a0)
    80002510:	00371613          	slli	a2,a4,0x3
    80002514:	00c686b3          	add	a3,a3,a2
    80002518:	0006b503          	ld	a0,0(a3)
    this->head = (this->head + 1) % this->capacity;
    8000251c:	0017071b          	addiw	a4,a4,1
    80002520:	0147a683          	lw	a3,20(a5)
    80002524:	02d7673b          	remw	a4,a4,a3
    80002528:	00e7a423          	sw	a4,8(a5)
    this->size--;
    8000252c:	0107a703          	lw	a4,16(a5)
    80002530:	fff7071b          	addiw	a4,a4,-1
    80002534:	00e7a823          	sw	a4,16(a5)
    return ret;
}
    80002538:	00813403          	ld	s0,8(sp)
    8000253c:	01010113          	addi	sp,sp,16
    80002540:	00008067          	ret

0000000080002544 <_ZN2os14CircularBufferIP3TCBE7destroyEv>:
    this->tail = this->capacity;
    this->capacity *= 2;
}

template<typename T>
void os::CircularBuffer<T>::destroy() {
    80002544:	ff010113          	addi	sp,sp,-16
    80002548:	00113423          	sd	ra,8(sp)
    8000254c:	00813023          	sd	s0,0(sp)
    80002550:	01010413          	addi	s0,sp,16
    Allocator::_mem_free(this->queue);
    80002554:	00053503          	ld	a0,0(a0)
    80002558:	00001097          	auipc	ra,0x1
    8000255c:	b1c080e7          	jalr	-1252(ra) # 80003074 <_ZN9Allocator9_mem_freeEPKv>
}
    80002560:	00813083          	ld	ra,8(sp)
    80002564:	00013403          	ld	s0,0(sp)
    80002568:	01010113          	addi	sp,sp,16
    8000256c:	00008067          	ret

0000000080002570 <_ZN2os14CircularBufferIP3TCBE6extendEv>:
void os::CircularBuffer<T>::extend() {
    80002570:	fe010113          	addi	sp,sp,-32
    80002574:	00113c23          	sd	ra,24(sp)
    80002578:	00813823          	sd	s0,16(sp)
    8000257c:	00913423          	sd	s1,8(sp)
    80002580:	01213023          	sd	s2,0(sp)
    80002584:	02010413          	addi	s0,sp,32
    80002588:	00050493          	mv	s1,a0
    T *new_queue = (T *) Allocator::_mem_alloc(sizeof(T *) * this->capacity * 2);
    8000258c:	01452503          	lw	a0,20(a0)
    80002590:	00451513          	slli	a0,a0,0x4
    80002594:	00001097          	auipc	ra,0x1
    80002598:	a24080e7          	jalr	-1500(ra) # 80002fb8 <_ZN9Allocator10_mem_allocEm>
    8000259c:	00050913          	mv	s2,a0
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    800025a0:	0084a783          	lw	a5,8(s1)
    800025a4:	00000713          	li	a4,0
    800025a8:	0144a683          	lw	a3,20(s1)
    800025ac:	02d75a63          	bge	a4,a3,800025e0 <_ZN2os14CircularBufferIP3TCBE6extendEv+0x70>
        new_queue[i] = this->queue[j];
    800025b0:	0004b603          	ld	a2,0(s1)
    800025b4:	00371693          	slli	a3,a4,0x3
    800025b8:	00d906b3          	add	a3,s2,a3
    800025bc:	00379593          	slli	a1,a5,0x3
    800025c0:	00b60633          	add	a2,a2,a1
    800025c4:	00063603          	ld	a2,0(a2)
    800025c8:	00c6b023          	sd	a2,0(a3)
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    800025cc:	0017071b          	addiw	a4,a4,1
    800025d0:	0017879b          	addiw	a5,a5,1
    800025d4:	0144a683          	lw	a3,20(s1)
    800025d8:	02d7e7bb          	remw	a5,a5,a3
    800025dc:	fcdff06f          	j	800025a8 <_ZN2os14CircularBufferIP3TCBE6extendEv+0x38>
    Allocator::_mem_free(queue);
    800025e0:	0004b503          	ld	a0,0(s1)
    800025e4:	00001097          	auipc	ra,0x1
    800025e8:	a90080e7          	jalr	-1392(ra) # 80003074 <_ZN9Allocator9_mem_freeEPKv>
    this->queue = new_queue;
    800025ec:	0124b023          	sd	s2,0(s1)
    this->head = 0;
    800025f0:	0004a423          	sw	zero,8(s1)
    this->tail = this->capacity;
    800025f4:	0144a783          	lw	a5,20(s1)
    800025f8:	00f4a623          	sw	a5,12(s1)
    this->capacity *= 2;
    800025fc:	0017979b          	slliw	a5,a5,0x1
    80002600:	00f4aa23          	sw	a5,20(s1)
}
    80002604:	01813083          	ld	ra,24(sp)
    80002608:	01013403          	ld	s0,16(sp)
    8000260c:	00813483          	ld	s1,8(sp)
    80002610:	00013903          	ld	s2,0(sp)
    80002614:	02010113          	addi	sp,sp,32
    80002618:	00008067          	ret

000000008000261c <_ZN2os14CircularBufferIP3TCBE3putES2_>:
void os::CircularBuffer<T>::put(T element) {
    8000261c:	fe010113          	addi	sp,sp,-32
    80002620:	00113c23          	sd	ra,24(sp)
    80002624:	00813823          	sd	s0,16(sp)
    80002628:	00913423          	sd	s1,8(sp)
    8000262c:	01213023          	sd	s2,0(sp)
    80002630:	02010413          	addi	s0,sp,32
    80002634:	00050493          	mv	s1,a0
    80002638:	00058913          	mv	s2,a1
    if (this->size == this->capacity) {
    8000263c:	01052703          	lw	a4,16(a0)
    80002640:	01452783          	lw	a5,20(a0)
    80002644:	04f70863          	beq	a4,a5,80002694 <_ZN2os14CircularBufferIP3TCBE3putES2_+0x78>
    this->queue[this->tail] = element;
    80002648:	0004b783          	ld	a5,0(s1)
    8000264c:	00c4a703          	lw	a4,12(s1)
    80002650:	00371713          	slli	a4,a4,0x3
    80002654:	00e787b3          	add	a5,a5,a4
    80002658:	0127b023          	sd	s2,0(a5)
    this->tail = (this->tail + 1) % this->capacity;
    8000265c:	00c4a783          	lw	a5,12(s1)
    80002660:	0017879b          	addiw	a5,a5,1
    80002664:	0144a703          	lw	a4,20(s1)
    80002668:	02e7e7bb          	remw	a5,a5,a4
    8000266c:	00f4a623          	sw	a5,12(s1)
    this->size++;
    80002670:	0104a783          	lw	a5,16(s1)
    80002674:	0017879b          	addiw	a5,a5,1
    80002678:	00f4a823          	sw	a5,16(s1)
}
    8000267c:	01813083          	ld	ra,24(sp)
    80002680:	01013403          	ld	s0,16(sp)
    80002684:	00813483          	ld	s1,8(sp)
    80002688:	00013903          	ld	s2,0(sp)
    8000268c:	02010113          	addi	sp,sp,32
    80002690:	00008067          	ret
        this->extend();
    80002694:	00000097          	auipc	ra,0x0
    80002698:	edc080e7          	jalr	-292(ra) # 80002570 <_ZN2os14CircularBufferIP3TCBE6extendEv>
    8000269c:	fadff06f          	j	80002648 <_ZN2os14CircularBufferIP3TCBE3putES2_+0x2c>

00000000800026a0 <_Z5printPKc>:
    } else {
        Output.put(c);
    }
}

void print(const char *str) {
    800026a0:	fe010113          	addi	sp,sp,-32
    800026a4:	00113c23          	sd	ra,24(sp)
    800026a8:	00813823          	sd	s0,16(sp)
    800026ac:	00913423          	sd	s1,8(sp)
    800026b0:	01213023          	sd	s2,0(sp)
    800026b4:	02010413          	addi	s0,sp,32
    800026b8:	00050913          	mv	s2,a0
    int i = 0;
    printer->wait();
    800026bc:	00007797          	auipc	a5,0x7
    800026c0:	b4c7b783          	ld	a5,-1204(a5) # 80009208 <_GLOBAL_OFFSET_TABLE_+0x28>
    800026c4:	0007b503          	ld	a0,0(a5)
    800026c8:	00053783          	ld	a5,0(a0)
    800026cc:	0107b783          	ld	a5,16(a5)
    800026d0:	000780e7          	jalr	a5
    int i = 0;
    800026d4:	00000493          	li	s1,0
    while (str[i]) {
    800026d8:	009907b3          	add	a5,s2,s1
    800026dc:	0007c503          	lbu	a0,0(a5)
    800026e0:	00050a63          	beqz	a0,800026f4 <_Z5printPKc+0x54>
        putc(str[i++]);
    800026e4:	0014849b          	addiw	s1,s1,1
    800026e8:	fffff097          	auipc	ra,0xfffff
    800026ec:	308080e7          	jalr	776(ra) # 800019f0 <_Z4putcc>
    while (str[i]) {
    800026f0:	fe9ff06f          	j	800026d8 <_Z5printPKc+0x38>
    }
    printer->signal();
    800026f4:	00007797          	auipc	a5,0x7
    800026f8:	b147b783          	ld	a5,-1260(a5) # 80009208 <_GLOBAL_OFFSET_TABLE_+0x28>
    800026fc:	0007b503          	ld	a0,0(a5)
    80002700:	00053783          	ld	a5,0(a0)
    80002704:	0187b783          	ld	a5,24(a5)
    80002708:	000780e7          	jalr	a5
}
    8000270c:	01813083          	ld	ra,24(sp)
    80002710:	01013403          	ld	s0,16(sp)
    80002714:	00813483          	ld	s1,8(sp)
    80002718:	00013903          	ld	s2,0(sp)
    8000271c:	02010113          	addi	sp,sp,32
    80002720:	00008067          	ret

0000000080002724 <_Z14dramatic_printPKc>:

void dramatic_print(const char *str) {
    80002724:	fe010113          	addi	sp,sp,-32
    80002728:	00113c23          	sd	ra,24(sp)
    8000272c:	00813823          	sd	s0,16(sp)
    80002730:	00913423          	sd	s1,8(sp)
    80002734:	01213023          	sd	s2,0(sp)
    80002738:	02010413          	addi	s0,sp,32
    8000273c:	00050913          	mv	s2,a0
    int i = 0;
    printer->wait();
    80002740:	00007797          	auipc	a5,0x7
    80002744:	ac87b783          	ld	a5,-1336(a5) # 80009208 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002748:	0007b503          	ld	a0,0(a5)
    8000274c:	00053783          	ld	a5,0(a0)
    80002750:	0107b783          	ld	a5,16(a5)
    80002754:	000780e7          	jalr	a5
    int i = 0;
    80002758:	00000493          	li	s1,0
    while (str[i]) {
    8000275c:	009907b3          	add	a5,s2,s1
    80002760:	0007c503          	lbu	a0,0(a5)
    80002764:	02050063          	beqz	a0,80002784 <_Z14dramatic_printPKc+0x60>
        putc(str[i++]);
    80002768:	0014849b          	addiw	s1,s1,1
    8000276c:	fffff097          	auipc	ra,0xfffff
    80002770:	284080e7          	jalr	644(ra) # 800019f0 <_Z4putcc>
        time_sleep(1);
    80002774:	00100513          	li	a0,1
    80002778:	fffff097          	auipc	ra,0xfffff
    8000277c:	188080e7          	jalr	392(ra) # 80001900 <_Z10time_sleepm>
    while (str[i]) {
    80002780:	fddff06f          	j	8000275c <_Z14dramatic_printPKc+0x38>
    }
    printer->signal();
    80002784:	00007797          	auipc	a5,0x7
    80002788:	a847b783          	ld	a5,-1404(a5) # 80009208 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000278c:	0007b503          	ld	a0,0(a5)
    80002790:	00053783          	ld	a5,0(a0)
    80002794:	0187b783          	ld	a5,24(a5)
    80002798:	000780e7          	jalr	a5
}
    8000279c:	01813083          	ld	ra,24(sp)
    800027a0:	01013403          	ld	s0,16(sp)
    800027a4:	00813483          	ld	s1,8(sp)
    800027a8:	00013903          	ld	s2,0(sp)
    800027ac:	02010113          	addi	sp,sp,32
    800027b0:	00008067          	ret

00000000800027b4 <_Z5printx>:

void print(long long number) {
    800027b4:	fd010113          	addi	sp,sp,-48
    800027b8:	02113423          	sd	ra,40(sp)
    800027bc:	02813023          	sd	s0,32(sp)
    800027c0:	03010413          	addi	s0,sp,48
    char buff[25] = {};
    800027c4:	fc043823          	sd	zero,-48(s0)
    800027c8:	fc043c23          	sd	zero,-40(s0)
    800027cc:	fe043023          	sd	zero,-32(s0)
    800027d0:	fe040423          	sb	zero,-24(s0)
    print(stm::ntos(number, buff, 10));
    800027d4:	00a00613          	li	a2,10
    800027d8:	fd040593          	addi	a1,s0,-48
    800027dc:	fffff097          	auipc	ra,0xfffff
    800027e0:	4a4080e7          	jalr	1188(ra) # 80001c80 <_ZN3stm4ntosExPci>
    800027e4:	00000097          	auipc	ra,0x0
    800027e8:	ebc080e7          	jalr	-324(ra) # 800026a0 <_Z5printPKc>
}
    800027ec:	02813083          	ld	ra,40(sp)
    800027f0:	02013403          	ld	s0,32(sp)
    800027f4:	03010113          	addi	sp,sp,48
    800027f8:	00008067          	ret

00000000800027fc <_Z5printi>:

void print(int number) {
    800027fc:	ff010113          	addi	sp,sp,-16
    80002800:	00113423          	sd	ra,8(sp)
    80002804:	00813023          	sd	s0,0(sp)
    80002808:	01010413          	addi	s0,sp,16
    print((long long) number);
    8000280c:	00000097          	auipc	ra,0x0
    80002810:	fa8080e7          	jalr	-88(ra) # 800027b4 <_Z5printx>
}
    80002814:	00813083          	ld	ra,8(sp)
    80002818:	00013403          	ld	s0,0(sp)
    8000281c:	01010113          	addi	sp,sp,16
    80002820:	00008067          	ret

0000000080002824 <_Z5printm>:

void print(uint64 number) {
    80002824:	fd010113          	addi	sp,sp,-48
    80002828:	02113423          	sd	ra,40(sp)
    8000282c:	02813023          	sd	s0,32(sp)
    80002830:	03010413          	addi	s0,sp,48
    char buff[25] = {};
    80002834:	fc043823          	sd	zero,-48(s0)
    80002838:	fc043c23          	sd	zero,-40(s0)
    8000283c:	fe043023          	sd	zero,-32(s0)
    80002840:	fe040423          	sb	zero,-24(s0)
    print(stm::utos(number, buff, 10));
    80002844:	00a00613          	li	a2,10
    80002848:	fd040593          	addi	a1,s0,-48
    8000284c:	fffff097          	auipc	ra,0xfffff
    80002850:	538080e7          	jalr	1336(ra) # 80001d84 <_ZN3stm4utosEmPci>
    80002854:	00000097          	auipc	ra,0x0
    80002858:	e4c080e7          	jalr	-436(ra) # 800026a0 <_Z5printPKc>
}
    8000285c:	02813083          	ld	ra,40(sp)
    80002860:	02013403          	ld	s0,32(sp)
    80002864:	03010113          	addi	sp,sp,48
    80002868:	00008067          	ret

000000008000286c <_Z7print_hm>:

void print_h(uint64 number) {
    8000286c:	fd010113          	addi	sp,sp,-48
    80002870:	02113423          	sd	ra,40(sp)
    80002874:	02813023          	sd	s0,32(sp)
    80002878:	03010413          	addi	s0,sp,48
    char buff[25] = {};
    8000287c:	fc043823          	sd	zero,-48(s0)
    80002880:	fc043c23          	sd	zero,-40(s0)
    80002884:	fe043023          	sd	zero,-32(s0)
    80002888:	fe040423          	sb	zero,-24(s0)
    print(stm::utos(number, buff, 16));
    8000288c:	01000613          	li	a2,16
    80002890:	fd040593          	addi	a1,s0,-48
    80002894:	fffff097          	auipc	ra,0xfffff
    80002898:	4f0080e7          	jalr	1264(ra) # 80001d84 <_ZN3stm4utosEmPci>
    8000289c:	00000097          	auipc	ra,0x0
    800028a0:	e04080e7          	jalr	-508(ra) # 800026a0 <_Z5printPKc>
    800028a4:	02813083          	ld	ra,40(sp)
    800028a8:	02013403          	ld	s0,32(sp)
    800028ac:	03010113          	addi	sp,sp,48
    800028b0:	00008067          	ret

00000000800028b4 <_ZN8IOBuffer4initEv>:
void IOBuffer::init() {
    800028b4:	fe010113          	addi	sp,sp,-32
    800028b8:	00113c23          	sd	ra,24(sp)
    800028bc:	00813823          	sd	s0,16(sp)
    800028c0:	00913423          	sd	s1,8(sp)
    800028c4:	02010413          	addi	s0,sp,32
    800028c8:	00050493          	mv	s1,a0
    this->buffer.init();
    800028cc:	00000097          	auipc	ra,0x0
    800028d0:	1a0080e7          	jalr	416(ra) # 80002a6c <_ZN2os14CircularBufferIcE4initEv>
    sem_open(&this->empty, 0);
    800028d4:	00000593          	li	a1,0
    800028d8:	01848513          	addi	a0,s1,24
    800028dc:	fffff097          	auipc	ra,0xfffff
    800028e0:	ea4080e7          	jalr	-348(ra) # 80001780 <_Z8sem_openPP3Semj>
}
    800028e4:	01813083          	ld	ra,24(sp)
    800028e8:	01013403          	ld	s0,16(sp)
    800028ec:	00813483          	ld	s1,8(sp)
    800028f0:	02010113          	addi	sp,sp,32
    800028f4:	00008067          	ret

00000000800028f8 <_ZN2IO4initEv>:
void IO::init() {
    800028f8:	ff010113          	addi	sp,sp,-16
    800028fc:	00113423          	sd	ra,8(sp)
    80002900:	00813023          	sd	s0,0(sp)
    80002904:	01010413          	addi	s0,sp,16
    Input.init();
    80002908:	00007517          	auipc	a0,0x7
    8000290c:	9b850513          	addi	a0,a0,-1608 # 800092c0 <_ZN2IO5InputE>
    80002910:	00000097          	auipc	ra,0x0
    80002914:	fa4080e7          	jalr	-92(ra) # 800028b4 <_ZN8IOBuffer4initEv>
    Output.init();
    80002918:	00007517          	auipc	a0,0x7
    8000291c:	9c850513          	addi	a0,a0,-1592 # 800092e0 <_ZN2IO6OutputE>
    80002920:	00000097          	auipc	ra,0x0
    80002924:	f94080e7          	jalr	-108(ra) # 800028b4 <_ZN8IOBuffer4initEv>
}
    80002928:	00813083          	ld	ra,8(sp)
    8000292c:	00013403          	ld	s0,0(sp)
    80002930:	01010113          	addi	sp,sp,16
    80002934:	00008067          	ret

0000000080002938 <_ZN8IOBuffer3getEv>:
char IOBuffer::get() {
    80002938:	fe010113          	addi	sp,sp,-32
    8000293c:	00113c23          	sd	ra,24(sp)
    80002940:	00813823          	sd	s0,16(sp)
    80002944:	00913423          	sd	s1,8(sp)
    80002948:	02010413          	addi	s0,sp,32
    8000294c:	00050493          	mv	s1,a0
    Sem::_sem_wait(this->empty);
    80002950:	01853503          	ld	a0,24(a0)
    80002954:	00000097          	auipc	ra,0x0
    80002958:	ac0080e7          	jalr	-1344(ra) # 80002414 <_ZN3Sem9_sem_waitEPS_>
    char ret = this->buffer.get();
    8000295c:	00048513          	mv	a0,s1
    80002960:	00000097          	auipc	ra,0x0
    80002964:	15c080e7          	jalr	348(ra) # 80002abc <_ZN2os14CircularBufferIcE3getEv>
}
    80002968:	01813083          	ld	ra,24(sp)
    8000296c:	01013403          	ld	s0,16(sp)
    80002970:	00813483          	ld	s1,8(sp)
    80002974:	02010113          	addi	sp,sp,32
    80002978:	00008067          	ret

000000008000297c <_ZN2IO5_getcEv>:
char IO::_getc() {
    8000297c:	ff010113          	addi	sp,sp,-16
    80002980:	00113423          	sd	ra,8(sp)
    80002984:	00813023          	sd	s0,0(sp)
    80002988:	01010413          	addi	s0,sp,16
    return Input.get();
    8000298c:	00007517          	auipc	a0,0x7
    80002990:	93450513          	addi	a0,a0,-1740 # 800092c0 <_ZN2IO5InputE>
    80002994:	00000097          	auipc	ra,0x0
    80002998:	fa4080e7          	jalr	-92(ra) # 80002938 <_ZN8IOBuffer3getEv>
}
    8000299c:	00813083          	ld	ra,8(sp)
    800029a0:	00013403          	ld	s0,0(sp)
    800029a4:	01010113          	addi	sp,sp,16
    800029a8:	00008067          	ret

00000000800029ac <_ZN8IOBuffer3putEc>:
void IOBuffer::put(char c) {
    800029ac:	fe010113          	addi	sp,sp,-32
    800029b0:	00113c23          	sd	ra,24(sp)
    800029b4:	00813823          	sd	s0,16(sp)
    800029b8:	00913423          	sd	s1,8(sp)
    800029bc:	02010413          	addi	s0,sp,32
    800029c0:	00050493          	mv	s1,a0
    this->buffer.put(c);
    800029c4:	00000097          	auipc	ra,0x0
    800029c8:	1e4080e7          	jalr	484(ra) # 80002ba8 <_ZN2os14CircularBufferIcE3putEc>
    Sem::_sem_signal(this->empty);
    800029cc:	0184b503          	ld	a0,24(s1)
    800029d0:	00000097          	auipc	ra,0x0
    800029d4:	95c080e7          	jalr	-1700(ra) # 8000232c <_ZN3Sem11_sem_signalEPS_>
}
    800029d8:	01813083          	ld	ra,24(sp)
    800029dc:	01013403          	ld	s0,16(sp)
    800029e0:	00813483          	ld	s1,8(sp)
    800029e4:	02010113          	addi	sp,sp,32
    800029e8:	00008067          	ret

00000000800029ec <_ZN2IO5_putcEc>:
void IO::_putc(char c) {
    800029ec:	fe010113          	addi	sp,sp,-32
    800029f0:	00113c23          	sd	ra,24(sp)
    800029f4:	00813823          	sd	s0,16(sp)
    800029f8:	00913423          	sd	s1,8(sp)
    800029fc:	02010413          	addi	s0,sp,32
    if (c == 127) {
    80002a00:	07f00793          	li	a5,127
    80002a04:	02f50663          	beq	a0,a5,80002a30 <_ZN2IO5_putcEc+0x44>
    80002a08:	00050593          	mv	a1,a0
        Output.put(c);
    80002a0c:	00007517          	auipc	a0,0x7
    80002a10:	8d450513          	addi	a0,a0,-1836 # 800092e0 <_ZN2IO6OutputE>
    80002a14:	00000097          	auipc	ra,0x0
    80002a18:	f98080e7          	jalr	-104(ra) # 800029ac <_ZN8IOBuffer3putEc>
}
    80002a1c:	01813083          	ld	ra,24(sp)
    80002a20:	01013403          	ld	s0,16(sp)
    80002a24:	00813483          	ld	s1,8(sp)
    80002a28:	02010113          	addi	sp,sp,32
    80002a2c:	00008067          	ret
        Output.put(8);
    80002a30:	00007497          	auipc	s1,0x7
    80002a34:	8b048493          	addi	s1,s1,-1872 # 800092e0 <_ZN2IO6OutputE>
    80002a38:	00800593          	li	a1,8
    80002a3c:	00048513          	mv	a0,s1
    80002a40:	00000097          	auipc	ra,0x0
    80002a44:	f6c080e7          	jalr	-148(ra) # 800029ac <_ZN8IOBuffer3putEc>
        Output.put(' ');
    80002a48:	02000593          	li	a1,32
    80002a4c:	00048513          	mv	a0,s1
    80002a50:	00000097          	auipc	ra,0x0
    80002a54:	f5c080e7          	jalr	-164(ra) # 800029ac <_ZN8IOBuffer3putEc>
        Output.put(8);
    80002a58:	00800593          	li	a1,8
    80002a5c:	00048513          	mv	a0,s1
    80002a60:	00000097          	auipc	ra,0x0
    80002a64:	f4c080e7          	jalr	-180(ra) # 800029ac <_ZN8IOBuffer3putEc>
    80002a68:	fb5ff06f          	j	80002a1c <_ZN2IO5_putcEc+0x30>

0000000080002a6c <_ZN2os14CircularBufferIcE4initEv>:
void os::CircularBuffer<T>::init() {
    80002a6c:	fe010113          	addi	sp,sp,-32
    80002a70:	00113c23          	sd	ra,24(sp)
    80002a74:	00813823          	sd	s0,16(sp)
    80002a78:	00913423          	sd	s1,8(sp)
    80002a7c:	02010413          	addi	s0,sp,32
    80002a80:	00050493          	mv	s1,a0
    this->head = 0;
    80002a84:	00052423          	sw	zero,8(a0)
    this->tail = 0;
    80002a88:	00052623          	sw	zero,12(a0)
    this->size = 0;
    80002a8c:	00052823          	sw	zero,16(a0)
    this->capacity = CAPACITY;
    80002a90:	01000793          	li	a5,16
    80002a94:	00f52a23          	sw	a5,20(a0)
    this->queue = (T *) Allocator::_mem_alloc(sizeof(T) * CAPACITY);
    80002a98:	01000513          	li	a0,16
    80002a9c:	00000097          	auipc	ra,0x0
    80002aa0:	51c080e7          	jalr	1308(ra) # 80002fb8 <_ZN9Allocator10_mem_allocEm>
    80002aa4:	00a4b023          	sd	a0,0(s1)
}
    80002aa8:	01813083          	ld	ra,24(sp)
    80002aac:	01013403          	ld	s0,16(sp)
    80002ab0:	00813483          	ld	s1,8(sp)
    80002ab4:	02010113          	addi	sp,sp,32
    80002ab8:	00008067          	ret

0000000080002abc <_ZN2os14CircularBufferIcE3getEv>:
T os::CircularBuffer<T>::get() {
    80002abc:	ff010113          	addi	sp,sp,-16
    80002ac0:	00813423          	sd	s0,8(sp)
    80002ac4:	01010413          	addi	s0,sp,16
    80002ac8:	00050793          	mv	a5,a0
    T ret = this->queue[this->head];
    80002acc:	00053683          	ld	a3,0(a0)
    80002ad0:	00852703          	lw	a4,8(a0)
    80002ad4:	00e686b3          	add	a3,a3,a4
    80002ad8:	0006c503          	lbu	a0,0(a3)
    this->head = (this->head + 1) % this->capacity;
    80002adc:	0017071b          	addiw	a4,a4,1
    80002ae0:	0147a683          	lw	a3,20(a5)
    80002ae4:	02d7673b          	remw	a4,a4,a3
    80002ae8:	00e7a423          	sw	a4,8(a5)
    this->size--;
    80002aec:	0107a703          	lw	a4,16(a5)
    80002af0:	fff7071b          	addiw	a4,a4,-1
    80002af4:	00e7a823          	sw	a4,16(a5)
}
    80002af8:	00813403          	ld	s0,8(sp)
    80002afc:	01010113          	addi	sp,sp,16
    80002b00:	00008067          	ret

0000000080002b04 <_ZN2os14CircularBufferIcE6extendEv>:
void os::CircularBuffer<T>::extend() {
    80002b04:	fe010113          	addi	sp,sp,-32
    80002b08:	00113c23          	sd	ra,24(sp)
    80002b0c:	00813823          	sd	s0,16(sp)
    80002b10:	00913423          	sd	s1,8(sp)
    80002b14:	01213023          	sd	s2,0(sp)
    80002b18:	02010413          	addi	s0,sp,32
    80002b1c:	00050493          	mv	s1,a0
    T *new_queue = (T *) Allocator::_mem_alloc(sizeof(T *) * this->capacity * 2);
    80002b20:	01452503          	lw	a0,20(a0)
    80002b24:	00451513          	slli	a0,a0,0x4
    80002b28:	00000097          	auipc	ra,0x0
    80002b2c:	490080e7          	jalr	1168(ra) # 80002fb8 <_ZN9Allocator10_mem_allocEm>
    80002b30:	00050913          	mv	s2,a0
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    80002b34:	0084a783          	lw	a5,8(s1)
    80002b38:	00000713          	li	a4,0
    80002b3c:	0144a683          	lw	a3,20(s1)
    80002b40:	02d75663          	bge	a4,a3,80002b6c <_ZN2os14CircularBufferIcE6extendEv+0x68>
        new_queue[i] = this->queue[j];
    80002b44:	0004b683          	ld	a3,0(s1)
    80002b48:	00e90633          	add	a2,s2,a4
    80002b4c:	00f686b3          	add	a3,a3,a5
    80002b50:	0006c683          	lbu	a3,0(a3)
    80002b54:	00d60023          	sb	a3,0(a2)
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    80002b58:	0017071b          	addiw	a4,a4,1
    80002b5c:	0017879b          	addiw	a5,a5,1
    80002b60:	0144a683          	lw	a3,20(s1)
    80002b64:	02d7e7bb          	remw	a5,a5,a3
    80002b68:	fd5ff06f          	j	80002b3c <_ZN2os14CircularBufferIcE6extendEv+0x38>
    Allocator::_mem_free(queue);
    80002b6c:	0004b503          	ld	a0,0(s1)
    80002b70:	00000097          	auipc	ra,0x0
    80002b74:	504080e7          	jalr	1284(ra) # 80003074 <_ZN9Allocator9_mem_freeEPKv>
    this->queue = new_queue;
    80002b78:	0124b023          	sd	s2,0(s1)
    this->head = 0;
    80002b7c:	0004a423          	sw	zero,8(s1)
    this->tail = this->capacity;
    80002b80:	0144a783          	lw	a5,20(s1)
    80002b84:	00f4a623          	sw	a5,12(s1)
    this->capacity *= 2;
    80002b88:	0017979b          	slliw	a5,a5,0x1
    80002b8c:	00f4aa23          	sw	a5,20(s1)
}
    80002b90:	01813083          	ld	ra,24(sp)
    80002b94:	01013403          	ld	s0,16(sp)
    80002b98:	00813483          	ld	s1,8(sp)
    80002b9c:	00013903          	ld	s2,0(sp)
    80002ba0:	02010113          	addi	sp,sp,32
    80002ba4:	00008067          	ret

0000000080002ba8 <_ZN2os14CircularBufferIcE3putEc>:
void os::CircularBuffer<T>::put(T element) {
    80002ba8:	fe010113          	addi	sp,sp,-32
    80002bac:	00113c23          	sd	ra,24(sp)
    80002bb0:	00813823          	sd	s0,16(sp)
    80002bb4:	00913423          	sd	s1,8(sp)
    80002bb8:	01213023          	sd	s2,0(sp)
    80002bbc:	02010413          	addi	s0,sp,32
    80002bc0:	00050493          	mv	s1,a0
    80002bc4:	00058913          	mv	s2,a1
    if (this->size == this->capacity) {
    80002bc8:	01052703          	lw	a4,16(a0)
    80002bcc:	01452783          	lw	a5,20(a0)
    80002bd0:	04f70663          	beq	a4,a5,80002c1c <_ZN2os14CircularBufferIcE3putEc+0x74>
    this->queue[this->tail] = element;
    80002bd4:	0004b783          	ld	a5,0(s1)
    80002bd8:	00c4a703          	lw	a4,12(s1)
    80002bdc:	00e787b3          	add	a5,a5,a4
    80002be0:	01278023          	sb	s2,0(a5)
    this->tail = (this->tail + 1) % this->capacity;
    80002be4:	00c4a783          	lw	a5,12(s1)
    80002be8:	0017879b          	addiw	a5,a5,1
    80002bec:	0144a703          	lw	a4,20(s1)
    80002bf0:	02e7e7bb          	remw	a5,a5,a4
    80002bf4:	00f4a623          	sw	a5,12(s1)
    this->size++;
    80002bf8:	0104a783          	lw	a5,16(s1)
    80002bfc:	0017879b          	addiw	a5,a5,1
    80002c00:	00f4a823          	sw	a5,16(s1)
}
    80002c04:	01813083          	ld	ra,24(sp)
    80002c08:	01013403          	ld	s0,16(sp)
    80002c0c:	00813483          	ld	s1,8(sp)
    80002c10:	00013903          	ld	s2,0(sp)
    80002c14:	02010113          	addi	sp,sp,32
    80002c18:	00008067          	ret
        this->extend();
    80002c1c:	00000097          	auipc	ra,0x0
    80002c20:	ee8080e7          	jalr	-280(ra) # 80002b04 <_ZN2os14CircularBufferIcE6extendEv>
    80002c24:	fb1ff06f          	j	80002bd4 <_ZN2os14CircularBufferIcE3putEc+0x2c>

0000000080002c28 <_ZN6Cradle4elemnwEm>:
#include "../h/scheduler.hpp"

Cradle::elem *Cradle::head = nullptr;
Cradle::elem *Cradle::tail = nullptr;

void *Cradle::elem::operator new(size_t size) {
    80002c28:	ff010113          	addi	sp,sp,-16
    80002c2c:	00113423          	sd	ra,8(sp)
    80002c30:	00813023          	sd	s0,0(sp)
    80002c34:	01010413          	addi	s0,sp,16
    return Allocator::_mem_alloc(size);
    80002c38:	00000097          	auipc	ra,0x0
    80002c3c:	380080e7          	jalr	896(ra) # 80002fb8 <_ZN9Allocator10_mem_allocEm>
}
    80002c40:	00813083          	ld	ra,8(sp)
    80002c44:	00013403          	ld	s0,0(sp)
    80002c48:	01010113          	addi	sp,sp,16
    80002c4c:	00008067          	ret

0000000080002c50 <_ZN6Cradle4elemdlEPv>:

void Cradle::elem::operator delete(void *mem) {
    80002c50:	ff010113          	addi	sp,sp,-16
    80002c54:	00113423          	sd	ra,8(sp)
    80002c58:	00813023          	sd	s0,0(sp)
    80002c5c:	01010413          	addi	s0,sp,16
    Allocator::_mem_free(mem);
    80002c60:	00000097          	auipc	ra,0x0
    80002c64:	414080e7          	jalr	1044(ra) # 80003074 <_ZN9Allocator9_mem_freeEPKv>
}
    80002c68:	00813083          	ld	ra,8(sp)
    80002c6c:	00013403          	ld	s0,0(sp)
    80002c70:	01010113          	addi	sp,sp,16
    80002c74:	00008067          	ret

0000000080002c78 <_ZN6Cradle6insertEP3TCBm>:

void Cradle::insert(TCB *thread, time_t time) {
    80002c78:	fc010113          	addi	sp,sp,-64
    80002c7c:	02113c23          	sd	ra,56(sp)
    80002c80:	02813823          	sd	s0,48(sp)
    80002c84:	02913423          	sd	s1,40(sp)
    80002c88:	03213023          	sd	s2,32(sp)
    80002c8c:	01313c23          	sd	s3,24(sp)
    80002c90:	01413823          	sd	s4,16(sp)
    80002c94:	01513423          	sd	s5,8(sp)
    80002c98:	04010413          	addi	s0,sp,64
    80002c9c:	00050a93          	mv	s5,a0
    80002ca0:	00058913          	mv	s2,a1
    if (head == nullptr) {
    80002ca4:	00006797          	auipc	a5,0x6
    80002ca8:	65c7b783          	ld	a5,1628(a5) # 80009300 <_ZN6Cradle4headE>
    80002cac:	04078263          	beqz	a5,80002cf0 <_ZN6Cradle6insertEP3TCBm+0x78>
        head = tail = new elem(thread, time);
        return;
    } else if (time < head->time_left) {
    80002cb0:	0087b703          	ld	a4,8(a5)
    80002cb4:	06e5f663          	bgeu	a1,a4,80002d20 <_ZN6Cradle6insertEP3TCBm+0xa8>
        head = new elem(thread, time, head);
    80002cb8:	01800513          	li	a0,24
    80002cbc:	00000097          	auipc	ra,0x0
    80002cc0:	f6c080e7          	jalr	-148(ra) # 80002c28 <_ZN6Cradle4elemnwEm>
    80002cc4:	00006717          	auipc	a4,0x6
    80002cc8:	63c70713          	addi	a4,a4,1596 # 80009300 <_ZN6Cradle4headE>
    80002ccc:	00073783          	ld	a5,0(a4)
    struct elem {
        void *operator new(size_t size);

        void operator delete(void *mem);

        elem(TCB *handle, time_t time, elem *next = nullptr) : handle(handle), time_left(time), next(next) {}
    80002cd0:	01553023          	sd	s5,0(a0)
    80002cd4:	01253423          	sd	s2,8(a0)
    80002cd8:	00f53823          	sd	a5,16(a0)
    80002cdc:	00a73023          	sd	a0,0(a4)
        head->next->time_left -= time;
    80002ce0:	0087b703          	ld	a4,8(a5)
    80002ce4:	41270933          	sub	s2,a4,s2
    80002ce8:	0127b423          	sd	s2,8(a5)
        return;
    80002cec:	0b40006f          	j	80002da0 <_ZN6Cradle6insertEP3TCBm+0x128>
        head = tail = new elem(thread, time);
    80002cf0:	01800513          	li	a0,24
    80002cf4:	00000097          	auipc	ra,0x0
    80002cf8:	f34080e7          	jalr	-204(ra) # 80002c28 <_ZN6Cradle4elemnwEm>
    80002cfc:	01553023          	sd	s5,0(a0)
    80002d00:	01253423          	sd	s2,8(a0)
    80002d04:	00053823          	sd	zero,16(a0)
    80002d08:	00006797          	auipc	a5,0x6
    80002d0c:	5f878793          	addi	a5,a5,1528 # 80009300 <_ZN6Cradle4headE>
    80002d10:	00a7b423          	sd	a0,8(a5)
    80002d14:	00a7b023          	sd	a0,0(a5)
        return;
    80002d18:	0880006f          	j	80002da0 <_ZN6Cradle6insertEP3TCBm+0x128>
    }
    for (elem *curr = head; curr->next; curr = curr->next) {
        time -= curr->time_left;
    80002d1c:	00048913          	mv	s2,s1
    for (elem *curr = head; curr->next; curr = curr->next) {
    80002d20:	00078993          	mv	s3,a5
    80002d24:	0107b783          	ld	a5,16(a5)
    80002d28:	04078663          	beqz	a5,80002d74 <_ZN6Cradle6insertEP3TCBm+0xfc>
        time -= curr->time_left;
    80002d2c:	0089ba03          	ld	s4,8(s3)
    80002d30:	414904b3          	sub	s1,s2,s4
        if (time < curr->next->time_left) {
    80002d34:	0087b703          	ld	a4,8(a5)
    80002d38:	fee4f2e3          	bgeu	s1,a4,80002d1c <_ZN6Cradle6insertEP3TCBm+0xa4>
            curr->next = new elem(thread, time, curr->next);
    80002d3c:	01800513          	li	a0,24
    80002d40:	00000097          	auipc	ra,0x0
    80002d44:	ee8080e7          	jalr	-280(ra) # 80002c28 <_ZN6Cradle4elemnwEm>
    80002d48:	0109b783          	ld	a5,16(s3)
    80002d4c:	01553023          	sd	s5,0(a0)
    80002d50:	00953423          	sd	s1,8(a0)
    80002d54:	00f53823          	sd	a5,16(a0)
    80002d58:	00a9b823          	sd	a0,16(s3)
            curr->next->next->time_left -= time;
    80002d5c:	01053783          	ld	a5,16(a0)
    80002d60:	412a0933          	sub	s2,s4,s2
    80002d64:	0087ba03          	ld	s4,8(a5)
    80002d68:	012a0933          	add	s2,s4,s2
    80002d6c:	0127b423          	sd	s2,8(a5)
            return;
    80002d70:	0300006f          	j	80002da0 <_ZN6Cradle6insertEP3TCBm+0x128>
        }
    }
    tail->next = new elem(thread, time);
    80002d74:	01800513          	li	a0,24
    80002d78:	00000097          	auipc	ra,0x0
    80002d7c:	eb0080e7          	jalr	-336(ra) # 80002c28 <_ZN6Cradle4elemnwEm>
    80002d80:	01553023          	sd	s5,0(a0)
    80002d84:	01253423          	sd	s2,8(a0)
    80002d88:	00053823          	sd	zero,16(a0)
    80002d8c:	00006797          	auipc	a5,0x6
    80002d90:	57478793          	addi	a5,a5,1396 # 80009300 <_ZN6Cradle4headE>
    80002d94:	0087b703          	ld	a4,8(a5)
    80002d98:	00a73823          	sd	a0,16(a4)
    tail = tail->next;
    80002d9c:	00a7b423          	sd	a0,8(a5)
}
    80002da0:	03813083          	ld	ra,56(sp)
    80002da4:	03013403          	ld	s0,48(sp)
    80002da8:	02813483          	ld	s1,40(sp)
    80002dac:	02013903          	ld	s2,32(sp)
    80002db0:	01813983          	ld	s3,24(sp)
    80002db4:	01013a03          	ld	s4,16(sp)
    80002db8:	00813a83          	ld	s5,8(sp)
    80002dbc:	04010113          	addi	sp,sp,64
    80002dc0:	00008067          	ret

0000000080002dc4 <_ZN6Cradle6removeEv>:

TCB *Cradle::remove() {
    80002dc4:	fe010113          	addi	sp,sp,-32
    80002dc8:	00113c23          	sd	ra,24(sp)
    80002dcc:	00813823          	sd	s0,16(sp)
    80002dd0:	00913423          	sd	s1,8(sp)
    80002dd4:	02010413          	addi	s0,sp,32
    elem *old = head;
    80002dd8:	00006797          	auipc	a5,0x6
    80002ddc:	52878793          	addi	a5,a5,1320 # 80009300 <_ZN6Cradle4headE>
    80002de0:	0007b503          	ld	a0,0(a5)
    TCB *ret = old->handle;
    80002de4:	00053483          	ld	s1,0(a0)
    head = head->next;
    80002de8:	01053703          	ld	a4,16(a0)
    80002dec:	00e7b023          	sd	a4,0(a5)
    delete old;
    80002df0:	00050663          	beqz	a0,80002dfc <_ZN6Cradle6removeEv+0x38>
    80002df4:	00000097          	auipc	ra,0x0
    80002df8:	e5c080e7          	jalr	-420(ra) # 80002c50 <_ZN6Cradle4elemdlEPv>
    return ret;
}
    80002dfc:	00048513          	mv	a0,s1
    80002e00:	01813083          	ld	ra,24(sp)
    80002e04:	01013403          	ld	s0,16(sp)
    80002e08:	00813483          	ld	s1,8(sp)
    80002e0c:	02010113          	addi	sp,sp,32
    80002e10:	00008067          	ret

0000000080002e14 <_ZN6Cradle6updateEv>:

void Cradle::update() {
    80002e14:	ff010113          	addi	sp,sp,-16
    80002e18:	00813423          	sd	s0,8(sp)
    80002e1c:	01010413          	addi	s0,sp,16
    if (!head)
    80002e20:	00006797          	auipc	a5,0x6
    80002e24:	4e07b783          	ld	a5,1248(a5) # 80009300 <_ZN6Cradle4headE>
    80002e28:	00078863          	beqz	a5,80002e38 <_ZN6Cradle6updateEv+0x24>
        return;
    head->time_left--;
    80002e2c:	0087b703          	ld	a4,8(a5)
    80002e30:	fff70713          	addi	a4,a4,-1
    80002e34:	00e7b423          	sd	a4,8(a5)
}
    80002e38:	00813403          	ld	s0,8(sp)
    80002e3c:	01010113          	addi	sp,sp,16
    80002e40:	00008067          	ret

0000000080002e44 <_ZN6Cradle4peakEv>:

int Cradle::peak() {
    80002e44:	ff010113          	addi	sp,sp,-16
    80002e48:	00813423          	sd	s0,8(sp)
    80002e4c:	01010413          	addi	s0,sp,16
    if (head)
    80002e50:	00006797          	auipc	a5,0x6
    80002e54:	4b07b783          	ld	a5,1200(a5) # 80009300 <_ZN6Cradle4headE>
    80002e58:	00078a63          	beqz	a5,80002e6c <_ZN6Cradle4peakEv+0x28>
        return head->time_left;
    80002e5c:	0087a503          	lw	a0,8(a5)
    else
        return -1;
}
    80002e60:	00813403          	ld	s0,8(sp)
    80002e64:	01010113          	addi	sp,sp,16
    80002e68:	00008067          	ret
        return -1;
    80002e6c:	fff00513          	li	a0,-1
    80002e70:	ff1ff06f          	j	80002e60 <_ZN6Cradle4peakEv+0x1c>

0000000080002e74 <_ZN6Cradle8is_emptyEv>:

bool Cradle::is_empty() {
    80002e74:	ff010113          	addi	sp,sp,-16
    80002e78:	00813423          	sd	s0,8(sp)
    80002e7c:	01010413          	addi	s0,sp,16
    return head == nullptr;
}
    80002e80:	00006517          	auipc	a0,0x6
    80002e84:	48053503          	ld	a0,1152(a0) # 80009300 <_ZN6Cradle4headE>
    80002e88:	00153513          	seqz	a0,a0
    80002e8c:	00813403          	ld	s0,8(sp)
    80002e90:	01010113          	addi	sp,sp,16
    80002e94:	00008067          	ret

0000000080002e98 <_ZN6Cradle11_time_sleepEm>:

int Cradle::_time_sleep(time_t ms) {
    80002e98:	fe010113          	addi	sp,sp,-32
    80002e9c:	00113c23          	sd	ra,24(sp)
    80002ea0:	00813823          	sd	s0,16(sp)
    80002ea4:	00913423          	sd	s1,8(sp)
    80002ea8:	02010413          	addi	s0,sp,32
    80002eac:	00050593          	mv	a1,a0
    insert(TCB::running, ms);
    80002eb0:	00006497          	auipc	s1,0x6
    80002eb4:	3a04b483          	ld	s1,928(s1) # 80009250 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002eb8:	0004b503          	ld	a0,0(s1)
    80002ebc:	00000097          	auipc	ra,0x0
    80002ec0:	dbc080e7          	jalr	-580(ra) # 80002c78 <_ZN6Cradle6insertEP3TCBm>
    TCB::running->sleep();
    80002ec4:	0004b783          	ld	a5,0(s1)

    void sleep() { this->status = SLEEPING; }
    80002ec8:	00200713          	li	a4,2
    80002ecc:	04e7a423          	sw	a4,72(a5)
    TCB::_thread_dispatch();
    80002ed0:	00002097          	auipc	ra,0x2
    80002ed4:	cf0080e7          	jalr	-784(ra) # 80004bc0 <_ZN3TCB16_thread_dispatchEv>
    return 0;
}
    80002ed8:	00000513          	li	a0,0
    80002edc:	01813083          	ld	ra,24(sp)
    80002ee0:	01013403          	ld	s0,16(sp)
    80002ee4:	00813483          	ld	s1,8(sp)
    80002ee8:	02010113          	addi	sp,sp,32
    80002eec:	00008067          	ret

0000000080002ef0 <_ZN6Cradle12_thread_wakeEP3TCB>:
    bool is_sleeping() const { return this->status == SLEEPING; }
    80002ef0:	04852703          	lw	a4,72(a0)

int Cradle::_thread_wake(thread_t thread) {
    if (!thread->is_sleeping())
    80002ef4:	00200793          	li	a5,2
    80002ef8:	02f71e63          	bne	a4,a5,80002f34 <_ZN6Cradle12_thread_wakeEP3TCB+0x44>
int Cradle::_thread_wake(thread_t thread) {
    80002efc:	ff010113          	addi	sp,sp,-16
    80002f00:	00113423          	sd	ra,8(sp)
    80002f04:	00813023          	sd	s0,0(sp)
    80002f08:	01010413          	addi	s0,sp,16
    void run() { this->status = RUNNABLE; }
    80002f0c:	04052423          	sw	zero,72(a0)
        return -1;
    thread->run();
    Scheduler::put(thread);
    80002f10:	00001097          	auipc	ra,0x1
    80002f14:	310080e7          	jalr	784(ra) # 80004220 <_ZN9Scheduler3putEP3TCB>
    TCB::_thread_dispatch();
    80002f18:	00002097          	auipc	ra,0x2
    80002f1c:	ca8080e7          	jalr	-856(ra) # 80004bc0 <_ZN3TCB16_thread_dispatchEv>
    return 0;
    80002f20:	00000513          	li	a0,0
}
    80002f24:	00813083          	ld	ra,8(sp)
    80002f28:	00013403          	ld	s0,0(sp)
    80002f2c:	01010113          	addi	sp,sp,16
    80002f30:	00008067          	ret
        return -1;
    80002f34:	fff00513          	li	a0,-1
}
    80002f38:	00008067          	ret

0000000080002f3c <_Z8userMainv>:
#include "../h/iostream.hpp"
#include "../h/smart_pointer.hpp"
#include "../h/vector.hpp"


int userMain() {
    80002f3c:	ff010113          	addi	sp,sp,-16
    80002f40:	00113423          	sd	ra,8(sp)
    80002f44:	00813023          	sd	s0,0(sp)
    80002f48:	01010413          	addi	s0,sp,16
    dramatic_print("Hello There!! Welcome to my Operating System.");
    80002f4c:	00004517          	auipc	a0,0x4
    80002f50:	0ec50513          	addi	a0,a0,236 # 80007038 <CONSOLE_STATUS+0x28>
    80002f54:	fffff097          	auipc	ra,0xfffff
    80002f58:	7d0080e7          	jalr	2000(ra) # 80002724 <_Z14dramatic_printPKc>
    return 0;
    80002f5c:	00000513          	li	a0,0
    80002f60:	00813083          	ld	ra,8(sp)
    80002f64:	00013403          	ld	s0,0(sp)
    80002f68:	01010113          	addi	sp,sp,16
    80002f6c:	00008067          	ret

0000000080002f70 <_ZN9Allocator8mem_initEv>:
#include "../h/c_memory.hpp"
#include "../h/iostream.hpp"

Allocator::MemoryBlock *Allocator::free_pointer = nullptr;

void Allocator::mem_init() {
    80002f70:	ff010113          	addi	sp,sp,-16
    80002f74:	00813423          	sd	s0,8(sp)
    80002f78:	01010413          	addi	s0,sp,16
    Allocator::free_pointer = (Allocator::MemoryBlock *) HEAP_START_ADDR;
    80002f7c:	00006797          	auipc	a5,0x6
    80002f80:	2947b783          	ld	a5,660(a5) # 80009210 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002f84:	0007b703          	ld	a4,0(a5)
    80002f88:	00006797          	auipc	a5,0x6
    80002f8c:	38e7b423          	sd	a4,904(a5) # 80009310 <_ZN9Allocator12free_pointerE>
    *Allocator::free_pointer = {nullptr, reinterpret_cast<uint64>(HEAP_END_ADDR) -
    80002f90:	00006797          	auipc	a5,0x6
    80002f94:	2c87b783          	ld	a5,712(a5) # 80009258 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002f98:	0007b783          	ld	a5,0(a5)
    80002f9c:	40e787b3          	sub	a5,a5,a4
                                         reinterpret_cast<uint64>(HEAP_START_ADDR) - Allocator::HEADER_SIZE};
    80002fa0:	ff078793          	addi	a5,a5,-16
    *Allocator::free_pointer = {nullptr, reinterpret_cast<uint64>(HEAP_END_ADDR) -
    80002fa4:	00073023          	sd	zero,0(a4)
    80002fa8:	00f73423          	sd	a5,8(a4)
}
    80002fac:	00813403          	ld	s0,8(sp)
    80002fb0:	01010113          	addi	sp,sp,16
    80002fb4:	00008067          	ret

0000000080002fb8 <_ZN9Allocator10_mem_allocEm>:

void *Allocator::_mem_alloc(size_t size) {
    80002fb8:	ff010113          	addi	sp,sp,-16
    80002fbc:	00813423          	sd	s0,8(sp)
    80002fc0:	01010413          	addi	s0,sp,16
    80002fc4:	00050793          	mv	a5,a0
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    80002fc8:	00006517          	auipc	a0,0x6
    80002fcc:	34853503          	ld	a0,840(a0) # 80009310 <_ZN9Allocator12free_pointerE>
    if (available && available->size < size) {
    80002fd0:	02050863          	beqz	a0,80003000 <_ZN9Allocator10_mem_allocEm+0x48>
    80002fd4:	00853703          	ld	a4,8(a0)
    80002fd8:	02f77863          	bgeu	a4,a5,80003008 <_ZN9Allocator10_mem_allocEm+0x50>
        for (previous = available, available = available->next; available && available->size < size;
    80002fdc:	00050693          	mv	a3,a0
    80002fe0:	00053503          	ld	a0,0(a0)
    80002fe4:	00c0006f          	j	80002ff0 <_ZN9Allocator10_mem_allocEm+0x38>
             previous = available, available = available->next);
    80002fe8:	00050693          	mv	a3,a0
    80002fec:	00053503          	ld	a0,0(a0)
        for (previous = available, available = available->next; available && available->size < size;
    80002ff0:	00050e63          	beqz	a0,8000300c <_ZN9Allocator10_mem_allocEm+0x54>
    80002ff4:	00853703          	ld	a4,8(a0)
    80002ff8:	fef768e3          	bltu	a4,a5,80002fe8 <_ZN9Allocator10_mem_allocEm+0x30>
    80002ffc:	0100006f          	j	8000300c <_ZN9Allocator10_mem_allocEm+0x54>
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    80003000:	00050693          	mv	a3,a0
    80003004:	0080006f          	j	8000300c <_ZN9Allocator10_mem_allocEm+0x54>
    80003008:	00000693          	li	a3,0
    }
    if (!available) return nullptr;
    8000300c:	04050463          	beqz	a0,80003054 <_ZN9Allocator10_mem_allocEm+0x9c>
    if (available->size > Allocator::HEADER_SIZE + size) {
    80003010:	00853703          	ld	a4,8(a0)
    80003014:	01078613          	addi	a2,a5,16
    80003018:	04e67463          	bgeu	a2,a4,80003060 <_ZN9Allocator10_mem_allocEm+0xa8>
        uint64 next_size = available->size - size - Allocator::HEADER_SIZE;
    8000301c:	40f70733          	sub	a4,a4,a5
    80003020:	ff070713          	addi	a4,a4,-16
        available->size = size;
    80003024:	00f53423          	sd	a5,8(a0)
        next_node = reinterpret_cast<Allocator::MemoryBlock *>(reinterpret_cast<uint64>(available) +
                                                               Allocator::HEADER_SIZE + size);
    80003028:	00f507b3          	add	a5,a0,a5
    8000302c:	01078613          	addi	a2,a5,16
        next_node->next = available->next;
    80003030:	00053583          	ld	a1,0(a0)
    80003034:	00b7b823          	sd	a1,16(a5)
        next_node->size = next_size;
    80003038:	00e63423          	sd	a4,8(a2)
    } else {
        next_node = available->next;
    }
    available->next = reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(available) ^ available->size);
    8000303c:	00853783          	ld	a5,8(a0)
    80003040:	00f547b3          	xor	a5,a0,a5
    80003044:	00f53023          	sd	a5,0(a0)
    if (previous) previous->next = next_node;
    80003048:	02068063          	beqz	a3,80003068 <_ZN9Allocator10_mem_allocEm+0xb0>
    8000304c:	00c6b023          	sd	a2,0(a3)
    else Allocator::free_pointer = next_node;
    return (void *) (available + 1);
    80003050:	01050513          	addi	a0,a0,16
}
    80003054:	00813403          	ld	s0,8(sp)
    80003058:	01010113          	addi	sp,sp,16
    8000305c:	00008067          	ret
        next_node = available->next;
    80003060:	00053603          	ld	a2,0(a0)
    80003064:	fd9ff06f          	j	8000303c <_ZN9Allocator10_mem_allocEm+0x84>
    else Allocator::free_pointer = next_node;
    80003068:	00006797          	auipc	a5,0x6
    8000306c:	2ac7b423          	sd	a2,680(a5) # 80009310 <_ZN9Allocator12free_pointerE>
    80003070:	fe1ff06f          	j	80003050 <_ZN9Allocator10_mem_allocEm+0x98>

0000000080003074 <_ZN9Allocator9_mem_freeEPKv>:

int Allocator::_mem_free(const void *pointer) {
    80003074:	ff010113          	addi	sp,sp,-16
    80003078:	00813423          	sd	s0,8(sp)
    8000307c:	01010413          	addi	s0,sp,16
    Allocator::MemoryBlock *freed = (Allocator::MemoryBlock *) pointer - 1;
    80003080:	ff050693          	addi	a3,a0,-16
    if (freed < HEAP_START_ADDR) return -1;
    80003084:	00006797          	auipc	a5,0x6
    80003088:	18c7b783          	ld	a5,396(a5) # 80009210 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000308c:	0007b783          	ld	a5,0(a5)
    80003090:	0cf6ec63          	bltu	a3,a5,80003168 <_ZN9Allocator9_mem_freeEPKv+0xf4>
    if (freed->next != reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(freed) ^ freed->size)) return -2;
    80003094:	ff053703          	ld	a4,-16(a0)
    80003098:	ff853783          	ld	a5,-8(a0)
    8000309c:	00068813          	mv	a6,a3
    800030a0:	00d7c7b3          	xor	a5,a5,a3
    800030a4:	0cf71663          	bne	a4,a5,80003170 <_ZN9Allocator9_mem_freeEPKv+0xfc>
    Allocator::MemoryBlock *previous = Allocator::free_pointer, *next_node;
    800030a8:	00006717          	auipc	a4,0x6
    800030ac:	26873703          	ld	a4,616(a4) # 80009310 <_ZN9Allocator12free_pointerE>
    if (freed < Allocator::free_pointer) {
    800030b0:	04e6fe63          	bgeu	a3,a4,8000310c <_ZN9Allocator9_mem_freeEPKv+0x98>
        next_node = Allocator::free_pointer;
        Allocator::free_pointer = freed;
    800030b4:	00006797          	auipc	a5,0x6
    800030b8:	24d7be23          	sd	a3,604(a5) # 80009310 <_ZN9Allocator12free_pointerE>
        next_node = Allocator::free_pointer;
    800030bc:	00070793          	mv	a5,a4
        previous = nullptr;
    800030c0:	00000713          	li	a4,0
inline bool Allocator::adjacent(Allocator::MemoryBlock *block1, Allocator::MemoryBlock *block2) {
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
}

inline void Allocator::merge(MemoryBlock *block1, MemoryBlock *block2) {
    if (!block1) return;
    800030c4:	00068e63          	beqz	a3,800030e0 <_ZN9Allocator9_mem_freeEPKv+0x6c>
    if (block2 && Allocator::adjacent(block1, block2)) {
    800030c8:	00078a63          	beqz	a5,800030dc <_ZN9Allocator9_mem_freeEPKv+0x68>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    800030cc:	ff853583          	ld	a1,-8(a0)
    800030d0:	00b68633          	add	a2,a3,a1
    800030d4:	01060613          	addi	a2,a2,16
    if (block2 && Allocator::adjacent(block1, block2)) {
    800030d8:	04f60a63          	beq	a2,a5,8000312c <_ZN9Allocator9_mem_freeEPKv+0xb8>
        block1->next = block2->next;
        block1->size += Allocator::HEADER_SIZE + block2->size;
    } else {
        block1->next = block2;
    800030dc:	fef53823          	sd	a5,-16(a0)
    if (!block1) return;
    800030e0:	08070c63          	beqz	a4,80003178 <_ZN9Allocator9_mem_freeEPKv+0x104>
    if (block2 && Allocator::adjacent(block1, block2)) {
    800030e4:	00068a63          	beqz	a3,800030f8 <_ZN9Allocator9_mem_freeEPKv+0x84>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    800030e8:	00873603          	ld	a2,8(a4)
    800030ec:	00c707b3          	add	a5,a4,a2
    800030f0:	01078793          	addi	a5,a5,16
    if (block2 && Allocator::adjacent(block1, block2)) {
    800030f4:	04f80a63          	beq	a6,a5,80003148 <_ZN9Allocator9_mem_freeEPKv+0xd4>
        block1->next = block2;
    800030f8:	00d73023          	sd	a3,0(a4)
    return 0;
    800030fc:	00000513          	li	a0,0
}
    80003100:	00813403          	ld	s0,8(sp)
    80003104:	01010113          	addi	sp,sp,16
    80003108:	00008067          	ret
        for (next_node = previous->next; next_node && !(previous < freed && next_node > freed);
    8000310c:	00073783          	ld	a5,0(a4)
    80003110:	00c0006f          	j	8000311c <_ZN9Allocator9_mem_freeEPKv+0xa8>
             previous = next_node, next_node = next_node->next);
    80003114:	00078713          	mv	a4,a5
    80003118:	0007b783          	ld	a5,0(a5)
        for (next_node = previous->next; next_node && !(previous < freed && next_node > freed);
    8000311c:	fa0784e3          	beqz	a5,800030c4 <_ZN9Allocator9_mem_freeEPKv+0x50>
    80003120:	fed77ae3          	bgeu	a4,a3,80003114 <_ZN9Allocator9_mem_freeEPKv+0xa0>
    80003124:	fef6f8e3          	bgeu	a3,a5,80003114 <_ZN9Allocator9_mem_freeEPKv+0xa0>
    80003128:	f9dff06f          	j	800030c4 <_ZN9Allocator9_mem_freeEPKv+0x50>
        block1->next = block2->next;
    8000312c:	0007b603          	ld	a2,0(a5)
    80003130:	fec53823          	sd	a2,-16(a0)
        block1->size += Allocator::HEADER_SIZE + block2->size;
    80003134:	0087b783          	ld	a5,8(a5)
    80003138:	00f585b3          	add	a1,a1,a5
    8000313c:	01058593          	addi	a1,a1,16
    80003140:	feb53c23          	sd	a1,-8(a0)
    80003144:	f9dff06f          	j	800030e0 <_ZN9Allocator9_mem_freeEPKv+0x6c>
        block1->next = block2->next;
    80003148:	ff053783          	ld	a5,-16(a0)
    8000314c:	00f73023          	sd	a5,0(a4)
        block1->size += Allocator::HEADER_SIZE + block2->size;
    80003150:	ff853783          	ld	a5,-8(a0)
    80003154:	00f60633          	add	a2,a2,a5
    80003158:	01060613          	addi	a2,a2,16
    8000315c:	00c73423          	sd	a2,8(a4)
    return 0;
    80003160:	00000513          	li	a0,0
    80003164:	f9dff06f          	j	80003100 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    if (freed < HEAP_START_ADDR) return -1;
    80003168:	fff00513          	li	a0,-1
    8000316c:	f95ff06f          	j	80003100 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    if (freed->next != reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(freed) ^ freed->size)) return -2;
    80003170:	ffe00513          	li	a0,-2
    80003174:	f8dff06f          	j	80003100 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    return 0;
    80003178:	00000513          	li	a0,0
    8000317c:	f85ff06f          	j	80003100 <_ZN9Allocator9_mem_freeEPKv+0x8c>

0000000080003180 <_ZN9Allocator9mem_checkEv>:
    }
}

__attribute__((unused))
bool Allocator::mem_check() {
    80003180:	ff010113          	addi	sp,sp,-16
    80003184:	00813423          	sd	s0,8(sp)
    80003188:	01010413          	addi	s0,sp,16
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    8000318c:	00006717          	auipc	a4,0x6
    80003190:	18473703          	ld	a4,388(a4) # 80009310 <_ZN9Allocator12free_pointerE>
    80003194:	00070793          	mv	a5,a4
    80003198:	00073703          	ld	a4,0(a4)
    8000319c:	00070e63          	beqz	a4,800031b8 <_ZN9Allocator9mem_checkEv+0x38>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    800031a0:	0087b683          	ld	a3,8(a5)
    800031a4:	00d787b3          	add	a5,a5,a3
    800031a8:	01078793          	addi	a5,a5,16
        if (Allocator::adjacent(curr, curr->next)) return false;
    800031ac:	fee794e3          	bne	a5,a4,80003194 <_ZN9Allocator9mem_checkEv+0x14>
    800031b0:	00000513          	li	a0,0
    800031b4:	0080006f          	j	800031bc <_ZN9Allocator9mem_checkEv+0x3c>
    }
    return true;
    800031b8:	00100513          	li	a0,1
}
    800031bc:	00813403          	ld	s0,8(sp)
    800031c0:	01010113          	addi	sp,sp,16
    800031c4:	00008067          	ret

00000000800031c8 <_ZN9Allocator8mem_showEv>:

__attribute__((unused))
void Allocator::mem_show() {
    800031c8:	fe010113          	addi	sp,sp,-32
    800031cc:	00113c23          	sd	ra,24(sp)
    800031d0:	00813823          	sd	s0,16(sp)
    800031d4:	00913423          	sd	s1,8(sp)
    800031d8:	02010413          	addi	s0,sp,32
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    800031dc:	00006497          	auipc	s1,0x6
    800031e0:	1344b483          	ld	s1,308(s1) # 80009310 <_ZN9Allocator12free_pointerE>
    800031e4:	0004b783          	ld	a5,0(s1)
    800031e8:	04078e63          	beqz	a5,80003244 <_ZN9Allocator8mem_showEv+0x7c>
        stm::cout << curr << stm::endl << curr->next << stm::endl << stm::endl;
    800031ec:	00048593          	mv	a1,s1
    800031f0:	00006517          	auipc	a0,0x6
    800031f4:	08053503          	ld	a0,128(a0) # 80009270 <_GLOBAL_OFFSET_TABLE_+0x90>
    800031f8:	00000097          	auipc	ra,0x0
    800031fc:	238080e7          	jalr	568(ra) # 80003430 <_ZNK3stm7istreamlsEPv>
    80003200:	00006597          	auipc	a1,0x6
    80003204:	0405b583          	ld	a1,64(a1) # 80009240 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003208:	00000097          	auipc	ra,0x0
    8000320c:	2b4080e7          	jalr	692(ra) # 800034bc <_ZNK3stm7istreamlsERKNS_7endlineE>
    80003210:	0004b583          	ld	a1,0(s1)
    80003214:	00000097          	auipc	ra,0x0
    80003218:	21c080e7          	jalr	540(ra) # 80003430 <_ZNK3stm7istreamlsEPv>
    8000321c:	00006597          	auipc	a1,0x6
    80003220:	0245b583          	ld	a1,36(a1) # 80009240 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003224:	00000097          	auipc	ra,0x0
    80003228:	298080e7          	jalr	664(ra) # 800034bc <_ZNK3stm7istreamlsERKNS_7endlineE>
    8000322c:	00006597          	auipc	a1,0x6
    80003230:	0145b583          	ld	a1,20(a1) # 80009240 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003234:	00000097          	auipc	ra,0x0
    80003238:	288080e7          	jalr	648(ra) # 800034bc <_ZNK3stm7istreamlsERKNS_7endlineE>
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    8000323c:	0004b483          	ld	s1,0(s1)
    80003240:	fa5ff06f          	j	800031e4 <_ZN9Allocator8mem_showEv+0x1c>
    }
}
    80003244:	01813083          	ld	ra,24(sp)
    80003248:	01013403          	ld	s0,16(sp)
    8000324c:	00813483          	ld	s1,8(sp)
    80003250:	02010113          	addi	sp,sp,32
    80003254:	00008067          	ret

0000000080003258 <_ZN9Allocator8mem_sizeEv>:

__attribute__((unused))
int Allocator::mem_size() {
    80003258:	ff010113          	addi	sp,sp,-16
    8000325c:	00813423          	sd	s0,8(sp)
    80003260:	01010413          	addi	s0,sp,16
    int i = 0;
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr; i += curr->size, curr = curr->next);
    80003264:	00006797          	auipc	a5,0x6
    80003268:	0ac7b783          	ld	a5,172(a5) # 80009310 <_ZN9Allocator12free_pointerE>
    int i = 0;
    8000326c:	00000513          	li	a0,0
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr; i += curr->size, curr = curr->next);
    80003270:	00078a63          	beqz	a5,80003284 <_ZN9Allocator8mem_sizeEv+0x2c>
    80003274:	0087b703          	ld	a4,8(a5)
    80003278:	00a7053b          	addw	a0,a4,a0
    8000327c:	0007b783          	ld	a5,0(a5)
    80003280:	ff1ff06f          	j	80003270 <_ZN9Allocator8mem_sizeEv+0x18>
    return i;
}
    80003284:	00813403          	ld	s0,8(sp)
    80003288:	01010113          	addi	sp,sp,16
    8000328c:	00008067          	ret

0000000080003290 <_Z6memcpyPKvS0_i>:

void memcpy(const void *src, const void *dst, int len) {
    80003290:	ff010113          	addi	sp,sp,-16
    80003294:	00813423          	sd	s0,8(sp)
    80003298:	01010413          	addi	s0,sp,16
    char *src1 = (char *) src;
    char *dst1 = (char *) dst;
    for (int i = 0; i < len; i++)
    8000329c:	00000793          	li	a5,0
    800032a0:	00c7de63          	bge	a5,a2,800032bc <_Z6memcpyPKvS0_i+0x2c>
        dst1[i] = src1[i];
    800032a4:	00f58733          	add	a4,a1,a5
    800032a8:	00f506b3          	add	a3,a0,a5
    800032ac:	0006c683          	lbu	a3,0(a3)
    800032b0:	00d70023          	sb	a3,0(a4)
    for (int i = 0; i < len; i++)
    800032b4:	0017879b          	addiw	a5,a5,1
    800032b8:	fe9ff06f          	j	800032a0 <_Z6memcpyPKvS0_i+0x10>
    800032bc:	00813403          	ld	s0,8(sp)
    800032c0:	01010113          	addi	sp,sp,16
    800032c4:	00008067          	ret

00000000800032c8 <_ZNK3stm7istreamlsEc>:
#include "../h/string.hpp"

const stm::istream stm::cout;
const stm::endline stm::endl;

const stm::istream &stm::istream::operator<<(const char c) const {
    800032c8:	fe010113          	addi	sp,sp,-32
    800032cc:	00113c23          	sd	ra,24(sp)
    800032d0:	00813823          	sd	s0,16(sp)
    800032d4:	00913423          	sd	s1,8(sp)
    800032d8:	02010413          	addi	s0,sp,32
    800032dc:	00050493          	mv	s1,a0
    putc(c);
    800032e0:	00058513          	mv	a0,a1
    800032e4:	ffffe097          	auipc	ra,0xffffe
    800032e8:	70c080e7          	jalr	1804(ra) # 800019f0 <_Z4putcc>
    return *this;
}
    800032ec:	00048513          	mv	a0,s1
    800032f0:	01813083          	ld	ra,24(sp)
    800032f4:	01013403          	ld	s0,16(sp)
    800032f8:	00813483          	ld	s1,8(sp)
    800032fc:	02010113          	addi	sp,sp,32
    80003300:	00008067          	ret

0000000080003304 <_ZNK3stm7istreamlsEPKc>:

const stm::istream &stm::istream::operator<<(const char *string) const {
    80003304:	fe010113          	addi	sp,sp,-32
    80003308:	00113c23          	sd	ra,24(sp)
    8000330c:	00813823          	sd	s0,16(sp)
    80003310:	00913423          	sd	s1,8(sp)
    80003314:	02010413          	addi	s0,sp,32
    80003318:	00050493          	mv	s1,a0
    print(string);
    8000331c:	00058513          	mv	a0,a1
    80003320:	fffff097          	auipc	ra,0xfffff
    80003324:	380080e7          	jalr	896(ra) # 800026a0 <_Z5printPKc>
    return *this;
}
    80003328:	00048513          	mv	a0,s1
    8000332c:	01813083          	ld	ra,24(sp)
    80003330:	01013403          	ld	s0,16(sp)
    80003334:	00813483          	ld	s1,8(sp)
    80003338:	02010113          	addi	sp,sp,32
    8000333c:	00008067          	ret

0000000080003340 <_ZNK3stm7istreamlsERKNS_6StringE>:

const stm::istream &stm::istream::operator<<(const stm::String &string) const {
    80003340:	fe010113          	addi	sp,sp,-32
    80003344:	00113c23          	sd	ra,24(sp)
    80003348:	00813823          	sd	s0,16(sp)
    8000334c:	00913423          	sd	s1,8(sp)
    80003350:	02010413          	addi	s0,sp,32
    80003354:	00050493          	mv	s1,a0
    print(string.actual_string);
    80003358:	0085b503          	ld	a0,8(a1)
    8000335c:	fffff097          	auipc	ra,0xfffff
    80003360:	344080e7          	jalr	836(ra) # 800026a0 <_Z5printPKc>
    return *this;
}
    80003364:	00048513          	mv	a0,s1
    80003368:	01813083          	ld	ra,24(sp)
    8000336c:	01013403          	ld	s0,16(sp)
    80003370:	00813483          	ld	s1,8(sp)
    80003374:	02010113          	addi	sp,sp,32
    80003378:	00008067          	ret

000000008000337c <_ZNK3stm7istreamlsEx>:

const stm::istream &stm::istream::operator<<(long long number) const {
    8000337c:	fe010113          	addi	sp,sp,-32
    80003380:	00113c23          	sd	ra,24(sp)
    80003384:	00813823          	sd	s0,16(sp)
    80003388:	00913423          	sd	s1,8(sp)
    8000338c:	02010413          	addi	s0,sp,32
    80003390:	00050493          	mv	s1,a0
    print(number);
    80003394:	00058513          	mv	a0,a1
    80003398:	fffff097          	auipc	ra,0xfffff
    8000339c:	41c080e7          	jalr	1052(ra) # 800027b4 <_Z5printx>
    return *this;
}
    800033a0:	00048513          	mv	a0,s1
    800033a4:	01813083          	ld	ra,24(sp)
    800033a8:	01013403          	ld	s0,16(sp)
    800033ac:	00813483          	ld	s1,8(sp)
    800033b0:	02010113          	addi	sp,sp,32
    800033b4:	00008067          	ret

00000000800033b8 <_ZNK3stm7istreamlsEi>:

const stm::istream &stm::istream::operator<<(int number) const {
    800033b8:	fe010113          	addi	sp,sp,-32
    800033bc:	00113c23          	sd	ra,24(sp)
    800033c0:	00813823          	sd	s0,16(sp)
    800033c4:	00913423          	sd	s1,8(sp)
    800033c8:	02010413          	addi	s0,sp,32
    800033cc:	00050493          	mv	s1,a0
    print(number);
    800033d0:	00058513          	mv	a0,a1
    800033d4:	fffff097          	auipc	ra,0xfffff
    800033d8:	428080e7          	jalr	1064(ra) # 800027fc <_Z5printi>
    return *this;
}
    800033dc:	00048513          	mv	a0,s1
    800033e0:	01813083          	ld	ra,24(sp)
    800033e4:	01013403          	ld	s0,16(sp)
    800033e8:	00813483          	ld	s1,8(sp)
    800033ec:	02010113          	addi	sp,sp,32
    800033f0:	00008067          	ret

00000000800033f4 <_ZNK3stm7istreamlsEm>:

const stm::istream &stm::istream::operator<<(uint64 number) const {
    800033f4:	fe010113          	addi	sp,sp,-32
    800033f8:	00113c23          	sd	ra,24(sp)
    800033fc:	00813823          	sd	s0,16(sp)
    80003400:	00913423          	sd	s1,8(sp)
    80003404:	02010413          	addi	s0,sp,32
    80003408:	00050493          	mv	s1,a0
    print(number);
    8000340c:	00058513          	mv	a0,a1
    80003410:	fffff097          	auipc	ra,0xfffff
    80003414:	414080e7          	jalr	1044(ra) # 80002824 <_Z5printm>
    return *this;
}
    80003418:	00048513          	mv	a0,s1
    8000341c:	01813083          	ld	ra,24(sp)
    80003420:	01013403          	ld	s0,16(sp)
    80003424:	00813483          	ld	s1,8(sp)
    80003428:	02010113          	addi	sp,sp,32
    8000342c:	00008067          	ret

0000000080003430 <_ZNK3stm7istreamlsEPv>:

const stm::istream &stm::istream::operator<<(void *pointer) const {
    80003430:	fe010113          	addi	sp,sp,-32
    80003434:	00113c23          	sd	ra,24(sp)
    80003438:	00813823          	sd	s0,16(sp)
    8000343c:	00913423          	sd	s1,8(sp)
    80003440:	02010413          	addi	s0,sp,32
    80003444:	00050493          	mv	s1,a0
    print_h((uint64) pointer);
    80003448:	00058513          	mv	a0,a1
    8000344c:	fffff097          	auipc	ra,0xfffff
    80003450:	420080e7          	jalr	1056(ra) # 8000286c <_Z7print_hm>
    return *this;
}
    80003454:	00048513          	mv	a0,s1
    80003458:	01813083          	ld	ra,24(sp)
    8000345c:	01013403          	ld	s0,16(sp)
    80003460:	00813483          	ld	s1,8(sp)
    80003464:	02010113          	addi	sp,sp,32
    80003468:	00008067          	ret

000000008000346c <_ZNK3stm7istreamlsEb>:

const stm::istream &stm::istream::operator<<(bool truth) const {
    8000346c:	fe010113          	addi	sp,sp,-32
    80003470:	00113c23          	sd	ra,24(sp)
    80003474:	00813823          	sd	s0,16(sp)
    80003478:	00913423          	sd	s1,8(sp)
    8000347c:	02010413          	addi	s0,sp,32
    80003480:	00050493          	mv	s1,a0
    print(truth ? "true" : "false");
    80003484:	02058663          	beqz	a1,800034b0 <_ZNK3stm7istreamlsEb+0x44>
    80003488:	00004517          	auipc	a0,0x4
    8000348c:	be850513          	addi	a0,a0,-1048 # 80007070 <CONSOLE_STATUS+0x60>
    80003490:	fffff097          	auipc	ra,0xfffff
    80003494:	210080e7          	jalr	528(ra) # 800026a0 <_Z5printPKc>
    return *this;
}
    80003498:	00048513          	mv	a0,s1
    8000349c:	01813083          	ld	ra,24(sp)
    800034a0:	01013403          	ld	s0,16(sp)
    800034a4:	00813483          	ld	s1,8(sp)
    800034a8:	02010113          	addi	sp,sp,32
    800034ac:	00008067          	ret
    print(truth ? "true" : "false");
    800034b0:	00004517          	auipc	a0,0x4
    800034b4:	bb850513          	addi	a0,a0,-1096 # 80007068 <CONSOLE_STATUS+0x58>
    800034b8:	fd9ff06f          	j	80003490 <_ZNK3stm7istreamlsEb+0x24>

00000000800034bc <_ZNK3stm7istreamlsERKNS_7endlineE>:

const stm::istream &stm::istream::operator<<(const stm::endline &) const {
    800034bc:	fe010113          	addi	sp,sp,-32
    800034c0:	00113c23          	sd	ra,24(sp)
    800034c4:	00813823          	sd	s0,16(sp)
    800034c8:	00913423          	sd	s1,8(sp)
    800034cc:	02010413          	addi	s0,sp,32
    800034d0:	00050493          	mv	s1,a0
    putc('\n');
    800034d4:	00a00513          	li	a0,10
    800034d8:	ffffe097          	auipc	ra,0xffffe
    800034dc:	518080e7          	jalr	1304(ra) # 800019f0 <_Z4putcc>
    return *this;
}
    800034e0:	00048513          	mv	a0,s1
    800034e4:	01813083          	ld	ra,24(sp)
    800034e8:	01013403          	ld	s0,16(sp)
    800034ec:	00813483          	ld	s1,8(sp)
    800034f0:	02010113          	addi	sp,sp,32
    800034f4:	00008067          	ret

00000000800034f8 <_Z9bleya_nitPv>:
#include "../h/cpp_semaphores.hpp"
#include "../h/scheduler.hpp"
#include "../h/iostream.hpp"

[[noreturn]]
void bleya_nit(void *) {
    800034f8:	ff010113          	addi	sp,sp,-16
    800034fc:	00113423          	sd	ra,8(sp)
    80003500:	00813023          	sd	s0,0(sp)
    80003504:	01010413          	addi	s0,sp,16
    while (true) {
        thread_dispatch();
    80003508:	ffffe097          	auipc	ra,0xffffe
    8000350c:	104080e7          	jalr	260(ra) # 8000160c <_Z15thread_dispatchv>
    while (true) {
    80003510:	ff9ff06f          	j	80003508 <_Z9bleya_nitPv+0x10>

0000000080003514 <_Z11userWrapperPv>:
    TCB::running = handle_main;
    thread_create(&handle_bleya, &bleya_nit, nullptr);
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
}

void userWrapper(void *ret) {
    80003514:	fe010113          	addi	sp,sp,-32
    80003518:	00113c23          	sd	ra,24(sp)
    8000351c:	00813823          	sd	s0,16(sp)
    80003520:	00913423          	sd	s1,8(sp)
    80003524:	02010413          	addi	s0,sp,32
    80003528:	00050493          	mv	s1,a0
    *((int *) ret) = userMain();
    8000352c:	00000097          	auipc	ra,0x0
    80003530:	a10080e7          	jalr	-1520(ra) # 80002f3c <_Z8userMainv>
    80003534:	00a4a023          	sw	a0,0(s1)
}
    80003538:	01813083          	ld	ra,24(sp)
    8000353c:	01013403          	ld	s0,16(sp)
    80003540:	00813483          	ld	s1,8(sp)
    80003544:	02010113          	addi	sp,sp,32
    80003548:	00008067          	ret

000000008000354c <_Z4callv>:

int call() {
    8000354c:	fe010113          	addi	sp,sp,-32
    80003550:	00113c23          	sd	ra,24(sp)
    80003554:	00813823          	sd	s0,16(sp)
    80003558:	02010413          	addi	s0,sp,32
    thread_t userHandle;
    int ret;
    thread_create(&userHandle, userWrapper, &ret);
    8000355c:	fe440613          	addi	a2,s0,-28
    80003560:	00000597          	auipc	a1,0x0
    80003564:	fb458593          	addi	a1,a1,-76 # 80003514 <_Z11userWrapperPv>
    80003568:	fe840513          	addi	a0,s0,-24
    8000356c:	ffffe097          	auipc	ra,0xffffe
    80003570:	fcc080e7          	jalr	-52(ra) # 80001538 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_join(userHandle);
    80003574:	fe843503          	ld	a0,-24(s0)
    80003578:	ffffe097          	auipc	ra,0xffffe
    8000357c:	0d0080e7          	jalr	208(ra) # 80001648 <_Z11thread_joinP3TCB>
    return ret;
}
    80003580:	fe442503          	lw	a0,-28(s0)
    80003584:	01813083          	ld	ra,24(sp)
    80003588:	01013403          	ld	s0,16(sp)
    8000358c:	02010113          	addi	sp,sp,32
    80003590:	00008067          	ret

0000000080003594 <_Z3endi>:

int end(int ret) {
    80003594:	fe010113          	addi	sp,sp,-32
    80003598:	00113c23          	sd	ra,24(sp)
    8000359c:	00813823          	sd	s0,16(sp)
    800035a0:	00913423          	sd	s1,8(sp)
    800035a4:	02010413          	addi	s0,sp,32
    800035a8:	00050493          	mv	s1,a0
    print("\n\nProcess finished with exit code ");
    800035ac:	00004517          	auipc	a0,0x4
    800035b0:	adc50513          	addi	a0,a0,-1316 # 80007088 <_ZN3stm4coutE+0x8>
    800035b4:	fffff097          	auipc	ra,0xfffff
    800035b8:	0ec080e7          	jalr	236(ra) # 800026a0 <_Z5printPKc>
    print(ret);
    800035bc:	00048513          	mv	a0,s1
    800035c0:	fffff097          	auipc	ra,0xfffff
    800035c4:	23c080e7          	jalr	572(ra) # 800027fc <_Z5printi>
    print("\n\n");
    800035c8:	00004517          	auipc	a0,0x4
    800035cc:	ae850513          	addi	a0,a0,-1304 # 800070b0 <_ZN3stm4coutE+0x30>
    800035d0:	fffff097          	auipc	ra,0xfffff
    800035d4:	0d0080e7          	jalr	208(ra) # 800026a0 <_Z5printPKc>
        inline bool is_empty() const { return this->size == 0; }
    800035d8:	00006797          	auipc	a5,0x6
    800035dc:	c187b783          	ld	a5,-1000(a5) # 800091f0 <_GLOBAL_OFFSET_TABLE_+0x10>
    800035e0:	0107a783          	lw	a5,16(a5)
    while (!IO::Output.is_empty());
    800035e4:	fe079ae3          	bnez	a5,800035d8 <_Z3endi+0x44>
    time_sleep(10);
    800035e8:	00a00513          	li	a0,10
    800035ec:	ffffe097          	auipc	ra,0xffffe
    800035f0:	314080e7          	jalr	788(ra) # 80001900 <_Z10time_sleepm>
    return 0;
}
    800035f4:	00000513          	li	a0,0
    800035f8:	01813083          	ld	ra,24(sp)
    800035fc:	01013403          	ld	s0,16(sp)
    80003600:	00813483          	ld	s1,8(sp)
    80003604:	02010113          	addi	sp,sp,32
    80003608:	00008067          	ret

000000008000360c <main>:

int main() {
    8000360c:	ff010113          	addi	sp,sp,-16
    80003610:	00113423          	sd	ra,8(sp)
    80003614:	00813023          	sd	s0,0(sp)
    80003618:	01010413          	addi	s0,sp,16
    init();
    8000361c:	00000097          	auipc	ra,0x0
    80003620:	028080e7          	jalr	40(ra) # 80003644 <_Z4initv>
    int ret = call();
    80003624:	00000097          	auipc	ra,0x0
    80003628:	f28080e7          	jalr	-216(ra) # 8000354c <_Z4callv>
    return end(ret);
    8000362c:	00000097          	auipc	ra,0x0
    80003630:	f68080e7          	jalr	-152(ra) # 80003594 <_Z3endi>
    80003634:	00813083          	ld	ra,8(sp)
    80003638:	00013403          	ld	s0,0(sp)
    8000363c:	01010113          	addi	sp,sp,16
    80003640:	00008067          	ret

0000000080003644 <_Z4initv>:
inline void init() {
    80003644:	fd010113          	addi	sp,sp,-48
    80003648:	02113423          	sd	ra,40(sp)
    8000364c:	02813023          	sd	s0,32(sp)
    80003650:	00913c23          	sd	s1,24(sp)
    80003654:	01213823          	sd	s2,16(sp)
    80003658:	03010413          	addi	s0,sp,48
    __asm__ volatile("mv t0, %0": : "r" (&supervisorTrap));
    8000365c:	00006797          	auipc	a5,0x6
    80003660:	bbc7b783          	ld	a5,-1092(a5) # 80009218 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003664:	00078293          	mv	t0,a5
    __asm__ volatile("addi t0, t0, 1");
    80003668:	00128293          	addi	t0,t0,1
    __asm__ volatile("csrw stvec, t0");
    8000366c:	10529073          	csrw	stvec,t0
    Allocator::mem_init();
    80003670:	00000097          	auipc	ra,0x0
    80003674:	900080e7          	jalr	-1792(ra) # 80002f70 <_ZN9Allocator8mem_initEv>
    IO::init();
    80003678:	fffff097          	auipc	ra,0xfffff
    8000367c:	280080e7          	jalr	640(ra) # 800028f8 <_ZN2IO4initEv>
#include "syscall_c.hpp"

class Scheduler final {
public:

    static void init() { high_priority.init(); mid_priority.init(); low_priority.init(); }
    80003680:	00006517          	auipc	a0,0x6
    80003684:	be853503          	ld	a0,-1048(a0) # 80009268 <_GLOBAL_OFFSET_TABLE_+0x88>
    80003688:	fffff097          	auipc	ra,0xfffff
    8000368c:	e20080e7          	jalr	-480(ra) # 800024a8 <_ZN2os14CircularBufferIP3TCBE4initEv>
    80003690:	00006517          	auipc	a0,0x6
    80003694:	bb853503          	ld	a0,-1096(a0) # 80009248 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003698:	fffff097          	auipc	ra,0xfffff
    8000369c:	e10080e7          	jalr	-496(ra) # 800024a8 <_ZN2os14CircularBufferIP3TCBE4initEv>
    800036a0:	00006517          	auipc	a0,0x6
    800036a4:	b8053503          	ld	a0,-1152(a0) # 80009220 <_GLOBAL_OFFSET_TABLE_+0x40>
    800036a8:	fffff097          	auipc	ra,0xfffff
    800036ac:	e00080e7          	jalr	-512(ra) # 800024a8 <_ZN2os14CircularBufferIP3TCBE4initEv>
    printer = new OwnedMutex();
    800036b0:	02000513          	li	a0,32
    800036b4:	00000097          	auipc	ra,0x0
    800036b8:	1b4080e7          	jalr	436(ra) # 80003868 <_Znwm>
    800036bc:	00050493          	mv	s1,a0
    800036c0:	00001097          	auipc	ra,0x1
    800036c4:	da4080e7          	jalr	-604(ra) # 80004464 <_ZN10OwnedMutexC1Ev>
    800036c8:	00006797          	auipc	a5,0x6
    800036cc:	c497b823          	sd	s1,-944(a5) # 80009318 <printer>
    thread_create(&handle_main, nullptr, nullptr);
    800036d0:	00000613          	li	a2,0
    800036d4:	00000593          	li	a1,0
    800036d8:	fd840513          	addi	a0,s0,-40
    800036dc:	ffffe097          	auipc	ra,0xffffe
    800036e0:	e5c080e7          	jalr	-420(ra) # 80001538 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = handle_main;
    800036e4:	00006797          	auipc	a5,0x6
    800036e8:	b6c7b783          	ld	a5,-1172(a5) # 80009250 <_GLOBAL_OFFSET_TABLE_+0x70>
    800036ec:	fd843703          	ld	a4,-40(s0)
    800036f0:	00e7b023          	sd	a4,0(a5)
    thread_create(&handle_bleya, &bleya_nit, nullptr);
    800036f4:	00000613          	li	a2,0
    800036f8:	00000597          	auipc	a1,0x0
    800036fc:	e0058593          	addi	a1,a1,-512 # 800034f8 <_Z9bleya_nitPv>
    80003700:	00006517          	auipc	a0,0x6
    80003704:	c2050513          	addi	a0,a0,-992 # 80009320 <handle_bleya>
    80003708:	ffffe097          	auipc	ra,0xffffe
    8000370c:	e30080e7          	jalr	-464(ra) # 80001538 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80003710:	00200793          	li	a5,2
    80003714:	1007a073          	csrs	sstatus,a5
}
    80003718:	02813083          	ld	ra,40(sp)
    8000371c:	02013403          	ld	s0,32(sp)
    80003720:	01813483          	ld	s1,24(sp)
    80003724:	01013903          	ld	s2,16(sp)
    80003728:	03010113          	addi	sp,sp,48
    8000372c:	00008067          	ret
    80003730:	00050913          	mv	s2,a0
    printer = new OwnedMutex();
    80003734:	00048513          	mv	a0,s1
    80003738:	00000097          	auipc	ra,0x0
    8000373c:	180080e7          	jalr	384(ra) # 800038b8 <_ZdlPv>
    80003740:	00090513          	mv	a0,s2
    80003744:	00007097          	auipc	ra,0x7
    80003748:	d14080e7          	jalr	-748(ra) # 8000a458 <_Unwind_Resume>

000000008000374c <_ZN6Thread11threadStartEPv>:
Thread::Thread() {
    this->body = nullptr;
    this->arg = nullptr;
}

void Thread::threadStart(void *arg) {
    8000374c:	ff010113          	addi	sp,sp,-16
    80003750:	00113423          	sd	ra,8(sp)
    80003754:	00813023          	sd	s0,0(sp)
    80003758:	01010413          	addi	s0,sp,16
    Thread *thread = (Thread *) arg;
    if (thread->body) {
    8000375c:	01053783          	ld	a5,16(a0)
    80003760:	00078e63          	beqz	a5,8000377c <_ZN6Thread11threadStartEPv+0x30>
        thread->body(thread->arg);
    80003764:	01853503          	ld	a0,24(a0)
    80003768:	000780e7          	jalr	a5
    } else {
        thread->run();
    }
}
    8000376c:	00813083          	ld	ra,8(sp)
    80003770:	00013403          	ld	s0,0(sp)
    80003774:	01010113          	addi	sp,sp,16
    80003778:	00008067          	ret
        thread->run();
    8000377c:	00053783          	ld	a5,0(a0)
    80003780:	0107b783          	ld	a5,16(a5)
    80003784:	000780e7          	jalr	a5
}
    80003788:	fe5ff06f          	j	8000376c <_ZN6Thread11threadStartEPv+0x20>

000000008000378c <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    8000378c:	00006797          	auipc	a5,0x6
    80003790:	9ac78793          	addi	a5,a5,-1620 # 80009138 <_ZTV6Thread+0x10>
    80003794:	00f53023          	sd	a5,0(a0)
    if (myHandle->is_finished())
    80003798:	00853503          	ld	a0,8(a0)
    bool is_finished() const { return this->status == FINISHED; }
    8000379c:	04852703          	lw	a4,72(a0)
    800037a0:	00400793          	li	a5,4
    800037a4:	00f70463          	beq	a4,a5,800037ac <_ZN6ThreadD1Ev+0x20>
    800037a8:	00008067          	ret
        delete myHandle;
    800037ac:	fe050ee3          	beqz	a0,800037a8 <_ZN6ThreadD1Ev+0x1c>
Thread::~Thread() {
    800037b0:	ff010113          	addi	sp,sp,-16
    800037b4:	00113423          	sd	ra,8(sp)
    800037b8:	00813023          	sd	s0,0(sp)
    800037bc:	01010413          	addi	s0,sp,16
    void operator delete(void *pointer) { Allocator::_mem_free(pointer); }
    800037c0:	00000097          	auipc	ra,0x0
    800037c4:	8b4080e7          	jalr	-1868(ra) # 80003074 <_ZN9Allocator9_mem_freeEPKv>
}
    800037c8:	00813083          	ld	ra,8(sp)
    800037cc:	00013403          	ld	s0,0(sp)
    800037d0:	01010113          	addi	sp,sp,16
    800037d4:	00008067          	ret

00000000800037d8 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800037d8:	ff010113          	addi	sp,sp,-16
    800037dc:	00113423          	sd	ra,8(sp)
    800037e0:	00813023          	sd	s0,0(sp)
    800037e4:	01010413          	addi	s0,sp,16
    800037e8:	00006797          	auipc	a5,0x6
    800037ec:	97878793          	addi	a5,a5,-1672 # 80009160 <_ZTV9Semaphore+0x10>
    800037f0:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800037f4:	00853503          	ld	a0,8(a0)
    800037f8:	ffffe097          	auipc	ra,0xffffe
    800037fc:	fd8080e7          	jalr	-40(ra) # 800017d0 <_Z9sem_closeP3Sem>
}
    80003800:	00813083          	ld	ra,8(sp)
    80003804:	00013403          	ld	s0,0(sp)
    80003808:	01010113          	addi	sp,sp,16
    8000380c:	00008067          	ret

0000000080003810 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80003810:	ff010113          	addi	sp,sp,-16
    80003814:	00113423          	sd	ra,8(sp)
    80003818:	00813023          	sd	s0,0(sp)
    8000381c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80003820:	00853503          	ld	a0,8(a0)
    80003824:	ffffe097          	auipc	ra,0xffffe
    80003828:	ff8080e7          	jalr	-8(ra) # 8000181c <_Z8sem_waitP3Sem>
}
    8000382c:	00813083          	ld	ra,8(sp)
    80003830:	00013403          	ld	s0,0(sp)
    80003834:	01010113          	addi	sp,sp,16
    80003838:	00008067          	ret

000000008000383c <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    8000383c:	ff010113          	addi	sp,sp,-16
    80003840:	00113423          	sd	ra,8(sp)
    80003844:	00813023          	sd	s0,0(sp)
    80003848:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    8000384c:	00853503          	ld	a0,8(a0)
    80003850:	ffffe097          	auipc	ra,0xffffe
    80003854:	018080e7          	jalr	24(ra) # 80001868 <_Z10sem_signalP3Sem>
}
    80003858:	00813083          	ld	ra,8(sp)
    8000385c:	00013403          	ld	s0,0(sp)
    80003860:	01010113          	addi	sp,sp,16
    80003864:	00008067          	ret

0000000080003868 <_Znwm>:
void *operator new(size_t size) {
    80003868:	ff010113          	addi	sp,sp,-16
    8000386c:	00113423          	sd	ra,8(sp)
    80003870:	00813023          	sd	s0,0(sp)
    80003874:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003878:	ffffe097          	auipc	ra,0xffffe
    8000387c:	c28080e7          	jalr	-984(ra) # 800014a0 <_Z9mem_allocm>
}
    80003880:	00813083          	ld	ra,8(sp)
    80003884:	00013403          	ld	s0,0(sp)
    80003888:	01010113          	addi	sp,sp,16
    8000388c:	00008067          	ret

0000000080003890 <_Znam>:
void *operator new[](size_t size) {
    80003890:	ff010113          	addi	sp,sp,-16
    80003894:	00113423          	sd	ra,8(sp)
    80003898:	00813023          	sd	s0,0(sp)
    8000389c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    800038a0:	ffffe097          	auipc	ra,0xffffe
    800038a4:	c00080e7          	jalr	-1024(ra) # 800014a0 <_Z9mem_allocm>
}
    800038a8:	00813083          	ld	ra,8(sp)
    800038ac:	00013403          	ld	s0,0(sp)
    800038b0:	01010113          	addi	sp,sp,16
    800038b4:	00008067          	ret

00000000800038b8 <_ZdlPv>:
void operator delete(void *mem) {
    800038b8:	ff010113          	addi	sp,sp,-16
    800038bc:	00113423          	sd	ra,8(sp)
    800038c0:	00813023          	sd	s0,0(sp)
    800038c4:	01010413          	addi	s0,sp,16
    mem_free(mem);
    800038c8:	ffffe097          	auipc	ra,0xffffe
    800038cc:	c24080e7          	jalr	-988(ra) # 800014ec <_Z8mem_freePv>
}
    800038d0:	00813083          	ld	ra,8(sp)
    800038d4:	00013403          	ld	s0,0(sp)
    800038d8:	01010113          	addi	sp,sp,16
    800038dc:	00008067          	ret

00000000800038e0 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800038e0:	fe010113          	addi	sp,sp,-32
    800038e4:	00113c23          	sd	ra,24(sp)
    800038e8:	00813823          	sd	s0,16(sp)
    800038ec:	00913423          	sd	s1,8(sp)
    800038f0:	02010413          	addi	s0,sp,32
    800038f4:	00050493          	mv	s1,a0
}
    800038f8:	00000097          	auipc	ra,0x0
    800038fc:	e94080e7          	jalr	-364(ra) # 8000378c <_ZN6ThreadD1Ev>
    80003900:	00048513          	mv	a0,s1
    80003904:	00000097          	auipc	ra,0x0
    80003908:	fb4080e7          	jalr	-76(ra) # 800038b8 <_ZdlPv>
    8000390c:	01813083          	ld	ra,24(sp)
    80003910:	01013403          	ld	s0,16(sp)
    80003914:	00813483          	ld	s1,8(sp)
    80003918:	02010113          	addi	sp,sp,32
    8000391c:	00008067          	ret

0000000080003920 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80003920:	fe010113          	addi	sp,sp,-32
    80003924:	00113c23          	sd	ra,24(sp)
    80003928:	00813823          	sd	s0,16(sp)
    8000392c:	00913423          	sd	s1,8(sp)
    80003930:	02010413          	addi	s0,sp,32
    80003934:	00050493          	mv	s1,a0
}
    80003938:	00000097          	auipc	ra,0x0
    8000393c:	ea0080e7          	jalr	-352(ra) # 800037d8 <_ZN9SemaphoreD1Ev>
    80003940:	00048513          	mv	a0,s1
    80003944:	00000097          	auipc	ra,0x0
    80003948:	f74080e7          	jalr	-140(ra) # 800038b8 <_ZdlPv>
    8000394c:	01813083          	ld	ra,24(sp)
    80003950:	01013403          	ld	s0,16(sp)
    80003954:	00813483          	ld	s1,8(sp)
    80003958:	02010113          	addi	sp,sp,32
    8000395c:	00008067          	ret

0000000080003960 <_ZdaPv>:
void operator delete[](void *mem) {
    80003960:	ff010113          	addi	sp,sp,-16
    80003964:	00113423          	sd	ra,8(sp)
    80003968:	00813023          	sd	s0,0(sp)
    8000396c:	01010413          	addi	s0,sp,16
    mem_free(mem);
    80003970:	ffffe097          	auipc	ra,0xffffe
    80003974:	b7c080e7          	jalr	-1156(ra) # 800014ec <_Z8mem_freePv>
}
    80003978:	00813083          	ld	ra,8(sp)
    8000397c:	00013403          	ld	s0,0(sp)
    80003980:	01010113          	addi	sp,sp,16
    80003984:	00008067          	ret

0000000080003988 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80003988:	ff010113          	addi	sp,sp,-16
    8000398c:	00813423          	sd	s0,8(sp)
    80003990:	01010413          	addi	s0,sp,16
    80003994:	00005797          	auipc	a5,0x5
    80003998:	7a478793          	addi	a5,a5,1956 # 80009138 <_ZTV6Thread+0x10>
    8000399c:	00f53023          	sd	a5,0(a0)
    this->body = body;
    800039a0:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    800039a4:	00c53c23          	sd	a2,24(a0)
}
    800039a8:	00813403          	ld	s0,8(sp)
    800039ac:	01010113          	addi	sp,sp,16
    800039b0:	00008067          	ret

00000000800039b4 <_ZN6Thread5startEv>:
int Thread::start() {
    800039b4:	ff010113          	addi	sp,sp,-16
    800039b8:	00113423          	sd	ra,8(sp)
    800039bc:	00813023          	sd	s0,0(sp)
    800039c0:	01010413          	addi	s0,sp,16
    return thread_create(&myHandle, &threadStart, this);
    800039c4:	00050613          	mv	a2,a0
    800039c8:	00000597          	auipc	a1,0x0
    800039cc:	d8458593          	addi	a1,a1,-636 # 8000374c <_ZN6Thread11threadStartEPv>
    800039d0:	00850513          	addi	a0,a0,8
    800039d4:	ffffe097          	auipc	ra,0xffffe
    800039d8:	b64080e7          	jalr	-1180(ra) # 80001538 <_Z13thread_createPP3TCBPFvPvES2_>
}
    800039dc:	00813083          	ld	ra,8(sp)
    800039e0:	00013403          	ld	s0,0(sp)
    800039e4:	01010113          	addi	sp,sp,16
    800039e8:	00008067          	ret

00000000800039ec <_ZN6Thread4joinEv>:
void Thread::join() {
    800039ec:	ff010113          	addi	sp,sp,-16
    800039f0:	00113423          	sd	ra,8(sp)
    800039f4:	00813023          	sd	s0,0(sp)
    800039f8:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    800039fc:	00853503          	ld	a0,8(a0)
    80003a00:	ffffe097          	auipc	ra,0xffffe
    80003a04:	c48080e7          	jalr	-952(ra) # 80001648 <_Z11thread_joinP3TCB>
}
    80003a08:	00813083          	ld	ra,8(sp)
    80003a0c:	00013403          	ld	s0,0(sp)
    80003a10:	01010113          	addi	sp,sp,16
    80003a14:	00008067          	ret

0000000080003a18 <_ZN6Thread4joinEm>:
void Thread::join(time_t time) {
    80003a18:	ff010113          	addi	sp,sp,-16
    80003a1c:	00113423          	sd	ra,8(sp)
    80003a20:	00813023          	sd	s0,0(sp)
    80003a24:	01010413          	addi	s0,sp,16
    thread_join(myHandle, time);
    80003a28:	00853503          	ld	a0,8(a0)
    80003a2c:	ffffe097          	auipc	ra,0xffffe
    80003a30:	c58080e7          	jalr	-936(ra) # 80001684 <_Z11thread_joinP3TCBm>
}
    80003a34:	00813083          	ld	ra,8(sp)
    80003a38:	00013403          	ld	s0,0(sp)
    80003a3c:	01010113          	addi	sp,sp,16
    80003a40:	00008067          	ret

0000000080003a44 <_ZN6Thread4killEPS_>:
int Thread::kill(Thread *thread) {
    80003a44:	ff010113          	addi	sp,sp,-16
    80003a48:	00113423          	sd	ra,8(sp)
    80003a4c:	00813023          	sd	s0,0(sp)
    80003a50:	01010413          	addi	s0,sp,16
    return thread_kill(thread->myHandle);
    80003a54:	00853503          	ld	a0,8(a0)
    80003a58:	ffffe097          	auipc	ra,0xffffe
    80003a5c:	cdc080e7          	jalr	-804(ra) # 80001734 <_Z11thread_killP3TCB>
}
    80003a60:	00813083          	ld	ra,8(sp)
    80003a64:	00013403          	ld	s0,0(sp)
    80003a68:	01010113          	addi	sp,sp,16
    80003a6c:	00008067          	ret

0000000080003a70 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80003a70:	ff010113          	addi	sp,sp,-16
    80003a74:	00113423          	sd	ra,8(sp)
    80003a78:	00813023          	sd	s0,0(sp)
    80003a7c:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80003a80:	ffffe097          	auipc	ra,0xffffe
    80003a84:	b8c080e7          	jalr	-1140(ra) # 8000160c <_Z15thread_dispatchv>
}
    80003a88:	00813083          	ld	ra,8(sp)
    80003a8c:	00013403          	ld	s0,0(sp)
    80003a90:	01010113          	addi	sp,sp,16
    80003a94:	00008067          	ret

0000000080003a98 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t ms) {
    80003a98:	ff010113          	addi	sp,sp,-16
    80003a9c:	00113423          	sd	ra,8(sp)
    80003aa0:	00813023          	sd	s0,0(sp)
    80003aa4:	01010413          	addi	s0,sp,16
    return time_sleep(ms);
    80003aa8:	ffffe097          	auipc	ra,0xffffe
    80003aac:	e58080e7          	jalr	-424(ra) # 80001900 <_Z10time_sleepm>
}
    80003ab0:	00813083          	ld	ra,8(sp)
    80003ab4:	00013403          	ld	s0,0(sp)
    80003ab8:	01010113          	addi	sp,sp,16
    80003abc:	00008067          	ret

0000000080003ac0 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80003ac0:	ff010113          	addi	sp,sp,-16
    80003ac4:	00813423          	sd	s0,8(sp)
    80003ac8:	01010413          	addi	s0,sp,16
    80003acc:	00005797          	auipc	a5,0x5
    80003ad0:	66c78793          	addi	a5,a5,1644 # 80009138 <_ZTV6Thread+0x10>
    80003ad4:	00f53023          	sd	a5,0(a0)
    this->body = nullptr;
    80003ad8:	00053823          	sd	zero,16(a0)
    this->arg = nullptr;
    80003adc:	00053c23          	sd	zero,24(a0)
}
    80003ae0:	00813403          	ld	s0,8(sp)
    80003ae4:	01010113          	addi	sp,sp,16
    80003ae8:	00008067          	ret

0000000080003aec <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80003aec:	ff010113          	addi	sp,sp,-16
    80003af0:	00113423          	sd	ra,8(sp)
    80003af4:	00813023          	sd	s0,0(sp)
    80003af8:	01010413          	addi	s0,sp,16
    80003afc:	00005797          	auipc	a5,0x5
    80003b00:	66478793          	addi	a5,a5,1636 # 80009160 <_ZTV9Semaphore+0x10>
    80003b04:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80003b08:	00850513          	addi	a0,a0,8
    80003b0c:	ffffe097          	auipc	ra,0xffffe
    80003b10:	c74080e7          	jalr	-908(ra) # 80001780 <_Z8sem_openPP3Semj>
}
    80003b14:	00813083          	ld	ra,8(sp)
    80003b18:	00013403          	ld	s0,0(sp)
    80003b1c:	01010113          	addi	sp,sp,16
    80003b20:	00008067          	ret

0000000080003b24 <_ZN9Semaphore15signal_and_waitERS_S0_>:

int Semaphore::signal_and_wait(Semaphore &sem1, Semaphore &sem2) {
    80003b24:	ff010113          	addi	sp,sp,-16
    80003b28:	00113423          	sd	ra,8(sp)
    80003b2c:	00813023          	sd	s0,0(sp)
    80003b30:	01010413          	addi	s0,sp,16
    return ::signal_and_wait(sem1.myHandle, sem2.myHandle);
    80003b34:	0085b583          	ld	a1,8(a1)
    80003b38:	00853503          	ld	a0,8(a0)
    80003b3c:	ffffe097          	auipc	ra,0xffffe
    80003b40:	d78080e7          	jalr	-648(ra) # 800018b4 <_Z15signal_and_waitP3SemS0_>
}
    80003b44:	00813083          	ld	ra,8(sp)
    80003b48:	00013403          	ld	s0,0(sp)
    80003b4c:	01010113          	addi	sp,sp,16
    80003b50:	00008067          	ret

0000000080003b54 <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    80003b54:	ff010113          	addi	sp,sp,-16
    80003b58:	00113423          	sd	ra,8(sp)
    80003b5c:	00813023          	sd	s0,0(sp)
    80003b60:	01010413          	addi	s0,sp,16
    thread_exit();
    80003b64:	ffffe097          	auipc	ra,0xffffe
    80003b68:	a5c080e7          	jalr	-1444(ra) # 800015c0 <_Z11thread_exitv>
}
    80003b6c:	00813083          	ld	ra,8(sp)
    80003b70:	00013403          	ld	s0,0(sp)
    80003b74:	01010113          	addi	sp,sp,16
    80003b78:	00008067          	ret

0000000080003b7c <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    80003b7c:	fe010113          	addi	sp,sp,-32
    80003b80:	00113c23          	sd	ra,24(sp)
    80003b84:	00813823          	sd	s0,16(sp)
    80003b88:	00913423          	sd	s1,8(sp)
    80003b8c:	01213023          	sd	s2,0(sp)
    80003b90:	02010413          	addi	s0,sp,32
    80003b94:	00050493          	mv	s1,a0
    80003b98:	00058913          	mv	s2,a1
    80003b9c:	00000097          	auipc	ra,0x0
    80003ba0:	f24080e7          	jalr	-220(ra) # 80003ac0 <_ZN6ThreadC1Ev>
    80003ba4:	00005797          	auipc	a5,0x5
    80003ba8:	56478793          	addi	a5,a5,1380 # 80009108 <_ZTV14PeriodicThread+0x10>
    80003bac:	00f4b023          	sd	a5,0(s1)
    this->period = period;
    80003bb0:	0324b023          	sd	s2,32(s1)
}
    80003bb4:	01813083          	ld	ra,24(sp)
    80003bb8:	01013403          	ld	s0,16(sp)
    80003bbc:	00813483          	ld	s1,8(sp)
    80003bc0:	00013903          	ld	s2,0(sp)
    80003bc4:	02010113          	addi	sp,sp,32
    80003bc8:	00008067          	ret

0000000080003bcc <_ZN7Console4getcEv>:

char Console::getc() {
    80003bcc:	ff010113          	addi	sp,sp,-16
    80003bd0:	00113423          	sd	ra,8(sp)
    80003bd4:	00813023          	sd	s0,0(sp)
    80003bd8:	01010413          	addi	s0,sp,16
    return getc();
    80003bdc:	00000097          	auipc	ra,0x0
    80003be0:	ff0080e7          	jalr	-16(ra) # 80003bcc <_ZN7Console4getcEv>
}
    80003be4:	00813083          	ld	ra,8(sp)
    80003be8:	00013403          	ld	s0,0(sp)
    80003bec:	01010113          	addi	sp,sp,16
    80003bf0:	00008067          	ret

0000000080003bf4 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80003bf4:	ff010113          	addi	sp,sp,-16
    80003bf8:	00113423          	sd	ra,8(sp)
    80003bfc:	00813023          	sd	s0,0(sp)
    80003c00:	01010413          	addi	s0,sp,16
    putc(c);
    80003c04:	00000097          	auipc	ra,0x0
    80003c08:	ff0080e7          	jalr	-16(ra) # 80003bf4 <_ZN7Console4putcEc>
    80003c0c:	00813083          	ld	ra,8(sp)
    80003c10:	00013403          	ld	s0,0(sp)
    80003c14:	01010113          	addi	sp,sp,16
    80003c18:	00008067          	ret

0000000080003c1c <_ZN6Thread3runEv>:
    static void threadStart(void *);

protected:
    Thread();

    virtual void run() {}
    80003c1c:	ff010113          	addi	sp,sp,-16
    80003c20:	00813423          	sd	s0,8(sp)
    80003c24:	01010413          	addi	s0,sp,16
    80003c28:	00813403          	ld	s0,8(sp)
    80003c2c:	01010113          	addi	sp,sp,16
    80003c30:	00008067          	ret

0000000080003c34 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    explicit PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80003c34:	ff010113          	addi	sp,sp,-16
    80003c38:	00813423          	sd	s0,8(sp)
    80003c3c:	01010413          	addi	s0,sp,16
    80003c40:	00813403          	ld	s0,8(sp)
    80003c44:	01010113          	addi	sp,sp,16
    80003c48:	00008067          	ret

0000000080003c4c <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80003c4c:	ff010113          	addi	sp,sp,-16
    80003c50:	00113423          	sd	ra,8(sp)
    80003c54:	00813023          	sd	s0,0(sp)
    80003c58:	01010413          	addi	s0,sp,16
    80003c5c:	00005797          	auipc	a5,0x5
    80003c60:	4ac78793          	addi	a5,a5,1196 # 80009108 <_ZTV14PeriodicThread+0x10>
    80003c64:	00f53023          	sd	a5,0(a0)
    80003c68:	00000097          	auipc	ra,0x0
    80003c6c:	b24080e7          	jalr	-1244(ra) # 8000378c <_ZN6ThreadD1Ev>
    80003c70:	00813083          	ld	ra,8(sp)
    80003c74:	00013403          	ld	s0,0(sp)
    80003c78:	01010113          	addi	sp,sp,16
    80003c7c:	00008067          	ret

0000000080003c80 <_ZN14PeriodicThreadD0Ev>:
    80003c80:	fe010113          	addi	sp,sp,-32
    80003c84:	00113c23          	sd	ra,24(sp)
    80003c88:	00813823          	sd	s0,16(sp)
    80003c8c:	00913423          	sd	s1,8(sp)
    80003c90:	02010413          	addi	s0,sp,32
    80003c94:	00050493          	mv	s1,a0
    80003c98:	00005797          	auipc	a5,0x5
    80003c9c:	47078793          	addi	a5,a5,1136 # 80009108 <_ZTV14PeriodicThread+0x10>
    80003ca0:	00f53023          	sd	a5,0(a0)
    80003ca4:	00000097          	auipc	ra,0x0
    80003ca8:	ae8080e7          	jalr	-1304(ra) # 8000378c <_ZN6ThreadD1Ev>
    80003cac:	00048513          	mv	a0,s1
    80003cb0:	00000097          	auipc	ra,0x0
    80003cb4:	c08080e7          	jalr	-1016(ra) # 800038b8 <_ZdlPv>
    80003cb8:	01813083          	ld	ra,24(sp)
    80003cbc:	01013403          	ld	s0,16(sp)
    80003cc0:	00813483          	ld	s1,8(sp)
    80003cc4:	02010113          	addi	sp,sp,32
    80003cc8:	00008067          	ret

0000000080003ccc <_Z3truv>:
#include "../h/riscv.hpp"
#include "../h/c_console.hpp"
#include "../h/c_sleep.hpp"
#include "../h/scheduler.hpp"

bool tru() {
    80003ccc:	ff010113          	addi	sp,sp,-16
    80003cd0:	00813423          	sd	s0,8(sp)
    80003cd4:	01010413          	addi	s0,sp,16
    return true;
}
    80003cd8:	00100513          	li	a0,1
    80003cdc:	00813403          	ld	s0,8(sp)
    80003ce0:	01010113          	addi	sp,sp,16
    80003ce4:	00008067          	ret

0000000080003ce8 <_Z3rarv>:

uint64 rar() {
    80003ce8:	fe010113          	addi	sp,sp,-32
    80003cec:	00813c23          	sd	s0,24(sp)
    80003cf0:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80003cf4:	142027f3          	csrr	a5,scause
    80003cf8:	fef43423          	sd	a5,-24(s0)
    return scause;
    80003cfc:	fe843503          	ld	a0,-24(s0)
    return Riscv::r_scause();
}
    80003d00:	01813403          	ld	s0,24(sp)
    80003d04:	02010113          	addi	sp,sp,32
    80003d08:	00008067          	ret

0000000080003d0c <_ZN5Riscv20handleSupervisorTrapEv>:

__attribute__((unused))
void Riscv::handleSupervisorTrap() {
    80003d0c:	fb010113          	addi	sp,sp,-80
    80003d10:	04113423          	sd	ra,72(sp)
    80003d14:	04813023          	sd	s0,64(sp)
    80003d18:	02913c23          	sd	s1,56(sp)
    80003d1c:	03213823          	sd	s2,48(sp)
    80003d20:	03313423          	sd	s3,40(sp)
    80003d24:	03413023          	sd	s4,32(sp)
    80003d28:	01513c23          	sd	s5,24(sp)
    80003d2c:	05010413          	addi	s0,sp,80
    uint64 code, arg1, arg2, arg3, arg4;
    __asm__ volatile("mv %[code], a0" : [code] "=r"(code));
    80003d30:	00050493          	mv	s1,a0
    __asm__ volatile("mv %[arg1], a1" : [arg1] "=r"(arg1));
    80003d34:	00058913          	mv	s2,a1
    __asm__ volatile("mv %[arg2], a2" : [arg2] "=r"(arg2));
    80003d38:	00060993          	mv	s3,a2
    __asm__ volatile("mv %[arg3], a3" : [arg3] "=r"(arg3));
    80003d3c:	00068a13          	mv	s4,a3
    __asm__ volatile("mv %[arg4], a4" : [arg4] "=r"(arg4));
    80003d40:	00070a93          	mv	s5,a4
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80003d44:	142027f3          	csrr	a5,scause
    80003d48:	faf43c23          	sd	a5,-72(s0)
    return scause;
    80003d4c:	fb843703          	ld	a4,-72(s0)
    if (r_scause() == 2) {
    80003d50:	00200793          	li	a5,2
    80003d54:	02f70463          	beq	a4,a5,80003d7c <_ZN5Riscv20handleSupervisorTrapEv+0x70>
        print("Illegal Instruction\n");
        TCB::_thread_exit();
    }
    switch (code) {
    80003d58:	04200793          	li	a5,66
    80003d5c:	1297ec63          	bltu	a5,s1,80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
    80003d60:	00249493          	slli	s1,s1,0x2
    80003d64:	00003717          	auipc	a4,0x3
    80003d68:	36c70713          	addi	a4,a4,876 # 800070d0 <_ZN3stm4coutE+0x50>
    80003d6c:	00e484b3          	add	s1,s1,a4
    80003d70:	0004a783          	lw	a5,0(s1)
    80003d74:	00e787b3          	add	a5,a5,a4
    80003d78:	00078067          	jr	a5
        print("Illegal Instruction\n");
    80003d7c:	00003517          	auipc	a0,0x3
    80003d80:	33c50513          	addi	a0,a0,828 # 800070b8 <_ZN3stm4coutE+0x38>
    80003d84:	fffff097          	auipc	ra,0xfffff
    80003d88:	91c080e7          	jalr	-1764(ra) # 800026a0 <_Z5printPKc>
        TCB::_thread_exit();
    80003d8c:	00001097          	auipc	ra,0x1
    80003d90:	e6c080e7          	jalr	-404(ra) # 80004bf8 <_ZN3TCB12_thread_exitEv>
    80003d94:	fc5ff06f          	j	80003d58 <_ZN5Riscv20handleSupervisorTrapEv+0x4c>
        case MEM_ALLOC:
            Allocator::_mem_alloc((int) arg1);
    80003d98:	0009051b          	sext.w	a0,s2
    80003d9c:	fffff097          	auipc	ra,0xfffff
    80003da0:	21c080e7          	jalr	540(ra) # 80002fb8 <_ZN9Allocator10_mem_allocEm>
            break;
    80003da4:	0f00006f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
        case MEM_FREE:
            Allocator::_mem_free((void *) arg1);
    80003da8:	00090513          	mv	a0,s2
    80003dac:	fffff097          	auipc	ra,0xfffff
    80003db0:	2c8080e7          	jalr	712(ra) # 80003074 <_ZN9Allocator9_mem_freeEPKv>
            break;
    80003db4:	0e00006f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
        case THREAD_CREATE:
            TCB::_thread_create((thread_t *) arg1, (run_t) arg2, (void *) arg3, (void *) arg4);
    80003db8:	000a8693          	mv	a3,s5
    80003dbc:	000a0613          	mv	a2,s4
    80003dc0:	00098593          	mv	a1,s3
    80003dc4:	00090513          	mv	a0,s2
    80003dc8:	00001097          	auipc	ra,0x1
    80003dcc:	984080e7          	jalr	-1660(ra) # 8000474c <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_>
            break;
    80003dd0:	0c40006f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
        case THREAD_EXIT:
            TCB::_thread_exit();
    80003dd4:	00001097          	auipc	ra,0x1
    80003dd8:	e24080e7          	jalr	-476(ra) # 80004bf8 <_ZN3TCB12_thread_exitEv>
            break;
    80003ddc:	0b80006f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
        case THREAD_DISPATCH:
            TCB::_thread_dispatch();
    80003de0:	00001097          	auipc	ra,0x1
    80003de4:	de0080e7          	jalr	-544(ra) # 80004bc0 <_ZN3TCB16_thread_dispatchEv>
            break;
    80003de8:	0ac0006f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
        case THREAD_JOIN:
            TCB::_thread_join((thread_t) arg1);
    80003dec:	00090513          	mv	a0,s2
    80003df0:	00001097          	auipc	ra,0x1
    80003df4:	e48080e7          	jalr	-440(ra) # 80004c38 <_ZN3TCB12_thread_joinEPS_>
            break;
    80003df8:	09c0006f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
        case THREAD_JOIN_TIME:
            TCB::_thread_join((thread_t) arg1, (time_t) arg2);
    80003dfc:	00098593          	mv	a1,s3
    80003e00:	00090513          	mv	a0,s2
    80003e04:	00001097          	auipc	ra,0x1
    80003e08:	e88080e7          	jalr	-376(ra) # 80004c8c <_ZN3TCB12_thread_joinEPS_m>
            break;
    80003e0c:	0880006f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
        case THREAD_FORK:
            TCB::_fork();
    80003e10:	00001097          	auipc	ra,0x1
    80003e14:	afc080e7          	jalr	-1284(ra) # 8000490c <_ZN3TCB5_forkEv>
            break;
    80003e18:	07c0006f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
        case THREAD_KILL:
            TCB::_kill((thread_t) arg1);
    80003e1c:	00090513          	mv	a0,s2
    80003e20:	00001097          	auipc	ra,0x1
    80003e24:	814080e7          	jalr	-2028(ra) # 80004634 <_ZN3TCB5_killEPS_>
            break;
    80003e28:	06c0006f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
        case SEM_OPEN:
            Sem::_sem_open((sem_t *) arg1, arg2);
    80003e2c:	0009859b          	sext.w	a1,s3
    80003e30:	00090513          	mv	a0,s2
    80003e34:	ffffe097          	auipc	ra,0xffffe
    80003e38:	484080e7          	jalr	1156(ra) # 800022b8 <_ZN3Sem9_sem_openEPPS_j>
            break;
    80003e3c:	0580006f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
        case SEM_CLOSE:
            Sem::_sem_close((sem_t) arg1);
    80003e40:	00090513          	mv	a0,s2
    80003e44:	ffffe097          	auipc	ra,0xffffe
    80003e48:	554080e7          	jalr	1364(ra) # 80002398 <_ZN3Sem10_sem_closeEPS_>
            break;
    80003e4c:	0480006f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
        case SEM_WAIT:
            Sem::_sem_wait((sem_t) arg1);
    80003e50:	00090513          	mv	a0,s2
    80003e54:	ffffe097          	auipc	ra,0xffffe
    80003e58:	5c0080e7          	jalr	1472(ra) # 80002414 <_ZN3Sem9_sem_waitEPS_>
            break;
    80003e5c:	0380006f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
        case SEM_SIGNAL:
            Sem::_sem_signal((sem_t) arg1);
    80003e60:	00090513          	mv	a0,s2
    80003e64:	ffffe097          	auipc	ra,0xffffe
    80003e68:	4c8080e7          	jalr	1224(ra) # 8000232c <_ZN3Sem11_sem_signalEPS_>
            break;
    80003e6c:	0280006f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
        case SIGNAL_WAIT:
            Sem::_sem_signal((sem_t) arg1);
    80003e70:	00090513          	mv	a0,s2
    80003e74:	ffffe097          	auipc	ra,0xffffe
    80003e78:	4b8080e7          	jalr	1208(ra) # 8000232c <_ZN3Sem11_sem_signalEPS_>
            Sem::_sem_wait((sem_t) arg2);
    80003e7c:	00098513          	mv	a0,s3
    80003e80:	ffffe097          	auipc	ra,0xffffe
    80003e84:	594080e7          	jalr	1428(ra) # 80002414 <_ZN3Sem9_sem_waitEPS_>
        case TIME_SLEEP:
            Cradle::_time_sleep((time_t) arg1);
    80003e88:	00090513          	mv	a0,s2
    80003e8c:	fffff097          	auipc	ra,0xfffff
    80003e90:	00c080e7          	jalr	12(ra) # 80002e98 <_ZN6Cradle11_time_sleepEm>
            IO::_putc((char) arg1);
            break;
        default:
            break;
    }
}
    80003e94:	04813083          	ld	ra,72(sp)
    80003e98:	04013403          	ld	s0,64(sp)
    80003e9c:	03813483          	ld	s1,56(sp)
    80003ea0:	03013903          	ld	s2,48(sp)
    80003ea4:	02813983          	ld	s3,40(sp)
    80003ea8:	02013a03          	ld	s4,32(sp)
    80003eac:	01813a83          	ld	s5,24(sp)
    80003eb0:	05010113          	addi	sp,sp,80
    80003eb4:	00008067          	ret
            Cradle::_thread_wake((thread_t) arg1);
    80003eb8:	00090513          	mv	a0,s2
    80003ebc:	fffff097          	auipc	ra,0xfffff
    80003ec0:	034080e7          	jalr	52(ra) # 80002ef0 <_ZN6Cradle12_thread_wakeEP3TCB>
            IO::_getc();
    80003ec4:	fffff097          	auipc	ra,0xfffff
    80003ec8:	ab8080e7          	jalr	-1352(ra) # 8000297c <_ZN2IO5_getcEv>
            break;
    80003ecc:	fc9ff06f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
            IO::_putc((char) arg1);
    80003ed0:	0ff97513          	andi	a0,s2,255
    80003ed4:	fffff097          	auipc	ra,0xfffff
    80003ed8:	b18080e7          	jalr	-1256(ra) # 800029ec <_ZN2IO5_putcEc>
}
    80003edc:	fb9ff06f          	j	80003e94 <_ZN5Riscv20handleSupervisorTrapEv+0x188>

0000000080003ee0 <_ZN5Riscv15handleTimerTrapEv>:


__attribute__((unused))
void Riscv::handleTimerTrap() {
    80003ee0:	ff010113          	addi	sp,sp,-16
    80003ee4:	00113423          	sd	ra,8(sp)
    80003ee8:	00813023          	sd	s0,0(sp)
    80003eec:	01010413          	addi	s0,sp,16
    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IO::Output.is_empty()) {
    80003ef0:	00005797          	auipc	a5,0x5
    80003ef4:	3087b783          	ld	a5,776(a5) # 800091f8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003ef8:	0007b783          	ld	a5,0(a5)
    80003efc:	0007c783          	lbu	a5,0(a5)
    80003f00:	0207f793          	andi	a5,a5,32
    80003f04:	02078c63          	beqz	a5,80003f3c <_ZN5Riscv15handleTimerTrapEv+0x5c>
    80003f08:	00005797          	auipc	a5,0x5
    80003f0c:	2e87b783          	ld	a5,744(a5) # 800091f0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003f10:	0107a783          	lw	a5,16(a5)
    80003f14:	02078463          	beqz	a5,80003f3c <_ZN5Riscv15handleTimerTrapEv+0x5c>
        char c = IO::Output.get();
    80003f18:	00005517          	auipc	a0,0x5
    80003f1c:	2d853503          	ld	a0,728(a0) # 800091f0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003f20:	fffff097          	auipc	ra,0xfffff
    80003f24:	a18080e7          	jalr	-1512(ra) # 80002938 <_ZN8IOBuffer3getEv>
        *(volatile char *) CONSOLE_TX_DATA = c;
    80003f28:	00005797          	auipc	a5,0x5
    80003f2c:	3007b783          	ld	a5,768(a5) # 80009228 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003f30:	0007b783          	ld	a5,0(a5)
    80003f34:	00a78023          	sb	a0,0(a5)
    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IO::Output.is_empty()) {
    80003f38:	fb9ff06f          	j	80003ef0 <_ZN5Riscv15handleTimerTrapEv+0x10>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80003f3c:	00200793          	li	a5,2
    80003f40:	1447b073          	csrc	sip,a5
    }
    mc_sip(SIP_SSIE);
    Cradle::update();
    80003f44:	fffff097          	auipc	ra,0xfffff
    80003f48:	ed0080e7          	jalr	-304(ra) # 80002e14 <_ZN6Cradle6updateEv>
    80003f4c:	0480006f          	j	80003f94 <_ZN5Riscv15handleTimerTrapEv+0xb4>
        if (next->is_joined() || next->is_sleeping()) {
            next->run();
            Scheduler::put(next);
        }
    }
    TCB::timer_counter++;
    80003f50:	00005717          	auipc	a4,0x5
    80003f54:	31073703          	ld	a4,784(a4) # 80009260 <_GLOBAL_OFFSET_TABLE_+0x80>
    80003f58:	00073783          	ld	a5,0(a4)
    80003f5c:	00178793          	addi	a5,a5,1
    80003f60:	00f73023          	sd	a5,0(a4)
    if ((time_t) TCB::timer_counter >= TCB::running->get_time_slice() && !Scheduler::is_empty()) {
    80003f64:	00005717          	auipc	a4,0x5
    80003f68:	2ec73703          	ld	a4,748(a4) # 80009250 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003f6c:	00073703          	ld	a4,0(a4)

    void set_preempted() { this->preempted = true; }

    void reset_preempted() { this->preempted = false; }

    time_t get_time_slice() const { return this->time_slice; }
    80003f70:	05073683          	ld	a3,80(a4)
    80003f74:	04d7fc63          	bgeu	a5,a3,80003fcc <_ZN5Riscv15handleTimerTrapEv+0xec>
        TCB::timer_counter = 0;
        TCB::running->set_preempted();
        TCB::_thread_dispatch();
    }
}
    80003f78:	00813083          	ld	ra,8(sp)
    80003f7c:	00013403          	ld	s0,0(sp)
    80003f80:	01010113          	addi	sp,sp,16
    80003f84:	00008067          	ret
    void run() { this->status = RUNNABLE; }
    80003f88:	04052423          	sw	zero,72(a0)
            Scheduler::put(next);
    80003f8c:	00000097          	auipc	ra,0x0
    80003f90:	294080e7          	jalr	660(ra) # 80004220 <_ZN9Scheduler3putEP3TCB>
    while (!Cradle::is_empty() && Cradle::peak() == 0) {
    80003f94:	fffff097          	auipc	ra,0xfffff
    80003f98:	ee0080e7          	jalr	-288(ra) # 80002e74 <_ZN6Cradle8is_emptyEv>
    80003f9c:	fa051ae3          	bnez	a0,80003f50 <_ZN5Riscv15handleTimerTrapEv+0x70>
    80003fa0:	fffff097          	auipc	ra,0xfffff
    80003fa4:	ea4080e7          	jalr	-348(ra) # 80002e44 <_ZN6Cradle4peakEv>
    80003fa8:	fa0514e3          	bnez	a0,80003f50 <_ZN5Riscv15handleTimerTrapEv+0x70>
        thread_t next = Cradle::remove();
    80003fac:	fffff097          	auipc	ra,0xfffff
    80003fb0:	e18080e7          	jalr	-488(ra) # 80002dc4 <_ZN6Cradle6removeEv>
    bool is_joined() const { return this->status == JOINED; }
    80003fb4:	04852783          	lw	a5,72(a0)
        if (next->is_joined() || next->is_sleeping()) {
    80003fb8:	00300713          	li	a4,3
    80003fbc:	fce786e3          	beq	a5,a4,80003f88 <_ZN5Riscv15handleTimerTrapEv+0xa8>
    80003fc0:	00200713          	li	a4,2
    80003fc4:	fce798e3          	bne	a5,a4,80003f94 <_ZN5Riscv15handleTimerTrapEv+0xb4>
    80003fc8:	fc1ff06f          	j	80003f88 <_ZN5Riscv15handleTimerTrapEv+0xa8>
    80003fcc:	00005797          	auipc	a5,0x5
    80003fd0:	29c7b783          	ld	a5,668(a5) # 80009268 <_GLOBAL_OFFSET_TABLE_+0x88>
    80003fd4:	0107a783          	lw	a5,16(a5)
    static void put(TCB *thread);

    static TCB *get();

    static inline bool is_empty() {
        return high_priority.is_empty() && mid_priority.is_empty() && low_priority.is_empty();
    80003fd8:	02079263          	bnez	a5,80003ffc <_ZN5Riscv15handleTimerTrapEv+0x11c>
    80003fdc:	00005797          	auipc	a5,0x5
    80003fe0:	26c7b783          	ld	a5,620(a5) # 80009248 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003fe4:	0107a783          	lw	a5,16(a5)
    80003fe8:	00079a63          	bnez	a5,80003ffc <_ZN5Riscv15handleTimerTrapEv+0x11c>
    80003fec:	00005797          	auipc	a5,0x5
    80003ff0:	2347b783          	ld	a5,564(a5) # 80009220 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003ff4:	0107a783          	lw	a5,16(a5)
    80003ff8:	f80780e3          	beqz	a5,80003f78 <_ZN5Riscv15handleTimerTrapEv+0x98>
        TCB::timer_counter = 0;
    80003ffc:	00005797          	auipc	a5,0x5
    80004000:	2647b783          	ld	a5,612(a5) # 80009260 <_GLOBAL_OFFSET_TABLE_+0x80>
    80004004:	0007b023          	sd	zero,0(a5)
    void set_preempted() { this->preempted = true; }
    80004008:	00100793          	li	a5,1
    8000400c:	04f70c23          	sb	a5,88(a4)
        TCB::_thread_dispatch();
    80004010:	00001097          	auipc	ra,0x1
    80004014:	bb0080e7          	jalr	-1104(ra) # 80004bc0 <_ZN3TCB16_thread_dispatchEv>
}
    80004018:	f61ff06f          	j	80003f78 <_ZN5Riscv15handleTimerTrapEv+0x98>

000000008000401c <_ZN5Riscv17handleConsoleTrapEv>:

__attribute__((unused))
void Riscv::handleConsoleTrap() {
    8000401c:	fe010113          	addi	sp,sp,-32
    80004020:	00113c23          	sd	ra,24(sp)
    80004024:	00813823          	sd	s0,16(sp)
    80004028:	02010413          	addi	s0,sp,32
    if (plic_claim() == CONSOLE_IRQ) {
    8000402c:	00001097          	auipc	ra,0x1
    80004030:	738080e7          	jalr	1848(ra) # 80005764 <plic_claim>
    80004034:	00a00793          	li	a5,10
    80004038:	00f50a63          	beq	a0,a5,8000404c <_ZN5Riscv17handleConsoleTrapEv+0x30>
            volatile char c = *(char *) CONSOLE_RX_DATA;
            IO::Input.put(c);
        }
        plic_complete(CONSOLE_IRQ);
    }
}
    8000403c:	01813083          	ld	ra,24(sp)
    80004040:	01013403          	ld	s0,16(sp)
    80004044:	02010113          	addi	sp,sp,32
    80004048:	00008067          	ret
        while ((*((char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
    8000404c:	00005797          	auipc	a5,0x5
    80004050:	1ac7b783          	ld	a5,428(a5) # 800091f8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80004054:	0007b783          	ld	a5,0(a5)
    80004058:	0007c783          	lbu	a5,0(a5)
    8000405c:	0017f793          	andi	a5,a5,1
    80004060:	02078a63          	beqz	a5,80004094 <_ZN5Riscv17handleConsoleTrapEv+0x78>
            volatile char c = *(char *) CONSOLE_RX_DATA;
    80004064:	00005797          	auipc	a5,0x5
    80004068:	1847b783          	ld	a5,388(a5) # 800091e8 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000406c:	0007b783          	ld	a5,0(a5)
    80004070:	0007c783          	lbu	a5,0(a5)
    80004074:	fef407a3          	sb	a5,-17(s0)
            IO::Input.put(c);
    80004078:	fef44583          	lbu	a1,-17(s0)
    8000407c:	0ff5f593          	andi	a1,a1,255
    80004080:	00005517          	auipc	a0,0x5
    80004084:	1b853503          	ld	a0,440(a0) # 80009238 <_GLOBAL_OFFSET_TABLE_+0x58>
    80004088:	fffff097          	auipc	ra,0xfffff
    8000408c:	924080e7          	jalr	-1756(ra) # 800029ac <_ZN8IOBuffer3putEc>
        while ((*((char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
    80004090:	fbdff06f          	j	8000404c <_ZN5Riscv17handleConsoleTrapEv+0x30>
        plic_complete(CONSOLE_IRQ);
    80004094:	00a00513          	li	a0,10
    80004098:	00001097          	auipc	ra,0x1
    8000409c:	704080e7          	jalr	1796(ra) # 8000579c <plic_complete>
}
    800040a0:	f9dff06f          	j	8000403c <_ZN5Riscv17handleConsoleTrapEv+0x20>

00000000800040a4 <_ZN5Riscv10popSppSpieEv>:

void Riscv::popSppSpie() {
    800040a4:	ff010113          	addi	sp,sp,-16
    800040a8:	00813423          	sd	s0,8(sp)
    800040ac:	01010413          	addi	s0,sp,16
}

inline void Riscv::mc_sstatus(uint64 mask) {
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800040b0:	10000793          	li	a5,256
    800040b4:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    800040b8:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    800040bc:	10200073          	sret
}
    800040c0:	00813403          	ld	s0,8(sp)
    800040c4:	01010113          	addi	sp,sp,16
    800040c8:	00008067          	ret

00000000800040cc <_ZN5Riscv14handleReadTrapEv>:


__attribute__((unused))
void Riscv::handleReadTrap() {
    800040cc:	ff010113          	addi	sp,sp,-16
    800040d0:	00813423          	sd	s0,8(sp)
    800040d4:	01010413          	addi	s0,sp,16
    *(volatile char *) CONSOLE_TX_DATA = '!';
    800040d8:	00005797          	auipc	a5,0x5
    800040dc:	1507b783          	ld	a5,336(a5) # 80009228 <_GLOBAL_OFFSET_TABLE_+0x48>
    800040e0:	0007b783          	ld	a5,0(a5)
    800040e4:	02100713          	li	a4,33
    800040e8:	00e78023          	sb	a4,0(a5)
    *(volatile char *) CONSOLE_TX_DATA = 'r';
    800040ec:	07200713          	li	a4,114
    800040f0:	00e78023          	sb	a4,0(a5)
}
    800040f4:	00813403          	ld	s0,8(sp)
    800040f8:	01010113          	addi	sp,sp,16
    800040fc:	00008067          	ret

0000000080004100 <_ZN5Riscv15handleWriteTrapEv>:


__attribute__((unused))
void Riscv::handleWriteTrap() {
    80004100:	ff010113          	addi	sp,sp,-16
    80004104:	00813423          	sd	s0,8(sp)
    80004108:	01010413          	addi	s0,sp,16
    *(volatile char *) CONSOLE_TX_DATA = '!';
    8000410c:	00005797          	auipc	a5,0x5
    80004110:	11c7b783          	ld	a5,284(a5) # 80009228 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004114:	0007b783          	ld	a5,0(a5)
    80004118:	02100713          	li	a4,33
    8000411c:	00e78023          	sb	a4,0(a5)
    *(volatile char *) CONSOLE_TX_DATA = 'w';
    80004120:	07700713          	li	a4,119
    80004124:	00e78023          	sb	a4,0(a5)
    80004128:	00813403          	ld	s0,8(sp)
    8000412c:	01010113          	addi	sp,sp,16
    80004130:	00008067          	ret

0000000080004134 <_ZN9Scheduler3getEv>:
    } else {
        Scheduler::low_priority.put(thread);
    }
}

TCB *Scheduler::get() {
    80004134:	ff010113          	addi	sp,sp,-16
    80004138:	00113423          	sd	ra,8(sp)
    8000413c:	00813023          	sd	s0,0(sp)
    80004140:	01010413          	addi	s0,sp,16
    80004144:	00005797          	auipc	a5,0x5
    80004148:	1f47a783          	lw	a5,500(a5) # 80009338 <_ZN9Scheduler13high_priorityE+0x10>
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.get();
    8000414c:	02079863          	bnez	a5,8000417c <_ZN9Scheduler3getEv+0x48>
    80004150:	00005797          	auipc	a5,0x5
    80004154:	2007a783          	lw	a5,512(a5) # 80009350 <_ZN9Scheduler12mid_priorityE+0x10>
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.get();
    80004158:	02078c63          	beqz	a5,80004190 <_ZN9Scheduler3getEv+0x5c>
    8000415c:	00005517          	auipc	a0,0x5
    80004160:	1e450513          	addi	a0,a0,484 # 80009340 <_ZN9Scheduler12mid_priorityE>
    80004164:	ffffe097          	auipc	ra,0xffffe
    80004168:	394080e7          	jalr	916(ra) # 800024f8 <_ZN2os14CircularBufferIP3TCBE3getEv>
    return Scheduler::low_priority.get();
}
    8000416c:	00813083          	ld	ra,8(sp)
    80004170:	00013403          	ld	s0,0(sp)
    80004174:	01010113          	addi	sp,sp,16
    80004178:	00008067          	ret
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.get();
    8000417c:	00005517          	auipc	a0,0x5
    80004180:	1ac50513          	addi	a0,a0,428 # 80009328 <_ZN9Scheduler13high_priorityE>
    80004184:	ffffe097          	auipc	ra,0xffffe
    80004188:	374080e7          	jalr	884(ra) # 800024f8 <_ZN2os14CircularBufferIP3TCBE3getEv>
    8000418c:	fe1ff06f          	j	8000416c <_ZN9Scheduler3getEv+0x38>
    return Scheduler::low_priority.get();
    80004190:	00005517          	auipc	a0,0x5
    80004194:	1c850513          	addi	a0,a0,456 # 80009358 <_ZN9Scheduler12low_priorityE>
    80004198:	ffffe097          	auipc	ra,0xffffe
    8000419c:	360080e7          	jalr	864(ra) # 800024f8 <_ZN2os14CircularBufferIP3TCBE3getEv>
    800041a0:	fcdff06f          	j	8000416c <_ZN9Scheduler3getEv+0x38>

00000000800041a4 <_ZN9Scheduler4peekEv>:

TCB *Scheduler::peek() {
    800041a4:	ff010113          	addi	sp,sp,-16
    800041a8:	00113423          	sd	ra,8(sp)
    800041ac:	00813023          	sd	s0,0(sp)
    800041b0:	01010413          	addi	s0,sp,16
    800041b4:	00005797          	auipc	a5,0x5
    800041b8:	1847a783          	lw	a5,388(a5) # 80009338 <_ZN9Scheduler13high_priorityE+0x10>
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.peek();
    800041bc:	02078463          	beqz	a5,800041e4 <_ZN9Scheduler4peekEv+0x40>
    800041c0:	00005517          	auipc	a0,0x5
    800041c4:	16850513          	addi	a0,a0,360 # 80009328 <_ZN9Scheduler13high_priorityE>
    800041c8:	00000097          	auipc	ra,0x0
    800041cc:	100080e7          	jalr	256(ra) # 800042c8 <_ZN2os14CircularBufferIP3TCBE4peekEv>
    800041d0:	00053503          	ld	a0,0(a0)
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.peek();
    return Scheduler::low_priority.peek();
}
    800041d4:	00813083          	ld	ra,8(sp)
    800041d8:	00013403          	ld	s0,0(sp)
    800041dc:	01010113          	addi	sp,sp,16
    800041e0:	00008067          	ret
    800041e4:	00005797          	auipc	a5,0x5
    800041e8:	16c7a783          	lw	a5,364(a5) # 80009350 <_ZN9Scheduler12mid_priorityE+0x10>
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.peek();
    800041ec:	00078e63          	beqz	a5,80004208 <_ZN9Scheduler4peekEv+0x64>
    800041f0:	00005517          	auipc	a0,0x5
    800041f4:	15050513          	addi	a0,a0,336 # 80009340 <_ZN9Scheduler12mid_priorityE>
    800041f8:	00000097          	auipc	ra,0x0
    800041fc:	0d0080e7          	jalr	208(ra) # 800042c8 <_ZN2os14CircularBufferIP3TCBE4peekEv>
    80004200:	00053503          	ld	a0,0(a0)
    80004204:	fd1ff06f          	j	800041d4 <_ZN9Scheduler4peekEv+0x30>
    return Scheduler::low_priority.peek();
    80004208:	00005517          	auipc	a0,0x5
    8000420c:	15050513          	addi	a0,a0,336 # 80009358 <_ZN9Scheduler12low_priorityE>
    80004210:	00000097          	auipc	ra,0x0
    80004214:	0b8080e7          	jalr	184(ra) # 800042c8 <_ZN2os14CircularBufferIP3TCBE4peekEv>
    80004218:	00053503          	ld	a0,0(a0)
    8000421c:	fb9ff06f          	j	800041d4 <_ZN9Scheduler4peekEv+0x30>

0000000080004220 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *thread) {
    80004220:	ff010113          	addi	sp,sp,-16
    80004224:	00113423          	sd	ra,8(sp)
    80004228:	00813023          	sd	s0,0(sp)
    8000422c:	01010413          	addi	s0,sp,16
    80004230:	00050593          	mv	a1,a0
    bool was_preempted() const { return this->preempted; }
    80004234:	05854783          	lbu	a5,88(a0)
    if (!thread->was_preempted()) {
    80004238:	02078e63          	beqz	a5,80004274 <_ZN9Scheduler3putEP3TCB+0x54>
    void reset_preempted() { this->preempted = false; }
    8000423c:	04050c23          	sb	zero,88(a0)
    time_t get_time_slice() const { return this->time_slice; }
    80004240:	05053783          	ld	a5,80(a0)
    if (time_slice == TimeSlice::HIGH_PRIORITY) {
    80004244:	00100713          	li	a4,1
    80004248:	04e78463          	beq	a5,a4,80004290 <_ZN9Scheduler3putEP3TCB+0x70>
    } else if (time_slice == TimeSlice::MID_PRIORITY) {
    8000424c:	00200713          	li	a4,2
    80004250:	04e78e63          	beq	a5,a4,800042ac <_ZN9Scheduler3putEP3TCB+0x8c>
        Scheduler::low_priority.put(thread);
    80004254:	00005517          	auipc	a0,0x5
    80004258:	10450513          	addi	a0,a0,260 # 80009358 <_ZN9Scheduler12low_priorityE>
    8000425c:	ffffe097          	auipc	ra,0xffffe
    80004260:	3c0080e7          	jalr	960(ra) # 8000261c <_ZN2os14CircularBufferIP3TCBE3putES2_>
}
    80004264:	00813083          	ld	ra,8(sp)
    80004268:	00013403          	ld	s0,0(sp)
    8000426c:	01010113          	addi	sp,sp,16
    80004270:	00008067          	ret

    void set_time_slice(time_t time) { this->time_slice = time;}
    80004274:	00100793          	li	a5,1
    80004278:	04f53823          	sd	a5,80(a0)
        Scheduler::high_priority.put(thread);
    8000427c:	00005517          	auipc	a0,0x5
    80004280:	0ac50513          	addi	a0,a0,172 # 80009328 <_ZN9Scheduler13high_priorityE>
    80004284:	ffffe097          	auipc	ra,0xffffe
    80004288:	398080e7          	jalr	920(ra) # 8000261c <_ZN2os14CircularBufferIP3TCBE3putES2_>
        return;
    8000428c:	fd9ff06f          	j	80004264 <_ZN9Scheduler3putEP3TCB+0x44>
    80004290:	00200793          	li	a5,2
    80004294:	04f53823          	sd	a5,80(a0)
        Scheduler::mid_priority.put(thread);
    80004298:	00005517          	auipc	a0,0x5
    8000429c:	0a850513          	addi	a0,a0,168 # 80009340 <_ZN9Scheduler12mid_priorityE>
    800042a0:	ffffe097          	auipc	ra,0xffffe
    800042a4:	37c080e7          	jalr	892(ra) # 8000261c <_ZN2os14CircularBufferIP3TCBE3putES2_>
    800042a8:	fbdff06f          	j	80004264 <_ZN9Scheduler3putEP3TCB+0x44>
    800042ac:	00400793          	li	a5,4
    800042b0:	04f53823          	sd	a5,80(a0)
        Scheduler::low_priority.put(thread);
    800042b4:	00005517          	auipc	a0,0x5
    800042b8:	0a450513          	addi	a0,a0,164 # 80009358 <_ZN9Scheduler12low_priorityE>
    800042bc:	ffffe097          	auipc	ra,0xffffe
    800042c0:	360080e7          	jalr	864(ra) # 8000261c <_ZN2os14CircularBufferIP3TCBE3putES2_>
    800042c4:	fa1ff06f          	j	80004264 <_ZN9Scheduler3putEP3TCB+0x44>

00000000800042c8 <_ZN2os14CircularBufferIP3TCBE4peekEv>:
T &os::CircularBuffer<T>::peek() {
    800042c8:	ff010113          	addi	sp,sp,-16
    800042cc:	00813423          	sd	s0,8(sp)
    800042d0:	01010413          	addi	s0,sp,16
    return this->queue[this->head];
    800042d4:	00053703          	ld	a4,0(a0)
    800042d8:	00852783          	lw	a5,8(a0)
    800042dc:	00379793          	slli	a5,a5,0x3
}
    800042e0:	00f70533          	add	a0,a4,a5
    800042e4:	00813403          	ld	s0,8(sp)
    800042e8:	01010113          	addi	sp,sp,16
    800042ec:	00008067          	ret

00000000800042f0 <_ZN10OwnedMutexD1Ev>:

OwnedMutex::OwnedMutex() : owner(nullptr), nesting_count(0) {
    sem_open(&this->myHandle, 1);
}

OwnedMutex::~OwnedMutex() {
    800042f0:	fe010113          	addi	sp,sp,-32
    800042f4:	00113c23          	sd	ra,24(sp)
    800042f8:	00813823          	sd	s0,16(sp)
    800042fc:	00913423          	sd	s1,8(sp)
    80004300:	02010413          	addi	s0,sp,32
    80004304:	00050493          	mv	s1,a0
    80004308:	00005797          	auipc	a5,0x5
    8000430c:	eb878793          	addi	a5,a5,-328 # 800091c0 <_ZTV10OwnedMutex+0x10>
    80004310:	00f53023          	sd	a5,0(a0)
    sem_close(this->myHandle);
    80004314:	00853503          	ld	a0,8(a0)
    80004318:	ffffd097          	auipc	ra,0xffffd
    8000431c:	4b8080e7          	jalr	1208(ra) # 800017d0 <_Z9sem_closeP3Sem>
class Mutex : public Semaphore {
    80004320:	00005797          	auipc	a5,0x5
    80004324:	e7078793          	addi	a5,a5,-400 # 80009190 <_ZTV5Mutex+0x10>
    80004328:	00f4b023          	sd	a5,0(s1)
    8000432c:	00048513          	mv	a0,s1
    80004330:	fffff097          	auipc	ra,0xfffff
    80004334:	4a8080e7          	jalr	1192(ra) # 800037d8 <_ZN9SemaphoreD1Ev>
}
    80004338:	01813083          	ld	ra,24(sp)
    8000433c:	01013403          	ld	s0,16(sp)
    80004340:	00813483          	ld	s1,8(sp)
    80004344:	02010113          	addi	sp,sp,32
    80004348:	00008067          	ret

000000008000434c <_ZN10OwnedMutexD0Ev>:
OwnedMutex::~OwnedMutex() {
    8000434c:	fe010113          	addi	sp,sp,-32
    80004350:	00113c23          	sd	ra,24(sp)
    80004354:	00813823          	sd	s0,16(sp)
    80004358:	00913423          	sd	s1,8(sp)
    8000435c:	02010413          	addi	s0,sp,32
    80004360:	00050493          	mv	s1,a0
}
    80004364:	00000097          	auipc	ra,0x0
    80004368:	f8c080e7          	jalr	-116(ra) # 800042f0 <_ZN10OwnedMutexD1Ev>
    8000436c:	00048513          	mv	a0,s1
    80004370:	fffff097          	auipc	ra,0xfffff
    80004374:	548080e7          	jalr	1352(ra) # 800038b8 <_ZdlPv>
    80004378:	01813083          	ld	ra,24(sp)
    8000437c:	01013403          	ld	s0,16(sp)
    80004380:	00813483          	ld	s1,8(sp)
    80004384:	02010113          	addi	sp,sp,32
    80004388:	00008067          	ret

000000008000438c <_ZN10OwnedMutex4waitEv>:

int OwnedMutex::wait() {
    if (this->owner == TCB::running) {
    8000438c:	01053783          	ld	a5,16(a0)
    80004390:	00005717          	auipc	a4,0x5
    80004394:	ec073703          	ld	a4,-320(a4) # 80009250 <_GLOBAL_OFFSET_TABLE_+0x70>
    80004398:	00073703          	ld	a4,0(a4)
    8000439c:	02e78c63          	beq	a5,a4,800043d4 <_ZN10OwnedMutex4waitEv+0x48>
int OwnedMutex::wait() {
    800043a0:	ff010113          	addi	sp,sp,-16
    800043a4:	00113423          	sd	ra,8(sp)
    800043a8:	00813023          	sd	s0,0(sp)
    800043ac:	01010413          	addi	s0,sp,16
        this->nesting_count++;
        return 0;
    }
    if (this->owner == nullptr) {
    800043b0:	02078c63          	beqz	a5,800043e8 <_ZN10OwnedMutex4waitEv+0x5c>
        this->owner = TCB::running;
        this->nesting_count = 1;
    }
    sem_wait(this->myHandle);
    800043b4:	00853503          	ld	a0,8(a0)
    800043b8:	ffffd097          	auipc	ra,0xffffd
    800043bc:	464080e7          	jalr	1124(ra) # 8000181c <_Z8sem_waitP3Sem>
    return 0;
}
    800043c0:	00000513          	li	a0,0
    800043c4:	00813083          	ld	ra,8(sp)
    800043c8:	00013403          	ld	s0,0(sp)
    800043cc:	01010113          	addi	sp,sp,16
    800043d0:	00008067          	ret
        this->nesting_count++;
    800043d4:	01852783          	lw	a5,24(a0)
    800043d8:	0017879b          	addiw	a5,a5,1
    800043dc:	00f52c23          	sw	a5,24(a0)
}
    800043e0:	00000513          	li	a0,0
    800043e4:	00008067          	ret
        this->owner = TCB::running;
    800043e8:	00e53823          	sd	a4,16(a0)
        this->nesting_count = 1;
    800043ec:	00100793          	li	a5,1
    800043f0:	00f52c23          	sw	a5,24(a0)
    800043f4:	fc1ff06f          	j	800043b4 <_ZN10OwnedMutex4waitEv+0x28>

00000000800043f8 <_ZN10OwnedMutex6signalEv>:

int OwnedMutex::signal() {
    if (this->owner != TCB::running) return -1;
    800043f8:	01053703          	ld	a4,16(a0)
    800043fc:	00005797          	auipc	a5,0x5
    80004400:	e547b783          	ld	a5,-428(a5) # 80009250 <_GLOBAL_OFFSET_TABLE_+0x70>
    80004404:	0007b783          	ld	a5,0(a5)
    80004408:	04f71a63          	bne	a4,a5,8000445c <_ZN10OwnedMutex6signalEv+0x64>
    this->nesting_count --;
    8000440c:	01852783          	lw	a5,24(a0)
    80004410:	fff7879b          	addiw	a5,a5,-1
    80004414:	0007871b          	sext.w	a4,a5
    80004418:	00f52c23          	sw	a5,24(a0)
    if (this->nesting_count == 0) {
    8000441c:	00070663          	beqz	a4,80004428 <_ZN10OwnedMutex6signalEv+0x30>
        this->owner = nullptr;
        sem_signal(this->myHandle);
    }
    return 0;
    80004420:	00000513          	li	a0,0
}
    80004424:	00008067          	ret
int OwnedMutex::signal() {
    80004428:	ff010113          	addi	sp,sp,-16
    8000442c:	00113423          	sd	ra,8(sp)
    80004430:	00813023          	sd	s0,0(sp)
    80004434:	01010413          	addi	s0,sp,16
        this->owner = nullptr;
    80004438:	00053823          	sd	zero,16(a0)
        sem_signal(this->myHandle);
    8000443c:	00853503          	ld	a0,8(a0)
    80004440:	ffffd097          	auipc	ra,0xffffd
    80004444:	428080e7          	jalr	1064(ra) # 80001868 <_Z10sem_signalP3Sem>
    return 0;
    80004448:	00000513          	li	a0,0
}
    8000444c:	00813083          	ld	ra,8(sp)
    80004450:	00013403          	ld	s0,0(sp)
    80004454:	01010113          	addi	sp,sp,16
    80004458:	00008067          	ret
    if (this->owner != TCB::running) return -1;
    8000445c:	fff00513          	li	a0,-1
    80004460:	00008067          	ret

0000000080004464 <_ZN10OwnedMutexC1Ev>:
OwnedMutex::OwnedMutex() : owner(nullptr), nesting_count(0) {
    80004464:	fe010113          	addi	sp,sp,-32
    80004468:	00113c23          	sd	ra,24(sp)
    8000446c:	00813823          	sd	s0,16(sp)
    80004470:	00913423          	sd	s1,8(sp)
    80004474:	01213023          	sd	s2,0(sp)
    80004478:	02010413          	addi	s0,sp,32
    8000447c:	00050493          	mv	s1,a0
    Mutex() : Semaphore(1) {}
    80004480:	00100593          	li	a1,1
    80004484:	fffff097          	auipc	ra,0xfffff
    80004488:	668080e7          	jalr	1640(ra) # 80003aec <_ZN9SemaphoreC1Ej>
    8000448c:	00005797          	auipc	a5,0x5
    80004490:	d3478793          	addi	a5,a5,-716 # 800091c0 <_ZTV10OwnedMutex+0x10>
    80004494:	00f4b023          	sd	a5,0(s1)
    80004498:	0004b823          	sd	zero,16(s1)
    8000449c:	0004ac23          	sw	zero,24(s1)
    sem_open(&this->myHandle, 1);
    800044a0:	00100593          	li	a1,1
    800044a4:	00848513          	addi	a0,s1,8
    800044a8:	ffffd097          	auipc	ra,0xffffd
    800044ac:	2d8080e7          	jalr	728(ra) # 80001780 <_Z8sem_openPP3Semj>
    800044b0:	02c0006f          	j	800044dc <_ZN10OwnedMutexC1Ev+0x78>
    800044b4:	00050913          	mv	s2,a0
class Mutex : public Semaphore {
    800044b8:	00005797          	auipc	a5,0x5
    800044bc:	cd878793          	addi	a5,a5,-808 # 80009190 <_ZTV5Mutex+0x10>
    800044c0:	00f4b023          	sd	a5,0(s1)
    800044c4:	00048513          	mv	a0,s1
    800044c8:	fffff097          	auipc	ra,0xfffff
    800044cc:	310080e7          	jalr	784(ra) # 800037d8 <_ZN9SemaphoreD1Ev>
    800044d0:	00090513          	mv	a0,s2
    800044d4:	00006097          	auipc	ra,0x6
    800044d8:	f84080e7          	jalr	-124(ra) # 8000a458 <_Unwind_Resume>
}
    800044dc:	01813083          	ld	ra,24(sp)
    800044e0:	01013403          	ld	s0,16(sp)
    800044e4:	00813483          	ld	s1,8(sp)
    800044e8:	00013903          	ld	s2,0(sp)
    800044ec:	02010113          	addi	sp,sp,32
    800044f0:	00008067          	ret

00000000800044f4 <_ZN5MutexD1Ev>:
    800044f4:	ff010113          	addi	sp,sp,-16
    800044f8:	00113423          	sd	ra,8(sp)
    800044fc:	00813023          	sd	s0,0(sp)
    80004500:	01010413          	addi	s0,sp,16
    80004504:	00005797          	auipc	a5,0x5
    80004508:	c8c78793          	addi	a5,a5,-884 # 80009190 <_ZTV5Mutex+0x10>
    8000450c:	00f53023          	sd	a5,0(a0)
    80004510:	fffff097          	auipc	ra,0xfffff
    80004514:	2c8080e7          	jalr	712(ra) # 800037d8 <_ZN9SemaphoreD1Ev>
    80004518:	00813083          	ld	ra,8(sp)
    8000451c:	00013403          	ld	s0,0(sp)
    80004520:	01010113          	addi	sp,sp,16
    80004524:	00008067          	ret

0000000080004528 <_ZN5MutexD0Ev>:
    80004528:	fe010113          	addi	sp,sp,-32
    8000452c:	00113c23          	sd	ra,24(sp)
    80004530:	00813823          	sd	s0,16(sp)
    80004534:	00913423          	sd	s1,8(sp)
    80004538:	02010413          	addi	s0,sp,32
    8000453c:	00050493          	mv	s1,a0
    80004540:	00005797          	auipc	a5,0x5
    80004544:	c5078793          	addi	a5,a5,-944 # 80009190 <_ZTV5Mutex+0x10>
    80004548:	00f53023          	sd	a5,0(a0)
    8000454c:	fffff097          	auipc	ra,0xfffff
    80004550:	28c080e7          	jalr	652(ra) # 800037d8 <_ZN9SemaphoreD1Ev>
    80004554:	00048513          	mv	a0,s1
    80004558:	fffff097          	auipc	ra,0xfffff
    8000455c:	360080e7          	jalr	864(ra) # 800038b8 <_ZdlPv>
    80004560:	01813083          	ld	ra,24(sp)
    80004564:	01013403          	ld	s0,16(sp)
    80004568:	00813483          	ld	s1,8(sp)
    8000456c:	02010113          	addi	sp,sp,32
    80004570:	00008067          	ret

0000000080004574 <_ZN3TCB12thread_startEv>:
    if (TCB::running != thread->parent) return -4;
    thread->finish();
    return 0;
}

void TCB::thread_start() {
    80004574:	ff010113          	addi	sp,sp,-16
    80004578:	00113423          	sd	ra,8(sp)
    8000457c:	00813023          	sd	s0,0(sp)
    80004580:	01010413          	addi	s0,sp,16
    Riscv::popSppSpie();
    80004584:	00000097          	auipc	ra,0x0
    80004588:	b20080e7          	jalr	-1248(ra) # 800040a4 <_ZN5Riscv10popSppSpieEv>
    TCB::running->_run(TCB::running->arg);
    8000458c:	00005797          	auipc	a5,0x5
    80004590:	de47b783          	ld	a5,-540(a5) # 80009370 <_ZN3TCB7runningE>
    80004594:	0087b703          	ld	a4,8(a5)
    80004598:	0107b503          	ld	a0,16(a5)
    8000459c:	000700e7          	jalr	a4
    thread_exit();
    800045a0:	ffffd097          	auipc	ra,0xffffd
    800045a4:	020080e7          	jalr	32(ra) # 800015c0 <_Z11thread_exitv>
    800045a8:	00813083          	ld	ra,8(sp)
    800045ac:	00013403          	ld	s0,0(sp)
    800045b0:	01010113          	addi	sp,sp,16
    800045b4:	00008067          	ret

00000000800045b8 <_ZN3TCB9duplicateEPS_S0_>:
void TCB::duplicate(TCB *parent, TCB *child) {
    800045b8:	fe010113          	addi	sp,sp,-32
    800045bc:	00113c23          	sd	ra,24(sp)
    800045c0:	00813823          	sd	s0,16(sp)
    800045c4:	00913423          	sd	s1,8(sp)
    800045c8:	01213023          	sd	s2,0(sp)
    800045cc:	02010413          	addi	s0,sp,32
    800045d0:	00050913          	mv	s2,a0
    800045d4:	00058493          	mv	s1,a1
    Riscv::push();
    800045d8:	ffffd097          	auipc	ra,0xffffd
    800045dc:	d98080e7          	jalr	-616(ra) # 80001370 <_ZN5Riscv4pushEv>
    memcpy(parent->stack, child->stack, DEFAULT_STACK_SIZE);
    800045e0:	00004637          	lui	a2,0x4
    800045e4:	0184b583          	ld	a1,24(s1)
    800045e8:	01893503          	ld	a0,24(s2)
    800045ec:	fffff097          	auipc	ra,0xfffff
    800045f0:	ca4080e7          	jalr	-860(ra) # 80003290 <_Z6memcpyPKvS0_i>
    child->context = parent->context;
    800045f4:	02893603          	ld	a2,40(s2)
    800045f8:	03093683          	ld	a3,48(s2)
    800045fc:	03893703          	ld	a4,56(s2)
    80004600:	04093783          	ld	a5,64(s2)
    80004604:	02c4b423          	sd	a2,40(s1)
    80004608:	02d4b823          	sd	a3,48(s1)
    8000460c:	02e4bc23          	sd	a4,56(s1)
    80004610:	04f4b023          	sd	a5,64(s1)
    Riscv::pop();
    80004614:	ffffd097          	auipc	ra,0xffffd
    80004618:	ddc080e7          	jalr	-548(ra) # 800013f0 <_ZN5Riscv3popEv>
}
    8000461c:	01813083          	ld	ra,24(sp)
    80004620:	01013403          	ld	s0,16(sp)
    80004624:	00813483          	ld	s1,8(sp)
    80004628:	00013903          	ld	s2,0(sp)
    8000462c:	02010113          	addi	sp,sp,32
    80004630:	00008067          	ret

0000000080004634 <_ZN3TCB5_killEPS_>:
int TCB::_kill(TCB* thread) {
    80004634:	ff010113          	addi	sp,sp,-16
    80004638:	00813423          	sd	s0,8(sp)
    8000463c:	01010413          	addi	s0,sp,16
    if (!thread) return -1;
    80004640:	02050c63          	beqz	a0,80004678 <_ZN3TCB5_killEPS_+0x44>
    bool is_finished() const { return this->status == FINISHED; }
    80004644:	04852703          	lw	a4,72(a0)
    if (thread->is_finished()) return -2;
    80004648:	00400793          	li	a5,4
    8000464c:	02f70a63          	beq	a4,a5,80004680 <_ZN3TCB5_killEPS_+0x4c>
    if (TCB::running != thread->parent) return -4;
    80004650:	02053703          	ld	a4,32(a0)
    80004654:	00005797          	auipc	a5,0x5
    80004658:	d1c7b783          	ld	a5,-740(a5) # 80009370 <_ZN3TCB7runningE>
    8000465c:	02f71663          	bne	a4,a5,80004688 <_ZN3TCB5_killEPS_+0x54>
    void finish() { this->status = FINISHED; }
    80004660:	00400793          	li	a5,4
    80004664:	04f52423          	sw	a5,72(a0)
    return 0;
    80004668:	00000513          	li	a0,0
}
    8000466c:	00813403          	ld	s0,8(sp)
    80004670:	01010113          	addi	sp,sp,16
    80004674:	00008067          	ret
    if (!thread) return -1;
    80004678:	fff00513          	li	a0,-1
    8000467c:	ff1ff06f          	j	8000466c <_ZN3TCB5_killEPS_+0x38>
    if (thread->is_finished()) return -2;
    80004680:	ffe00513          	li	a0,-2
    80004684:	fe9ff06f          	j	8000466c <_ZN3TCB5_killEPS_+0x38>
    if (TCB::running != thread->parent) return -4;
    80004688:	ffc00513          	li	a0,-4
    8000468c:	fe1ff06f          	j	8000466c <_ZN3TCB5_killEPS_+0x38>

0000000080004690 <_ZN3TCBC1EPFvPvES0_S0_7Context>:
TCB::TCB(run_t start_routine, void *arg, void *stack, Context context) :
    80004690:	fe010113          	addi	sp,sp,-32
    80004694:	00113c23          	sd	ra,24(sp)
    80004698:	00813823          	sd	s0,16(sp)
    8000469c:	00913423          	sd	s1,8(sp)
    800046a0:	01213023          	sd	s2,0(sp)
    800046a4:	02010413          	addi	s0,sp,32
    800046a8:	00050493          	mv	s1,a0
        t_id(TCB::ID++), _run(start_routine), arg(arg),
    800046ac:	00005917          	auipc	s2,0x5
    800046b0:	cc490913          	addi	s2,s2,-828 # 80009370 <_ZN3TCB7runningE>
    800046b4:	00892783          	lw	a5,8(s2)
    800046b8:	0017851b          	addiw	a0,a5,1
    800046bc:	00a92423          	sw	a0,8(s2)
        time_slice(DEFAULT_TIME_SLICE), preempted(false), joiner() {
    800046c0:	00f4a023          	sw	a5,0(s1)
    800046c4:	00b4b423          	sd	a1,8(s1)
    800046c8:	00c4b823          	sd	a2,16(s1)
    800046cc:	00d4bc23          	sd	a3,24(s1)
    800046d0:	00093783          	ld	a5,0(s2)
    800046d4:	02f4b023          	sd	a5,32(s1)
    800046d8:	00073583          	ld	a1,0(a4)
    800046dc:	00873603          	ld	a2,8(a4)
    800046e0:	01073683          	ld	a3,16(a4)
    800046e4:	01873783          	ld	a5,24(a4)
    800046e8:	02b4b423          	sd	a1,40(s1)
    800046ec:	02c4b823          	sd	a2,48(s1)
    800046f0:	02d4bc23          	sd	a3,56(s1)
    800046f4:	04f4b023          	sd	a5,64(s1)
    800046f8:	0404a423          	sw	zero,72(s1)
    800046fc:	00100793          	li	a5,1
    80004700:	04f4b823          	sd	a5,80(s1)
    80004704:	04048c23          	sb	zero,88(s1)
    80004708:	0604b023          	sd	zero,96(s1)
    8000470c:	0604a423          	sw	zero,104(s1)
    80004710:	0604a623          	sw	zero,108(s1)
    80004714:	0604a823          	sw	zero,112(s1)
    80004718:	0604aa23          	sw	zero,116(s1)
    this->joiner.init();
    8000471c:	06048513          	addi	a0,s1,96
    80004720:	ffffe097          	auipc	ra,0xffffe
    80004724:	d88080e7          	jalr	-632(ra) # 800024a8 <_ZN2os14CircularBufferIP3TCBE4initEv>
    if (TCB::running) {
    80004728:	00093783          	ld	a5,0(s2)
    8000472c:	00078463          	beqz	a5,80004734 <_ZN3TCBC1EPFvPvES0_S0_7Context+0xa4>
        this->parent = TCB::running;
    80004730:	02f4b023          	sd	a5,32(s1)
}
    80004734:	01813083          	ld	ra,24(sp)
    80004738:	01013403          	ld	s0,16(sp)
    8000473c:	00813483          	ld	s1,8(sp)
    80004740:	00013903          	ld	s2,0(sp)
    80004744:	02010113          	addi	sp,sp,32
    80004748:	00008067          	ret

000000008000474c <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_>:
int TCB::_thread_create(thread_t *handle, void(*start_routine)(void *), void *arg, void *stack) {
    8000474c:	f8010113          	addi	sp,sp,-128
    80004750:	06113c23          	sd	ra,120(sp)
    80004754:	06813823          	sd	s0,112(sp)
    80004758:	06913423          	sd	s1,104(sp)
    8000475c:	07213023          	sd	s2,96(sp)
    80004760:	05313c23          	sd	s3,88(sp)
    80004764:	05413823          	sd	s4,80(sp)
    80004768:	05513423          	sd	s5,72(sp)
    8000476c:	08010413          	addi	s0,sp,128
    80004770:	00050493          	mv	s1,a0
    80004774:	00058913          	mv	s2,a1
    80004778:	00060a93          	mv	s5,a2
    8000477c:	00068993          	mv	s3,a3
    *handle = new TCB(start_routine, arg, stack, {(uint64) thread_start, (uint64) stack + DEFAULT_STACK_SIZE - 1});
    80004780:	fa043823          	sd	zero,-80(s0)
    80004784:	fa043c23          	sd	zero,-72(s0)
    80004788:	00000797          	auipc	a5,0x0
    8000478c:	dec78793          	addi	a5,a5,-532 # 80004574 <_ZN3TCB12thread_startEv>
    80004790:	faf43023          	sd	a5,-96(s0)
    80004794:	000047b7          	lui	a5,0x4
    80004798:	fff78793          	addi	a5,a5,-1 # 3fff <_entry-0x7fffc001>
    8000479c:	00f687b3          	add	a5,a3,a5
    800047a0:	faf43423          	sd	a5,-88(s0)
    void *operator new(size_t size) { return Allocator::_mem_alloc(size); }
    800047a4:	07800513          	li	a0,120
    800047a8:	fffff097          	auipc	ra,0xfffff
    800047ac:	810080e7          	jalr	-2032(ra) # 80002fb8 <_ZN9Allocator10_mem_allocEm>
    800047b0:	00050a13          	mv	s4,a0
    800047b4:	fa043783          	ld	a5,-96(s0)
    800047b8:	f8f43023          	sd	a5,-128(s0)
    800047bc:	fa843783          	ld	a5,-88(s0)
    800047c0:	f8f43423          	sd	a5,-120(s0)
    800047c4:	fb043783          	ld	a5,-80(s0)
    800047c8:	f8f43823          	sd	a5,-112(s0)
    800047cc:	fb843783          	ld	a5,-72(s0)
    800047d0:	f8f43c23          	sd	a5,-104(s0)
    800047d4:	f8040713          	addi	a4,s0,-128
    800047d8:	00098693          	mv	a3,s3
    800047dc:	000a8613          	mv	a2,s5
    800047e0:	00090593          	mv	a1,s2
    800047e4:	00000097          	auipc	ra,0x0
    800047e8:	eac080e7          	jalr	-340(ra) # 80004690 <_ZN3TCBC1EPFvPvES0_S0_7Context>
    800047ec:	0144b023          	sd	s4,0(s1)
    if (start_routine) Scheduler::put(*handle);
    800047f0:	00090863          	beqz	s2,80004800 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0xb4>
    800047f4:	000a0513          	mv	a0,s4
    800047f8:	00000097          	auipc	ra,0x0
    800047fc:	a28080e7          	jalr	-1496(ra) # 80004220 <_ZN9Scheduler3putEP3TCB>
    return (*handle)->t_id;
    80004800:	0004b783          	ld	a5,0(s1)
    80004804:	0007a503          	lw	a0,0(a5)
}
    80004808:	07813083          	ld	ra,120(sp)
    8000480c:	07013403          	ld	s0,112(sp)
    80004810:	06813483          	ld	s1,104(sp)
    80004814:	06013903          	ld	s2,96(sp)
    80004818:	05813983          	ld	s3,88(sp)
    8000481c:	05013a03          	ld	s4,80(sp)
    80004820:	04813a83          	ld	s5,72(sp)
    80004824:	08010113          	addi	sp,sp,128
    80004828:	00008067          	ret
    8000482c:	00050493          	mv	s1,a0
    void operator delete(void *pointer) { Allocator::_mem_free(pointer); }
    80004830:	000a0513          	mv	a0,s4
    80004834:	fffff097          	auipc	ra,0xfffff
    80004838:	840080e7          	jalr	-1984(ra) # 80003074 <_ZN9Allocator9_mem_freeEPKv>
    8000483c:	00048513          	mv	a0,s1
    80004840:	00006097          	auipc	ra,0x6
    80004844:	c18080e7          	jalr	-1000(ra) # 8000a458 <_Unwind_Resume>

0000000080004848 <_ZN3TCBC1ERS_>:
TCB::TCB(TCB &parent) :
    80004848:	fe010113          	addi	sp,sp,-32
    8000484c:	00113c23          	sd	ra,24(sp)
    80004850:	00813823          	sd	s0,16(sp)
    80004854:	00913423          	sd	s1,8(sp)
    80004858:	01213023          	sd	s2,0(sp)
    8000485c:	02010413          	addi	s0,sp,32
    80004860:	00050493          	mv	s1,a0
    80004864:	00058913          	mv	s2,a1
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    80004868:	00005717          	auipc	a4,0x5
    8000486c:	b0870713          	addi	a4,a4,-1272 # 80009370 <_ZN3TCB7runningE>
    80004870:	00872783          	lw	a5,8(a4)
    80004874:	0017869b          	addiw	a3,a5,1
    80004878:	00d72423          	sw	a3,8(a4)
        preempted(false), joiner() {
    8000487c:	00f52023          	sw	a5,0(a0)
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    80004880:	0085b783          	ld	a5,8(a1)
        preempted(false), joiner() {
    80004884:	00f53423          	sd	a5,8(a0)
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    80004888:	0105b783          	ld	a5,16(a1)
        preempted(false), joiner() {
    8000488c:	00f53823          	sd	a5,16(a0)
        stack(Allocator::_mem_alloc(DEFAULT_STACK_SIZE)),
    80004890:	00004537          	lui	a0,0x4
    80004894:	ffffe097          	auipc	ra,0xffffe
    80004898:	724080e7          	jalr	1828(ra) # 80002fb8 <_ZN9Allocator10_mem_allocEm>
        preempted(false), joiner() {
    8000489c:	00a4bc23          	sd	a0,24(s1)
    800048a0:	0324b023          	sd	s2,32(s1)
    800048a4:	02893603          	ld	a2,40(s2)
    800048a8:	03093683          	ld	a3,48(s2)
    800048ac:	03893703          	ld	a4,56(s2)
    800048b0:	04093783          	ld	a5,64(s2)
    800048b4:	02c4b423          	sd	a2,40(s1)
    800048b8:	02d4b823          	sd	a3,48(s1)
    800048bc:	02e4bc23          	sd	a4,56(s1)
    800048c0:	04f4b023          	sd	a5,64(s1)
    800048c4:	0404a423          	sw	zero,72(s1)
    800048c8:	00100793          	li	a5,1
    800048cc:	04f4b823          	sd	a5,80(s1)
    800048d0:	04048c23          	sb	zero,88(s1)
    800048d4:	0604b023          	sd	zero,96(s1)
    800048d8:	0604a423          	sw	zero,104(s1)
    800048dc:	0604a623          	sw	zero,108(s1)
    800048e0:	0604a823          	sw	zero,112(s1)
    800048e4:	0604aa23          	sw	zero,116(s1)
    this->joiner.init();
    800048e8:	06048513          	addi	a0,s1,96
    800048ec:	ffffe097          	auipc	ra,0xffffe
    800048f0:	bbc080e7          	jalr	-1092(ra) # 800024a8 <_ZN2os14CircularBufferIP3TCBE4initEv>
}
    800048f4:	01813083          	ld	ra,24(sp)
    800048f8:	01013403          	ld	s0,16(sp)
    800048fc:	00813483          	ld	s1,8(sp)
    80004900:	00013903          	ld	s2,0(sp)
    80004904:	02010113          	addi	sp,sp,32
    80004908:	00008067          	ret

000000008000490c <_ZN3TCB5_forkEv>:
int TCB::_fork() {
    8000490c:	fd010113          	addi	sp,sp,-48
    80004910:	02113423          	sd	ra,40(sp)
    80004914:	02813023          	sd	s0,32(sp)
    80004918:	00913c23          	sd	s1,24(sp)
    8000491c:	01213823          	sd	s2,16(sp)
    80004920:	01313423          	sd	s3,8(sp)
    80004924:	03010413          	addi	s0,sp,48
    int id_parent = TCB::running->t_id;
    80004928:	00005917          	auipc	s2,0x5
    8000492c:	a4890913          	addi	s2,s2,-1464 # 80009370 <_ZN3TCB7runningE>
    80004930:	00093783          	ld	a5,0(s2)
    80004934:	0007a983          	lw	s3,0(a5)
    void *operator new(size_t size) { return Allocator::_mem_alloc(size); }
    80004938:	07800513          	li	a0,120
    8000493c:	ffffe097          	auipc	ra,0xffffe
    80004940:	67c080e7          	jalr	1660(ra) # 80002fb8 <_ZN9Allocator10_mem_allocEm>
    80004944:	00050493          	mv	s1,a0
    TCB *handle = new TCB(*TCB::running);
    80004948:	00093583          	ld	a1,0(s2)
    8000494c:	00000097          	auipc	ra,0x0
    80004950:	efc080e7          	jalr	-260(ra) # 80004848 <_ZN3TCBC1ERS_>
    TCB::duplicate(TCB::running, handle);
    80004954:	00048593          	mv	a1,s1
    80004958:	00093503          	ld	a0,0(s2)
    8000495c:	00000097          	auipc	ra,0x0
    80004960:	c5c080e7          	jalr	-932(ra) # 800045b8 <_ZN3TCB9duplicateEPS_S0_>
    print(TCB::running->t_id);
    80004964:	00093783          	ld	a5,0(s2)
    80004968:	0007a503          	lw	a0,0(a5)
    8000496c:	ffffe097          	auipc	ra,0xffffe
    80004970:	e90080e7          	jalr	-368(ra) # 800027fc <_Z5printi>
    putc(' ');
    80004974:	02000513          	li	a0,32
    80004978:	ffffd097          	auipc	ra,0xffffd
    8000497c:	078080e7          	jalr	120(ra) # 800019f0 <_Z4putcc>
    print(id_parent);
    80004980:	00098513          	mv	a0,s3
    80004984:	ffffe097          	auipc	ra,0xffffe
    80004988:	e78080e7          	jalr	-392(ra) # 800027fc <_Z5printi>
    putc(' ');
    8000498c:	02000513          	li	a0,32
    80004990:	ffffd097          	auipc	ra,0xffffd
    80004994:	060080e7          	jalr	96(ra) # 800019f0 <_Z4putcc>
    print(handle->t_id);
    80004998:	0004a503          	lw	a0,0(s1)
    8000499c:	ffffe097          	auipc	ra,0xffffe
    800049a0:	e60080e7          	jalr	-416(ra) # 800027fc <_Z5printi>
    putc('\n');
    800049a4:	00a00513          	li	a0,10
    800049a8:	ffffd097          	auipc	ra,0xffffd
    800049ac:	048080e7          	jalr	72(ra) # 800019f0 <_Z4putcc>
    if (TCB::running->t_id == id_parent) {
    800049b0:	00093783          	ld	a5,0(s2)
    800049b4:	0007a503          	lw	a0,0(a5)
    800049b8:	03350663          	beq	a0,s3,800049e4 <_ZN3TCB5_forkEv+0xd8>
        print(TCB::running->t_id);
    800049bc:	ffffe097          	auipc	ra,0xffffe
    800049c0:	e40080e7          	jalr	-448(ra) # 800027fc <_Z5printi>
        return 0;
    800049c4:	00000513          	li	a0,0
}
    800049c8:	02813083          	ld	ra,40(sp)
    800049cc:	02013403          	ld	s0,32(sp)
    800049d0:	01813483          	ld	s1,24(sp)
    800049d4:	01013903          	ld	s2,16(sp)
    800049d8:	00813983          	ld	s3,8(sp)
    800049dc:	03010113          	addi	sp,sp,48
    800049e0:	00008067          	ret
        Scheduler::put(handle);
    800049e4:	00048513          	mv	a0,s1
    800049e8:	00000097          	auipc	ra,0x0
    800049ec:	838080e7          	jalr	-1992(ra) # 80004220 <_ZN9Scheduler3putEP3TCB>
        return handle->t_id;
    800049f0:	0004a503          	lw	a0,0(s1)
    800049f4:	fd5ff06f          	j	800049c8 <_ZN3TCB5_forkEv+0xbc>
    800049f8:	00050913          	mv	s2,a0
    void operator delete(void *pointer) { Allocator::_mem_free(pointer); }
    800049fc:	00048513          	mv	a0,s1
    80004a00:	ffffe097          	auipc	ra,0xffffe
    80004a04:	674080e7          	jalr	1652(ra) # 80003074 <_ZN9Allocator9_mem_freeEPKv>
    80004a08:	00090513          	mv	a0,s2
    80004a0c:	00006097          	auipc	ra,0x6
    80004a10:	a4c080e7          	jalr	-1460(ra) # 8000a458 <_Unwind_Resume>

0000000080004a14 <_ZN3TCB14destroy_threadEPS_>:
TCB *TCB::destroy_thread(TCB *thread) {
    80004a14:	fe010113          	addi	sp,sp,-32
    80004a18:	00113c23          	sd	ra,24(sp)
    80004a1c:	00813823          	sd	s0,16(sp)
    80004a20:	00913423          	sd	s1,8(sp)
    80004a24:	02010413          	addi	s0,sp,32
    80004a28:	00050493          	mv	s1,a0
        inline bool is_empty() const { return this->size == 0; }
    80004a2c:	0704a783          	lw	a5,112(s1)
    while (!thread->joiner.is_empty()) {
    80004a30:	02078663          	beqz	a5,80004a5c <_ZN3TCB14destroy_threadEPS_+0x48>
        TCB *next = thread->joiner.get();
    80004a34:	06048513          	addi	a0,s1,96
    80004a38:	ffffe097          	auipc	ra,0xffffe
    80004a3c:	ac0080e7          	jalr	-1344(ra) # 800024f8 <_ZN2os14CircularBufferIP3TCBE3getEv>
    bool is_joined() const { return this->status == JOINED; }
    80004a40:	04852703          	lw	a4,72(a0) # 4048 <_entry-0x7fffbfb8>
        if (next->is_joined()) {
    80004a44:	00300793          	li	a5,3
    80004a48:	fef712e3          	bne	a4,a5,80004a2c <_ZN3TCB14destroy_threadEPS_+0x18>
    void run() { this->status = RUNNABLE; }
    80004a4c:	04052423          	sw	zero,72(a0)
            Scheduler::put(next);
    80004a50:	fffff097          	auipc	ra,0xfffff
    80004a54:	7d0080e7          	jalr	2000(ra) # 80004220 <_ZN9Scheduler3putEP3TCB>
    80004a58:	fd5ff06f          	j	80004a2c <_ZN3TCB14destroy_threadEPS_+0x18>
    thread->joiner.destroy();
    80004a5c:	06048513          	addi	a0,s1,96
    80004a60:	ffffe097          	auipc	ra,0xffffe
    80004a64:	ae4080e7          	jalr	-1308(ra) # 80002544 <_ZN2os14CircularBufferIP3TCBE7destroyEv>
}
    80004a68:	00048513          	mv	a0,s1
    80004a6c:	01813083          	ld	ra,24(sp)
    80004a70:	01013403          	ld	s0,16(sp)
    80004a74:	00813483          	ld	s1,8(sp)
    80004a78:	02010113          	addi	sp,sp,32
    80004a7c:	00008067          	ret

0000000080004a80 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80004a80:	fd010113          	addi	sp,sp,-48
    80004a84:	02113423          	sd	ra,40(sp)
    80004a88:	02813023          	sd	s0,32(sp)
    80004a8c:	00913c23          	sd	s1,24(sp)
    80004a90:	03010413          	addi	s0,sp,48
    thread_t old = TCB::running;
    80004a94:	00005497          	auipc	s1,0x5
    80004a98:	8dc4b483          	ld	s1,-1828(s1) # 80009370 <_ZN3TCB7runningE>
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80004a9c:	100027f3          	csrr	a5,sstatus
    80004aa0:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80004aa4:	fd843783          	ld	a5,-40(s0)
    old->context.sstatus = Riscv::r_sstatus();
    80004aa8:	02f4bc23          	sd	a5,56(s1)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80004aac:	141027f3          	csrr	a5,sepc
    80004ab0:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80004ab4:	fd043783          	ld	a5,-48(s0)
    old->context.sepc = Riscv::r_sepc();
    80004ab8:	04f4b023          	sd	a5,64(s1)
    bool is_runnable() const { return this->status == RUNNABLE; }
    80004abc:	0484a783          	lw	a5,72(s1)
    if (old->is_runnable() && old != handle_bleya) {
    80004ac0:	02079263          	bnez	a5,80004ae4 <_ZN3TCB5yieldEv+0x64>
    80004ac4:	00004717          	auipc	a4,0x4
    80004ac8:	73c73703          	ld	a4,1852(a4) # 80009200 <_GLOBAL_OFFSET_TABLE_+0x20>
    80004acc:	00073703          	ld	a4,0(a4)
    80004ad0:	00970a63          	beq	a4,s1,80004ae4 <_ZN3TCB5yieldEv+0x64>
        Scheduler::put(old);
    80004ad4:	00048513          	mv	a0,s1
    80004ad8:	fffff097          	auipc	ra,0xfffff
    80004adc:	748080e7          	jalr	1864(ra) # 80004220 <_ZN9Scheduler3putEP3TCB>
    80004ae0:	00c0006f          	j	80004aec <_ZN3TCB5yieldEv+0x6c>
    } else if (old->is_finished()) {
    80004ae4:	00400713          	li	a4,4
    80004ae8:	04e78663          	beq	a5,a4,80004b34 <_ZN3TCB5yieldEv+0xb4>
    80004aec:	00004797          	auipc	a5,0x4
    80004af0:	77c7b783          	ld	a5,1916(a5) # 80009268 <_GLOBAL_OFFSET_TABLE_+0x88>
    80004af4:	0107a783          	lw	a5,16(a5)
    80004af8:	06079463          	bnez	a5,80004b60 <_ZN3TCB5yieldEv+0xe0>
    80004afc:	00004797          	auipc	a5,0x4
    80004b00:	74c7b783          	ld	a5,1868(a5) # 80009248 <_GLOBAL_OFFSET_TABLE_+0x68>
    80004b04:	0107a783          	lw	a5,16(a5)
    80004b08:	04079c63          	bnez	a5,80004b60 <_ZN3TCB5yieldEv+0xe0>
    80004b0c:	00004797          	auipc	a5,0x4
    80004b10:	7147b783          	ld	a5,1812(a5) # 80009220 <_GLOBAL_OFFSET_TABLE_+0x40>
    80004b14:	0107a783          	lw	a5,16(a5)
    80004b18:	04079463          	bnez	a5,80004b60 <_ZN3TCB5yieldEv+0xe0>
        TCB::running = handle_bleya;
    80004b1c:	00004797          	auipc	a5,0x4
    80004b20:	6e47b783          	ld	a5,1764(a5) # 80009200 <_GLOBAL_OFFSET_TABLE_+0x20>
    80004b24:	0007b783          	ld	a5,0(a5)
    80004b28:	00005717          	auipc	a4,0x5
    80004b2c:	84f73423          	sd	a5,-1976(a4) # 80009370 <_ZN3TCB7runningE>
    80004b30:	0540006f          	j	80004b84 <_ZN3TCB5yieldEv+0x104>
        Allocator::_mem_free(old->stack);
    80004b34:	0184b503          	ld	a0,24(s1)
    80004b38:	ffffe097          	auipc	ra,0xffffe
    80004b3c:	53c080e7          	jalr	1340(ra) # 80003074 <_ZN9Allocator9_mem_freeEPKv>
    80004b40:	fadff06f          	j	80004aec <_ZN3TCB5yieldEv+0x6c>
            Allocator::_mem_free(TCB::destroy_thread(Scheduler::get())->stack);
    80004b44:	fffff097          	auipc	ra,0xfffff
    80004b48:	5f0080e7          	jalr	1520(ra) # 80004134 <_ZN9Scheduler3getEv>
    80004b4c:	00000097          	auipc	ra,0x0
    80004b50:	ec8080e7          	jalr	-312(ra) # 80004a14 <_ZN3TCB14destroy_threadEPS_>
    80004b54:	01853503          	ld	a0,24(a0)
    80004b58:	ffffe097          	auipc	ra,0xffffe
    80004b5c:	51c080e7          	jalr	1308(ra) # 80003074 <_ZN9Allocator9_mem_freeEPKv>
        while (Scheduler::peek()->is_finished()) {
    80004b60:	fffff097          	auipc	ra,0xfffff
    80004b64:	644080e7          	jalr	1604(ra) # 800041a4 <_ZN9Scheduler4peekEv>
    bool is_finished() const { return this->status == FINISHED; }
    80004b68:	04852703          	lw	a4,72(a0)
    80004b6c:	00400793          	li	a5,4
    80004b70:	fcf70ae3          	beq	a4,a5,80004b44 <_ZN3TCB5yieldEv+0xc4>
        TCB::running = Scheduler::get();
    80004b74:	fffff097          	auipc	ra,0xfffff
    80004b78:	5c0080e7          	jalr	1472(ra) # 80004134 <_ZN9Scheduler3getEv>
    80004b7c:	00004797          	auipc	a5,0x4
    80004b80:	7ea7ba23          	sd	a0,2036(a5) # 80009370 <_ZN3TCB7runningE>
    Riscv::w_sstatus(TCB::running->context.sstatus);
    80004b84:	00004597          	auipc	a1,0x4
    80004b88:	7ec5b583          	ld	a1,2028(a1) # 80009370 <_ZN3TCB7runningE>
    80004b8c:	0385b783          	ld	a5,56(a1)
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80004b90:	10079073          	csrw	sstatus,a5
    Riscv::w_sepc(TCB::running->context.sepc);
    80004b94:	0405b783          	ld	a5,64(a1)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80004b98:	14179073          	csrw	sepc,a5
    TCB::context_switch(&old->context, &TCB::running->context);
    80004b9c:	02858593          	addi	a1,a1,40
    80004ba0:	02848513          	addi	a0,s1,40
    80004ba4:	ffffd097          	auipc	ra,0xffffd
    80004ba8:	8cc080e7          	jalr	-1844(ra) # 80001470 <_ZN3TCB14context_switchEP7ContextS1_>
}
    80004bac:	02813083          	ld	ra,40(sp)
    80004bb0:	02013403          	ld	s0,32(sp)
    80004bb4:	01813483          	ld	s1,24(sp)
    80004bb8:	03010113          	addi	sp,sp,48
    80004bbc:	00008067          	ret

0000000080004bc0 <_ZN3TCB16_thread_dispatchEv>:
void TCB::_thread_dispatch() {
    80004bc0:	ff010113          	addi	sp,sp,-16
    80004bc4:	00113423          	sd	ra,8(sp)
    80004bc8:	00813023          	sd	s0,0(sp)
    80004bcc:	01010413          	addi	s0,sp,16
    Riscv::push();
    80004bd0:	ffffc097          	auipc	ra,0xffffc
    80004bd4:	7a0080e7          	jalr	1952(ra) # 80001370 <_ZN5Riscv4pushEv>
    TCB::yield();
    80004bd8:	00000097          	auipc	ra,0x0
    80004bdc:	ea8080e7          	jalr	-344(ra) # 80004a80 <_ZN3TCB5yieldEv>
    Riscv::pop();
    80004be0:	ffffd097          	auipc	ra,0xffffd
    80004be4:	810080e7          	jalr	-2032(ra) # 800013f0 <_ZN5Riscv3popEv>
}
    80004be8:	00813083          	ld	ra,8(sp)
    80004bec:	00013403          	ld	s0,0(sp)
    80004bf0:	01010113          	addi	sp,sp,16
    80004bf4:	00008067          	ret

0000000080004bf8 <_ZN3TCB12_thread_exitEv>:
void TCB::_thread_exit() {
    80004bf8:	ff010113          	addi	sp,sp,-16
    80004bfc:	00113423          	sd	ra,8(sp)
    80004c00:	00813023          	sd	s0,0(sp)
    80004c04:	01010413          	addi	s0,sp,16
    TCB::running->finish();
    80004c08:	00004517          	auipc	a0,0x4
    80004c0c:	76853503          	ld	a0,1896(a0) # 80009370 <_ZN3TCB7runningE>
    void finish() { this->status = FINISHED; }
    80004c10:	00400793          	li	a5,4
    80004c14:	04f52423          	sw	a5,72(a0)
    TCB::destroy_thread(TCB::running);
    80004c18:	00000097          	auipc	ra,0x0
    80004c1c:	dfc080e7          	jalr	-516(ra) # 80004a14 <_ZN3TCB14destroy_threadEPS_>
    TCB::_thread_dispatch();
    80004c20:	00000097          	auipc	ra,0x0
    80004c24:	fa0080e7          	jalr	-96(ra) # 80004bc0 <_ZN3TCB16_thread_dispatchEv>
}
    80004c28:	00813083          	ld	ra,8(sp)
    80004c2c:	00013403          	ld	s0,0(sp)
    80004c30:	01010113          	addi	sp,sp,16
    80004c34:	00008067          	ret

0000000080004c38 <_ZN3TCB12_thread_joinEPS_>:
    bool is_finished() const { return this->status == FINISHED; }
    80004c38:	04852703          	lw	a4,72(a0)
    if (handle->is_finished())
    80004c3c:	00400793          	li	a5,4
    80004c40:	04f70463          	beq	a4,a5,80004c88 <_ZN3TCB12_thread_joinEPS_+0x50>
void TCB::_thread_join(thread_t handle) {
    80004c44:	ff010113          	addi	sp,sp,-16
    80004c48:	00113423          	sd	ra,8(sp)
    80004c4c:	00813023          	sd	s0,0(sp)
    80004c50:	01010413          	addi	s0,sp,16
    TCB::running->enjoin();
    80004c54:	00004597          	auipc	a1,0x4
    80004c58:	71c5b583          	ld	a1,1820(a1) # 80009370 <_ZN3TCB7runningE>
    void enjoin() { this->status = JOINED; }
    80004c5c:	00300793          	li	a5,3
    80004c60:	04f5a423          	sw	a5,72(a1)
    handle->joiner.put(TCB::running);
    80004c64:	06050513          	addi	a0,a0,96
    80004c68:	ffffe097          	auipc	ra,0xffffe
    80004c6c:	9b4080e7          	jalr	-1612(ra) # 8000261c <_ZN2os14CircularBufferIP3TCBE3putES2_>
    TCB::_thread_dispatch();
    80004c70:	00000097          	auipc	ra,0x0
    80004c74:	f50080e7          	jalr	-176(ra) # 80004bc0 <_ZN3TCB16_thread_dispatchEv>
}
    80004c78:	00813083          	ld	ra,8(sp)
    80004c7c:	00013403          	ld	s0,0(sp)
    80004c80:	01010113          	addi	sp,sp,16
    80004c84:	00008067          	ret
    80004c88:	00008067          	ret

0000000080004c8c <_ZN3TCB12_thread_joinEPS_m>:
    bool is_finished() const { return this->status == FINISHED; }
    80004c8c:	04852703          	lw	a4,72(a0)
    if (handle->is_finished())
    80004c90:	00400793          	li	a5,4
    80004c94:	06f70863          	beq	a4,a5,80004d04 <_ZN3TCB12_thread_joinEPS_m+0x78>
void TCB::_thread_join(thread_t handle, time_t time) {
    80004c98:	fe010113          	addi	sp,sp,-32
    80004c9c:	00113c23          	sd	ra,24(sp)
    80004ca0:	00813823          	sd	s0,16(sp)
    80004ca4:	00913423          	sd	s1,8(sp)
    80004ca8:	01213023          	sd	s2,0(sp)
    80004cac:	02010413          	addi	s0,sp,32
    80004cb0:	00058493          	mv	s1,a1
    TCB::running->enjoin();
    80004cb4:	00004917          	auipc	s2,0x4
    80004cb8:	6bc90913          	addi	s2,s2,1724 # 80009370 <_ZN3TCB7runningE>
    80004cbc:	00093583          	ld	a1,0(s2)
    void enjoin() { this->status = JOINED; }
    80004cc0:	00300793          	li	a5,3
    80004cc4:	04f5a423          	sw	a5,72(a1)
    handle->joiner.put(TCB::running);
    80004cc8:	06050513          	addi	a0,a0,96
    80004ccc:	ffffe097          	auipc	ra,0xffffe
    80004cd0:	950080e7          	jalr	-1712(ra) # 8000261c <_ZN2os14CircularBufferIP3TCBE3putES2_>
    Cradle::insert(TCB::running, time);
    80004cd4:	00048593          	mv	a1,s1
    80004cd8:	00093503          	ld	a0,0(s2)
    80004cdc:	ffffe097          	auipc	ra,0xffffe
    80004ce0:	f9c080e7          	jalr	-100(ra) # 80002c78 <_ZN6Cradle6insertEP3TCBm>
    TCB::_thread_dispatch();
    80004ce4:	00000097          	auipc	ra,0x0
    80004ce8:	edc080e7          	jalr	-292(ra) # 80004bc0 <_ZN3TCB16_thread_dispatchEv>
}
    80004cec:	01813083          	ld	ra,24(sp)
    80004cf0:	01013403          	ld	s0,16(sp)
    80004cf4:	00813483          	ld	s1,8(sp)
    80004cf8:	00013903          	ld	s2,0(sp)
    80004cfc:	02010113          	addi	sp,sp,32
    80004d00:	00008067          	ret
    80004d04:	00008067          	ret

0000000080004d08 <_ZN12MonitorMutex10relinquishEv>:
#include "../h/monitor.hpp"

int MonitorMutex::relinquish() {
    80004d08:	ff010113          	addi	sp,sp,-16
    80004d0c:	00813423          	sd	s0,8(sp)
    80004d10:	01010413          	addi	s0,sp,16
    80004d14:	00050793          	mv	a5,a0
    int ret = this->nesting_count;
    80004d18:	01852503          	lw	a0,24(a0)
    this->nesting_count = 1;
    80004d1c:	00100713          	li	a4,1
    80004d20:	00e7ac23          	sw	a4,24(a5)
    return ret;
}
    80004d24:	00813403          	ld	s0,8(sp)
    80004d28:	01010113          	addi	sp,sp,16
    80004d2c:	00008067          	ret

0000000080004d30 <_ZN12MonitorMutex9reacquireEi>:

void MonitorMutex::reacquire(int count) {
    80004d30:	ff010113          	addi	sp,sp,-16
    80004d34:	00813423          	sd	s0,8(sp)
    80004d38:	01010413          	addi	s0,sp,16
    this->nesting_count = count;
    80004d3c:	00b52c23          	sw	a1,24(a0)
}
    80004d40:	00813403          	ld	s0,8(sp)
    80004d44:	01010113          	addi	sp,sp,16
    80004d48:	00008067          	ret

0000000080004d4c <_ZN11MonitorLockC1ER12MonitorMutex>:

MonitorLock::MonitorLock(MonitorMutex &mutex) : monitorMutex(mutex) {
    80004d4c:	ff010113          	addi	sp,sp,-16
    80004d50:	00113423          	sd	ra,8(sp)
    80004d54:	00813023          	sd	s0,0(sp)
    80004d58:	01010413          	addi	s0,sp,16
    80004d5c:	00b53023          	sd	a1,0(a0)
    this->monitorMutex.wait();
    80004d60:	0005b783          	ld	a5,0(a1)
    80004d64:	0107b783          	ld	a5,16(a5)
    80004d68:	00058513          	mv	a0,a1
    80004d6c:	000780e7          	jalr	a5
}
    80004d70:	00813083          	ld	ra,8(sp)
    80004d74:	00013403          	ld	s0,0(sp)
    80004d78:	01010113          	addi	sp,sp,16
    80004d7c:	00008067          	ret

0000000080004d80 <_ZN11MonitorLockD1Ev>:

MonitorLock::~MonitorLock() {
    80004d80:	ff010113          	addi	sp,sp,-16
    80004d84:	00113423          	sd	ra,8(sp)
    80004d88:	00813023          	sd	s0,0(sp)
    80004d8c:	01010413          	addi	s0,sp,16
    this->monitorMutex.signal();
    80004d90:	00053503          	ld	a0,0(a0)
    80004d94:	00053783          	ld	a5,0(a0)
    80004d98:	0187b783          	ld	a5,24(a5)
    80004d9c:	000780e7          	jalr	a5
}
    80004da0:	00813083          	ld	ra,8(sp)
    80004da4:	00013403          	ld	s0,0(sp)
    80004da8:	01010113          	addi	sp,sp,16
    80004dac:	00008067          	ret

0000000080004db0 <_ZN11ConditionalC1EP7Monitor>:

Conditional::Conditional(Monitor *monitor) : owner(monitor), count(0), blocker(0) {}
    80004db0:	ff010113          	addi	sp,sp,-16
    80004db4:	00113423          	sd	ra,8(sp)
    80004db8:	00813023          	sd	s0,0(sp)
    80004dbc:	01010413          	addi	s0,sp,16
    80004dc0:	00b53023          	sd	a1,0(a0)
    80004dc4:	00052423          	sw	zero,8(a0)
    80004dc8:	00000593          	li	a1,0
    80004dcc:	01050513          	addi	a0,a0,16
    80004dd0:	fffff097          	auipc	ra,0xfffff
    80004dd4:	d1c080e7          	jalr	-740(ra) # 80003aec <_ZN9SemaphoreC1Ej>
    80004dd8:	00813083          	ld	ra,8(sp)
    80004ddc:	00013403          	ld	s0,0(sp)
    80004de0:	01010113          	addi	sp,sp,16
    80004de4:	00008067          	ret

0000000080004de8 <_ZN11Conditional4waitEv>:

void Conditional::wait() {
    80004de8:	fe010113          	addi	sp,sp,-32
    80004dec:	00113c23          	sd	ra,24(sp)
    80004df0:	00813823          	sd	s0,16(sp)
    80004df4:	00913423          	sd	s1,8(sp)
    80004df8:	01213023          	sd	s2,0(sp)
    80004dfc:	02010413          	addi	s0,sp,32
    80004e00:	00050493          	mv	s1,a0
    this->count++;
    80004e04:	00852783          	lw	a5,8(a0)
    80004e08:	0017879b          	addiw	a5,a5,1
    80004e0c:	00f52423          	sw	a5,8(a0)
    int nesting = this->owner->monitorMutex.relinquish();
    80004e10:	00053503          	ld	a0,0(a0)
    80004e14:	00000097          	auipc	ra,0x0
    80004e18:	ef4080e7          	jalr	-268(ra) # 80004d08 <_ZN12MonitorMutex10relinquishEv>
    80004e1c:	00050913          	mv	s2,a0
    Semaphore::signal_and_wait(this->owner->monitorMutex, this->blocker);
    80004e20:	01048593          	addi	a1,s1,16
    80004e24:	0004b503          	ld	a0,0(s1)
    80004e28:	fffff097          	auipc	ra,0xfffff
    80004e2c:	cfc080e7          	jalr	-772(ra) # 80003b24 <_ZN9Semaphore15signal_and_waitERS_S0_>
    this->owner->monitorMutex.reacquire(nesting);
    80004e30:	00090593          	mv	a1,s2
    80004e34:	0004b503          	ld	a0,0(s1)
    80004e38:	00000097          	auipc	ra,0x0
    80004e3c:	ef8080e7          	jalr	-264(ra) # 80004d30 <_ZN12MonitorMutex9reacquireEi>
    this->owner->monitorMutex.wait();
    80004e40:	0004b503          	ld	a0,0(s1)
    80004e44:	fffff097          	auipc	ra,0xfffff
    80004e48:	548080e7          	jalr	1352(ra) # 8000438c <_ZN10OwnedMutex4waitEv>
}
    80004e4c:	01813083          	ld	ra,24(sp)
    80004e50:	01013403          	ld	s0,16(sp)
    80004e54:	00813483          	ld	s1,8(sp)
    80004e58:	00013903          	ld	s2,0(sp)
    80004e5c:	02010113          	addi	sp,sp,32
    80004e60:	00008067          	ret

0000000080004e64 <_ZN11Conditional6signalEv>:

void Conditional::signal() {
    if (this->count == 0) return;
    80004e64:	00852783          	lw	a5,8(a0)
    80004e68:	00079463          	bnez	a5,80004e70 <_ZN11Conditional6signalEv+0xc>
    80004e6c:	00008067          	ret
void Conditional::signal() {
    80004e70:	fe010113          	addi	sp,sp,-32
    80004e74:	00113c23          	sd	ra,24(sp)
    80004e78:	00813823          	sd	s0,16(sp)
    80004e7c:	00913423          	sd	s1,8(sp)
    80004e80:	02010413          	addi	s0,sp,32
    80004e84:	00050493          	mv	s1,a0
    this->blocker.signal();
    80004e88:	01050513          	addi	a0,a0,16
    80004e8c:	fffff097          	auipc	ra,0xfffff
    80004e90:	9b0080e7          	jalr	-1616(ra) # 8000383c <_ZN9Semaphore6signalEv>
    this->count--;
    80004e94:	0084a783          	lw	a5,8(s1)
    80004e98:	fff7879b          	addiw	a5,a5,-1
    80004e9c:	00f4a423          	sw	a5,8(s1)
}
    80004ea0:	01813083          	ld	ra,24(sp)
    80004ea4:	01013403          	ld	s0,16(sp)
    80004ea8:	00813483          	ld	s1,8(sp)
    80004eac:	02010113          	addi	sp,sp,32
    80004eb0:	00008067          	ret

0000000080004eb4 <_ZN11Conditional9signalAllEv>:

void Conditional::signalAll() {
    80004eb4:	fe010113          	addi	sp,sp,-32
    80004eb8:	00113c23          	sd	ra,24(sp)
    80004ebc:	00813823          	sd	s0,16(sp)
    80004ec0:	00913423          	sd	s1,8(sp)
    80004ec4:	01213023          	sd	s2,0(sp)
    80004ec8:	02010413          	addi	s0,sp,32
    80004ecc:	00050913          	mv	s2,a0
    for (unsigned int i = 0; i < this->count; i++)
    80004ed0:	00000493          	li	s1,0
    80004ed4:	00892783          	lw	a5,8(s2)
    80004ed8:	00f4fc63          	bgeu	s1,a5,80004ef0 <_ZN11Conditional9signalAllEv+0x3c>
        this->blocker.signal();
    80004edc:	01090513          	addi	a0,s2,16
    80004ee0:	fffff097          	auipc	ra,0xfffff
    80004ee4:	95c080e7          	jalr	-1700(ra) # 8000383c <_ZN9Semaphore6signalEv>
    for (unsigned int i = 0; i < this->count; i++)
    80004ee8:	0014849b          	addiw	s1,s1,1
    80004eec:	fe9ff06f          	j	80004ed4 <_ZN11Conditional9signalAllEv+0x20>
    this->count = 0;
    80004ef0:	00092423          	sw	zero,8(s2)
    80004ef4:	01813083          	ld	ra,24(sp)
    80004ef8:	01013403          	ld	s0,16(sp)
    80004efc:	00813483          	ld	s1,8(sp)
    80004f00:	00013903          	ld	s2,0(sp)
    80004f04:	02010113          	addi	sp,sp,32
    80004f08:	00008067          	ret

0000000080004f0c <start>:
    80004f0c:	ff010113          	addi	sp,sp,-16
    80004f10:	00813423          	sd	s0,8(sp)
    80004f14:	01010413          	addi	s0,sp,16
    80004f18:	300027f3          	csrr	a5,mstatus
    80004f1c:	ffffe737          	lui	a4,0xffffe
    80004f20:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff420f>
    80004f24:	00e7f7b3          	and	a5,a5,a4
    80004f28:	00001737          	lui	a4,0x1
    80004f2c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004f30:	00e7e7b3          	or	a5,a5,a4
    80004f34:	30079073          	csrw	mstatus,a5
    80004f38:	00000797          	auipc	a5,0x0
    80004f3c:	16078793          	addi	a5,a5,352 # 80005098 <system_main>
    80004f40:	34179073          	csrw	mepc,a5
    80004f44:	00000793          	li	a5,0
    80004f48:	18079073          	csrw	satp,a5
    80004f4c:	000107b7          	lui	a5,0x10
    80004f50:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80004f54:	30279073          	csrw	medeleg,a5
    80004f58:	30379073          	csrw	mideleg,a5
    80004f5c:	104027f3          	csrr	a5,sie
    80004f60:	2227e793          	ori	a5,a5,546
    80004f64:	10479073          	csrw	sie,a5
    80004f68:	fff00793          	li	a5,-1
    80004f6c:	00a7d793          	srli	a5,a5,0xa
    80004f70:	3b079073          	csrw	pmpaddr0,a5
    80004f74:	00f00793          	li	a5,15
    80004f78:	3a079073          	csrw	pmpcfg0,a5
    80004f7c:	f14027f3          	csrr	a5,mhartid
    80004f80:	0200c737          	lui	a4,0x200c
    80004f84:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004f88:	0007869b          	sext.w	a3,a5
    80004f8c:	00269713          	slli	a4,a3,0x2
    80004f90:	000f4637          	lui	a2,0xf4
    80004f94:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004f98:	00d70733          	add	a4,a4,a3
    80004f9c:	0037979b          	slliw	a5,a5,0x3
    80004fa0:	020046b7          	lui	a3,0x2004
    80004fa4:	00d787b3          	add	a5,a5,a3
    80004fa8:	00c585b3          	add	a1,a1,a2
    80004fac:	00371693          	slli	a3,a4,0x3
    80004fb0:	00004717          	auipc	a4,0x4
    80004fb4:	3e070713          	addi	a4,a4,992 # 80009390 <timer_scratch>
    80004fb8:	00b7b023          	sd	a1,0(a5)
    80004fbc:	00d70733          	add	a4,a4,a3
    80004fc0:	00f73c23          	sd	a5,24(a4)
    80004fc4:	02c73023          	sd	a2,32(a4)
    80004fc8:	34071073          	csrw	mscratch,a4
    80004fcc:	00000797          	auipc	a5,0x0
    80004fd0:	6e478793          	addi	a5,a5,1764 # 800056b0 <timervec>
    80004fd4:	30579073          	csrw	mtvec,a5
    80004fd8:	300027f3          	csrr	a5,mstatus
    80004fdc:	0087e793          	ori	a5,a5,8
    80004fe0:	30079073          	csrw	mstatus,a5
    80004fe4:	304027f3          	csrr	a5,mie
    80004fe8:	0807e793          	ori	a5,a5,128
    80004fec:	30479073          	csrw	mie,a5
    80004ff0:	f14027f3          	csrr	a5,mhartid
    80004ff4:	0007879b          	sext.w	a5,a5
    80004ff8:	00078213          	mv	tp,a5
    80004ffc:	30200073          	mret
    80005000:	00813403          	ld	s0,8(sp)
    80005004:	01010113          	addi	sp,sp,16
    80005008:	00008067          	ret

000000008000500c <timerinit>:
    8000500c:	ff010113          	addi	sp,sp,-16
    80005010:	00813423          	sd	s0,8(sp)
    80005014:	01010413          	addi	s0,sp,16
    80005018:	f14027f3          	csrr	a5,mhartid
    8000501c:	0200c737          	lui	a4,0x200c
    80005020:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005024:	0007869b          	sext.w	a3,a5
    80005028:	00269713          	slli	a4,a3,0x2
    8000502c:	000f4637          	lui	a2,0xf4
    80005030:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005034:	00d70733          	add	a4,a4,a3
    80005038:	0037979b          	slliw	a5,a5,0x3
    8000503c:	020046b7          	lui	a3,0x2004
    80005040:	00d787b3          	add	a5,a5,a3
    80005044:	00c585b3          	add	a1,a1,a2
    80005048:	00371693          	slli	a3,a4,0x3
    8000504c:	00004717          	auipc	a4,0x4
    80005050:	34470713          	addi	a4,a4,836 # 80009390 <timer_scratch>
    80005054:	00b7b023          	sd	a1,0(a5)
    80005058:	00d70733          	add	a4,a4,a3
    8000505c:	00f73c23          	sd	a5,24(a4)
    80005060:	02c73023          	sd	a2,32(a4)
    80005064:	34071073          	csrw	mscratch,a4
    80005068:	00000797          	auipc	a5,0x0
    8000506c:	64878793          	addi	a5,a5,1608 # 800056b0 <timervec>
    80005070:	30579073          	csrw	mtvec,a5
    80005074:	300027f3          	csrr	a5,mstatus
    80005078:	0087e793          	ori	a5,a5,8
    8000507c:	30079073          	csrw	mstatus,a5
    80005080:	304027f3          	csrr	a5,mie
    80005084:	0807e793          	ori	a5,a5,128
    80005088:	30479073          	csrw	mie,a5
    8000508c:	00813403          	ld	s0,8(sp)
    80005090:	01010113          	addi	sp,sp,16
    80005094:	00008067          	ret

0000000080005098 <system_main>:
    80005098:	fe010113          	addi	sp,sp,-32
    8000509c:	00813823          	sd	s0,16(sp)
    800050a0:	00913423          	sd	s1,8(sp)
    800050a4:	00113c23          	sd	ra,24(sp)
    800050a8:	02010413          	addi	s0,sp,32
    800050ac:	00000097          	auipc	ra,0x0
    800050b0:	0c4080e7          	jalr	196(ra) # 80005170 <cpuid>
    800050b4:	00004497          	auipc	s1,0x4
    800050b8:	1dc48493          	addi	s1,s1,476 # 80009290 <started>
    800050bc:	02050263          	beqz	a0,800050e0 <system_main+0x48>
    800050c0:	0004a783          	lw	a5,0(s1)
    800050c4:	0007879b          	sext.w	a5,a5
    800050c8:	fe078ce3          	beqz	a5,800050c0 <system_main+0x28>
    800050cc:	0ff0000f          	fence
    800050d0:	00002517          	auipc	a0,0x2
    800050d4:	14050513          	addi	a0,a0,320 # 80007210 <_ZN3stm4coutE+0x190>
    800050d8:	00001097          	auipc	ra,0x1
    800050dc:	a74080e7          	jalr	-1420(ra) # 80005b4c <panic>
    800050e0:	00001097          	auipc	ra,0x1
    800050e4:	9c8080e7          	jalr	-1592(ra) # 80005aa8 <consoleinit>
    800050e8:	00001097          	auipc	ra,0x1
    800050ec:	154080e7          	jalr	340(ra) # 8000623c <printfinit>
    800050f0:	00002517          	auipc	a0,0x2
    800050f4:	20050513          	addi	a0,a0,512 # 800072f0 <_ZN3stm4coutE+0x270>
    800050f8:	00001097          	auipc	ra,0x1
    800050fc:	ab0080e7          	jalr	-1360(ra) # 80005ba8 <__printf>
    80005100:	00002517          	auipc	a0,0x2
    80005104:	0e050513          	addi	a0,a0,224 # 800071e0 <_ZN3stm4coutE+0x160>
    80005108:	00001097          	auipc	ra,0x1
    8000510c:	aa0080e7          	jalr	-1376(ra) # 80005ba8 <__printf>
    80005110:	00002517          	auipc	a0,0x2
    80005114:	1e050513          	addi	a0,a0,480 # 800072f0 <_ZN3stm4coutE+0x270>
    80005118:	00001097          	auipc	ra,0x1
    8000511c:	a90080e7          	jalr	-1392(ra) # 80005ba8 <__printf>
    80005120:	00001097          	auipc	ra,0x1
    80005124:	4a8080e7          	jalr	1192(ra) # 800065c8 <kinit>
    80005128:	00000097          	auipc	ra,0x0
    8000512c:	148080e7          	jalr	328(ra) # 80005270 <trapinit>
    80005130:	00000097          	auipc	ra,0x0
    80005134:	16c080e7          	jalr	364(ra) # 8000529c <trapinithart>
    80005138:	00000097          	auipc	ra,0x0
    8000513c:	5b8080e7          	jalr	1464(ra) # 800056f0 <plicinit>
    80005140:	00000097          	auipc	ra,0x0
    80005144:	5d8080e7          	jalr	1496(ra) # 80005718 <plicinithart>
    80005148:	00000097          	auipc	ra,0x0
    8000514c:	078080e7          	jalr	120(ra) # 800051c0 <userinit>
    80005150:	0ff0000f          	fence
    80005154:	00100793          	li	a5,1
    80005158:	00002517          	auipc	a0,0x2
    8000515c:	0a050513          	addi	a0,a0,160 # 800071f8 <_ZN3stm4coutE+0x178>
    80005160:	00f4a023          	sw	a5,0(s1)
    80005164:	00001097          	auipc	ra,0x1
    80005168:	a44080e7          	jalr	-1468(ra) # 80005ba8 <__printf>
    8000516c:	0000006f          	j	8000516c <system_main+0xd4>

0000000080005170 <cpuid>:
    80005170:	ff010113          	addi	sp,sp,-16
    80005174:	00813423          	sd	s0,8(sp)
    80005178:	01010413          	addi	s0,sp,16
    8000517c:	00020513          	mv	a0,tp
    80005180:	00813403          	ld	s0,8(sp)
    80005184:	0005051b          	sext.w	a0,a0
    80005188:	01010113          	addi	sp,sp,16
    8000518c:	00008067          	ret

0000000080005190 <mycpu>:
    80005190:	ff010113          	addi	sp,sp,-16
    80005194:	00813423          	sd	s0,8(sp)
    80005198:	01010413          	addi	s0,sp,16
    8000519c:	00020793          	mv	a5,tp
    800051a0:	00813403          	ld	s0,8(sp)
    800051a4:	0007879b          	sext.w	a5,a5
    800051a8:	00779793          	slli	a5,a5,0x7
    800051ac:	00005517          	auipc	a0,0x5
    800051b0:	21450513          	addi	a0,a0,532 # 8000a3c0 <cpus>
    800051b4:	00f50533          	add	a0,a0,a5
    800051b8:	01010113          	addi	sp,sp,16
    800051bc:	00008067          	ret

00000000800051c0 <userinit>:
    800051c0:	ff010113          	addi	sp,sp,-16
    800051c4:	00813423          	sd	s0,8(sp)
    800051c8:	01010413          	addi	s0,sp,16
    800051cc:	00813403          	ld	s0,8(sp)
    800051d0:	01010113          	addi	sp,sp,16
    800051d4:	ffffe317          	auipc	t1,0xffffe
    800051d8:	43830067          	jr	1080(t1) # 8000360c <main>

00000000800051dc <either_copyout>:
    800051dc:	ff010113          	addi	sp,sp,-16
    800051e0:	00813023          	sd	s0,0(sp)
    800051e4:	00113423          	sd	ra,8(sp)
    800051e8:	01010413          	addi	s0,sp,16
    800051ec:	02051663          	bnez	a0,80005218 <either_copyout+0x3c>
    800051f0:	00058513          	mv	a0,a1
    800051f4:	00060593          	mv	a1,a2
    800051f8:	0006861b          	sext.w	a2,a3
    800051fc:	00002097          	auipc	ra,0x2
    80005200:	c58080e7          	jalr	-936(ra) # 80006e54 <__memmove>
    80005204:	00813083          	ld	ra,8(sp)
    80005208:	00013403          	ld	s0,0(sp)
    8000520c:	00000513          	li	a0,0
    80005210:	01010113          	addi	sp,sp,16
    80005214:	00008067          	ret
    80005218:	00002517          	auipc	a0,0x2
    8000521c:	02050513          	addi	a0,a0,32 # 80007238 <_ZN3stm4coutE+0x1b8>
    80005220:	00001097          	auipc	ra,0x1
    80005224:	92c080e7          	jalr	-1748(ra) # 80005b4c <panic>

0000000080005228 <either_copyin>:
    80005228:	ff010113          	addi	sp,sp,-16
    8000522c:	00813023          	sd	s0,0(sp)
    80005230:	00113423          	sd	ra,8(sp)
    80005234:	01010413          	addi	s0,sp,16
    80005238:	02059463          	bnez	a1,80005260 <either_copyin+0x38>
    8000523c:	00060593          	mv	a1,a2
    80005240:	0006861b          	sext.w	a2,a3
    80005244:	00002097          	auipc	ra,0x2
    80005248:	c10080e7          	jalr	-1008(ra) # 80006e54 <__memmove>
    8000524c:	00813083          	ld	ra,8(sp)
    80005250:	00013403          	ld	s0,0(sp)
    80005254:	00000513          	li	a0,0
    80005258:	01010113          	addi	sp,sp,16
    8000525c:	00008067          	ret
    80005260:	00002517          	auipc	a0,0x2
    80005264:	00050513          	mv	a0,a0
    80005268:	00001097          	auipc	ra,0x1
    8000526c:	8e4080e7          	jalr	-1820(ra) # 80005b4c <panic>

0000000080005270 <trapinit>:
    80005270:	ff010113          	addi	sp,sp,-16
    80005274:	00813423          	sd	s0,8(sp)
    80005278:	01010413          	addi	s0,sp,16
    8000527c:	00813403          	ld	s0,8(sp)
    80005280:	00002597          	auipc	a1,0x2
    80005284:	00858593          	addi	a1,a1,8 # 80007288 <_ZN3stm4coutE+0x208>
    80005288:	00005517          	auipc	a0,0x5
    8000528c:	1b850513          	addi	a0,a0,440 # 8000a440 <tickslock>
    80005290:	01010113          	addi	sp,sp,16
    80005294:	00001317          	auipc	t1,0x1
    80005298:	5c430067          	jr	1476(t1) # 80006858 <initlock>

000000008000529c <trapinithart>:
    8000529c:	ff010113          	addi	sp,sp,-16
    800052a0:	00813423          	sd	s0,8(sp)
    800052a4:	01010413          	addi	s0,sp,16
    800052a8:	00000797          	auipc	a5,0x0
    800052ac:	2f878793          	addi	a5,a5,760 # 800055a0 <kernelvec>
    800052b0:	10579073          	csrw	stvec,a5
    800052b4:	00813403          	ld	s0,8(sp)
    800052b8:	01010113          	addi	sp,sp,16
    800052bc:	00008067          	ret

00000000800052c0 <usertrap>:
    800052c0:	ff010113          	addi	sp,sp,-16
    800052c4:	00813423          	sd	s0,8(sp)
    800052c8:	01010413          	addi	s0,sp,16
    800052cc:	00813403          	ld	s0,8(sp)
    800052d0:	01010113          	addi	sp,sp,16
    800052d4:	00008067          	ret

00000000800052d8 <usertrapret>:
    800052d8:	ff010113          	addi	sp,sp,-16
    800052dc:	00813423          	sd	s0,8(sp)
    800052e0:	01010413          	addi	s0,sp,16
    800052e4:	00813403          	ld	s0,8(sp)
    800052e8:	01010113          	addi	sp,sp,16
    800052ec:	00008067          	ret

00000000800052f0 <kerneltrap>:
    800052f0:	fe010113          	addi	sp,sp,-32
    800052f4:	00813823          	sd	s0,16(sp)
    800052f8:	00113c23          	sd	ra,24(sp)
    800052fc:	00913423          	sd	s1,8(sp)
    80005300:	02010413          	addi	s0,sp,32
    80005304:	142025f3          	csrr	a1,scause
    80005308:	100027f3          	csrr	a5,sstatus
    8000530c:	0027f793          	andi	a5,a5,2
    80005310:	10079c63          	bnez	a5,80005428 <kerneltrap+0x138>
    80005314:	142027f3          	csrr	a5,scause
    80005318:	0207ce63          	bltz	a5,80005354 <kerneltrap+0x64>
    8000531c:	00002517          	auipc	a0,0x2
    80005320:	fb450513          	addi	a0,a0,-76 # 800072d0 <_ZN3stm4coutE+0x250>
    80005324:	00001097          	auipc	ra,0x1
    80005328:	884080e7          	jalr	-1916(ra) # 80005ba8 <__printf>
    8000532c:	141025f3          	csrr	a1,sepc
    80005330:	14302673          	csrr	a2,stval
    80005334:	00002517          	auipc	a0,0x2
    80005338:	fac50513          	addi	a0,a0,-84 # 800072e0 <_ZN3stm4coutE+0x260>
    8000533c:	00001097          	auipc	ra,0x1
    80005340:	86c080e7          	jalr	-1940(ra) # 80005ba8 <__printf>
    80005344:	00002517          	auipc	a0,0x2
    80005348:	fb450513          	addi	a0,a0,-76 # 800072f8 <_ZN3stm4coutE+0x278>
    8000534c:	00001097          	auipc	ra,0x1
    80005350:	800080e7          	jalr	-2048(ra) # 80005b4c <panic>
    80005354:	0ff7f713          	andi	a4,a5,255
    80005358:	00900693          	li	a3,9
    8000535c:	04d70063          	beq	a4,a3,8000539c <kerneltrap+0xac>
    80005360:	fff00713          	li	a4,-1
    80005364:	03f71713          	slli	a4,a4,0x3f
    80005368:	00170713          	addi	a4,a4,1
    8000536c:	fae798e3          	bne	a5,a4,8000531c <kerneltrap+0x2c>
    80005370:	00000097          	auipc	ra,0x0
    80005374:	e00080e7          	jalr	-512(ra) # 80005170 <cpuid>
    80005378:	06050663          	beqz	a0,800053e4 <kerneltrap+0xf4>
    8000537c:	144027f3          	csrr	a5,sip
    80005380:	ffd7f793          	andi	a5,a5,-3
    80005384:	14479073          	csrw	sip,a5
    80005388:	01813083          	ld	ra,24(sp)
    8000538c:	01013403          	ld	s0,16(sp)
    80005390:	00813483          	ld	s1,8(sp)
    80005394:	02010113          	addi	sp,sp,32
    80005398:	00008067          	ret
    8000539c:	00000097          	auipc	ra,0x0
    800053a0:	3c8080e7          	jalr	968(ra) # 80005764 <plic_claim>
    800053a4:	00a00793          	li	a5,10
    800053a8:	00050493          	mv	s1,a0
    800053ac:	06f50863          	beq	a0,a5,8000541c <kerneltrap+0x12c>
    800053b0:	fc050ce3          	beqz	a0,80005388 <kerneltrap+0x98>
    800053b4:	00050593          	mv	a1,a0
    800053b8:	00002517          	auipc	a0,0x2
    800053bc:	ef850513          	addi	a0,a0,-264 # 800072b0 <_ZN3stm4coutE+0x230>
    800053c0:	00000097          	auipc	ra,0x0
    800053c4:	7e8080e7          	jalr	2024(ra) # 80005ba8 <__printf>
    800053c8:	01013403          	ld	s0,16(sp)
    800053cc:	01813083          	ld	ra,24(sp)
    800053d0:	00048513          	mv	a0,s1
    800053d4:	00813483          	ld	s1,8(sp)
    800053d8:	02010113          	addi	sp,sp,32
    800053dc:	00000317          	auipc	t1,0x0
    800053e0:	3c030067          	jr	960(t1) # 8000579c <plic_complete>
    800053e4:	00005517          	auipc	a0,0x5
    800053e8:	05c50513          	addi	a0,a0,92 # 8000a440 <tickslock>
    800053ec:	00001097          	auipc	ra,0x1
    800053f0:	490080e7          	jalr	1168(ra) # 8000687c <acquire>
    800053f4:	00004717          	auipc	a4,0x4
    800053f8:	ea070713          	addi	a4,a4,-352 # 80009294 <ticks>
    800053fc:	00072783          	lw	a5,0(a4)
    80005400:	00005517          	auipc	a0,0x5
    80005404:	04050513          	addi	a0,a0,64 # 8000a440 <tickslock>
    80005408:	0017879b          	addiw	a5,a5,1
    8000540c:	00f72023          	sw	a5,0(a4)
    80005410:	00001097          	auipc	ra,0x1
    80005414:	538080e7          	jalr	1336(ra) # 80006948 <release>
    80005418:	f65ff06f          	j	8000537c <kerneltrap+0x8c>
    8000541c:	00001097          	auipc	ra,0x1
    80005420:	094080e7          	jalr	148(ra) # 800064b0 <uartintr>
    80005424:	fa5ff06f          	j	800053c8 <kerneltrap+0xd8>
    80005428:	00002517          	auipc	a0,0x2
    8000542c:	e6850513          	addi	a0,a0,-408 # 80007290 <_ZN3stm4coutE+0x210>
    80005430:	00000097          	auipc	ra,0x0
    80005434:	71c080e7          	jalr	1820(ra) # 80005b4c <panic>

0000000080005438 <clockintr>:
    80005438:	fe010113          	addi	sp,sp,-32
    8000543c:	00813823          	sd	s0,16(sp)
    80005440:	00913423          	sd	s1,8(sp)
    80005444:	00113c23          	sd	ra,24(sp)
    80005448:	02010413          	addi	s0,sp,32
    8000544c:	00005497          	auipc	s1,0x5
    80005450:	ff448493          	addi	s1,s1,-12 # 8000a440 <tickslock>
    80005454:	00048513          	mv	a0,s1
    80005458:	00001097          	auipc	ra,0x1
    8000545c:	424080e7          	jalr	1060(ra) # 8000687c <acquire>
    80005460:	00004717          	auipc	a4,0x4
    80005464:	e3470713          	addi	a4,a4,-460 # 80009294 <ticks>
    80005468:	00072783          	lw	a5,0(a4)
    8000546c:	01013403          	ld	s0,16(sp)
    80005470:	01813083          	ld	ra,24(sp)
    80005474:	00048513          	mv	a0,s1
    80005478:	0017879b          	addiw	a5,a5,1
    8000547c:	00813483          	ld	s1,8(sp)
    80005480:	00f72023          	sw	a5,0(a4)
    80005484:	02010113          	addi	sp,sp,32
    80005488:	00001317          	auipc	t1,0x1
    8000548c:	4c030067          	jr	1216(t1) # 80006948 <release>

0000000080005490 <devintr>:
    80005490:	142027f3          	csrr	a5,scause
    80005494:	00000513          	li	a0,0
    80005498:	0007c463          	bltz	a5,800054a0 <devintr+0x10>
    8000549c:	00008067          	ret
    800054a0:	fe010113          	addi	sp,sp,-32
    800054a4:	00813823          	sd	s0,16(sp)
    800054a8:	00113c23          	sd	ra,24(sp)
    800054ac:	00913423          	sd	s1,8(sp)
    800054b0:	02010413          	addi	s0,sp,32
    800054b4:	0ff7f713          	andi	a4,a5,255
    800054b8:	00900693          	li	a3,9
    800054bc:	04d70c63          	beq	a4,a3,80005514 <devintr+0x84>
    800054c0:	fff00713          	li	a4,-1
    800054c4:	03f71713          	slli	a4,a4,0x3f
    800054c8:	00170713          	addi	a4,a4,1
    800054cc:	00e78c63          	beq	a5,a4,800054e4 <devintr+0x54>
    800054d0:	01813083          	ld	ra,24(sp)
    800054d4:	01013403          	ld	s0,16(sp)
    800054d8:	00813483          	ld	s1,8(sp)
    800054dc:	02010113          	addi	sp,sp,32
    800054e0:	00008067          	ret
    800054e4:	00000097          	auipc	ra,0x0
    800054e8:	c8c080e7          	jalr	-884(ra) # 80005170 <cpuid>
    800054ec:	06050663          	beqz	a0,80005558 <devintr+0xc8>
    800054f0:	144027f3          	csrr	a5,sip
    800054f4:	ffd7f793          	andi	a5,a5,-3
    800054f8:	14479073          	csrw	sip,a5
    800054fc:	01813083          	ld	ra,24(sp)
    80005500:	01013403          	ld	s0,16(sp)
    80005504:	00813483          	ld	s1,8(sp)
    80005508:	00200513          	li	a0,2
    8000550c:	02010113          	addi	sp,sp,32
    80005510:	00008067          	ret
    80005514:	00000097          	auipc	ra,0x0
    80005518:	250080e7          	jalr	592(ra) # 80005764 <plic_claim>
    8000551c:	00a00793          	li	a5,10
    80005520:	00050493          	mv	s1,a0
    80005524:	06f50663          	beq	a0,a5,80005590 <devintr+0x100>
    80005528:	00100513          	li	a0,1
    8000552c:	fa0482e3          	beqz	s1,800054d0 <devintr+0x40>
    80005530:	00048593          	mv	a1,s1
    80005534:	00002517          	auipc	a0,0x2
    80005538:	d7c50513          	addi	a0,a0,-644 # 800072b0 <_ZN3stm4coutE+0x230>
    8000553c:	00000097          	auipc	ra,0x0
    80005540:	66c080e7          	jalr	1644(ra) # 80005ba8 <__printf>
    80005544:	00048513          	mv	a0,s1
    80005548:	00000097          	auipc	ra,0x0
    8000554c:	254080e7          	jalr	596(ra) # 8000579c <plic_complete>
    80005550:	00100513          	li	a0,1
    80005554:	f7dff06f          	j	800054d0 <devintr+0x40>
    80005558:	00005517          	auipc	a0,0x5
    8000555c:	ee850513          	addi	a0,a0,-280 # 8000a440 <tickslock>
    80005560:	00001097          	auipc	ra,0x1
    80005564:	31c080e7          	jalr	796(ra) # 8000687c <acquire>
    80005568:	00004717          	auipc	a4,0x4
    8000556c:	d2c70713          	addi	a4,a4,-724 # 80009294 <ticks>
    80005570:	00072783          	lw	a5,0(a4)
    80005574:	00005517          	auipc	a0,0x5
    80005578:	ecc50513          	addi	a0,a0,-308 # 8000a440 <tickslock>
    8000557c:	0017879b          	addiw	a5,a5,1
    80005580:	00f72023          	sw	a5,0(a4)
    80005584:	00001097          	auipc	ra,0x1
    80005588:	3c4080e7          	jalr	964(ra) # 80006948 <release>
    8000558c:	f65ff06f          	j	800054f0 <devintr+0x60>
    80005590:	00001097          	auipc	ra,0x1
    80005594:	f20080e7          	jalr	-224(ra) # 800064b0 <uartintr>
    80005598:	fadff06f          	j	80005544 <devintr+0xb4>
    8000559c:	0000                	unimp
	...

00000000800055a0 <kernelvec>:
    800055a0:	f0010113          	addi	sp,sp,-256
    800055a4:	00113023          	sd	ra,0(sp)
    800055a8:	00213423          	sd	sp,8(sp)
    800055ac:	00313823          	sd	gp,16(sp)
    800055b0:	00413c23          	sd	tp,24(sp)
    800055b4:	02513023          	sd	t0,32(sp)
    800055b8:	02613423          	sd	t1,40(sp)
    800055bc:	02713823          	sd	t2,48(sp)
    800055c0:	02813c23          	sd	s0,56(sp)
    800055c4:	04913023          	sd	s1,64(sp)
    800055c8:	04a13423          	sd	a0,72(sp)
    800055cc:	04b13823          	sd	a1,80(sp)
    800055d0:	04c13c23          	sd	a2,88(sp)
    800055d4:	06d13023          	sd	a3,96(sp)
    800055d8:	06e13423          	sd	a4,104(sp)
    800055dc:	06f13823          	sd	a5,112(sp)
    800055e0:	07013c23          	sd	a6,120(sp)
    800055e4:	09113023          	sd	a7,128(sp)
    800055e8:	09213423          	sd	s2,136(sp)
    800055ec:	09313823          	sd	s3,144(sp)
    800055f0:	09413c23          	sd	s4,152(sp)
    800055f4:	0b513023          	sd	s5,160(sp)
    800055f8:	0b613423          	sd	s6,168(sp)
    800055fc:	0b713823          	sd	s7,176(sp)
    80005600:	0b813c23          	sd	s8,184(sp)
    80005604:	0d913023          	sd	s9,192(sp)
    80005608:	0da13423          	sd	s10,200(sp)
    8000560c:	0db13823          	sd	s11,208(sp)
    80005610:	0dc13c23          	sd	t3,216(sp)
    80005614:	0fd13023          	sd	t4,224(sp)
    80005618:	0fe13423          	sd	t5,232(sp)
    8000561c:	0ff13823          	sd	t6,240(sp)
    80005620:	cd1ff0ef          	jal	ra,800052f0 <kerneltrap>
    80005624:	00013083          	ld	ra,0(sp)
    80005628:	00813103          	ld	sp,8(sp)
    8000562c:	01013183          	ld	gp,16(sp)
    80005630:	02013283          	ld	t0,32(sp)
    80005634:	02813303          	ld	t1,40(sp)
    80005638:	03013383          	ld	t2,48(sp)
    8000563c:	03813403          	ld	s0,56(sp)
    80005640:	04013483          	ld	s1,64(sp)
    80005644:	04813503          	ld	a0,72(sp)
    80005648:	05013583          	ld	a1,80(sp)
    8000564c:	05813603          	ld	a2,88(sp)
    80005650:	06013683          	ld	a3,96(sp)
    80005654:	06813703          	ld	a4,104(sp)
    80005658:	07013783          	ld	a5,112(sp)
    8000565c:	07813803          	ld	a6,120(sp)
    80005660:	08013883          	ld	a7,128(sp)
    80005664:	08813903          	ld	s2,136(sp)
    80005668:	09013983          	ld	s3,144(sp)
    8000566c:	09813a03          	ld	s4,152(sp)
    80005670:	0a013a83          	ld	s5,160(sp)
    80005674:	0a813b03          	ld	s6,168(sp)
    80005678:	0b013b83          	ld	s7,176(sp)
    8000567c:	0b813c03          	ld	s8,184(sp)
    80005680:	0c013c83          	ld	s9,192(sp)
    80005684:	0c813d03          	ld	s10,200(sp)
    80005688:	0d013d83          	ld	s11,208(sp)
    8000568c:	0d813e03          	ld	t3,216(sp)
    80005690:	0e013e83          	ld	t4,224(sp)
    80005694:	0e813f03          	ld	t5,232(sp)
    80005698:	0f013f83          	ld	t6,240(sp)
    8000569c:	10010113          	addi	sp,sp,256
    800056a0:	10200073          	sret
    800056a4:	00000013          	nop
    800056a8:	00000013          	nop
    800056ac:	00000013          	nop

00000000800056b0 <timervec>:
    800056b0:	34051573          	csrrw	a0,mscratch,a0
    800056b4:	00b53023          	sd	a1,0(a0)
    800056b8:	00c53423          	sd	a2,8(a0)
    800056bc:	00d53823          	sd	a3,16(a0)
    800056c0:	01853583          	ld	a1,24(a0)
    800056c4:	02053603          	ld	a2,32(a0)
    800056c8:	0005b683          	ld	a3,0(a1)
    800056cc:	00c686b3          	add	a3,a3,a2
    800056d0:	00d5b023          	sd	a3,0(a1)
    800056d4:	00200593          	li	a1,2
    800056d8:	14459073          	csrw	sip,a1
    800056dc:	01053683          	ld	a3,16(a0)
    800056e0:	00853603          	ld	a2,8(a0)
    800056e4:	00053583          	ld	a1,0(a0)
    800056e8:	34051573          	csrrw	a0,mscratch,a0
    800056ec:	30200073          	mret

00000000800056f0 <plicinit>:
    800056f0:	ff010113          	addi	sp,sp,-16
    800056f4:	00813423          	sd	s0,8(sp)
    800056f8:	01010413          	addi	s0,sp,16
    800056fc:	00813403          	ld	s0,8(sp)
    80005700:	0c0007b7          	lui	a5,0xc000
    80005704:	00100713          	li	a4,1
    80005708:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000570c:	00e7a223          	sw	a4,4(a5)
    80005710:	01010113          	addi	sp,sp,16
    80005714:	00008067          	ret

0000000080005718 <plicinithart>:
    80005718:	ff010113          	addi	sp,sp,-16
    8000571c:	00813023          	sd	s0,0(sp)
    80005720:	00113423          	sd	ra,8(sp)
    80005724:	01010413          	addi	s0,sp,16
    80005728:	00000097          	auipc	ra,0x0
    8000572c:	a48080e7          	jalr	-1464(ra) # 80005170 <cpuid>
    80005730:	0085171b          	slliw	a4,a0,0x8
    80005734:	0c0027b7          	lui	a5,0xc002
    80005738:	00e787b3          	add	a5,a5,a4
    8000573c:	40200713          	li	a4,1026
    80005740:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005744:	00813083          	ld	ra,8(sp)
    80005748:	00013403          	ld	s0,0(sp)
    8000574c:	00d5151b          	slliw	a0,a0,0xd
    80005750:	0c2017b7          	lui	a5,0xc201
    80005754:	00a78533          	add	a0,a5,a0
    80005758:	00052023          	sw	zero,0(a0)
    8000575c:	01010113          	addi	sp,sp,16
    80005760:	00008067          	ret

0000000080005764 <plic_claim>:
    80005764:	ff010113          	addi	sp,sp,-16
    80005768:	00813023          	sd	s0,0(sp)
    8000576c:	00113423          	sd	ra,8(sp)
    80005770:	01010413          	addi	s0,sp,16
    80005774:	00000097          	auipc	ra,0x0
    80005778:	9fc080e7          	jalr	-1540(ra) # 80005170 <cpuid>
    8000577c:	00813083          	ld	ra,8(sp)
    80005780:	00013403          	ld	s0,0(sp)
    80005784:	00d5151b          	slliw	a0,a0,0xd
    80005788:	0c2017b7          	lui	a5,0xc201
    8000578c:	00a78533          	add	a0,a5,a0
    80005790:	00452503          	lw	a0,4(a0)
    80005794:	01010113          	addi	sp,sp,16
    80005798:	00008067          	ret

000000008000579c <plic_complete>:
    8000579c:	fe010113          	addi	sp,sp,-32
    800057a0:	00813823          	sd	s0,16(sp)
    800057a4:	00913423          	sd	s1,8(sp)
    800057a8:	00113c23          	sd	ra,24(sp)
    800057ac:	02010413          	addi	s0,sp,32
    800057b0:	00050493          	mv	s1,a0
    800057b4:	00000097          	auipc	ra,0x0
    800057b8:	9bc080e7          	jalr	-1604(ra) # 80005170 <cpuid>
    800057bc:	01813083          	ld	ra,24(sp)
    800057c0:	01013403          	ld	s0,16(sp)
    800057c4:	00d5179b          	slliw	a5,a0,0xd
    800057c8:	0c201737          	lui	a4,0xc201
    800057cc:	00f707b3          	add	a5,a4,a5
    800057d0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800057d4:	00813483          	ld	s1,8(sp)
    800057d8:	02010113          	addi	sp,sp,32
    800057dc:	00008067          	ret

00000000800057e0 <consolewrite>:
    800057e0:	fb010113          	addi	sp,sp,-80
    800057e4:	04813023          	sd	s0,64(sp)
    800057e8:	04113423          	sd	ra,72(sp)
    800057ec:	02913c23          	sd	s1,56(sp)
    800057f0:	03213823          	sd	s2,48(sp)
    800057f4:	03313423          	sd	s3,40(sp)
    800057f8:	03413023          	sd	s4,32(sp)
    800057fc:	01513c23          	sd	s5,24(sp)
    80005800:	05010413          	addi	s0,sp,80
    80005804:	06c05c63          	blez	a2,8000587c <consolewrite+0x9c>
    80005808:	00060993          	mv	s3,a2
    8000580c:	00050a13          	mv	s4,a0
    80005810:	00058493          	mv	s1,a1
    80005814:	00000913          	li	s2,0
    80005818:	fff00a93          	li	s5,-1
    8000581c:	01c0006f          	j	80005838 <consolewrite+0x58>
    80005820:	fbf44503          	lbu	a0,-65(s0)
    80005824:	0019091b          	addiw	s2,s2,1
    80005828:	00148493          	addi	s1,s1,1
    8000582c:	00001097          	auipc	ra,0x1
    80005830:	a9c080e7          	jalr	-1380(ra) # 800062c8 <uartputc>
    80005834:	03298063          	beq	s3,s2,80005854 <consolewrite+0x74>
    80005838:	00048613          	mv	a2,s1
    8000583c:	00100693          	li	a3,1
    80005840:	000a0593          	mv	a1,s4
    80005844:	fbf40513          	addi	a0,s0,-65
    80005848:	00000097          	auipc	ra,0x0
    8000584c:	9e0080e7          	jalr	-1568(ra) # 80005228 <either_copyin>
    80005850:	fd5518e3          	bne	a0,s5,80005820 <consolewrite+0x40>
    80005854:	04813083          	ld	ra,72(sp)
    80005858:	04013403          	ld	s0,64(sp)
    8000585c:	03813483          	ld	s1,56(sp)
    80005860:	02813983          	ld	s3,40(sp)
    80005864:	02013a03          	ld	s4,32(sp)
    80005868:	01813a83          	ld	s5,24(sp)
    8000586c:	00090513          	mv	a0,s2
    80005870:	03013903          	ld	s2,48(sp)
    80005874:	05010113          	addi	sp,sp,80
    80005878:	00008067          	ret
    8000587c:	00000913          	li	s2,0
    80005880:	fd5ff06f          	j	80005854 <consolewrite+0x74>

0000000080005884 <consoleread>:
    80005884:	f9010113          	addi	sp,sp,-112
    80005888:	06813023          	sd	s0,96(sp)
    8000588c:	04913c23          	sd	s1,88(sp)
    80005890:	05213823          	sd	s2,80(sp)
    80005894:	05313423          	sd	s3,72(sp)
    80005898:	05413023          	sd	s4,64(sp)
    8000589c:	03513c23          	sd	s5,56(sp)
    800058a0:	03613823          	sd	s6,48(sp)
    800058a4:	03713423          	sd	s7,40(sp)
    800058a8:	03813023          	sd	s8,32(sp)
    800058ac:	06113423          	sd	ra,104(sp)
    800058b0:	01913c23          	sd	s9,24(sp)
    800058b4:	07010413          	addi	s0,sp,112
    800058b8:	00060b93          	mv	s7,a2
    800058bc:	00050913          	mv	s2,a0
    800058c0:	00058c13          	mv	s8,a1
    800058c4:	00060b1b          	sext.w	s6,a2
    800058c8:	00005497          	auipc	s1,0x5
    800058cc:	ba048493          	addi	s1,s1,-1120 # 8000a468 <cons>
    800058d0:	00400993          	li	s3,4
    800058d4:	fff00a13          	li	s4,-1
    800058d8:	00a00a93          	li	s5,10
    800058dc:	05705e63          	blez	s7,80005938 <consoleread+0xb4>
    800058e0:	09c4a703          	lw	a4,156(s1)
    800058e4:	0984a783          	lw	a5,152(s1)
    800058e8:	0007071b          	sext.w	a4,a4
    800058ec:	08e78463          	beq	a5,a4,80005974 <consoleread+0xf0>
    800058f0:	07f7f713          	andi	a4,a5,127
    800058f4:	00e48733          	add	a4,s1,a4
    800058f8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800058fc:	0017869b          	addiw	a3,a5,1
    80005900:	08d4ac23          	sw	a3,152(s1)
    80005904:	00070c9b          	sext.w	s9,a4
    80005908:	0b370663          	beq	a4,s3,800059b4 <consoleread+0x130>
    8000590c:	00100693          	li	a3,1
    80005910:	f9f40613          	addi	a2,s0,-97
    80005914:	000c0593          	mv	a1,s8
    80005918:	00090513          	mv	a0,s2
    8000591c:	f8e40fa3          	sb	a4,-97(s0)
    80005920:	00000097          	auipc	ra,0x0
    80005924:	8bc080e7          	jalr	-1860(ra) # 800051dc <either_copyout>
    80005928:	01450863          	beq	a0,s4,80005938 <consoleread+0xb4>
    8000592c:	001c0c13          	addi	s8,s8,1
    80005930:	fffb8b9b          	addiw	s7,s7,-1
    80005934:	fb5c94e3          	bne	s9,s5,800058dc <consoleread+0x58>
    80005938:	000b851b          	sext.w	a0,s7
    8000593c:	06813083          	ld	ra,104(sp)
    80005940:	06013403          	ld	s0,96(sp)
    80005944:	05813483          	ld	s1,88(sp)
    80005948:	05013903          	ld	s2,80(sp)
    8000594c:	04813983          	ld	s3,72(sp)
    80005950:	04013a03          	ld	s4,64(sp)
    80005954:	03813a83          	ld	s5,56(sp)
    80005958:	02813b83          	ld	s7,40(sp)
    8000595c:	02013c03          	ld	s8,32(sp)
    80005960:	01813c83          	ld	s9,24(sp)
    80005964:	40ab053b          	subw	a0,s6,a0
    80005968:	03013b03          	ld	s6,48(sp)
    8000596c:	07010113          	addi	sp,sp,112
    80005970:	00008067          	ret
    80005974:	00001097          	auipc	ra,0x1
    80005978:	1d8080e7          	jalr	472(ra) # 80006b4c <push_on>
    8000597c:	0984a703          	lw	a4,152(s1)
    80005980:	09c4a783          	lw	a5,156(s1)
    80005984:	0007879b          	sext.w	a5,a5
    80005988:	fef70ce3          	beq	a4,a5,80005980 <consoleread+0xfc>
    8000598c:	00001097          	auipc	ra,0x1
    80005990:	234080e7          	jalr	564(ra) # 80006bc0 <pop_on>
    80005994:	0984a783          	lw	a5,152(s1)
    80005998:	07f7f713          	andi	a4,a5,127
    8000599c:	00e48733          	add	a4,s1,a4
    800059a0:	01874703          	lbu	a4,24(a4)
    800059a4:	0017869b          	addiw	a3,a5,1
    800059a8:	08d4ac23          	sw	a3,152(s1)
    800059ac:	00070c9b          	sext.w	s9,a4
    800059b0:	f5371ee3          	bne	a4,s3,8000590c <consoleread+0x88>
    800059b4:	000b851b          	sext.w	a0,s7
    800059b8:	f96bf2e3          	bgeu	s7,s6,8000593c <consoleread+0xb8>
    800059bc:	08f4ac23          	sw	a5,152(s1)
    800059c0:	f7dff06f          	j	8000593c <consoleread+0xb8>

00000000800059c4 <consputc>:
    800059c4:	10000793          	li	a5,256
    800059c8:	00f50663          	beq	a0,a5,800059d4 <consputc+0x10>
    800059cc:	00001317          	auipc	t1,0x1
    800059d0:	9f430067          	jr	-1548(t1) # 800063c0 <uartputc_sync>
    800059d4:	ff010113          	addi	sp,sp,-16
    800059d8:	00113423          	sd	ra,8(sp)
    800059dc:	00813023          	sd	s0,0(sp)
    800059e0:	01010413          	addi	s0,sp,16
    800059e4:	00800513          	li	a0,8
    800059e8:	00001097          	auipc	ra,0x1
    800059ec:	9d8080e7          	jalr	-1576(ra) # 800063c0 <uartputc_sync>
    800059f0:	02000513          	li	a0,32
    800059f4:	00001097          	auipc	ra,0x1
    800059f8:	9cc080e7          	jalr	-1588(ra) # 800063c0 <uartputc_sync>
    800059fc:	00013403          	ld	s0,0(sp)
    80005a00:	00813083          	ld	ra,8(sp)
    80005a04:	00800513          	li	a0,8
    80005a08:	01010113          	addi	sp,sp,16
    80005a0c:	00001317          	auipc	t1,0x1
    80005a10:	9b430067          	jr	-1612(t1) # 800063c0 <uartputc_sync>

0000000080005a14 <consoleintr>:
    80005a14:	fe010113          	addi	sp,sp,-32
    80005a18:	00813823          	sd	s0,16(sp)
    80005a1c:	00913423          	sd	s1,8(sp)
    80005a20:	01213023          	sd	s2,0(sp)
    80005a24:	00113c23          	sd	ra,24(sp)
    80005a28:	02010413          	addi	s0,sp,32
    80005a2c:	00005917          	auipc	s2,0x5
    80005a30:	a3c90913          	addi	s2,s2,-1476 # 8000a468 <cons>
    80005a34:	00050493          	mv	s1,a0
    80005a38:	00090513          	mv	a0,s2
    80005a3c:	00001097          	auipc	ra,0x1
    80005a40:	e40080e7          	jalr	-448(ra) # 8000687c <acquire>
    80005a44:	02048c63          	beqz	s1,80005a7c <consoleintr+0x68>
    80005a48:	0a092783          	lw	a5,160(s2)
    80005a4c:	09892703          	lw	a4,152(s2)
    80005a50:	07f00693          	li	a3,127
    80005a54:	40e7873b          	subw	a4,a5,a4
    80005a58:	02e6e263          	bltu	a3,a4,80005a7c <consoleintr+0x68>
    80005a5c:	00d00713          	li	a4,13
    80005a60:	04e48063          	beq	s1,a4,80005aa0 <consoleintr+0x8c>
    80005a64:	07f7f713          	andi	a4,a5,127
    80005a68:	00e90733          	add	a4,s2,a4
    80005a6c:	0017879b          	addiw	a5,a5,1
    80005a70:	0af92023          	sw	a5,160(s2)
    80005a74:	00970c23          	sb	s1,24(a4)
    80005a78:	08f92e23          	sw	a5,156(s2)
    80005a7c:	01013403          	ld	s0,16(sp)
    80005a80:	01813083          	ld	ra,24(sp)
    80005a84:	00813483          	ld	s1,8(sp)
    80005a88:	00013903          	ld	s2,0(sp)
    80005a8c:	00005517          	auipc	a0,0x5
    80005a90:	9dc50513          	addi	a0,a0,-1572 # 8000a468 <cons>
    80005a94:	02010113          	addi	sp,sp,32
    80005a98:	00001317          	auipc	t1,0x1
    80005a9c:	eb030067          	jr	-336(t1) # 80006948 <release>
    80005aa0:	00a00493          	li	s1,10
    80005aa4:	fc1ff06f          	j	80005a64 <consoleintr+0x50>

0000000080005aa8 <consoleinit>:
    80005aa8:	fe010113          	addi	sp,sp,-32
    80005aac:	00113c23          	sd	ra,24(sp)
    80005ab0:	00813823          	sd	s0,16(sp)
    80005ab4:	00913423          	sd	s1,8(sp)
    80005ab8:	02010413          	addi	s0,sp,32
    80005abc:	00005497          	auipc	s1,0x5
    80005ac0:	9ac48493          	addi	s1,s1,-1620 # 8000a468 <cons>
    80005ac4:	00048513          	mv	a0,s1
    80005ac8:	00002597          	auipc	a1,0x2
    80005acc:	84058593          	addi	a1,a1,-1984 # 80007308 <_ZN3stm4coutE+0x288>
    80005ad0:	00001097          	auipc	ra,0x1
    80005ad4:	d88080e7          	jalr	-632(ra) # 80006858 <initlock>
    80005ad8:	00000097          	auipc	ra,0x0
    80005adc:	7ac080e7          	jalr	1964(ra) # 80006284 <uartinit>
    80005ae0:	01813083          	ld	ra,24(sp)
    80005ae4:	01013403          	ld	s0,16(sp)
    80005ae8:	00000797          	auipc	a5,0x0
    80005aec:	d9c78793          	addi	a5,a5,-612 # 80005884 <consoleread>
    80005af0:	0af4bc23          	sd	a5,184(s1)
    80005af4:	00000797          	auipc	a5,0x0
    80005af8:	cec78793          	addi	a5,a5,-788 # 800057e0 <consolewrite>
    80005afc:	0cf4b023          	sd	a5,192(s1)
    80005b00:	00813483          	ld	s1,8(sp)
    80005b04:	02010113          	addi	sp,sp,32
    80005b08:	00008067          	ret

0000000080005b0c <console_read>:
    80005b0c:	ff010113          	addi	sp,sp,-16
    80005b10:	00813423          	sd	s0,8(sp)
    80005b14:	01010413          	addi	s0,sp,16
    80005b18:	00813403          	ld	s0,8(sp)
    80005b1c:	00005317          	auipc	t1,0x5
    80005b20:	a0433303          	ld	t1,-1532(t1) # 8000a520 <devsw+0x10>
    80005b24:	01010113          	addi	sp,sp,16
    80005b28:	00030067          	jr	t1

0000000080005b2c <console_write>:
    80005b2c:	ff010113          	addi	sp,sp,-16
    80005b30:	00813423          	sd	s0,8(sp)
    80005b34:	01010413          	addi	s0,sp,16
    80005b38:	00813403          	ld	s0,8(sp)
    80005b3c:	00005317          	auipc	t1,0x5
    80005b40:	9ec33303          	ld	t1,-1556(t1) # 8000a528 <devsw+0x18>
    80005b44:	01010113          	addi	sp,sp,16
    80005b48:	00030067          	jr	t1

0000000080005b4c <panic>:
    80005b4c:	fe010113          	addi	sp,sp,-32
    80005b50:	00113c23          	sd	ra,24(sp)
    80005b54:	00813823          	sd	s0,16(sp)
    80005b58:	00913423          	sd	s1,8(sp)
    80005b5c:	02010413          	addi	s0,sp,32
    80005b60:	00050493          	mv	s1,a0
    80005b64:	00001517          	auipc	a0,0x1
    80005b68:	7ac50513          	addi	a0,a0,1964 # 80007310 <_ZN3stm4coutE+0x290>
    80005b6c:	00005797          	auipc	a5,0x5
    80005b70:	a407ae23          	sw	zero,-1444(a5) # 8000a5c8 <pr+0x18>
    80005b74:	00000097          	auipc	ra,0x0
    80005b78:	034080e7          	jalr	52(ra) # 80005ba8 <__printf>
    80005b7c:	00048513          	mv	a0,s1
    80005b80:	00000097          	auipc	ra,0x0
    80005b84:	028080e7          	jalr	40(ra) # 80005ba8 <__printf>
    80005b88:	00001517          	auipc	a0,0x1
    80005b8c:	76850513          	addi	a0,a0,1896 # 800072f0 <_ZN3stm4coutE+0x270>
    80005b90:	00000097          	auipc	ra,0x0
    80005b94:	018080e7          	jalr	24(ra) # 80005ba8 <__printf>
    80005b98:	00100793          	li	a5,1
    80005b9c:	00003717          	auipc	a4,0x3
    80005ba0:	6ef72e23          	sw	a5,1788(a4) # 80009298 <panicked>
    80005ba4:	0000006f          	j	80005ba4 <panic+0x58>

0000000080005ba8 <__printf>:
    80005ba8:	f3010113          	addi	sp,sp,-208
    80005bac:	08813023          	sd	s0,128(sp)
    80005bb0:	07313423          	sd	s3,104(sp)
    80005bb4:	09010413          	addi	s0,sp,144
    80005bb8:	05813023          	sd	s8,64(sp)
    80005bbc:	08113423          	sd	ra,136(sp)
    80005bc0:	06913c23          	sd	s1,120(sp)
    80005bc4:	07213823          	sd	s2,112(sp)
    80005bc8:	07413023          	sd	s4,96(sp)
    80005bcc:	05513c23          	sd	s5,88(sp)
    80005bd0:	05613823          	sd	s6,80(sp)
    80005bd4:	05713423          	sd	s7,72(sp)
    80005bd8:	03913c23          	sd	s9,56(sp)
    80005bdc:	03a13823          	sd	s10,48(sp)
    80005be0:	03b13423          	sd	s11,40(sp)
    80005be4:	00005317          	auipc	t1,0x5
    80005be8:	9cc30313          	addi	t1,t1,-1588 # 8000a5b0 <pr>
    80005bec:	01832c03          	lw	s8,24(t1)
    80005bf0:	00b43423          	sd	a1,8(s0)
    80005bf4:	00c43823          	sd	a2,16(s0)
    80005bf8:	00d43c23          	sd	a3,24(s0)
    80005bfc:	02e43023          	sd	a4,32(s0)
    80005c00:	02f43423          	sd	a5,40(s0)
    80005c04:	03043823          	sd	a6,48(s0)
    80005c08:	03143c23          	sd	a7,56(s0)
    80005c0c:	00050993          	mv	s3,a0
    80005c10:	4a0c1663          	bnez	s8,800060bc <__printf+0x514>
    80005c14:	60098c63          	beqz	s3,8000622c <__printf+0x684>
    80005c18:	0009c503          	lbu	a0,0(s3)
    80005c1c:	00840793          	addi	a5,s0,8
    80005c20:	f6f43c23          	sd	a5,-136(s0)
    80005c24:	00000493          	li	s1,0
    80005c28:	22050063          	beqz	a0,80005e48 <__printf+0x2a0>
    80005c2c:	00002a37          	lui	s4,0x2
    80005c30:	00018ab7          	lui	s5,0x18
    80005c34:	000f4b37          	lui	s6,0xf4
    80005c38:	00989bb7          	lui	s7,0x989
    80005c3c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005c40:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005c44:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005c48:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005c4c:	00148c9b          	addiw	s9,s1,1
    80005c50:	02500793          	li	a5,37
    80005c54:	01998933          	add	s2,s3,s9
    80005c58:	38f51263          	bne	a0,a5,80005fdc <__printf+0x434>
    80005c5c:	00094783          	lbu	a5,0(s2)
    80005c60:	00078c9b          	sext.w	s9,a5
    80005c64:	1e078263          	beqz	a5,80005e48 <__printf+0x2a0>
    80005c68:	0024849b          	addiw	s1,s1,2
    80005c6c:	07000713          	li	a4,112
    80005c70:	00998933          	add	s2,s3,s1
    80005c74:	38e78a63          	beq	a5,a4,80006008 <__printf+0x460>
    80005c78:	20f76863          	bltu	a4,a5,80005e88 <__printf+0x2e0>
    80005c7c:	42a78863          	beq	a5,a0,800060ac <__printf+0x504>
    80005c80:	06400713          	li	a4,100
    80005c84:	40e79663          	bne	a5,a4,80006090 <__printf+0x4e8>
    80005c88:	f7843783          	ld	a5,-136(s0)
    80005c8c:	0007a603          	lw	a2,0(a5)
    80005c90:	00878793          	addi	a5,a5,8
    80005c94:	f6f43c23          	sd	a5,-136(s0)
    80005c98:	42064a63          	bltz	a2,800060cc <__printf+0x524>
    80005c9c:	00a00713          	li	a4,10
    80005ca0:	02e677bb          	remuw	a5,a2,a4
    80005ca4:	00001d97          	auipc	s11,0x1
    80005ca8:	694d8d93          	addi	s11,s11,1684 # 80007338 <digits>
    80005cac:	00900593          	li	a1,9
    80005cb0:	0006051b          	sext.w	a0,a2
    80005cb4:	00000c93          	li	s9,0
    80005cb8:	02079793          	slli	a5,a5,0x20
    80005cbc:	0207d793          	srli	a5,a5,0x20
    80005cc0:	00fd87b3          	add	a5,s11,a5
    80005cc4:	0007c783          	lbu	a5,0(a5)
    80005cc8:	02e656bb          	divuw	a3,a2,a4
    80005ccc:	f8f40023          	sb	a5,-128(s0)
    80005cd0:	14c5d863          	bge	a1,a2,80005e20 <__printf+0x278>
    80005cd4:	06300593          	li	a1,99
    80005cd8:	00100c93          	li	s9,1
    80005cdc:	02e6f7bb          	remuw	a5,a3,a4
    80005ce0:	02079793          	slli	a5,a5,0x20
    80005ce4:	0207d793          	srli	a5,a5,0x20
    80005ce8:	00fd87b3          	add	a5,s11,a5
    80005cec:	0007c783          	lbu	a5,0(a5)
    80005cf0:	02e6d73b          	divuw	a4,a3,a4
    80005cf4:	f8f400a3          	sb	a5,-127(s0)
    80005cf8:	12a5f463          	bgeu	a1,a0,80005e20 <__printf+0x278>
    80005cfc:	00a00693          	li	a3,10
    80005d00:	00900593          	li	a1,9
    80005d04:	02d777bb          	remuw	a5,a4,a3
    80005d08:	02079793          	slli	a5,a5,0x20
    80005d0c:	0207d793          	srli	a5,a5,0x20
    80005d10:	00fd87b3          	add	a5,s11,a5
    80005d14:	0007c503          	lbu	a0,0(a5)
    80005d18:	02d757bb          	divuw	a5,a4,a3
    80005d1c:	f8a40123          	sb	a0,-126(s0)
    80005d20:	48e5f263          	bgeu	a1,a4,800061a4 <__printf+0x5fc>
    80005d24:	06300513          	li	a0,99
    80005d28:	02d7f5bb          	remuw	a1,a5,a3
    80005d2c:	02059593          	slli	a1,a1,0x20
    80005d30:	0205d593          	srli	a1,a1,0x20
    80005d34:	00bd85b3          	add	a1,s11,a1
    80005d38:	0005c583          	lbu	a1,0(a1)
    80005d3c:	02d7d7bb          	divuw	a5,a5,a3
    80005d40:	f8b401a3          	sb	a1,-125(s0)
    80005d44:	48e57263          	bgeu	a0,a4,800061c8 <__printf+0x620>
    80005d48:	3e700513          	li	a0,999
    80005d4c:	02d7f5bb          	remuw	a1,a5,a3
    80005d50:	02059593          	slli	a1,a1,0x20
    80005d54:	0205d593          	srli	a1,a1,0x20
    80005d58:	00bd85b3          	add	a1,s11,a1
    80005d5c:	0005c583          	lbu	a1,0(a1)
    80005d60:	02d7d7bb          	divuw	a5,a5,a3
    80005d64:	f8b40223          	sb	a1,-124(s0)
    80005d68:	46e57663          	bgeu	a0,a4,800061d4 <__printf+0x62c>
    80005d6c:	02d7f5bb          	remuw	a1,a5,a3
    80005d70:	02059593          	slli	a1,a1,0x20
    80005d74:	0205d593          	srli	a1,a1,0x20
    80005d78:	00bd85b3          	add	a1,s11,a1
    80005d7c:	0005c583          	lbu	a1,0(a1)
    80005d80:	02d7d7bb          	divuw	a5,a5,a3
    80005d84:	f8b402a3          	sb	a1,-123(s0)
    80005d88:	46ea7863          	bgeu	s4,a4,800061f8 <__printf+0x650>
    80005d8c:	02d7f5bb          	remuw	a1,a5,a3
    80005d90:	02059593          	slli	a1,a1,0x20
    80005d94:	0205d593          	srli	a1,a1,0x20
    80005d98:	00bd85b3          	add	a1,s11,a1
    80005d9c:	0005c583          	lbu	a1,0(a1)
    80005da0:	02d7d7bb          	divuw	a5,a5,a3
    80005da4:	f8b40323          	sb	a1,-122(s0)
    80005da8:	3eeaf863          	bgeu	s5,a4,80006198 <__printf+0x5f0>
    80005dac:	02d7f5bb          	remuw	a1,a5,a3
    80005db0:	02059593          	slli	a1,a1,0x20
    80005db4:	0205d593          	srli	a1,a1,0x20
    80005db8:	00bd85b3          	add	a1,s11,a1
    80005dbc:	0005c583          	lbu	a1,0(a1)
    80005dc0:	02d7d7bb          	divuw	a5,a5,a3
    80005dc4:	f8b403a3          	sb	a1,-121(s0)
    80005dc8:	42eb7e63          	bgeu	s6,a4,80006204 <__printf+0x65c>
    80005dcc:	02d7f5bb          	remuw	a1,a5,a3
    80005dd0:	02059593          	slli	a1,a1,0x20
    80005dd4:	0205d593          	srli	a1,a1,0x20
    80005dd8:	00bd85b3          	add	a1,s11,a1
    80005ddc:	0005c583          	lbu	a1,0(a1)
    80005de0:	02d7d7bb          	divuw	a5,a5,a3
    80005de4:	f8b40423          	sb	a1,-120(s0)
    80005de8:	42ebfc63          	bgeu	s7,a4,80006220 <__printf+0x678>
    80005dec:	02079793          	slli	a5,a5,0x20
    80005df0:	0207d793          	srli	a5,a5,0x20
    80005df4:	00fd8db3          	add	s11,s11,a5
    80005df8:	000dc703          	lbu	a4,0(s11)
    80005dfc:	00a00793          	li	a5,10
    80005e00:	00900c93          	li	s9,9
    80005e04:	f8e404a3          	sb	a4,-119(s0)
    80005e08:	00065c63          	bgez	a2,80005e20 <__printf+0x278>
    80005e0c:	f9040713          	addi	a4,s0,-112
    80005e10:	00f70733          	add	a4,a4,a5
    80005e14:	02d00693          	li	a3,45
    80005e18:	fed70823          	sb	a3,-16(a4)
    80005e1c:	00078c93          	mv	s9,a5
    80005e20:	f8040793          	addi	a5,s0,-128
    80005e24:	01978cb3          	add	s9,a5,s9
    80005e28:	f7f40d13          	addi	s10,s0,-129
    80005e2c:	000cc503          	lbu	a0,0(s9)
    80005e30:	fffc8c93          	addi	s9,s9,-1
    80005e34:	00000097          	auipc	ra,0x0
    80005e38:	b90080e7          	jalr	-1136(ra) # 800059c4 <consputc>
    80005e3c:	ffac98e3          	bne	s9,s10,80005e2c <__printf+0x284>
    80005e40:	00094503          	lbu	a0,0(s2)
    80005e44:	e00514e3          	bnez	a0,80005c4c <__printf+0xa4>
    80005e48:	1a0c1663          	bnez	s8,80005ff4 <__printf+0x44c>
    80005e4c:	08813083          	ld	ra,136(sp)
    80005e50:	08013403          	ld	s0,128(sp)
    80005e54:	07813483          	ld	s1,120(sp)
    80005e58:	07013903          	ld	s2,112(sp)
    80005e5c:	06813983          	ld	s3,104(sp)
    80005e60:	06013a03          	ld	s4,96(sp)
    80005e64:	05813a83          	ld	s5,88(sp)
    80005e68:	05013b03          	ld	s6,80(sp)
    80005e6c:	04813b83          	ld	s7,72(sp)
    80005e70:	04013c03          	ld	s8,64(sp)
    80005e74:	03813c83          	ld	s9,56(sp)
    80005e78:	03013d03          	ld	s10,48(sp)
    80005e7c:	02813d83          	ld	s11,40(sp)
    80005e80:	0d010113          	addi	sp,sp,208
    80005e84:	00008067          	ret
    80005e88:	07300713          	li	a4,115
    80005e8c:	1ce78a63          	beq	a5,a4,80006060 <__printf+0x4b8>
    80005e90:	07800713          	li	a4,120
    80005e94:	1ee79e63          	bne	a5,a4,80006090 <__printf+0x4e8>
    80005e98:	f7843783          	ld	a5,-136(s0)
    80005e9c:	0007a703          	lw	a4,0(a5)
    80005ea0:	00878793          	addi	a5,a5,8
    80005ea4:	f6f43c23          	sd	a5,-136(s0)
    80005ea8:	28074263          	bltz	a4,8000612c <__printf+0x584>
    80005eac:	00001d97          	auipc	s11,0x1
    80005eb0:	48cd8d93          	addi	s11,s11,1164 # 80007338 <digits>
    80005eb4:	00f77793          	andi	a5,a4,15
    80005eb8:	00fd87b3          	add	a5,s11,a5
    80005ebc:	0007c683          	lbu	a3,0(a5)
    80005ec0:	00f00613          	li	a2,15
    80005ec4:	0007079b          	sext.w	a5,a4
    80005ec8:	f8d40023          	sb	a3,-128(s0)
    80005ecc:	0047559b          	srliw	a1,a4,0x4
    80005ed0:	0047569b          	srliw	a3,a4,0x4
    80005ed4:	00000c93          	li	s9,0
    80005ed8:	0ee65063          	bge	a2,a4,80005fb8 <__printf+0x410>
    80005edc:	00f6f693          	andi	a3,a3,15
    80005ee0:	00dd86b3          	add	a3,s11,a3
    80005ee4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80005ee8:	0087d79b          	srliw	a5,a5,0x8
    80005eec:	00100c93          	li	s9,1
    80005ef0:	f8d400a3          	sb	a3,-127(s0)
    80005ef4:	0cb67263          	bgeu	a2,a1,80005fb8 <__printf+0x410>
    80005ef8:	00f7f693          	andi	a3,a5,15
    80005efc:	00dd86b3          	add	a3,s11,a3
    80005f00:	0006c583          	lbu	a1,0(a3)
    80005f04:	00f00613          	li	a2,15
    80005f08:	0047d69b          	srliw	a3,a5,0x4
    80005f0c:	f8b40123          	sb	a1,-126(s0)
    80005f10:	0047d593          	srli	a1,a5,0x4
    80005f14:	28f67e63          	bgeu	a2,a5,800061b0 <__printf+0x608>
    80005f18:	00f6f693          	andi	a3,a3,15
    80005f1c:	00dd86b3          	add	a3,s11,a3
    80005f20:	0006c503          	lbu	a0,0(a3)
    80005f24:	0087d813          	srli	a6,a5,0x8
    80005f28:	0087d69b          	srliw	a3,a5,0x8
    80005f2c:	f8a401a3          	sb	a0,-125(s0)
    80005f30:	28b67663          	bgeu	a2,a1,800061bc <__printf+0x614>
    80005f34:	00f6f693          	andi	a3,a3,15
    80005f38:	00dd86b3          	add	a3,s11,a3
    80005f3c:	0006c583          	lbu	a1,0(a3)
    80005f40:	00c7d513          	srli	a0,a5,0xc
    80005f44:	00c7d69b          	srliw	a3,a5,0xc
    80005f48:	f8b40223          	sb	a1,-124(s0)
    80005f4c:	29067a63          	bgeu	a2,a6,800061e0 <__printf+0x638>
    80005f50:	00f6f693          	andi	a3,a3,15
    80005f54:	00dd86b3          	add	a3,s11,a3
    80005f58:	0006c583          	lbu	a1,0(a3)
    80005f5c:	0107d813          	srli	a6,a5,0x10
    80005f60:	0107d69b          	srliw	a3,a5,0x10
    80005f64:	f8b402a3          	sb	a1,-123(s0)
    80005f68:	28a67263          	bgeu	a2,a0,800061ec <__printf+0x644>
    80005f6c:	00f6f693          	andi	a3,a3,15
    80005f70:	00dd86b3          	add	a3,s11,a3
    80005f74:	0006c683          	lbu	a3,0(a3)
    80005f78:	0147d79b          	srliw	a5,a5,0x14
    80005f7c:	f8d40323          	sb	a3,-122(s0)
    80005f80:	21067663          	bgeu	a2,a6,8000618c <__printf+0x5e4>
    80005f84:	02079793          	slli	a5,a5,0x20
    80005f88:	0207d793          	srli	a5,a5,0x20
    80005f8c:	00fd8db3          	add	s11,s11,a5
    80005f90:	000dc683          	lbu	a3,0(s11)
    80005f94:	00800793          	li	a5,8
    80005f98:	00700c93          	li	s9,7
    80005f9c:	f8d403a3          	sb	a3,-121(s0)
    80005fa0:	00075c63          	bgez	a4,80005fb8 <__printf+0x410>
    80005fa4:	f9040713          	addi	a4,s0,-112
    80005fa8:	00f70733          	add	a4,a4,a5
    80005fac:	02d00693          	li	a3,45
    80005fb0:	fed70823          	sb	a3,-16(a4)
    80005fb4:	00078c93          	mv	s9,a5
    80005fb8:	f8040793          	addi	a5,s0,-128
    80005fbc:	01978cb3          	add	s9,a5,s9
    80005fc0:	f7f40d13          	addi	s10,s0,-129
    80005fc4:	000cc503          	lbu	a0,0(s9)
    80005fc8:	fffc8c93          	addi	s9,s9,-1
    80005fcc:	00000097          	auipc	ra,0x0
    80005fd0:	9f8080e7          	jalr	-1544(ra) # 800059c4 <consputc>
    80005fd4:	ff9d18e3          	bne	s10,s9,80005fc4 <__printf+0x41c>
    80005fd8:	0100006f          	j	80005fe8 <__printf+0x440>
    80005fdc:	00000097          	auipc	ra,0x0
    80005fe0:	9e8080e7          	jalr	-1560(ra) # 800059c4 <consputc>
    80005fe4:	000c8493          	mv	s1,s9
    80005fe8:	00094503          	lbu	a0,0(s2)
    80005fec:	c60510e3          	bnez	a0,80005c4c <__printf+0xa4>
    80005ff0:	e40c0ee3          	beqz	s8,80005e4c <__printf+0x2a4>
    80005ff4:	00004517          	auipc	a0,0x4
    80005ff8:	5bc50513          	addi	a0,a0,1468 # 8000a5b0 <pr>
    80005ffc:	00001097          	auipc	ra,0x1
    80006000:	94c080e7          	jalr	-1716(ra) # 80006948 <release>
    80006004:	e49ff06f          	j	80005e4c <__printf+0x2a4>
    80006008:	f7843783          	ld	a5,-136(s0)
    8000600c:	03000513          	li	a0,48
    80006010:	01000d13          	li	s10,16
    80006014:	00878713          	addi	a4,a5,8
    80006018:	0007bc83          	ld	s9,0(a5)
    8000601c:	f6e43c23          	sd	a4,-136(s0)
    80006020:	00000097          	auipc	ra,0x0
    80006024:	9a4080e7          	jalr	-1628(ra) # 800059c4 <consputc>
    80006028:	07800513          	li	a0,120
    8000602c:	00000097          	auipc	ra,0x0
    80006030:	998080e7          	jalr	-1640(ra) # 800059c4 <consputc>
    80006034:	00001d97          	auipc	s11,0x1
    80006038:	304d8d93          	addi	s11,s11,772 # 80007338 <digits>
    8000603c:	03ccd793          	srli	a5,s9,0x3c
    80006040:	00fd87b3          	add	a5,s11,a5
    80006044:	0007c503          	lbu	a0,0(a5)
    80006048:	fffd0d1b          	addiw	s10,s10,-1
    8000604c:	004c9c93          	slli	s9,s9,0x4
    80006050:	00000097          	auipc	ra,0x0
    80006054:	974080e7          	jalr	-1676(ra) # 800059c4 <consputc>
    80006058:	fe0d12e3          	bnez	s10,8000603c <__printf+0x494>
    8000605c:	f8dff06f          	j	80005fe8 <__printf+0x440>
    80006060:	f7843783          	ld	a5,-136(s0)
    80006064:	0007bc83          	ld	s9,0(a5)
    80006068:	00878793          	addi	a5,a5,8
    8000606c:	f6f43c23          	sd	a5,-136(s0)
    80006070:	000c9a63          	bnez	s9,80006084 <__printf+0x4dc>
    80006074:	1080006f          	j	8000617c <__printf+0x5d4>
    80006078:	001c8c93          	addi	s9,s9,1
    8000607c:	00000097          	auipc	ra,0x0
    80006080:	948080e7          	jalr	-1720(ra) # 800059c4 <consputc>
    80006084:	000cc503          	lbu	a0,0(s9)
    80006088:	fe0518e3          	bnez	a0,80006078 <__printf+0x4d0>
    8000608c:	f5dff06f          	j	80005fe8 <__printf+0x440>
    80006090:	02500513          	li	a0,37
    80006094:	00000097          	auipc	ra,0x0
    80006098:	930080e7          	jalr	-1744(ra) # 800059c4 <consputc>
    8000609c:	000c8513          	mv	a0,s9
    800060a0:	00000097          	auipc	ra,0x0
    800060a4:	924080e7          	jalr	-1756(ra) # 800059c4 <consputc>
    800060a8:	f41ff06f          	j	80005fe8 <__printf+0x440>
    800060ac:	02500513          	li	a0,37
    800060b0:	00000097          	auipc	ra,0x0
    800060b4:	914080e7          	jalr	-1772(ra) # 800059c4 <consputc>
    800060b8:	f31ff06f          	j	80005fe8 <__printf+0x440>
    800060bc:	00030513          	mv	a0,t1
    800060c0:	00000097          	auipc	ra,0x0
    800060c4:	7bc080e7          	jalr	1980(ra) # 8000687c <acquire>
    800060c8:	b4dff06f          	j	80005c14 <__printf+0x6c>
    800060cc:	40c0053b          	negw	a0,a2
    800060d0:	00a00713          	li	a4,10
    800060d4:	02e576bb          	remuw	a3,a0,a4
    800060d8:	00001d97          	auipc	s11,0x1
    800060dc:	260d8d93          	addi	s11,s11,608 # 80007338 <digits>
    800060e0:	ff700593          	li	a1,-9
    800060e4:	02069693          	slli	a3,a3,0x20
    800060e8:	0206d693          	srli	a3,a3,0x20
    800060ec:	00dd86b3          	add	a3,s11,a3
    800060f0:	0006c683          	lbu	a3,0(a3)
    800060f4:	02e557bb          	divuw	a5,a0,a4
    800060f8:	f8d40023          	sb	a3,-128(s0)
    800060fc:	10b65e63          	bge	a2,a1,80006218 <__printf+0x670>
    80006100:	06300593          	li	a1,99
    80006104:	02e7f6bb          	remuw	a3,a5,a4
    80006108:	02069693          	slli	a3,a3,0x20
    8000610c:	0206d693          	srli	a3,a3,0x20
    80006110:	00dd86b3          	add	a3,s11,a3
    80006114:	0006c683          	lbu	a3,0(a3)
    80006118:	02e7d73b          	divuw	a4,a5,a4
    8000611c:	00200793          	li	a5,2
    80006120:	f8d400a3          	sb	a3,-127(s0)
    80006124:	bca5ece3          	bltu	a1,a0,80005cfc <__printf+0x154>
    80006128:	ce5ff06f          	j	80005e0c <__printf+0x264>
    8000612c:	40e007bb          	negw	a5,a4
    80006130:	00001d97          	auipc	s11,0x1
    80006134:	208d8d93          	addi	s11,s11,520 # 80007338 <digits>
    80006138:	00f7f693          	andi	a3,a5,15
    8000613c:	00dd86b3          	add	a3,s11,a3
    80006140:	0006c583          	lbu	a1,0(a3)
    80006144:	ff100613          	li	a2,-15
    80006148:	0047d69b          	srliw	a3,a5,0x4
    8000614c:	f8b40023          	sb	a1,-128(s0)
    80006150:	0047d59b          	srliw	a1,a5,0x4
    80006154:	0ac75e63          	bge	a4,a2,80006210 <__printf+0x668>
    80006158:	00f6f693          	andi	a3,a3,15
    8000615c:	00dd86b3          	add	a3,s11,a3
    80006160:	0006c603          	lbu	a2,0(a3)
    80006164:	00f00693          	li	a3,15
    80006168:	0087d79b          	srliw	a5,a5,0x8
    8000616c:	f8c400a3          	sb	a2,-127(s0)
    80006170:	d8b6e4e3          	bltu	a3,a1,80005ef8 <__printf+0x350>
    80006174:	00200793          	li	a5,2
    80006178:	e2dff06f          	j	80005fa4 <__printf+0x3fc>
    8000617c:	00001c97          	auipc	s9,0x1
    80006180:	19cc8c93          	addi	s9,s9,412 # 80007318 <_ZN3stm4coutE+0x298>
    80006184:	02800513          	li	a0,40
    80006188:	ef1ff06f          	j	80006078 <__printf+0x4d0>
    8000618c:	00700793          	li	a5,7
    80006190:	00600c93          	li	s9,6
    80006194:	e0dff06f          	j	80005fa0 <__printf+0x3f8>
    80006198:	00700793          	li	a5,7
    8000619c:	00600c93          	li	s9,6
    800061a0:	c69ff06f          	j	80005e08 <__printf+0x260>
    800061a4:	00300793          	li	a5,3
    800061a8:	00200c93          	li	s9,2
    800061ac:	c5dff06f          	j	80005e08 <__printf+0x260>
    800061b0:	00300793          	li	a5,3
    800061b4:	00200c93          	li	s9,2
    800061b8:	de9ff06f          	j	80005fa0 <__printf+0x3f8>
    800061bc:	00400793          	li	a5,4
    800061c0:	00300c93          	li	s9,3
    800061c4:	dddff06f          	j	80005fa0 <__printf+0x3f8>
    800061c8:	00400793          	li	a5,4
    800061cc:	00300c93          	li	s9,3
    800061d0:	c39ff06f          	j	80005e08 <__printf+0x260>
    800061d4:	00500793          	li	a5,5
    800061d8:	00400c93          	li	s9,4
    800061dc:	c2dff06f          	j	80005e08 <__printf+0x260>
    800061e0:	00500793          	li	a5,5
    800061e4:	00400c93          	li	s9,4
    800061e8:	db9ff06f          	j	80005fa0 <__printf+0x3f8>
    800061ec:	00600793          	li	a5,6
    800061f0:	00500c93          	li	s9,5
    800061f4:	dadff06f          	j	80005fa0 <__printf+0x3f8>
    800061f8:	00600793          	li	a5,6
    800061fc:	00500c93          	li	s9,5
    80006200:	c09ff06f          	j	80005e08 <__printf+0x260>
    80006204:	00800793          	li	a5,8
    80006208:	00700c93          	li	s9,7
    8000620c:	bfdff06f          	j	80005e08 <__printf+0x260>
    80006210:	00100793          	li	a5,1
    80006214:	d91ff06f          	j	80005fa4 <__printf+0x3fc>
    80006218:	00100793          	li	a5,1
    8000621c:	bf1ff06f          	j	80005e0c <__printf+0x264>
    80006220:	00900793          	li	a5,9
    80006224:	00800c93          	li	s9,8
    80006228:	be1ff06f          	j	80005e08 <__printf+0x260>
    8000622c:	00001517          	auipc	a0,0x1
    80006230:	0f450513          	addi	a0,a0,244 # 80007320 <_ZN3stm4coutE+0x2a0>
    80006234:	00000097          	auipc	ra,0x0
    80006238:	918080e7          	jalr	-1768(ra) # 80005b4c <panic>

000000008000623c <printfinit>:
    8000623c:	fe010113          	addi	sp,sp,-32
    80006240:	00813823          	sd	s0,16(sp)
    80006244:	00913423          	sd	s1,8(sp)
    80006248:	00113c23          	sd	ra,24(sp)
    8000624c:	02010413          	addi	s0,sp,32
    80006250:	00004497          	auipc	s1,0x4
    80006254:	36048493          	addi	s1,s1,864 # 8000a5b0 <pr>
    80006258:	00048513          	mv	a0,s1
    8000625c:	00001597          	auipc	a1,0x1
    80006260:	0d458593          	addi	a1,a1,212 # 80007330 <_ZN3stm4coutE+0x2b0>
    80006264:	00000097          	auipc	ra,0x0
    80006268:	5f4080e7          	jalr	1524(ra) # 80006858 <initlock>
    8000626c:	01813083          	ld	ra,24(sp)
    80006270:	01013403          	ld	s0,16(sp)
    80006274:	0004ac23          	sw	zero,24(s1)
    80006278:	00813483          	ld	s1,8(sp)
    8000627c:	02010113          	addi	sp,sp,32
    80006280:	00008067          	ret

0000000080006284 <uartinit>:
    80006284:	ff010113          	addi	sp,sp,-16
    80006288:	00813423          	sd	s0,8(sp)
    8000628c:	01010413          	addi	s0,sp,16
    80006290:	100007b7          	lui	a5,0x10000
    80006294:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006298:	f8000713          	li	a4,-128
    8000629c:	00e781a3          	sb	a4,3(a5)
    800062a0:	00300713          	li	a4,3
    800062a4:	00e78023          	sb	a4,0(a5)
    800062a8:	000780a3          	sb	zero,1(a5)
    800062ac:	00e781a3          	sb	a4,3(a5)
    800062b0:	00700693          	li	a3,7
    800062b4:	00d78123          	sb	a3,2(a5)
    800062b8:	00e780a3          	sb	a4,1(a5)
    800062bc:	00813403          	ld	s0,8(sp)
    800062c0:	01010113          	addi	sp,sp,16
    800062c4:	00008067          	ret

00000000800062c8 <uartputc>:
    800062c8:	00003797          	auipc	a5,0x3
    800062cc:	fd07a783          	lw	a5,-48(a5) # 80009298 <panicked>
    800062d0:	00078463          	beqz	a5,800062d8 <uartputc+0x10>
    800062d4:	0000006f          	j	800062d4 <uartputc+0xc>
    800062d8:	fd010113          	addi	sp,sp,-48
    800062dc:	02813023          	sd	s0,32(sp)
    800062e0:	00913c23          	sd	s1,24(sp)
    800062e4:	01213823          	sd	s2,16(sp)
    800062e8:	01313423          	sd	s3,8(sp)
    800062ec:	02113423          	sd	ra,40(sp)
    800062f0:	03010413          	addi	s0,sp,48
    800062f4:	00003917          	auipc	s2,0x3
    800062f8:	fac90913          	addi	s2,s2,-84 # 800092a0 <uart_tx_r>
    800062fc:	00093783          	ld	a5,0(s2)
    80006300:	00003497          	auipc	s1,0x3
    80006304:	fa848493          	addi	s1,s1,-88 # 800092a8 <uart_tx_w>
    80006308:	0004b703          	ld	a4,0(s1)
    8000630c:	02078693          	addi	a3,a5,32
    80006310:	00050993          	mv	s3,a0
    80006314:	02e69c63          	bne	a3,a4,8000634c <uartputc+0x84>
    80006318:	00001097          	auipc	ra,0x1
    8000631c:	834080e7          	jalr	-1996(ra) # 80006b4c <push_on>
    80006320:	00093783          	ld	a5,0(s2)
    80006324:	0004b703          	ld	a4,0(s1)
    80006328:	02078793          	addi	a5,a5,32
    8000632c:	00e79463          	bne	a5,a4,80006334 <uartputc+0x6c>
    80006330:	0000006f          	j	80006330 <uartputc+0x68>
    80006334:	00001097          	auipc	ra,0x1
    80006338:	88c080e7          	jalr	-1908(ra) # 80006bc0 <pop_on>
    8000633c:	00093783          	ld	a5,0(s2)
    80006340:	0004b703          	ld	a4,0(s1)
    80006344:	02078693          	addi	a3,a5,32
    80006348:	fce688e3          	beq	a3,a4,80006318 <uartputc+0x50>
    8000634c:	01f77693          	andi	a3,a4,31
    80006350:	00004597          	auipc	a1,0x4
    80006354:	28058593          	addi	a1,a1,640 # 8000a5d0 <uart_tx_buf>
    80006358:	00d586b3          	add	a3,a1,a3
    8000635c:	00170713          	addi	a4,a4,1
    80006360:	01368023          	sb	s3,0(a3)
    80006364:	00e4b023          	sd	a4,0(s1)
    80006368:	10000637          	lui	a2,0x10000
    8000636c:	02f71063          	bne	a4,a5,8000638c <uartputc+0xc4>
    80006370:	0340006f          	j	800063a4 <uartputc+0xdc>
    80006374:	00074703          	lbu	a4,0(a4)
    80006378:	00f93023          	sd	a5,0(s2)
    8000637c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006380:	00093783          	ld	a5,0(s2)
    80006384:	0004b703          	ld	a4,0(s1)
    80006388:	00f70e63          	beq	a4,a5,800063a4 <uartputc+0xdc>
    8000638c:	00564683          	lbu	a3,5(a2)
    80006390:	01f7f713          	andi	a4,a5,31
    80006394:	00e58733          	add	a4,a1,a4
    80006398:	0206f693          	andi	a3,a3,32
    8000639c:	00178793          	addi	a5,a5,1
    800063a0:	fc069ae3          	bnez	a3,80006374 <uartputc+0xac>
    800063a4:	02813083          	ld	ra,40(sp)
    800063a8:	02013403          	ld	s0,32(sp)
    800063ac:	01813483          	ld	s1,24(sp)
    800063b0:	01013903          	ld	s2,16(sp)
    800063b4:	00813983          	ld	s3,8(sp)
    800063b8:	03010113          	addi	sp,sp,48
    800063bc:	00008067          	ret

00000000800063c0 <uartputc_sync>:
    800063c0:	ff010113          	addi	sp,sp,-16
    800063c4:	00813423          	sd	s0,8(sp)
    800063c8:	01010413          	addi	s0,sp,16
    800063cc:	00003717          	auipc	a4,0x3
    800063d0:	ecc72703          	lw	a4,-308(a4) # 80009298 <panicked>
    800063d4:	02071663          	bnez	a4,80006400 <uartputc_sync+0x40>
    800063d8:	00050793          	mv	a5,a0
    800063dc:	100006b7          	lui	a3,0x10000
    800063e0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800063e4:	02077713          	andi	a4,a4,32
    800063e8:	fe070ce3          	beqz	a4,800063e0 <uartputc_sync+0x20>
    800063ec:	0ff7f793          	andi	a5,a5,255
    800063f0:	00f68023          	sb	a5,0(a3)
    800063f4:	00813403          	ld	s0,8(sp)
    800063f8:	01010113          	addi	sp,sp,16
    800063fc:	00008067          	ret
    80006400:	0000006f          	j	80006400 <uartputc_sync+0x40>

0000000080006404 <uartstart>:
    80006404:	ff010113          	addi	sp,sp,-16
    80006408:	00813423          	sd	s0,8(sp)
    8000640c:	01010413          	addi	s0,sp,16
    80006410:	00003617          	auipc	a2,0x3
    80006414:	e9060613          	addi	a2,a2,-368 # 800092a0 <uart_tx_r>
    80006418:	00003517          	auipc	a0,0x3
    8000641c:	e9050513          	addi	a0,a0,-368 # 800092a8 <uart_tx_w>
    80006420:	00063783          	ld	a5,0(a2)
    80006424:	00053703          	ld	a4,0(a0)
    80006428:	04f70263          	beq	a4,a5,8000646c <uartstart+0x68>
    8000642c:	100005b7          	lui	a1,0x10000
    80006430:	00004817          	auipc	a6,0x4
    80006434:	1a080813          	addi	a6,a6,416 # 8000a5d0 <uart_tx_buf>
    80006438:	01c0006f          	j	80006454 <uartstart+0x50>
    8000643c:	0006c703          	lbu	a4,0(a3)
    80006440:	00f63023          	sd	a5,0(a2)
    80006444:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006448:	00063783          	ld	a5,0(a2)
    8000644c:	00053703          	ld	a4,0(a0)
    80006450:	00f70e63          	beq	a4,a5,8000646c <uartstart+0x68>
    80006454:	01f7f713          	andi	a4,a5,31
    80006458:	00e806b3          	add	a3,a6,a4
    8000645c:	0055c703          	lbu	a4,5(a1)
    80006460:	00178793          	addi	a5,a5,1
    80006464:	02077713          	andi	a4,a4,32
    80006468:	fc071ae3          	bnez	a4,8000643c <uartstart+0x38>
    8000646c:	00813403          	ld	s0,8(sp)
    80006470:	01010113          	addi	sp,sp,16
    80006474:	00008067          	ret

0000000080006478 <uartgetc>:
    80006478:	ff010113          	addi	sp,sp,-16
    8000647c:	00813423          	sd	s0,8(sp)
    80006480:	01010413          	addi	s0,sp,16
    80006484:	10000737          	lui	a4,0x10000
    80006488:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000648c:	0017f793          	andi	a5,a5,1
    80006490:	00078c63          	beqz	a5,800064a8 <uartgetc+0x30>
    80006494:	00074503          	lbu	a0,0(a4)
    80006498:	0ff57513          	andi	a0,a0,255
    8000649c:	00813403          	ld	s0,8(sp)
    800064a0:	01010113          	addi	sp,sp,16
    800064a4:	00008067          	ret
    800064a8:	fff00513          	li	a0,-1
    800064ac:	ff1ff06f          	j	8000649c <uartgetc+0x24>

00000000800064b0 <uartintr>:
    800064b0:	100007b7          	lui	a5,0x10000
    800064b4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800064b8:	0017f793          	andi	a5,a5,1
    800064bc:	0a078463          	beqz	a5,80006564 <uartintr+0xb4>
    800064c0:	fe010113          	addi	sp,sp,-32
    800064c4:	00813823          	sd	s0,16(sp)
    800064c8:	00913423          	sd	s1,8(sp)
    800064cc:	00113c23          	sd	ra,24(sp)
    800064d0:	02010413          	addi	s0,sp,32
    800064d4:	100004b7          	lui	s1,0x10000
    800064d8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800064dc:	0ff57513          	andi	a0,a0,255
    800064e0:	fffff097          	auipc	ra,0xfffff
    800064e4:	534080e7          	jalr	1332(ra) # 80005a14 <consoleintr>
    800064e8:	0054c783          	lbu	a5,5(s1)
    800064ec:	0017f793          	andi	a5,a5,1
    800064f0:	fe0794e3          	bnez	a5,800064d8 <uartintr+0x28>
    800064f4:	00003617          	auipc	a2,0x3
    800064f8:	dac60613          	addi	a2,a2,-596 # 800092a0 <uart_tx_r>
    800064fc:	00003517          	auipc	a0,0x3
    80006500:	dac50513          	addi	a0,a0,-596 # 800092a8 <uart_tx_w>
    80006504:	00063783          	ld	a5,0(a2)
    80006508:	00053703          	ld	a4,0(a0)
    8000650c:	04f70263          	beq	a4,a5,80006550 <uartintr+0xa0>
    80006510:	100005b7          	lui	a1,0x10000
    80006514:	00004817          	auipc	a6,0x4
    80006518:	0bc80813          	addi	a6,a6,188 # 8000a5d0 <uart_tx_buf>
    8000651c:	01c0006f          	j	80006538 <uartintr+0x88>
    80006520:	0006c703          	lbu	a4,0(a3)
    80006524:	00f63023          	sd	a5,0(a2)
    80006528:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000652c:	00063783          	ld	a5,0(a2)
    80006530:	00053703          	ld	a4,0(a0)
    80006534:	00f70e63          	beq	a4,a5,80006550 <uartintr+0xa0>
    80006538:	01f7f713          	andi	a4,a5,31
    8000653c:	00e806b3          	add	a3,a6,a4
    80006540:	0055c703          	lbu	a4,5(a1)
    80006544:	00178793          	addi	a5,a5,1
    80006548:	02077713          	andi	a4,a4,32
    8000654c:	fc071ae3          	bnez	a4,80006520 <uartintr+0x70>
    80006550:	01813083          	ld	ra,24(sp)
    80006554:	01013403          	ld	s0,16(sp)
    80006558:	00813483          	ld	s1,8(sp)
    8000655c:	02010113          	addi	sp,sp,32
    80006560:	00008067          	ret
    80006564:	00003617          	auipc	a2,0x3
    80006568:	d3c60613          	addi	a2,a2,-708 # 800092a0 <uart_tx_r>
    8000656c:	00003517          	auipc	a0,0x3
    80006570:	d3c50513          	addi	a0,a0,-708 # 800092a8 <uart_tx_w>
    80006574:	00063783          	ld	a5,0(a2)
    80006578:	00053703          	ld	a4,0(a0)
    8000657c:	04f70263          	beq	a4,a5,800065c0 <uartintr+0x110>
    80006580:	100005b7          	lui	a1,0x10000
    80006584:	00004817          	auipc	a6,0x4
    80006588:	04c80813          	addi	a6,a6,76 # 8000a5d0 <uart_tx_buf>
    8000658c:	01c0006f          	j	800065a8 <uartintr+0xf8>
    80006590:	0006c703          	lbu	a4,0(a3)
    80006594:	00f63023          	sd	a5,0(a2)
    80006598:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000659c:	00063783          	ld	a5,0(a2)
    800065a0:	00053703          	ld	a4,0(a0)
    800065a4:	02f70063          	beq	a4,a5,800065c4 <uartintr+0x114>
    800065a8:	01f7f713          	andi	a4,a5,31
    800065ac:	00e806b3          	add	a3,a6,a4
    800065b0:	0055c703          	lbu	a4,5(a1)
    800065b4:	00178793          	addi	a5,a5,1
    800065b8:	02077713          	andi	a4,a4,32
    800065bc:	fc071ae3          	bnez	a4,80006590 <uartintr+0xe0>
    800065c0:	00008067          	ret
    800065c4:	00008067          	ret

00000000800065c8 <kinit>:
    800065c8:	fc010113          	addi	sp,sp,-64
    800065cc:	02913423          	sd	s1,40(sp)
    800065d0:	fffff7b7          	lui	a5,0xfffff
    800065d4:	00005497          	auipc	s1,0x5
    800065d8:	01b48493          	addi	s1,s1,27 # 8000b5ef <end+0xfff>
    800065dc:	02813823          	sd	s0,48(sp)
    800065e0:	01313c23          	sd	s3,24(sp)
    800065e4:	00f4f4b3          	and	s1,s1,a5
    800065e8:	02113c23          	sd	ra,56(sp)
    800065ec:	03213023          	sd	s2,32(sp)
    800065f0:	01413823          	sd	s4,16(sp)
    800065f4:	01513423          	sd	s5,8(sp)
    800065f8:	04010413          	addi	s0,sp,64
    800065fc:	000017b7          	lui	a5,0x1
    80006600:	01100993          	li	s3,17
    80006604:	00f487b3          	add	a5,s1,a5
    80006608:	01b99993          	slli	s3,s3,0x1b
    8000660c:	06f9e063          	bltu	s3,a5,8000666c <kinit+0xa4>
    80006610:	00004a97          	auipc	s5,0x4
    80006614:	fe0a8a93          	addi	s5,s5,-32 # 8000a5f0 <end>
    80006618:	0754ec63          	bltu	s1,s5,80006690 <kinit+0xc8>
    8000661c:	0734fa63          	bgeu	s1,s3,80006690 <kinit+0xc8>
    80006620:	00088a37          	lui	s4,0x88
    80006624:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006628:	00003917          	auipc	s2,0x3
    8000662c:	c8890913          	addi	s2,s2,-888 # 800092b0 <kmem>
    80006630:	00ca1a13          	slli	s4,s4,0xc
    80006634:	0140006f          	j	80006648 <kinit+0x80>
    80006638:	000017b7          	lui	a5,0x1
    8000663c:	00f484b3          	add	s1,s1,a5
    80006640:	0554e863          	bltu	s1,s5,80006690 <kinit+0xc8>
    80006644:	0534f663          	bgeu	s1,s3,80006690 <kinit+0xc8>
    80006648:	00001637          	lui	a2,0x1
    8000664c:	00100593          	li	a1,1
    80006650:	00048513          	mv	a0,s1
    80006654:	00000097          	auipc	ra,0x0
    80006658:	5e4080e7          	jalr	1508(ra) # 80006c38 <__memset>
    8000665c:	00093783          	ld	a5,0(s2)
    80006660:	00f4b023          	sd	a5,0(s1)
    80006664:	00993023          	sd	s1,0(s2)
    80006668:	fd4498e3          	bne	s1,s4,80006638 <kinit+0x70>
    8000666c:	03813083          	ld	ra,56(sp)
    80006670:	03013403          	ld	s0,48(sp)
    80006674:	02813483          	ld	s1,40(sp)
    80006678:	02013903          	ld	s2,32(sp)
    8000667c:	01813983          	ld	s3,24(sp)
    80006680:	01013a03          	ld	s4,16(sp)
    80006684:	00813a83          	ld	s5,8(sp)
    80006688:	04010113          	addi	sp,sp,64
    8000668c:	00008067          	ret
    80006690:	00001517          	auipc	a0,0x1
    80006694:	cc050513          	addi	a0,a0,-832 # 80007350 <digits+0x18>
    80006698:	fffff097          	auipc	ra,0xfffff
    8000669c:	4b4080e7          	jalr	1204(ra) # 80005b4c <panic>

00000000800066a0 <freerange>:
    800066a0:	fc010113          	addi	sp,sp,-64
    800066a4:	000017b7          	lui	a5,0x1
    800066a8:	02913423          	sd	s1,40(sp)
    800066ac:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800066b0:	009504b3          	add	s1,a0,s1
    800066b4:	fffff537          	lui	a0,0xfffff
    800066b8:	02813823          	sd	s0,48(sp)
    800066bc:	02113c23          	sd	ra,56(sp)
    800066c0:	03213023          	sd	s2,32(sp)
    800066c4:	01313c23          	sd	s3,24(sp)
    800066c8:	01413823          	sd	s4,16(sp)
    800066cc:	01513423          	sd	s5,8(sp)
    800066d0:	01613023          	sd	s6,0(sp)
    800066d4:	04010413          	addi	s0,sp,64
    800066d8:	00a4f4b3          	and	s1,s1,a0
    800066dc:	00f487b3          	add	a5,s1,a5
    800066e0:	06f5e463          	bltu	a1,a5,80006748 <freerange+0xa8>
    800066e4:	00004a97          	auipc	s5,0x4
    800066e8:	f0ca8a93          	addi	s5,s5,-244 # 8000a5f0 <end>
    800066ec:	0954e263          	bltu	s1,s5,80006770 <freerange+0xd0>
    800066f0:	01100993          	li	s3,17
    800066f4:	01b99993          	slli	s3,s3,0x1b
    800066f8:	0734fc63          	bgeu	s1,s3,80006770 <freerange+0xd0>
    800066fc:	00058a13          	mv	s4,a1
    80006700:	00003917          	auipc	s2,0x3
    80006704:	bb090913          	addi	s2,s2,-1104 # 800092b0 <kmem>
    80006708:	00002b37          	lui	s6,0x2
    8000670c:	0140006f          	j	80006720 <freerange+0x80>
    80006710:	000017b7          	lui	a5,0x1
    80006714:	00f484b3          	add	s1,s1,a5
    80006718:	0554ec63          	bltu	s1,s5,80006770 <freerange+0xd0>
    8000671c:	0534fa63          	bgeu	s1,s3,80006770 <freerange+0xd0>
    80006720:	00001637          	lui	a2,0x1
    80006724:	00100593          	li	a1,1
    80006728:	00048513          	mv	a0,s1
    8000672c:	00000097          	auipc	ra,0x0
    80006730:	50c080e7          	jalr	1292(ra) # 80006c38 <__memset>
    80006734:	00093703          	ld	a4,0(s2)
    80006738:	016487b3          	add	a5,s1,s6
    8000673c:	00e4b023          	sd	a4,0(s1)
    80006740:	00993023          	sd	s1,0(s2)
    80006744:	fcfa76e3          	bgeu	s4,a5,80006710 <freerange+0x70>
    80006748:	03813083          	ld	ra,56(sp)
    8000674c:	03013403          	ld	s0,48(sp)
    80006750:	02813483          	ld	s1,40(sp)
    80006754:	02013903          	ld	s2,32(sp)
    80006758:	01813983          	ld	s3,24(sp)
    8000675c:	01013a03          	ld	s4,16(sp)
    80006760:	00813a83          	ld	s5,8(sp)
    80006764:	00013b03          	ld	s6,0(sp)
    80006768:	04010113          	addi	sp,sp,64
    8000676c:	00008067          	ret
    80006770:	00001517          	auipc	a0,0x1
    80006774:	be050513          	addi	a0,a0,-1056 # 80007350 <digits+0x18>
    80006778:	fffff097          	auipc	ra,0xfffff
    8000677c:	3d4080e7          	jalr	980(ra) # 80005b4c <panic>

0000000080006780 <kfree>:
    80006780:	fe010113          	addi	sp,sp,-32
    80006784:	00813823          	sd	s0,16(sp)
    80006788:	00113c23          	sd	ra,24(sp)
    8000678c:	00913423          	sd	s1,8(sp)
    80006790:	02010413          	addi	s0,sp,32
    80006794:	03451793          	slli	a5,a0,0x34
    80006798:	04079c63          	bnez	a5,800067f0 <kfree+0x70>
    8000679c:	00004797          	auipc	a5,0x4
    800067a0:	e5478793          	addi	a5,a5,-428 # 8000a5f0 <end>
    800067a4:	00050493          	mv	s1,a0
    800067a8:	04f56463          	bltu	a0,a5,800067f0 <kfree+0x70>
    800067ac:	01100793          	li	a5,17
    800067b0:	01b79793          	slli	a5,a5,0x1b
    800067b4:	02f57e63          	bgeu	a0,a5,800067f0 <kfree+0x70>
    800067b8:	00001637          	lui	a2,0x1
    800067bc:	00100593          	li	a1,1
    800067c0:	00000097          	auipc	ra,0x0
    800067c4:	478080e7          	jalr	1144(ra) # 80006c38 <__memset>
    800067c8:	00003797          	auipc	a5,0x3
    800067cc:	ae878793          	addi	a5,a5,-1304 # 800092b0 <kmem>
    800067d0:	0007b703          	ld	a4,0(a5)
    800067d4:	01813083          	ld	ra,24(sp)
    800067d8:	01013403          	ld	s0,16(sp)
    800067dc:	00e4b023          	sd	a4,0(s1)
    800067e0:	0097b023          	sd	s1,0(a5)
    800067e4:	00813483          	ld	s1,8(sp)
    800067e8:	02010113          	addi	sp,sp,32
    800067ec:	00008067          	ret
    800067f0:	00001517          	auipc	a0,0x1
    800067f4:	b6050513          	addi	a0,a0,-1184 # 80007350 <digits+0x18>
    800067f8:	fffff097          	auipc	ra,0xfffff
    800067fc:	354080e7          	jalr	852(ra) # 80005b4c <panic>

0000000080006800 <kalloc>:
    80006800:	fe010113          	addi	sp,sp,-32
    80006804:	00813823          	sd	s0,16(sp)
    80006808:	00913423          	sd	s1,8(sp)
    8000680c:	00113c23          	sd	ra,24(sp)
    80006810:	02010413          	addi	s0,sp,32
    80006814:	00003797          	auipc	a5,0x3
    80006818:	a9c78793          	addi	a5,a5,-1380 # 800092b0 <kmem>
    8000681c:	0007b483          	ld	s1,0(a5)
    80006820:	02048063          	beqz	s1,80006840 <kalloc+0x40>
    80006824:	0004b703          	ld	a4,0(s1)
    80006828:	00001637          	lui	a2,0x1
    8000682c:	00500593          	li	a1,5
    80006830:	00048513          	mv	a0,s1
    80006834:	00e7b023          	sd	a4,0(a5)
    80006838:	00000097          	auipc	ra,0x0
    8000683c:	400080e7          	jalr	1024(ra) # 80006c38 <__memset>
    80006840:	01813083          	ld	ra,24(sp)
    80006844:	01013403          	ld	s0,16(sp)
    80006848:	00048513          	mv	a0,s1
    8000684c:	00813483          	ld	s1,8(sp)
    80006850:	02010113          	addi	sp,sp,32
    80006854:	00008067          	ret

0000000080006858 <initlock>:
    80006858:	ff010113          	addi	sp,sp,-16
    8000685c:	00813423          	sd	s0,8(sp)
    80006860:	01010413          	addi	s0,sp,16
    80006864:	00813403          	ld	s0,8(sp)
    80006868:	00b53423          	sd	a1,8(a0)
    8000686c:	00052023          	sw	zero,0(a0)
    80006870:	00053823          	sd	zero,16(a0)
    80006874:	01010113          	addi	sp,sp,16
    80006878:	00008067          	ret

000000008000687c <acquire>:
    8000687c:	fe010113          	addi	sp,sp,-32
    80006880:	00813823          	sd	s0,16(sp)
    80006884:	00913423          	sd	s1,8(sp)
    80006888:	00113c23          	sd	ra,24(sp)
    8000688c:	01213023          	sd	s2,0(sp)
    80006890:	02010413          	addi	s0,sp,32
    80006894:	00050493          	mv	s1,a0
    80006898:	10002973          	csrr	s2,sstatus
    8000689c:	100027f3          	csrr	a5,sstatus
    800068a0:	ffd7f793          	andi	a5,a5,-3
    800068a4:	10079073          	csrw	sstatus,a5
    800068a8:	fffff097          	auipc	ra,0xfffff
    800068ac:	8e8080e7          	jalr	-1816(ra) # 80005190 <mycpu>
    800068b0:	07852783          	lw	a5,120(a0)
    800068b4:	06078e63          	beqz	a5,80006930 <acquire+0xb4>
    800068b8:	fffff097          	auipc	ra,0xfffff
    800068bc:	8d8080e7          	jalr	-1832(ra) # 80005190 <mycpu>
    800068c0:	07852783          	lw	a5,120(a0)
    800068c4:	0004a703          	lw	a4,0(s1)
    800068c8:	0017879b          	addiw	a5,a5,1
    800068cc:	06f52c23          	sw	a5,120(a0)
    800068d0:	04071063          	bnez	a4,80006910 <acquire+0x94>
    800068d4:	00100713          	li	a4,1
    800068d8:	00070793          	mv	a5,a4
    800068dc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800068e0:	0007879b          	sext.w	a5,a5
    800068e4:	fe079ae3          	bnez	a5,800068d8 <acquire+0x5c>
    800068e8:	0ff0000f          	fence
    800068ec:	fffff097          	auipc	ra,0xfffff
    800068f0:	8a4080e7          	jalr	-1884(ra) # 80005190 <mycpu>
    800068f4:	01813083          	ld	ra,24(sp)
    800068f8:	01013403          	ld	s0,16(sp)
    800068fc:	00a4b823          	sd	a0,16(s1)
    80006900:	00013903          	ld	s2,0(sp)
    80006904:	00813483          	ld	s1,8(sp)
    80006908:	02010113          	addi	sp,sp,32
    8000690c:	00008067          	ret
    80006910:	0104b903          	ld	s2,16(s1)
    80006914:	fffff097          	auipc	ra,0xfffff
    80006918:	87c080e7          	jalr	-1924(ra) # 80005190 <mycpu>
    8000691c:	faa91ce3          	bne	s2,a0,800068d4 <acquire+0x58>
    80006920:	00001517          	auipc	a0,0x1
    80006924:	a3850513          	addi	a0,a0,-1480 # 80007358 <digits+0x20>
    80006928:	fffff097          	auipc	ra,0xfffff
    8000692c:	224080e7          	jalr	548(ra) # 80005b4c <panic>
    80006930:	00195913          	srli	s2,s2,0x1
    80006934:	fffff097          	auipc	ra,0xfffff
    80006938:	85c080e7          	jalr	-1956(ra) # 80005190 <mycpu>
    8000693c:	00197913          	andi	s2,s2,1
    80006940:	07252e23          	sw	s2,124(a0)
    80006944:	f75ff06f          	j	800068b8 <acquire+0x3c>

0000000080006948 <release>:
    80006948:	fe010113          	addi	sp,sp,-32
    8000694c:	00813823          	sd	s0,16(sp)
    80006950:	00113c23          	sd	ra,24(sp)
    80006954:	00913423          	sd	s1,8(sp)
    80006958:	01213023          	sd	s2,0(sp)
    8000695c:	02010413          	addi	s0,sp,32
    80006960:	00052783          	lw	a5,0(a0)
    80006964:	00079a63          	bnez	a5,80006978 <release+0x30>
    80006968:	00001517          	auipc	a0,0x1
    8000696c:	9f850513          	addi	a0,a0,-1544 # 80007360 <digits+0x28>
    80006970:	fffff097          	auipc	ra,0xfffff
    80006974:	1dc080e7          	jalr	476(ra) # 80005b4c <panic>
    80006978:	01053903          	ld	s2,16(a0)
    8000697c:	00050493          	mv	s1,a0
    80006980:	fffff097          	auipc	ra,0xfffff
    80006984:	810080e7          	jalr	-2032(ra) # 80005190 <mycpu>
    80006988:	fea910e3          	bne	s2,a0,80006968 <release+0x20>
    8000698c:	0004b823          	sd	zero,16(s1)
    80006990:	0ff0000f          	fence
    80006994:	0f50000f          	fence	iorw,ow
    80006998:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000699c:	ffffe097          	auipc	ra,0xffffe
    800069a0:	7f4080e7          	jalr	2036(ra) # 80005190 <mycpu>
    800069a4:	100027f3          	csrr	a5,sstatus
    800069a8:	0027f793          	andi	a5,a5,2
    800069ac:	04079a63          	bnez	a5,80006a00 <release+0xb8>
    800069b0:	07852783          	lw	a5,120(a0)
    800069b4:	02f05e63          	blez	a5,800069f0 <release+0xa8>
    800069b8:	fff7871b          	addiw	a4,a5,-1
    800069bc:	06e52c23          	sw	a4,120(a0)
    800069c0:	00071c63          	bnez	a4,800069d8 <release+0x90>
    800069c4:	07c52783          	lw	a5,124(a0)
    800069c8:	00078863          	beqz	a5,800069d8 <release+0x90>
    800069cc:	100027f3          	csrr	a5,sstatus
    800069d0:	0027e793          	ori	a5,a5,2
    800069d4:	10079073          	csrw	sstatus,a5
    800069d8:	01813083          	ld	ra,24(sp)
    800069dc:	01013403          	ld	s0,16(sp)
    800069e0:	00813483          	ld	s1,8(sp)
    800069e4:	00013903          	ld	s2,0(sp)
    800069e8:	02010113          	addi	sp,sp,32
    800069ec:	00008067          	ret
    800069f0:	00001517          	auipc	a0,0x1
    800069f4:	99050513          	addi	a0,a0,-1648 # 80007380 <digits+0x48>
    800069f8:	fffff097          	auipc	ra,0xfffff
    800069fc:	154080e7          	jalr	340(ra) # 80005b4c <panic>
    80006a00:	00001517          	auipc	a0,0x1
    80006a04:	96850513          	addi	a0,a0,-1688 # 80007368 <digits+0x30>
    80006a08:	fffff097          	auipc	ra,0xfffff
    80006a0c:	144080e7          	jalr	324(ra) # 80005b4c <panic>

0000000080006a10 <holding>:
    80006a10:	00052783          	lw	a5,0(a0)
    80006a14:	00079663          	bnez	a5,80006a20 <holding+0x10>
    80006a18:	00000513          	li	a0,0
    80006a1c:	00008067          	ret
    80006a20:	fe010113          	addi	sp,sp,-32
    80006a24:	00813823          	sd	s0,16(sp)
    80006a28:	00913423          	sd	s1,8(sp)
    80006a2c:	00113c23          	sd	ra,24(sp)
    80006a30:	02010413          	addi	s0,sp,32
    80006a34:	01053483          	ld	s1,16(a0)
    80006a38:	ffffe097          	auipc	ra,0xffffe
    80006a3c:	758080e7          	jalr	1880(ra) # 80005190 <mycpu>
    80006a40:	01813083          	ld	ra,24(sp)
    80006a44:	01013403          	ld	s0,16(sp)
    80006a48:	40a48533          	sub	a0,s1,a0
    80006a4c:	00153513          	seqz	a0,a0
    80006a50:	00813483          	ld	s1,8(sp)
    80006a54:	02010113          	addi	sp,sp,32
    80006a58:	00008067          	ret

0000000080006a5c <push_off>:
    80006a5c:	fe010113          	addi	sp,sp,-32
    80006a60:	00813823          	sd	s0,16(sp)
    80006a64:	00113c23          	sd	ra,24(sp)
    80006a68:	00913423          	sd	s1,8(sp)
    80006a6c:	02010413          	addi	s0,sp,32
    80006a70:	100024f3          	csrr	s1,sstatus
    80006a74:	100027f3          	csrr	a5,sstatus
    80006a78:	ffd7f793          	andi	a5,a5,-3
    80006a7c:	10079073          	csrw	sstatus,a5
    80006a80:	ffffe097          	auipc	ra,0xffffe
    80006a84:	710080e7          	jalr	1808(ra) # 80005190 <mycpu>
    80006a88:	07852783          	lw	a5,120(a0)
    80006a8c:	02078663          	beqz	a5,80006ab8 <push_off+0x5c>
    80006a90:	ffffe097          	auipc	ra,0xffffe
    80006a94:	700080e7          	jalr	1792(ra) # 80005190 <mycpu>
    80006a98:	07852783          	lw	a5,120(a0)
    80006a9c:	01813083          	ld	ra,24(sp)
    80006aa0:	01013403          	ld	s0,16(sp)
    80006aa4:	0017879b          	addiw	a5,a5,1
    80006aa8:	06f52c23          	sw	a5,120(a0)
    80006aac:	00813483          	ld	s1,8(sp)
    80006ab0:	02010113          	addi	sp,sp,32
    80006ab4:	00008067          	ret
    80006ab8:	0014d493          	srli	s1,s1,0x1
    80006abc:	ffffe097          	auipc	ra,0xffffe
    80006ac0:	6d4080e7          	jalr	1748(ra) # 80005190 <mycpu>
    80006ac4:	0014f493          	andi	s1,s1,1
    80006ac8:	06952e23          	sw	s1,124(a0)
    80006acc:	fc5ff06f          	j	80006a90 <push_off+0x34>

0000000080006ad0 <pop_off>:
    80006ad0:	ff010113          	addi	sp,sp,-16
    80006ad4:	00813023          	sd	s0,0(sp)
    80006ad8:	00113423          	sd	ra,8(sp)
    80006adc:	01010413          	addi	s0,sp,16
    80006ae0:	ffffe097          	auipc	ra,0xffffe
    80006ae4:	6b0080e7          	jalr	1712(ra) # 80005190 <mycpu>
    80006ae8:	100027f3          	csrr	a5,sstatus
    80006aec:	0027f793          	andi	a5,a5,2
    80006af0:	04079663          	bnez	a5,80006b3c <pop_off+0x6c>
    80006af4:	07852783          	lw	a5,120(a0)
    80006af8:	02f05a63          	blez	a5,80006b2c <pop_off+0x5c>
    80006afc:	fff7871b          	addiw	a4,a5,-1
    80006b00:	06e52c23          	sw	a4,120(a0)
    80006b04:	00071c63          	bnez	a4,80006b1c <pop_off+0x4c>
    80006b08:	07c52783          	lw	a5,124(a0)
    80006b0c:	00078863          	beqz	a5,80006b1c <pop_off+0x4c>
    80006b10:	100027f3          	csrr	a5,sstatus
    80006b14:	0027e793          	ori	a5,a5,2
    80006b18:	10079073          	csrw	sstatus,a5
    80006b1c:	00813083          	ld	ra,8(sp)
    80006b20:	00013403          	ld	s0,0(sp)
    80006b24:	01010113          	addi	sp,sp,16
    80006b28:	00008067          	ret
    80006b2c:	00001517          	auipc	a0,0x1
    80006b30:	85450513          	addi	a0,a0,-1964 # 80007380 <digits+0x48>
    80006b34:	fffff097          	auipc	ra,0xfffff
    80006b38:	018080e7          	jalr	24(ra) # 80005b4c <panic>
    80006b3c:	00001517          	auipc	a0,0x1
    80006b40:	82c50513          	addi	a0,a0,-2004 # 80007368 <digits+0x30>
    80006b44:	fffff097          	auipc	ra,0xfffff
    80006b48:	008080e7          	jalr	8(ra) # 80005b4c <panic>

0000000080006b4c <push_on>:
    80006b4c:	fe010113          	addi	sp,sp,-32
    80006b50:	00813823          	sd	s0,16(sp)
    80006b54:	00113c23          	sd	ra,24(sp)
    80006b58:	00913423          	sd	s1,8(sp)
    80006b5c:	02010413          	addi	s0,sp,32
    80006b60:	100024f3          	csrr	s1,sstatus
    80006b64:	100027f3          	csrr	a5,sstatus
    80006b68:	0027e793          	ori	a5,a5,2
    80006b6c:	10079073          	csrw	sstatus,a5
    80006b70:	ffffe097          	auipc	ra,0xffffe
    80006b74:	620080e7          	jalr	1568(ra) # 80005190 <mycpu>
    80006b78:	07852783          	lw	a5,120(a0)
    80006b7c:	02078663          	beqz	a5,80006ba8 <push_on+0x5c>
    80006b80:	ffffe097          	auipc	ra,0xffffe
    80006b84:	610080e7          	jalr	1552(ra) # 80005190 <mycpu>
    80006b88:	07852783          	lw	a5,120(a0)
    80006b8c:	01813083          	ld	ra,24(sp)
    80006b90:	01013403          	ld	s0,16(sp)
    80006b94:	0017879b          	addiw	a5,a5,1
    80006b98:	06f52c23          	sw	a5,120(a0)
    80006b9c:	00813483          	ld	s1,8(sp)
    80006ba0:	02010113          	addi	sp,sp,32
    80006ba4:	00008067          	ret
    80006ba8:	0014d493          	srli	s1,s1,0x1
    80006bac:	ffffe097          	auipc	ra,0xffffe
    80006bb0:	5e4080e7          	jalr	1508(ra) # 80005190 <mycpu>
    80006bb4:	0014f493          	andi	s1,s1,1
    80006bb8:	06952e23          	sw	s1,124(a0)
    80006bbc:	fc5ff06f          	j	80006b80 <push_on+0x34>

0000000080006bc0 <pop_on>:
    80006bc0:	ff010113          	addi	sp,sp,-16
    80006bc4:	00813023          	sd	s0,0(sp)
    80006bc8:	00113423          	sd	ra,8(sp)
    80006bcc:	01010413          	addi	s0,sp,16
    80006bd0:	ffffe097          	auipc	ra,0xffffe
    80006bd4:	5c0080e7          	jalr	1472(ra) # 80005190 <mycpu>
    80006bd8:	100027f3          	csrr	a5,sstatus
    80006bdc:	0027f793          	andi	a5,a5,2
    80006be0:	04078463          	beqz	a5,80006c28 <pop_on+0x68>
    80006be4:	07852783          	lw	a5,120(a0)
    80006be8:	02f05863          	blez	a5,80006c18 <pop_on+0x58>
    80006bec:	fff7879b          	addiw	a5,a5,-1
    80006bf0:	06f52c23          	sw	a5,120(a0)
    80006bf4:	07853783          	ld	a5,120(a0)
    80006bf8:	00079863          	bnez	a5,80006c08 <pop_on+0x48>
    80006bfc:	100027f3          	csrr	a5,sstatus
    80006c00:	ffd7f793          	andi	a5,a5,-3
    80006c04:	10079073          	csrw	sstatus,a5
    80006c08:	00813083          	ld	ra,8(sp)
    80006c0c:	00013403          	ld	s0,0(sp)
    80006c10:	01010113          	addi	sp,sp,16
    80006c14:	00008067          	ret
    80006c18:	00000517          	auipc	a0,0x0
    80006c1c:	79050513          	addi	a0,a0,1936 # 800073a8 <digits+0x70>
    80006c20:	fffff097          	auipc	ra,0xfffff
    80006c24:	f2c080e7          	jalr	-212(ra) # 80005b4c <panic>
    80006c28:	00000517          	auipc	a0,0x0
    80006c2c:	76050513          	addi	a0,a0,1888 # 80007388 <digits+0x50>
    80006c30:	fffff097          	auipc	ra,0xfffff
    80006c34:	f1c080e7          	jalr	-228(ra) # 80005b4c <panic>

0000000080006c38 <__memset>:
    80006c38:	ff010113          	addi	sp,sp,-16
    80006c3c:	00813423          	sd	s0,8(sp)
    80006c40:	01010413          	addi	s0,sp,16
    80006c44:	1a060e63          	beqz	a2,80006e00 <__memset+0x1c8>
    80006c48:	40a007b3          	neg	a5,a0
    80006c4c:	0077f793          	andi	a5,a5,7
    80006c50:	00778693          	addi	a3,a5,7
    80006c54:	00b00813          	li	a6,11
    80006c58:	0ff5f593          	andi	a1,a1,255
    80006c5c:	fff6071b          	addiw	a4,a2,-1
    80006c60:	1b06e663          	bltu	a3,a6,80006e0c <__memset+0x1d4>
    80006c64:	1cd76463          	bltu	a4,a3,80006e2c <__memset+0x1f4>
    80006c68:	1a078e63          	beqz	a5,80006e24 <__memset+0x1ec>
    80006c6c:	00b50023          	sb	a1,0(a0)
    80006c70:	00100713          	li	a4,1
    80006c74:	1ae78463          	beq	a5,a4,80006e1c <__memset+0x1e4>
    80006c78:	00b500a3          	sb	a1,1(a0)
    80006c7c:	00200713          	li	a4,2
    80006c80:	1ae78a63          	beq	a5,a4,80006e34 <__memset+0x1fc>
    80006c84:	00b50123          	sb	a1,2(a0)
    80006c88:	00300713          	li	a4,3
    80006c8c:	18e78463          	beq	a5,a4,80006e14 <__memset+0x1dc>
    80006c90:	00b501a3          	sb	a1,3(a0)
    80006c94:	00400713          	li	a4,4
    80006c98:	1ae78263          	beq	a5,a4,80006e3c <__memset+0x204>
    80006c9c:	00b50223          	sb	a1,4(a0)
    80006ca0:	00500713          	li	a4,5
    80006ca4:	1ae78063          	beq	a5,a4,80006e44 <__memset+0x20c>
    80006ca8:	00b502a3          	sb	a1,5(a0)
    80006cac:	00700713          	li	a4,7
    80006cb0:	18e79e63          	bne	a5,a4,80006e4c <__memset+0x214>
    80006cb4:	00b50323          	sb	a1,6(a0)
    80006cb8:	00700e93          	li	t4,7
    80006cbc:	00859713          	slli	a4,a1,0x8
    80006cc0:	00e5e733          	or	a4,a1,a4
    80006cc4:	01059e13          	slli	t3,a1,0x10
    80006cc8:	01c76e33          	or	t3,a4,t3
    80006ccc:	01859313          	slli	t1,a1,0x18
    80006cd0:	006e6333          	or	t1,t3,t1
    80006cd4:	02059893          	slli	a7,a1,0x20
    80006cd8:	40f60e3b          	subw	t3,a2,a5
    80006cdc:	011368b3          	or	a7,t1,a7
    80006ce0:	02859813          	slli	a6,a1,0x28
    80006ce4:	0108e833          	or	a6,a7,a6
    80006ce8:	03059693          	slli	a3,a1,0x30
    80006cec:	003e589b          	srliw	a7,t3,0x3
    80006cf0:	00d866b3          	or	a3,a6,a3
    80006cf4:	03859713          	slli	a4,a1,0x38
    80006cf8:	00389813          	slli	a6,a7,0x3
    80006cfc:	00f507b3          	add	a5,a0,a5
    80006d00:	00e6e733          	or	a4,a3,a4
    80006d04:	000e089b          	sext.w	a7,t3
    80006d08:	00f806b3          	add	a3,a6,a5
    80006d0c:	00e7b023          	sd	a4,0(a5)
    80006d10:	00878793          	addi	a5,a5,8
    80006d14:	fed79ce3          	bne	a5,a3,80006d0c <__memset+0xd4>
    80006d18:	ff8e7793          	andi	a5,t3,-8
    80006d1c:	0007871b          	sext.w	a4,a5
    80006d20:	01d787bb          	addw	a5,a5,t4
    80006d24:	0ce88e63          	beq	a7,a4,80006e00 <__memset+0x1c8>
    80006d28:	00f50733          	add	a4,a0,a5
    80006d2c:	00b70023          	sb	a1,0(a4)
    80006d30:	0017871b          	addiw	a4,a5,1
    80006d34:	0cc77663          	bgeu	a4,a2,80006e00 <__memset+0x1c8>
    80006d38:	00e50733          	add	a4,a0,a4
    80006d3c:	00b70023          	sb	a1,0(a4)
    80006d40:	0027871b          	addiw	a4,a5,2
    80006d44:	0ac77e63          	bgeu	a4,a2,80006e00 <__memset+0x1c8>
    80006d48:	00e50733          	add	a4,a0,a4
    80006d4c:	00b70023          	sb	a1,0(a4)
    80006d50:	0037871b          	addiw	a4,a5,3
    80006d54:	0ac77663          	bgeu	a4,a2,80006e00 <__memset+0x1c8>
    80006d58:	00e50733          	add	a4,a0,a4
    80006d5c:	00b70023          	sb	a1,0(a4)
    80006d60:	0047871b          	addiw	a4,a5,4
    80006d64:	08c77e63          	bgeu	a4,a2,80006e00 <__memset+0x1c8>
    80006d68:	00e50733          	add	a4,a0,a4
    80006d6c:	00b70023          	sb	a1,0(a4)
    80006d70:	0057871b          	addiw	a4,a5,5
    80006d74:	08c77663          	bgeu	a4,a2,80006e00 <__memset+0x1c8>
    80006d78:	00e50733          	add	a4,a0,a4
    80006d7c:	00b70023          	sb	a1,0(a4)
    80006d80:	0067871b          	addiw	a4,a5,6
    80006d84:	06c77e63          	bgeu	a4,a2,80006e00 <__memset+0x1c8>
    80006d88:	00e50733          	add	a4,a0,a4
    80006d8c:	00b70023          	sb	a1,0(a4)
    80006d90:	0077871b          	addiw	a4,a5,7
    80006d94:	06c77663          	bgeu	a4,a2,80006e00 <__memset+0x1c8>
    80006d98:	00e50733          	add	a4,a0,a4
    80006d9c:	00b70023          	sb	a1,0(a4)
    80006da0:	0087871b          	addiw	a4,a5,8
    80006da4:	04c77e63          	bgeu	a4,a2,80006e00 <__memset+0x1c8>
    80006da8:	00e50733          	add	a4,a0,a4
    80006dac:	00b70023          	sb	a1,0(a4)
    80006db0:	0097871b          	addiw	a4,a5,9
    80006db4:	04c77663          	bgeu	a4,a2,80006e00 <__memset+0x1c8>
    80006db8:	00e50733          	add	a4,a0,a4
    80006dbc:	00b70023          	sb	a1,0(a4)
    80006dc0:	00a7871b          	addiw	a4,a5,10
    80006dc4:	02c77e63          	bgeu	a4,a2,80006e00 <__memset+0x1c8>
    80006dc8:	00e50733          	add	a4,a0,a4
    80006dcc:	00b70023          	sb	a1,0(a4)
    80006dd0:	00b7871b          	addiw	a4,a5,11
    80006dd4:	02c77663          	bgeu	a4,a2,80006e00 <__memset+0x1c8>
    80006dd8:	00e50733          	add	a4,a0,a4
    80006ddc:	00b70023          	sb	a1,0(a4)
    80006de0:	00c7871b          	addiw	a4,a5,12
    80006de4:	00c77e63          	bgeu	a4,a2,80006e00 <__memset+0x1c8>
    80006de8:	00e50733          	add	a4,a0,a4
    80006dec:	00b70023          	sb	a1,0(a4)
    80006df0:	00d7879b          	addiw	a5,a5,13
    80006df4:	00c7f663          	bgeu	a5,a2,80006e00 <__memset+0x1c8>
    80006df8:	00f507b3          	add	a5,a0,a5
    80006dfc:	00b78023          	sb	a1,0(a5)
    80006e00:	00813403          	ld	s0,8(sp)
    80006e04:	01010113          	addi	sp,sp,16
    80006e08:	00008067          	ret
    80006e0c:	00b00693          	li	a3,11
    80006e10:	e55ff06f          	j	80006c64 <__memset+0x2c>
    80006e14:	00300e93          	li	t4,3
    80006e18:	ea5ff06f          	j	80006cbc <__memset+0x84>
    80006e1c:	00100e93          	li	t4,1
    80006e20:	e9dff06f          	j	80006cbc <__memset+0x84>
    80006e24:	00000e93          	li	t4,0
    80006e28:	e95ff06f          	j	80006cbc <__memset+0x84>
    80006e2c:	00000793          	li	a5,0
    80006e30:	ef9ff06f          	j	80006d28 <__memset+0xf0>
    80006e34:	00200e93          	li	t4,2
    80006e38:	e85ff06f          	j	80006cbc <__memset+0x84>
    80006e3c:	00400e93          	li	t4,4
    80006e40:	e7dff06f          	j	80006cbc <__memset+0x84>
    80006e44:	00500e93          	li	t4,5
    80006e48:	e75ff06f          	j	80006cbc <__memset+0x84>
    80006e4c:	00600e93          	li	t4,6
    80006e50:	e6dff06f          	j	80006cbc <__memset+0x84>

0000000080006e54 <__memmove>:
    80006e54:	ff010113          	addi	sp,sp,-16
    80006e58:	00813423          	sd	s0,8(sp)
    80006e5c:	01010413          	addi	s0,sp,16
    80006e60:	0e060863          	beqz	a2,80006f50 <__memmove+0xfc>
    80006e64:	fff6069b          	addiw	a3,a2,-1
    80006e68:	0006881b          	sext.w	a6,a3
    80006e6c:	0ea5e863          	bltu	a1,a0,80006f5c <__memmove+0x108>
    80006e70:	00758713          	addi	a4,a1,7
    80006e74:	00a5e7b3          	or	a5,a1,a0
    80006e78:	40a70733          	sub	a4,a4,a0
    80006e7c:	0077f793          	andi	a5,a5,7
    80006e80:	00f73713          	sltiu	a4,a4,15
    80006e84:	00174713          	xori	a4,a4,1
    80006e88:	0017b793          	seqz	a5,a5
    80006e8c:	00e7f7b3          	and	a5,a5,a4
    80006e90:	10078863          	beqz	a5,80006fa0 <__memmove+0x14c>
    80006e94:	00900793          	li	a5,9
    80006e98:	1107f463          	bgeu	a5,a6,80006fa0 <__memmove+0x14c>
    80006e9c:	0036581b          	srliw	a6,a2,0x3
    80006ea0:	fff8081b          	addiw	a6,a6,-1
    80006ea4:	02081813          	slli	a6,a6,0x20
    80006ea8:	01d85893          	srli	a7,a6,0x1d
    80006eac:	00858813          	addi	a6,a1,8
    80006eb0:	00058793          	mv	a5,a1
    80006eb4:	00050713          	mv	a4,a0
    80006eb8:	01088833          	add	a6,a7,a6
    80006ebc:	0007b883          	ld	a7,0(a5)
    80006ec0:	00878793          	addi	a5,a5,8
    80006ec4:	00870713          	addi	a4,a4,8
    80006ec8:	ff173c23          	sd	a7,-8(a4)
    80006ecc:	ff0798e3          	bne	a5,a6,80006ebc <__memmove+0x68>
    80006ed0:	ff867713          	andi	a4,a2,-8
    80006ed4:	02071793          	slli	a5,a4,0x20
    80006ed8:	0207d793          	srli	a5,a5,0x20
    80006edc:	00f585b3          	add	a1,a1,a5
    80006ee0:	40e686bb          	subw	a3,a3,a4
    80006ee4:	00f507b3          	add	a5,a0,a5
    80006ee8:	06e60463          	beq	a2,a4,80006f50 <__memmove+0xfc>
    80006eec:	0005c703          	lbu	a4,0(a1)
    80006ef0:	00e78023          	sb	a4,0(a5)
    80006ef4:	04068e63          	beqz	a3,80006f50 <__memmove+0xfc>
    80006ef8:	0015c603          	lbu	a2,1(a1)
    80006efc:	00100713          	li	a4,1
    80006f00:	00c780a3          	sb	a2,1(a5)
    80006f04:	04e68663          	beq	a3,a4,80006f50 <__memmove+0xfc>
    80006f08:	0025c603          	lbu	a2,2(a1)
    80006f0c:	00200713          	li	a4,2
    80006f10:	00c78123          	sb	a2,2(a5)
    80006f14:	02e68e63          	beq	a3,a4,80006f50 <__memmove+0xfc>
    80006f18:	0035c603          	lbu	a2,3(a1)
    80006f1c:	00300713          	li	a4,3
    80006f20:	00c781a3          	sb	a2,3(a5)
    80006f24:	02e68663          	beq	a3,a4,80006f50 <__memmove+0xfc>
    80006f28:	0045c603          	lbu	a2,4(a1)
    80006f2c:	00400713          	li	a4,4
    80006f30:	00c78223          	sb	a2,4(a5)
    80006f34:	00e68e63          	beq	a3,a4,80006f50 <__memmove+0xfc>
    80006f38:	0055c603          	lbu	a2,5(a1)
    80006f3c:	00500713          	li	a4,5
    80006f40:	00c782a3          	sb	a2,5(a5)
    80006f44:	00e68663          	beq	a3,a4,80006f50 <__memmove+0xfc>
    80006f48:	0065c703          	lbu	a4,6(a1)
    80006f4c:	00e78323          	sb	a4,6(a5)
    80006f50:	00813403          	ld	s0,8(sp)
    80006f54:	01010113          	addi	sp,sp,16
    80006f58:	00008067          	ret
    80006f5c:	02061713          	slli	a4,a2,0x20
    80006f60:	02075713          	srli	a4,a4,0x20
    80006f64:	00e587b3          	add	a5,a1,a4
    80006f68:	f0f574e3          	bgeu	a0,a5,80006e70 <__memmove+0x1c>
    80006f6c:	02069613          	slli	a2,a3,0x20
    80006f70:	02065613          	srli	a2,a2,0x20
    80006f74:	fff64613          	not	a2,a2
    80006f78:	00e50733          	add	a4,a0,a4
    80006f7c:	00c78633          	add	a2,a5,a2
    80006f80:	fff7c683          	lbu	a3,-1(a5)
    80006f84:	fff78793          	addi	a5,a5,-1
    80006f88:	fff70713          	addi	a4,a4,-1
    80006f8c:	00d70023          	sb	a3,0(a4)
    80006f90:	fec798e3          	bne	a5,a2,80006f80 <__memmove+0x12c>
    80006f94:	00813403          	ld	s0,8(sp)
    80006f98:	01010113          	addi	sp,sp,16
    80006f9c:	00008067          	ret
    80006fa0:	02069713          	slli	a4,a3,0x20
    80006fa4:	02075713          	srli	a4,a4,0x20
    80006fa8:	00170713          	addi	a4,a4,1
    80006fac:	00e50733          	add	a4,a0,a4
    80006fb0:	00050793          	mv	a5,a0
    80006fb4:	0005c683          	lbu	a3,0(a1)
    80006fb8:	00178793          	addi	a5,a5,1
    80006fbc:	00158593          	addi	a1,a1,1
    80006fc0:	fed78fa3          	sb	a3,-1(a5)
    80006fc4:	fee798e3          	bne	a5,a4,80006fb4 <__memmove+0x160>
    80006fc8:	f89ff06f          	j	80006f50 <__memmove+0xfc>
	...
