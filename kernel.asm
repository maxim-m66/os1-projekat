
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00009117          	auipc	sp,0x9
    80000004:	17813103          	ld	sp,376(sp) # 80009178 <_GLOBAL_OFFSET_TABLE_+0x50>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	5bd040ef          	jal	ra,80004dd8 <start>

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

    call _ZN5riscv20handleSupervisorTrapEmmmmm
    800010a4:	4b5020ef          	jal	ra,80003d58 <_ZN5riscv20handleSupervisorTrapEmmmmm>

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

    call _ZN5riscv15handleTimerTrapEv
    800011ac:	495020ef          	jal	ra,80003e40 <_ZN5riscv15handleTimerTrapEv>

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
    call _ZN5riscv14handleReadTrapEv
    80001238:	655020ef          	jal	ra,8000408c <_ZN5riscv14handleReadTrapEv>
    sret
    8000123c:	10200073          	sret

0000000080001240 <writeHandler>:

writeHandler:
    call _ZN5riscv15handleWriteTrapEv
    80001240:	681020ef          	jal	ra,800040c0 <_ZN5riscv15handleWriteTrapEv>
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

    call _ZN5riscv17handleConsoleTrapEv
    800012cc:	4e1020ef          	jal	ra,80003fac <_ZN5riscv17handleConsoleTrapEv>

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

0000000080001360 <_ZN5riscv7setjumpEv>:

.global _ZN5riscv7setjumpEv
.type _ZN5riscv7setjumpEv @function
_ZN5riscv7setjumpEv:
    sub a0, a0, a0
    80001360:	40a50533          	sub	a0,a0,a0
    addi sp, sp, -256
    80001364:	f0010113          	addi	sp,sp,-256
    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001368:	00113423          	sd	ra,8(sp)
    8000136c:	00213823          	sd	sp,16(sp)
    80001370:	00313c23          	sd	gp,24(sp)
    80001374:	02413023          	sd	tp,32(sp)
    80001378:	02513423          	sd	t0,40(sp)
    8000137c:	02613823          	sd	t1,48(sp)
    80001380:	02713c23          	sd	t2,56(sp)
    80001384:	04813023          	sd	s0,64(sp)
    80001388:	04913423          	sd	s1,72(sp)
    8000138c:	04a13823          	sd	a0,80(sp)
    80001390:	04b13c23          	sd	a1,88(sp)
    80001394:	06c13023          	sd	a2,96(sp)
    80001398:	06d13423          	sd	a3,104(sp)
    8000139c:	06e13823          	sd	a4,112(sp)
    800013a0:	06f13c23          	sd	a5,120(sp)
    800013a4:	09013023          	sd	a6,128(sp)
    800013a8:	09113423          	sd	a7,136(sp)
    800013ac:	09213823          	sd	s2,144(sp)
    800013b0:	09313c23          	sd	s3,152(sp)
    800013b4:	0b413023          	sd	s4,160(sp)
    800013b8:	0b513423          	sd	s5,168(sp)
    800013bc:	0b613823          	sd	s6,176(sp)
    800013c0:	0b713c23          	sd	s7,184(sp)
    800013c4:	0d813023          	sd	s8,192(sp)
    800013c8:	0d913423          	sd	s9,200(sp)
    800013cc:	0da13823          	sd	s10,208(sp)
    800013d0:	0db13c23          	sd	s11,216(sp)
    800013d4:	0fc13023          	sd	t3,224(sp)
    800013d8:	0fd13423          	sd	t4,232(sp)
    800013dc:	0fe13823          	sd	t5,240(sp)
    800013e0:	0ff13c23          	sd	t6,248(sp)
    addi a0, a0, 1
    800013e4:	00150513          	addi	a0,a0,1 # 1001 <_entry-0x7fffefff>
    ret
    800013e8:	00008067          	ret

00000000800013ec <_ZN5riscv8longjumpEv>:
.global _ZN5riscv8longjumpEv
.type _ZN5riscv8longjumpEv @function
_ZN5riscv8longjumpEv:
    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800013ec:	00813083          	ld	ra,8(sp)
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
    80001470:	00153023          	sd	ra,0(a0)
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


