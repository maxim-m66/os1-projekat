
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	60813103          	ld	sp,1544(sp) # 8000a608 <_GLOBAL_OFFSET_TABLE_+0x50>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	5f8050ef          	jal	ra,80005614 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <caller>:
.global caller
.type caller @function
caller:
    ecall
    80001000:	00000073          	ecall
    ret
    80001004:	00008067          	ret
    80001008:	00000013          	nop
    8000100c:	00000013          	nop

0000000080001010 <supervisorTrap>:

.align 4
.global supervisorTrap
.type supervisorTrap @function
supervisorTrap:
    j ecallHandler
    80001010:	0280006f          	j	80001038 <ecallHandler>
    j timerHandler
    80001014:	1240006f          	j	80001138 <timerHandler>
    sret
    80001018:	10200073          	sret
    sret
    8000101c:	10200073          	sret
    sret
    80001020:	10200073          	sret
    j readHandler
    80001024:	2240006f          	j	80001248 <readHandler>
    sret
    80001028:	10200073          	sret
    j writeHandler
    8000102c:	2240006f          	j	80001250 <writeHandler>
    sret
    80001030:	10200073          	sret
    j consoleHandler
    80001034:	2240006f          	j	80001258 <consoleHandler>

0000000080001038 <ecallHandler>:

ecallHandler:
    addi sp, sp, -256
    80001038:	f0010113          	addi	sp,sp,-256
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000103c:	00113423          	sd	ra,8(sp)
    80001040:	00213823          	sd	sp,16(sp)
    80001044:	00313c23          	sd	gp,24(sp)
    80001048:	02413023          	sd	tp,32(sp)
    8000104c:	02513423          	sd	t0,40(sp)
    80001050:	02613823          	sd	t1,48(sp)
    80001054:	02713c23          	sd	t2,56(sp)
    80001058:	04813023          	sd	s0,64(sp)
    8000105c:	04913423          	sd	s1,72(sp)
    80001060:	04b13c23          	sd	a1,88(sp)
    80001064:	06c13023          	sd	a2,96(sp)
    80001068:	06d13423          	sd	a3,104(sp)
    8000106c:	06e13823          	sd	a4,112(sp)
    80001070:	06f13c23          	sd	a5,120(sp)
    80001074:	09013023          	sd	a6,128(sp)
    80001078:	09113423          	sd	a7,136(sp)
    8000107c:	09213823          	sd	s2,144(sp)
    80001080:	09313c23          	sd	s3,152(sp)
    80001084:	0b413023          	sd	s4,160(sp)
    80001088:	0b513423          	sd	s5,168(sp)
    8000108c:	0b613823          	sd	s6,176(sp)
    80001090:	0b713c23          	sd	s7,184(sp)
    80001094:	0d813023          	sd	s8,192(sp)
    80001098:	0d913423          	sd	s9,200(sp)
    8000109c:	0da13823          	sd	s10,208(sp)
    800010a0:	0db13c23          	sd	s11,216(sp)
    800010a4:	0fc13023          	sd	t3,224(sp)
    800010a8:	0fd13423          	sd	t4,232(sp)
    800010ac:	0fe13823          	sd	t5,240(sp)
    800010b0:	0ff13c23          	sd	t6,248(sp)

    call _ZN5riscv20handleSupervisorTrapEmmmmm
    800010b4:	490030ef          	jal	ra,80004544 <_ZN5riscv20handleSupervisorTrapEmmmmm>

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

    call _ZN5riscv15handleTimerTrapEv
    800011bc:	47c030ef          	jal	ra,80004638 <_ZN5riscv15handleTimerTrapEv>

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
    call _ZN5riscv14handleReadTrapEv
    80001248:	5c0030ef          	jal	ra,80004808 <_ZN5riscv14handleReadTrapEv>
    sret
    8000124c:	10200073          	sret

0000000080001250 <writeHandler>:

writeHandler:
    call _ZN5riscv15handleWriteTrapEv
    80001250:	634030ef          	jal	ra,80004884 <_ZN5riscv15handleWriteTrapEv>
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

    call _ZN5riscv17handleConsoleTrapEv
    800012dc:	47c030ef          	jal	ra,80004758 <_ZN5riscv17handleConsoleTrapEv>

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

0000000080001368 <_ZN5riscv7setjumpEv>:
.global _ZN5riscv7setjumpEv
.type _ZN5riscv7setjumpEv @function
_ZN5riscv7setjumpEv:
    li a0, 0
    80001368:	00000513          	li	a0,0
    addi sp, sp, -256
    8000136c:	f0010113          	addi	sp,sp,-256
    .irp index, 1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001370:	00113423          	sd	ra,8(sp)
    80001374:	00313c23          	sd	gp,24(sp)
    80001378:	02413023          	sd	tp,32(sp)
    8000137c:	02513423          	sd	t0,40(sp)
    80001380:	02613823          	sd	t1,48(sp)
    80001384:	02713c23          	sd	t2,56(sp)
    80001388:	04813023          	sd	s0,64(sp)
    8000138c:	04913423          	sd	s1,72(sp)
    80001390:	04a13823          	sd	a0,80(sp)
    80001394:	04b13c23          	sd	a1,88(sp)
    80001398:	06c13023          	sd	a2,96(sp)
    8000139c:	06d13423          	sd	a3,104(sp)
    800013a0:	06e13823          	sd	a4,112(sp)
    800013a4:	06f13c23          	sd	a5,120(sp)
    800013a8:	09013023          	sd	a6,128(sp)
    800013ac:	09113423          	sd	a7,136(sp)
    800013b0:	09213823          	sd	s2,144(sp)
    800013b4:	09313c23          	sd	s3,152(sp)
    800013b8:	0b413023          	sd	s4,160(sp)
    800013bc:	0b513423          	sd	s5,168(sp)
    800013c0:	0b613823          	sd	s6,176(sp)
    800013c4:	0b713c23          	sd	s7,184(sp)
    800013c8:	0d813023          	sd	s8,192(sp)
    800013cc:	0d913423          	sd	s9,200(sp)
    800013d0:	0da13823          	sd	s10,208(sp)
    800013d4:	0db13c23          	sd	s11,216(sp)
    800013d8:	0fc13023          	sd	t3,224(sp)
    800013dc:	0fd13423          	sd	t4,232(sp)
    800013e0:	0fe13823          	sd	t5,240(sp)
    800013e4:	0ff13c23          	sd	t6,248(sp)
    li a0, 1
    800013e8:	00100513          	li	a0,1
    ret
    800013ec:	00008067          	ret

00000000800013f0 <_ZN5riscv8longjumpEv>:
.global _ZN5riscv8longjumpEv
.type _ZN5riscv8longjumpEv @function
_ZN5riscv8longjumpEv:
    .irp index, 1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800013f0:	00813083          	ld	ra,8(sp)
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
    ret
    80001480:	00008067          	ret

0000000080001484 <_ZN3TCB15context_inheritEP7Context>:

.global _ZN3TCB15context_inheritEP7Context
.type _ZN3TCB15context_inheritEP7Context @function
_ZN3TCB15context_inheritEP7Context:
    sd ra, 0(a0)
    80001484:	00153023          	sd	ra,0(a0)
    sd sp, 8(a0)
    80001488:	00253423          	sd	sp,8(a0)
    8000148c:	00008067          	ret

0000000080001490 <_Z7syscallmmmmm>:
#include "../h/syscall_c.hpp"

extern "C" uint64 caller();

uint64 syscall(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    80001490:	ff010113          	addi	sp,sp,-16
    80001494:	00113423          	sd	ra,8(sp)
    80001498:	00813023          	sd	s0,0(sp)
    8000149c:	01010413          	addi	s0,sp,16
    return caller();
    800014a0:	00000097          	auipc	ra,0x0
    800014a4:	b60080e7          	jalr	-1184(ra) # 80001000 <caller>
}
    800014a8:	00813083          	ld	ra,8(sp)
    800014ac:	00013403          	ld	s0,0(sp)
    800014b0:	01010113          	addi	sp,sp,16
    800014b4:	00008067          	ret

00000000800014b8 <_Z9mem_allocm>:

void *mem_alloc(size_t size) {
    if (size == 0) return nullptr;
    800014b8:	04050063          	beqz	a0,800014f8 <_Z9mem_allocm+0x40>
void *mem_alloc(size_t size) {
    800014bc:	ff010113          	addi	sp,sp,-16
    800014c0:	00113423          	sd	ra,8(sp)
    800014c4:	00813023          	sd	s0,0(sp)
    800014c8:	01010413          	addi	s0,sp,16
    800014cc:	00050593          	mv	a1,a0
    return (void *) syscall(MEM_ALLOC, size);
    800014d0:	00000713          	li	a4,0
    800014d4:	00000693          	li	a3,0
    800014d8:	00000613          	li	a2,0
    800014dc:	00000513          	li	a0,0
    800014e0:	00000097          	auipc	ra,0x0
    800014e4:	fb0080e7          	jalr	-80(ra) # 80001490 <_Z7syscallmmmmm>
}
    800014e8:	00813083          	ld	ra,8(sp)
    800014ec:	00013403          	ld	s0,0(sp)
    800014f0:	01010113          	addi	sp,sp,16
    800014f4:	00008067          	ret
    if (size == 0) return nullptr;
    800014f8:	00000513          	li	a0,0
}
    800014fc:	00008067          	ret

0000000080001500 <_Z8mem_freePv>:

int mem_free(void *mem) {
    80001500:	ff010113          	addi	sp,sp,-16
    80001504:	00113423          	sd	ra,8(sp)
    80001508:	00813023          	sd	s0,0(sp)
    8000150c:	01010413          	addi	s0,sp,16
    80001510:	00050593          	mv	a1,a0
    return (int) syscall(MEM_FREE, (uint64) mem);
    80001514:	00000713          	li	a4,0
    80001518:	00000693          	li	a3,0
    8000151c:	00000613          	li	a2,0
    80001520:	00100513          	li	a0,1
    80001524:	00000097          	auipc	ra,0x0
    80001528:	f6c080e7          	jalr	-148(ra) # 80001490 <_Z7syscallmmmmm>
}
    8000152c:	0005051b          	sext.w	a0,a0
    80001530:	00813083          	ld	ra,8(sp)
    80001534:	00013403          	ld	s0,0(sp)
    80001538:	01010113          	addi	sp,sp,16
    8000153c:	00008067          	ret

0000000080001540 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    80001540:	fd010113          	addi	sp,sp,-48
    80001544:	02113423          	sd	ra,40(sp)
    80001548:	02813023          	sd	s0,32(sp)
    8000154c:	00913c23          	sd	s1,24(sp)
    80001550:	01213823          	sd	s2,16(sp)
    80001554:	01313423          	sd	s3,8(sp)
    80001558:	03010413          	addi	s0,sp,48
    8000155c:	00050913          	mv	s2,a0
    80001560:	00058493          	mv	s1,a1
    80001564:	00060993          	mv	s3,a2
    void *stack_space = nullptr;
    if (start_routine) {
    80001568:	04058663          	beqz	a1,800015b4 <_Z13thread_createPP3TCBPFvPvES2_+0x74>
        stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    8000156c:	00004537          	lui	a0,0x4
    80001570:	00000097          	auipc	ra,0x0
    80001574:	f48080e7          	jalr	-184(ra) # 800014b8 <_Z9mem_allocm>
    80001578:	00050713          	mv	a4,a0
    }
    return (int) syscall(THREAD_CREATE, (uint64) handle, (uint64) start_routine, (uint64) arg, (uint64) stack_space);
    8000157c:	00098693          	mv	a3,s3
    80001580:	00048613          	mv	a2,s1
    80001584:	00090593          	mv	a1,s2
    80001588:	00200513          	li	a0,2
    8000158c:	00000097          	auipc	ra,0x0
    80001590:	f04080e7          	jalr	-252(ra) # 80001490 <_Z7syscallmmmmm>
}
    80001594:	0005051b          	sext.w	a0,a0
    80001598:	02813083          	ld	ra,40(sp)
    8000159c:	02013403          	ld	s0,32(sp)
    800015a0:	01813483          	ld	s1,24(sp)
    800015a4:	01013903          	ld	s2,16(sp)
    800015a8:	00813983          	ld	s3,8(sp)
    800015ac:	03010113          	addi	sp,sp,48
    800015b0:	00008067          	ret
    void *stack_space = nullptr;
    800015b4:	00000713          	li	a4,0
    800015b8:	fc5ff06f          	j	8000157c <_Z13thread_createPP3TCBPFvPvES2_+0x3c>

00000000800015bc <_Z11thread_exitv>:

int thread_exit() {
    800015bc:	ff010113          	addi	sp,sp,-16
    800015c0:	00113423          	sd	ra,8(sp)
    800015c4:	00813023          	sd	s0,0(sp)
    800015c8:	01010413          	addi	s0,sp,16
    return (int) syscall(THREAD_EXIT);
    800015cc:	00000713          	li	a4,0
    800015d0:	00000693          	li	a3,0
    800015d4:	00000613          	li	a2,0
    800015d8:	00000593          	li	a1,0
    800015dc:	00300513          	li	a0,3
    800015e0:	00000097          	auipc	ra,0x0
    800015e4:	eb0080e7          	jalr	-336(ra) # 80001490 <_Z7syscallmmmmm>
}
    800015e8:	0005051b          	sext.w	a0,a0
    800015ec:	00813083          	ld	ra,8(sp)
    800015f0:	00013403          	ld	s0,0(sp)
    800015f4:	01010113          	addi	sp,sp,16
    800015f8:	00008067          	ret

00000000800015fc <_Z15thread_dispatchv>:

void thread_dispatch() {
    800015fc:	ff010113          	addi	sp,sp,-16
    80001600:	00113423          	sd	ra,8(sp)
    80001604:	00813023          	sd	s0,0(sp)
    80001608:	01010413          	addi	s0,sp,16
    (void) syscall(THREAD_DISPATCH);
    8000160c:	00000713          	li	a4,0
    80001610:	00000693          	li	a3,0
    80001614:	00000613          	li	a2,0
    80001618:	00000593          	li	a1,0
    8000161c:	00400513          	li	a0,4
    80001620:	00000097          	auipc	ra,0x0
    80001624:	e70080e7          	jalr	-400(ra) # 80001490 <_Z7syscallmmmmm>
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
    (void) syscall(THREAD_JOIN, (uint64) handle);
    8000164c:	00000713          	li	a4,0
    80001650:	00000693          	li	a3,0
    80001654:	00000613          	li	a2,0
    80001658:	00500513          	li	a0,5
    8000165c:	00000097          	auipc	ra,0x0
    80001660:	e34080e7          	jalr	-460(ra) # 80001490 <_Z7syscallmmmmm>
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
    (void) syscall(THREAD_JOIN_TIME, (uint64) handle, time);
    80001698:	00000713          	li	a4,0
    8000169c:	00000693          	li	a3,0
    800016a0:	00048613          	mv	a2,s1
    800016a4:	00090593          	mv	a1,s2
    800016a8:	00600513          	li	a0,6
    800016ac:	00000097          	auipc	ra,0x0
    800016b0:	de4080e7          	jalr	-540(ra) # 80001490 <_Z7syscallmmmmm>
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
    800016d8:	ff010113          	addi	sp,sp,-16
    800016dc:	00113423          	sd	ra,8(sp)
    800016e0:	00813023          	sd	s0,0(sp)
    800016e4:	01010413          	addi	s0,sp,16
    return (int) syscall(THREAD_FORK);
    800016e8:	00000713          	li	a4,0
    800016ec:	00000693          	li	a3,0
    800016f0:	00000613          	li	a2,0
    800016f4:	00000593          	li	a1,0
    800016f8:	00700513          	li	a0,7
    800016fc:	00000097          	auipc	ra,0x0
    80001700:	d94080e7          	jalr	-620(ra) # 80001490 <_Z7syscallmmmmm>
}
    80001704:	0005051b          	sext.w	a0,a0
    80001708:	00813083          	ld	ra,8(sp)
    8000170c:	00013403          	ld	s0,0(sp)
    80001710:	01010113          	addi	sp,sp,16
    80001714:	00008067          	ret

0000000080001718 <_Z11thread_killP3TCB>:

int thread_kill(thread_t handle) {
    80001718:	ff010113          	addi	sp,sp,-16
    8000171c:	00113423          	sd	ra,8(sp)
    80001720:	00813023          	sd	s0,0(sp)
    80001724:	01010413          	addi	s0,sp,16
    80001728:	00050593          	mv	a1,a0
    return (int) syscall(THREAD_KILL, (uint64) handle);
    8000172c:	00000713          	li	a4,0
    80001730:	00000693          	li	a3,0
    80001734:	00000613          	li	a2,0
    80001738:	00800513          	li	a0,8
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	d54080e7          	jalr	-684(ra) # 80001490 <_Z7syscallmmmmm>
}
    80001744:	0005051b          	sext.w	a0,a0
    80001748:	00813083          	ld	ra,8(sp)
    8000174c:	00013403          	ld	s0,0(sp)
    80001750:	01010113          	addi	sp,sp,16
    80001754:	00008067          	ret

0000000080001758 <_Z8sem_openPP3Semj>:

int sem_open(sem_t *handle, unsigned init) {
    80001758:	ff010113          	addi	sp,sp,-16
    8000175c:	00113423          	sd	ra,8(sp)
    80001760:	00813023          	sd	s0,0(sp)
    80001764:	01010413          	addi	s0,sp,16
    return (int) syscall(SEM_OPEN, (uint64) handle, init);
    80001768:	00000713          	li	a4,0
    8000176c:	00000693          	li	a3,0
    80001770:	02059613          	slli	a2,a1,0x20
    80001774:	02065613          	srli	a2,a2,0x20
    80001778:	00050593          	mv	a1,a0
    8000177c:	00900513          	li	a0,9
    80001780:	00000097          	auipc	ra,0x0
    80001784:	d10080e7          	jalr	-752(ra) # 80001490 <_Z7syscallmmmmm>
}
    80001788:	0005051b          	sext.w	a0,a0
    8000178c:	00813083          	ld	ra,8(sp)
    80001790:	00013403          	ld	s0,0(sp)
    80001794:	01010113          	addi	sp,sp,16
    80001798:	00008067          	ret

000000008000179c <_Z9sem_closeP3Sem>:

int sem_close(sem_t id) {
    8000179c:	ff010113          	addi	sp,sp,-16
    800017a0:	00113423          	sd	ra,8(sp)
    800017a4:	00813023          	sd	s0,0(sp)
    800017a8:	01010413          	addi	s0,sp,16
    800017ac:	00050593          	mv	a1,a0
    return (int) syscall(SEM_CLOSE, (uint64) id);
    800017b0:	00000713          	li	a4,0
    800017b4:	00000693          	li	a3,0
    800017b8:	00000613          	li	a2,0
    800017bc:	00a00513          	li	a0,10
    800017c0:	00000097          	auipc	ra,0x0
    800017c4:	cd0080e7          	jalr	-816(ra) # 80001490 <_Z7syscallmmmmm>
}
    800017c8:	0005051b          	sext.w	a0,a0
    800017cc:	00813083          	ld	ra,8(sp)
    800017d0:	00013403          	ld	s0,0(sp)
    800017d4:	01010113          	addi	sp,sp,16
    800017d8:	00008067          	ret

00000000800017dc <_Z8sem_waitP3Sem>:

int sem_wait(sem_t id) {
    800017dc:	ff010113          	addi	sp,sp,-16
    800017e0:	00113423          	sd	ra,8(sp)
    800017e4:	00813023          	sd	s0,0(sp)
    800017e8:	01010413          	addi	s0,sp,16
    800017ec:	00050593          	mv	a1,a0
    return (int) syscall(SEM_WAIT, (uint64) id);
    800017f0:	00000713          	li	a4,0
    800017f4:	00000693          	li	a3,0
    800017f8:	00000613          	li	a2,0
    800017fc:	00b00513          	li	a0,11
    80001800:	00000097          	auipc	ra,0x0
    80001804:	c90080e7          	jalr	-880(ra) # 80001490 <_Z7syscallmmmmm>
}
    80001808:	0005051b          	sext.w	a0,a0
    8000180c:	00813083          	ld	ra,8(sp)
    80001810:	00013403          	ld	s0,0(sp)
    80001814:	01010113          	addi	sp,sp,16
    80001818:	00008067          	ret

000000008000181c <_Z10sem_signalP3Sem>:

int sem_signal(sem_t id) {
    8000181c:	ff010113          	addi	sp,sp,-16
    80001820:	00113423          	sd	ra,8(sp)
    80001824:	00813023          	sd	s0,0(sp)
    80001828:	01010413          	addi	s0,sp,16
    8000182c:	00050593          	mv	a1,a0
    return (int) syscall(SEM_SIGNAL, (uint64) id);
    80001830:	00000713          	li	a4,0
    80001834:	00000693          	li	a3,0
    80001838:	00000613          	li	a2,0
    8000183c:	00c00513          	li	a0,12
    80001840:	00000097          	auipc	ra,0x0
    80001844:	c50080e7          	jalr	-944(ra) # 80001490 <_Z7syscallmmmmm>
}
    80001848:	0005051b          	sext.w	a0,a0
    8000184c:	00813083          	ld	ra,8(sp)
    80001850:	00013403          	ld	s0,0(sp)
    80001854:	01010113          	addi	sp,sp,16
    80001858:	00008067          	ret

000000008000185c <_Z14sem_signal_allP3Sem>:

int sem_signal_all(sem_t id) {
    8000185c:	ff010113          	addi	sp,sp,-16
    80001860:	00113423          	sd	ra,8(sp)
    80001864:	00813023          	sd	s0,0(sp)
    80001868:	01010413          	addi	s0,sp,16
    8000186c:	00050593          	mv	a1,a0
    return (int) syscall(SIGNAL_ALL, (uint64) id);
    80001870:	00000713          	li	a4,0
    80001874:	00000693          	li	a3,0
    80001878:	00000613          	li	a2,0
    8000187c:	00d00513          	li	a0,13
    80001880:	00000097          	auipc	ra,0x0
    80001884:	c10080e7          	jalr	-1008(ra) # 80001490 <_Z7syscallmmmmm>
}
    80001888:	0005051b          	sext.w	a0,a0
    8000188c:	00813083          	ld	ra,8(sp)
    80001890:	00013403          	ld	s0,0(sp)
    80001894:	01010113          	addi	sp,sp,16
    80001898:	00008067          	ret

000000008000189c <_Z15signal_and_waitP3SemS0_>:

int signal_and_wait(sem_t signal, sem_t wait) {
    8000189c:	ff010113          	addi	sp,sp,-16
    800018a0:	00113423          	sd	ra,8(sp)
    800018a4:	00813023          	sd	s0,0(sp)
    800018a8:	01010413          	addi	s0,sp,16
    800018ac:	00058613          	mv	a2,a1
    return (int) syscall(SIGNAL_WAIT, (uint64) signal, (uint64) wait);
    800018b0:	00000713          	li	a4,0
    800018b4:	00000693          	li	a3,0
    800018b8:	00050593          	mv	a1,a0
    800018bc:	00e00513          	li	a0,14
    800018c0:	00000097          	auipc	ra,0x0
    800018c4:	bd0080e7          	jalr	-1072(ra) # 80001490 <_Z7syscallmmmmm>
}
    800018c8:	0005051b          	sext.w	a0,a0
    800018cc:	00813083          	ld	ra,8(sp)
    800018d0:	00013403          	ld	s0,0(sp)
    800018d4:	01010113          	addi	sp,sp,16
    800018d8:	00008067          	ret

00000000800018dc <_Z10time_sleepm>:

int time_sleep(time_t ms) {
    if (ms == 0) return -1;
    800018dc:	04050263          	beqz	a0,80001920 <_Z10time_sleepm+0x44>
int time_sleep(time_t ms) {
    800018e0:	ff010113          	addi	sp,sp,-16
    800018e4:	00113423          	sd	ra,8(sp)
    800018e8:	00813023          	sd	s0,0(sp)
    800018ec:	01010413          	addi	s0,sp,16
    800018f0:	00050593          	mv	a1,a0
    return (int) syscall(TIME_SLEEP, ms);
    800018f4:	00000713          	li	a4,0
    800018f8:	00000693          	li	a3,0
    800018fc:	00000613          	li	a2,0
    80001900:	00f00513          	li	a0,15
    80001904:	00000097          	auipc	ra,0x0
    80001908:	b8c080e7          	jalr	-1140(ra) # 80001490 <_Z7syscallmmmmm>
    8000190c:	0005051b          	sext.w	a0,a0
}
    80001910:	00813083          	ld	ra,8(sp)
    80001914:	00013403          	ld	s0,0(sp)
    80001918:	01010113          	addi	sp,sp,16
    8000191c:	00008067          	ret
    if (ms == 0) return -1;
    80001920:	fff00513          	li	a0,-1
}
    80001924:	00008067          	ret

0000000080001928 <_Z11thread_wakeP3TCB>:

int thread_wake(thread_t handle) {
    80001928:	ff010113          	addi	sp,sp,-16
    8000192c:	00113423          	sd	ra,8(sp)
    80001930:	00813023          	sd	s0,0(sp)
    80001934:	01010413          	addi	s0,sp,16
    80001938:	00050593          	mv	a1,a0
    return (int) syscall(THREAD_WAKE, (uint64) handle);
    8000193c:	00000713          	li	a4,0
    80001940:	00000693          	li	a3,0
    80001944:	00000613          	li	a2,0
    80001948:	01000513          	li	a0,16
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	b44080e7          	jalr	-1212(ra) # 80001490 <_Z7syscallmmmmm>
}
    80001954:	0005051b          	sext.w	a0,a0
    80001958:	00813083          	ld	ra,8(sp)
    8000195c:	00013403          	ld	s0,0(sp)
    80001960:	01010113          	addi	sp,sp,16
    80001964:	00008067          	ret

0000000080001968 <_Z4getcv>:

char getc() {
    80001968:	ff010113          	addi	sp,sp,-16
    8000196c:	00113423          	sd	ra,8(sp)
    80001970:	00813023          	sd	s0,0(sp)
    80001974:	01010413          	addi	s0,sp,16
    return (char) syscall(GETC);
    80001978:	00000713          	li	a4,0
    8000197c:	00000693          	li	a3,0
    80001980:	00000613          	li	a2,0
    80001984:	00000593          	li	a1,0
    80001988:	01100513          	li	a0,17
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	b04080e7          	jalr	-1276(ra) # 80001490 <_Z7syscallmmmmm>
}
    80001994:	0ff57513          	andi	a0,a0,255
    80001998:	00813083          	ld	ra,8(sp)
    8000199c:	00013403          	ld	s0,0(sp)
    800019a0:	01010113          	addi	sp,sp,16
    800019a4:	00008067          	ret

00000000800019a8 <_Z4putcc>:

void putc(char c) {
    800019a8:	ff010113          	addi	sp,sp,-16
    800019ac:	00113423          	sd	ra,8(sp)
    800019b0:	00813023          	sd	s0,0(sp)
    800019b4:	01010413          	addi	s0,sp,16
    800019b8:	00050593          	mv	a1,a0
    syscall(PUTC, c);
    800019bc:	00000713          	li	a4,0
    800019c0:	00000693          	li	a3,0
    800019c4:	00000613          	li	a2,0
    800019c8:	01200513          	li	a0,18
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	ac4080e7          	jalr	-1340(ra) # 80001490 <_Z7syscallmmmmm>
}
    800019d4:	00813083          	ld	ra,8(sp)
    800019d8:	00013403          	ld	s0,0(sp)
    800019dc:	01010113          	addi	sp,sp,16
    800019e0:	00008067          	ret

00000000800019e4 <_ZN3stm6strlenEPKc>:
#include "../h/string.hpp"
#include "../h/c_memory.hpp"
#include "../h/iostream.hpp"

int stm::strlen(const char *string) {
    800019e4:	ff010113          	addi	sp,sp,-16
    800019e8:	00813423          	sd	s0,8(sp)
    800019ec:	01010413          	addi	s0,sp,16
    800019f0:	00050713          	mv	a4,a0
    int size;
    for (size = 0; string[size]; size++);
    800019f4:	00000513          	li	a0,0
    800019f8:	00a707b3          	add	a5,a4,a0
    800019fc:	0007c783          	lbu	a5,0(a5)
    80001a00:	00078663          	beqz	a5,80001a0c <_ZN3stm6strlenEPKc+0x28>
    80001a04:	0015051b          	addiw	a0,a0,1
    80001a08:	ff1ff06f          	j	800019f8 <_ZN3stm6strlenEPKc+0x14>
    return size;
}
    80001a0c:	00813403          	ld	s0,8(sp)
    80001a10:	01010113          	addi	sp,sp,16
    80001a14:	00008067          	ret

0000000080001a18 <_ZN3stm6strcpyEPKcPc>:

char *stm::strcpy(const char *const src, char *const dst) {
    80001a18:	fe010113          	addi	sp,sp,-32
    80001a1c:	00113c23          	sd	ra,24(sp)
    80001a20:	00813823          	sd	s0,16(sp)
    80001a24:	00913423          	sd	s1,8(sp)
    80001a28:	01213023          	sd	s2,0(sp)
    80001a2c:	02010413          	addi	s0,sp,32
    80001a30:	00050913          	mv	s2,a0
    80001a34:	00058493          	mv	s1,a1
    memcpy(src, dst, strlen(src) + 1);
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	fac080e7          	jalr	-84(ra) # 800019e4 <_ZN3stm6strlenEPKc>
    80001a40:	0015061b          	addiw	a2,a0,1
    80001a44:	00048593          	mv	a1,s1
    80001a48:	00090513          	mv	a0,s2
    80001a4c:	00002097          	auipc	ra,0x2
    80001a50:	fbc080e7          	jalr	-68(ra) # 80003a08 <_Z6memcpyPKvS0_i>
    return dst;
}
    80001a54:	00048513          	mv	a0,s1
    80001a58:	01813083          	ld	ra,24(sp)
    80001a5c:	01013403          	ld	s0,16(sp)
    80001a60:	00813483          	ld	s1,8(sp)
    80001a64:	00013903          	ld	s2,0(sp)
    80001a68:	02010113          	addi	sp,sp,32
    80001a6c:	00008067          	ret

0000000080001a70 <_ZN3stm7strncpyEPcS0_i>:

void stm::strncpy(char *const src, char *const dst, int max_len) {
    80001a70:	fd010113          	addi	sp,sp,-48
    80001a74:	02113423          	sd	ra,40(sp)
    80001a78:	02813023          	sd	s0,32(sp)
    80001a7c:	00913c23          	sd	s1,24(sp)
    80001a80:	01213823          	sd	s2,16(sp)
    80001a84:	01313423          	sd	s3,8(sp)
    80001a88:	01413023          	sd	s4,0(sp)
    80001a8c:	03010413          	addi	s0,sp,48
    80001a90:	00050913          	mv	s2,a0
    80001a94:	00058993          	mv	s3,a1
    80001a98:	00060a13          	mv	s4,a2
    for (int i = 0; i < strlen(src) + 1; i++) {
    80001a9c:	00000493          	li	s1,0
    80001aa0:	00090513          	mv	a0,s2
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	f40080e7          	jalr	-192(ra) # 800019e4 <_ZN3stm6strlenEPKc>
    80001aac:	02954463          	blt	a0,s1,80001ad4 <_ZN3stm7strncpyEPcS0_i+0x64>
        if (i >= max_len) {
    80001ab0:	0144de63          	bge	s1,s4,80001acc <_ZN3stm7strncpyEPcS0_i+0x5c>
            dst[i] = '\0';
            return;
        }
        dst[i] = src[i];
    80001ab4:	009987b3          	add	a5,s3,s1
    80001ab8:	00990733          	add	a4,s2,s1
    80001abc:	00074703          	lbu	a4,0(a4)
    80001ac0:	00e78023          	sb	a4,0(a5)
    for (int i = 0; i < strlen(src) + 1; i++) {
    80001ac4:	0014849b          	addiw	s1,s1,1
    80001ac8:	fd9ff06f          	j	80001aa0 <_ZN3stm7strncpyEPcS0_i+0x30>
            dst[i] = '\0';
    80001acc:	009984b3          	add	s1,s3,s1
    80001ad0:	00048023          	sb	zero,0(s1)
    }
}
    80001ad4:	02813083          	ld	ra,40(sp)
    80001ad8:	02013403          	ld	s0,32(sp)
    80001adc:	01813483          	ld	s1,24(sp)
    80001ae0:	01013903          	ld	s2,16(sp)
    80001ae4:	00813983          	ld	s3,8(sp)
    80001ae8:	00013a03          	ld	s4,0(sp)
    80001aec:	03010113          	addi	sp,sp,48
    80001af0:	00008067          	ret

0000000080001af4 <_ZN3stm6strcatEPKcS1_>:

char *stm::strcat(const char *const base, const char *const tail) {
    80001af4:	fd010113          	addi	sp,sp,-48
    80001af8:	02113423          	sd	ra,40(sp)
    80001afc:	02813023          	sd	s0,32(sp)
    80001b00:	00913c23          	sd	s1,24(sp)
    80001b04:	01213823          	sd	s2,16(sp)
    80001b08:	01313423          	sd	s3,8(sp)
    80001b0c:	01413023          	sd	s4,0(sp)
    80001b10:	03010413          	addi	s0,sp,48
    80001b14:	00050a13          	mv	s4,a0
    80001b18:	00058913          	mv	s2,a1
    int base_len = strlen(base);
    80001b1c:	00000097          	auipc	ra,0x0
    80001b20:	ec8080e7          	jalr	-312(ra) # 800019e4 <_ZN3stm6strlenEPKc>
    80001b24:	00050993          	mv	s3,a0
    char *new_base = new char[base_len + strlen(tail) + 1];
    80001b28:	00090513          	mv	a0,s2
    80001b2c:	00000097          	auipc	ra,0x0
    80001b30:	eb8080e7          	jalr	-328(ra) # 800019e4 <_ZN3stm6strlenEPKc>
    80001b34:	0135053b          	addw	a0,a0,s3
    80001b38:	0015051b          	addiw	a0,a0,1
    80001b3c:	00002097          	auipc	ra,0x2
    80001b40:	450080e7          	jalr	1104(ra) # 80003f8c <_Znam>
    80001b44:	00050493          	mv	s1,a0
    strcpy(base, new_base);
    80001b48:	00050593          	mv	a1,a0
    80001b4c:	000a0513          	mv	a0,s4
    80001b50:	00000097          	auipc	ra,0x0
    80001b54:	ec8080e7          	jalr	-312(ra) # 80001a18 <_ZN3stm6strcpyEPKcPc>
    strcpy(tail, &new_base[base_len]);
    80001b58:	013485b3          	add	a1,s1,s3
    80001b5c:	00090513          	mv	a0,s2
    80001b60:	00000097          	auipc	ra,0x0
    80001b64:	eb8080e7          	jalr	-328(ra) # 80001a18 <_ZN3stm6strcpyEPKcPc>
    return new_base;
}
    80001b68:	00048513          	mv	a0,s1
    80001b6c:	02813083          	ld	ra,40(sp)
    80001b70:	02013403          	ld	s0,32(sp)
    80001b74:	01813483          	ld	s1,24(sp)
    80001b78:	01013903          	ld	s2,16(sp)
    80001b7c:	00813983          	ld	s3,8(sp)
    80001b80:	00013a03          	ld	s4,0(sp)
    80001b84:	03010113          	addi	sp,sp,48
    80001b88:	00008067          	ret

0000000080001b8c <_ZN3stm6strcmpEPKcS1_>:

int stm::strcmp(const char *str1, const char *str2) { //negative means str1 < str2 (a < b) (a < aa)
    80001b8c:	ff010113          	addi	sp,sp,-16
    80001b90:	00813423          	sd	s0,8(sp)
    80001b94:	01010413          	addi	s0,sp,16
    80001b98:	00050613          	mv	a2,a0
    int i;
    for (i = 0; str1[i] && str2[i]; i++) {
    80001b9c:	00000793          	li	a5,0
    80001ba0:	0080006f          	j	80001ba8 <_ZN3stm6strcmpEPKcS1_+0x1c>
    80001ba4:	0017879b          	addiw	a5,a5,1
    80001ba8:	00078513          	mv	a0,a5
    80001bac:	00f60733          	add	a4,a2,a5
    80001bb0:	00074703          	lbu	a4,0(a4)
    80001bb4:	00070e63          	beqz	a4,80001bd0 <_ZN3stm6strcmpEPKcS1_+0x44>
    80001bb8:	00f586b3          	add	a3,a1,a5
    80001bbc:	0006c683          	lbu	a3,0(a3)
    80001bc0:	00068863          	beqz	a3,80001bd0 <_ZN3stm6strcmpEPKcS1_+0x44>
        int difference = str1[i] - str2[i];
    80001bc4:	40d7053b          	subw	a0,a4,a3
        if (difference) return difference;
    80001bc8:	fcd70ee3          	beq	a4,a3,80001ba4 <_ZN3stm6strcmpEPKcS1_+0x18>
    80001bcc:	01c0006f          	j	80001be8 <_ZN3stm6strcmpEPKcS1_+0x5c>
    }
    if (!str1[i] && !str2[i]) return 0;
    80001bd0:	00071863          	bnez	a4,80001be0 <_ZN3stm6strcmpEPKcS1_+0x54>
    80001bd4:	00a585b3          	add	a1,a1,a0
    80001bd8:	0005c783          	lbu	a5,0(a1)
    80001bdc:	00078c63          	beqz	a5,80001bf4 <_ZN3stm6strcmpEPKcS1_+0x68>
    else if (str1[i]) return 1;
    80001be0:	00070e63          	beqz	a4,80001bfc <_ZN3stm6strcmpEPKcS1_+0x70>
    80001be4:	00100513          	li	a0,1
    else return -1;
}
    80001be8:	00813403          	ld	s0,8(sp)
    80001bec:	01010113          	addi	sp,sp,16
    80001bf0:	00008067          	ret
    if (!str1[i] && !str2[i]) return 0;
    80001bf4:	00000513          	li	a0,0
    80001bf8:	ff1ff06f          	j	80001be8 <_ZN3stm6strcmpEPKcS1_+0x5c>
    else return -1;
    80001bfc:	fff00513          	li	a0,-1
    80001c00:	fe9ff06f          	j	80001be8 <_ZN3stm6strcmpEPKcS1_+0x5c>

0000000080001c04 <_ZN3stm4ntosExPci>:

char *stm::ntos(long long number, char *buffer, int radix) {
    80001c04:	f7010113          	addi	sp,sp,-144
    80001c08:	08113423          	sd	ra,136(sp)
    80001c0c:	08813023          	sd	s0,128(sp)
    80001c10:	06913c23          	sd	s1,120(sp)
    80001c14:	09010413          	addi	s0,sp,144
    80001c18:	00058493          	mv	s1,a1
    if (radix < 2 || radix > 16) {
    80001c1c:	ffe6071b          	addiw	a4,a2,-2
    80001c20:	00e00793          	li	a5,14
    80001c24:	06e7ec63          	bltu	a5,a4,80001c9c <_ZN3stm4ntosExPci+0x98>
        buffer[0] = 0;
        return buffer;
    }
    if (number == 0) {
    80001c28:	06050e63          	beqz	a0,80001ca4 <_ZN3stm4ntosExPci+0xa0>
        buffer[0] = '0';
        buffer[1] = 0;
        return buffer;
    }
    char digits[100] = {};
    80001c2c:	f6043c23          	sd	zero,-136(s0)
    80001c30:	f8043023          	sd	zero,-128(s0)
    80001c34:	f8043423          	sd	zero,-120(s0)
    80001c38:	f8043823          	sd	zero,-112(s0)
    80001c3c:	f8043c23          	sd	zero,-104(s0)
    80001c40:	fa043023          	sd	zero,-96(s0)
    80001c44:	fa043423          	sd	zero,-88(s0)
    80001c48:	fa043823          	sd	zero,-80(s0)
    80001c4c:	fa043c23          	sd	zero,-72(s0)
    80001c50:	fc043023          	sd	zero,-64(s0)
    80001c54:	fc043423          	sd	zero,-56(s0)
    80001c58:	fc043823          	sd	zero,-48(s0)
    80001c5c:	fc042c23          	sw	zero,-40(s0)
    int i = 98;
    bool negative = number < 0;
    if (negative) number = -number;
    80001c60:	04054a63          	bltz	a0,80001cb4 <_ZN3stm4ntosExPci+0xb0>
    80001c64:	00050793          	mv	a5,a0
    80001c68:	06200693          	li	a3,98
    const char *av = "0123456789ABCDEF";
    while (number > 0) {
    80001c6c:	04f05863          	blez	a5,80001cbc <_ZN3stm4ntosExPci+0xb8>
        digits[i--] = av[(number % radix)];
    80001c70:	02c7e733          	rem	a4,a5,a2
    80001c74:	00006817          	auipc	a6,0x6
    80001c78:	3ac80813          	addi	a6,a6,940 # 80008020 <CONSOLE_STATUS+0x10>
    80001c7c:	01070733          	add	a4,a4,a6
    80001c80:	00074803          	lbu	a6,0(a4)
    80001c84:	fe040713          	addi	a4,s0,-32
    80001c88:	00d70733          	add	a4,a4,a3
    80001c8c:	f9070c23          	sb	a6,-104(a4)
        number /= radix;
    80001c90:	02c7c7b3          	div	a5,a5,a2
        digits[i--] = av[(number % radix)];
    80001c94:	fff6869b          	addiw	a3,a3,-1
    while (number > 0) {
    80001c98:	fd5ff06f          	j	80001c6c <_ZN3stm4ntosExPci+0x68>
        buffer[0] = 0;
    80001c9c:	00058023          	sb	zero,0(a1)
        return buffer;
    80001ca0:	0380006f          	j	80001cd8 <_ZN3stm4ntosExPci+0xd4>
        buffer[0] = '0';
    80001ca4:	03000793          	li	a5,48
    80001ca8:	00f58023          	sb	a5,0(a1)
        buffer[1] = 0;
    80001cac:	000580a3          	sb	zero,1(a1)
        return buffer;
    80001cb0:	0280006f          	j	80001cd8 <_ZN3stm4ntosExPci+0xd4>
    if (negative) number = -number;
    80001cb4:	40a007b3          	neg	a5,a0
    80001cb8:	fb1ff06f          	j	80001c68 <_ZN3stm4ntosExPci+0x64>
    }
    if (negative) digits[i--] = '-';
    80001cbc:	02054a63          	bltz	a0,80001cf0 <_ZN3stm4ntosExPci+0xec>
    strcpy(&digits[++i], buffer);
    80001cc0:	0016869b          	addiw	a3,a3,1
    80001cc4:	00048593          	mv	a1,s1
    80001cc8:	f7840513          	addi	a0,s0,-136
    80001ccc:	00d50533          	add	a0,a0,a3
    80001cd0:	00000097          	auipc	ra,0x0
    80001cd4:	d48080e7          	jalr	-696(ra) # 80001a18 <_ZN3stm6strcpyEPKcPc>
    return buffer;
}
    80001cd8:	00048513          	mv	a0,s1
    80001cdc:	08813083          	ld	ra,136(sp)
    80001ce0:	08013403          	ld	s0,128(sp)
    80001ce4:	07813483          	ld	s1,120(sp)
    80001ce8:	09010113          	addi	sp,sp,144
    80001cec:	00008067          	ret
    if (negative) digits[i--] = '-';
    80001cf0:	fe040793          	addi	a5,s0,-32
    80001cf4:	00d787b3          	add	a5,a5,a3
    80001cf8:	02d00713          	li	a4,45
    80001cfc:	f8e78c23          	sb	a4,-104(a5)
    80001d00:	fff6869b          	addiw	a3,a3,-1
    80001d04:	fbdff06f          	j	80001cc0 <_ZN3stm4ntosExPci+0xbc>

0000000080001d08 <_ZN3stm4utosEmPci>:

char *stm::utos(uint64 number, char *buffer, int radix) {
    80001d08:	f7010113          	addi	sp,sp,-144
    80001d0c:	08113423          	sd	ra,136(sp)
    80001d10:	08813023          	sd	s0,128(sp)
    80001d14:	06913c23          	sd	s1,120(sp)
    80001d18:	09010413          	addi	s0,sp,144
    80001d1c:	00058493          	mv	s1,a1
    if (radix < 2 || radix > 16) {
    80001d20:	ffe6071b          	addiw	a4,a2,-2
    80001d24:	00e00793          	li	a5,14
    80001d28:	04e7e263          	bltu	a5,a4,80001d6c <_ZN3stm4utosEmPci+0x64>
        buffer[0] = 0;
        return buffer;
    }
    if (number == 0) {
    80001d2c:	04050463          	beqz	a0,80001d74 <_ZN3stm4utosEmPci+0x6c>
        buffer[0] = '0';
        buffer[1] = 0;
        return buffer;
    }
    char digits[100] = {};
    80001d30:	f6043c23          	sd	zero,-136(s0)
    80001d34:	f8043023          	sd	zero,-128(s0)
    80001d38:	f8043423          	sd	zero,-120(s0)
    80001d3c:	f8043823          	sd	zero,-112(s0)
    80001d40:	f8043c23          	sd	zero,-104(s0)
    80001d44:	fa043023          	sd	zero,-96(s0)
    80001d48:	fa043423          	sd	zero,-88(s0)
    80001d4c:	fa043823          	sd	zero,-80(s0)
    80001d50:	fa043c23          	sd	zero,-72(s0)
    80001d54:	fc043023          	sd	zero,-64(s0)
    80001d58:	fc043423          	sd	zero,-56(s0)
    80001d5c:	fc043823          	sd	zero,-48(s0)
    80001d60:	fc042c23          	sw	zero,-40(s0)
    int i = 98;
    80001d64:	06200713          	li	a4,98
    80001d68:	0440006f          	j	80001dac <_ZN3stm4utosEmPci+0xa4>
        buffer[0] = 0;
    80001d6c:	00058023          	sb	zero,0(a1)
        return buffer;
    80001d70:	0580006f          	j	80001dc8 <_ZN3stm4utosEmPci+0xc0>
        buffer[0] = '0';
    80001d74:	03000793          	li	a5,48
    80001d78:	00f58023          	sb	a5,0(a1)
        buffer[1] = 0;
    80001d7c:	000580a3          	sb	zero,1(a1)
        return buffer;
    80001d80:	0480006f          	j	80001dc8 <_ZN3stm4utosEmPci+0xc0>
    const char *av = "0123456789ABCDEF";
    while (number > 0) {
        digits[i--] = av[(number % radix)];
    80001d84:	02c577b3          	remu	a5,a0,a2
    80001d88:	00006697          	auipc	a3,0x6
    80001d8c:	29868693          	addi	a3,a3,664 # 80008020 <CONSOLE_STATUS+0x10>
    80001d90:	00d787b3          	add	a5,a5,a3
    80001d94:	0007c683          	lbu	a3,0(a5)
    80001d98:	fe040793          	addi	a5,s0,-32
    80001d9c:	00e787b3          	add	a5,a5,a4
    80001da0:	f8d78c23          	sb	a3,-104(a5)
        number /= radix;
    80001da4:	02c55533          	divu	a0,a0,a2
        digits[i--] = av[(number % radix)];
    80001da8:	fff7071b          	addiw	a4,a4,-1
    while (number > 0) {
    80001dac:	fc051ce3          	bnez	a0,80001d84 <_ZN3stm4utosEmPci+0x7c>
    }
    strcpy(&digits[++i], buffer);
    80001db0:	0017071b          	addiw	a4,a4,1
    80001db4:	00048593          	mv	a1,s1
    80001db8:	f7840513          	addi	a0,s0,-136
    80001dbc:	00e50533          	add	a0,a0,a4
    80001dc0:	00000097          	auipc	ra,0x0
    80001dc4:	c58080e7          	jalr	-936(ra) # 80001a18 <_ZN3stm6strcpyEPKcPc>
    return buffer;
}
    80001dc8:	00048513          	mv	a0,s1
    80001dcc:	08813083          	ld	ra,136(sp)
    80001dd0:	08013403          	ld	s0,128(sp)
    80001dd4:	07813483          	ld	s1,120(sp)
    80001dd8:	09010113          	addi	sp,sp,144
    80001ddc:	00008067          	ret

0000000080001de0 <_ZN3stm6string4copyERKS0_>:

void stm::string::copy(const stm::string &string) {
    80001de0:	fe010113          	addi	sp,sp,-32
    80001de4:	00113c23          	sd	ra,24(sp)
    80001de8:	00813823          	sd	s0,16(sp)
    80001dec:	00913423          	sd	s1,8(sp)
    80001df0:	01213023          	sd	s2,0(sp)
    80001df4:	02010413          	addi	s0,sp,32
    80001df8:	00050493          	mv	s1,a0
    80001dfc:	00058913          	mv	s2,a1
    cout << 101;
    80001e00:	06500593          	li	a1,101
    80001e04:	00009517          	auipc	a0,0x9
    80001e08:	84453503          	ld	a0,-1980(a0) # 8000a648 <_GLOBAL_OFFSET_TABLE_+0x90>
    80001e0c:	00002097          	auipc	ra,0x2
    80001e10:	d24080e7          	jalr	-732(ra) # 80003b30 <_ZNK3stm7istreamlsEi>
    this->size = string.size;
    80001e14:	00092503          	lw	a0,0(s2)
    80001e18:	00a4a023          	sw	a0,0(s1)
    this->actual_string = this->size > string::SMALL_SIZE ? new char[this->size] : this->small_string;
    80001e1c:	01e00793          	li	a5,30
    80001e20:	02a7c863          	blt	a5,a0,80001e50 <_ZN3stm6string4copyERKS0_+0x70>
    80001e24:	01048593          	addi	a1,s1,16
    80001e28:	00b4b423          	sd	a1,8(s1)
    strcpy(string.actual_string, this->actual_string);
    80001e2c:	00893503          	ld	a0,8(s2)
    80001e30:	00000097          	auipc	ra,0x0
    80001e34:	be8080e7          	jalr	-1048(ra) # 80001a18 <_ZN3stm6strcpyEPKcPc>
}
    80001e38:	01813083          	ld	ra,24(sp)
    80001e3c:	01013403          	ld	s0,16(sp)
    80001e40:	00813483          	ld	s1,8(sp)
    80001e44:	00013903          	ld	s2,0(sp)
    80001e48:	02010113          	addi	sp,sp,32
    80001e4c:	00008067          	ret
    this->actual_string = this->size > string::SMALL_SIZE ? new char[this->size] : this->small_string;
    80001e50:	00002097          	auipc	ra,0x2
    80001e54:	13c080e7          	jalr	316(ra) # 80003f8c <_Znam>
    80001e58:	00050593          	mv	a1,a0
    80001e5c:	fcdff06f          	j	80001e28 <_ZN3stm6string4copyERKS0_+0x48>

0000000080001e60 <_ZN3stm6string4moveERS0_>:

void stm::string::move(stm::string &string) {
    80001e60:	fe010113          	addi	sp,sp,-32
    80001e64:	00113c23          	sd	ra,24(sp)
    80001e68:	00813823          	sd	s0,16(sp)
    80001e6c:	00913423          	sd	s1,8(sp)
    80001e70:	01213023          	sd	s2,0(sp)
    80001e74:	02010413          	addi	s0,sp,32
    80001e78:	00050913          	mv	s2,a0
    80001e7c:	00058493          	mv	s1,a1
    this->size = string.size;
    80001e80:	0005a783          	lw	a5,0(a1)
    80001e84:	00f52023          	sw	a5,0(a0)
    if(this->size > string::SMALL_SIZE)
    80001e88:	01e00713          	li	a4,30
    80001e8c:	02f75463          	bge	a4,a5,80001eb4 <_ZN3stm6string4moveERS0_+0x54>
        this->actual_string = string.actual_string;
    80001e90:	0085b783          	ld	a5,8(a1)
    80001e94:	00f53423          	sd	a5,8(a0)
    else
        this->actual_string = strcpy(string.actual_string, this->small_string);
    string.actual_string = nullptr;
    80001e98:	0004b423          	sd	zero,8(s1)
}
    80001e9c:	01813083          	ld	ra,24(sp)
    80001ea0:	01013403          	ld	s0,16(sp)
    80001ea4:	00813483          	ld	s1,8(sp)
    80001ea8:	00013903          	ld	s2,0(sp)
    80001eac:	02010113          	addi	sp,sp,32
    80001eb0:	00008067          	ret
        this->actual_string = strcpy(string.actual_string, this->small_string);
    80001eb4:	01050593          	addi	a1,a0,16
    80001eb8:	0084b503          	ld	a0,8(s1)
    80001ebc:	00000097          	auipc	ra,0x0
    80001ec0:	b5c080e7          	jalr	-1188(ra) # 80001a18 <_ZN3stm6strcpyEPKcPc>
    80001ec4:	00a93423          	sd	a0,8(s2)
    80001ec8:	fd1ff06f          	j	80001e98 <_ZN3stm6string4moveERS0_+0x38>

0000000080001ecc <_ZN3stm6stringC1Ec>:
    this->size = strlen(string);
    this->actual_string = new char[this->size + 1];
    strcpy(string, this->actual_string);
}

stm::string::string(char c) {
    80001ecc:	ff010113          	addi	sp,sp,-16
    80001ed0:	00813423          	sd	s0,8(sp)
    80001ed4:	01010413          	addi	s0,sp,16
    this->size = 1;
    80001ed8:	00100793          	li	a5,1
    80001edc:	00f52023          	sw	a5,0(a0)
    this->actual_string = this->small_string;
    80001ee0:	01050793          	addi	a5,a0,16
    80001ee4:	00f53423          	sd	a5,8(a0)
    this->actual_string[0] = c;
    80001ee8:	00b50823          	sb	a1,16(a0)
    this->actual_string[1] = 0;
    80001eec:	000508a3          	sb	zero,17(a0)
}
    80001ef0:	00813403          	ld	s0,8(sp)
    80001ef4:	01010113          	addi	sp,sp,16
    80001ef8:	00008067          	ret

0000000080001efc <_ZN3stm6stringC1Ex>:

stm::string::string(long long number) {
    80001efc:	fe010113          	addi	sp,sp,-32
    80001f00:	00113c23          	sd	ra,24(sp)
    80001f04:	00813823          	sd	s0,16(sp)
    80001f08:	00913423          	sd	s1,8(sp)
    80001f0c:	02010413          	addi	s0,sp,32
    80001f10:	00050493          	mv	s1,a0
    80001f14:	00058513          	mv	a0,a1
    this->actual_string = ntos(number, this->small_string, 10);
    80001f18:	00a00613          	li	a2,10
    80001f1c:	01048593          	addi	a1,s1,16
    80001f20:	00000097          	auipc	ra,0x0
    80001f24:	ce4080e7          	jalr	-796(ra) # 80001c04 <_ZN3stm4ntosExPci>
    80001f28:	00a4b423          	sd	a0,8(s1)
    this->size = strlen(this->actual_string);
    80001f2c:	00000097          	auipc	ra,0x0
    80001f30:	ab8080e7          	jalr	-1352(ra) # 800019e4 <_ZN3stm6strlenEPKc>
    80001f34:	00a4a023          	sw	a0,0(s1)
}
    80001f38:	01813083          	ld	ra,24(sp)
    80001f3c:	01013403          	ld	s0,16(sp)
    80001f40:	00813483          	ld	s1,8(sp)
    80001f44:	02010113          	addi	sp,sp,32
    80001f48:	00008067          	ret

0000000080001f4c <_ZN3stm6stringC1Ei>:

stm::string::string(int number) : string((long long) number) {}
    80001f4c:	ff010113          	addi	sp,sp,-16
    80001f50:	00113423          	sd	ra,8(sp)
    80001f54:	00813023          	sd	s0,0(sp)
    80001f58:	01010413          	addi	s0,sp,16
    80001f5c:	00000097          	auipc	ra,0x0
    80001f60:	fa0080e7          	jalr	-96(ra) # 80001efc <_ZN3stm6stringC1Ex>
    80001f64:	00813083          	ld	ra,8(sp)
    80001f68:	00013403          	ld	s0,0(sp)
    80001f6c:	01010113          	addi	sp,sp,16
    80001f70:	00008067          	ret

0000000080001f74 <_ZN3stm6stringC1Em>:

stm::string::string(uint64 number) {
    80001f74:	fe010113          	addi	sp,sp,-32
    80001f78:	00113c23          	sd	ra,24(sp)
    80001f7c:	00813823          	sd	s0,16(sp)
    80001f80:	00913423          	sd	s1,8(sp)
    80001f84:	02010413          	addi	s0,sp,32
    80001f88:	00050493          	mv	s1,a0
    80001f8c:	00058513          	mv	a0,a1
    this->actual_string = utos(number, this->small_string, 10);
    80001f90:	00a00613          	li	a2,10
    80001f94:	01048593          	addi	a1,s1,16
    80001f98:	00000097          	auipc	ra,0x0
    80001f9c:	d70080e7          	jalr	-656(ra) # 80001d08 <_ZN3stm4utosEmPci>
    80001fa0:	00a4b423          	sd	a0,8(s1)
    this->size = strlen(this->actual_string);
    80001fa4:	00000097          	auipc	ra,0x0
    80001fa8:	a40080e7          	jalr	-1472(ra) # 800019e4 <_ZN3stm6strlenEPKc>
    80001fac:	00a4a023          	sw	a0,0(s1)
}
    80001fb0:	01813083          	ld	ra,24(sp)
    80001fb4:	01013403          	ld	s0,16(sp)
    80001fb8:	00813483          	ld	s1,8(sp)
    80001fbc:	02010113          	addi	sp,sp,32
    80001fc0:	00008067          	ret

0000000080001fc4 <_ZN3stm6stringaSERKS0_>:

stm::string &stm::string::operator=(const stm::string &string) {
    80001fc4:	fe010113          	addi	sp,sp,-32
    80001fc8:	00113c23          	sd	ra,24(sp)
    80001fcc:	00813823          	sd	s0,16(sp)
    80001fd0:	00913423          	sd	s1,8(sp)
    80001fd4:	01213023          	sd	s2,0(sp)
    80001fd8:	02010413          	addi	s0,sp,32
    80001fdc:	00050493          	mv	s1,a0
    if (this == &string) return *this;
    80001fe0:	02b50463          	beq	a0,a1,80002008 <_ZN3stm6stringaSERKS0_+0x44>
    80001fe4:	00058913          	mv	s2,a1
    private:
        void copy(const string &);

        void move(string &);

        void unexist() { delete[] this->actual_string; }
    80001fe8:	00853503          	ld	a0,8(a0)
    80001fec:	00050663          	beqz	a0,80001ff8 <_ZN3stm6stringaSERKS0_+0x34>
    80001ff0:	00002097          	auipc	ra,0x2
    80001ff4:	0b8080e7          	jalr	184(ra) # 800040a8 <_ZdaPv>
    this->unexist();
    this->copy(string);
    80001ff8:	00090593          	mv	a1,s2
    80001ffc:	00048513          	mv	a0,s1
    80002000:	00000097          	auipc	ra,0x0
    80002004:	de0080e7          	jalr	-544(ra) # 80001de0 <_ZN3stm6string4copyERKS0_>
    return *this;
}
    80002008:	00048513          	mv	a0,s1
    8000200c:	01813083          	ld	ra,24(sp)
    80002010:	01013403          	ld	s0,16(sp)
    80002014:	00813483          	ld	s1,8(sp)
    80002018:	00013903          	ld	s2,0(sp)
    8000201c:	02010113          	addi	sp,sp,32
    80002020:	00008067          	ret

0000000080002024 <_ZN3stm6stringaSEOS0_>:

stm::string &stm::string::operator=(stm::string &&string) noexcept {
    80002024:	fe010113          	addi	sp,sp,-32
    80002028:	00113c23          	sd	ra,24(sp)
    8000202c:	00813823          	sd	s0,16(sp)
    80002030:	00913423          	sd	s1,8(sp)
    80002034:	01213023          	sd	s2,0(sp)
    80002038:	02010413          	addi	s0,sp,32
    8000203c:	00050493          	mv	s1,a0
    if (this == &string) return *this;
    80002040:	02b50463          	beq	a0,a1,80002068 <_ZN3stm6stringaSEOS0_+0x44>
    80002044:	00058913          	mv	s2,a1
    80002048:	00853503          	ld	a0,8(a0)
    8000204c:	00050663          	beqz	a0,80002058 <_ZN3stm6stringaSEOS0_+0x34>
    80002050:	00002097          	auipc	ra,0x2
    80002054:	058080e7          	jalr	88(ra) # 800040a8 <_ZdaPv>
    this->unexist();
    this->move(string);
    80002058:	00090593          	mv	a1,s2
    8000205c:	00048513          	mv	a0,s1
    80002060:	00000097          	auipc	ra,0x0
    80002064:	e00080e7          	jalr	-512(ra) # 80001e60 <_ZN3stm6string4moveERS0_>
    return *this;
}
    80002068:	00048513          	mv	a0,s1
    8000206c:	01813083          	ld	ra,24(sp)
    80002070:	01013403          	ld	s0,16(sp)
    80002074:	00813483          	ld	s1,8(sp)
    80002078:	00013903          	ld	s2,0(sp)
    8000207c:	02010113          	addi	sp,sp,32
    80002080:	00008067          	ret

0000000080002084 <_ZN3stm6string15write_and_countEPKcPci>:

inline bool stm::operator<(const stm::string &string1, const stm::string &string2) {
    return stm::strcmp(string1.actual_string, string2.actual_string) < 0;
}

int stm::string::write_and_count(const char *src, char *dst, int n) {
    80002084:	ff010113          	addi	sp,sp,-16
    80002088:	00813423          	sd	s0,8(sp)
    8000208c:	01010413          	addi	s0,sp,16
    80002090:	00050693          	mv	a3,a0
    int i;
    for (i = 0; src[i]; i++) {
    80002094:	00000513          	li	a0,0
    80002098:	00a68733          	add	a4,a3,a0
    8000209c:	00074703          	lbu	a4,0(a4)
    800020a0:	00070c63          	beqz	a4,800020b8 <_ZN3stm6string15write_and_countEPKcPci+0x34>
        if (i >= n) return -1;
    800020a4:	02c55463          	bge	a0,a2,800020cc <_ZN3stm6string15write_and_countEPKcPci+0x48>
        dst[i] = src[i];
    800020a8:	00a587b3          	add	a5,a1,a0
    800020ac:	00e78023          	sb	a4,0(a5)
    for (i = 0; src[i]; i++) {
    800020b0:	0015051b          	addiw	a0,a0,1
    800020b4:	fe5ff06f          	j	80002098 <_ZN3stm6string15write_and_countEPKcPci+0x14>
    }
    dst[i] = src[i];
    800020b8:	00a587b3          	add	a5,a1,a0
    800020bc:	00e78023          	sb	a4,0(a5)
    return i;
    800020c0:	00813403          	ld	s0,8(sp)
    800020c4:	01010113          	addi	sp,sp,16
    800020c8:	00008067          	ret
        if (i >= n) return -1;
    800020cc:	fff00513          	li	a0,-1
    800020d0:	ff1ff06f          	j	800020c0 <_ZN3stm6string15write_and_countEPKcPci+0x3c>

00000000800020d4 <_ZN3stm6stringC1EPKc>:
stm::string::string(const char *string) {
    800020d4:	fd010113          	addi	sp,sp,-48
    800020d8:	02113423          	sd	ra,40(sp)
    800020dc:	02813023          	sd	s0,32(sp)
    800020e0:	00913c23          	sd	s1,24(sp)
    800020e4:	01213823          	sd	s2,16(sp)
    800020e8:	01313423          	sd	s3,8(sp)
    800020ec:	03010413          	addi	s0,sp,48
    800020f0:	00050493          	mv	s1,a0
    800020f4:	00058913          	mv	s2,a1
    this->size = string::write_and_count(string, this->small_string, SMALL_SIZE);
    800020f8:	01050993          	addi	s3,a0,16
    800020fc:	01e00613          	li	a2,30
    80002100:	00098593          	mv	a1,s3
    80002104:	00090513          	mv	a0,s2
    80002108:	00000097          	auipc	ra,0x0
    8000210c:	f7c080e7          	jalr	-132(ra) # 80002084 <_ZN3stm6string15write_and_countEPKcPci>
    80002110:	00a4a023          	sw	a0,0(s1)
    if (this->size != -1) {
    80002114:	fff00793          	li	a5,-1
    80002118:	02f50263          	beq	a0,a5,8000213c <_ZN3stm6stringC1EPKc+0x68>
        this->actual_string = this->small_string;
    8000211c:	0134b423          	sd	s3,8(s1)
}
    80002120:	02813083          	ld	ra,40(sp)
    80002124:	02013403          	ld	s0,32(sp)
    80002128:	01813483          	ld	s1,24(sp)
    8000212c:	01013903          	ld	s2,16(sp)
    80002130:	00813983          	ld	s3,8(sp)
    80002134:	03010113          	addi	sp,sp,48
    80002138:	00008067          	ret
    this->size = strlen(string);
    8000213c:	00090513          	mv	a0,s2
    80002140:	00000097          	auipc	ra,0x0
    80002144:	8a4080e7          	jalr	-1884(ra) # 800019e4 <_ZN3stm6strlenEPKc>
    80002148:	00a4a023          	sw	a0,0(s1)
    this->actual_string = new char[this->size + 1];
    8000214c:	0015051b          	addiw	a0,a0,1
    80002150:	00002097          	auipc	ra,0x2
    80002154:	e3c080e7          	jalr	-452(ra) # 80003f8c <_Znam>
    80002158:	00050593          	mv	a1,a0
    8000215c:	00a4b423          	sd	a0,8(s1)
    strcpy(string, this->actual_string);
    80002160:	00090513          	mv	a0,s2
    80002164:	00000097          	auipc	ra,0x0
    80002168:	8b4080e7          	jalr	-1868(ra) # 80001a18 <_ZN3stm6strcpyEPKcPc>
    8000216c:	fb5ff06f          	j	80002120 <_ZN3stm6stringC1EPKc+0x4c>

0000000080002170 <_ZN3stmplERKNS_6stringES2_>:
stm::string &stm::operator+(const stm::string &string1, const stm::string &string2) {
    80002170:	fe010113          	addi	sp,sp,-32
    80002174:	00113c23          	sd	ra,24(sp)
    80002178:	00813823          	sd	s0,16(sp)
    8000217c:	00913423          	sd	s1,8(sp)
    80002180:	01213023          	sd	s2,0(sp)
    80002184:	02010413          	addi	s0,sp,32
    return *(new stm::string(stm::strcat(string1.actual_string, string2.actual_string)));
    80002188:	0085b583          	ld	a1,8(a1)
    8000218c:	00853503          	ld	a0,8(a0)
    80002190:	00000097          	auipc	ra,0x0
    80002194:	964080e7          	jalr	-1692(ra) # 80001af4 <_ZN3stm6strcatEPKcS1_>
    80002198:	00050913          	mv	s2,a0
    8000219c:	03000513          	li	a0,48
    800021a0:	00002097          	auipc	ra,0x2
    800021a4:	dc4080e7          	jalr	-572(ra) # 80003f64 <_Znwm>
    800021a8:	00050493          	mv	s1,a0
    800021ac:	00090593          	mv	a1,s2
    800021b0:	00000097          	auipc	ra,0x0
    800021b4:	f24080e7          	jalr	-220(ra) # 800020d4 <_ZN3stm6stringC1EPKc>
    800021b8:	0200006f          	j	800021d8 <_ZN3stmplERKNS_6stringES2_+0x68>
    800021bc:	00050913          	mv	s2,a0
    800021c0:	00048513          	mv	a0,s1
    800021c4:	00002097          	auipc	ra,0x2
    800021c8:	df0080e7          	jalr	-528(ra) # 80003fb4 <_ZdlPv>
    800021cc:	00090513          	mv	a0,s2
    800021d0:	00009097          	auipc	ra,0x9
    800021d4:	668080e7          	jalr	1640(ra) # 8000b838 <_Unwind_Resume>
}
    800021d8:	00048513          	mv	a0,s1
    800021dc:	01813083          	ld	ra,24(sp)
    800021e0:	01013403          	ld	s0,16(sp)
    800021e4:	00813483          	ld	s1,8(sp)
    800021e8:	00013903          	ld	s2,0(sp)
    800021ec:	02010113          	addi	sp,sp,32
    800021f0:	00008067          	ret

00000000800021f4 <_ZN3stm6stringpLERKS0_>:
stm::string &stm::string::operator+=(const stm::string &string) {
    800021f4:	fe010113          	addi	sp,sp,-32
    800021f8:	00113c23          	sd	ra,24(sp)
    800021fc:	00813823          	sd	s0,16(sp)
    80002200:	00913423          	sd	s1,8(sp)
    80002204:	02010413          	addi	s0,sp,32
    80002208:	00050493          	mv	s1,a0
    *this = *this + string;
    8000220c:	00000097          	auipc	ra,0x0
    80002210:	f64080e7          	jalr	-156(ra) # 80002170 <_ZN3stmplERKNS_6stringES2_>
    80002214:	00050593          	mv	a1,a0
    80002218:	00048513          	mv	a0,s1
    8000221c:	00000097          	auipc	ra,0x0
    80002220:	da8080e7          	jalr	-600(ra) # 80001fc4 <_ZN3stm6stringaSERKS0_>
}
    80002224:	00048513          	mv	a0,s1
    80002228:	01813083          	ld	ra,24(sp)
    8000222c:	01013403          	ld	s0,16(sp)
    80002230:	00813483          	ld	s1,8(sp)
    80002234:	02010113          	addi	sp,sp,32
    80002238:	00008067          	ret

000000008000223c <_ZN3Sem9_sem_openEPPS_j>:
#include "../h/c_semaphore.hpp"
#include "../h/c_thread.hpp"
#include "../h/scheduler.hpp"

int Sem::_sem_open(sem_t *handle, unsigned init) {
    8000223c:	fd010113          	addi	sp,sp,-48
    80002240:	02113423          	sd	ra,40(sp)
    80002244:	02813023          	sd	s0,32(sp)
    80002248:	00913c23          	sd	s1,24(sp)
    8000224c:	01213823          	sd	s2,16(sp)
    80002250:	01313423          	sd	s3,8(sp)
    80002254:	03010413          	addi	s0,sp,48
    80002258:	00050913          	mv	s2,a0
    8000225c:	00058993          	mv	s3,a1
    sem_t semaphore = (sem_t) Allocator::_mem_alloc(sizeof(Sem));
    80002260:	02000513          	li	a0,32
    80002264:	00001097          	auipc	ra,0x1
    80002268:	4cc080e7          	jalr	1228(ra) # 80003730 <_ZN9Allocator10_mem_allocEm>
    if (!semaphore) {
    8000226c:	02050e63          	beqz	a0,800022a8 <_ZN3Sem9_sem_openEPPS_j+0x6c>
    80002270:	00050493          	mv	s1,a0
        return 1;
    }
    semaphore->count = init;
    80002274:	01352023          	sw	s3,0(a0)
    semaphore->blocked.init();
    80002278:	00850513          	addi	a0,a0,8
    8000227c:	00000097          	auipc	ra,0x0
    80002280:	250080e7          	jalr	592(ra) # 800024cc <_ZN3stm14CircularBufferIP3TCBE4initEv>
    *handle = semaphore;
    80002284:	00993023          	sd	s1,0(s2)
    return 0;
    80002288:	00000513          	li	a0,0
}
    8000228c:	02813083          	ld	ra,40(sp)
    80002290:	02013403          	ld	s0,32(sp)
    80002294:	01813483          	ld	s1,24(sp)
    80002298:	01013903          	ld	s2,16(sp)
    8000229c:	00813983          	ld	s3,8(sp)
    800022a0:	03010113          	addi	sp,sp,48
    800022a4:	00008067          	ret
        return 1;
    800022a8:	00100513          	li	a0,1
    800022ac:	fe1ff06f          	j	8000228c <_ZN3Sem9_sem_openEPPS_j+0x50>

00000000800022b0 <_ZN3Sem11_sem_signalEPS_>:
    }
    return ret;
}

int Sem::_sem_signal(sem_t id) {
    if (!id) return 1;
    800022b0:	06050263          	beqz	a0,80002314 <_ZN3Sem11_sem_signalEPS_+0x64>
    800022b4:	00050793          	mv	a5,a0

        T get();

        T &peek();

        inline bool is_empty() const { return this->size == 0; }
    800022b8:	01852503          	lw	a0,24(a0)
    if (!id->blocked.is_empty()) {
    800022bc:	00051a63          	bnez	a0,800022d0 <_ZN3Sem11_sem_signalEPS_+0x20>
        thread_t next = id->blocked.get();
        next->run();
        Scheduler::put(next);
        TCB::_thread_dispatch();
    } else {
        id->count++;
    800022c0:	0007a703          	lw	a4,0(a5)
    800022c4:	0017071b          	addiw	a4,a4,1
    800022c8:	00e7a023          	sw	a4,0(a5)
    800022cc:	00008067          	ret
int Sem::_sem_signal(sem_t id) {
    800022d0:	ff010113          	addi	sp,sp,-16
    800022d4:	00113423          	sd	ra,8(sp)
    800022d8:	00813023          	sd	s0,0(sp)
    800022dc:	01010413          	addi	s0,sp,16
        thread_t next = id->blocked.get();
    800022e0:	00878513          	addi	a0,a5,8
    800022e4:	00000097          	auipc	ra,0x0
    800022e8:	238080e7          	jalr	568(ra) # 8000251c <_ZN3stm14CircularBufferIP3TCBE3getEv>

    bool is_joined() const { return this->status == JOINED; }

    bool is_finished() const { return this->status == FINISHED; }

    void run() { this->status = RUNNABLE; }
    800022ec:	04052823          	sw	zero,80(a0)
        Scheduler::put(next);
    800022f0:	00002097          	auipc	ra,0x2
    800022f4:	73c080e7          	jalr	1852(ra) # 80004a2c <_ZN9Scheduler3putEP3TCB>
        TCB::_thread_dispatch();
    800022f8:	00003097          	auipc	ra,0x3
    800022fc:	f30080e7          	jalr	-208(ra) # 80005228 <_ZN3TCB16_thread_dispatchEv>
    }
    return 0;
    80002300:	00000513          	li	a0,0
}
    80002304:	00813083          	ld	ra,8(sp)
    80002308:	00013403          	ld	s0,0(sp)
    8000230c:	01010113          	addi	sp,sp,16
    80002310:	00008067          	ret
    if (!id) return 1;
    80002314:	00100513          	li	a0,1
}
    80002318:	00008067          	ret

000000008000231c <_ZN3Sem15_sem_signal_allEPS_>:

int Sem::_sem_signal_all(Sem * id) {
    8000231c:	fe010113          	addi	sp,sp,-32
    80002320:	00113c23          	sd	ra,24(sp)
    80002324:	00813823          	sd	s0,16(sp)
    80002328:	00913423          	sd	s1,8(sp)
    8000232c:	02010413          	addi	s0,sp,32
    80002330:	00050493          	mv	s1,a0
    if (!id) return 1;
    80002334:	02050863          	beqz	a0,80002364 <_ZN3Sem15_sem_signal_allEPS_+0x48>
    80002338:	0184a503          	lw	a0,24(s1)
    while (!id->blocked.is_empty()) {
    8000233c:	02050663          	beqz	a0,80002368 <_ZN3Sem15_sem_signal_allEPS_+0x4c>
        thread_t next = id->blocked.get();
    80002340:	00848513          	addi	a0,s1,8
    80002344:	00000097          	auipc	ra,0x0
    80002348:	1d8080e7          	jalr	472(ra) # 8000251c <_ZN3stm14CircularBufferIP3TCBE3getEv>
        Scheduler::put(next);
    8000234c:	00002097          	auipc	ra,0x2
    80002350:	6e0080e7          	jalr	1760(ra) # 80004a2c <_ZN9Scheduler3putEP3TCB>
        id->count++;
    80002354:	0004a783          	lw	a5,0(s1)
    80002358:	0017879b          	addiw	a5,a5,1
    8000235c:	00f4a023          	sw	a5,0(s1)
    while (!id->blocked.is_empty()) {
    80002360:	fd9ff06f          	j	80002338 <_ZN3Sem15_sem_signal_allEPS_+0x1c>
    if (!id) return 1;
    80002364:	00100513          	li	a0,1
    }
    return 0;
}
    80002368:	01813083          	ld	ra,24(sp)
    8000236c:	01013403          	ld	s0,16(sp)
    80002370:	00813483          	ld	s1,8(sp)
    80002374:	02010113          	addi	sp,sp,32
    80002378:	00008067          	ret

000000008000237c <_ZN3Sem10_sem_closeEPS_>:
int Sem::_sem_close(sem_t id) {
    8000237c:	fe010113          	addi	sp,sp,-32
    80002380:	00113c23          	sd	ra,24(sp)
    80002384:	00813823          	sd	s0,16(sp)
    80002388:	00913423          	sd	s1,8(sp)
    8000238c:	02010413          	addi	s0,sp,32
    80002390:	00050493          	mv	s1,a0
    if (!id) return 1;
    80002394:	04050a63          	beqz	a0,800023e8 <_ZN3Sem10_sem_closeEPS_+0x6c>
    80002398:	0184a783          	lw	a5,24(s1)
    while (!id->blocked.is_empty()) {
    8000239c:	00078e63          	beqz	a5,800023b8 <_ZN3Sem10_sem_closeEPS_+0x3c>
        thread_t next = id->blocked.get();
    800023a0:	00848513          	addi	a0,s1,8
    800023a4:	00000097          	auipc	ra,0x0
    800023a8:	178080e7          	jalr	376(ra) # 8000251c <_ZN3stm14CircularBufferIP3TCBE3getEv>
        Scheduler::put(next);
    800023ac:	00002097          	auipc	ra,0x2
    800023b0:	680080e7          	jalr	1664(ra) # 80004a2c <_ZN9Scheduler3putEP3TCB>
    while (!id->blocked.is_empty()) {
    800023b4:	fe5ff06f          	j	80002398 <_ZN3Sem10_sem_closeEPS_+0x1c>
    id->blocked.destroy();
    800023b8:	00848513          	addi	a0,s1,8
    800023bc:	00000097          	auipc	ra,0x0
    800023c0:	1ac080e7          	jalr	428(ra) # 80002568 <_ZN3stm14CircularBufferIP3TCBE7destroyEv>
    if (Allocator::_mem_free(id)) return 2;
    800023c4:	00048513          	mv	a0,s1
    800023c8:	00001097          	auipc	ra,0x1
    800023cc:	424080e7          	jalr	1060(ra) # 800037ec <_ZN9Allocator9_mem_freeEPKv>
    800023d0:	02051063          	bnez	a0,800023f0 <_ZN3Sem10_sem_closeEPS_+0x74>
}
    800023d4:	01813083          	ld	ra,24(sp)
    800023d8:	01013403          	ld	s0,16(sp)
    800023dc:	00813483          	ld	s1,8(sp)
    800023e0:	02010113          	addi	sp,sp,32
    800023e4:	00008067          	ret
    if (!id) return 1;
    800023e8:	00100513          	li	a0,1
    800023ec:	fe9ff06f          	j	800023d4 <_ZN3Sem10_sem_closeEPS_+0x58>
    if (Allocator::_mem_free(id)) return 2;
    800023f0:	00200513          	li	a0,2
    800023f4:	fe1ff06f          	j	800023d4 <_ZN3Sem10_sem_closeEPS_+0x58>

00000000800023f8 <_ZN3Sem9_sem_waitEPS_>:
    if (!id) return 1;
    800023f8:	08050663          	beqz	a0,80002484 <_ZN3Sem9_sem_waitEPS_+0x8c>
    if (id->count == 0) {
    800023fc:	00052783          	lw	a5,0(a0)
    80002400:	00078a63          	beqz	a5,80002414 <_ZN3Sem9_sem_waitEPS_+0x1c>
        id->count--;
    80002404:	fff7879b          	addiw	a5,a5,-1
    80002408:	00f52023          	sw	a5,0(a0)
    int ret = 0;
    8000240c:	00000513          	li	a0,0
    80002410:	00008067          	ret
int Sem::_sem_wait(sem_t id) {
    80002414:	fe010113          	addi	sp,sp,-32
    80002418:	00113c23          	sd	ra,24(sp)
    8000241c:	00813823          	sd	s0,16(sp)
    80002420:	00913423          	sd	s1,8(sp)
    80002424:	02010413          	addi	s0,sp,32
        TCB::running->block();
    80002428:	00008497          	auipc	s1,0x8
    8000242c:	2004b483          	ld	s1,512(s1) # 8000a628 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002430:	0004b583          	ld	a1,0(s1)

    void block() { this->status = BLOCKED; }
    80002434:	00100793          	li	a5,1
    80002438:	04f5a823          	sw	a5,80(a1)
        id->blocked.put(TCB::running);
    8000243c:	00850513          	addi	a0,a0,8
    80002440:	00000097          	auipc	ra,0x0
    80002444:	200080e7          	jalr	512(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
        TCB::_thread_dispatch();
    80002448:	00003097          	auipc	ra,0x3
    8000244c:	de0080e7          	jalr	-544(ra) # 80005228 <_ZN3TCB16_thread_dispatchEv>
        if (TCB::running->is_blocked()) {
    80002450:	0004b783          	ld	a5,0(s1)
    bool is_blocked() const { return this->status == BLOCKED; }
    80002454:	0507a683          	lw	a3,80(a5)
    80002458:	00100713          	li	a4,1
    8000245c:	00e68e63          	beq	a3,a4,80002478 <_ZN3Sem9_sem_waitEPS_+0x80>
    int ret = 0;
    80002460:	00000513          	li	a0,0
}
    80002464:	01813083          	ld	ra,24(sp)
    80002468:	01013403          	ld	s0,16(sp)
    8000246c:	00813483          	ld	s1,8(sp)
    80002470:	02010113          	addi	sp,sp,32
    80002474:	00008067          	ret
    void run() { this->status = RUNNABLE; }
    80002478:	0407a823          	sw	zero,80(a5)
            ret = -1;
    8000247c:	fff00513          	li	a0,-1
    80002480:	fe5ff06f          	j	80002464 <_ZN3Sem9_sem_waitEPS_+0x6c>
    if (!id) return 1;
    80002484:	00100513          	li	a0,1
}
    80002488:	00008067          	ret

000000008000248c <_ZN3Sem16_sem_signal_waitEPS_S0_>:

int Sem::_sem_signal_wait(Sem *id1, Sem* id2) {
    8000248c:	fe010113          	addi	sp,sp,-32
    80002490:	00113c23          	sd	ra,24(sp)
    80002494:	00813823          	sd	s0,16(sp)
    80002498:	00913423          	sd	s1,8(sp)
    8000249c:	02010413          	addi	s0,sp,32
    800024a0:	00058493          	mv	s1,a1
    _sem_signal(id1);
    800024a4:	00000097          	auipc	ra,0x0
    800024a8:	e0c080e7          	jalr	-500(ra) # 800022b0 <_ZN3Sem11_sem_signalEPS_>
    return _sem_wait(id2);
    800024ac:	00048513          	mv	a0,s1
    800024b0:	00000097          	auipc	ra,0x0
    800024b4:	f48080e7          	jalr	-184(ra) # 800023f8 <_ZN3Sem9_sem_waitEPS_>
}
    800024b8:	01813083          	ld	ra,24(sp)
    800024bc:	01013403          	ld	s0,16(sp)
    800024c0:	00813483          	ld	s1,8(sp)
    800024c4:	02010113          	addi	sp,sp,32
    800024c8:	00008067          	ret

00000000800024cc <_ZN3stm14CircularBufferIP3TCBE4initEv>:
        int capacity;
    };
}

template<typename T>
void stm::CircularBuffer<T>::init() {
    800024cc:	fe010113          	addi	sp,sp,-32
    800024d0:	00113c23          	sd	ra,24(sp)
    800024d4:	00813823          	sd	s0,16(sp)
    800024d8:	00913423          	sd	s1,8(sp)
    800024dc:	02010413          	addi	s0,sp,32
    800024e0:	00050493          	mv	s1,a0
    this->head = 0;
    800024e4:	00052423          	sw	zero,8(a0)
    this->tail = 0;
    800024e8:	00052623          	sw	zero,12(a0)
    this->size = 0;
    800024ec:	00052823          	sw	zero,16(a0)
    this->capacity = CAPACITY;
    800024f0:	01000793          	li	a5,16
    800024f4:	00f52a23          	sw	a5,20(a0)
    this->queue = (T *) mem_alloc(sizeof(T) * CAPACITY);
    800024f8:	08000513          	li	a0,128
    800024fc:	fffff097          	auipc	ra,0xfffff
    80002500:	fbc080e7          	jalr	-68(ra) # 800014b8 <_Z9mem_allocm>
    80002504:	00a4b023          	sd	a0,0(s1)
}
    80002508:	01813083          	ld	ra,24(sp)
    8000250c:	01013403          	ld	s0,16(sp)
    80002510:	00813483          	ld	s1,8(sp)
    80002514:	02010113          	addi	sp,sp,32
    80002518:	00008067          	ret

000000008000251c <_ZN3stm14CircularBufferIP3TCBE3getEv>:
    this->tail = (this->tail + 1) % this->capacity;
    this->size++;
}

template<typename T>
T stm::CircularBuffer<T>::get() {
    8000251c:	ff010113          	addi	sp,sp,-16
    80002520:	00813423          	sd	s0,8(sp)
    80002524:	01010413          	addi	s0,sp,16
    80002528:	00050793          	mv	a5,a0
    T ret = this->queue[this->head];
    8000252c:	00053683          	ld	a3,0(a0)
    80002530:	00852703          	lw	a4,8(a0)
    80002534:	00371613          	slli	a2,a4,0x3
    80002538:	00c686b3          	add	a3,a3,a2
    8000253c:	0006b503          	ld	a0,0(a3)
    this->head = (this->head + 1) % this->capacity;
    80002540:	0017071b          	addiw	a4,a4,1
    80002544:	0147a683          	lw	a3,20(a5)
    80002548:	02d7673b          	remw	a4,a4,a3
    8000254c:	00e7a423          	sw	a4,8(a5)
    this->size--;
    80002550:	0107a703          	lw	a4,16(a5)
    80002554:	fff7071b          	addiw	a4,a4,-1
    80002558:	00e7a823          	sw	a4,16(a5)
    return ret;
}
    8000255c:	00813403          	ld	s0,8(sp)
    80002560:	01010113          	addi	sp,sp,16
    80002564:	00008067          	ret

0000000080002568 <_ZN3stm14CircularBufferIP3TCBE7destroyEv>:
    this->tail = this->capacity;
    this->capacity *= 2;
}

template<typename T>
void stm::CircularBuffer<T>::destroy() {
    80002568:	ff010113          	addi	sp,sp,-16
    8000256c:	00113423          	sd	ra,8(sp)
    80002570:	00813023          	sd	s0,0(sp)
    80002574:	01010413          	addi	s0,sp,16
    mem_free(this->queue);
    80002578:	00053503          	ld	a0,0(a0)
    8000257c:	fffff097          	auipc	ra,0xfffff
    80002580:	f84080e7          	jalr	-124(ra) # 80001500 <_Z8mem_freePv>
}
    80002584:	00813083          	ld	ra,8(sp)
    80002588:	00013403          	ld	s0,0(sp)
    8000258c:	01010113          	addi	sp,sp,16
    80002590:	00008067          	ret

0000000080002594 <_ZN3stm14CircularBufferIP3TCBE6extendEv>:
void stm::CircularBuffer<T>::extend() {
    80002594:	fe010113          	addi	sp,sp,-32
    80002598:	00113c23          	sd	ra,24(sp)
    8000259c:	00813823          	sd	s0,16(sp)
    800025a0:	00913423          	sd	s1,8(sp)
    800025a4:	01213023          	sd	s2,0(sp)
    800025a8:	02010413          	addi	s0,sp,32
    800025ac:	00050493          	mv	s1,a0
    T *new_queue = (T *) mem_alloc(sizeof(T *) * this->capacity * 2);
    800025b0:	01452503          	lw	a0,20(a0)
    800025b4:	00451513          	slli	a0,a0,0x4
    800025b8:	fffff097          	auipc	ra,0xfffff
    800025bc:	f00080e7          	jalr	-256(ra) # 800014b8 <_Z9mem_allocm>
    800025c0:	00050913          	mv	s2,a0
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    800025c4:	0084a783          	lw	a5,8(s1)
    800025c8:	00000713          	li	a4,0
    800025cc:	0144a683          	lw	a3,20(s1)
    800025d0:	02d75a63          	bge	a4,a3,80002604 <_ZN3stm14CircularBufferIP3TCBE6extendEv+0x70>
        new_queue[i] = this->queue[j];
    800025d4:	0004b603          	ld	a2,0(s1)
    800025d8:	00371693          	slli	a3,a4,0x3
    800025dc:	00d906b3          	add	a3,s2,a3
    800025e0:	00379593          	slli	a1,a5,0x3
    800025e4:	00b60633          	add	a2,a2,a1
    800025e8:	00063603          	ld	a2,0(a2)
    800025ec:	00c6b023          	sd	a2,0(a3)
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    800025f0:	0017071b          	addiw	a4,a4,1
    800025f4:	0017879b          	addiw	a5,a5,1
    800025f8:	0144a683          	lw	a3,20(s1)
    800025fc:	02d7e7bb          	remw	a5,a5,a3
    80002600:	fcdff06f          	j	800025cc <_ZN3stm14CircularBufferIP3TCBE6extendEv+0x38>
    mem_free(queue);
    80002604:	0004b503          	ld	a0,0(s1)
    80002608:	fffff097          	auipc	ra,0xfffff
    8000260c:	ef8080e7          	jalr	-264(ra) # 80001500 <_Z8mem_freePv>
    this->queue = new_queue;
    80002610:	0124b023          	sd	s2,0(s1)
    this->head = 0;
    80002614:	0004a423          	sw	zero,8(s1)
    this->tail = this->capacity;
    80002618:	0144a783          	lw	a5,20(s1)
    8000261c:	00f4a623          	sw	a5,12(s1)
    this->capacity *= 2;
    80002620:	0017979b          	slliw	a5,a5,0x1
    80002624:	00f4aa23          	sw	a5,20(s1)
}
    80002628:	01813083          	ld	ra,24(sp)
    8000262c:	01013403          	ld	s0,16(sp)
    80002630:	00813483          	ld	s1,8(sp)
    80002634:	00013903          	ld	s2,0(sp)
    80002638:	02010113          	addi	sp,sp,32
    8000263c:	00008067          	ret

0000000080002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>:
void stm::CircularBuffer<T>::put(T element) {
    80002640:	fe010113          	addi	sp,sp,-32
    80002644:	00113c23          	sd	ra,24(sp)
    80002648:	00813823          	sd	s0,16(sp)
    8000264c:	00913423          	sd	s1,8(sp)
    80002650:	01213023          	sd	s2,0(sp)
    80002654:	02010413          	addi	s0,sp,32
    80002658:	00050493          	mv	s1,a0
    8000265c:	00058913          	mv	s2,a1
    if (this->size == this->capacity) {
    80002660:	01052703          	lw	a4,16(a0)
    80002664:	01452783          	lw	a5,20(a0)
    80002668:	04f70863          	beq	a4,a5,800026b8 <_ZN3stm14CircularBufferIP3TCBE3putES2_+0x78>
    this->queue[this->tail] = element;
    8000266c:	0004b783          	ld	a5,0(s1)
    80002670:	00c4a703          	lw	a4,12(s1)
    80002674:	00371713          	slli	a4,a4,0x3
    80002678:	00e787b3          	add	a5,a5,a4
    8000267c:	0127b023          	sd	s2,0(a5)
    this->tail = (this->tail + 1) % this->capacity;
    80002680:	00c4a783          	lw	a5,12(s1)
    80002684:	0017879b          	addiw	a5,a5,1
    80002688:	0144a703          	lw	a4,20(s1)
    8000268c:	02e7e7bb          	remw	a5,a5,a4
    80002690:	00f4a623          	sw	a5,12(s1)
    this->size++;
    80002694:	0104a783          	lw	a5,16(s1)
    80002698:	0017879b          	addiw	a5,a5,1
    8000269c:	00f4a823          	sw	a5,16(s1)
}
    800026a0:	01813083          	ld	ra,24(sp)
    800026a4:	01013403          	ld	s0,16(sp)
    800026a8:	00813483          	ld	s1,8(sp)
    800026ac:	00013903          	ld	s2,0(sp)
    800026b0:	02010113          	addi	sp,sp,32
    800026b4:	00008067          	ret
        this->extend();
    800026b8:	00000097          	auipc	ra,0x0
    800026bc:	edc080e7          	jalr	-292(ra) # 80002594 <_ZN3stm14CircularBufferIP3TCBE6extendEv>
    800026c0:	fadff06f          	j	8000266c <_ZN3stm14CircularBufferIP3TCBE3putES2_+0x2c>

00000000800026c4 <_Z5printPKc>:
    } else {
        Output.put(c);
    }
}

void print(const char *str) {
    800026c4:	fe010113          	addi	sp,sp,-32
    800026c8:	00113c23          	sd	ra,24(sp)
    800026cc:	00813823          	sd	s0,16(sp)
    800026d0:	00913423          	sd	s1,8(sp)
    800026d4:	01213023          	sd	s2,0(sp)
    800026d8:	02010413          	addi	s0,sp,32
    800026dc:	00050913          	mv	s2,a0
    int i = 0;
    printer->wait();
    800026e0:	00008797          	auipc	a5,0x8
    800026e4:	ef87b783          	ld	a5,-264(a5) # 8000a5d8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800026e8:	0007b503          	ld	a0,0(a5)
    800026ec:	00053783          	ld	a5,0(a0)
    800026f0:	0107b783          	ld	a5,16(a5)
    800026f4:	000780e7          	jalr	a5
    int i = 0;
    800026f8:	00000493          	li	s1,0
    while (str[i]) {
    800026fc:	009907b3          	add	a5,s2,s1
    80002700:	0007c503          	lbu	a0,0(a5)
    80002704:	00050a63          	beqz	a0,80002718 <_Z5printPKc+0x54>
        putc(str[i++]);
    80002708:	0014849b          	addiw	s1,s1,1
    8000270c:	fffff097          	auipc	ra,0xfffff
    80002710:	29c080e7          	jalr	668(ra) # 800019a8 <_Z4putcc>
    while (str[i]) {
    80002714:	fe9ff06f          	j	800026fc <_Z5printPKc+0x38>
    }
    printer->signal();
    80002718:	00008797          	auipc	a5,0x8
    8000271c:	ec07b783          	ld	a5,-320(a5) # 8000a5d8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002720:	0007b503          	ld	a0,0(a5)
    80002724:	00053783          	ld	a5,0(a0)
    80002728:	0187b783          	ld	a5,24(a5)
    8000272c:	000780e7          	jalr	a5
}
    80002730:	01813083          	ld	ra,24(sp)
    80002734:	01013403          	ld	s0,16(sp)
    80002738:	00813483          	ld	s1,8(sp)
    8000273c:	00013903          	ld	s2,0(sp)
    80002740:	02010113          	addi	sp,sp,32
    80002744:	00008067          	ret

0000000080002748 <_Z14dramatic_printPKc>:

void dramatic_print(const char *str) {
    80002748:	fe010113          	addi	sp,sp,-32
    8000274c:	00113c23          	sd	ra,24(sp)
    80002750:	00813823          	sd	s0,16(sp)
    80002754:	00913423          	sd	s1,8(sp)
    80002758:	01213023          	sd	s2,0(sp)
    8000275c:	02010413          	addi	s0,sp,32
    80002760:	00050913          	mv	s2,a0
    int i = 0;
    printer->wait();
    80002764:	00008797          	auipc	a5,0x8
    80002768:	e747b783          	ld	a5,-396(a5) # 8000a5d8 <_GLOBAL_OFFSET_TABLE_+0x20>
    8000276c:	0007b503          	ld	a0,0(a5)
    80002770:	00053783          	ld	a5,0(a0)
    80002774:	0107b783          	ld	a5,16(a5)
    80002778:	000780e7          	jalr	a5
    int i = 0;
    8000277c:	00000493          	li	s1,0
    while (str[i]) {
    80002780:	009907b3          	add	a5,s2,s1
    80002784:	0007c503          	lbu	a0,0(a5)
    80002788:	02050063          	beqz	a0,800027a8 <_Z14dramatic_printPKc+0x60>
        putc(str[i++]);
    8000278c:	0014849b          	addiw	s1,s1,1
    80002790:	fffff097          	auipc	ra,0xfffff
    80002794:	218080e7          	jalr	536(ra) # 800019a8 <_Z4putcc>
        time_sleep(1);
    80002798:	00100513          	li	a0,1
    8000279c:	fffff097          	auipc	ra,0xfffff
    800027a0:	140080e7          	jalr	320(ra) # 800018dc <_Z10time_sleepm>
    while (str[i]) {
    800027a4:	fddff06f          	j	80002780 <_Z14dramatic_printPKc+0x38>
    }
    printer->signal();
    800027a8:	00008797          	auipc	a5,0x8
    800027ac:	e307b783          	ld	a5,-464(a5) # 8000a5d8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800027b0:	0007b503          	ld	a0,0(a5)
    800027b4:	00053783          	ld	a5,0(a0)
    800027b8:	0187b783          	ld	a5,24(a5)
    800027bc:	000780e7          	jalr	a5
}
    800027c0:	01813083          	ld	ra,24(sp)
    800027c4:	01013403          	ld	s0,16(sp)
    800027c8:	00813483          	ld	s1,8(sp)
    800027cc:	00013903          	ld	s2,0(sp)
    800027d0:	02010113          	addi	sp,sp,32
    800027d4:	00008067          	ret

00000000800027d8 <_Z5printx>:

void print(long long number) {
    800027d8:	fd010113          	addi	sp,sp,-48
    800027dc:	02113423          	sd	ra,40(sp)
    800027e0:	02813023          	sd	s0,32(sp)
    800027e4:	03010413          	addi	s0,sp,48
    char buff[25] = {};
    800027e8:	fc043823          	sd	zero,-48(s0)
    800027ec:	fc043c23          	sd	zero,-40(s0)
    800027f0:	fe043023          	sd	zero,-32(s0)
    800027f4:	fe040423          	sb	zero,-24(s0)
    print(stm::ntos(number, buff, 10));
    800027f8:	00a00613          	li	a2,10
    800027fc:	fd040593          	addi	a1,s0,-48
    80002800:	fffff097          	auipc	ra,0xfffff
    80002804:	404080e7          	jalr	1028(ra) # 80001c04 <_ZN3stm4ntosExPci>
    80002808:	00000097          	auipc	ra,0x0
    8000280c:	ebc080e7          	jalr	-324(ra) # 800026c4 <_Z5printPKc>
}
    80002810:	02813083          	ld	ra,40(sp)
    80002814:	02013403          	ld	s0,32(sp)
    80002818:	03010113          	addi	sp,sp,48
    8000281c:	00008067          	ret

0000000080002820 <_Z5printi>:

void print(int number) {
    80002820:	ff010113          	addi	sp,sp,-16
    80002824:	00113423          	sd	ra,8(sp)
    80002828:	00813023          	sd	s0,0(sp)
    8000282c:	01010413          	addi	s0,sp,16
    print((long long) number);
    80002830:	00000097          	auipc	ra,0x0
    80002834:	fa8080e7          	jalr	-88(ra) # 800027d8 <_Z5printx>
}
    80002838:	00813083          	ld	ra,8(sp)
    8000283c:	00013403          	ld	s0,0(sp)
    80002840:	01010113          	addi	sp,sp,16
    80002844:	00008067          	ret

0000000080002848 <_Z5printm>:

void print(uint64 number) {
    80002848:	fd010113          	addi	sp,sp,-48
    8000284c:	02113423          	sd	ra,40(sp)
    80002850:	02813023          	sd	s0,32(sp)
    80002854:	03010413          	addi	s0,sp,48
    char buff[25] = {};
    80002858:	fc043823          	sd	zero,-48(s0)
    8000285c:	fc043c23          	sd	zero,-40(s0)
    80002860:	fe043023          	sd	zero,-32(s0)
    80002864:	fe040423          	sb	zero,-24(s0)
    print(stm::utos(number, buff, 10));
    80002868:	00a00613          	li	a2,10
    8000286c:	fd040593          	addi	a1,s0,-48
    80002870:	fffff097          	auipc	ra,0xfffff
    80002874:	498080e7          	jalr	1176(ra) # 80001d08 <_ZN3stm4utosEmPci>
    80002878:	00000097          	auipc	ra,0x0
    8000287c:	e4c080e7          	jalr	-436(ra) # 800026c4 <_Z5printPKc>
}
    80002880:	02813083          	ld	ra,40(sp)
    80002884:	02013403          	ld	s0,32(sp)
    80002888:	03010113          	addi	sp,sp,48
    8000288c:	00008067          	ret

0000000080002890 <_Z7print_hm>:

void print_h(uint64 number) {
    80002890:	fd010113          	addi	sp,sp,-48
    80002894:	02113423          	sd	ra,40(sp)
    80002898:	02813023          	sd	s0,32(sp)
    8000289c:	03010413          	addi	s0,sp,48
    char buff[25] = {};
    800028a0:	fc043823          	sd	zero,-48(s0)
    800028a4:	fc043c23          	sd	zero,-40(s0)
    800028a8:	fe043023          	sd	zero,-32(s0)
    800028ac:	fe040423          	sb	zero,-24(s0)
    print(stm::utos(number, buff, 16));
    800028b0:	01000613          	li	a2,16
    800028b4:	fd040593          	addi	a1,s0,-48
    800028b8:	fffff097          	auipc	ra,0xfffff
    800028bc:	450080e7          	jalr	1104(ra) # 80001d08 <_ZN3stm4utosEmPci>
    800028c0:	00000097          	auipc	ra,0x0
    800028c4:	e04080e7          	jalr	-508(ra) # 800026c4 <_Z5printPKc>
    800028c8:	02813083          	ld	ra,40(sp)
    800028cc:	02013403          	ld	s0,32(sp)
    800028d0:	03010113          	addi	sp,sp,48
    800028d4:	00008067          	ret

00000000800028d8 <_ZN8IOBuffer4initEv>:
void IOBuffer::init() {
    800028d8:	fe010113          	addi	sp,sp,-32
    800028dc:	00113c23          	sd	ra,24(sp)
    800028e0:	00813823          	sd	s0,16(sp)
    800028e4:	00913423          	sd	s1,8(sp)
    800028e8:	02010413          	addi	s0,sp,32
    800028ec:	00050493          	mv	s1,a0
    this->buffer.init();
    800028f0:	00000097          	auipc	ra,0x0
    800028f4:	1a0080e7          	jalr	416(ra) # 80002a90 <_ZN3stm14CircularBufferIcE4initEv>
    sem_open(&this->empty, 0);
    800028f8:	00000593          	li	a1,0
    800028fc:	01848513          	addi	a0,s1,24
    80002900:	fffff097          	auipc	ra,0xfffff
    80002904:	e58080e7          	jalr	-424(ra) # 80001758 <_Z8sem_openPP3Semj>
}
    80002908:	01813083          	ld	ra,24(sp)
    8000290c:	01013403          	ld	s0,16(sp)
    80002910:	00813483          	ld	s1,8(sp)
    80002914:	02010113          	addi	sp,sp,32
    80002918:	00008067          	ret

000000008000291c <_ZN2IO4initEv>:
void IO::init() {
    8000291c:	ff010113          	addi	sp,sp,-16
    80002920:	00113423          	sd	ra,8(sp)
    80002924:	00813023          	sd	s0,0(sp)
    80002928:	01010413          	addi	s0,sp,16
    Input.init();
    8000292c:	00008517          	auipc	a0,0x8
    80002930:	d7450513          	addi	a0,a0,-652 # 8000a6a0 <_ZN2IO5InputE>
    80002934:	00000097          	auipc	ra,0x0
    80002938:	fa4080e7          	jalr	-92(ra) # 800028d8 <_ZN8IOBuffer4initEv>
    Output.init();
    8000293c:	00008517          	auipc	a0,0x8
    80002940:	d8450513          	addi	a0,a0,-636 # 8000a6c0 <_ZN2IO6OutputE>
    80002944:	00000097          	auipc	ra,0x0
    80002948:	f94080e7          	jalr	-108(ra) # 800028d8 <_ZN8IOBuffer4initEv>
}
    8000294c:	00813083          	ld	ra,8(sp)
    80002950:	00013403          	ld	s0,0(sp)
    80002954:	01010113          	addi	sp,sp,16
    80002958:	00008067          	ret

000000008000295c <_ZN8IOBuffer3getEv>:
char IOBuffer::get() {
    8000295c:	fe010113          	addi	sp,sp,-32
    80002960:	00113c23          	sd	ra,24(sp)
    80002964:	00813823          	sd	s0,16(sp)
    80002968:	00913423          	sd	s1,8(sp)
    8000296c:	02010413          	addi	s0,sp,32
    80002970:	00050493          	mv	s1,a0
    Sem::_sem_wait(this->empty);
    80002974:	01853503          	ld	a0,24(a0)
    80002978:	00000097          	auipc	ra,0x0
    8000297c:	a80080e7          	jalr	-1408(ra) # 800023f8 <_ZN3Sem9_sem_waitEPS_>
    char ret = this->buffer.get();
    80002980:	00048513          	mv	a0,s1
    80002984:	00000097          	auipc	ra,0x0
    80002988:	15c080e7          	jalr	348(ra) # 80002ae0 <_ZN3stm14CircularBufferIcE3getEv>
}
    8000298c:	01813083          	ld	ra,24(sp)
    80002990:	01013403          	ld	s0,16(sp)
    80002994:	00813483          	ld	s1,8(sp)
    80002998:	02010113          	addi	sp,sp,32
    8000299c:	00008067          	ret

00000000800029a0 <_ZN2IO5_getcEv>:
char IO::_getc() {
    800029a0:	ff010113          	addi	sp,sp,-16
    800029a4:	00113423          	sd	ra,8(sp)
    800029a8:	00813023          	sd	s0,0(sp)
    800029ac:	01010413          	addi	s0,sp,16
    return Input.get();
    800029b0:	00008517          	auipc	a0,0x8
    800029b4:	cf050513          	addi	a0,a0,-784 # 8000a6a0 <_ZN2IO5InputE>
    800029b8:	00000097          	auipc	ra,0x0
    800029bc:	fa4080e7          	jalr	-92(ra) # 8000295c <_ZN8IOBuffer3getEv>
}
    800029c0:	00813083          	ld	ra,8(sp)
    800029c4:	00013403          	ld	s0,0(sp)
    800029c8:	01010113          	addi	sp,sp,16
    800029cc:	00008067          	ret

00000000800029d0 <_ZN8IOBuffer3putEc>:
void IOBuffer::put(char c) {
    800029d0:	fe010113          	addi	sp,sp,-32
    800029d4:	00113c23          	sd	ra,24(sp)
    800029d8:	00813823          	sd	s0,16(sp)
    800029dc:	00913423          	sd	s1,8(sp)
    800029e0:	02010413          	addi	s0,sp,32
    800029e4:	00050493          	mv	s1,a0
    this->buffer.put(c);
    800029e8:	00000097          	auipc	ra,0x0
    800029ec:	1e4080e7          	jalr	484(ra) # 80002bcc <_ZN3stm14CircularBufferIcE3putEc>
    Sem::_sem_signal(this->empty);
    800029f0:	0184b503          	ld	a0,24(s1)
    800029f4:	00000097          	auipc	ra,0x0
    800029f8:	8bc080e7          	jalr	-1860(ra) # 800022b0 <_ZN3Sem11_sem_signalEPS_>
}
    800029fc:	01813083          	ld	ra,24(sp)
    80002a00:	01013403          	ld	s0,16(sp)
    80002a04:	00813483          	ld	s1,8(sp)
    80002a08:	02010113          	addi	sp,sp,32
    80002a0c:	00008067          	ret

0000000080002a10 <_ZN2IO5_putcEc>:
void IO::_putc(char c) {
    80002a10:	fe010113          	addi	sp,sp,-32
    80002a14:	00113c23          	sd	ra,24(sp)
    80002a18:	00813823          	sd	s0,16(sp)
    80002a1c:	00913423          	sd	s1,8(sp)
    80002a20:	02010413          	addi	s0,sp,32
    if (c == 127) {
    80002a24:	07f00793          	li	a5,127
    80002a28:	02f50663          	beq	a0,a5,80002a54 <_ZN2IO5_putcEc+0x44>
    80002a2c:	00050593          	mv	a1,a0
        Output.put(c);
    80002a30:	00008517          	auipc	a0,0x8
    80002a34:	c9050513          	addi	a0,a0,-880 # 8000a6c0 <_ZN2IO6OutputE>
    80002a38:	00000097          	auipc	ra,0x0
    80002a3c:	f98080e7          	jalr	-104(ra) # 800029d0 <_ZN8IOBuffer3putEc>
}
    80002a40:	01813083          	ld	ra,24(sp)
    80002a44:	01013403          	ld	s0,16(sp)
    80002a48:	00813483          	ld	s1,8(sp)
    80002a4c:	02010113          	addi	sp,sp,32
    80002a50:	00008067          	ret
        Output.put(8);
    80002a54:	00008497          	auipc	s1,0x8
    80002a58:	c6c48493          	addi	s1,s1,-916 # 8000a6c0 <_ZN2IO6OutputE>
    80002a5c:	00800593          	li	a1,8
    80002a60:	00048513          	mv	a0,s1
    80002a64:	00000097          	auipc	ra,0x0
    80002a68:	f6c080e7          	jalr	-148(ra) # 800029d0 <_ZN8IOBuffer3putEc>
        Output.put(' ');
    80002a6c:	02000593          	li	a1,32
    80002a70:	00048513          	mv	a0,s1
    80002a74:	00000097          	auipc	ra,0x0
    80002a78:	f5c080e7          	jalr	-164(ra) # 800029d0 <_ZN8IOBuffer3putEc>
        Output.put(8);
    80002a7c:	00800593          	li	a1,8
    80002a80:	00048513          	mv	a0,s1
    80002a84:	00000097          	auipc	ra,0x0
    80002a88:	f4c080e7          	jalr	-180(ra) # 800029d0 <_ZN8IOBuffer3putEc>
    80002a8c:	fb5ff06f          	j	80002a40 <_ZN2IO5_putcEc+0x30>

0000000080002a90 <_ZN3stm14CircularBufferIcE4initEv>:
void stm::CircularBuffer<T>::init() {
    80002a90:	fe010113          	addi	sp,sp,-32
    80002a94:	00113c23          	sd	ra,24(sp)
    80002a98:	00813823          	sd	s0,16(sp)
    80002a9c:	00913423          	sd	s1,8(sp)
    80002aa0:	02010413          	addi	s0,sp,32
    80002aa4:	00050493          	mv	s1,a0
    this->head = 0;
    80002aa8:	00052423          	sw	zero,8(a0)
    this->tail = 0;
    80002aac:	00052623          	sw	zero,12(a0)
    this->size = 0;
    80002ab0:	00052823          	sw	zero,16(a0)
    this->capacity = CAPACITY;
    80002ab4:	01000793          	li	a5,16
    80002ab8:	00f52a23          	sw	a5,20(a0)
    this->queue = (T *) mem_alloc(sizeof(T) * CAPACITY);
    80002abc:	01000513          	li	a0,16
    80002ac0:	fffff097          	auipc	ra,0xfffff
    80002ac4:	9f8080e7          	jalr	-1544(ra) # 800014b8 <_Z9mem_allocm>
    80002ac8:	00a4b023          	sd	a0,0(s1)
}
    80002acc:	01813083          	ld	ra,24(sp)
    80002ad0:	01013403          	ld	s0,16(sp)
    80002ad4:	00813483          	ld	s1,8(sp)
    80002ad8:	02010113          	addi	sp,sp,32
    80002adc:	00008067          	ret

0000000080002ae0 <_ZN3stm14CircularBufferIcE3getEv>:
T stm::CircularBuffer<T>::get() {
    80002ae0:	ff010113          	addi	sp,sp,-16
    80002ae4:	00813423          	sd	s0,8(sp)
    80002ae8:	01010413          	addi	s0,sp,16
    80002aec:	00050793          	mv	a5,a0
    T ret = this->queue[this->head];
    80002af0:	00053683          	ld	a3,0(a0)
    80002af4:	00852703          	lw	a4,8(a0)
    80002af8:	00e686b3          	add	a3,a3,a4
    80002afc:	0006c503          	lbu	a0,0(a3)
    this->head = (this->head + 1) % this->capacity;
    80002b00:	0017071b          	addiw	a4,a4,1
    80002b04:	0147a683          	lw	a3,20(a5)
    80002b08:	02d7673b          	remw	a4,a4,a3
    80002b0c:	00e7a423          	sw	a4,8(a5)
    this->size--;
    80002b10:	0107a703          	lw	a4,16(a5)
    80002b14:	fff7071b          	addiw	a4,a4,-1
    80002b18:	00e7a823          	sw	a4,16(a5)
}
    80002b1c:	00813403          	ld	s0,8(sp)
    80002b20:	01010113          	addi	sp,sp,16
    80002b24:	00008067          	ret

0000000080002b28 <_ZN3stm14CircularBufferIcE6extendEv>:
void stm::CircularBuffer<T>::extend() {
    80002b28:	fe010113          	addi	sp,sp,-32
    80002b2c:	00113c23          	sd	ra,24(sp)
    80002b30:	00813823          	sd	s0,16(sp)
    80002b34:	00913423          	sd	s1,8(sp)
    80002b38:	01213023          	sd	s2,0(sp)
    80002b3c:	02010413          	addi	s0,sp,32
    80002b40:	00050493          	mv	s1,a0
    T *new_queue = (T *) mem_alloc(sizeof(T *) * this->capacity * 2);
    80002b44:	01452503          	lw	a0,20(a0)
    80002b48:	00451513          	slli	a0,a0,0x4
    80002b4c:	fffff097          	auipc	ra,0xfffff
    80002b50:	96c080e7          	jalr	-1684(ra) # 800014b8 <_Z9mem_allocm>
    80002b54:	00050913          	mv	s2,a0
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    80002b58:	0084a783          	lw	a5,8(s1)
    80002b5c:	00000713          	li	a4,0
    80002b60:	0144a683          	lw	a3,20(s1)
    80002b64:	02d75663          	bge	a4,a3,80002b90 <_ZN3stm14CircularBufferIcE6extendEv+0x68>
        new_queue[i] = this->queue[j];
    80002b68:	0004b683          	ld	a3,0(s1)
    80002b6c:	00e90633          	add	a2,s2,a4
    80002b70:	00f686b3          	add	a3,a3,a5
    80002b74:	0006c683          	lbu	a3,0(a3)
    80002b78:	00d60023          	sb	a3,0(a2)
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    80002b7c:	0017071b          	addiw	a4,a4,1
    80002b80:	0017879b          	addiw	a5,a5,1
    80002b84:	0144a683          	lw	a3,20(s1)
    80002b88:	02d7e7bb          	remw	a5,a5,a3
    80002b8c:	fd5ff06f          	j	80002b60 <_ZN3stm14CircularBufferIcE6extendEv+0x38>
    mem_free(queue);
    80002b90:	0004b503          	ld	a0,0(s1)
    80002b94:	fffff097          	auipc	ra,0xfffff
    80002b98:	96c080e7          	jalr	-1684(ra) # 80001500 <_Z8mem_freePv>
    this->queue = new_queue;
    80002b9c:	0124b023          	sd	s2,0(s1)
    this->head = 0;
    80002ba0:	0004a423          	sw	zero,8(s1)
    this->tail = this->capacity;
    80002ba4:	0144a783          	lw	a5,20(s1)
    80002ba8:	00f4a623          	sw	a5,12(s1)
    this->capacity *= 2;
    80002bac:	0017979b          	slliw	a5,a5,0x1
    80002bb0:	00f4aa23          	sw	a5,20(s1)
}
    80002bb4:	01813083          	ld	ra,24(sp)
    80002bb8:	01013403          	ld	s0,16(sp)
    80002bbc:	00813483          	ld	s1,8(sp)
    80002bc0:	00013903          	ld	s2,0(sp)
    80002bc4:	02010113          	addi	sp,sp,32
    80002bc8:	00008067          	ret

0000000080002bcc <_ZN3stm14CircularBufferIcE3putEc>:
void stm::CircularBuffer<T>::put(T element) {
    80002bcc:	fe010113          	addi	sp,sp,-32
    80002bd0:	00113c23          	sd	ra,24(sp)
    80002bd4:	00813823          	sd	s0,16(sp)
    80002bd8:	00913423          	sd	s1,8(sp)
    80002bdc:	01213023          	sd	s2,0(sp)
    80002be0:	02010413          	addi	s0,sp,32
    80002be4:	00050493          	mv	s1,a0
    80002be8:	00058913          	mv	s2,a1
    if (this->size == this->capacity) {
    80002bec:	01052703          	lw	a4,16(a0)
    80002bf0:	01452783          	lw	a5,20(a0)
    80002bf4:	04f70663          	beq	a4,a5,80002c40 <_ZN3stm14CircularBufferIcE3putEc+0x74>
    this->queue[this->tail] = element;
    80002bf8:	0004b783          	ld	a5,0(s1)
    80002bfc:	00c4a703          	lw	a4,12(s1)
    80002c00:	00e787b3          	add	a5,a5,a4
    80002c04:	01278023          	sb	s2,0(a5)
    this->tail = (this->tail + 1) % this->capacity;
    80002c08:	00c4a783          	lw	a5,12(s1)
    80002c0c:	0017879b          	addiw	a5,a5,1
    80002c10:	0144a703          	lw	a4,20(s1)
    80002c14:	02e7e7bb          	remw	a5,a5,a4
    80002c18:	00f4a623          	sw	a5,12(s1)
    this->size++;
    80002c1c:	0104a783          	lw	a5,16(s1)
    80002c20:	0017879b          	addiw	a5,a5,1
    80002c24:	00f4a823          	sw	a5,16(s1)
}
    80002c28:	01813083          	ld	ra,24(sp)
    80002c2c:	01013403          	ld	s0,16(sp)
    80002c30:	00813483          	ld	s1,8(sp)
    80002c34:	00013903          	ld	s2,0(sp)
    80002c38:	02010113          	addi	sp,sp,32
    80002c3c:	00008067          	ret
        this->extend();
    80002c40:	00000097          	auipc	ra,0x0
    80002c44:	ee8080e7          	jalr	-280(ra) # 80002b28 <_ZN3stm14CircularBufferIcE6extendEv>
    80002c48:	fb1ff06f          	j	80002bf8 <_ZN3stm14CircularBufferIcE3putEc+0x2c>

0000000080002c4c <_ZN6Cradle4elemnwEm>:
#include "../h/scheduler.hpp"

Cradle::elem *Cradle::head = nullptr;
Cradle::elem *Cradle::tail = nullptr;

void *Cradle::elem::operator new(size_t size) {
    80002c4c:	ff010113          	addi	sp,sp,-16
    80002c50:	00113423          	sd	ra,8(sp)
    80002c54:	00813023          	sd	s0,0(sp)
    80002c58:	01010413          	addi	s0,sp,16
    return Allocator::_mem_alloc(size);
    80002c5c:	00001097          	auipc	ra,0x1
    80002c60:	ad4080e7          	jalr	-1324(ra) # 80003730 <_ZN9Allocator10_mem_allocEm>
}
    80002c64:	00813083          	ld	ra,8(sp)
    80002c68:	00013403          	ld	s0,0(sp)
    80002c6c:	01010113          	addi	sp,sp,16
    80002c70:	00008067          	ret

0000000080002c74 <_ZN6Cradle4elemdlEPv>:

void Cradle::elem::operator delete(void *mem) {
    80002c74:	ff010113          	addi	sp,sp,-16
    80002c78:	00113423          	sd	ra,8(sp)
    80002c7c:	00813023          	sd	s0,0(sp)
    80002c80:	01010413          	addi	s0,sp,16
    Allocator::_mem_free(mem);
    80002c84:	00001097          	auipc	ra,0x1
    80002c88:	b68080e7          	jalr	-1176(ra) # 800037ec <_ZN9Allocator9_mem_freeEPKv>
}
    80002c8c:	00813083          	ld	ra,8(sp)
    80002c90:	00013403          	ld	s0,0(sp)
    80002c94:	01010113          	addi	sp,sp,16
    80002c98:	00008067          	ret

0000000080002c9c <_ZN6Cradle6insertEP3TCBm>:

void Cradle::insert(TCB *thread, time_t time) {
    80002c9c:	fc010113          	addi	sp,sp,-64
    80002ca0:	02113c23          	sd	ra,56(sp)
    80002ca4:	02813823          	sd	s0,48(sp)
    80002ca8:	02913423          	sd	s1,40(sp)
    80002cac:	03213023          	sd	s2,32(sp)
    80002cb0:	01313c23          	sd	s3,24(sp)
    80002cb4:	01413823          	sd	s4,16(sp)
    80002cb8:	01513423          	sd	s5,8(sp)
    80002cbc:	04010413          	addi	s0,sp,64
    80002cc0:	00050a93          	mv	s5,a0
    80002cc4:	00058913          	mv	s2,a1
    if (head == nullptr) {
    80002cc8:	00008797          	auipc	a5,0x8
    80002ccc:	a187b783          	ld	a5,-1512(a5) # 8000a6e0 <_ZN6Cradle4headE>
    80002cd0:	04078263          	beqz	a5,80002d14 <_ZN6Cradle6insertEP3TCBm+0x78>
        head = tail = new elem(thread, time);
        return;
    } else if (time < head->time_left) {
    80002cd4:	0087b703          	ld	a4,8(a5)
    80002cd8:	06e5f663          	bgeu	a1,a4,80002d44 <_ZN6Cradle6insertEP3TCBm+0xa8>
        head = new elem(thread, time, head);
    80002cdc:	01800513          	li	a0,24
    80002ce0:	00000097          	auipc	ra,0x0
    80002ce4:	f6c080e7          	jalr	-148(ra) # 80002c4c <_ZN6Cradle4elemnwEm>
    80002ce8:	00008717          	auipc	a4,0x8
    80002cec:	9f870713          	addi	a4,a4,-1544 # 8000a6e0 <_ZN6Cradle4headE>
    80002cf0:	00073783          	ld	a5,0(a4)
    struct elem {
        void *operator new(size_t size);

        void operator delete(void *mem);

        elem(TCB *handle, time_t time, elem *next = nullptr) : handle(handle), time_left(time), next(next) {}
    80002cf4:	01553023          	sd	s5,0(a0)
    80002cf8:	01253423          	sd	s2,8(a0)
    80002cfc:	00f53823          	sd	a5,16(a0)
    80002d00:	00a73023          	sd	a0,0(a4)
        head->next->time_left -= time;
    80002d04:	0087b703          	ld	a4,8(a5)
    80002d08:	41270933          	sub	s2,a4,s2
    80002d0c:	0127b423          	sd	s2,8(a5)
        return;
    80002d10:	0b40006f          	j	80002dc4 <_ZN6Cradle6insertEP3TCBm+0x128>
        head = tail = new elem(thread, time);
    80002d14:	01800513          	li	a0,24
    80002d18:	00000097          	auipc	ra,0x0
    80002d1c:	f34080e7          	jalr	-204(ra) # 80002c4c <_ZN6Cradle4elemnwEm>
    80002d20:	01553023          	sd	s5,0(a0)
    80002d24:	01253423          	sd	s2,8(a0)
    80002d28:	00053823          	sd	zero,16(a0)
    80002d2c:	00008797          	auipc	a5,0x8
    80002d30:	9b478793          	addi	a5,a5,-1612 # 8000a6e0 <_ZN6Cradle4headE>
    80002d34:	00a7b423          	sd	a0,8(a5)
    80002d38:	00a7b023          	sd	a0,0(a5)
        return;
    80002d3c:	0880006f          	j	80002dc4 <_ZN6Cradle6insertEP3TCBm+0x128>
    }
    for (elem *curr = head; curr->next; curr = curr->next) {
        time -= curr->time_left;
    80002d40:	00048913          	mv	s2,s1
    for (elem *curr = head; curr->next; curr = curr->next) {
    80002d44:	00078993          	mv	s3,a5
    80002d48:	0107b783          	ld	a5,16(a5)
    80002d4c:	04078663          	beqz	a5,80002d98 <_ZN6Cradle6insertEP3TCBm+0xfc>
        time -= curr->time_left;
    80002d50:	0089ba03          	ld	s4,8(s3)
    80002d54:	414904b3          	sub	s1,s2,s4
        if (time < curr->next->time_left) {
    80002d58:	0087b703          	ld	a4,8(a5)
    80002d5c:	fee4f2e3          	bgeu	s1,a4,80002d40 <_ZN6Cradle6insertEP3TCBm+0xa4>
            curr->next = new elem(thread, time, curr->next);
    80002d60:	01800513          	li	a0,24
    80002d64:	00000097          	auipc	ra,0x0
    80002d68:	ee8080e7          	jalr	-280(ra) # 80002c4c <_ZN6Cradle4elemnwEm>
    80002d6c:	0109b783          	ld	a5,16(s3)
    80002d70:	01553023          	sd	s5,0(a0)
    80002d74:	00953423          	sd	s1,8(a0)
    80002d78:	00f53823          	sd	a5,16(a0)
    80002d7c:	00a9b823          	sd	a0,16(s3)
            curr->next->next->time_left -= time;
    80002d80:	01053783          	ld	a5,16(a0)
    80002d84:	412a0933          	sub	s2,s4,s2
    80002d88:	0087ba03          	ld	s4,8(a5)
    80002d8c:	012a0933          	add	s2,s4,s2
    80002d90:	0127b423          	sd	s2,8(a5)
            return;
    80002d94:	0300006f          	j	80002dc4 <_ZN6Cradle6insertEP3TCBm+0x128>
        }
    }
    tail->next = new elem(thread, time);
    80002d98:	01800513          	li	a0,24
    80002d9c:	00000097          	auipc	ra,0x0
    80002da0:	eb0080e7          	jalr	-336(ra) # 80002c4c <_ZN6Cradle4elemnwEm>
    80002da4:	01553023          	sd	s5,0(a0)
    80002da8:	01253423          	sd	s2,8(a0)
    80002dac:	00053823          	sd	zero,16(a0)
    80002db0:	00008797          	auipc	a5,0x8
    80002db4:	93078793          	addi	a5,a5,-1744 # 8000a6e0 <_ZN6Cradle4headE>
    80002db8:	0087b703          	ld	a4,8(a5)
    80002dbc:	00a73823          	sd	a0,16(a4)
    tail = tail->next;
    80002dc0:	00a7b423          	sd	a0,8(a5)
}
    80002dc4:	03813083          	ld	ra,56(sp)
    80002dc8:	03013403          	ld	s0,48(sp)
    80002dcc:	02813483          	ld	s1,40(sp)
    80002dd0:	02013903          	ld	s2,32(sp)
    80002dd4:	01813983          	ld	s3,24(sp)
    80002dd8:	01013a03          	ld	s4,16(sp)
    80002ddc:	00813a83          	ld	s5,8(sp)
    80002de0:	04010113          	addi	sp,sp,64
    80002de4:	00008067          	ret

0000000080002de8 <_ZN6Cradle6removeEv>:

TCB *Cradle::remove() {
    80002de8:	fe010113          	addi	sp,sp,-32
    80002dec:	00113c23          	sd	ra,24(sp)
    80002df0:	00813823          	sd	s0,16(sp)
    80002df4:	00913423          	sd	s1,8(sp)
    80002df8:	02010413          	addi	s0,sp,32
    elem *old = head;
    80002dfc:	00008797          	auipc	a5,0x8
    80002e00:	8e478793          	addi	a5,a5,-1820 # 8000a6e0 <_ZN6Cradle4headE>
    80002e04:	0007b503          	ld	a0,0(a5)
    TCB *ret = old->handle;
    80002e08:	00053483          	ld	s1,0(a0)
    head = head->next;
    80002e0c:	01053703          	ld	a4,16(a0)
    80002e10:	00e7b023          	sd	a4,0(a5)
    delete old;
    80002e14:	00050663          	beqz	a0,80002e20 <_ZN6Cradle6removeEv+0x38>
    80002e18:	00000097          	auipc	ra,0x0
    80002e1c:	e5c080e7          	jalr	-420(ra) # 80002c74 <_ZN6Cradle4elemdlEPv>
    return ret;
}
    80002e20:	00048513          	mv	a0,s1
    80002e24:	01813083          	ld	ra,24(sp)
    80002e28:	01013403          	ld	s0,16(sp)
    80002e2c:	00813483          	ld	s1,8(sp)
    80002e30:	02010113          	addi	sp,sp,32
    80002e34:	00008067          	ret

0000000080002e38 <_ZN6Cradle4peakEv>:
            Scheduler::put(next);
        }
    }
}

int Cradle::peak() {
    80002e38:	ff010113          	addi	sp,sp,-16
    80002e3c:	00813423          	sd	s0,8(sp)
    80002e40:	01010413          	addi	s0,sp,16
    if (head)
    80002e44:	00008797          	auipc	a5,0x8
    80002e48:	89c7b783          	ld	a5,-1892(a5) # 8000a6e0 <_ZN6Cradle4headE>
    80002e4c:	00078a63          	beqz	a5,80002e60 <_ZN6Cradle4peakEv+0x28>
        return head->time_left;
    80002e50:	0087a503          	lw	a0,8(a5)
    else
        return -1;
}
    80002e54:	00813403          	ld	s0,8(sp)
    80002e58:	01010113          	addi	sp,sp,16
    80002e5c:	00008067          	ret
        return -1;
    80002e60:	fff00513          	li	a0,-1
    80002e64:	ff1ff06f          	j	80002e54 <_ZN6Cradle4peakEv+0x1c>

0000000080002e68 <_ZN6Cradle8is_emptyEv>:

bool Cradle::is_empty() {
    80002e68:	ff010113          	addi	sp,sp,-16
    80002e6c:	00813423          	sd	s0,8(sp)
    80002e70:	01010413          	addi	s0,sp,16
    return head == nullptr;
}
    80002e74:	00008517          	auipc	a0,0x8
    80002e78:	86c53503          	ld	a0,-1940(a0) # 8000a6e0 <_ZN6Cradle4headE>
    80002e7c:	00153513          	seqz	a0,a0
    80002e80:	00813403          	ld	s0,8(sp)
    80002e84:	01010113          	addi	sp,sp,16
    80002e88:	00008067          	ret

0000000080002e8c <_ZN6Cradle6updateEv>:
    if (!head)
    80002e8c:	00008797          	auipc	a5,0x8
    80002e90:	8547b783          	ld	a5,-1964(a5) # 8000a6e0 <_ZN6Cradle4headE>
    80002e94:	06078c63          	beqz	a5,80002f0c <_ZN6Cradle6updateEv+0x80>
void Cradle::update() {
    80002e98:	ff010113          	addi	sp,sp,-16
    80002e9c:	00113423          	sd	ra,8(sp)
    80002ea0:	00813023          	sd	s0,0(sp)
    80002ea4:	01010413          	addi	s0,sp,16
    head->time_left--;
    80002ea8:	0087b703          	ld	a4,8(a5)
    80002eac:	fff70713          	addi	a4,a4,-1
    80002eb0:	00e7b423          	sd	a4,8(a5)
    80002eb4:	0100006f          	j	80002ec4 <_ZN6Cradle6updateEv+0x38>
    80002eb8:	04052823          	sw	zero,80(a0)
            Scheduler::put(next);
    80002ebc:	00002097          	auipc	ra,0x2
    80002ec0:	b70080e7          	jalr	-1168(ra) # 80004a2c <_ZN9Scheduler3putEP3TCB>
    while (!is_empty() && peak() == 0) {
    80002ec4:	00000097          	auipc	ra,0x0
    80002ec8:	fa4080e7          	jalr	-92(ra) # 80002e68 <_ZN6Cradle8is_emptyEv>
    80002ecc:	02051863          	bnez	a0,80002efc <_ZN6Cradle6updateEv+0x70>
    80002ed0:	00000097          	auipc	ra,0x0
    80002ed4:	f68080e7          	jalr	-152(ra) # 80002e38 <_ZN6Cradle4peakEv>
    80002ed8:	02051263          	bnez	a0,80002efc <_ZN6Cradle6updateEv+0x70>
        thread_t next = remove();
    80002edc:	00000097          	auipc	ra,0x0
    80002ee0:	f0c080e7          	jalr	-244(ra) # 80002de8 <_ZN6Cradle6removeEv>
    bool is_joined() const { return this->status == JOINED; }
    80002ee4:	05052783          	lw	a5,80(a0)
        if (next->is_joined() || next->is_sleeping()) {
    80002ee8:	00300713          	li	a4,3
    80002eec:	fce786e3          	beq	a5,a4,80002eb8 <_ZN6Cradle6updateEv+0x2c>
    80002ef0:	00200713          	li	a4,2
    80002ef4:	fce798e3          	bne	a5,a4,80002ec4 <_ZN6Cradle6updateEv+0x38>
    80002ef8:	fc1ff06f          	j	80002eb8 <_ZN6Cradle6updateEv+0x2c>
}
    80002efc:	00813083          	ld	ra,8(sp)
    80002f00:	00013403          	ld	s0,0(sp)
    80002f04:	01010113          	addi	sp,sp,16
    80002f08:	00008067          	ret
    80002f0c:	00008067          	ret

0000000080002f10 <_ZN6Cradle11_time_sleepEm>:

int Cradle::_time_sleep(time_t ms) {
    80002f10:	fe010113          	addi	sp,sp,-32
    80002f14:	00113c23          	sd	ra,24(sp)
    80002f18:	00813823          	sd	s0,16(sp)
    80002f1c:	00913423          	sd	s1,8(sp)
    80002f20:	02010413          	addi	s0,sp,32
    80002f24:	00050593          	mv	a1,a0
    insert(TCB::running, ms);
    80002f28:	00007497          	auipc	s1,0x7
    80002f2c:	7004b483          	ld	s1,1792(s1) # 8000a628 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002f30:	0004b503          	ld	a0,0(s1)
    80002f34:	00000097          	auipc	ra,0x0
    80002f38:	d68080e7          	jalr	-664(ra) # 80002c9c <_ZN6Cradle6insertEP3TCBm>
    TCB::running->sleep();
    80002f3c:	0004b783          	ld	a5,0(s1)

    void sleep() { this->status = SLEEPING; }
    80002f40:	00200713          	li	a4,2
    80002f44:	04e7a823          	sw	a4,80(a5)
    TCB::_thread_dispatch();
    80002f48:	00002097          	auipc	ra,0x2
    80002f4c:	2e0080e7          	jalr	736(ra) # 80005228 <_ZN3TCB16_thread_dispatchEv>
    return 0;
}
    80002f50:	00000513          	li	a0,0
    80002f54:	01813083          	ld	ra,24(sp)
    80002f58:	01013403          	ld	s0,16(sp)
    80002f5c:	00813483          	ld	s1,8(sp)
    80002f60:	02010113          	addi	sp,sp,32
    80002f64:	00008067          	ret

0000000080002f68 <_ZN6Cradle12_thread_wakeEP3TCB>:
    bool is_sleeping() const { return this->status == SLEEPING; }
    80002f68:	05052703          	lw	a4,80(a0)

int Cradle::_thread_wake(thread_t thread) {
    if (!thread->is_sleeping())
    80002f6c:	00200793          	li	a5,2
    80002f70:	02f71e63          	bne	a4,a5,80002fac <_ZN6Cradle12_thread_wakeEP3TCB+0x44>
int Cradle::_thread_wake(thread_t thread) {
    80002f74:	ff010113          	addi	sp,sp,-16
    80002f78:	00113423          	sd	ra,8(sp)
    80002f7c:	00813023          	sd	s0,0(sp)
    80002f80:	01010413          	addi	s0,sp,16
    void run() { this->status = RUNNABLE; }
    80002f84:	04052823          	sw	zero,80(a0)
        return -1;
    thread->run();
    Scheduler::put(thread);
    80002f88:	00002097          	auipc	ra,0x2
    80002f8c:	aa4080e7          	jalr	-1372(ra) # 80004a2c <_ZN9Scheduler3putEP3TCB>
    TCB::_thread_dispatch();
    80002f90:	00002097          	auipc	ra,0x2
    80002f94:	298080e7          	jalr	664(ra) # 80005228 <_ZN3TCB16_thread_dispatchEv>
    return 0;
    80002f98:	00000513          	li	a0,0
}
    80002f9c:	00813083          	ld	ra,8(sp)
    80002fa0:	00013403          	ld	s0,0(sp)
    80002fa4:	01010113          	addi	sp,sp,16
    80002fa8:	00008067          	ret
        return -1;
    80002fac:	fff00513          	li	a0,-1
}
    80002fb0:	00008067          	ret

0000000080002fb4 <_Z8userMainv>:
    void periodicActivation() override {
        cout << "Hello from periodic thread!" << endl;
    }
};

int userMain() {
    80002fb4:	e4010113          	addi	sp,sp,-448
    80002fb8:	1a113c23          	sd	ra,440(sp)
    80002fbc:	1a813823          	sd	s0,432(sp)
    80002fc0:	1a913423          	sd	s1,424(sp)
    80002fc4:	1b213023          	sd	s2,416(sp)
    80002fc8:	19313c23          	sd	s3,408(sp)
    80002fcc:	1c010413          	addi	s0,sp,448

    dramatic_print("Hello There!! Welcome to my Operating System.\n");
    80002fd0:	00005517          	auipc	a0,0x5
    80002fd4:	0a050513          	addi	a0,a0,160 # 80008070 <CONSOLE_STATUS+0x60>
    80002fd8:	fffff097          	auipc	ra,0xfffff
    80002fdc:	770080e7          	jalr	1904(ra) # 80002748 <_Z14dramatic_printPKc>
    Thread *threads[THRD];
    for (int i = 0; i < THRD; i++) {
    80002fe0:	00000913          	li	s2,0
    80002fe4:	0340006f          	j	80003018 <_Z8userMainv+0x64>
    explicit FibonacciThread(char c) : Thread(), c(c) {}
    80002fe8:	00007797          	auipc	a5,0x7
    80002fec:	3e078793          	addi	a5,a5,992 # 8000a3c8 <_ZTV15FibonacciThread+0x10>
    80002ff0:	00f4b023          	sd	a5,0(s1)
    80002ff4:	03348023          	sb	s3,32(s1)
        threads[i] = new FibonacciThread('A' + i);
    80002ff8:	00391793          	slli	a5,s2,0x3
    80002ffc:	fd040713          	addi	a4,s0,-48
    80003000:	00f707b3          	add	a5,a4,a5
    80003004:	e697b823          	sd	s1,-400(a5)
        threads[i]->start();
    80003008:	00048513          	mv	a0,s1
    8000300c:	00001097          	auipc	ra,0x1
    80003010:	0f0080e7          	jalr	240(ra) # 800040fc <_ZN6Thread5startEv>
    for (int i = 0; i < THRD; i++) {
    80003014:	0019091b          	addiw	s2,s2,1
    80003018:	03100793          	li	a5,49
    8000301c:	0327c463          	blt	a5,s2,80003044 <_Z8userMainv+0x90>
        threads[i] = new FibonacciThread('A' + i);
    80003020:	02800513          	li	a0,40
    80003024:	00001097          	auipc	ra,0x1
    80003028:	f40080e7          	jalr	-192(ra) # 80003f64 <_Znwm>
    8000302c:	00050493          	mv	s1,a0
    80003030:	0419099b          	addiw	s3,s2,65
    80003034:	0ff9f993          	andi	s3,s3,255
    explicit FibonacciThread(char c) : Thread(), c(c) {}
    80003038:	00001097          	auipc	ra,0x1
    8000303c:	220080e7          	jalr	544(ra) # 80004258 <_ZN6ThreadC1Ev>
    80003040:	fa9ff06f          	j	80002fe8 <_Z8userMainv+0x34>
    }
    for (auto & thread : threads) {
    80003044:	e4040493          	addi	s1,s0,-448
    80003048:	fd040793          	addi	a5,s0,-48
    8000304c:	00f48c63          	beq	s1,a5,80003064 <_Z8userMainv+0xb0>
        thread->join();
    80003050:	0004b503          	ld	a0,0(s1)
    80003054:	00001097          	auipc	ra,0x1
    80003058:	0e0080e7          	jalr	224(ra) # 80004134 <_ZN6Thread4joinEv>
    for (auto & thread : threads) {
    8000305c:	00848493          	addi	s1,s1,8
    80003060:	fe9ff06f          	j	80003048 <_Z8userMainv+0x94>
    }
    Thread *sleeper1 = new SleeperThread(10), *sleeper2 = new SleeperThread(20), *sleeper4 = new SleeperThread(40);
    80003064:	02800513          	li	a0,40
    80003068:	00001097          	auipc	ra,0x1
    8000306c:	efc080e7          	jalr	-260(ra) # 80003f64 <_Znwm>
    80003070:	00050993          	mv	s3,a0
    explicit SleeperThread(int time) : time(time) {}
    80003074:	00001097          	auipc	ra,0x1
    80003078:	1e4080e7          	jalr	484(ra) # 80004258 <_ZN6ThreadC1Ev>
    8000307c:	00007797          	auipc	a5,0x7
    80003080:	37478793          	addi	a5,a5,884 # 8000a3f0 <_ZTV13SleeperThread+0x10>
    80003084:	00f9b023          	sd	a5,0(s3)
    80003088:	00a00793          	li	a5,10
    8000308c:	02f9a023          	sw	a5,32(s3)
    Thread *sleeper1 = new SleeperThread(10), *sleeper2 = new SleeperThread(20), *sleeper4 = new SleeperThread(40);
    80003090:	02800513          	li	a0,40
    80003094:	00001097          	auipc	ra,0x1
    80003098:	ed0080e7          	jalr	-304(ra) # 80003f64 <_Znwm>
    8000309c:	00050913          	mv	s2,a0
    explicit SleeperThread(int time) : time(time) {}
    800030a0:	00001097          	auipc	ra,0x1
    800030a4:	1b8080e7          	jalr	440(ra) # 80004258 <_ZN6ThreadC1Ev>
    800030a8:	00007797          	auipc	a5,0x7
    800030ac:	34878793          	addi	a5,a5,840 # 8000a3f0 <_ZTV13SleeperThread+0x10>
    800030b0:	00f93023          	sd	a5,0(s2)
    800030b4:	01400793          	li	a5,20
    800030b8:	02f92023          	sw	a5,32(s2)
    Thread *sleeper1 = new SleeperThread(10), *sleeper2 = new SleeperThread(20), *sleeper4 = new SleeperThread(40);
    800030bc:	02800513          	li	a0,40
    800030c0:	00001097          	auipc	ra,0x1
    800030c4:	ea4080e7          	jalr	-348(ra) # 80003f64 <_Znwm>
    800030c8:	00050493          	mv	s1,a0
    explicit SleeperThread(int time) : time(time) {}
    800030cc:	00001097          	auipc	ra,0x1
    800030d0:	18c080e7          	jalr	396(ra) # 80004258 <_ZN6ThreadC1Ev>
    800030d4:	00007797          	auipc	a5,0x7
    800030d8:	31c78793          	addi	a5,a5,796 # 8000a3f0 <_ZTV13SleeperThread+0x10>
    800030dc:	00f4b023          	sd	a5,0(s1)
    800030e0:	02800793          	li	a5,40
    800030e4:	02f4a023          	sw	a5,32(s1)
    sleeper1->start();
    800030e8:	00098513          	mv	a0,s3
    800030ec:	00001097          	auipc	ra,0x1
    800030f0:	010080e7          	jalr	16(ra) # 800040fc <_ZN6Thread5startEv>
    sleeper2->start();
    800030f4:	00090513          	mv	a0,s2
    800030f8:	00001097          	auipc	ra,0x1
    800030fc:	004080e7          	jalr	4(ra) # 800040fc <_ZN6Thread5startEv>
    sleeper4->start();
    80003100:	00048513          	mv	a0,s1
    80003104:	00001097          	auipc	ra,0x1
    80003108:	ff8080e7          	jalr	-8(ra) # 800040fc <_ZN6Thread5startEv>
    sleeper1->join();
    8000310c:	00098513          	mv	a0,s3
    80003110:	00001097          	auipc	ra,0x1
    80003114:	024080e7          	jalr	36(ra) # 80004134 <_ZN6Thread4joinEv>
    sleeper2->join();
    80003118:	00090513          	mv	a0,s2
    8000311c:	00001097          	auipc	ra,0x1
    80003120:	018080e7          	jalr	24(ra) # 80004134 <_ZN6Thread4joinEv>
    sleeper4->join();
    80003124:	00048513          	mv	a0,s1
    80003128:	00001097          	auipc	ra,0x1
    8000312c:	00c080e7          	jalr	12(ra) # 80004134 <_ZN6Thread4joinEv>
    Pthread *pthread = new Pthread(10);
    80003130:	02800513          	li	a0,40
    80003134:	00001097          	auipc	ra,0x1
    80003138:	e30080e7          	jalr	-464(ra) # 80003f64 <_Znwm>
    8000313c:	00050493          	mv	s1,a0
    explicit Pthread(int period) : PeriodicThread(period) {}
    80003140:	00a00593          	li	a1,10
    80003144:	00001097          	auipc	ra,0x1
    80003148:	1c4080e7          	jalr	452(ra) # 80004308 <_ZN14PeriodicThreadC1Em>
    8000314c:	0900006f          	j	800031dc <_Z8userMainv+0x228>
    80003150:	00050913          	mv	s2,a0
        threads[i] = new FibonacciThread('A' + i);
    80003154:	00048513          	mv	a0,s1
    80003158:	00001097          	auipc	ra,0x1
    8000315c:	e5c080e7          	jalr	-420(ra) # 80003fb4 <_ZdlPv>
    80003160:	00090513          	mv	a0,s2
    80003164:	00008097          	auipc	ra,0x8
    80003168:	6d4080e7          	jalr	1748(ra) # 8000b838 <_Unwind_Resume>
    8000316c:	00050493          	mv	s1,a0
    Thread *sleeper1 = new SleeperThread(10), *sleeper2 = new SleeperThread(20), *sleeper4 = new SleeperThread(40);
    80003170:	00098513          	mv	a0,s3
    80003174:	00001097          	auipc	ra,0x1
    80003178:	e40080e7          	jalr	-448(ra) # 80003fb4 <_ZdlPv>
    8000317c:	00048513          	mv	a0,s1
    80003180:	00008097          	auipc	ra,0x8
    80003184:	6b8080e7          	jalr	1720(ra) # 8000b838 <_Unwind_Resume>
    80003188:	00050493          	mv	s1,a0
    8000318c:	00090513          	mv	a0,s2
    80003190:	00001097          	auipc	ra,0x1
    80003194:	e24080e7          	jalr	-476(ra) # 80003fb4 <_ZdlPv>
    80003198:	00048513          	mv	a0,s1
    8000319c:	00008097          	auipc	ra,0x8
    800031a0:	69c080e7          	jalr	1692(ra) # 8000b838 <_Unwind_Resume>
    800031a4:	00050913          	mv	s2,a0
    800031a8:	00048513          	mv	a0,s1
    800031ac:	00001097          	auipc	ra,0x1
    800031b0:	e08080e7          	jalr	-504(ra) # 80003fb4 <_ZdlPv>
    800031b4:	00090513          	mv	a0,s2
    800031b8:	00008097          	auipc	ra,0x8
    800031bc:	680080e7          	jalr	1664(ra) # 8000b838 <_Unwind_Resume>
    800031c0:	00050913          	mv	s2,a0
    Pthread *pthread = new Pthread(10);
    800031c4:	00048513          	mv	a0,s1
    800031c8:	00001097          	auipc	ra,0x1
    800031cc:	dec080e7          	jalr	-532(ra) # 80003fb4 <_ZdlPv>
    800031d0:	00090513          	mv	a0,s2
    800031d4:	00008097          	auipc	ra,0x8
    800031d8:	664080e7          	jalr	1636(ra) # 8000b838 <_Unwind_Resume>
    explicit Pthread(int period) : PeriodicThread(period) {}
    800031dc:	00007797          	auipc	a5,0x7
    800031e0:	23c78793          	addi	a5,a5,572 # 8000a418 <_ZTV7Pthread+0x10>
    800031e4:	00f4b023          	sd	a5,0(s1)
    pthread->start();
    800031e8:	00048513          	mv	a0,s1
    800031ec:	00001097          	auipc	ra,0x1
    800031f0:	f10080e7          	jalr	-240(ra) # 800040fc <_ZN6Thread5startEv>
    time_sleep(100);
    800031f4:	06400513          	li	a0,100
    800031f8:	ffffe097          	auipc	ra,0xffffe
    800031fc:	6e4080e7          	jalr	1764(ra) # 800018dc <_Z10time_sleepm>
    pthread->terminate();
    80003200:	00048513          	mv	a0,s1
    80003204:	00001097          	auipc	ra,0x1
    80003208:	0e8080e7          	jalr	232(ra) # 800042ec <_ZN14PeriodicThread9terminateEv>
    pthread->join();
    8000320c:	00048513          	mv	a0,s1
    80003210:	00001097          	auipc	ra,0x1
    80003214:	f24080e7          	jalr	-220(ra) # 80004134 <_ZN6Thread4joinEv>
    return 0;
    80003218:	00000513          	li	a0,0
    8000321c:	1b813083          	ld	ra,440(sp)
    80003220:	1b013403          	ld	s0,432(sp)
    80003224:	1a813483          	ld	s1,424(sp)
    80003228:	1a013903          	ld	s2,416(sp)
    8000322c:	19813983          	ld	s3,408(sp)
    80003230:	1c010113          	addi	sp,sp,448
    80003234:	00008067          	ret

0000000080003238 <_ZN15FibonacciThreadD1Ev>:
class FibonacciThread : public Thread {
    80003238:	ff010113          	addi	sp,sp,-16
    8000323c:	00113423          	sd	ra,8(sp)
    80003240:	00813023          	sd	s0,0(sp)
    80003244:	01010413          	addi	s0,sp,16
    80003248:	00007797          	auipc	a5,0x7
    8000324c:	18078793          	addi	a5,a5,384 # 8000a3c8 <_ZTV15FibonacciThread+0x10>
    80003250:	00f53023          	sd	a5,0(a0)
    80003254:	00001097          	auipc	ra,0x1
    80003258:	d88080e7          	jalr	-632(ra) # 80003fdc <_ZN6ThreadD1Ev>
    8000325c:	00813083          	ld	ra,8(sp)
    80003260:	00013403          	ld	s0,0(sp)
    80003264:	01010113          	addi	sp,sp,16
    80003268:	00008067          	ret

000000008000326c <_ZN15FibonacciThreadD0Ev>:
    8000326c:	fe010113          	addi	sp,sp,-32
    80003270:	00113c23          	sd	ra,24(sp)
    80003274:	00813823          	sd	s0,16(sp)
    80003278:	00913423          	sd	s1,8(sp)
    8000327c:	02010413          	addi	s0,sp,32
    80003280:	00050493          	mv	s1,a0
    80003284:	00007797          	auipc	a5,0x7
    80003288:	14478793          	addi	a5,a5,324 # 8000a3c8 <_ZTV15FibonacciThread+0x10>
    8000328c:	00f53023          	sd	a5,0(a0)
    80003290:	00001097          	auipc	ra,0x1
    80003294:	d4c080e7          	jalr	-692(ra) # 80003fdc <_ZN6ThreadD1Ev>
    80003298:	00048513          	mv	a0,s1
    8000329c:	00001097          	auipc	ra,0x1
    800032a0:	d18080e7          	jalr	-744(ra) # 80003fb4 <_ZdlPv>
    800032a4:	01813083          	ld	ra,24(sp)
    800032a8:	01013403          	ld	s0,16(sp)
    800032ac:	00813483          	ld	s1,8(sp)
    800032b0:	02010113          	addi	sp,sp,32
    800032b4:	00008067          	ret

00000000800032b8 <_ZN13SleeperThreadD1Ev>:
class SleeperThread : public Thread {
    800032b8:	ff010113          	addi	sp,sp,-16
    800032bc:	00113423          	sd	ra,8(sp)
    800032c0:	00813023          	sd	s0,0(sp)
    800032c4:	01010413          	addi	s0,sp,16
    800032c8:	00007797          	auipc	a5,0x7
    800032cc:	12878793          	addi	a5,a5,296 # 8000a3f0 <_ZTV13SleeperThread+0x10>
    800032d0:	00f53023          	sd	a5,0(a0)
    800032d4:	00001097          	auipc	ra,0x1
    800032d8:	d08080e7          	jalr	-760(ra) # 80003fdc <_ZN6ThreadD1Ev>
    800032dc:	00813083          	ld	ra,8(sp)
    800032e0:	00013403          	ld	s0,0(sp)
    800032e4:	01010113          	addi	sp,sp,16
    800032e8:	00008067          	ret

00000000800032ec <_ZN13SleeperThreadD0Ev>:
    800032ec:	fe010113          	addi	sp,sp,-32
    800032f0:	00113c23          	sd	ra,24(sp)
    800032f4:	00813823          	sd	s0,16(sp)
    800032f8:	00913423          	sd	s1,8(sp)
    800032fc:	02010413          	addi	s0,sp,32
    80003300:	00050493          	mv	s1,a0
    80003304:	00007797          	auipc	a5,0x7
    80003308:	0ec78793          	addi	a5,a5,236 # 8000a3f0 <_ZTV13SleeperThread+0x10>
    8000330c:	00f53023          	sd	a5,0(a0)
    80003310:	00001097          	auipc	ra,0x1
    80003314:	ccc080e7          	jalr	-820(ra) # 80003fdc <_ZN6ThreadD1Ev>
    80003318:	00048513          	mv	a0,s1
    8000331c:	00001097          	auipc	ra,0x1
    80003320:	c98080e7          	jalr	-872(ra) # 80003fb4 <_ZdlPv>
    80003324:	01813083          	ld	ra,24(sp)
    80003328:	01013403          	ld	s0,16(sp)
    8000332c:	00813483          	ld	s1,8(sp)
    80003330:	02010113          	addi	sp,sp,32
    80003334:	00008067          	ret

0000000080003338 <_ZN7PthreadD1Ev>:
class Pthread : public PeriodicThread {
    80003338:	ff010113          	addi	sp,sp,-16
    8000333c:	00113423          	sd	ra,8(sp)
    80003340:	00813023          	sd	s0,0(sp)
    80003344:	01010413          	addi	s0,sp,16
public:
    Mutex() : Semaphore(1) {}
};


class PeriodicThread : public Thread {
    80003348:	00007797          	auipc	a5,0x7
    8000334c:	2a07b783          	ld	a5,672(a5) # 8000a5e8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003350:	01078793          	addi	a5,a5,16
    80003354:	00f53023          	sd	a5,0(a0)
    80003358:	00001097          	auipc	ra,0x1
    8000335c:	c84080e7          	jalr	-892(ra) # 80003fdc <_ZN6ThreadD1Ev>
    80003360:	00813083          	ld	ra,8(sp)
    80003364:	00013403          	ld	s0,0(sp)
    80003368:	01010113          	addi	sp,sp,16
    8000336c:	00008067          	ret

0000000080003370 <_ZN7PthreadD0Ev>:
    80003370:	fe010113          	addi	sp,sp,-32
    80003374:	00113c23          	sd	ra,24(sp)
    80003378:	00813823          	sd	s0,16(sp)
    8000337c:	00913423          	sd	s1,8(sp)
    80003380:	02010413          	addi	s0,sp,32
    80003384:	00050493          	mv	s1,a0
    80003388:	00007797          	auipc	a5,0x7
    8000338c:	2607b783          	ld	a5,608(a5) # 8000a5e8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003390:	01078793          	addi	a5,a5,16
    80003394:	00f53023          	sd	a5,0(a0)
    80003398:	00001097          	auipc	ra,0x1
    8000339c:	c44080e7          	jalr	-956(ra) # 80003fdc <_ZN6ThreadD1Ev>
    800033a0:	00048513          	mv	a0,s1
    800033a4:	00001097          	auipc	ra,0x1
    800033a8:	c10080e7          	jalr	-1008(ra) # 80003fb4 <_ZdlPv>
    800033ac:	01813083          	ld	ra,24(sp)
    800033b0:	01013403          	ld	s0,16(sp)
    800033b4:	00813483          	ld	s1,8(sp)
    800033b8:	02010113          	addi	sp,sp,32
    800033bc:	00008067          	ret

00000000800033c0 <_ZN13SleeperThread3runEv>:
    void run() override {
    800033c0:	fe010113          	addi	sp,sp,-32
    800033c4:	00113c23          	sd	ra,24(sp)
    800033c8:	00813823          	sd	s0,16(sp)
    800033cc:	00913423          	sd	s1,8(sp)
    800033d0:	01213023          	sd	s2,0(sp)
    800033d4:	02010413          	addi	s0,sp,32
    800033d8:	00050913          	mv	s2,a0
        for (int i = 0; i < 100 / time; i++) {
    800033dc:	00000493          	li	s1,0
    800033e0:	02092503          	lw	a0,32(s2)
    800033e4:	06400793          	li	a5,100
    800033e8:	02a7c7bb          	divw	a5,a5,a0
    800033ec:	06f4d063          	bge	s1,a5,8000344c <_ZN13SleeperThread3runEv+0x8c>
            Thread::sleep(time);
    800033f0:	00001097          	auipc	ra,0x1
    800033f4:	df0080e7          	jalr	-528(ra) # 800041e0 <_ZN6Thread5sleepEm>
            cout << "Hello thread " << time / 10 << "s!"<< endl;
    800033f8:	00005597          	auipc	a1,0x5
    800033fc:	c4058593          	addi	a1,a1,-960 # 80008038 <CONSOLE_STATUS+0x28>
    80003400:	00007517          	auipc	a0,0x7
    80003404:	24853503          	ld	a0,584(a0) # 8000a648 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003408:	00000097          	auipc	ra,0x0
    8000340c:	674080e7          	jalr	1652(ra) # 80003a7c <_ZNK3stm7istreamlsEPKc>
    80003410:	02092583          	lw	a1,32(s2)
    80003414:	00a00793          	li	a5,10
    80003418:	02f5c5bb          	divw	a1,a1,a5
    8000341c:	00000097          	auipc	ra,0x0
    80003420:	714080e7          	jalr	1812(ra) # 80003b30 <_ZNK3stm7istreamlsEi>
    80003424:	00005597          	auipc	a1,0x5
    80003428:	c2458593          	addi	a1,a1,-988 # 80008048 <CONSOLE_STATUS+0x38>
    8000342c:	00000097          	auipc	ra,0x0
    80003430:	650080e7          	jalr	1616(ra) # 80003a7c <_ZNK3stm7istreamlsEPKc>
    80003434:	00007597          	auipc	a1,0x7
    80003438:	1e45b583          	ld	a1,484(a1) # 8000a618 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000343c:	00000097          	auipc	ra,0x0
    80003440:	7f8080e7          	jalr	2040(ra) # 80003c34 <_ZNK3stm7istreamlsERKNS_7endlineE>
        for (int i = 0; i < 100 / time; i++) {
    80003444:	0014849b          	addiw	s1,s1,1
    80003448:	f99ff06f          	j	800033e0 <_ZN13SleeperThread3runEv+0x20>
    }
    8000344c:	01813083          	ld	ra,24(sp)
    80003450:	01013403          	ld	s0,16(sp)
    80003454:	00813483          	ld	s1,8(sp)
    80003458:	00013903          	ld	s2,0(sp)
    8000345c:	02010113          	addi	sp,sp,32
    80003460:	00008067          	ret

0000000080003464 <_ZN7Pthread18periodicActivationEv>:
    void periodicActivation() override {
    80003464:	ff010113          	addi	sp,sp,-16
    80003468:	00113423          	sd	ra,8(sp)
    8000346c:	00813023          	sd	s0,0(sp)
    80003470:	01010413          	addi	s0,sp,16
        cout << "Hello from periodic thread!" << endl;
    80003474:	00005597          	auipc	a1,0x5
    80003478:	bdc58593          	addi	a1,a1,-1060 # 80008050 <CONSOLE_STATUS+0x40>
    8000347c:	00007517          	auipc	a0,0x7
    80003480:	1cc53503          	ld	a0,460(a0) # 8000a648 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003484:	00000097          	auipc	ra,0x0
    80003488:	5f8080e7          	jalr	1528(ra) # 80003a7c <_ZNK3stm7istreamlsEPKc>
    8000348c:	00007597          	auipc	a1,0x7
    80003490:	18c5b583          	ld	a1,396(a1) # 8000a618 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003494:	00000097          	auipc	ra,0x0
    80003498:	7a0080e7          	jalr	1952(ra) # 80003c34 <_ZNK3stm7istreamlsERKNS_7endlineE>
    }
    8000349c:	00813083          	ld	ra,8(sp)
    800034a0:	00013403          	ld	s0,0(sp)
    800034a4:	01010113          	addi	sp,sp,16
    800034a8:	00008067          	ret

00000000800034ac <_ZN15FibonacciThread9fibonacciEi>:
    int fibonacci(int i) {
    800034ac:	fe010113          	addi	sp,sp,-32
    800034b0:	00113c23          	sd	ra,24(sp)
    800034b4:	00813823          	sd	s0,16(sp)
    800034b8:	00913423          	sd	s1,8(sp)
    800034bc:	02010413          	addi	s0,sp,32
        if (i < 0) return -1;
    800034c0:	0205cc63          	bltz	a1,800034f8 <_ZN15FibonacciThread9fibonacciEi+0x4c>
    800034c4:	00058493          	mv	s1,a1
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    800034c8:	00059e63          	bnez	a1,800034e4 <_ZN15FibonacciThread9fibonacciEi+0x38>
    }
    800034cc:	00048513          	mv	a0,s1
    800034d0:	01813083          	ld	ra,24(sp)
    800034d4:	01013403          	ld	s0,16(sp)
    800034d8:	00813483          	ld	s1,8(sp)
    800034dc:	02010113          	addi	sp,sp,32
    800034e0:	00008067          	ret
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    800034e4:	fff5859b          	addiw	a1,a1,-1
    800034e8:	00000097          	auipc	ra,0x0
    800034ec:	fc4080e7          	jalr	-60(ra) # 800034ac <_ZN15FibonacciThread9fibonacciEi>
    800034f0:	00a484bb          	addw	s1,s1,a0
    800034f4:	fd9ff06f          	j	800034cc <_ZN15FibonacciThread9fibonacciEi+0x20>
        if (i < 0) return -1;
    800034f8:	fff00493          	li	s1,-1
    800034fc:	fd1ff06f          	j	800034cc <_ZN15FibonacciThread9fibonacciEi+0x20>

0000000080003500 <_ZN15FibonacciThread3runEv>:
    void run() override {
    80003500:	fb010113          	addi	sp,sp,-80
    80003504:	04113423          	sd	ra,72(sp)
    80003508:	04813023          	sd	s0,64(sp)
    8000350c:	02913c23          	sd	s1,56(sp)
    80003510:	03213823          	sd	s2,48(sp)
    80003514:	03313423          	sd	s3,40(sp)
    80003518:	03413023          	sd	s4,32(sp)
    8000351c:	01513c23          	sd	s5,24(sp)
    80003520:	01613823          	sd	s6,16(sp)
    80003524:	01713423          	sd	s7,8(sp)
    80003528:	01813023          	sd	s8,0(sp)
    8000352c:	05010413          	addi	s0,sp,80
    80003530:	00050493          	mv	s1,a0
        for (int i = 0; i < 10; i++) {
    80003534:	00000913          	li	s2,0
    80003538:	0140006f          	j	8000354c <_ZN15FibonacciThread3runEv+0x4c>
            putc(c);
    8000353c:	0204c503          	lbu	a0,32(s1)
    80003540:	ffffe097          	auipc	ra,0xffffe
    80003544:	468080e7          	jalr	1128(ra) # 800019a8 <_Z4putcc>
        for (int i = 0; i < 10; i++) {
    80003548:	0019091b          	addiw	s2,s2,1
    8000354c:	00900793          	li	a5,9
    80003550:	0127ce63          	blt	a5,s2,8000356c <_ZN15FibonacciThread3runEv+0x6c>
            for (int i = 0; i < 10000000; i++);
    80003554:	00000713          	li	a4,0
    80003558:	009897b7          	lui	a5,0x989
    8000355c:	67f78793          	addi	a5,a5,1663 # 98967f <_entry-0x7f676981>
    80003560:	fce7cee3          	blt	a5,a4,8000353c <_ZN15FibonacciThread3runEv+0x3c>
    80003564:	0017071b          	addiw	a4,a4,1
    80003568:	ff1ff06f          	j	80003558 <_ZN15FibonacciThread3runEv+0x58>
        for (int i = 0; i < 10000000; i++);
    8000356c:	00000713          	li	a4,0
    80003570:	009897b7          	lui	a5,0x989
    80003574:	67f78793          	addi	a5,a5,1663 # 98967f <_entry-0x7f676981>
    80003578:	00e7c663          	blt	a5,a4,80003584 <_ZN15FibonacciThread3runEv+0x84>
    8000357c:	0017071b          	addiw	a4,a4,1
    80003580:	ff1ff06f          	j	80003570 <_ZN15FibonacciThread3runEv+0x70>
        for (int i = 0; i < 10000000; i++);
    80003584:	00000713          	li	a4,0
    80003588:	009897b7          	lui	a5,0x989
    8000358c:	67f78793          	addi	a5,a5,1663 # 98967f <_entry-0x7f676981>
    80003590:	00e7c663          	blt	a5,a4,8000359c <_ZN15FibonacciThread3runEv+0x9c>
    80003594:	0017071b          	addiw	a4,a4,1
    80003598:	ff1ff06f          	j	80003588 <_ZN15FibonacciThread3runEv+0x88>
        cout << fibonacci(static_cast<int>(c)) << endl;
    8000359c:	0204c903          	lbu	s2,32(s1)
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    800035a0:	04091c63          	bnez	s2,800035f8 <_ZN15FibonacciThread3runEv+0xf8>
        cout << fibonacci(static_cast<int>(c)) << endl;
    800035a4:	00090593          	mv	a1,s2
    800035a8:	00007517          	auipc	a0,0x7
    800035ac:	0a053503          	ld	a0,160(a0) # 8000a648 <_GLOBAL_OFFSET_TABLE_+0x90>
    800035b0:	00000097          	auipc	ra,0x0
    800035b4:	580080e7          	jalr	1408(ra) # 80003b30 <_ZNK3stm7istreamlsEi>
    800035b8:	00007597          	auipc	a1,0x7
    800035bc:	0605b583          	ld	a1,96(a1) # 8000a618 <_GLOBAL_OFFSET_TABLE_+0x60>
    800035c0:	00000097          	auipc	ra,0x0
    800035c4:	674080e7          	jalr	1652(ra) # 80003c34 <_ZNK3stm7istreamlsERKNS_7endlineE>
    }
    800035c8:	04813083          	ld	ra,72(sp)
    800035cc:	04013403          	ld	s0,64(sp)
    800035d0:	03813483          	ld	s1,56(sp)
    800035d4:	03013903          	ld	s2,48(sp)
    800035d8:	02813983          	ld	s3,40(sp)
    800035dc:	02013a03          	ld	s4,32(sp)
    800035e0:	01813a83          	ld	s5,24(sp)
    800035e4:	01013b03          	ld	s6,16(sp)
    800035e8:	00813b83          	ld	s7,8(sp)
    800035ec:	00013c03          	ld	s8,0(sp)
    800035f0:	05010113          	addi	sp,sp,80
    800035f4:	00008067          	ret
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    800035f8:	fff9099b          	addiw	s3,s2,-1
    800035fc:	0009879b          	sext.w	a5,s3
        if (i < 0) return -1;
    80003600:	02099713          	slli	a4,s3,0x20
    80003604:	0c074e63          	bltz	a4,800036e0 <_ZN15FibonacciThread3runEv+0x1e0>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003608:	00079663          	bnez	a5,80003614 <_ZN15FibonacciThread3runEv+0x114>
    8000360c:	00f9093b          	addw	s2,s2,a5
    80003610:	f95ff06f          	j	800035a4 <_ZN15FibonacciThread3runEv+0xa4>
    80003614:	fff98a1b          	addiw	s4,s3,-1
    80003618:	000a079b          	sext.w	a5,s4
        if (i < 0) return -1;
    8000361c:	020a1713          	slli	a4,s4,0x20
    80003620:	0a074c63          	bltz	a4,800036d8 <_ZN15FibonacciThread3runEv+0x1d8>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003624:	00079663          	bnez	a5,80003630 <_ZN15FibonacciThread3runEv+0x130>
    80003628:	00f987bb          	addw	a5,s3,a5
    8000362c:	fe1ff06f          	j	8000360c <_ZN15FibonacciThread3runEv+0x10c>
    80003630:	fffa0a9b          	addiw	s5,s4,-1
    80003634:	000a879b          	sext.w	a5,s5
        if (i < 0) return -1;
    80003638:	020a9713          	slli	a4,s5,0x20
    8000363c:	08074a63          	bltz	a4,800036d0 <_ZN15FibonacciThread3runEv+0x1d0>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003640:	00079663          	bnez	a5,8000364c <_ZN15FibonacciThread3runEv+0x14c>
    80003644:	00fa07bb          	addw	a5,s4,a5
    80003648:	fe1ff06f          	j	80003628 <_ZN15FibonacciThread3runEv+0x128>
    8000364c:	fffa8b1b          	addiw	s6,s5,-1
    80003650:	000b079b          	sext.w	a5,s6
        if (i < 0) return -1;
    80003654:	020b1713          	slli	a4,s6,0x20
    80003658:	06074863          	bltz	a4,800036c8 <_ZN15FibonacciThread3runEv+0x1c8>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    8000365c:	00079663          	bnez	a5,80003668 <_ZN15FibonacciThread3runEv+0x168>
    80003660:	00fa87bb          	addw	a5,s5,a5
    80003664:	fe1ff06f          	j	80003644 <_ZN15FibonacciThread3runEv+0x144>
    80003668:	fffb0b9b          	addiw	s7,s6,-1
    8000366c:	000b879b          	sext.w	a5,s7
        if (i < 0) return -1;
    80003670:	020b9713          	slli	a4,s7,0x20
    80003674:	04074663          	bltz	a4,800036c0 <_ZN15FibonacciThread3runEv+0x1c0>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003678:	00079663          	bnez	a5,80003684 <_ZN15FibonacciThread3runEv+0x184>
    8000367c:	00fb07bb          	addw	a5,s6,a5
    80003680:	fe1ff06f          	j	80003660 <_ZN15FibonacciThread3runEv+0x160>
    80003684:	fffb8c1b          	addiw	s8,s7,-1
    80003688:	000c079b          	sext.w	a5,s8
        if (i < 0) return -1;
    8000368c:	020c1713          	slli	a4,s8,0x20
    80003690:	02074463          	bltz	a4,800036b8 <_ZN15FibonacciThread3runEv+0x1b8>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003694:	00079663          	bnez	a5,800036a0 <_ZN15FibonacciThread3runEv+0x1a0>
    80003698:	00fb87bb          	addw	a5,s7,a5
    8000369c:	fe1ff06f          	j	8000367c <_ZN15FibonacciThread3runEv+0x17c>
    800036a0:	fffc059b          	addiw	a1,s8,-1
    800036a4:	00048513          	mv	a0,s1
    800036a8:	00000097          	auipc	ra,0x0
    800036ac:	e04080e7          	jalr	-508(ra) # 800034ac <_ZN15FibonacciThread9fibonacciEi>
    800036b0:	00ac07bb          	addw	a5,s8,a0
    800036b4:	fe5ff06f          	j	80003698 <_ZN15FibonacciThread3runEv+0x198>
        if (i < 0) return -1;
    800036b8:	fff00793          	li	a5,-1
    800036bc:	fddff06f          	j	80003698 <_ZN15FibonacciThread3runEv+0x198>
    800036c0:	fff00793          	li	a5,-1
    800036c4:	fb9ff06f          	j	8000367c <_ZN15FibonacciThread3runEv+0x17c>
    800036c8:	fff00793          	li	a5,-1
    800036cc:	f95ff06f          	j	80003660 <_ZN15FibonacciThread3runEv+0x160>
    800036d0:	fff00793          	li	a5,-1
    800036d4:	f71ff06f          	j	80003644 <_ZN15FibonacciThread3runEv+0x144>
    800036d8:	fff00793          	li	a5,-1
    800036dc:	f4dff06f          	j	80003628 <_ZN15FibonacciThread3runEv+0x128>
    800036e0:	fff00793          	li	a5,-1
    800036e4:	f29ff06f          	j	8000360c <_ZN15FibonacciThread3runEv+0x10c>

00000000800036e8 <_ZN9Allocator8mem_initEv>:
#include "../h/c_memory.hpp"
#include "../h/iostream.hpp"

Allocator::MemoryBlock *Allocator::free_pointer = nullptr;

void Allocator::mem_init() {
    800036e8:	ff010113          	addi	sp,sp,-16
    800036ec:	00813423          	sd	s0,8(sp)
    800036f0:	01010413          	addi	s0,sp,16
    Allocator::free_pointer = (Allocator::MemoryBlock *) HEAP_START_ADDR;
    800036f4:	00007797          	auipc	a5,0x7
    800036f8:	eec7b783          	ld	a5,-276(a5) # 8000a5e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800036fc:	0007b703          	ld	a4,0(a5)
    80003700:	00007797          	auipc	a5,0x7
    80003704:	fee7b823          	sd	a4,-16(a5) # 8000a6f0 <_ZN9Allocator12free_pointerE>
    *Allocator::free_pointer = {nullptr, reinterpret_cast<uint64>(HEAP_END_ADDR) -
    80003708:	00007797          	auipc	a5,0x7
    8000370c:	f287b783          	ld	a5,-216(a5) # 8000a630 <_GLOBAL_OFFSET_TABLE_+0x78>
    80003710:	0007b783          	ld	a5,0(a5)
    80003714:	40e787b3          	sub	a5,a5,a4
                                         reinterpret_cast<uint64>(HEAP_START_ADDR) - Allocator::HEADER_SIZE};
    80003718:	ff078793          	addi	a5,a5,-16
    *Allocator::free_pointer = {nullptr, reinterpret_cast<uint64>(HEAP_END_ADDR) -
    8000371c:	00073023          	sd	zero,0(a4)
    80003720:	00f73423          	sd	a5,8(a4)
}
    80003724:	00813403          	ld	s0,8(sp)
    80003728:	01010113          	addi	sp,sp,16
    8000372c:	00008067          	ret

0000000080003730 <_ZN9Allocator10_mem_allocEm>:

void *Allocator::_mem_alloc(size_t size) {
    80003730:	ff010113          	addi	sp,sp,-16
    80003734:	00813423          	sd	s0,8(sp)
    80003738:	01010413          	addi	s0,sp,16
    8000373c:	00050793          	mv	a5,a0
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    80003740:	00007517          	auipc	a0,0x7
    80003744:	fb053503          	ld	a0,-80(a0) # 8000a6f0 <_ZN9Allocator12free_pointerE>
    if (available && available->size < size) {
    80003748:	02050863          	beqz	a0,80003778 <_ZN9Allocator10_mem_allocEm+0x48>
    8000374c:	00853703          	ld	a4,8(a0)
    80003750:	02f77863          	bgeu	a4,a5,80003780 <_ZN9Allocator10_mem_allocEm+0x50>
        for (previous = available, available = available->next; available && available->size < size;
    80003754:	00050693          	mv	a3,a0
    80003758:	00053503          	ld	a0,0(a0)
    8000375c:	00c0006f          	j	80003768 <_ZN9Allocator10_mem_allocEm+0x38>
             previous = available, available = available->next);
    80003760:	00050693          	mv	a3,a0
    80003764:	00053503          	ld	a0,0(a0)
        for (previous = available, available = available->next; available && available->size < size;
    80003768:	00050e63          	beqz	a0,80003784 <_ZN9Allocator10_mem_allocEm+0x54>
    8000376c:	00853703          	ld	a4,8(a0)
    80003770:	fef768e3          	bltu	a4,a5,80003760 <_ZN9Allocator10_mem_allocEm+0x30>
    80003774:	0100006f          	j	80003784 <_ZN9Allocator10_mem_allocEm+0x54>
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    80003778:	00050693          	mv	a3,a0
    8000377c:	0080006f          	j	80003784 <_ZN9Allocator10_mem_allocEm+0x54>
    80003780:	00000693          	li	a3,0
    }
    if (!available) return nullptr;
    80003784:	04050463          	beqz	a0,800037cc <_ZN9Allocator10_mem_allocEm+0x9c>
    if (available->size > Allocator::HEADER_SIZE + size) {
    80003788:	00853703          	ld	a4,8(a0)
    8000378c:	01078613          	addi	a2,a5,16
    80003790:	04e67463          	bgeu	a2,a4,800037d8 <_ZN9Allocator10_mem_allocEm+0xa8>
        uint64 next_size = available->size - size - Allocator::HEADER_SIZE;
    80003794:	40f70733          	sub	a4,a4,a5
    80003798:	ff070713          	addi	a4,a4,-16
        available->size = size;
    8000379c:	00f53423          	sd	a5,8(a0)
        next_node = reinterpret_cast<Allocator::MemoryBlock *>(reinterpret_cast<uint64>(available) +
                                                               Allocator::HEADER_SIZE + size);
    800037a0:	00f507b3          	add	a5,a0,a5
    800037a4:	01078613          	addi	a2,a5,16
        next_node->next = available->next;
    800037a8:	00053583          	ld	a1,0(a0)
    800037ac:	00b7b823          	sd	a1,16(a5)
        next_node->size = next_size;
    800037b0:	00e63423          	sd	a4,8(a2)
    } else {
        next_node = available->next;
    }
    available->next = reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(available) ^ available->size);
    800037b4:	00853783          	ld	a5,8(a0)
    800037b8:	00f547b3          	xor	a5,a0,a5
    800037bc:	00f53023          	sd	a5,0(a0)
    if (previous) previous->next = next_node;
    800037c0:	02068063          	beqz	a3,800037e0 <_ZN9Allocator10_mem_allocEm+0xb0>
    800037c4:	00c6b023          	sd	a2,0(a3)
    else Allocator::free_pointer = next_node;
    return (void *) (available + 1);
    800037c8:	01050513          	addi	a0,a0,16
}
    800037cc:	00813403          	ld	s0,8(sp)
    800037d0:	01010113          	addi	sp,sp,16
    800037d4:	00008067          	ret
        next_node = available->next;
    800037d8:	00053603          	ld	a2,0(a0)
    800037dc:	fd9ff06f          	j	800037b4 <_ZN9Allocator10_mem_allocEm+0x84>
    else Allocator::free_pointer = next_node;
    800037e0:	00007797          	auipc	a5,0x7
    800037e4:	f0c7b823          	sd	a2,-240(a5) # 8000a6f0 <_ZN9Allocator12free_pointerE>
    800037e8:	fe1ff06f          	j	800037c8 <_ZN9Allocator10_mem_allocEm+0x98>

00000000800037ec <_ZN9Allocator9_mem_freeEPKv>:

int Allocator::_mem_free(const void *pointer) {
    800037ec:	ff010113          	addi	sp,sp,-16
    800037f0:	00813423          	sd	s0,8(sp)
    800037f4:	01010413          	addi	s0,sp,16
    Allocator::MemoryBlock *freed = (Allocator::MemoryBlock *) pointer - 1;
    800037f8:	ff050693          	addi	a3,a0,-16
    if (freed < HEAP_START_ADDR) return -1;
    800037fc:	00007797          	auipc	a5,0x7
    80003800:	de47b783          	ld	a5,-540(a5) # 8000a5e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003804:	0007b783          	ld	a5,0(a5)
    80003808:	0cf6ec63          	bltu	a3,a5,800038e0 <_ZN9Allocator9_mem_freeEPKv+0xf4>
    if (freed->next != reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(freed) ^ freed->size)) return -2;
    8000380c:	ff053703          	ld	a4,-16(a0)
    80003810:	ff853783          	ld	a5,-8(a0)
    80003814:	00068813          	mv	a6,a3
    80003818:	00d7c7b3          	xor	a5,a5,a3
    8000381c:	0cf71663          	bne	a4,a5,800038e8 <_ZN9Allocator9_mem_freeEPKv+0xfc>
    Allocator::MemoryBlock *previous = Allocator::free_pointer, *next_node;
    80003820:	00007717          	auipc	a4,0x7
    80003824:	ed073703          	ld	a4,-304(a4) # 8000a6f0 <_ZN9Allocator12free_pointerE>
    if (freed < Allocator::free_pointer) {
    80003828:	04e6fe63          	bgeu	a3,a4,80003884 <_ZN9Allocator9_mem_freeEPKv+0x98>
        next_node = Allocator::free_pointer;
        Allocator::free_pointer = freed;
    8000382c:	00007797          	auipc	a5,0x7
    80003830:	ecd7b223          	sd	a3,-316(a5) # 8000a6f0 <_ZN9Allocator12free_pointerE>
        next_node = Allocator::free_pointer;
    80003834:	00070793          	mv	a5,a4
        previous = nullptr;
    80003838:	00000713          	li	a4,0
inline bool Allocator::adjacent(Allocator::MemoryBlock *block1, Allocator::MemoryBlock *block2) {
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
}

inline void Allocator::merge(MemoryBlock *block1, MemoryBlock *block2) {
    if (!block1) return;
    8000383c:	00068e63          	beqz	a3,80003858 <_ZN9Allocator9_mem_freeEPKv+0x6c>
    if (block2 && Allocator::adjacent(block1, block2)) {
    80003840:	00078a63          	beqz	a5,80003854 <_ZN9Allocator9_mem_freeEPKv+0x68>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    80003844:	ff853583          	ld	a1,-8(a0)
    80003848:	00b68633          	add	a2,a3,a1
    8000384c:	01060613          	addi	a2,a2,16
    if (block2 && Allocator::adjacent(block1, block2)) {
    80003850:	04f60a63          	beq	a2,a5,800038a4 <_ZN9Allocator9_mem_freeEPKv+0xb8>
        block1->next = block2->next;
        block1->size += Allocator::HEADER_SIZE + block2->size;
    } else {
        block1->next = block2;
    80003854:	fef53823          	sd	a5,-16(a0)
    if (!block1) return;
    80003858:	08070c63          	beqz	a4,800038f0 <_ZN9Allocator9_mem_freeEPKv+0x104>
    if (block2 && Allocator::adjacent(block1, block2)) {
    8000385c:	00068a63          	beqz	a3,80003870 <_ZN9Allocator9_mem_freeEPKv+0x84>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    80003860:	00873603          	ld	a2,8(a4)
    80003864:	00c707b3          	add	a5,a4,a2
    80003868:	01078793          	addi	a5,a5,16
    if (block2 && Allocator::adjacent(block1, block2)) {
    8000386c:	04f80a63          	beq	a6,a5,800038c0 <_ZN9Allocator9_mem_freeEPKv+0xd4>
        block1->next = block2;
    80003870:	00d73023          	sd	a3,0(a4)
    return 0;
    80003874:	00000513          	li	a0,0
}
    80003878:	00813403          	ld	s0,8(sp)
    8000387c:	01010113          	addi	sp,sp,16
    80003880:	00008067          	ret
        for (next_node = previous->next; next_node && !(previous < freed && next_node > freed);
    80003884:	00073783          	ld	a5,0(a4)
    80003888:	00c0006f          	j	80003894 <_ZN9Allocator9_mem_freeEPKv+0xa8>
             previous = next_node, next_node = next_node->next);
    8000388c:	00078713          	mv	a4,a5
    80003890:	0007b783          	ld	a5,0(a5)
        for (next_node = previous->next; next_node && !(previous < freed && next_node > freed);
    80003894:	fa0784e3          	beqz	a5,8000383c <_ZN9Allocator9_mem_freeEPKv+0x50>
    80003898:	fed77ae3          	bgeu	a4,a3,8000388c <_ZN9Allocator9_mem_freeEPKv+0xa0>
    8000389c:	fef6f8e3          	bgeu	a3,a5,8000388c <_ZN9Allocator9_mem_freeEPKv+0xa0>
    800038a0:	f9dff06f          	j	8000383c <_ZN9Allocator9_mem_freeEPKv+0x50>
        block1->next = block2->next;
    800038a4:	0007b603          	ld	a2,0(a5)
    800038a8:	fec53823          	sd	a2,-16(a0)
        block1->size += Allocator::HEADER_SIZE + block2->size;
    800038ac:	0087b783          	ld	a5,8(a5)
    800038b0:	00f585b3          	add	a1,a1,a5
    800038b4:	01058593          	addi	a1,a1,16
    800038b8:	feb53c23          	sd	a1,-8(a0)
    800038bc:	f9dff06f          	j	80003858 <_ZN9Allocator9_mem_freeEPKv+0x6c>
        block1->next = block2->next;
    800038c0:	ff053783          	ld	a5,-16(a0)
    800038c4:	00f73023          	sd	a5,0(a4)
        block1->size += Allocator::HEADER_SIZE + block2->size;
    800038c8:	ff853783          	ld	a5,-8(a0)
    800038cc:	00f60633          	add	a2,a2,a5
    800038d0:	01060613          	addi	a2,a2,16
    800038d4:	00c73423          	sd	a2,8(a4)
    return 0;
    800038d8:	00000513          	li	a0,0
    800038dc:	f9dff06f          	j	80003878 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    if (freed < HEAP_START_ADDR) return -1;
    800038e0:	fff00513          	li	a0,-1
    800038e4:	f95ff06f          	j	80003878 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    if (freed->next != reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(freed) ^ freed->size)) return -2;
    800038e8:	ffe00513          	li	a0,-2
    800038ec:	f8dff06f          	j	80003878 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    return 0;
    800038f0:	00000513          	li	a0,0
    800038f4:	f85ff06f          	j	80003878 <_ZN9Allocator9_mem_freeEPKv+0x8c>

00000000800038f8 <_ZN9Allocator9mem_checkEv>:
    }
}

__attribute__((unused))
bool Allocator::mem_check() {
    800038f8:	ff010113          	addi	sp,sp,-16
    800038fc:	00813423          	sd	s0,8(sp)
    80003900:	01010413          	addi	s0,sp,16
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    80003904:	00007717          	auipc	a4,0x7
    80003908:	dec73703          	ld	a4,-532(a4) # 8000a6f0 <_ZN9Allocator12free_pointerE>
    8000390c:	00070793          	mv	a5,a4
    80003910:	00073703          	ld	a4,0(a4)
    80003914:	00070e63          	beqz	a4,80003930 <_ZN9Allocator9mem_checkEv+0x38>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    80003918:	0087b683          	ld	a3,8(a5)
    8000391c:	00d787b3          	add	a5,a5,a3
    80003920:	01078793          	addi	a5,a5,16
        if (Allocator::adjacent(curr, curr->next)) return false;
    80003924:	fee794e3          	bne	a5,a4,8000390c <_ZN9Allocator9mem_checkEv+0x14>
    80003928:	00000513          	li	a0,0
    8000392c:	0080006f          	j	80003934 <_ZN9Allocator9mem_checkEv+0x3c>
    }
    return true;
    80003930:	00100513          	li	a0,1
}
    80003934:	00813403          	ld	s0,8(sp)
    80003938:	01010113          	addi	sp,sp,16
    8000393c:	00008067          	ret

0000000080003940 <_ZN9Allocator8mem_showEv>:

__attribute__((unused))
void Allocator::mem_show() {
    80003940:	fe010113          	addi	sp,sp,-32
    80003944:	00113c23          	sd	ra,24(sp)
    80003948:	00813823          	sd	s0,16(sp)
    8000394c:	00913423          	sd	s1,8(sp)
    80003950:	02010413          	addi	s0,sp,32
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    80003954:	00007497          	auipc	s1,0x7
    80003958:	d9c4b483          	ld	s1,-612(s1) # 8000a6f0 <_ZN9Allocator12free_pointerE>
    8000395c:	0004b783          	ld	a5,0(s1)
    80003960:	04078e63          	beqz	a5,800039bc <_ZN9Allocator8mem_showEv+0x7c>
        stm::cout << curr << stm::endl << curr->next << stm::endl << stm::endl;
    80003964:	00048593          	mv	a1,s1
    80003968:	00007517          	auipc	a0,0x7
    8000396c:	ce053503          	ld	a0,-800(a0) # 8000a648 <_GLOBAL_OFFSET_TABLE_+0x90>
    80003970:	00000097          	auipc	ra,0x0
    80003974:	238080e7          	jalr	568(ra) # 80003ba8 <_ZNK3stm7istreamlsEPv>
    80003978:	00007597          	auipc	a1,0x7
    8000397c:	ca05b583          	ld	a1,-864(a1) # 8000a618 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003980:	00000097          	auipc	ra,0x0
    80003984:	2b4080e7          	jalr	692(ra) # 80003c34 <_ZNK3stm7istreamlsERKNS_7endlineE>
    80003988:	0004b583          	ld	a1,0(s1)
    8000398c:	00000097          	auipc	ra,0x0
    80003990:	21c080e7          	jalr	540(ra) # 80003ba8 <_ZNK3stm7istreamlsEPv>
    80003994:	00007597          	auipc	a1,0x7
    80003998:	c845b583          	ld	a1,-892(a1) # 8000a618 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000399c:	00000097          	auipc	ra,0x0
    800039a0:	298080e7          	jalr	664(ra) # 80003c34 <_ZNK3stm7istreamlsERKNS_7endlineE>
    800039a4:	00007597          	auipc	a1,0x7
    800039a8:	c745b583          	ld	a1,-908(a1) # 8000a618 <_GLOBAL_OFFSET_TABLE_+0x60>
    800039ac:	00000097          	auipc	ra,0x0
    800039b0:	288080e7          	jalr	648(ra) # 80003c34 <_ZNK3stm7istreamlsERKNS_7endlineE>
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    800039b4:	0004b483          	ld	s1,0(s1)
    800039b8:	fa5ff06f          	j	8000395c <_ZN9Allocator8mem_showEv+0x1c>
    }
}
    800039bc:	01813083          	ld	ra,24(sp)
    800039c0:	01013403          	ld	s0,16(sp)
    800039c4:	00813483          	ld	s1,8(sp)
    800039c8:	02010113          	addi	sp,sp,32
    800039cc:	00008067          	ret

00000000800039d0 <_ZN9Allocator8mem_sizeEv>:

__attribute__((unused))
int Allocator::mem_size() {
    800039d0:	ff010113          	addi	sp,sp,-16
    800039d4:	00813423          	sd	s0,8(sp)
    800039d8:	01010413          	addi	s0,sp,16
    int i = 0;
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr; i += curr->size, curr = curr->next);
    800039dc:	00007797          	auipc	a5,0x7
    800039e0:	d147b783          	ld	a5,-748(a5) # 8000a6f0 <_ZN9Allocator12free_pointerE>
    int i = 0;
    800039e4:	00000513          	li	a0,0
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr; i += curr->size, curr = curr->next);
    800039e8:	00078a63          	beqz	a5,800039fc <_ZN9Allocator8mem_sizeEv+0x2c>
    800039ec:	0087b703          	ld	a4,8(a5)
    800039f0:	00a7053b          	addw	a0,a4,a0
    800039f4:	0007b783          	ld	a5,0(a5)
    800039f8:	ff1ff06f          	j	800039e8 <_ZN9Allocator8mem_sizeEv+0x18>
    return i;
}
    800039fc:	00813403          	ld	s0,8(sp)
    80003a00:	01010113          	addi	sp,sp,16
    80003a04:	00008067          	ret

0000000080003a08 <_Z6memcpyPKvS0_i>:

void memcpy(const void *src, const void *dst, int len) {
    80003a08:	ff010113          	addi	sp,sp,-16
    80003a0c:	00813423          	sd	s0,8(sp)
    80003a10:	01010413          	addi	s0,sp,16
    char *src1 = (char *) src;
    char *dst1 = (char *) dst;
    for (int i = 0; i < len; i++)
    80003a14:	00000793          	li	a5,0
    80003a18:	00c7de63          	bge	a5,a2,80003a34 <_Z6memcpyPKvS0_i+0x2c>
        dst1[i] = src1[i];
    80003a1c:	00f58733          	add	a4,a1,a5
    80003a20:	00f506b3          	add	a3,a0,a5
    80003a24:	0006c683          	lbu	a3,0(a3)
    80003a28:	00d70023          	sb	a3,0(a4)
    for (int i = 0; i < len; i++)
    80003a2c:	0017879b          	addiw	a5,a5,1
    80003a30:	fe9ff06f          	j	80003a18 <_Z6memcpyPKvS0_i+0x10>
    80003a34:	00813403          	ld	s0,8(sp)
    80003a38:	01010113          	addi	sp,sp,16
    80003a3c:	00008067          	ret

0000000080003a40 <_ZNK3stm7istreamlsEc>:
#include "../h/string.hpp"

const stm::istream stm::cout;
const stm::endline stm::endl;

const stm::istream &stm::istream::operator<<(const char c) const {
    80003a40:	fe010113          	addi	sp,sp,-32
    80003a44:	00113c23          	sd	ra,24(sp)
    80003a48:	00813823          	sd	s0,16(sp)
    80003a4c:	00913423          	sd	s1,8(sp)
    80003a50:	02010413          	addi	s0,sp,32
    80003a54:	00050493          	mv	s1,a0
    putc(c);
    80003a58:	00058513          	mv	a0,a1
    80003a5c:	ffffe097          	auipc	ra,0xffffe
    80003a60:	f4c080e7          	jalr	-180(ra) # 800019a8 <_Z4putcc>
    return *this;
}
    80003a64:	00048513          	mv	a0,s1
    80003a68:	01813083          	ld	ra,24(sp)
    80003a6c:	01013403          	ld	s0,16(sp)
    80003a70:	00813483          	ld	s1,8(sp)
    80003a74:	02010113          	addi	sp,sp,32
    80003a78:	00008067          	ret

0000000080003a7c <_ZNK3stm7istreamlsEPKc>:

const stm::istream &stm::istream::operator<<(const char *string) const {
    80003a7c:	fe010113          	addi	sp,sp,-32
    80003a80:	00113c23          	sd	ra,24(sp)
    80003a84:	00813823          	sd	s0,16(sp)
    80003a88:	00913423          	sd	s1,8(sp)
    80003a8c:	02010413          	addi	s0,sp,32
    80003a90:	00050493          	mv	s1,a0
    print(string);
    80003a94:	00058513          	mv	a0,a1
    80003a98:	fffff097          	auipc	ra,0xfffff
    80003a9c:	c2c080e7          	jalr	-980(ra) # 800026c4 <_Z5printPKc>
    return *this;
}
    80003aa0:	00048513          	mv	a0,s1
    80003aa4:	01813083          	ld	ra,24(sp)
    80003aa8:	01013403          	ld	s0,16(sp)
    80003aac:	00813483          	ld	s1,8(sp)
    80003ab0:	02010113          	addi	sp,sp,32
    80003ab4:	00008067          	ret

0000000080003ab8 <_ZNK3stm7istreamlsERKNS_6stringE>:

const stm::istream &stm::istream::operator<<(const stm::string &string) const {
    80003ab8:	fe010113          	addi	sp,sp,-32
    80003abc:	00113c23          	sd	ra,24(sp)
    80003ac0:	00813823          	sd	s0,16(sp)
    80003ac4:	00913423          	sd	s1,8(sp)
    80003ac8:	02010413          	addi	s0,sp,32
    80003acc:	00050493          	mv	s1,a0
    print(string.actual_string);
    80003ad0:	0085b503          	ld	a0,8(a1)
    80003ad4:	fffff097          	auipc	ra,0xfffff
    80003ad8:	bf0080e7          	jalr	-1040(ra) # 800026c4 <_Z5printPKc>
    return *this;
}
    80003adc:	00048513          	mv	a0,s1
    80003ae0:	01813083          	ld	ra,24(sp)
    80003ae4:	01013403          	ld	s0,16(sp)
    80003ae8:	00813483          	ld	s1,8(sp)
    80003aec:	02010113          	addi	sp,sp,32
    80003af0:	00008067          	ret

0000000080003af4 <_ZNK3stm7istreamlsEx>:

const stm::istream &stm::istream::operator<<(long long number) const {
    80003af4:	fe010113          	addi	sp,sp,-32
    80003af8:	00113c23          	sd	ra,24(sp)
    80003afc:	00813823          	sd	s0,16(sp)
    80003b00:	00913423          	sd	s1,8(sp)
    80003b04:	02010413          	addi	s0,sp,32
    80003b08:	00050493          	mv	s1,a0
    print(number);
    80003b0c:	00058513          	mv	a0,a1
    80003b10:	fffff097          	auipc	ra,0xfffff
    80003b14:	cc8080e7          	jalr	-824(ra) # 800027d8 <_Z5printx>
    return *this;
}
    80003b18:	00048513          	mv	a0,s1
    80003b1c:	01813083          	ld	ra,24(sp)
    80003b20:	01013403          	ld	s0,16(sp)
    80003b24:	00813483          	ld	s1,8(sp)
    80003b28:	02010113          	addi	sp,sp,32
    80003b2c:	00008067          	ret

0000000080003b30 <_ZNK3stm7istreamlsEi>:

const stm::istream &stm::istream::operator<<(int number) const {
    80003b30:	fe010113          	addi	sp,sp,-32
    80003b34:	00113c23          	sd	ra,24(sp)
    80003b38:	00813823          	sd	s0,16(sp)
    80003b3c:	00913423          	sd	s1,8(sp)
    80003b40:	02010413          	addi	s0,sp,32
    80003b44:	00050493          	mv	s1,a0
    print(number);
    80003b48:	00058513          	mv	a0,a1
    80003b4c:	fffff097          	auipc	ra,0xfffff
    80003b50:	cd4080e7          	jalr	-812(ra) # 80002820 <_Z5printi>
    return *this;
}
    80003b54:	00048513          	mv	a0,s1
    80003b58:	01813083          	ld	ra,24(sp)
    80003b5c:	01013403          	ld	s0,16(sp)
    80003b60:	00813483          	ld	s1,8(sp)
    80003b64:	02010113          	addi	sp,sp,32
    80003b68:	00008067          	ret

0000000080003b6c <_ZNK3stm7istreamlsEm>:

const stm::istream &stm::istream::operator<<(uint64 number) const {
    80003b6c:	fe010113          	addi	sp,sp,-32
    80003b70:	00113c23          	sd	ra,24(sp)
    80003b74:	00813823          	sd	s0,16(sp)
    80003b78:	00913423          	sd	s1,8(sp)
    80003b7c:	02010413          	addi	s0,sp,32
    80003b80:	00050493          	mv	s1,a0
    print(number);
    80003b84:	00058513          	mv	a0,a1
    80003b88:	fffff097          	auipc	ra,0xfffff
    80003b8c:	cc0080e7          	jalr	-832(ra) # 80002848 <_Z5printm>
    return *this;
}
    80003b90:	00048513          	mv	a0,s1
    80003b94:	01813083          	ld	ra,24(sp)
    80003b98:	01013403          	ld	s0,16(sp)
    80003b9c:	00813483          	ld	s1,8(sp)
    80003ba0:	02010113          	addi	sp,sp,32
    80003ba4:	00008067          	ret

0000000080003ba8 <_ZNK3stm7istreamlsEPv>:

const stm::istream &stm::istream::operator<<(void *pointer) const {
    80003ba8:	fe010113          	addi	sp,sp,-32
    80003bac:	00113c23          	sd	ra,24(sp)
    80003bb0:	00813823          	sd	s0,16(sp)
    80003bb4:	00913423          	sd	s1,8(sp)
    80003bb8:	02010413          	addi	s0,sp,32
    80003bbc:	00050493          	mv	s1,a0
    print_h((uint64) pointer);
    80003bc0:	00058513          	mv	a0,a1
    80003bc4:	fffff097          	auipc	ra,0xfffff
    80003bc8:	ccc080e7          	jalr	-820(ra) # 80002890 <_Z7print_hm>
    return *this;
}
    80003bcc:	00048513          	mv	a0,s1
    80003bd0:	01813083          	ld	ra,24(sp)
    80003bd4:	01013403          	ld	s0,16(sp)
    80003bd8:	00813483          	ld	s1,8(sp)
    80003bdc:	02010113          	addi	sp,sp,32
    80003be0:	00008067          	ret

0000000080003be4 <_ZNK3stm7istreamlsEb>:

const stm::istream &stm::istream::operator<<(bool truth) const {
    80003be4:	fe010113          	addi	sp,sp,-32
    80003be8:	00113c23          	sd	ra,24(sp)
    80003bec:	00813823          	sd	s0,16(sp)
    80003bf0:	00913423          	sd	s1,8(sp)
    80003bf4:	02010413          	addi	s0,sp,32
    80003bf8:	00050493          	mv	s1,a0
    print(truth ? "true" : "false");
    80003bfc:	02058663          	beqz	a1,80003c28 <_ZNK3stm7istreamlsEb+0x44>
    80003c00:	00004517          	auipc	a0,0x4
    80003c04:	4a850513          	addi	a0,a0,1192 # 800080a8 <CONSOLE_STATUS+0x98>
    80003c08:	fffff097          	auipc	ra,0xfffff
    80003c0c:	abc080e7          	jalr	-1348(ra) # 800026c4 <_Z5printPKc>
    return *this;
}
    80003c10:	00048513          	mv	a0,s1
    80003c14:	01813083          	ld	ra,24(sp)
    80003c18:	01013403          	ld	s0,16(sp)
    80003c1c:	00813483          	ld	s1,8(sp)
    80003c20:	02010113          	addi	sp,sp,32
    80003c24:	00008067          	ret
    print(truth ? "true" : "false");
    80003c28:	00004517          	auipc	a0,0x4
    80003c2c:	47850513          	addi	a0,a0,1144 # 800080a0 <CONSOLE_STATUS+0x90>
    80003c30:	fd9ff06f          	j	80003c08 <_ZNK3stm7istreamlsEb+0x24>

0000000080003c34 <_ZNK3stm7istreamlsERKNS_7endlineE>:

const stm::istream &stm::istream::operator<<(const stm::endline &) const {
    80003c34:	fe010113          	addi	sp,sp,-32
    80003c38:	00113c23          	sd	ra,24(sp)
    80003c3c:	00813823          	sd	s0,16(sp)
    80003c40:	00913423          	sd	s1,8(sp)
    80003c44:	02010413          	addi	s0,sp,32
    80003c48:	00050493          	mv	s1,a0
    putc('\n');
    80003c4c:	00a00513          	li	a0,10
    80003c50:	ffffe097          	auipc	ra,0xffffe
    80003c54:	d58080e7          	jalr	-680(ra) # 800019a8 <_Z4putcc>
    return *this;
}
    80003c58:	00048513          	mv	a0,s1
    80003c5c:	01813083          	ld	ra,24(sp)
    80003c60:	01013403          	ld	s0,16(sp)
    80003c64:	00813483          	ld	s1,8(sp)
    80003c68:	02010113          	addi	sp,sp,32
    80003c6c:	00008067          	ret

0000000080003c70 <_Z11userWrapperPv>:
    thread_create(&handle_main, nullptr, nullptr);
    thread_create(&handle_idle, reinterpret_cast<void(*)(void*)>(Scheduler::idle_body), nullptr);
    riscv::ms_sstatus(riscv::SSTATUS_SIE);
}

void userWrapper(void *ret) {
    80003c70:	fe010113          	addi	sp,sp,-32
    80003c74:	00113c23          	sd	ra,24(sp)
    80003c78:	00813823          	sd	s0,16(sp)
    80003c7c:	00913423          	sd	s1,8(sp)
    80003c80:	02010413          	addi	s0,sp,32
    80003c84:	00050493          	mv	s1,a0
    *((int *) ret) = userMain();
    80003c88:	fffff097          	auipc	ra,0xfffff
    80003c8c:	32c080e7          	jalr	812(ra) # 80002fb4 <_Z8userMainv>
    80003c90:	00a4a023          	sw	a0,0(s1)
}
    80003c94:	01813083          	ld	ra,24(sp)
    80003c98:	01013403          	ld	s0,16(sp)
    80003c9c:	00813483          	ld	s1,8(sp)
    80003ca0:	02010113          	addi	sp,sp,32
    80003ca4:	00008067          	ret

0000000080003ca8 <_Z4callv>:

int call() {
    80003ca8:	fe010113          	addi	sp,sp,-32
    80003cac:	00113c23          	sd	ra,24(sp)
    80003cb0:	00813823          	sd	s0,16(sp)
    80003cb4:	02010413          	addi	s0,sp,32
    thread_t userHandle;
    int ret;
    thread_create(&userHandle, userWrapper, &ret);
    80003cb8:	fe440613          	addi	a2,s0,-28
    80003cbc:	00000597          	auipc	a1,0x0
    80003cc0:	fb458593          	addi	a1,a1,-76 # 80003c70 <_Z11userWrapperPv>
    80003cc4:	fe840513          	addi	a0,s0,-24
    80003cc8:	ffffe097          	auipc	ra,0xffffe
    80003ccc:	878080e7          	jalr	-1928(ra) # 80001540 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_join(userHandle);
    80003cd0:	fe843503          	ld	a0,-24(s0)
    80003cd4:	ffffe097          	auipc	ra,0xffffe
    80003cd8:	964080e7          	jalr	-1692(ra) # 80001638 <_Z11thread_joinP3TCB>
    return ret;
}
    80003cdc:	fe442503          	lw	a0,-28(s0)
    80003ce0:	01813083          	ld	ra,24(sp)
    80003ce4:	01013403          	ld	s0,16(sp)
    80003ce8:	02010113          	addi	sp,sp,32
    80003cec:	00008067          	ret

0000000080003cf0 <_Z3endi>:

int end(int ret) {
    80003cf0:	fe010113          	addi	sp,sp,-32
    80003cf4:	00113c23          	sd	ra,24(sp)
    80003cf8:	00813823          	sd	s0,16(sp)
    80003cfc:	00913423          	sd	s1,8(sp)
    80003d00:	02010413          	addi	s0,sp,32
    80003d04:	00050493          	mv	s1,a0
    print("\n\nProcess finished with exit code ");
    80003d08:	00004517          	auipc	a0,0x4
    80003d0c:	3b850513          	addi	a0,a0,952 # 800080c0 <_ZN3stm4coutE+0x8>
    80003d10:	fffff097          	auipc	ra,0xfffff
    80003d14:	9b4080e7          	jalr	-1612(ra) # 800026c4 <_Z5printPKc>
    print(ret);
    80003d18:	00048513          	mv	a0,s1
    80003d1c:	fffff097          	auipc	ra,0xfffff
    80003d20:	b04080e7          	jalr	-1276(ra) # 80002820 <_Z5printi>
    print("\n");
    80003d24:	00004517          	auipc	a0,0x4
    80003d28:	53c50513          	addi	a0,a0,1340 # 80008260 <_ZN3stm4coutE+0x1a8>
    80003d2c:	fffff097          	auipc	ra,0xfffff
    80003d30:	998080e7          	jalr	-1640(ra) # 800026c4 <_Z5printPKc>
        inline bool is_empty() const { return this->size == 0; }
    80003d34:	00007797          	auipc	a5,0x7
    80003d38:	8947b783          	ld	a5,-1900(a5) # 8000a5c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003d3c:	0107a783          	lw	a5,16(a5)
    while (!IO::Output.is_empty());
    80003d40:	fe079ae3          	bnez	a5,80003d34 <_Z3endi+0x44>
    time_sleep(10);
    80003d44:	00a00513          	li	a0,10
    80003d48:	ffffe097          	auipc	ra,0xffffe
    80003d4c:	b94080e7          	jalr	-1132(ra) # 800018dc <_Z10time_sleepm>
    return 0;
}
    80003d50:	00000513          	li	a0,0
    80003d54:	01813083          	ld	ra,24(sp)
    80003d58:	01013403          	ld	s0,16(sp)
    80003d5c:	00813483          	ld	s1,8(sp)
    80003d60:	02010113          	addi	sp,sp,32
    80003d64:	00008067          	ret

0000000080003d68 <main>:

int main() {
    80003d68:	ff010113          	addi	sp,sp,-16
    80003d6c:	00113423          	sd	ra,8(sp)
    80003d70:	00813023          	sd	s0,0(sp)
    80003d74:	01010413          	addi	s0,sp,16
    init();
    80003d78:	00000097          	auipc	ra,0x0
    80003d7c:	028080e7          	jalr	40(ra) # 80003da0 <_Z4initv>
    int ret = call();
    80003d80:	00000097          	auipc	ra,0x0
    80003d84:	f28080e7          	jalr	-216(ra) # 80003ca8 <_Z4callv>
    return end(ret);
    80003d88:	00000097          	auipc	ra,0x0
    80003d8c:	f68080e7          	jalr	-152(ra) # 80003cf0 <_Z3endi>
    80003d90:	00813083          	ld	ra,8(sp)
    80003d94:	00013403          	ld	s0,0(sp)
    80003d98:	01010113          	addi	sp,sp,16
    80003d9c:	00008067          	ret

0000000080003da0 <_Z4initv>:
inline void init() {
    80003da0:	fd010113          	addi	sp,sp,-48
    80003da4:	02113423          	sd	ra,40(sp)
    80003da8:	02813023          	sd	s0,32(sp)
    80003dac:	00913c23          	sd	s1,24(sp)
    80003db0:	01213823          	sd	s2,16(sp)
    80003db4:	03010413          	addi	s0,sp,48
    __asm__ volatile("mv t0, %0": : "r" (&supervisorTrap));
    80003db8:	00007797          	auipc	a5,0x7
    80003dbc:	8387b783          	ld	a5,-1992(a5) # 8000a5f0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003dc0:	00078293          	mv	t0,a5
    __asm__ volatile("addi t0, t0, 1");
    80003dc4:	00128293          	addi	t0,t0,1
    __asm__ volatile("csrw stvec, t0");
    80003dc8:	10529073          	csrw	stvec,t0
    Allocator::mem_init();
    80003dcc:	00000097          	auipc	ra,0x0
    80003dd0:	91c080e7          	jalr	-1764(ra) # 800036e8 <_ZN9Allocator8mem_initEv>
    IO::init();
    80003dd4:	fffff097          	auipc	ra,0xfffff
    80003dd8:	b48080e7          	jalr	-1208(ra) # 8000291c <_ZN2IO4initEv>
#include "syscall_c.hpp"

class Scheduler final {
public:

    static void init() { high_priority.init(); mid_priority.init(); low_priority.init(); }
    80003ddc:	00007517          	auipc	a0,0x7
    80003de0:	86453503          	ld	a0,-1948(a0) # 8000a640 <_GLOBAL_OFFSET_TABLE_+0x88>
    80003de4:	ffffe097          	auipc	ra,0xffffe
    80003de8:	6e8080e7          	jalr	1768(ra) # 800024cc <_ZN3stm14CircularBufferIP3TCBE4initEv>
    80003dec:	00007517          	auipc	a0,0x7
    80003df0:	83453503          	ld	a0,-1996(a0) # 8000a620 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003df4:	ffffe097          	auipc	ra,0xffffe
    80003df8:	6d8080e7          	jalr	1752(ra) # 800024cc <_ZN3stm14CircularBufferIP3TCBE4initEv>
    80003dfc:	00006517          	auipc	a0,0x6
    80003e00:	7fc53503          	ld	a0,2044(a0) # 8000a5f8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003e04:	ffffe097          	auipc	ra,0xffffe
    80003e08:	6c8080e7          	jalr	1736(ra) # 800024cc <_ZN3stm14CircularBufferIP3TCBE4initEv>
    printer = new OwnedMutex();
    80003e0c:	02000513          	li	a0,32
    80003e10:	00000097          	auipc	ra,0x0
    80003e14:	154080e7          	jalr	340(ra) # 80003f64 <_Znwm>
    80003e18:	00050493          	mv	s1,a0
    80003e1c:	00001097          	auipc	ra,0x1
    80003e20:	e70080e7          	jalr	-400(ra) # 80004c8c <_ZN10OwnedMutexC1Ev>
    80003e24:	00007797          	auipc	a5,0x7
    80003e28:	8c97ba23          	sd	s1,-1836(a5) # 8000a6f8 <printer>
    thread_create(&handle_main, nullptr, nullptr);
    80003e2c:	00000613          	li	a2,0
    80003e30:	00000593          	li	a1,0
    80003e34:	fd840513          	addi	a0,s0,-40
    80003e38:	ffffd097          	auipc	ra,0xffffd
    80003e3c:	708080e7          	jalr	1800(ra) # 80001540 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&handle_idle, reinterpret_cast<void(*)(void*)>(Scheduler::idle_body), nullptr);
    80003e40:	00000613          	li	a2,0
    80003e44:	00007597          	auipc	a1,0x7
    80003e48:	80c5b583          	ld	a1,-2036(a1) # 8000a650 <_GLOBAL_OFFSET_TABLE_+0x98>
    80003e4c:	fd040513          	addi	a0,s0,-48
    80003e50:	ffffd097          	auipc	ra,0xffffd
    80003e54:	6f0080e7          	jalr	1776(ra) # 80001540 <_Z13thread_createPP3TCBPFvPvES2_>
inline void riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80003e58:	00200793          	li	a5,2
    80003e5c:	1007a073          	csrs	sstatus,a5
}
    80003e60:	02813083          	ld	ra,40(sp)
    80003e64:	02013403          	ld	s0,32(sp)
    80003e68:	01813483          	ld	s1,24(sp)
    80003e6c:	01013903          	ld	s2,16(sp)
    80003e70:	03010113          	addi	sp,sp,48
    80003e74:	00008067          	ret
    80003e78:	00050913          	mv	s2,a0
    printer = new OwnedMutex();
    80003e7c:	00048513          	mv	a0,s1
    80003e80:	00000097          	auipc	ra,0x0
    80003e84:	134080e7          	jalr	308(ra) # 80003fb4 <_ZdlPv>
    80003e88:	00090513          	mv	a0,s2
    80003e8c:	00008097          	auipc	ra,0x8
    80003e90:	9ac080e7          	jalr	-1620(ra) # 8000b838 <_Unwind_Resume>

0000000080003e94 <_ZN6Thread11threadStartEPv>:
Thread::Thread() {
    this->body = nullptr;
    this->arg = nullptr;
}

void Thread::threadStart(void *arg) {
    80003e94:	ff010113          	addi	sp,sp,-16
    80003e98:	00113423          	sd	ra,8(sp)
    80003e9c:	00813023          	sd	s0,0(sp)
    80003ea0:	01010413          	addi	s0,sp,16
    Thread *thread = (Thread *) arg;
    if (thread->body) {
    80003ea4:	01053783          	ld	a5,16(a0)
    80003ea8:	00078e63          	beqz	a5,80003ec4 <_ZN6Thread11threadStartEPv+0x30>
        thread->body(thread->arg);
    80003eac:	01853503          	ld	a0,24(a0)
    80003eb0:	000780e7          	jalr	a5
    } else {
        thread->run();
    }
}
    80003eb4:	00813083          	ld	ra,8(sp)
    80003eb8:	00013403          	ld	s0,0(sp)
    80003ebc:	01010113          	addi	sp,sp,16
    80003ec0:	00008067          	ret
        thread->run();
    80003ec4:	00053783          	ld	a5,0(a0)
    80003ec8:	0107b783          	ld	a5,16(a5)
    80003ecc:	000780e7          	jalr	a5
}
    80003ed0:	fe5ff06f          	j	80003eb4 <_ZN6Thread11threadStartEPv+0x20>

0000000080003ed4 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80003ed4:	ff010113          	addi	sp,sp,-16
    80003ed8:	00113423          	sd	ra,8(sp)
    80003edc:	00813023          	sd	s0,0(sp)
    80003ee0:	01010413          	addi	s0,sp,16
    80003ee4:	00006797          	auipc	a5,0x6
    80003ee8:	58c78793          	addi	a5,a5,1420 # 8000a470 <_ZTV9Semaphore+0x10>
    80003eec:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80003ef0:	00853503          	ld	a0,8(a0)
    80003ef4:	ffffe097          	auipc	ra,0xffffe
    80003ef8:	8a8080e7          	jalr	-1880(ra) # 8000179c <_Z9sem_closeP3Sem>
}
    80003efc:	00813083          	ld	ra,8(sp)
    80003f00:	00013403          	ld	s0,0(sp)
    80003f04:	01010113          	addi	sp,sp,16
    80003f08:	00008067          	ret

0000000080003f0c <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80003f0c:	ff010113          	addi	sp,sp,-16
    80003f10:	00113423          	sd	ra,8(sp)
    80003f14:	00813023          	sd	s0,0(sp)
    80003f18:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80003f1c:	00853503          	ld	a0,8(a0)
    80003f20:	ffffe097          	auipc	ra,0xffffe
    80003f24:	8bc080e7          	jalr	-1860(ra) # 800017dc <_Z8sem_waitP3Sem>
}
    80003f28:	00813083          	ld	ra,8(sp)
    80003f2c:	00013403          	ld	s0,0(sp)
    80003f30:	01010113          	addi	sp,sp,16
    80003f34:	00008067          	ret

0000000080003f38 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80003f38:	ff010113          	addi	sp,sp,-16
    80003f3c:	00113423          	sd	ra,8(sp)
    80003f40:	00813023          	sd	s0,0(sp)
    80003f44:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80003f48:	00853503          	ld	a0,8(a0)
    80003f4c:	ffffe097          	auipc	ra,0xffffe
    80003f50:	8d0080e7          	jalr	-1840(ra) # 8000181c <_Z10sem_signalP3Sem>
}
    80003f54:	00813083          	ld	ra,8(sp)
    80003f58:	00013403          	ld	s0,0(sp)
    80003f5c:	01010113          	addi	sp,sp,16
    80003f60:	00008067          	ret

0000000080003f64 <_Znwm>:
void *operator new(size_t size) {
    80003f64:	ff010113          	addi	sp,sp,-16
    80003f68:	00113423          	sd	ra,8(sp)
    80003f6c:	00813023          	sd	s0,0(sp)
    80003f70:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003f74:	ffffd097          	auipc	ra,0xffffd
    80003f78:	544080e7          	jalr	1348(ra) # 800014b8 <_Z9mem_allocm>
}
    80003f7c:	00813083          	ld	ra,8(sp)
    80003f80:	00013403          	ld	s0,0(sp)
    80003f84:	01010113          	addi	sp,sp,16
    80003f88:	00008067          	ret

0000000080003f8c <_Znam>:
void *operator new[](size_t size) {
    80003f8c:	ff010113          	addi	sp,sp,-16
    80003f90:	00113423          	sd	ra,8(sp)
    80003f94:	00813023          	sd	s0,0(sp)
    80003f98:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003f9c:	ffffd097          	auipc	ra,0xffffd
    80003fa0:	51c080e7          	jalr	1308(ra) # 800014b8 <_Z9mem_allocm>
}
    80003fa4:	00813083          	ld	ra,8(sp)
    80003fa8:	00013403          	ld	s0,0(sp)
    80003fac:	01010113          	addi	sp,sp,16
    80003fb0:	00008067          	ret

0000000080003fb4 <_ZdlPv>:
void operator delete(void *mem) {
    80003fb4:	ff010113          	addi	sp,sp,-16
    80003fb8:	00113423          	sd	ra,8(sp)
    80003fbc:	00813023          	sd	s0,0(sp)
    80003fc0:	01010413          	addi	s0,sp,16
    mem_free(mem);
    80003fc4:	ffffd097          	auipc	ra,0xffffd
    80003fc8:	53c080e7          	jalr	1340(ra) # 80001500 <_Z8mem_freePv>
}
    80003fcc:	00813083          	ld	ra,8(sp)
    80003fd0:	00013403          	ld	s0,0(sp)
    80003fd4:	01010113          	addi	sp,sp,16
    80003fd8:	00008067          	ret

0000000080003fdc <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80003fdc:	00006797          	auipc	a5,0x6
    80003fe0:	46c78793          	addi	a5,a5,1132 # 8000a448 <_ZTV6Thread+0x10>
    80003fe4:	00f53023          	sd	a5,0(a0)
    if (myHandle->is_finished())
    80003fe8:	00853503          	ld	a0,8(a0)
    bool is_finished() const { return this->status == FINISHED; }
    80003fec:	05052703          	lw	a4,80(a0)
    80003ff0:	00400793          	li	a5,4
    80003ff4:	00f70463          	beq	a4,a5,80003ffc <_ZN6ThreadD1Ev+0x20>
    80003ff8:	00008067          	ret
        delete myHandle;
    80003ffc:	fe050ee3          	beqz	a0,80003ff8 <_ZN6ThreadD1Ev+0x1c>
Thread::~Thread() {
    80004000:	ff010113          	addi	sp,sp,-16
    80004004:	00113423          	sd	ra,8(sp)
    80004008:	00813023          	sd	s0,0(sp)
    8000400c:	01010413          	addi	s0,sp,16
        delete myHandle;
    80004010:	00000097          	auipc	ra,0x0
    80004014:	fa4080e7          	jalr	-92(ra) # 80003fb4 <_ZdlPv>
}
    80004018:	00813083          	ld	ra,8(sp)
    8000401c:	00013403          	ld	s0,0(sp)
    80004020:	01010113          	addi	sp,sp,16
    80004024:	00008067          	ret

0000000080004028 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80004028:	fe010113          	addi	sp,sp,-32
    8000402c:	00113c23          	sd	ra,24(sp)
    80004030:	00813823          	sd	s0,16(sp)
    80004034:	00913423          	sd	s1,8(sp)
    80004038:	02010413          	addi	s0,sp,32
    8000403c:	00050493          	mv	s1,a0
}
    80004040:	00000097          	auipc	ra,0x0
    80004044:	f9c080e7          	jalr	-100(ra) # 80003fdc <_ZN6ThreadD1Ev>
    80004048:	00048513          	mv	a0,s1
    8000404c:	00000097          	auipc	ra,0x0
    80004050:	f68080e7          	jalr	-152(ra) # 80003fb4 <_ZdlPv>
    80004054:	01813083          	ld	ra,24(sp)
    80004058:	01013403          	ld	s0,16(sp)
    8000405c:	00813483          	ld	s1,8(sp)
    80004060:	02010113          	addi	sp,sp,32
    80004064:	00008067          	ret

0000000080004068 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80004068:	fe010113          	addi	sp,sp,-32
    8000406c:	00113c23          	sd	ra,24(sp)
    80004070:	00813823          	sd	s0,16(sp)
    80004074:	00913423          	sd	s1,8(sp)
    80004078:	02010413          	addi	s0,sp,32
    8000407c:	00050493          	mv	s1,a0
}
    80004080:	00000097          	auipc	ra,0x0
    80004084:	e54080e7          	jalr	-428(ra) # 80003ed4 <_ZN9SemaphoreD1Ev>
    80004088:	00048513          	mv	a0,s1
    8000408c:	00000097          	auipc	ra,0x0
    80004090:	f28080e7          	jalr	-216(ra) # 80003fb4 <_ZdlPv>
    80004094:	01813083          	ld	ra,24(sp)
    80004098:	01013403          	ld	s0,16(sp)
    8000409c:	00813483          	ld	s1,8(sp)
    800040a0:	02010113          	addi	sp,sp,32
    800040a4:	00008067          	ret

00000000800040a8 <_ZdaPv>:
void operator delete[](void *mem) {
    800040a8:	ff010113          	addi	sp,sp,-16
    800040ac:	00113423          	sd	ra,8(sp)
    800040b0:	00813023          	sd	s0,0(sp)
    800040b4:	01010413          	addi	s0,sp,16
    mem_free(mem);
    800040b8:	ffffd097          	auipc	ra,0xffffd
    800040bc:	448080e7          	jalr	1096(ra) # 80001500 <_Z8mem_freePv>
}
    800040c0:	00813083          	ld	ra,8(sp)
    800040c4:	00013403          	ld	s0,0(sp)
    800040c8:	01010113          	addi	sp,sp,16
    800040cc:	00008067          	ret

00000000800040d0 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    800040d0:	ff010113          	addi	sp,sp,-16
    800040d4:	00813423          	sd	s0,8(sp)
    800040d8:	01010413          	addi	s0,sp,16
    800040dc:	00006797          	auipc	a5,0x6
    800040e0:	36c78793          	addi	a5,a5,876 # 8000a448 <_ZTV6Thread+0x10>
    800040e4:	00f53023          	sd	a5,0(a0)
    this->body = body;
    800040e8:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    800040ec:	00c53c23          	sd	a2,24(a0)
}
    800040f0:	00813403          	ld	s0,8(sp)
    800040f4:	01010113          	addi	sp,sp,16
    800040f8:	00008067          	ret

00000000800040fc <_ZN6Thread5startEv>:
int Thread::start() {
    800040fc:	ff010113          	addi	sp,sp,-16
    80004100:	00113423          	sd	ra,8(sp)
    80004104:	00813023          	sd	s0,0(sp)
    80004108:	01010413          	addi	s0,sp,16
    return thread_create(&myHandle, &threadStart, this);
    8000410c:	00050613          	mv	a2,a0
    80004110:	00000597          	auipc	a1,0x0
    80004114:	d8458593          	addi	a1,a1,-636 # 80003e94 <_ZN6Thread11threadStartEPv>
    80004118:	00850513          	addi	a0,a0,8
    8000411c:	ffffd097          	auipc	ra,0xffffd
    80004120:	424080e7          	jalr	1060(ra) # 80001540 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80004124:	00813083          	ld	ra,8(sp)
    80004128:	00013403          	ld	s0,0(sp)
    8000412c:	01010113          	addi	sp,sp,16
    80004130:	00008067          	ret

0000000080004134 <_ZN6Thread4joinEv>:
void Thread::join() {
    80004134:	ff010113          	addi	sp,sp,-16
    80004138:	00113423          	sd	ra,8(sp)
    8000413c:	00813023          	sd	s0,0(sp)
    80004140:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80004144:	00853503          	ld	a0,8(a0)
    80004148:	ffffd097          	auipc	ra,0xffffd
    8000414c:	4f0080e7          	jalr	1264(ra) # 80001638 <_Z11thread_joinP3TCB>
}
    80004150:	00813083          	ld	ra,8(sp)
    80004154:	00013403          	ld	s0,0(sp)
    80004158:	01010113          	addi	sp,sp,16
    8000415c:	00008067          	ret

0000000080004160 <_ZN6Thread4joinEm>:
void Thread::join(time_t time) {
    80004160:	ff010113          	addi	sp,sp,-16
    80004164:	00113423          	sd	ra,8(sp)
    80004168:	00813023          	sd	s0,0(sp)
    8000416c:	01010413          	addi	s0,sp,16
    thread_join(myHandle, time);
    80004170:	00853503          	ld	a0,8(a0)
    80004174:	ffffd097          	auipc	ra,0xffffd
    80004178:	500080e7          	jalr	1280(ra) # 80001674 <_Z11thread_joinP3TCBm>
}
    8000417c:	00813083          	ld	ra,8(sp)
    80004180:	00013403          	ld	s0,0(sp)
    80004184:	01010113          	addi	sp,sp,16
    80004188:	00008067          	ret

000000008000418c <_ZN6Thread4killEPS_>:
int Thread::kill(Thread *thread) {
    8000418c:	ff010113          	addi	sp,sp,-16
    80004190:	00113423          	sd	ra,8(sp)
    80004194:	00813023          	sd	s0,0(sp)
    80004198:	01010413          	addi	s0,sp,16
    return thread_kill(thread->myHandle);
    8000419c:	00853503          	ld	a0,8(a0)
    800041a0:	ffffd097          	auipc	ra,0xffffd
    800041a4:	578080e7          	jalr	1400(ra) # 80001718 <_Z11thread_killP3TCB>
}
    800041a8:	00813083          	ld	ra,8(sp)
    800041ac:	00013403          	ld	s0,0(sp)
    800041b0:	01010113          	addi	sp,sp,16
    800041b4:	00008067          	ret

00000000800041b8 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800041b8:	ff010113          	addi	sp,sp,-16
    800041bc:	00113423          	sd	ra,8(sp)
    800041c0:	00813023          	sd	s0,0(sp)
    800041c4:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800041c8:	ffffd097          	auipc	ra,0xffffd
    800041cc:	434080e7          	jalr	1076(ra) # 800015fc <_Z15thread_dispatchv>
}
    800041d0:	00813083          	ld	ra,8(sp)
    800041d4:	00013403          	ld	s0,0(sp)
    800041d8:	01010113          	addi	sp,sp,16
    800041dc:	00008067          	ret

00000000800041e0 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t ms) {
    800041e0:	ff010113          	addi	sp,sp,-16
    800041e4:	00113423          	sd	ra,8(sp)
    800041e8:	00813023          	sd	s0,0(sp)
    800041ec:	01010413          	addi	s0,sp,16
    return time_sleep(ms);
    800041f0:	ffffd097          	auipc	ra,0xffffd
    800041f4:	6ec080e7          	jalr	1772(ra) # 800018dc <_Z10time_sleepm>
}
    800041f8:	00813083          	ld	ra,8(sp)
    800041fc:	00013403          	ld	s0,0(sp)
    80004200:	01010113          	addi	sp,sp,16
    80004204:	00008067          	ret

0000000080004208 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) {
    this->period = period;
}

void PeriodicThread::run() {
    80004208:	fe010113          	addi	sp,sp,-32
    8000420c:	00113c23          	sd	ra,24(sp)
    80004210:	00813823          	sd	s0,16(sp)
    80004214:	00913423          	sd	s1,8(sp)
    80004218:	02010413          	addi	s0,sp,32
    8000421c:	00050493          	mv	s1,a0
    while (this->period != 0) {
    80004220:	0204b503          	ld	a0,32(s1)
    80004224:	02050063          	beqz	a0,80004244 <_ZN14PeriodicThread3runEv+0x3c>
        Thread::sleep(period);
    80004228:	00000097          	auipc	ra,0x0
    8000422c:	fb8080e7          	jalr	-72(ra) # 800041e0 <_ZN6Thread5sleepEm>
        this->periodicActivation();
    80004230:	0004b783          	ld	a5,0(s1)
    80004234:	0187b783          	ld	a5,24(a5)
    80004238:	00048513          	mv	a0,s1
    8000423c:	000780e7          	jalr	a5
    while (this->period != 0) {
    80004240:	fe1ff06f          	j	80004220 <_ZN14PeriodicThread3runEv+0x18>
    }
}
    80004244:	01813083          	ld	ra,24(sp)
    80004248:	01013403          	ld	s0,16(sp)
    8000424c:	00813483          	ld	s1,8(sp)
    80004250:	02010113          	addi	sp,sp,32
    80004254:	00008067          	ret

0000000080004258 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80004258:	ff010113          	addi	sp,sp,-16
    8000425c:	00813423          	sd	s0,8(sp)
    80004260:	01010413          	addi	s0,sp,16
    80004264:	00006797          	auipc	a5,0x6
    80004268:	1e478793          	addi	a5,a5,484 # 8000a448 <_ZTV6Thread+0x10>
    8000426c:	00f53023          	sd	a5,0(a0)
    this->body = nullptr;
    80004270:	00053823          	sd	zero,16(a0)
    this->arg = nullptr;
    80004274:	00053c23          	sd	zero,24(a0)
}
    80004278:	00813403          	ld	s0,8(sp)
    8000427c:	01010113          	addi	sp,sp,16
    80004280:	00008067          	ret

0000000080004284 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80004284:	ff010113          	addi	sp,sp,-16
    80004288:	00113423          	sd	ra,8(sp)
    8000428c:	00813023          	sd	s0,0(sp)
    80004290:	01010413          	addi	s0,sp,16
    80004294:	00006797          	auipc	a5,0x6
    80004298:	1dc78793          	addi	a5,a5,476 # 8000a470 <_ZTV9Semaphore+0x10>
    8000429c:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    800042a0:	00850513          	addi	a0,a0,8
    800042a4:	ffffd097          	auipc	ra,0xffffd
    800042a8:	4b4080e7          	jalr	1204(ra) # 80001758 <_Z8sem_openPP3Semj>
}
    800042ac:	00813083          	ld	ra,8(sp)
    800042b0:	00013403          	ld	s0,0(sp)
    800042b4:	01010113          	addi	sp,sp,16
    800042b8:	00008067          	ret

00000000800042bc <_ZN9Semaphore15signal_and_waitERS_S0_>:
int Semaphore::signal_and_wait(Semaphore &sem1, Semaphore &sem2) {
    800042bc:	ff010113          	addi	sp,sp,-16
    800042c0:	00113423          	sd	ra,8(sp)
    800042c4:	00813023          	sd	s0,0(sp)
    800042c8:	01010413          	addi	s0,sp,16
    return ::signal_and_wait(sem1.myHandle, sem2.myHandle);
    800042cc:	0085b583          	ld	a1,8(a1)
    800042d0:	00853503          	ld	a0,8(a0)
    800042d4:	ffffd097          	auipc	ra,0xffffd
    800042d8:	5c8080e7          	jalr	1480(ra) # 8000189c <_Z15signal_and_waitP3SemS0_>
}
    800042dc:	00813083          	ld	ra,8(sp)
    800042e0:	00013403          	ld	s0,0(sp)
    800042e4:	01010113          	addi	sp,sp,16
    800042e8:	00008067          	ret

00000000800042ec <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    800042ec:	ff010113          	addi	sp,sp,-16
    800042f0:	00813423          	sd	s0,8(sp)
    800042f4:	01010413          	addi	s0,sp,16
    this->period = 0;
    800042f8:	02053023          	sd	zero,32(a0)
}
    800042fc:	00813403          	ld	s0,8(sp)
    80004300:	01010113          	addi	sp,sp,16
    80004304:	00008067          	ret

0000000080004308 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) {
    80004308:	fe010113          	addi	sp,sp,-32
    8000430c:	00113c23          	sd	ra,24(sp)
    80004310:	00813823          	sd	s0,16(sp)
    80004314:	00913423          	sd	s1,8(sp)
    80004318:	01213023          	sd	s2,0(sp)
    8000431c:	02010413          	addi	s0,sp,32
    80004320:	00050493          	mv	s1,a0
    80004324:	00058913          	mv	s2,a1
    80004328:	00000097          	auipc	ra,0x0
    8000432c:	f30080e7          	jalr	-208(ra) # 80004258 <_ZN6ThreadC1Ev>
    80004330:	00006797          	auipc	a5,0x6
    80004334:	17078793          	addi	a5,a5,368 # 8000a4a0 <_ZTV14PeriodicThread+0x10>
    80004338:	00f4b023          	sd	a5,0(s1)
    this->period = period;
    8000433c:	0324b023          	sd	s2,32(s1)
}
    80004340:	01813083          	ld	ra,24(sp)
    80004344:	01013403          	ld	s0,16(sp)
    80004348:	00813483          	ld	s1,8(sp)
    8000434c:	00013903          	ld	s2,0(sp)
    80004350:	02010113          	addi	sp,sp,32
    80004354:	00008067          	ret

0000000080004358 <_ZN7Console4getcEv>:

char Console::getc() {
    80004358:	ff010113          	addi	sp,sp,-16
    8000435c:	00113423          	sd	ra,8(sp)
    80004360:	00813023          	sd	s0,0(sp)
    80004364:	01010413          	addi	s0,sp,16
    return ::getc();
    80004368:	ffffd097          	auipc	ra,0xffffd
    8000436c:	600080e7          	jalr	1536(ra) # 80001968 <_Z4getcv>
}
    80004370:	00813083          	ld	ra,8(sp)
    80004374:	00013403          	ld	s0,0(sp)
    80004378:	01010113          	addi	sp,sp,16
    8000437c:	00008067          	ret

0000000080004380 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80004380:	ff010113          	addi	sp,sp,-16
    80004384:	00113423          	sd	ra,8(sp)
    80004388:	00813023          	sd	s0,0(sp)
    8000438c:	01010413          	addi	s0,sp,16
    ::putc(c);
    80004390:	ffffd097          	auipc	ra,0xffffd
    80004394:	618080e7          	jalr	1560(ra) # 800019a8 <_Z4putcc>
    80004398:	00813083          	ld	ra,8(sp)
    8000439c:	00013403          	ld	s0,0(sp)
    800043a0:	01010113          	addi	sp,sp,16
    800043a4:	00008067          	ret

00000000800043a8 <_ZN6Thread3runEv>:
    virtual void run() {}
    800043a8:	ff010113          	addi	sp,sp,-16
    800043ac:	00813423          	sd	s0,8(sp)
    800043b0:	01010413          	addi	s0,sp,16
    800043b4:	00813403          	ld	s0,8(sp)
    800043b8:	01010113          	addi	sp,sp,16
    800043bc:	00008067          	ret

00000000800043c0 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    explicit PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    800043c0:	ff010113          	addi	sp,sp,-16
    800043c4:	00813423          	sd	s0,8(sp)
    800043c8:	01010413          	addi	s0,sp,16
    800043cc:	00813403          	ld	s0,8(sp)
    800043d0:	01010113          	addi	sp,sp,16
    800043d4:	00008067          	ret

00000000800043d8 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800043d8:	ff010113          	addi	sp,sp,-16
    800043dc:	00113423          	sd	ra,8(sp)
    800043e0:	00813023          	sd	s0,0(sp)
    800043e4:	01010413          	addi	s0,sp,16
    800043e8:	00006797          	auipc	a5,0x6
    800043ec:	0b878793          	addi	a5,a5,184 # 8000a4a0 <_ZTV14PeriodicThread+0x10>
    800043f0:	00f53023          	sd	a5,0(a0)
    800043f4:	00000097          	auipc	ra,0x0
    800043f8:	be8080e7          	jalr	-1048(ra) # 80003fdc <_ZN6ThreadD1Ev>
    800043fc:	00813083          	ld	ra,8(sp)
    80004400:	00013403          	ld	s0,0(sp)
    80004404:	01010113          	addi	sp,sp,16
    80004408:	00008067          	ret

000000008000440c <_ZN14PeriodicThreadD0Ev>:
    8000440c:	fe010113          	addi	sp,sp,-32
    80004410:	00113c23          	sd	ra,24(sp)
    80004414:	00813823          	sd	s0,16(sp)
    80004418:	00913423          	sd	s1,8(sp)
    8000441c:	02010413          	addi	s0,sp,32
    80004420:	00050493          	mv	s1,a0
    80004424:	00006797          	auipc	a5,0x6
    80004428:	07c78793          	addi	a5,a5,124 # 8000a4a0 <_ZTV14PeriodicThread+0x10>
    8000442c:	00f53023          	sd	a5,0(a0)
    80004430:	00000097          	auipc	ra,0x0
    80004434:	bac080e7          	jalr	-1108(ra) # 80003fdc <_ZN6ThreadD1Ev>
    80004438:	00048513          	mv	a0,s1
    8000443c:	00000097          	auipc	ra,0x0
    80004440:	b78080e7          	jalr	-1160(ra) # 80003fb4 <_ZdlPv>
    80004444:	01813083          	ld	ra,24(sp)
    80004448:	01013403          	ld	s0,16(sp)
    8000444c:	00813483          	ld	s1,8(sp)
    80004450:	02010113          	addi	sp,sp,32
    80004454:	00008067          	ret

0000000080004458 <_ZN5riscv15handleExceptionERKN3stm6stringE>:
        reinterpret_cast<riscv::syscall_f>(Cradle::_thread_wake),
        reinterpret_cast<riscv::syscall_f>(IO::_getc),
        reinterpret_cast<riscv::syscall_f>(IO::_putc)
};

void riscv::handleException(const stm::string &message) {
    80004458:	fd010113          	addi	sp,sp,-48
    8000445c:	02113423          	sd	ra,40(sp)
    80004460:	02813023          	sd	s0,32(sp)
    80004464:	00913c23          	sd	s1,24(sp)
    80004468:	03010413          	addi	s0,sp,48
    8000446c:	00050493          	mv	s1,a0
    stm::cout << "\n" << message << "\n";
    80004470:	00004597          	auipc	a1,0x4
    80004474:	df058593          	addi	a1,a1,-528 # 80008260 <_ZN3stm4coutE+0x1a8>
    80004478:	00006517          	auipc	a0,0x6
    8000447c:	1d053503          	ld	a0,464(a0) # 8000a648 <_GLOBAL_OFFSET_TABLE_+0x90>
    80004480:	fffff097          	auipc	ra,0xfffff
    80004484:	5fc080e7          	jalr	1532(ra) # 80003a7c <_ZNK3stm7istreamlsEPKc>
    80004488:	00048593          	mv	a1,s1
    8000448c:	fffff097          	auipc	ra,0xfffff
    80004490:	62c080e7          	jalr	1580(ra) # 80003ab8 <_ZNK3stm7istreamlsERKNS_6stringE>
    80004494:	00004597          	auipc	a1,0x4
    80004498:	dcc58593          	addi	a1,a1,-564 # 80008260 <_ZN3stm4coutE+0x1a8>
    8000449c:	fffff097          	auipc	ra,0xfffff
    800044a0:	5e0080e7          	jalr	1504(ra) # 80003a7c <_ZNK3stm7istreamlsEPKc>
    stm::cout << "sepc:   ";
    800044a4:	00004597          	auipc	a1,0x4
    800044a8:	c4458593          	addi	a1,a1,-956 # 800080e8 <_ZN3stm4coutE+0x30>
    800044ac:	00006517          	auipc	a0,0x6
    800044b0:	19c53503          	ld	a0,412(a0) # 8000a648 <_GLOBAL_OFFSET_TABLE_+0x90>
    800044b4:	fffff097          	auipc	ra,0xfffff
    800044b8:	5c8080e7          	jalr	1480(ra) # 80003a7c <_ZNK3stm7istreamlsEPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800044bc:	141027f3          	csrr	a5,sepc
    800044c0:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    800044c4:	fd843503          	ld	a0,-40(s0)
    print_h(r_sepc());
    800044c8:	ffffe097          	auipc	ra,0xffffe
    800044cc:	3c8080e7          	jalr	968(ra) # 80002890 <_Z7print_hm>
    stm::cout << "\n";
    800044d0:	00004597          	auipc	a1,0x4
    800044d4:	d9058593          	addi	a1,a1,-624 # 80008260 <_ZN3stm4coutE+0x1a8>
    800044d8:	00006517          	auipc	a0,0x6
    800044dc:	17053503          	ld	a0,368(a0) # 8000a648 <_GLOBAL_OFFSET_TABLE_+0x90>
    800044e0:	fffff097          	auipc	ra,0xfffff
    800044e4:	59c080e7          	jalr	1436(ra) # 80003a7c <_ZNK3stm7istreamlsEPKc>
    stm::cout << "t_id:   " << TCB::running->get_t_id() << "\n";
    800044e8:	00004597          	auipc	a1,0x4
    800044ec:	c1058593          	addi	a1,a1,-1008 # 800080f8 <_ZN3stm4coutE+0x40>
    800044f0:	00006517          	auipc	a0,0x6
    800044f4:	15853503          	ld	a0,344(a0) # 8000a648 <_GLOBAL_OFFSET_TABLE_+0x90>
    800044f8:	fffff097          	auipc	ra,0xfffff
    800044fc:	584080e7          	jalr	1412(ra) # 80003a7c <_ZNK3stm7istreamlsEPKc>
    80004500:	00006797          	auipc	a5,0x6
    80004504:	1287b783          	ld	a5,296(a5) # 8000a628 <_GLOBAL_OFFSET_TABLE_+0x70>
    80004508:	0007b783          	ld	a5,0(a5)
    8000450c:	0087a583          	lw	a1,8(a5)
    80004510:	fffff097          	auipc	ra,0xfffff
    80004514:	620080e7          	jalr	1568(ra) # 80003b30 <_ZNK3stm7istreamlsEi>
    80004518:	00004597          	auipc	a1,0x4
    8000451c:	d4858593          	addi	a1,a1,-696 # 80008260 <_ZN3stm4coutE+0x1a8>
    80004520:	fffff097          	auipc	ra,0xfffff
    80004524:	55c080e7          	jalr	1372(ra) # 80003a7c <_ZNK3stm7istreamlsEPKc>
    TCB::_thread_exit();
    80004528:	00001097          	auipc	ra,0x1
    8000452c:	dbc080e7          	jalr	-580(ra) # 800052e4 <_ZN3TCB12_thread_exitEv>
}
    80004530:	02813083          	ld	ra,40(sp)
    80004534:	02013403          	ld	s0,32(sp)
    80004538:	01813483          	ld	s1,24(sp)
    8000453c:	03010113          	addi	sp,sp,48
    80004540:	00008067          	ret

0000000080004544 <_ZN5riscv20handleSupervisorTrapEmmmmm>:

void riscv::handleSupervisorTrap(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    80004544:	f8010113          	addi	sp,sp,-128
    80004548:	06113c23          	sd	ra,120(sp)
    8000454c:	06813823          	sd	s0,112(sp)
    80004550:	06913423          	sd	s1,104(sp)
    80004554:	08010413          	addi	s0,sp,128
    80004558:	00050793          	mv	a5,a0
    8000455c:	00058513          	mv	a0,a1
    80004560:	00060593          	mv	a1,a2
    80004564:	00068613          	mv	a2,a3
    80004568:	00070693          	mv	a3,a4
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000456c:	10002773          	csrr	a4,sstatus
    80004570:	f8e43c23          	sd	a4,-104(s0)
    return sstatus;
    80004574:	f9843703          	ld	a4,-104(s0)
    uint64 volatile sstatus = r_sstatus();
    80004578:	fce43c23          	sd	a4,-40(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000457c:	14102773          	csrr	a4,sepc
    80004580:	f8e43823          	sd	a4,-112(s0)
    return sepc;
    80004584:	f9043703          	ld	a4,-112(s0)
    uint64 volatile sepc = r_sepc();
    80004588:	fce43823          	sd	a4,-48(s0)
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    8000458c:	14202773          	csrr	a4,scause
    80004590:	f8e43423          	sd	a4,-120(s0)
    return scause;
    80004594:	f8843803          	ld	a6,-120(s0)
    if (r_scause() == ILLEGAL_INSTRUCTION) {
    80004598:	00200713          	li	a4,2
    8000459c:	04e80263          	beq	a6,a4,800045e0 <_ZN5riscv20handleSupervisorTrapEmmmmm+0x9c>
        handleException("Illegal instruction");
    } else {
        syscall_table[code](arg1, arg2, arg3, arg4);
    800045a0:	00379793          	slli	a5,a5,0x3
    800045a4:	00006717          	auipc	a4,0x6
    800045a8:	f1c70713          	addi	a4,a4,-228 # 8000a4c0 <_ZN5riscv13syscall_tableE>
    800045ac:	00f707b3          	add	a5,a4,a5
    800045b0:	0007b783          	ld	a5,0(a5)
    800045b4:	000780e7          	jalr	a5
//        if (setjump()) {
//            print("here");
//            longjump();
//        }
    }
    w_sepc(sepc + 4);
    800045b8:	fd043783          	ld	a5,-48(s0)
    800045bc:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800045c0:	14179073          	csrw	sepc,a5
    w_sstatus(sstatus);
    800045c4:	fd843783          	ld	a5,-40(s0)
}

inline void riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800045c8:	10079073          	csrw	sstatus,a5
}
    800045cc:	07813083          	ld	ra,120(sp)
    800045d0:	07013403          	ld	s0,112(sp)
    800045d4:	06813483          	ld	s1,104(sp)
    800045d8:	08010113          	addi	sp,sp,128
    800045dc:	00008067          	ret
        handleException("Illegal instruction");
    800045e0:	00004597          	auipc	a1,0x4
    800045e4:	b2858593          	addi	a1,a1,-1240 # 80008108 <_ZN3stm4coutE+0x50>
    800045e8:	fa040493          	addi	s1,s0,-96
    800045ec:	00048513          	mv	a0,s1
    800045f0:	ffffe097          	auipc	ra,0xffffe
    800045f4:	ae4080e7          	jalr	-1308(ra) # 800020d4 <_ZN3stm6stringC1EPKc>
    800045f8:	00048513          	mv	a0,s1
    800045fc:	00000097          	auipc	ra,0x0
    80004600:	e5c080e7          	jalr	-420(ra) # 80004458 <_ZN5riscv15handleExceptionERKN3stm6stringE>
    80004604:	fa843503          	ld	a0,-88(s0)
    80004608:	fa0508e3          	beqz	a0,800045b8 <_ZN5riscv20handleSupervisorTrapEmmmmm+0x74>
    8000460c:	00000097          	auipc	ra,0x0
    80004610:	a9c080e7          	jalr	-1380(ra) # 800040a8 <_ZdaPv>
    80004614:	fa5ff06f          	j	800045b8 <_ZN5riscv20handleSupervisorTrapEmmmmm+0x74>
    80004618:	00050493          	mv	s1,a0
    8000461c:	fa843503          	ld	a0,-88(s0)
    80004620:	00050663          	beqz	a0,8000462c <_ZN5riscv20handleSupervisorTrapEmmmmm+0xe8>
    80004624:	00000097          	auipc	ra,0x0
    80004628:	a84080e7          	jalr	-1404(ra) # 800040a8 <_ZdaPv>
    8000462c:	00048513          	mv	a0,s1
    80004630:	00007097          	auipc	ra,0x7
    80004634:	208080e7          	jalr	520(ra) # 8000b838 <_Unwind_Resume>

0000000080004638 <_ZN5riscv15handleTimerTrapEv>:

void riscv::handleTimerTrap() {
    80004638:	fd010113          	addi	sp,sp,-48
    8000463c:	02113423          	sd	ra,40(sp)
    80004640:	02813023          	sd	s0,32(sp)
    80004644:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80004648:	100027f3          	csrr	a5,sstatus
    8000464c:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80004650:	fd843783          	ld	a5,-40(s0)
    uint64 volatile sstatus = r_sstatus();
    80004654:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80004658:	141027f3          	csrr	a5,sepc
    8000465c:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80004660:	fd043783          	ld	a5,-48(s0)
    uint64 volatile sepc = r_sepc();
    80004664:	fef43023          	sd	a5,-32(s0)
    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IO::Output.is_empty()) {
    80004668:	00006797          	auipc	a5,0x6
    8000466c:	f687b783          	ld	a5,-152(a5) # 8000a5d0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80004670:	0007b783          	ld	a5,0(a5)
    80004674:	0007c783          	lbu	a5,0(a5)
    80004678:	0207f793          	andi	a5,a5,32
    8000467c:	02078c63          	beqz	a5,800046b4 <_ZN5riscv15handleTimerTrapEv+0x7c>
    80004680:	00006797          	auipc	a5,0x6
    80004684:	f487b783          	ld	a5,-184(a5) # 8000a5c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80004688:	0107a783          	lw	a5,16(a5)
    8000468c:	02078463          	beqz	a5,800046b4 <_ZN5riscv15handleTimerTrapEv+0x7c>
        char c = IO::Output.get();
    80004690:	00006517          	auipc	a0,0x6
    80004694:	f3853503          	ld	a0,-200(a0) # 8000a5c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80004698:	ffffe097          	auipc	ra,0xffffe
    8000469c:	2c4080e7          	jalr	708(ra) # 8000295c <_ZN8IOBuffer3getEv>
        *(volatile char *) CONSOLE_TX_DATA = c;
    800046a0:	00006797          	auipc	a5,0x6
    800046a4:	f607b783          	ld	a5,-160(a5) # 8000a600 <_GLOBAL_OFFSET_TABLE_+0x48>
    800046a8:	0007b783          	ld	a5,0(a5)
    800046ac:	00a78023          	sb	a0,0(a5)
    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IO::Output.is_empty()) {
    800046b0:	fb9ff06f          	j	80004668 <_ZN5riscv15handleTimerTrapEv+0x30>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800046b4:	00200793          	li	a5,2
    800046b8:	1447b073          	csrc	sip,a5
    }
    mc_sip(SIP_SSIE);
    Cradle::update();
    800046bc:	ffffe097          	auipc	ra,0xffffe
    800046c0:	7d0080e7          	jalr	2000(ra) # 80002e8c <_ZN6Cradle6updateEv>
    TCB::timer_counter++;
    800046c4:	00006717          	auipc	a4,0x6
    800046c8:	f7473703          	ld	a4,-140(a4) # 8000a638 <_GLOBAL_OFFSET_TABLE_+0x80>
    800046cc:	00073783          	ld	a5,0(a4)
    800046d0:	00178793          	addi	a5,a5,1
    800046d4:	00f73023          	sd	a5,0(a4)
    if ((time_t) TCB::timer_counter >= TCB::running->get_time_slice() && !Scheduler::is_empty()) {
    800046d8:	00006717          	auipc	a4,0x6
    800046dc:	f5073703          	ld	a4,-176(a4) # 8000a628 <_GLOBAL_OFFSET_TABLE_+0x70>
    800046e0:	00073703          	ld	a4,0(a4)

    void set_preempted() { this->preempted = true; }

    void reset_preempted() { this->preempted = false; }

    time_t get_time_slice() const { return this->time_slice; }
    800046e4:	05873683          	ld	a3,88(a4)
    800046e8:	04d7e863          	bltu	a5,a3,80004738 <_ZN5riscv15handleTimerTrapEv+0x100>
    800046ec:	00006797          	auipc	a5,0x6
    800046f0:	f547b783          	ld	a5,-172(a5) # 8000a640 <_GLOBAL_OFFSET_TABLE_+0x88>
    800046f4:	0107a783          	lw	a5,16(a5)
    static void put(TCB *thread);

    static TCB *get();

    static inline bool is_empty() {
        return high_priority.is_empty() && mid_priority.is_empty() && low_priority.is_empty();
    800046f8:	02079263          	bnez	a5,8000471c <_ZN5riscv15handleTimerTrapEv+0xe4>
    800046fc:	00006797          	auipc	a5,0x6
    80004700:	f247b783          	ld	a5,-220(a5) # 8000a620 <_GLOBAL_OFFSET_TABLE_+0x68>
    80004704:	0107a783          	lw	a5,16(a5)
    80004708:	00079a63          	bnez	a5,8000471c <_ZN5riscv15handleTimerTrapEv+0xe4>
    8000470c:	00006797          	auipc	a5,0x6
    80004710:	eec7b783          	ld	a5,-276(a5) # 8000a5f8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80004714:	0107a783          	lw	a5,16(a5)
    80004718:	02078063          	beqz	a5,80004738 <_ZN5riscv15handleTimerTrapEv+0x100>
        TCB::timer_counter = 0;
    8000471c:	00006797          	auipc	a5,0x6
    80004720:	f1c7b783          	ld	a5,-228(a5) # 8000a638 <_GLOBAL_OFFSET_TABLE_+0x80>
    80004724:	0007b023          	sd	zero,0(a5)
    void set_preempted() { this->preempted = true; }
    80004728:	00100793          	li	a5,1
    8000472c:	06f70023          	sb	a5,96(a4)
        TCB::running->set_preempted();
        TCB::_thread_dispatch();
    80004730:	00001097          	auipc	ra,0x1
    80004734:	af8080e7          	jalr	-1288(ra) # 80005228 <_ZN3TCB16_thread_dispatchEv>
    }
    w_sepc(sepc);
    80004738:	fe043783          	ld	a5,-32(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000473c:	14179073          	csrw	sepc,a5
    w_sstatus(sstatus);
    80004740:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80004744:	10079073          	csrw	sstatus,a5
}
    80004748:	02813083          	ld	ra,40(sp)
    8000474c:	02013403          	ld	s0,32(sp)
    80004750:	03010113          	addi	sp,sp,48
    80004754:	00008067          	ret

0000000080004758 <_ZN5riscv17handleConsoleTrapEv>:

void riscv::handleConsoleTrap() {
    80004758:	fe010113          	addi	sp,sp,-32
    8000475c:	00113c23          	sd	ra,24(sp)
    80004760:	00813823          	sd	s0,16(sp)
    80004764:	02010413          	addi	s0,sp,32
    if (plic_claim() == CONSOLE_IRQ) {
    80004768:	00001097          	auipc	ra,0x1
    8000476c:	70c080e7          	jalr	1804(ra) # 80005e74 <plic_claim>
    80004770:	00a00793          	li	a5,10
    80004774:	00f50a63          	beq	a0,a5,80004788 <_ZN5riscv17handleConsoleTrapEv+0x30>
            volatile char c = *(char *) CONSOLE_RX_DATA;
            IO::Input.put(c);
        }
        plic_complete(CONSOLE_IRQ);
    }
}
    80004778:	01813083          	ld	ra,24(sp)
    8000477c:	01013403          	ld	s0,16(sp)
    80004780:	02010113          	addi	sp,sp,32
    80004784:	00008067          	ret
        if ((*((char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
    80004788:	00006797          	auipc	a5,0x6
    8000478c:	e487b783          	ld	a5,-440(a5) # 8000a5d0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80004790:	0007b783          	ld	a5,0(a5)
    80004794:	0007c783          	lbu	a5,0(a5)
    80004798:	0017f793          	andi	a5,a5,1
    8000479c:	00079a63          	bnez	a5,800047b0 <_ZN5riscv17handleConsoleTrapEv+0x58>
        plic_complete(CONSOLE_IRQ);
    800047a0:	00a00513          	li	a0,10
    800047a4:	00001097          	auipc	ra,0x1
    800047a8:	708080e7          	jalr	1800(ra) # 80005eac <plic_complete>
}
    800047ac:	fcdff06f          	j	80004778 <_ZN5riscv17handleConsoleTrapEv+0x20>
            volatile char c = *(char *) CONSOLE_RX_DATA;
    800047b0:	00006797          	auipc	a5,0x6
    800047b4:	e107b783          	ld	a5,-496(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800047b8:	0007b783          	ld	a5,0(a5)
    800047bc:	0007c783          	lbu	a5,0(a5)
    800047c0:	fef407a3          	sb	a5,-17(s0)
            IO::Input.put(c);
    800047c4:	fef44583          	lbu	a1,-17(s0)
    800047c8:	0ff5f593          	andi	a1,a1,255
    800047cc:	00006517          	auipc	a0,0x6
    800047d0:	e4453503          	ld	a0,-444(a0) # 8000a610 <_GLOBAL_OFFSET_TABLE_+0x58>
    800047d4:	ffffe097          	auipc	ra,0xffffe
    800047d8:	1fc080e7          	jalr	508(ra) # 800029d0 <_ZN8IOBuffer3putEc>
    800047dc:	fc5ff06f          	j	800047a0 <_ZN5riscv17handleConsoleTrapEv+0x48>

00000000800047e0 <_ZN5riscv10popSppSpieEv>:

void riscv::popSppSpie() {
    800047e0:	ff010113          	addi	sp,sp,-16
    800047e4:	00813423          	sd	s0,8(sp)
    800047e8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800047ec:	10000793          	li	a5,256
    800047f0:	1007b073          	csrc	sstatus,a5
    riscv::mc_sstatus(riscv::SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    800047f4:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    800047f8:	10200073          	sret
}
    800047fc:	00813403          	ld	s0,8(sp)
    80004800:	01010113          	addi	sp,sp,16
    80004804:	00008067          	ret

0000000080004808 <_ZN5riscv14handleReadTrapEv>:

void riscv::handleReadTrap() {
    80004808:	fb010113          	addi	sp,sp,-80
    8000480c:	04113423          	sd	ra,72(sp)
    80004810:	04813023          	sd	s0,64(sp)
    80004814:	02913c23          	sd	s1,56(sp)
    80004818:	05010413          	addi	s0,sp,80
    handleException("Illegal read address");
    8000481c:	00004597          	auipc	a1,0x4
    80004820:	90458593          	addi	a1,a1,-1788 # 80008120 <_ZN3stm4coutE+0x68>
    80004824:	fb040493          	addi	s1,s0,-80
    80004828:	00048513          	mv	a0,s1
    8000482c:	ffffe097          	auipc	ra,0xffffe
    80004830:	8a8080e7          	jalr	-1880(ra) # 800020d4 <_ZN3stm6stringC1EPKc>
    80004834:	00048513          	mv	a0,s1
    80004838:	00000097          	auipc	ra,0x0
    8000483c:	c20080e7          	jalr	-992(ra) # 80004458 <_ZN5riscv15handleExceptionERKN3stm6stringE>
    80004840:	fb843503          	ld	a0,-72(s0)
    80004844:	00050663          	beqz	a0,80004850 <_ZN5riscv14handleReadTrapEv+0x48>
    80004848:	00000097          	auipc	ra,0x0
    8000484c:	860080e7          	jalr	-1952(ra) # 800040a8 <_ZdaPv>
}
    80004850:	04813083          	ld	ra,72(sp)
    80004854:	04013403          	ld	s0,64(sp)
    80004858:	03813483          	ld	s1,56(sp)
    8000485c:	05010113          	addi	sp,sp,80
    80004860:	00008067          	ret
    80004864:	00050493          	mv	s1,a0
    80004868:	fb843503          	ld	a0,-72(s0)
    8000486c:	00050663          	beqz	a0,80004878 <_ZN5riscv14handleReadTrapEv+0x70>
    80004870:	00000097          	auipc	ra,0x0
    80004874:	838080e7          	jalr	-1992(ra) # 800040a8 <_ZdaPv>
    80004878:	00048513          	mv	a0,s1
    8000487c:	00007097          	auipc	ra,0x7
    80004880:	fbc080e7          	jalr	-68(ra) # 8000b838 <_Unwind_Resume>

0000000080004884 <_ZN5riscv15handleWriteTrapEv>:

void riscv::handleWriteTrap() {
    80004884:	fb010113          	addi	sp,sp,-80
    80004888:	04113423          	sd	ra,72(sp)
    8000488c:	04813023          	sd	s0,64(sp)
    80004890:	02913c23          	sd	s1,56(sp)
    80004894:	05010413          	addi	s0,sp,80
    handleException("Illegal write address");
    80004898:	00004597          	auipc	a1,0x4
    8000489c:	8a058593          	addi	a1,a1,-1888 # 80008138 <_ZN3stm4coutE+0x80>
    800048a0:	fb040493          	addi	s1,s0,-80
    800048a4:	00048513          	mv	a0,s1
    800048a8:	ffffe097          	auipc	ra,0xffffe
    800048ac:	82c080e7          	jalr	-2004(ra) # 800020d4 <_ZN3stm6stringC1EPKc>
    800048b0:	00048513          	mv	a0,s1
    800048b4:	00000097          	auipc	ra,0x0
    800048b8:	ba4080e7          	jalr	-1116(ra) # 80004458 <_ZN5riscv15handleExceptionERKN3stm6stringE>
    800048bc:	fb843503          	ld	a0,-72(s0)
    800048c0:	00050663          	beqz	a0,800048cc <_ZN5riscv15handleWriteTrapEv+0x48>
    800048c4:	fffff097          	auipc	ra,0xfffff
    800048c8:	7e4080e7          	jalr	2020(ra) # 800040a8 <_ZdaPv>
    800048cc:	04813083          	ld	ra,72(sp)
    800048d0:	04013403          	ld	s0,64(sp)
    800048d4:	03813483          	ld	s1,56(sp)
    800048d8:	05010113          	addi	sp,sp,80
    800048dc:	00008067          	ret
    800048e0:	00050493          	mv	s1,a0
    800048e4:	fb843503          	ld	a0,-72(s0)
    800048e8:	00050663          	beqz	a0,800048f4 <_ZN5riscv15handleWriteTrapEv+0x70>
    800048ec:	fffff097          	auipc	ra,0xfffff
    800048f0:	7bc080e7          	jalr	1980(ra) # 800040a8 <_ZdaPv>
    800048f4:	00048513          	mv	a0,s1
    800048f8:	00007097          	auipc	ra,0x7
    800048fc:	f40080e7          	jalr	-192(ra) # 8000b838 <_Unwind_Resume>

0000000080004900 <_ZN9Scheduler9idle_bodyEv>:
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.peek();
    if (!Scheduler::low_priority.is_empty()) return Scheduler::low_priority.peek();
    return Scheduler::idle_thread;
}

void Scheduler::idle_body() {
    80004900:	ff010113          	addi	sp,sp,-16
    80004904:	00813423          	sd	s0,8(sp)
    80004908:	01010413          	addi	s0,sp,16
    while (true);
    8000490c:	0000006f          	j	8000490c <_ZN9Scheduler9idle_bodyEv+0xc>

0000000080004910 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    80004910:	ff010113          	addi	sp,sp,-16
    80004914:	00113423          	sd	ra,8(sp)
    80004918:	00813023          	sd	s0,0(sp)
    8000491c:	01010413          	addi	s0,sp,16
    80004920:	00006797          	auipc	a5,0x6
    80004924:	df07a783          	lw	a5,-528(a5) # 8000a710 <_ZN9Scheduler13high_priorityE+0x10>
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.get();
    80004928:	02079463          	bnez	a5,80004950 <_ZN9Scheduler3getEv+0x40>
    8000492c:	00006797          	auipc	a5,0x6
    80004930:	dfc7a783          	lw	a5,-516(a5) # 8000a728 <_ZN9Scheduler12mid_priorityE+0x10>
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.get();
    80004934:	02079e63          	bnez	a5,80004970 <_ZN9Scheduler3getEv+0x60>
    80004938:	00006797          	auipc	a5,0x6
    8000493c:	e087a783          	lw	a5,-504(a5) # 8000a740 <_ZN9Scheduler12low_priorityE+0x10>
    if (!Scheduler::low_priority.is_empty()) return Scheduler::low_priority.get();
    80004940:	04079263          	bnez	a5,80004984 <_ZN9Scheduler3getEv+0x74>
    return Scheduler::idle_thread;
    80004944:	00006517          	auipc	a0,0x6
    80004948:	e0453503          	ld	a0,-508(a0) # 8000a748 <_ZN9Scheduler11idle_threadE>
    8000494c:	0140006f          	j	80004960 <_ZN9Scheduler3getEv+0x50>
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.get();
    80004950:	00006517          	auipc	a0,0x6
    80004954:	db050513          	addi	a0,a0,-592 # 8000a700 <_ZN9Scheduler13high_priorityE>
    80004958:	ffffe097          	auipc	ra,0xffffe
    8000495c:	bc4080e7          	jalr	-1084(ra) # 8000251c <_ZN3stm14CircularBufferIP3TCBE3getEv>
}
    80004960:	00813083          	ld	ra,8(sp)
    80004964:	00013403          	ld	s0,0(sp)
    80004968:	01010113          	addi	sp,sp,16
    8000496c:	00008067          	ret
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.get();
    80004970:	00006517          	auipc	a0,0x6
    80004974:	da850513          	addi	a0,a0,-600 # 8000a718 <_ZN9Scheduler12mid_priorityE>
    80004978:	ffffe097          	auipc	ra,0xffffe
    8000497c:	ba4080e7          	jalr	-1116(ra) # 8000251c <_ZN3stm14CircularBufferIP3TCBE3getEv>
    80004980:	fe1ff06f          	j	80004960 <_ZN9Scheduler3getEv+0x50>
    if (!Scheduler::low_priority.is_empty()) return Scheduler::low_priority.get();
    80004984:	00006517          	auipc	a0,0x6
    80004988:	dac50513          	addi	a0,a0,-596 # 8000a730 <_ZN9Scheduler12low_priorityE>
    8000498c:	ffffe097          	auipc	ra,0xffffe
    80004990:	b90080e7          	jalr	-1136(ra) # 8000251c <_ZN3stm14CircularBufferIP3TCBE3getEv>
    80004994:	fcdff06f          	j	80004960 <_ZN9Scheduler3getEv+0x50>

0000000080004998 <_ZN9Scheduler4peekEv>:
TCB *Scheduler::peek() {
    80004998:	ff010113          	addi	sp,sp,-16
    8000499c:	00113423          	sd	ra,8(sp)
    800049a0:	00813023          	sd	s0,0(sp)
    800049a4:	01010413          	addi	s0,sp,16
    800049a8:	00006797          	auipc	a5,0x6
    800049ac:	d687a783          	lw	a5,-664(a5) # 8000a710 <_ZN9Scheduler13high_priorityE+0x10>
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.peek();
    800049b0:	02078463          	beqz	a5,800049d8 <_ZN9Scheduler4peekEv+0x40>
    800049b4:	00006517          	auipc	a0,0x6
    800049b8:	d4c50513          	addi	a0,a0,-692 # 8000a700 <_ZN9Scheduler13high_priorityE>
    800049bc:	00000097          	auipc	ra,0x0
    800049c0:	134080e7          	jalr	308(ra) # 80004af0 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    800049c4:	00053503          	ld	a0,0(a0)
}
    800049c8:	00813083          	ld	ra,8(sp)
    800049cc:	00013403          	ld	s0,0(sp)
    800049d0:	01010113          	addi	sp,sp,16
    800049d4:	00008067          	ret
    800049d8:	00006797          	auipc	a5,0x6
    800049dc:	d507a783          	lw	a5,-688(a5) # 8000a728 <_ZN9Scheduler12mid_priorityE+0x10>
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.peek();
    800049e0:	00078e63          	beqz	a5,800049fc <_ZN9Scheduler4peekEv+0x64>
    800049e4:	00006517          	auipc	a0,0x6
    800049e8:	d3450513          	addi	a0,a0,-716 # 8000a718 <_ZN9Scheduler12mid_priorityE>
    800049ec:	00000097          	auipc	ra,0x0
    800049f0:	104080e7          	jalr	260(ra) # 80004af0 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    800049f4:	00053503          	ld	a0,0(a0)
    800049f8:	fd1ff06f          	j	800049c8 <_ZN9Scheduler4peekEv+0x30>
    800049fc:	00006797          	auipc	a5,0x6
    80004a00:	d447a783          	lw	a5,-700(a5) # 8000a740 <_ZN9Scheduler12low_priorityE+0x10>
    if (!Scheduler::low_priority.is_empty()) return Scheduler::low_priority.peek();
    80004a04:	00078e63          	beqz	a5,80004a20 <_ZN9Scheduler4peekEv+0x88>
    80004a08:	00006517          	auipc	a0,0x6
    80004a0c:	d2850513          	addi	a0,a0,-728 # 8000a730 <_ZN9Scheduler12low_priorityE>
    80004a10:	00000097          	auipc	ra,0x0
    80004a14:	0e0080e7          	jalr	224(ra) # 80004af0 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    80004a18:	00053503          	ld	a0,0(a0)
    80004a1c:	fadff06f          	j	800049c8 <_ZN9Scheduler4peekEv+0x30>
    return Scheduler::idle_thread;
    80004a20:	00006517          	auipc	a0,0x6
    80004a24:	d2853503          	ld	a0,-728(a0) # 8000a748 <_ZN9Scheduler11idle_threadE>
    80004a28:	fa1ff06f          	j	800049c8 <_ZN9Scheduler4peekEv+0x30>

0000000080004a2c <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *thread) {
    80004a2c:	00050593          	mv	a1,a0
    if (!Scheduler::idle_thread or thread == Scheduler::idle_thread) {
    80004a30:	00006797          	auipc	a5,0x6
    80004a34:	d187b783          	ld	a5,-744(a5) # 8000a748 <_ZN9Scheduler11idle_threadE>
    80004a38:	04078c63          	beqz	a5,80004a90 <_ZN9Scheduler3putEP3TCB+0x64>
    80004a3c:	04a78a63          	beq	a5,a0,80004a90 <_ZN9Scheduler3putEP3TCB+0x64>
void Scheduler::put(TCB *thread) {
    80004a40:	ff010113          	addi	sp,sp,-16
    80004a44:	00113423          	sd	ra,8(sp)
    80004a48:	00813023          	sd	s0,0(sp)
    80004a4c:	01010413          	addi	s0,sp,16
    bool was_preempted() const { return this->preempted; }
    80004a50:	06054783          	lbu	a5,96(a0)
    if (!thread->was_preempted()) {
    80004a54:	04078463          	beqz	a5,80004a9c <_ZN9Scheduler3putEP3TCB+0x70>
    void reset_preempted() { this->preempted = false; }
    80004a58:	06050023          	sb	zero,96(a0)
    time_t get_time_slice() const { return this->time_slice; }
    80004a5c:	05853783          	ld	a5,88(a0)
    if (time_slice == TimeSlice::HIGH_PRIORITY) {
    80004a60:	00100713          	li	a4,1
    80004a64:	04e78a63          	beq	a5,a4,80004ab8 <_ZN9Scheduler3putEP3TCB+0x8c>
    } else if (time_slice == TimeSlice::MID_PRIORITY) {
    80004a68:	00200713          	li	a4,2
    80004a6c:	06e78463          	beq	a5,a4,80004ad4 <_ZN9Scheduler3putEP3TCB+0xa8>
        Scheduler::low_priority.put(thread);
    80004a70:	00006517          	auipc	a0,0x6
    80004a74:	cc050513          	addi	a0,a0,-832 # 8000a730 <_ZN9Scheduler12low_priorityE>
    80004a78:	ffffe097          	auipc	ra,0xffffe
    80004a7c:	bc8080e7          	jalr	-1080(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
}
    80004a80:	00813083          	ld	ra,8(sp)
    80004a84:	00013403          	ld	s0,0(sp)
    80004a88:	01010113          	addi	sp,sp,16
    80004a8c:	00008067          	ret
        Scheduler::idle_thread = thread;
    80004a90:	00006797          	auipc	a5,0x6
    80004a94:	cab7bc23          	sd	a1,-840(a5) # 8000a748 <_ZN9Scheduler11idle_threadE>
        return;
    80004a98:	00008067          	ret

    void set_time_slice(time_t time) { this->time_slice = time; }
    80004a9c:	00100793          	li	a5,1
    80004aa0:	04f53c23          	sd	a5,88(a0)
        Scheduler::high_priority.put(thread);
    80004aa4:	00006517          	auipc	a0,0x6
    80004aa8:	c5c50513          	addi	a0,a0,-932 # 8000a700 <_ZN9Scheduler13high_priorityE>
    80004aac:	ffffe097          	auipc	ra,0xffffe
    80004ab0:	b94080e7          	jalr	-1132(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
        return;
    80004ab4:	fcdff06f          	j	80004a80 <_ZN9Scheduler3putEP3TCB+0x54>
    80004ab8:	00200793          	li	a5,2
    80004abc:	04f53c23          	sd	a5,88(a0)
        Scheduler::mid_priority.put(thread);
    80004ac0:	00006517          	auipc	a0,0x6
    80004ac4:	c5850513          	addi	a0,a0,-936 # 8000a718 <_ZN9Scheduler12mid_priorityE>
    80004ac8:	ffffe097          	auipc	ra,0xffffe
    80004acc:	b78080e7          	jalr	-1160(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    80004ad0:	fb1ff06f          	j	80004a80 <_ZN9Scheduler3putEP3TCB+0x54>
    80004ad4:	00400793          	li	a5,4
    80004ad8:	04f53c23          	sd	a5,88(a0)
        Scheduler::low_priority.put(thread);
    80004adc:	00006517          	auipc	a0,0x6
    80004ae0:	c5450513          	addi	a0,a0,-940 # 8000a730 <_ZN9Scheduler12low_priorityE>
    80004ae4:	ffffe097          	auipc	ra,0xffffe
    80004ae8:	b5c080e7          	jalr	-1188(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    80004aec:	f95ff06f          	j	80004a80 <_ZN9Scheduler3putEP3TCB+0x54>

0000000080004af0 <_ZN3stm14CircularBufferIP3TCBE4peekEv>:
T &stm::CircularBuffer<T>::peek() {
    80004af0:	ff010113          	addi	sp,sp,-16
    80004af4:	00813423          	sd	s0,8(sp)
    80004af8:	01010413          	addi	s0,sp,16
    return this->queue[this->head];
    80004afc:	00053703          	ld	a4,0(a0)
    80004b00:	00852783          	lw	a5,8(a0)
    80004b04:	00379793          	slli	a5,a5,0x3
}
    80004b08:	00f70533          	add	a0,a4,a5
    80004b0c:	00813403          	ld	s0,8(sp)
    80004b10:	01010113          	addi	sp,sp,16
    80004b14:	00008067          	ret

0000000080004b18 <_ZN10OwnedMutexD1Ev>:

OwnedMutex::OwnedMutex() : owner(nullptr), nesting_count(0) {
    sem_open(&this->myHandle, 1);
}

OwnedMutex::~OwnedMutex() {
    80004b18:	fe010113          	addi	sp,sp,-32
    80004b1c:	00113c23          	sd	ra,24(sp)
    80004b20:	00813823          	sd	s0,16(sp)
    80004b24:	00913423          	sd	s1,8(sp)
    80004b28:	02010413          	addi	s0,sp,32
    80004b2c:	00050493          	mv	s1,a0
    80004b30:	00006797          	auipc	a5,0x6
    80004b34:	a6878793          	addi	a5,a5,-1432 # 8000a598 <_ZTV10OwnedMutex+0x10>
    80004b38:	00f53023          	sd	a5,0(a0)
    sem_close(this->myHandle);
    80004b3c:	00853503          	ld	a0,8(a0)
    80004b40:	ffffd097          	auipc	ra,0xffffd
    80004b44:	c5c080e7          	jalr	-932(ra) # 8000179c <_Z9sem_closeP3Sem>
class Mutex : public Semaphore {
    80004b48:	00006797          	auipc	a5,0x6
    80004b4c:	a2078793          	addi	a5,a5,-1504 # 8000a568 <_ZTV5Mutex+0x10>
    80004b50:	00f4b023          	sd	a5,0(s1)
    80004b54:	00048513          	mv	a0,s1
    80004b58:	fffff097          	auipc	ra,0xfffff
    80004b5c:	37c080e7          	jalr	892(ra) # 80003ed4 <_ZN9SemaphoreD1Ev>
}
    80004b60:	01813083          	ld	ra,24(sp)
    80004b64:	01013403          	ld	s0,16(sp)
    80004b68:	00813483          	ld	s1,8(sp)
    80004b6c:	02010113          	addi	sp,sp,32
    80004b70:	00008067          	ret

0000000080004b74 <_ZN10OwnedMutexD0Ev>:
OwnedMutex::~OwnedMutex() {
    80004b74:	fe010113          	addi	sp,sp,-32
    80004b78:	00113c23          	sd	ra,24(sp)
    80004b7c:	00813823          	sd	s0,16(sp)
    80004b80:	00913423          	sd	s1,8(sp)
    80004b84:	02010413          	addi	s0,sp,32
    80004b88:	00050493          	mv	s1,a0
}
    80004b8c:	00000097          	auipc	ra,0x0
    80004b90:	f8c080e7          	jalr	-116(ra) # 80004b18 <_ZN10OwnedMutexD1Ev>
    80004b94:	00048513          	mv	a0,s1
    80004b98:	fffff097          	auipc	ra,0xfffff
    80004b9c:	41c080e7          	jalr	1052(ra) # 80003fb4 <_ZdlPv>
    80004ba0:	01813083          	ld	ra,24(sp)
    80004ba4:	01013403          	ld	s0,16(sp)
    80004ba8:	00813483          	ld	s1,8(sp)
    80004bac:	02010113          	addi	sp,sp,32
    80004bb0:	00008067          	ret

0000000080004bb4 <_ZN10OwnedMutex4waitEv>:

int OwnedMutex::wait() {
    if (this->owner == TCB::running) {
    80004bb4:	01053783          	ld	a5,16(a0)
    80004bb8:	00006717          	auipc	a4,0x6
    80004bbc:	a7073703          	ld	a4,-1424(a4) # 8000a628 <_GLOBAL_OFFSET_TABLE_+0x70>
    80004bc0:	00073703          	ld	a4,0(a4)
    80004bc4:	02e78c63          	beq	a5,a4,80004bfc <_ZN10OwnedMutex4waitEv+0x48>
int OwnedMutex::wait() {
    80004bc8:	ff010113          	addi	sp,sp,-16
    80004bcc:	00113423          	sd	ra,8(sp)
    80004bd0:	00813023          	sd	s0,0(sp)
    80004bd4:	01010413          	addi	s0,sp,16
        this->nesting_count++;
        return 0;
    }
    if (this->owner == nullptr) {
    80004bd8:	02078c63          	beqz	a5,80004c10 <_ZN10OwnedMutex4waitEv+0x5c>
        this->owner = TCB::running;
        this->nesting_count = 1;
    }
    sem_wait(this->myHandle);
    80004bdc:	00853503          	ld	a0,8(a0)
    80004be0:	ffffd097          	auipc	ra,0xffffd
    80004be4:	bfc080e7          	jalr	-1028(ra) # 800017dc <_Z8sem_waitP3Sem>
    return 0;
}
    80004be8:	00000513          	li	a0,0
    80004bec:	00813083          	ld	ra,8(sp)
    80004bf0:	00013403          	ld	s0,0(sp)
    80004bf4:	01010113          	addi	sp,sp,16
    80004bf8:	00008067          	ret
        this->nesting_count++;
    80004bfc:	01852783          	lw	a5,24(a0)
    80004c00:	0017879b          	addiw	a5,a5,1
    80004c04:	00f52c23          	sw	a5,24(a0)
}
    80004c08:	00000513          	li	a0,0
    80004c0c:	00008067          	ret
        this->owner = TCB::running;
    80004c10:	00e53823          	sd	a4,16(a0)
        this->nesting_count = 1;
    80004c14:	00100793          	li	a5,1
    80004c18:	00f52c23          	sw	a5,24(a0)
    80004c1c:	fc1ff06f          	j	80004bdc <_ZN10OwnedMutex4waitEv+0x28>

0000000080004c20 <_ZN10OwnedMutex6signalEv>:

int OwnedMutex::signal() {
    if (this->owner != TCB::running) return -1;
    80004c20:	01053703          	ld	a4,16(a0)
    80004c24:	00006797          	auipc	a5,0x6
    80004c28:	a047b783          	ld	a5,-1532(a5) # 8000a628 <_GLOBAL_OFFSET_TABLE_+0x70>
    80004c2c:	0007b783          	ld	a5,0(a5)
    80004c30:	04f71a63          	bne	a4,a5,80004c84 <_ZN10OwnedMutex6signalEv+0x64>
    this->nesting_count --;
    80004c34:	01852783          	lw	a5,24(a0)
    80004c38:	fff7879b          	addiw	a5,a5,-1
    80004c3c:	0007871b          	sext.w	a4,a5
    80004c40:	00f52c23          	sw	a5,24(a0)
    if (this->nesting_count == 0) {
    80004c44:	00070663          	beqz	a4,80004c50 <_ZN10OwnedMutex6signalEv+0x30>
        this->owner = nullptr;
        sem_signal(this->myHandle);
    }
    return 0;
    80004c48:	00000513          	li	a0,0
}
    80004c4c:	00008067          	ret
int OwnedMutex::signal() {
    80004c50:	ff010113          	addi	sp,sp,-16
    80004c54:	00113423          	sd	ra,8(sp)
    80004c58:	00813023          	sd	s0,0(sp)
    80004c5c:	01010413          	addi	s0,sp,16
        this->owner = nullptr;
    80004c60:	00053823          	sd	zero,16(a0)
        sem_signal(this->myHandle);
    80004c64:	00853503          	ld	a0,8(a0)
    80004c68:	ffffd097          	auipc	ra,0xffffd
    80004c6c:	bb4080e7          	jalr	-1100(ra) # 8000181c <_Z10sem_signalP3Sem>
    return 0;
    80004c70:	00000513          	li	a0,0
}
    80004c74:	00813083          	ld	ra,8(sp)
    80004c78:	00013403          	ld	s0,0(sp)
    80004c7c:	01010113          	addi	sp,sp,16
    80004c80:	00008067          	ret
    if (this->owner != TCB::running) return -1;
    80004c84:	fff00513          	li	a0,-1
    80004c88:	00008067          	ret

0000000080004c8c <_ZN10OwnedMutexC1Ev>:
OwnedMutex::OwnedMutex() : owner(nullptr), nesting_count(0) {
    80004c8c:	fe010113          	addi	sp,sp,-32
    80004c90:	00113c23          	sd	ra,24(sp)
    80004c94:	00813823          	sd	s0,16(sp)
    80004c98:	00913423          	sd	s1,8(sp)
    80004c9c:	01213023          	sd	s2,0(sp)
    80004ca0:	02010413          	addi	s0,sp,32
    80004ca4:	00050493          	mv	s1,a0
    Mutex() : Semaphore(1) {}
    80004ca8:	00100593          	li	a1,1
    80004cac:	fffff097          	auipc	ra,0xfffff
    80004cb0:	5d8080e7          	jalr	1496(ra) # 80004284 <_ZN9SemaphoreC1Ej>
    80004cb4:	00006797          	auipc	a5,0x6
    80004cb8:	8e478793          	addi	a5,a5,-1820 # 8000a598 <_ZTV10OwnedMutex+0x10>
    80004cbc:	00f4b023          	sd	a5,0(s1)
    80004cc0:	0004b823          	sd	zero,16(s1)
    80004cc4:	0004ac23          	sw	zero,24(s1)
    sem_open(&this->myHandle, 1);
    80004cc8:	00100593          	li	a1,1
    80004ccc:	00848513          	addi	a0,s1,8
    80004cd0:	ffffd097          	auipc	ra,0xffffd
    80004cd4:	a88080e7          	jalr	-1400(ra) # 80001758 <_Z8sem_openPP3Semj>
    80004cd8:	02c0006f          	j	80004d04 <_ZN10OwnedMutexC1Ev+0x78>
    80004cdc:	00050913          	mv	s2,a0
class Mutex : public Semaphore {
    80004ce0:	00006797          	auipc	a5,0x6
    80004ce4:	88878793          	addi	a5,a5,-1912 # 8000a568 <_ZTV5Mutex+0x10>
    80004ce8:	00f4b023          	sd	a5,0(s1)
    80004cec:	00048513          	mv	a0,s1
    80004cf0:	fffff097          	auipc	ra,0xfffff
    80004cf4:	1e4080e7          	jalr	484(ra) # 80003ed4 <_ZN9SemaphoreD1Ev>
    80004cf8:	00090513          	mv	a0,s2
    80004cfc:	00007097          	auipc	ra,0x7
    80004d00:	b3c080e7          	jalr	-1220(ra) # 8000b838 <_Unwind_Resume>
}
    80004d04:	01813083          	ld	ra,24(sp)
    80004d08:	01013403          	ld	s0,16(sp)
    80004d0c:	00813483          	ld	s1,8(sp)
    80004d10:	00013903          	ld	s2,0(sp)
    80004d14:	02010113          	addi	sp,sp,32
    80004d18:	00008067          	ret

0000000080004d1c <_ZN5MutexD1Ev>:
    80004d1c:	ff010113          	addi	sp,sp,-16
    80004d20:	00113423          	sd	ra,8(sp)
    80004d24:	00813023          	sd	s0,0(sp)
    80004d28:	01010413          	addi	s0,sp,16
    80004d2c:	00006797          	auipc	a5,0x6
    80004d30:	83c78793          	addi	a5,a5,-1988 # 8000a568 <_ZTV5Mutex+0x10>
    80004d34:	00f53023          	sd	a5,0(a0)
    80004d38:	fffff097          	auipc	ra,0xfffff
    80004d3c:	19c080e7          	jalr	412(ra) # 80003ed4 <_ZN9SemaphoreD1Ev>
    80004d40:	00813083          	ld	ra,8(sp)
    80004d44:	00013403          	ld	s0,0(sp)
    80004d48:	01010113          	addi	sp,sp,16
    80004d4c:	00008067          	ret

0000000080004d50 <_ZN5MutexD0Ev>:
    80004d50:	fe010113          	addi	sp,sp,-32
    80004d54:	00113c23          	sd	ra,24(sp)
    80004d58:	00813823          	sd	s0,16(sp)
    80004d5c:	00913423          	sd	s1,8(sp)
    80004d60:	02010413          	addi	s0,sp,32
    80004d64:	00050493          	mv	s1,a0
    80004d68:	00006797          	auipc	a5,0x6
    80004d6c:	80078793          	addi	a5,a5,-2048 # 8000a568 <_ZTV5Mutex+0x10>
    80004d70:	00f53023          	sd	a5,0(a0)
    80004d74:	fffff097          	auipc	ra,0xfffff
    80004d78:	160080e7          	jalr	352(ra) # 80003ed4 <_ZN9SemaphoreD1Ev>
    80004d7c:	00048513          	mv	a0,s1
    80004d80:	fffff097          	auipc	ra,0xfffff
    80004d84:	234080e7          	jalr	564(ra) # 80003fb4 <_ZdlPv>
    80004d88:	01813083          	ld	ra,24(sp)
    80004d8c:	01013403          	ld	s0,16(sp)
    80004d90:	00813483          	ld	s1,8(sp)
    80004d94:	02010113          	addi	sp,sp,32
    80004d98:	00008067          	ret

0000000080004d9c <_ZN3TCB12thread_startEv>:
    if (TCB::running != thread->parent) return -4;
    thread->finish();
    return 0;
}

void TCB::thread_start() {
    80004d9c:	ff010113          	addi	sp,sp,-16
    80004da0:	00113423          	sd	ra,8(sp)
    80004da4:	00813023          	sd	s0,0(sp)
    80004da8:	01010413          	addi	s0,sp,16
    riscv::popSppSpie();
    80004dac:	00000097          	auipc	ra,0x0
    80004db0:	a34080e7          	jalr	-1484(ra) # 800047e0 <_ZN5riscv10popSppSpieEv>
    TCB::running->_run(TCB::running->arg);
    80004db4:	00006797          	auipc	a5,0x6
    80004db8:	99c7b783          	ld	a5,-1636(a5) # 8000a750 <_ZN3TCB7runningE>
    80004dbc:	0107b703          	ld	a4,16(a5)
    80004dc0:	0187b503          	ld	a0,24(a5)
    80004dc4:	000700e7          	jalr	a4
    thread_exit();
    80004dc8:	ffffc097          	auipc	ra,0xffffc
    80004dcc:	7f4080e7          	jalr	2036(ra) # 800015bc <_Z11thread_exitv>
    80004dd0:	00813083          	ld	ra,8(sp)
    80004dd4:	00013403          	ld	s0,0(sp)
    80004dd8:	01010113          	addi	sp,sp,16
    80004ddc:	00008067          	ret

0000000080004de0 <_ZN3TCB5_killEPS_>:
int TCB::_kill(TCB *thread) {
    80004de0:	ff010113          	addi	sp,sp,-16
    80004de4:	00813423          	sd	s0,8(sp)
    80004de8:	01010413          	addi	s0,sp,16
    if (!thread) return -1;
    80004dec:	02050c63          	beqz	a0,80004e24 <_ZN3TCB5_killEPS_+0x44>
    bool is_finished() const { return this->status == FINISHED; }
    80004df0:	05052703          	lw	a4,80(a0)
    if (thread->is_finished()) return -2;
    80004df4:	00400793          	li	a5,4
    80004df8:	02f70a63          	beq	a4,a5,80004e2c <_ZN3TCB5_killEPS_+0x4c>
    if (TCB::running != thread->parent) return -4;
    80004dfc:	02853703          	ld	a4,40(a0)
    80004e00:	00006797          	auipc	a5,0x6
    80004e04:	9507b783          	ld	a5,-1712(a5) # 8000a750 <_ZN3TCB7runningE>
    80004e08:	02f71663          	bne	a4,a5,80004e34 <_ZN3TCB5_killEPS_+0x54>
    void finish() { this->status = FINISHED; }
    80004e0c:	00400793          	li	a5,4
    80004e10:	04f52823          	sw	a5,80(a0)
    return 0;
    80004e14:	00000513          	li	a0,0
}
    80004e18:	00813403          	ld	s0,8(sp)
    80004e1c:	01010113          	addi	sp,sp,16
    80004e20:	00008067          	ret
    if (!thread) return -1;
    80004e24:	fff00513          	li	a0,-1
    80004e28:	ff1ff06f          	j	80004e18 <_ZN3TCB5_killEPS_+0x38>
    if (thread->is_finished()) return -2;
    80004e2c:	ffe00513          	li	a0,-2
    80004e30:	fe9ff06f          	j	80004e18 <_ZN3TCB5_killEPS_+0x38>
    if (TCB::running != thread->parent) return -4;
    80004e34:	ffc00513          	li	a0,-4
    80004e38:	fe1ff06f          	j	80004e18 <_ZN3TCB5_killEPS_+0x38>

0000000080004e3c <_ZN3TCBC1EPFvPvES0_S0_7Context>:
TCB::TCB(run_t start_routine, void *arg, void *stack, Context context) :
    80004e3c:	fe010113          	addi	sp,sp,-32
    80004e40:	00113c23          	sd	ra,24(sp)
    80004e44:	00813823          	sd	s0,16(sp)
    80004e48:	00913423          	sd	s1,8(sp)
    80004e4c:	01213023          	sd	s2,0(sp)
    80004e50:	02010413          	addi	s0,sp,32
    80004e54:	00050493          	mv	s1,a0
        t_id(TCB::ID++), _run(start_routine), arg(arg),
    80004e58:	00006917          	auipc	s2,0x6
    80004e5c:	8f890913          	addi	s2,s2,-1800 # 8000a750 <_ZN3TCB7runningE>
    80004e60:	00892783          	lw	a5,8(s2)
    80004e64:	0017851b          	addiw	a0,a5,1
    80004e68:	00a92423          	sw	a0,8(s2)
        time_slice(DEFAULT_TIME_SLICE), preempted(false), joiner() {
    80004e6c:	00f4a423          	sw	a5,8(s1)
    80004e70:	00b4b823          	sd	a1,16(s1)
    80004e74:	00c4bc23          	sd	a2,24(s1)
    80004e78:	02d4b023          	sd	a3,32(s1)
    80004e7c:	00093783          	ld	a5,0(s2)
    80004e80:	02f4b423          	sd	a5,40(s1)
    80004e84:	00073583          	ld	a1,0(a4)
    80004e88:	00873603          	ld	a2,8(a4)
    80004e8c:	01073683          	ld	a3,16(a4)
    80004e90:	01873783          	ld	a5,24(a4)
    80004e94:	02b4b823          	sd	a1,48(s1)
    80004e98:	02c4bc23          	sd	a2,56(s1)
    80004e9c:	04d4b023          	sd	a3,64(s1)
    80004ea0:	04f4b423          	sd	a5,72(s1)
    80004ea4:	0404a823          	sw	zero,80(s1)
    80004ea8:	00100793          	li	a5,1
    80004eac:	04f4bc23          	sd	a5,88(s1)
    80004eb0:	06048023          	sb	zero,96(s1)
    80004eb4:	0604b423          	sd	zero,104(s1)
    80004eb8:	0604a823          	sw	zero,112(s1)
    80004ebc:	0604aa23          	sw	zero,116(s1)
    80004ec0:	0604ac23          	sw	zero,120(s1)
    80004ec4:	0604ae23          	sw	zero,124(s1)
    this->joiner.init();
    80004ec8:	06848513          	addi	a0,s1,104
    80004ecc:	ffffd097          	auipc	ra,0xffffd
    80004ed0:	600080e7          	jalr	1536(ra) # 800024cc <_ZN3stm14CircularBufferIP3TCBE4initEv>
    this->parent = TCB::running;
    80004ed4:	00093783          	ld	a5,0(s2)
    80004ed8:	02f4b423          	sd	a5,40(s1)
}
    80004edc:	01813083          	ld	ra,24(sp)
    80004ee0:	01013403          	ld	s0,16(sp)
    80004ee4:	00813483          	ld	s1,8(sp)
    80004ee8:	00013903          	ld	s2,0(sp)
    80004eec:	02010113          	addi	sp,sp,32
    80004ef0:	00008067          	ret

0000000080004ef4 <_ZN3TCB14_thread_createEPPS_PFvPvES2_Pc>:
int TCB::_thread_create(thread_t *handle, void(*start_routine)(void *), void *arg, char *stack) {
    80004ef4:	f8010113          	addi	sp,sp,-128
    80004ef8:	06113c23          	sd	ra,120(sp)
    80004efc:	06813823          	sd	s0,112(sp)
    80004f00:	06913423          	sd	s1,104(sp)
    80004f04:	07213023          	sd	s2,96(sp)
    80004f08:	05313c23          	sd	s3,88(sp)
    80004f0c:	05413823          	sd	s4,80(sp)
    80004f10:	05513423          	sd	s5,72(sp)
    80004f14:	08010413          	addi	s0,sp,128
    80004f18:	00050913          	mv	s2,a0
    80004f1c:	00058993          	mv	s3,a1
    80004f20:	00060a93          	mv	s5,a2
    80004f24:	00068a13          	mv	s4,a3
    *handle = new TCB(start_routine, arg, stack, {(uint64) thread_start, (uint64) (&stack[DEFAULT_STACK_SIZE]) & (~0xFL)});
    80004f28:	fa043823          	sd	zero,-80(s0)
    80004f2c:	fa043c23          	sd	zero,-72(s0)
    80004f30:	00000797          	auipc	a5,0x0
    80004f34:	e6c78793          	addi	a5,a5,-404 # 80004d9c <_ZN3TCB12thread_startEv>
    80004f38:	faf43023          	sd	a5,-96(s0)
    80004f3c:	000047b7          	lui	a5,0x4
    80004f40:	00f687b3          	add	a5,a3,a5
    80004f44:	ff07f793          	andi	a5,a5,-16
    80004f48:	faf43423          	sd	a5,-88(s0)
    80004f4c:	08000513          	li	a0,128
    80004f50:	fffff097          	auipc	ra,0xfffff
    80004f54:	014080e7          	jalr	20(ra) # 80003f64 <_Znwm>
    80004f58:	00050493          	mv	s1,a0
    80004f5c:	fa043783          	ld	a5,-96(s0)
    80004f60:	f8f43023          	sd	a5,-128(s0)
    80004f64:	fa843783          	ld	a5,-88(s0)
    80004f68:	f8f43423          	sd	a5,-120(s0)
    80004f6c:	fb043783          	ld	a5,-80(s0)
    80004f70:	f8f43823          	sd	a5,-112(s0)
    80004f74:	fb843783          	ld	a5,-72(s0)
    80004f78:	f8f43c23          	sd	a5,-104(s0)
    80004f7c:	f8040713          	addi	a4,s0,-128
    80004f80:	000a0693          	mv	a3,s4
    80004f84:	000a8613          	mv	a2,s5
    80004f88:	00098593          	mv	a1,s3
    80004f8c:	00000097          	auipc	ra,0x0
    80004f90:	eb0080e7          	jalr	-336(ra) # 80004e3c <_ZN3TCBC1EPFvPvES0_S0_7Context>
    80004f94:	00993023          	sd	s1,0(s2)
    if (start_routine) Scheduler::put(*handle);
    80004f98:	02098e63          	beqz	s3,80004fd4 <_ZN3TCB14_thread_createEPPS_PFvPvES2_Pc+0xe0>
    80004f9c:	00048513          	mv	a0,s1
    80004fa0:	00000097          	auipc	ra,0x0
    80004fa4:	a8c080e7          	jalr	-1396(ra) # 80004a2c <_ZN9Scheduler3putEP3TCB>
    return (*handle)->t_id;
    80004fa8:	00093783          	ld	a5,0(s2)
    80004fac:	0087a503          	lw	a0,8(a5) # 4008 <_entry-0x7fffbff8>
}
    80004fb0:	07813083          	ld	ra,120(sp)
    80004fb4:	07013403          	ld	s0,112(sp)
    80004fb8:	06813483          	ld	s1,104(sp)
    80004fbc:	06013903          	ld	s2,96(sp)
    80004fc0:	05813983          	ld	s3,88(sp)
    80004fc4:	05013a03          	ld	s4,80(sp)
    80004fc8:	04813a83          	ld	s5,72(sp)
    80004fcc:	08010113          	addi	sp,sp,128
    80004fd0:	00008067          	ret
    else TCB::running = *handle;
    80004fd4:	00005797          	auipc	a5,0x5
    80004fd8:	7697be23          	sd	s1,1916(a5) # 8000a750 <_ZN3TCB7runningE>
    80004fdc:	fcdff06f          	j	80004fa8 <_ZN3TCB14_thread_createEPPS_PFvPvES2_Pc+0xb4>
    80004fe0:	00050913          	mv	s2,a0
    *handle = new TCB(start_routine, arg, stack, {(uint64) thread_start, (uint64) (&stack[DEFAULT_STACK_SIZE]) & (~0xFL)});
    80004fe4:	00048513          	mv	a0,s1
    80004fe8:	fffff097          	auipc	ra,0xfffff
    80004fec:	fcc080e7          	jalr	-52(ra) # 80003fb4 <_ZdlPv>
    80004ff0:	00090513          	mv	a0,s2
    80004ff4:	00007097          	auipc	ra,0x7
    80004ff8:	844080e7          	jalr	-1980(ra) # 8000b838 <_Unwind_Resume>

0000000080004ffc <_ZN3TCBC1ERS_>:
TCB::TCB(TCB &parent) :
    80004ffc:	fe010113          	addi	sp,sp,-32
    80005000:	00113c23          	sd	ra,24(sp)
    80005004:	00813823          	sd	s0,16(sp)
    80005008:	00913423          	sd	s1,8(sp)
    8000500c:	01213023          	sd	s2,0(sp)
    80005010:	02010413          	addi	s0,sp,32
    80005014:	00050493          	mv	s1,a0
    80005018:	00058913          	mv	s2,a1
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    8000501c:	00005717          	auipc	a4,0x5
    80005020:	73470713          	addi	a4,a4,1844 # 8000a750 <_ZN3TCB7runningE>
    80005024:	00872783          	lw	a5,8(a4)
    80005028:	0017869b          	addiw	a3,a5,1
    8000502c:	00d72423          	sw	a3,8(a4)
        preempted(false), joiner() {
    80005030:	00f52423          	sw	a5,8(a0)
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    80005034:	0105b783          	ld	a5,16(a1)
        preempted(false), joiner() {
    80005038:	00f53823          	sd	a5,16(a0)
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    8000503c:	0185b783          	ld	a5,24(a1)
        preempted(false), joiner() {
    80005040:	00f53c23          	sd	a5,24(a0)
        stack(Allocator::_mem_alloc(DEFAULT_STACK_SIZE)),
    80005044:	00004537          	lui	a0,0x4
    80005048:	ffffe097          	auipc	ra,0xffffe
    8000504c:	6e8080e7          	jalr	1768(ra) # 80003730 <_ZN9Allocator10_mem_allocEm>
        preempted(false), joiner() {
    80005050:	02a4b023          	sd	a0,32(s1)
    80005054:	0324b423          	sd	s2,40(s1)
    80005058:	03093603          	ld	a2,48(s2)
    8000505c:	03893683          	ld	a3,56(s2)
    80005060:	04093703          	ld	a4,64(s2)
    80005064:	04893783          	ld	a5,72(s2)
    80005068:	02c4b823          	sd	a2,48(s1)
    8000506c:	02d4bc23          	sd	a3,56(s1)
    80005070:	04e4b023          	sd	a4,64(s1)
    80005074:	04f4b423          	sd	a5,72(s1)
    80005078:	0404a823          	sw	zero,80(s1)
    8000507c:	00100793          	li	a5,1
    80005080:	04f4bc23          	sd	a5,88(s1)
    80005084:	06048023          	sb	zero,96(s1)
    80005088:	0604b423          	sd	zero,104(s1)
    8000508c:	0604a823          	sw	zero,112(s1)
    80005090:	0604aa23          	sw	zero,116(s1)
    80005094:	0604ac23          	sw	zero,120(s1)
    80005098:	0604ae23          	sw	zero,124(s1)
    this->joiner.init();
    8000509c:	06848513          	addi	a0,s1,104
    800050a0:	ffffd097          	auipc	ra,0xffffd
    800050a4:	42c080e7          	jalr	1068(ra) # 800024cc <_ZN3stm14CircularBufferIP3TCBE4initEv>
    Scheduler::put(this);
    800050a8:	00048513          	mv	a0,s1
    800050ac:	00000097          	auipc	ra,0x0
    800050b0:	980080e7          	jalr	-1664(ra) # 80004a2c <_ZN9Scheduler3putEP3TCB>
}
    800050b4:	01813083          	ld	ra,24(sp)
    800050b8:	01013403          	ld	s0,16(sp)
    800050bc:	00813483          	ld	s1,8(sp)
    800050c0:	00013903          	ld	s2,0(sp)
    800050c4:	02010113          	addi	sp,sp,32
    800050c8:	00008067          	ret

00000000800050cc <_ZN3TCB5_forkEv>:
int TCB::_fork() {
    800050cc:	fd010113          	addi	sp,sp,-48
    800050d0:	02113423          	sd	ra,40(sp)
    800050d4:	02813023          	sd	s0,32(sp)
    800050d8:	00913c23          	sd	s1,24(sp)
    800050dc:	01213823          	sd	s2,16(sp)
    800050e0:	03010413          	addi	s0,sp,48
    TCB *parent = TCB::running;
    800050e4:	00005917          	auipc	s2,0x5
    800050e8:	66c93903          	ld	s2,1644(s2) # 8000a750 <_ZN3TCB7runningE>
    TCB *child = new TCB(*parent);
    800050ec:	08000513          	li	a0,128
    800050f0:	fffff097          	auipc	ra,0xfffff
    800050f4:	e74080e7          	jalr	-396(ra) # 80003f64 <_Znwm>
    800050f8:	00050493          	mv	s1,a0
    800050fc:	00090593          	mv	a1,s2
    80005100:	00000097          	auipc	ra,0x0
    80005104:	efc080e7          	jalr	-260(ra) # 80004ffc <_ZN3TCBC1ERS_>
    int volatile parent_id = parent->t_id;
    80005108:	00892783          	lw	a5,8(s2)
    8000510c:	fcf42e23          	sw	a5,-36(s0)
    if (riscv::setjump()) {
    80005110:	ffffc097          	auipc	ra,0xffffc
    80005114:	258080e7          	jalr	600(ra) # 80001368 <_ZN5riscv7setjumpEv>
    80005118:	02051c63          	bnez	a0,80005150 <_ZN3TCB5_forkEv+0x84>
    if (TCB::running->t_id == parent_id) {
    8000511c:	00005797          	auipc	a5,0x5
    80005120:	6347b783          	ld	a5,1588(a5) # 8000a750 <_ZN3TCB7runningE>
    80005124:	0087a703          	lw	a4,8(a5)
    80005128:	fdc42783          	lw	a5,-36(s0)
    8000512c:	0007879b          	sext.w	a5,a5
    80005130:	06f70463          	beq	a4,a5,80005198 <_ZN3TCB5_forkEv+0xcc>
        return 0;
    80005134:	00000513          	li	a0,0
}
    80005138:	02813083          	ld	ra,40(sp)
    8000513c:	02013403          	ld	s0,32(sp)
    80005140:	01813483          	ld	s1,24(sp)
    80005144:	01013903          	ld	s2,16(sp)
    80005148:	03010113          	addi	sp,sp,48
    8000514c:	00008067          	ret
}

inline uint64 riscv::r_sp() {
    uint64 volatile ret;
    __asm__ volatile ("mv %[ret], sp" : [ret] "=r"(ret));
    80005150:	00010793          	mv	a5,sp
    80005154:	fcf43823          	sd	a5,-48(s0)
    return ret;
    80005158:	fd043783          	ld	a5,-48(s0)
        child->context.ra = (uint64) riscv::longjump;
    8000515c:	00005717          	auipc	a4,0x5
    80005160:	4fc73703          	ld	a4,1276(a4) # 8000a658 <_GLOBAL_OFFSET_TABLE_+0xa0>
    80005164:	02e4b823          	sd	a4,48(s1)
        child->context.sp = (uint64) child->stack + sp - (uint64) parent->stack;
    80005168:	0204b583          	ld	a1,32(s1)
    8000516c:	00f587b3          	add	a5,a1,a5
    80005170:	02093703          	ld	a4,32(s2)
    80005174:	40e787b3          	sub	a5,a5,a4
    80005178:	02f4bc23          	sd	a5,56(s1)
        memcpy(parent->stack, child->stack, DEFAULT_STACK_SIZE);
    8000517c:	00004637          	lui	a2,0x4
    80005180:	02093503          	ld	a0,32(s2)
    80005184:	fffff097          	auipc	ra,0xfffff
    80005188:	884080e7          	jalr	-1916(ra) # 80003a08 <_Z6memcpyPKvS0_i>
        riscv::longjump();
    8000518c:	ffffc097          	auipc	ra,0xffffc
    80005190:	264080e7          	jalr	612(ra) # 800013f0 <_ZN5riscv8longjumpEv>
    80005194:	f89ff06f          	j	8000511c <_ZN3TCB5_forkEv+0x50>
        return child->t_id;
    80005198:	0084a503          	lw	a0,8(s1)
    8000519c:	f9dff06f          	j	80005138 <_ZN3TCB5_forkEv+0x6c>
    800051a0:	00050913          	mv	s2,a0
    TCB *child = new TCB(*parent);
    800051a4:	00048513          	mv	a0,s1
    800051a8:	fffff097          	auipc	ra,0xfffff
    800051ac:	e0c080e7          	jalr	-500(ra) # 80003fb4 <_ZdlPv>
    800051b0:	00090513          	mv	a0,s2
    800051b4:	00006097          	auipc	ra,0x6
    800051b8:	684080e7          	jalr	1668(ra) # 8000b838 <_Unwind_Resume>

00000000800051bc <_ZN3TCB14destroy_threadEPS_>:
TCB *TCB::destroy_thread(TCB *thread) {
    800051bc:	fe010113          	addi	sp,sp,-32
    800051c0:	00113c23          	sd	ra,24(sp)
    800051c4:	00813823          	sd	s0,16(sp)
    800051c8:	00913423          	sd	s1,8(sp)
    800051cc:	02010413          	addi	s0,sp,32
    800051d0:	00050493          	mv	s1,a0
        inline bool is_empty() const { return this->size == 0; }
    800051d4:	0784a783          	lw	a5,120(s1)
    while (!thread->joiner.is_empty()) {
    800051d8:	02078663          	beqz	a5,80005204 <_ZN3TCB14destroy_threadEPS_+0x48>
        TCB *next = thread->joiner.get();
    800051dc:	06848513          	addi	a0,s1,104
    800051e0:	ffffd097          	auipc	ra,0xffffd
    800051e4:	33c080e7          	jalr	828(ra) # 8000251c <_ZN3stm14CircularBufferIP3TCBE3getEv>
    bool is_joined() const { return this->status == JOINED; }
    800051e8:	05052703          	lw	a4,80(a0) # 4050 <_entry-0x7fffbfb0>
        if (next->is_joined()) {
    800051ec:	00300793          	li	a5,3
    800051f0:	fef712e3          	bne	a4,a5,800051d4 <_ZN3TCB14destroy_threadEPS_+0x18>
    void run() { this->status = RUNNABLE; }
    800051f4:	04052823          	sw	zero,80(a0)
            Scheduler::put(next);
    800051f8:	00000097          	auipc	ra,0x0
    800051fc:	834080e7          	jalr	-1996(ra) # 80004a2c <_ZN9Scheduler3putEP3TCB>
    80005200:	fd5ff06f          	j	800051d4 <_ZN3TCB14destroy_threadEPS_+0x18>
    thread->joiner.destroy();
    80005204:	06848513          	addi	a0,s1,104
    80005208:	ffffd097          	auipc	ra,0xffffd
    8000520c:	360080e7          	jalr	864(ra) # 80002568 <_ZN3stm14CircularBufferIP3TCBE7destroyEv>
}
    80005210:	00048513          	mv	a0,s1
    80005214:	01813083          	ld	ra,24(sp)
    80005218:	01013403          	ld	s0,16(sp)
    8000521c:	00813483          	ld	s1,8(sp)
    80005220:	02010113          	addi	sp,sp,32
    80005224:	00008067          	ret

0000000080005228 <_ZN3TCB16_thread_dispatchEv>:
void TCB::_thread_dispatch() {
    80005228:	fe010113          	addi	sp,sp,-32
    8000522c:	00113c23          	sd	ra,24(sp)
    80005230:	00813823          	sd	s0,16(sp)
    80005234:	00913423          	sd	s1,8(sp)
    80005238:	02010413          	addi	s0,sp,32
    thread_t old = TCB::running;
    8000523c:	00005497          	auipc	s1,0x5
    80005240:	5144b483          	ld	s1,1300(s1) # 8000a750 <_ZN3TCB7runningE>
    bool is_runnable() const { return this->status == RUNNABLE; }
    80005244:	0504a783          	lw	a5,80(s1)
    if (old->is_runnable()) {
    80005248:	02078c63          	beqz	a5,80005280 <_ZN3TCB16_thread_dispatchEv+0x58>
    while (Scheduler::peek()->is_finished()) {
    8000524c:	fffff097          	auipc	ra,0xfffff
    80005250:	74c080e7          	jalr	1868(ra) # 80004998 <_ZN9Scheduler4peekEv>
    bool is_finished() const { return this->status == FINISHED; }
    80005254:	05052703          	lw	a4,80(a0)
    80005258:	00400793          	li	a5,4
    8000525c:	02f71a63          	bne	a4,a5,80005290 <_ZN3TCB16_thread_dispatchEv+0x68>
        Allocator::_mem_free(TCB::destroy_thread(Scheduler::get())->stack);
    80005260:	fffff097          	auipc	ra,0xfffff
    80005264:	6b0080e7          	jalr	1712(ra) # 80004910 <_ZN9Scheduler3getEv>
    80005268:	00000097          	auipc	ra,0x0
    8000526c:	f54080e7          	jalr	-172(ra) # 800051bc <_ZN3TCB14destroy_threadEPS_>
    80005270:	02053503          	ld	a0,32(a0)
    80005274:	ffffe097          	auipc	ra,0xffffe
    80005278:	578080e7          	jalr	1400(ra) # 800037ec <_ZN9Allocator9_mem_freeEPKv>
    while (Scheduler::peek()->is_finished()) {
    8000527c:	fd1ff06f          	j	8000524c <_ZN3TCB16_thread_dispatchEv+0x24>
        Scheduler::put(old);
    80005280:	00048513          	mv	a0,s1
    80005284:	fffff097          	auipc	ra,0xfffff
    80005288:	7a8080e7          	jalr	1960(ra) # 80004a2c <_ZN9Scheduler3putEP3TCB>
    8000528c:	fc1ff06f          	j	8000524c <_ZN3TCB16_thread_dispatchEv+0x24>
    TCB::running = Scheduler::get();
    80005290:	fffff097          	auipc	ra,0xfffff
    80005294:	680080e7          	jalr	1664(ra) # 80004910 <_ZN9Scheduler3getEv>
    80005298:	00005797          	auipc	a5,0x5
    8000529c:	4aa7bc23          	sd	a0,1208(a5) # 8000a750 <_ZN3TCB7runningE>
    if (riscv::setjump()) {
    800052a0:	ffffc097          	auipc	ra,0xffffc
    800052a4:	0c8080e7          	jalr	200(ra) # 80001368 <_ZN5riscv7setjumpEv>
    800052a8:	00051c63          	bnez	a0,800052c0 <_ZN3TCB16_thread_dispatchEv+0x98>
}
    800052ac:	01813083          	ld	ra,24(sp)
    800052b0:	01013403          	ld	s0,16(sp)
    800052b4:	00813483          	ld	s1,8(sp)
    800052b8:	02010113          	addi	sp,sp,32
    800052bc:	00008067          	ret
        TCB::context_switch(&old->context, &TCB::running->context);
    800052c0:	00005597          	auipc	a1,0x5
    800052c4:	4905b583          	ld	a1,1168(a1) # 8000a750 <_ZN3TCB7runningE>
    800052c8:	03058593          	addi	a1,a1,48
    800052cc:	03048513          	addi	a0,s1,48
    800052d0:	ffffc097          	auipc	ra,0xffffc
    800052d4:	1a0080e7          	jalr	416(ra) # 80001470 <_ZN3TCB14context_switchEP7ContextS1_>
        riscv::longjump();
    800052d8:	ffffc097          	auipc	ra,0xffffc
    800052dc:	118080e7          	jalr	280(ra) # 800013f0 <_ZN5riscv8longjumpEv>
}
    800052e0:	fcdff06f          	j	800052ac <_ZN3TCB16_thread_dispatchEv+0x84>

00000000800052e4 <_ZN3TCB12_thread_exitEv>:
void TCB::_thread_exit() {
    800052e4:	fe010113          	addi	sp,sp,-32
    800052e8:	00113c23          	sd	ra,24(sp)
    800052ec:	00813823          	sd	s0,16(sp)
    800052f0:	00913423          	sd	s1,8(sp)
    800052f4:	02010413          	addi	s0,sp,32
    TCB::running->finish();
    800052f8:	00005497          	auipc	s1,0x5
    800052fc:	45848493          	addi	s1,s1,1112 # 8000a750 <_ZN3TCB7runningE>
    80005300:	0004b503          	ld	a0,0(s1)
    void finish() { this->status = FINISHED; }
    80005304:	00400793          	li	a5,4
    80005308:	04f52823          	sw	a5,80(a0)
    TCB::destroy_thread(TCB::running);
    8000530c:	00000097          	auipc	ra,0x0
    80005310:	eb0080e7          	jalr	-336(ra) # 800051bc <_ZN3TCB14destroy_threadEPS_>
    Allocator::_mem_free(TCB::running->stack);
    80005314:	0004b783          	ld	a5,0(s1)
    80005318:	0207b503          	ld	a0,32(a5)
    8000531c:	ffffe097          	auipc	ra,0xffffe
    80005320:	4d0080e7          	jalr	1232(ra) # 800037ec <_ZN9Allocator9_mem_freeEPKv>
    TCB::_thread_dispatch();
    80005324:	00000097          	auipc	ra,0x0
    80005328:	f04080e7          	jalr	-252(ra) # 80005228 <_ZN3TCB16_thread_dispatchEv>
}
    8000532c:	01813083          	ld	ra,24(sp)
    80005330:	01013403          	ld	s0,16(sp)
    80005334:	00813483          	ld	s1,8(sp)
    80005338:	02010113          	addi	sp,sp,32
    8000533c:	00008067          	ret

0000000080005340 <_ZN3TCB12_thread_joinEPS_>:
    bool is_finished() const { return this->status == FINISHED; }
    80005340:	05052703          	lw	a4,80(a0)
    if (handle->is_finished())
    80005344:	00400793          	li	a5,4
    80005348:	04f70463          	beq	a4,a5,80005390 <_ZN3TCB12_thread_joinEPS_+0x50>
void TCB::_thread_join(thread_t handle) {
    8000534c:	ff010113          	addi	sp,sp,-16
    80005350:	00113423          	sd	ra,8(sp)
    80005354:	00813023          	sd	s0,0(sp)
    80005358:	01010413          	addi	s0,sp,16
    TCB::running->enjoin();
    8000535c:	00005597          	auipc	a1,0x5
    80005360:	3f45b583          	ld	a1,1012(a1) # 8000a750 <_ZN3TCB7runningE>
    void enjoin() { this->status = JOINED; }
    80005364:	00300793          	li	a5,3
    80005368:	04f5a823          	sw	a5,80(a1)
    handle->joiner.put(TCB::running);
    8000536c:	06850513          	addi	a0,a0,104
    80005370:	ffffd097          	auipc	ra,0xffffd
    80005374:	2d0080e7          	jalr	720(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    TCB::_thread_dispatch();
    80005378:	00000097          	auipc	ra,0x0
    8000537c:	eb0080e7          	jalr	-336(ra) # 80005228 <_ZN3TCB16_thread_dispatchEv>
}
    80005380:	00813083          	ld	ra,8(sp)
    80005384:	00013403          	ld	s0,0(sp)
    80005388:	01010113          	addi	sp,sp,16
    8000538c:	00008067          	ret
    80005390:	00008067          	ret

0000000080005394 <_ZN3TCB17_thread_join_timeEPS_m>:
    bool is_finished() const { return this->status == FINISHED; }
    80005394:	05052703          	lw	a4,80(a0)
    if (handle->is_finished())
    80005398:	00400793          	li	a5,4
    8000539c:	06f70863          	beq	a4,a5,8000540c <_ZN3TCB17_thread_join_timeEPS_m+0x78>
void TCB::_thread_join_time(thread_t handle, time_t time) {
    800053a0:	fe010113          	addi	sp,sp,-32
    800053a4:	00113c23          	sd	ra,24(sp)
    800053a8:	00813823          	sd	s0,16(sp)
    800053ac:	00913423          	sd	s1,8(sp)
    800053b0:	01213023          	sd	s2,0(sp)
    800053b4:	02010413          	addi	s0,sp,32
    800053b8:	00058493          	mv	s1,a1
    TCB::running->enjoin();
    800053bc:	00005917          	auipc	s2,0x5
    800053c0:	39490913          	addi	s2,s2,916 # 8000a750 <_ZN3TCB7runningE>
    800053c4:	00093583          	ld	a1,0(s2)
    void enjoin() { this->status = JOINED; }
    800053c8:	00300793          	li	a5,3
    800053cc:	04f5a823          	sw	a5,80(a1)
    handle->joiner.put(TCB::running);
    800053d0:	06850513          	addi	a0,a0,104
    800053d4:	ffffd097          	auipc	ra,0xffffd
    800053d8:	26c080e7          	jalr	620(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    Cradle::insert(TCB::running, time);
    800053dc:	00048593          	mv	a1,s1
    800053e0:	00093503          	ld	a0,0(s2)
    800053e4:	ffffe097          	auipc	ra,0xffffe
    800053e8:	8b8080e7          	jalr	-1864(ra) # 80002c9c <_ZN6Cradle6insertEP3TCBm>
    TCB::_thread_dispatch();
    800053ec:	00000097          	auipc	ra,0x0
    800053f0:	e3c080e7          	jalr	-452(ra) # 80005228 <_ZN3TCB16_thread_dispatchEv>
}
    800053f4:	01813083          	ld	ra,24(sp)
    800053f8:	01013403          	ld	s0,16(sp)
    800053fc:	00813483          	ld	s1,8(sp)
    80005400:	00013903          	ld	s2,0(sp)
    80005404:	02010113          	addi	sp,sp,32
    80005408:	00008067          	ret
    8000540c:	00008067          	ret

0000000080005410 <_ZN12MonitorMutex10relinquishEv>:
#include "../h/monitor.hpp"

int MonitorMutex::relinquish() {
    80005410:	ff010113          	addi	sp,sp,-16
    80005414:	00813423          	sd	s0,8(sp)
    80005418:	01010413          	addi	s0,sp,16
    8000541c:	00050793          	mv	a5,a0
    int ret = this->nesting_count;
    80005420:	01852503          	lw	a0,24(a0)
    this->nesting_count = 1;
    80005424:	00100713          	li	a4,1
    80005428:	00e7ac23          	sw	a4,24(a5)
    return ret;
}
    8000542c:	00813403          	ld	s0,8(sp)
    80005430:	01010113          	addi	sp,sp,16
    80005434:	00008067          	ret

0000000080005438 <_ZN12MonitorMutex9reacquireEi>:

void MonitorMutex::reacquire(int count) {
    80005438:	ff010113          	addi	sp,sp,-16
    8000543c:	00813423          	sd	s0,8(sp)
    80005440:	01010413          	addi	s0,sp,16
    this->nesting_count = count;
    80005444:	00b52c23          	sw	a1,24(a0)
}
    80005448:	00813403          	ld	s0,8(sp)
    8000544c:	01010113          	addi	sp,sp,16
    80005450:	00008067          	ret

0000000080005454 <_ZN11MonitorLockC1ER12MonitorMutex>:

MonitorLock::MonitorLock(MonitorMutex &mutex) : monitorMutex(mutex) {
    80005454:	ff010113          	addi	sp,sp,-16
    80005458:	00113423          	sd	ra,8(sp)
    8000545c:	00813023          	sd	s0,0(sp)
    80005460:	01010413          	addi	s0,sp,16
    80005464:	00b53023          	sd	a1,0(a0)
    this->monitorMutex.wait();
    80005468:	0005b783          	ld	a5,0(a1)
    8000546c:	0107b783          	ld	a5,16(a5)
    80005470:	00058513          	mv	a0,a1
    80005474:	000780e7          	jalr	a5
}
    80005478:	00813083          	ld	ra,8(sp)
    8000547c:	00013403          	ld	s0,0(sp)
    80005480:	01010113          	addi	sp,sp,16
    80005484:	00008067          	ret

0000000080005488 <_ZN11MonitorLockD1Ev>:

MonitorLock::~MonitorLock() {
    80005488:	ff010113          	addi	sp,sp,-16
    8000548c:	00113423          	sd	ra,8(sp)
    80005490:	00813023          	sd	s0,0(sp)
    80005494:	01010413          	addi	s0,sp,16
    this->monitorMutex.signal();
    80005498:	00053503          	ld	a0,0(a0)
    8000549c:	00053783          	ld	a5,0(a0)
    800054a0:	0187b783          	ld	a5,24(a5)
    800054a4:	000780e7          	jalr	a5
}
    800054a8:	00813083          	ld	ra,8(sp)
    800054ac:	00013403          	ld	s0,0(sp)
    800054b0:	01010113          	addi	sp,sp,16
    800054b4:	00008067          	ret

00000000800054b8 <_ZN11ConditionalC1EP7Monitor>:

Conditional::Conditional(Monitor *monitor) : owner(monitor), count(0), blocker(0) {}
    800054b8:	ff010113          	addi	sp,sp,-16
    800054bc:	00113423          	sd	ra,8(sp)
    800054c0:	00813023          	sd	s0,0(sp)
    800054c4:	01010413          	addi	s0,sp,16
    800054c8:	00b53023          	sd	a1,0(a0)
    800054cc:	00052423          	sw	zero,8(a0)
    800054d0:	00000593          	li	a1,0
    800054d4:	01050513          	addi	a0,a0,16
    800054d8:	fffff097          	auipc	ra,0xfffff
    800054dc:	dac080e7          	jalr	-596(ra) # 80004284 <_ZN9SemaphoreC1Ej>
    800054e0:	00813083          	ld	ra,8(sp)
    800054e4:	00013403          	ld	s0,0(sp)
    800054e8:	01010113          	addi	sp,sp,16
    800054ec:	00008067          	ret

00000000800054f0 <_ZN11Conditional4waitEv>:

void Conditional::wait() {
    800054f0:	fe010113          	addi	sp,sp,-32
    800054f4:	00113c23          	sd	ra,24(sp)
    800054f8:	00813823          	sd	s0,16(sp)
    800054fc:	00913423          	sd	s1,8(sp)
    80005500:	01213023          	sd	s2,0(sp)
    80005504:	02010413          	addi	s0,sp,32
    80005508:	00050493          	mv	s1,a0
    this->count++;
    8000550c:	00852783          	lw	a5,8(a0)
    80005510:	0017879b          	addiw	a5,a5,1
    80005514:	00f52423          	sw	a5,8(a0)
    int nesting = this->owner->monitorMutex.relinquish();
    80005518:	00053503          	ld	a0,0(a0)
    8000551c:	00000097          	auipc	ra,0x0
    80005520:	ef4080e7          	jalr	-268(ra) # 80005410 <_ZN12MonitorMutex10relinquishEv>
    80005524:	00050913          	mv	s2,a0
    Semaphore::signal_and_wait(this->owner->monitorMutex, this->blocker);
    80005528:	01048593          	addi	a1,s1,16
    8000552c:	0004b503          	ld	a0,0(s1)
    80005530:	fffff097          	auipc	ra,0xfffff
    80005534:	d8c080e7          	jalr	-628(ra) # 800042bc <_ZN9Semaphore15signal_and_waitERS_S0_>
    this->owner->monitorMutex.reacquire(nesting);
    80005538:	00090593          	mv	a1,s2
    8000553c:	0004b503          	ld	a0,0(s1)
    80005540:	00000097          	auipc	ra,0x0
    80005544:	ef8080e7          	jalr	-264(ra) # 80005438 <_ZN12MonitorMutex9reacquireEi>
    this->owner->monitorMutex.wait();
    80005548:	0004b503          	ld	a0,0(s1)
    8000554c:	fffff097          	auipc	ra,0xfffff
    80005550:	668080e7          	jalr	1640(ra) # 80004bb4 <_ZN10OwnedMutex4waitEv>
}
    80005554:	01813083          	ld	ra,24(sp)
    80005558:	01013403          	ld	s0,16(sp)
    8000555c:	00813483          	ld	s1,8(sp)
    80005560:	00013903          	ld	s2,0(sp)
    80005564:	02010113          	addi	sp,sp,32
    80005568:	00008067          	ret

000000008000556c <_ZN11Conditional6signalEv>:

void Conditional::signal() {
    if (this->count == 0) return;
    8000556c:	00852783          	lw	a5,8(a0)
    80005570:	00079463          	bnez	a5,80005578 <_ZN11Conditional6signalEv+0xc>
    80005574:	00008067          	ret
void Conditional::signal() {
    80005578:	fe010113          	addi	sp,sp,-32
    8000557c:	00113c23          	sd	ra,24(sp)
    80005580:	00813823          	sd	s0,16(sp)
    80005584:	00913423          	sd	s1,8(sp)
    80005588:	02010413          	addi	s0,sp,32
    8000558c:	00050493          	mv	s1,a0
    this->blocker.signal();
    80005590:	01050513          	addi	a0,a0,16
    80005594:	fffff097          	auipc	ra,0xfffff
    80005598:	9a4080e7          	jalr	-1628(ra) # 80003f38 <_ZN9Semaphore6signalEv>
    this->count--;
    8000559c:	0084a783          	lw	a5,8(s1)
    800055a0:	fff7879b          	addiw	a5,a5,-1
    800055a4:	00f4a423          	sw	a5,8(s1)
}
    800055a8:	01813083          	ld	ra,24(sp)
    800055ac:	01013403          	ld	s0,16(sp)
    800055b0:	00813483          	ld	s1,8(sp)
    800055b4:	02010113          	addi	sp,sp,32
    800055b8:	00008067          	ret

00000000800055bc <_ZN11Conditional9signalAllEv>:

void Conditional::signalAll() {
    800055bc:	fe010113          	addi	sp,sp,-32
    800055c0:	00113c23          	sd	ra,24(sp)
    800055c4:	00813823          	sd	s0,16(sp)
    800055c8:	00913423          	sd	s1,8(sp)
    800055cc:	01213023          	sd	s2,0(sp)
    800055d0:	02010413          	addi	s0,sp,32
    800055d4:	00050913          	mv	s2,a0
    for (unsigned int i = 0; i < this->count; i++)
    800055d8:	00000493          	li	s1,0
    800055dc:	00892783          	lw	a5,8(s2)
    800055e0:	00f4fc63          	bgeu	s1,a5,800055f8 <_ZN11Conditional9signalAllEv+0x3c>
        this->blocker.signal();
    800055e4:	01090513          	addi	a0,s2,16
    800055e8:	fffff097          	auipc	ra,0xfffff
    800055ec:	950080e7          	jalr	-1712(ra) # 80003f38 <_ZN9Semaphore6signalEv>
    for (unsigned int i = 0; i < this->count; i++)
    800055f0:	0014849b          	addiw	s1,s1,1
    800055f4:	fe9ff06f          	j	800055dc <_ZN11Conditional9signalAllEv+0x20>
    this->count = 0;
    800055f8:	00092423          	sw	zero,8(s2)
    800055fc:	01813083          	ld	ra,24(sp)
    80005600:	01013403          	ld	s0,16(sp)
    80005604:	00813483          	ld	s1,8(sp)
    80005608:	00013903          	ld	s2,0(sp)
    8000560c:	02010113          	addi	sp,sp,32
    80005610:	00008067          	ret

0000000080005614 <start>:
    80005614:	ff010113          	addi	sp,sp,-16
    80005618:	00813423          	sd	s0,8(sp)
    8000561c:	01010413          	addi	s0,sp,16
    80005620:	300027f3          	csrr	a5,mstatus
    80005624:	ffffe737          	lui	a4,0xffffe
    80005628:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff2e2f>
    8000562c:	00e7f7b3          	and	a5,a5,a4
    80005630:	00001737          	lui	a4,0x1
    80005634:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80005638:	00e7e7b3          	or	a5,a5,a4
    8000563c:	30079073          	csrw	mstatus,a5
    80005640:	00000797          	auipc	a5,0x0
    80005644:	16078793          	addi	a5,a5,352 # 800057a0 <system_main>
    80005648:	34179073          	csrw	mepc,a5
    8000564c:	00000793          	li	a5,0
    80005650:	18079073          	csrw	satp,a5
    80005654:	000107b7          	lui	a5,0x10
    80005658:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000565c:	30279073          	csrw	medeleg,a5
    80005660:	30379073          	csrw	mideleg,a5
    80005664:	104027f3          	csrr	a5,sie
    80005668:	2227e793          	ori	a5,a5,546
    8000566c:	10479073          	csrw	sie,a5
    80005670:	fff00793          	li	a5,-1
    80005674:	00a7d793          	srli	a5,a5,0xa
    80005678:	3b079073          	csrw	pmpaddr0,a5
    8000567c:	00f00793          	li	a5,15
    80005680:	3a079073          	csrw	pmpcfg0,a5
    80005684:	f14027f3          	csrr	a5,mhartid
    80005688:	0200c737          	lui	a4,0x200c
    8000568c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005690:	0007869b          	sext.w	a3,a5
    80005694:	00269713          	slli	a4,a3,0x2
    80005698:	000f4637          	lui	a2,0xf4
    8000569c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800056a0:	00d70733          	add	a4,a4,a3
    800056a4:	0037979b          	slliw	a5,a5,0x3
    800056a8:	020046b7          	lui	a3,0x2004
    800056ac:	00d787b3          	add	a5,a5,a3
    800056b0:	00c585b3          	add	a1,a1,a2
    800056b4:	00371693          	slli	a3,a4,0x3
    800056b8:	00005717          	auipc	a4,0x5
    800056bc:	0b870713          	addi	a4,a4,184 # 8000a770 <timer_scratch>
    800056c0:	00b7b023          	sd	a1,0(a5)
    800056c4:	00d70733          	add	a4,a4,a3
    800056c8:	00f73c23          	sd	a5,24(a4)
    800056cc:	02c73023          	sd	a2,32(a4)
    800056d0:	34071073          	csrw	mscratch,a4
    800056d4:	00000797          	auipc	a5,0x0
    800056d8:	6ec78793          	addi	a5,a5,1772 # 80005dc0 <timervec>
    800056dc:	30579073          	csrw	mtvec,a5
    800056e0:	300027f3          	csrr	a5,mstatus
    800056e4:	0087e793          	ori	a5,a5,8
    800056e8:	30079073          	csrw	mstatus,a5
    800056ec:	304027f3          	csrr	a5,mie
    800056f0:	0807e793          	ori	a5,a5,128
    800056f4:	30479073          	csrw	mie,a5
    800056f8:	f14027f3          	csrr	a5,mhartid
    800056fc:	0007879b          	sext.w	a5,a5
    80005700:	00078213          	mv	tp,a5
    80005704:	30200073          	mret
    80005708:	00813403          	ld	s0,8(sp)
    8000570c:	01010113          	addi	sp,sp,16
    80005710:	00008067          	ret

0000000080005714 <timerinit>:
    80005714:	ff010113          	addi	sp,sp,-16
    80005718:	00813423          	sd	s0,8(sp)
    8000571c:	01010413          	addi	s0,sp,16
    80005720:	f14027f3          	csrr	a5,mhartid
    80005724:	0200c737          	lui	a4,0x200c
    80005728:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000572c:	0007869b          	sext.w	a3,a5
    80005730:	00269713          	slli	a4,a3,0x2
    80005734:	000f4637          	lui	a2,0xf4
    80005738:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000573c:	00d70733          	add	a4,a4,a3
    80005740:	0037979b          	slliw	a5,a5,0x3
    80005744:	020046b7          	lui	a3,0x2004
    80005748:	00d787b3          	add	a5,a5,a3
    8000574c:	00c585b3          	add	a1,a1,a2
    80005750:	00371693          	slli	a3,a4,0x3
    80005754:	00005717          	auipc	a4,0x5
    80005758:	01c70713          	addi	a4,a4,28 # 8000a770 <timer_scratch>
    8000575c:	00b7b023          	sd	a1,0(a5)
    80005760:	00d70733          	add	a4,a4,a3
    80005764:	00f73c23          	sd	a5,24(a4)
    80005768:	02c73023          	sd	a2,32(a4)
    8000576c:	34071073          	csrw	mscratch,a4
    80005770:	00000797          	auipc	a5,0x0
    80005774:	65078793          	addi	a5,a5,1616 # 80005dc0 <timervec>
    80005778:	30579073          	csrw	mtvec,a5
    8000577c:	300027f3          	csrr	a5,mstatus
    80005780:	0087e793          	ori	a5,a5,8
    80005784:	30079073          	csrw	mstatus,a5
    80005788:	304027f3          	csrr	a5,mie
    8000578c:	0807e793          	ori	a5,a5,128
    80005790:	30479073          	csrw	mie,a5
    80005794:	00813403          	ld	s0,8(sp)
    80005798:	01010113          	addi	sp,sp,16
    8000579c:	00008067          	ret

00000000800057a0 <system_main>:
    800057a0:	fe010113          	addi	sp,sp,-32
    800057a4:	00813823          	sd	s0,16(sp)
    800057a8:	00913423          	sd	s1,8(sp)
    800057ac:	00113c23          	sd	ra,24(sp)
    800057b0:	02010413          	addi	s0,sp,32
    800057b4:	00000097          	auipc	ra,0x0
    800057b8:	0c4080e7          	jalr	196(ra) # 80005878 <cpuid>
    800057bc:	00005497          	auipc	s1,0x5
    800057c0:	eb448493          	addi	s1,s1,-332 # 8000a670 <started>
    800057c4:	02050263          	beqz	a0,800057e8 <system_main+0x48>
    800057c8:	0004a783          	lw	a5,0(s1)
    800057cc:	0007879b          	sext.w	a5,a5
    800057d0:	fe078ce3          	beqz	a5,800057c8 <system_main+0x28>
    800057d4:	0ff0000f          	fence
    800057d8:	00003517          	auipc	a0,0x3
    800057dc:	9a850513          	addi	a0,a0,-1624 # 80008180 <_ZN3stm4coutE+0xc8>
    800057e0:	00001097          	auipc	ra,0x1
    800057e4:	a7c080e7          	jalr	-1412(ra) # 8000625c <panic>
    800057e8:	00001097          	auipc	ra,0x1
    800057ec:	9d0080e7          	jalr	-1584(ra) # 800061b8 <consoleinit>
    800057f0:	00001097          	auipc	ra,0x1
    800057f4:	15c080e7          	jalr	348(ra) # 8000694c <printfinit>
    800057f8:	00003517          	auipc	a0,0x3
    800057fc:	a6850513          	addi	a0,a0,-1432 # 80008260 <_ZN3stm4coutE+0x1a8>
    80005800:	00001097          	auipc	ra,0x1
    80005804:	ab8080e7          	jalr	-1352(ra) # 800062b8 <__printf>
    80005808:	00003517          	auipc	a0,0x3
    8000580c:	94850513          	addi	a0,a0,-1720 # 80008150 <_ZN3stm4coutE+0x98>
    80005810:	00001097          	auipc	ra,0x1
    80005814:	aa8080e7          	jalr	-1368(ra) # 800062b8 <__printf>
    80005818:	00003517          	auipc	a0,0x3
    8000581c:	a4850513          	addi	a0,a0,-1464 # 80008260 <_ZN3stm4coutE+0x1a8>
    80005820:	00001097          	auipc	ra,0x1
    80005824:	a98080e7          	jalr	-1384(ra) # 800062b8 <__printf>
    80005828:	00001097          	auipc	ra,0x1
    8000582c:	4b0080e7          	jalr	1200(ra) # 80006cd8 <kinit>
    80005830:	00000097          	auipc	ra,0x0
    80005834:	148080e7          	jalr	328(ra) # 80005978 <trapinit>
    80005838:	00000097          	auipc	ra,0x0
    8000583c:	16c080e7          	jalr	364(ra) # 800059a4 <trapinithart>
    80005840:	00000097          	auipc	ra,0x0
    80005844:	5c0080e7          	jalr	1472(ra) # 80005e00 <plicinit>
    80005848:	00000097          	auipc	ra,0x0
    8000584c:	5e0080e7          	jalr	1504(ra) # 80005e28 <plicinithart>
    80005850:	00000097          	auipc	ra,0x0
    80005854:	078080e7          	jalr	120(ra) # 800058c8 <userinit>
    80005858:	0ff0000f          	fence
    8000585c:	00100793          	li	a5,1
    80005860:	00003517          	auipc	a0,0x3
    80005864:	90850513          	addi	a0,a0,-1784 # 80008168 <_ZN3stm4coutE+0xb0>
    80005868:	00f4a023          	sw	a5,0(s1)
    8000586c:	00001097          	auipc	ra,0x1
    80005870:	a4c080e7          	jalr	-1460(ra) # 800062b8 <__printf>
    80005874:	0000006f          	j	80005874 <system_main+0xd4>

0000000080005878 <cpuid>:
    80005878:	ff010113          	addi	sp,sp,-16
    8000587c:	00813423          	sd	s0,8(sp)
    80005880:	01010413          	addi	s0,sp,16
    80005884:	00020513          	mv	a0,tp
    80005888:	00813403          	ld	s0,8(sp)
    8000588c:	0005051b          	sext.w	a0,a0
    80005890:	01010113          	addi	sp,sp,16
    80005894:	00008067          	ret

0000000080005898 <mycpu>:
    80005898:	ff010113          	addi	sp,sp,-16
    8000589c:	00813423          	sd	s0,8(sp)
    800058a0:	01010413          	addi	s0,sp,16
    800058a4:	00020793          	mv	a5,tp
    800058a8:	00813403          	ld	s0,8(sp)
    800058ac:	0007879b          	sext.w	a5,a5
    800058b0:	00779793          	slli	a5,a5,0x7
    800058b4:	00006517          	auipc	a0,0x6
    800058b8:	eec50513          	addi	a0,a0,-276 # 8000b7a0 <cpus>
    800058bc:	00f50533          	add	a0,a0,a5
    800058c0:	01010113          	addi	sp,sp,16
    800058c4:	00008067          	ret

00000000800058c8 <userinit>:
    800058c8:	ff010113          	addi	sp,sp,-16
    800058cc:	00813423          	sd	s0,8(sp)
    800058d0:	01010413          	addi	s0,sp,16
    800058d4:	00813403          	ld	s0,8(sp)
    800058d8:	01010113          	addi	sp,sp,16
    800058dc:	ffffe317          	auipc	t1,0xffffe
    800058e0:	48c30067          	jr	1164(t1) # 80003d68 <main>

00000000800058e4 <either_copyout>:
    800058e4:	ff010113          	addi	sp,sp,-16
    800058e8:	00813023          	sd	s0,0(sp)
    800058ec:	00113423          	sd	ra,8(sp)
    800058f0:	01010413          	addi	s0,sp,16
    800058f4:	02051663          	bnez	a0,80005920 <either_copyout+0x3c>
    800058f8:	00058513          	mv	a0,a1
    800058fc:	00060593          	mv	a1,a2
    80005900:	0006861b          	sext.w	a2,a3
    80005904:	00002097          	auipc	ra,0x2
    80005908:	c60080e7          	jalr	-928(ra) # 80007564 <__memmove>
    8000590c:	00813083          	ld	ra,8(sp)
    80005910:	00013403          	ld	s0,0(sp)
    80005914:	00000513          	li	a0,0
    80005918:	01010113          	addi	sp,sp,16
    8000591c:	00008067          	ret
    80005920:	00003517          	auipc	a0,0x3
    80005924:	88850513          	addi	a0,a0,-1912 # 800081a8 <_ZN3stm4coutE+0xf0>
    80005928:	00001097          	auipc	ra,0x1
    8000592c:	934080e7          	jalr	-1740(ra) # 8000625c <panic>

0000000080005930 <either_copyin>:
    80005930:	ff010113          	addi	sp,sp,-16
    80005934:	00813023          	sd	s0,0(sp)
    80005938:	00113423          	sd	ra,8(sp)
    8000593c:	01010413          	addi	s0,sp,16
    80005940:	02059463          	bnez	a1,80005968 <either_copyin+0x38>
    80005944:	00060593          	mv	a1,a2
    80005948:	0006861b          	sext.w	a2,a3
    8000594c:	00002097          	auipc	ra,0x2
    80005950:	c18080e7          	jalr	-1000(ra) # 80007564 <__memmove>
    80005954:	00813083          	ld	ra,8(sp)
    80005958:	00013403          	ld	s0,0(sp)
    8000595c:	00000513          	li	a0,0
    80005960:	01010113          	addi	sp,sp,16
    80005964:	00008067          	ret
    80005968:	00003517          	auipc	a0,0x3
    8000596c:	86850513          	addi	a0,a0,-1944 # 800081d0 <_ZN3stm4coutE+0x118>
    80005970:	00001097          	auipc	ra,0x1
    80005974:	8ec080e7          	jalr	-1812(ra) # 8000625c <panic>

0000000080005978 <trapinit>:
    80005978:	ff010113          	addi	sp,sp,-16
    8000597c:	00813423          	sd	s0,8(sp)
    80005980:	01010413          	addi	s0,sp,16
    80005984:	00813403          	ld	s0,8(sp)
    80005988:	00003597          	auipc	a1,0x3
    8000598c:	87058593          	addi	a1,a1,-1936 # 800081f8 <_ZN3stm4coutE+0x140>
    80005990:	00006517          	auipc	a0,0x6
    80005994:	e9050513          	addi	a0,a0,-368 # 8000b820 <tickslock>
    80005998:	01010113          	addi	sp,sp,16
    8000599c:	00001317          	auipc	t1,0x1
    800059a0:	5cc30067          	jr	1484(t1) # 80006f68 <initlock>

00000000800059a4 <trapinithart>:
    800059a4:	ff010113          	addi	sp,sp,-16
    800059a8:	00813423          	sd	s0,8(sp)
    800059ac:	01010413          	addi	s0,sp,16
    800059b0:	00000797          	auipc	a5,0x0
    800059b4:	30078793          	addi	a5,a5,768 # 80005cb0 <kernelvec>
    800059b8:	10579073          	csrw	stvec,a5
    800059bc:	00813403          	ld	s0,8(sp)
    800059c0:	01010113          	addi	sp,sp,16
    800059c4:	00008067          	ret

00000000800059c8 <usertrap>:
    800059c8:	ff010113          	addi	sp,sp,-16
    800059cc:	00813423          	sd	s0,8(sp)
    800059d0:	01010413          	addi	s0,sp,16
    800059d4:	00813403          	ld	s0,8(sp)
    800059d8:	01010113          	addi	sp,sp,16
    800059dc:	00008067          	ret

00000000800059e0 <usertrapret>:
    800059e0:	ff010113          	addi	sp,sp,-16
    800059e4:	00813423          	sd	s0,8(sp)
    800059e8:	01010413          	addi	s0,sp,16
    800059ec:	00813403          	ld	s0,8(sp)
    800059f0:	01010113          	addi	sp,sp,16
    800059f4:	00008067          	ret

00000000800059f8 <kerneltrap>:
    800059f8:	fe010113          	addi	sp,sp,-32
    800059fc:	00813823          	sd	s0,16(sp)
    80005a00:	00113c23          	sd	ra,24(sp)
    80005a04:	00913423          	sd	s1,8(sp)
    80005a08:	02010413          	addi	s0,sp,32
    80005a0c:	142025f3          	csrr	a1,scause
    80005a10:	100027f3          	csrr	a5,sstatus
    80005a14:	0027f793          	andi	a5,a5,2
    80005a18:	10079c63          	bnez	a5,80005b30 <kerneltrap+0x138>
    80005a1c:	142027f3          	csrr	a5,scause
    80005a20:	0207ce63          	bltz	a5,80005a5c <kerneltrap+0x64>
    80005a24:	00003517          	auipc	a0,0x3
    80005a28:	81c50513          	addi	a0,a0,-2020 # 80008240 <_ZN3stm4coutE+0x188>
    80005a2c:	00001097          	auipc	ra,0x1
    80005a30:	88c080e7          	jalr	-1908(ra) # 800062b8 <__printf>
    80005a34:	141025f3          	csrr	a1,sepc
    80005a38:	14302673          	csrr	a2,stval
    80005a3c:	00003517          	auipc	a0,0x3
    80005a40:	81450513          	addi	a0,a0,-2028 # 80008250 <_ZN3stm4coutE+0x198>
    80005a44:	00001097          	auipc	ra,0x1
    80005a48:	874080e7          	jalr	-1932(ra) # 800062b8 <__printf>
    80005a4c:	00003517          	auipc	a0,0x3
    80005a50:	81c50513          	addi	a0,a0,-2020 # 80008268 <_ZN3stm4coutE+0x1b0>
    80005a54:	00001097          	auipc	ra,0x1
    80005a58:	808080e7          	jalr	-2040(ra) # 8000625c <panic>
    80005a5c:	0ff7f713          	andi	a4,a5,255
    80005a60:	00900693          	li	a3,9
    80005a64:	04d70063          	beq	a4,a3,80005aa4 <kerneltrap+0xac>
    80005a68:	fff00713          	li	a4,-1
    80005a6c:	03f71713          	slli	a4,a4,0x3f
    80005a70:	00170713          	addi	a4,a4,1
    80005a74:	fae798e3          	bne	a5,a4,80005a24 <kerneltrap+0x2c>
    80005a78:	00000097          	auipc	ra,0x0
    80005a7c:	e00080e7          	jalr	-512(ra) # 80005878 <cpuid>
    80005a80:	06050663          	beqz	a0,80005aec <kerneltrap+0xf4>
    80005a84:	144027f3          	csrr	a5,sip
    80005a88:	ffd7f793          	andi	a5,a5,-3
    80005a8c:	14479073          	csrw	sip,a5
    80005a90:	01813083          	ld	ra,24(sp)
    80005a94:	01013403          	ld	s0,16(sp)
    80005a98:	00813483          	ld	s1,8(sp)
    80005a9c:	02010113          	addi	sp,sp,32
    80005aa0:	00008067          	ret
    80005aa4:	00000097          	auipc	ra,0x0
    80005aa8:	3d0080e7          	jalr	976(ra) # 80005e74 <plic_claim>
    80005aac:	00a00793          	li	a5,10
    80005ab0:	00050493          	mv	s1,a0
    80005ab4:	06f50863          	beq	a0,a5,80005b24 <kerneltrap+0x12c>
    80005ab8:	fc050ce3          	beqz	a0,80005a90 <kerneltrap+0x98>
    80005abc:	00050593          	mv	a1,a0
    80005ac0:	00002517          	auipc	a0,0x2
    80005ac4:	76050513          	addi	a0,a0,1888 # 80008220 <_ZN3stm4coutE+0x168>
    80005ac8:	00000097          	auipc	ra,0x0
    80005acc:	7f0080e7          	jalr	2032(ra) # 800062b8 <__printf>
    80005ad0:	01013403          	ld	s0,16(sp)
    80005ad4:	01813083          	ld	ra,24(sp)
    80005ad8:	00048513          	mv	a0,s1
    80005adc:	00813483          	ld	s1,8(sp)
    80005ae0:	02010113          	addi	sp,sp,32
    80005ae4:	00000317          	auipc	t1,0x0
    80005ae8:	3c830067          	jr	968(t1) # 80005eac <plic_complete>
    80005aec:	00006517          	auipc	a0,0x6
    80005af0:	d3450513          	addi	a0,a0,-716 # 8000b820 <tickslock>
    80005af4:	00001097          	auipc	ra,0x1
    80005af8:	498080e7          	jalr	1176(ra) # 80006f8c <acquire>
    80005afc:	00005717          	auipc	a4,0x5
    80005b00:	b7870713          	addi	a4,a4,-1160 # 8000a674 <ticks>
    80005b04:	00072783          	lw	a5,0(a4)
    80005b08:	00006517          	auipc	a0,0x6
    80005b0c:	d1850513          	addi	a0,a0,-744 # 8000b820 <tickslock>
    80005b10:	0017879b          	addiw	a5,a5,1
    80005b14:	00f72023          	sw	a5,0(a4)
    80005b18:	00001097          	auipc	ra,0x1
    80005b1c:	540080e7          	jalr	1344(ra) # 80007058 <release>
    80005b20:	f65ff06f          	j	80005a84 <kerneltrap+0x8c>
    80005b24:	00001097          	auipc	ra,0x1
    80005b28:	09c080e7          	jalr	156(ra) # 80006bc0 <uartintr>
    80005b2c:	fa5ff06f          	j	80005ad0 <kerneltrap+0xd8>
    80005b30:	00002517          	auipc	a0,0x2
    80005b34:	6d050513          	addi	a0,a0,1744 # 80008200 <_ZN3stm4coutE+0x148>
    80005b38:	00000097          	auipc	ra,0x0
    80005b3c:	724080e7          	jalr	1828(ra) # 8000625c <panic>

0000000080005b40 <clockintr>:
    80005b40:	fe010113          	addi	sp,sp,-32
    80005b44:	00813823          	sd	s0,16(sp)
    80005b48:	00913423          	sd	s1,8(sp)
    80005b4c:	00113c23          	sd	ra,24(sp)
    80005b50:	02010413          	addi	s0,sp,32
    80005b54:	00006497          	auipc	s1,0x6
    80005b58:	ccc48493          	addi	s1,s1,-820 # 8000b820 <tickslock>
    80005b5c:	00048513          	mv	a0,s1
    80005b60:	00001097          	auipc	ra,0x1
    80005b64:	42c080e7          	jalr	1068(ra) # 80006f8c <acquire>
    80005b68:	00005717          	auipc	a4,0x5
    80005b6c:	b0c70713          	addi	a4,a4,-1268 # 8000a674 <ticks>
    80005b70:	00072783          	lw	a5,0(a4)
    80005b74:	01013403          	ld	s0,16(sp)
    80005b78:	01813083          	ld	ra,24(sp)
    80005b7c:	00048513          	mv	a0,s1
    80005b80:	0017879b          	addiw	a5,a5,1
    80005b84:	00813483          	ld	s1,8(sp)
    80005b88:	00f72023          	sw	a5,0(a4)
    80005b8c:	02010113          	addi	sp,sp,32
    80005b90:	00001317          	auipc	t1,0x1
    80005b94:	4c830067          	jr	1224(t1) # 80007058 <release>

0000000080005b98 <devintr>:
    80005b98:	142027f3          	csrr	a5,scause
    80005b9c:	00000513          	li	a0,0
    80005ba0:	0007c463          	bltz	a5,80005ba8 <devintr+0x10>
    80005ba4:	00008067          	ret
    80005ba8:	fe010113          	addi	sp,sp,-32
    80005bac:	00813823          	sd	s0,16(sp)
    80005bb0:	00113c23          	sd	ra,24(sp)
    80005bb4:	00913423          	sd	s1,8(sp)
    80005bb8:	02010413          	addi	s0,sp,32
    80005bbc:	0ff7f713          	andi	a4,a5,255
    80005bc0:	00900693          	li	a3,9
    80005bc4:	04d70c63          	beq	a4,a3,80005c1c <devintr+0x84>
    80005bc8:	fff00713          	li	a4,-1
    80005bcc:	03f71713          	slli	a4,a4,0x3f
    80005bd0:	00170713          	addi	a4,a4,1
    80005bd4:	00e78c63          	beq	a5,a4,80005bec <devintr+0x54>
    80005bd8:	01813083          	ld	ra,24(sp)
    80005bdc:	01013403          	ld	s0,16(sp)
    80005be0:	00813483          	ld	s1,8(sp)
    80005be4:	02010113          	addi	sp,sp,32
    80005be8:	00008067          	ret
    80005bec:	00000097          	auipc	ra,0x0
    80005bf0:	c8c080e7          	jalr	-884(ra) # 80005878 <cpuid>
    80005bf4:	06050663          	beqz	a0,80005c60 <devintr+0xc8>
    80005bf8:	144027f3          	csrr	a5,sip
    80005bfc:	ffd7f793          	andi	a5,a5,-3
    80005c00:	14479073          	csrw	sip,a5
    80005c04:	01813083          	ld	ra,24(sp)
    80005c08:	01013403          	ld	s0,16(sp)
    80005c0c:	00813483          	ld	s1,8(sp)
    80005c10:	00200513          	li	a0,2
    80005c14:	02010113          	addi	sp,sp,32
    80005c18:	00008067          	ret
    80005c1c:	00000097          	auipc	ra,0x0
    80005c20:	258080e7          	jalr	600(ra) # 80005e74 <plic_claim>
    80005c24:	00a00793          	li	a5,10
    80005c28:	00050493          	mv	s1,a0
    80005c2c:	06f50663          	beq	a0,a5,80005c98 <devintr+0x100>
    80005c30:	00100513          	li	a0,1
    80005c34:	fa0482e3          	beqz	s1,80005bd8 <devintr+0x40>
    80005c38:	00048593          	mv	a1,s1
    80005c3c:	00002517          	auipc	a0,0x2
    80005c40:	5e450513          	addi	a0,a0,1508 # 80008220 <_ZN3stm4coutE+0x168>
    80005c44:	00000097          	auipc	ra,0x0
    80005c48:	674080e7          	jalr	1652(ra) # 800062b8 <__printf>
    80005c4c:	00048513          	mv	a0,s1
    80005c50:	00000097          	auipc	ra,0x0
    80005c54:	25c080e7          	jalr	604(ra) # 80005eac <plic_complete>
    80005c58:	00100513          	li	a0,1
    80005c5c:	f7dff06f          	j	80005bd8 <devintr+0x40>
    80005c60:	00006517          	auipc	a0,0x6
    80005c64:	bc050513          	addi	a0,a0,-1088 # 8000b820 <tickslock>
    80005c68:	00001097          	auipc	ra,0x1
    80005c6c:	324080e7          	jalr	804(ra) # 80006f8c <acquire>
    80005c70:	00005717          	auipc	a4,0x5
    80005c74:	a0470713          	addi	a4,a4,-1532 # 8000a674 <ticks>
    80005c78:	00072783          	lw	a5,0(a4)
    80005c7c:	00006517          	auipc	a0,0x6
    80005c80:	ba450513          	addi	a0,a0,-1116 # 8000b820 <tickslock>
    80005c84:	0017879b          	addiw	a5,a5,1
    80005c88:	00f72023          	sw	a5,0(a4)
    80005c8c:	00001097          	auipc	ra,0x1
    80005c90:	3cc080e7          	jalr	972(ra) # 80007058 <release>
    80005c94:	f65ff06f          	j	80005bf8 <devintr+0x60>
    80005c98:	00001097          	auipc	ra,0x1
    80005c9c:	f28080e7          	jalr	-216(ra) # 80006bc0 <uartintr>
    80005ca0:	fadff06f          	j	80005c4c <devintr+0xb4>
	...

0000000080005cb0 <kernelvec>:
    80005cb0:	f0010113          	addi	sp,sp,-256
    80005cb4:	00113023          	sd	ra,0(sp)
    80005cb8:	00213423          	sd	sp,8(sp)
    80005cbc:	00313823          	sd	gp,16(sp)
    80005cc0:	00413c23          	sd	tp,24(sp)
    80005cc4:	02513023          	sd	t0,32(sp)
    80005cc8:	02613423          	sd	t1,40(sp)
    80005ccc:	02713823          	sd	t2,48(sp)
    80005cd0:	02813c23          	sd	s0,56(sp)
    80005cd4:	04913023          	sd	s1,64(sp)
    80005cd8:	04a13423          	sd	a0,72(sp)
    80005cdc:	04b13823          	sd	a1,80(sp)
    80005ce0:	04c13c23          	sd	a2,88(sp)
    80005ce4:	06d13023          	sd	a3,96(sp)
    80005ce8:	06e13423          	sd	a4,104(sp)
    80005cec:	06f13823          	sd	a5,112(sp)
    80005cf0:	07013c23          	sd	a6,120(sp)
    80005cf4:	09113023          	sd	a7,128(sp)
    80005cf8:	09213423          	sd	s2,136(sp)
    80005cfc:	09313823          	sd	s3,144(sp)
    80005d00:	09413c23          	sd	s4,152(sp)
    80005d04:	0b513023          	sd	s5,160(sp)
    80005d08:	0b613423          	sd	s6,168(sp)
    80005d0c:	0b713823          	sd	s7,176(sp)
    80005d10:	0b813c23          	sd	s8,184(sp)
    80005d14:	0d913023          	sd	s9,192(sp)
    80005d18:	0da13423          	sd	s10,200(sp)
    80005d1c:	0db13823          	sd	s11,208(sp)
    80005d20:	0dc13c23          	sd	t3,216(sp)
    80005d24:	0fd13023          	sd	t4,224(sp)
    80005d28:	0fe13423          	sd	t5,232(sp)
    80005d2c:	0ff13823          	sd	t6,240(sp)
    80005d30:	cc9ff0ef          	jal	ra,800059f8 <kerneltrap>
    80005d34:	00013083          	ld	ra,0(sp)
    80005d38:	00813103          	ld	sp,8(sp)
    80005d3c:	01013183          	ld	gp,16(sp)
    80005d40:	02013283          	ld	t0,32(sp)
    80005d44:	02813303          	ld	t1,40(sp)
    80005d48:	03013383          	ld	t2,48(sp)
    80005d4c:	03813403          	ld	s0,56(sp)
    80005d50:	04013483          	ld	s1,64(sp)
    80005d54:	04813503          	ld	a0,72(sp)
    80005d58:	05013583          	ld	a1,80(sp)
    80005d5c:	05813603          	ld	a2,88(sp)
    80005d60:	06013683          	ld	a3,96(sp)
    80005d64:	06813703          	ld	a4,104(sp)
    80005d68:	07013783          	ld	a5,112(sp)
    80005d6c:	07813803          	ld	a6,120(sp)
    80005d70:	08013883          	ld	a7,128(sp)
    80005d74:	08813903          	ld	s2,136(sp)
    80005d78:	09013983          	ld	s3,144(sp)
    80005d7c:	09813a03          	ld	s4,152(sp)
    80005d80:	0a013a83          	ld	s5,160(sp)
    80005d84:	0a813b03          	ld	s6,168(sp)
    80005d88:	0b013b83          	ld	s7,176(sp)
    80005d8c:	0b813c03          	ld	s8,184(sp)
    80005d90:	0c013c83          	ld	s9,192(sp)
    80005d94:	0c813d03          	ld	s10,200(sp)
    80005d98:	0d013d83          	ld	s11,208(sp)
    80005d9c:	0d813e03          	ld	t3,216(sp)
    80005da0:	0e013e83          	ld	t4,224(sp)
    80005da4:	0e813f03          	ld	t5,232(sp)
    80005da8:	0f013f83          	ld	t6,240(sp)
    80005dac:	10010113          	addi	sp,sp,256
    80005db0:	10200073          	sret
    80005db4:	00000013          	nop
    80005db8:	00000013          	nop
    80005dbc:	00000013          	nop

0000000080005dc0 <timervec>:
    80005dc0:	34051573          	csrrw	a0,mscratch,a0
    80005dc4:	00b53023          	sd	a1,0(a0)
    80005dc8:	00c53423          	sd	a2,8(a0)
    80005dcc:	00d53823          	sd	a3,16(a0)
    80005dd0:	01853583          	ld	a1,24(a0)
    80005dd4:	02053603          	ld	a2,32(a0)
    80005dd8:	0005b683          	ld	a3,0(a1)
    80005ddc:	00c686b3          	add	a3,a3,a2
    80005de0:	00d5b023          	sd	a3,0(a1)
    80005de4:	00200593          	li	a1,2
    80005de8:	14459073          	csrw	sip,a1
    80005dec:	01053683          	ld	a3,16(a0)
    80005df0:	00853603          	ld	a2,8(a0)
    80005df4:	00053583          	ld	a1,0(a0)
    80005df8:	34051573          	csrrw	a0,mscratch,a0
    80005dfc:	30200073          	mret

0000000080005e00 <plicinit>:
    80005e00:	ff010113          	addi	sp,sp,-16
    80005e04:	00813423          	sd	s0,8(sp)
    80005e08:	01010413          	addi	s0,sp,16
    80005e0c:	00813403          	ld	s0,8(sp)
    80005e10:	0c0007b7          	lui	a5,0xc000
    80005e14:	00100713          	li	a4,1
    80005e18:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80005e1c:	00e7a223          	sw	a4,4(a5)
    80005e20:	01010113          	addi	sp,sp,16
    80005e24:	00008067          	ret

0000000080005e28 <plicinithart>:
    80005e28:	ff010113          	addi	sp,sp,-16
    80005e2c:	00813023          	sd	s0,0(sp)
    80005e30:	00113423          	sd	ra,8(sp)
    80005e34:	01010413          	addi	s0,sp,16
    80005e38:	00000097          	auipc	ra,0x0
    80005e3c:	a40080e7          	jalr	-1472(ra) # 80005878 <cpuid>
    80005e40:	0085171b          	slliw	a4,a0,0x8
    80005e44:	0c0027b7          	lui	a5,0xc002
    80005e48:	00e787b3          	add	a5,a5,a4
    80005e4c:	40200713          	li	a4,1026
    80005e50:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005e54:	00813083          	ld	ra,8(sp)
    80005e58:	00013403          	ld	s0,0(sp)
    80005e5c:	00d5151b          	slliw	a0,a0,0xd
    80005e60:	0c2017b7          	lui	a5,0xc201
    80005e64:	00a78533          	add	a0,a5,a0
    80005e68:	00052023          	sw	zero,0(a0)
    80005e6c:	01010113          	addi	sp,sp,16
    80005e70:	00008067          	ret

0000000080005e74 <plic_claim>:
    80005e74:	ff010113          	addi	sp,sp,-16
    80005e78:	00813023          	sd	s0,0(sp)
    80005e7c:	00113423          	sd	ra,8(sp)
    80005e80:	01010413          	addi	s0,sp,16
    80005e84:	00000097          	auipc	ra,0x0
    80005e88:	9f4080e7          	jalr	-1548(ra) # 80005878 <cpuid>
    80005e8c:	00813083          	ld	ra,8(sp)
    80005e90:	00013403          	ld	s0,0(sp)
    80005e94:	00d5151b          	slliw	a0,a0,0xd
    80005e98:	0c2017b7          	lui	a5,0xc201
    80005e9c:	00a78533          	add	a0,a5,a0
    80005ea0:	00452503          	lw	a0,4(a0)
    80005ea4:	01010113          	addi	sp,sp,16
    80005ea8:	00008067          	ret

0000000080005eac <plic_complete>:
    80005eac:	fe010113          	addi	sp,sp,-32
    80005eb0:	00813823          	sd	s0,16(sp)
    80005eb4:	00913423          	sd	s1,8(sp)
    80005eb8:	00113c23          	sd	ra,24(sp)
    80005ebc:	02010413          	addi	s0,sp,32
    80005ec0:	00050493          	mv	s1,a0
    80005ec4:	00000097          	auipc	ra,0x0
    80005ec8:	9b4080e7          	jalr	-1612(ra) # 80005878 <cpuid>
    80005ecc:	01813083          	ld	ra,24(sp)
    80005ed0:	01013403          	ld	s0,16(sp)
    80005ed4:	00d5179b          	slliw	a5,a0,0xd
    80005ed8:	0c201737          	lui	a4,0xc201
    80005edc:	00f707b3          	add	a5,a4,a5
    80005ee0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005ee4:	00813483          	ld	s1,8(sp)
    80005ee8:	02010113          	addi	sp,sp,32
    80005eec:	00008067          	ret

0000000080005ef0 <consolewrite>:
    80005ef0:	fb010113          	addi	sp,sp,-80
    80005ef4:	04813023          	sd	s0,64(sp)
    80005ef8:	04113423          	sd	ra,72(sp)
    80005efc:	02913c23          	sd	s1,56(sp)
    80005f00:	03213823          	sd	s2,48(sp)
    80005f04:	03313423          	sd	s3,40(sp)
    80005f08:	03413023          	sd	s4,32(sp)
    80005f0c:	01513c23          	sd	s5,24(sp)
    80005f10:	05010413          	addi	s0,sp,80
    80005f14:	06c05c63          	blez	a2,80005f8c <consolewrite+0x9c>
    80005f18:	00060993          	mv	s3,a2
    80005f1c:	00050a13          	mv	s4,a0
    80005f20:	00058493          	mv	s1,a1
    80005f24:	00000913          	li	s2,0
    80005f28:	fff00a93          	li	s5,-1
    80005f2c:	01c0006f          	j	80005f48 <consolewrite+0x58>
    80005f30:	fbf44503          	lbu	a0,-65(s0)
    80005f34:	0019091b          	addiw	s2,s2,1
    80005f38:	00148493          	addi	s1,s1,1
    80005f3c:	00001097          	auipc	ra,0x1
    80005f40:	a9c080e7          	jalr	-1380(ra) # 800069d8 <uartputc>
    80005f44:	03298063          	beq	s3,s2,80005f64 <consolewrite+0x74>
    80005f48:	00048613          	mv	a2,s1
    80005f4c:	00100693          	li	a3,1
    80005f50:	000a0593          	mv	a1,s4
    80005f54:	fbf40513          	addi	a0,s0,-65
    80005f58:	00000097          	auipc	ra,0x0
    80005f5c:	9d8080e7          	jalr	-1576(ra) # 80005930 <either_copyin>
    80005f60:	fd5518e3          	bne	a0,s5,80005f30 <consolewrite+0x40>
    80005f64:	04813083          	ld	ra,72(sp)
    80005f68:	04013403          	ld	s0,64(sp)
    80005f6c:	03813483          	ld	s1,56(sp)
    80005f70:	02813983          	ld	s3,40(sp)
    80005f74:	02013a03          	ld	s4,32(sp)
    80005f78:	01813a83          	ld	s5,24(sp)
    80005f7c:	00090513          	mv	a0,s2
    80005f80:	03013903          	ld	s2,48(sp)
    80005f84:	05010113          	addi	sp,sp,80
    80005f88:	00008067          	ret
    80005f8c:	00000913          	li	s2,0
    80005f90:	fd5ff06f          	j	80005f64 <consolewrite+0x74>

0000000080005f94 <consoleread>:
    80005f94:	f9010113          	addi	sp,sp,-112
    80005f98:	06813023          	sd	s0,96(sp)
    80005f9c:	04913c23          	sd	s1,88(sp)
    80005fa0:	05213823          	sd	s2,80(sp)
    80005fa4:	05313423          	sd	s3,72(sp)
    80005fa8:	05413023          	sd	s4,64(sp)
    80005fac:	03513c23          	sd	s5,56(sp)
    80005fb0:	03613823          	sd	s6,48(sp)
    80005fb4:	03713423          	sd	s7,40(sp)
    80005fb8:	03813023          	sd	s8,32(sp)
    80005fbc:	06113423          	sd	ra,104(sp)
    80005fc0:	01913c23          	sd	s9,24(sp)
    80005fc4:	07010413          	addi	s0,sp,112
    80005fc8:	00060b93          	mv	s7,a2
    80005fcc:	00050913          	mv	s2,a0
    80005fd0:	00058c13          	mv	s8,a1
    80005fd4:	00060b1b          	sext.w	s6,a2
    80005fd8:	00006497          	auipc	s1,0x6
    80005fdc:	87048493          	addi	s1,s1,-1936 # 8000b848 <cons>
    80005fe0:	00400993          	li	s3,4
    80005fe4:	fff00a13          	li	s4,-1
    80005fe8:	00a00a93          	li	s5,10
    80005fec:	05705e63          	blez	s7,80006048 <consoleread+0xb4>
    80005ff0:	09c4a703          	lw	a4,156(s1)
    80005ff4:	0984a783          	lw	a5,152(s1)
    80005ff8:	0007071b          	sext.w	a4,a4
    80005ffc:	08e78463          	beq	a5,a4,80006084 <consoleread+0xf0>
    80006000:	07f7f713          	andi	a4,a5,127
    80006004:	00e48733          	add	a4,s1,a4
    80006008:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000600c:	0017869b          	addiw	a3,a5,1
    80006010:	08d4ac23          	sw	a3,152(s1)
    80006014:	00070c9b          	sext.w	s9,a4
    80006018:	0b370663          	beq	a4,s3,800060c4 <consoleread+0x130>
    8000601c:	00100693          	li	a3,1
    80006020:	f9f40613          	addi	a2,s0,-97
    80006024:	000c0593          	mv	a1,s8
    80006028:	00090513          	mv	a0,s2
    8000602c:	f8e40fa3          	sb	a4,-97(s0)
    80006030:	00000097          	auipc	ra,0x0
    80006034:	8b4080e7          	jalr	-1868(ra) # 800058e4 <either_copyout>
    80006038:	01450863          	beq	a0,s4,80006048 <consoleread+0xb4>
    8000603c:	001c0c13          	addi	s8,s8,1
    80006040:	fffb8b9b          	addiw	s7,s7,-1
    80006044:	fb5c94e3          	bne	s9,s5,80005fec <consoleread+0x58>
    80006048:	000b851b          	sext.w	a0,s7
    8000604c:	06813083          	ld	ra,104(sp)
    80006050:	06013403          	ld	s0,96(sp)
    80006054:	05813483          	ld	s1,88(sp)
    80006058:	05013903          	ld	s2,80(sp)
    8000605c:	04813983          	ld	s3,72(sp)
    80006060:	04013a03          	ld	s4,64(sp)
    80006064:	03813a83          	ld	s5,56(sp)
    80006068:	02813b83          	ld	s7,40(sp)
    8000606c:	02013c03          	ld	s8,32(sp)
    80006070:	01813c83          	ld	s9,24(sp)
    80006074:	40ab053b          	subw	a0,s6,a0
    80006078:	03013b03          	ld	s6,48(sp)
    8000607c:	07010113          	addi	sp,sp,112
    80006080:	00008067          	ret
    80006084:	00001097          	auipc	ra,0x1
    80006088:	1d8080e7          	jalr	472(ra) # 8000725c <push_on>
    8000608c:	0984a703          	lw	a4,152(s1)
    80006090:	09c4a783          	lw	a5,156(s1)
    80006094:	0007879b          	sext.w	a5,a5
    80006098:	fef70ce3          	beq	a4,a5,80006090 <consoleread+0xfc>
    8000609c:	00001097          	auipc	ra,0x1
    800060a0:	234080e7          	jalr	564(ra) # 800072d0 <pop_on>
    800060a4:	0984a783          	lw	a5,152(s1)
    800060a8:	07f7f713          	andi	a4,a5,127
    800060ac:	00e48733          	add	a4,s1,a4
    800060b0:	01874703          	lbu	a4,24(a4)
    800060b4:	0017869b          	addiw	a3,a5,1
    800060b8:	08d4ac23          	sw	a3,152(s1)
    800060bc:	00070c9b          	sext.w	s9,a4
    800060c0:	f5371ee3          	bne	a4,s3,8000601c <consoleread+0x88>
    800060c4:	000b851b          	sext.w	a0,s7
    800060c8:	f96bf2e3          	bgeu	s7,s6,8000604c <consoleread+0xb8>
    800060cc:	08f4ac23          	sw	a5,152(s1)
    800060d0:	f7dff06f          	j	8000604c <consoleread+0xb8>

00000000800060d4 <consputc>:
    800060d4:	10000793          	li	a5,256
    800060d8:	00f50663          	beq	a0,a5,800060e4 <consputc+0x10>
    800060dc:	00001317          	auipc	t1,0x1
    800060e0:	9f430067          	jr	-1548(t1) # 80006ad0 <uartputc_sync>
    800060e4:	ff010113          	addi	sp,sp,-16
    800060e8:	00113423          	sd	ra,8(sp)
    800060ec:	00813023          	sd	s0,0(sp)
    800060f0:	01010413          	addi	s0,sp,16
    800060f4:	00800513          	li	a0,8
    800060f8:	00001097          	auipc	ra,0x1
    800060fc:	9d8080e7          	jalr	-1576(ra) # 80006ad0 <uartputc_sync>
    80006100:	02000513          	li	a0,32
    80006104:	00001097          	auipc	ra,0x1
    80006108:	9cc080e7          	jalr	-1588(ra) # 80006ad0 <uartputc_sync>
    8000610c:	00013403          	ld	s0,0(sp)
    80006110:	00813083          	ld	ra,8(sp)
    80006114:	00800513          	li	a0,8
    80006118:	01010113          	addi	sp,sp,16
    8000611c:	00001317          	auipc	t1,0x1
    80006120:	9b430067          	jr	-1612(t1) # 80006ad0 <uartputc_sync>

0000000080006124 <consoleintr>:
    80006124:	fe010113          	addi	sp,sp,-32
    80006128:	00813823          	sd	s0,16(sp)
    8000612c:	00913423          	sd	s1,8(sp)
    80006130:	01213023          	sd	s2,0(sp)
    80006134:	00113c23          	sd	ra,24(sp)
    80006138:	02010413          	addi	s0,sp,32
    8000613c:	00005917          	auipc	s2,0x5
    80006140:	70c90913          	addi	s2,s2,1804 # 8000b848 <cons>
    80006144:	00050493          	mv	s1,a0
    80006148:	00090513          	mv	a0,s2
    8000614c:	00001097          	auipc	ra,0x1
    80006150:	e40080e7          	jalr	-448(ra) # 80006f8c <acquire>
    80006154:	02048c63          	beqz	s1,8000618c <consoleintr+0x68>
    80006158:	0a092783          	lw	a5,160(s2)
    8000615c:	09892703          	lw	a4,152(s2)
    80006160:	07f00693          	li	a3,127
    80006164:	40e7873b          	subw	a4,a5,a4
    80006168:	02e6e263          	bltu	a3,a4,8000618c <consoleintr+0x68>
    8000616c:	00d00713          	li	a4,13
    80006170:	04e48063          	beq	s1,a4,800061b0 <consoleintr+0x8c>
    80006174:	07f7f713          	andi	a4,a5,127
    80006178:	00e90733          	add	a4,s2,a4
    8000617c:	0017879b          	addiw	a5,a5,1
    80006180:	0af92023          	sw	a5,160(s2)
    80006184:	00970c23          	sb	s1,24(a4)
    80006188:	08f92e23          	sw	a5,156(s2)
    8000618c:	01013403          	ld	s0,16(sp)
    80006190:	01813083          	ld	ra,24(sp)
    80006194:	00813483          	ld	s1,8(sp)
    80006198:	00013903          	ld	s2,0(sp)
    8000619c:	00005517          	auipc	a0,0x5
    800061a0:	6ac50513          	addi	a0,a0,1708 # 8000b848 <cons>
    800061a4:	02010113          	addi	sp,sp,32
    800061a8:	00001317          	auipc	t1,0x1
    800061ac:	eb030067          	jr	-336(t1) # 80007058 <release>
    800061b0:	00a00493          	li	s1,10
    800061b4:	fc1ff06f          	j	80006174 <consoleintr+0x50>

00000000800061b8 <consoleinit>:
    800061b8:	fe010113          	addi	sp,sp,-32
    800061bc:	00113c23          	sd	ra,24(sp)
    800061c0:	00813823          	sd	s0,16(sp)
    800061c4:	00913423          	sd	s1,8(sp)
    800061c8:	02010413          	addi	s0,sp,32
    800061cc:	00005497          	auipc	s1,0x5
    800061d0:	67c48493          	addi	s1,s1,1660 # 8000b848 <cons>
    800061d4:	00048513          	mv	a0,s1
    800061d8:	00002597          	auipc	a1,0x2
    800061dc:	0a058593          	addi	a1,a1,160 # 80008278 <_ZN3stm4coutE+0x1c0>
    800061e0:	00001097          	auipc	ra,0x1
    800061e4:	d88080e7          	jalr	-632(ra) # 80006f68 <initlock>
    800061e8:	00000097          	auipc	ra,0x0
    800061ec:	7ac080e7          	jalr	1964(ra) # 80006994 <uartinit>
    800061f0:	01813083          	ld	ra,24(sp)
    800061f4:	01013403          	ld	s0,16(sp)
    800061f8:	00000797          	auipc	a5,0x0
    800061fc:	d9c78793          	addi	a5,a5,-612 # 80005f94 <consoleread>
    80006200:	0af4bc23          	sd	a5,184(s1)
    80006204:	00000797          	auipc	a5,0x0
    80006208:	cec78793          	addi	a5,a5,-788 # 80005ef0 <consolewrite>
    8000620c:	0cf4b023          	sd	a5,192(s1)
    80006210:	00813483          	ld	s1,8(sp)
    80006214:	02010113          	addi	sp,sp,32
    80006218:	00008067          	ret

000000008000621c <console_read>:
    8000621c:	ff010113          	addi	sp,sp,-16
    80006220:	00813423          	sd	s0,8(sp)
    80006224:	01010413          	addi	s0,sp,16
    80006228:	00813403          	ld	s0,8(sp)
    8000622c:	00005317          	auipc	t1,0x5
    80006230:	6d433303          	ld	t1,1748(t1) # 8000b900 <devsw+0x10>
    80006234:	01010113          	addi	sp,sp,16
    80006238:	00030067          	jr	t1

000000008000623c <console_write>:
    8000623c:	ff010113          	addi	sp,sp,-16
    80006240:	00813423          	sd	s0,8(sp)
    80006244:	01010413          	addi	s0,sp,16
    80006248:	00813403          	ld	s0,8(sp)
    8000624c:	00005317          	auipc	t1,0x5
    80006250:	6bc33303          	ld	t1,1724(t1) # 8000b908 <devsw+0x18>
    80006254:	01010113          	addi	sp,sp,16
    80006258:	00030067          	jr	t1

000000008000625c <panic>:
    8000625c:	fe010113          	addi	sp,sp,-32
    80006260:	00113c23          	sd	ra,24(sp)
    80006264:	00813823          	sd	s0,16(sp)
    80006268:	00913423          	sd	s1,8(sp)
    8000626c:	02010413          	addi	s0,sp,32
    80006270:	00050493          	mv	s1,a0
    80006274:	00002517          	auipc	a0,0x2
    80006278:	00c50513          	addi	a0,a0,12 # 80008280 <_ZN3stm4coutE+0x1c8>
    8000627c:	00005797          	auipc	a5,0x5
    80006280:	7207a623          	sw	zero,1836(a5) # 8000b9a8 <pr+0x18>
    80006284:	00000097          	auipc	ra,0x0
    80006288:	034080e7          	jalr	52(ra) # 800062b8 <__printf>
    8000628c:	00048513          	mv	a0,s1
    80006290:	00000097          	auipc	ra,0x0
    80006294:	028080e7          	jalr	40(ra) # 800062b8 <__printf>
    80006298:	00002517          	auipc	a0,0x2
    8000629c:	fc850513          	addi	a0,a0,-56 # 80008260 <_ZN3stm4coutE+0x1a8>
    800062a0:	00000097          	auipc	ra,0x0
    800062a4:	018080e7          	jalr	24(ra) # 800062b8 <__printf>
    800062a8:	00100793          	li	a5,1
    800062ac:	00004717          	auipc	a4,0x4
    800062b0:	3cf72623          	sw	a5,972(a4) # 8000a678 <panicked>
    800062b4:	0000006f          	j	800062b4 <panic+0x58>

00000000800062b8 <__printf>:
    800062b8:	f3010113          	addi	sp,sp,-208
    800062bc:	08813023          	sd	s0,128(sp)
    800062c0:	07313423          	sd	s3,104(sp)
    800062c4:	09010413          	addi	s0,sp,144
    800062c8:	05813023          	sd	s8,64(sp)
    800062cc:	08113423          	sd	ra,136(sp)
    800062d0:	06913c23          	sd	s1,120(sp)
    800062d4:	07213823          	sd	s2,112(sp)
    800062d8:	07413023          	sd	s4,96(sp)
    800062dc:	05513c23          	sd	s5,88(sp)
    800062e0:	05613823          	sd	s6,80(sp)
    800062e4:	05713423          	sd	s7,72(sp)
    800062e8:	03913c23          	sd	s9,56(sp)
    800062ec:	03a13823          	sd	s10,48(sp)
    800062f0:	03b13423          	sd	s11,40(sp)
    800062f4:	00005317          	auipc	t1,0x5
    800062f8:	69c30313          	addi	t1,t1,1692 # 8000b990 <pr>
    800062fc:	01832c03          	lw	s8,24(t1)
    80006300:	00b43423          	sd	a1,8(s0)
    80006304:	00c43823          	sd	a2,16(s0)
    80006308:	00d43c23          	sd	a3,24(s0)
    8000630c:	02e43023          	sd	a4,32(s0)
    80006310:	02f43423          	sd	a5,40(s0)
    80006314:	03043823          	sd	a6,48(s0)
    80006318:	03143c23          	sd	a7,56(s0)
    8000631c:	00050993          	mv	s3,a0
    80006320:	4a0c1663          	bnez	s8,800067cc <__printf+0x514>
    80006324:	60098c63          	beqz	s3,8000693c <__printf+0x684>
    80006328:	0009c503          	lbu	a0,0(s3)
    8000632c:	00840793          	addi	a5,s0,8
    80006330:	f6f43c23          	sd	a5,-136(s0)
    80006334:	00000493          	li	s1,0
    80006338:	22050063          	beqz	a0,80006558 <__printf+0x2a0>
    8000633c:	00002a37          	lui	s4,0x2
    80006340:	00018ab7          	lui	s5,0x18
    80006344:	000f4b37          	lui	s6,0xf4
    80006348:	00989bb7          	lui	s7,0x989
    8000634c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80006350:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80006354:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80006358:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000635c:	00148c9b          	addiw	s9,s1,1
    80006360:	02500793          	li	a5,37
    80006364:	01998933          	add	s2,s3,s9
    80006368:	38f51263          	bne	a0,a5,800066ec <__printf+0x434>
    8000636c:	00094783          	lbu	a5,0(s2)
    80006370:	00078c9b          	sext.w	s9,a5
    80006374:	1e078263          	beqz	a5,80006558 <__printf+0x2a0>
    80006378:	0024849b          	addiw	s1,s1,2
    8000637c:	07000713          	li	a4,112
    80006380:	00998933          	add	s2,s3,s1
    80006384:	38e78a63          	beq	a5,a4,80006718 <__printf+0x460>
    80006388:	20f76863          	bltu	a4,a5,80006598 <__printf+0x2e0>
    8000638c:	42a78863          	beq	a5,a0,800067bc <__printf+0x504>
    80006390:	06400713          	li	a4,100
    80006394:	40e79663          	bne	a5,a4,800067a0 <__printf+0x4e8>
    80006398:	f7843783          	ld	a5,-136(s0)
    8000639c:	0007a603          	lw	a2,0(a5)
    800063a0:	00878793          	addi	a5,a5,8
    800063a4:	f6f43c23          	sd	a5,-136(s0)
    800063a8:	42064a63          	bltz	a2,800067dc <__printf+0x524>
    800063ac:	00a00713          	li	a4,10
    800063b0:	02e677bb          	remuw	a5,a2,a4
    800063b4:	00002d97          	auipc	s11,0x2
    800063b8:	ef4d8d93          	addi	s11,s11,-268 # 800082a8 <digits>
    800063bc:	00900593          	li	a1,9
    800063c0:	0006051b          	sext.w	a0,a2
    800063c4:	00000c93          	li	s9,0
    800063c8:	02079793          	slli	a5,a5,0x20
    800063cc:	0207d793          	srli	a5,a5,0x20
    800063d0:	00fd87b3          	add	a5,s11,a5
    800063d4:	0007c783          	lbu	a5,0(a5)
    800063d8:	02e656bb          	divuw	a3,a2,a4
    800063dc:	f8f40023          	sb	a5,-128(s0)
    800063e0:	14c5d863          	bge	a1,a2,80006530 <__printf+0x278>
    800063e4:	06300593          	li	a1,99
    800063e8:	00100c93          	li	s9,1
    800063ec:	02e6f7bb          	remuw	a5,a3,a4
    800063f0:	02079793          	slli	a5,a5,0x20
    800063f4:	0207d793          	srli	a5,a5,0x20
    800063f8:	00fd87b3          	add	a5,s11,a5
    800063fc:	0007c783          	lbu	a5,0(a5)
    80006400:	02e6d73b          	divuw	a4,a3,a4
    80006404:	f8f400a3          	sb	a5,-127(s0)
    80006408:	12a5f463          	bgeu	a1,a0,80006530 <__printf+0x278>
    8000640c:	00a00693          	li	a3,10
    80006410:	00900593          	li	a1,9
    80006414:	02d777bb          	remuw	a5,a4,a3
    80006418:	02079793          	slli	a5,a5,0x20
    8000641c:	0207d793          	srli	a5,a5,0x20
    80006420:	00fd87b3          	add	a5,s11,a5
    80006424:	0007c503          	lbu	a0,0(a5)
    80006428:	02d757bb          	divuw	a5,a4,a3
    8000642c:	f8a40123          	sb	a0,-126(s0)
    80006430:	48e5f263          	bgeu	a1,a4,800068b4 <__printf+0x5fc>
    80006434:	06300513          	li	a0,99
    80006438:	02d7f5bb          	remuw	a1,a5,a3
    8000643c:	02059593          	slli	a1,a1,0x20
    80006440:	0205d593          	srli	a1,a1,0x20
    80006444:	00bd85b3          	add	a1,s11,a1
    80006448:	0005c583          	lbu	a1,0(a1)
    8000644c:	02d7d7bb          	divuw	a5,a5,a3
    80006450:	f8b401a3          	sb	a1,-125(s0)
    80006454:	48e57263          	bgeu	a0,a4,800068d8 <__printf+0x620>
    80006458:	3e700513          	li	a0,999
    8000645c:	02d7f5bb          	remuw	a1,a5,a3
    80006460:	02059593          	slli	a1,a1,0x20
    80006464:	0205d593          	srli	a1,a1,0x20
    80006468:	00bd85b3          	add	a1,s11,a1
    8000646c:	0005c583          	lbu	a1,0(a1)
    80006470:	02d7d7bb          	divuw	a5,a5,a3
    80006474:	f8b40223          	sb	a1,-124(s0)
    80006478:	46e57663          	bgeu	a0,a4,800068e4 <__printf+0x62c>
    8000647c:	02d7f5bb          	remuw	a1,a5,a3
    80006480:	02059593          	slli	a1,a1,0x20
    80006484:	0205d593          	srli	a1,a1,0x20
    80006488:	00bd85b3          	add	a1,s11,a1
    8000648c:	0005c583          	lbu	a1,0(a1)
    80006490:	02d7d7bb          	divuw	a5,a5,a3
    80006494:	f8b402a3          	sb	a1,-123(s0)
    80006498:	46ea7863          	bgeu	s4,a4,80006908 <__printf+0x650>
    8000649c:	02d7f5bb          	remuw	a1,a5,a3
    800064a0:	02059593          	slli	a1,a1,0x20
    800064a4:	0205d593          	srli	a1,a1,0x20
    800064a8:	00bd85b3          	add	a1,s11,a1
    800064ac:	0005c583          	lbu	a1,0(a1)
    800064b0:	02d7d7bb          	divuw	a5,a5,a3
    800064b4:	f8b40323          	sb	a1,-122(s0)
    800064b8:	3eeaf863          	bgeu	s5,a4,800068a8 <__printf+0x5f0>
    800064bc:	02d7f5bb          	remuw	a1,a5,a3
    800064c0:	02059593          	slli	a1,a1,0x20
    800064c4:	0205d593          	srli	a1,a1,0x20
    800064c8:	00bd85b3          	add	a1,s11,a1
    800064cc:	0005c583          	lbu	a1,0(a1)
    800064d0:	02d7d7bb          	divuw	a5,a5,a3
    800064d4:	f8b403a3          	sb	a1,-121(s0)
    800064d8:	42eb7e63          	bgeu	s6,a4,80006914 <__printf+0x65c>
    800064dc:	02d7f5bb          	remuw	a1,a5,a3
    800064e0:	02059593          	slli	a1,a1,0x20
    800064e4:	0205d593          	srli	a1,a1,0x20
    800064e8:	00bd85b3          	add	a1,s11,a1
    800064ec:	0005c583          	lbu	a1,0(a1)
    800064f0:	02d7d7bb          	divuw	a5,a5,a3
    800064f4:	f8b40423          	sb	a1,-120(s0)
    800064f8:	42ebfc63          	bgeu	s7,a4,80006930 <__printf+0x678>
    800064fc:	02079793          	slli	a5,a5,0x20
    80006500:	0207d793          	srli	a5,a5,0x20
    80006504:	00fd8db3          	add	s11,s11,a5
    80006508:	000dc703          	lbu	a4,0(s11)
    8000650c:	00a00793          	li	a5,10
    80006510:	00900c93          	li	s9,9
    80006514:	f8e404a3          	sb	a4,-119(s0)
    80006518:	00065c63          	bgez	a2,80006530 <__printf+0x278>
    8000651c:	f9040713          	addi	a4,s0,-112
    80006520:	00f70733          	add	a4,a4,a5
    80006524:	02d00693          	li	a3,45
    80006528:	fed70823          	sb	a3,-16(a4)
    8000652c:	00078c93          	mv	s9,a5
    80006530:	f8040793          	addi	a5,s0,-128
    80006534:	01978cb3          	add	s9,a5,s9
    80006538:	f7f40d13          	addi	s10,s0,-129
    8000653c:	000cc503          	lbu	a0,0(s9)
    80006540:	fffc8c93          	addi	s9,s9,-1
    80006544:	00000097          	auipc	ra,0x0
    80006548:	b90080e7          	jalr	-1136(ra) # 800060d4 <consputc>
    8000654c:	ffac98e3          	bne	s9,s10,8000653c <__printf+0x284>
    80006550:	00094503          	lbu	a0,0(s2)
    80006554:	e00514e3          	bnez	a0,8000635c <__printf+0xa4>
    80006558:	1a0c1663          	bnez	s8,80006704 <__printf+0x44c>
    8000655c:	08813083          	ld	ra,136(sp)
    80006560:	08013403          	ld	s0,128(sp)
    80006564:	07813483          	ld	s1,120(sp)
    80006568:	07013903          	ld	s2,112(sp)
    8000656c:	06813983          	ld	s3,104(sp)
    80006570:	06013a03          	ld	s4,96(sp)
    80006574:	05813a83          	ld	s5,88(sp)
    80006578:	05013b03          	ld	s6,80(sp)
    8000657c:	04813b83          	ld	s7,72(sp)
    80006580:	04013c03          	ld	s8,64(sp)
    80006584:	03813c83          	ld	s9,56(sp)
    80006588:	03013d03          	ld	s10,48(sp)
    8000658c:	02813d83          	ld	s11,40(sp)
    80006590:	0d010113          	addi	sp,sp,208
    80006594:	00008067          	ret
    80006598:	07300713          	li	a4,115
    8000659c:	1ce78a63          	beq	a5,a4,80006770 <__printf+0x4b8>
    800065a0:	07800713          	li	a4,120
    800065a4:	1ee79e63          	bne	a5,a4,800067a0 <__printf+0x4e8>
    800065a8:	f7843783          	ld	a5,-136(s0)
    800065ac:	0007a703          	lw	a4,0(a5)
    800065b0:	00878793          	addi	a5,a5,8
    800065b4:	f6f43c23          	sd	a5,-136(s0)
    800065b8:	28074263          	bltz	a4,8000683c <__printf+0x584>
    800065bc:	00002d97          	auipc	s11,0x2
    800065c0:	cecd8d93          	addi	s11,s11,-788 # 800082a8 <digits>
    800065c4:	00f77793          	andi	a5,a4,15
    800065c8:	00fd87b3          	add	a5,s11,a5
    800065cc:	0007c683          	lbu	a3,0(a5)
    800065d0:	00f00613          	li	a2,15
    800065d4:	0007079b          	sext.w	a5,a4
    800065d8:	f8d40023          	sb	a3,-128(s0)
    800065dc:	0047559b          	srliw	a1,a4,0x4
    800065e0:	0047569b          	srliw	a3,a4,0x4
    800065e4:	00000c93          	li	s9,0
    800065e8:	0ee65063          	bge	a2,a4,800066c8 <__printf+0x410>
    800065ec:	00f6f693          	andi	a3,a3,15
    800065f0:	00dd86b3          	add	a3,s11,a3
    800065f4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800065f8:	0087d79b          	srliw	a5,a5,0x8
    800065fc:	00100c93          	li	s9,1
    80006600:	f8d400a3          	sb	a3,-127(s0)
    80006604:	0cb67263          	bgeu	a2,a1,800066c8 <__printf+0x410>
    80006608:	00f7f693          	andi	a3,a5,15
    8000660c:	00dd86b3          	add	a3,s11,a3
    80006610:	0006c583          	lbu	a1,0(a3)
    80006614:	00f00613          	li	a2,15
    80006618:	0047d69b          	srliw	a3,a5,0x4
    8000661c:	f8b40123          	sb	a1,-126(s0)
    80006620:	0047d593          	srli	a1,a5,0x4
    80006624:	28f67e63          	bgeu	a2,a5,800068c0 <__printf+0x608>
    80006628:	00f6f693          	andi	a3,a3,15
    8000662c:	00dd86b3          	add	a3,s11,a3
    80006630:	0006c503          	lbu	a0,0(a3)
    80006634:	0087d813          	srli	a6,a5,0x8
    80006638:	0087d69b          	srliw	a3,a5,0x8
    8000663c:	f8a401a3          	sb	a0,-125(s0)
    80006640:	28b67663          	bgeu	a2,a1,800068cc <__printf+0x614>
    80006644:	00f6f693          	andi	a3,a3,15
    80006648:	00dd86b3          	add	a3,s11,a3
    8000664c:	0006c583          	lbu	a1,0(a3)
    80006650:	00c7d513          	srli	a0,a5,0xc
    80006654:	00c7d69b          	srliw	a3,a5,0xc
    80006658:	f8b40223          	sb	a1,-124(s0)
    8000665c:	29067a63          	bgeu	a2,a6,800068f0 <__printf+0x638>
    80006660:	00f6f693          	andi	a3,a3,15
    80006664:	00dd86b3          	add	a3,s11,a3
    80006668:	0006c583          	lbu	a1,0(a3)
    8000666c:	0107d813          	srli	a6,a5,0x10
    80006670:	0107d69b          	srliw	a3,a5,0x10
    80006674:	f8b402a3          	sb	a1,-123(s0)
    80006678:	28a67263          	bgeu	a2,a0,800068fc <__printf+0x644>
    8000667c:	00f6f693          	andi	a3,a3,15
    80006680:	00dd86b3          	add	a3,s11,a3
    80006684:	0006c683          	lbu	a3,0(a3)
    80006688:	0147d79b          	srliw	a5,a5,0x14
    8000668c:	f8d40323          	sb	a3,-122(s0)
    80006690:	21067663          	bgeu	a2,a6,8000689c <__printf+0x5e4>
    80006694:	02079793          	slli	a5,a5,0x20
    80006698:	0207d793          	srli	a5,a5,0x20
    8000669c:	00fd8db3          	add	s11,s11,a5
    800066a0:	000dc683          	lbu	a3,0(s11)
    800066a4:	00800793          	li	a5,8
    800066a8:	00700c93          	li	s9,7
    800066ac:	f8d403a3          	sb	a3,-121(s0)
    800066b0:	00075c63          	bgez	a4,800066c8 <__printf+0x410>
    800066b4:	f9040713          	addi	a4,s0,-112
    800066b8:	00f70733          	add	a4,a4,a5
    800066bc:	02d00693          	li	a3,45
    800066c0:	fed70823          	sb	a3,-16(a4)
    800066c4:	00078c93          	mv	s9,a5
    800066c8:	f8040793          	addi	a5,s0,-128
    800066cc:	01978cb3          	add	s9,a5,s9
    800066d0:	f7f40d13          	addi	s10,s0,-129
    800066d4:	000cc503          	lbu	a0,0(s9)
    800066d8:	fffc8c93          	addi	s9,s9,-1
    800066dc:	00000097          	auipc	ra,0x0
    800066e0:	9f8080e7          	jalr	-1544(ra) # 800060d4 <consputc>
    800066e4:	ff9d18e3          	bne	s10,s9,800066d4 <__printf+0x41c>
    800066e8:	0100006f          	j	800066f8 <__printf+0x440>
    800066ec:	00000097          	auipc	ra,0x0
    800066f0:	9e8080e7          	jalr	-1560(ra) # 800060d4 <consputc>
    800066f4:	000c8493          	mv	s1,s9
    800066f8:	00094503          	lbu	a0,0(s2)
    800066fc:	c60510e3          	bnez	a0,8000635c <__printf+0xa4>
    80006700:	e40c0ee3          	beqz	s8,8000655c <__printf+0x2a4>
    80006704:	00005517          	auipc	a0,0x5
    80006708:	28c50513          	addi	a0,a0,652 # 8000b990 <pr>
    8000670c:	00001097          	auipc	ra,0x1
    80006710:	94c080e7          	jalr	-1716(ra) # 80007058 <release>
    80006714:	e49ff06f          	j	8000655c <__printf+0x2a4>
    80006718:	f7843783          	ld	a5,-136(s0)
    8000671c:	03000513          	li	a0,48
    80006720:	01000d13          	li	s10,16
    80006724:	00878713          	addi	a4,a5,8
    80006728:	0007bc83          	ld	s9,0(a5)
    8000672c:	f6e43c23          	sd	a4,-136(s0)
    80006730:	00000097          	auipc	ra,0x0
    80006734:	9a4080e7          	jalr	-1628(ra) # 800060d4 <consputc>
    80006738:	07800513          	li	a0,120
    8000673c:	00000097          	auipc	ra,0x0
    80006740:	998080e7          	jalr	-1640(ra) # 800060d4 <consputc>
    80006744:	00002d97          	auipc	s11,0x2
    80006748:	b64d8d93          	addi	s11,s11,-1180 # 800082a8 <digits>
    8000674c:	03ccd793          	srli	a5,s9,0x3c
    80006750:	00fd87b3          	add	a5,s11,a5
    80006754:	0007c503          	lbu	a0,0(a5)
    80006758:	fffd0d1b          	addiw	s10,s10,-1
    8000675c:	004c9c93          	slli	s9,s9,0x4
    80006760:	00000097          	auipc	ra,0x0
    80006764:	974080e7          	jalr	-1676(ra) # 800060d4 <consputc>
    80006768:	fe0d12e3          	bnez	s10,8000674c <__printf+0x494>
    8000676c:	f8dff06f          	j	800066f8 <__printf+0x440>
    80006770:	f7843783          	ld	a5,-136(s0)
    80006774:	0007bc83          	ld	s9,0(a5)
    80006778:	00878793          	addi	a5,a5,8
    8000677c:	f6f43c23          	sd	a5,-136(s0)
    80006780:	000c9a63          	bnez	s9,80006794 <__printf+0x4dc>
    80006784:	1080006f          	j	8000688c <__printf+0x5d4>
    80006788:	001c8c93          	addi	s9,s9,1
    8000678c:	00000097          	auipc	ra,0x0
    80006790:	948080e7          	jalr	-1720(ra) # 800060d4 <consputc>
    80006794:	000cc503          	lbu	a0,0(s9)
    80006798:	fe0518e3          	bnez	a0,80006788 <__printf+0x4d0>
    8000679c:	f5dff06f          	j	800066f8 <__printf+0x440>
    800067a0:	02500513          	li	a0,37
    800067a4:	00000097          	auipc	ra,0x0
    800067a8:	930080e7          	jalr	-1744(ra) # 800060d4 <consputc>
    800067ac:	000c8513          	mv	a0,s9
    800067b0:	00000097          	auipc	ra,0x0
    800067b4:	924080e7          	jalr	-1756(ra) # 800060d4 <consputc>
    800067b8:	f41ff06f          	j	800066f8 <__printf+0x440>
    800067bc:	02500513          	li	a0,37
    800067c0:	00000097          	auipc	ra,0x0
    800067c4:	914080e7          	jalr	-1772(ra) # 800060d4 <consputc>
    800067c8:	f31ff06f          	j	800066f8 <__printf+0x440>
    800067cc:	00030513          	mv	a0,t1
    800067d0:	00000097          	auipc	ra,0x0
    800067d4:	7bc080e7          	jalr	1980(ra) # 80006f8c <acquire>
    800067d8:	b4dff06f          	j	80006324 <__printf+0x6c>
    800067dc:	40c0053b          	negw	a0,a2
    800067e0:	00a00713          	li	a4,10
    800067e4:	02e576bb          	remuw	a3,a0,a4
    800067e8:	00002d97          	auipc	s11,0x2
    800067ec:	ac0d8d93          	addi	s11,s11,-1344 # 800082a8 <digits>
    800067f0:	ff700593          	li	a1,-9
    800067f4:	02069693          	slli	a3,a3,0x20
    800067f8:	0206d693          	srli	a3,a3,0x20
    800067fc:	00dd86b3          	add	a3,s11,a3
    80006800:	0006c683          	lbu	a3,0(a3)
    80006804:	02e557bb          	divuw	a5,a0,a4
    80006808:	f8d40023          	sb	a3,-128(s0)
    8000680c:	10b65e63          	bge	a2,a1,80006928 <__printf+0x670>
    80006810:	06300593          	li	a1,99
    80006814:	02e7f6bb          	remuw	a3,a5,a4
    80006818:	02069693          	slli	a3,a3,0x20
    8000681c:	0206d693          	srli	a3,a3,0x20
    80006820:	00dd86b3          	add	a3,s11,a3
    80006824:	0006c683          	lbu	a3,0(a3)
    80006828:	02e7d73b          	divuw	a4,a5,a4
    8000682c:	00200793          	li	a5,2
    80006830:	f8d400a3          	sb	a3,-127(s0)
    80006834:	bca5ece3          	bltu	a1,a0,8000640c <__printf+0x154>
    80006838:	ce5ff06f          	j	8000651c <__printf+0x264>
    8000683c:	40e007bb          	negw	a5,a4
    80006840:	00002d97          	auipc	s11,0x2
    80006844:	a68d8d93          	addi	s11,s11,-1432 # 800082a8 <digits>
    80006848:	00f7f693          	andi	a3,a5,15
    8000684c:	00dd86b3          	add	a3,s11,a3
    80006850:	0006c583          	lbu	a1,0(a3)
    80006854:	ff100613          	li	a2,-15
    80006858:	0047d69b          	srliw	a3,a5,0x4
    8000685c:	f8b40023          	sb	a1,-128(s0)
    80006860:	0047d59b          	srliw	a1,a5,0x4
    80006864:	0ac75e63          	bge	a4,a2,80006920 <__printf+0x668>
    80006868:	00f6f693          	andi	a3,a3,15
    8000686c:	00dd86b3          	add	a3,s11,a3
    80006870:	0006c603          	lbu	a2,0(a3)
    80006874:	00f00693          	li	a3,15
    80006878:	0087d79b          	srliw	a5,a5,0x8
    8000687c:	f8c400a3          	sb	a2,-127(s0)
    80006880:	d8b6e4e3          	bltu	a3,a1,80006608 <__printf+0x350>
    80006884:	00200793          	li	a5,2
    80006888:	e2dff06f          	j	800066b4 <__printf+0x3fc>
    8000688c:	00002c97          	auipc	s9,0x2
    80006890:	9fcc8c93          	addi	s9,s9,-1540 # 80008288 <_ZN3stm4coutE+0x1d0>
    80006894:	02800513          	li	a0,40
    80006898:	ef1ff06f          	j	80006788 <__printf+0x4d0>
    8000689c:	00700793          	li	a5,7
    800068a0:	00600c93          	li	s9,6
    800068a4:	e0dff06f          	j	800066b0 <__printf+0x3f8>
    800068a8:	00700793          	li	a5,7
    800068ac:	00600c93          	li	s9,6
    800068b0:	c69ff06f          	j	80006518 <__printf+0x260>
    800068b4:	00300793          	li	a5,3
    800068b8:	00200c93          	li	s9,2
    800068bc:	c5dff06f          	j	80006518 <__printf+0x260>
    800068c0:	00300793          	li	a5,3
    800068c4:	00200c93          	li	s9,2
    800068c8:	de9ff06f          	j	800066b0 <__printf+0x3f8>
    800068cc:	00400793          	li	a5,4
    800068d0:	00300c93          	li	s9,3
    800068d4:	dddff06f          	j	800066b0 <__printf+0x3f8>
    800068d8:	00400793          	li	a5,4
    800068dc:	00300c93          	li	s9,3
    800068e0:	c39ff06f          	j	80006518 <__printf+0x260>
    800068e4:	00500793          	li	a5,5
    800068e8:	00400c93          	li	s9,4
    800068ec:	c2dff06f          	j	80006518 <__printf+0x260>
    800068f0:	00500793          	li	a5,5
    800068f4:	00400c93          	li	s9,4
    800068f8:	db9ff06f          	j	800066b0 <__printf+0x3f8>
    800068fc:	00600793          	li	a5,6
    80006900:	00500c93          	li	s9,5
    80006904:	dadff06f          	j	800066b0 <__printf+0x3f8>
    80006908:	00600793          	li	a5,6
    8000690c:	00500c93          	li	s9,5
    80006910:	c09ff06f          	j	80006518 <__printf+0x260>
    80006914:	00800793          	li	a5,8
    80006918:	00700c93          	li	s9,7
    8000691c:	bfdff06f          	j	80006518 <__printf+0x260>
    80006920:	00100793          	li	a5,1
    80006924:	d91ff06f          	j	800066b4 <__printf+0x3fc>
    80006928:	00100793          	li	a5,1
    8000692c:	bf1ff06f          	j	8000651c <__printf+0x264>
    80006930:	00900793          	li	a5,9
    80006934:	00800c93          	li	s9,8
    80006938:	be1ff06f          	j	80006518 <__printf+0x260>
    8000693c:	00002517          	auipc	a0,0x2
    80006940:	95450513          	addi	a0,a0,-1708 # 80008290 <_ZN3stm4coutE+0x1d8>
    80006944:	00000097          	auipc	ra,0x0
    80006948:	918080e7          	jalr	-1768(ra) # 8000625c <panic>

000000008000694c <printfinit>:
    8000694c:	fe010113          	addi	sp,sp,-32
    80006950:	00813823          	sd	s0,16(sp)
    80006954:	00913423          	sd	s1,8(sp)
    80006958:	00113c23          	sd	ra,24(sp)
    8000695c:	02010413          	addi	s0,sp,32
    80006960:	00005497          	auipc	s1,0x5
    80006964:	03048493          	addi	s1,s1,48 # 8000b990 <pr>
    80006968:	00048513          	mv	a0,s1
    8000696c:	00002597          	auipc	a1,0x2
    80006970:	93458593          	addi	a1,a1,-1740 # 800082a0 <_ZN3stm4coutE+0x1e8>
    80006974:	00000097          	auipc	ra,0x0
    80006978:	5f4080e7          	jalr	1524(ra) # 80006f68 <initlock>
    8000697c:	01813083          	ld	ra,24(sp)
    80006980:	01013403          	ld	s0,16(sp)
    80006984:	0004ac23          	sw	zero,24(s1)
    80006988:	00813483          	ld	s1,8(sp)
    8000698c:	02010113          	addi	sp,sp,32
    80006990:	00008067          	ret

0000000080006994 <uartinit>:
    80006994:	ff010113          	addi	sp,sp,-16
    80006998:	00813423          	sd	s0,8(sp)
    8000699c:	01010413          	addi	s0,sp,16
    800069a0:	100007b7          	lui	a5,0x10000
    800069a4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800069a8:	f8000713          	li	a4,-128
    800069ac:	00e781a3          	sb	a4,3(a5)
    800069b0:	00300713          	li	a4,3
    800069b4:	00e78023          	sb	a4,0(a5)
    800069b8:	000780a3          	sb	zero,1(a5)
    800069bc:	00e781a3          	sb	a4,3(a5)
    800069c0:	00700693          	li	a3,7
    800069c4:	00d78123          	sb	a3,2(a5)
    800069c8:	00e780a3          	sb	a4,1(a5)
    800069cc:	00813403          	ld	s0,8(sp)
    800069d0:	01010113          	addi	sp,sp,16
    800069d4:	00008067          	ret

00000000800069d8 <uartputc>:
    800069d8:	00004797          	auipc	a5,0x4
    800069dc:	ca07a783          	lw	a5,-864(a5) # 8000a678 <panicked>
    800069e0:	00078463          	beqz	a5,800069e8 <uartputc+0x10>
    800069e4:	0000006f          	j	800069e4 <uartputc+0xc>
    800069e8:	fd010113          	addi	sp,sp,-48
    800069ec:	02813023          	sd	s0,32(sp)
    800069f0:	00913c23          	sd	s1,24(sp)
    800069f4:	01213823          	sd	s2,16(sp)
    800069f8:	01313423          	sd	s3,8(sp)
    800069fc:	02113423          	sd	ra,40(sp)
    80006a00:	03010413          	addi	s0,sp,48
    80006a04:	00004917          	auipc	s2,0x4
    80006a08:	c7c90913          	addi	s2,s2,-900 # 8000a680 <uart_tx_r>
    80006a0c:	00093783          	ld	a5,0(s2)
    80006a10:	00004497          	auipc	s1,0x4
    80006a14:	c7848493          	addi	s1,s1,-904 # 8000a688 <uart_tx_w>
    80006a18:	0004b703          	ld	a4,0(s1)
    80006a1c:	02078693          	addi	a3,a5,32
    80006a20:	00050993          	mv	s3,a0
    80006a24:	02e69c63          	bne	a3,a4,80006a5c <uartputc+0x84>
    80006a28:	00001097          	auipc	ra,0x1
    80006a2c:	834080e7          	jalr	-1996(ra) # 8000725c <push_on>
    80006a30:	00093783          	ld	a5,0(s2)
    80006a34:	0004b703          	ld	a4,0(s1)
    80006a38:	02078793          	addi	a5,a5,32
    80006a3c:	00e79463          	bne	a5,a4,80006a44 <uartputc+0x6c>
    80006a40:	0000006f          	j	80006a40 <uartputc+0x68>
    80006a44:	00001097          	auipc	ra,0x1
    80006a48:	88c080e7          	jalr	-1908(ra) # 800072d0 <pop_on>
    80006a4c:	00093783          	ld	a5,0(s2)
    80006a50:	0004b703          	ld	a4,0(s1)
    80006a54:	02078693          	addi	a3,a5,32
    80006a58:	fce688e3          	beq	a3,a4,80006a28 <uartputc+0x50>
    80006a5c:	01f77693          	andi	a3,a4,31
    80006a60:	00005597          	auipc	a1,0x5
    80006a64:	f5058593          	addi	a1,a1,-176 # 8000b9b0 <uart_tx_buf>
    80006a68:	00d586b3          	add	a3,a1,a3
    80006a6c:	00170713          	addi	a4,a4,1
    80006a70:	01368023          	sb	s3,0(a3)
    80006a74:	00e4b023          	sd	a4,0(s1)
    80006a78:	10000637          	lui	a2,0x10000
    80006a7c:	02f71063          	bne	a4,a5,80006a9c <uartputc+0xc4>
    80006a80:	0340006f          	j	80006ab4 <uartputc+0xdc>
    80006a84:	00074703          	lbu	a4,0(a4)
    80006a88:	00f93023          	sd	a5,0(s2)
    80006a8c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006a90:	00093783          	ld	a5,0(s2)
    80006a94:	0004b703          	ld	a4,0(s1)
    80006a98:	00f70e63          	beq	a4,a5,80006ab4 <uartputc+0xdc>
    80006a9c:	00564683          	lbu	a3,5(a2)
    80006aa0:	01f7f713          	andi	a4,a5,31
    80006aa4:	00e58733          	add	a4,a1,a4
    80006aa8:	0206f693          	andi	a3,a3,32
    80006aac:	00178793          	addi	a5,a5,1
    80006ab0:	fc069ae3          	bnez	a3,80006a84 <uartputc+0xac>
    80006ab4:	02813083          	ld	ra,40(sp)
    80006ab8:	02013403          	ld	s0,32(sp)
    80006abc:	01813483          	ld	s1,24(sp)
    80006ac0:	01013903          	ld	s2,16(sp)
    80006ac4:	00813983          	ld	s3,8(sp)
    80006ac8:	03010113          	addi	sp,sp,48
    80006acc:	00008067          	ret

0000000080006ad0 <uartputc_sync>:
    80006ad0:	ff010113          	addi	sp,sp,-16
    80006ad4:	00813423          	sd	s0,8(sp)
    80006ad8:	01010413          	addi	s0,sp,16
    80006adc:	00004717          	auipc	a4,0x4
    80006ae0:	b9c72703          	lw	a4,-1124(a4) # 8000a678 <panicked>
    80006ae4:	02071663          	bnez	a4,80006b10 <uartputc_sync+0x40>
    80006ae8:	00050793          	mv	a5,a0
    80006aec:	100006b7          	lui	a3,0x10000
    80006af0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006af4:	02077713          	andi	a4,a4,32
    80006af8:	fe070ce3          	beqz	a4,80006af0 <uartputc_sync+0x20>
    80006afc:	0ff7f793          	andi	a5,a5,255
    80006b00:	00f68023          	sb	a5,0(a3)
    80006b04:	00813403          	ld	s0,8(sp)
    80006b08:	01010113          	addi	sp,sp,16
    80006b0c:	00008067          	ret
    80006b10:	0000006f          	j	80006b10 <uartputc_sync+0x40>

0000000080006b14 <uartstart>:
    80006b14:	ff010113          	addi	sp,sp,-16
    80006b18:	00813423          	sd	s0,8(sp)
    80006b1c:	01010413          	addi	s0,sp,16
    80006b20:	00004617          	auipc	a2,0x4
    80006b24:	b6060613          	addi	a2,a2,-1184 # 8000a680 <uart_tx_r>
    80006b28:	00004517          	auipc	a0,0x4
    80006b2c:	b6050513          	addi	a0,a0,-1184 # 8000a688 <uart_tx_w>
    80006b30:	00063783          	ld	a5,0(a2)
    80006b34:	00053703          	ld	a4,0(a0)
    80006b38:	04f70263          	beq	a4,a5,80006b7c <uartstart+0x68>
    80006b3c:	100005b7          	lui	a1,0x10000
    80006b40:	00005817          	auipc	a6,0x5
    80006b44:	e7080813          	addi	a6,a6,-400 # 8000b9b0 <uart_tx_buf>
    80006b48:	01c0006f          	j	80006b64 <uartstart+0x50>
    80006b4c:	0006c703          	lbu	a4,0(a3)
    80006b50:	00f63023          	sd	a5,0(a2)
    80006b54:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006b58:	00063783          	ld	a5,0(a2)
    80006b5c:	00053703          	ld	a4,0(a0)
    80006b60:	00f70e63          	beq	a4,a5,80006b7c <uartstart+0x68>
    80006b64:	01f7f713          	andi	a4,a5,31
    80006b68:	00e806b3          	add	a3,a6,a4
    80006b6c:	0055c703          	lbu	a4,5(a1)
    80006b70:	00178793          	addi	a5,a5,1
    80006b74:	02077713          	andi	a4,a4,32
    80006b78:	fc071ae3          	bnez	a4,80006b4c <uartstart+0x38>
    80006b7c:	00813403          	ld	s0,8(sp)
    80006b80:	01010113          	addi	sp,sp,16
    80006b84:	00008067          	ret

0000000080006b88 <uartgetc>:
    80006b88:	ff010113          	addi	sp,sp,-16
    80006b8c:	00813423          	sd	s0,8(sp)
    80006b90:	01010413          	addi	s0,sp,16
    80006b94:	10000737          	lui	a4,0x10000
    80006b98:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80006b9c:	0017f793          	andi	a5,a5,1
    80006ba0:	00078c63          	beqz	a5,80006bb8 <uartgetc+0x30>
    80006ba4:	00074503          	lbu	a0,0(a4)
    80006ba8:	0ff57513          	andi	a0,a0,255
    80006bac:	00813403          	ld	s0,8(sp)
    80006bb0:	01010113          	addi	sp,sp,16
    80006bb4:	00008067          	ret
    80006bb8:	fff00513          	li	a0,-1
    80006bbc:	ff1ff06f          	j	80006bac <uartgetc+0x24>

0000000080006bc0 <uartintr>:
    80006bc0:	100007b7          	lui	a5,0x10000
    80006bc4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006bc8:	0017f793          	andi	a5,a5,1
    80006bcc:	0a078463          	beqz	a5,80006c74 <uartintr+0xb4>
    80006bd0:	fe010113          	addi	sp,sp,-32
    80006bd4:	00813823          	sd	s0,16(sp)
    80006bd8:	00913423          	sd	s1,8(sp)
    80006bdc:	00113c23          	sd	ra,24(sp)
    80006be0:	02010413          	addi	s0,sp,32
    80006be4:	100004b7          	lui	s1,0x10000
    80006be8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80006bec:	0ff57513          	andi	a0,a0,255
    80006bf0:	fffff097          	auipc	ra,0xfffff
    80006bf4:	534080e7          	jalr	1332(ra) # 80006124 <consoleintr>
    80006bf8:	0054c783          	lbu	a5,5(s1)
    80006bfc:	0017f793          	andi	a5,a5,1
    80006c00:	fe0794e3          	bnez	a5,80006be8 <uartintr+0x28>
    80006c04:	00004617          	auipc	a2,0x4
    80006c08:	a7c60613          	addi	a2,a2,-1412 # 8000a680 <uart_tx_r>
    80006c0c:	00004517          	auipc	a0,0x4
    80006c10:	a7c50513          	addi	a0,a0,-1412 # 8000a688 <uart_tx_w>
    80006c14:	00063783          	ld	a5,0(a2)
    80006c18:	00053703          	ld	a4,0(a0)
    80006c1c:	04f70263          	beq	a4,a5,80006c60 <uartintr+0xa0>
    80006c20:	100005b7          	lui	a1,0x10000
    80006c24:	00005817          	auipc	a6,0x5
    80006c28:	d8c80813          	addi	a6,a6,-628 # 8000b9b0 <uart_tx_buf>
    80006c2c:	01c0006f          	j	80006c48 <uartintr+0x88>
    80006c30:	0006c703          	lbu	a4,0(a3)
    80006c34:	00f63023          	sd	a5,0(a2)
    80006c38:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006c3c:	00063783          	ld	a5,0(a2)
    80006c40:	00053703          	ld	a4,0(a0)
    80006c44:	00f70e63          	beq	a4,a5,80006c60 <uartintr+0xa0>
    80006c48:	01f7f713          	andi	a4,a5,31
    80006c4c:	00e806b3          	add	a3,a6,a4
    80006c50:	0055c703          	lbu	a4,5(a1)
    80006c54:	00178793          	addi	a5,a5,1
    80006c58:	02077713          	andi	a4,a4,32
    80006c5c:	fc071ae3          	bnez	a4,80006c30 <uartintr+0x70>
    80006c60:	01813083          	ld	ra,24(sp)
    80006c64:	01013403          	ld	s0,16(sp)
    80006c68:	00813483          	ld	s1,8(sp)
    80006c6c:	02010113          	addi	sp,sp,32
    80006c70:	00008067          	ret
    80006c74:	00004617          	auipc	a2,0x4
    80006c78:	a0c60613          	addi	a2,a2,-1524 # 8000a680 <uart_tx_r>
    80006c7c:	00004517          	auipc	a0,0x4
    80006c80:	a0c50513          	addi	a0,a0,-1524 # 8000a688 <uart_tx_w>
    80006c84:	00063783          	ld	a5,0(a2)
    80006c88:	00053703          	ld	a4,0(a0)
    80006c8c:	04f70263          	beq	a4,a5,80006cd0 <uartintr+0x110>
    80006c90:	100005b7          	lui	a1,0x10000
    80006c94:	00005817          	auipc	a6,0x5
    80006c98:	d1c80813          	addi	a6,a6,-740 # 8000b9b0 <uart_tx_buf>
    80006c9c:	01c0006f          	j	80006cb8 <uartintr+0xf8>
    80006ca0:	0006c703          	lbu	a4,0(a3)
    80006ca4:	00f63023          	sd	a5,0(a2)
    80006ca8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006cac:	00063783          	ld	a5,0(a2)
    80006cb0:	00053703          	ld	a4,0(a0)
    80006cb4:	02f70063          	beq	a4,a5,80006cd4 <uartintr+0x114>
    80006cb8:	01f7f713          	andi	a4,a5,31
    80006cbc:	00e806b3          	add	a3,a6,a4
    80006cc0:	0055c703          	lbu	a4,5(a1)
    80006cc4:	00178793          	addi	a5,a5,1
    80006cc8:	02077713          	andi	a4,a4,32
    80006ccc:	fc071ae3          	bnez	a4,80006ca0 <uartintr+0xe0>
    80006cd0:	00008067          	ret
    80006cd4:	00008067          	ret

0000000080006cd8 <kinit>:
    80006cd8:	fc010113          	addi	sp,sp,-64
    80006cdc:	02913423          	sd	s1,40(sp)
    80006ce0:	fffff7b7          	lui	a5,0xfffff
    80006ce4:	00006497          	auipc	s1,0x6
    80006ce8:	ceb48493          	addi	s1,s1,-789 # 8000c9cf <end+0xfff>
    80006cec:	02813823          	sd	s0,48(sp)
    80006cf0:	01313c23          	sd	s3,24(sp)
    80006cf4:	00f4f4b3          	and	s1,s1,a5
    80006cf8:	02113c23          	sd	ra,56(sp)
    80006cfc:	03213023          	sd	s2,32(sp)
    80006d00:	01413823          	sd	s4,16(sp)
    80006d04:	01513423          	sd	s5,8(sp)
    80006d08:	04010413          	addi	s0,sp,64
    80006d0c:	000017b7          	lui	a5,0x1
    80006d10:	01100993          	li	s3,17
    80006d14:	00f487b3          	add	a5,s1,a5
    80006d18:	01b99993          	slli	s3,s3,0x1b
    80006d1c:	06f9e063          	bltu	s3,a5,80006d7c <kinit+0xa4>
    80006d20:	00005a97          	auipc	s5,0x5
    80006d24:	cb0a8a93          	addi	s5,s5,-848 # 8000b9d0 <end>
    80006d28:	0754ec63          	bltu	s1,s5,80006da0 <kinit+0xc8>
    80006d2c:	0734fa63          	bgeu	s1,s3,80006da0 <kinit+0xc8>
    80006d30:	00088a37          	lui	s4,0x88
    80006d34:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006d38:	00004917          	auipc	s2,0x4
    80006d3c:	95890913          	addi	s2,s2,-1704 # 8000a690 <kmem>
    80006d40:	00ca1a13          	slli	s4,s4,0xc
    80006d44:	0140006f          	j	80006d58 <kinit+0x80>
    80006d48:	000017b7          	lui	a5,0x1
    80006d4c:	00f484b3          	add	s1,s1,a5
    80006d50:	0554e863          	bltu	s1,s5,80006da0 <kinit+0xc8>
    80006d54:	0534f663          	bgeu	s1,s3,80006da0 <kinit+0xc8>
    80006d58:	00001637          	lui	a2,0x1
    80006d5c:	00100593          	li	a1,1
    80006d60:	00048513          	mv	a0,s1
    80006d64:	00000097          	auipc	ra,0x0
    80006d68:	5e4080e7          	jalr	1508(ra) # 80007348 <__memset>
    80006d6c:	00093783          	ld	a5,0(s2)
    80006d70:	00f4b023          	sd	a5,0(s1)
    80006d74:	00993023          	sd	s1,0(s2)
    80006d78:	fd4498e3          	bne	s1,s4,80006d48 <kinit+0x70>
    80006d7c:	03813083          	ld	ra,56(sp)
    80006d80:	03013403          	ld	s0,48(sp)
    80006d84:	02813483          	ld	s1,40(sp)
    80006d88:	02013903          	ld	s2,32(sp)
    80006d8c:	01813983          	ld	s3,24(sp)
    80006d90:	01013a03          	ld	s4,16(sp)
    80006d94:	00813a83          	ld	s5,8(sp)
    80006d98:	04010113          	addi	sp,sp,64
    80006d9c:	00008067          	ret
    80006da0:	00001517          	auipc	a0,0x1
    80006da4:	52050513          	addi	a0,a0,1312 # 800082c0 <digits+0x18>
    80006da8:	fffff097          	auipc	ra,0xfffff
    80006dac:	4b4080e7          	jalr	1204(ra) # 8000625c <panic>

0000000080006db0 <freerange>:
    80006db0:	fc010113          	addi	sp,sp,-64
    80006db4:	000017b7          	lui	a5,0x1
    80006db8:	02913423          	sd	s1,40(sp)
    80006dbc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006dc0:	009504b3          	add	s1,a0,s1
    80006dc4:	fffff537          	lui	a0,0xfffff
    80006dc8:	02813823          	sd	s0,48(sp)
    80006dcc:	02113c23          	sd	ra,56(sp)
    80006dd0:	03213023          	sd	s2,32(sp)
    80006dd4:	01313c23          	sd	s3,24(sp)
    80006dd8:	01413823          	sd	s4,16(sp)
    80006ddc:	01513423          	sd	s5,8(sp)
    80006de0:	01613023          	sd	s6,0(sp)
    80006de4:	04010413          	addi	s0,sp,64
    80006de8:	00a4f4b3          	and	s1,s1,a0
    80006dec:	00f487b3          	add	a5,s1,a5
    80006df0:	06f5e463          	bltu	a1,a5,80006e58 <freerange+0xa8>
    80006df4:	00005a97          	auipc	s5,0x5
    80006df8:	bdca8a93          	addi	s5,s5,-1060 # 8000b9d0 <end>
    80006dfc:	0954e263          	bltu	s1,s5,80006e80 <freerange+0xd0>
    80006e00:	01100993          	li	s3,17
    80006e04:	01b99993          	slli	s3,s3,0x1b
    80006e08:	0734fc63          	bgeu	s1,s3,80006e80 <freerange+0xd0>
    80006e0c:	00058a13          	mv	s4,a1
    80006e10:	00004917          	auipc	s2,0x4
    80006e14:	88090913          	addi	s2,s2,-1920 # 8000a690 <kmem>
    80006e18:	00002b37          	lui	s6,0x2
    80006e1c:	0140006f          	j	80006e30 <freerange+0x80>
    80006e20:	000017b7          	lui	a5,0x1
    80006e24:	00f484b3          	add	s1,s1,a5
    80006e28:	0554ec63          	bltu	s1,s5,80006e80 <freerange+0xd0>
    80006e2c:	0534fa63          	bgeu	s1,s3,80006e80 <freerange+0xd0>
    80006e30:	00001637          	lui	a2,0x1
    80006e34:	00100593          	li	a1,1
    80006e38:	00048513          	mv	a0,s1
    80006e3c:	00000097          	auipc	ra,0x0
    80006e40:	50c080e7          	jalr	1292(ra) # 80007348 <__memset>
    80006e44:	00093703          	ld	a4,0(s2)
    80006e48:	016487b3          	add	a5,s1,s6
    80006e4c:	00e4b023          	sd	a4,0(s1)
    80006e50:	00993023          	sd	s1,0(s2)
    80006e54:	fcfa76e3          	bgeu	s4,a5,80006e20 <freerange+0x70>
    80006e58:	03813083          	ld	ra,56(sp)
    80006e5c:	03013403          	ld	s0,48(sp)
    80006e60:	02813483          	ld	s1,40(sp)
    80006e64:	02013903          	ld	s2,32(sp)
    80006e68:	01813983          	ld	s3,24(sp)
    80006e6c:	01013a03          	ld	s4,16(sp)
    80006e70:	00813a83          	ld	s5,8(sp)
    80006e74:	00013b03          	ld	s6,0(sp)
    80006e78:	04010113          	addi	sp,sp,64
    80006e7c:	00008067          	ret
    80006e80:	00001517          	auipc	a0,0x1
    80006e84:	44050513          	addi	a0,a0,1088 # 800082c0 <digits+0x18>
    80006e88:	fffff097          	auipc	ra,0xfffff
    80006e8c:	3d4080e7          	jalr	980(ra) # 8000625c <panic>

0000000080006e90 <kfree>:
    80006e90:	fe010113          	addi	sp,sp,-32
    80006e94:	00813823          	sd	s0,16(sp)
    80006e98:	00113c23          	sd	ra,24(sp)
    80006e9c:	00913423          	sd	s1,8(sp)
    80006ea0:	02010413          	addi	s0,sp,32
    80006ea4:	03451793          	slli	a5,a0,0x34
    80006ea8:	04079c63          	bnez	a5,80006f00 <kfree+0x70>
    80006eac:	00005797          	auipc	a5,0x5
    80006eb0:	b2478793          	addi	a5,a5,-1244 # 8000b9d0 <end>
    80006eb4:	00050493          	mv	s1,a0
    80006eb8:	04f56463          	bltu	a0,a5,80006f00 <kfree+0x70>
    80006ebc:	01100793          	li	a5,17
    80006ec0:	01b79793          	slli	a5,a5,0x1b
    80006ec4:	02f57e63          	bgeu	a0,a5,80006f00 <kfree+0x70>
    80006ec8:	00001637          	lui	a2,0x1
    80006ecc:	00100593          	li	a1,1
    80006ed0:	00000097          	auipc	ra,0x0
    80006ed4:	478080e7          	jalr	1144(ra) # 80007348 <__memset>
    80006ed8:	00003797          	auipc	a5,0x3
    80006edc:	7b878793          	addi	a5,a5,1976 # 8000a690 <kmem>
    80006ee0:	0007b703          	ld	a4,0(a5)
    80006ee4:	01813083          	ld	ra,24(sp)
    80006ee8:	01013403          	ld	s0,16(sp)
    80006eec:	00e4b023          	sd	a4,0(s1)
    80006ef0:	0097b023          	sd	s1,0(a5)
    80006ef4:	00813483          	ld	s1,8(sp)
    80006ef8:	02010113          	addi	sp,sp,32
    80006efc:	00008067          	ret
    80006f00:	00001517          	auipc	a0,0x1
    80006f04:	3c050513          	addi	a0,a0,960 # 800082c0 <digits+0x18>
    80006f08:	fffff097          	auipc	ra,0xfffff
    80006f0c:	354080e7          	jalr	852(ra) # 8000625c <panic>

0000000080006f10 <kalloc>:
    80006f10:	fe010113          	addi	sp,sp,-32
    80006f14:	00813823          	sd	s0,16(sp)
    80006f18:	00913423          	sd	s1,8(sp)
    80006f1c:	00113c23          	sd	ra,24(sp)
    80006f20:	02010413          	addi	s0,sp,32
    80006f24:	00003797          	auipc	a5,0x3
    80006f28:	76c78793          	addi	a5,a5,1900 # 8000a690 <kmem>
    80006f2c:	0007b483          	ld	s1,0(a5)
    80006f30:	02048063          	beqz	s1,80006f50 <kalloc+0x40>
    80006f34:	0004b703          	ld	a4,0(s1)
    80006f38:	00001637          	lui	a2,0x1
    80006f3c:	00500593          	li	a1,5
    80006f40:	00048513          	mv	a0,s1
    80006f44:	00e7b023          	sd	a4,0(a5)
    80006f48:	00000097          	auipc	ra,0x0
    80006f4c:	400080e7          	jalr	1024(ra) # 80007348 <__memset>
    80006f50:	01813083          	ld	ra,24(sp)
    80006f54:	01013403          	ld	s0,16(sp)
    80006f58:	00048513          	mv	a0,s1
    80006f5c:	00813483          	ld	s1,8(sp)
    80006f60:	02010113          	addi	sp,sp,32
    80006f64:	00008067          	ret

0000000080006f68 <initlock>:
    80006f68:	ff010113          	addi	sp,sp,-16
    80006f6c:	00813423          	sd	s0,8(sp)
    80006f70:	01010413          	addi	s0,sp,16
    80006f74:	00813403          	ld	s0,8(sp)
    80006f78:	00b53423          	sd	a1,8(a0)
    80006f7c:	00052023          	sw	zero,0(a0)
    80006f80:	00053823          	sd	zero,16(a0)
    80006f84:	01010113          	addi	sp,sp,16
    80006f88:	00008067          	ret

0000000080006f8c <acquire>:
    80006f8c:	fe010113          	addi	sp,sp,-32
    80006f90:	00813823          	sd	s0,16(sp)
    80006f94:	00913423          	sd	s1,8(sp)
    80006f98:	00113c23          	sd	ra,24(sp)
    80006f9c:	01213023          	sd	s2,0(sp)
    80006fa0:	02010413          	addi	s0,sp,32
    80006fa4:	00050493          	mv	s1,a0
    80006fa8:	10002973          	csrr	s2,sstatus
    80006fac:	100027f3          	csrr	a5,sstatus
    80006fb0:	ffd7f793          	andi	a5,a5,-3
    80006fb4:	10079073          	csrw	sstatus,a5
    80006fb8:	fffff097          	auipc	ra,0xfffff
    80006fbc:	8e0080e7          	jalr	-1824(ra) # 80005898 <mycpu>
    80006fc0:	07852783          	lw	a5,120(a0)
    80006fc4:	06078e63          	beqz	a5,80007040 <acquire+0xb4>
    80006fc8:	fffff097          	auipc	ra,0xfffff
    80006fcc:	8d0080e7          	jalr	-1840(ra) # 80005898 <mycpu>
    80006fd0:	07852783          	lw	a5,120(a0)
    80006fd4:	0004a703          	lw	a4,0(s1)
    80006fd8:	0017879b          	addiw	a5,a5,1
    80006fdc:	06f52c23          	sw	a5,120(a0)
    80006fe0:	04071063          	bnez	a4,80007020 <acquire+0x94>
    80006fe4:	00100713          	li	a4,1
    80006fe8:	00070793          	mv	a5,a4
    80006fec:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006ff0:	0007879b          	sext.w	a5,a5
    80006ff4:	fe079ae3          	bnez	a5,80006fe8 <acquire+0x5c>
    80006ff8:	0ff0000f          	fence
    80006ffc:	fffff097          	auipc	ra,0xfffff
    80007000:	89c080e7          	jalr	-1892(ra) # 80005898 <mycpu>
    80007004:	01813083          	ld	ra,24(sp)
    80007008:	01013403          	ld	s0,16(sp)
    8000700c:	00a4b823          	sd	a0,16(s1)
    80007010:	00013903          	ld	s2,0(sp)
    80007014:	00813483          	ld	s1,8(sp)
    80007018:	02010113          	addi	sp,sp,32
    8000701c:	00008067          	ret
    80007020:	0104b903          	ld	s2,16(s1)
    80007024:	fffff097          	auipc	ra,0xfffff
    80007028:	874080e7          	jalr	-1932(ra) # 80005898 <mycpu>
    8000702c:	faa91ce3          	bne	s2,a0,80006fe4 <acquire+0x58>
    80007030:	00001517          	auipc	a0,0x1
    80007034:	29850513          	addi	a0,a0,664 # 800082c8 <digits+0x20>
    80007038:	fffff097          	auipc	ra,0xfffff
    8000703c:	224080e7          	jalr	548(ra) # 8000625c <panic>
    80007040:	00195913          	srli	s2,s2,0x1
    80007044:	fffff097          	auipc	ra,0xfffff
    80007048:	854080e7          	jalr	-1964(ra) # 80005898 <mycpu>
    8000704c:	00197913          	andi	s2,s2,1
    80007050:	07252e23          	sw	s2,124(a0)
    80007054:	f75ff06f          	j	80006fc8 <acquire+0x3c>

0000000080007058 <release>:
    80007058:	fe010113          	addi	sp,sp,-32
    8000705c:	00813823          	sd	s0,16(sp)
    80007060:	00113c23          	sd	ra,24(sp)
    80007064:	00913423          	sd	s1,8(sp)
    80007068:	01213023          	sd	s2,0(sp)
    8000706c:	02010413          	addi	s0,sp,32
    80007070:	00052783          	lw	a5,0(a0)
    80007074:	00079a63          	bnez	a5,80007088 <release+0x30>
    80007078:	00001517          	auipc	a0,0x1
    8000707c:	25850513          	addi	a0,a0,600 # 800082d0 <digits+0x28>
    80007080:	fffff097          	auipc	ra,0xfffff
    80007084:	1dc080e7          	jalr	476(ra) # 8000625c <panic>
    80007088:	01053903          	ld	s2,16(a0)
    8000708c:	00050493          	mv	s1,a0
    80007090:	fffff097          	auipc	ra,0xfffff
    80007094:	808080e7          	jalr	-2040(ra) # 80005898 <mycpu>
    80007098:	fea910e3          	bne	s2,a0,80007078 <release+0x20>
    8000709c:	0004b823          	sd	zero,16(s1)
    800070a0:	0ff0000f          	fence
    800070a4:	0f50000f          	fence	iorw,ow
    800070a8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800070ac:	ffffe097          	auipc	ra,0xffffe
    800070b0:	7ec080e7          	jalr	2028(ra) # 80005898 <mycpu>
    800070b4:	100027f3          	csrr	a5,sstatus
    800070b8:	0027f793          	andi	a5,a5,2
    800070bc:	04079a63          	bnez	a5,80007110 <release+0xb8>
    800070c0:	07852783          	lw	a5,120(a0)
    800070c4:	02f05e63          	blez	a5,80007100 <release+0xa8>
    800070c8:	fff7871b          	addiw	a4,a5,-1
    800070cc:	06e52c23          	sw	a4,120(a0)
    800070d0:	00071c63          	bnez	a4,800070e8 <release+0x90>
    800070d4:	07c52783          	lw	a5,124(a0)
    800070d8:	00078863          	beqz	a5,800070e8 <release+0x90>
    800070dc:	100027f3          	csrr	a5,sstatus
    800070e0:	0027e793          	ori	a5,a5,2
    800070e4:	10079073          	csrw	sstatus,a5
    800070e8:	01813083          	ld	ra,24(sp)
    800070ec:	01013403          	ld	s0,16(sp)
    800070f0:	00813483          	ld	s1,8(sp)
    800070f4:	00013903          	ld	s2,0(sp)
    800070f8:	02010113          	addi	sp,sp,32
    800070fc:	00008067          	ret
    80007100:	00001517          	auipc	a0,0x1
    80007104:	1f050513          	addi	a0,a0,496 # 800082f0 <digits+0x48>
    80007108:	fffff097          	auipc	ra,0xfffff
    8000710c:	154080e7          	jalr	340(ra) # 8000625c <panic>
    80007110:	00001517          	auipc	a0,0x1
    80007114:	1c850513          	addi	a0,a0,456 # 800082d8 <digits+0x30>
    80007118:	fffff097          	auipc	ra,0xfffff
    8000711c:	144080e7          	jalr	324(ra) # 8000625c <panic>

0000000080007120 <holding>:
    80007120:	00052783          	lw	a5,0(a0)
    80007124:	00079663          	bnez	a5,80007130 <holding+0x10>
    80007128:	00000513          	li	a0,0
    8000712c:	00008067          	ret
    80007130:	fe010113          	addi	sp,sp,-32
    80007134:	00813823          	sd	s0,16(sp)
    80007138:	00913423          	sd	s1,8(sp)
    8000713c:	00113c23          	sd	ra,24(sp)
    80007140:	02010413          	addi	s0,sp,32
    80007144:	01053483          	ld	s1,16(a0)
    80007148:	ffffe097          	auipc	ra,0xffffe
    8000714c:	750080e7          	jalr	1872(ra) # 80005898 <mycpu>
    80007150:	01813083          	ld	ra,24(sp)
    80007154:	01013403          	ld	s0,16(sp)
    80007158:	40a48533          	sub	a0,s1,a0
    8000715c:	00153513          	seqz	a0,a0
    80007160:	00813483          	ld	s1,8(sp)
    80007164:	02010113          	addi	sp,sp,32
    80007168:	00008067          	ret

000000008000716c <push_off>:
    8000716c:	fe010113          	addi	sp,sp,-32
    80007170:	00813823          	sd	s0,16(sp)
    80007174:	00113c23          	sd	ra,24(sp)
    80007178:	00913423          	sd	s1,8(sp)
    8000717c:	02010413          	addi	s0,sp,32
    80007180:	100024f3          	csrr	s1,sstatus
    80007184:	100027f3          	csrr	a5,sstatus
    80007188:	ffd7f793          	andi	a5,a5,-3
    8000718c:	10079073          	csrw	sstatus,a5
    80007190:	ffffe097          	auipc	ra,0xffffe
    80007194:	708080e7          	jalr	1800(ra) # 80005898 <mycpu>
    80007198:	07852783          	lw	a5,120(a0)
    8000719c:	02078663          	beqz	a5,800071c8 <push_off+0x5c>
    800071a0:	ffffe097          	auipc	ra,0xffffe
    800071a4:	6f8080e7          	jalr	1784(ra) # 80005898 <mycpu>
    800071a8:	07852783          	lw	a5,120(a0)
    800071ac:	01813083          	ld	ra,24(sp)
    800071b0:	01013403          	ld	s0,16(sp)
    800071b4:	0017879b          	addiw	a5,a5,1
    800071b8:	06f52c23          	sw	a5,120(a0)
    800071bc:	00813483          	ld	s1,8(sp)
    800071c0:	02010113          	addi	sp,sp,32
    800071c4:	00008067          	ret
    800071c8:	0014d493          	srli	s1,s1,0x1
    800071cc:	ffffe097          	auipc	ra,0xffffe
    800071d0:	6cc080e7          	jalr	1740(ra) # 80005898 <mycpu>
    800071d4:	0014f493          	andi	s1,s1,1
    800071d8:	06952e23          	sw	s1,124(a0)
    800071dc:	fc5ff06f          	j	800071a0 <push_off+0x34>

00000000800071e0 <pop_off>:
    800071e0:	ff010113          	addi	sp,sp,-16
    800071e4:	00813023          	sd	s0,0(sp)
    800071e8:	00113423          	sd	ra,8(sp)
    800071ec:	01010413          	addi	s0,sp,16
    800071f0:	ffffe097          	auipc	ra,0xffffe
    800071f4:	6a8080e7          	jalr	1704(ra) # 80005898 <mycpu>
    800071f8:	100027f3          	csrr	a5,sstatus
    800071fc:	0027f793          	andi	a5,a5,2
    80007200:	04079663          	bnez	a5,8000724c <pop_off+0x6c>
    80007204:	07852783          	lw	a5,120(a0)
    80007208:	02f05a63          	blez	a5,8000723c <pop_off+0x5c>
    8000720c:	fff7871b          	addiw	a4,a5,-1
    80007210:	06e52c23          	sw	a4,120(a0)
    80007214:	00071c63          	bnez	a4,8000722c <pop_off+0x4c>
    80007218:	07c52783          	lw	a5,124(a0)
    8000721c:	00078863          	beqz	a5,8000722c <pop_off+0x4c>
    80007220:	100027f3          	csrr	a5,sstatus
    80007224:	0027e793          	ori	a5,a5,2
    80007228:	10079073          	csrw	sstatus,a5
    8000722c:	00813083          	ld	ra,8(sp)
    80007230:	00013403          	ld	s0,0(sp)
    80007234:	01010113          	addi	sp,sp,16
    80007238:	00008067          	ret
    8000723c:	00001517          	auipc	a0,0x1
    80007240:	0b450513          	addi	a0,a0,180 # 800082f0 <digits+0x48>
    80007244:	fffff097          	auipc	ra,0xfffff
    80007248:	018080e7          	jalr	24(ra) # 8000625c <panic>
    8000724c:	00001517          	auipc	a0,0x1
    80007250:	08c50513          	addi	a0,a0,140 # 800082d8 <digits+0x30>
    80007254:	fffff097          	auipc	ra,0xfffff
    80007258:	008080e7          	jalr	8(ra) # 8000625c <panic>

000000008000725c <push_on>:
    8000725c:	fe010113          	addi	sp,sp,-32
    80007260:	00813823          	sd	s0,16(sp)
    80007264:	00113c23          	sd	ra,24(sp)
    80007268:	00913423          	sd	s1,8(sp)
    8000726c:	02010413          	addi	s0,sp,32
    80007270:	100024f3          	csrr	s1,sstatus
    80007274:	100027f3          	csrr	a5,sstatus
    80007278:	0027e793          	ori	a5,a5,2
    8000727c:	10079073          	csrw	sstatus,a5
    80007280:	ffffe097          	auipc	ra,0xffffe
    80007284:	618080e7          	jalr	1560(ra) # 80005898 <mycpu>
    80007288:	07852783          	lw	a5,120(a0)
    8000728c:	02078663          	beqz	a5,800072b8 <push_on+0x5c>
    80007290:	ffffe097          	auipc	ra,0xffffe
    80007294:	608080e7          	jalr	1544(ra) # 80005898 <mycpu>
    80007298:	07852783          	lw	a5,120(a0)
    8000729c:	01813083          	ld	ra,24(sp)
    800072a0:	01013403          	ld	s0,16(sp)
    800072a4:	0017879b          	addiw	a5,a5,1
    800072a8:	06f52c23          	sw	a5,120(a0)
    800072ac:	00813483          	ld	s1,8(sp)
    800072b0:	02010113          	addi	sp,sp,32
    800072b4:	00008067          	ret
    800072b8:	0014d493          	srli	s1,s1,0x1
    800072bc:	ffffe097          	auipc	ra,0xffffe
    800072c0:	5dc080e7          	jalr	1500(ra) # 80005898 <mycpu>
    800072c4:	0014f493          	andi	s1,s1,1
    800072c8:	06952e23          	sw	s1,124(a0)
    800072cc:	fc5ff06f          	j	80007290 <push_on+0x34>

00000000800072d0 <pop_on>:
    800072d0:	ff010113          	addi	sp,sp,-16
    800072d4:	00813023          	sd	s0,0(sp)
    800072d8:	00113423          	sd	ra,8(sp)
    800072dc:	01010413          	addi	s0,sp,16
    800072e0:	ffffe097          	auipc	ra,0xffffe
    800072e4:	5b8080e7          	jalr	1464(ra) # 80005898 <mycpu>
    800072e8:	100027f3          	csrr	a5,sstatus
    800072ec:	0027f793          	andi	a5,a5,2
    800072f0:	04078463          	beqz	a5,80007338 <pop_on+0x68>
    800072f4:	07852783          	lw	a5,120(a0)
    800072f8:	02f05863          	blez	a5,80007328 <pop_on+0x58>
    800072fc:	fff7879b          	addiw	a5,a5,-1
    80007300:	06f52c23          	sw	a5,120(a0)
    80007304:	07853783          	ld	a5,120(a0)
    80007308:	00079863          	bnez	a5,80007318 <pop_on+0x48>
    8000730c:	100027f3          	csrr	a5,sstatus
    80007310:	ffd7f793          	andi	a5,a5,-3
    80007314:	10079073          	csrw	sstatus,a5
    80007318:	00813083          	ld	ra,8(sp)
    8000731c:	00013403          	ld	s0,0(sp)
    80007320:	01010113          	addi	sp,sp,16
    80007324:	00008067          	ret
    80007328:	00001517          	auipc	a0,0x1
    8000732c:	ff050513          	addi	a0,a0,-16 # 80008318 <digits+0x70>
    80007330:	fffff097          	auipc	ra,0xfffff
    80007334:	f2c080e7          	jalr	-212(ra) # 8000625c <panic>
    80007338:	00001517          	auipc	a0,0x1
    8000733c:	fc050513          	addi	a0,a0,-64 # 800082f8 <digits+0x50>
    80007340:	fffff097          	auipc	ra,0xfffff
    80007344:	f1c080e7          	jalr	-228(ra) # 8000625c <panic>

0000000080007348 <__memset>:
    80007348:	ff010113          	addi	sp,sp,-16
    8000734c:	00813423          	sd	s0,8(sp)
    80007350:	01010413          	addi	s0,sp,16
    80007354:	1a060e63          	beqz	a2,80007510 <__memset+0x1c8>
    80007358:	40a007b3          	neg	a5,a0
    8000735c:	0077f793          	andi	a5,a5,7
    80007360:	00778693          	addi	a3,a5,7
    80007364:	00b00813          	li	a6,11
    80007368:	0ff5f593          	andi	a1,a1,255
    8000736c:	fff6071b          	addiw	a4,a2,-1
    80007370:	1b06e663          	bltu	a3,a6,8000751c <__memset+0x1d4>
    80007374:	1cd76463          	bltu	a4,a3,8000753c <__memset+0x1f4>
    80007378:	1a078e63          	beqz	a5,80007534 <__memset+0x1ec>
    8000737c:	00b50023          	sb	a1,0(a0)
    80007380:	00100713          	li	a4,1
    80007384:	1ae78463          	beq	a5,a4,8000752c <__memset+0x1e4>
    80007388:	00b500a3          	sb	a1,1(a0)
    8000738c:	00200713          	li	a4,2
    80007390:	1ae78a63          	beq	a5,a4,80007544 <__memset+0x1fc>
    80007394:	00b50123          	sb	a1,2(a0)
    80007398:	00300713          	li	a4,3
    8000739c:	18e78463          	beq	a5,a4,80007524 <__memset+0x1dc>
    800073a0:	00b501a3          	sb	a1,3(a0)
    800073a4:	00400713          	li	a4,4
    800073a8:	1ae78263          	beq	a5,a4,8000754c <__memset+0x204>
    800073ac:	00b50223          	sb	a1,4(a0)
    800073b0:	00500713          	li	a4,5
    800073b4:	1ae78063          	beq	a5,a4,80007554 <__memset+0x20c>
    800073b8:	00b502a3          	sb	a1,5(a0)
    800073bc:	00700713          	li	a4,7
    800073c0:	18e79e63          	bne	a5,a4,8000755c <__memset+0x214>
    800073c4:	00b50323          	sb	a1,6(a0)
    800073c8:	00700e93          	li	t4,7
    800073cc:	00859713          	slli	a4,a1,0x8
    800073d0:	00e5e733          	or	a4,a1,a4
    800073d4:	01059e13          	slli	t3,a1,0x10
    800073d8:	01c76e33          	or	t3,a4,t3
    800073dc:	01859313          	slli	t1,a1,0x18
    800073e0:	006e6333          	or	t1,t3,t1
    800073e4:	02059893          	slli	a7,a1,0x20
    800073e8:	40f60e3b          	subw	t3,a2,a5
    800073ec:	011368b3          	or	a7,t1,a7
    800073f0:	02859813          	slli	a6,a1,0x28
    800073f4:	0108e833          	or	a6,a7,a6
    800073f8:	03059693          	slli	a3,a1,0x30
    800073fc:	003e589b          	srliw	a7,t3,0x3
    80007400:	00d866b3          	or	a3,a6,a3
    80007404:	03859713          	slli	a4,a1,0x38
    80007408:	00389813          	slli	a6,a7,0x3
    8000740c:	00f507b3          	add	a5,a0,a5
    80007410:	00e6e733          	or	a4,a3,a4
    80007414:	000e089b          	sext.w	a7,t3
    80007418:	00f806b3          	add	a3,a6,a5
    8000741c:	00e7b023          	sd	a4,0(a5)
    80007420:	00878793          	addi	a5,a5,8
    80007424:	fed79ce3          	bne	a5,a3,8000741c <__memset+0xd4>
    80007428:	ff8e7793          	andi	a5,t3,-8
    8000742c:	0007871b          	sext.w	a4,a5
    80007430:	01d787bb          	addw	a5,a5,t4
    80007434:	0ce88e63          	beq	a7,a4,80007510 <__memset+0x1c8>
    80007438:	00f50733          	add	a4,a0,a5
    8000743c:	00b70023          	sb	a1,0(a4)
    80007440:	0017871b          	addiw	a4,a5,1
    80007444:	0cc77663          	bgeu	a4,a2,80007510 <__memset+0x1c8>
    80007448:	00e50733          	add	a4,a0,a4
    8000744c:	00b70023          	sb	a1,0(a4)
    80007450:	0027871b          	addiw	a4,a5,2
    80007454:	0ac77e63          	bgeu	a4,a2,80007510 <__memset+0x1c8>
    80007458:	00e50733          	add	a4,a0,a4
    8000745c:	00b70023          	sb	a1,0(a4)
    80007460:	0037871b          	addiw	a4,a5,3
    80007464:	0ac77663          	bgeu	a4,a2,80007510 <__memset+0x1c8>
    80007468:	00e50733          	add	a4,a0,a4
    8000746c:	00b70023          	sb	a1,0(a4)
    80007470:	0047871b          	addiw	a4,a5,4
    80007474:	08c77e63          	bgeu	a4,a2,80007510 <__memset+0x1c8>
    80007478:	00e50733          	add	a4,a0,a4
    8000747c:	00b70023          	sb	a1,0(a4)
    80007480:	0057871b          	addiw	a4,a5,5
    80007484:	08c77663          	bgeu	a4,a2,80007510 <__memset+0x1c8>
    80007488:	00e50733          	add	a4,a0,a4
    8000748c:	00b70023          	sb	a1,0(a4)
    80007490:	0067871b          	addiw	a4,a5,6
    80007494:	06c77e63          	bgeu	a4,a2,80007510 <__memset+0x1c8>
    80007498:	00e50733          	add	a4,a0,a4
    8000749c:	00b70023          	sb	a1,0(a4)
    800074a0:	0077871b          	addiw	a4,a5,7
    800074a4:	06c77663          	bgeu	a4,a2,80007510 <__memset+0x1c8>
    800074a8:	00e50733          	add	a4,a0,a4
    800074ac:	00b70023          	sb	a1,0(a4)
    800074b0:	0087871b          	addiw	a4,a5,8
    800074b4:	04c77e63          	bgeu	a4,a2,80007510 <__memset+0x1c8>
    800074b8:	00e50733          	add	a4,a0,a4
    800074bc:	00b70023          	sb	a1,0(a4)
    800074c0:	0097871b          	addiw	a4,a5,9
    800074c4:	04c77663          	bgeu	a4,a2,80007510 <__memset+0x1c8>
    800074c8:	00e50733          	add	a4,a0,a4
    800074cc:	00b70023          	sb	a1,0(a4)
    800074d0:	00a7871b          	addiw	a4,a5,10
    800074d4:	02c77e63          	bgeu	a4,a2,80007510 <__memset+0x1c8>
    800074d8:	00e50733          	add	a4,a0,a4
    800074dc:	00b70023          	sb	a1,0(a4)
    800074e0:	00b7871b          	addiw	a4,a5,11
    800074e4:	02c77663          	bgeu	a4,a2,80007510 <__memset+0x1c8>
    800074e8:	00e50733          	add	a4,a0,a4
    800074ec:	00b70023          	sb	a1,0(a4)
    800074f0:	00c7871b          	addiw	a4,a5,12
    800074f4:	00c77e63          	bgeu	a4,a2,80007510 <__memset+0x1c8>
    800074f8:	00e50733          	add	a4,a0,a4
    800074fc:	00b70023          	sb	a1,0(a4)
    80007500:	00d7879b          	addiw	a5,a5,13
    80007504:	00c7f663          	bgeu	a5,a2,80007510 <__memset+0x1c8>
    80007508:	00f507b3          	add	a5,a0,a5
    8000750c:	00b78023          	sb	a1,0(a5)
    80007510:	00813403          	ld	s0,8(sp)
    80007514:	01010113          	addi	sp,sp,16
    80007518:	00008067          	ret
    8000751c:	00b00693          	li	a3,11
    80007520:	e55ff06f          	j	80007374 <__memset+0x2c>
    80007524:	00300e93          	li	t4,3
    80007528:	ea5ff06f          	j	800073cc <__memset+0x84>
    8000752c:	00100e93          	li	t4,1
    80007530:	e9dff06f          	j	800073cc <__memset+0x84>
    80007534:	00000e93          	li	t4,0
    80007538:	e95ff06f          	j	800073cc <__memset+0x84>
    8000753c:	00000793          	li	a5,0
    80007540:	ef9ff06f          	j	80007438 <__memset+0xf0>
    80007544:	00200e93          	li	t4,2
    80007548:	e85ff06f          	j	800073cc <__memset+0x84>
    8000754c:	00400e93          	li	t4,4
    80007550:	e7dff06f          	j	800073cc <__memset+0x84>
    80007554:	00500e93          	li	t4,5
    80007558:	e75ff06f          	j	800073cc <__memset+0x84>
    8000755c:	00600e93          	li	t4,6
    80007560:	e6dff06f          	j	800073cc <__memset+0x84>

0000000080007564 <__memmove>:
    80007564:	ff010113          	addi	sp,sp,-16
    80007568:	00813423          	sd	s0,8(sp)
    8000756c:	01010413          	addi	s0,sp,16
    80007570:	0e060863          	beqz	a2,80007660 <__memmove+0xfc>
    80007574:	fff6069b          	addiw	a3,a2,-1
    80007578:	0006881b          	sext.w	a6,a3
    8000757c:	0ea5e863          	bltu	a1,a0,8000766c <__memmove+0x108>
    80007580:	00758713          	addi	a4,a1,7
    80007584:	00a5e7b3          	or	a5,a1,a0
    80007588:	40a70733          	sub	a4,a4,a0
    8000758c:	0077f793          	andi	a5,a5,7
    80007590:	00f73713          	sltiu	a4,a4,15
    80007594:	00174713          	xori	a4,a4,1
    80007598:	0017b793          	seqz	a5,a5
    8000759c:	00e7f7b3          	and	a5,a5,a4
    800075a0:	10078863          	beqz	a5,800076b0 <__memmove+0x14c>
    800075a4:	00900793          	li	a5,9
    800075a8:	1107f463          	bgeu	a5,a6,800076b0 <__memmove+0x14c>
    800075ac:	0036581b          	srliw	a6,a2,0x3
    800075b0:	fff8081b          	addiw	a6,a6,-1
    800075b4:	02081813          	slli	a6,a6,0x20
    800075b8:	01d85893          	srli	a7,a6,0x1d
    800075bc:	00858813          	addi	a6,a1,8
    800075c0:	00058793          	mv	a5,a1
    800075c4:	00050713          	mv	a4,a0
    800075c8:	01088833          	add	a6,a7,a6
    800075cc:	0007b883          	ld	a7,0(a5)
    800075d0:	00878793          	addi	a5,a5,8
    800075d4:	00870713          	addi	a4,a4,8
    800075d8:	ff173c23          	sd	a7,-8(a4)
    800075dc:	ff0798e3          	bne	a5,a6,800075cc <__memmove+0x68>
    800075e0:	ff867713          	andi	a4,a2,-8
    800075e4:	02071793          	slli	a5,a4,0x20
    800075e8:	0207d793          	srli	a5,a5,0x20
    800075ec:	00f585b3          	add	a1,a1,a5
    800075f0:	40e686bb          	subw	a3,a3,a4
    800075f4:	00f507b3          	add	a5,a0,a5
    800075f8:	06e60463          	beq	a2,a4,80007660 <__memmove+0xfc>
    800075fc:	0005c703          	lbu	a4,0(a1)
    80007600:	00e78023          	sb	a4,0(a5)
    80007604:	04068e63          	beqz	a3,80007660 <__memmove+0xfc>
    80007608:	0015c603          	lbu	a2,1(a1)
    8000760c:	00100713          	li	a4,1
    80007610:	00c780a3          	sb	a2,1(a5)
    80007614:	04e68663          	beq	a3,a4,80007660 <__memmove+0xfc>
    80007618:	0025c603          	lbu	a2,2(a1)
    8000761c:	00200713          	li	a4,2
    80007620:	00c78123          	sb	a2,2(a5)
    80007624:	02e68e63          	beq	a3,a4,80007660 <__memmove+0xfc>
    80007628:	0035c603          	lbu	a2,3(a1)
    8000762c:	00300713          	li	a4,3
    80007630:	00c781a3          	sb	a2,3(a5)
    80007634:	02e68663          	beq	a3,a4,80007660 <__memmove+0xfc>
    80007638:	0045c603          	lbu	a2,4(a1)
    8000763c:	00400713          	li	a4,4
    80007640:	00c78223          	sb	a2,4(a5)
    80007644:	00e68e63          	beq	a3,a4,80007660 <__memmove+0xfc>
    80007648:	0055c603          	lbu	a2,5(a1)
    8000764c:	00500713          	li	a4,5
    80007650:	00c782a3          	sb	a2,5(a5)
    80007654:	00e68663          	beq	a3,a4,80007660 <__memmove+0xfc>
    80007658:	0065c703          	lbu	a4,6(a1)
    8000765c:	00e78323          	sb	a4,6(a5)
    80007660:	00813403          	ld	s0,8(sp)
    80007664:	01010113          	addi	sp,sp,16
    80007668:	00008067          	ret
    8000766c:	02061713          	slli	a4,a2,0x20
    80007670:	02075713          	srli	a4,a4,0x20
    80007674:	00e587b3          	add	a5,a1,a4
    80007678:	f0f574e3          	bgeu	a0,a5,80007580 <__memmove+0x1c>
    8000767c:	02069613          	slli	a2,a3,0x20
    80007680:	02065613          	srli	a2,a2,0x20
    80007684:	fff64613          	not	a2,a2
    80007688:	00e50733          	add	a4,a0,a4
    8000768c:	00c78633          	add	a2,a5,a2
    80007690:	fff7c683          	lbu	a3,-1(a5)
    80007694:	fff78793          	addi	a5,a5,-1
    80007698:	fff70713          	addi	a4,a4,-1
    8000769c:	00d70023          	sb	a3,0(a4)
    800076a0:	fec798e3          	bne	a5,a2,80007690 <__memmove+0x12c>
    800076a4:	00813403          	ld	s0,8(sp)
    800076a8:	01010113          	addi	sp,sp,16
    800076ac:	00008067          	ret
    800076b0:	02069713          	slli	a4,a3,0x20
    800076b4:	02075713          	srli	a4,a4,0x20
    800076b8:	00170713          	addi	a4,a4,1
    800076bc:	00e50733          	add	a4,a0,a4
    800076c0:	00050793          	mv	a5,a0
    800076c4:	0005c683          	lbu	a3,0(a1)
    800076c8:	00178793          	addi	a5,a5,1
    800076cc:	00158593          	addi	a1,a1,1
    800076d0:	fed78fa3          	sb	a3,-1(a5)
    800076d4:	fee798e3          	bne	a5,a4,800076c4 <__memmove+0x160>
    800076d8:	f89ff06f          	j	80007660 <__memmove+0xfc>
	...