uint64 syscall(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    80001490:	fe010113          	addi	sp,sp,-32
    80001494:	00813c23          	sd	s0,24(sp)
    80001498:	02010413          	addi	s0,sp,32
    uint64 volatile ret;
    __asm__ volatile("ecall");
    8000149c:	00000073          	ecall
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    800014a0:	00050793          	mv	a5,a0
    800014a4:	fef43423          	sd	a5,-24(s0)
    return ret;
    800014a8:	fe843503          	ld	a0,-24(s0)
}
    800014ac:	01813403          	ld	s0,24(sp)
    800014b0:	02010113          	addi	sp,sp,32
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
    80001a50:	8a8080e7          	jalr	-1880(ra) # 800032f4 <_Z6memcpyPKvS0_i>
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
    80001b40:	d50080e7          	jalr	-688(ra) # 8000388c <_Znam>
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
    80001c74:	00005817          	auipc	a6,0x5
    80001c78:	3ac80813          	addi	a6,a6,940 # 80007020 <CONSOLE_STATUS+0x10>
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
    80001d88:	00005697          	auipc	a3,0x5
    80001d8c:	29868693          	addi	a3,a3,664 # 80007020 <CONSOLE_STATUS+0x10>
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
    80001e04:	00007517          	auipc	a0,0x7
    80001e08:	3b453503          	ld	a0,948(a0) # 800091b8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80001e0c:	00001097          	auipc	ra,0x1
    80001e10:	610080e7          	jalr	1552(ra) # 8000341c <_ZNK3stm7istreamlsEi>
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
    80001e54:	a3c080e7          	jalr	-1476(ra) # 8000388c <_Znam>
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
    80001ff4:	9b8080e7          	jalr	-1608(ra) # 800039a8 <_ZdaPv>
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
    80002054:	958080e7          	jalr	-1704(ra) # 800039a8 <_ZdaPv>
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
    80002150:	00001097          	auipc	ra,0x1
    80002154:	73c080e7          	jalr	1852(ra) # 8000388c <_Znam>
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
    800021a0:	00001097          	auipc	ra,0x1
    800021a4:	6c4080e7          	jalr	1732(ra) # 80003864 <_Znwm>
    800021a8:	00050493          	mv	s1,a0
    800021ac:	00090593          	mv	a1,s2
    800021b0:	00000097          	auipc	ra,0x0
    800021b4:	f24080e7          	jalr	-220(ra) # 800020d4 <_ZN3stm6stringC1EPKc>
    800021b8:	0200006f          	j	800021d8 <_ZN3stmplERKNS_6stringES2_+0x68>
    800021bc:	00050913          	mv	s2,a0
    800021c0:	00048513          	mv	a0,s1
    800021c4:	00001097          	auipc	ra,0x1
    800021c8:	6f0080e7          	jalr	1776(ra) # 800038b4 <_ZdlPv>
    800021cc:	00090513          	mv	a0,s2
    800021d0:	00008097          	auipc	ra,0x8
    800021d4:	1c8080e7          	jalr	456(ra) # 8000a398 <_Unwind_Resume>
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
    80002268:	db8080e7          	jalr	-584(ra) # 8000301c <_ZN9Allocator10_mem_allocEm>
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
    800022ec:	04052423          	sw	zero,72(a0)
        Scheduler::put(next);
    800022f0:	00002097          	auipc	ra,0x2
    800022f4:	ef0080e7          	jalr	-272(ra) # 800041e0 <_ZN9Scheduler3putEP3TCB>
        TCB::_thread_dispatch();
    800022f8:	00002097          	auipc	ra,0x2
    800022fc:	6a4080e7          	jalr	1700(ra) # 8000499c <_ZN3TCB16_thread_dispatchEv>
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
    80002350:	e94080e7          	jalr	-364(ra) # 800041e0 <_ZN9Scheduler3putEP3TCB>
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
    800023b0:	e34080e7          	jalr	-460(ra) # 800041e0 <_ZN9Scheduler3putEP3TCB>
    while (!id->blocked.is_empty()) {
    800023b4:	fe5ff06f          	j	80002398 <_ZN3Sem10_sem_closeEPS_+0x1c>
    id->blocked.destroy();
    800023b8:	00848513          	addi	a0,s1,8
    800023bc:	00000097          	auipc	ra,0x0
    800023c0:	1ac080e7          	jalr	428(ra) # 80002568 <_ZN3stm14CircularBufferIP3TCBE7destroyEv>
    if (Allocator::_mem_free(id)) return 2;
    800023c4:	00048513          	mv	a0,s1
    800023c8:	00001097          	auipc	ra,0x1
    800023cc:	d10080e7          	jalr	-752(ra) # 800030d8 <_ZN9Allocator9_mem_freeEPKv>
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
    80002428:	00007497          	auipc	s1,0x7
    8000242c:	d704b483          	ld	s1,-656(s1) # 80009198 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002430:	0004b583          	ld	a1,0(s1)

    void block() { this->status = BLOCKED; }
    80002434:	00100793          	li	a5,1
    80002438:	04f5a423          	sw	a5,72(a1)
        id->blocked.put(TCB::running);
    8000243c:	00850513          	addi	a0,a0,8
    80002440:	00000097          	auipc	ra,0x0
    80002444:	200080e7          	jalr	512(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
        TCB::_thread_dispatch();
    80002448:	00002097          	auipc	ra,0x2
    8000244c:	554080e7          	jalr	1364(ra) # 8000499c <_ZN3TCB16_thread_dispatchEv>
        if (TCB::running->is_blocked()) {
    80002450:	0004b783          	ld	a5,0(s1)
    bool is_blocked() const { return this->status == BLOCKED; }
    80002454:	0487a683          	lw	a3,72(a5)
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
    80002478:	0407a423          	sw	zero,72(a5)
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
    800026e0:	00007797          	auipc	a5,0x7
    800026e4:	a707b783          	ld	a5,-1424(a5) # 80009150 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80002718:	00007797          	auipc	a5,0x7
    8000271c:	a387b783          	ld	a5,-1480(a5) # 80009150 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80002764:	00007797          	auipc	a5,0x7
    80002768:	9ec7b783          	ld	a5,-1556(a5) # 80009150 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    800027a8:	00007797          	auipc	a5,0x7
    800027ac:	9a87b783          	ld	a5,-1624(a5) # 80009150 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    8000292c:	00007517          	auipc	a0,0x7
    80002930:	8d450513          	addi	a0,a0,-1836 # 80009200 <_ZN2IO5InputE>
    80002934:	00000097          	auipc	ra,0x0
    80002938:	fa4080e7          	jalr	-92(ra) # 800028d8 <_ZN8IOBuffer4initEv>
    Output.init();
    8000293c:	00007517          	auipc	a0,0x7
    80002940:	8e450513          	addi	a0,a0,-1820 # 80009220 <_ZN2IO6OutputE>
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
    800029b0:	00007517          	auipc	a0,0x7
    800029b4:	85050513          	addi	a0,a0,-1968 # 80009200 <_ZN2IO5InputE>
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
    80002a30:	00006517          	auipc	a0,0x6
    80002a34:	7f050513          	addi	a0,a0,2032 # 80009220 <_ZN2IO6OutputE>
    80002a38:	00000097          	auipc	ra,0x0
    80002a3c:	f98080e7          	jalr	-104(ra) # 800029d0 <_ZN8IOBuffer3putEc>
}
    80002a40:	01813083          	ld	ra,24(sp)
    80002a44:	01013403          	ld	s0,16(sp)
    80002a48:	00813483          	ld	s1,8(sp)
    80002a4c:	02010113          	addi	sp,sp,32
    80002a50:	00008067          	ret
        Output.put(8);
    80002a54:	00006497          	auipc	s1,0x6
    80002a58:	7cc48493          	addi	s1,s1,1996 # 80009220 <_ZN2IO6OutputE>
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
    80002c5c:	00000097          	auipc	ra,0x0
    80002c60:	3c0080e7          	jalr	960(ra) # 8000301c <_ZN9Allocator10_mem_allocEm>
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
    80002c84:	00000097          	auipc	ra,0x0
    80002c88:	454080e7          	jalr	1108(ra) # 800030d8 <_ZN9Allocator9_mem_freeEPKv>
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
    80002cc8:	00006797          	auipc	a5,0x6
    80002ccc:	5787b783          	ld	a5,1400(a5) # 80009240 <_ZN6Cradle4headE>
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
    80002ce8:	00006717          	auipc	a4,0x6
    80002cec:	55870713          	addi	a4,a4,1368 # 80009240 <_ZN6Cradle4headE>
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
    80002d2c:	00006797          	auipc	a5,0x6
    80002d30:	51478793          	addi	a5,a5,1300 # 80009240 <_ZN6Cradle4headE>
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
    80002db0:	00006797          	auipc	a5,0x6
    80002db4:	49078793          	addi	a5,a5,1168 # 80009240 <_ZN6Cradle4headE>
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
    80002dfc:	00006797          	auipc	a5,0x6
    80002e00:	44478793          	addi	a5,a5,1092 # 80009240 <_ZN6Cradle4headE>
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

0000000080002e38 <_ZN6Cradle6updateEv>:

void Cradle::update() {
    80002e38:	ff010113          	addi	sp,sp,-16
    80002e3c:	00813423          	sd	s0,8(sp)
    80002e40:	01010413          	addi	s0,sp,16
    if (!head)
    80002e44:	00006797          	auipc	a5,0x6
    80002e48:	3fc7b783          	ld	a5,1020(a5) # 80009240 <_ZN6Cradle4headE>
    80002e4c:	00078863          	beqz	a5,80002e5c <_ZN6Cradle6updateEv+0x24>
        return;
    head->time_left--;
    80002e50:	0087b703          	ld	a4,8(a5)
    80002e54:	fff70713          	addi	a4,a4,-1
    80002e58:	00e7b423          	sd	a4,8(a5)
}
    80002e5c:	00813403          	ld	s0,8(sp)
    80002e60:	01010113          	addi	sp,sp,16
    80002e64:	00008067          	ret

0000000080002e68 <_ZN6Cradle4peakEv>:

int Cradle::peak() {
    80002e68:	ff010113          	addi	sp,sp,-16
    80002e6c:	00813423          	sd	s0,8(sp)
    80002e70:	01010413          	addi	s0,sp,16
    if (head)
    80002e74:	00006797          	auipc	a5,0x6
    80002e78:	3cc7b783          	ld	a5,972(a5) # 80009240 <_ZN6Cradle4headE>
    80002e7c:	00078a63          	beqz	a5,80002e90 <_ZN6Cradle4peakEv+0x28>
        return head->time_left;
    80002e80:	0087a503          	lw	a0,8(a5)
    else
        return -1;
}
    80002e84:	00813403          	ld	s0,8(sp)
    80002e88:	01010113          	addi	sp,sp,16
    80002e8c:	00008067          	ret
        return -1;
    80002e90:	fff00513          	li	a0,-1
    80002e94:	ff1ff06f          	j	80002e84 <_ZN6Cradle4peakEv+0x1c>

0000000080002e98 <_ZN6Cradle8is_emptyEv>:

bool Cradle::is_empty() {
    80002e98:	ff010113          	addi	sp,sp,-16
    80002e9c:	00813423          	sd	s0,8(sp)
    80002ea0:	01010413          	addi	s0,sp,16
    return head == nullptr;
}
    80002ea4:	00006517          	auipc	a0,0x6
    80002ea8:	39c53503          	ld	a0,924(a0) # 80009240 <_ZN6Cradle4headE>
    80002eac:	00153513          	seqz	a0,a0
    80002eb0:	00813403          	ld	s0,8(sp)
    80002eb4:	01010113          	addi	sp,sp,16
    80002eb8:	00008067          	ret

0000000080002ebc <_ZN6Cradle11_time_sleepEm>:

int Cradle::_time_sleep(time_t ms) {
    80002ebc:	fe010113          	addi	sp,sp,-32
    80002ec0:	00113c23          	sd	ra,24(sp)
    80002ec4:	00813823          	sd	s0,16(sp)
    80002ec8:	00913423          	sd	s1,8(sp)
    80002ecc:	02010413          	addi	s0,sp,32
    80002ed0:	00050593          	mv	a1,a0
    insert(TCB::running, ms);
    80002ed4:	00006497          	auipc	s1,0x6
    80002ed8:	2c44b483          	ld	s1,708(s1) # 80009198 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002edc:	0004b503          	ld	a0,0(s1)
    80002ee0:	00000097          	auipc	ra,0x0
    80002ee4:	dbc080e7          	jalr	-580(ra) # 80002c9c <_ZN6Cradle6insertEP3TCBm>
    TCB::running->sleep();
    80002ee8:	0004b783          	ld	a5,0(s1)

    void sleep() { this->status = SLEEPING; }
    80002eec:	00200713          	li	a4,2
    80002ef0:	04e7a423          	sw	a4,72(a5)
    TCB::_thread_dispatch();
    80002ef4:	00002097          	auipc	ra,0x2
    80002ef8:	aa8080e7          	jalr	-1368(ra) # 8000499c <_ZN3TCB16_thread_dispatchEv>
    return 0;
}
    80002efc:	00000513          	li	a0,0
    80002f00:	01813083          	ld	ra,24(sp)
    80002f04:	01013403          	ld	s0,16(sp)
    80002f08:	00813483          	ld	s1,8(sp)
    80002f0c:	02010113          	addi	sp,sp,32
    80002f10:	00008067          	ret

0000000080002f14 <_ZN6Cradle12_thread_wakeEP3TCB>:
    bool is_sleeping() const { return this->status == SLEEPING; }
    80002f14:	04852703          	lw	a4,72(a0)

int Cradle::_thread_wake(thread_t thread) {
    if (!thread->is_sleeping())
    80002f18:	00200793          	li	a5,2
    80002f1c:	02f71e63          	bne	a4,a5,80002f58 <_ZN6Cradle12_thread_wakeEP3TCB+0x44>
int Cradle::_thread_wake(thread_t thread) {
    80002f20:	ff010113          	addi	sp,sp,-16
    80002f24:	00113423          	sd	ra,8(sp)
    80002f28:	00813023          	sd	s0,0(sp)
    80002f2c:	01010413          	addi	s0,sp,16
    void run() { this->status = RUNNABLE; }
    80002f30:	04052423          	sw	zero,72(a0)
        return -1;
    thread->run();
    Scheduler::put(thread);
    80002f34:	00001097          	auipc	ra,0x1
    80002f38:	2ac080e7          	jalr	684(ra) # 800041e0 <_ZN9Scheduler3putEP3TCB>
    TCB::_thread_dispatch();
    80002f3c:	00002097          	auipc	ra,0x2
    80002f40:	a60080e7          	jalr	-1440(ra) # 8000499c <_ZN3TCB16_thread_dispatchEv>
    return 0;
    80002f44:	00000513          	li	a0,0
}
    80002f48:	00813083          	ld	ra,8(sp)
    80002f4c:	00013403          	ld	s0,0(sp)
    80002f50:	01010113          	addi	sp,sp,16
    80002f54:	00008067          	ret
        return -1;
    80002f58:	fff00513          	li	a0,-1
}
    80002f5c:	00008067          	ret

0000000080002f60 <_Z8userMainv>:
    void periodicActivation() override {
        cout << "Hello from periodic thread!" << endl;
    }
};

int userMain() {
    80002f60:	ff010113          	addi	sp,sp,-16
    80002f64:	00113423          	sd	ra,8(sp)
    80002f68:	00813023          	sd	s0,0(sp)
    80002f6c:	01010413          	addi	s0,sp,16
    if(fork() == 0) {
    80002f70:	ffffe097          	auipc	ra,0xffffe
    80002f74:	768080e7          	jalr	1896(ra) # 800016d8 <_Z4forkv>
    80002f78:	02051863          	bnez	a0,80002fa8 <_Z8userMainv+0x48>
        cout << "child" << endl;
    80002f7c:	00004597          	auipc	a1,0x4
    80002f80:	0bc58593          	addi	a1,a1,188 # 80007038 <CONSOLE_STATUS+0x28>
    80002f84:	00006517          	auipc	a0,0x6
    80002f88:	23453503          	ld	a0,564(a0) # 800091b8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80002f8c:	00000097          	auipc	ra,0x0
    80002f90:	3dc080e7          	jalr	988(ra) # 80003368 <_ZNK3stm7istreamlsEPKc>
    80002f94:	00006597          	auipc	a1,0x6
    80002f98:	1f45b583          	ld	a1,500(a1) # 80009188 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002f9c:	00000097          	auipc	ra,0x0
    80002fa0:	584080e7          	jalr	1412(ra) # 80003520 <_ZNK3stm7istreamlsERKNS_7endlineE>
//    Pthread *pthread = new Pthread(10);
//    pthread->start();
//    time_sleep(100);
//    pthread->terminate();
//    pthread->join();
    while (true);
    80002fa4:	0000006f          	j	80002fa4 <_Z8userMainv+0x44>
        cout << "parent" << endl;
    80002fa8:	00004597          	auipc	a1,0x4
    80002fac:	09858593          	addi	a1,a1,152 # 80007040 <CONSOLE_STATUS+0x30>
    80002fb0:	00006517          	auipc	a0,0x6
    80002fb4:	20853503          	ld	a0,520(a0) # 800091b8 <_GLOBAL_OFFSET_TABLE_+0x90>
    80002fb8:	00000097          	auipc	ra,0x0
    80002fbc:	3b0080e7          	jalr	944(ra) # 80003368 <_ZNK3stm7istreamlsEPKc>
    80002fc0:	00006597          	auipc	a1,0x6
    80002fc4:	1c85b583          	ld	a1,456(a1) # 80009188 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002fc8:	00000097          	auipc	ra,0x0
    80002fcc:	558080e7          	jalr	1368(ra) # 80003520 <_ZNK3stm7istreamlsERKNS_7endlineE>
    80002fd0:	fd5ff06f          	j	80002fa4 <_Z8userMainv+0x44>

0000000080002fd4 <_ZN9Allocator8mem_initEv>:
#include "../h/c_memory.hpp"
#include "../h/iostream.hpp"

Allocator::MemoryBlock *Allocator::free_pointer = nullptr;

void Allocator::mem_init() {
    80002fd4:	ff010113          	addi	sp,sp,-16
    80002fd8:	00813423          	sd	s0,8(sp)
    80002fdc:	01010413          	addi	s0,sp,16
    Allocator::free_pointer = (Allocator::MemoryBlock *) HEAP_START_ADDR;
    80002fe0:	00006797          	auipc	a5,0x6
    80002fe4:	1787b783          	ld	a5,376(a5) # 80009158 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002fe8:	0007b703          	ld	a4,0(a5)
    80002fec:	00006797          	auipc	a5,0x6
    80002ff0:	26e7b223          	sd	a4,612(a5) # 80009250 <_ZN9Allocator12free_pointerE>
    *Allocator::free_pointer = {nullptr, reinterpret_cast<uint64>(HEAP_END_ADDR) -
    80002ff4:	00006797          	auipc	a5,0x6
    80002ff8:	1ac7b783          	ld	a5,428(a5) # 800091a0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002ffc:	0007b783          	ld	a5,0(a5)
    80003000:	40e787b3          	sub	a5,a5,a4
                                         reinterpret_cast<uint64>(HEAP_START_ADDR) - Allocator::HEADER_SIZE};
    80003004:	ff078793          	addi	a5,a5,-16
    *Allocator::free_pointer = {nullptr, reinterpret_cast<uint64>(HEAP_END_ADDR) -
    80003008:	00073023          	sd	zero,0(a4)
    8000300c:	00f73423          	sd	a5,8(a4)
}
    80003010:	00813403          	ld	s0,8(sp)
    80003014:	01010113          	addi	sp,sp,16
    80003018:	00008067          	ret

000000008000301c <_ZN9Allocator10_mem_allocEm>:

void *Allocator::_mem_alloc(size_t size) {
    8000301c:	ff010113          	addi	sp,sp,-16
    80003020:	00813423          	sd	s0,8(sp)
    80003024:	01010413          	addi	s0,sp,16
    80003028:	00050793          	mv	a5,a0
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    8000302c:	00006517          	auipc	a0,0x6
    80003030:	22453503          	ld	a0,548(a0) # 80009250 <_ZN9Allocator12free_pointerE>
    if (available && available->size < size) {
    80003034:	02050863          	beqz	a0,80003064 <_ZN9Allocator10_mem_allocEm+0x48>
    80003038:	00853703          	ld	a4,8(a0)
    8000303c:	02f77863          	bgeu	a4,a5,8000306c <_ZN9Allocator10_mem_allocEm+0x50>
        for (previous = available, available = available->next; available && available->size < size;
    80003040:	00050693          	mv	a3,a0
    80003044:	00053503          	ld	a0,0(a0)
    80003048:	00c0006f          	j	80003054 <_ZN9Allocator10_mem_allocEm+0x38>
             previous = available, available = available->next);
    8000304c:	00050693          	mv	a3,a0
    80003050:	00053503          	ld	a0,0(a0)
        for (previous = available, available = available->next; available && available->size < size;
    80003054:	00050e63          	beqz	a0,80003070 <_ZN9Allocator10_mem_allocEm+0x54>
    80003058:	00853703          	ld	a4,8(a0)
    8000305c:	fef768e3          	bltu	a4,a5,8000304c <_ZN9Allocator10_mem_allocEm+0x30>
    80003060:	0100006f          	j	80003070 <_ZN9Allocator10_mem_allocEm+0x54>
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    80003064:	00050693          	mv	a3,a0
    80003068:	0080006f          	j	80003070 <_ZN9Allocator10_mem_allocEm+0x54>
    8000306c:	00000693          	li	a3,0
    }
    if (!available) return nullptr;
    80003070:	04050463          	beqz	a0,800030b8 <_ZN9Allocator10_mem_allocEm+0x9c>
    if (available->size > Allocator::HEADER_SIZE + size) {
    80003074:	00853703          	ld	a4,8(a0)
    80003078:	01078613          	addi	a2,a5,16
    8000307c:	04e67463          	bgeu	a2,a4,800030c4 <_ZN9Allocator10_mem_allocEm+0xa8>
        uint64 next_size = available->size - size - Allocator::HEADER_SIZE;
    80003080:	40f70733          	sub	a4,a4,a5
    80003084:	ff070713          	addi	a4,a4,-16
        available->size = size;
    80003088:	00f53423          	sd	a5,8(a0)
        next_node = reinterpret_cast<Allocator::MemoryBlock *>(reinterpret_cast<uint64>(available) +
                                                               Allocator::HEADER_SIZE + size);
    8000308c:	00f507b3          	add	a5,a0,a5
    80003090:	01078613          	addi	a2,a5,16
        next_node->next = available->next;
    80003094:	00053583          	ld	a1,0(a0)
    80003098:	00b7b823          	sd	a1,16(a5)
        next_node->size = next_size;
    8000309c:	00e63423          	sd	a4,8(a2)
    } else {
        next_node = available->next;
    }
    available->next = reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(available) ^ available->size);
    800030a0:	00853783          	ld	a5,8(a0)
    800030a4:	00f547b3          	xor	a5,a0,a5
    800030a8:	00f53023          	sd	a5,0(a0)
    if (previous) previous->next = next_node;
    800030ac:	02068063          	beqz	a3,800030cc <_ZN9Allocator10_mem_allocEm+0xb0>
    800030b0:	00c6b023          	sd	a2,0(a3)
    else Allocator::free_pointer = next_node;
    return (void *) (available + 1);
    800030b4:	01050513          	addi	a0,a0,16
}
    800030b8:	00813403          	ld	s0,8(sp)
    800030bc:	01010113          	addi	sp,sp,16
    800030c0:	00008067          	ret
        next_node = available->next;
    800030c4:	00053603          	ld	a2,0(a0)
    800030c8:	fd9ff06f          	j	800030a0 <_ZN9Allocator10_mem_allocEm+0x84>
    else Allocator::free_pointer = next_node;
    800030cc:	00006797          	auipc	a5,0x6
    800030d0:	18c7b223          	sd	a2,388(a5) # 80009250 <_ZN9Allocator12free_pointerE>
    800030d4:	fe1ff06f          	j	800030b4 <_ZN9Allocator10_mem_allocEm+0x98>

00000000800030d8 <_ZN9Allocator9_mem_freeEPKv>:

int Allocator::_mem_free(const void *pointer) {
    800030d8:	ff010113          	addi	sp,sp,-16
    800030dc:	00813423          	sd	s0,8(sp)
    800030e0:	01010413          	addi	s0,sp,16
    Allocator::MemoryBlock *freed = (Allocator::MemoryBlock *) pointer - 1;
    800030e4:	ff050693          	addi	a3,a0,-16
    if (freed < HEAP_START_ADDR) return -1;
    800030e8:	00006797          	auipc	a5,0x6
    800030ec:	0707b783          	ld	a5,112(a5) # 80009158 <_GLOBAL_OFFSET_TABLE_+0x30>
    800030f0:	0007b783          	ld	a5,0(a5)
    800030f4:	0cf6ec63          	bltu	a3,a5,800031cc <_ZN9Allocator9_mem_freeEPKv+0xf4>
    if (freed->next != reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(freed) ^ freed->size)) return -2;
    800030f8:	ff053703          	ld	a4,-16(a0)
    800030fc:	ff853783          	ld	a5,-8(a0)
    80003100:	00068813          	mv	a6,a3
    80003104:	00d7c7b3          	xor	a5,a5,a3
    80003108:	0cf71663          	bne	a4,a5,800031d4 <_ZN9Allocator9_mem_freeEPKv+0xfc>
    Allocator::MemoryBlock *previous = Allocator::free_pointer, *next_node;
    8000310c:	00006717          	auipc	a4,0x6
    80003110:	14473703          	ld	a4,324(a4) # 80009250 <_ZN9Allocator12free_pointerE>
    if (freed < Allocator::free_pointer) {
    80003114:	04e6fe63          	bgeu	a3,a4,80003170 <_ZN9Allocator9_mem_freeEPKv+0x98>
        next_node = Allocator::free_pointer;
        Allocator::free_pointer = freed;
    80003118:	00006797          	auipc	a5,0x6
    8000311c:	12d7bc23          	sd	a3,312(a5) # 80009250 <_ZN9Allocator12free_pointerE>
        next_node = Allocator::free_pointer;
    80003120:	00070793          	mv	a5,a4
        previous = nullptr;
    80003124:	00000713          	li	a4,0
inline bool Allocator::adjacent(Allocator::MemoryBlock *block1, Allocator::MemoryBlock *block2) {
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
}

inline void Allocator::merge(MemoryBlock *block1, MemoryBlock *block2) {
    if (!block1) return;
    80003128:	00068e63          	beqz	a3,80003144 <_ZN9Allocator9_mem_freeEPKv+0x6c>
    if (block2 && Allocator::adjacent(block1, block2)) {
    8000312c:	00078a63          	beqz	a5,80003140 <_ZN9Allocator9_mem_freeEPKv+0x68>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    80003130:	ff853583          	ld	a1,-8(a0)
    80003134:	00b68633          	add	a2,a3,a1
    80003138:	01060613          	addi	a2,a2,16
    if (block2 && Allocator::adjacent(block1, block2)) {
    8000313c:	04f60a63          	beq	a2,a5,80003190 <_ZN9Allocator9_mem_freeEPKv+0xb8>
        block1->next = block2->next;
        block1->size += Allocator::HEADER_SIZE + block2->size;
    } else {
        block1->next = block2;
    80003140:	fef53823          	sd	a5,-16(a0)
    if (!block1) return;
    80003144:	08070c63          	beqz	a4,800031dc <_ZN9Allocator9_mem_freeEPKv+0x104>
    if (block2 && Allocator::adjacent(block1, block2)) {
    80003148:	00068a63          	beqz	a3,8000315c <_ZN9Allocator9_mem_freeEPKv+0x84>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    8000314c:	00873603          	ld	a2,8(a4)
    80003150:	00c707b3          	add	a5,a4,a2
    80003154:	01078793          	addi	a5,a5,16
    if (block2 && Allocator::adjacent(block1, block2)) {
    80003158:	04f80a63          	beq	a6,a5,800031ac <_ZN9Allocator9_mem_freeEPKv+0xd4>
        block1->next = block2;
    8000315c:	00d73023          	sd	a3,0(a4)
    return 0;
    80003160:	00000513          	li	a0,0
}
    80003164:	00813403          	ld	s0,8(sp)
    80003168:	01010113          	addi	sp,sp,16
    8000316c:	00008067          	ret
        for (next_node = previous->next; next_node && !(previous < freed && next_node > freed);
    80003170:	00073783          	ld	a5,0(a4)
    80003174:	00c0006f          	j	80003180 <_ZN9Allocator9_mem_freeEPKv+0xa8>
             previous = next_node, next_node = next_node->next);
    80003178:	00078713          	mv	a4,a5
    8000317c:	0007b783          	ld	a5,0(a5)
        for (next_node = previous->next; next_node && !(previous < freed && next_node > freed);
    80003180:	fa0784e3          	beqz	a5,80003128 <_ZN9Allocator9_mem_freeEPKv+0x50>
    80003184:	fed77ae3          	bgeu	a4,a3,80003178 <_ZN9Allocator9_mem_freeEPKv+0xa0>
    80003188:	fef6f8e3          	bgeu	a3,a5,80003178 <_ZN9Allocator9_mem_freeEPKv+0xa0>
    8000318c:	f9dff06f          	j	80003128 <_ZN9Allocator9_mem_freeEPKv+0x50>
        block1->next = block2->next;
    80003190:	0007b603          	ld	a2,0(a5)
    80003194:	fec53823          	sd	a2,-16(a0)
        block1->size += Allocator::HEADER_SIZE + block2->size;
    80003198:	0087b783          	ld	a5,8(a5)
    8000319c:	00f585b3          	add	a1,a1,a5
    800031a0:	01058593          	addi	a1,a1,16
    800031a4:	feb53c23          	sd	a1,-8(a0)
    800031a8:	f9dff06f          	j	80003144 <_ZN9Allocator9_mem_freeEPKv+0x6c>
        block1->next = block2->next;
    800031ac:	ff053783          	ld	a5,-16(a0)
    800031b0:	00f73023          	sd	a5,0(a4)
        block1->size += Allocator::HEADER_SIZE + block2->size;
    800031b4:	ff853783          	ld	a5,-8(a0)
    800031b8:	00f60633          	add	a2,a2,a5
    800031bc:	01060613          	addi	a2,a2,16
    800031c0:	00c73423          	sd	a2,8(a4)
    return 0;
    800031c4:	00000513          	li	a0,0
    800031c8:	f9dff06f          	j	80003164 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    if (freed < HEAP_START_ADDR) return -1;
    800031cc:	fff00513          	li	a0,-1
    800031d0:	f95ff06f          	j	80003164 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    if (freed->next != reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(freed) ^ freed->size)) return -2;
    800031d4:	ffe00513          	li	a0,-2
    800031d8:	f8dff06f          	j	80003164 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    return 0;
    800031dc:	00000513          	li	a0,0
    800031e0:	f85ff06f          	j	80003164 <_ZN9Allocator9_mem_freeEPKv+0x8c>

00000000800031e4 <_ZN9Allocator9mem_checkEv>:
    }
}

__attribute__((unused))
bool Allocator::mem_check() {
    800031e4:	ff010113          	addi	sp,sp,-16
    800031e8:	00813423          	sd	s0,8(sp)
    800031ec:	01010413          	addi	s0,sp,16
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    800031f0:	00006717          	auipc	a4,0x6
    800031f4:	06073703          	ld	a4,96(a4) # 80009250 <_ZN9Allocator12free_pointerE>
    800031f8:	00070793          	mv	a5,a4
    800031fc:	00073703          	ld	a4,0(a4)
    80003200:	00070e63          	beqz	a4,8000321c <_ZN9Allocator9mem_checkEv+0x38>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    80003204:	0087b683          	ld	a3,8(a5)
    80003208:	00d787b3          	add	a5,a5,a3
    8000320c:	01078793          	addi	a5,a5,16
        if (Allocator::adjacent(curr, curr->next)) return false;
    80003210:	fee794e3          	bne	a5,a4,800031f8 <_ZN9Allocator9mem_checkEv+0x14>
    80003214:	00000513          	li	a0,0
    80003218:	0080006f          	j	80003220 <_ZN9Allocator9mem_checkEv+0x3c>
    }
    return true;
    8000321c:	00100513          	li	a0,1
}
    80003220:	00813403          	ld	s0,8(sp)
    80003224:	01010113          	addi	sp,sp,16
    80003228:	00008067          	ret

000000008000322c <_ZN9Allocator8mem_showEv>:

__attribute__((unused))
void Allocator::mem_show() {
    8000322c:	fe010113          	addi	sp,sp,-32
    80003230:	00113c23          	sd	ra,24(sp)
    80003234:	00813823          	sd	s0,16(sp)
    80003238:	00913423          	sd	s1,8(sp)
    8000323c:	02010413          	addi	s0,sp,32
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    80003240:	00006497          	auipc	s1,0x6
    80003244:	0104b483          	ld	s1,16(s1) # 80009250 <_ZN9Allocator12free_pointerE>
    80003248:	0004b783          	ld	a5,0(s1)
    8000324c:	04078e63          	beqz	a5,800032a8 <_ZN9Allocator8mem_showEv+0x7c>
        stm::cout << curr << stm::endl << curr->next << stm::endl << stm::endl;
    80003250:	00048593          	mv	a1,s1
    80003254:	00006517          	auipc	a0,0x6
    80003258:	f6453503          	ld	a0,-156(a0) # 800091b8 <_GLOBAL_OFFSET_TABLE_+0x90>
    8000325c:	00000097          	auipc	ra,0x0
    80003260:	238080e7          	jalr	568(ra) # 80003494 <_ZNK3stm7istreamlsEPv>
    80003264:	00006597          	auipc	a1,0x6
    80003268:	f245b583          	ld	a1,-220(a1) # 80009188 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000326c:	00000097          	auipc	ra,0x0
    80003270:	2b4080e7          	jalr	692(ra) # 80003520 <_ZNK3stm7istreamlsERKNS_7endlineE>
    80003274:	0004b583          	ld	a1,0(s1)
    80003278:	00000097          	auipc	ra,0x0
    8000327c:	21c080e7          	jalr	540(ra) # 80003494 <_ZNK3stm7istreamlsEPv>
    80003280:	00006597          	auipc	a1,0x6
    80003284:	f085b583          	ld	a1,-248(a1) # 80009188 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003288:	00000097          	auipc	ra,0x0
    8000328c:	298080e7          	jalr	664(ra) # 80003520 <_ZNK3stm7istreamlsERKNS_7endlineE>
    80003290:	00006597          	auipc	a1,0x6
    80003294:	ef85b583          	ld	a1,-264(a1) # 80009188 <_GLOBAL_OFFSET_TABLE_+0x60>
    80003298:	00000097          	auipc	ra,0x0
    8000329c:	288080e7          	jalr	648(ra) # 80003520 <_ZNK3stm7istreamlsERKNS_7endlineE>
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    800032a0:	0004b483          	ld	s1,0(s1)
    800032a4:	fa5ff06f          	j	80003248 <_ZN9Allocator8mem_showEv+0x1c>
    }
}
    800032a8:	01813083          	ld	ra,24(sp)
    800032ac:	01013403          	ld	s0,16(sp)
    800032b0:	00813483          	ld	s1,8(sp)
    800032b4:	02010113          	addi	sp,sp,32
    800032b8:	00008067          	ret

00000000800032bc <_ZN9Allocator8mem_sizeEv>:

__attribute__((unused))
int Allocator::mem_size() {
    800032bc:	ff010113          	addi	sp,sp,-16
    800032c0:	00813423          	sd	s0,8(sp)
    800032c4:	01010413          	addi	s0,sp,16
    int i = 0;
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr; i += curr->size, curr = curr->next);
    800032c8:	00006797          	auipc	a5,0x6
    800032cc:	f887b783          	ld	a5,-120(a5) # 80009250 <_ZN9Allocator12free_pointerE>
    int i = 0;
    800032d0:	00000513          	li	a0,0
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr; i += curr->size, curr = curr->next);
    800032d4:	00078a63          	beqz	a5,800032e8 <_ZN9Allocator8mem_sizeEv+0x2c>
    800032d8:	0087b703          	ld	a4,8(a5)
    800032dc:	00a7053b          	addw	a0,a4,a0
    800032e0:	0007b783          	ld	a5,0(a5)
    800032e4:	ff1ff06f          	j	800032d4 <_ZN9Allocator8mem_sizeEv+0x18>
    return i;
}
    800032e8:	00813403          	ld	s0,8(sp)
    800032ec:	01010113          	addi	sp,sp,16
    800032f0:	00008067          	ret

00000000800032f4 <_Z6memcpyPKvS0_i>:

void memcpy(const void *src, const void *dst, int len) {
    800032f4:	ff010113          	addi	sp,sp,-16
    800032f8:	00813423          	sd	s0,8(sp)
    800032fc:	01010413          	addi	s0,sp,16
    char *src1 = (char *) src;
    char *dst1 = (char *) dst;
    for (int i = 0; i < len; i++)
    80003300:	00000793          	li	a5,0
    80003304:	00c7de63          	bge	a5,a2,80003320 <_Z6memcpyPKvS0_i+0x2c>
        dst1[i] = src1[i];
    80003308:	00f58733          	add	a4,a1,a5
    8000330c:	00f506b3          	add	a3,a0,a5
    80003310:	0006c683          	lbu	a3,0(a3)
    80003314:	00d70023          	sb	a3,0(a4)
    for (int i = 0; i < len; i++)
    80003318:	0017879b          	addiw	a5,a5,1
    8000331c:	fe9ff06f          	j	80003304 <_Z6memcpyPKvS0_i+0x10>
    80003320:	00813403          	ld	s0,8(sp)
    80003324:	01010113          	addi	sp,sp,16
    80003328:	00008067          	ret

000000008000332c <_ZNK3stm7istreamlsEc>:
#include "../h/string.hpp"

const stm::istream stm::cout;
const stm::endline stm::endl;

const stm::istream &stm::istream::operator<<(const char c) const {
    8000332c:	fe010113          	addi	sp,sp,-32
    80003330:	00113c23          	sd	ra,24(sp)
    80003334:	00813823          	sd	s0,16(sp)
    80003338:	00913423          	sd	s1,8(sp)
    8000333c:	02010413          	addi	s0,sp,32
    80003340:	00050493          	mv	s1,a0
    putc(c);
    80003344:	00058513          	mv	a0,a1
    80003348:	ffffe097          	auipc	ra,0xffffe
    8000334c:	660080e7          	jalr	1632(ra) # 800019a8 <_Z4putcc>
    return *this;
}
    80003350:	00048513          	mv	a0,s1
    80003354:	01813083          	ld	ra,24(sp)
    80003358:	01013403          	ld	s0,16(sp)
    8000335c:	00813483          	ld	s1,8(sp)
    80003360:	02010113          	addi	sp,sp,32
    80003364:	00008067          	ret

0000000080003368 <_ZNK3stm7istreamlsEPKc>:

const stm::istream &stm::istream::operator<<(const char *string) const {
    80003368:	fe010113          	addi	sp,sp,-32
    8000336c:	00113c23          	sd	ra,24(sp)
    80003370:	00813823          	sd	s0,16(sp)
    80003374:	00913423          	sd	s1,8(sp)
    80003378:	02010413          	addi	s0,sp,32
    8000337c:	00050493          	mv	s1,a0
    print(string);
    80003380:	00058513          	mv	a0,a1
    80003384:	fffff097          	auipc	ra,0xfffff
    80003388:	340080e7          	jalr	832(ra) # 800026c4 <_Z5printPKc>
    return *this;
}
    8000338c:	00048513          	mv	a0,s1
    80003390:	01813083          	ld	ra,24(sp)
    80003394:	01013403          	ld	s0,16(sp)
    80003398:	00813483          	ld	s1,8(sp)
    8000339c:	02010113          	addi	sp,sp,32
    800033a0:	00008067          	ret

00000000800033a4 <_ZNK3stm7istreamlsERKNS_6stringE>:

const stm::istream &stm::istream::operator<<(const stm::string &string) const {
    800033a4:	fe010113          	addi	sp,sp,-32
    800033a8:	00113c23          	sd	ra,24(sp)
    800033ac:	00813823          	sd	s0,16(sp)
    800033b0:	00913423          	sd	s1,8(sp)
    800033b4:	02010413          	addi	s0,sp,32
    800033b8:	00050493          	mv	s1,a0
    print(string.actual_string);
    800033bc:	0085b503          	ld	a0,8(a1)
    800033c0:	fffff097          	auipc	ra,0xfffff
    800033c4:	304080e7          	jalr	772(ra) # 800026c4 <_Z5printPKc>
    return *this;
}
    800033c8:	00048513          	mv	a0,s1
    800033cc:	01813083          	ld	ra,24(sp)
    800033d0:	01013403          	ld	s0,16(sp)
    800033d4:	00813483          	ld	s1,8(sp)
    800033d8:	02010113          	addi	sp,sp,32
    800033dc:	00008067          	ret

00000000800033e0 <_ZNK3stm7istreamlsEx>:

const stm::istream &stm::istream::operator<<(long long number) const {
    800033e0:	fe010113          	addi	sp,sp,-32
    800033e4:	00113c23          	sd	ra,24(sp)
    800033e8:	00813823          	sd	s0,16(sp)
    800033ec:	00913423          	sd	s1,8(sp)
    800033f0:	02010413          	addi	s0,sp,32
    800033f4:	00050493          	mv	s1,a0
    print(number);
    800033f8:	00058513          	mv	a0,a1
    800033fc:	fffff097          	auipc	ra,0xfffff
    80003400:	3dc080e7          	jalr	988(ra) # 800027d8 <_Z5printx>
    return *this;
}
    80003404:	00048513          	mv	a0,s1
    80003408:	01813083          	ld	ra,24(sp)
    8000340c:	01013403          	ld	s0,16(sp)
    80003410:	00813483          	ld	s1,8(sp)
    80003414:	02010113          	addi	sp,sp,32
    80003418:	00008067          	ret

000000008000341c <_ZNK3stm7istreamlsEi>:

const stm::istream &stm::istream::operator<<(int number) const {
    8000341c:	fe010113          	addi	sp,sp,-32
    80003420:	00113c23          	sd	ra,24(sp)
    80003424:	00813823          	sd	s0,16(sp)
    80003428:	00913423          	sd	s1,8(sp)
    8000342c:	02010413          	addi	s0,sp,32
    80003430:	00050493          	mv	s1,a0
    print(number);
    80003434:	00058513          	mv	a0,a1
    80003438:	fffff097          	auipc	ra,0xfffff
    8000343c:	3e8080e7          	jalr	1000(ra) # 80002820 <_Z5printi>
    return *this;
}
    80003440:	00048513          	mv	a0,s1
    80003444:	01813083          	ld	ra,24(sp)
    80003448:	01013403          	ld	s0,16(sp)
    8000344c:	00813483          	ld	s1,8(sp)
    80003450:	02010113          	addi	sp,sp,32
    80003454:	00008067          	ret

0000000080003458 <_ZNK3stm7istreamlsEm>:

const stm::istream &stm::istream::operator<<(uint64 number) const {
    80003458:	fe010113          	addi	sp,sp,-32
    8000345c:	00113c23          	sd	ra,24(sp)
    80003460:	00813823          	sd	s0,16(sp)
    80003464:	00913423          	sd	s1,8(sp)
    80003468:	02010413          	addi	s0,sp,32
    8000346c:	00050493          	mv	s1,a0
    print(number);
    80003470:	00058513          	mv	a0,a1
    80003474:	fffff097          	auipc	ra,0xfffff
    80003478:	3d4080e7          	jalr	980(ra) # 80002848 <_Z5printm>
    return *this;
}
    8000347c:	00048513          	mv	a0,s1
    80003480:	01813083          	ld	ra,24(sp)
    80003484:	01013403          	ld	s0,16(sp)
    80003488:	00813483          	ld	s1,8(sp)
    8000348c:	02010113          	addi	sp,sp,32
    80003490:	00008067          	ret

0000000080003494 <_ZNK3stm7istreamlsEPv>:

const stm::istream &stm::istream::operator<<(void *pointer) const {
    80003494:	fe010113          	addi	sp,sp,-32
    80003498:	00113c23          	sd	ra,24(sp)
    8000349c:	00813823          	sd	s0,16(sp)
    800034a0:	00913423          	sd	s1,8(sp)
    800034a4:	02010413          	addi	s0,sp,32
    800034a8:	00050493          	mv	s1,a0
    print_h((uint64) pointer);
    800034ac:	00058513          	mv	a0,a1
    800034b0:	fffff097          	auipc	ra,0xfffff
    800034b4:	3e0080e7          	jalr	992(ra) # 80002890 <_Z7print_hm>
    return *this;
}
    800034b8:	00048513          	mv	a0,s1
    800034bc:	01813083          	ld	ra,24(sp)
    800034c0:	01013403          	ld	s0,16(sp)
    800034c4:	00813483          	ld	s1,8(sp)
    800034c8:	02010113          	addi	sp,sp,32
    800034cc:	00008067          	ret

00000000800034d0 <_ZNK3stm7istreamlsEb>:

const stm::istream &stm::istream::operator<<(bool truth) const {
    800034d0:	fe010113          	addi	sp,sp,-32
    800034d4:	00113c23          	sd	ra,24(sp)
    800034d8:	00813823          	sd	s0,16(sp)
    800034dc:	00913423          	sd	s1,8(sp)
    800034e0:	02010413          	addi	s0,sp,32
    800034e4:	00050493          	mv	s1,a0
    print(truth ? "true" : "false");
    800034e8:	02058663          	beqz	a1,80003514 <_ZNK3stm7istreamlsEb+0x44>
    800034ec:	00004517          	auipc	a0,0x4
    800034f0:	b6450513          	addi	a0,a0,-1180 # 80007050 <CONSOLE_STATUS+0x40>
    800034f4:	fffff097          	auipc	ra,0xfffff
    800034f8:	1d0080e7          	jalr	464(ra) # 800026c4 <_Z5printPKc>
    return *this;
}
    800034fc:	00048513          	mv	a0,s1
    80003500:	01813083          	ld	ra,24(sp)
    80003504:	01013403          	ld	s0,16(sp)
    80003508:	00813483          	ld	s1,8(sp)
    8000350c:	02010113          	addi	sp,sp,32
    80003510:	00008067          	ret
    print(truth ? "true" : "false");
    80003514:	00004517          	auipc	a0,0x4
    80003518:	b3450513          	addi	a0,a0,-1228 # 80007048 <CONSOLE_STATUS+0x38>
    8000351c:	fd9ff06f          	j	800034f4 <_ZNK3stm7istreamlsEb+0x24>

0000000080003520 <_ZNK3stm7istreamlsERKNS_7endlineE>:

const stm::istream &stm::istream::operator<<(const stm::endline &) const {
    80003520:	fe010113          	addi	sp,sp,-32
    80003524:	00113c23          	sd	ra,24(sp)
    80003528:	00813823          	sd	s0,16(sp)
    8000352c:	00913423          	sd	s1,8(sp)
    80003530:	02010413          	addi	s0,sp,32
    80003534:	00050493          	mv	s1,a0
    putc('\n');
    80003538:	00a00513          	li	a0,10
    8000353c:	ffffe097          	auipc	ra,0xffffe
    80003540:	46c080e7          	jalr	1132(ra) # 800019a8 <_Z4putcc>
    return *this;
}
    80003544:	00048513          	mv	a0,s1
    80003548:	01813083          	ld	ra,24(sp)
    8000354c:	01013403          	ld	s0,16(sp)
    80003550:	00813483          	ld	s1,8(sp)
    80003554:	02010113          	addi	sp,sp,32
    80003558:	00008067          	ret

000000008000355c <_Z9bleya_nitPv>:
#include "../h/cpp_semaphores.hpp"
#include "../h/scheduler.hpp"
#include "../h/iostream.hpp"

[[noreturn]]
void bleya_nit(void *) {
    8000355c:	ff010113          	addi	sp,sp,-16
    80003560:	00813423          	sd	s0,8(sp)
    80003564:	01010413          	addi	s0,sp,16
    while (true) {
    80003568:	0000006f          	j	80003568 <_Z9bleya_nitPv+0xc>

000000008000356c <_Z11userWrapperPv>:
    thread_create(&handle_main, nullptr, nullptr);
    thread_create(&handle_bleya, &bleya_nit, nullptr);
    riscv::ms_sstatus(riscv::SSTATUS_SIE);
}

void userWrapper(void *ret) {
    8000356c:	fe010113          	addi	sp,sp,-32
    80003570:	00113c23          	sd	ra,24(sp)
    80003574:	00813823          	sd	s0,16(sp)
    80003578:	00913423          	sd	s1,8(sp)
    8000357c:	02010413          	addi	s0,sp,32
    80003580:	00050493          	mv	s1,a0
    *((int *) ret) = userMain();
    80003584:	00000097          	auipc	ra,0x0
    80003588:	9dc080e7          	jalr	-1572(ra) # 80002f60 <_Z8userMainv>
    8000358c:	00a4a023          	sw	a0,0(s1)
}
    80003590:	01813083          	ld	ra,24(sp)
    80003594:	01013403          	ld	s0,16(sp)
    80003598:	00813483          	ld	s1,8(sp)
    8000359c:	02010113          	addi	sp,sp,32
    800035a0:	00008067          	ret

00000000800035a4 <_Z4callv>:

int call() {
    800035a4:	fe010113          	addi	sp,sp,-32
    800035a8:	00113c23          	sd	ra,24(sp)
    800035ac:	00813823          	sd	s0,16(sp)
    800035b0:	02010413          	addi	s0,sp,32
    thread_t userHandle;
    int ret;
    thread_create(&userHandle, userWrapper, &ret);
    800035b4:	fe440613          	addi	a2,s0,-28
    800035b8:	00000597          	auipc	a1,0x0
    800035bc:	fb458593          	addi	a1,a1,-76 # 8000356c <_Z11userWrapperPv>
    800035c0:	fe840513          	addi	a0,s0,-24
    800035c4:	ffffe097          	auipc	ra,0xffffe
    800035c8:	f7c080e7          	jalr	-132(ra) # 80001540 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_join(userHandle);
    800035cc:	fe843503          	ld	a0,-24(s0)
    800035d0:	ffffe097          	auipc	ra,0xffffe
    800035d4:	068080e7          	jalr	104(ra) # 80001638 <_Z11thread_joinP3TCB>
    return ret;
}
    800035d8:	fe442503          	lw	a0,-28(s0)
    800035dc:	01813083          	ld	ra,24(sp)
    800035e0:	01013403          	ld	s0,16(sp)
    800035e4:	02010113          	addi	sp,sp,32
    800035e8:	00008067          	ret

00000000800035ec <_Z3endi>:

int end(int ret) {
    800035ec:	fe010113          	addi	sp,sp,-32
    800035f0:	00113c23          	sd	ra,24(sp)
    800035f4:	00813823          	sd	s0,16(sp)
    800035f8:	00913423          	sd	s1,8(sp)
    800035fc:	02010413          	addi	s0,sp,32
    80003600:	00050493          	mv	s1,a0
    print("\n\nProcess finished with exit code ");
    80003604:	00004517          	auipc	a0,0x4
    80003608:	a6450513          	addi	a0,a0,-1436 # 80007068 <_ZN3stm4coutE+0x8>
    8000360c:	fffff097          	auipc	ra,0xfffff
    80003610:	0b8080e7          	jalr	184(ra) # 800026c4 <_Z5printPKc>
    print(ret);
    80003614:	00048513          	mv	a0,s1
    80003618:	fffff097          	auipc	ra,0xfffff
    8000361c:	208080e7          	jalr	520(ra) # 80002820 <_Z5printi>
    print("\n\n");
    80003620:	00004517          	auipc	a0,0x4
    80003624:	a7050513          	addi	a0,a0,-1424 # 80007090 <_ZN3stm4coutE+0x30>
    80003628:	fffff097          	auipc	ra,0xfffff
    8000362c:	09c080e7          	jalr	156(ra) # 800026c4 <_Z5printPKc>
        inline bool is_empty() const { return this->size == 0; }
    80003630:	00006797          	auipc	a5,0x6
    80003634:	b087b783          	ld	a5,-1272(a5) # 80009138 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003638:	0107a783          	lw	a5,16(a5)
    while (!IO::Output.is_empty());
    8000363c:	fe079ae3          	bnez	a5,80003630 <_Z3endi+0x44>
    time_sleep(10);
    80003640:	00a00513          	li	a0,10
    80003644:	ffffe097          	auipc	ra,0xffffe
    80003648:	298080e7          	jalr	664(ra) # 800018dc <_Z10time_sleepm>
    return 0;
}
    8000364c:	00000513          	li	a0,0
    80003650:	01813083          	ld	ra,24(sp)
    80003654:	01013403          	ld	s0,16(sp)
    80003658:	00813483          	ld	s1,8(sp)
    8000365c:	02010113          	addi	sp,sp,32
    80003660:	00008067          	ret

0000000080003664 <main>:

int main() {
    80003664:	ff010113          	addi	sp,sp,-16
    80003668:	00113423          	sd	ra,8(sp)
    8000366c:	00813023          	sd	s0,0(sp)
    80003670:	01010413          	addi	s0,sp,16
    init();
    80003674:	00000097          	auipc	ra,0x0
    80003678:	028080e7          	jalr	40(ra) # 8000369c <_Z4initv>
    int ret = call();
    8000367c:	00000097          	auipc	ra,0x0
    80003680:	f28080e7          	jalr	-216(ra) # 800035a4 <_Z4callv>
    return end(ret);
    80003684:	00000097          	auipc	ra,0x0
    80003688:	f68080e7          	jalr	-152(ra) # 800035ec <_Z3endi>
    8000368c:	00813083          	ld	ra,8(sp)
    80003690:	00013403          	ld	s0,0(sp)
    80003694:	01010113          	addi	sp,sp,16
    80003698:	00008067          	ret

000000008000369c <_Z4initv>:
inline void init() {
    8000369c:	fd010113          	addi	sp,sp,-48
    800036a0:	02113423          	sd	ra,40(sp)
    800036a4:	02813023          	sd	s0,32(sp)
    800036a8:	00913c23          	sd	s1,24(sp)
    800036ac:	01213823          	sd	s2,16(sp)
    800036b0:	03010413          	addi	s0,sp,48
    __asm__ volatile("mv t0, %0": : "r" (&supervisorTrap));
    800036b4:	00006797          	auipc	a5,0x6
    800036b8:	aac7b783          	ld	a5,-1364(a5) # 80009160 <_GLOBAL_OFFSET_TABLE_+0x38>
    800036bc:	00078293          	mv	t0,a5
    __asm__ volatile("addi t0, t0, 1");
    800036c0:	00128293          	addi	t0,t0,1
    __asm__ volatile("csrw stvec, t0");
    800036c4:	10529073          	csrw	stvec,t0
    Allocator::mem_init();
    800036c8:	00000097          	auipc	ra,0x0
    800036cc:	90c080e7          	jalr	-1780(ra) # 80002fd4 <_ZN9Allocator8mem_initEv>
    IO::init();
    800036d0:	fffff097          	auipc	ra,0xfffff
    800036d4:	24c080e7          	jalr	588(ra) # 8000291c <_ZN2IO4initEv>
#include "syscall_c.hpp"

class Scheduler final {
public:

    static void init() { high_priority.init(); mid_priority.init(); low_priority.init(); }
    800036d8:	00006517          	auipc	a0,0x6
    800036dc:	ad853503          	ld	a0,-1320(a0) # 800091b0 <_GLOBAL_OFFSET_TABLE_+0x88>
    800036e0:	fffff097          	auipc	ra,0xfffff
    800036e4:	dec080e7          	jalr	-532(ra) # 800024cc <_ZN3stm14CircularBufferIP3TCBE4initEv>
    800036e8:	00006517          	auipc	a0,0x6
    800036ec:	aa853503          	ld	a0,-1368(a0) # 80009190 <_GLOBAL_OFFSET_TABLE_+0x68>
    800036f0:	fffff097          	auipc	ra,0xfffff
    800036f4:	ddc080e7          	jalr	-548(ra) # 800024cc <_ZN3stm14CircularBufferIP3TCBE4initEv>
    800036f8:	00006517          	auipc	a0,0x6
    800036fc:	a7053503          	ld	a0,-1424(a0) # 80009168 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003700:	fffff097          	auipc	ra,0xfffff
    80003704:	dcc080e7          	jalr	-564(ra) # 800024cc <_ZN3stm14CircularBufferIP3TCBE4initEv>
    printer = new OwnedMutex();
    80003708:	02000513          	li	a0,32
    8000370c:	00000097          	auipc	ra,0x0
    80003710:	158080e7          	jalr	344(ra) # 80003864 <_Znwm>
    80003714:	00050493          	mv	s1,a0
    80003718:	00001097          	auipc	ra,0x1
    8000371c:	d0c080e7          	jalr	-756(ra) # 80004424 <_ZN10OwnedMutexC1Ev>
    80003720:	00006797          	auipc	a5,0x6
    80003724:	b297bc23          	sd	s1,-1224(a5) # 80009258 <printer>
    thread_create(&handle_main, nullptr, nullptr);
    80003728:	00000613          	li	a2,0
    8000372c:	00000593          	li	a1,0
    80003730:	fd840513          	addi	a0,s0,-40
    80003734:	ffffe097          	auipc	ra,0xffffe
    80003738:	e0c080e7          	jalr	-500(ra) # 80001540 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&handle_bleya, &bleya_nit, nullptr);
    8000373c:	00000613          	li	a2,0
    80003740:	00000597          	auipc	a1,0x0
    80003744:	e1c58593          	addi	a1,a1,-484 # 8000355c <_Z9bleya_nitPv>
    80003748:	00006517          	auipc	a0,0x6
    8000374c:	b1850513          	addi	a0,a0,-1256 # 80009260 <handle_bleya>
    80003750:	ffffe097          	auipc	ra,0xffffe
    80003754:	df0080e7          	jalr	-528(ra) # 80001540 <_Z13thread_createPP3TCBPFvPvES2_>
inline void riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80003758:	00200793          	li	a5,2
    8000375c:	1007a073          	csrs	sstatus,a5
}
    80003760:	02813083          	ld	ra,40(sp)
    80003764:	02013403          	ld	s0,32(sp)
    80003768:	01813483          	ld	s1,24(sp)
    8000376c:	01013903          	ld	s2,16(sp)
    80003770:	03010113          	addi	sp,sp,48
    80003774:	00008067          	ret
    80003778:	00050913          	mv	s2,a0
    printer = new OwnedMutex();
    8000377c:	00048513          	mv	a0,s1
    80003780:	00000097          	auipc	ra,0x0
    80003784:	134080e7          	jalr	308(ra) # 800038b4 <_ZdlPv>
    80003788:	00090513          	mv	a0,s2
    8000378c:	00007097          	auipc	ra,0x7
    80003790:	c0c080e7          	jalr	-1012(ra) # 8000a398 <_Unwind_Resume>

0000000080003794 <_ZN6Thread11threadStartEPv>:
Thread::Thread() {
    this->body = nullptr;
    this->arg = nullptr;
}

void Thread::threadStart(void *arg) {
    80003794:	ff010113          	addi	sp,sp,-16
    80003798:	00113423          	sd	ra,8(sp)
    8000379c:	00813023          	sd	s0,0(sp)
    800037a0:	01010413          	addi	s0,sp,16
    Thread *thread = (Thread *) arg;
    if (thread->body) {
    800037a4:	01053783          	ld	a5,16(a0)
    800037a8:	00078e63          	beqz	a5,800037c4 <_ZN6Thread11threadStartEPv+0x30>
        thread->body(thread->arg);
    800037ac:	01853503          	ld	a0,24(a0)
    800037b0:	000780e7          	jalr	a5
    } else {
        thread->run();
    }
}
    800037b4:	00813083          	ld	ra,8(sp)
    800037b8:	00013403          	ld	s0,0(sp)
    800037bc:	01010113          	addi	sp,sp,16
    800037c0:	00008067          	ret
        thread->run();
    800037c4:	00053783          	ld	a5,0(a0)
    800037c8:	0107b783          	ld	a5,16(a5)
    800037cc:	000780e7          	jalr	a5
}
    800037d0:	fe5ff06f          	j	800037b4 <_ZN6Thread11threadStartEPv+0x20>

00000000800037d4 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800037d4:	ff010113          	addi	sp,sp,-16
    800037d8:	00113423          	sd	ra,8(sp)
    800037dc:	00813023          	sd	s0,0(sp)
    800037e0:	01010413          	addi	s0,sp,16
    800037e4:	00005797          	auipc	a5,0x5
    800037e8:	7fc78793          	addi	a5,a5,2044 # 80008fe0 <_ZTV9Semaphore+0x10>
    800037ec:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800037f0:	00853503          	ld	a0,8(a0)
    800037f4:	ffffe097          	auipc	ra,0xffffe
    800037f8:	fa8080e7          	jalr	-88(ra) # 8000179c <_Z9sem_closeP3Sem>
}
    800037fc:	00813083          	ld	ra,8(sp)
    80003800:	00013403          	ld	s0,0(sp)
    80003804:	01010113          	addi	sp,sp,16
    80003808:	00008067          	ret

000000008000380c <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    8000380c:	ff010113          	addi	sp,sp,-16
    80003810:	00113423          	sd	ra,8(sp)
    80003814:	00813023          	sd	s0,0(sp)
    80003818:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    8000381c:	00853503          	ld	a0,8(a0)
    80003820:	ffffe097          	auipc	ra,0xffffe
    80003824:	fbc080e7          	jalr	-68(ra) # 800017dc <_Z8sem_waitP3Sem>
}
    80003828:	00813083          	ld	ra,8(sp)
    8000382c:	00013403          	ld	s0,0(sp)
    80003830:	01010113          	addi	sp,sp,16
    80003834:	00008067          	ret

0000000080003838 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80003838:	ff010113          	addi	sp,sp,-16
    8000383c:	00113423          	sd	ra,8(sp)
    80003840:	00813023          	sd	s0,0(sp)
    80003844:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80003848:	00853503          	ld	a0,8(a0)
    8000384c:	ffffe097          	auipc	ra,0xffffe
    80003850:	fd0080e7          	jalr	-48(ra) # 8000181c <_Z10sem_signalP3Sem>
}
    80003854:	00813083          	ld	ra,8(sp)
    80003858:	00013403          	ld	s0,0(sp)
    8000385c:	01010113          	addi	sp,sp,16
    80003860:	00008067          	ret

0000000080003864 <_Znwm>:
void *operator new(size_t size) {
    80003864:	ff010113          	addi	sp,sp,-16
    80003868:	00113423          	sd	ra,8(sp)
    8000386c:	00813023          	sd	s0,0(sp)
    80003870:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003874:	ffffe097          	auipc	ra,0xffffe
    80003878:	c44080e7          	jalr	-956(ra) # 800014b8 <_Z9mem_allocm>
}
    8000387c:	00813083          	ld	ra,8(sp)
    80003880:	00013403          	ld	s0,0(sp)
    80003884:	01010113          	addi	sp,sp,16
    80003888:	00008067          	ret

000000008000388c <_Znam>:
void *operator new[](size_t size) {
    8000388c:	ff010113          	addi	sp,sp,-16
    80003890:	00113423          	sd	ra,8(sp)
    80003894:	00813023          	sd	s0,0(sp)
    80003898:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    8000389c:	ffffe097          	auipc	ra,0xffffe
    800038a0:	c1c080e7          	jalr	-996(ra) # 800014b8 <_Z9mem_allocm>
}
    800038a4:	00813083          	ld	ra,8(sp)
    800038a8:	00013403          	ld	s0,0(sp)
    800038ac:	01010113          	addi	sp,sp,16
    800038b0:	00008067          	ret

00000000800038b4 <_ZdlPv>:
void operator delete(void *mem) {
    800038b4:	ff010113          	addi	sp,sp,-16
    800038b8:	00113423          	sd	ra,8(sp)
    800038bc:	00813023          	sd	s0,0(sp)
    800038c0:	01010413          	addi	s0,sp,16
    mem_free(mem);
    800038c4:	ffffe097          	auipc	ra,0xffffe
    800038c8:	c3c080e7          	jalr	-964(ra) # 80001500 <_Z8mem_freePv>
}
    800038cc:	00813083          	ld	ra,8(sp)
    800038d0:	00013403          	ld	s0,0(sp)
    800038d4:	01010113          	addi	sp,sp,16
    800038d8:	00008067          	ret

00000000800038dc <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800038dc:	00005797          	auipc	a5,0x5
    800038e0:	6dc78793          	addi	a5,a5,1756 # 80008fb8 <_ZTV6Thread+0x10>
    800038e4:	00f53023          	sd	a5,0(a0)
    if (myHandle->is_finished())
    800038e8:	00853503          	ld	a0,8(a0)
    bool is_finished() const { return this->status == FINISHED; }
    800038ec:	04852703          	lw	a4,72(a0)
    800038f0:	00400793          	li	a5,4
    800038f4:	00f70463          	beq	a4,a5,800038fc <_ZN6ThreadD1Ev+0x20>
    800038f8:	00008067          	ret
        delete myHandle;
    800038fc:	fe050ee3          	beqz	a0,800038f8 <_ZN6ThreadD1Ev+0x1c>
Thread::~Thread() {
    80003900:	ff010113          	addi	sp,sp,-16
    80003904:	00113423          	sd	ra,8(sp)
    80003908:	00813023          	sd	s0,0(sp)
    8000390c:	01010413          	addi	s0,sp,16
        delete myHandle;
    80003910:	00000097          	auipc	ra,0x0
    80003914:	fa4080e7          	jalr	-92(ra) # 800038b4 <_ZdlPv>
}
    80003918:	00813083          	ld	ra,8(sp)
    8000391c:	00013403          	ld	s0,0(sp)
    80003920:	01010113          	addi	sp,sp,16
    80003924:	00008067          	ret

0000000080003928 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80003928:	fe010113          	addi	sp,sp,-32
    8000392c:	00113c23          	sd	ra,24(sp)
    80003930:	00813823          	sd	s0,16(sp)
    80003934:	00913423          	sd	s1,8(sp)
    80003938:	02010413          	addi	s0,sp,32
    8000393c:	00050493          	mv	s1,a0
}
    80003940:	00000097          	auipc	ra,0x0
    80003944:	f9c080e7          	jalr	-100(ra) # 800038dc <_ZN6ThreadD1Ev>
    80003948:	00048513          	mv	a0,s1
    8000394c:	00000097          	auipc	ra,0x0
    80003950:	f68080e7          	jalr	-152(ra) # 800038b4 <_ZdlPv>
    80003954:	01813083          	ld	ra,24(sp)
    80003958:	01013403          	ld	s0,16(sp)
    8000395c:	00813483          	ld	s1,8(sp)
    80003960:	02010113          	addi	sp,sp,32
    80003964:	00008067          	ret

0000000080003968 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80003968:	fe010113          	addi	sp,sp,-32
    8000396c:	00113c23          	sd	ra,24(sp)
    80003970:	00813823          	sd	s0,16(sp)
    80003974:	00913423          	sd	s1,8(sp)
    80003978:	02010413          	addi	s0,sp,32
    8000397c:	00050493          	mv	s1,a0
}
    80003980:	00000097          	auipc	ra,0x0
    80003984:	e54080e7          	jalr	-428(ra) # 800037d4 <_ZN9SemaphoreD1Ev>
    80003988:	00048513          	mv	a0,s1
    8000398c:	00000097          	auipc	ra,0x0
    80003990:	f28080e7          	jalr	-216(ra) # 800038b4 <_ZdlPv>
    80003994:	01813083          	ld	ra,24(sp)
    80003998:	01013403          	ld	s0,16(sp)
    8000399c:	00813483          	ld	s1,8(sp)
    800039a0:	02010113          	addi	sp,sp,32
    800039a4:	00008067          	ret

00000000800039a8 <_ZdaPv>:
void operator delete[](void *mem) {
    800039a8:	ff010113          	addi	sp,sp,-16
    800039ac:	00113423          	sd	ra,8(sp)
    800039b0:	00813023          	sd	s0,0(sp)
    800039b4:	01010413          	addi	s0,sp,16
    mem_free(mem);
    800039b8:	ffffe097          	auipc	ra,0xffffe
    800039bc:	b48080e7          	jalr	-1208(ra) # 80001500 <_Z8mem_freePv>
}
    800039c0:	00813083          	ld	ra,8(sp)
    800039c4:	00013403          	ld	s0,0(sp)
    800039c8:	01010113          	addi	sp,sp,16
    800039cc:	00008067          	ret

00000000800039d0 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    800039d0:	ff010113          	addi	sp,sp,-16
    800039d4:	00813423          	sd	s0,8(sp)
    800039d8:	01010413          	addi	s0,sp,16
    800039dc:	00005797          	auipc	a5,0x5
    800039e0:	5dc78793          	addi	a5,a5,1500 # 80008fb8 <_ZTV6Thread+0x10>
    800039e4:	00f53023          	sd	a5,0(a0)
    this->body = body;
    800039e8:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    800039ec:	00c53c23          	sd	a2,24(a0)
}
    800039f0:	00813403          	ld	s0,8(sp)
    800039f4:	01010113          	addi	sp,sp,16
    800039f8:	00008067          	ret

00000000800039fc <_ZN6Thread5startEv>:
int Thread::start() {
    800039fc:	ff010113          	addi	sp,sp,-16
    80003a00:	00113423          	sd	ra,8(sp)
    80003a04:	00813023          	sd	s0,0(sp)
    80003a08:	01010413          	addi	s0,sp,16
    return thread_create(&myHandle, &threadStart, this);
    80003a0c:	00050613          	mv	a2,a0
    80003a10:	00000597          	auipc	a1,0x0
    80003a14:	d8458593          	addi	a1,a1,-636 # 80003794 <_ZN6Thread11threadStartEPv>
    80003a18:	00850513          	addi	a0,a0,8
    80003a1c:	ffffe097          	auipc	ra,0xffffe
    80003a20:	b24080e7          	jalr	-1244(ra) # 80001540 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80003a24:	00813083          	ld	ra,8(sp)
    80003a28:	00013403          	ld	s0,0(sp)
    80003a2c:	01010113          	addi	sp,sp,16
    80003a30:	00008067          	ret

0000000080003a34 <_ZN6Thread4joinEv>:
void Thread::join() {
    80003a34:	ff010113          	addi	sp,sp,-16
    80003a38:	00113423          	sd	ra,8(sp)
    80003a3c:	00813023          	sd	s0,0(sp)
    80003a40:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80003a44:	00853503          	ld	a0,8(a0)
    80003a48:	ffffe097          	auipc	ra,0xffffe
    80003a4c:	bf0080e7          	jalr	-1040(ra) # 80001638 <_Z11thread_joinP3TCB>
}
    80003a50:	00813083          	ld	ra,8(sp)
    80003a54:	00013403          	ld	s0,0(sp)
    80003a58:	01010113          	addi	sp,sp,16
    80003a5c:	00008067          	ret

0000000080003a60 <_ZN6Thread4joinEm>:
void Thread::join(time_t time) {
    80003a60:	ff010113          	addi	sp,sp,-16
    80003a64:	00113423          	sd	ra,8(sp)
    80003a68:	00813023          	sd	s0,0(sp)
    80003a6c:	01010413          	addi	s0,sp,16
    thread_join(myHandle, time);
    80003a70:	00853503          	ld	a0,8(a0)
    80003a74:	ffffe097          	auipc	ra,0xffffe
    80003a78:	c00080e7          	jalr	-1024(ra) # 80001674 <_Z11thread_joinP3TCBm>
}
    80003a7c:	00813083          	ld	ra,8(sp)
    80003a80:	00013403          	ld	s0,0(sp)
    80003a84:	01010113          	addi	sp,sp,16
    80003a88:	00008067          	ret

0000000080003a8c <_ZN6Thread4killEPS_>:
int Thread::kill(Thread *thread) {
    80003a8c:	ff010113          	addi	sp,sp,-16
    80003a90:	00113423          	sd	ra,8(sp)
    80003a94:	00813023          	sd	s0,0(sp)
    80003a98:	01010413          	addi	s0,sp,16
    return thread_kill(thread->myHandle);
    80003a9c:	00853503          	ld	a0,8(a0)
    80003aa0:	ffffe097          	auipc	ra,0xffffe
    80003aa4:	c78080e7          	jalr	-904(ra) # 80001718 <_Z11thread_killP3TCB>
}
    80003aa8:	00813083          	ld	ra,8(sp)
    80003aac:	00013403          	ld	s0,0(sp)
    80003ab0:	01010113          	addi	sp,sp,16
    80003ab4:	00008067          	ret

0000000080003ab8 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80003ab8:	ff010113          	addi	sp,sp,-16
    80003abc:	00113423          	sd	ra,8(sp)
    80003ac0:	00813023          	sd	s0,0(sp)
    80003ac4:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80003ac8:	ffffe097          	auipc	ra,0xffffe
    80003acc:	b34080e7          	jalr	-1228(ra) # 800015fc <_Z15thread_dispatchv>
}
    80003ad0:	00813083          	ld	ra,8(sp)
    80003ad4:	00013403          	ld	s0,0(sp)
    80003ad8:	01010113          	addi	sp,sp,16
    80003adc:	00008067          	ret

0000000080003ae0 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t ms) {
    80003ae0:	ff010113          	addi	sp,sp,-16
    80003ae4:	00113423          	sd	ra,8(sp)
    80003ae8:	00813023          	sd	s0,0(sp)
    80003aec:	01010413          	addi	s0,sp,16
    return time_sleep(ms);
    80003af0:	ffffe097          	auipc	ra,0xffffe
    80003af4:	dec080e7          	jalr	-532(ra) # 800018dc <_Z10time_sleepm>
}
    80003af8:	00813083          	ld	ra,8(sp)
    80003afc:	00013403          	ld	s0,0(sp)
    80003b00:	01010113          	addi	sp,sp,16
    80003b04:	00008067          	ret

0000000080003b08 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) {
    this->period = period;
}

void PeriodicThread::run() {
    80003b08:	fe010113          	addi	sp,sp,-32
    80003b0c:	00113c23          	sd	ra,24(sp)
    80003b10:	00813823          	sd	s0,16(sp)
    80003b14:	00913423          	sd	s1,8(sp)
    80003b18:	02010413          	addi	s0,sp,32
    80003b1c:	00050493          	mv	s1,a0
    while (this->period != 0) {
    80003b20:	0204b503          	ld	a0,32(s1)
    80003b24:	02050063          	beqz	a0,80003b44 <_ZN14PeriodicThread3runEv+0x3c>
        Thread::sleep(period);
    80003b28:	00000097          	auipc	ra,0x0
    80003b2c:	fb8080e7          	jalr	-72(ra) # 80003ae0 <_ZN6Thread5sleepEm>
        this->periodicActivation();
    80003b30:	0004b783          	ld	a5,0(s1)
    80003b34:	0187b783          	ld	a5,24(a5)
    80003b38:	00048513          	mv	a0,s1
    80003b3c:	000780e7          	jalr	a5
    while (this->period != 0) {
    80003b40:	fe1ff06f          	j	80003b20 <_ZN14PeriodicThread3runEv+0x18>
    }
}
    80003b44:	01813083          	ld	ra,24(sp)
    80003b48:	01013403          	ld	s0,16(sp)
    80003b4c:	00813483          	ld	s1,8(sp)
    80003b50:	02010113          	addi	sp,sp,32
    80003b54:	00008067          	ret

0000000080003b58 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80003b58:	ff010113          	addi	sp,sp,-16
    80003b5c:	00813423          	sd	s0,8(sp)
    80003b60:	01010413          	addi	s0,sp,16
    80003b64:	00005797          	auipc	a5,0x5
    80003b68:	45478793          	addi	a5,a5,1108 # 80008fb8 <_ZTV6Thread+0x10>
    80003b6c:	00f53023          	sd	a5,0(a0)
    this->body = nullptr;
    80003b70:	00053823          	sd	zero,16(a0)
    this->arg = nullptr;
    80003b74:	00053c23          	sd	zero,24(a0)
}
    80003b78:	00813403          	ld	s0,8(sp)
    80003b7c:	01010113          	addi	sp,sp,16
    80003b80:	00008067          	ret

0000000080003b84 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80003b84:	ff010113          	addi	sp,sp,-16
    80003b88:	00113423          	sd	ra,8(sp)
    80003b8c:	00813023          	sd	s0,0(sp)
    80003b90:	01010413          	addi	s0,sp,16
    80003b94:	00005797          	auipc	a5,0x5
    80003b98:	44c78793          	addi	a5,a5,1100 # 80008fe0 <_ZTV9Semaphore+0x10>
    80003b9c:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80003ba0:	00850513          	addi	a0,a0,8
    80003ba4:	ffffe097          	auipc	ra,0xffffe
    80003ba8:	bb4080e7          	jalr	-1100(ra) # 80001758 <_Z8sem_openPP3Semj>
}
    80003bac:	00813083          	ld	ra,8(sp)
    80003bb0:	00013403          	ld	s0,0(sp)
    80003bb4:	01010113          	addi	sp,sp,16
    80003bb8:	00008067          	ret

0000000080003bbc <_ZN9Semaphore15signal_and_waitERS_S0_>:
int Semaphore::signal_and_wait(Semaphore &sem1, Semaphore &sem2) {
    80003bbc:	ff010113          	addi	sp,sp,-16
    80003bc0:	00113423          	sd	ra,8(sp)
    80003bc4:	00813023          	sd	s0,0(sp)
    80003bc8:	01010413          	addi	s0,sp,16
    return ::signal_and_wait(sem1.myHandle, sem2.myHandle);
    80003bcc:	0085b583          	ld	a1,8(a1)
    80003bd0:	00853503          	ld	a0,8(a0)
    80003bd4:	ffffe097          	auipc	ra,0xffffe
    80003bd8:	cc8080e7          	jalr	-824(ra) # 8000189c <_Z15signal_and_waitP3SemS0_>
}
    80003bdc:	00813083          	ld	ra,8(sp)
    80003be0:	00013403          	ld	s0,0(sp)
    80003be4:	01010113          	addi	sp,sp,16
    80003be8:	00008067          	ret

0000000080003bec <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80003bec:	ff010113          	addi	sp,sp,-16
    80003bf0:	00813423          	sd	s0,8(sp)
    80003bf4:	01010413          	addi	s0,sp,16
    this->period = 0;
    80003bf8:	02053023          	sd	zero,32(a0)
}
    80003bfc:	00813403          	ld	s0,8(sp)
    80003c00:	01010113          	addi	sp,sp,16
    80003c04:	00008067          	ret

0000000080003c08 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) {
    80003c08:	fe010113          	addi	sp,sp,-32
    80003c0c:	00113c23          	sd	ra,24(sp)
    80003c10:	00813823          	sd	s0,16(sp)
    80003c14:	00913423          	sd	s1,8(sp)
    80003c18:	01213023          	sd	s2,0(sp)
    80003c1c:	02010413          	addi	s0,sp,32
    80003c20:	00050493          	mv	s1,a0
    80003c24:	00058913          	mv	s2,a1
    80003c28:	00000097          	auipc	ra,0x0
    80003c2c:	f30080e7          	jalr	-208(ra) # 80003b58 <_ZN6ThreadC1Ev>
    80003c30:	00005797          	auipc	a5,0x5
    80003c34:	3e078793          	addi	a5,a5,992 # 80009010 <_ZTV14PeriodicThread+0x10>
    80003c38:	00f4b023          	sd	a5,0(s1)
    this->period = period;
    80003c3c:	0324b023          	sd	s2,32(s1)
}
    80003c40:	01813083          	ld	ra,24(sp)
    80003c44:	01013403          	ld	s0,16(sp)
    80003c48:	00813483          	ld	s1,8(sp)
    80003c4c:	00013903          	ld	s2,0(sp)
    80003c50:	02010113          	addi	sp,sp,32
    80003c54:	00008067          	ret

0000000080003c58 <_ZN7Console4getcEv>:

char Console::getc() {
    80003c58:	ff010113          	addi	sp,sp,-16
    80003c5c:	00113423          	sd	ra,8(sp)
    80003c60:	00813023          	sd	s0,0(sp)
    80003c64:	01010413          	addi	s0,sp,16
    return ::getc();
    80003c68:	ffffe097          	auipc	ra,0xffffe
    80003c6c:	d00080e7          	jalr	-768(ra) # 80001968 <_Z4getcv>
}
    80003c70:	00813083          	ld	ra,8(sp)
    80003c74:	00013403          	ld	s0,0(sp)
    80003c78:	01010113          	addi	sp,sp,16
    80003c7c:	00008067          	ret

0000000080003c80 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80003c80:	ff010113          	addi	sp,sp,-16
    80003c84:	00113423          	sd	ra,8(sp)
    80003c88:	00813023          	sd	s0,0(sp)
    80003c8c:	01010413          	addi	s0,sp,16
    ::putc(c);
    80003c90:	ffffe097          	auipc	ra,0xffffe
    80003c94:	d18080e7          	jalr	-744(ra) # 800019a8 <_Z4putcc>
    80003c98:	00813083          	ld	ra,8(sp)
    80003c9c:	00013403          	ld	s0,0(sp)
    80003ca0:	01010113          	addi	sp,sp,16
    80003ca4:	00008067          	ret

0000000080003ca8 <_ZN6Thread3runEv>:
    static void threadStart(void *);

protected:
    Thread();

    virtual void run() {}
    80003ca8:	ff010113          	addi	sp,sp,-16
    80003cac:	00813423          	sd	s0,8(sp)
    80003cb0:	01010413          	addi	s0,sp,16
    80003cb4:	00813403          	ld	s0,8(sp)
    80003cb8:	01010113          	addi	sp,sp,16
    80003cbc:	00008067          	ret

0000000080003cc0 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    explicit PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80003cc0:	ff010113          	addi	sp,sp,-16
    80003cc4:	00813423          	sd	s0,8(sp)
    80003cc8:	01010413          	addi	s0,sp,16
    80003ccc:	00813403          	ld	s0,8(sp)
    80003cd0:	01010113          	addi	sp,sp,16
    80003cd4:	00008067          	ret

0000000080003cd8 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80003cd8:	ff010113          	addi	sp,sp,-16
    80003cdc:	00113423          	sd	ra,8(sp)
    80003ce0:	00813023          	sd	s0,0(sp)
    80003ce4:	01010413          	addi	s0,sp,16
    80003ce8:	00005797          	auipc	a5,0x5
    80003cec:	32878793          	addi	a5,a5,808 # 80009010 <_ZTV14PeriodicThread+0x10>
    80003cf0:	00f53023          	sd	a5,0(a0)
    80003cf4:	00000097          	auipc	ra,0x0
    80003cf8:	be8080e7          	jalr	-1048(ra) # 800038dc <_ZN6ThreadD1Ev>
    80003cfc:	00813083          	ld	ra,8(sp)
    80003d00:	00013403          	ld	s0,0(sp)
    80003d04:	01010113          	addi	sp,sp,16
    80003d08:	00008067          	ret

0000000080003d0c <_ZN14PeriodicThreadD0Ev>:
    80003d0c:	fe010113          	addi	sp,sp,-32
    80003d10:	00113c23          	sd	ra,24(sp)
    80003d14:	00813823          	sd	s0,16(sp)
    80003d18:	00913423          	sd	s1,8(sp)
    80003d1c:	02010413          	addi	s0,sp,32
    80003d20:	00050493          	mv	s1,a0
    80003d24:	00005797          	auipc	a5,0x5
    80003d28:	2ec78793          	addi	a5,a5,748 # 80009010 <_ZTV14PeriodicThread+0x10>
    80003d2c:	00f53023          	sd	a5,0(a0)
    80003d30:	00000097          	auipc	ra,0x0
    80003d34:	bac080e7          	jalr	-1108(ra) # 800038dc <_ZN6ThreadD1Ev>
    80003d38:	00048513          	mv	a0,s1
    80003d3c:	00000097          	auipc	ra,0x0
    80003d40:	b78080e7          	jalr	-1160(ra) # 800038b4 <_ZdlPv>
    80003d44:	01813083          	ld	ra,24(sp)
    80003d48:	01013403          	ld	s0,16(sp)
    80003d4c:	00813483          	ld	s1,8(sp)
    80003d50:	02010113          	addi	sp,sp,32
    80003d54:	00008067          	ret

0000000080003d58 <_ZN5riscv20handleSupervisorTrapEmmmmm>:
        reinterpret_cast<riscv::syscall_f>(Cradle::_thread_wake),
        reinterpret_cast<riscv::syscall_f>(IO::_getc),
        reinterpret_cast<riscv::syscall_f>(IO::_putc)
};

void riscv::handleSupervisorTrap(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    80003d58:	f9010113          	addi	sp,sp,-112
    80003d5c:	06113423          	sd	ra,104(sp)
    80003d60:	06813023          	sd	s0,96(sp)
    80003d64:	04913c23          	sd	s1,88(sp)
    80003d68:	05213823          	sd	s2,80(sp)
    80003d6c:	05313423          	sd	s3,72(sp)
    80003d70:	05413023          	sd	s4,64(sp)
    80003d74:	03513c23          	sd	s5,56(sp)
    80003d78:	03613823          	sd	s6,48(sp)
    80003d7c:	03713423          	sd	s7,40(sp)
    80003d80:	07010413          	addi	s0,sp,112
    80003d84:	00050493          	mv	s1,a0
    80003d88:	00058993          	mv	s3,a1
    80003d8c:	00060a13          	mv	s4,a2
    80003d90:	00068a93          	mv	s5,a3
    80003d94:	00070b13          	mv	s6,a4
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80003d98:	100027f3          	csrr	a5,sstatus
    80003d9c:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    80003da0:	fa843b83          	ld	s7,-88(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80003da4:	141027f3          	csrr	a5,sepc
    80003da8:	faf43023          	sd	a5,-96(s0)
    return sepc;
    80003dac:	fa043903          	ld	s2,-96(s0)
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80003db0:	142027f3          	csrr	a5,scause
    80003db4:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80003db8:	f9843703          	ld	a4,-104(s0)
    uint64 sstatus = r_sstatus();
    uint64 sepc = r_sepc();
    if (r_scause() == ILLEGAL_INSTRUCTION) {
    80003dbc:	00200793          	li	a5,2
    80003dc0:	06f70263          	beq	a4,a5,80003e24 <_ZN5riscv20handleSupervisorTrapEmmmmm+0xcc>
        print("\nIllegal Instruction\n");
        TCB::_thread_exit();
    }
    syscall_table[code](arg1, arg2, arg3, arg4);
    80003dc4:	00349493          	slli	s1,s1,0x3
    80003dc8:	00005797          	auipc	a5,0x5
    80003dcc:	26878793          	addi	a5,a5,616 # 80009030 <_ZN5riscv13syscall_tableE>
    80003dd0:	009784b3          	add	s1,a5,s1
    80003dd4:	0004b783          	ld	a5,0(s1)
    80003dd8:	000b0693          	mv	a3,s6
    80003ddc:	000a8613          	mv	a2,s5
    80003de0:	000a0593          	mv	a1,s4
    80003de4:	00098513          	mv	a0,s3
    80003de8:	000780e7          	jalr	a5
    w_sepc(sepc + 4);
    80003dec:	00490793          	addi	a5,s2,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80003df0:	14179073          	csrw	sepc,a5
}

inline void riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80003df4:	100b9073          	csrw	sstatus,s7
    w_sstatus(sstatus);
}
    80003df8:	06813083          	ld	ra,104(sp)
    80003dfc:	06013403          	ld	s0,96(sp)
    80003e00:	05813483          	ld	s1,88(sp)
    80003e04:	05013903          	ld	s2,80(sp)
    80003e08:	04813983          	ld	s3,72(sp)
    80003e0c:	04013a03          	ld	s4,64(sp)
    80003e10:	03813a83          	ld	s5,56(sp)
    80003e14:	03013b03          	ld	s6,48(sp)
    80003e18:	02813b83          	ld	s7,40(sp)
    80003e1c:	07010113          	addi	sp,sp,112
    80003e20:	00008067          	ret
        print("\nIllegal Instruction\n");
    80003e24:	00003517          	auipc	a0,0x3
    80003e28:	27450513          	addi	a0,a0,628 # 80007098 <_ZN3stm4coutE+0x38>
    80003e2c:	fffff097          	auipc	ra,0xfffff
    80003e30:	898080e7          	jalr	-1896(ra) # 800026c4 <_Z5printPKc>
        TCB::_thread_exit();
    80003e34:	00001097          	auipc	ra,0x1
    80003e38:	c90080e7          	jalr	-880(ra) # 80004ac4 <_ZN3TCB12_thread_exitEv>
    80003e3c:	f89ff06f          	j	80003dc4 <_ZN5riscv20handleSupervisorTrapEmmmmm+0x6c>

0000000080003e40 <_ZN5riscv15handleTimerTrapEv>:


void riscv::handleTimerTrap() {
    80003e40:	fd010113          	addi	sp,sp,-48
    80003e44:	02113423          	sd	ra,40(sp)
    80003e48:	02813023          	sd	s0,32(sp)
    80003e4c:	00913c23          	sd	s1,24(sp)
    80003e50:	01213823          	sd	s2,16(sp)
    80003e54:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80003e58:	100027f3          	csrr	a5,sstatus
    80003e5c:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80003e60:	fd843483          	ld	s1,-40(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80003e64:	141027f3          	csrr	a5,sepc
    80003e68:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80003e6c:	fd043903          	ld	s2,-48(s0)
    uint64 sstatus = r_sstatus();
    uint64 sepc = r_sepc();
    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IO::Output.is_empty()) {
    80003e70:	00005797          	auipc	a5,0x5
    80003e74:	2d07b783          	ld	a5,720(a5) # 80009140 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003e78:	0007b783          	ld	a5,0(a5)
    80003e7c:	0007c783          	lbu	a5,0(a5)
    80003e80:	0207f793          	andi	a5,a5,32
    80003e84:	02078c63          	beqz	a5,80003ebc <_ZN5riscv15handleTimerTrapEv+0x7c>
    80003e88:	00005797          	auipc	a5,0x5
    80003e8c:	2b07b783          	ld	a5,688(a5) # 80009138 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003e90:	0107a783          	lw	a5,16(a5)
    80003e94:	02078463          	beqz	a5,80003ebc <_ZN5riscv15handleTimerTrapEv+0x7c>
        char c = IO::Output.get();
    80003e98:	00005517          	auipc	a0,0x5
    80003e9c:	2a053503          	ld	a0,672(a0) # 80009138 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003ea0:	fffff097          	auipc	ra,0xfffff
    80003ea4:	abc080e7          	jalr	-1348(ra) # 8000295c <_ZN8IOBuffer3getEv>
        *(volatile char *) CONSOLE_TX_DATA = c;
    80003ea8:	00005797          	auipc	a5,0x5
    80003eac:	2c87b783          	ld	a5,712(a5) # 80009170 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003eb0:	0007b783          	ld	a5,0(a5)
    80003eb4:	00a78023          	sb	a0,0(a5)
    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IO::Output.is_empty()) {
    80003eb8:	fb9ff06f          	j	80003e70 <_ZN5riscv15handleTimerTrapEv+0x30>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80003ebc:	00200793          	li	a5,2
    80003ec0:	1447b073          	csrc	sip,a5
    }
    mc_sip(SIP_SSIE);
    Cradle::update();
    80003ec4:	fffff097          	auipc	ra,0xfffff
    80003ec8:	f74080e7          	jalr	-140(ra) # 80002e38 <_ZN6Cradle6updateEv>
    80003ecc:	0580006f          	j	80003f24 <_ZN5riscv15handleTimerTrapEv+0xe4>
        if (next->is_joined() || next->is_sleeping()) {
            next->run();
            Scheduler::put(next);
        }
    }
    TCB::timer_counter++;
    80003ed0:	00005717          	auipc	a4,0x5
    80003ed4:	2d873703          	ld	a4,728(a4) # 800091a8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80003ed8:	00073783          	ld	a5,0(a4)
    80003edc:	00178793          	addi	a5,a5,1
    80003ee0:	00f73023          	sd	a5,0(a4)
    if ((time_t) TCB::timer_counter >= TCB::running->get_time_slice() && !Scheduler::is_empty()) {
    80003ee4:	00005717          	auipc	a4,0x5
    80003ee8:	2b473703          	ld	a4,692(a4) # 80009198 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003eec:	00073703          	ld	a4,0(a4)

    void set_preempted() { this->preempted = true; }

    void reset_preempted() { this->preempted = false; }

    time_t get_time_slice() const { return this->time_slice; }
    80003ef0:	05073683          	ld	a3,80(a4)
    80003ef4:	06d7f463          	bgeu	a5,a3,80003f5c <_ZN5riscv15handleTimerTrapEv+0x11c>
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80003ef8:	14191073          	csrw	sepc,s2
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80003efc:	10049073          	csrw	sstatus,s1
        TCB::running->set_preempted();
        TCB::_thread_dispatch();
    }
    w_sepc(sepc);
    w_sstatus(sstatus);
}
    80003f00:	02813083          	ld	ra,40(sp)
    80003f04:	02013403          	ld	s0,32(sp)
    80003f08:	01813483          	ld	s1,24(sp)
    80003f0c:	01013903          	ld	s2,16(sp)
    80003f10:	03010113          	addi	sp,sp,48
    80003f14:	00008067          	ret
    void run() { this->status = RUNNABLE; }
    80003f18:	04052423          	sw	zero,72(a0)
            Scheduler::put(next);
    80003f1c:	00000097          	auipc	ra,0x0
    80003f20:	2c4080e7          	jalr	708(ra) # 800041e0 <_ZN9Scheduler3putEP3TCB>
    while (!Cradle::is_empty() && Cradle::peak() == 0) {
    80003f24:	fffff097          	auipc	ra,0xfffff
    80003f28:	f74080e7          	jalr	-140(ra) # 80002e98 <_ZN6Cradle8is_emptyEv>
    80003f2c:	fa0512e3          	bnez	a0,80003ed0 <_ZN5riscv15handleTimerTrapEv+0x90>
    80003f30:	fffff097          	auipc	ra,0xfffff
    80003f34:	f38080e7          	jalr	-200(ra) # 80002e68 <_ZN6Cradle4peakEv>
    80003f38:	f8051ce3          	bnez	a0,80003ed0 <_ZN5riscv15handleTimerTrapEv+0x90>
        thread_t next = Cradle::remove();
    80003f3c:	fffff097          	auipc	ra,0xfffff
    80003f40:	eac080e7          	jalr	-340(ra) # 80002de8 <_ZN6Cradle6removeEv>
    bool is_joined() const { return this->status == JOINED; }
    80003f44:	04852783          	lw	a5,72(a0)
        if (next->is_joined() || next->is_sleeping()) {
    80003f48:	00300713          	li	a4,3
    80003f4c:	fce786e3          	beq	a5,a4,80003f18 <_ZN5riscv15handleTimerTrapEv+0xd8>
    80003f50:	00200713          	li	a4,2
    80003f54:	fce798e3          	bne	a5,a4,80003f24 <_ZN5riscv15handleTimerTrapEv+0xe4>
    80003f58:	fc1ff06f          	j	80003f18 <_ZN5riscv15handleTimerTrapEv+0xd8>
    80003f5c:	00005797          	auipc	a5,0x5
    80003f60:	2547b783          	ld	a5,596(a5) # 800091b0 <_GLOBAL_OFFSET_TABLE_+0x88>
    80003f64:	0107a783          	lw	a5,16(a5)
    static void put(TCB *thread);

    static TCB *get();

    static inline bool is_empty() {
        return high_priority.is_empty() && mid_priority.is_empty() && low_priority.is_empty();
    80003f68:	02079263          	bnez	a5,80003f8c <_ZN5riscv15handleTimerTrapEv+0x14c>
    80003f6c:	00005797          	auipc	a5,0x5
    80003f70:	2247b783          	ld	a5,548(a5) # 80009190 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003f74:	0107a783          	lw	a5,16(a5)
    80003f78:	00079a63          	bnez	a5,80003f8c <_ZN5riscv15handleTimerTrapEv+0x14c>
    80003f7c:	00005797          	auipc	a5,0x5
    80003f80:	1ec7b783          	ld	a5,492(a5) # 80009168 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003f84:	0107a783          	lw	a5,16(a5)
    80003f88:	f60788e3          	beqz	a5,80003ef8 <_ZN5riscv15handleTimerTrapEv+0xb8>
        TCB::timer_counter = 0;
    80003f8c:	00005797          	auipc	a5,0x5
    80003f90:	21c7b783          	ld	a5,540(a5) # 800091a8 <_GLOBAL_OFFSET_TABLE_+0x80>
    80003f94:	0007b023          	sd	zero,0(a5)
    void set_preempted() { this->preempted = true; }
    80003f98:	00100793          	li	a5,1
    80003f9c:	04f70c23          	sb	a5,88(a4)
        TCB::_thread_dispatch();
    80003fa0:	00001097          	auipc	ra,0x1
    80003fa4:	9fc080e7          	jalr	-1540(ra) # 8000499c <_ZN3TCB16_thread_dispatchEv>
    80003fa8:	f51ff06f          	j	80003ef8 <_ZN5riscv15handleTimerTrapEv+0xb8>

0000000080003fac <_ZN5riscv17handleConsoleTrapEv>:

void riscv::handleConsoleTrap() {
    80003fac:	fc010113          	addi	sp,sp,-64
    80003fb0:	02113c23          	sd	ra,56(sp)
    80003fb4:	02813823          	sd	s0,48(sp)
    80003fb8:	02913423          	sd	s1,40(sp)
    80003fbc:	03213023          	sd	s2,32(sp)
    80003fc0:	04010413          	addi	s0,sp,64
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80003fc4:	141027f3          	csrr	a5,sepc
    80003fc8:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80003fcc:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80003fd0:	100027f3          	csrr	a5,sstatus
    80003fd4:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80003fd8:	fd043483          	ld	s1,-48(s0)
    uint64 sepc = r_sepc();
    uint64 sstatuc = r_sstatus();
    if (plic_claim() == CONSOLE_IRQ) {
    80003fdc:	00001097          	auipc	ra,0x1
    80003fe0:	658080e7          	jalr	1624(ra) # 80005634 <plic_claim>
    80003fe4:	00a00793          	li	a5,10
    80003fe8:	02f50263          	beq	a0,a5,8000400c <_ZN5riscv17handleConsoleTrapEv+0x60>
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80003fec:	14191073          	csrw	sepc,s2
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80003ff0:	10049073          	csrw	sstatus,s1
        }
        plic_complete(CONSOLE_IRQ);
    }
    w_sepc(sepc);
    w_sstatus(sstatuc);
}
    80003ff4:	03813083          	ld	ra,56(sp)
    80003ff8:	03013403          	ld	s0,48(sp)
    80003ffc:	02813483          	ld	s1,40(sp)
    80004000:	02013903          	ld	s2,32(sp)
    80004004:	04010113          	addi	sp,sp,64
    80004008:	00008067          	ret
        if ((*((char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
    8000400c:	00005797          	auipc	a5,0x5
    80004010:	1347b783          	ld	a5,308(a5) # 80009140 <_GLOBAL_OFFSET_TABLE_+0x18>
    80004014:	0007b783          	ld	a5,0(a5)
    80004018:	0007c783          	lbu	a5,0(a5)
    8000401c:	0017f793          	andi	a5,a5,1
    80004020:	00079a63          	bnez	a5,80004034 <_ZN5riscv17handleConsoleTrapEv+0x88>
        plic_complete(CONSOLE_IRQ);
    80004024:	00a00513          	li	a0,10
    80004028:	00001097          	auipc	ra,0x1
    8000402c:	644080e7          	jalr	1604(ra) # 8000566c <plic_complete>
    80004030:	fbdff06f          	j	80003fec <_ZN5riscv17handleConsoleTrapEv+0x40>
            volatile char c = *(char *) CONSOLE_RX_DATA;
    80004034:	00005797          	auipc	a5,0x5
    80004038:	0fc7b783          	ld	a5,252(a5) # 80009130 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000403c:	0007b783          	ld	a5,0(a5)
    80004040:	0007c783          	lbu	a5,0(a5)
    80004044:	fcf407a3          	sb	a5,-49(s0)
            IO::Input.put(c);
    80004048:	fcf44583          	lbu	a1,-49(s0)
    8000404c:	0ff5f593          	andi	a1,a1,255
    80004050:	00005517          	auipc	a0,0x5
    80004054:	13053503          	ld	a0,304(a0) # 80009180 <_GLOBAL_OFFSET_TABLE_+0x58>
    80004058:	fffff097          	auipc	ra,0xfffff
    8000405c:	978080e7          	jalr	-1672(ra) # 800029d0 <_ZN8IOBuffer3putEc>
    80004060:	fc5ff06f          	j	80004024 <_ZN5riscv17handleConsoleTrapEv+0x78>

0000000080004064 <_ZN5riscv10popSppSpieEv>:

void riscv::popSppSpie() {
    80004064:	ff010113          	addi	sp,sp,-16
    80004068:	00813423          	sd	s0,8(sp)
    8000406c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80004070:	10000793          	li	a5,256
    80004074:	1007b073          	csrc	sstatus,a5
    riscv::mc_sstatus(riscv::SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    80004078:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    8000407c:	10200073          	sret
}
    80004080:	00813403          	ld	s0,8(sp)
    80004084:	01010113          	addi	sp,sp,16
    80004088:	00008067          	ret

000000008000408c <_ZN5riscv14handleReadTrapEv>:

void riscv::handleReadTrap() {
    8000408c:	ff010113          	addi	sp,sp,-16
    80004090:	00813423          	sd	s0,8(sp)
    80004094:	01010413          	addi	s0,sp,16
    *(volatile char *) CONSOLE_TX_DATA = '!';
    80004098:	00005797          	auipc	a5,0x5
    8000409c:	0d87b783          	ld	a5,216(a5) # 80009170 <_GLOBAL_OFFSET_TABLE_+0x48>
    800040a0:	0007b783          	ld	a5,0(a5)
    800040a4:	02100713          	li	a4,33
    800040a8:	00e78023          	sb	a4,0(a5)
    *(volatile char *) CONSOLE_TX_DATA = 'r';
    800040ac:	07200713          	li	a4,114
    800040b0:	00e78023          	sb	a4,0(a5)
}
    800040b4:	00813403          	ld	s0,8(sp)
    800040b8:	01010113          	addi	sp,sp,16
    800040bc:	00008067          	ret

00000000800040c0 <_ZN5riscv15handleWriteTrapEv>:

void riscv::handleWriteTrap() {
    800040c0:	ff010113          	addi	sp,sp,-16
    800040c4:	00813423          	sd	s0,8(sp)
    800040c8:	01010413          	addi	s0,sp,16
    *(volatile char *) CONSOLE_TX_DATA = '!';
    800040cc:	00005797          	auipc	a5,0x5
    800040d0:	0a47b783          	ld	a5,164(a5) # 80009170 <_GLOBAL_OFFSET_TABLE_+0x48>
    800040d4:	0007b783          	ld	a5,0(a5)
    800040d8:	02100713          	li	a4,33
    800040dc:	00e78023          	sb	a4,0(a5)
    *(volatile char *) CONSOLE_TX_DATA = 'w';
    800040e0:	07700713          	li	a4,119
    800040e4:	00e78023          	sb	a4,0(a5)
    800040e8:	00813403          	ld	s0,8(sp)
    800040ec:	01010113          	addi	sp,sp,16
    800040f0:	00008067          	ret

00000000800040f4 <_ZN9Scheduler3getEv>:
    } else {
        Scheduler::low_priority.put(thread);
    }
}

TCB *Scheduler::get() {
    800040f4:	ff010113          	addi	sp,sp,-16
    800040f8:	00113423          	sd	ra,8(sp)
    800040fc:	00813023          	sd	s0,0(sp)
    80004100:	01010413          	addi	s0,sp,16
    80004104:	00005797          	auipc	a5,0x5
    80004108:	1747a783          	lw	a5,372(a5) # 80009278 <_ZN9Scheduler13high_priorityE+0x10>
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.get();
    8000410c:	02079863          	bnez	a5,8000413c <_ZN9Scheduler3getEv+0x48>
    80004110:	00005797          	auipc	a5,0x5
    80004114:	1807a783          	lw	a5,384(a5) # 80009290 <_ZN9Scheduler12mid_priorityE+0x10>
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.get();
    80004118:	02078c63          	beqz	a5,80004150 <_ZN9Scheduler3getEv+0x5c>
    8000411c:	00005517          	auipc	a0,0x5
    80004120:	16450513          	addi	a0,a0,356 # 80009280 <_ZN9Scheduler12mid_priorityE>
    80004124:	ffffe097          	auipc	ra,0xffffe
    80004128:	3f8080e7          	jalr	1016(ra) # 8000251c <_ZN3stm14CircularBufferIP3TCBE3getEv>
    return Scheduler::low_priority.get();
}
    8000412c:	00813083          	ld	ra,8(sp)
    80004130:	00013403          	ld	s0,0(sp)
    80004134:	01010113          	addi	sp,sp,16
    80004138:	00008067          	ret
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.get();
    8000413c:	00005517          	auipc	a0,0x5
    80004140:	12c50513          	addi	a0,a0,300 # 80009268 <_ZN9Scheduler13high_priorityE>
    80004144:	ffffe097          	auipc	ra,0xffffe
    80004148:	3d8080e7          	jalr	984(ra) # 8000251c <_ZN3stm14CircularBufferIP3TCBE3getEv>
    8000414c:	fe1ff06f          	j	8000412c <_ZN9Scheduler3getEv+0x38>
    return Scheduler::low_priority.get();
    80004150:	00005517          	auipc	a0,0x5
    80004154:	14850513          	addi	a0,a0,328 # 80009298 <_ZN9Scheduler12low_priorityE>
    80004158:	ffffe097          	auipc	ra,0xffffe
    8000415c:	3c4080e7          	jalr	964(ra) # 8000251c <_ZN3stm14CircularBufferIP3TCBE3getEv>
    80004160:	fcdff06f          	j	8000412c <_ZN9Scheduler3getEv+0x38>

0000000080004164 <_ZN9Scheduler4peekEv>:

TCB *Scheduler::peek() {
    80004164:	ff010113          	addi	sp,sp,-16
    80004168:	00113423          	sd	ra,8(sp)
    8000416c:	00813023          	sd	s0,0(sp)
    80004170:	01010413          	addi	s0,sp,16
    80004174:	00005797          	auipc	a5,0x5
    80004178:	1047a783          	lw	a5,260(a5) # 80009278 <_ZN9Scheduler13high_priorityE+0x10>
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.peek();
    8000417c:	02078463          	beqz	a5,800041a4 <_ZN9Scheduler4peekEv+0x40>
    80004180:	00005517          	auipc	a0,0x5
    80004184:	0e850513          	addi	a0,a0,232 # 80009268 <_ZN9Scheduler13high_priorityE>
    80004188:	00000097          	auipc	ra,0x0
    8000418c:	100080e7          	jalr	256(ra) # 80004288 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    80004190:	00053503          	ld	a0,0(a0)
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.peek();
    return Scheduler::low_priority.peek();
}
    80004194:	00813083          	ld	ra,8(sp)
    80004198:	00013403          	ld	s0,0(sp)
    8000419c:	01010113          	addi	sp,sp,16
    800041a0:	00008067          	ret
    800041a4:	00005797          	auipc	a5,0x5
    800041a8:	0ec7a783          	lw	a5,236(a5) # 80009290 <_ZN9Scheduler12mid_priorityE+0x10>
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.peek();
    800041ac:	00078e63          	beqz	a5,800041c8 <_ZN9Scheduler4peekEv+0x64>
    800041b0:	00005517          	auipc	a0,0x5
    800041b4:	0d050513          	addi	a0,a0,208 # 80009280 <_ZN9Scheduler12mid_priorityE>
    800041b8:	00000097          	auipc	ra,0x0
    800041bc:	0d0080e7          	jalr	208(ra) # 80004288 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    800041c0:	00053503          	ld	a0,0(a0)
    800041c4:	fd1ff06f          	j	80004194 <_ZN9Scheduler4peekEv+0x30>
    return Scheduler::low_priority.peek();
    800041c8:	00005517          	auipc	a0,0x5
    800041cc:	0d050513          	addi	a0,a0,208 # 80009298 <_ZN9Scheduler12low_priorityE>
    800041d0:	00000097          	auipc	ra,0x0
    800041d4:	0b8080e7          	jalr	184(ra) # 80004288 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    800041d8:	00053503          	ld	a0,0(a0)
    800041dc:	fb9ff06f          	j	80004194 <_ZN9Scheduler4peekEv+0x30>

00000000800041e0 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *thread) {
    800041e0:	ff010113          	addi	sp,sp,-16
    800041e4:	00113423          	sd	ra,8(sp)
    800041e8:	00813023          	sd	s0,0(sp)
    800041ec:	01010413          	addi	s0,sp,16
    800041f0:	00050593          	mv	a1,a0
    bool was_preempted() const { return this->preempted; }
    800041f4:	05854783          	lbu	a5,88(a0)
    if (!thread->was_preempted()) {
    800041f8:	02078e63          	beqz	a5,80004234 <_ZN9Scheduler3putEP3TCB+0x54>
    void reset_preempted() { this->preempted = false; }
    800041fc:	04050c23          	sb	zero,88(a0)
    time_t get_time_slice() const { return this->time_slice; }
    80004200:	05053783          	ld	a5,80(a0)
    if (time_slice == TimeSlice::HIGH_PRIORITY) {
    80004204:	00100713          	li	a4,1
    80004208:	04e78463          	beq	a5,a4,80004250 <_ZN9Scheduler3putEP3TCB+0x70>
    } else if (time_slice == TimeSlice::MID_PRIORITY) {
    8000420c:	00200713          	li	a4,2
    80004210:	04e78e63          	beq	a5,a4,8000426c <_ZN9Scheduler3putEP3TCB+0x8c>
        Scheduler::low_priority.put(thread);
    80004214:	00005517          	auipc	a0,0x5
    80004218:	08450513          	addi	a0,a0,132 # 80009298 <_ZN9Scheduler12low_priorityE>
    8000421c:	ffffe097          	auipc	ra,0xffffe
    80004220:	424080e7          	jalr	1060(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
}
    80004224:	00813083          	ld	ra,8(sp)
    80004228:	00013403          	ld	s0,0(sp)
    8000422c:	01010113          	addi	sp,sp,16
    80004230:	00008067          	ret

    void set_time_slice(time_t time) { this->time_slice = time;}
    80004234:	00100793          	li	a5,1
    80004238:	04f53823          	sd	a5,80(a0)
        Scheduler::high_priority.put(thread);
    8000423c:	00005517          	auipc	a0,0x5
    80004240:	02c50513          	addi	a0,a0,44 # 80009268 <_ZN9Scheduler13high_priorityE>
    80004244:	ffffe097          	auipc	ra,0xffffe
    80004248:	3fc080e7          	jalr	1020(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
        return;
    8000424c:	fd9ff06f          	j	80004224 <_ZN9Scheduler3putEP3TCB+0x44>
    80004250:	00200793          	li	a5,2
    80004254:	04f53823          	sd	a5,80(a0)
        Scheduler::mid_priority.put(thread);
    80004258:	00005517          	auipc	a0,0x5
    8000425c:	02850513          	addi	a0,a0,40 # 80009280 <_ZN9Scheduler12mid_priorityE>
    80004260:	ffffe097          	auipc	ra,0xffffe
    80004264:	3e0080e7          	jalr	992(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    80004268:	fbdff06f          	j	80004224 <_ZN9Scheduler3putEP3TCB+0x44>
    8000426c:	00400793          	li	a5,4
    80004270:	04f53823          	sd	a5,80(a0)
        Scheduler::low_priority.put(thread);
    80004274:	00005517          	auipc	a0,0x5
    80004278:	02450513          	addi	a0,a0,36 # 80009298 <_ZN9Scheduler12low_priorityE>
    8000427c:	ffffe097          	auipc	ra,0xffffe
    80004280:	3c4080e7          	jalr	964(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    80004284:	fa1ff06f          	j	80004224 <_ZN9Scheduler3putEP3TCB+0x44>

0000000080004288 <_ZN3stm14CircularBufferIP3TCBE4peekEv>:
T &stm::CircularBuffer<T>::peek() {
    80004288:	ff010113          	addi	sp,sp,-16
    8000428c:	00813423          	sd	s0,8(sp)
    80004290:	01010413          	addi	s0,sp,16
    return this->queue[this->head];
    80004294:	00053703          	ld	a4,0(a0)
    80004298:	00852783          	lw	a5,8(a0)
    8000429c:	00379793          	slli	a5,a5,0x3
}
    800042a0:	00f70533          	add	a0,a4,a5
    800042a4:	00813403          	ld	s0,8(sp)
    800042a8:	01010113          	addi	sp,sp,16
    800042ac:	00008067          	ret

00000000800042b0 <_ZN10OwnedMutexD1Ev>:

OwnedMutex::OwnedMutex() : owner(nullptr), nesting_count(0) {
    sem_open(&this->myHandle, 1);
}

OwnedMutex::~OwnedMutex() {
    800042b0:	fe010113          	addi	sp,sp,-32
    800042b4:	00113c23          	sd	ra,24(sp)
    800042b8:	00813823          	sd	s0,16(sp)
    800042bc:	00913423          	sd	s1,8(sp)
    800042c0:	02010413          	addi	s0,sp,32
    800042c4:	00050493          	mv	s1,a0
    800042c8:	00005797          	auipc	a5,0x5
    800042cc:	e4078793          	addi	a5,a5,-448 # 80009108 <_ZTV10OwnedMutex+0x10>
    800042d0:	00f53023          	sd	a5,0(a0)
    sem_close(this->myHandle);
    800042d4:	00853503          	ld	a0,8(a0)
    800042d8:	ffffd097          	auipc	ra,0xffffd
    800042dc:	4c4080e7          	jalr	1220(ra) # 8000179c <_Z9sem_closeP3Sem>
class Mutex : public Semaphore {
    800042e0:	00005797          	auipc	a5,0x5
    800042e4:	df878793          	addi	a5,a5,-520 # 800090d8 <_ZTV5Mutex+0x10>
    800042e8:	00f4b023          	sd	a5,0(s1)
    800042ec:	00048513          	mv	a0,s1
    800042f0:	fffff097          	auipc	ra,0xfffff
    800042f4:	4e4080e7          	jalr	1252(ra) # 800037d4 <_ZN9SemaphoreD1Ev>
}
    800042f8:	01813083          	ld	ra,24(sp)
    800042fc:	01013403          	ld	s0,16(sp)
    80004300:	00813483          	ld	s1,8(sp)
    80004304:	02010113          	addi	sp,sp,32
    80004308:	00008067          	ret

000000008000430c <_ZN10OwnedMutexD0Ev>:
OwnedMutex::~OwnedMutex() {
    8000430c:	fe010113          	addi	sp,sp,-32
    80004310:	00113c23          	sd	ra,24(sp)
    80004314:	00813823          	sd	s0,16(sp)
    80004318:	00913423          	sd	s1,8(sp)
    8000431c:	02010413          	addi	s0,sp,32
    80004320:	00050493          	mv	s1,a0
}
    80004324:	00000097          	auipc	ra,0x0
    80004328:	f8c080e7          	jalr	-116(ra) # 800042b0 <_ZN10OwnedMutexD1Ev>
    8000432c:	00048513          	mv	a0,s1
    80004330:	fffff097          	auipc	ra,0xfffff
    80004334:	584080e7          	jalr	1412(ra) # 800038b4 <_ZdlPv>
    80004338:	01813083          	ld	ra,24(sp)
    8000433c:	01013403          	ld	s0,16(sp)
    80004340:	00813483          	ld	s1,8(sp)
    80004344:	02010113          	addi	sp,sp,32
    80004348:	00008067          	ret

000000008000434c <_ZN10OwnedMutex4waitEv>:

int OwnedMutex::wait() {
    if (this->owner == TCB::running) {
    8000434c:	01053783          	ld	a5,16(a0)
    80004350:	00005717          	auipc	a4,0x5
    80004354:	e4873703          	ld	a4,-440(a4) # 80009198 <_GLOBAL_OFFSET_TABLE_+0x70>
    80004358:	00073703          	ld	a4,0(a4)
    8000435c:	02e78c63          	beq	a5,a4,80004394 <_ZN10OwnedMutex4waitEv+0x48>
int OwnedMutex::wait() {
    80004360:	ff010113          	addi	sp,sp,-16
    80004364:	00113423          	sd	ra,8(sp)
    80004368:	00813023          	sd	s0,0(sp)
    8000436c:	01010413          	addi	s0,sp,16
        this->nesting_count++;
        return 0;
    }
    if (this->owner == nullptr) {
    80004370:	02078c63          	beqz	a5,800043a8 <_ZN10OwnedMutex4waitEv+0x5c>
        this->owner = TCB::running;
        this->nesting_count = 1;
    }
    sem_wait(this->myHandle);
    80004374:	00853503          	ld	a0,8(a0)
    80004378:	ffffd097          	auipc	ra,0xffffd
    8000437c:	464080e7          	jalr	1124(ra) # 800017dc <_Z8sem_waitP3Sem>
    return 0;
}
    80004380:	00000513          	li	a0,0
    80004384:	00813083          	ld	ra,8(sp)
    80004388:	00013403          	ld	s0,0(sp)
    8000438c:	01010113          	addi	sp,sp,16
    80004390:	00008067          	ret
        this->nesting_count++;
    80004394:	01852783          	lw	a5,24(a0)
    80004398:	0017879b          	addiw	a5,a5,1
    8000439c:	00f52c23          	sw	a5,24(a0)
}
    800043a0:	00000513          	li	a0,0
    800043a4:	00008067          	ret
        this->owner = TCB::running;
    800043a8:	00e53823          	sd	a4,16(a0)
        this->nesting_count = 1;
    800043ac:	00100793          	li	a5,1
    800043b0:	00f52c23          	sw	a5,24(a0)
    800043b4:	fc1ff06f          	j	80004374 <_ZN10OwnedMutex4waitEv+0x28>

00000000800043b8 <_ZN10OwnedMutex6signalEv>:

int OwnedMutex::signal() {
    if (this->owner != TCB::running) return -1;
    800043b8:	01053703          	ld	a4,16(a0)
    800043bc:	00005797          	auipc	a5,0x5
    800043c0:	ddc7b783          	ld	a5,-548(a5) # 80009198 <_GLOBAL_OFFSET_TABLE_+0x70>
    800043c4:	0007b783          	ld	a5,0(a5)
    800043c8:	04f71a63          	bne	a4,a5,8000441c <_ZN10OwnedMutex6signalEv+0x64>
    this->nesting_count --;
    800043cc:	01852783          	lw	a5,24(a0)
    800043d0:	fff7879b          	addiw	a5,a5,-1
    800043d4:	0007871b          	sext.w	a4,a5
    800043d8:	00f52c23          	sw	a5,24(a0)
    if (this->nesting_count == 0) {
    800043dc:	00070663          	beqz	a4,800043e8 <_ZN10OwnedMutex6signalEv+0x30>
        this->owner = nullptr;
        sem_signal(this->myHandle);
    }
    return 0;
    800043e0:	00000513          	li	a0,0
}
    800043e4:	00008067          	ret
int OwnedMutex::signal() {
    800043e8:	ff010113          	addi	sp,sp,-16
    800043ec:	00113423          	sd	ra,8(sp)
    800043f0:	00813023          	sd	s0,0(sp)
    800043f4:	01010413          	addi	s0,sp,16
        this->owner = nullptr;
    800043f8:	00053823          	sd	zero,16(a0)
        sem_signal(this->myHandle);
    800043fc:	00853503          	ld	a0,8(a0)
    80004400:	ffffd097          	auipc	ra,0xffffd
    80004404:	41c080e7          	jalr	1052(ra) # 8000181c <_Z10sem_signalP3Sem>
    return 0;
    80004408:	00000513          	li	a0,0
}
    8000440c:	00813083          	ld	ra,8(sp)
    80004410:	00013403          	ld	s0,0(sp)
    80004414:	01010113          	addi	sp,sp,16
    80004418:	00008067          	ret
    if (this->owner != TCB::running) return -1;
    8000441c:	fff00513          	li	a0,-1
    80004420:	00008067          	ret

0000000080004424 <_ZN10OwnedMutexC1Ev>:
OwnedMutex::OwnedMutex() : owner(nullptr), nesting_count(0) {
    80004424:	fe010113          	addi	sp,sp,-32
    80004428:	00113c23          	sd	ra,24(sp)
    8000442c:	00813823          	sd	s0,16(sp)
    80004430:	00913423          	sd	s1,8(sp)
    80004434:	01213023          	sd	s2,0(sp)
    80004438:	02010413          	addi	s0,sp,32
    8000443c:	00050493          	mv	s1,a0
    Mutex() : Semaphore(1) {}
    80004440:	00100593          	li	a1,1
    80004444:	fffff097          	auipc	ra,0xfffff
    80004448:	740080e7          	jalr	1856(ra) # 80003b84 <_ZN9SemaphoreC1Ej>
    8000444c:	00005797          	auipc	a5,0x5
    80004450:	cbc78793          	addi	a5,a5,-836 # 80009108 <_ZTV10OwnedMutex+0x10>
    80004454:	00f4b023          	sd	a5,0(s1)
    80004458:	0004b823          	sd	zero,16(s1)
    8000445c:	0004ac23          	sw	zero,24(s1)
    sem_open(&this->myHandle, 1);
    80004460:	00100593          	li	a1,1
    80004464:	00848513          	addi	a0,s1,8
    80004468:	ffffd097          	auipc	ra,0xffffd
    8000446c:	2f0080e7          	jalr	752(ra) # 80001758 <_Z8sem_openPP3Semj>
    80004470:	02c0006f          	j	8000449c <_ZN10OwnedMutexC1Ev+0x78>
    80004474:	00050913          	mv	s2,a0
class Mutex : public Semaphore {
    80004478:	00005797          	auipc	a5,0x5
    8000447c:	c6078793          	addi	a5,a5,-928 # 800090d8 <_ZTV5Mutex+0x10>
    80004480:	00f4b023          	sd	a5,0(s1)
    80004484:	00048513          	mv	a0,s1
    80004488:	fffff097          	auipc	ra,0xfffff
    8000448c:	34c080e7          	jalr	844(ra) # 800037d4 <_ZN9SemaphoreD1Ev>
    80004490:	00090513          	mv	a0,s2
    80004494:	00006097          	auipc	ra,0x6
    80004498:	f04080e7          	jalr	-252(ra) # 8000a398 <_Unwind_Resume>
}
    8000449c:	01813083          	ld	ra,24(sp)
    800044a0:	01013403          	ld	s0,16(sp)
    800044a4:	00813483          	ld	s1,8(sp)
    800044a8:	00013903          	ld	s2,0(sp)
    800044ac:	02010113          	addi	sp,sp,32
    800044b0:	00008067          	ret

00000000800044b4 <_ZN5MutexD1Ev>:
    800044b4:	ff010113          	addi	sp,sp,-16
    800044b8:	00113423          	sd	ra,8(sp)
    800044bc:	00813023          	sd	s0,0(sp)
    800044c0:	01010413          	addi	s0,sp,16
    800044c4:	00005797          	auipc	a5,0x5
    800044c8:	c1478793          	addi	a5,a5,-1004 # 800090d8 <_ZTV5Mutex+0x10>
    800044cc:	00f53023          	sd	a5,0(a0)
    800044d0:	fffff097          	auipc	ra,0xfffff
    800044d4:	304080e7          	jalr	772(ra) # 800037d4 <_ZN9SemaphoreD1Ev>
    800044d8:	00813083          	ld	ra,8(sp)
    800044dc:	00013403          	ld	s0,0(sp)
    800044e0:	01010113          	addi	sp,sp,16
    800044e4:	00008067          	ret

00000000800044e8 <_ZN5MutexD0Ev>:
    800044e8:	fe010113          	addi	sp,sp,-32
    800044ec:	00113c23          	sd	ra,24(sp)
    800044f0:	00813823          	sd	s0,16(sp)
    800044f4:	00913423          	sd	s1,8(sp)
    800044f8:	02010413          	addi	s0,sp,32
    800044fc:	00050493          	mv	s1,a0
    80004500:	00005797          	auipc	a5,0x5
    80004504:	bd878793          	addi	a5,a5,-1064 # 800090d8 <_ZTV5Mutex+0x10>
    80004508:	00f53023          	sd	a5,0(a0)
    8000450c:	fffff097          	auipc	ra,0xfffff
    80004510:	2c8080e7          	jalr	712(ra) # 800037d4 <_ZN9SemaphoreD1Ev>
    80004514:	00048513          	mv	a0,s1
    80004518:	fffff097          	auipc	ra,0xfffff
    8000451c:	39c080e7          	jalr	924(ra) # 800038b4 <_ZdlPv>
    80004520:	01813083          	ld	ra,24(sp)
    80004524:	01013403          	ld	s0,16(sp)
    80004528:	00813483          	ld	s1,8(sp)
    8000452c:	02010113          	addi	sp,sp,32
    80004530:	00008067          	ret

0000000080004534 <_ZN3TCB12thread_startEv>:
    if (TCB::running != thread->parent) return -4;
    thread->finish();
    return 0;
}

void TCB::thread_start() {
    80004534:	ff010113          	addi	sp,sp,-16
    80004538:	00113423          	sd	ra,8(sp)
    8000453c:	00813023          	sd	s0,0(sp)
    80004540:	01010413          	addi	s0,sp,16
    riscv::popSppSpie();
    80004544:	00000097          	auipc	ra,0x0
    80004548:	b20080e7          	jalr	-1248(ra) # 80004064 <_ZN5riscv10popSppSpieEv>
    TCB::running->_run(TCB::running->arg);
    8000454c:	00005797          	auipc	a5,0x5
    80004550:	d647b783          	ld	a5,-668(a5) # 800092b0 <_ZN3TCB7runningE>
    80004554:	0087b703          	ld	a4,8(a5)
    80004558:	0107b503          	ld	a0,16(a5)
    8000455c:	000700e7          	jalr	a4
    thread_exit();
    80004560:	ffffd097          	auipc	ra,0xffffd
    80004564:	05c080e7          	jalr	92(ra) # 800015bc <_Z11thread_exitv>
    80004568:	00813083          	ld	ra,8(sp)
    8000456c:	00013403          	ld	s0,0(sp)
    80004570:	01010113          	addi	sp,sp,16
    80004574:	00008067          	ret

0000000080004578 <_ZN3TCB5_killEPS_>:
int TCB::_kill(TCB *thread) {
    80004578:	ff010113          	addi	sp,sp,-16
    8000457c:	00813423          	sd	s0,8(sp)
    80004580:	01010413          	addi	s0,sp,16
    if (!thread) return -1;
    80004584:	02050c63          	beqz	a0,800045bc <_ZN3TCB5_killEPS_+0x44>
    bool is_finished() const { return this->status == FINISHED; }
    80004588:	04852703          	lw	a4,72(a0)
    if (thread->is_finished()) return -2;
    8000458c:	00400793          	li	a5,4
    80004590:	02f70a63          	beq	a4,a5,800045c4 <_ZN3TCB5_killEPS_+0x4c>
    if (TCB::running != thread->parent) return -4;
    80004594:	02053703          	ld	a4,32(a0)
    80004598:	00005797          	auipc	a5,0x5
    8000459c:	d187b783          	ld	a5,-744(a5) # 800092b0 <_ZN3TCB7runningE>
    800045a0:	02f71663          	bne	a4,a5,800045cc <_ZN3TCB5_killEPS_+0x54>
    void finish() { this->status = FINISHED; }
    800045a4:	00400793          	li	a5,4
    800045a8:	04f52423          	sw	a5,72(a0)
    return 0;
    800045ac:	00000513          	li	a0,0
}
    800045b0:	00813403          	ld	s0,8(sp)
    800045b4:	01010113          	addi	sp,sp,16
    800045b8:	00008067          	ret
    if (!thread) return -1;
    800045bc:	fff00513          	li	a0,-1
    800045c0:	ff1ff06f          	j	800045b0 <_ZN3TCB5_killEPS_+0x38>
    if (thread->is_finished()) return -2;
    800045c4:	ffe00513          	li	a0,-2
    800045c8:	fe9ff06f          	j	800045b0 <_ZN3TCB5_killEPS_+0x38>
    if (TCB::running != thread->parent) return -4;
    800045cc:	ffc00513          	li	a0,-4
    800045d0:	fe1ff06f          	j	800045b0 <_ZN3TCB5_killEPS_+0x38>

00000000800045d4 <_ZN3TCBC1EPFvPvES0_S0_7Context>:
TCB::TCB(run_t start_routine, void *arg, void *stack, Context context) :
    800045d4:	fe010113          	addi	sp,sp,-32
    800045d8:	00113c23          	sd	ra,24(sp)
    800045dc:	00813823          	sd	s0,16(sp)
    800045e0:	00913423          	sd	s1,8(sp)
    800045e4:	01213023          	sd	s2,0(sp)
    800045e8:	02010413          	addi	s0,sp,32
    800045ec:	00050493          	mv	s1,a0
        t_id(TCB::ID++), _run(start_routine), arg(arg),
    800045f0:	00005917          	auipc	s2,0x5
    800045f4:	cc090913          	addi	s2,s2,-832 # 800092b0 <_ZN3TCB7runningE>
    800045f8:	00892783          	lw	a5,8(s2)
    800045fc:	0017851b          	addiw	a0,a5,1
    80004600:	00a92423          	sw	a0,8(s2)
        time_slice(DEFAULT_TIME_SLICE), preempted(false), joiner() {
    80004604:	00f4a023          	sw	a5,0(s1)
    80004608:	00b4b423          	sd	a1,8(s1)
    8000460c:	00c4b823          	sd	a2,16(s1)
    80004610:	00d4bc23          	sd	a3,24(s1)
    80004614:	00093783          	ld	a5,0(s2)
    80004618:	02f4b023          	sd	a5,32(s1)
    8000461c:	00073583          	ld	a1,0(a4)
    80004620:	00873603          	ld	a2,8(a4)
    80004624:	01073683          	ld	a3,16(a4)
    80004628:	01873783          	ld	a5,24(a4)
    8000462c:	02b4b423          	sd	a1,40(s1)
    80004630:	02c4b823          	sd	a2,48(s1)
    80004634:	02d4bc23          	sd	a3,56(s1)
    80004638:	04f4b023          	sd	a5,64(s1)
    8000463c:	0404a423          	sw	zero,72(s1)
    80004640:	00100793          	li	a5,1
    80004644:	04f4b823          	sd	a5,80(s1)
    80004648:	04048c23          	sb	zero,88(s1)
    8000464c:	0604b023          	sd	zero,96(s1)
    80004650:	0604a423          	sw	zero,104(s1)
    80004654:	0604a623          	sw	zero,108(s1)
    80004658:	0604a823          	sw	zero,112(s1)
    8000465c:	0604aa23          	sw	zero,116(s1)
    this->joiner.init();
    80004660:	06048513          	addi	a0,s1,96
    80004664:	ffffe097          	auipc	ra,0xffffe
    80004668:	e68080e7          	jalr	-408(ra) # 800024cc <_ZN3stm14CircularBufferIP3TCBE4initEv>
    this->parent = TCB::running;
    8000466c:	00093783          	ld	a5,0(s2)
    80004670:	02f4b023          	sd	a5,32(s1)
}
    80004674:	01813083          	ld	ra,24(sp)
    80004678:	01013403          	ld	s0,16(sp)
    8000467c:	00813483          	ld	s1,8(sp)
    80004680:	00013903          	ld	s2,0(sp)
    80004684:	02010113          	addi	sp,sp,32
    80004688:	00008067          	ret

000000008000468c <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_>:
int TCB::_thread_create(thread_t *handle, void(*start_routine)(void *), void *arg, void *stack) {
    8000468c:	f8010113          	addi	sp,sp,-128
    80004690:	06113c23          	sd	ra,120(sp)
    80004694:	06813823          	sd	s0,112(sp)
    80004698:	06913423          	sd	s1,104(sp)
    8000469c:	07213023          	sd	s2,96(sp)
    800046a0:	05313c23          	sd	s3,88(sp)
    800046a4:	05413823          	sd	s4,80(sp)
    800046a8:	05513423          	sd	s5,72(sp)
    800046ac:	08010413          	addi	s0,sp,128
    800046b0:	00050913          	mv	s2,a0
    800046b4:	00058993          	mv	s3,a1
    800046b8:	00060a93          	mv	s5,a2
    800046bc:	00068a13          	mv	s4,a3
    *handle = new TCB(start_routine, arg, stack, {(uint64) thread_start, (uint64) stack + DEFAULT_STACK_SIZE - 1});
    800046c0:	fa043823          	sd	zero,-80(s0)
    800046c4:	fa043c23          	sd	zero,-72(s0)
    800046c8:	00000797          	auipc	a5,0x0
    800046cc:	e6c78793          	addi	a5,a5,-404 # 80004534 <_ZN3TCB12thread_startEv>
    800046d0:	faf43023          	sd	a5,-96(s0)
    800046d4:	000047b7          	lui	a5,0x4
    800046d8:	fff78793          	addi	a5,a5,-1 # 3fff <_entry-0x7fffc001>
    800046dc:	00f687b3          	add	a5,a3,a5
    800046e0:	faf43423          	sd	a5,-88(s0)
    800046e4:	07800513          	li	a0,120
    800046e8:	fffff097          	auipc	ra,0xfffff
    800046ec:	17c080e7          	jalr	380(ra) # 80003864 <_Znwm>
    800046f0:	00050493          	mv	s1,a0
    800046f4:	fa043783          	ld	a5,-96(s0)
    800046f8:	f8f43023          	sd	a5,-128(s0)
    800046fc:	fa843783          	ld	a5,-88(s0)
    80004700:	f8f43423          	sd	a5,-120(s0)
    80004704:	fb043783          	ld	a5,-80(s0)
    80004708:	f8f43823          	sd	a5,-112(s0)
    8000470c:	fb843783          	ld	a5,-72(s0)
    80004710:	f8f43c23          	sd	a5,-104(s0)
    80004714:	f8040713          	addi	a4,s0,-128
    80004718:	000a0693          	mv	a3,s4
    8000471c:	000a8613          	mv	a2,s5
    80004720:	00098593          	mv	a1,s3
    80004724:	00000097          	auipc	ra,0x0
    80004728:	eb0080e7          	jalr	-336(ra) # 800045d4 <_ZN3TCBC1EPFvPvES0_S0_7Context>
    8000472c:	00993023          	sd	s1,0(s2)
    if (start_routine) Scheduler::put(*handle);
    80004730:	02098e63          	beqz	s3,8000476c <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0xe0>
    80004734:	00048513          	mv	a0,s1
    80004738:	00000097          	auipc	ra,0x0
    8000473c:	aa8080e7          	jalr	-1368(ra) # 800041e0 <_ZN9Scheduler3putEP3TCB>
    return (*handle)->t_id;
    80004740:	00093783          	ld	a5,0(s2)
    80004744:	0007a503          	lw	a0,0(a5)
}
    80004748:	07813083          	ld	ra,120(sp)
    8000474c:	07013403          	ld	s0,112(sp)
    80004750:	06813483          	ld	s1,104(sp)
    80004754:	06013903          	ld	s2,96(sp)
    80004758:	05813983          	ld	s3,88(sp)
    8000475c:	05013a03          	ld	s4,80(sp)
    80004760:	04813a83          	ld	s5,72(sp)
    80004764:	08010113          	addi	sp,sp,128
    80004768:	00008067          	ret
    else TCB::running = *handle;
    8000476c:	00005797          	auipc	a5,0x5
    80004770:	b497b223          	sd	s1,-1212(a5) # 800092b0 <_ZN3TCB7runningE>
    80004774:	fcdff06f          	j	80004740 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0xb4>
    80004778:	00050913          	mv	s2,a0
    *handle = new TCB(start_routine, arg, stack, {(uint64) thread_start, (uint64) stack + DEFAULT_STACK_SIZE - 1});
    8000477c:	00048513          	mv	a0,s1
    80004780:	fffff097          	auipc	ra,0xfffff
    80004784:	134080e7          	jalr	308(ra) # 800038b4 <_ZdlPv>
    80004788:	00090513          	mv	a0,s2
    8000478c:	00006097          	auipc	ra,0x6
    80004790:	c0c080e7          	jalr	-1012(ra) # 8000a398 <_Unwind_Resume>

0000000080004794 <_ZN3TCBC1ERS_>:
TCB::TCB(TCB &parent) :
    80004794:	fe010113          	addi	sp,sp,-32
    80004798:	00113c23          	sd	ra,24(sp)
    8000479c:	00813823          	sd	s0,16(sp)
    800047a0:	00913423          	sd	s1,8(sp)
    800047a4:	01213023          	sd	s2,0(sp)
    800047a8:	02010413          	addi	s0,sp,32
    800047ac:	00050493          	mv	s1,a0
    800047b0:	00058913          	mv	s2,a1
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    800047b4:	00005717          	auipc	a4,0x5
    800047b8:	afc70713          	addi	a4,a4,-1284 # 800092b0 <_ZN3TCB7runningE>
    800047bc:	00872783          	lw	a5,8(a4)
    800047c0:	0017869b          	addiw	a3,a5,1
    800047c4:	00d72423          	sw	a3,8(a4)
        preempted(false), joiner() {
    800047c8:	00f52023          	sw	a5,0(a0)
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    800047cc:	0085b783          	ld	a5,8(a1)
        preempted(false), joiner() {
    800047d0:	00f53423          	sd	a5,8(a0)
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    800047d4:	0105b783          	ld	a5,16(a1)
        preempted(false), joiner() {
    800047d8:	00f53823          	sd	a5,16(a0)
        stack(Allocator::_mem_alloc(DEFAULT_STACK_SIZE)),
    800047dc:	00004537          	lui	a0,0x4
    800047e0:	fffff097          	auipc	ra,0xfffff
    800047e4:	83c080e7          	jalr	-1988(ra) # 8000301c <_ZN9Allocator10_mem_allocEm>
        preempted(false), joiner() {
    800047e8:	00a4bc23          	sd	a0,24(s1)
    800047ec:	0324b023          	sd	s2,32(s1)
    800047f0:	02893603          	ld	a2,40(s2)
    800047f4:	03093683          	ld	a3,48(s2)
    800047f8:	03893703          	ld	a4,56(s2)
    800047fc:	04093783          	ld	a5,64(s2)
    80004800:	02c4b423          	sd	a2,40(s1)
    80004804:	02d4b823          	sd	a3,48(s1)
    80004808:	02e4bc23          	sd	a4,56(s1)
    8000480c:	04f4b023          	sd	a5,64(s1)
    80004810:	0404a423          	sw	zero,72(s1)
    80004814:	00100793          	li	a5,1
    80004818:	04f4b823          	sd	a5,80(s1)
    8000481c:	04048c23          	sb	zero,88(s1)
    80004820:	0604b023          	sd	zero,96(s1)
    80004824:	0604a423          	sw	zero,104(s1)
    80004828:	0604a623          	sw	zero,108(s1)
    8000482c:	0604a823          	sw	zero,112(s1)
    80004830:	0604aa23          	sw	zero,116(s1)
    this->joiner.init();
    80004834:	06048513          	addi	a0,s1,96
    80004838:	ffffe097          	auipc	ra,0xffffe
    8000483c:	c94080e7          	jalr	-876(ra) # 800024cc <_ZN3stm14CircularBufferIP3TCBE4initEv>
    Scheduler::put(this);
    80004840:	00048513          	mv	a0,s1
    80004844:	00000097          	auipc	ra,0x0
    80004848:	99c080e7          	jalr	-1636(ra) # 800041e0 <_ZN9Scheduler3putEP3TCB>
}
    8000484c:	01813083          	ld	ra,24(sp)
    80004850:	01013403          	ld	s0,16(sp)
    80004854:	00813483          	ld	s1,8(sp)
    80004858:	00013903          	ld	s2,0(sp)
    8000485c:	02010113          	addi	sp,sp,32
    80004860:	00008067          	ret

0000000080004864 <_ZN3TCB5_forkEv>:
int TCB::_fork() {
    80004864:	fd010113          	addi	sp,sp,-48
    80004868:	02113423          	sd	ra,40(sp)
    8000486c:	02813023          	sd	s0,32(sp)
    80004870:	00913c23          	sd	s1,24(sp)
    80004874:	01213823          	sd	s2,16(sp)
    80004878:	03010413          	addi	s0,sp,48
    TCB *child = new TCB(*TCB::running);
    8000487c:	07800513          	li	a0,120
    80004880:	fffff097          	auipc	ra,0xfffff
    80004884:	fe4080e7          	jalr	-28(ra) # 80003864 <_Znwm>
    80004888:	00050493          	mv	s1,a0
    8000488c:	00005597          	auipc	a1,0x5
    80004890:	a245b583          	ld	a1,-1500(a1) # 800092b0 <_ZN3TCB7runningE>
    80004894:	00000097          	auipc	ra,0x0
    80004898:	f00080e7          	jalr	-256(ra) # 80004794 <_ZN3TCBC1ERS_>
    int volatile parent_id = TCB::running->t_id;
    8000489c:	00005917          	auipc	s2,0x5
    800048a0:	a1490913          	addi	s2,s2,-1516 # 800092b0 <_ZN3TCB7runningE>
    800048a4:	00093783          	ld	a5,0(s2)
    800048a8:	0007a703          	lw	a4,0(a5)
    800048ac:	fce42e23          	sw	a4,-36(s0)
    memcpy(TCB::running->stack, child->stack, DEFAULT_STACK_SIZE);
    800048b0:	00004637          	lui	a2,0x4
    800048b4:	0184b583          	ld	a1,24(s1)
    800048b8:	0187b503          	ld	a0,24(a5)
    800048bc:	fffff097          	auipc	ra,0xfffff
    800048c0:	a38080e7          	jalr	-1480(ra) # 800032f4 <_Z6memcpyPKvS0_i>
    context_inherit(&child->context);
    800048c4:	02848513          	addi	a0,s1,40
    800048c8:	ffffd097          	auipc	ra,0xffffd
    800048cc:	bbc080e7          	jalr	-1092(ra) # 80001484 <_ZN3TCB15context_inheritEP7Context>
    print_h((uint64)TCB::running);
    800048d0:	00093503          	ld	a0,0(s2)
    800048d4:	ffffe097          	auipc	ra,0xffffe
    800048d8:	fbc080e7          	jalr	-68(ra) # 80002890 <_Z7print_hm>
    if (TCB::running->t_id == parent_id) {
    800048dc:	00093783          	ld	a5,0(s2)
    800048e0:	0007a703          	lw	a4,0(a5)
    800048e4:	fdc42783          	lw	a5,-36(s0)
    800048e8:	0007879b          	sext.w	a5,a5
    800048ec:	02f70063          	beq	a4,a5,8000490c <_ZN3TCB5_forkEv+0xa8>
        return 0;
    800048f0:	00000513          	li	a0,0
}
    800048f4:	02813083          	ld	ra,40(sp)
    800048f8:	02013403          	ld	s0,32(sp)
    800048fc:	01813483          	ld	s1,24(sp)
    80004900:	01013903          	ld	s2,16(sp)
    80004904:	03010113          	addi	sp,sp,48
    80004908:	00008067          	ret
        return child->t_id;
    8000490c:	0004a503          	lw	a0,0(s1)
    80004910:	fe5ff06f          	j	800048f4 <_ZN3TCB5_forkEv+0x90>
    80004914:	00050913          	mv	s2,a0
    TCB *child = new TCB(*TCB::running);
    80004918:	00048513          	mv	a0,s1
    8000491c:	fffff097          	auipc	ra,0xfffff
    80004920:	f98080e7          	jalr	-104(ra) # 800038b4 <_ZdlPv>
    80004924:	00090513          	mv	a0,s2
    80004928:	00006097          	auipc	ra,0x6
    8000492c:	a70080e7          	jalr	-1424(ra) # 8000a398 <_Unwind_Resume>

0000000080004930 <_ZN3TCB14destroy_threadEPS_>:
TCB *TCB::destroy_thread(TCB *thread) {
    80004930:	fe010113          	addi	sp,sp,-32
    80004934:	00113c23          	sd	ra,24(sp)
    80004938:	00813823          	sd	s0,16(sp)
    8000493c:	00913423          	sd	s1,8(sp)
    80004940:	02010413          	addi	s0,sp,32
    80004944:	00050493          	mv	s1,a0
        inline bool is_empty() const { return this->size == 0; }
    80004948:	0704a783          	lw	a5,112(s1)
    while (!thread->joiner.is_empty()) {
    8000494c:	02078663          	beqz	a5,80004978 <_ZN3TCB14destroy_threadEPS_+0x48>
        TCB *next = thread->joiner.get();
    80004950:	06048513          	addi	a0,s1,96
    80004954:	ffffe097          	auipc	ra,0xffffe
    80004958:	bc8080e7          	jalr	-1080(ra) # 8000251c <_ZN3stm14CircularBufferIP3TCBE3getEv>
    bool is_joined() const { return this->status == JOINED; }
    8000495c:	04852703          	lw	a4,72(a0) # 4048 <_entry-0x7fffbfb8>
        if (next->is_joined()) {
    80004960:	00300793          	li	a5,3
    80004964:	fef712e3          	bne	a4,a5,80004948 <_ZN3TCB14destroy_threadEPS_+0x18>
    void run() { this->status = RUNNABLE; }
    80004968:	04052423          	sw	zero,72(a0)
            Scheduler::put(next);
    8000496c:	00000097          	auipc	ra,0x0
    80004970:	874080e7          	jalr	-1932(ra) # 800041e0 <_ZN9Scheduler3putEP3TCB>
    80004974:	fd5ff06f          	j	80004948 <_ZN3TCB14destroy_threadEPS_+0x18>
    thread->joiner.destroy();
    80004978:	06048513          	addi	a0,s1,96
    8000497c:	ffffe097          	auipc	ra,0xffffe
    80004980:	bec080e7          	jalr	-1044(ra) # 80002568 <_ZN3stm14CircularBufferIP3TCBE7destroyEv>
}
    80004984:	00048513          	mv	a0,s1
    80004988:	01813083          	ld	ra,24(sp)
    8000498c:	01013403          	ld	s0,16(sp)
    80004990:	00813483          	ld	s1,8(sp)
    80004994:	02010113          	addi	sp,sp,32
    80004998:	00008067          	ret

000000008000499c <_ZN3TCB16_thread_dispatchEv>:
void TCB::_thread_dispatch() {
    8000499c:	fe010113          	addi	sp,sp,-32
    800049a0:	00113c23          	sd	ra,24(sp)
    800049a4:	00813823          	sd	s0,16(sp)
    800049a8:	00913423          	sd	s1,8(sp)
    800049ac:	02010413          	addi	s0,sp,32
    thread_t old = TCB::running;
    800049b0:	00005497          	auipc	s1,0x5
    800049b4:	9004b483          	ld	s1,-1792(s1) # 800092b0 <_ZN3TCB7runningE>
    bool is_runnable() const { return this->status == RUNNABLE; }
    800049b8:	0484a783          	lw	a5,72(s1)
    if (old->is_runnable() && old != handle_bleya) {
    800049bc:	02079263          	bnez	a5,800049e0 <_ZN3TCB16_thread_dispatchEv+0x44>
    800049c0:	00004717          	auipc	a4,0x4
    800049c4:	78873703          	ld	a4,1928(a4) # 80009148 <_GLOBAL_OFFSET_TABLE_+0x20>
    800049c8:	00073703          	ld	a4,0(a4)
    800049cc:	00970a63          	beq	a4,s1,800049e0 <_ZN3TCB16_thread_dispatchEv+0x44>
        Scheduler::put(old);
    800049d0:	00048513          	mv	a0,s1
    800049d4:	00000097          	auipc	ra,0x0
    800049d8:	80c080e7          	jalr	-2036(ra) # 800041e0 <_ZN9Scheduler3putEP3TCB>
    800049dc:	00c0006f          	j	800049e8 <_ZN3TCB16_thread_dispatchEv+0x4c>
    } else if (old->is_finished()) {
    800049e0:	00400713          	li	a4,4
    800049e4:	04e78663          	beq	a5,a4,80004a30 <_ZN3TCB16_thread_dispatchEv+0x94>
    800049e8:	00004797          	auipc	a5,0x4
    800049ec:	7c87b783          	ld	a5,1992(a5) # 800091b0 <_GLOBAL_OFFSET_TABLE_+0x88>
    800049f0:	0107a783          	lw	a5,16(a5)
    800049f4:	06079463          	bnez	a5,80004a5c <_ZN3TCB16_thread_dispatchEv+0xc0>
    800049f8:	00004797          	auipc	a5,0x4
    800049fc:	7987b783          	ld	a5,1944(a5) # 80009190 <_GLOBAL_OFFSET_TABLE_+0x68>
    80004a00:	0107a783          	lw	a5,16(a5)
    80004a04:	04079c63          	bnez	a5,80004a5c <_ZN3TCB16_thread_dispatchEv+0xc0>
    80004a08:	00004797          	auipc	a5,0x4
    80004a0c:	7607b783          	ld	a5,1888(a5) # 80009168 <_GLOBAL_OFFSET_TABLE_+0x40>
    80004a10:	0107a783          	lw	a5,16(a5)
    80004a14:	04079463          	bnez	a5,80004a5c <_ZN3TCB16_thread_dispatchEv+0xc0>
        TCB::running = handle_bleya;
    80004a18:	00004797          	auipc	a5,0x4
    80004a1c:	7307b783          	ld	a5,1840(a5) # 80009148 <_GLOBAL_OFFSET_TABLE_+0x20>
    80004a20:	0007b783          	ld	a5,0(a5)
    80004a24:	00005717          	auipc	a4,0x5
    80004a28:	88f73623          	sd	a5,-1908(a4) # 800092b0 <_ZN3TCB7runningE>
    80004a2c:	0540006f          	j	80004a80 <_ZN3TCB16_thread_dispatchEv+0xe4>
        Allocator::_mem_free(old->stack);
    80004a30:	0184b503          	ld	a0,24(s1)
    80004a34:	ffffe097          	auipc	ra,0xffffe
    80004a38:	6a4080e7          	jalr	1700(ra) # 800030d8 <_ZN9Allocator9_mem_freeEPKv>
    80004a3c:	fadff06f          	j	800049e8 <_ZN3TCB16_thread_dispatchEv+0x4c>
            Allocator::_mem_free(TCB::destroy_thread(Scheduler::get())->stack);
    80004a40:	fffff097          	auipc	ra,0xfffff
    80004a44:	6b4080e7          	jalr	1716(ra) # 800040f4 <_ZN9Scheduler3getEv>
    80004a48:	00000097          	auipc	ra,0x0
    80004a4c:	ee8080e7          	jalr	-280(ra) # 80004930 <_ZN3TCB14destroy_threadEPS_>
    80004a50:	01853503          	ld	a0,24(a0)
    80004a54:	ffffe097          	auipc	ra,0xffffe
    80004a58:	684080e7          	jalr	1668(ra) # 800030d8 <_ZN9Allocator9_mem_freeEPKv>
        while (Scheduler::peek()->is_finished()) {
    80004a5c:	fffff097          	auipc	ra,0xfffff
    80004a60:	708080e7          	jalr	1800(ra) # 80004164 <_ZN9Scheduler4peekEv>
    bool is_finished() const { return this->status == FINISHED; }
    80004a64:	04852703          	lw	a4,72(a0)
    80004a68:	00400793          	li	a5,4
    80004a6c:	fcf70ae3          	beq	a4,a5,80004a40 <_ZN3TCB16_thread_dispatchEv+0xa4>
        TCB::running = Scheduler::get();
    80004a70:	fffff097          	auipc	ra,0xfffff
    80004a74:	684080e7          	jalr	1668(ra) # 800040f4 <_ZN9Scheduler3getEv>
    80004a78:	00005797          	auipc	a5,0x5
    80004a7c:	82a7bc23          	sd	a0,-1992(a5) # 800092b0 <_ZN3TCB7runningE>
    if (riscv::setjump()) {
    80004a80:	ffffd097          	auipc	ra,0xffffd
    80004a84:	8e0080e7          	jalr	-1824(ra) # 80001360 <_ZN5riscv7setjumpEv>
    80004a88:	00051c63          	bnez	a0,80004aa0 <_ZN3TCB16_thread_dispatchEv+0x104>
}
    80004a8c:	01813083          	ld	ra,24(sp)
    80004a90:	01013403          	ld	s0,16(sp)
    80004a94:	00813483          	ld	s1,8(sp)
    80004a98:	02010113          	addi	sp,sp,32
    80004a9c:	00008067          	ret
        TCB::context_switch(&old->context, &TCB::running->context);
    80004aa0:	00005597          	auipc	a1,0x5
    80004aa4:	8105b583          	ld	a1,-2032(a1) # 800092b0 <_ZN3TCB7runningE>
    80004aa8:	02858593          	addi	a1,a1,40
    80004aac:	02848513          	addi	a0,s1,40
    80004ab0:	ffffd097          	auipc	ra,0xffffd
    80004ab4:	9c0080e7          	jalr	-1600(ra) # 80001470 <_ZN3TCB14context_switchEP7ContextS1_>
        riscv::longjump();
    80004ab8:	ffffd097          	auipc	ra,0xffffd
    80004abc:	934080e7          	jalr	-1740(ra) # 800013ec <_ZN5riscv8longjumpEv>
}
    80004ac0:	fcdff06f          	j	80004a8c <_ZN3TCB16_thread_dispatchEv+0xf0>

0000000080004ac4 <_ZN3TCB12_thread_exitEv>:
void TCB::_thread_exit() {
    80004ac4:	ff010113          	addi	sp,sp,-16
    80004ac8:	00113423          	sd	ra,8(sp)
    80004acc:	00813023          	sd	s0,0(sp)
    80004ad0:	01010413          	addi	s0,sp,16
    TCB::running->finish();
    80004ad4:	00004517          	auipc	a0,0x4
    80004ad8:	7dc53503          	ld	a0,2012(a0) # 800092b0 <_ZN3TCB7runningE>
    void finish() { this->status = FINISHED; }
    80004adc:	00400793          	li	a5,4
    80004ae0:	04f52423          	sw	a5,72(a0)
    TCB::destroy_thread(TCB::running);
    80004ae4:	00000097          	auipc	ra,0x0
    80004ae8:	e4c080e7          	jalr	-436(ra) # 80004930 <_ZN3TCB14destroy_threadEPS_>
    TCB::_thread_dispatch();
    80004aec:	00000097          	auipc	ra,0x0
    80004af0:	eb0080e7          	jalr	-336(ra) # 8000499c <_ZN3TCB16_thread_dispatchEv>
}
    80004af4:	00813083          	ld	ra,8(sp)
    80004af8:	00013403          	ld	s0,0(sp)
    80004afc:	01010113          	addi	sp,sp,16
    80004b00:	00008067          	ret

0000000080004b04 <_ZN3TCB12_thread_joinEPS_>:
    bool is_finished() const { return this->status == FINISHED; }
    80004b04:	04852703          	lw	a4,72(a0)
    if (handle->is_finished())
    80004b08:	00400793          	li	a5,4
    80004b0c:	04f70463          	beq	a4,a5,80004b54 <_ZN3TCB12_thread_joinEPS_+0x50>
void TCB::_thread_join(thread_t handle) {
    80004b10:	ff010113          	addi	sp,sp,-16
    80004b14:	00113423          	sd	ra,8(sp)
    80004b18:	00813023          	sd	s0,0(sp)
    80004b1c:	01010413          	addi	s0,sp,16
    TCB::running->enjoin();
    80004b20:	00004597          	auipc	a1,0x4
    80004b24:	7905b583          	ld	a1,1936(a1) # 800092b0 <_ZN3TCB7runningE>
    void enjoin() { this->status = JOINED; }
    80004b28:	00300793          	li	a5,3
    80004b2c:	04f5a423          	sw	a5,72(a1)
    handle->joiner.put(TCB::running);
    80004b30:	06050513          	addi	a0,a0,96
    80004b34:	ffffe097          	auipc	ra,0xffffe
    80004b38:	b0c080e7          	jalr	-1268(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    TCB::_thread_dispatch();
    80004b3c:	00000097          	auipc	ra,0x0
    80004b40:	e60080e7          	jalr	-416(ra) # 8000499c <_ZN3TCB16_thread_dispatchEv>
}
    80004b44:	00813083          	ld	ra,8(sp)
    80004b48:	00013403          	ld	s0,0(sp)
    80004b4c:	01010113          	addi	sp,sp,16
    80004b50:	00008067          	ret
    80004b54:	00008067          	ret

0000000080004b58 <_ZN3TCB17_thread_join_timeEPS_m>:
    bool is_finished() const { return this->status == FINISHED; }
    80004b58:	04852703          	lw	a4,72(a0)
    if (handle->is_finished())
    80004b5c:	00400793          	li	a5,4
    80004b60:	06f70863          	beq	a4,a5,80004bd0 <_ZN3TCB17_thread_join_timeEPS_m+0x78>
void TCB::_thread_join_time(thread_t handle, time_t time) {
    80004b64:	fe010113          	addi	sp,sp,-32
    80004b68:	00113c23          	sd	ra,24(sp)
    80004b6c:	00813823          	sd	s0,16(sp)
    80004b70:	00913423          	sd	s1,8(sp)
    80004b74:	01213023          	sd	s2,0(sp)
    80004b78:	02010413          	addi	s0,sp,32
    80004b7c:	00058493          	mv	s1,a1
    TCB::running->enjoin();
    80004b80:	00004917          	auipc	s2,0x4
    80004b84:	73090913          	addi	s2,s2,1840 # 800092b0 <_ZN3TCB7runningE>
    80004b88:	00093583          	ld	a1,0(s2)
    void enjoin() { this->status = JOINED; }
    80004b8c:	00300793          	li	a5,3
    80004b90:	04f5a423          	sw	a5,72(a1)
    handle->joiner.put(TCB::running);
    80004b94:	06050513          	addi	a0,a0,96
    80004b98:	ffffe097          	auipc	ra,0xffffe
    80004b9c:	aa8080e7          	jalr	-1368(ra) # 80002640 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    Cradle::insert(TCB::running, time);
    80004ba0:	00048593          	mv	a1,s1
    80004ba4:	00093503          	ld	a0,0(s2)
    80004ba8:	ffffe097          	auipc	ra,0xffffe
    80004bac:	0f4080e7          	jalr	244(ra) # 80002c9c <_ZN6Cradle6insertEP3TCBm>
    TCB::_thread_dispatch();
    80004bb0:	00000097          	auipc	ra,0x0
    80004bb4:	dec080e7          	jalr	-532(ra) # 8000499c <_ZN3TCB16_thread_dispatchEv>
}
    80004bb8:	01813083          	ld	ra,24(sp)
    80004bbc:	01013403          	ld	s0,16(sp)
    80004bc0:	00813483          	ld	s1,8(sp)
    80004bc4:	00013903          	ld	s2,0(sp)
    80004bc8:	02010113          	addi	sp,sp,32
    80004bcc:	00008067          	ret
    80004bd0:	00008067          	ret

0000000080004bd4 <_ZN12MonitorMutex10relinquishEv>:
#include "../h/monitor.hpp"

int MonitorMutex::relinquish() {
    80004bd4:	ff010113          	addi	sp,sp,-16
    80004bd8:	00813423          	sd	s0,8(sp)
    80004bdc:	01010413          	addi	s0,sp,16
    80004be0:	00050793          	mv	a5,a0
    int ret = this->nesting_count;
    80004be4:	01852503          	lw	a0,24(a0)
    this->nesting_count = 1;
    80004be8:	00100713          	li	a4,1
    80004bec:	00e7ac23          	sw	a4,24(a5)
    return ret;
}
    80004bf0:	00813403          	ld	s0,8(sp)
    80004bf4:	01010113          	addi	sp,sp,16
    80004bf8:	00008067          	ret

0000000080004bfc <_ZN12MonitorMutex9reacquireEi>:

void MonitorMutex::reacquire(int count) {
    80004bfc:	ff010113          	addi	sp,sp,-16
    80004c00:	00813423          	sd	s0,8(sp)
    80004c04:	01010413          	addi	s0,sp,16
    this->nesting_count = count;
    80004c08:	00b52c23          	sw	a1,24(a0)
}
    80004c0c:	00813403          	ld	s0,8(sp)
    80004c10:	01010113          	addi	sp,sp,16
    80004c14:	00008067          	ret

0000000080004c18 <_ZN11MonitorLockC1ER12MonitorMutex>:

MonitorLock::MonitorLock(MonitorMutex &mutex) : monitorMutex(mutex) {
    80004c18:	ff010113          	addi	sp,sp,-16
    80004c1c:	00113423          	sd	ra,8(sp)
    80004c20:	00813023          	sd	s0,0(sp)
    80004c24:	01010413          	addi	s0,sp,16
    80004c28:	00b53023          	sd	a1,0(a0)
    this->monitorMutex.wait();
    80004c2c:	0005b783          	ld	a5,0(a1)
    80004c30:	0107b783          	ld	a5,16(a5)
    80004c34:	00058513          	mv	a0,a1
    80004c38:	000780e7          	jalr	a5
}
    80004c3c:	00813083          	ld	ra,8(sp)
    80004c40:	00013403          	ld	s0,0(sp)
    80004c44:	01010113          	addi	sp,sp,16
    80004c48:	00008067          	ret

0000000080004c4c <_ZN11MonitorLockD1Ev>:

MonitorLock::~MonitorLock() {
    80004c4c:	ff010113          	addi	sp,sp,-16
    80004c50:	00113423          	sd	ra,8(sp)
    80004c54:	00813023          	sd	s0,0(sp)
    80004c58:	01010413          	addi	s0,sp,16
    this->monitorMutex.signal();
    80004c5c:	00053503          	ld	a0,0(a0)
    80004c60:	00053783          	ld	a5,0(a0)
    80004c64:	0187b783          	ld	a5,24(a5)
    80004c68:	000780e7          	jalr	a5
}
    80004c6c:	00813083          	ld	ra,8(sp)
    80004c70:	00013403          	ld	s0,0(sp)
    80004c74:	01010113          	addi	sp,sp,16
    80004c78:	00008067          	ret

0000000080004c7c <_ZN11ConditionalC1EP7Monitor>:

Conditional::Conditional(Monitor *monitor) : owner(monitor), count(0), blocker(0) {}
    80004c7c:	ff010113          	addi	sp,sp,-16
    80004c80:	00113423          	sd	ra,8(sp)
    80004c84:	00813023          	sd	s0,0(sp)
    80004c88:	01010413          	addi	s0,sp,16
    80004c8c:	00b53023          	sd	a1,0(a0)
    80004c90:	00052423          	sw	zero,8(a0)
    80004c94:	00000593          	li	a1,0
    80004c98:	01050513          	addi	a0,a0,16
    80004c9c:	fffff097          	auipc	ra,0xfffff
    80004ca0:	ee8080e7          	jalr	-280(ra) # 80003b84 <_ZN9SemaphoreC1Ej>
    80004ca4:	00813083          	ld	ra,8(sp)
    80004ca8:	00013403          	ld	s0,0(sp)
    80004cac:	01010113          	addi	sp,sp,16
    80004cb0:	00008067          	ret

0000000080004cb4 <_ZN11Conditional4waitEv>:

void Conditional::wait() {
    80004cb4:	fe010113          	addi	sp,sp,-32
    80004cb8:	00113c23          	sd	ra,24(sp)
    80004cbc:	00813823          	sd	s0,16(sp)
    80004cc0:	00913423          	sd	s1,8(sp)
    80004cc4:	01213023          	sd	s2,0(sp)
    80004cc8:	02010413          	addi	s0,sp,32
    80004ccc:	00050493          	mv	s1,a0
    this->count++;
    80004cd0:	00852783          	lw	a5,8(a0)
    80004cd4:	0017879b          	addiw	a5,a5,1
    80004cd8:	00f52423          	sw	a5,8(a0)
    int nesting = this->owner->monitorMutex.relinquish();
    80004cdc:	00053503          	ld	a0,0(a0)
    80004ce0:	00000097          	auipc	ra,0x0
    80004ce4:	ef4080e7          	jalr	-268(ra) # 80004bd4 <_ZN12MonitorMutex10relinquishEv>
    80004ce8:	00050913          	mv	s2,a0
    Semaphore::signal_and_wait(this->owner->monitorMutex, this->blocker);
    80004cec:	01048593          	addi	a1,s1,16
    80004cf0:	0004b503          	ld	a0,0(s1)
    80004cf4:	fffff097          	auipc	ra,0xfffff
    80004cf8:	ec8080e7          	jalr	-312(ra) # 80003bbc <_ZN9Semaphore15signal_and_waitERS_S0_>
    this->owner->monitorMutex.reacquire(nesting);
    80004cfc:	00090593          	mv	a1,s2
    80004d00:	0004b503          	ld	a0,0(s1)
    80004d04:	00000097          	auipc	ra,0x0
    80004d08:	ef8080e7          	jalr	-264(ra) # 80004bfc <_ZN12MonitorMutex9reacquireEi>
    this->owner->monitorMutex.wait();
    80004d0c:	0004b503          	ld	a0,0(s1)
    80004d10:	fffff097          	auipc	ra,0xfffff
    80004d14:	63c080e7          	jalr	1596(ra) # 8000434c <_ZN10OwnedMutex4waitEv>
}
    80004d18:	01813083          	ld	ra,24(sp)
    80004d1c:	01013403          	ld	s0,16(sp)
    80004d20:	00813483          	ld	s1,8(sp)
    80004d24:	00013903          	ld	s2,0(sp)
    80004d28:	02010113          	addi	sp,sp,32
    80004d2c:	00008067          	ret

0000000080004d30 <_ZN11Conditional6signalEv>:

void Conditional::signal() {
    if (this->count == 0) return;
    80004d30:	00852783          	lw	a5,8(a0)
    80004d34:	00079463          	bnez	a5,80004d3c <_ZN11Conditional6signalEv+0xc>
    80004d38:	00008067          	ret
void Conditional::signal() {
    80004d3c:	fe010113          	addi	sp,sp,-32
    80004d40:	00113c23          	sd	ra,24(sp)
    80004d44:	00813823          	sd	s0,16(sp)
    80004d48:	00913423          	sd	s1,8(sp)
    80004d4c:	02010413          	addi	s0,sp,32
    80004d50:	00050493          	mv	s1,a0
    this->blocker.signal();
    80004d54:	01050513          	addi	a0,a0,16
    80004d58:	fffff097          	auipc	ra,0xfffff
    80004d5c:	ae0080e7          	jalr	-1312(ra) # 80003838 <_ZN9Semaphore6signalEv>
    this->count--;
    80004d60:	0084a783          	lw	a5,8(s1)
    80004d64:	fff7879b          	addiw	a5,a5,-1
    80004d68:	00f4a423          	sw	a5,8(s1)
}
    80004d6c:	01813083          	ld	ra,24(sp)
    80004d70:	01013403          	ld	s0,16(sp)
    80004d74:	00813483          	ld	s1,8(sp)
    80004d78:	02010113          	addi	sp,sp,32
    80004d7c:	00008067          	ret

0000000080004d80 <_ZN11Conditional9signalAllEv>:

void Conditional::signalAll() {
    80004d80:	fe010113          	addi	sp,sp,-32
    80004d84:	00113c23          	sd	ra,24(sp)
    80004d88:	00813823          	sd	s0,16(sp)
    80004d8c:	00913423          	sd	s1,8(sp)
    80004d90:	01213023          	sd	s2,0(sp)
    80004d94:	02010413          	addi	s0,sp,32
    80004d98:	00050913          	mv	s2,a0
    for (unsigned int i = 0; i < this->count; i++)
    80004d9c:	00000493          	li	s1,0
    80004da0:	00892783          	lw	a5,8(s2)
    80004da4:	00f4fc63          	bgeu	s1,a5,80004dbc <_ZN11Conditional9signalAllEv+0x3c>
        this->blocker.signal();
    80004da8:	01090513          	addi	a0,s2,16
    80004dac:	fffff097          	auipc	ra,0xfffff
    80004db0:	a8c080e7          	jalr	-1396(ra) # 80003838 <_ZN9Semaphore6signalEv>
    for (unsigned int i = 0; i < this->count; i++)
    80004db4:	0014849b          	addiw	s1,s1,1
    80004db8:	fe9ff06f          	j	80004da0 <_ZN11Conditional9signalAllEv+0x20>
    this->count = 0;
    80004dbc:	00092423          	sw	zero,8(s2)
    80004dc0:	01813083          	ld	ra,24(sp)
    80004dc4:	01013403          	ld	s0,16(sp)
    80004dc8:	00813483          	ld	s1,8(sp)
    80004dcc:	00013903          	ld	s2,0(sp)
    80004dd0:	02010113          	addi	sp,sp,32
    80004dd4:	00008067          	ret

0000000080004dd8 <start>:
    80004dd8:	ff010113          	addi	sp,sp,-16
    80004ddc:	00813423          	sd	s0,8(sp)
    80004de0:	01010413          	addi	s0,sp,16
    80004de4:	300027f3          	csrr	a5,mstatus
    80004de8:	ffffe737          	lui	a4,0xffffe
    80004dec:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff42cf>
    80004df0:	00e7f7b3          	and	a5,a5,a4
    80004df4:	00001737          	lui	a4,0x1
    80004df8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004dfc:	00e7e7b3          	or	a5,a5,a4
    80004e00:	30079073          	csrw	mstatus,a5
    80004e04:	00000797          	auipc	a5,0x0
    80004e08:	16078793          	addi	a5,a5,352 # 80004f64 <system_main>
    80004e0c:	34179073          	csrw	mepc,a5
    80004e10:	00000793          	li	a5,0
    80004e14:	18079073          	csrw	satp,a5
    80004e18:	000107b7          	lui	a5,0x10
    80004e1c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80004e20:	30279073          	csrw	medeleg,a5
    80004e24:	30379073          	csrw	mideleg,a5
    80004e28:	104027f3          	csrr	a5,sie
    80004e2c:	2227e793          	ori	a5,a5,546
    80004e30:	10479073          	csrw	sie,a5
    80004e34:	fff00793          	li	a5,-1
    80004e38:	00a7d793          	srli	a5,a5,0xa
    80004e3c:	3b079073          	csrw	pmpaddr0,a5
    80004e40:	00f00793          	li	a5,15
    80004e44:	3a079073          	csrw	pmpcfg0,a5
    80004e48:	f14027f3          	csrr	a5,mhartid
    80004e4c:	0200c737          	lui	a4,0x200c
    80004e50:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004e54:	0007869b          	sext.w	a3,a5
    80004e58:	00269713          	slli	a4,a3,0x2
    80004e5c:	000f4637          	lui	a2,0xf4
    80004e60:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004e64:	00d70733          	add	a4,a4,a3
    80004e68:	0037979b          	slliw	a5,a5,0x3
    80004e6c:	020046b7          	lui	a3,0x2004
    80004e70:	00d787b3          	add	a5,a5,a3
    80004e74:	00c585b3          	add	a1,a1,a2
    80004e78:	00371693          	slli	a3,a4,0x3
    80004e7c:	00004717          	auipc	a4,0x4
    80004e80:	45470713          	addi	a4,a4,1108 # 800092d0 <timer_scratch>
    80004e84:	00b7b023          	sd	a1,0(a5)
    80004e88:	00d70733          	add	a4,a4,a3
    80004e8c:	00f73c23          	sd	a5,24(a4)
    80004e90:	02c73023          	sd	a2,32(a4)
    80004e94:	34071073          	csrw	mscratch,a4
    80004e98:	00000797          	auipc	a5,0x0
    80004e9c:	6e878793          	addi	a5,a5,1768 # 80005580 <timervec>
    80004ea0:	30579073          	csrw	mtvec,a5
    80004ea4:	300027f3          	csrr	a5,mstatus
    80004ea8:	0087e793          	ori	a5,a5,8
    80004eac:	30079073          	csrw	mstatus,a5
    80004eb0:	304027f3          	csrr	a5,mie
    80004eb4:	0807e793          	ori	a5,a5,128
    80004eb8:	30479073          	csrw	mie,a5
    80004ebc:	f14027f3          	csrr	a5,mhartid
    80004ec0:	0007879b          	sext.w	a5,a5
    80004ec4:	00078213          	mv	tp,a5
    80004ec8:	30200073          	mret
    80004ecc:	00813403          	ld	s0,8(sp)
    80004ed0:	01010113          	addi	sp,sp,16
    80004ed4:	00008067          	ret

0000000080004ed8 <timerinit>:
    80004ed8:	ff010113          	addi	sp,sp,-16
    80004edc:	00813423          	sd	s0,8(sp)
    80004ee0:	01010413          	addi	s0,sp,16
    80004ee4:	f14027f3          	csrr	a5,mhartid
    80004ee8:	0200c737          	lui	a4,0x200c
    80004eec:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004ef0:	0007869b          	sext.w	a3,a5
    80004ef4:	00269713          	slli	a4,a3,0x2
    80004ef8:	000f4637          	lui	a2,0xf4
    80004efc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004f00:	00d70733          	add	a4,a4,a3
    80004f04:	0037979b          	slliw	a5,a5,0x3
    80004f08:	020046b7          	lui	a3,0x2004
    80004f0c:	00d787b3          	add	a5,a5,a3
    80004f10:	00c585b3          	add	a1,a1,a2
    80004f14:	00371693          	slli	a3,a4,0x3
    80004f18:	00004717          	auipc	a4,0x4
    80004f1c:	3b870713          	addi	a4,a4,952 # 800092d0 <timer_scratch>
    80004f20:	00b7b023          	sd	a1,0(a5)
    80004f24:	00d70733          	add	a4,a4,a3
    80004f28:	00f73c23          	sd	a5,24(a4)
    80004f2c:	02c73023          	sd	a2,32(a4)
    80004f30:	34071073          	csrw	mscratch,a4
    80004f34:	00000797          	auipc	a5,0x0
    80004f38:	64c78793          	addi	a5,a5,1612 # 80005580 <timervec>
    80004f3c:	30579073          	csrw	mtvec,a5
    80004f40:	300027f3          	csrr	a5,mstatus
    80004f44:	0087e793          	ori	a5,a5,8
    80004f48:	30079073          	csrw	mstatus,a5
    80004f4c:	304027f3          	csrr	a5,mie
    80004f50:	0807e793          	ori	a5,a5,128
    80004f54:	30479073          	csrw	mie,a5
    80004f58:	00813403          	ld	s0,8(sp)
    80004f5c:	01010113          	addi	sp,sp,16
    80004f60:	00008067          	ret

0000000080004f64 <system_main>:
    80004f64:	fe010113          	addi	sp,sp,-32
    80004f68:	00813823          	sd	s0,16(sp)
    80004f6c:	00913423          	sd	s1,8(sp)
    80004f70:	00113c23          	sd	ra,24(sp)
    80004f74:	02010413          	addi	s0,sp,32
    80004f78:	00000097          	auipc	ra,0x0
    80004f7c:	0c4080e7          	jalr	196(ra) # 8000503c <cpuid>
    80004f80:	00004497          	auipc	s1,0x4
    80004f84:	25048493          	addi	s1,s1,592 # 800091d0 <started>
    80004f88:	02050263          	beqz	a0,80004fac <system_main+0x48>
    80004f8c:	0004a783          	lw	a5,0(s1)
    80004f90:	0007879b          	sext.w	a5,a5
    80004f94:	fe078ce3          	beqz	a5,80004f8c <system_main+0x28>
    80004f98:	0ff0000f          	fence
    80004f9c:	00002517          	auipc	a0,0x2
    80004fa0:	14450513          	addi	a0,a0,324 # 800070e0 <_ZN3stm4coutE+0x80>
    80004fa4:	00001097          	auipc	ra,0x1
    80004fa8:	a78080e7          	jalr	-1416(ra) # 80005a1c <panic>
    80004fac:	00001097          	auipc	ra,0x1
    80004fb0:	9cc080e7          	jalr	-1588(ra) # 80005978 <consoleinit>
    80004fb4:	00001097          	auipc	ra,0x1
    80004fb8:	158080e7          	jalr	344(ra) # 8000610c <printfinit>
    80004fbc:	00002517          	auipc	a0,0x2
    80004fc0:	20450513          	addi	a0,a0,516 # 800071c0 <_ZN3stm4coutE+0x160>
    80004fc4:	00001097          	auipc	ra,0x1
    80004fc8:	ab4080e7          	jalr	-1356(ra) # 80005a78 <__printf>
    80004fcc:	00002517          	auipc	a0,0x2
    80004fd0:	0e450513          	addi	a0,a0,228 # 800070b0 <_ZN3stm4coutE+0x50>
    80004fd4:	00001097          	auipc	ra,0x1
    80004fd8:	aa4080e7          	jalr	-1372(ra) # 80005a78 <__printf>
    80004fdc:	00002517          	auipc	a0,0x2
    80004fe0:	1e450513          	addi	a0,a0,484 # 800071c0 <_ZN3stm4coutE+0x160>
    80004fe4:	00001097          	auipc	ra,0x1
    80004fe8:	a94080e7          	jalr	-1388(ra) # 80005a78 <__printf>
    80004fec:	00001097          	auipc	ra,0x1
    80004ff0:	4ac080e7          	jalr	1196(ra) # 80006498 <kinit>
    80004ff4:	00000097          	auipc	ra,0x0
    80004ff8:	148080e7          	jalr	328(ra) # 8000513c <trapinit>
    80004ffc:	00000097          	auipc	ra,0x0
    80005000:	16c080e7          	jalr	364(ra) # 80005168 <trapinithart>
    80005004:	00000097          	auipc	ra,0x0
    80005008:	5bc080e7          	jalr	1468(ra) # 800055c0 <plicinit>
    8000500c:	00000097          	auipc	ra,0x0
    80005010:	5dc080e7          	jalr	1500(ra) # 800055e8 <plicinithart>
    80005014:	00000097          	auipc	ra,0x0
    80005018:	078080e7          	jalr	120(ra) # 8000508c <userinit>
    8000501c:	0ff0000f          	fence
    80005020:	00100793          	li	a5,1
    80005024:	00002517          	auipc	a0,0x2
    80005028:	0a450513          	addi	a0,a0,164 # 800070c8 <_ZN3stm4coutE+0x68>
    8000502c:	00f4a023          	sw	a5,0(s1)
    80005030:	00001097          	auipc	ra,0x1
    80005034:	a48080e7          	jalr	-1464(ra) # 80005a78 <__printf>
    80005038:	0000006f          	j	80005038 <system_main+0xd4>

000000008000503c <cpuid>:
    8000503c:	ff010113          	addi	sp,sp,-16
    80005040:	00813423          	sd	s0,8(sp)
    80005044:	01010413          	addi	s0,sp,16
    80005048:	00020513          	mv	a0,tp
    8000504c:	00813403          	ld	s0,8(sp)
    80005050:	0005051b          	sext.w	a0,a0
    80005054:	01010113          	addi	sp,sp,16
    80005058:	00008067          	ret

000000008000505c <mycpu>:
    8000505c:	ff010113          	addi	sp,sp,-16
    80005060:	00813423          	sd	s0,8(sp)
    80005064:	01010413          	addi	s0,sp,16
    80005068:	00020793          	mv	a5,tp
    8000506c:	00813403          	ld	s0,8(sp)
    80005070:	0007879b          	sext.w	a5,a5
    80005074:	00779793          	slli	a5,a5,0x7
    80005078:	00005517          	auipc	a0,0x5
    8000507c:	28850513          	addi	a0,a0,648 # 8000a300 <cpus>
    80005080:	00f50533          	add	a0,a0,a5
    80005084:	01010113          	addi	sp,sp,16
    80005088:	00008067          	ret

000000008000508c <userinit>:
    8000508c:	ff010113          	addi	sp,sp,-16
    80005090:	00813423          	sd	s0,8(sp)
    80005094:	01010413          	addi	s0,sp,16
    80005098:	00813403          	ld	s0,8(sp)
    8000509c:	01010113          	addi	sp,sp,16
    800050a0:	ffffe317          	auipc	t1,0xffffe
    800050a4:	5c430067          	jr	1476(t1) # 80003664 <main>

00000000800050a8 <either_copyout>:
    800050a8:	ff010113          	addi	sp,sp,-16
    800050ac:	00813023          	sd	s0,0(sp)
    800050b0:	00113423          	sd	ra,8(sp)
    800050b4:	01010413          	addi	s0,sp,16
    800050b8:	02051663          	bnez	a0,800050e4 <either_copyout+0x3c>
    800050bc:	00058513          	mv	a0,a1
    800050c0:	00060593          	mv	a1,a2
    800050c4:	0006861b          	sext.w	a2,a3
    800050c8:	00002097          	auipc	ra,0x2
    800050cc:	c5c080e7          	jalr	-932(ra) # 80006d24 <__memmove>
    800050d0:	00813083          	ld	ra,8(sp)
    800050d4:	00013403          	ld	s0,0(sp)
    800050d8:	00000513          	li	a0,0
    800050dc:	01010113          	addi	sp,sp,16
    800050e0:	00008067          	ret
    800050e4:	00002517          	auipc	a0,0x2
    800050e8:	02450513          	addi	a0,a0,36 # 80007108 <_ZN3stm4coutE+0xa8>
    800050ec:	00001097          	auipc	ra,0x1
    800050f0:	930080e7          	jalr	-1744(ra) # 80005a1c <panic>

00000000800050f4 <either_copyin>:
    800050f4:	ff010113          	addi	sp,sp,-16
    800050f8:	00813023          	sd	s0,0(sp)
    800050fc:	00113423          	sd	ra,8(sp)
    80005100:	01010413          	addi	s0,sp,16
    80005104:	02059463          	bnez	a1,8000512c <either_copyin+0x38>
    80005108:	00060593          	mv	a1,a2
    8000510c:	0006861b          	sext.w	a2,a3
    80005110:	00002097          	auipc	ra,0x2
    80005114:	c14080e7          	jalr	-1004(ra) # 80006d24 <__memmove>
    80005118:	00813083          	ld	ra,8(sp)
    8000511c:	00013403          	ld	s0,0(sp)
    80005120:	00000513          	li	a0,0
    80005124:	01010113          	addi	sp,sp,16
    80005128:	00008067          	ret
    8000512c:	00002517          	auipc	a0,0x2
    80005130:	00450513          	addi	a0,a0,4 # 80007130 <_ZN3stm4coutE+0xd0>
    80005134:	00001097          	auipc	ra,0x1
    80005138:	8e8080e7          	jalr	-1816(ra) # 80005a1c <panic>

000000008000513c <trapinit>:
    8000513c:	ff010113          	addi	sp,sp,-16
    80005140:	00813423          	sd	s0,8(sp)
    80005144:	01010413          	addi	s0,sp,16
    80005148:	00813403          	ld	s0,8(sp)
    8000514c:	00002597          	auipc	a1,0x2
    80005150:	00c58593          	addi	a1,a1,12 # 80007158 <_ZN3stm4coutE+0xf8>
    80005154:	00005517          	auipc	a0,0x5
    80005158:	22c50513          	addi	a0,a0,556 # 8000a380 <tickslock>
    8000515c:	01010113          	addi	sp,sp,16
    80005160:	00001317          	auipc	t1,0x1
    80005164:	5c830067          	jr	1480(t1) # 80006728 <initlock>

0000000080005168 <trapinithart>:
    80005168:	ff010113          	addi	sp,sp,-16
    8000516c:	00813423          	sd	s0,8(sp)
    80005170:	01010413          	addi	s0,sp,16
    80005174:	00000797          	auipc	a5,0x0
    80005178:	2fc78793          	addi	a5,a5,764 # 80005470 <kernelvec>
    8000517c:	10579073          	csrw	stvec,a5
    80005180:	00813403          	ld	s0,8(sp)
    80005184:	01010113          	addi	sp,sp,16
    80005188:	00008067          	ret

000000008000518c <usertrap>:
    8000518c:	ff010113          	addi	sp,sp,-16
    80005190:	00813423          	sd	s0,8(sp)
    80005194:	01010413          	addi	s0,sp,16
    80005198:	00813403          	ld	s0,8(sp)
    8000519c:	01010113          	addi	sp,sp,16
    800051a0:	00008067          	ret

00000000800051a4 <usertrapret>:
    800051a4:	ff010113          	addi	sp,sp,-16
    800051a8:	00813423          	sd	s0,8(sp)
    800051ac:	01010413          	addi	s0,sp,16
    800051b0:	00813403          	ld	s0,8(sp)
    800051b4:	01010113          	addi	sp,sp,16
    800051b8:	00008067          	ret

00000000800051bc <kerneltrap>:
    800051bc:	fe010113          	addi	sp,sp,-32
    800051c0:	00813823          	sd	s0,16(sp)
    800051c4:	00113c23          	sd	ra,24(sp)
    800051c8:	00913423          	sd	s1,8(sp)
    800051cc:	02010413          	addi	s0,sp,32
    800051d0:	142025f3          	csrr	a1,scause
    800051d4:	100027f3          	csrr	a5,sstatus
    800051d8:	0027f793          	andi	a5,a5,2
    800051dc:	10079c63          	bnez	a5,800052f4 <kerneltrap+0x138>
    800051e0:	142027f3          	csrr	a5,scause
    800051e4:	0207ce63          	bltz	a5,80005220 <kerneltrap+0x64>
    800051e8:	00002517          	auipc	a0,0x2
    800051ec:	fb850513          	addi	a0,a0,-72 # 800071a0 <_ZN3stm4coutE+0x140>
    800051f0:	00001097          	auipc	ra,0x1
    800051f4:	888080e7          	jalr	-1912(ra) # 80005a78 <__printf>
    800051f8:	141025f3          	csrr	a1,sepc
    800051fc:	14302673          	csrr	a2,stval
    80005200:	00002517          	auipc	a0,0x2
    80005204:	fb050513          	addi	a0,a0,-80 # 800071b0 <_ZN3stm4coutE+0x150>
    80005208:	00001097          	auipc	ra,0x1
    8000520c:	870080e7          	jalr	-1936(ra) # 80005a78 <__printf>
    80005210:	00002517          	auipc	a0,0x2
    80005214:	fb850513          	addi	a0,a0,-72 # 800071c8 <_ZN3stm4coutE+0x168>
    80005218:	00001097          	auipc	ra,0x1
    8000521c:	804080e7          	jalr	-2044(ra) # 80005a1c <panic>
    80005220:	0ff7f713          	andi	a4,a5,255
    80005224:	00900693          	li	a3,9
    80005228:	04d70063          	beq	a4,a3,80005268 <kerneltrap+0xac>
    8000522c:	fff00713          	li	a4,-1
    80005230:	03f71713          	slli	a4,a4,0x3f
    80005234:	00170713          	addi	a4,a4,1
    80005238:	fae798e3          	bne	a5,a4,800051e8 <kerneltrap+0x2c>
    8000523c:	00000097          	auipc	ra,0x0
    80005240:	e00080e7          	jalr	-512(ra) # 8000503c <cpuid>
    80005244:	06050663          	beqz	a0,800052b0 <kerneltrap+0xf4>
    80005248:	144027f3          	csrr	a5,sip
    8000524c:	ffd7f793          	andi	a5,a5,-3
    80005250:	14479073          	csrw	sip,a5
    80005254:	01813083          	ld	ra,24(sp)
    80005258:	01013403          	ld	s0,16(sp)
    8000525c:	00813483          	ld	s1,8(sp)
    80005260:	02010113          	addi	sp,sp,32
    80005264:	00008067          	ret
    80005268:	00000097          	auipc	ra,0x0
    8000526c:	3cc080e7          	jalr	972(ra) # 80005634 <plic_claim>
    80005270:	00a00793          	li	a5,10
    80005274:	00050493          	mv	s1,a0
    80005278:	06f50863          	beq	a0,a5,800052e8 <kerneltrap+0x12c>
    8000527c:	fc050ce3          	beqz	a0,80005254 <kerneltrap+0x98>
    80005280:	00050593          	mv	a1,a0
    80005284:	00002517          	auipc	a0,0x2
    80005288:	efc50513          	addi	a0,a0,-260 # 80007180 <_ZN3stm4coutE+0x120>
    8000528c:	00000097          	auipc	ra,0x0
    80005290:	7ec080e7          	jalr	2028(ra) # 80005a78 <__printf>
    80005294:	01013403          	ld	s0,16(sp)
    80005298:	01813083          	ld	ra,24(sp)
    8000529c:	00048513          	mv	a0,s1
    800052a0:	00813483          	ld	s1,8(sp)
    800052a4:	02010113          	addi	sp,sp,32
    800052a8:	00000317          	auipc	t1,0x0
    800052ac:	3c430067          	jr	964(t1) # 8000566c <plic_complete>
    800052b0:	00005517          	auipc	a0,0x5
    800052b4:	0d050513          	addi	a0,a0,208 # 8000a380 <tickslock>
    800052b8:	00001097          	auipc	ra,0x1
    800052bc:	494080e7          	jalr	1172(ra) # 8000674c <acquire>
    800052c0:	00004717          	auipc	a4,0x4
    800052c4:	f1470713          	addi	a4,a4,-236 # 800091d4 <ticks>
    800052c8:	00072783          	lw	a5,0(a4)
    800052cc:	00005517          	auipc	a0,0x5
    800052d0:	0b450513          	addi	a0,a0,180 # 8000a380 <tickslock>
    800052d4:	0017879b          	addiw	a5,a5,1
    800052d8:	00f72023          	sw	a5,0(a4)
    800052dc:	00001097          	auipc	ra,0x1
    800052e0:	53c080e7          	jalr	1340(ra) # 80006818 <release>
    800052e4:	f65ff06f          	j	80005248 <kerneltrap+0x8c>
    800052e8:	00001097          	auipc	ra,0x1
    800052ec:	098080e7          	jalr	152(ra) # 80006380 <uartintr>
    800052f0:	fa5ff06f          	j	80005294 <kerneltrap+0xd8>
    800052f4:	00002517          	auipc	a0,0x2
    800052f8:	e6c50513          	addi	a0,a0,-404 # 80007160 <_ZN3stm4coutE+0x100>
    800052fc:	00000097          	auipc	ra,0x0
    80005300:	720080e7          	jalr	1824(ra) # 80005a1c <panic>

0000000080005304 <clockintr>:
    80005304:	fe010113          	addi	sp,sp,-32
    80005308:	00813823          	sd	s0,16(sp)
    8000530c:	00913423          	sd	s1,8(sp)
    80005310:	00113c23          	sd	ra,24(sp)
    80005314:	02010413          	addi	s0,sp,32
    80005318:	00005497          	auipc	s1,0x5
    8000531c:	06848493          	addi	s1,s1,104 # 8000a380 <tickslock>
    80005320:	00048513          	mv	a0,s1
    80005324:	00001097          	auipc	ra,0x1
    80005328:	428080e7          	jalr	1064(ra) # 8000674c <acquire>
    8000532c:	00004717          	auipc	a4,0x4
    80005330:	ea870713          	addi	a4,a4,-344 # 800091d4 <ticks>
    80005334:	00072783          	lw	a5,0(a4)
    80005338:	01013403          	ld	s0,16(sp)
    8000533c:	01813083          	ld	ra,24(sp)
    80005340:	00048513          	mv	a0,s1
    80005344:	0017879b          	addiw	a5,a5,1
    80005348:	00813483          	ld	s1,8(sp)
    8000534c:	00f72023          	sw	a5,0(a4)
    80005350:	02010113          	addi	sp,sp,32
    80005354:	00001317          	auipc	t1,0x1
    80005358:	4c430067          	jr	1220(t1) # 80006818 <release>

000000008000535c <devintr>:
    8000535c:	142027f3          	csrr	a5,scause
    80005360:	00000513          	li	a0,0
    80005364:	0007c463          	bltz	a5,8000536c <devintr+0x10>
    80005368:	00008067          	ret
    8000536c:	fe010113          	addi	sp,sp,-32
    80005370:	00813823          	sd	s0,16(sp)
    80005374:	00113c23          	sd	ra,24(sp)
    80005378:	00913423          	sd	s1,8(sp)
    8000537c:	02010413          	addi	s0,sp,32
    80005380:	0ff7f713          	andi	a4,a5,255
    80005384:	00900693          	li	a3,9
    80005388:	04d70c63          	beq	a4,a3,800053e0 <devintr+0x84>
    8000538c:	fff00713          	li	a4,-1
    80005390:	03f71713          	slli	a4,a4,0x3f
    80005394:	00170713          	addi	a4,a4,1
    80005398:	00e78c63          	beq	a5,a4,800053b0 <devintr+0x54>
    8000539c:	01813083          	ld	ra,24(sp)
    800053a0:	01013403          	ld	s0,16(sp)
    800053a4:	00813483          	ld	s1,8(sp)
    800053a8:	02010113          	addi	sp,sp,32
    800053ac:	00008067          	ret
    800053b0:	00000097          	auipc	ra,0x0
    800053b4:	c8c080e7          	jalr	-884(ra) # 8000503c <cpuid>
    800053b8:	06050663          	beqz	a0,80005424 <devintr+0xc8>
    800053bc:	144027f3          	csrr	a5,sip
    800053c0:	ffd7f793          	andi	a5,a5,-3
    800053c4:	14479073          	csrw	sip,a5
    800053c8:	01813083          	ld	ra,24(sp)
    800053cc:	01013403          	ld	s0,16(sp)
    800053d0:	00813483          	ld	s1,8(sp)
    800053d4:	00200513          	li	a0,2
    800053d8:	02010113          	addi	sp,sp,32
    800053dc:	00008067          	ret
    800053e0:	00000097          	auipc	ra,0x0
    800053e4:	254080e7          	jalr	596(ra) # 80005634 <plic_claim>
    800053e8:	00a00793          	li	a5,10
    800053ec:	00050493          	mv	s1,a0
    800053f0:	06f50663          	beq	a0,a5,8000545c <devintr+0x100>
    800053f4:	00100513          	li	a0,1
    800053f8:	fa0482e3          	beqz	s1,8000539c <devintr+0x40>
    800053fc:	00048593          	mv	a1,s1
    80005400:	00002517          	auipc	a0,0x2
    80005404:	d8050513          	addi	a0,a0,-640 # 80007180 <_ZN3stm4coutE+0x120>
    80005408:	00000097          	auipc	ra,0x0
    8000540c:	670080e7          	jalr	1648(ra) # 80005a78 <__printf>
    80005410:	00048513          	mv	a0,s1
    80005414:	00000097          	auipc	ra,0x0
    80005418:	258080e7          	jalr	600(ra) # 8000566c <plic_complete>
    8000541c:	00100513          	li	a0,1
    80005420:	f7dff06f          	j	8000539c <devintr+0x40>
    80005424:	00005517          	auipc	a0,0x5
    80005428:	f5c50513          	addi	a0,a0,-164 # 8000a380 <tickslock>
    8000542c:	00001097          	auipc	ra,0x1
    80005430:	320080e7          	jalr	800(ra) # 8000674c <acquire>
    80005434:	00004717          	auipc	a4,0x4
    80005438:	da070713          	addi	a4,a4,-608 # 800091d4 <ticks>
    8000543c:	00072783          	lw	a5,0(a4)
    80005440:	00005517          	auipc	a0,0x5
    80005444:	f4050513          	addi	a0,a0,-192 # 8000a380 <tickslock>
    80005448:	0017879b          	addiw	a5,a5,1
    8000544c:	00f72023          	sw	a5,0(a4)
    80005450:	00001097          	auipc	ra,0x1
    80005454:	3c8080e7          	jalr	968(ra) # 80006818 <release>
    80005458:	f65ff06f          	j	800053bc <devintr+0x60>
    8000545c:	00001097          	auipc	ra,0x1
    80005460:	f24080e7          	jalr	-220(ra) # 80006380 <uartintr>
    80005464:	fadff06f          	j	80005410 <devintr+0xb4>
	...

0000000080005470 <kernelvec>:
    80005470:	f0010113          	addi	sp,sp,-256
    80005474:	00113023          	sd	ra,0(sp)
    80005478:	00213423          	sd	sp,8(sp)
    8000547c:	00313823          	sd	gp,16(sp)
    80005480:	00413c23          	sd	tp,24(sp)
    80005484:	02513023          	sd	t0,32(sp)
    80005488:	02613423          	sd	t1,40(sp)
    8000548c:	02713823          	sd	t2,48(sp)
    80005490:	02813c23          	sd	s0,56(sp)
    80005494:	04913023          	sd	s1,64(sp)
    80005498:	04a13423          	sd	a0,72(sp)
    8000549c:	04b13823          	sd	a1,80(sp)
    800054a0:	04c13c23          	sd	a2,88(sp)
    800054a4:	06d13023          	sd	a3,96(sp)
    800054a8:	06e13423          	sd	a4,104(sp)
    800054ac:	06f13823          	sd	a5,112(sp)
    800054b0:	07013c23          	sd	a6,120(sp)
    800054b4:	09113023          	sd	a7,128(sp)
    800054b8:	09213423          	sd	s2,136(sp)
    800054bc:	09313823          	sd	s3,144(sp)
    800054c0:	09413c23          	sd	s4,152(sp)
    800054c4:	0b513023          	sd	s5,160(sp)
    800054c8:	0b613423          	sd	s6,168(sp)
    800054cc:	0b713823          	sd	s7,176(sp)
    800054d0:	0b813c23          	sd	s8,184(sp)
    800054d4:	0d913023          	sd	s9,192(sp)
    800054d8:	0da13423          	sd	s10,200(sp)
    800054dc:	0db13823          	sd	s11,208(sp)
    800054e0:	0dc13c23          	sd	t3,216(sp)
    800054e4:	0fd13023          	sd	t4,224(sp)
    800054e8:	0fe13423          	sd	t5,232(sp)
    800054ec:	0ff13823          	sd	t6,240(sp)
    800054f0:	ccdff0ef          	jal	ra,800051bc <kerneltrap>
    800054f4:	00013083          	ld	ra,0(sp)
    800054f8:	00813103          	ld	sp,8(sp)
    800054fc:	01013183          	ld	gp,16(sp)
    80005500:	02013283          	ld	t0,32(sp)
    80005504:	02813303          	ld	t1,40(sp)
    80005508:	03013383          	ld	t2,48(sp)
    8000550c:	03813403          	ld	s0,56(sp)
    80005510:	04013483          	ld	s1,64(sp)
    80005514:	04813503          	ld	a0,72(sp)
    80005518:	05013583          	ld	a1,80(sp)
    8000551c:	05813603          	ld	a2,88(sp)
    80005520:	06013683          	ld	a3,96(sp)
    80005524:	06813703          	ld	a4,104(sp)
    80005528:	07013783          	ld	a5,112(sp)
    8000552c:	07813803          	ld	a6,120(sp)
    80005530:	08013883          	ld	a7,128(sp)
    80005534:	08813903          	ld	s2,136(sp)
    80005538:	09013983          	ld	s3,144(sp)
    8000553c:	09813a03          	ld	s4,152(sp)
    80005540:	0a013a83          	ld	s5,160(sp)
    80005544:	0a813b03          	ld	s6,168(sp)
    80005548:	0b013b83          	ld	s7,176(sp)
    8000554c:	0b813c03          	ld	s8,184(sp)
    80005550:	0c013c83          	ld	s9,192(sp)
    80005554:	0c813d03          	ld	s10,200(sp)
    80005558:	0d013d83          	ld	s11,208(sp)
    8000555c:	0d813e03          	ld	t3,216(sp)
    80005560:	0e013e83          	ld	t4,224(sp)
    80005564:	0e813f03          	ld	t5,232(sp)
    80005568:	0f013f83          	ld	t6,240(sp)
    8000556c:	10010113          	addi	sp,sp,256
    80005570:	10200073          	sret
    80005574:	00000013          	nop
    80005578:	00000013          	nop
    8000557c:	00000013          	nop

0000000080005580 <timervec>:
    80005580:	34051573          	csrrw	a0,mscratch,a0
    80005584:	00b53023          	sd	a1,0(a0)
    80005588:	00c53423          	sd	a2,8(a0)
    8000558c:	00d53823          	sd	a3,16(a0)
    80005590:	01853583          	ld	a1,24(a0)
    80005594:	02053603          	ld	a2,32(a0)
    80005598:	0005b683          	ld	a3,0(a1)
    8000559c:	00c686b3          	add	a3,a3,a2
    800055a0:	00d5b023          	sd	a3,0(a1)
    800055a4:	00200593          	li	a1,2
    800055a8:	14459073          	csrw	sip,a1
    800055ac:	01053683          	ld	a3,16(a0)
    800055b0:	00853603          	ld	a2,8(a0)
    800055b4:	00053583          	ld	a1,0(a0)
    800055b8:	34051573          	csrrw	a0,mscratch,a0
    800055bc:	30200073          	mret

00000000800055c0 <plicinit>:
    800055c0:	ff010113          	addi	sp,sp,-16
    800055c4:	00813423          	sd	s0,8(sp)
    800055c8:	01010413          	addi	s0,sp,16
    800055cc:	00813403          	ld	s0,8(sp)
    800055d0:	0c0007b7          	lui	a5,0xc000
    800055d4:	00100713          	li	a4,1
    800055d8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800055dc:	00e7a223          	sw	a4,4(a5)
    800055e0:	01010113          	addi	sp,sp,16
    800055e4:	00008067          	ret

00000000800055e8 <plicinithart>:
    800055e8:	ff010113          	addi	sp,sp,-16
    800055ec:	00813023          	sd	s0,0(sp)
    800055f0:	00113423          	sd	ra,8(sp)
    800055f4:	01010413          	addi	s0,sp,16
    800055f8:	00000097          	auipc	ra,0x0
    800055fc:	a44080e7          	jalr	-1468(ra) # 8000503c <cpuid>
    80005600:	0085171b          	slliw	a4,a0,0x8
    80005604:	0c0027b7          	lui	a5,0xc002
    80005608:	00e787b3          	add	a5,a5,a4
    8000560c:	40200713          	li	a4,1026
    80005610:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005614:	00813083          	ld	ra,8(sp)
    80005618:	00013403          	ld	s0,0(sp)
    8000561c:	00d5151b          	slliw	a0,a0,0xd
    80005620:	0c2017b7          	lui	a5,0xc201
    80005624:	00a78533          	add	a0,a5,a0
    80005628:	00052023          	sw	zero,0(a0)
    8000562c:	01010113          	addi	sp,sp,16
    80005630:	00008067          	ret

0000000080005634 <plic_claim>:
    80005634:	ff010113          	addi	sp,sp,-16
    80005638:	00813023          	sd	s0,0(sp)
    8000563c:	00113423          	sd	ra,8(sp)
    80005640:	01010413          	addi	s0,sp,16
    80005644:	00000097          	auipc	ra,0x0
    80005648:	9f8080e7          	jalr	-1544(ra) # 8000503c <cpuid>
    8000564c:	00813083          	ld	ra,8(sp)
    80005650:	00013403          	ld	s0,0(sp)
    80005654:	00d5151b          	slliw	a0,a0,0xd
    80005658:	0c2017b7          	lui	a5,0xc201
    8000565c:	00a78533          	add	a0,a5,a0
    80005660:	00452503          	lw	a0,4(a0)
    80005664:	01010113          	addi	sp,sp,16
    80005668:	00008067          	ret

000000008000566c <plic_complete>:
    8000566c:	fe010113          	addi	sp,sp,-32
    80005670:	00813823          	sd	s0,16(sp)
    80005674:	00913423          	sd	s1,8(sp)
    80005678:	00113c23          	sd	ra,24(sp)
    8000567c:	02010413          	addi	s0,sp,32
    80005680:	00050493          	mv	s1,a0
    80005684:	00000097          	auipc	ra,0x0
    80005688:	9b8080e7          	jalr	-1608(ra) # 8000503c <cpuid>
    8000568c:	01813083          	ld	ra,24(sp)
    80005690:	01013403          	ld	s0,16(sp)
    80005694:	00d5179b          	slliw	a5,a0,0xd
    80005698:	0c201737          	lui	a4,0xc201
    8000569c:	00f707b3          	add	a5,a4,a5
    800056a0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800056a4:	00813483          	ld	s1,8(sp)
    800056a8:	02010113          	addi	sp,sp,32
    800056ac:	00008067          	ret

00000000800056b0 <consolewrite>:
    800056b0:	fb010113          	addi	sp,sp,-80
    800056b4:	04813023          	sd	s0,64(sp)
    800056b8:	04113423          	sd	ra,72(sp)
    800056bc:	02913c23          	sd	s1,56(sp)
    800056c0:	03213823          	sd	s2,48(sp)
    800056c4:	03313423          	sd	s3,40(sp)
    800056c8:	03413023          	sd	s4,32(sp)
    800056cc:	01513c23          	sd	s5,24(sp)
    800056d0:	05010413          	addi	s0,sp,80
    800056d4:	06c05c63          	blez	a2,8000574c <consolewrite+0x9c>
    800056d8:	00060993          	mv	s3,a2
    800056dc:	00050a13          	mv	s4,a0
    800056e0:	00058493          	mv	s1,a1
    800056e4:	00000913          	li	s2,0
    800056e8:	fff00a93          	li	s5,-1
    800056ec:	01c0006f          	j	80005708 <consolewrite+0x58>
    800056f0:	fbf44503          	lbu	a0,-65(s0)
    800056f4:	0019091b          	addiw	s2,s2,1
    800056f8:	00148493          	addi	s1,s1,1
    800056fc:	00001097          	auipc	ra,0x1
    80005700:	a9c080e7          	jalr	-1380(ra) # 80006198 <uartputc>
    80005704:	03298063          	beq	s3,s2,80005724 <consolewrite+0x74>
    80005708:	00048613          	mv	a2,s1
    8000570c:	00100693          	li	a3,1
    80005710:	000a0593          	mv	a1,s4
    80005714:	fbf40513          	addi	a0,s0,-65
    80005718:	00000097          	auipc	ra,0x0
    8000571c:	9dc080e7          	jalr	-1572(ra) # 800050f4 <either_copyin>
    80005720:	fd5518e3          	bne	a0,s5,800056f0 <consolewrite+0x40>
    80005724:	04813083          	ld	ra,72(sp)
    80005728:	04013403          	ld	s0,64(sp)
    8000572c:	03813483          	ld	s1,56(sp)
    80005730:	02813983          	ld	s3,40(sp)
    80005734:	02013a03          	ld	s4,32(sp)
    80005738:	01813a83          	ld	s5,24(sp)
    8000573c:	00090513          	mv	a0,s2
    80005740:	03013903          	ld	s2,48(sp)
    80005744:	05010113          	addi	sp,sp,80
    80005748:	00008067          	ret
    8000574c:	00000913          	li	s2,0
    80005750:	fd5ff06f          	j	80005724 <consolewrite+0x74>

0000000080005754 <consoleread>:
    80005754:	f9010113          	addi	sp,sp,-112
    80005758:	06813023          	sd	s0,96(sp)
    8000575c:	04913c23          	sd	s1,88(sp)
    80005760:	05213823          	sd	s2,80(sp)
    80005764:	05313423          	sd	s3,72(sp)
    80005768:	05413023          	sd	s4,64(sp)
    8000576c:	03513c23          	sd	s5,56(sp)
    80005770:	03613823          	sd	s6,48(sp)
    80005774:	03713423          	sd	s7,40(sp)
    80005778:	03813023          	sd	s8,32(sp)
    8000577c:	06113423          	sd	ra,104(sp)
    80005780:	01913c23          	sd	s9,24(sp)
    80005784:	07010413          	addi	s0,sp,112
    80005788:	00060b93          	mv	s7,a2
    8000578c:	00050913          	mv	s2,a0
    80005790:	00058c13          	mv	s8,a1
    80005794:	00060b1b          	sext.w	s6,a2
    80005798:	00005497          	auipc	s1,0x5
    8000579c:	c1048493          	addi	s1,s1,-1008 # 8000a3a8 <cons>
    800057a0:	00400993          	li	s3,4
    800057a4:	fff00a13          	li	s4,-1
    800057a8:	00a00a93          	li	s5,10
    800057ac:	05705e63          	blez	s7,80005808 <consoleread+0xb4>
    800057b0:	09c4a703          	lw	a4,156(s1)
    800057b4:	0984a783          	lw	a5,152(s1)
    800057b8:	0007071b          	sext.w	a4,a4
    800057bc:	08e78463          	beq	a5,a4,80005844 <consoleread+0xf0>
    800057c0:	07f7f713          	andi	a4,a5,127
    800057c4:	00e48733          	add	a4,s1,a4
    800057c8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800057cc:	0017869b          	addiw	a3,a5,1
    800057d0:	08d4ac23          	sw	a3,152(s1)
    800057d4:	00070c9b          	sext.w	s9,a4
    800057d8:	0b370663          	beq	a4,s3,80005884 <consoleread+0x130>
    800057dc:	00100693          	li	a3,1
    800057e0:	f9f40613          	addi	a2,s0,-97
    800057e4:	000c0593          	mv	a1,s8
    800057e8:	00090513          	mv	a0,s2
    800057ec:	f8e40fa3          	sb	a4,-97(s0)
    800057f0:	00000097          	auipc	ra,0x0
    800057f4:	8b8080e7          	jalr	-1864(ra) # 800050a8 <either_copyout>
    800057f8:	01450863          	beq	a0,s4,80005808 <consoleread+0xb4>
    800057fc:	001c0c13          	addi	s8,s8,1
    80005800:	fffb8b9b          	addiw	s7,s7,-1
    80005804:	fb5c94e3          	bne	s9,s5,800057ac <consoleread+0x58>
    80005808:	000b851b          	sext.w	a0,s7
    8000580c:	06813083          	ld	ra,104(sp)
    80005810:	06013403          	ld	s0,96(sp)
    80005814:	05813483          	ld	s1,88(sp)
    80005818:	05013903          	ld	s2,80(sp)
    8000581c:	04813983          	ld	s3,72(sp)
    80005820:	04013a03          	ld	s4,64(sp)
    80005824:	03813a83          	ld	s5,56(sp)
    80005828:	02813b83          	ld	s7,40(sp)
    8000582c:	02013c03          	ld	s8,32(sp)
    80005830:	01813c83          	ld	s9,24(sp)
    80005834:	40ab053b          	subw	a0,s6,a0
    80005838:	03013b03          	ld	s6,48(sp)
    8000583c:	07010113          	addi	sp,sp,112
    80005840:	00008067          	ret
    80005844:	00001097          	auipc	ra,0x1
    80005848:	1d8080e7          	jalr	472(ra) # 80006a1c <push_on>
    8000584c:	0984a703          	lw	a4,152(s1)
    80005850:	09c4a783          	lw	a5,156(s1)
    80005854:	0007879b          	sext.w	a5,a5
    80005858:	fef70ce3          	beq	a4,a5,80005850 <consoleread+0xfc>
    8000585c:	00001097          	auipc	ra,0x1
    80005860:	234080e7          	jalr	564(ra) # 80006a90 <pop_on>
    80005864:	0984a783          	lw	a5,152(s1)
    80005868:	07f7f713          	andi	a4,a5,127
    8000586c:	00e48733          	add	a4,s1,a4
    80005870:	01874703          	lbu	a4,24(a4)
    80005874:	0017869b          	addiw	a3,a5,1
    80005878:	08d4ac23          	sw	a3,152(s1)
    8000587c:	00070c9b          	sext.w	s9,a4
    80005880:	f5371ee3          	bne	a4,s3,800057dc <consoleread+0x88>
    80005884:	000b851b          	sext.w	a0,s7
    80005888:	f96bf2e3          	bgeu	s7,s6,8000580c <consoleread+0xb8>
    8000588c:	08f4ac23          	sw	a5,152(s1)
    80005890:	f7dff06f          	j	8000580c <consoleread+0xb8>

0000000080005894 <consputc>:
    80005894:	10000793          	li	a5,256
    80005898:	00f50663          	beq	a0,a5,800058a4 <consputc+0x10>
    8000589c:	00001317          	auipc	t1,0x1
    800058a0:	9f430067          	jr	-1548(t1) # 80006290 <uartputc_sync>
    800058a4:	ff010113          	addi	sp,sp,-16
    800058a8:	00113423          	sd	ra,8(sp)
    800058ac:	00813023          	sd	s0,0(sp)
    800058b0:	01010413          	addi	s0,sp,16
    800058b4:	00800513          	li	a0,8
    800058b8:	00001097          	auipc	ra,0x1
    800058bc:	9d8080e7          	jalr	-1576(ra) # 80006290 <uartputc_sync>
    800058c0:	02000513          	li	a0,32
    800058c4:	00001097          	auipc	ra,0x1
    800058c8:	9cc080e7          	jalr	-1588(ra) # 80006290 <uartputc_sync>
    800058cc:	00013403          	ld	s0,0(sp)
    800058d0:	00813083          	ld	ra,8(sp)
    800058d4:	00800513          	li	a0,8
    800058d8:	01010113          	addi	sp,sp,16
    800058dc:	00001317          	auipc	t1,0x1
    800058e0:	9b430067          	jr	-1612(t1) # 80006290 <uartputc_sync>

00000000800058e4 <consoleintr>:
    800058e4:	fe010113          	addi	sp,sp,-32
    800058e8:	00813823          	sd	s0,16(sp)
    800058ec:	00913423          	sd	s1,8(sp)
    800058f0:	01213023          	sd	s2,0(sp)
    800058f4:	00113c23          	sd	ra,24(sp)
    800058f8:	02010413          	addi	s0,sp,32
    800058fc:	00005917          	auipc	s2,0x5
    80005900:	aac90913          	addi	s2,s2,-1364 # 8000a3a8 <cons>
    80005904:	00050493          	mv	s1,a0
    80005908:	00090513          	mv	a0,s2
    8000590c:	00001097          	auipc	ra,0x1
    80005910:	e40080e7          	jalr	-448(ra) # 8000674c <acquire>
    80005914:	02048c63          	beqz	s1,8000594c <consoleintr+0x68>
    80005918:	0a092783          	lw	a5,160(s2)
    8000591c:	09892703          	lw	a4,152(s2)
    80005920:	07f00693          	li	a3,127
    80005924:	40e7873b          	subw	a4,a5,a4
    80005928:	02e6e263          	bltu	a3,a4,8000594c <consoleintr+0x68>
    8000592c:	00d00713          	li	a4,13
    80005930:	04e48063          	beq	s1,a4,80005970 <consoleintr+0x8c>
    80005934:	07f7f713          	andi	a4,a5,127
    80005938:	00e90733          	add	a4,s2,a4
    8000593c:	0017879b          	addiw	a5,a5,1
    80005940:	0af92023          	sw	a5,160(s2)
    80005944:	00970c23          	sb	s1,24(a4)
    80005948:	08f92e23          	sw	a5,156(s2)
    8000594c:	01013403          	ld	s0,16(sp)
    80005950:	01813083          	ld	ra,24(sp)
    80005954:	00813483          	ld	s1,8(sp)
    80005958:	00013903          	ld	s2,0(sp)
    8000595c:	00005517          	auipc	a0,0x5
    80005960:	a4c50513          	addi	a0,a0,-1460 # 8000a3a8 <cons>
    80005964:	02010113          	addi	sp,sp,32
    80005968:	00001317          	auipc	t1,0x1
    8000596c:	eb030067          	jr	-336(t1) # 80006818 <release>
    80005970:	00a00493          	li	s1,10
    80005974:	fc1ff06f          	j	80005934 <consoleintr+0x50>

0000000080005978 <consoleinit>:
    80005978:	fe010113          	addi	sp,sp,-32
    8000597c:	00113c23          	sd	ra,24(sp)
    80005980:	00813823          	sd	s0,16(sp)
    80005984:	00913423          	sd	s1,8(sp)
    80005988:	02010413          	addi	s0,sp,32
    8000598c:	00005497          	auipc	s1,0x5
    80005990:	a1c48493          	addi	s1,s1,-1508 # 8000a3a8 <cons>
    80005994:	00048513          	mv	a0,s1
    80005998:	00002597          	auipc	a1,0x2
    8000599c:	84058593          	addi	a1,a1,-1984 # 800071d8 <_ZN3stm4coutE+0x178>
    800059a0:	00001097          	auipc	ra,0x1
    800059a4:	d88080e7          	jalr	-632(ra) # 80006728 <initlock>
    800059a8:	00000097          	auipc	ra,0x0
    800059ac:	7ac080e7          	jalr	1964(ra) # 80006154 <uartinit>
    800059b0:	01813083          	ld	ra,24(sp)
    800059b4:	01013403          	ld	s0,16(sp)
    800059b8:	00000797          	auipc	a5,0x0
    800059bc:	d9c78793          	addi	a5,a5,-612 # 80005754 <consoleread>
    800059c0:	0af4bc23          	sd	a5,184(s1)
    800059c4:	00000797          	auipc	a5,0x0
    800059c8:	cec78793          	addi	a5,a5,-788 # 800056b0 <consolewrite>
    800059cc:	0cf4b023          	sd	a5,192(s1)
    800059d0:	00813483          	ld	s1,8(sp)
    800059d4:	02010113          	addi	sp,sp,32
    800059d8:	00008067          	ret

00000000800059dc <console_read>:
    800059dc:	ff010113          	addi	sp,sp,-16
    800059e0:	00813423          	sd	s0,8(sp)
    800059e4:	01010413          	addi	s0,sp,16
    800059e8:	00813403          	ld	s0,8(sp)
    800059ec:	00005317          	auipc	t1,0x5
    800059f0:	a7433303          	ld	t1,-1420(t1) # 8000a460 <devsw+0x10>
    800059f4:	01010113          	addi	sp,sp,16
    800059f8:	00030067          	jr	t1

00000000800059fc <console_write>:
    800059fc:	ff010113          	addi	sp,sp,-16
    80005a00:	00813423          	sd	s0,8(sp)
    80005a04:	01010413          	addi	s0,sp,16
    80005a08:	00813403          	ld	s0,8(sp)
    80005a0c:	00005317          	auipc	t1,0x5
    80005a10:	a5c33303          	ld	t1,-1444(t1) # 8000a468 <devsw+0x18>
    80005a14:	01010113          	addi	sp,sp,16
    80005a18:	00030067          	jr	t1

0000000080005a1c <panic>:
    80005a1c:	fe010113          	addi	sp,sp,-32
    80005a20:	00113c23          	sd	ra,24(sp)
    80005a24:	00813823          	sd	s0,16(sp)
    80005a28:	00913423          	sd	s1,8(sp)
    80005a2c:	02010413          	addi	s0,sp,32
    80005a30:	00050493          	mv	s1,a0
    80005a34:	00001517          	auipc	a0,0x1
    80005a38:	7ac50513          	addi	a0,a0,1964 # 800071e0 <_ZN3stm4coutE+0x180>
    80005a3c:	00005797          	auipc	a5,0x5
    80005a40:	ac07a623          	sw	zero,-1332(a5) # 8000a508 <pr+0x18>
    80005a44:	00000097          	auipc	ra,0x0
    80005a48:	034080e7          	jalr	52(ra) # 80005a78 <__printf>
    80005a4c:	00048513          	mv	a0,s1
    80005a50:	00000097          	auipc	ra,0x0
    80005a54:	028080e7          	jalr	40(ra) # 80005a78 <__printf>
    80005a58:	00001517          	auipc	a0,0x1
    80005a5c:	76850513          	addi	a0,a0,1896 # 800071c0 <_ZN3stm4coutE+0x160>
    80005a60:	00000097          	auipc	ra,0x0
    80005a64:	018080e7          	jalr	24(ra) # 80005a78 <__printf>
    80005a68:	00100793          	li	a5,1
    80005a6c:	00003717          	auipc	a4,0x3
    80005a70:	76f72623          	sw	a5,1900(a4) # 800091d8 <panicked>
    80005a74:	0000006f          	j	80005a74 <panic+0x58>

0000000080005a78 <__printf>:
    80005a78:	f3010113          	addi	sp,sp,-208
    80005a7c:	08813023          	sd	s0,128(sp)
    80005a80:	07313423          	sd	s3,104(sp)
    80005a84:	09010413          	addi	s0,sp,144
    80005a88:	05813023          	sd	s8,64(sp)
    80005a8c:	08113423          	sd	ra,136(sp)
    80005a90:	06913c23          	sd	s1,120(sp)
    80005a94:	07213823          	sd	s2,112(sp)
    80005a98:	07413023          	sd	s4,96(sp)
    80005a9c:	05513c23          	sd	s5,88(sp)
    80005aa0:	05613823          	sd	s6,80(sp)
    80005aa4:	05713423          	sd	s7,72(sp)
    80005aa8:	03913c23          	sd	s9,56(sp)
    80005aac:	03a13823          	sd	s10,48(sp)
    80005ab0:	03b13423          	sd	s11,40(sp)
    80005ab4:	00005317          	auipc	t1,0x5
    80005ab8:	a3c30313          	addi	t1,t1,-1476 # 8000a4f0 <pr>
    80005abc:	01832c03          	lw	s8,24(t1)
    80005ac0:	00b43423          	sd	a1,8(s0)
    80005ac4:	00c43823          	sd	a2,16(s0)
    80005ac8:	00d43c23          	sd	a3,24(s0)
    80005acc:	02e43023          	sd	a4,32(s0)
    80005ad0:	02f43423          	sd	a5,40(s0)
    80005ad4:	03043823          	sd	a6,48(s0)
    80005ad8:	03143c23          	sd	a7,56(s0)
    80005adc:	00050993          	mv	s3,a0
    80005ae0:	4a0c1663          	bnez	s8,80005f8c <__printf+0x514>
    80005ae4:	60098c63          	beqz	s3,800060fc <__printf+0x684>
    80005ae8:	0009c503          	lbu	a0,0(s3)
    80005aec:	00840793          	addi	a5,s0,8
    80005af0:	f6f43c23          	sd	a5,-136(s0)
    80005af4:	00000493          	li	s1,0
    80005af8:	22050063          	beqz	a0,80005d18 <__printf+0x2a0>
    80005afc:	00002a37          	lui	s4,0x2
    80005b00:	00018ab7          	lui	s5,0x18
    80005b04:	000f4b37          	lui	s6,0xf4
    80005b08:	00989bb7          	lui	s7,0x989
    80005b0c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005b10:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005b14:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005b18:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005b1c:	00148c9b          	addiw	s9,s1,1
    80005b20:	02500793          	li	a5,37
    80005b24:	01998933          	add	s2,s3,s9
    80005b28:	38f51263          	bne	a0,a5,80005eac <__printf+0x434>
    80005b2c:	00094783          	lbu	a5,0(s2)
    80005b30:	00078c9b          	sext.w	s9,a5
    80005b34:	1e078263          	beqz	a5,80005d18 <__printf+0x2a0>
    80005b38:	0024849b          	addiw	s1,s1,2
    80005b3c:	07000713          	li	a4,112
    80005b40:	00998933          	add	s2,s3,s1
    80005b44:	38e78a63          	beq	a5,a4,80005ed8 <__printf+0x460>
    80005b48:	20f76863          	bltu	a4,a5,80005d58 <__printf+0x2e0>
    80005b4c:	42a78863          	beq	a5,a0,80005f7c <__printf+0x504>
    80005b50:	06400713          	li	a4,100
    80005b54:	40e79663          	bne	a5,a4,80005f60 <__printf+0x4e8>
    80005b58:	f7843783          	ld	a5,-136(s0)
    80005b5c:	0007a603          	lw	a2,0(a5)
    80005b60:	00878793          	addi	a5,a5,8
    80005b64:	f6f43c23          	sd	a5,-136(s0)
    80005b68:	42064a63          	bltz	a2,80005f9c <__printf+0x524>
    80005b6c:	00a00713          	li	a4,10
    80005b70:	02e677bb          	remuw	a5,a2,a4
    80005b74:	00001d97          	auipc	s11,0x1
    80005b78:	694d8d93          	addi	s11,s11,1684 # 80007208 <digits>
    80005b7c:	00900593          	li	a1,9
    80005b80:	0006051b          	sext.w	a0,a2
    80005b84:	00000c93          	li	s9,0
    80005b88:	02079793          	slli	a5,a5,0x20
    80005b8c:	0207d793          	srli	a5,a5,0x20
    80005b90:	00fd87b3          	add	a5,s11,a5
    80005b94:	0007c783          	lbu	a5,0(a5)
    80005b98:	02e656bb          	divuw	a3,a2,a4
    80005b9c:	f8f40023          	sb	a5,-128(s0)
    80005ba0:	14c5d863          	bge	a1,a2,80005cf0 <__printf+0x278>
    80005ba4:	06300593          	li	a1,99
    80005ba8:	00100c93          	li	s9,1
    80005bac:	02e6f7bb          	remuw	a5,a3,a4
    80005bb0:	02079793          	slli	a5,a5,0x20
    80005bb4:	0207d793          	srli	a5,a5,0x20
    80005bb8:	00fd87b3          	add	a5,s11,a5
    80005bbc:	0007c783          	lbu	a5,0(a5)
    80005bc0:	02e6d73b          	divuw	a4,a3,a4
    80005bc4:	f8f400a3          	sb	a5,-127(s0)
    80005bc8:	12a5f463          	bgeu	a1,a0,80005cf0 <__printf+0x278>
    80005bcc:	00a00693          	li	a3,10
    80005bd0:	00900593          	li	a1,9
    80005bd4:	02d777bb          	remuw	a5,a4,a3
    80005bd8:	02079793          	slli	a5,a5,0x20
    80005bdc:	0207d793          	srli	a5,a5,0x20
    80005be0:	00fd87b3          	add	a5,s11,a5
    80005be4:	0007c503          	lbu	a0,0(a5)
    80005be8:	02d757bb          	divuw	a5,a4,a3
    80005bec:	f8a40123          	sb	a0,-126(s0)
    80005bf0:	48e5f263          	bgeu	a1,a4,80006074 <__printf+0x5fc>
    80005bf4:	06300513          	li	a0,99
    80005bf8:	02d7f5bb          	remuw	a1,a5,a3
    80005bfc:	02059593          	slli	a1,a1,0x20
    80005c00:	0205d593          	srli	a1,a1,0x20
    80005c04:	00bd85b3          	add	a1,s11,a1
    80005c08:	0005c583          	lbu	a1,0(a1)
    80005c0c:	02d7d7bb          	divuw	a5,a5,a3
    80005c10:	f8b401a3          	sb	a1,-125(s0)
    80005c14:	48e57263          	bgeu	a0,a4,80006098 <__printf+0x620>
    80005c18:	3e700513          	li	a0,999
    80005c1c:	02d7f5bb          	remuw	a1,a5,a3
    80005c20:	02059593          	slli	a1,a1,0x20
    80005c24:	0205d593          	srli	a1,a1,0x20
    80005c28:	00bd85b3          	add	a1,s11,a1
    80005c2c:	0005c583          	lbu	a1,0(a1)
    80005c30:	02d7d7bb          	divuw	a5,a5,a3
    80005c34:	f8b40223          	sb	a1,-124(s0)
    80005c38:	46e57663          	bgeu	a0,a4,800060a4 <__printf+0x62c>
    80005c3c:	02d7f5bb          	remuw	a1,a5,a3
    80005c40:	02059593          	slli	a1,a1,0x20
    80005c44:	0205d593          	srli	a1,a1,0x20
    80005c48:	00bd85b3          	add	a1,s11,a1
    80005c4c:	0005c583          	lbu	a1,0(a1)
    80005c50:	02d7d7bb          	divuw	a5,a5,a3
    80005c54:	f8b402a3          	sb	a1,-123(s0)
    80005c58:	46ea7863          	bgeu	s4,a4,800060c8 <__printf+0x650>
    80005c5c:	02d7f5bb          	remuw	a1,a5,a3
    80005c60:	02059593          	slli	a1,a1,0x20
    80005c64:	0205d593          	srli	a1,a1,0x20
    80005c68:	00bd85b3          	add	a1,s11,a1
    80005c6c:	0005c583          	lbu	a1,0(a1)
    80005c70:	02d7d7bb          	divuw	a5,a5,a3
    80005c74:	f8b40323          	sb	a1,-122(s0)
    80005c78:	3eeaf863          	bgeu	s5,a4,80006068 <__printf+0x5f0>
    80005c7c:	02d7f5bb          	remuw	a1,a5,a3
    80005c80:	02059593          	slli	a1,a1,0x20
    80005c84:	0205d593          	srli	a1,a1,0x20
    80005c88:	00bd85b3          	add	a1,s11,a1
    80005c8c:	0005c583          	lbu	a1,0(a1)
    80005c90:	02d7d7bb          	divuw	a5,a5,a3
    80005c94:	f8b403a3          	sb	a1,-121(s0)
    80005c98:	42eb7e63          	bgeu	s6,a4,800060d4 <__printf+0x65c>
    80005c9c:	02d7f5bb          	remuw	a1,a5,a3
    80005ca0:	02059593          	slli	a1,a1,0x20
    80005ca4:	0205d593          	srli	a1,a1,0x20
    80005ca8:	00bd85b3          	add	a1,s11,a1
    80005cac:	0005c583          	lbu	a1,0(a1)
    80005cb0:	02d7d7bb          	divuw	a5,a5,a3
    80005cb4:	f8b40423          	sb	a1,-120(s0)
    80005cb8:	42ebfc63          	bgeu	s7,a4,800060f0 <__printf+0x678>
    80005cbc:	02079793          	slli	a5,a5,0x20
    80005cc0:	0207d793          	srli	a5,a5,0x20
    80005cc4:	00fd8db3          	add	s11,s11,a5
    80005cc8:	000dc703          	lbu	a4,0(s11)
    80005ccc:	00a00793          	li	a5,10
    80005cd0:	00900c93          	li	s9,9
    80005cd4:	f8e404a3          	sb	a4,-119(s0)
    80005cd8:	00065c63          	bgez	a2,80005cf0 <__printf+0x278>
    80005cdc:	f9040713          	addi	a4,s0,-112
    80005ce0:	00f70733          	add	a4,a4,a5
    80005ce4:	02d00693          	li	a3,45
    80005ce8:	fed70823          	sb	a3,-16(a4)
    80005cec:	00078c93          	mv	s9,a5
    80005cf0:	f8040793          	addi	a5,s0,-128
    80005cf4:	01978cb3          	add	s9,a5,s9
    80005cf8:	f7f40d13          	addi	s10,s0,-129
    80005cfc:	000cc503          	lbu	a0,0(s9)
    80005d00:	fffc8c93          	addi	s9,s9,-1
    80005d04:	00000097          	auipc	ra,0x0
    80005d08:	b90080e7          	jalr	-1136(ra) # 80005894 <consputc>
    80005d0c:	ffac98e3          	bne	s9,s10,80005cfc <__printf+0x284>
    80005d10:	00094503          	lbu	a0,0(s2)
    80005d14:	e00514e3          	bnez	a0,80005b1c <__printf+0xa4>
    80005d18:	1a0c1663          	bnez	s8,80005ec4 <__printf+0x44c>
    80005d1c:	08813083          	ld	ra,136(sp)
    80005d20:	08013403          	ld	s0,128(sp)
    80005d24:	07813483          	ld	s1,120(sp)
    80005d28:	07013903          	ld	s2,112(sp)
    80005d2c:	06813983          	ld	s3,104(sp)
    80005d30:	06013a03          	ld	s4,96(sp)
    80005d34:	05813a83          	ld	s5,88(sp)
    80005d38:	05013b03          	ld	s6,80(sp)
    80005d3c:	04813b83          	ld	s7,72(sp)
    80005d40:	04013c03          	ld	s8,64(sp)
    80005d44:	03813c83          	ld	s9,56(sp)
    80005d48:	03013d03          	ld	s10,48(sp)
    80005d4c:	02813d83          	ld	s11,40(sp)
    80005d50:	0d010113          	addi	sp,sp,208
    80005d54:	00008067          	ret
    80005d58:	07300713          	li	a4,115
    80005d5c:	1ce78a63          	beq	a5,a4,80005f30 <__printf+0x4b8>
    80005d60:	07800713          	li	a4,120
    80005d64:	1ee79e63          	bne	a5,a4,80005f60 <__printf+0x4e8>
    80005d68:	f7843783          	ld	a5,-136(s0)
    80005d6c:	0007a703          	lw	a4,0(a5)
    80005d70:	00878793          	addi	a5,a5,8
    80005d74:	f6f43c23          	sd	a5,-136(s0)
    80005d78:	28074263          	bltz	a4,80005ffc <__printf+0x584>
    80005d7c:	00001d97          	auipc	s11,0x1
    80005d80:	48cd8d93          	addi	s11,s11,1164 # 80007208 <digits>
    80005d84:	00f77793          	andi	a5,a4,15
    80005d88:	00fd87b3          	add	a5,s11,a5
    80005d8c:	0007c683          	lbu	a3,0(a5)
    80005d90:	00f00613          	li	a2,15
    80005d94:	0007079b          	sext.w	a5,a4
    80005d98:	f8d40023          	sb	a3,-128(s0)
    80005d9c:	0047559b          	srliw	a1,a4,0x4
    80005da0:	0047569b          	srliw	a3,a4,0x4
    80005da4:	00000c93          	li	s9,0
    80005da8:	0ee65063          	bge	a2,a4,80005e88 <__printf+0x410>
    80005dac:	00f6f693          	andi	a3,a3,15
    80005db0:	00dd86b3          	add	a3,s11,a3
    80005db4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80005db8:	0087d79b          	srliw	a5,a5,0x8
    80005dbc:	00100c93          	li	s9,1
    80005dc0:	f8d400a3          	sb	a3,-127(s0)
    80005dc4:	0cb67263          	bgeu	a2,a1,80005e88 <__printf+0x410>
    80005dc8:	00f7f693          	andi	a3,a5,15
    80005dcc:	00dd86b3          	add	a3,s11,a3
    80005dd0:	0006c583          	lbu	a1,0(a3)
    80005dd4:	00f00613          	li	a2,15
    80005dd8:	0047d69b          	srliw	a3,a5,0x4
    80005ddc:	f8b40123          	sb	a1,-126(s0)
    80005de0:	0047d593          	srli	a1,a5,0x4
    80005de4:	28f67e63          	bgeu	a2,a5,80006080 <__printf+0x608>
    80005de8:	00f6f693          	andi	a3,a3,15
    80005dec:	00dd86b3          	add	a3,s11,a3
    80005df0:	0006c503          	lbu	a0,0(a3)
    80005df4:	0087d813          	srli	a6,a5,0x8
    80005df8:	0087d69b          	srliw	a3,a5,0x8
    80005dfc:	f8a401a3          	sb	a0,-125(s0)
    80005e00:	28b67663          	bgeu	a2,a1,8000608c <__printf+0x614>
    80005e04:	00f6f693          	andi	a3,a3,15
    80005e08:	00dd86b3          	add	a3,s11,a3
    80005e0c:	0006c583          	lbu	a1,0(a3)
    80005e10:	00c7d513          	srli	a0,a5,0xc
    80005e14:	00c7d69b          	srliw	a3,a5,0xc
    80005e18:	f8b40223          	sb	a1,-124(s0)
    80005e1c:	29067a63          	bgeu	a2,a6,800060b0 <__printf+0x638>
    80005e20:	00f6f693          	andi	a3,a3,15
    80005e24:	00dd86b3          	add	a3,s11,a3
    80005e28:	0006c583          	lbu	a1,0(a3)
    80005e2c:	0107d813          	srli	a6,a5,0x10
    80005e30:	0107d69b          	srliw	a3,a5,0x10
    80005e34:	f8b402a3          	sb	a1,-123(s0)
    80005e38:	28a67263          	bgeu	a2,a0,800060bc <__printf+0x644>
    80005e3c:	00f6f693          	andi	a3,a3,15
    80005e40:	00dd86b3          	add	a3,s11,a3
    80005e44:	0006c683          	lbu	a3,0(a3)
    80005e48:	0147d79b          	srliw	a5,a5,0x14
    80005e4c:	f8d40323          	sb	a3,-122(s0)
    80005e50:	21067663          	bgeu	a2,a6,8000605c <__printf+0x5e4>
    80005e54:	02079793          	slli	a5,a5,0x20
    80005e58:	0207d793          	srli	a5,a5,0x20
    80005e5c:	00fd8db3          	add	s11,s11,a5
    80005e60:	000dc683          	lbu	a3,0(s11)
    80005e64:	00800793          	li	a5,8
    80005e68:	00700c93          	li	s9,7
    80005e6c:	f8d403a3          	sb	a3,-121(s0)
    80005e70:	00075c63          	bgez	a4,80005e88 <__printf+0x410>
    80005e74:	f9040713          	addi	a4,s0,-112
    80005e78:	00f70733          	add	a4,a4,a5
    80005e7c:	02d00693          	li	a3,45
    80005e80:	fed70823          	sb	a3,-16(a4)
    80005e84:	00078c93          	mv	s9,a5
    80005e88:	f8040793          	addi	a5,s0,-128
    80005e8c:	01978cb3          	add	s9,a5,s9
    80005e90:	f7f40d13          	addi	s10,s0,-129
    80005e94:	000cc503          	lbu	a0,0(s9)
    80005e98:	fffc8c93          	addi	s9,s9,-1
    80005e9c:	00000097          	auipc	ra,0x0
    80005ea0:	9f8080e7          	jalr	-1544(ra) # 80005894 <consputc>
    80005ea4:	ff9d18e3          	bne	s10,s9,80005e94 <__printf+0x41c>
    80005ea8:	0100006f          	j	80005eb8 <__printf+0x440>
    80005eac:	00000097          	auipc	ra,0x0
    80005eb0:	9e8080e7          	jalr	-1560(ra) # 80005894 <consputc>
    80005eb4:	000c8493          	mv	s1,s9
    80005eb8:	00094503          	lbu	a0,0(s2)
    80005ebc:	c60510e3          	bnez	a0,80005b1c <__printf+0xa4>
    80005ec0:	e40c0ee3          	beqz	s8,80005d1c <__printf+0x2a4>
    80005ec4:	00004517          	auipc	a0,0x4
    80005ec8:	62c50513          	addi	a0,a0,1580 # 8000a4f0 <pr>
    80005ecc:	00001097          	auipc	ra,0x1
    80005ed0:	94c080e7          	jalr	-1716(ra) # 80006818 <release>
    80005ed4:	e49ff06f          	j	80005d1c <__printf+0x2a4>
    80005ed8:	f7843783          	ld	a5,-136(s0)
    80005edc:	03000513          	li	a0,48
    80005ee0:	01000d13          	li	s10,16
    80005ee4:	00878713          	addi	a4,a5,8
    80005ee8:	0007bc83          	ld	s9,0(a5)
    80005eec:	f6e43c23          	sd	a4,-136(s0)
    80005ef0:	00000097          	auipc	ra,0x0
    80005ef4:	9a4080e7          	jalr	-1628(ra) # 80005894 <consputc>
    80005ef8:	07800513          	li	a0,120
    80005efc:	00000097          	auipc	ra,0x0
    80005f00:	998080e7          	jalr	-1640(ra) # 80005894 <consputc>
    80005f04:	00001d97          	auipc	s11,0x1
    80005f08:	304d8d93          	addi	s11,s11,772 # 80007208 <digits>
    80005f0c:	03ccd793          	srli	a5,s9,0x3c
    80005f10:	00fd87b3          	add	a5,s11,a5
    80005f14:	0007c503          	lbu	a0,0(a5)
    80005f18:	fffd0d1b          	addiw	s10,s10,-1
    80005f1c:	004c9c93          	slli	s9,s9,0x4
    80005f20:	00000097          	auipc	ra,0x0
    80005f24:	974080e7          	jalr	-1676(ra) # 80005894 <consputc>
    80005f28:	fe0d12e3          	bnez	s10,80005f0c <__printf+0x494>
    80005f2c:	f8dff06f          	j	80005eb8 <__printf+0x440>
    80005f30:	f7843783          	ld	a5,-136(s0)
    80005f34:	0007bc83          	ld	s9,0(a5)
    80005f38:	00878793          	addi	a5,a5,8
    80005f3c:	f6f43c23          	sd	a5,-136(s0)
    80005f40:	000c9a63          	bnez	s9,80005f54 <__printf+0x4dc>
    80005f44:	1080006f          	j	8000604c <__printf+0x5d4>
    80005f48:	001c8c93          	addi	s9,s9,1
    80005f4c:	00000097          	auipc	ra,0x0
    80005f50:	948080e7          	jalr	-1720(ra) # 80005894 <consputc>
    80005f54:	000cc503          	lbu	a0,0(s9)
    80005f58:	fe0518e3          	bnez	a0,80005f48 <__printf+0x4d0>
    80005f5c:	f5dff06f          	j	80005eb8 <__printf+0x440>
    80005f60:	02500513          	li	a0,37
    80005f64:	00000097          	auipc	ra,0x0
    80005f68:	930080e7          	jalr	-1744(ra) # 80005894 <consputc>
    80005f6c:	000c8513          	mv	a0,s9
    80005f70:	00000097          	auipc	ra,0x0
    80005f74:	924080e7          	jalr	-1756(ra) # 80005894 <consputc>
    80005f78:	f41ff06f          	j	80005eb8 <__printf+0x440>
    80005f7c:	02500513          	li	a0,37
    80005f80:	00000097          	auipc	ra,0x0
    80005f84:	914080e7          	jalr	-1772(ra) # 80005894 <consputc>
    80005f88:	f31ff06f          	j	80005eb8 <__printf+0x440>
    80005f8c:	00030513          	mv	a0,t1
    80005f90:	00000097          	auipc	ra,0x0
    80005f94:	7bc080e7          	jalr	1980(ra) # 8000674c <acquire>
    80005f98:	b4dff06f          	j	80005ae4 <__printf+0x6c>
    80005f9c:	40c0053b          	negw	a0,a2
    80005fa0:	00a00713          	li	a4,10
    80005fa4:	02e576bb          	remuw	a3,a0,a4
    80005fa8:	00001d97          	auipc	s11,0x1
    80005fac:	260d8d93          	addi	s11,s11,608 # 80007208 <digits>
    80005fb0:	ff700593          	li	a1,-9
    80005fb4:	02069693          	slli	a3,a3,0x20
    80005fb8:	0206d693          	srli	a3,a3,0x20
    80005fbc:	00dd86b3          	add	a3,s11,a3
    80005fc0:	0006c683          	lbu	a3,0(a3)
    80005fc4:	02e557bb          	divuw	a5,a0,a4
    80005fc8:	f8d40023          	sb	a3,-128(s0)
    80005fcc:	10b65e63          	bge	a2,a1,800060e8 <__printf+0x670>
    80005fd0:	06300593          	li	a1,99
    80005fd4:	02e7f6bb          	remuw	a3,a5,a4
    80005fd8:	02069693          	slli	a3,a3,0x20
    80005fdc:	0206d693          	srli	a3,a3,0x20
    80005fe0:	00dd86b3          	add	a3,s11,a3
    80005fe4:	0006c683          	lbu	a3,0(a3)
    80005fe8:	02e7d73b          	divuw	a4,a5,a4
    80005fec:	00200793          	li	a5,2
    80005ff0:	f8d400a3          	sb	a3,-127(s0)
    80005ff4:	bca5ece3          	bltu	a1,a0,80005bcc <__printf+0x154>
    80005ff8:	ce5ff06f          	j	80005cdc <__printf+0x264>
    80005ffc:	40e007bb          	negw	a5,a4
    80006000:	00001d97          	auipc	s11,0x1
    80006004:	208d8d93          	addi	s11,s11,520 # 80007208 <digits>
    80006008:	00f7f693          	andi	a3,a5,15
    8000600c:	00dd86b3          	add	a3,s11,a3
    80006010:	0006c583          	lbu	a1,0(a3)
    80006014:	ff100613          	li	a2,-15
    80006018:	0047d69b          	srliw	a3,a5,0x4
    8000601c:	f8b40023          	sb	a1,-128(s0)
    80006020:	0047d59b          	srliw	a1,a5,0x4
    80006024:	0ac75e63          	bge	a4,a2,800060e0 <__printf+0x668>
    80006028:	00f6f693          	andi	a3,a3,15
    8000602c:	00dd86b3          	add	a3,s11,a3
    80006030:	0006c603          	lbu	a2,0(a3)
    80006034:	00f00693          	li	a3,15
    80006038:	0087d79b          	srliw	a5,a5,0x8
    8000603c:	f8c400a3          	sb	a2,-127(s0)
    80006040:	d8b6e4e3          	bltu	a3,a1,80005dc8 <__printf+0x350>
    80006044:	00200793          	li	a5,2
    80006048:	e2dff06f          	j	80005e74 <__printf+0x3fc>
    8000604c:	00001c97          	auipc	s9,0x1
    80006050:	19cc8c93          	addi	s9,s9,412 # 800071e8 <_ZN3stm4coutE+0x188>
    80006054:	02800513          	li	a0,40
    80006058:	ef1ff06f          	j	80005f48 <__printf+0x4d0>
    8000605c:	00700793          	li	a5,7
    80006060:	00600c93          	li	s9,6
    80006064:	e0dff06f          	j	80005e70 <__printf+0x3f8>
    80006068:	00700793          	li	a5,7
    8000606c:	00600c93          	li	s9,6
    80006070:	c69ff06f          	j	80005cd8 <__printf+0x260>
    80006074:	00300793          	li	a5,3
    80006078:	00200c93          	li	s9,2
    8000607c:	c5dff06f          	j	80005cd8 <__printf+0x260>
    80006080:	00300793          	li	a5,3
    80006084:	00200c93          	li	s9,2
    80006088:	de9ff06f          	j	80005e70 <__printf+0x3f8>
    8000608c:	00400793          	li	a5,4
    80006090:	00300c93          	li	s9,3
    80006094:	dddff06f          	j	80005e70 <__printf+0x3f8>
    80006098:	00400793          	li	a5,4
    8000609c:	00300c93          	li	s9,3
    800060a0:	c39ff06f          	j	80005cd8 <__printf+0x260>
    800060a4:	00500793          	li	a5,5
    800060a8:	00400c93          	li	s9,4
    800060ac:	c2dff06f          	j	80005cd8 <__printf+0x260>
    800060b0:	00500793          	li	a5,5
    800060b4:	00400c93          	li	s9,4
    800060b8:	db9ff06f          	j	80005e70 <__printf+0x3f8>
    800060bc:	00600793          	li	a5,6
    800060c0:	00500c93          	li	s9,5
    800060c4:	dadff06f          	j	80005e70 <__printf+0x3f8>
    800060c8:	00600793          	li	a5,6
    800060cc:	00500c93          	li	s9,5
    800060d0:	c09ff06f          	j	80005cd8 <__printf+0x260>
    800060d4:	00800793          	li	a5,8
    800060d8:	00700c93          	li	s9,7
    800060dc:	bfdff06f          	j	80005cd8 <__printf+0x260>
    800060e0:	00100793          	li	a5,1
    800060e4:	d91ff06f          	j	80005e74 <__printf+0x3fc>
    800060e8:	00100793          	li	a5,1
    800060ec:	bf1ff06f          	j	80005cdc <__printf+0x264>
    800060f0:	00900793          	li	a5,9
    800060f4:	00800c93          	li	s9,8
    800060f8:	be1ff06f          	j	80005cd8 <__printf+0x260>
    800060fc:	00001517          	auipc	a0,0x1
    80006100:	0f450513          	addi	a0,a0,244 # 800071f0 <_ZN3stm4coutE+0x190>
    80006104:	00000097          	auipc	ra,0x0
    80006108:	918080e7          	jalr	-1768(ra) # 80005a1c <panic>

000000008000610c <printfinit>:
    8000610c:	fe010113          	addi	sp,sp,-32
    80006110:	00813823          	sd	s0,16(sp)
    80006114:	00913423          	sd	s1,8(sp)
    80006118:	00113c23          	sd	ra,24(sp)
    8000611c:	02010413          	addi	s0,sp,32
    80006120:	00004497          	auipc	s1,0x4
    80006124:	3d048493          	addi	s1,s1,976 # 8000a4f0 <pr>
    80006128:	00048513          	mv	a0,s1
    8000612c:	00001597          	auipc	a1,0x1
    80006130:	0d458593          	addi	a1,a1,212 # 80007200 <_ZN3stm4coutE+0x1a0>
    80006134:	00000097          	auipc	ra,0x0
    80006138:	5f4080e7          	jalr	1524(ra) # 80006728 <initlock>
    8000613c:	01813083          	ld	ra,24(sp)
    80006140:	01013403          	ld	s0,16(sp)
    80006144:	0004ac23          	sw	zero,24(s1)
    80006148:	00813483          	ld	s1,8(sp)
    8000614c:	02010113          	addi	sp,sp,32
    80006150:	00008067          	ret

0000000080006154 <uartinit>:
    80006154:	ff010113          	addi	sp,sp,-16
    80006158:	00813423          	sd	s0,8(sp)
    8000615c:	01010413          	addi	s0,sp,16
    80006160:	100007b7          	lui	a5,0x10000
    80006164:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006168:	f8000713          	li	a4,-128
    8000616c:	00e781a3          	sb	a4,3(a5)
    80006170:	00300713          	li	a4,3
    80006174:	00e78023          	sb	a4,0(a5)
    80006178:	000780a3          	sb	zero,1(a5)
    8000617c:	00e781a3          	sb	a4,3(a5)
    80006180:	00700693          	li	a3,7
    80006184:	00d78123          	sb	a3,2(a5)
    80006188:	00e780a3          	sb	a4,1(a5)
    8000618c:	00813403          	ld	s0,8(sp)
    80006190:	01010113          	addi	sp,sp,16
    80006194:	00008067          	ret

0000000080006198 <uartputc>:
    80006198:	00003797          	auipc	a5,0x3
    8000619c:	0407a783          	lw	a5,64(a5) # 800091d8 <panicked>
    800061a0:	00078463          	beqz	a5,800061a8 <uartputc+0x10>
    800061a4:	0000006f          	j	800061a4 <uartputc+0xc>
    800061a8:	fd010113          	addi	sp,sp,-48
    800061ac:	02813023          	sd	s0,32(sp)
    800061b0:	00913c23          	sd	s1,24(sp)
    800061b4:	01213823          	sd	s2,16(sp)
    800061b8:	01313423          	sd	s3,8(sp)
    800061bc:	02113423          	sd	ra,40(sp)
    800061c0:	03010413          	addi	s0,sp,48
    800061c4:	00003917          	auipc	s2,0x3
    800061c8:	01c90913          	addi	s2,s2,28 # 800091e0 <uart_tx_r>
    800061cc:	00093783          	ld	a5,0(s2)
    800061d0:	00003497          	auipc	s1,0x3
    800061d4:	01848493          	addi	s1,s1,24 # 800091e8 <uart_tx_w>
    800061d8:	0004b703          	ld	a4,0(s1)
    800061dc:	02078693          	addi	a3,a5,32
    800061e0:	00050993          	mv	s3,a0
    800061e4:	02e69c63          	bne	a3,a4,8000621c <uartputc+0x84>
    800061e8:	00001097          	auipc	ra,0x1
    800061ec:	834080e7          	jalr	-1996(ra) # 80006a1c <push_on>
    800061f0:	00093783          	ld	a5,0(s2)
    800061f4:	0004b703          	ld	a4,0(s1)
    800061f8:	02078793          	addi	a5,a5,32
    800061fc:	00e79463          	bne	a5,a4,80006204 <uartputc+0x6c>
    80006200:	0000006f          	j	80006200 <uartputc+0x68>
    80006204:	00001097          	auipc	ra,0x1
    80006208:	88c080e7          	jalr	-1908(ra) # 80006a90 <pop_on>
    8000620c:	00093783          	ld	a5,0(s2)
    80006210:	0004b703          	ld	a4,0(s1)
    80006214:	02078693          	addi	a3,a5,32
    80006218:	fce688e3          	beq	a3,a4,800061e8 <uartputc+0x50>
    8000621c:	01f77693          	andi	a3,a4,31
    80006220:	00004597          	auipc	a1,0x4
    80006224:	2f058593          	addi	a1,a1,752 # 8000a510 <uart_tx_buf>
    80006228:	00d586b3          	add	a3,a1,a3
    8000622c:	00170713          	addi	a4,a4,1
    80006230:	01368023          	sb	s3,0(a3)
    80006234:	00e4b023          	sd	a4,0(s1)
    80006238:	10000637          	lui	a2,0x10000
    8000623c:	02f71063          	bne	a4,a5,8000625c <uartputc+0xc4>
    80006240:	0340006f          	j	80006274 <uartputc+0xdc>
    80006244:	00074703          	lbu	a4,0(a4)
    80006248:	00f93023          	sd	a5,0(s2)
    8000624c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006250:	00093783          	ld	a5,0(s2)
    80006254:	0004b703          	ld	a4,0(s1)
    80006258:	00f70e63          	beq	a4,a5,80006274 <uartputc+0xdc>
    8000625c:	00564683          	lbu	a3,5(a2)
    80006260:	01f7f713          	andi	a4,a5,31
    80006264:	00e58733          	add	a4,a1,a4
    80006268:	0206f693          	andi	a3,a3,32
    8000626c:	00178793          	addi	a5,a5,1
    80006270:	fc069ae3          	bnez	a3,80006244 <uartputc+0xac>
    80006274:	02813083          	ld	ra,40(sp)
    80006278:	02013403          	ld	s0,32(sp)
    8000627c:	01813483          	ld	s1,24(sp)
    80006280:	01013903          	ld	s2,16(sp)
    80006284:	00813983          	ld	s3,8(sp)
    80006288:	03010113          	addi	sp,sp,48
    8000628c:	00008067          	ret

0000000080006290 <uartputc_sync>:
    80006290:	ff010113          	addi	sp,sp,-16
    80006294:	00813423          	sd	s0,8(sp)
    80006298:	01010413          	addi	s0,sp,16
    8000629c:	00003717          	auipc	a4,0x3
    800062a0:	f3c72703          	lw	a4,-196(a4) # 800091d8 <panicked>
    800062a4:	02071663          	bnez	a4,800062d0 <uartputc_sync+0x40>
    800062a8:	00050793          	mv	a5,a0
    800062ac:	100006b7          	lui	a3,0x10000
    800062b0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800062b4:	02077713          	andi	a4,a4,32
    800062b8:	fe070ce3          	beqz	a4,800062b0 <uartputc_sync+0x20>
    800062bc:	0ff7f793          	andi	a5,a5,255
    800062c0:	00f68023          	sb	a5,0(a3)
    800062c4:	00813403          	ld	s0,8(sp)
    800062c8:	01010113          	addi	sp,sp,16
    800062cc:	00008067          	ret
    800062d0:	0000006f          	j	800062d0 <uartputc_sync+0x40>

00000000800062d4 <uartstart>:
    800062d4:	ff010113          	addi	sp,sp,-16
    800062d8:	00813423          	sd	s0,8(sp)
    800062dc:	01010413          	addi	s0,sp,16
    800062e0:	00003617          	auipc	a2,0x3
    800062e4:	f0060613          	addi	a2,a2,-256 # 800091e0 <uart_tx_r>
    800062e8:	00003517          	auipc	a0,0x3
    800062ec:	f0050513          	addi	a0,a0,-256 # 800091e8 <uart_tx_w>
    800062f0:	00063783          	ld	a5,0(a2)
    800062f4:	00053703          	ld	a4,0(a0)
    800062f8:	04f70263          	beq	a4,a5,8000633c <uartstart+0x68>
    800062fc:	100005b7          	lui	a1,0x10000
    80006300:	00004817          	auipc	a6,0x4
    80006304:	21080813          	addi	a6,a6,528 # 8000a510 <uart_tx_buf>
    80006308:	01c0006f          	j	80006324 <uartstart+0x50>
    8000630c:	0006c703          	lbu	a4,0(a3)
    80006310:	00f63023          	sd	a5,0(a2)
    80006314:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006318:	00063783          	ld	a5,0(a2)
    8000631c:	00053703          	ld	a4,0(a0)
    80006320:	00f70e63          	beq	a4,a5,8000633c <uartstart+0x68>
    80006324:	01f7f713          	andi	a4,a5,31
    80006328:	00e806b3          	add	a3,a6,a4
    8000632c:	0055c703          	lbu	a4,5(a1)
    80006330:	00178793          	addi	a5,a5,1
    80006334:	02077713          	andi	a4,a4,32
    80006338:	fc071ae3          	bnez	a4,8000630c <uartstart+0x38>
    8000633c:	00813403          	ld	s0,8(sp)
    80006340:	01010113          	addi	sp,sp,16
    80006344:	00008067          	ret

0000000080006348 <uartgetc>:
    80006348:	ff010113          	addi	sp,sp,-16
    8000634c:	00813423          	sd	s0,8(sp)
    80006350:	01010413          	addi	s0,sp,16
    80006354:	10000737          	lui	a4,0x10000
    80006358:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000635c:	0017f793          	andi	a5,a5,1
    80006360:	00078c63          	beqz	a5,80006378 <uartgetc+0x30>
    80006364:	00074503          	lbu	a0,0(a4)
    80006368:	0ff57513          	andi	a0,a0,255
    8000636c:	00813403          	ld	s0,8(sp)
    80006370:	01010113          	addi	sp,sp,16
    80006374:	00008067          	ret
    80006378:	fff00513          	li	a0,-1
    8000637c:	ff1ff06f          	j	8000636c <uartgetc+0x24>

0000000080006380 <uartintr>:
    80006380:	100007b7          	lui	a5,0x10000
    80006384:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006388:	0017f793          	andi	a5,a5,1
    8000638c:	0a078463          	beqz	a5,80006434 <uartintr+0xb4>
    80006390:	fe010113          	addi	sp,sp,-32
    80006394:	00813823          	sd	s0,16(sp)
    80006398:	00913423          	sd	s1,8(sp)
    8000639c:	00113c23          	sd	ra,24(sp)
    800063a0:	02010413          	addi	s0,sp,32
    800063a4:	100004b7          	lui	s1,0x10000
    800063a8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800063ac:	0ff57513          	andi	a0,a0,255
    800063b0:	fffff097          	auipc	ra,0xfffff
    800063b4:	534080e7          	jalr	1332(ra) # 800058e4 <consoleintr>
    800063b8:	0054c783          	lbu	a5,5(s1)
    800063bc:	0017f793          	andi	a5,a5,1
    800063c0:	fe0794e3          	bnez	a5,800063a8 <uartintr+0x28>
    800063c4:	00003617          	auipc	a2,0x3
    800063c8:	e1c60613          	addi	a2,a2,-484 # 800091e0 <uart_tx_r>
    800063cc:	00003517          	auipc	a0,0x3
    800063d0:	e1c50513          	addi	a0,a0,-484 # 800091e8 <uart_tx_w>
    800063d4:	00063783          	ld	a5,0(a2)
    800063d8:	00053703          	ld	a4,0(a0)
    800063dc:	04f70263          	beq	a4,a5,80006420 <uartintr+0xa0>
    800063e0:	100005b7          	lui	a1,0x10000
    800063e4:	00004817          	auipc	a6,0x4
    800063e8:	12c80813          	addi	a6,a6,300 # 8000a510 <uart_tx_buf>
    800063ec:	01c0006f          	j	80006408 <uartintr+0x88>
    800063f0:	0006c703          	lbu	a4,0(a3)
    800063f4:	00f63023          	sd	a5,0(a2)
    800063f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800063fc:	00063783          	ld	a5,0(a2)
    80006400:	00053703          	ld	a4,0(a0)
    80006404:	00f70e63          	beq	a4,a5,80006420 <uartintr+0xa0>
    80006408:	01f7f713          	andi	a4,a5,31
    8000640c:	00e806b3          	add	a3,a6,a4
    80006410:	0055c703          	lbu	a4,5(a1)
    80006414:	00178793          	addi	a5,a5,1
    80006418:	02077713          	andi	a4,a4,32
    8000641c:	fc071ae3          	bnez	a4,800063f0 <uartintr+0x70>
    80006420:	01813083          	ld	ra,24(sp)
    80006424:	01013403          	ld	s0,16(sp)
    80006428:	00813483          	ld	s1,8(sp)
    8000642c:	02010113          	addi	sp,sp,32
    80006430:	00008067          	ret
    80006434:	00003617          	auipc	a2,0x3
    80006438:	dac60613          	addi	a2,a2,-596 # 800091e0 <uart_tx_r>
    8000643c:	00003517          	auipc	a0,0x3
    80006440:	dac50513          	addi	a0,a0,-596 # 800091e8 <uart_tx_w>
    80006444:	00063783          	ld	a5,0(a2)
    80006448:	00053703          	ld	a4,0(a0)
    8000644c:	04f70263          	beq	a4,a5,80006490 <uartintr+0x110>
    80006450:	100005b7          	lui	a1,0x10000
    80006454:	00004817          	auipc	a6,0x4
    80006458:	0bc80813          	addi	a6,a6,188 # 8000a510 <uart_tx_buf>
    8000645c:	01c0006f          	j	80006478 <uartintr+0xf8>
    80006460:	0006c703          	lbu	a4,0(a3)
    80006464:	00f63023          	sd	a5,0(a2)
    80006468:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000646c:	00063783          	ld	a5,0(a2)
    80006470:	00053703          	ld	a4,0(a0)
    80006474:	02f70063          	beq	a4,a5,80006494 <uartintr+0x114>
    80006478:	01f7f713          	andi	a4,a5,31
    8000647c:	00e806b3          	add	a3,a6,a4
    80006480:	0055c703          	lbu	a4,5(a1)
    80006484:	00178793          	addi	a5,a5,1
    80006488:	02077713          	andi	a4,a4,32
    8000648c:	fc071ae3          	bnez	a4,80006460 <uartintr+0xe0>
    80006490:	00008067          	ret
    80006494:	00008067          	ret

0000000080006498 <kinit>:
    80006498:	fc010113          	addi	sp,sp,-64
    8000649c:	02913423          	sd	s1,40(sp)
    800064a0:	fffff7b7          	lui	a5,0xfffff
    800064a4:	00005497          	auipc	s1,0x5
    800064a8:	08b48493          	addi	s1,s1,139 # 8000b52f <end+0xfff>
    800064ac:	02813823          	sd	s0,48(sp)
    800064b0:	01313c23          	sd	s3,24(sp)
    800064b4:	00f4f4b3          	and	s1,s1,a5
    800064b8:	02113c23          	sd	ra,56(sp)
    800064bc:	03213023          	sd	s2,32(sp)
    800064c0:	01413823          	sd	s4,16(sp)
    800064c4:	01513423          	sd	s5,8(sp)
    800064c8:	04010413          	addi	s0,sp,64
    800064cc:	000017b7          	lui	a5,0x1
    800064d0:	01100993          	li	s3,17
    800064d4:	00f487b3          	add	a5,s1,a5
    800064d8:	01b99993          	slli	s3,s3,0x1b
    800064dc:	06f9e063          	bltu	s3,a5,8000653c <kinit+0xa4>
    800064e0:	00004a97          	auipc	s5,0x4
    800064e4:	050a8a93          	addi	s5,s5,80 # 8000a530 <end>
    800064e8:	0754ec63          	bltu	s1,s5,80006560 <kinit+0xc8>
    800064ec:	0734fa63          	bgeu	s1,s3,80006560 <kinit+0xc8>
    800064f0:	00088a37          	lui	s4,0x88
    800064f4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800064f8:	00003917          	auipc	s2,0x3
    800064fc:	cf890913          	addi	s2,s2,-776 # 800091f0 <kmem>
    80006500:	00ca1a13          	slli	s4,s4,0xc
    80006504:	0140006f          	j	80006518 <kinit+0x80>
    80006508:	000017b7          	lui	a5,0x1
    8000650c:	00f484b3          	add	s1,s1,a5
    80006510:	0554e863          	bltu	s1,s5,80006560 <kinit+0xc8>
    80006514:	0534f663          	bgeu	s1,s3,80006560 <kinit+0xc8>
    80006518:	00001637          	lui	a2,0x1
    8000651c:	00100593          	li	a1,1
    80006520:	00048513          	mv	a0,s1
    80006524:	00000097          	auipc	ra,0x0
    80006528:	5e4080e7          	jalr	1508(ra) # 80006b08 <__memset>
    8000652c:	00093783          	ld	a5,0(s2)
    80006530:	00f4b023          	sd	a5,0(s1)
    80006534:	00993023          	sd	s1,0(s2)
    80006538:	fd4498e3          	bne	s1,s4,80006508 <kinit+0x70>
    8000653c:	03813083          	ld	ra,56(sp)
    80006540:	03013403          	ld	s0,48(sp)
    80006544:	02813483          	ld	s1,40(sp)
    80006548:	02013903          	ld	s2,32(sp)
    8000654c:	01813983          	ld	s3,24(sp)
    80006550:	01013a03          	ld	s4,16(sp)
    80006554:	00813a83          	ld	s5,8(sp)
    80006558:	04010113          	addi	sp,sp,64
    8000655c:	00008067          	ret
    80006560:	00001517          	auipc	a0,0x1
    80006564:	cc050513          	addi	a0,a0,-832 # 80007220 <digits+0x18>
    80006568:	fffff097          	auipc	ra,0xfffff
    8000656c:	4b4080e7          	jalr	1204(ra) # 80005a1c <panic>

0000000080006570 <freerange>:
    80006570:	fc010113          	addi	sp,sp,-64
    80006574:	000017b7          	lui	a5,0x1
    80006578:	02913423          	sd	s1,40(sp)
    8000657c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006580:	009504b3          	add	s1,a0,s1
    80006584:	fffff537          	lui	a0,0xfffff
    80006588:	02813823          	sd	s0,48(sp)
    8000658c:	02113c23          	sd	ra,56(sp)
    80006590:	03213023          	sd	s2,32(sp)
    80006594:	01313c23          	sd	s3,24(sp)
    80006598:	01413823          	sd	s4,16(sp)
    8000659c:	01513423          	sd	s5,8(sp)
    800065a0:	01613023          	sd	s6,0(sp)
    800065a4:	04010413          	addi	s0,sp,64
    800065a8:	00a4f4b3          	and	s1,s1,a0
    800065ac:	00f487b3          	add	a5,s1,a5
    800065b0:	06f5e463          	bltu	a1,a5,80006618 <freerange+0xa8>
    800065b4:	00004a97          	auipc	s5,0x4
    800065b8:	f7ca8a93          	addi	s5,s5,-132 # 8000a530 <end>
    800065bc:	0954e263          	bltu	s1,s5,80006640 <freerange+0xd0>
    800065c0:	01100993          	li	s3,17
    800065c4:	01b99993          	slli	s3,s3,0x1b
    800065c8:	0734fc63          	bgeu	s1,s3,80006640 <freerange+0xd0>
    800065cc:	00058a13          	mv	s4,a1
    800065d0:	00003917          	auipc	s2,0x3
    800065d4:	c2090913          	addi	s2,s2,-992 # 800091f0 <kmem>
    800065d8:	00002b37          	lui	s6,0x2
    800065dc:	0140006f          	j	800065f0 <freerange+0x80>
    800065e0:	000017b7          	lui	a5,0x1
    800065e4:	00f484b3          	add	s1,s1,a5
    800065e8:	0554ec63          	bltu	s1,s5,80006640 <freerange+0xd0>
    800065ec:	0534fa63          	bgeu	s1,s3,80006640 <freerange+0xd0>
    800065f0:	00001637          	lui	a2,0x1
    800065f4:	00100593          	li	a1,1
    800065f8:	00048513          	mv	a0,s1
    800065fc:	00000097          	auipc	ra,0x0
    80006600:	50c080e7          	jalr	1292(ra) # 80006b08 <__memset>
    80006604:	00093703          	ld	a4,0(s2)
    80006608:	016487b3          	add	a5,s1,s6
    8000660c:	00e4b023          	sd	a4,0(s1)
    80006610:	00993023          	sd	s1,0(s2)
    80006614:	fcfa76e3          	bgeu	s4,a5,800065e0 <freerange+0x70>
    80006618:	03813083          	ld	ra,56(sp)
    8000661c:	03013403          	ld	s0,48(sp)
    80006620:	02813483          	ld	s1,40(sp)
    80006624:	02013903          	ld	s2,32(sp)
    80006628:	01813983          	ld	s3,24(sp)
    8000662c:	01013a03          	ld	s4,16(sp)
    80006630:	00813a83          	ld	s5,8(sp)
    80006634:	00013b03          	ld	s6,0(sp)
    80006638:	04010113          	addi	sp,sp,64
    8000663c:	00008067          	ret
    80006640:	00001517          	auipc	a0,0x1
    80006644:	be050513          	addi	a0,a0,-1056 # 80007220 <digits+0x18>
    80006648:	fffff097          	auipc	ra,0xfffff
    8000664c:	3d4080e7          	jalr	980(ra) # 80005a1c <panic>

0000000080006650 <kfree>:
    80006650:	fe010113          	addi	sp,sp,-32
    80006654:	00813823          	sd	s0,16(sp)
    80006658:	00113c23          	sd	ra,24(sp)
    8000665c:	00913423          	sd	s1,8(sp)
    80006660:	02010413          	addi	s0,sp,32
    80006664:	03451793          	slli	a5,a0,0x34
    80006668:	04079c63          	bnez	a5,800066c0 <kfree+0x70>
    8000666c:	00004797          	auipc	a5,0x4
    80006670:	ec478793          	addi	a5,a5,-316 # 8000a530 <end>
    80006674:	00050493          	mv	s1,a0
    80006678:	04f56463          	bltu	a0,a5,800066c0 <kfree+0x70>
    8000667c:	01100793          	li	a5,17
    80006680:	01b79793          	slli	a5,a5,0x1b
    80006684:	02f57e63          	bgeu	a0,a5,800066c0 <kfree+0x70>
    80006688:	00001637          	lui	a2,0x1
    8000668c:	00100593          	li	a1,1
    80006690:	00000097          	auipc	ra,0x0
    80006694:	478080e7          	jalr	1144(ra) # 80006b08 <__memset>
    80006698:	00003797          	auipc	a5,0x3
    8000669c:	b5878793          	addi	a5,a5,-1192 # 800091f0 <kmem>
    800066a0:	0007b703          	ld	a4,0(a5)
    800066a4:	01813083          	ld	ra,24(sp)
    800066a8:	01013403          	ld	s0,16(sp)
    800066ac:	00e4b023          	sd	a4,0(s1)
    800066b0:	0097b023          	sd	s1,0(a5)
    800066b4:	00813483          	ld	s1,8(sp)
    800066b8:	02010113          	addi	sp,sp,32
    800066bc:	00008067          	ret
    800066c0:	00001517          	auipc	a0,0x1
    800066c4:	b6050513          	addi	a0,a0,-1184 # 80007220 <digits+0x18>
    800066c8:	fffff097          	auipc	ra,0xfffff
    800066cc:	354080e7          	jalr	852(ra) # 80005a1c <panic>

00000000800066d0 <kalloc>:
    800066d0:	fe010113          	addi	sp,sp,-32
    800066d4:	00813823          	sd	s0,16(sp)
    800066d8:	00913423          	sd	s1,8(sp)
    800066dc:	00113c23          	sd	ra,24(sp)
    800066e0:	02010413          	addi	s0,sp,32
    800066e4:	00003797          	auipc	a5,0x3
    800066e8:	b0c78793          	addi	a5,a5,-1268 # 800091f0 <kmem>
    800066ec:	0007b483          	ld	s1,0(a5)
    800066f0:	02048063          	beqz	s1,80006710 <kalloc+0x40>
    800066f4:	0004b703          	ld	a4,0(s1)
    800066f8:	00001637          	lui	a2,0x1
    800066fc:	00500593          	li	a1,5
    80006700:	00048513          	mv	a0,s1
    80006704:	00e7b023          	sd	a4,0(a5)
    80006708:	00000097          	auipc	ra,0x0
    8000670c:	400080e7          	jalr	1024(ra) # 80006b08 <__memset>
    80006710:	01813083          	ld	ra,24(sp)
    80006714:	01013403          	ld	s0,16(sp)
    80006718:	00048513          	mv	a0,s1
    8000671c:	00813483          	ld	s1,8(sp)
    80006720:	02010113          	addi	sp,sp,32
    80006724:	00008067          	ret

0000000080006728 <initlock>:
    80006728:	ff010113          	addi	sp,sp,-16
    8000672c:	00813423          	sd	s0,8(sp)
    80006730:	01010413          	addi	s0,sp,16
    80006734:	00813403          	ld	s0,8(sp)
    80006738:	00b53423          	sd	a1,8(a0)
    8000673c:	00052023          	sw	zero,0(a0)
    80006740:	00053823          	sd	zero,16(a0)
    80006744:	01010113          	addi	sp,sp,16
    80006748:	00008067          	ret

000000008000674c <acquire>:
    8000674c:	fe010113          	addi	sp,sp,-32
    80006750:	00813823          	sd	s0,16(sp)
    80006754:	00913423          	sd	s1,8(sp)
    80006758:	00113c23          	sd	ra,24(sp)
    8000675c:	01213023          	sd	s2,0(sp)
    80006760:	02010413          	addi	s0,sp,32
    80006764:	00050493          	mv	s1,a0
    80006768:	10002973          	csrr	s2,sstatus
    8000676c:	100027f3          	csrr	a5,sstatus
    80006770:	ffd7f793          	andi	a5,a5,-3
    80006774:	10079073          	csrw	sstatus,a5
    80006778:	fffff097          	auipc	ra,0xfffff
    8000677c:	8e4080e7          	jalr	-1820(ra) # 8000505c <mycpu>
    80006780:	07852783          	lw	a5,120(a0)
    80006784:	06078e63          	beqz	a5,80006800 <acquire+0xb4>
    80006788:	fffff097          	auipc	ra,0xfffff
    8000678c:	8d4080e7          	jalr	-1836(ra) # 8000505c <mycpu>
    80006790:	07852783          	lw	a5,120(a0)
    80006794:	0004a703          	lw	a4,0(s1)
    80006798:	0017879b          	addiw	a5,a5,1
    8000679c:	06f52c23          	sw	a5,120(a0)
    800067a0:	04071063          	bnez	a4,800067e0 <acquire+0x94>
    800067a4:	00100713          	li	a4,1
    800067a8:	00070793          	mv	a5,a4
    800067ac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800067b0:	0007879b          	sext.w	a5,a5
    800067b4:	fe079ae3          	bnez	a5,800067a8 <acquire+0x5c>
    800067b8:	0ff0000f          	fence
    800067bc:	fffff097          	auipc	ra,0xfffff
    800067c0:	8a0080e7          	jalr	-1888(ra) # 8000505c <mycpu>
    800067c4:	01813083          	ld	ra,24(sp)
    800067c8:	01013403          	ld	s0,16(sp)
    800067cc:	00a4b823          	sd	a0,16(s1)
    800067d0:	00013903          	ld	s2,0(sp)
    800067d4:	00813483          	ld	s1,8(sp)
    800067d8:	02010113          	addi	sp,sp,32
    800067dc:	00008067          	ret
    800067e0:	0104b903          	ld	s2,16(s1)
    800067e4:	fffff097          	auipc	ra,0xfffff
    800067e8:	878080e7          	jalr	-1928(ra) # 8000505c <mycpu>
    800067ec:	faa91ce3          	bne	s2,a0,800067a4 <acquire+0x58>
    800067f0:	00001517          	auipc	a0,0x1
    800067f4:	a3850513          	addi	a0,a0,-1480 # 80007228 <digits+0x20>
    800067f8:	fffff097          	auipc	ra,0xfffff
    800067fc:	224080e7          	jalr	548(ra) # 80005a1c <panic>
    80006800:	00195913          	srli	s2,s2,0x1
    80006804:	fffff097          	auipc	ra,0xfffff
    80006808:	858080e7          	jalr	-1960(ra) # 8000505c <mycpu>
    8000680c:	00197913          	andi	s2,s2,1
    80006810:	07252e23          	sw	s2,124(a0)
    80006814:	f75ff06f          	j	80006788 <acquire+0x3c>

0000000080006818 <release>:
    80006818:	fe010113          	addi	sp,sp,-32
    8000681c:	00813823          	sd	s0,16(sp)
    80006820:	00113c23          	sd	ra,24(sp)
    80006824:	00913423          	sd	s1,8(sp)
    80006828:	01213023          	sd	s2,0(sp)
    8000682c:	02010413          	addi	s0,sp,32
    80006830:	00052783          	lw	a5,0(a0)
    80006834:	00079a63          	bnez	a5,80006848 <release+0x30>
    80006838:	00001517          	auipc	a0,0x1
    8000683c:	9f850513          	addi	a0,a0,-1544 # 80007230 <digits+0x28>
    80006840:	fffff097          	auipc	ra,0xfffff
    80006844:	1dc080e7          	jalr	476(ra) # 80005a1c <panic>
    80006848:	01053903          	ld	s2,16(a0)
    8000684c:	00050493          	mv	s1,a0
    80006850:	fffff097          	auipc	ra,0xfffff
    80006854:	80c080e7          	jalr	-2036(ra) # 8000505c <mycpu>
    80006858:	fea910e3          	bne	s2,a0,80006838 <release+0x20>
    8000685c:	0004b823          	sd	zero,16(s1)
    80006860:	0ff0000f          	fence
    80006864:	0f50000f          	fence	iorw,ow
    80006868:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000686c:	ffffe097          	auipc	ra,0xffffe
    80006870:	7f0080e7          	jalr	2032(ra) # 8000505c <mycpu>
    80006874:	100027f3          	csrr	a5,sstatus
    80006878:	0027f793          	andi	a5,a5,2
    8000687c:	04079a63          	bnez	a5,800068d0 <release+0xb8>
    80006880:	07852783          	lw	a5,120(a0)
    80006884:	02f05e63          	blez	a5,800068c0 <release+0xa8>
    80006888:	fff7871b          	addiw	a4,a5,-1
    8000688c:	06e52c23          	sw	a4,120(a0)
    80006890:	00071c63          	bnez	a4,800068a8 <release+0x90>
    80006894:	07c52783          	lw	a5,124(a0)
    80006898:	00078863          	beqz	a5,800068a8 <release+0x90>
    8000689c:	100027f3          	csrr	a5,sstatus
    800068a0:	0027e793          	ori	a5,a5,2
    800068a4:	10079073          	csrw	sstatus,a5
    800068a8:	01813083          	ld	ra,24(sp)
    800068ac:	01013403          	ld	s0,16(sp)
    800068b0:	00813483          	ld	s1,8(sp)
    800068b4:	00013903          	ld	s2,0(sp)
    800068b8:	02010113          	addi	sp,sp,32
    800068bc:	00008067          	ret
    800068c0:	00001517          	auipc	a0,0x1
    800068c4:	99050513          	addi	a0,a0,-1648 # 80007250 <digits+0x48>
    800068c8:	fffff097          	auipc	ra,0xfffff
    800068cc:	154080e7          	jalr	340(ra) # 80005a1c <panic>
    800068d0:	00001517          	auipc	a0,0x1
    800068d4:	96850513          	addi	a0,a0,-1688 # 80007238 <digits+0x30>
    800068d8:	fffff097          	auipc	ra,0xfffff
    800068dc:	144080e7          	jalr	324(ra) # 80005a1c <panic>

00000000800068e0 <holding>:
    800068e0:	00052783          	lw	a5,0(a0)
    800068e4:	00079663          	bnez	a5,800068f0 <holding+0x10>
    800068e8:	00000513          	li	a0,0
    800068ec:	00008067          	ret
    800068f0:	fe010113          	addi	sp,sp,-32
    800068f4:	00813823          	sd	s0,16(sp)
    800068f8:	00913423          	sd	s1,8(sp)
    800068fc:	00113c23          	sd	ra,24(sp)
    80006900:	02010413          	addi	s0,sp,32
    80006904:	01053483          	ld	s1,16(a0)
    80006908:	ffffe097          	auipc	ra,0xffffe
    8000690c:	754080e7          	jalr	1876(ra) # 8000505c <mycpu>
    80006910:	01813083          	ld	ra,24(sp)
    80006914:	01013403          	ld	s0,16(sp)
    80006918:	40a48533          	sub	a0,s1,a0
    8000691c:	00153513          	seqz	a0,a0
    80006920:	00813483          	ld	s1,8(sp)
    80006924:	02010113          	addi	sp,sp,32
    80006928:	00008067          	ret

000000008000692c <push_off>:
    8000692c:	fe010113          	addi	sp,sp,-32
    80006930:	00813823          	sd	s0,16(sp)
    80006934:	00113c23          	sd	ra,24(sp)
    80006938:	00913423          	sd	s1,8(sp)
    8000693c:	02010413          	addi	s0,sp,32
    80006940:	100024f3          	csrr	s1,sstatus
    80006944:	100027f3          	csrr	a5,sstatus
    80006948:	ffd7f793          	andi	a5,a5,-3
    8000694c:	10079073          	csrw	sstatus,a5
    80006950:	ffffe097          	auipc	ra,0xffffe
    80006954:	70c080e7          	jalr	1804(ra) # 8000505c <mycpu>
    80006958:	07852783          	lw	a5,120(a0)
    8000695c:	02078663          	beqz	a5,80006988 <push_off+0x5c>
    80006960:	ffffe097          	auipc	ra,0xffffe
    80006964:	6fc080e7          	jalr	1788(ra) # 8000505c <mycpu>
    80006968:	07852783          	lw	a5,120(a0)
    8000696c:	01813083          	ld	ra,24(sp)
    80006970:	01013403          	ld	s0,16(sp)
    80006974:	0017879b          	addiw	a5,a5,1
    80006978:	06f52c23          	sw	a5,120(a0)
    8000697c:	00813483          	ld	s1,8(sp)
    80006980:	02010113          	addi	sp,sp,32
    80006984:	00008067          	ret
    80006988:	0014d493          	srli	s1,s1,0x1
    8000698c:	ffffe097          	auipc	ra,0xffffe
    80006990:	6d0080e7          	jalr	1744(ra) # 8000505c <mycpu>
    80006994:	0014f493          	andi	s1,s1,1
    80006998:	06952e23          	sw	s1,124(a0)
    8000699c:	fc5ff06f          	j	80006960 <push_off+0x34>

00000000800069a0 <pop_off>:
    800069a0:	ff010113          	addi	sp,sp,-16
    800069a4:	00813023          	sd	s0,0(sp)
    800069a8:	00113423          	sd	ra,8(sp)
    800069ac:	01010413          	addi	s0,sp,16
    800069b0:	ffffe097          	auipc	ra,0xffffe
    800069b4:	6ac080e7          	jalr	1708(ra) # 8000505c <mycpu>
    800069b8:	100027f3          	csrr	a5,sstatus
    800069bc:	0027f793          	andi	a5,a5,2
    800069c0:	04079663          	bnez	a5,80006a0c <pop_off+0x6c>
    800069c4:	07852783          	lw	a5,120(a0)
    800069c8:	02f05a63          	blez	a5,800069fc <pop_off+0x5c>
    800069cc:	fff7871b          	addiw	a4,a5,-1
    800069d0:	06e52c23          	sw	a4,120(a0)
    800069d4:	00071c63          	bnez	a4,800069ec <pop_off+0x4c>
    800069d8:	07c52783          	lw	a5,124(a0)
    800069dc:	00078863          	beqz	a5,800069ec <pop_off+0x4c>
    800069e0:	100027f3          	csrr	a5,sstatus
    800069e4:	0027e793          	ori	a5,a5,2
    800069e8:	10079073          	csrw	sstatus,a5
    800069ec:	00813083          	ld	ra,8(sp)
    800069f0:	00013403          	ld	s0,0(sp)
    800069f4:	01010113          	addi	sp,sp,16
    800069f8:	00008067          	ret
    800069fc:	00001517          	auipc	a0,0x1
    80006a00:	85450513          	addi	a0,a0,-1964 # 80007250 <digits+0x48>
    80006a04:	fffff097          	auipc	ra,0xfffff
    80006a08:	018080e7          	jalr	24(ra) # 80005a1c <panic>
    80006a0c:	00001517          	auipc	a0,0x1
    80006a10:	82c50513          	addi	a0,a0,-2004 # 80007238 <digits+0x30>
    80006a14:	fffff097          	auipc	ra,0xfffff
    80006a18:	008080e7          	jalr	8(ra) # 80005a1c <panic>

0000000080006a1c <push_on>:
    80006a1c:	fe010113          	addi	sp,sp,-32
    80006a20:	00813823          	sd	s0,16(sp)
    80006a24:	00113c23          	sd	ra,24(sp)
    80006a28:	00913423          	sd	s1,8(sp)
    80006a2c:	02010413          	addi	s0,sp,32
    80006a30:	100024f3          	csrr	s1,sstatus
    80006a34:	100027f3          	csrr	a5,sstatus
    80006a38:	0027e793          	ori	a5,a5,2
    80006a3c:	10079073          	csrw	sstatus,a5
    80006a40:	ffffe097          	auipc	ra,0xffffe
    80006a44:	61c080e7          	jalr	1564(ra) # 8000505c <mycpu>
    80006a48:	07852783          	lw	a5,120(a0)
    80006a4c:	02078663          	beqz	a5,80006a78 <push_on+0x5c>
    80006a50:	ffffe097          	auipc	ra,0xffffe
    80006a54:	60c080e7          	jalr	1548(ra) # 8000505c <mycpu>
    80006a58:	07852783          	lw	a5,120(a0)
    80006a5c:	01813083          	ld	ra,24(sp)
    80006a60:	01013403          	ld	s0,16(sp)
    80006a64:	0017879b          	addiw	a5,a5,1
    80006a68:	06f52c23          	sw	a5,120(a0)
    80006a6c:	00813483          	ld	s1,8(sp)
    80006a70:	02010113          	addi	sp,sp,32
    80006a74:	00008067          	ret
    80006a78:	0014d493          	srli	s1,s1,0x1
    80006a7c:	ffffe097          	auipc	ra,0xffffe
    80006a80:	5e0080e7          	jalr	1504(ra) # 8000505c <mycpu>
    80006a84:	0014f493          	andi	s1,s1,1
    80006a88:	06952e23          	sw	s1,124(a0)
    80006a8c:	fc5ff06f          	j	80006a50 <push_on+0x34>

0000000080006a90 <pop_on>:
    80006a90:	ff010113          	addi	sp,sp,-16
    80006a94:	00813023          	sd	s0,0(sp)
    80006a98:	00113423          	sd	ra,8(sp)
    80006a9c:	01010413          	addi	s0,sp,16
    80006aa0:	ffffe097          	auipc	ra,0xffffe
    80006aa4:	5bc080e7          	jalr	1468(ra) # 8000505c <mycpu>
    80006aa8:	100027f3          	csrr	a5,sstatus
    80006aac:	0027f793          	andi	a5,a5,2
    80006ab0:	04078463          	beqz	a5,80006af8 <pop_on+0x68>
    80006ab4:	07852783          	lw	a5,120(a0)
    80006ab8:	02f05863          	blez	a5,80006ae8 <pop_on+0x58>
    80006abc:	fff7879b          	addiw	a5,a5,-1
    80006ac0:	06f52c23          	sw	a5,120(a0)
    80006ac4:	07853783          	ld	a5,120(a0)
    80006ac8:	00079863          	bnez	a5,80006ad8 <pop_on+0x48>
    80006acc:	100027f3          	csrr	a5,sstatus
    80006ad0:	ffd7f793          	andi	a5,a5,-3
    80006ad4:	10079073          	csrw	sstatus,a5
    80006ad8:	00813083          	ld	ra,8(sp)
    80006adc:	00013403          	ld	s0,0(sp)
    80006ae0:	01010113          	addi	sp,sp,16
    80006ae4:	00008067          	ret
    80006ae8:	00000517          	auipc	a0,0x0
    80006aec:	79050513          	addi	a0,a0,1936 # 80007278 <digits+0x70>
    80006af0:	fffff097          	auipc	ra,0xfffff
    80006af4:	f2c080e7          	jalr	-212(ra) # 80005a1c <panic>
    80006af8:	00000517          	auipc	a0,0x0
    80006afc:	76050513          	addi	a0,a0,1888 # 80007258 <digits+0x50>
    80006b00:	fffff097          	auipc	ra,0xfffff
    80006b04:	f1c080e7          	jalr	-228(ra) # 80005a1c <panic>

0000000080006b08 <__memset>:
    80006b08:	ff010113          	addi	sp,sp,-16
    80006b0c:	00813423          	sd	s0,8(sp)
    80006b10:	01010413          	addi	s0,sp,16
    80006b14:	1a060e63          	beqz	a2,80006cd0 <__memset+0x1c8>
    80006b18:	40a007b3          	neg	a5,a0
    80006b1c:	0077f793          	andi	a5,a5,7
    80006b20:	00778693          	addi	a3,a5,7
    80006b24:	00b00813          	li	a6,11
    80006b28:	0ff5f593          	andi	a1,a1,255
    80006b2c:	fff6071b          	addiw	a4,a2,-1
    80006b30:	1b06e663          	bltu	a3,a6,80006cdc <__memset+0x1d4>
    80006b34:	1cd76463          	bltu	a4,a3,80006cfc <__memset+0x1f4>
    80006b38:	1a078e63          	beqz	a5,80006cf4 <__memset+0x1ec>
    80006b3c:	00b50023          	sb	a1,0(a0)
    80006b40:	00100713          	li	a4,1
    80006b44:	1ae78463          	beq	a5,a4,80006cec <__memset+0x1e4>
    80006b48:	00b500a3          	sb	a1,1(a0)
    80006b4c:	00200713          	li	a4,2
    80006b50:	1ae78a63          	beq	a5,a4,80006d04 <__memset+0x1fc>
    80006b54:	00b50123          	sb	a1,2(a0)
    80006b58:	00300713          	li	a4,3
    80006b5c:	18e78463          	beq	a5,a4,80006ce4 <__memset+0x1dc>
    80006b60:	00b501a3          	sb	a1,3(a0)
    80006b64:	00400713          	li	a4,4
    80006b68:	1ae78263          	beq	a5,a4,80006d0c <__memset+0x204>
    80006b6c:	00b50223          	sb	a1,4(a0)
    80006b70:	00500713          	li	a4,5
    80006b74:	1ae78063          	beq	a5,a4,80006d14 <__memset+0x20c>
    80006b78:	00b502a3          	sb	a1,5(a0)
    80006b7c:	00700713          	li	a4,7
    80006b80:	18e79e63          	bne	a5,a4,80006d1c <__memset+0x214>
    80006b84:	00b50323          	sb	a1,6(a0)
    80006b88:	00700e93          	li	t4,7
    80006b8c:	00859713          	slli	a4,a1,0x8
    80006b90:	00e5e733          	or	a4,a1,a4
    80006b94:	01059e13          	slli	t3,a1,0x10
    80006b98:	01c76e33          	or	t3,a4,t3
    80006b9c:	01859313          	slli	t1,a1,0x18
    80006ba0:	006e6333          	or	t1,t3,t1
    80006ba4:	02059893          	slli	a7,a1,0x20
    80006ba8:	40f60e3b          	subw	t3,a2,a5
    80006bac:	011368b3          	or	a7,t1,a7
    80006bb0:	02859813          	slli	a6,a1,0x28
    80006bb4:	0108e833          	or	a6,a7,a6
    80006bb8:	03059693          	slli	a3,a1,0x30
    80006bbc:	003e589b          	srliw	a7,t3,0x3
    80006bc0:	00d866b3          	or	a3,a6,a3
    80006bc4:	03859713          	slli	a4,a1,0x38
    80006bc8:	00389813          	slli	a6,a7,0x3
    80006bcc:	00f507b3          	add	a5,a0,a5
    80006bd0:	00e6e733          	or	a4,a3,a4
    80006bd4:	000e089b          	sext.w	a7,t3
    80006bd8:	00f806b3          	add	a3,a6,a5
    80006bdc:	00e7b023          	sd	a4,0(a5)
    80006be0:	00878793          	addi	a5,a5,8
    80006be4:	fed79ce3          	bne	a5,a3,80006bdc <__memset+0xd4>
    80006be8:	ff8e7793          	andi	a5,t3,-8
    80006bec:	0007871b          	sext.w	a4,a5
    80006bf0:	01d787bb          	addw	a5,a5,t4
    80006bf4:	0ce88e63          	beq	a7,a4,80006cd0 <__memset+0x1c8>
    80006bf8:	00f50733          	add	a4,a0,a5
    80006bfc:	00b70023          	sb	a1,0(a4)
    80006c00:	0017871b          	addiw	a4,a5,1
    80006c04:	0cc77663          	bgeu	a4,a2,80006cd0 <__memset+0x1c8>
    80006c08:	00e50733          	add	a4,a0,a4
    80006c0c:	00b70023          	sb	a1,0(a4)
    80006c10:	0027871b          	addiw	a4,a5,2
    80006c14:	0ac77e63          	bgeu	a4,a2,80006cd0 <__memset+0x1c8>
    80006c18:	00e50733          	add	a4,a0,a4
    80006c1c:	00b70023          	sb	a1,0(a4)
    80006c20:	0037871b          	addiw	a4,a5,3
    80006c24:	0ac77663          	bgeu	a4,a2,80006cd0 <__memset+0x1c8>
    80006c28:	00e50733          	add	a4,a0,a4
    80006c2c:	00b70023          	sb	a1,0(a4)
    80006c30:	0047871b          	addiw	a4,a5,4
    80006c34:	08c77e63          	bgeu	a4,a2,80006cd0 <__memset+0x1c8>
    80006c38:	00e50733          	add	a4,a0,a4
    80006c3c:	00b70023          	sb	a1,0(a4)
    80006c40:	0057871b          	addiw	a4,a5,5
    80006c44:	08c77663          	bgeu	a4,a2,80006cd0 <__memset+0x1c8>
    80006c48:	00e50733          	add	a4,a0,a4
    80006c4c:	00b70023          	sb	a1,0(a4)
    80006c50:	0067871b          	addiw	a4,a5,6
    80006c54:	06c77e63          	bgeu	a4,a2,80006cd0 <__memset+0x1c8>
    80006c58:	00e50733          	add	a4,a0,a4
    80006c5c:	00b70023          	sb	a1,0(a4)
    80006c60:	0077871b          	addiw	a4,a5,7
    80006c64:	06c77663          	bgeu	a4,a2,80006cd0 <__memset+0x1c8>
    80006c68:	00e50733          	add	a4,a0,a4
    80006c6c:	00b70023          	sb	a1,0(a4)
    80006c70:	0087871b          	addiw	a4,a5,8
    80006c74:	04c77e63          	bgeu	a4,a2,80006cd0 <__memset+0x1c8>
    80006c78:	00e50733          	add	a4,a0,a4
    80006c7c:	00b70023          	sb	a1,0(a4)
    80006c80:	0097871b          	addiw	a4,a5,9
    80006c84:	04c77663          	bgeu	a4,a2,80006cd0 <__memset+0x1c8>
    80006c88:	00e50733          	add	a4,a0,a4
    80006c8c:	00b70023          	sb	a1,0(a4)
    80006c90:	00a7871b          	addiw	a4,a5,10
    80006c94:	02c77e63          	bgeu	a4,a2,80006cd0 <__memset+0x1c8>
    80006c98:	00e50733          	add	a4,a0,a4
    80006c9c:	00b70023          	sb	a1,0(a4)
    80006ca0:	00b7871b          	addiw	a4,a5,11
    80006ca4:	02c77663          	bgeu	a4,a2,80006cd0 <__memset+0x1c8>
    80006ca8:	00e50733          	add	a4,a0,a4
    80006cac:	00b70023          	sb	a1,0(a4)
    80006cb0:	00c7871b          	addiw	a4,a5,12
    80006cb4:	00c77e63          	bgeu	a4,a2,80006cd0 <__memset+0x1c8>
    80006cb8:	00e50733          	add	a4,a0,a4
    80006cbc:	00b70023          	sb	a1,0(a4)
    80006cc0:	00d7879b          	addiw	a5,a5,13
    80006cc4:	00c7f663          	bgeu	a5,a2,80006cd0 <__memset+0x1c8>
    80006cc8:	00f507b3          	add	a5,a0,a5
    80006ccc:	00b78023          	sb	a1,0(a5)
    80006cd0:	00813403          	ld	s0,8(sp)
    80006cd4:	01010113          	addi	sp,sp,16
    80006cd8:	00008067          	ret
    80006cdc:	00b00693          	li	a3,11
    80006ce0:	e55ff06f          	j	80006b34 <__memset+0x2c>
    80006ce4:	00300e93          	li	t4,3
    80006ce8:	ea5ff06f          	j	80006b8c <__memset+0x84>
    80006cec:	00100e93          	li	t4,1
    80006cf0:	e9dff06f          	j	80006b8c <__memset+0x84>
    80006cf4:	00000e93          	li	t4,0
    80006cf8:	e95ff06f          	j	80006b8c <__memset+0x84>
    80006cfc:	00000793          	li	a5,0
    80006d00:	ef9ff06f          	j	80006bf8 <__memset+0xf0>
    80006d04:	00200e93          	li	t4,2
    80006d08:	e85ff06f          	j	80006b8c <__memset+0x84>
    80006d0c:	00400e93          	li	t4,4
    80006d10:	e7dff06f          	j	80006b8c <__memset+0x84>
    80006d14:	00500e93          	li	t4,5
    80006d18:	e75ff06f          	j	80006b8c <__memset+0x84>
    80006d1c:	00600e93          	li	t4,6
    80006d20:	e6dff06f          	j	80006b8c <__memset+0x84>

0000000080006d24 <__memmove>:
    80006d24:	ff010113          	addi	sp,sp,-16
    80006d28:	00813423          	sd	s0,8(sp)
    80006d2c:	01010413          	addi	s0,sp,16
    80006d30:	0e060863          	beqz	a2,80006e20 <__memmove+0xfc>
    80006d34:	fff6069b          	addiw	a3,a2,-1
    80006d38:	0006881b          	sext.w	a6,a3
    80006d3c:	0ea5e863          	bltu	a1,a0,80006e2c <__memmove+0x108>
    80006d40:	00758713          	addi	a4,a1,7
    80006d44:	00a5e7b3          	or	a5,a1,a0
    80006d48:	40a70733          	sub	a4,a4,a0
    80006d4c:	0077f793          	andi	a5,a5,7
    80006d50:	00f73713          	sltiu	a4,a4,15
    80006d54:	00174713          	xori	a4,a4,1
    80006d58:	0017b793          	seqz	a5,a5
    80006d5c:	00e7f7b3          	and	a5,a5,a4
    80006d60:	10078863          	beqz	a5,80006e70 <__memmove+0x14c>
    80006d64:	00900793          	li	a5,9
    80006d68:	1107f463          	bgeu	a5,a6,80006e70 <__memmove+0x14c>
    80006d6c:	0036581b          	srliw	a6,a2,0x3
    80006d70:	fff8081b          	addiw	a6,a6,-1
    80006d74:	02081813          	slli	a6,a6,0x20
    80006d78:	01d85893          	srli	a7,a6,0x1d
    80006d7c:	00858813          	addi	a6,a1,8
    80006d80:	00058793          	mv	a5,a1
    80006d84:	00050713          	mv	a4,a0
    80006d88:	01088833          	add	a6,a7,a6
    80006d8c:	0007b883          	ld	a7,0(a5)
    80006d90:	00878793          	addi	a5,a5,8
    80006d94:	00870713          	addi	a4,a4,8
    80006d98:	ff173c23          	sd	a7,-8(a4)
    80006d9c:	ff0798e3          	bne	a5,a6,80006d8c <__memmove+0x68>
    80006da0:	ff867713          	andi	a4,a2,-8
    80006da4:	02071793          	slli	a5,a4,0x20
    80006da8:	0207d793          	srli	a5,a5,0x20
    80006dac:	00f585b3          	add	a1,a1,a5
    80006db0:	40e686bb          	subw	a3,a3,a4
    80006db4:	00f507b3          	add	a5,a0,a5
    80006db8:	06e60463          	beq	a2,a4,80006e20 <__memmove+0xfc>
    80006dbc:	0005c703          	lbu	a4,0(a1)
    80006dc0:	00e78023          	sb	a4,0(a5)
    80006dc4:	04068e63          	beqz	a3,80006e20 <__memmove+0xfc>
    80006dc8:	0015c603          	lbu	a2,1(a1)
    80006dcc:	00100713          	li	a4,1
    80006dd0:	00c780a3          	sb	a2,1(a5)
    80006dd4:	04e68663          	beq	a3,a4,80006e20 <__memmove+0xfc>
    80006dd8:	0025c603          	lbu	a2,2(a1)
    80006ddc:	00200713          	li	a4,2
    80006de0:	00c78123          	sb	a2,2(a5)
    80006de4:	02e68e63          	beq	a3,a4,80006e20 <__memmove+0xfc>
    80006de8:	0035c603          	lbu	a2,3(a1)
    80006dec:	00300713          	li	a4,3
    80006df0:	00c781a3          	sb	a2,3(a5)
    80006df4:	02e68663          	beq	a3,a4,80006e20 <__memmove+0xfc>
    80006df8:	0045c603          	lbu	a2,4(a1)
    80006dfc:	00400713          	li	a4,4
    80006e00:	00c78223          	sb	a2,4(a5)
    80006e04:	00e68e63          	beq	a3,a4,80006e20 <__memmove+0xfc>
    80006e08:	0055c603          	lbu	a2,5(a1)
    80006e0c:	00500713          	li	a4,5
    80006e10:	00c782a3          	sb	a2,5(a5)
    80006e14:	00e68663          	beq	a3,a4,80006e20 <__memmove+0xfc>
    80006e18:	0065c703          	lbu	a4,6(a1)
    80006e1c:	00e78323          	sb	a4,6(a5)
    80006e20:	00813403          	ld	s0,8(sp)
    80006e24:	01010113          	addi	sp,sp,16
    80006e28:	00008067          	ret
    80006e2c:	02061713          	slli	a4,a2,0x20
    80006e30:	02075713          	srli	a4,a4,0x20
    80006e34:	00e587b3          	add	a5,a1,a4
    80006e38:	f0f574e3          	bgeu	a0,a5,80006d40 <__memmove+0x1c>
    80006e3c:	02069613          	slli	a2,a3,0x20
    80006e40:	02065613          	srli	a2,a2,0x20
    80006e44:	fff64613          	not	a2,a2
    80006e48:	00e50733          	add	a4,a0,a4
    80006e4c:	00c78633          	add	a2,a5,a2
    80006e50:	fff7c683          	lbu	a3,-1(a5)
    80006e54:	fff78793          	addi	a5,a5,-1
    80006e58:	fff70713          	addi	a4,a4,-1
    80006e5c:	00d70023          	sb	a3,0(a4)
    80006e60:	fec798e3          	bne	a5,a2,80006e50 <__memmove+0x12c>
    80006e64:	00813403          	ld	s0,8(sp)
    80006e68:	01010113          	addi	sp,sp,16
    80006e6c:	00008067          	ret
    80006e70:	02069713          	slli	a4,a3,0x20
    80006e74:	02075713          	srli	a4,a4,0x20
    80006e78:	00170713          	addi	a4,a4,1
    80006e7c:	00e50733          	add	a4,a0,a4
    80006e80:	00050793          	mv	a5,a0
    80006e84:	0005c683          	lbu	a3,0(a1)
    80006e88:	00178793          	addi	a5,a5,1
    80006e8c:	00158593          	addi	a1,a1,1
    80006e90:	fed78fa3          	sb	a3,-1(a5)
    80006e94:	fee798e3          	bne	a5,a4,80006e84 <__memmove+0x160>
    80006e98:	f89ff06f          	j	80006e20 <__memmove+0xfc>
	...
