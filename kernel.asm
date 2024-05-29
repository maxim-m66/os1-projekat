
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	2d013103          	ld	sp,720(sp) # 8000a2d0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	769040ef          	jal	ra,80004f84 <start>

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

    call _ZN5Riscv20handleSupervisorTrapEmmmmm
    800010a4:	595020ef          	jal	ra,80003e38 <_ZN5Riscv20handleSupervisorTrapEmmmmm>

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
    800011ac:	575020ef          	jal	ra,80003f20 <_ZN5Riscv15handleTimerTrapEv>

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
    80001238:	735020ef          	jal	ra,8000416c <_ZN5Riscv14handleReadTrapEv>
    sret
    8000123c:	10200073          	sret

0000000080001240 <writeHandler>:

writeHandler:
    call _ZN5Riscv15handleWriteTrapEv
    80001240:	761020ef          	jal	ra,800041a0 <_ZN5Riscv15handleWriteTrapEv>
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
    800012cc:	5c1020ef          	jal	ra,8000408c <_ZN5Riscv17handleConsoleTrapEv>

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


uint64 syscall(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    80001474:	fe010113          	addi	sp,sp,-32
    80001478:	00813c23          	sd	s0,24(sp)
    8000147c:	02010413          	addi	s0,sp,32
    uint64 volatile ret;
    __asm__ volatile("ecall");
    80001480:	00000073          	ecall
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    80001484:	00050793          	mv	a5,a0
    80001488:	fef43423          	sd	a5,-24(s0)
    return ret;
    8000148c:	fe843503          	ld	a0,-24(s0)
}
    80001490:	01813403          	ld	s0,24(sp)
    80001494:	02010113          	addi	sp,sp,32
    80001498:	00008067          	ret

000000008000149c <_Z9mem_allocm>:

void *mem_alloc(size_t size) {
    if (size == 0) return nullptr;
    8000149c:	04050063          	beqz	a0,800014dc <_Z9mem_allocm+0x40>
void *mem_alloc(size_t size) {
    800014a0:	ff010113          	addi	sp,sp,-16
    800014a4:	00113423          	sd	ra,8(sp)
    800014a8:	00813023          	sd	s0,0(sp)
    800014ac:	01010413          	addi	s0,sp,16
    800014b0:	00050593          	mv	a1,a0
    return (void *) syscall(MEM_ALLOC, size);
    800014b4:	00000713          	li	a4,0
    800014b8:	00000693          	li	a3,0
    800014bc:	00000613          	li	a2,0
    800014c0:	00000513          	li	a0,0
    800014c4:	00000097          	auipc	ra,0x0
    800014c8:	fb0080e7          	jalr	-80(ra) # 80001474 <_Z7syscallmmmmm>
}
    800014cc:	00813083          	ld	ra,8(sp)
    800014d0:	00013403          	ld	s0,0(sp)
    800014d4:	01010113          	addi	sp,sp,16
    800014d8:	00008067          	ret
    if (size == 0) return nullptr;
    800014dc:	00000513          	li	a0,0
}
    800014e0:	00008067          	ret

00000000800014e4 <_Z8mem_freePv>:

int mem_free(void *mem) {
    800014e4:	ff010113          	addi	sp,sp,-16
    800014e8:	00113423          	sd	ra,8(sp)
    800014ec:	00813023          	sd	s0,0(sp)
    800014f0:	01010413          	addi	s0,sp,16
    800014f4:	00050593          	mv	a1,a0
    return (int) syscall(MEM_FREE, (uint64) mem);
    800014f8:	00000713          	li	a4,0
    800014fc:	00000693          	li	a3,0
    80001500:	00000613          	li	a2,0
    80001504:	00100513          	li	a0,1
    80001508:	00000097          	auipc	ra,0x0
    8000150c:	f6c080e7          	jalr	-148(ra) # 80001474 <_Z7syscallmmmmm>
}
    80001510:	0005051b          	sext.w	a0,a0
    80001514:	00813083          	ld	ra,8(sp)
    80001518:	00013403          	ld	s0,0(sp)
    8000151c:	01010113          	addi	sp,sp,16
    80001520:	00008067          	ret

0000000080001524 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    80001524:	fd010113          	addi	sp,sp,-48
    80001528:	02113423          	sd	ra,40(sp)
    8000152c:	02813023          	sd	s0,32(sp)
    80001530:	00913c23          	sd	s1,24(sp)
    80001534:	01213823          	sd	s2,16(sp)
    80001538:	01313423          	sd	s3,8(sp)
    8000153c:	03010413          	addi	s0,sp,48
    80001540:	00050913          	mv	s2,a0
    80001544:	00058493          	mv	s1,a1
    80001548:	00060993          	mv	s3,a2
    void *stack_space = nullptr;
    if (start_routine) {
    8000154c:	04058663          	beqz	a1,80001598 <_Z13thread_createPP3TCBPFvPvES2_+0x74>
        stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    80001550:	00004537          	lui	a0,0x4
    80001554:	00000097          	auipc	ra,0x0
    80001558:	f48080e7          	jalr	-184(ra) # 8000149c <_Z9mem_allocm>
    8000155c:	00050713          	mv	a4,a0
    }
    return (int) syscall(THREAD_CREATE, (uint64) handle, (uint64) start_routine, (uint64) arg, (uint64) stack_space);
    80001560:	00098693          	mv	a3,s3
    80001564:	00048613          	mv	a2,s1
    80001568:	00090593          	mv	a1,s2
    8000156c:	00200513          	li	a0,2
    80001570:	00000097          	auipc	ra,0x0
    80001574:	f04080e7          	jalr	-252(ra) # 80001474 <_Z7syscallmmmmm>
}
    80001578:	0005051b          	sext.w	a0,a0
    8000157c:	02813083          	ld	ra,40(sp)
    80001580:	02013403          	ld	s0,32(sp)
    80001584:	01813483          	ld	s1,24(sp)
    80001588:	01013903          	ld	s2,16(sp)
    8000158c:	00813983          	ld	s3,8(sp)
    80001590:	03010113          	addi	sp,sp,48
    80001594:	00008067          	ret
    void *stack_space = nullptr;
    80001598:	00000713          	li	a4,0
    8000159c:	fc5ff06f          	j	80001560 <_Z13thread_createPP3TCBPFvPvES2_+0x3c>

00000000800015a0 <_Z11thread_exitv>:

int thread_exit() {
    800015a0:	ff010113          	addi	sp,sp,-16
    800015a4:	00113423          	sd	ra,8(sp)
    800015a8:	00813023          	sd	s0,0(sp)
    800015ac:	01010413          	addi	s0,sp,16
    return (int) syscall(THREAD_EXIT);
    800015b0:	00000713          	li	a4,0
    800015b4:	00000693          	li	a3,0
    800015b8:	00000613          	li	a2,0
    800015bc:	00000593          	li	a1,0
    800015c0:	00300513          	li	a0,3
    800015c4:	00000097          	auipc	ra,0x0
    800015c8:	eb0080e7          	jalr	-336(ra) # 80001474 <_Z7syscallmmmmm>
}
    800015cc:	0005051b          	sext.w	a0,a0
    800015d0:	00813083          	ld	ra,8(sp)
    800015d4:	00013403          	ld	s0,0(sp)
    800015d8:	01010113          	addi	sp,sp,16
    800015dc:	00008067          	ret

00000000800015e0 <_Z15thread_dispatchv>:

void thread_dispatch() {
    800015e0:	ff010113          	addi	sp,sp,-16
    800015e4:	00113423          	sd	ra,8(sp)
    800015e8:	00813023          	sd	s0,0(sp)
    800015ec:	01010413          	addi	s0,sp,16
    (void) syscall(THREAD_DISPATCH);
    800015f0:	00000713          	li	a4,0
    800015f4:	00000693          	li	a3,0
    800015f8:	00000613          	li	a2,0
    800015fc:	00000593          	li	a1,0
    80001600:	00400513          	li	a0,4
    80001604:	00000097          	auipc	ra,0x0
    80001608:	e70080e7          	jalr	-400(ra) # 80001474 <_Z7syscallmmmmm>
}
    8000160c:	00813083          	ld	ra,8(sp)
    80001610:	00013403          	ld	s0,0(sp)
    80001614:	01010113          	addi	sp,sp,16
    80001618:	00008067          	ret

000000008000161c <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    8000161c:	ff010113          	addi	sp,sp,-16
    80001620:	00113423          	sd	ra,8(sp)
    80001624:	00813023          	sd	s0,0(sp)
    80001628:	01010413          	addi	s0,sp,16
    8000162c:	00050593          	mv	a1,a0
    (void) syscall(THREAD_JOIN, (uint64) handle);
    80001630:	00000713          	li	a4,0
    80001634:	00000693          	li	a3,0
    80001638:	00000613          	li	a2,0
    8000163c:	00500513          	li	a0,5
    80001640:	00000097          	auipc	ra,0x0
    80001644:	e34080e7          	jalr	-460(ra) # 80001474 <_Z7syscallmmmmm>
}
    80001648:	00813083          	ld	ra,8(sp)
    8000164c:	00013403          	ld	s0,0(sp)
    80001650:	01010113          	addi	sp,sp,16
    80001654:	00008067          	ret

0000000080001658 <_Z11thread_joinP3TCBm>:

void thread_join(thread_t handle, time_t time) {
    80001658:	fe010113          	addi	sp,sp,-32
    8000165c:	00113c23          	sd	ra,24(sp)
    80001660:	00813823          	sd	s0,16(sp)
    80001664:	00913423          	sd	s1,8(sp)
    80001668:	01213023          	sd	s2,0(sp)
    8000166c:	02010413          	addi	s0,sp,32
    80001670:	00050913          	mv	s2,a0
    80001674:	00058493          	mv	s1,a1
    if (time == 0) thread_join(handle);
    80001678:	02058c63          	beqz	a1,800016b0 <_Z11thread_joinP3TCBm+0x58>
    (void) syscall(THREAD_JOIN_TIME, (uint64) handle, time);
    8000167c:	00000713          	li	a4,0
    80001680:	00000693          	li	a3,0
    80001684:	00048613          	mv	a2,s1
    80001688:	00090593          	mv	a1,s2
    8000168c:	00600513          	li	a0,6
    80001690:	00000097          	auipc	ra,0x0
    80001694:	de4080e7          	jalr	-540(ra) # 80001474 <_Z7syscallmmmmm>
}
    80001698:	01813083          	ld	ra,24(sp)
    8000169c:	01013403          	ld	s0,16(sp)
    800016a0:	00813483          	ld	s1,8(sp)
    800016a4:	00013903          	ld	s2,0(sp)
    800016a8:	02010113          	addi	sp,sp,32
    800016ac:	00008067          	ret
    if (time == 0) thread_join(handle);
    800016b0:	00000097          	auipc	ra,0x0
    800016b4:	f6c080e7          	jalr	-148(ra) # 8000161c <_Z11thread_joinP3TCB>
    800016b8:	fc5ff06f          	j	8000167c <_Z11thread_joinP3TCBm+0x24>

00000000800016bc <_Z4forkv>:

int fork() {
    800016bc:	ff010113          	addi	sp,sp,-16
    800016c0:	00113423          	sd	ra,8(sp)
    800016c4:	00813023          	sd	s0,0(sp)
    800016c8:	01010413          	addi	s0,sp,16
    return (int) syscall(THREAD_FORK);
    800016cc:	00000713          	li	a4,0
    800016d0:	00000693          	li	a3,0
    800016d4:	00000613          	li	a2,0
    800016d8:	00000593          	li	a1,0
    800016dc:	00700513          	li	a0,7
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	d94080e7          	jalr	-620(ra) # 80001474 <_Z7syscallmmmmm>
}
    800016e8:	0005051b          	sext.w	a0,a0
    800016ec:	00813083          	ld	ra,8(sp)
    800016f0:	00013403          	ld	s0,0(sp)
    800016f4:	01010113          	addi	sp,sp,16
    800016f8:	00008067          	ret

00000000800016fc <_Z11thread_killP3TCB>:

int thread_kill(thread_t handle) {
    800016fc:	ff010113          	addi	sp,sp,-16
    80001700:	00113423          	sd	ra,8(sp)
    80001704:	00813023          	sd	s0,0(sp)
    80001708:	01010413          	addi	s0,sp,16
    8000170c:	00050593          	mv	a1,a0
    return (int) syscall(THREAD_KILL, (uint64) handle);
    80001710:	00000713          	li	a4,0
    80001714:	00000693          	li	a3,0
    80001718:	00000613          	li	a2,0
    8000171c:	00800513          	li	a0,8
    80001720:	00000097          	auipc	ra,0x0
    80001724:	d54080e7          	jalr	-684(ra) # 80001474 <_Z7syscallmmmmm>
}
    80001728:	0005051b          	sext.w	a0,a0
    8000172c:	00813083          	ld	ra,8(sp)
    80001730:	00013403          	ld	s0,0(sp)
    80001734:	01010113          	addi	sp,sp,16
    80001738:	00008067          	ret

000000008000173c <_Z8sem_openPP3Semj>:

int sem_open(sem_t *handle, unsigned init) {
    8000173c:	ff010113          	addi	sp,sp,-16
    80001740:	00113423          	sd	ra,8(sp)
    80001744:	00813023          	sd	s0,0(sp)
    80001748:	01010413          	addi	s0,sp,16
    return (int) syscall(SEM_OPEN, (uint64) handle, init);
    8000174c:	00000713          	li	a4,0
    80001750:	00000693          	li	a3,0
    80001754:	02059613          	slli	a2,a1,0x20
    80001758:	02065613          	srli	a2,a2,0x20
    8000175c:	00050593          	mv	a1,a0
    80001760:	00900513          	li	a0,9
    80001764:	00000097          	auipc	ra,0x0
    80001768:	d10080e7          	jalr	-752(ra) # 80001474 <_Z7syscallmmmmm>
}
    8000176c:	0005051b          	sext.w	a0,a0
    80001770:	00813083          	ld	ra,8(sp)
    80001774:	00013403          	ld	s0,0(sp)
    80001778:	01010113          	addi	sp,sp,16
    8000177c:	00008067          	ret

0000000080001780 <_Z9sem_closeP3Sem>:

int sem_close(sem_t id) {
    80001780:	ff010113          	addi	sp,sp,-16
    80001784:	00113423          	sd	ra,8(sp)
    80001788:	00813023          	sd	s0,0(sp)
    8000178c:	01010413          	addi	s0,sp,16
    80001790:	00050593          	mv	a1,a0
    return (int) syscall(SEM_CLOSE, (uint64) id);
    80001794:	00000713          	li	a4,0
    80001798:	00000693          	li	a3,0
    8000179c:	00000613          	li	a2,0
    800017a0:	00a00513          	li	a0,10
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	cd0080e7          	jalr	-816(ra) # 80001474 <_Z7syscallmmmmm>
}
    800017ac:	0005051b          	sext.w	a0,a0
    800017b0:	00813083          	ld	ra,8(sp)
    800017b4:	00013403          	ld	s0,0(sp)
    800017b8:	01010113          	addi	sp,sp,16
    800017bc:	00008067          	ret

00000000800017c0 <_Z8sem_waitP3Sem>:

int sem_wait(sem_t id) {
    800017c0:	ff010113          	addi	sp,sp,-16
    800017c4:	00113423          	sd	ra,8(sp)
    800017c8:	00813023          	sd	s0,0(sp)
    800017cc:	01010413          	addi	s0,sp,16
    800017d0:	00050593          	mv	a1,a0
    return (int) syscall(SEM_WAIT, (uint64) id);
    800017d4:	00000713          	li	a4,0
    800017d8:	00000693          	li	a3,0
    800017dc:	00000613          	li	a2,0
    800017e0:	00b00513          	li	a0,11
    800017e4:	00000097          	auipc	ra,0x0
    800017e8:	c90080e7          	jalr	-880(ra) # 80001474 <_Z7syscallmmmmm>
}
    800017ec:	0005051b          	sext.w	a0,a0
    800017f0:	00813083          	ld	ra,8(sp)
    800017f4:	00013403          	ld	s0,0(sp)
    800017f8:	01010113          	addi	sp,sp,16
    800017fc:	00008067          	ret

0000000080001800 <_Z10sem_signalP3Sem>:

int sem_signal(sem_t id) {
    80001800:	ff010113          	addi	sp,sp,-16
    80001804:	00113423          	sd	ra,8(sp)
    80001808:	00813023          	sd	s0,0(sp)
    8000180c:	01010413          	addi	s0,sp,16
    80001810:	00050593          	mv	a1,a0
    return (int) syscall(SEM_SIGNAL, (uint64) id);
    80001814:	00000713          	li	a4,0
    80001818:	00000693          	li	a3,0
    8000181c:	00000613          	li	a2,0
    80001820:	00c00513          	li	a0,12
    80001824:	00000097          	auipc	ra,0x0
    80001828:	c50080e7          	jalr	-944(ra) # 80001474 <_Z7syscallmmmmm>
}
    8000182c:	0005051b          	sext.w	a0,a0
    80001830:	00813083          	ld	ra,8(sp)
    80001834:	00013403          	ld	s0,0(sp)
    80001838:	01010113          	addi	sp,sp,16
    8000183c:	00008067          	ret

0000000080001840 <_Z14sem_signal_allP3Sem>:

int sem_signal_all(sem_t id) {
    80001840:	ff010113          	addi	sp,sp,-16
    80001844:	00113423          	sd	ra,8(sp)
    80001848:	00813023          	sd	s0,0(sp)
    8000184c:	01010413          	addi	s0,sp,16
    80001850:	00050593          	mv	a1,a0
    return (int) syscall(SIGNAL_ALL, (uint64) id);
    80001854:	00000713          	li	a4,0
    80001858:	00000693          	li	a3,0
    8000185c:	00000613          	li	a2,0
    80001860:	00d00513          	li	a0,13
    80001864:	00000097          	auipc	ra,0x0
    80001868:	c10080e7          	jalr	-1008(ra) # 80001474 <_Z7syscallmmmmm>
}
    8000186c:	0005051b          	sext.w	a0,a0
    80001870:	00813083          	ld	ra,8(sp)
    80001874:	00013403          	ld	s0,0(sp)
    80001878:	01010113          	addi	sp,sp,16
    8000187c:	00008067          	ret

0000000080001880 <_Z15signal_and_waitP3SemS0_>:

int signal_and_wait(sem_t signal, sem_t wait) {
    80001880:	ff010113          	addi	sp,sp,-16
    80001884:	00113423          	sd	ra,8(sp)
    80001888:	00813023          	sd	s0,0(sp)
    8000188c:	01010413          	addi	s0,sp,16
    80001890:	00058613          	mv	a2,a1
    return (int) syscall(SIGNAL_WAIT, (uint64) signal, (uint64) wait);
    80001894:	00000713          	li	a4,0
    80001898:	00000693          	li	a3,0
    8000189c:	00050593          	mv	a1,a0
    800018a0:	00e00513          	li	a0,14
    800018a4:	00000097          	auipc	ra,0x0
    800018a8:	bd0080e7          	jalr	-1072(ra) # 80001474 <_Z7syscallmmmmm>
}
    800018ac:	0005051b          	sext.w	a0,a0
    800018b0:	00813083          	ld	ra,8(sp)
    800018b4:	00013403          	ld	s0,0(sp)
    800018b8:	01010113          	addi	sp,sp,16
    800018bc:	00008067          	ret

00000000800018c0 <_Z10time_sleepm>:

int time_sleep(time_t ms) {
    if (ms == 0) return -1;
    800018c0:	04050263          	beqz	a0,80001904 <_Z10time_sleepm+0x44>
int time_sleep(time_t ms) {
    800018c4:	ff010113          	addi	sp,sp,-16
    800018c8:	00113423          	sd	ra,8(sp)
    800018cc:	00813023          	sd	s0,0(sp)
    800018d0:	01010413          	addi	s0,sp,16
    800018d4:	00050593          	mv	a1,a0
    return (int) syscall(TIME_SLEEP, ms);
    800018d8:	00000713          	li	a4,0
    800018dc:	00000693          	li	a3,0
    800018e0:	00000613          	li	a2,0
    800018e4:	00f00513          	li	a0,15
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	b8c080e7          	jalr	-1140(ra) # 80001474 <_Z7syscallmmmmm>
    800018f0:	0005051b          	sext.w	a0,a0
}
    800018f4:	00813083          	ld	ra,8(sp)
    800018f8:	00013403          	ld	s0,0(sp)
    800018fc:	01010113          	addi	sp,sp,16
    80001900:	00008067          	ret
    if (ms == 0) return -1;
    80001904:	fff00513          	li	a0,-1
}
    80001908:	00008067          	ret

000000008000190c <_Z11thread_wakeP3TCB>:

int thread_wake(thread_t handle) {
    8000190c:	ff010113          	addi	sp,sp,-16
    80001910:	00113423          	sd	ra,8(sp)
    80001914:	00813023          	sd	s0,0(sp)
    80001918:	01010413          	addi	s0,sp,16
    8000191c:	00050593          	mv	a1,a0
    return (int) syscall(THREAD_WAKE, (uint64) handle);
    80001920:	00000713          	li	a4,0
    80001924:	00000693          	li	a3,0
    80001928:	00000613          	li	a2,0
    8000192c:	01000513          	li	a0,16
    80001930:	00000097          	auipc	ra,0x0
    80001934:	b44080e7          	jalr	-1212(ra) # 80001474 <_Z7syscallmmmmm>
}
    80001938:	0005051b          	sext.w	a0,a0
    8000193c:	00813083          	ld	ra,8(sp)
    80001940:	00013403          	ld	s0,0(sp)
    80001944:	01010113          	addi	sp,sp,16
    80001948:	00008067          	ret

000000008000194c <_Z4getcv>:

char getc() {
    8000194c:	ff010113          	addi	sp,sp,-16
    80001950:	00113423          	sd	ra,8(sp)
    80001954:	00813023          	sd	s0,0(sp)
    80001958:	01010413          	addi	s0,sp,16
    return (char) syscall(GETC);
    8000195c:	00000713          	li	a4,0
    80001960:	00000693          	li	a3,0
    80001964:	00000613          	li	a2,0
    80001968:	00000593          	li	a1,0
    8000196c:	01100513          	li	a0,17
    80001970:	00000097          	auipc	ra,0x0
    80001974:	b04080e7          	jalr	-1276(ra) # 80001474 <_Z7syscallmmmmm>
}
    80001978:	0ff57513          	andi	a0,a0,255
    8000197c:	00813083          	ld	ra,8(sp)
    80001980:	00013403          	ld	s0,0(sp)
    80001984:	01010113          	addi	sp,sp,16
    80001988:	00008067          	ret

000000008000198c <_Z4putcc>:

void putc(char c) {
    8000198c:	ff010113          	addi	sp,sp,-16
    80001990:	00113423          	sd	ra,8(sp)
    80001994:	00813023          	sd	s0,0(sp)
    80001998:	01010413          	addi	s0,sp,16
    8000199c:	00050593          	mv	a1,a0
    syscall(PUTC, c);
    800019a0:	00000713          	li	a4,0
    800019a4:	00000693          	li	a3,0
    800019a8:	00000613          	li	a2,0
    800019ac:	01200513          	li	a0,18
    800019b0:	00000097          	auipc	ra,0x0
    800019b4:	ac4080e7          	jalr	-1340(ra) # 80001474 <_Z7syscallmmmmm>
}
    800019b8:	00813083          	ld	ra,8(sp)
    800019bc:	00013403          	ld	s0,0(sp)
    800019c0:	01010113          	addi	sp,sp,16
    800019c4:	00008067          	ret

00000000800019c8 <_ZN3stm6strlenEPKc>:
#include "../h/string.hpp"
#include "../h/c_memory.hpp"
#include "../h/iostream.hpp"

int stm::strlen(const char *string) {
    800019c8:	ff010113          	addi	sp,sp,-16
    800019cc:	00813423          	sd	s0,8(sp)
    800019d0:	01010413          	addi	s0,sp,16
    800019d4:	00050713          	mv	a4,a0
    int size;
    for (size = 0; string[size]; size++);
    800019d8:	00000513          	li	a0,0
    800019dc:	00a707b3          	add	a5,a4,a0
    800019e0:	0007c783          	lbu	a5,0(a5)
    800019e4:	00078663          	beqz	a5,800019f0 <_ZN3stm6strlenEPKc+0x28>
    800019e8:	0015051b          	addiw	a0,a0,1
    800019ec:	ff1ff06f          	j	800019dc <_ZN3stm6strlenEPKc+0x14>
    return size;
}
    800019f0:	00813403          	ld	s0,8(sp)
    800019f4:	01010113          	addi	sp,sp,16
    800019f8:	00008067          	ret

00000000800019fc <_ZN3stm6strcpyEPKcPc>:

char *stm::strcpy(const char *const src, char *const dst) {
    800019fc:	fe010113          	addi	sp,sp,-32
    80001a00:	00113c23          	sd	ra,24(sp)
    80001a04:	00813823          	sd	s0,16(sp)
    80001a08:	00913423          	sd	s1,8(sp)
    80001a0c:	01213023          	sd	s2,0(sp)
    80001a10:	02010413          	addi	s0,sp,32
    80001a14:	00050913          	mv	s2,a0
    80001a18:	00058493          	mv	s1,a1
    memcpy(src, dst, strlen(src) + 1);
    80001a1c:	00000097          	auipc	ra,0x0
    80001a20:	fac080e7          	jalr	-84(ra) # 800019c8 <_ZN3stm6strlenEPKc>
    80001a24:	0015061b          	addiw	a2,a0,1
    80001a28:	00048593          	mv	a1,s1
    80001a2c:	00090513          	mv	a0,s2
    80001a30:	00002097          	auipc	ra,0x2
    80001a34:	9b0080e7          	jalr	-1616(ra) # 800033e0 <_Z6memcpyPKvS0_i>
    return dst;
}
    80001a38:	00048513          	mv	a0,s1
    80001a3c:	01813083          	ld	ra,24(sp)
    80001a40:	01013403          	ld	s0,16(sp)
    80001a44:	00813483          	ld	s1,8(sp)
    80001a48:	00013903          	ld	s2,0(sp)
    80001a4c:	02010113          	addi	sp,sp,32
    80001a50:	00008067          	ret

0000000080001a54 <_ZN3stm7strncpyEPcS0_i>:

void stm::strncpy(char *const src, char *const dst, int max_len) {
    80001a54:	fd010113          	addi	sp,sp,-48
    80001a58:	02113423          	sd	ra,40(sp)
    80001a5c:	02813023          	sd	s0,32(sp)
    80001a60:	00913c23          	sd	s1,24(sp)
    80001a64:	01213823          	sd	s2,16(sp)
    80001a68:	01313423          	sd	s3,8(sp)
    80001a6c:	01413023          	sd	s4,0(sp)
    80001a70:	03010413          	addi	s0,sp,48
    80001a74:	00050913          	mv	s2,a0
    80001a78:	00058993          	mv	s3,a1
    80001a7c:	00060a13          	mv	s4,a2
    for (int i = 0; i < strlen(src) + 1; i++) {
    80001a80:	00000493          	li	s1,0
    80001a84:	00090513          	mv	a0,s2
    80001a88:	00000097          	auipc	ra,0x0
    80001a8c:	f40080e7          	jalr	-192(ra) # 800019c8 <_ZN3stm6strlenEPKc>
    80001a90:	02954463          	blt	a0,s1,80001ab8 <_ZN3stm7strncpyEPcS0_i+0x64>
        if (i >= max_len) {
    80001a94:	0144de63          	bge	s1,s4,80001ab0 <_ZN3stm7strncpyEPcS0_i+0x5c>
            dst[i] = '\0';
            return;
        }
        dst[i] = src[i];
    80001a98:	009987b3          	add	a5,s3,s1
    80001a9c:	00990733          	add	a4,s2,s1
    80001aa0:	00074703          	lbu	a4,0(a4)
    80001aa4:	00e78023          	sb	a4,0(a5)
    for (int i = 0; i < strlen(src) + 1; i++) {
    80001aa8:	0014849b          	addiw	s1,s1,1
    80001aac:	fd9ff06f          	j	80001a84 <_ZN3stm7strncpyEPcS0_i+0x30>
            dst[i] = '\0';
    80001ab0:	009984b3          	add	s1,s3,s1
    80001ab4:	00048023          	sb	zero,0(s1)
    }
}
    80001ab8:	02813083          	ld	ra,40(sp)
    80001abc:	02013403          	ld	s0,32(sp)
    80001ac0:	01813483          	ld	s1,24(sp)
    80001ac4:	01013903          	ld	s2,16(sp)
    80001ac8:	00813983          	ld	s3,8(sp)
    80001acc:	00013a03          	ld	s4,0(sp)
    80001ad0:	03010113          	addi	sp,sp,48
    80001ad4:	00008067          	ret

0000000080001ad8 <_ZN3stm6strcatEPKcS1_>:

char *stm::strcat(const char *const base, const char *const tail) {
    80001ad8:	fd010113          	addi	sp,sp,-48
    80001adc:	02113423          	sd	ra,40(sp)
    80001ae0:	02813023          	sd	s0,32(sp)
    80001ae4:	00913c23          	sd	s1,24(sp)
    80001ae8:	01213823          	sd	s2,16(sp)
    80001aec:	01313423          	sd	s3,8(sp)
    80001af0:	01413023          	sd	s4,0(sp)
    80001af4:	03010413          	addi	s0,sp,48
    80001af8:	00050a13          	mv	s4,a0
    80001afc:	00058913          	mv	s2,a1
    int base_len = strlen(base);
    80001b00:	00000097          	auipc	ra,0x0
    80001b04:	ec8080e7          	jalr	-312(ra) # 800019c8 <_ZN3stm6strlenEPKc>
    80001b08:	00050993          	mv	s3,a0
    char *new_base = new char[base_len + strlen(tail) + 1];
    80001b0c:	00090513          	mv	a0,s2
    80001b10:	00000097          	auipc	ra,0x0
    80001b14:	eb8080e7          	jalr	-328(ra) # 800019c8 <_ZN3stm6strlenEPKc>
    80001b18:	0135053b          	addw	a0,a0,s3
    80001b1c:	0015051b          	addiw	a0,a0,1
    80001b20:	00002097          	auipc	ra,0x2
    80001b24:	e58080e7          	jalr	-424(ra) # 80003978 <_Znam>
    80001b28:	00050493          	mv	s1,a0
    strcpy(base, new_base);
    80001b2c:	00050593          	mv	a1,a0
    80001b30:	000a0513          	mv	a0,s4
    80001b34:	00000097          	auipc	ra,0x0
    80001b38:	ec8080e7          	jalr	-312(ra) # 800019fc <_ZN3stm6strcpyEPKcPc>
    strcpy(tail, &new_base[base_len]);
    80001b3c:	013485b3          	add	a1,s1,s3
    80001b40:	00090513          	mv	a0,s2
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	eb8080e7          	jalr	-328(ra) # 800019fc <_ZN3stm6strcpyEPKcPc>
    return new_base;
}
    80001b4c:	00048513          	mv	a0,s1
    80001b50:	02813083          	ld	ra,40(sp)
    80001b54:	02013403          	ld	s0,32(sp)
    80001b58:	01813483          	ld	s1,24(sp)
    80001b5c:	01013903          	ld	s2,16(sp)
    80001b60:	00813983          	ld	s3,8(sp)
    80001b64:	00013a03          	ld	s4,0(sp)
    80001b68:	03010113          	addi	sp,sp,48
    80001b6c:	00008067          	ret

0000000080001b70 <_ZN3stm6strcmpEPKcS1_>:

int stm::strcmp(const char *str1, const char *str2) { //negative means str1 < str2 (a < b) (a < aa)
    80001b70:	ff010113          	addi	sp,sp,-16
    80001b74:	00813423          	sd	s0,8(sp)
    80001b78:	01010413          	addi	s0,sp,16
    80001b7c:	00050613          	mv	a2,a0
    int i;
    for (i = 0; str1[i] && str2[i]; i++) {
    80001b80:	00000793          	li	a5,0
    80001b84:	0080006f          	j	80001b8c <_ZN3stm6strcmpEPKcS1_+0x1c>
    80001b88:	0017879b          	addiw	a5,a5,1
    80001b8c:	00078513          	mv	a0,a5
    80001b90:	00f60733          	add	a4,a2,a5
    80001b94:	00074703          	lbu	a4,0(a4)
    80001b98:	00070e63          	beqz	a4,80001bb4 <_ZN3stm6strcmpEPKcS1_+0x44>
    80001b9c:	00f586b3          	add	a3,a1,a5
    80001ba0:	0006c683          	lbu	a3,0(a3)
    80001ba4:	00068863          	beqz	a3,80001bb4 <_ZN3stm6strcmpEPKcS1_+0x44>
        int difference = str1[i] - str2[i];
    80001ba8:	40d7053b          	subw	a0,a4,a3
        if (difference) return difference;
    80001bac:	fcd70ee3          	beq	a4,a3,80001b88 <_ZN3stm6strcmpEPKcS1_+0x18>
    80001bb0:	01c0006f          	j	80001bcc <_ZN3stm6strcmpEPKcS1_+0x5c>
    }
    if (!str1[i] && !str2[i]) return 0;
    80001bb4:	00071863          	bnez	a4,80001bc4 <_ZN3stm6strcmpEPKcS1_+0x54>
    80001bb8:	00a585b3          	add	a1,a1,a0
    80001bbc:	0005c783          	lbu	a5,0(a1)
    80001bc0:	00078c63          	beqz	a5,80001bd8 <_ZN3stm6strcmpEPKcS1_+0x68>
    else if (str1[i]) return 1;
    80001bc4:	00070e63          	beqz	a4,80001be0 <_ZN3stm6strcmpEPKcS1_+0x70>
    80001bc8:	00100513          	li	a0,1
    else return -1;
}
    80001bcc:	00813403          	ld	s0,8(sp)
    80001bd0:	01010113          	addi	sp,sp,16
    80001bd4:	00008067          	ret
    if (!str1[i] && !str2[i]) return 0;
    80001bd8:	00000513          	li	a0,0
    80001bdc:	ff1ff06f          	j	80001bcc <_ZN3stm6strcmpEPKcS1_+0x5c>
    else return -1;
    80001be0:	fff00513          	li	a0,-1
    80001be4:	fe9ff06f          	j	80001bcc <_ZN3stm6strcmpEPKcS1_+0x5c>

0000000080001be8 <_ZN3stm4ntosExPci>:

char *stm::ntos(long long number, char *buffer, int radix) {
    80001be8:	f7010113          	addi	sp,sp,-144
    80001bec:	08113423          	sd	ra,136(sp)
    80001bf0:	08813023          	sd	s0,128(sp)
    80001bf4:	06913c23          	sd	s1,120(sp)
    80001bf8:	09010413          	addi	s0,sp,144
    80001bfc:	00058493          	mv	s1,a1
    if (radix < 2 || radix > 16) {
    80001c00:	ffe6071b          	addiw	a4,a2,-2
    80001c04:	00e00793          	li	a5,14
    80001c08:	06e7ec63          	bltu	a5,a4,80001c80 <_ZN3stm4ntosExPci+0x98>
        buffer[0] = 0;
        return buffer;
    }
    if (number == 0) {
    80001c0c:	06050e63          	beqz	a0,80001c88 <_ZN3stm4ntosExPci+0xa0>
        buffer[0] = '0';
        buffer[1] = 0;
        return buffer;
    }
    char digits[100] = {};
    80001c10:	f6043c23          	sd	zero,-136(s0)
    80001c14:	f8043023          	sd	zero,-128(s0)
    80001c18:	f8043423          	sd	zero,-120(s0)
    80001c1c:	f8043823          	sd	zero,-112(s0)
    80001c20:	f8043c23          	sd	zero,-104(s0)
    80001c24:	fa043023          	sd	zero,-96(s0)
    80001c28:	fa043423          	sd	zero,-88(s0)
    80001c2c:	fa043823          	sd	zero,-80(s0)
    80001c30:	fa043c23          	sd	zero,-72(s0)
    80001c34:	fc043023          	sd	zero,-64(s0)
    80001c38:	fc043423          	sd	zero,-56(s0)
    80001c3c:	fc043823          	sd	zero,-48(s0)
    80001c40:	fc042c23          	sw	zero,-40(s0)
    int i = 98;
    bool negative = number < 0;
    if (negative) number = -number;
    80001c44:	04054a63          	bltz	a0,80001c98 <_ZN3stm4ntosExPci+0xb0>
    80001c48:	00050793          	mv	a5,a0
    80001c4c:	06200693          	li	a3,98
    const char *av = "0123456789ABCDEF";
    while (number > 0) {
    80001c50:	04f05863          	blez	a5,80001ca0 <_ZN3stm4ntosExPci+0xb8>
        digits[i--] = av[(number % radix)];
    80001c54:	02c7e733          	rem	a4,a5,a2
    80001c58:	00006817          	auipc	a6,0x6
    80001c5c:	3c880813          	addi	a6,a6,968 # 80008020 <CONSOLE_STATUS+0x10>
    80001c60:	01070733          	add	a4,a4,a6
    80001c64:	00074803          	lbu	a6,0(a4)
    80001c68:	fe040713          	addi	a4,s0,-32
    80001c6c:	00d70733          	add	a4,a4,a3
    80001c70:	f9070c23          	sb	a6,-104(a4)
        number /= radix;
    80001c74:	02c7c7b3          	div	a5,a5,a2
        digits[i--] = av[(number % radix)];
    80001c78:	fff6869b          	addiw	a3,a3,-1
    while (number > 0) {
    80001c7c:	fd5ff06f          	j	80001c50 <_ZN3stm4ntosExPci+0x68>
        buffer[0] = 0;
    80001c80:	00058023          	sb	zero,0(a1)
        return buffer;
    80001c84:	0380006f          	j	80001cbc <_ZN3stm4ntosExPci+0xd4>
        buffer[0] = '0';
    80001c88:	03000793          	li	a5,48
    80001c8c:	00f58023          	sb	a5,0(a1)
        buffer[1] = 0;
    80001c90:	000580a3          	sb	zero,1(a1)
        return buffer;
    80001c94:	0280006f          	j	80001cbc <_ZN3stm4ntosExPci+0xd4>
    if (negative) number = -number;
    80001c98:	40a007b3          	neg	a5,a0
    80001c9c:	fb1ff06f          	j	80001c4c <_ZN3stm4ntosExPci+0x64>
    }
    if (negative) digits[i--] = '-';
    80001ca0:	02054a63          	bltz	a0,80001cd4 <_ZN3stm4ntosExPci+0xec>
    strcpy(&digits[++i], buffer);
    80001ca4:	0016869b          	addiw	a3,a3,1
    80001ca8:	00048593          	mv	a1,s1
    80001cac:	f7840513          	addi	a0,s0,-136
    80001cb0:	00d50533          	add	a0,a0,a3
    80001cb4:	00000097          	auipc	ra,0x0
    80001cb8:	d48080e7          	jalr	-696(ra) # 800019fc <_ZN3stm6strcpyEPKcPc>
    return buffer;
}
    80001cbc:	00048513          	mv	a0,s1
    80001cc0:	08813083          	ld	ra,136(sp)
    80001cc4:	08013403          	ld	s0,128(sp)
    80001cc8:	07813483          	ld	s1,120(sp)
    80001ccc:	09010113          	addi	sp,sp,144
    80001cd0:	00008067          	ret
    if (negative) digits[i--] = '-';
    80001cd4:	fe040793          	addi	a5,s0,-32
    80001cd8:	00d787b3          	add	a5,a5,a3
    80001cdc:	02d00713          	li	a4,45
    80001ce0:	f8e78c23          	sb	a4,-104(a5)
    80001ce4:	fff6869b          	addiw	a3,a3,-1
    80001ce8:	fbdff06f          	j	80001ca4 <_ZN3stm4ntosExPci+0xbc>

0000000080001cec <_ZN3stm4utosEmPci>:

char *stm::utos(uint64 number, char *buffer, int radix) {
    80001cec:	f7010113          	addi	sp,sp,-144
    80001cf0:	08113423          	sd	ra,136(sp)
    80001cf4:	08813023          	sd	s0,128(sp)
    80001cf8:	06913c23          	sd	s1,120(sp)
    80001cfc:	09010413          	addi	s0,sp,144
    80001d00:	00058493          	mv	s1,a1
    if (radix < 2 || radix > 16) {
    80001d04:	ffe6071b          	addiw	a4,a2,-2
    80001d08:	00e00793          	li	a5,14
    80001d0c:	04e7e263          	bltu	a5,a4,80001d50 <_ZN3stm4utosEmPci+0x64>
        buffer[0] = 0;
        return buffer;
    }
    if (number == 0) {
    80001d10:	04050463          	beqz	a0,80001d58 <_ZN3stm4utosEmPci+0x6c>
        buffer[0] = '0';
        buffer[1] = 0;
        return buffer;
    }
    char digits[100] = {};
    80001d14:	f6043c23          	sd	zero,-136(s0)
    80001d18:	f8043023          	sd	zero,-128(s0)
    80001d1c:	f8043423          	sd	zero,-120(s0)
    80001d20:	f8043823          	sd	zero,-112(s0)
    80001d24:	f8043c23          	sd	zero,-104(s0)
    80001d28:	fa043023          	sd	zero,-96(s0)
    80001d2c:	fa043423          	sd	zero,-88(s0)
    80001d30:	fa043823          	sd	zero,-80(s0)
    80001d34:	fa043c23          	sd	zero,-72(s0)
    80001d38:	fc043023          	sd	zero,-64(s0)
    80001d3c:	fc043423          	sd	zero,-56(s0)
    80001d40:	fc043823          	sd	zero,-48(s0)
    80001d44:	fc042c23          	sw	zero,-40(s0)
    int i = 98;
    80001d48:	06200713          	li	a4,98
    80001d4c:	0440006f          	j	80001d90 <_ZN3stm4utosEmPci+0xa4>
        buffer[0] = 0;
    80001d50:	00058023          	sb	zero,0(a1)
        return buffer;
    80001d54:	0580006f          	j	80001dac <_ZN3stm4utosEmPci+0xc0>
        buffer[0] = '0';
    80001d58:	03000793          	li	a5,48
    80001d5c:	00f58023          	sb	a5,0(a1)
        buffer[1] = 0;
    80001d60:	000580a3          	sb	zero,1(a1)
        return buffer;
    80001d64:	0480006f          	j	80001dac <_ZN3stm4utosEmPci+0xc0>
    const char *av = "0123456789ABCDEF";
    while (number > 0) {
        digits[i--] = av[(number % radix)];
    80001d68:	02c577b3          	remu	a5,a0,a2
    80001d6c:	00006697          	auipc	a3,0x6
    80001d70:	2b468693          	addi	a3,a3,692 # 80008020 <CONSOLE_STATUS+0x10>
    80001d74:	00d787b3          	add	a5,a5,a3
    80001d78:	0007c683          	lbu	a3,0(a5)
    80001d7c:	fe040793          	addi	a5,s0,-32
    80001d80:	00e787b3          	add	a5,a5,a4
    80001d84:	f8d78c23          	sb	a3,-104(a5)
        number /= radix;
    80001d88:	02c55533          	divu	a0,a0,a2
        digits[i--] = av[(number % radix)];
    80001d8c:	fff7071b          	addiw	a4,a4,-1
    while (number > 0) {
    80001d90:	fc051ce3          	bnez	a0,80001d68 <_ZN3stm4utosEmPci+0x7c>
    }
    strcpy(&digits[++i], buffer);
    80001d94:	0017071b          	addiw	a4,a4,1
    80001d98:	00048593          	mv	a1,s1
    80001d9c:	f7840513          	addi	a0,s0,-136
    80001da0:	00e50533          	add	a0,a0,a4
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	c58080e7          	jalr	-936(ra) # 800019fc <_ZN3stm6strcpyEPKcPc>
    return buffer;
}
    80001dac:	00048513          	mv	a0,s1
    80001db0:	08813083          	ld	ra,136(sp)
    80001db4:	08013403          	ld	s0,128(sp)
    80001db8:	07813483          	ld	s1,120(sp)
    80001dbc:	09010113          	addi	sp,sp,144
    80001dc0:	00008067          	ret

0000000080001dc4 <_ZN3stm6string4copyERKS0_>:

void stm::string::copy(const stm::string &string) {
    80001dc4:	fe010113          	addi	sp,sp,-32
    80001dc8:	00113c23          	sd	ra,24(sp)
    80001dcc:	00813823          	sd	s0,16(sp)
    80001dd0:	00913423          	sd	s1,8(sp)
    80001dd4:	01213023          	sd	s2,0(sp)
    80001dd8:	02010413          	addi	s0,sp,32
    80001ddc:	00050493          	mv	s1,a0
    80001de0:	00058913          	mv	s2,a1
    cout << 101;
    80001de4:	06500593          	li	a1,101
    80001de8:	00008517          	auipc	a0,0x8
    80001dec:	52853503          	ld	a0,1320(a0) # 8000a310 <_GLOBAL_OFFSET_TABLE_+0x98>
    80001df0:	00001097          	auipc	ra,0x1
    80001df4:	718080e7          	jalr	1816(ra) # 80003508 <_ZNK3stm7istreamlsEi>
    this->size = string.size;
    80001df8:	00092503          	lw	a0,0(s2)
    80001dfc:	00a4a023          	sw	a0,0(s1)
    this->actual_string = this->size > string::SMALL_SIZE ? new char[this->size] : this->small_string;
    80001e00:	01e00793          	li	a5,30
    80001e04:	02a7c863          	blt	a5,a0,80001e34 <_ZN3stm6string4copyERKS0_+0x70>
    80001e08:	01048593          	addi	a1,s1,16
    80001e0c:	00b4b423          	sd	a1,8(s1)
    strcpy(string.actual_string, this->actual_string);
    80001e10:	00893503          	ld	a0,8(s2)
    80001e14:	00000097          	auipc	ra,0x0
    80001e18:	be8080e7          	jalr	-1048(ra) # 800019fc <_ZN3stm6strcpyEPKcPc>
}
    80001e1c:	01813083          	ld	ra,24(sp)
    80001e20:	01013403          	ld	s0,16(sp)
    80001e24:	00813483          	ld	s1,8(sp)
    80001e28:	00013903          	ld	s2,0(sp)
    80001e2c:	02010113          	addi	sp,sp,32
    80001e30:	00008067          	ret
    this->actual_string = this->size > string::SMALL_SIZE ? new char[this->size] : this->small_string;
    80001e34:	00002097          	auipc	ra,0x2
    80001e38:	b44080e7          	jalr	-1212(ra) # 80003978 <_Znam>
    80001e3c:	00050593          	mv	a1,a0
    80001e40:	fcdff06f          	j	80001e0c <_ZN3stm6string4copyERKS0_+0x48>

0000000080001e44 <_ZN3stm6string4moveERS0_>:

void stm::string::move(stm::string &string) {
    80001e44:	fe010113          	addi	sp,sp,-32
    80001e48:	00113c23          	sd	ra,24(sp)
    80001e4c:	00813823          	sd	s0,16(sp)
    80001e50:	00913423          	sd	s1,8(sp)
    80001e54:	01213023          	sd	s2,0(sp)
    80001e58:	02010413          	addi	s0,sp,32
    80001e5c:	00050913          	mv	s2,a0
    80001e60:	00058493          	mv	s1,a1
    this->size = string.size;
    80001e64:	0005a783          	lw	a5,0(a1)
    80001e68:	00f52023          	sw	a5,0(a0)
    if(this->size > string::SMALL_SIZE)
    80001e6c:	01e00713          	li	a4,30
    80001e70:	02f75463          	bge	a4,a5,80001e98 <_ZN3stm6string4moveERS0_+0x54>
        this->actual_string = string.actual_string;
    80001e74:	0085b783          	ld	a5,8(a1)
    80001e78:	00f53423          	sd	a5,8(a0)
    else
        this->actual_string = strcpy(string.actual_string, this->small_string);
    string.actual_string = nullptr;
    80001e7c:	0004b423          	sd	zero,8(s1)
}
    80001e80:	01813083          	ld	ra,24(sp)
    80001e84:	01013403          	ld	s0,16(sp)
    80001e88:	00813483          	ld	s1,8(sp)
    80001e8c:	00013903          	ld	s2,0(sp)
    80001e90:	02010113          	addi	sp,sp,32
    80001e94:	00008067          	ret
        this->actual_string = strcpy(string.actual_string, this->small_string);
    80001e98:	01050593          	addi	a1,a0,16
    80001e9c:	0084b503          	ld	a0,8(s1)
    80001ea0:	00000097          	auipc	ra,0x0
    80001ea4:	b5c080e7          	jalr	-1188(ra) # 800019fc <_ZN3stm6strcpyEPKcPc>
    80001ea8:	00a93423          	sd	a0,8(s2)
    80001eac:	fd1ff06f          	j	80001e7c <_ZN3stm6string4moveERS0_+0x38>

0000000080001eb0 <_ZN3stm6stringC1Ec>:
    this->size = strlen(string);
    this->actual_string = new char[this->size + 1];
    strcpy(string, this->actual_string);
}

stm::string::string(char c) {
    80001eb0:	ff010113          	addi	sp,sp,-16
    80001eb4:	00813423          	sd	s0,8(sp)
    80001eb8:	01010413          	addi	s0,sp,16
    this->size = 1;
    80001ebc:	00100793          	li	a5,1
    80001ec0:	00f52023          	sw	a5,0(a0)
    this->actual_string = this->small_string;
    80001ec4:	01050793          	addi	a5,a0,16
    80001ec8:	00f53423          	sd	a5,8(a0)
    this->actual_string[0] = c;
    80001ecc:	00b50823          	sb	a1,16(a0)
    this->actual_string[1] = 0;
    80001ed0:	000508a3          	sb	zero,17(a0)
}
    80001ed4:	00813403          	ld	s0,8(sp)
    80001ed8:	01010113          	addi	sp,sp,16
    80001edc:	00008067          	ret

0000000080001ee0 <_ZN3stm6stringC1Ex>:

stm::string::string(long long number) {
    80001ee0:	fe010113          	addi	sp,sp,-32
    80001ee4:	00113c23          	sd	ra,24(sp)
    80001ee8:	00813823          	sd	s0,16(sp)
    80001eec:	00913423          	sd	s1,8(sp)
    80001ef0:	02010413          	addi	s0,sp,32
    80001ef4:	00050493          	mv	s1,a0
    80001ef8:	00058513          	mv	a0,a1
    this->actual_string = ntos(number, this->small_string, 10);
    80001efc:	00a00613          	li	a2,10
    80001f00:	01048593          	addi	a1,s1,16
    80001f04:	00000097          	auipc	ra,0x0
    80001f08:	ce4080e7          	jalr	-796(ra) # 80001be8 <_ZN3stm4ntosExPci>
    80001f0c:	00a4b423          	sd	a0,8(s1)
    this->size = strlen(this->actual_string);
    80001f10:	00000097          	auipc	ra,0x0
    80001f14:	ab8080e7          	jalr	-1352(ra) # 800019c8 <_ZN3stm6strlenEPKc>
    80001f18:	00a4a023          	sw	a0,0(s1)
}
    80001f1c:	01813083          	ld	ra,24(sp)
    80001f20:	01013403          	ld	s0,16(sp)
    80001f24:	00813483          	ld	s1,8(sp)
    80001f28:	02010113          	addi	sp,sp,32
    80001f2c:	00008067          	ret

0000000080001f30 <_ZN3stm6stringC1Ei>:

stm::string::string(int number) : string((long long) number) {}
    80001f30:	ff010113          	addi	sp,sp,-16
    80001f34:	00113423          	sd	ra,8(sp)
    80001f38:	00813023          	sd	s0,0(sp)
    80001f3c:	01010413          	addi	s0,sp,16
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	fa0080e7          	jalr	-96(ra) # 80001ee0 <_ZN3stm6stringC1Ex>
    80001f48:	00813083          	ld	ra,8(sp)
    80001f4c:	00013403          	ld	s0,0(sp)
    80001f50:	01010113          	addi	sp,sp,16
    80001f54:	00008067          	ret

0000000080001f58 <_ZN3stm6stringC1Em>:

stm::string::string(uint64 number) {
    80001f58:	fe010113          	addi	sp,sp,-32
    80001f5c:	00113c23          	sd	ra,24(sp)
    80001f60:	00813823          	sd	s0,16(sp)
    80001f64:	00913423          	sd	s1,8(sp)
    80001f68:	02010413          	addi	s0,sp,32
    80001f6c:	00050493          	mv	s1,a0
    80001f70:	00058513          	mv	a0,a1
    this->actual_string = utos(number, this->small_string, 10);
    80001f74:	00a00613          	li	a2,10
    80001f78:	01048593          	addi	a1,s1,16
    80001f7c:	00000097          	auipc	ra,0x0
    80001f80:	d70080e7          	jalr	-656(ra) # 80001cec <_ZN3stm4utosEmPci>
    80001f84:	00a4b423          	sd	a0,8(s1)
    this->size = strlen(this->actual_string);
    80001f88:	00000097          	auipc	ra,0x0
    80001f8c:	a40080e7          	jalr	-1472(ra) # 800019c8 <_ZN3stm6strlenEPKc>
    80001f90:	00a4a023          	sw	a0,0(s1)
}
    80001f94:	01813083          	ld	ra,24(sp)
    80001f98:	01013403          	ld	s0,16(sp)
    80001f9c:	00813483          	ld	s1,8(sp)
    80001fa0:	02010113          	addi	sp,sp,32
    80001fa4:	00008067          	ret

0000000080001fa8 <_ZN3stm6stringaSERKS0_>:

stm::string &stm::string::operator=(const stm::string &string) {
    80001fa8:	fe010113          	addi	sp,sp,-32
    80001fac:	00113c23          	sd	ra,24(sp)
    80001fb0:	00813823          	sd	s0,16(sp)
    80001fb4:	00913423          	sd	s1,8(sp)
    80001fb8:	01213023          	sd	s2,0(sp)
    80001fbc:	02010413          	addi	s0,sp,32
    80001fc0:	00050493          	mv	s1,a0
    if (this == &string) return *this;
    80001fc4:	02b50463          	beq	a0,a1,80001fec <_ZN3stm6stringaSERKS0_+0x44>
    80001fc8:	00058913          	mv	s2,a1
    private:
        void copy(const string &);

        void move(string &);

        void unexist() { delete[] this->actual_string; }
    80001fcc:	00853503          	ld	a0,8(a0)
    80001fd0:	00050663          	beqz	a0,80001fdc <_ZN3stm6stringaSERKS0_+0x34>
    80001fd4:	00002097          	auipc	ra,0x2
    80001fd8:	ac0080e7          	jalr	-1344(ra) # 80003a94 <_ZdaPv>
    this->unexist();
    this->copy(string);
    80001fdc:	00090593          	mv	a1,s2
    80001fe0:	00048513          	mv	a0,s1
    80001fe4:	00000097          	auipc	ra,0x0
    80001fe8:	de0080e7          	jalr	-544(ra) # 80001dc4 <_ZN3stm6string4copyERKS0_>
    return *this;
}
    80001fec:	00048513          	mv	a0,s1
    80001ff0:	01813083          	ld	ra,24(sp)
    80001ff4:	01013403          	ld	s0,16(sp)
    80001ff8:	00813483          	ld	s1,8(sp)
    80001ffc:	00013903          	ld	s2,0(sp)
    80002000:	02010113          	addi	sp,sp,32
    80002004:	00008067          	ret

0000000080002008 <_ZN3stm6stringaSEOS0_>:

stm::string &stm::string::operator=(stm::string &&string) noexcept {
    80002008:	fe010113          	addi	sp,sp,-32
    8000200c:	00113c23          	sd	ra,24(sp)
    80002010:	00813823          	sd	s0,16(sp)
    80002014:	00913423          	sd	s1,8(sp)
    80002018:	01213023          	sd	s2,0(sp)
    8000201c:	02010413          	addi	s0,sp,32
    80002020:	00050493          	mv	s1,a0
    if (this == &string) return *this;
    80002024:	02b50463          	beq	a0,a1,8000204c <_ZN3stm6stringaSEOS0_+0x44>
    80002028:	00058913          	mv	s2,a1
    8000202c:	00853503          	ld	a0,8(a0)
    80002030:	00050663          	beqz	a0,8000203c <_ZN3stm6stringaSEOS0_+0x34>
    80002034:	00002097          	auipc	ra,0x2
    80002038:	a60080e7          	jalr	-1440(ra) # 80003a94 <_ZdaPv>
    this->unexist();
    this->move(string);
    8000203c:	00090593          	mv	a1,s2
    80002040:	00048513          	mv	a0,s1
    80002044:	00000097          	auipc	ra,0x0
    80002048:	e00080e7          	jalr	-512(ra) # 80001e44 <_ZN3stm6string4moveERS0_>
    return *this;
}
    8000204c:	00048513          	mv	a0,s1
    80002050:	01813083          	ld	ra,24(sp)
    80002054:	01013403          	ld	s0,16(sp)
    80002058:	00813483          	ld	s1,8(sp)
    8000205c:	00013903          	ld	s2,0(sp)
    80002060:	02010113          	addi	sp,sp,32
    80002064:	00008067          	ret

0000000080002068 <_ZN3stm6string15write_and_countEPKcPci>:

inline bool stm::operator<(const stm::string &string1, const stm::string &string2) {
    return stm::strcmp(string1.actual_string, string2.actual_string) < 0;
}

int stm::string::write_and_count(const char *src, char *dst, int n) {
    80002068:	ff010113          	addi	sp,sp,-16
    8000206c:	00813423          	sd	s0,8(sp)
    80002070:	01010413          	addi	s0,sp,16
    80002074:	00050693          	mv	a3,a0
    int i;
    for (i = 0; src[i]; i++) {
    80002078:	00000513          	li	a0,0
    8000207c:	00a68733          	add	a4,a3,a0
    80002080:	00074703          	lbu	a4,0(a4)
    80002084:	00070c63          	beqz	a4,8000209c <_ZN3stm6string15write_and_countEPKcPci+0x34>
        if (i >= n) return -1;
    80002088:	02c55463          	bge	a0,a2,800020b0 <_ZN3stm6string15write_and_countEPKcPci+0x48>
        dst[i] = src[i];
    8000208c:	00a587b3          	add	a5,a1,a0
    80002090:	00e78023          	sb	a4,0(a5)
    for (i = 0; src[i]; i++) {
    80002094:	0015051b          	addiw	a0,a0,1
    80002098:	fe5ff06f          	j	8000207c <_ZN3stm6string15write_and_countEPKcPci+0x14>
    }
    dst[i] = src[i];
    8000209c:	00a587b3          	add	a5,a1,a0
    800020a0:	00e78023          	sb	a4,0(a5)
    return i;
    800020a4:	00813403          	ld	s0,8(sp)
    800020a8:	01010113          	addi	sp,sp,16
    800020ac:	00008067          	ret
        if (i >= n) return -1;
    800020b0:	fff00513          	li	a0,-1
    800020b4:	ff1ff06f          	j	800020a4 <_ZN3stm6string15write_and_countEPKcPci+0x3c>

00000000800020b8 <_ZN3stm6stringC1EPKc>:
stm::string::string(const char *string) {
    800020b8:	fd010113          	addi	sp,sp,-48
    800020bc:	02113423          	sd	ra,40(sp)
    800020c0:	02813023          	sd	s0,32(sp)
    800020c4:	00913c23          	sd	s1,24(sp)
    800020c8:	01213823          	sd	s2,16(sp)
    800020cc:	01313423          	sd	s3,8(sp)
    800020d0:	03010413          	addi	s0,sp,48
    800020d4:	00050493          	mv	s1,a0
    800020d8:	00058913          	mv	s2,a1
    this->size = string::write_and_count(string, this->small_string, SMALL_SIZE);
    800020dc:	01050993          	addi	s3,a0,16
    800020e0:	01e00613          	li	a2,30
    800020e4:	00098593          	mv	a1,s3
    800020e8:	00090513          	mv	a0,s2
    800020ec:	00000097          	auipc	ra,0x0
    800020f0:	f7c080e7          	jalr	-132(ra) # 80002068 <_ZN3stm6string15write_and_countEPKcPci>
    800020f4:	00a4a023          	sw	a0,0(s1)
    if (this->size != -1) {
    800020f8:	fff00793          	li	a5,-1
    800020fc:	02f50263          	beq	a0,a5,80002120 <_ZN3stm6stringC1EPKc+0x68>
        this->actual_string = this->small_string;
    80002100:	0134b423          	sd	s3,8(s1)
}
    80002104:	02813083          	ld	ra,40(sp)
    80002108:	02013403          	ld	s0,32(sp)
    8000210c:	01813483          	ld	s1,24(sp)
    80002110:	01013903          	ld	s2,16(sp)
    80002114:	00813983          	ld	s3,8(sp)
    80002118:	03010113          	addi	sp,sp,48
    8000211c:	00008067          	ret
    this->size = strlen(string);
    80002120:	00090513          	mv	a0,s2
    80002124:	00000097          	auipc	ra,0x0
    80002128:	8a4080e7          	jalr	-1884(ra) # 800019c8 <_ZN3stm6strlenEPKc>
    8000212c:	00a4a023          	sw	a0,0(s1)
    this->actual_string = new char[this->size + 1];
    80002130:	0015051b          	addiw	a0,a0,1
    80002134:	00002097          	auipc	ra,0x2
    80002138:	844080e7          	jalr	-1980(ra) # 80003978 <_Znam>
    8000213c:	00050593          	mv	a1,a0
    80002140:	00a4b423          	sd	a0,8(s1)
    strcpy(string, this->actual_string);
    80002144:	00090513          	mv	a0,s2
    80002148:	00000097          	auipc	ra,0x0
    8000214c:	8b4080e7          	jalr	-1868(ra) # 800019fc <_ZN3stm6strcpyEPKcPc>
    80002150:	fb5ff06f          	j	80002104 <_ZN3stm6stringC1EPKc+0x4c>

0000000080002154 <_ZN3stmplERKNS_6stringES2_>:
stm::string &stm::operator+(const stm::string &string1, const stm::string &string2) {
    80002154:	fe010113          	addi	sp,sp,-32
    80002158:	00113c23          	sd	ra,24(sp)
    8000215c:	00813823          	sd	s0,16(sp)
    80002160:	00913423          	sd	s1,8(sp)
    80002164:	01213023          	sd	s2,0(sp)
    80002168:	02010413          	addi	s0,sp,32
    return *(new stm::string(stm::strcat(string1.actual_string, string2.actual_string)));
    8000216c:	0085b583          	ld	a1,8(a1)
    80002170:	00853503          	ld	a0,8(a0)
    80002174:	00000097          	auipc	ra,0x0
    80002178:	964080e7          	jalr	-1692(ra) # 80001ad8 <_ZN3stm6strcatEPKcS1_>
    8000217c:	00050913          	mv	s2,a0
    80002180:	03000513          	li	a0,48
    80002184:	00001097          	auipc	ra,0x1
    80002188:	7cc080e7          	jalr	1996(ra) # 80003950 <_Znwm>
    8000218c:	00050493          	mv	s1,a0
    80002190:	00090593          	mv	a1,s2
    80002194:	00000097          	auipc	ra,0x0
    80002198:	f24080e7          	jalr	-220(ra) # 800020b8 <_ZN3stm6stringC1EPKc>
    8000219c:	0200006f          	j	800021bc <_ZN3stmplERKNS_6stringES2_+0x68>
    800021a0:	00050913          	mv	s2,a0
    800021a4:	00048513          	mv	a0,s1
    800021a8:	00001097          	auipc	ra,0x1
    800021ac:	7f8080e7          	jalr	2040(ra) # 800039a0 <_ZdlPv>
    800021b0:	00090513          	mv	a0,s2
    800021b4:	00009097          	auipc	ra,0x9
    800021b8:	344080e7          	jalr	836(ra) # 8000b4f8 <_Unwind_Resume>
}
    800021bc:	00048513          	mv	a0,s1
    800021c0:	01813083          	ld	ra,24(sp)
    800021c4:	01013403          	ld	s0,16(sp)
    800021c8:	00813483          	ld	s1,8(sp)
    800021cc:	00013903          	ld	s2,0(sp)
    800021d0:	02010113          	addi	sp,sp,32
    800021d4:	00008067          	ret

00000000800021d8 <_ZN3stm6stringpLERKS0_>:
stm::string &stm::string::operator+=(const stm::string &string) {
    800021d8:	fe010113          	addi	sp,sp,-32
    800021dc:	00113c23          	sd	ra,24(sp)
    800021e0:	00813823          	sd	s0,16(sp)
    800021e4:	00913423          	sd	s1,8(sp)
    800021e8:	02010413          	addi	s0,sp,32
    800021ec:	00050493          	mv	s1,a0
    *this = *this + string;
    800021f0:	00000097          	auipc	ra,0x0
    800021f4:	f64080e7          	jalr	-156(ra) # 80002154 <_ZN3stmplERKNS_6stringES2_>
    800021f8:	00050593          	mv	a1,a0
    800021fc:	00048513          	mv	a0,s1
    80002200:	00000097          	auipc	ra,0x0
    80002204:	da8080e7          	jalr	-600(ra) # 80001fa8 <_ZN3stm6stringaSERKS0_>
}
    80002208:	00048513          	mv	a0,s1
    8000220c:	01813083          	ld	ra,24(sp)
    80002210:	01013403          	ld	s0,16(sp)
    80002214:	00813483          	ld	s1,8(sp)
    80002218:	02010113          	addi	sp,sp,32
    8000221c:	00008067          	ret

0000000080002220 <_ZN3Sem9_sem_openEPPS_j>:
#include "../h/c_semaphore.hpp"
#include "../h/c_thread.hpp"
#include "../h/scheduler.hpp"

int Sem::_sem_open(sem_t *handle, unsigned init) {
    80002220:	fd010113          	addi	sp,sp,-48
    80002224:	02113423          	sd	ra,40(sp)
    80002228:	02813023          	sd	s0,32(sp)
    8000222c:	00913c23          	sd	s1,24(sp)
    80002230:	01213823          	sd	s2,16(sp)
    80002234:	01313423          	sd	s3,8(sp)
    80002238:	03010413          	addi	s0,sp,48
    8000223c:	00050913          	mv	s2,a0
    80002240:	00058993          	mv	s3,a1
    sem_t semaphore = (sem_t) Allocator::_mem_alloc(sizeof(Sem));
    80002244:	02000513          	li	a0,32
    80002248:	00001097          	auipc	ra,0x1
    8000224c:	ec0080e7          	jalr	-320(ra) # 80003108 <_ZN9Allocator10_mem_allocEm>
    if (!semaphore) {
    80002250:	02050e63          	beqz	a0,8000228c <_ZN3Sem9_sem_openEPPS_j+0x6c>
    80002254:	00050493          	mv	s1,a0
        return 1;
    }
    semaphore->count = init;
    80002258:	01352023          	sw	s3,0(a0)
    semaphore->blocked.init();
    8000225c:	00850513          	addi	a0,a0,8
    80002260:	00000097          	auipc	ra,0x0
    80002264:	250080e7          	jalr	592(ra) # 800024b0 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    *handle = semaphore;
    80002268:	00993023          	sd	s1,0(s2)
    return 0;
    8000226c:	00000513          	li	a0,0
}
    80002270:	02813083          	ld	ra,40(sp)
    80002274:	02013403          	ld	s0,32(sp)
    80002278:	01813483          	ld	s1,24(sp)
    8000227c:	01013903          	ld	s2,16(sp)
    80002280:	00813983          	ld	s3,8(sp)
    80002284:	03010113          	addi	sp,sp,48
    80002288:	00008067          	ret
        return 1;
    8000228c:	00100513          	li	a0,1
    80002290:	fe1ff06f          	j	80002270 <_ZN3Sem9_sem_openEPPS_j+0x50>

0000000080002294 <_ZN3Sem11_sem_signalEPS_>:
    }
    return ret;
}

int Sem::_sem_signal(sem_t id) {
    if (!id) return 1;
    80002294:	06050263          	beqz	a0,800022f8 <_ZN3Sem11_sem_signalEPS_+0x64>
    80002298:	00050793          	mv	a5,a0

        T get();

        T &peek();

        inline bool is_empty() const { return this->size == 0; }
    8000229c:	01852503          	lw	a0,24(a0)
    if (!id->blocked.is_empty()) {
    800022a0:	00051a63          	bnez	a0,800022b4 <_ZN3Sem11_sem_signalEPS_+0x20>
        thread_t next = id->blocked.get();
        next->run();
        Scheduler::put(next);
        TCB::_thread_dispatch();
    } else {
        id->count++;
    800022a4:	0007a703          	lw	a4,0(a5)
    800022a8:	0017071b          	addiw	a4,a4,1
    800022ac:	00e7a023          	sw	a4,0(a5)
    800022b0:	00008067          	ret
int Sem::_sem_signal(sem_t id) {
    800022b4:	ff010113          	addi	sp,sp,-16
    800022b8:	00113423          	sd	ra,8(sp)
    800022bc:	00813023          	sd	s0,0(sp)
    800022c0:	01010413          	addi	s0,sp,16
        thread_t next = id->blocked.get();
    800022c4:	00878513          	addi	a0,a5,8
    800022c8:	00000097          	auipc	ra,0x0
    800022cc:	238080e7          	jalr	568(ra) # 80002500 <_ZN3stm14CircularBufferIP3TCBE3getEv>

    bool is_joined() const { return this->status == JOINED; }

    bool is_finished() const { return this->status == FINISHED; }

    void run() { this->status = RUNNABLE; }
    800022d0:	04052423          	sw	zero,72(a0)
        Scheduler::put(next);
    800022d4:	00002097          	auipc	ra,0x2
    800022d8:	fec080e7          	jalr	-20(ra) # 800042c0 <_ZN9Scheduler3putEP3TCB>
        TCB::_thread_dispatch();
    800022dc:	00003097          	auipc	ra,0x3
    800022e0:	95c080e7          	jalr	-1700(ra) # 80004c38 <_ZN3TCB16_thread_dispatchEv>
    }
    return 0;
    800022e4:	00000513          	li	a0,0
}
    800022e8:	00813083          	ld	ra,8(sp)
    800022ec:	00013403          	ld	s0,0(sp)
    800022f0:	01010113          	addi	sp,sp,16
    800022f4:	00008067          	ret
    if (!id) return 1;
    800022f8:	00100513          	li	a0,1
}
    800022fc:	00008067          	ret

0000000080002300 <_ZN3Sem15_sem_signal_allEPS_>:

int Sem::_sem_signal_all(Sem * id) {
    80002300:	fe010113          	addi	sp,sp,-32
    80002304:	00113c23          	sd	ra,24(sp)
    80002308:	00813823          	sd	s0,16(sp)
    8000230c:	00913423          	sd	s1,8(sp)
    80002310:	02010413          	addi	s0,sp,32
    80002314:	00050493          	mv	s1,a0
    if (!id) return 1;
    80002318:	02050863          	beqz	a0,80002348 <_ZN3Sem15_sem_signal_allEPS_+0x48>
    8000231c:	0184a503          	lw	a0,24(s1)
    while (!id->blocked.is_empty()) {
    80002320:	02050663          	beqz	a0,8000234c <_ZN3Sem15_sem_signal_allEPS_+0x4c>
        thread_t next = id->blocked.get();
    80002324:	00848513          	addi	a0,s1,8
    80002328:	00000097          	auipc	ra,0x0
    8000232c:	1d8080e7          	jalr	472(ra) # 80002500 <_ZN3stm14CircularBufferIP3TCBE3getEv>
        Scheduler::put(next);
    80002330:	00002097          	auipc	ra,0x2
    80002334:	f90080e7          	jalr	-112(ra) # 800042c0 <_ZN9Scheduler3putEP3TCB>
        id->count++;
    80002338:	0004a783          	lw	a5,0(s1)
    8000233c:	0017879b          	addiw	a5,a5,1
    80002340:	00f4a023          	sw	a5,0(s1)
    while (!id->blocked.is_empty()) {
    80002344:	fd9ff06f          	j	8000231c <_ZN3Sem15_sem_signal_allEPS_+0x1c>
    if (!id) return 1;
    80002348:	00100513          	li	a0,1
    }
    return 0;
}
    8000234c:	01813083          	ld	ra,24(sp)
    80002350:	01013403          	ld	s0,16(sp)
    80002354:	00813483          	ld	s1,8(sp)
    80002358:	02010113          	addi	sp,sp,32
    8000235c:	00008067          	ret

0000000080002360 <_ZN3Sem10_sem_closeEPS_>:
int Sem::_sem_close(sem_t id) {
    80002360:	fe010113          	addi	sp,sp,-32
    80002364:	00113c23          	sd	ra,24(sp)
    80002368:	00813823          	sd	s0,16(sp)
    8000236c:	00913423          	sd	s1,8(sp)
    80002370:	02010413          	addi	s0,sp,32
    80002374:	00050493          	mv	s1,a0
    if (!id) return 1;
    80002378:	04050a63          	beqz	a0,800023cc <_ZN3Sem10_sem_closeEPS_+0x6c>
    8000237c:	0184a783          	lw	a5,24(s1)
    while (!id->blocked.is_empty()) {
    80002380:	00078e63          	beqz	a5,8000239c <_ZN3Sem10_sem_closeEPS_+0x3c>
        thread_t next = id->blocked.get();
    80002384:	00848513          	addi	a0,s1,8
    80002388:	00000097          	auipc	ra,0x0
    8000238c:	178080e7          	jalr	376(ra) # 80002500 <_ZN3stm14CircularBufferIP3TCBE3getEv>
        Scheduler::put(next);
    80002390:	00002097          	auipc	ra,0x2
    80002394:	f30080e7          	jalr	-208(ra) # 800042c0 <_ZN9Scheduler3putEP3TCB>
    while (!id->blocked.is_empty()) {
    80002398:	fe5ff06f          	j	8000237c <_ZN3Sem10_sem_closeEPS_+0x1c>
    id->blocked.destroy();
    8000239c:	00848513          	addi	a0,s1,8
    800023a0:	00000097          	auipc	ra,0x0
    800023a4:	1ac080e7          	jalr	428(ra) # 8000254c <_ZN3stm14CircularBufferIP3TCBE7destroyEv>
    if (Allocator::_mem_free(id)) return 2;
    800023a8:	00048513          	mv	a0,s1
    800023ac:	00001097          	auipc	ra,0x1
    800023b0:	e18080e7          	jalr	-488(ra) # 800031c4 <_ZN9Allocator9_mem_freeEPKv>
    800023b4:	02051063          	bnez	a0,800023d4 <_ZN3Sem10_sem_closeEPS_+0x74>
}
    800023b8:	01813083          	ld	ra,24(sp)
    800023bc:	01013403          	ld	s0,16(sp)
    800023c0:	00813483          	ld	s1,8(sp)
    800023c4:	02010113          	addi	sp,sp,32
    800023c8:	00008067          	ret
    if (!id) return 1;
    800023cc:	00100513          	li	a0,1
    800023d0:	fe9ff06f          	j	800023b8 <_ZN3Sem10_sem_closeEPS_+0x58>
    if (Allocator::_mem_free(id)) return 2;
    800023d4:	00200513          	li	a0,2
    800023d8:	fe1ff06f          	j	800023b8 <_ZN3Sem10_sem_closeEPS_+0x58>

00000000800023dc <_ZN3Sem9_sem_waitEPS_>:
    if (!id) return 1;
    800023dc:	08050663          	beqz	a0,80002468 <_ZN3Sem9_sem_waitEPS_+0x8c>
    if (id->count == 0) {
    800023e0:	00052783          	lw	a5,0(a0)
    800023e4:	00078a63          	beqz	a5,800023f8 <_ZN3Sem9_sem_waitEPS_+0x1c>
        id->count--;
    800023e8:	fff7879b          	addiw	a5,a5,-1
    800023ec:	00f52023          	sw	a5,0(a0)
    int ret = 0;
    800023f0:	00000513          	li	a0,0
    800023f4:	00008067          	ret
int Sem::_sem_wait(sem_t id) {
    800023f8:	fe010113          	addi	sp,sp,-32
    800023fc:	00113c23          	sd	ra,24(sp)
    80002400:	00813823          	sd	s0,16(sp)
    80002404:	00913423          	sd	s1,8(sp)
    80002408:	02010413          	addi	s0,sp,32
        TCB::running->block();
    8000240c:	00008497          	auipc	s1,0x8
    80002410:	ee44b483          	ld	s1,-284(s1) # 8000a2f0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002414:	0004b583          	ld	a1,0(s1)

    void block() { this->status = BLOCKED; }
    80002418:	00100793          	li	a5,1
    8000241c:	04f5a423          	sw	a5,72(a1)
        id->blocked.put(TCB::running);
    80002420:	00850513          	addi	a0,a0,8
    80002424:	00000097          	auipc	ra,0x0
    80002428:	200080e7          	jalr	512(ra) # 80002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
        TCB::_thread_dispatch();
    8000242c:	00003097          	auipc	ra,0x3
    80002430:	80c080e7          	jalr	-2036(ra) # 80004c38 <_ZN3TCB16_thread_dispatchEv>
        if (TCB::running->is_blocked()) {
    80002434:	0004b783          	ld	a5,0(s1)
    bool is_blocked() const { return this->status == BLOCKED; }
    80002438:	0487a683          	lw	a3,72(a5)
    8000243c:	00100713          	li	a4,1
    80002440:	00e68e63          	beq	a3,a4,8000245c <_ZN3Sem9_sem_waitEPS_+0x80>
    int ret = 0;
    80002444:	00000513          	li	a0,0
}
    80002448:	01813083          	ld	ra,24(sp)
    8000244c:	01013403          	ld	s0,16(sp)
    80002450:	00813483          	ld	s1,8(sp)
    80002454:	02010113          	addi	sp,sp,32
    80002458:	00008067          	ret
    void run() { this->status = RUNNABLE; }
    8000245c:	0407a423          	sw	zero,72(a5)
            ret = -1;
    80002460:	fff00513          	li	a0,-1
    80002464:	fe5ff06f          	j	80002448 <_ZN3Sem9_sem_waitEPS_+0x6c>
    if (!id) return 1;
    80002468:	00100513          	li	a0,1
}
    8000246c:	00008067          	ret

0000000080002470 <_ZN3Sem16_sem_signal_waitEPS_S0_>:

int Sem::_sem_signal_wait(Sem *id1, Sem* id2) {
    80002470:	fe010113          	addi	sp,sp,-32
    80002474:	00113c23          	sd	ra,24(sp)
    80002478:	00813823          	sd	s0,16(sp)
    8000247c:	00913423          	sd	s1,8(sp)
    80002480:	02010413          	addi	s0,sp,32
    80002484:	00058493          	mv	s1,a1
    _sem_signal(id1);
    80002488:	00000097          	auipc	ra,0x0
    8000248c:	e0c080e7          	jalr	-500(ra) # 80002294 <_ZN3Sem11_sem_signalEPS_>
    return _sem_wait(id2);
    80002490:	00048513          	mv	a0,s1
    80002494:	00000097          	auipc	ra,0x0
    80002498:	f48080e7          	jalr	-184(ra) # 800023dc <_ZN3Sem9_sem_waitEPS_>
}
    8000249c:	01813083          	ld	ra,24(sp)
    800024a0:	01013403          	ld	s0,16(sp)
    800024a4:	00813483          	ld	s1,8(sp)
    800024a8:	02010113          	addi	sp,sp,32
    800024ac:	00008067          	ret

00000000800024b0 <_ZN3stm14CircularBufferIP3TCBE4initEv>:
        int capacity;
    };
}

template<typename T>
void stm::CircularBuffer<T>::init() {
    800024b0:	fe010113          	addi	sp,sp,-32
    800024b4:	00113c23          	sd	ra,24(sp)
    800024b8:	00813823          	sd	s0,16(sp)
    800024bc:	00913423          	sd	s1,8(sp)
    800024c0:	02010413          	addi	s0,sp,32
    800024c4:	00050493          	mv	s1,a0
    this->head = 0;
    800024c8:	00052423          	sw	zero,8(a0)
    this->tail = 0;
    800024cc:	00052623          	sw	zero,12(a0)
    this->size = 0;
    800024d0:	00052823          	sw	zero,16(a0)
    this->capacity = CAPACITY;
    800024d4:	01000793          	li	a5,16
    800024d8:	00f52a23          	sw	a5,20(a0)
    this->queue = (T *) mem_alloc(sizeof(T) * CAPACITY);
    800024dc:	08000513          	li	a0,128
    800024e0:	fffff097          	auipc	ra,0xfffff
    800024e4:	fbc080e7          	jalr	-68(ra) # 8000149c <_Z9mem_allocm>
    800024e8:	00a4b023          	sd	a0,0(s1)
}
    800024ec:	01813083          	ld	ra,24(sp)
    800024f0:	01013403          	ld	s0,16(sp)
    800024f4:	00813483          	ld	s1,8(sp)
    800024f8:	02010113          	addi	sp,sp,32
    800024fc:	00008067          	ret

0000000080002500 <_ZN3stm14CircularBufferIP3TCBE3getEv>:
    this->tail = (this->tail + 1) % this->capacity;
    this->size++;
}

template<typename T>
T stm::CircularBuffer<T>::get() {
    80002500:	ff010113          	addi	sp,sp,-16
    80002504:	00813423          	sd	s0,8(sp)
    80002508:	01010413          	addi	s0,sp,16
    8000250c:	00050793          	mv	a5,a0
    T ret = this->queue[this->head];
    80002510:	00053683          	ld	a3,0(a0)
    80002514:	00852703          	lw	a4,8(a0)
    80002518:	00371613          	slli	a2,a4,0x3
    8000251c:	00c686b3          	add	a3,a3,a2
    80002520:	0006b503          	ld	a0,0(a3)
    this->head = (this->head + 1) % this->capacity;
    80002524:	0017071b          	addiw	a4,a4,1
    80002528:	0147a683          	lw	a3,20(a5)
    8000252c:	02d7673b          	remw	a4,a4,a3
    80002530:	00e7a423          	sw	a4,8(a5)
    this->size--;
    80002534:	0107a703          	lw	a4,16(a5)
    80002538:	fff7071b          	addiw	a4,a4,-1
    8000253c:	00e7a823          	sw	a4,16(a5)
    return ret;
}
    80002540:	00813403          	ld	s0,8(sp)
    80002544:	01010113          	addi	sp,sp,16
    80002548:	00008067          	ret

000000008000254c <_ZN3stm14CircularBufferIP3TCBE7destroyEv>:
    this->tail = this->capacity;
    this->capacity *= 2;
}

template<typename T>
void stm::CircularBuffer<T>::destroy() {
    8000254c:	ff010113          	addi	sp,sp,-16
    80002550:	00113423          	sd	ra,8(sp)
    80002554:	00813023          	sd	s0,0(sp)
    80002558:	01010413          	addi	s0,sp,16
    mem_free(this->queue);
    8000255c:	00053503          	ld	a0,0(a0)
    80002560:	fffff097          	auipc	ra,0xfffff
    80002564:	f84080e7          	jalr	-124(ra) # 800014e4 <_Z8mem_freePv>
}
    80002568:	00813083          	ld	ra,8(sp)
    8000256c:	00013403          	ld	s0,0(sp)
    80002570:	01010113          	addi	sp,sp,16
    80002574:	00008067          	ret

0000000080002578 <_ZN3stm14CircularBufferIP3TCBE6extendEv>:
void stm::CircularBuffer<T>::extend() {
    80002578:	fe010113          	addi	sp,sp,-32
    8000257c:	00113c23          	sd	ra,24(sp)
    80002580:	00813823          	sd	s0,16(sp)
    80002584:	00913423          	sd	s1,8(sp)
    80002588:	01213023          	sd	s2,0(sp)
    8000258c:	02010413          	addi	s0,sp,32
    80002590:	00050493          	mv	s1,a0
    T *new_queue = (T *) mem_alloc(sizeof(T *) * this->capacity * 2);
    80002594:	01452503          	lw	a0,20(a0)
    80002598:	00451513          	slli	a0,a0,0x4
    8000259c:	fffff097          	auipc	ra,0xfffff
    800025a0:	f00080e7          	jalr	-256(ra) # 8000149c <_Z9mem_allocm>
    800025a4:	00050913          	mv	s2,a0
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    800025a8:	0084a783          	lw	a5,8(s1)
    800025ac:	00000713          	li	a4,0
    800025b0:	0144a683          	lw	a3,20(s1)
    800025b4:	02d75a63          	bge	a4,a3,800025e8 <_ZN3stm14CircularBufferIP3TCBE6extendEv+0x70>
        new_queue[i] = this->queue[j];
    800025b8:	0004b603          	ld	a2,0(s1)
    800025bc:	00371693          	slli	a3,a4,0x3
    800025c0:	00d906b3          	add	a3,s2,a3
    800025c4:	00379593          	slli	a1,a5,0x3
    800025c8:	00b60633          	add	a2,a2,a1
    800025cc:	00063603          	ld	a2,0(a2)
    800025d0:	00c6b023          	sd	a2,0(a3)
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    800025d4:	0017071b          	addiw	a4,a4,1
    800025d8:	0017879b          	addiw	a5,a5,1
    800025dc:	0144a683          	lw	a3,20(s1)
    800025e0:	02d7e7bb          	remw	a5,a5,a3
    800025e4:	fcdff06f          	j	800025b0 <_ZN3stm14CircularBufferIP3TCBE6extendEv+0x38>
    mem_free(queue);
    800025e8:	0004b503          	ld	a0,0(s1)
    800025ec:	fffff097          	auipc	ra,0xfffff
    800025f0:	ef8080e7          	jalr	-264(ra) # 800014e4 <_Z8mem_freePv>
    this->queue = new_queue;
    800025f4:	0124b023          	sd	s2,0(s1)
    this->head = 0;
    800025f8:	0004a423          	sw	zero,8(s1)
    this->tail = this->capacity;
    800025fc:	0144a783          	lw	a5,20(s1)
    80002600:	00f4a623          	sw	a5,12(s1)
    this->capacity *= 2;
    80002604:	0017979b          	slliw	a5,a5,0x1
    80002608:	00f4aa23          	sw	a5,20(s1)
}
    8000260c:	01813083          	ld	ra,24(sp)
    80002610:	01013403          	ld	s0,16(sp)
    80002614:	00813483          	ld	s1,8(sp)
    80002618:	00013903          	ld	s2,0(sp)
    8000261c:	02010113          	addi	sp,sp,32
    80002620:	00008067          	ret

0000000080002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>:
void stm::CircularBuffer<T>::put(T element) {
    80002624:	fe010113          	addi	sp,sp,-32
    80002628:	00113c23          	sd	ra,24(sp)
    8000262c:	00813823          	sd	s0,16(sp)
    80002630:	00913423          	sd	s1,8(sp)
    80002634:	01213023          	sd	s2,0(sp)
    80002638:	02010413          	addi	s0,sp,32
    8000263c:	00050493          	mv	s1,a0
    80002640:	00058913          	mv	s2,a1
    if (this->size == this->capacity) {
    80002644:	01052703          	lw	a4,16(a0)
    80002648:	01452783          	lw	a5,20(a0)
    8000264c:	04f70863          	beq	a4,a5,8000269c <_ZN3stm14CircularBufferIP3TCBE3putES2_+0x78>
    this->queue[this->tail] = element;
    80002650:	0004b783          	ld	a5,0(s1)
    80002654:	00c4a703          	lw	a4,12(s1)
    80002658:	00371713          	slli	a4,a4,0x3
    8000265c:	00e787b3          	add	a5,a5,a4
    80002660:	0127b023          	sd	s2,0(a5)
    this->tail = (this->tail + 1) % this->capacity;
    80002664:	00c4a783          	lw	a5,12(s1)
    80002668:	0017879b          	addiw	a5,a5,1
    8000266c:	0144a703          	lw	a4,20(s1)
    80002670:	02e7e7bb          	remw	a5,a5,a4
    80002674:	00f4a623          	sw	a5,12(s1)
    this->size++;
    80002678:	0104a783          	lw	a5,16(s1)
    8000267c:	0017879b          	addiw	a5,a5,1
    80002680:	00f4a823          	sw	a5,16(s1)
}
    80002684:	01813083          	ld	ra,24(sp)
    80002688:	01013403          	ld	s0,16(sp)
    8000268c:	00813483          	ld	s1,8(sp)
    80002690:	00013903          	ld	s2,0(sp)
    80002694:	02010113          	addi	sp,sp,32
    80002698:	00008067          	ret
        this->extend();
    8000269c:	00000097          	auipc	ra,0x0
    800026a0:	edc080e7          	jalr	-292(ra) # 80002578 <_ZN3stm14CircularBufferIP3TCBE6extendEv>
    800026a4:	fadff06f          	j	80002650 <_ZN3stm14CircularBufferIP3TCBE3putES2_+0x2c>

00000000800026a8 <_Z5printPKc>:
    } else {
        Output.put(c);
    }
}

void print(const char *str) {
    800026a8:	fe010113          	addi	sp,sp,-32
    800026ac:	00113c23          	sd	ra,24(sp)
    800026b0:	00813823          	sd	s0,16(sp)
    800026b4:	00913423          	sd	s1,8(sp)
    800026b8:	01213023          	sd	s2,0(sp)
    800026bc:	02010413          	addi	s0,sp,32
    800026c0:	00050913          	mv	s2,a0
    int i = 0;
    printer->wait();
    800026c4:	00008797          	auipc	a5,0x8
    800026c8:	bdc7b783          	ld	a5,-1060(a5) # 8000a2a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800026cc:	0007b503          	ld	a0,0(a5)
    800026d0:	00053783          	ld	a5,0(a0)
    800026d4:	0107b783          	ld	a5,16(a5)
    800026d8:	000780e7          	jalr	a5
    int i = 0;
    800026dc:	00000493          	li	s1,0
    while (str[i]) {
    800026e0:	009907b3          	add	a5,s2,s1
    800026e4:	0007c503          	lbu	a0,0(a5)
    800026e8:	00050a63          	beqz	a0,800026fc <_Z5printPKc+0x54>
        putc(str[i++]);
    800026ec:	0014849b          	addiw	s1,s1,1
    800026f0:	fffff097          	auipc	ra,0xfffff
    800026f4:	29c080e7          	jalr	668(ra) # 8000198c <_Z4putcc>
    while (str[i]) {
    800026f8:	fe9ff06f          	j	800026e0 <_Z5printPKc+0x38>
    }
    printer->signal();
    800026fc:	00008797          	auipc	a5,0x8
    80002700:	ba47b783          	ld	a5,-1116(a5) # 8000a2a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002704:	0007b503          	ld	a0,0(a5)
    80002708:	00053783          	ld	a5,0(a0)
    8000270c:	0187b783          	ld	a5,24(a5)
    80002710:	000780e7          	jalr	a5
}
    80002714:	01813083          	ld	ra,24(sp)
    80002718:	01013403          	ld	s0,16(sp)
    8000271c:	00813483          	ld	s1,8(sp)
    80002720:	00013903          	ld	s2,0(sp)
    80002724:	02010113          	addi	sp,sp,32
    80002728:	00008067          	ret

000000008000272c <_Z14dramatic_printPKc>:

void dramatic_print(const char *str) {
    8000272c:	fe010113          	addi	sp,sp,-32
    80002730:	00113c23          	sd	ra,24(sp)
    80002734:	00813823          	sd	s0,16(sp)
    80002738:	00913423          	sd	s1,8(sp)
    8000273c:	01213023          	sd	s2,0(sp)
    80002740:	02010413          	addi	s0,sp,32
    80002744:	00050913          	mv	s2,a0
    int i = 0;
    printer->wait();
    80002748:	00008797          	auipc	a5,0x8
    8000274c:	b587b783          	ld	a5,-1192(a5) # 8000a2a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002750:	0007b503          	ld	a0,0(a5)
    80002754:	00053783          	ld	a5,0(a0)
    80002758:	0107b783          	ld	a5,16(a5)
    8000275c:	000780e7          	jalr	a5
    int i = 0;
    80002760:	00000493          	li	s1,0
    while (str[i]) {
    80002764:	009907b3          	add	a5,s2,s1
    80002768:	0007c503          	lbu	a0,0(a5)
    8000276c:	02050063          	beqz	a0,8000278c <_Z14dramatic_printPKc+0x60>
        putc(str[i++]);
    80002770:	0014849b          	addiw	s1,s1,1
    80002774:	fffff097          	auipc	ra,0xfffff
    80002778:	218080e7          	jalr	536(ra) # 8000198c <_Z4putcc>
        time_sleep(1);
    8000277c:	00100513          	li	a0,1
    80002780:	fffff097          	auipc	ra,0xfffff
    80002784:	140080e7          	jalr	320(ra) # 800018c0 <_Z10time_sleepm>
    while (str[i]) {
    80002788:	fddff06f          	j	80002764 <_Z14dramatic_printPKc+0x38>
    }
    printer->signal();
    8000278c:	00008797          	auipc	a5,0x8
    80002790:	b147b783          	ld	a5,-1260(a5) # 8000a2a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002794:	0007b503          	ld	a0,0(a5)
    80002798:	00053783          	ld	a5,0(a0)
    8000279c:	0187b783          	ld	a5,24(a5)
    800027a0:	000780e7          	jalr	a5
}
    800027a4:	01813083          	ld	ra,24(sp)
    800027a8:	01013403          	ld	s0,16(sp)
    800027ac:	00813483          	ld	s1,8(sp)
    800027b0:	00013903          	ld	s2,0(sp)
    800027b4:	02010113          	addi	sp,sp,32
    800027b8:	00008067          	ret

00000000800027bc <_Z5printx>:

void print(long long number) {
    800027bc:	fd010113          	addi	sp,sp,-48
    800027c0:	02113423          	sd	ra,40(sp)
    800027c4:	02813023          	sd	s0,32(sp)
    800027c8:	03010413          	addi	s0,sp,48
    char buff[25] = {};
    800027cc:	fc043823          	sd	zero,-48(s0)
    800027d0:	fc043c23          	sd	zero,-40(s0)
    800027d4:	fe043023          	sd	zero,-32(s0)
    800027d8:	fe040423          	sb	zero,-24(s0)
    print(stm::ntos(number, buff, 10));
    800027dc:	00a00613          	li	a2,10
    800027e0:	fd040593          	addi	a1,s0,-48
    800027e4:	fffff097          	auipc	ra,0xfffff
    800027e8:	404080e7          	jalr	1028(ra) # 80001be8 <_ZN3stm4ntosExPci>
    800027ec:	00000097          	auipc	ra,0x0
    800027f0:	ebc080e7          	jalr	-324(ra) # 800026a8 <_Z5printPKc>
}
    800027f4:	02813083          	ld	ra,40(sp)
    800027f8:	02013403          	ld	s0,32(sp)
    800027fc:	03010113          	addi	sp,sp,48
    80002800:	00008067          	ret

0000000080002804 <_Z5printi>:

void print(int number) {
    80002804:	ff010113          	addi	sp,sp,-16
    80002808:	00113423          	sd	ra,8(sp)
    8000280c:	00813023          	sd	s0,0(sp)
    80002810:	01010413          	addi	s0,sp,16
    print((long long) number);
    80002814:	00000097          	auipc	ra,0x0
    80002818:	fa8080e7          	jalr	-88(ra) # 800027bc <_Z5printx>
}
    8000281c:	00813083          	ld	ra,8(sp)
    80002820:	00013403          	ld	s0,0(sp)
    80002824:	01010113          	addi	sp,sp,16
    80002828:	00008067          	ret

000000008000282c <_Z5printm>:

void print(uint64 number) {
    8000282c:	fd010113          	addi	sp,sp,-48
    80002830:	02113423          	sd	ra,40(sp)
    80002834:	02813023          	sd	s0,32(sp)
    80002838:	03010413          	addi	s0,sp,48
    char buff[25] = {};
    8000283c:	fc043823          	sd	zero,-48(s0)
    80002840:	fc043c23          	sd	zero,-40(s0)
    80002844:	fe043023          	sd	zero,-32(s0)
    80002848:	fe040423          	sb	zero,-24(s0)
    print(stm::utos(number, buff, 10));
    8000284c:	00a00613          	li	a2,10
    80002850:	fd040593          	addi	a1,s0,-48
    80002854:	fffff097          	auipc	ra,0xfffff
    80002858:	498080e7          	jalr	1176(ra) # 80001cec <_ZN3stm4utosEmPci>
    8000285c:	00000097          	auipc	ra,0x0
    80002860:	e4c080e7          	jalr	-436(ra) # 800026a8 <_Z5printPKc>
}
    80002864:	02813083          	ld	ra,40(sp)
    80002868:	02013403          	ld	s0,32(sp)
    8000286c:	03010113          	addi	sp,sp,48
    80002870:	00008067          	ret

0000000080002874 <_Z7print_hm>:

void print_h(uint64 number) {
    80002874:	fd010113          	addi	sp,sp,-48
    80002878:	02113423          	sd	ra,40(sp)
    8000287c:	02813023          	sd	s0,32(sp)
    80002880:	03010413          	addi	s0,sp,48
    char buff[25] = {};
    80002884:	fc043823          	sd	zero,-48(s0)
    80002888:	fc043c23          	sd	zero,-40(s0)
    8000288c:	fe043023          	sd	zero,-32(s0)
    80002890:	fe040423          	sb	zero,-24(s0)
    print(stm::utos(number, buff, 16));
    80002894:	01000613          	li	a2,16
    80002898:	fd040593          	addi	a1,s0,-48
    8000289c:	fffff097          	auipc	ra,0xfffff
    800028a0:	450080e7          	jalr	1104(ra) # 80001cec <_ZN3stm4utosEmPci>
    800028a4:	00000097          	auipc	ra,0x0
    800028a8:	e04080e7          	jalr	-508(ra) # 800026a8 <_Z5printPKc>
    800028ac:	02813083          	ld	ra,40(sp)
    800028b0:	02013403          	ld	s0,32(sp)
    800028b4:	03010113          	addi	sp,sp,48
    800028b8:	00008067          	ret

00000000800028bc <_ZN8IOBuffer4initEv>:
void IOBuffer::init() {
    800028bc:	fe010113          	addi	sp,sp,-32
    800028c0:	00113c23          	sd	ra,24(sp)
    800028c4:	00813823          	sd	s0,16(sp)
    800028c8:	00913423          	sd	s1,8(sp)
    800028cc:	02010413          	addi	s0,sp,32
    800028d0:	00050493          	mv	s1,a0
    this->buffer.init();
    800028d4:	00000097          	auipc	ra,0x0
    800028d8:	1a0080e7          	jalr	416(ra) # 80002a74 <_ZN3stm14CircularBufferIcE4initEv>
    sem_open(&this->empty, 0);
    800028dc:	00000593          	li	a1,0
    800028e0:	01848513          	addi	a0,s1,24
    800028e4:	fffff097          	auipc	ra,0xfffff
    800028e8:	e58080e7          	jalr	-424(ra) # 8000173c <_Z8sem_openPP3Semj>
}
    800028ec:	01813083          	ld	ra,24(sp)
    800028f0:	01013403          	ld	s0,16(sp)
    800028f4:	00813483          	ld	s1,8(sp)
    800028f8:	02010113          	addi	sp,sp,32
    800028fc:	00008067          	ret

0000000080002900 <_ZN2IO4initEv>:
void IO::init() {
    80002900:	ff010113          	addi	sp,sp,-16
    80002904:	00113423          	sd	ra,8(sp)
    80002908:	00813023          	sd	s0,0(sp)
    8000290c:	01010413          	addi	s0,sp,16
    Input.init();
    80002910:	00008517          	auipc	a0,0x8
    80002914:	a5050513          	addi	a0,a0,-1456 # 8000a360 <_ZN2IO5InputE>
    80002918:	00000097          	auipc	ra,0x0
    8000291c:	fa4080e7          	jalr	-92(ra) # 800028bc <_ZN8IOBuffer4initEv>
    Output.init();
    80002920:	00008517          	auipc	a0,0x8
    80002924:	a6050513          	addi	a0,a0,-1440 # 8000a380 <_ZN2IO6OutputE>
    80002928:	00000097          	auipc	ra,0x0
    8000292c:	f94080e7          	jalr	-108(ra) # 800028bc <_ZN8IOBuffer4initEv>
}
    80002930:	00813083          	ld	ra,8(sp)
    80002934:	00013403          	ld	s0,0(sp)
    80002938:	01010113          	addi	sp,sp,16
    8000293c:	00008067          	ret

0000000080002940 <_ZN8IOBuffer3getEv>:
char IOBuffer::get() {
    80002940:	fe010113          	addi	sp,sp,-32
    80002944:	00113c23          	sd	ra,24(sp)
    80002948:	00813823          	sd	s0,16(sp)
    8000294c:	00913423          	sd	s1,8(sp)
    80002950:	02010413          	addi	s0,sp,32
    80002954:	00050493          	mv	s1,a0
    Sem::_sem_wait(this->empty);
    80002958:	01853503          	ld	a0,24(a0)
    8000295c:	00000097          	auipc	ra,0x0
    80002960:	a80080e7          	jalr	-1408(ra) # 800023dc <_ZN3Sem9_sem_waitEPS_>
    char ret = this->buffer.get();
    80002964:	00048513          	mv	a0,s1
    80002968:	00000097          	auipc	ra,0x0
    8000296c:	15c080e7          	jalr	348(ra) # 80002ac4 <_ZN3stm14CircularBufferIcE3getEv>
}
    80002970:	01813083          	ld	ra,24(sp)
    80002974:	01013403          	ld	s0,16(sp)
    80002978:	00813483          	ld	s1,8(sp)
    8000297c:	02010113          	addi	sp,sp,32
    80002980:	00008067          	ret

0000000080002984 <_ZN2IO5_getcEv>:
char IO::_getc() {
    80002984:	ff010113          	addi	sp,sp,-16
    80002988:	00113423          	sd	ra,8(sp)
    8000298c:	00813023          	sd	s0,0(sp)
    80002990:	01010413          	addi	s0,sp,16
    return Input.get();
    80002994:	00008517          	auipc	a0,0x8
    80002998:	9cc50513          	addi	a0,a0,-1588 # 8000a360 <_ZN2IO5InputE>
    8000299c:	00000097          	auipc	ra,0x0
    800029a0:	fa4080e7          	jalr	-92(ra) # 80002940 <_ZN8IOBuffer3getEv>
}
    800029a4:	00813083          	ld	ra,8(sp)
    800029a8:	00013403          	ld	s0,0(sp)
    800029ac:	01010113          	addi	sp,sp,16
    800029b0:	00008067          	ret

00000000800029b4 <_ZN8IOBuffer3putEc>:
void IOBuffer::put(char c) {
    800029b4:	fe010113          	addi	sp,sp,-32
    800029b8:	00113c23          	sd	ra,24(sp)
    800029bc:	00813823          	sd	s0,16(sp)
    800029c0:	00913423          	sd	s1,8(sp)
    800029c4:	02010413          	addi	s0,sp,32
    800029c8:	00050493          	mv	s1,a0
    this->buffer.put(c);
    800029cc:	00000097          	auipc	ra,0x0
    800029d0:	1e4080e7          	jalr	484(ra) # 80002bb0 <_ZN3stm14CircularBufferIcE3putEc>
    Sem::_sem_signal(this->empty);
    800029d4:	0184b503          	ld	a0,24(s1)
    800029d8:	00000097          	auipc	ra,0x0
    800029dc:	8bc080e7          	jalr	-1860(ra) # 80002294 <_ZN3Sem11_sem_signalEPS_>
}
    800029e0:	01813083          	ld	ra,24(sp)
    800029e4:	01013403          	ld	s0,16(sp)
    800029e8:	00813483          	ld	s1,8(sp)
    800029ec:	02010113          	addi	sp,sp,32
    800029f0:	00008067          	ret

00000000800029f4 <_ZN2IO5_putcEc>:
void IO::_putc(char c) {
    800029f4:	fe010113          	addi	sp,sp,-32
    800029f8:	00113c23          	sd	ra,24(sp)
    800029fc:	00813823          	sd	s0,16(sp)
    80002a00:	00913423          	sd	s1,8(sp)
    80002a04:	02010413          	addi	s0,sp,32
    if (c == 127) {
    80002a08:	07f00793          	li	a5,127
    80002a0c:	02f50663          	beq	a0,a5,80002a38 <_ZN2IO5_putcEc+0x44>
    80002a10:	00050593          	mv	a1,a0
        Output.put(c);
    80002a14:	00008517          	auipc	a0,0x8
    80002a18:	96c50513          	addi	a0,a0,-1684 # 8000a380 <_ZN2IO6OutputE>
    80002a1c:	00000097          	auipc	ra,0x0
    80002a20:	f98080e7          	jalr	-104(ra) # 800029b4 <_ZN8IOBuffer3putEc>
}
    80002a24:	01813083          	ld	ra,24(sp)
    80002a28:	01013403          	ld	s0,16(sp)
    80002a2c:	00813483          	ld	s1,8(sp)
    80002a30:	02010113          	addi	sp,sp,32
    80002a34:	00008067          	ret
        Output.put(8);
    80002a38:	00008497          	auipc	s1,0x8
    80002a3c:	94848493          	addi	s1,s1,-1720 # 8000a380 <_ZN2IO6OutputE>
    80002a40:	00800593          	li	a1,8
    80002a44:	00048513          	mv	a0,s1
    80002a48:	00000097          	auipc	ra,0x0
    80002a4c:	f6c080e7          	jalr	-148(ra) # 800029b4 <_ZN8IOBuffer3putEc>
        Output.put(' ');
    80002a50:	02000593          	li	a1,32
    80002a54:	00048513          	mv	a0,s1
    80002a58:	00000097          	auipc	ra,0x0
    80002a5c:	f5c080e7          	jalr	-164(ra) # 800029b4 <_ZN8IOBuffer3putEc>
        Output.put(8);
    80002a60:	00800593          	li	a1,8
    80002a64:	00048513          	mv	a0,s1
    80002a68:	00000097          	auipc	ra,0x0
    80002a6c:	f4c080e7          	jalr	-180(ra) # 800029b4 <_ZN8IOBuffer3putEc>
    80002a70:	fb5ff06f          	j	80002a24 <_ZN2IO5_putcEc+0x30>

0000000080002a74 <_ZN3stm14CircularBufferIcE4initEv>:
void stm::CircularBuffer<T>::init() {
    80002a74:	fe010113          	addi	sp,sp,-32
    80002a78:	00113c23          	sd	ra,24(sp)
    80002a7c:	00813823          	sd	s0,16(sp)
    80002a80:	00913423          	sd	s1,8(sp)
    80002a84:	02010413          	addi	s0,sp,32
    80002a88:	00050493          	mv	s1,a0
    this->head = 0;
    80002a8c:	00052423          	sw	zero,8(a0)
    this->tail = 0;
    80002a90:	00052623          	sw	zero,12(a0)
    this->size = 0;
    80002a94:	00052823          	sw	zero,16(a0)
    this->capacity = CAPACITY;
    80002a98:	01000793          	li	a5,16
    80002a9c:	00f52a23          	sw	a5,20(a0)
    this->queue = (T *) mem_alloc(sizeof(T) * CAPACITY);
    80002aa0:	01000513          	li	a0,16
    80002aa4:	fffff097          	auipc	ra,0xfffff
    80002aa8:	9f8080e7          	jalr	-1544(ra) # 8000149c <_Z9mem_allocm>
    80002aac:	00a4b023          	sd	a0,0(s1)
}
    80002ab0:	01813083          	ld	ra,24(sp)
    80002ab4:	01013403          	ld	s0,16(sp)
    80002ab8:	00813483          	ld	s1,8(sp)
    80002abc:	02010113          	addi	sp,sp,32
    80002ac0:	00008067          	ret

0000000080002ac4 <_ZN3stm14CircularBufferIcE3getEv>:
T stm::CircularBuffer<T>::get() {
    80002ac4:	ff010113          	addi	sp,sp,-16
    80002ac8:	00813423          	sd	s0,8(sp)
    80002acc:	01010413          	addi	s0,sp,16
    80002ad0:	00050793          	mv	a5,a0
    T ret = this->queue[this->head];
    80002ad4:	00053683          	ld	a3,0(a0)
    80002ad8:	00852703          	lw	a4,8(a0)
    80002adc:	00e686b3          	add	a3,a3,a4
    80002ae0:	0006c503          	lbu	a0,0(a3)
    this->head = (this->head + 1) % this->capacity;
    80002ae4:	0017071b          	addiw	a4,a4,1
    80002ae8:	0147a683          	lw	a3,20(a5)
    80002aec:	02d7673b          	remw	a4,a4,a3
    80002af0:	00e7a423          	sw	a4,8(a5)
    this->size--;
    80002af4:	0107a703          	lw	a4,16(a5)
    80002af8:	fff7071b          	addiw	a4,a4,-1
    80002afc:	00e7a823          	sw	a4,16(a5)
}
    80002b00:	00813403          	ld	s0,8(sp)
    80002b04:	01010113          	addi	sp,sp,16
    80002b08:	00008067          	ret

0000000080002b0c <_ZN3stm14CircularBufferIcE6extendEv>:
void stm::CircularBuffer<T>::extend() {
    80002b0c:	fe010113          	addi	sp,sp,-32
    80002b10:	00113c23          	sd	ra,24(sp)
    80002b14:	00813823          	sd	s0,16(sp)
    80002b18:	00913423          	sd	s1,8(sp)
    80002b1c:	01213023          	sd	s2,0(sp)
    80002b20:	02010413          	addi	s0,sp,32
    80002b24:	00050493          	mv	s1,a0
    T *new_queue = (T *) mem_alloc(sizeof(T *) * this->capacity * 2);
    80002b28:	01452503          	lw	a0,20(a0)
    80002b2c:	00451513          	slli	a0,a0,0x4
    80002b30:	fffff097          	auipc	ra,0xfffff
    80002b34:	96c080e7          	jalr	-1684(ra) # 8000149c <_Z9mem_allocm>
    80002b38:	00050913          	mv	s2,a0
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    80002b3c:	0084a783          	lw	a5,8(s1)
    80002b40:	00000713          	li	a4,0
    80002b44:	0144a683          	lw	a3,20(s1)
    80002b48:	02d75663          	bge	a4,a3,80002b74 <_ZN3stm14CircularBufferIcE6extendEv+0x68>
        new_queue[i] = this->queue[j];
    80002b4c:	0004b683          	ld	a3,0(s1)
    80002b50:	00e90633          	add	a2,s2,a4
    80002b54:	00f686b3          	add	a3,a3,a5
    80002b58:	0006c683          	lbu	a3,0(a3)
    80002b5c:	00d60023          	sb	a3,0(a2)
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
    80002b60:	0017071b          	addiw	a4,a4,1
    80002b64:	0017879b          	addiw	a5,a5,1
    80002b68:	0144a683          	lw	a3,20(s1)
    80002b6c:	02d7e7bb          	remw	a5,a5,a3
    80002b70:	fd5ff06f          	j	80002b44 <_ZN3stm14CircularBufferIcE6extendEv+0x38>
    mem_free(queue);
    80002b74:	0004b503          	ld	a0,0(s1)
    80002b78:	fffff097          	auipc	ra,0xfffff
    80002b7c:	96c080e7          	jalr	-1684(ra) # 800014e4 <_Z8mem_freePv>
    this->queue = new_queue;
    80002b80:	0124b023          	sd	s2,0(s1)
    this->head = 0;
    80002b84:	0004a423          	sw	zero,8(s1)
    this->tail = this->capacity;
    80002b88:	0144a783          	lw	a5,20(s1)
    80002b8c:	00f4a623          	sw	a5,12(s1)
    this->capacity *= 2;
    80002b90:	0017979b          	slliw	a5,a5,0x1
    80002b94:	00f4aa23          	sw	a5,20(s1)
}
    80002b98:	01813083          	ld	ra,24(sp)
    80002b9c:	01013403          	ld	s0,16(sp)
    80002ba0:	00813483          	ld	s1,8(sp)
    80002ba4:	00013903          	ld	s2,0(sp)
    80002ba8:	02010113          	addi	sp,sp,32
    80002bac:	00008067          	ret

0000000080002bb0 <_ZN3stm14CircularBufferIcE3putEc>:
void stm::CircularBuffer<T>::put(T element) {
    80002bb0:	fe010113          	addi	sp,sp,-32
    80002bb4:	00113c23          	sd	ra,24(sp)
    80002bb8:	00813823          	sd	s0,16(sp)
    80002bbc:	00913423          	sd	s1,8(sp)
    80002bc0:	01213023          	sd	s2,0(sp)
    80002bc4:	02010413          	addi	s0,sp,32
    80002bc8:	00050493          	mv	s1,a0
    80002bcc:	00058913          	mv	s2,a1
    if (this->size == this->capacity) {
    80002bd0:	01052703          	lw	a4,16(a0)
    80002bd4:	01452783          	lw	a5,20(a0)
    80002bd8:	04f70663          	beq	a4,a5,80002c24 <_ZN3stm14CircularBufferIcE3putEc+0x74>
    this->queue[this->tail] = element;
    80002bdc:	0004b783          	ld	a5,0(s1)
    80002be0:	00c4a703          	lw	a4,12(s1)
    80002be4:	00e787b3          	add	a5,a5,a4
    80002be8:	01278023          	sb	s2,0(a5)
    this->tail = (this->tail + 1) % this->capacity;
    80002bec:	00c4a783          	lw	a5,12(s1)
    80002bf0:	0017879b          	addiw	a5,a5,1
    80002bf4:	0144a703          	lw	a4,20(s1)
    80002bf8:	02e7e7bb          	remw	a5,a5,a4
    80002bfc:	00f4a623          	sw	a5,12(s1)
    this->size++;
    80002c00:	0104a783          	lw	a5,16(s1)
    80002c04:	0017879b          	addiw	a5,a5,1
    80002c08:	00f4a823          	sw	a5,16(s1)
}
    80002c0c:	01813083          	ld	ra,24(sp)
    80002c10:	01013403          	ld	s0,16(sp)
    80002c14:	00813483          	ld	s1,8(sp)
    80002c18:	00013903          	ld	s2,0(sp)
    80002c1c:	02010113          	addi	sp,sp,32
    80002c20:	00008067          	ret
        this->extend();
    80002c24:	00000097          	auipc	ra,0x0
    80002c28:	ee8080e7          	jalr	-280(ra) # 80002b0c <_ZN3stm14CircularBufferIcE6extendEv>
    80002c2c:	fb1ff06f          	j	80002bdc <_ZN3stm14CircularBufferIcE3putEc+0x2c>

0000000080002c30 <_ZN6Cradle4elemnwEm>:
#include "../h/scheduler.hpp"

Cradle::elem *Cradle::head = nullptr;
Cradle::elem *Cradle::tail = nullptr;

void *Cradle::elem::operator new(size_t size) {
    80002c30:	ff010113          	addi	sp,sp,-16
    80002c34:	00113423          	sd	ra,8(sp)
    80002c38:	00813023          	sd	s0,0(sp)
    80002c3c:	01010413          	addi	s0,sp,16
    return Allocator::_mem_alloc(size);
    80002c40:	00000097          	auipc	ra,0x0
    80002c44:	4c8080e7          	jalr	1224(ra) # 80003108 <_ZN9Allocator10_mem_allocEm>
}
    80002c48:	00813083          	ld	ra,8(sp)
    80002c4c:	00013403          	ld	s0,0(sp)
    80002c50:	01010113          	addi	sp,sp,16
    80002c54:	00008067          	ret

0000000080002c58 <_ZN6Cradle4elemdlEPv>:

void Cradle::elem::operator delete(void *mem) {
    80002c58:	ff010113          	addi	sp,sp,-16
    80002c5c:	00113423          	sd	ra,8(sp)
    80002c60:	00813023          	sd	s0,0(sp)
    80002c64:	01010413          	addi	s0,sp,16
    Allocator::_mem_free(mem);
    80002c68:	00000097          	auipc	ra,0x0
    80002c6c:	55c080e7          	jalr	1372(ra) # 800031c4 <_ZN9Allocator9_mem_freeEPKv>
}
    80002c70:	00813083          	ld	ra,8(sp)
    80002c74:	00013403          	ld	s0,0(sp)
    80002c78:	01010113          	addi	sp,sp,16
    80002c7c:	00008067          	ret

0000000080002c80 <_ZN6Cradle6insertEP3TCBm>:

void Cradle::insert(TCB *thread, time_t time) {
    80002c80:	fc010113          	addi	sp,sp,-64
    80002c84:	02113c23          	sd	ra,56(sp)
    80002c88:	02813823          	sd	s0,48(sp)
    80002c8c:	02913423          	sd	s1,40(sp)
    80002c90:	03213023          	sd	s2,32(sp)
    80002c94:	01313c23          	sd	s3,24(sp)
    80002c98:	01413823          	sd	s4,16(sp)
    80002c9c:	01513423          	sd	s5,8(sp)
    80002ca0:	04010413          	addi	s0,sp,64
    80002ca4:	00050a93          	mv	s5,a0
    80002ca8:	00058913          	mv	s2,a1
    if (head == nullptr) {
    80002cac:	00007797          	auipc	a5,0x7
    80002cb0:	6f47b783          	ld	a5,1780(a5) # 8000a3a0 <_ZN6Cradle4headE>
    80002cb4:	04078263          	beqz	a5,80002cf8 <_ZN6Cradle6insertEP3TCBm+0x78>
        head = tail = new elem(thread, time);
        return;
    } else if (time < head->time_left) {
    80002cb8:	0087b703          	ld	a4,8(a5)
    80002cbc:	06e5f663          	bgeu	a1,a4,80002d28 <_ZN6Cradle6insertEP3TCBm+0xa8>
        head = new elem(thread, time, head);
    80002cc0:	01800513          	li	a0,24
    80002cc4:	00000097          	auipc	ra,0x0
    80002cc8:	f6c080e7          	jalr	-148(ra) # 80002c30 <_ZN6Cradle4elemnwEm>
    80002ccc:	00007717          	auipc	a4,0x7
    80002cd0:	6d470713          	addi	a4,a4,1748 # 8000a3a0 <_ZN6Cradle4headE>
    80002cd4:	00073783          	ld	a5,0(a4)
    struct elem {
        void *operator new(size_t size);

        void operator delete(void *mem);

        elem(TCB *handle, time_t time, elem *next = nullptr) : handle(handle), time_left(time), next(next) {}
    80002cd8:	01553023          	sd	s5,0(a0)
    80002cdc:	01253423          	sd	s2,8(a0)
    80002ce0:	00f53823          	sd	a5,16(a0)
    80002ce4:	00a73023          	sd	a0,0(a4)
        head->next->time_left -= time;
    80002ce8:	0087b703          	ld	a4,8(a5)
    80002cec:	41270933          	sub	s2,a4,s2
    80002cf0:	0127b423          	sd	s2,8(a5)
        return;
    80002cf4:	0b40006f          	j	80002da8 <_ZN6Cradle6insertEP3TCBm+0x128>
        head = tail = new elem(thread, time);
    80002cf8:	01800513          	li	a0,24
    80002cfc:	00000097          	auipc	ra,0x0
    80002d00:	f34080e7          	jalr	-204(ra) # 80002c30 <_ZN6Cradle4elemnwEm>
    80002d04:	01553023          	sd	s5,0(a0)
    80002d08:	01253423          	sd	s2,8(a0)
    80002d0c:	00053823          	sd	zero,16(a0)
    80002d10:	00007797          	auipc	a5,0x7
    80002d14:	69078793          	addi	a5,a5,1680 # 8000a3a0 <_ZN6Cradle4headE>
    80002d18:	00a7b423          	sd	a0,8(a5)
    80002d1c:	00a7b023          	sd	a0,0(a5)
        return;
    80002d20:	0880006f          	j	80002da8 <_ZN6Cradle6insertEP3TCBm+0x128>
    }
    for (elem *curr = head; curr->next; curr = curr->next) {
        time -= curr->time_left;
    80002d24:	00048913          	mv	s2,s1
    for (elem *curr = head; curr->next; curr = curr->next) {
    80002d28:	00078993          	mv	s3,a5
    80002d2c:	0107b783          	ld	a5,16(a5)
    80002d30:	04078663          	beqz	a5,80002d7c <_ZN6Cradle6insertEP3TCBm+0xfc>
        time -= curr->time_left;
    80002d34:	0089ba03          	ld	s4,8(s3)
    80002d38:	414904b3          	sub	s1,s2,s4
        if (time < curr->next->time_left) {
    80002d3c:	0087b703          	ld	a4,8(a5)
    80002d40:	fee4f2e3          	bgeu	s1,a4,80002d24 <_ZN6Cradle6insertEP3TCBm+0xa4>
            curr->next = new elem(thread, time, curr->next);
    80002d44:	01800513          	li	a0,24
    80002d48:	00000097          	auipc	ra,0x0
    80002d4c:	ee8080e7          	jalr	-280(ra) # 80002c30 <_ZN6Cradle4elemnwEm>
    80002d50:	0109b783          	ld	a5,16(s3)
    80002d54:	01553023          	sd	s5,0(a0)
    80002d58:	00953423          	sd	s1,8(a0)
    80002d5c:	00f53823          	sd	a5,16(a0)
    80002d60:	00a9b823          	sd	a0,16(s3)
            curr->next->next->time_left -= time;
    80002d64:	01053783          	ld	a5,16(a0)
    80002d68:	412a0933          	sub	s2,s4,s2
    80002d6c:	0087ba03          	ld	s4,8(a5)
    80002d70:	012a0933          	add	s2,s4,s2
    80002d74:	0127b423          	sd	s2,8(a5)
            return;
    80002d78:	0300006f          	j	80002da8 <_ZN6Cradle6insertEP3TCBm+0x128>
        }
    }
    tail->next = new elem(thread, time);
    80002d7c:	01800513          	li	a0,24
    80002d80:	00000097          	auipc	ra,0x0
    80002d84:	eb0080e7          	jalr	-336(ra) # 80002c30 <_ZN6Cradle4elemnwEm>
    80002d88:	01553023          	sd	s5,0(a0)
    80002d8c:	01253423          	sd	s2,8(a0)
    80002d90:	00053823          	sd	zero,16(a0)
    80002d94:	00007797          	auipc	a5,0x7
    80002d98:	60c78793          	addi	a5,a5,1548 # 8000a3a0 <_ZN6Cradle4headE>
    80002d9c:	0087b703          	ld	a4,8(a5)
    80002da0:	00a73823          	sd	a0,16(a4)
    tail = tail->next;
    80002da4:	00a7b423          	sd	a0,8(a5)
}
    80002da8:	03813083          	ld	ra,56(sp)
    80002dac:	03013403          	ld	s0,48(sp)
    80002db0:	02813483          	ld	s1,40(sp)
    80002db4:	02013903          	ld	s2,32(sp)
    80002db8:	01813983          	ld	s3,24(sp)
    80002dbc:	01013a03          	ld	s4,16(sp)
    80002dc0:	00813a83          	ld	s5,8(sp)
    80002dc4:	04010113          	addi	sp,sp,64
    80002dc8:	00008067          	ret

0000000080002dcc <_ZN6Cradle6removeEv>:

TCB *Cradle::remove() {
    80002dcc:	fe010113          	addi	sp,sp,-32
    80002dd0:	00113c23          	sd	ra,24(sp)
    80002dd4:	00813823          	sd	s0,16(sp)
    80002dd8:	00913423          	sd	s1,8(sp)
    80002ddc:	02010413          	addi	s0,sp,32
    elem *old = head;
    80002de0:	00007797          	auipc	a5,0x7
    80002de4:	5c078793          	addi	a5,a5,1472 # 8000a3a0 <_ZN6Cradle4headE>
    80002de8:	0007b503          	ld	a0,0(a5)
    TCB *ret = old->handle;
    80002dec:	00053483          	ld	s1,0(a0)
    head = head->next;
    80002df0:	01053703          	ld	a4,16(a0)
    80002df4:	00e7b023          	sd	a4,0(a5)
    delete old;
    80002df8:	00050663          	beqz	a0,80002e04 <_ZN6Cradle6removeEv+0x38>
    80002dfc:	00000097          	auipc	ra,0x0
    80002e00:	e5c080e7          	jalr	-420(ra) # 80002c58 <_ZN6Cradle4elemdlEPv>
    return ret;
}
    80002e04:	00048513          	mv	a0,s1
    80002e08:	01813083          	ld	ra,24(sp)
    80002e0c:	01013403          	ld	s0,16(sp)
    80002e10:	00813483          	ld	s1,8(sp)
    80002e14:	02010113          	addi	sp,sp,32
    80002e18:	00008067          	ret

0000000080002e1c <_ZN6Cradle6updateEv>:

void Cradle::update() {
    80002e1c:	ff010113          	addi	sp,sp,-16
    80002e20:	00813423          	sd	s0,8(sp)
    80002e24:	01010413          	addi	s0,sp,16
    if (!head)
    80002e28:	00007797          	auipc	a5,0x7
    80002e2c:	5787b783          	ld	a5,1400(a5) # 8000a3a0 <_ZN6Cradle4headE>
    80002e30:	00078863          	beqz	a5,80002e40 <_ZN6Cradle6updateEv+0x24>
        return;
    head->time_left--;
    80002e34:	0087b703          	ld	a4,8(a5)
    80002e38:	fff70713          	addi	a4,a4,-1
    80002e3c:	00e7b423          	sd	a4,8(a5)
}
    80002e40:	00813403          	ld	s0,8(sp)
    80002e44:	01010113          	addi	sp,sp,16
    80002e48:	00008067          	ret

0000000080002e4c <_ZN6Cradle4peakEv>:

int Cradle::peak() {
    80002e4c:	ff010113          	addi	sp,sp,-16
    80002e50:	00813423          	sd	s0,8(sp)
    80002e54:	01010413          	addi	s0,sp,16
    if (head)
    80002e58:	00007797          	auipc	a5,0x7
    80002e5c:	5487b783          	ld	a5,1352(a5) # 8000a3a0 <_ZN6Cradle4headE>
    80002e60:	00078a63          	beqz	a5,80002e74 <_ZN6Cradle4peakEv+0x28>
        return head->time_left;
    80002e64:	0087a503          	lw	a0,8(a5)
    else
        return -1;
}
    80002e68:	00813403          	ld	s0,8(sp)
    80002e6c:	01010113          	addi	sp,sp,16
    80002e70:	00008067          	ret
        return -1;
    80002e74:	fff00513          	li	a0,-1
    80002e78:	ff1ff06f          	j	80002e68 <_ZN6Cradle4peakEv+0x1c>

0000000080002e7c <_ZN6Cradle8is_emptyEv>:

bool Cradle::is_empty() {
    80002e7c:	ff010113          	addi	sp,sp,-16
    80002e80:	00813423          	sd	s0,8(sp)
    80002e84:	01010413          	addi	s0,sp,16
    return head == nullptr;
}
    80002e88:	00007517          	auipc	a0,0x7
    80002e8c:	51853503          	ld	a0,1304(a0) # 8000a3a0 <_ZN6Cradle4headE>
    80002e90:	00153513          	seqz	a0,a0
    80002e94:	00813403          	ld	s0,8(sp)
    80002e98:	01010113          	addi	sp,sp,16
    80002e9c:	00008067          	ret

0000000080002ea0 <_ZN6Cradle11_time_sleepEm>:

int Cradle::_time_sleep(time_t ms) {
    80002ea0:	fe010113          	addi	sp,sp,-32
    80002ea4:	00113c23          	sd	ra,24(sp)
    80002ea8:	00813823          	sd	s0,16(sp)
    80002eac:	00913423          	sd	s1,8(sp)
    80002eb0:	02010413          	addi	s0,sp,32
    80002eb4:	00050593          	mv	a1,a0
    insert(TCB::running, ms);
    80002eb8:	00007497          	auipc	s1,0x7
    80002ebc:	4384b483          	ld	s1,1080(s1) # 8000a2f0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80002ec0:	0004b503          	ld	a0,0(s1)
    80002ec4:	00000097          	auipc	ra,0x0
    80002ec8:	dbc080e7          	jalr	-580(ra) # 80002c80 <_ZN6Cradle6insertEP3TCBm>
    TCB::running->sleep();
    80002ecc:	0004b783          	ld	a5,0(s1)

    void sleep() { this->status = SLEEPING; }
    80002ed0:	00200713          	li	a4,2
    80002ed4:	04e7a423          	sw	a4,72(a5)
    TCB::_thread_dispatch();
    80002ed8:	00002097          	auipc	ra,0x2
    80002edc:	d60080e7          	jalr	-672(ra) # 80004c38 <_ZN3TCB16_thread_dispatchEv>
    return 0;
}
    80002ee0:	00000513          	li	a0,0
    80002ee4:	01813083          	ld	ra,24(sp)
    80002ee8:	01013403          	ld	s0,16(sp)
    80002eec:	00813483          	ld	s1,8(sp)
    80002ef0:	02010113          	addi	sp,sp,32
    80002ef4:	00008067          	ret

0000000080002ef8 <_ZN6Cradle12_thread_wakeEP3TCB>:
    bool is_sleeping() const { return this->status == SLEEPING; }
    80002ef8:	04852703          	lw	a4,72(a0)

int Cradle::_thread_wake(thread_t thread) {
    if (!thread->is_sleeping())
    80002efc:	00200793          	li	a5,2
    80002f00:	02f71e63          	bne	a4,a5,80002f3c <_ZN6Cradle12_thread_wakeEP3TCB+0x44>
int Cradle::_thread_wake(thread_t thread) {
    80002f04:	ff010113          	addi	sp,sp,-16
    80002f08:	00113423          	sd	ra,8(sp)
    80002f0c:	00813023          	sd	s0,0(sp)
    80002f10:	01010413          	addi	s0,sp,16
    void run() { this->status = RUNNABLE; }
    80002f14:	04052423          	sw	zero,72(a0)
        return -1;
    thread->run();
    Scheduler::put(thread);
    80002f18:	00001097          	auipc	ra,0x1
    80002f1c:	3a8080e7          	jalr	936(ra) # 800042c0 <_ZN9Scheduler3putEP3TCB>
    TCB::_thread_dispatch();
    80002f20:	00002097          	auipc	ra,0x2
    80002f24:	d18080e7          	jalr	-744(ra) # 80004c38 <_ZN3TCB16_thread_dispatchEv>
    return 0;
    80002f28:	00000513          	li	a0,0
}
    80002f2c:	00813083          	ld	ra,8(sp)
    80002f30:	00013403          	ld	s0,0(sp)
    80002f34:	01010113          	addi	sp,sp,16
    80002f38:	00008067          	ret
        return -1;
    80002f3c:	fff00513          	li	a0,-1
}
    80002f40:	00008067          	ret

0000000080002f44 <_Z8userMainv>:
    void periodicActivation() override {
        cout << "Hello from periodic thread!" << endl;
    }
};

int userMain() {
    80002f44:	fe010113          	addi	sp,sp,-32
    80002f48:	00113c23          	sd	ra,24(sp)
    80002f4c:	00813823          	sd	s0,16(sp)
    80002f50:	00913423          	sd	s1,8(sp)
    80002f54:	01213023          	sd	s2,0(sp)
    80002f58:	02010413          	addi	s0,sp,32
//    sleeper2->start();
//    sleeper4->start();
//    sleeper1->join();
//    sleeper2->join();
//    sleeper4->join();
    Pthread *pthread = new Pthread(10);
    80002f5c:	02800513          	li	a0,40
    80002f60:	00001097          	auipc	ra,0x1
    80002f64:	9f0080e7          	jalr	-1552(ra) # 80003950 <_Znwm>
    80002f68:	00050493          	mv	s1,a0
    explicit Pthread(int period) : PeriodicThread(period) {}
    80002f6c:	00a00593          	li	a1,10
    80002f70:	00001097          	auipc	ra,0x1
    80002f74:	d78080e7          	jalr	-648(ra) # 80003ce8 <_ZN14PeriodicThreadC1Em>
    80002f78:	0200006f          	j	80002f98 <_Z8userMainv+0x54>
    80002f7c:	00050913          	mv	s2,a0
    Pthread *pthread = new Pthread(10);
    80002f80:	00048513          	mv	a0,s1
    80002f84:	00001097          	auipc	ra,0x1
    80002f88:	a1c080e7          	jalr	-1508(ra) # 800039a0 <_ZdlPv>
    80002f8c:	00090513          	mv	a0,s2
    80002f90:	00008097          	auipc	ra,0x8
    80002f94:	568080e7          	jalr	1384(ra) # 8000b4f8 <_Unwind_Resume>
    explicit Pthread(int period) : PeriodicThread(period) {}
    80002f98:	00007797          	auipc	a5,0x7
    80002f9c:	14078793          	addi	a5,a5,320 # 8000a0d8 <_ZTV7Pthread+0x10>
    80002fa0:	00f4b023          	sd	a5,0(s1)
    pthread->start();
    80002fa4:	00048513          	mv	a0,s1
    80002fa8:	00001097          	auipc	ra,0x1
    80002fac:	b40080e7          	jalr	-1216(ra) # 80003ae8 <_ZN6Thread5startEv>
    time_sleep(100);
    80002fb0:	06400513          	li	a0,100
    80002fb4:	fffff097          	auipc	ra,0xfffff
    80002fb8:	90c080e7          	jalr	-1780(ra) # 800018c0 <_Z10time_sleepm>
    pthread->terminate();
    80002fbc:	00048513          	mv	a0,s1
    80002fc0:	00001097          	auipc	ra,0x1
    80002fc4:	d00080e7          	jalr	-768(ra) # 80003cc0 <_ZN14PeriodicThread9terminateEv>
    pthread->join();
    80002fc8:	00048513          	mv	a0,s1
    80002fcc:	00001097          	auipc	ra,0x1
    80002fd0:	b54080e7          	jalr	-1196(ra) # 80003b20 <_ZN6Thread4joinEv>
    return 0;
    80002fd4:	00000513          	li	a0,0
    80002fd8:	01813083          	ld	ra,24(sp)
    80002fdc:	01013403          	ld	s0,16(sp)
    80002fe0:	00813483          	ld	s1,8(sp)
    80002fe4:	00013903          	ld	s2,0(sp)
    80002fe8:	02010113          	addi	sp,sp,32
    80002fec:	00008067          	ret

0000000080002ff0 <_ZN7Pthread18periodicActivationEv>:
    void periodicActivation() override {
    80002ff0:	ff010113          	addi	sp,sp,-16
    80002ff4:	00113423          	sd	ra,8(sp)
    80002ff8:	00813023          	sd	s0,0(sp)
    80002ffc:	01010413          	addi	s0,sp,16
        cout << "Hello from periodic thread!" << endl;
    80003000:	00005597          	auipc	a1,0x5
    80003004:	03858593          	addi	a1,a1,56 # 80008038 <CONSOLE_STATUS+0x28>
    80003008:	00007517          	auipc	a0,0x7
    8000300c:	30853503          	ld	a0,776(a0) # 8000a310 <_GLOBAL_OFFSET_TABLE_+0x98>
    80003010:	00000097          	auipc	ra,0x0
    80003014:	444080e7          	jalr	1092(ra) # 80003454 <_ZNK3stm7istreamlsEPKc>
    80003018:	00007597          	auipc	a1,0x7
    8000301c:	2c85b583          	ld	a1,712(a1) # 8000a2e0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003020:	00000097          	auipc	ra,0x0
    80003024:	5ec080e7          	jalr	1516(ra) # 8000360c <_ZNK3stm7istreamlsERKNS_7endlineE>
    }
    80003028:	00813083          	ld	ra,8(sp)
    8000302c:	00013403          	ld	s0,0(sp)
    80003030:	01010113          	addi	sp,sp,16
    80003034:	00008067          	ret

0000000080003038 <_ZN7PthreadD1Ev>:
class Pthread : public PeriodicThread {
    80003038:	ff010113          	addi	sp,sp,-16
    8000303c:	00113423          	sd	ra,8(sp)
    80003040:	00813023          	sd	s0,0(sp)
    80003044:	01010413          	addi	s0,sp,16
public:
    Mutex() : Semaphore(1) {}
};


class PeriodicThread : public Thread {
    80003048:	00007797          	auipc	a5,0x7
    8000304c:	2687b783          	ld	a5,616(a5) # 8000a2b0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003050:	01078793          	addi	a5,a5,16
    80003054:	00f53023          	sd	a5,0(a0)
    80003058:	00001097          	auipc	ra,0x1
    8000305c:	970080e7          	jalr	-1680(ra) # 800039c8 <_ZN6ThreadD1Ev>
    80003060:	00813083          	ld	ra,8(sp)
    80003064:	00013403          	ld	s0,0(sp)
    80003068:	01010113          	addi	sp,sp,16
    8000306c:	00008067          	ret

0000000080003070 <_ZN7PthreadD0Ev>:
    80003070:	fe010113          	addi	sp,sp,-32
    80003074:	00113c23          	sd	ra,24(sp)
    80003078:	00813823          	sd	s0,16(sp)
    8000307c:	00913423          	sd	s1,8(sp)
    80003080:	02010413          	addi	s0,sp,32
    80003084:	00050493          	mv	s1,a0
    80003088:	00007797          	auipc	a5,0x7
    8000308c:	2287b783          	ld	a5,552(a5) # 8000a2b0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003090:	01078793          	addi	a5,a5,16
    80003094:	00f53023          	sd	a5,0(a0)
    80003098:	00001097          	auipc	ra,0x1
    8000309c:	930080e7          	jalr	-1744(ra) # 800039c8 <_ZN6ThreadD1Ev>
    800030a0:	00048513          	mv	a0,s1
    800030a4:	00001097          	auipc	ra,0x1
    800030a8:	8fc080e7          	jalr	-1796(ra) # 800039a0 <_ZdlPv>
    800030ac:	01813083          	ld	ra,24(sp)
    800030b0:	01013403          	ld	s0,16(sp)
    800030b4:	00813483          	ld	s1,8(sp)
    800030b8:	02010113          	addi	sp,sp,32
    800030bc:	00008067          	ret

00000000800030c0 <_ZN9Allocator8mem_initEv>:
#include "../h/c_memory.hpp"
#include "../h/iostream.hpp"

Allocator::MemoryBlock *Allocator::free_pointer = nullptr;

void Allocator::mem_init() {
    800030c0:	ff010113          	addi	sp,sp,-16
    800030c4:	00813423          	sd	s0,8(sp)
    800030c8:	01010413          	addi	s0,sp,16
    Allocator::free_pointer = (Allocator::MemoryBlock *) HEAP_START_ADDR;
    800030cc:	00007797          	auipc	a5,0x7
    800030d0:	1dc7b783          	ld	a5,476(a5) # 8000a2a8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800030d4:	0007b703          	ld	a4,0(a5)
    800030d8:	00007797          	auipc	a5,0x7
    800030dc:	2ce7bc23          	sd	a4,728(a5) # 8000a3b0 <_ZN9Allocator12free_pointerE>
    *Allocator::free_pointer = {nullptr, reinterpret_cast<uint64>(HEAP_END_ADDR) -
    800030e0:	00007797          	auipc	a5,0x7
    800030e4:	2187b783          	ld	a5,536(a5) # 8000a2f8 <_GLOBAL_OFFSET_TABLE_+0x80>
    800030e8:	0007b783          	ld	a5,0(a5)
    800030ec:	40e787b3          	sub	a5,a5,a4
                                         reinterpret_cast<uint64>(HEAP_START_ADDR) - Allocator::HEADER_SIZE};
    800030f0:	ff078793          	addi	a5,a5,-16
    *Allocator::free_pointer = {nullptr, reinterpret_cast<uint64>(HEAP_END_ADDR) -
    800030f4:	00073023          	sd	zero,0(a4)
    800030f8:	00f73423          	sd	a5,8(a4)
}
    800030fc:	00813403          	ld	s0,8(sp)
    80003100:	01010113          	addi	sp,sp,16
    80003104:	00008067          	ret

0000000080003108 <_ZN9Allocator10_mem_allocEm>:

void *Allocator::_mem_alloc(size_t size) {
    80003108:	ff010113          	addi	sp,sp,-16
    8000310c:	00813423          	sd	s0,8(sp)
    80003110:	01010413          	addi	s0,sp,16
    80003114:	00050793          	mv	a5,a0
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    80003118:	00007517          	auipc	a0,0x7
    8000311c:	29853503          	ld	a0,664(a0) # 8000a3b0 <_ZN9Allocator12free_pointerE>
    if (available && available->size < size) {
    80003120:	02050863          	beqz	a0,80003150 <_ZN9Allocator10_mem_allocEm+0x48>
    80003124:	00853703          	ld	a4,8(a0)
    80003128:	02f77863          	bgeu	a4,a5,80003158 <_ZN9Allocator10_mem_allocEm+0x50>
        for (previous = available, available = available->next; available && available->size < size;
    8000312c:	00050693          	mv	a3,a0
    80003130:	00053503          	ld	a0,0(a0)
    80003134:	00c0006f          	j	80003140 <_ZN9Allocator10_mem_allocEm+0x38>
             previous = available, available = available->next);
    80003138:	00050693          	mv	a3,a0
    8000313c:	00053503          	ld	a0,0(a0)
        for (previous = available, available = available->next; available && available->size < size;
    80003140:	00050e63          	beqz	a0,8000315c <_ZN9Allocator10_mem_allocEm+0x54>
    80003144:	00853703          	ld	a4,8(a0)
    80003148:	fef768e3          	bltu	a4,a5,80003138 <_ZN9Allocator10_mem_allocEm+0x30>
    8000314c:	0100006f          	j	8000315c <_ZN9Allocator10_mem_allocEm+0x54>
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    80003150:	00050693          	mv	a3,a0
    80003154:	0080006f          	j	8000315c <_ZN9Allocator10_mem_allocEm+0x54>
    80003158:	00000693          	li	a3,0
    }
    if (!available) return nullptr;
    8000315c:	04050463          	beqz	a0,800031a4 <_ZN9Allocator10_mem_allocEm+0x9c>
    if (available->size > Allocator::HEADER_SIZE + size) {
    80003160:	00853703          	ld	a4,8(a0)
    80003164:	01078613          	addi	a2,a5,16
    80003168:	04e67463          	bgeu	a2,a4,800031b0 <_ZN9Allocator10_mem_allocEm+0xa8>
        uint64 next_size = available->size - size - Allocator::HEADER_SIZE;
    8000316c:	40f70733          	sub	a4,a4,a5
    80003170:	ff070713          	addi	a4,a4,-16
        available->size = size;
    80003174:	00f53423          	sd	a5,8(a0)
        next_node = reinterpret_cast<Allocator::MemoryBlock *>(reinterpret_cast<uint64>(available) +
                                                               Allocator::HEADER_SIZE + size);
    80003178:	00f507b3          	add	a5,a0,a5
    8000317c:	01078613          	addi	a2,a5,16
        next_node->next = available->next;
    80003180:	00053583          	ld	a1,0(a0)
    80003184:	00b7b823          	sd	a1,16(a5)
        next_node->size = next_size;
    80003188:	00e63423          	sd	a4,8(a2)
    } else {
        next_node = available->next;
    }
    available->next = reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(available) ^ available->size);
    8000318c:	00853783          	ld	a5,8(a0)
    80003190:	00f547b3          	xor	a5,a0,a5
    80003194:	00f53023          	sd	a5,0(a0)
    if (previous) previous->next = next_node;
    80003198:	02068063          	beqz	a3,800031b8 <_ZN9Allocator10_mem_allocEm+0xb0>
    8000319c:	00c6b023          	sd	a2,0(a3)
    else Allocator::free_pointer = next_node;
    return (void *) (available + 1);
    800031a0:	01050513          	addi	a0,a0,16
}
    800031a4:	00813403          	ld	s0,8(sp)
    800031a8:	01010113          	addi	sp,sp,16
    800031ac:	00008067          	ret
        next_node = available->next;
    800031b0:	00053603          	ld	a2,0(a0)
    800031b4:	fd9ff06f          	j	8000318c <_ZN9Allocator10_mem_allocEm+0x84>
    else Allocator::free_pointer = next_node;
    800031b8:	00007797          	auipc	a5,0x7
    800031bc:	1ec7bc23          	sd	a2,504(a5) # 8000a3b0 <_ZN9Allocator12free_pointerE>
    800031c0:	fe1ff06f          	j	800031a0 <_ZN9Allocator10_mem_allocEm+0x98>

00000000800031c4 <_ZN9Allocator9_mem_freeEPKv>:

int Allocator::_mem_free(const void *pointer) {
    800031c4:	ff010113          	addi	sp,sp,-16
    800031c8:	00813423          	sd	s0,8(sp)
    800031cc:	01010413          	addi	s0,sp,16
    Allocator::MemoryBlock *freed = (Allocator::MemoryBlock *) pointer - 1;
    800031d0:	ff050693          	addi	a3,a0,-16
    if (freed < HEAP_START_ADDR) return -1;
    800031d4:	00007797          	auipc	a5,0x7
    800031d8:	0d47b783          	ld	a5,212(a5) # 8000a2a8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800031dc:	0007b783          	ld	a5,0(a5)
    800031e0:	0cf6ec63          	bltu	a3,a5,800032b8 <_ZN9Allocator9_mem_freeEPKv+0xf4>
    if (freed->next != reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(freed) ^ freed->size)) return -2;
    800031e4:	ff053703          	ld	a4,-16(a0)
    800031e8:	ff853783          	ld	a5,-8(a0)
    800031ec:	00068813          	mv	a6,a3
    800031f0:	00d7c7b3          	xor	a5,a5,a3
    800031f4:	0cf71663          	bne	a4,a5,800032c0 <_ZN9Allocator9_mem_freeEPKv+0xfc>
    Allocator::MemoryBlock *previous = Allocator::free_pointer, *next_node;
    800031f8:	00007717          	auipc	a4,0x7
    800031fc:	1b873703          	ld	a4,440(a4) # 8000a3b0 <_ZN9Allocator12free_pointerE>
    if (freed < Allocator::free_pointer) {
    80003200:	04e6fe63          	bgeu	a3,a4,8000325c <_ZN9Allocator9_mem_freeEPKv+0x98>
        next_node = Allocator::free_pointer;
        Allocator::free_pointer = freed;
    80003204:	00007797          	auipc	a5,0x7
    80003208:	1ad7b623          	sd	a3,428(a5) # 8000a3b0 <_ZN9Allocator12free_pointerE>
        next_node = Allocator::free_pointer;
    8000320c:	00070793          	mv	a5,a4
        previous = nullptr;
    80003210:	00000713          	li	a4,0
inline bool Allocator::adjacent(Allocator::MemoryBlock *block1, Allocator::MemoryBlock *block2) {
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
}

inline void Allocator::merge(MemoryBlock *block1, MemoryBlock *block2) {
    if (!block1) return;
    80003214:	00068e63          	beqz	a3,80003230 <_ZN9Allocator9_mem_freeEPKv+0x6c>
    if (block2 && Allocator::adjacent(block1, block2)) {
    80003218:	00078a63          	beqz	a5,8000322c <_ZN9Allocator9_mem_freeEPKv+0x68>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    8000321c:	ff853583          	ld	a1,-8(a0)
    80003220:	00b68633          	add	a2,a3,a1
    80003224:	01060613          	addi	a2,a2,16
    if (block2 && Allocator::adjacent(block1, block2)) {
    80003228:	04f60a63          	beq	a2,a5,8000327c <_ZN9Allocator9_mem_freeEPKv+0xb8>
        block1->next = block2->next;
        block1->size += Allocator::HEADER_SIZE + block2->size;
    } else {
        block1->next = block2;
    8000322c:	fef53823          	sd	a5,-16(a0)
    if (!block1) return;
    80003230:	08070c63          	beqz	a4,800032c8 <_ZN9Allocator9_mem_freeEPKv+0x104>
    if (block2 && Allocator::adjacent(block1, block2)) {
    80003234:	00068a63          	beqz	a3,80003248 <_ZN9Allocator9_mem_freeEPKv+0x84>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    80003238:	00873603          	ld	a2,8(a4)
    8000323c:	00c707b3          	add	a5,a4,a2
    80003240:	01078793          	addi	a5,a5,16
    if (block2 && Allocator::adjacent(block1, block2)) {
    80003244:	04f80a63          	beq	a6,a5,80003298 <_ZN9Allocator9_mem_freeEPKv+0xd4>
        block1->next = block2;
    80003248:	00d73023          	sd	a3,0(a4)
    return 0;
    8000324c:	00000513          	li	a0,0
}
    80003250:	00813403          	ld	s0,8(sp)
    80003254:	01010113          	addi	sp,sp,16
    80003258:	00008067          	ret
        for (next_node = previous->next; next_node && !(previous < freed && next_node > freed);
    8000325c:	00073783          	ld	a5,0(a4)
    80003260:	00c0006f          	j	8000326c <_ZN9Allocator9_mem_freeEPKv+0xa8>
             previous = next_node, next_node = next_node->next);
    80003264:	00078713          	mv	a4,a5
    80003268:	0007b783          	ld	a5,0(a5)
        for (next_node = previous->next; next_node && !(previous < freed && next_node > freed);
    8000326c:	fa0784e3          	beqz	a5,80003214 <_ZN9Allocator9_mem_freeEPKv+0x50>
    80003270:	fed77ae3          	bgeu	a4,a3,80003264 <_ZN9Allocator9_mem_freeEPKv+0xa0>
    80003274:	fef6f8e3          	bgeu	a3,a5,80003264 <_ZN9Allocator9_mem_freeEPKv+0xa0>
    80003278:	f9dff06f          	j	80003214 <_ZN9Allocator9_mem_freeEPKv+0x50>
        block1->next = block2->next;
    8000327c:	0007b603          	ld	a2,0(a5)
    80003280:	fec53823          	sd	a2,-16(a0)
        block1->size += Allocator::HEADER_SIZE + block2->size;
    80003284:	0087b783          	ld	a5,8(a5)
    80003288:	00f585b3          	add	a1,a1,a5
    8000328c:	01058593          	addi	a1,a1,16
    80003290:	feb53c23          	sd	a1,-8(a0)
    80003294:	f9dff06f          	j	80003230 <_ZN9Allocator9_mem_freeEPKv+0x6c>
        block1->next = block2->next;
    80003298:	ff053783          	ld	a5,-16(a0)
    8000329c:	00f73023          	sd	a5,0(a4)
        block1->size += Allocator::HEADER_SIZE + block2->size;
    800032a0:	ff853783          	ld	a5,-8(a0)
    800032a4:	00f60633          	add	a2,a2,a5
    800032a8:	01060613          	addi	a2,a2,16
    800032ac:	00c73423          	sd	a2,8(a4)
    return 0;
    800032b0:	00000513          	li	a0,0
    800032b4:	f9dff06f          	j	80003250 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    if (freed < HEAP_START_ADDR) return -1;
    800032b8:	fff00513          	li	a0,-1
    800032bc:	f95ff06f          	j	80003250 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    if (freed->next != reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(freed) ^ freed->size)) return -2;
    800032c0:	ffe00513          	li	a0,-2
    800032c4:	f8dff06f          	j	80003250 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    return 0;
    800032c8:	00000513          	li	a0,0
    800032cc:	f85ff06f          	j	80003250 <_ZN9Allocator9_mem_freeEPKv+0x8c>

00000000800032d0 <_ZN9Allocator9mem_checkEv>:
    }
}

__attribute__((unused))
bool Allocator::mem_check() {
    800032d0:	ff010113          	addi	sp,sp,-16
    800032d4:	00813423          	sd	s0,8(sp)
    800032d8:	01010413          	addi	s0,sp,16
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    800032dc:	00007717          	auipc	a4,0x7
    800032e0:	0d473703          	ld	a4,212(a4) # 8000a3b0 <_ZN9Allocator12free_pointerE>
    800032e4:	00070793          	mv	a5,a4
    800032e8:	00073703          	ld	a4,0(a4)
    800032ec:	00070e63          	beqz	a4,80003308 <_ZN9Allocator9mem_checkEv+0x38>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    800032f0:	0087b683          	ld	a3,8(a5)
    800032f4:	00d787b3          	add	a5,a5,a3
    800032f8:	01078793          	addi	a5,a5,16
        if (Allocator::adjacent(curr, curr->next)) return false;
    800032fc:	fee794e3          	bne	a5,a4,800032e4 <_ZN9Allocator9mem_checkEv+0x14>
    80003300:	00000513          	li	a0,0
    80003304:	0080006f          	j	8000330c <_ZN9Allocator9mem_checkEv+0x3c>
    }
    return true;
    80003308:	00100513          	li	a0,1
}
    8000330c:	00813403          	ld	s0,8(sp)
    80003310:	01010113          	addi	sp,sp,16
    80003314:	00008067          	ret

0000000080003318 <_ZN9Allocator8mem_showEv>:

__attribute__((unused))
void Allocator::mem_show() {
    80003318:	fe010113          	addi	sp,sp,-32
    8000331c:	00113c23          	sd	ra,24(sp)
    80003320:	00813823          	sd	s0,16(sp)
    80003324:	00913423          	sd	s1,8(sp)
    80003328:	02010413          	addi	s0,sp,32
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    8000332c:	00007497          	auipc	s1,0x7
    80003330:	0844b483          	ld	s1,132(s1) # 8000a3b0 <_ZN9Allocator12free_pointerE>
    80003334:	0004b783          	ld	a5,0(s1)
    80003338:	04078e63          	beqz	a5,80003394 <_ZN9Allocator8mem_showEv+0x7c>
        stm::cout << curr << stm::endl << curr->next << stm::endl << stm::endl;
    8000333c:	00048593          	mv	a1,s1
    80003340:	00007517          	auipc	a0,0x7
    80003344:	fd053503          	ld	a0,-48(a0) # 8000a310 <_GLOBAL_OFFSET_TABLE_+0x98>
    80003348:	00000097          	auipc	ra,0x0
    8000334c:	238080e7          	jalr	568(ra) # 80003580 <_ZNK3stm7istreamlsEPv>
    80003350:	00007597          	auipc	a1,0x7
    80003354:	f905b583          	ld	a1,-112(a1) # 8000a2e0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003358:	00000097          	auipc	ra,0x0
    8000335c:	2b4080e7          	jalr	692(ra) # 8000360c <_ZNK3stm7istreamlsERKNS_7endlineE>
    80003360:	0004b583          	ld	a1,0(s1)
    80003364:	00000097          	auipc	ra,0x0
    80003368:	21c080e7          	jalr	540(ra) # 80003580 <_ZNK3stm7istreamlsEPv>
    8000336c:	00007597          	auipc	a1,0x7
    80003370:	f745b583          	ld	a1,-140(a1) # 8000a2e0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003374:	00000097          	auipc	ra,0x0
    80003378:	298080e7          	jalr	664(ra) # 8000360c <_ZNK3stm7istreamlsERKNS_7endlineE>
    8000337c:	00007597          	auipc	a1,0x7
    80003380:	f645b583          	ld	a1,-156(a1) # 8000a2e0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003384:	00000097          	auipc	ra,0x0
    80003388:	288080e7          	jalr	648(ra) # 8000360c <_ZNK3stm7istreamlsERKNS_7endlineE>
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    8000338c:	0004b483          	ld	s1,0(s1)
    80003390:	fa5ff06f          	j	80003334 <_ZN9Allocator8mem_showEv+0x1c>
    }
}
    80003394:	01813083          	ld	ra,24(sp)
    80003398:	01013403          	ld	s0,16(sp)
    8000339c:	00813483          	ld	s1,8(sp)
    800033a0:	02010113          	addi	sp,sp,32
    800033a4:	00008067          	ret

00000000800033a8 <_ZN9Allocator8mem_sizeEv>:

__attribute__((unused))
int Allocator::mem_size() {
    800033a8:	ff010113          	addi	sp,sp,-16
    800033ac:	00813423          	sd	s0,8(sp)
    800033b0:	01010413          	addi	s0,sp,16
    int i = 0;
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr; i += curr->size, curr = curr->next);
    800033b4:	00007797          	auipc	a5,0x7
    800033b8:	ffc7b783          	ld	a5,-4(a5) # 8000a3b0 <_ZN9Allocator12free_pointerE>
    int i = 0;
    800033bc:	00000513          	li	a0,0
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr; i += curr->size, curr = curr->next);
    800033c0:	00078a63          	beqz	a5,800033d4 <_ZN9Allocator8mem_sizeEv+0x2c>
    800033c4:	0087b703          	ld	a4,8(a5)
    800033c8:	00a7053b          	addw	a0,a4,a0
    800033cc:	0007b783          	ld	a5,0(a5)
    800033d0:	ff1ff06f          	j	800033c0 <_ZN9Allocator8mem_sizeEv+0x18>
    return i;
}
    800033d4:	00813403          	ld	s0,8(sp)
    800033d8:	01010113          	addi	sp,sp,16
    800033dc:	00008067          	ret

00000000800033e0 <_Z6memcpyPKvS0_i>:

void memcpy(const void *src, const void *dst, int len) {
    800033e0:	ff010113          	addi	sp,sp,-16
    800033e4:	00813423          	sd	s0,8(sp)
    800033e8:	01010413          	addi	s0,sp,16
    char *src1 = (char *) src;
    char *dst1 = (char *) dst;
    for (int i = 0; i < len; i++)
    800033ec:	00000793          	li	a5,0
    800033f0:	00c7de63          	bge	a5,a2,8000340c <_Z6memcpyPKvS0_i+0x2c>
        dst1[i] = src1[i];
    800033f4:	00f58733          	add	a4,a1,a5
    800033f8:	00f506b3          	add	a3,a0,a5
    800033fc:	0006c683          	lbu	a3,0(a3)
    80003400:	00d70023          	sb	a3,0(a4)
    for (int i = 0; i < len; i++)
    80003404:	0017879b          	addiw	a5,a5,1
    80003408:	fe9ff06f          	j	800033f0 <_Z6memcpyPKvS0_i+0x10>
    8000340c:	00813403          	ld	s0,8(sp)
    80003410:	01010113          	addi	sp,sp,16
    80003414:	00008067          	ret

0000000080003418 <_ZNK3stm7istreamlsEc>:
#include "../h/string.hpp"

const stm::istream stm::cout;
const stm::endline stm::endl;

const stm::istream &stm::istream::operator<<(const char c) const {
    80003418:	fe010113          	addi	sp,sp,-32
    8000341c:	00113c23          	sd	ra,24(sp)
    80003420:	00813823          	sd	s0,16(sp)
    80003424:	00913423          	sd	s1,8(sp)
    80003428:	02010413          	addi	s0,sp,32
    8000342c:	00050493          	mv	s1,a0
    putc(c);
    80003430:	00058513          	mv	a0,a1
    80003434:	ffffe097          	auipc	ra,0xffffe
    80003438:	558080e7          	jalr	1368(ra) # 8000198c <_Z4putcc>
    return *this;
}
    8000343c:	00048513          	mv	a0,s1
    80003440:	01813083          	ld	ra,24(sp)
    80003444:	01013403          	ld	s0,16(sp)
    80003448:	00813483          	ld	s1,8(sp)
    8000344c:	02010113          	addi	sp,sp,32
    80003450:	00008067          	ret

0000000080003454 <_ZNK3stm7istreamlsEPKc>:

const stm::istream &stm::istream::operator<<(const char *string) const {
    80003454:	fe010113          	addi	sp,sp,-32
    80003458:	00113c23          	sd	ra,24(sp)
    8000345c:	00813823          	sd	s0,16(sp)
    80003460:	00913423          	sd	s1,8(sp)
    80003464:	02010413          	addi	s0,sp,32
    80003468:	00050493          	mv	s1,a0
    print(string);
    8000346c:	00058513          	mv	a0,a1
    80003470:	fffff097          	auipc	ra,0xfffff
    80003474:	238080e7          	jalr	568(ra) # 800026a8 <_Z5printPKc>
    return *this;
}
    80003478:	00048513          	mv	a0,s1
    8000347c:	01813083          	ld	ra,24(sp)
    80003480:	01013403          	ld	s0,16(sp)
    80003484:	00813483          	ld	s1,8(sp)
    80003488:	02010113          	addi	sp,sp,32
    8000348c:	00008067          	ret

0000000080003490 <_ZNK3stm7istreamlsERKNS_6stringE>:

const stm::istream &stm::istream::operator<<(const stm::string &string) const {
    80003490:	fe010113          	addi	sp,sp,-32
    80003494:	00113c23          	sd	ra,24(sp)
    80003498:	00813823          	sd	s0,16(sp)
    8000349c:	00913423          	sd	s1,8(sp)
    800034a0:	02010413          	addi	s0,sp,32
    800034a4:	00050493          	mv	s1,a0
    print(string.actual_string);
    800034a8:	0085b503          	ld	a0,8(a1)
    800034ac:	fffff097          	auipc	ra,0xfffff
    800034b0:	1fc080e7          	jalr	508(ra) # 800026a8 <_Z5printPKc>
    return *this;
}
    800034b4:	00048513          	mv	a0,s1
    800034b8:	01813083          	ld	ra,24(sp)
    800034bc:	01013403          	ld	s0,16(sp)
    800034c0:	00813483          	ld	s1,8(sp)
    800034c4:	02010113          	addi	sp,sp,32
    800034c8:	00008067          	ret

00000000800034cc <_ZNK3stm7istreamlsEx>:

const stm::istream &stm::istream::operator<<(long long number) const {
    800034cc:	fe010113          	addi	sp,sp,-32
    800034d0:	00113c23          	sd	ra,24(sp)
    800034d4:	00813823          	sd	s0,16(sp)
    800034d8:	00913423          	sd	s1,8(sp)
    800034dc:	02010413          	addi	s0,sp,32
    800034e0:	00050493          	mv	s1,a0
    print(number);
    800034e4:	00058513          	mv	a0,a1
    800034e8:	fffff097          	auipc	ra,0xfffff
    800034ec:	2d4080e7          	jalr	724(ra) # 800027bc <_Z5printx>
    return *this;
}
    800034f0:	00048513          	mv	a0,s1
    800034f4:	01813083          	ld	ra,24(sp)
    800034f8:	01013403          	ld	s0,16(sp)
    800034fc:	00813483          	ld	s1,8(sp)
    80003500:	02010113          	addi	sp,sp,32
    80003504:	00008067          	ret

0000000080003508 <_ZNK3stm7istreamlsEi>:

const stm::istream &stm::istream::operator<<(int number) const {
    80003508:	fe010113          	addi	sp,sp,-32
    8000350c:	00113c23          	sd	ra,24(sp)
    80003510:	00813823          	sd	s0,16(sp)
    80003514:	00913423          	sd	s1,8(sp)
    80003518:	02010413          	addi	s0,sp,32
    8000351c:	00050493          	mv	s1,a0
    print(number);
    80003520:	00058513          	mv	a0,a1
    80003524:	fffff097          	auipc	ra,0xfffff
    80003528:	2e0080e7          	jalr	736(ra) # 80002804 <_Z5printi>
    return *this;
}
    8000352c:	00048513          	mv	a0,s1
    80003530:	01813083          	ld	ra,24(sp)
    80003534:	01013403          	ld	s0,16(sp)
    80003538:	00813483          	ld	s1,8(sp)
    8000353c:	02010113          	addi	sp,sp,32
    80003540:	00008067          	ret

0000000080003544 <_ZNK3stm7istreamlsEm>:

const stm::istream &stm::istream::operator<<(uint64 number) const {
    80003544:	fe010113          	addi	sp,sp,-32
    80003548:	00113c23          	sd	ra,24(sp)
    8000354c:	00813823          	sd	s0,16(sp)
    80003550:	00913423          	sd	s1,8(sp)
    80003554:	02010413          	addi	s0,sp,32
    80003558:	00050493          	mv	s1,a0
    print(number);
    8000355c:	00058513          	mv	a0,a1
    80003560:	fffff097          	auipc	ra,0xfffff
    80003564:	2cc080e7          	jalr	716(ra) # 8000282c <_Z5printm>
    return *this;
}
    80003568:	00048513          	mv	a0,s1
    8000356c:	01813083          	ld	ra,24(sp)
    80003570:	01013403          	ld	s0,16(sp)
    80003574:	00813483          	ld	s1,8(sp)
    80003578:	02010113          	addi	sp,sp,32
    8000357c:	00008067          	ret

0000000080003580 <_ZNK3stm7istreamlsEPv>:

const stm::istream &stm::istream::operator<<(void *pointer) const {
    80003580:	fe010113          	addi	sp,sp,-32
    80003584:	00113c23          	sd	ra,24(sp)
    80003588:	00813823          	sd	s0,16(sp)
    8000358c:	00913423          	sd	s1,8(sp)
    80003590:	02010413          	addi	s0,sp,32
    80003594:	00050493          	mv	s1,a0
    print_h((uint64) pointer);
    80003598:	00058513          	mv	a0,a1
    8000359c:	fffff097          	auipc	ra,0xfffff
    800035a0:	2d8080e7          	jalr	728(ra) # 80002874 <_Z7print_hm>
    return *this;
}
    800035a4:	00048513          	mv	a0,s1
    800035a8:	01813083          	ld	ra,24(sp)
    800035ac:	01013403          	ld	s0,16(sp)
    800035b0:	00813483          	ld	s1,8(sp)
    800035b4:	02010113          	addi	sp,sp,32
    800035b8:	00008067          	ret

00000000800035bc <_ZNK3stm7istreamlsEb>:

const stm::istream &stm::istream::operator<<(bool truth) const {
    800035bc:	fe010113          	addi	sp,sp,-32
    800035c0:	00113c23          	sd	ra,24(sp)
    800035c4:	00813823          	sd	s0,16(sp)
    800035c8:	00913423          	sd	s1,8(sp)
    800035cc:	02010413          	addi	s0,sp,32
    800035d0:	00050493          	mv	s1,a0
    print(truth ? "true" : "false");
    800035d4:	02058663          	beqz	a1,80003600 <_ZNK3stm7istreamlsEb+0x44>
    800035d8:	00005517          	auipc	a0,0x5
    800035dc:	a8850513          	addi	a0,a0,-1400 # 80008060 <CONSOLE_STATUS+0x50>
    800035e0:	fffff097          	auipc	ra,0xfffff
    800035e4:	0c8080e7          	jalr	200(ra) # 800026a8 <_Z5printPKc>
    return *this;
}
    800035e8:	00048513          	mv	a0,s1
    800035ec:	01813083          	ld	ra,24(sp)
    800035f0:	01013403          	ld	s0,16(sp)
    800035f4:	00813483          	ld	s1,8(sp)
    800035f8:	02010113          	addi	sp,sp,32
    800035fc:	00008067          	ret
    print(truth ? "true" : "false");
    80003600:	00005517          	auipc	a0,0x5
    80003604:	a5850513          	addi	a0,a0,-1448 # 80008058 <CONSOLE_STATUS+0x48>
    80003608:	fd9ff06f          	j	800035e0 <_ZNK3stm7istreamlsEb+0x24>

000000008000360c <_ZNK3stm7istreamlsERKNS_7endlineE>:

const stm::istream &stm::istream::operator<<(const stm::endline &) const {
    8000360c:	fe010113          	addi	sp,sp,-32
    80003610:	00113c23          	sd	ra,24(sp)
    80003614:	00813823          	sd	s0,16(sp)
    80003618:	00913423          	sd	s1,8(sp)
    8000361c:	02010413          	addi	s0,sp,32
    80003620:	00050493          	mv	s1,a0
    putc('\n');
    80003624:	00a00513          	li	a0,10
    80003628:	ffffe097          	auipc	ra,0xffffe
    8000362c:	364080e7          	jalr	868(ra) # 8000198c <_Z4putcc>
    return *this;
}
    80003630:	00048513          	mv	a0,s1
    80003634:	01813083          	ld	ra,24(sp)
    80003638:	01013403          	ld	s0,16(sp)
    8000363c:	00813483          	ld	s1,8(sp)
    80003640:	02010113          	addi	sp,sp,32
    80003644:	00008067          	ret

0000000080003648 <_Z9bleya_nitPv>:
#include "../h/cpp_semaphores.hpp"
#include "../h/scheduler.hpp"
#include "../h/iostream.hpp"

[[noreturn]]
void bleya_nit(void *) {
    80003648:	ff010113          	addi	sp,sp,-16
    8000364c:	00813423          	sd	s0,8(sp)
    80003650:	01010413          	addi	s0,sp,16
    while (true) {
    80003654:	0000006f          	j	80003654 <_Z9bleya_nitPv+0xc>

0000000080003658 <_Z11userWrapperPv>:
    thread_create(&handle_main, nullptr, nullptr);
    thread_create(&handle_bleya, &bleya_nit, nullptr);
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
}

void userWrapper(void *ret) {
    80003658:	fe010113          	addi	sp,sp,-32
    8000365c:	00113c23          	sd	ra,24(sp)
    80003660:	00813823          	sd	s0,16(sp)
    80003664:	00913423          	sd	s1,8(sp)
    80003668:	02010413          	addi	s0,sp,32
    8000366c:	00050493          	mv	s1,a0
    *((int *) ret) = userMain();
    80003670:	00000097          	auipc	ra,0x0
    80003674:	8d4080e7          	jalr	-1836(ra) # 80002f44 <_Z8userMainv>
    80003678:	00a4a023          	sw	a0,0(s1)
}
    8000367c:	01813083          	ld	ra,24(sp)
    80003680:	01013403          	ld	s0,16(sp)
    80003684:	00813483          	ld	s1,8(sp)
    80003688:	02010113          	addi	sp,sp,32
    8000368c:	00008067          	ret

0000000080003690 <_Z4callv>:

int call() {
    80003690:	fe010113          	addi	sp,sp,-32
    80003694:	00113c23          	sd	ra,24(sp)
    80003698:	00813823          	sd	s0,16(sp)
    8000369c:	02010413          	addi	s0,sp,32
    thread_t userHandle;
    int ret;
    thread_create(&userHandle, userWrapper, &ret);
    800036a0:	fe440613          	addi	a2,s0,-28
    800036a4:	00000597          	auipc	a1,0x0
    800036a8:	fb458593          	addi	a1,a1,-76 # 80003658 <_Z11userWrapperPv>
    800036ac:	fe840513          	addi	a0,s0,-24
    800036b0:	ffffe097          	auipc	ra,0xffffe
    800036b4:	e74080e7          	jalr	-396(ra) # 80001524 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_join(userHandle);
    800036b8:	fe843503          	ld	a0,-24(s0)
    800036bc:	ffffe097          	auipc	ra,0xffffe
    800036c0:	f60080e7          	jalr	-160(ra) # 8000161c <_Z11thread_joinP3TCB>
    return ret;
}
    800036c4:	fe442503          	lw	a0,-28(s0)
    800036c8:	01813083          	ld	ra,24(sp)
    800036cc:	01013403          	ld	s0,16(sp)
    800036d0:	02010113          	addi	sp,sp,32
    800036d4:	00008067          	ret

00000000800036d8 <_Z3endi>:

int end(int ret) {
    800036d8:	fe010113          	addi	sp,sp,-32
    800036dc:	00113c23          	sd	ra,24(sp)
    800036e0:	00813823          	sd	s0,16(sp)
    800036e4:	00913423          	sd	s1,8(sp)
    800036e8:	02010413          	addi	s0,sp,32
    800036ec:	00050493          	mv	s1,a0
    print("\n\nProcess finished with exit code ");
    800036f0:	00005517          	auipc	a0,0x5
    800036f4:	98850513          	addi	a0,a0,-1656 # 80008078 <_ZN3stm4coutE+0x8>
    800036f8:	fffff097          	auipc	ra,0xfffff
    800036fc:	fb0080e7          	jalr	-80(ra) # 800026a8 <_Z5printPKc>
    print(ret);
    80003700:	00048513          	mv	a0,s1
    80003704:	fffff097          	auipc	ra,0xfffff
    80003708:	100080e7          	jalr	256(ra) # 80002804 <_Z5printi>
    print("\n\n");
    8000370c:	00005517          	auipc	a0,0x5
    80003710:	99450513          	addi	a0,a0,-1644 # 800080a0 <_ZN3stm4coutE+0x30>
    80003714:	fffff097          	auipc	ra,0xfffff
    80003718:	f94080e7          	jalr	-108(ra) # 800026a8 <_Z5printPKc>
        inline bool is_empty() const { return this->size == 0; }
    8000371c:	00007797          	auipc	a5,0x7
    80003720:	b6c7b783          	ld	a5,-1172(a5) # 8000a288 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003724:	0107a783          	lw	a5,16(a5)
    while (!IO::Output.is_empty());
    80003728:	fe079ae3          	bnez	a5,8000371c <_Z3endi+0x44>
    time_sleep(10);
    8000372c:	00a00513          	li	a0,10
    80003730:	ffffe097          	auipc	ra,0xffffe
    80003734:	190080e7          	jalr	400(ra) # 800018c0 <_Z10time_sleepm>
    return 0;
}
    80003738:	00000513          	li	a0,0
    8000373c:	01813083          	ld	ra,24(sp)
    80003740:	01013403          	ld	s0,16(sp)
    80003744:	00813483          	ld	s1,8(sp)
    80003748:	02010113          	addi	sp,sp,32
    8000374c:	00008067          	ret

0000000080003750 <main>:

int main() {
    80003750:	ff010113          	addi	sp,sp,-16
    80003754:	00113423          	sd	ra,8(sp)
    80003758:	00813023          	sd	s0,0(sp)
    8000375c:	01010413          	addi	s0,sp,16
    init();
    80003760:	00000097          	auipc	ra,0x0
    80003764:	028080e7          	jalr	40(ra) # 80003788 <_Z4initv>
    int ret = call();
    80003768:	00000097          	auipc	ra,0x0
    8000376c:	f28080e7          	jalr	-216(ra) # 80003690 <_Z4callv>
    return end(ret);
    80003770:	00000097          	auipc	ra,0x0
    80003774:	f68080e7          	jalr	-152(ra) # 800036d8 <_Z3endi>
    80003778:	00813083          	ld	ra,8(sp)
    8000377c:	00013403          	ld	s0,0(sp)
    80003780:	01010113          	addi	sp,sp,16
    80003784:	00008067          	ret

0000000080003788 <_Z4initv>:
inline void init() {
    80003788:	fd010113          	addi	sp,sp,-48
    8000378c:	02113423          	sd	ra,40(sp)
    80003790:	02813023          	sd	s0,32(sp)
    80003794:	00913c23          	sd	s1,24(sp)
    80003798:	01213823          	sd	s2,16(sp)
    8000379c:	03010413          	addi	s0,sp,48
    __asm__ volatile("mv t0, %0": : "r" (&supervisorTrap));
    800037a0:	00007797          	auipc	a5,0x7
    800037a4:	b187b783          	ld	a5,-1256(a5) # 8000a2b8 <_GLOBAL_OFFSET_TABLE_+0x40>
    800037a8:	00078293          	mv	t0,a5
    __asm__ volatile("addi t0, t0, 1");
    800037ac:	00128293          	addi	t0,t0,1
    __asm__ volatile("csrw stvec, t0");
    800037b0:	10529073          	csrw	stvec,t0
    Allocator::mem_init();
    800037b4:	00000097          	auipc	ra,0x0
    800037b8:	90c080e7          	jalr	-1780(ra) # 800030c0 <_ZN9Allocator8mem_initEv>
    IO::init();
    800037bc:	fffff097          	auipc	ra,0xfffff
    800037c0:	144080e7          	jalr	324(ra) # 80002900 <_ZN2IO4initEv>
#include "syscall_c.hpp"

class Scheduler final {
public:

    static void init() { high_priority.init(); mid_priority.init(); low_priority.init(); }
    800037c4:	00007517          	auipc	a0,0x7
    800037c8:	b4453503          	ld	a0,-1212(a0) # 8000a308 <_GLOBAL_OFFSET_TABLE_+0x90>
    800037cc:	fffff097          	auipc	ra,0xfffff
    800037d0:	ce4080e7          	jalr	-796(ra) # 800024b0 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    800037d4:	00007517          	auipc	a0,0x7
    800037d8:	b1453503          	ld	a0,-1260(a0) # 8000a2e8 <_GLOBAL_OFFSET_TABLE_+0x70>
    800037dc:	fffff097          	auipc	ra,0xfffff
    800037e0:	cd4080e7          	jalr	-812(ra) # 800024b0 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    800037e4:	00007517          	auipc	a0,0x7
    800037e8:	adc53503          	ld	a0,-1316(a0) # 8000a2c0 <_GLOBAL_OFFSET_TABLE_+0x48>
    800037ec:	fffff097          	auipc	ra,0xfffff
    800037f0:	cc4080e7          	jalr	-828(ra) # 800024b0 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    printer = new OwnedMutex();
    800037f4:	02000513          	li	a0,32
    800037f8:	00000097          	auipc	ra,0x0
    800037fc:	158080e7          	jalr	344(ra) # 80003950 <_Znwm>
    80003800:	00050493          	mv	s1,a0
    80003804:	00001097          	auipc	ra,0x1
    80003808:	d00080e7          	jalr	-768(ra) # 80004504 <_ZN10OwnedMutexC1Ev>
    8000380c:	00007797          	auipc	a5,0x7
    80003810:	ba97b623          	sd	s1,-1108(a5) # 8000a3b8 <printer>
    thread_create(&handle_main, nullptr, nullptr);
    80003814:	00000613          	li	a2,0
    80003818:	00000593          	li	a1,0
    8000381c:	fd840513          	addi	a0,s0,-40
    80003820:	ffffe097          	auipc	ra,0xffffe
    80003824:	d04080e7          	jalr	-764(ra) # 80001524 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&handle_bleya, &bleya_nit, nullptr);
    80003828:	00000613          	li	a2,0
    8000382c:	00000597          	auipc	a1,0x0
    80003830:	e1c58593          	addi	a1,a1,-484 # 80003648 <_Z9bleya_nitPv>
    80003834:	00007517          	auipc	a0,0x7
    80003838:	b8c50513          	addi	a0,a0,-1140 # 8000a3c0 <handle_bleya>
    8000383c:	ffffe097          	auipc	ra,0xffffe
    80003840:	ce8080e7          	jalr	-792(ra) # 80001524 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80003844:	00200793          	li	a5,2
    80003848:	1007a073          	csrs	sstatus,a5
}
    8000384c:	02813083          	ld	ra,40(sp)
    80003850:	02013403          	ld	s0,32(sp)
    80003854:	01813483          	ld	s1,24(sp)
    80003858:	01013903          	ld	s2,16(sp)
    8000385c:	03010113          	addi	sp,sp,48
    80003860:	00008067          	ret
    80003864:	00050913          	mv	s2,a0
    printer = new OwnedMutex();
    80003868:	00048513          	mv	a0,s1
    8000386c:	00000097          	auipc	ra,0x0
    80003870:	134080e7          	jalr	308(ra) # 800039a0 <_ZdlPv>
    80003874:	00090513          	mv	a0,s2
    80003878:	00008097          	auipc	ra,0x8
    8000387c:	c80080e7          	jalr	-896(ra) # 8000b4f8 <_Unwind_Resume>

0000000080003880 <_ZN6Thread11threadStartEPv>:
Thread::Thread() {
    this->body = nullptr;
    this->arg = nullptr;
}

void Thread::threadStart(void *arg) {
    80003880:	ff010113          	addi	sp,sp,-16
    80003884:	00113423          	sd	ra,8(sp)
    80003888:	00813023          	sd	s0,0(sp)
    8000388c:	01010413          	addi	s0,sp,16
    Thread *thread = (Thread *) arg;
    if (thread->body) {
    80003890:	01053783          	ld	a5,16(a0)
    80003894:	00078e63          	beqz	a5,800038b0 <_ZN6Thread11threadStartEPv+0x30>
        thread->body(thread->arg);
    80003898:	01853503          	ld	a0,24(a0)
    8000389c:	000780e7          	jalr	a5
    } else {
        thread->run();
    }
}
    800038a0:	00813083          	ld	ra,8(sp)
    800038a4:	00013403          	ld	s0,0(sp)
    800038a8:	01010113          	addi	sp,sp,16
    800038ac:	00008067          	ret
        thread->run();
    800038b0:	00053783          	ld	a5,0(a0)
    800038b4:	0107b783          	ld	a5,16(a5)
    800038b8:	000780e7          	jalr	a5
}
    800038bc:	fe5ff06f          	j	800038a0 <_ZN6Thread11threadStartEPv+0x20>

00000000800038c0 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800038c0:	ff010113          	addi	sp,sp,-16
    800038c4:	00113423          	sd	ra,8(sp)
    800038c8:	00813023          	sd	s0,0(sp)
    800038cc:	01010413          	addi	s0,sp,16
    800038d0:	00007797          	auipc	a5,0x7
    800038d4:	86078793          	addi	a5,a5,-1952 # 8000a130 <_ZTV9Semaphore+0x10>
    800038d8:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800038dc:	00853503          	ld	a0,8(a0)
    800038e0:	ffffe097          	auipc	ra,0xffffe
    800038e4:	ea0080e7          	jalr	-352(ra) # 80001780 <_Z9sem_closeP3Sem>
}
    800038e8:	00813083          	ld	ra,8(sp)
    800038ec:	00013403          	ld	s0,0(sp)
    800038f0:	01010113          	addi	sp,sp,16
    800038f4:	00008067          	ret

00000000800038f8 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800038f8:	ff010113          	addi	sp,sp,-16
    800038fc:	00113423          	sd	ra,8(sp)
    80003900:	00813023          	sd	s0,0(sp)
    80003904:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80003908:	00853503          	ld	a0,8(a0)
    8000390c:	ffffe097          	auipc	ra,0xffffe
    80003910:	eb4080e7          	jalr	-332(ra) # 800017c0 <_Z8sem_waitP3Sem>
}
    80003914:	00813083          	ld	ra,8(sp)
    80003918:	00013403          	ld	s0,0(sp)
    8000391c:	01010113          	addi	sp,sp,16
    80003920:	00008067          	ret

0000000080003924 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80003924:	ff010113          	addi	sp,sp,-16
    80003928:	00113423          	sd	ra,8(sp)
    8000392c:	00813023          	sd	s0,0(sp)
    80003930:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80003934:	00853503          	ld	a0,8(a0)
    80003938:	ffffe097          	auipc	ra,0xffffe
    8000393c:	ec8080e7          	jalr	-312(ra) # 80001800 <_Z10sem_signalP3Sem>
}
    80003940:	00813083          	ld	ra,8(sp)
    80003944:	00013403          	ld	s0,0(sp)
    80003948:	01010113          	addi	sp,sp,16
    8000394c:	00008067          	ret

0000000080003950 <_Znwm>:
void *operator new(size_t size) {
    80003950:	ff010113          	addi	sp,sp,-16
    80003954:	00113423          	sd	ra,8(sp)
    80003958:	00813023          	sd	s0,0(sp)
    8000395c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003960:	ffffe097          	auipc	ra,0xffffe
    80003964:	b3c080e7          	jalr	-1220(ra) # 8000149c <_Z9mem_allocm>
}
    80003968:	00813083          	ld	ra,8(sp)
    8000396c:	00013403          	ld	s0,0(sp)
    80003970:	01010113          	addi	sp,sp,16
    80003974:	00008067          	ret

0000000080003978 <_Znam>:
void *operator new[](size_t size) {
    80003978:	ff010113          	addi	sp,sp,-16
    8000397c:	00113423          	sd	ra,8(sp)
    80003980:	00813023          	sd	s0,0(sp)
    80003984:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003988:	ffffe097          	auipc	ra,0xffffe
    8000398c:	b14080e7          	jalr	-1260(ra) # 8000149c <_Z9mem_allocm>
}
    80003990:	00813083          	ld	ra,8(sp)
    80003994:	00013403          	ld	s0,0(sp)
    80003998:	01010113          	addi	sp,sp,16
    8000399c:	00008067          	ret

00000000800039a0 <_ZdlPv>:
void operator delete(void *mem) {
    800039a0:	ff010113          	addi	sp,sp,-16
    800039a4:	00113423          	sd	ra,8(sp)
    800039a8:	00813023          	sd	s0,0(sp)
    800039ac:	01010413          	addi	s0,sp,16
    mem_free(mem);
    800039b0:	ffffe097          	auipc	ra,0xffffe
    800039b4:	b34080e7          	jalr	-1228(ra) # 800014e4 <_Z8mem_freePv>
}
    800039b8:	00813083          	ld	ra,8(sp)
    800039bc:	00013403          	ld	s0,0(sp)
    800039c0:	01010113          	addi	sp,sp,16
    800039c4:	00008067          	ret

00000000800039c8 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800039c8:	00006797          	auipc	a5,0x6
    800039cc:	74078793          	addi	a5,a5,1856 # 8000a108 <_ZTV6Thread+0x10>
    800039d0:	00f53023          	sd	a5,0(a0)
    if (myHandle->is_finished())
    800039d4:	00853503          	ld	a0,8(a0)
    bool is_finished() const { return this->status == FINISHED; }
    800039d8:	04852703          	lw	a4,72(a0)
    800039dc:	00400793          	li	a5,4
    800039e0:	00f70463          	beq	a4,a5,800039e8 <_ZN6ThreadD1Ev+0x20>
    800039e4:	00008067          	ret
        delete myHandle;
    800039e8:	fe050ee3          	beqz	a0,800039e4 <_ZN6ThreadD1Ev+0x1c>
Thread::~Thread() {
    800039ec:	ff010113          	addi	sp,sp,-16
    800039f0:	00113423          	sd	ra,8(sp)
    800039f4:	00813023          	sd	s0,0(sp)
    800039f8:	01010413          	addi	s0,sp,16
        delete myHandle;
    800039fc:	00000097          	auipc	ra,0x0
    80003a00:	fa4080e7          	jalr	-92(ra) # 800039a0 <_ZdlPv>
}
    80003a04:	00813083          	ld	ra,8(sp)
    80003a08:	00013403          	ld	s0,0(sp)
    80003a0c:	01010113          	addi	sp,sp,16
    80003a10:	00008067          	ret

0000000080003a14 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80003a14:	fe010113          	addi	sp,sp,-32
    80003a18:	00113c23          	sd	ra,24(sp)
    80003a1c:	00813823          	sd	s0,16(sp)
    80003a20:	00913423          	sd	s1,8(sp)
    80003a24:	02010413          	addi	s0,sp,32
    80003a28:	00050493          	mv	s1,a0
}
    80003a2c:	00000097          	auipc	ra,0x0
    80003a30:	f9c080e7          	jalr	-100(ra) # 800039c8 <_ZN6ThreadD1Ev>
    80003a34:	00048513          	mv	a0,s1
    80003a38:	00000097          	auipc	ra,0x0
    80003a3c:	f68080e7          	jalr	-152(ra) # 800039a0 <_ZdlPv>
    80003a40:	01813083          	ld	ra,24(sp)
    80003a44:	01013403          	ld	s0,16(sp)
    80003a48:	00813483          	ld	s1,8(sp)
    80003a4c:	02010113          	addi	sp,sp,32
    80003a50:	00008067          	ret

0000000080003a54 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80003a54:	fe010113          	addi	sp,sp,-32
    80003a58:	00113c23          	sd	ra,24(sp)
    80003a5c:	00813823          	sd	s0,16(sp)
    80003a60:	00913423          	sd	s1,8(sp)
    80003a64:	02010413          	addi	s0,sp,32
    80003a68:	00050493          	mv	s1,a0
}
    80003a6c:	00000097          	auipc	ra,0x0
    80003a70:	e54080e7          	jalr	-428(ra) # 800038c0 <_ZN9SemaphoreD1Ev>
    80003a74:	00048513          	mv	a0,s1
    80003a78:	00000097          	auipc	ra,0x0
    80003a7c:	f28080e7          	jalr	-216(ra) # 800039a0 <_ZdlPv>
    80003a80:	01813083          	ld	ra,24(sp)
    80003a84:	01013403          	ld	s0,16(sp)
    80003a88:	00813483          	ld	s1,8(sp)
    80003a8c:	02010113          	addi	sp,sp,32
    80003a90:	00008067          	ret

0000000080003a94 <_ZdaPv>:
void operator delete[](void *mem) {
    80003a94:	ff010113          	addi	sp,sp,-16
    80003a98:	00113423          	sd	ra,8(sp)
    80003a9c:	00813023          	sd	s0,0(sp)
    80003aa0:	01010413          	addi	s0,sp,16
    mem_free(mem);
    80003aa4:	ffffe097          	auipc	ra,0xffffe
    80003aa8:	a40080e7          	jalr	-1472(ra) # 800014e4 <_Z8mem_freePv>
}
    80003aac:	00813083          	ld	ra,8(sp)
    80003ab0:	00013403          	ld	s0,0(sp)
    80003ab4:	01010113          	addi	sp,sp,16
    80003ab8:	00008067          	ret

0000000080003abc <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80003abc:	ff010113          	addi	sp,sp,-16
    80003ac0:	00813423          	sd	s0,8(sp)
    80003ac4:	01010413          	addi	s0,sp,16
    80003ac8:	00006797          	auipc	a5,0x6
    80003acc:	64078793          	addi	a5,a5,1600 # 8000a108 <_ZTV6Thread+0x10>
    80003ad0:	00f53023          	sd	a5,0(a0)
    this->body = body;
    80003ad4:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    80003ad8:	00c53c23          	sd	a2,24(a0)
}
    80003adc:	00813403          	ld	s0,8(sp)
    80003ae0:	01010113          	addi	sp,sp,16
    80003ae4:	00008067          	ret

0000000080003ae8 <_ZN6Thread5startEv>:
int Thread::start() {
    80003ae8:	ff010113          	addi	sp,sp,-16
    80003aec:	00113423          	sd	ra,8(sp)
    80003af0:	00813023          	sd	s0,0(sp)
    80003af4:	01010413          	addi	s0,sp,16
    return thread_create(&myHandle, &threadStart, this);
    80003af8:	00050613          	mv	a2,a0
    80003afc:	00000597          	auipc	a1,0x0
    80003b00:	d8458593          	addi	a1,a1,-636 # 80003880 <_ZN6Thread11threadStartEPv>
    80003b04:	00850513          	addi	a0,a0,8
    80003b08:	ffffe097          	auipc	ra,0xffffe
    80003b0c:	a1c080e7          	jalr	-1508(ra) # 80001524 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80003b10:	00813083          	ld	ra,8(sp)
    80003b14:	00013403          	ld	s0,0(sp)
    80003b18:	01010113          	addi	sp,sp,16
    80003b1c:	00008067          	ret

0000000080003b20 <_ZN6Thread4joinEv>:
void Thread::join() {
    80003b20:	ff010113          	addi	sp,sp,-16
    80003b24:	00113423          	sd	ra,8(sp)
    80003b28:	00813023          	sd	s0,0(sp)
    80003b2c:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80003b30:	00853503          	ld	a0,8(a0)
    80003b34:	ffffe097          	auipc	ra,0xffffe
    80003b38:	ae8080e7          	jalr	-1304(ra) # 8000161c <_Z11thread_joinP3TCB>
}
    80003b3c:	00813083          	ld	ra,8(sp)
    80003b40:	00013403          	ld	s0,0(sp)
    80003b44:	01010113          	addi	sp,sp,16
    80003b48:	00008067          	ret

0000000080003b4c <_ZN6Thread4joinEm>:
void Thread::join(time_t time) {
    80003b4c:	ff010113          	addi	sp,sp,-16
    80003b50:	00113423          	sd	ra,8(sp)
    80003b54:	00813023          	sd	s0,0(sp)
    80003b58:	01010413          	addi	s0,sp,16
    thread_join(myHandle, time);
    80003b5c:	00853503          	ld	a0,8(a0)
    80003b60:	ffffe097          	auipc	ra,0xffffe
    80003b64:	af8080e7          	jalr	-1288(ra) # 80001658 <_Z11thread_joinP3TCBm>
}
    80003b68:	00813083          	ld	ra,8(sp)
    80003b6c:	00013403          	ld	s0,0(sp)
    80003b70:	01010113          	addi	sp,sp,16
    80003b74:	00008067          	ret

0000000080003b78 <_ZN6Thread4killEPS_>:
int Thread::kill(Thread *thread) {
    80003b78:	ff010113          	addi	sp,sp,-16
    80003b7c:	00113423          	sd	ra,8(sp)
    80003b80:	00813023          	sd	s0,0(sp)
    80003b84:	01010413          	addi	s0,sp,16
    return thread_kill(thread->myHandle);
    80003b88:	00853503          	ld	a0,8(a0)
    80003b8c:	ffffe097          	auipc	ra,0xffffe
    80003b90:	b70080e7          	jalr	-1168(ra) # 800016fc <_Z11thread_killP3TCB>
}
    80003b94:	00813083          	ld	ra,8(sp)
    80003b98:	00013403          	ld	s0,0(sp)
    80003b9c:	01010113          	addi	sp,sp,16
    80003ba0:	00008067          	ret

0000000080003ba4 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80003ba4:	ff010113          	addi	sp,sp,-16
    80003ba8:	00113423          	sd	ra,8(sp)
    80003bac:	00813023          	sd	s0,0(sp)
    80003bb0:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80003bb4:	ffffe097          	auipc	ra,0xffffe
    80003bb8:	a2c080e7          	jalr	-1492(ra) # 800015e0 <_Z15thread_dispatchv>
}
    80003bbc:	00813083          	ld	ra,8(sp)
    80003bc0:	00013403          	ld	s0,0(sp)
    80003bc4:	01010113          	addi	sp,sp,16
    80003bc8:	00008067          	ret

0000000080003bcc <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t ms) {
    80003bcc:	ff010113          	addi	sp,sp,-16
    80003bd0:	00113423          	sd	ra,8(sp)
    80003bd4:	00813023          	sd	s0,0(sp)
    80003bd8:	01010413          	addi	s0,sp,16
    return time_sleep(ms);
    80003bdc:	ffffe097          	auipc	ra,0xffffe
    80003be0:	ce4080e7          	jalr	-796(ra) # 800018c0 <_Z10time_sleepm>
}
    80003be4:	00813083          	ld	ra,8(sp)
    80003be8:	00013403          	ld	s0,0(sp)
    80003bec:	01010113          	addi	sp,sp,16
    80003bf0:	00008067          	ret

0000000080003bf4 <_ZN14PeriodicThread3runEv>:

PeriodicThread::PeriodicThread(time_t period) {
    this->period = period;
}

void PeriodicThread::run() {
    80003bf4:	fe010113          	addi	sp,sp,-32
    80003bf8:	00113c23          	sd	ra,24(sp)
    80003bfc:	00813823          	sd	s0,16(sp)
    80003c00:	00913423          	sd	s1,8(sp)
    80003c04:	02010413          	addi	s0,sp,32
    80003c08:	00050493          	mv	s1,a0
    while (true) {
        Thread::sleep(period);
    80003c0c:	0204b503          	ld	a0,32(s1)
    80003c10:	00000097          	auipc	ra,0x0
    80003c14:	fbc080e7          	jalr	-68(ra) # 80003bcc <_ZN6Thread5sleepEm>
        this->periodicActivation();
    80003c18:	0004b783          	ld	a5,0(s1)
    80003c1c:	0187b783          	ld	a5,24(a5)
    80003c20:	00048513          	mv	a0,s1
    80003c24:	000780e7          	jalr	a5
    while (true) {
    80003c28:	fe5ff06f          	j	80003c0c <_ZN14PeriodicThread3runEv+0x18>

0000000080003c2c <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80003c2c:	ff010113          	addi	sp,sp,-16
    80003c30:	00813423          	sd	s0,8(sp)
    80003c34:	01010413          	addi	s0,sp,16
    80003c38:	00006797          	auipc	a5,0x6
    80003c3c:	4d078793          	addi	a5,a5,1232 # 8000a108 <_ZTV6Thread+0x10>
    80003c40:	00f53023          	sd	a5,0(a0)
    this->body = nullptr;
    80003c44:	00053823          	sd	zero,16(a0)
    this->arg = nullptr;
    80003c48:	00053c23          	sd	zero,24(a0)
}
    80003c4c:	00813403          	ld	s0,8(sp)
    80003c50:	01010113          	addi	sp,sp,16
    80003c54:	00008067          	ret

0000000080003c58 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80003c58:	ff010113          	addi	sp,sp,-16
    80003c5c:	00113423          	sd	ra,8(sp)
    80003c60:	00813023          	sd	s0,0(sp)
    80003c64:	01010413          	addi	s0,sp,16
    80003c68:	00006797          	auipc	a5,0x6
    80003c6c:	4c878793          	addi	a5,a5,1224 # 8000a130 <_ZTV9Semaphore+0x10>
    80003c70:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80003c74:	00850513          	addi	a0,a0,8
    80003c78:	ffffe097          	auipc	ra,0xffffe
    80003c7c:	ac4080e7          	jalr	-1340(ra) # 8000173c <_Z8sem_openPP3Semj>
}
    80003c80:	00813083          	ld	ra,8(sp)
    80003c84:	00013403          	ld	s0,0(sp)
    80003c88:	01010113          	addi	sp,sp,16
    80003c8c:	00008067          	ret

0000000080003c90 <_ZN9Semaphore15signal_and_waitERS_S0_>:
int Semaphore::signal_and_wait(Semaphore &sem1, Semaphore &sem2) {
    80003c90:	ff010113          	addi	sp,sp,-16
    80003c94:	00113423          	sd	ra,8(sp)
    80003c98:	00813023          	sd	s0,0(sp)
    80003c9c:	01010413          	addi	s0,sp,16
    return ::signal_and_wait(sem1.myHandle, sem2.myHandle);
    80003ca0:	0085b583          	ld	a1,8(a1)
    80003ca4:	00853503          	ld	a0,8(a0)
    80003ca8:	ffffe097          	auipc	ra,0xffffe
    80003cac:	bd8080e7          	jalr	-1064(ra) # 80001880 <_Z15signal_and_waitP3SemS0_>
}
    80003cb0:	00813083          	ld	ra,8(sp)
    80003cb4:	00013403          	ld	s0,0(sp)
    80003cb8:	01010113          	addi	sp,sp,16
    80003cbc:	00008067          	ret

0000000080003cc0 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80003cc0:	ff010113          	addi	sp,sp,-16
    80003cc4:	00113423          	sd	ra,8(sp)
    80003cc8:	00813023          	sd	s0,0(sp)
    80003ccc:	01010413          	addi	s0,sp,16
    Thread::kill(this);
    80003cd0:	00000097          	auipc	ra,0x0
    80003cd4:	ea8080e7          	jalr	-344(ra) # 80003b78 <_ZN6Thread4killEPS_>
}
    80003cd8:	00813083          	ld	ra,8(sp)
    80003cdc:	00013403          	ld	s0,0(sp)
    80003ce0:	01010113          	addi	sp,sp,16
    80003ce4:	00008067          	ret

0000000080003ce8 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) {
    80003ce8:	fe010113          	addi	sp,sp,-32
    80003cec:	00113c23          	sd	ra,24(sp)
    80003cf0:	00813823          	sd	s0,16(sp)
    80003cf4:	00913423          	sd	s1,8(sp)
    80003cf8:	01213023          	sd	s2,0(sp)
    80003cfc:	02010413          	addi	s0,sp,32
    80003d00:	00050493          	mv	s1,a0
    80003d04:	00058913          	mv	s2,a1
    80003d08:	00000097          	auipc	ra,0x0
    80003d0c:	f24080e7          	jalr	-220(ra) # 80003c2c <_ZN6ThreadC1Ev>
    80003d10:	00006797          	auipc	a5,0x6
    80003d14:	45078793          	addi	a5,a5,1104 # 8000a160 <_ZTV14PeriodicThread+0x10>
    80003d18:	00f4b023          	sd	a5,0(s1)
    this->period = period;
    80003d1c:	0324b023          	sd	s2,32(s1)
}
    80003d20:	01813083          	ld	ra,24(sp)
    80003d24:	01013403          	ld	s0,16(sp)
    80003d28:	00813483          	ld	s1,8(sp)
    80003d2c:	00013903          	ld	s2,0(sp)
    80003d30:	02010113          	addi	sp,sp,32
    80003d34:	00008067          	ret

0000000080003d38 <_ZN7Console4getcEv>:
    }
}

char Console::getc() {
    80003d38:	ff010113          	addi	sp,sp,-16
    80003d3c:	00113423          	sd	ra,8(sp)
    80003d40:	00813023          	sd	s0,0(sp)
    80003d44:	01010413          	addi	s0,sp,16
    return getc();
    80003d48:	00000097          	auipc	ra,0x0
    80003d4c:	ff0080e7          	jalr	-16(ra) # 80003d38 <_ZN7Console4getcEv>
}
    80003d50:	00813083          	ld	ra,8(sp)
    80003d54:	00013403          	ld	s0,0(sp)
    80003d58:	01010113          	addi	sp,sp,16
    80003d5c:	00008067          	ret

0000000080003d60 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80003d60:	ff010113          	addi	sp,sp,-16
    80003d64:	00113423          	sd	ra,8(sp)
    80003d68:	00813023          	sd	s0,0(sp)
    80003d6c:	01010413          	addi	s0,sp,16
    putc(c);
    80003d70:	00000097          	auipc	ra,0x0
    80003d74:	ff0080e7          	jalr	-16(ra) # 80003d60 <_ZN7Console4putcEc>
    80003d78:	00813083          	ld	ra,8(sp)
    80003d7c:	00013403          	ld	s0,0(sp)
    80003d80:	01010113          	addi	sp,sp,16
    80003d84:	00008067          	ret

0000000080003d88 <_ZN6Thread3runEv>:
    virtual void run() {}
    80003d88:	ff010113          	addi	sp,sp,-16
    80003d8c:	00813423          	sd	s0,8(sp)
    80003d90:	01010413          	addi	s0,sp,16
    80003d94:	00813403          	ld	s0,8(sp)
    80003d98:	01010113          	addi	sp,sp,16
    80003d9c:	00008067          	ret

0000000080003da0 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    explicit PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80003da0:	ff010113          	addi	sp,sp,-16
    80003da4:	00813423          	sd	s0,8(sp)
    80003da8:	01010413          	addi	s0,sp,16
    80003dac:	00813403          	ld	s0,8(sp)
    80003db0:	01010113          	addi	sp,sp,16
    80003db4:	00008067          	ret

0000000080003db8 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80003db8:	ff010113          	addi	sp,sp,-16
    80003dbc:	00113423          	sd	ra,8(sp)
    80003dc0:	00813023          	sd	s0,0(sp)
    80003dc4:	01010413          	addi	s0,sp,16
    80003dc8:	00006797          	auipc	a5,0x6
    80003dcc:	39878793          	addi	a5,a5,920 # 8000a160 <_ZTV14PeriodicThread+0x10>
    80003dd0:	00f53023          	sd	a5,0(a0)
    80003dd4:	00000097          	auipc	ra,0x0
    80003dd8:	bf4080e7          	jalr	-1036(ra) # 800039c8 <_ZN6ThreadD1Ev>
    80003ddc:	00813083          	ld	ra,8(sp)
    80003de0:	00013403          	ld	s0,0(sp)
    80003de4:	01010113          	addi	sp,sp,16
    80003de8:	00008067          	ret

0000000080003dec <_ZN14PeriodicThreadD0Ev>:
    80003dec:	fe010113          	addi	sp,sp,-32
    80003df0:	00113c23          	sd	ra,24(sp)
    80003df4:	00813823          	sd	s0,16(sp)
    80003df8:	00913423          	sd	s1,8(sp)
    80003dfc:	02010413          	addi	s0,sp,32
    80003e00:	00050493          	mv	s1,a0
    80003e04:	00006797          	auipc	a5,0x6
    80003e08:	35c78793          	addi	a5,a5,860 # 8000a160 <_ZTV14PeriodicThread+0x10>
    80003e0c:	00f53023          	sd	a5,0(a0)
    80003e10:	00000097          	auipc	ra,0x0
    80003e14:	bb8080e7          	jalr	-1096(ra) # 800039c8 <_ZN6ThreadD1Ev>
    80003e18:	00048513          	mv	a0,s1
    80003e1c:	00000097          	auipc	ra,0x0
    80003e20:	b84080e7          	jalr	-1148(ra) # 800039a0 <_ZdlPv>
    80003e24:	01813083          	ld	ra,24(sp)
    80003e28:	01013403          	ld	s0,16(sp)
    80003e2c:	00813483          	ld	s1,8(sp)
    80003e30:	02010113          	addi	sp,sp,32
    80003e34:	00008067          	ret

0000000080003e38 <_ZN5Riscv20handleSupervisorTrapEmmmmm>:
        reinterpret_cast<Riscv::syscall_f>(Cradle::_thread_wake),
        reinterpret_cast<Riscv::syscall_f>(IO::_getc),
        reinterpret_cast<Riscv::syscall_f>(IO::_putc)
};

void Riscv::handleSupervisorTrap(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    80003e38:	f9010113          	addi	sp,sp,-112
    80003e3c:	06113423          	sd	ra,104(sp)
    80003e40:	06813023          	sd	s0,96(sp)
    80003e44:	04913c23          	sd	s1,88(sp)
    80003e48:	05213823          	sd	s2,80(sp)
    80003e4c:	05313423          	sd	s3,72(sp)
    80003e50:	05413023          	sd	s4,64(sp)
    80003e54:	03513c23          	sd	s5,56(sp)
    80003e58:	03613823          	sd	s6,48(sp)
    80003e5c:	03713423          	sd	s7,40(sp)
    80003e60:	07010413          	addi	s0,sp,112
    80003e64:	00050493          	mv	s1,a0
    80003e68:	00058993          	mv	s3,a1
    80003e6c:	00060a13          	mv	s4,a2
    80003e70:	00068a93          	mv	s5,a3
    80003e74:	00070b13          	mv	s6,a4
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80003e78:	100027f3          	csrr	a5,sstatus
    80003e7c:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    80003e80:	fa843b83          	ld	s7,-88(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80003e84:	141027f3          	csrr	a5,sepc
    80003e88:	faf43023          	sd	a5,-96(s0)
    return sepc;
    80003e8c:	fa043903          	ld	s2,-96(s0)
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80003e90:	142027f3          	csrr	a5,scause
    80003e94:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80003e98:	f9843703          	ld	a4,-104(s0)
    uint64 sstatus = r_sstatus();
    uint64 sepc = r_sepc();
    if (r_scause() == ILLEGAL_INSTRUCTION) {
    80003e9c:	00200793          	li	a5,2
    80003ea0:	06f70263          	beq	a4,a5,80003f04 <_ZN5Riscv20handleSupervisorTrapEmmmmm+0xcc>
        print("\nIllegal Instruction\n");
        TCB::_thread_exit();
    }
    syscall_table[code](arg1, arg2, arg3, arg4);
    80003ea4:	00349493          	slli	s1,s1,0x3
    80003ea8:	00006797          	auipc	a5,0x6
    80003eac:	2d878793          	addi	a5,a5,728 # 8000a180 <_ZN5Riscv13syscall_tableE>
    80003eb0:	009784b3          	add	s1,a5,s1
    80003eb4:	0004b783          	ld	a5,0(s1)
    80003eb8:	000b0693          	mv	a3,s6
    80003ebc:	000a8613          	mv	a2,s5
    80003ec0:	000a0593          	mv	a1,s4
    80003ec4:	00098513          	mv	a0,s3
    80003ec8:	000780e7          	jalr	a5
    w_sepc(sepc + 4);
    80003ecc:	00490793          	addi	a5,s2,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80003ed0:	14179073          	csrw	sepc,a5
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80003ed4:	100b9073          	csrw	sstatus,s7
    w_sstatus(sstatus);
}
    80003ed8:	06813083          	ld	ra,104(sp)
    80003edc:	06013403          	ld	s0,96(sp)
    80003ee0:	05813483          	ld	s1,88(sp)
    80003ee4:	05013903          	ld	s2,80(sp)
    80003ee8:	04813983          	ld	s3,72(sp)
    80003eec:	04013a03          	ld	s4,64(sp)
    80003ef0:	03813a83          	ld	s5,56(sp)
    80003ef4:	03013b03          	ld	s6,48(sp)
    80003ef8:	02813b83          	ld	s7,40(sp)
    80003efc:	07010113          	addi	sp,sp,112
    80003f00:	00008067          	ret
        print("\nIllegal Instruction\n");
    80003f04:	00004517          	auipc	a0,0x4
    80003f08:	1a450513          	addi	a0,a0,420 # 800080a8 <_ZN3stm4coutE+0x38>
    80003f0c:	ffffe097          	auipc	ra,0xffffe
    80003f10:	79c080e7          	jalr	1948(ra) # 800026a8 <_Z5printPKc>
        TCB::_thread_exit();
    80003f14:	00001097          	auipc	ra,0x1
    80003f18:	d5c080e7          	jalr	-676(ra) # 80004c70 <_ZN3TCB12_thread_exitEv>
    80003f1c:	f89ff06f          	j	80003ea4 <_ZN5Riscv20handleSupervisorTrapEmmmmm+0x6c>

0000000080003f20 <_ZN5Riscv15handleTimerTrapEv>:


void Riscv::handleTimerTrap() {
    80003f20:	fd010113          	addi	sp,sp,-48
    80003f24:	02113423          	sd	ra,40(sp)
    80003f28:	02813023          	sd	s0,32(sp)
    80003f2c:	00913c23          	sd	s1,24(sp)
    80003f30:	01213823          	sd	s2,16(sp)
    80003f34:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80003f38:	100027f3          	csrr	a5,sstatus
    80003f3c:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80003f40:	fd843483          	ld	s1,-40(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80003f44:	141027f3          	csrr	a5,sepc
    80003f48:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80003f4c:	fd043903          	ld	s2,-48(s0)
    uint64 sstatus = r_sstatus();
    uint64 sepc = r_sepc();
    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IO::Output.is_empty()) {
    80003f50:	00006797          	auipc	a5,0x6
    80003f54:	3407b783          	ld	a5,832(a5) # 8000a290 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003f58:	0007b783          	ld	a5,0(a5)
    80003f5c:	0007c783          	lbu	a5,0(a5)
    80003f60:	0207f793          	andi	a5,a5,32
    80003f64:	02078c63          	beqz	a5,80003f9c <_ZN5Riscv15handleTimerTrapEv+0x7c>
    80003f68:	00006797          	auipc	a5,0x6
    80003f6c:	3207b783          	ld	a5,800(a5) # 8000a288 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003f70:	0107a783          	lw	a5,16(a5)
    80003f74:	02078463          	beqz	a5,80003f9c <_ZN5Riscv15handleTimerTrapEv+0x7c>
        char c = IO::Output.get();
    80003f78:	00006517          	auipc	a0,0x6
    80003f7c:	31053503          	ld	a0,784(a0) # 8000a288 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003f80:	fffff097          	auipc	ra,0xfffff
    80003f84:	9c0080e7          	jalr	-1600(ra) # 80002940 <_ZN8IOBuffer3getEv>
        *(volatile char *) CONSOLE_TX_DATA = c;
    80003f88:	00006797          	auipc	a5,0x6
    80003f8c:	3407b783          	ld	a5,832(a5) # 8000a2c8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80003f90:	0007b783          	ld	a5,0(a5)
    80003f94:	00a78023          	sb	a0,0(a5)
    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IO::Output.is_empty()) {
    80003f98:	fb9ff06f          	j	80003f50 <_ZN5Riscv15handleTimerTrapEv+0x30>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80003f9c:	00200793          	li	a5,2
    80003fa0:	1447b073          	csrc	sip,a5
    }
    mc_sip(SIP_SSIE);
    Cradle::update();
    80003fa4:	fffff097          	auipc	ra,0xfffff
    80003fa8:	e78080e7          	jalr	-392(ra) # 80002e1c <_ZN6Cradle6updateEv>
    80003fac:	0580006f          	j	80004004 <_ZN5Riscv15handleTimerTrapEv+0xe4>
        if (next->is_joined() || next->is_sleeping()) {
            next->run();
            Scheduler::put(next);
        }
    }
    TCB::timer_counter++;
    80003fb0:	00006717          	auipc	a4,0x6
    80003fb4:	35073703          	ld	a4,848(a4) # 8000a300 <_GLOBAL_OFFSET_TABLE_+0x88>
    80003fb8:	00073783          	ld	a5,0(a4)
    80003fbc:	00178793          	addi	a5,a5,1
    80003fc0:	00f73023          	sd	a5,0(a4)
    if ((time_t) TCB::timer_counter >= TCB::running->get_time_slice() && !Scheduler::is_empty()) {
    80003fc4:	00006717          	auipc	a4,0x6
    80003fc8:	32c73703          	ld	a4,812(a4) # 8000a2f0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80003fcc:	00073703          	ld	a4,0(a4)

    void set_preempted() { this->preempted = true; }

    void reset_preempted() { this->preempted = false; }

    time_t get_time_slice() const { return this->time_slice; }
    80003fd0:	05073683          	ld	a3,80(a4)
    80003fd4:	06d7f463          	bgeu	a5,a3,8000403c <_ZN5Riscv15handleTimerTrapEv+0x11c>
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80003fd8:	14191073          	csrw	sepc,s2
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80003fdc:	10049073          	csrw	sstatus,s1
        TCB::running->set_preempted();
        TCB::_thread_dispatch();
    }
    w_sepc(sepc);
    w_sstatus(sstatus);
}
    80003fe0:	02813083          	ld	ra,40(sp)
    80003fe4:	02013403          	ld	s0,32(sp)
    80003fe8:	01813483          	ld	s1,24(sp)
    80003fec:	01013903          	ld	s2,16(sp)
    80003ff0:	03010113          	addi	sp,sp,48
    80003ff4:	00008067          	ret
    void run() { this->status = RUNNABLE; }
    80003ff8:	04052423          	sw	zero,72(a0)
            Scheduler::put(next);
    80003ffc:	00000097          	auipc	ra,0x0
    80004000:	2c4080e7          	jalr	708(ra) # 800042c0 <_ZN9Scheduler3putEP3TCB>
    while (!Cradle::is_empty() && Cradle::peak() == 0) {
    80004004:	fffff097          	auipc	ra,0xfffff
    80004008:	e78080e7          	jalr	-392(ra) # 80002e7c <_ZN6Cradle8is_emptyEv>
    8000400c:	fa0512e3          	bnez	a0,80003fb0 <_ZN5Riscv15handleTimerTrapEv+0x90>
    80004010:	fffff097          	auipc	ra,0xfffff
    80004014:	e3c080e7          	jalr	-452(ra) # 80002e4c <_ZN6Cradle4peakEv>
    80004018:	f8051ce3          	bnez	a0,80003fb0 <_ZN5Riscv15handleTimerTrapEv+0x90>
        thread_t next = Cradle::remove();
    8000401c:	fffff097          	auipc	ra,0xfffff
    80004020:	db0080e7          	jalr	-592(ra) # 80002dcc <_ZN6Cradle6removeEv>
    bool is_joined() const { return this->status == JOINED; }
    80004024:	04852783          	lw	a5,72(a0)
        if (next->is_joined() || next->is_sleeping()) {
    80004028:	00300713          	li	a4,3
    8000402c:	fce786e3          	beq	a5,a4,80003ff8 <_ZN5Riscv15handleTimerTrapEv+0xd8>
    80004030:	00200713          	li	a4,2
    80004034:	fce798e3          	bne	a5,a4,80004004 <_ZN5Riscv15handleTimerTrapEv+0xe4>
    80004038:	fc1ff06f          	j	80003ff8 <_ZN5Riscv15handleTimerTrapEv+0xd8>
    8000403c:	00006797          	auipc	a5,0x6
    80004040:	2cc7b783          	ld	a5,716(a5) # 8000a308 <_GLOBAL_OFFSET_TABLE_+0x90>
    80004044:	0107a783          	lw	a5,16(a5)
    static void put(TCB *thread);

    static TCB *get();

    static inline bool is_empty() {
        return high_priority.is_empty() && mid_priority.is_empty() && low_priority.is_empty();
    80004048:	02079263          	bnez	a5,8000406c <_ZN5Riscv15handleTimerTrapEv+0x14c>
    8000404c:	00006797          	auipc	a5,0x6
    80004050:	29c7b783          	ld	a5,668(a5) # 8000a2e8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80004054:	0107a783          	lw	a5,16(a5)
    80004058:	00079a63          	bnez	a5,8000406c <_ZN5Riscv15handleTimerTrapEv+0x14c>
    8000405c:	00006797          	auipc	a5,0x6
    80004060:	2647b783          	ld	a5,612(a5) # 8000a2c0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004064:	0107a783          	lw	a5,16(a5)
    80004068:	f60788e3          	beqz	a5,80003fd8 <_ZN5Riscv15handleTimerTrapEv+0xb8>
        TCB::timer_counter = 0;
    8000406c:	00006797          	auipc	a5,0x6
    80004070:	2947b783          	ld	a5,660(a5) # 8000a300 <_GLOBAL_OFFSET_TABLE_+0x88>
    80004074:	0007b023          	sd	zero,0(a5)
    void set_preempted() { this->preempted = true; }
    80004078:	00100793          	li	a5,1
    8000407c:	04f70c23          	sb	a5,88(a4)
        TCB::_thread_dispatch();
    80004080:	00001097          	auipc	ra,0x1
    80004084:	bb8080e7          	jalr	-1096(ra) # 80004c38 <_ZN3TCB16_thread_dispatchEv>
    80004088:	f51ff06f          	j	80003fd8 <_ZN5Riscv15handleTimerTrapEv+0xb8>

000000008000408c <_ZN5Riscv17handleConsoleTrapEv>:

void Riscv::handleConsoleTrap() {
    8000408c:	fc010113          	addi	sp,sp,-64
    80004090:	02113c23          	sd	ra,56(sp)
    80004094:	02813823          	sd	s0,48(sp)
    80004098:	02913423          	sd	s1,40(sp)
    8000409c:	03213023          	sd	s2,32(sp)
    800040a0:	04010413          	addi	s0,sp,64
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800040a4:	141027f3          	csrr	a5,sepc
    800040a8:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    800040ac:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800040b0:	100027f3          	csrr	a5,sstatus
    800040b4:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    800040b8:	fd043483          	ld	s1,-48(s0)
    uint64 sepc = r_sepc();
    uint64 sstatuc = r_sstatus();
    if (plic_claim() == CONSOLE_IRQ) {
    800040bc:	00001097          	auipc	ra,0x1
    800040c0:	728080e7          	jalr	1832(ra) # 800057e4 <plic_claim>
    800040c4:	00a00793          	li	a5,10
    800040c8:	02f50263          	beq	a0,a5,800040ec <_ZN5Riscv17handleConsoleTrapEv+0x60>
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800040cc:	14191073          	csrw	sepc,s2
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800040d0:	10049073          	csrw	sstatus,s1
        }
        plic_complete(CONSOLE_IRQ);
    }
    w_sepc(sepc);
    w_sstatus(sstatuc);
}
    800040d4:	03813083          	ld	ra,56(sp)
    800040d8:	03013403          	ld	s0,48(sp)
    800040dc:	02813483          	ld	s1,40(sp)
    800040e0:	02013903          	ld	s2,32(sp)
    800040e4:	04010113          	addi	sp,sp,64
    800040e8:	00008067          	ret
        if ((*((char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
    800040ec:	00006797          	auipc	a5,0x6
    800040f0:	1a47b783          	ld	a5,420(a5) # 8000a290 <_GLOBAL_OFFSET_TABLE_+0x18>
    800040f4:	0007b783          	ld	a5,0(a5)
    800040f8:	0007c783          	lbu	a5,0(a5)
    800040fc:	0017f793          	andi	a5,a5,1
    80004100:	00079a63          	bnez	a5,80004114 <_ZN5Riscv17handleConsoleTrapEv+0x88>
        plic_complete(CONSOLE_IRQ);
    80004104:	00a00513          	li	a0,10
    80004108:	00001097          	auipc	ra,0x1
    8000410c:	714080e7          	jalr	1812(ra) # 8000581c <plic_complete>
    80004110:	fbdff06f          	j	800040cc <_ZN5Riscv17handleConsoleTrapEv+0x40>
            volatile char c = *(char *) CONSOLE_RX_DATA;
    80004114:	00006797          	auipc	a5,0x6
    80004118:	16c7b783          	ld	a5,364(a5) # 8000a280 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000411c:	0007b783          	ld	a5,0(a5)
    80004120:	0007c783          	lbu	a5,0(a5)
    80004124:	fcf407a3          	sb	a5,-49(s0)
            IO::Input.put(c);
    80004128:	fcf44583          	lbu	a1,-49(s0)
    8000412c:	0ff5f593          	andi	a1,a1,255
    80004130:	00006517          	auipc	a0,0x6
    80004134:	1a853503          	ld	a0,424(a0) # 8000a2d8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80004138:	fffff097          	auipc	ra,0xfffff
    8000413c:	87c080e7          	jalr	-1924(ra) # 800029b4 <_ZN8IOBuffer3putEc>
    80004140:	fc5ff06f          	j	80004104 <_ZN5Riscv17handleConsoleTrapEv+0x78>

0000000080004144 <_ZN5Riscv10popSppSpieEv>:

void Riscv::popSppSpie() {
    80004144:	ff010113          	addi	sp,sp,-16
    80004148:	00813423          	sd	s0,8(sp)
    8000414c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80004150:	10000793          	li	a5,256
    80004154:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    80004158:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    8000415c:	10200073          	sret
}
    80004160:	00813403          	ld	s0,8(sp)
    80004164:	01010113          	addi	sp,sp,16
    80004168:	00008067          	ret

000000008000416c <_ZN5Riscv14handleReadTrapEv>:

void Riscv::handleReadTrap() {
    8000416c:	ff010113          	addi	sp,sp,-16
    80004170:	00813423          	sd	s0,8(sp)
    80004174:	01010413          	addi	s0,sp,16
    *(volatile char *) CONSOLE_TX_DATA = '!';
    80004178:	00006797          	auipc	a5,0x6
    8000417c:	1507b783          	ld	a5,336(a5) # 8000a2c8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80004180:	0007b783          	ld	a5,0(a5)
    80004184:	02100713          	li	a4,33
    80004188:	00e78023          	sb	a4,0(a5)
    *(volatile char *) CONSOLE_TX_DATA = 'r';
    8000418c:	07200713          	li	a4,114
    80004190:	00e78023          	sb	a4,0(a5)
}
    80004194:	00813403          	ld	s0,8(sp)
    80004198:	01010113          	addi	sp,sp,16
    8000419c:	00008067          	ret

00000000800041a0 <_ZN5Riscv15handleWriteTrapEv>:

void Riscv::handleWriteTrap() {
    800041a0:	ff010113          	addi	sp,sp,-16
    800041a4:	00813423          	sd	s0,8(sp)
    800041a8:	01010413          	addi	s0,sp,16
    *(volatile char *) CONSOLE_TX_DATA = '!';
    800041ac:	00006797          	auipc	a5,0x6
    800041b0:	11c7b783          	ld	a5,284(a5) # 8000a2c8 <_GLOBAL_OFFSET_TABLE_+0x50>
    800041b4:	0007b783          	ld	a5,0(a5)
    800041b8:	02100713          	li	a4,33
    800041bc:	00e78023          	sb	a4,0(a5)
    *(volatile char *) CONSOLE_TX_DATA = 'w';
    800041c0:	07700713          	li	a4,119
    800041c4:	00e78023          	sb	a4,0(a5)
    800041c8:	00813403          	ld	s0,8(sp)
    800041cc:	01010113          	addi	sp,sp,16
    800041d0:	00008067          	ret

00000000800041d4 <_ZN9Scheduler3getEv>:
    } else {
        Scheduler::low_priority.put(thread);
    }
}

TCB *Scheduler::get() {
    800041d4:	ff010113          	addi	sp,sp,-16
    800041d8:	00113423          	sd	ra,8(sp)
    800041dc:	00813023          	sd	s0,0(sp)
    800041e0:	01010413          	addi	s0,sp,16
    800041e4:	00006797          	auipc	a5,0x6
    800041e8:	1f47a783          	lw	a5,500(a5) # 8000a3d8 <_ZN9Scheduler13high_priorityE+0x10>
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.get();
    800041ec:	02079863          	bnez	a5,8000421c <_ZN9Scheduler3getEv+0x48>
    800041f0:	00006797          	auipc	a5,0x6
    800041f4:	2007a783          	lw	a5,512(a5) # 8000a3f0 <_ZN9Scheduler12mid_priorityE+0x10>
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.get();
    800041f8:	02078c63          	beqz	a5,80004230 <_ZN9Scheduler3getEv+0x5c>
    800041fc:	00006517          	auipc	a0,0x6
    80004200:	1e450513          	addi	a0,a0,484 # 8000a3e0 <_ZN9Scheduler12mid_priorityE>
    80004204:	ffffe097          	auipc	ra,0xffffe
    80004208:	2fc080e7          	jalr	764(ra) # 80002500 <_ZN3stm14CircularBufferIP3TCBE3getEv>
    return Scheduler::low_priority.get();
}
    8000420c:	00813083          	ld	ra,8(sp)
    80004210:	00013403          	ld	s0,0(sp)
    80004214:	01010113          	addi	sp,sp,16
    80004218:	00008067          	ret
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.get();
    8000421c:	00006517          	auipc	a0,0x6
    80004220:	1ac50513          	addi	a0,a0,428 # 8000a3c8 <_ZN9Scheduler13high_priorityE>
    80004224:	ffffe097          	auipc	ra,0xffffe
    80004228:	2dc080e7          	jalr	732(ra) # 80002500 <_ZN3stm14CircularBufferIP3TCBE3getEv>
    8000422c:	fe1ff06f          	j	8000420c <_ZN9Scheduler3getEv+0x38>
    return Scheduler::low_priority.get();
    80004230:	00006517          	auipc	a0,0x6
    80004234:	1c850513          	addi	a0,a0,456 # 8000a3f8 <_ZN9Scheduler12low_priorityE>
    80004238:	ffffe097          	auipc	ra,0xffffe
    8000423c:	2c8080e7          	jalr	712(ra) # 80002500 <_ZN3stm14CircularBufferIP3TCBE3getEv>
    80004240:	fcdff06f          	j	8000420c <_ZN9Scheduler3getEv+0x38>

0000000080004244 <_ZN9Scheduler4peekEv>:

TCB *Scheduler::peek() {
    80004244:	ff010113          	addi	sp,sp,-16
    80004248:	00113423          	sd	ra,8(sp)
    8000424c:	00813023          	sd	s0,0(sp)
    80004250:	01010413          	addi	s0,sp,16
    80004254:	00006797          	auipc	a5,0x6
    80004258:	1847a783          	lw	a5,388(a5) # 8000a3d8 <_ZN9Scheduler13high_priorityE+0x10>
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.peek();
    8000425c:	02078463          	beqz	a5,80004284 <_ZN9Scheduler4peekEv+0x40>
    80004260:	00006517          	auipc	a0,0x6
    80004264:	16850513          	addi	a0,a0,360 # 8000a3c8 <_ZN9Scheduler13high_priorityE>
    80004268:	00000097          	auipc	ra,0x0
    8000426c:	100080e7          	jalr	256(ra) # 80004368 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    80004270:	00053503          	ld	a0,0(a0)
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.peek();
    return Scheduler::low_priority.peek();
}
    80004274:	00813083          	ld	ra,8(sp)
    80004278:	00013403          	ld	s0,0(sp)
    8000427c:	01010113          	addi	sp,sp,16
    80004280:	00008067          	ret
    80004284:	00006797          	auipc	a5,0x6
    80004288:	16c7a783          	lw	a5,364(a5) # 8000a3f0 <_ZN9Scheduler12mid_priorityE+0x10>
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.peek();
    8000428c:	00078e63          	beqz	a5,800042a8 <_ZN9Scheduler4peekEv+0x64>
    80004290:	00006517          	auipc	a0,0x6
    80004294:	15050513          	addi	a0,a0,336 # 8000a3e0 <_ZN9Scheduler12mid_priorityE>
    80004298:	00000097          	auipc	ra,0x0
    8000429c:	0d0080e7          	jalr	208(ra) # 80004368 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    800042a0:	00053503          	ld	a0,0(a0)
    800042a4:	fd1ff06f          	j	80004274 <_ZN9Scheduler4peekEv+0x30>
    return Scheduler::low_priority.peek();
    800042a8:	00006517          	auipc	a0,0x6
    800042ac:	15050513          	addi	a0,a0,336 # 8000a3f8 <_ZN9Scheduler12low_priorityE>
    800042b0:	00000097          	auipc	ra,0x0
    800042b4:	0b8080e7          	jalr	184(ra) # 80004368 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    800042b8:	00053503          	ld	a0,0(a0)
    800042bc:	fb9ff06f          	j	80004274 <_ZN9Scheduler4peekEv+0x30>

00000000800042c0 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *thread) {
    800042c0:	ff010113          	addi	sp,sp,-16
    800042c4:	00113423          	sd	ra,8(sp)
    800042c8:	00813023          	sd	s0,0(sp)
    800042cc:	01010413          	addi	s0,sp,16
    800042d0:	00050593          	mv	a1,a0
    bool was_preempted() const { return this->preempted; }
    800042d4:	05854783          	lbu	a5,88(a0)
    if (!thread->was_preempted()) {
    800042d8:	02078e63          	beqz	a5,80004314 <_ZN9Scheduler3putEP3TCB+0x54>
    void reset_preempted() { this->preempted = false; }
    800042dc:	04050c23          	sb	zero,88(a0)
    time_t get_time_slice() const { return this->time_slice; }
    800042e0:	05053783          	ld	a5,80(a0)
    if (time_slice == TimeSlice::HIGH_PRIORITY) {
    800042e4:	00100713          	li	a4,1
    800042e8:	04e78463          	beq	a5,a4,80004330 <_ZN9Scheduler3putEP3TCB+0x70>
    } else if (time_slice == TimeSlice::MID_PRIORITY) {
    800042ec:	00200713          	li	a4,2
    800042f0:	04e78e63          	beq	a5,a4,8000434c <_ZN9Scheduler3putEP3TCB+0x8c>
        Scheduler::low_priority.put(thread);
    800042f4:	00006517          	auipc	a0,0x6
    800042f8:	10450513          	addi	a0,a0,260 # 8000a3f8 <_ZN9Scheduler12low_priorityE>
    800042fc:	ffffe097          	auipc	ra,0xffffe
    80004300:	328080e7          	jalr	808(ra) # 80002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
}
    80004304:	00813083          	ld	ra,8(sp)
    80004308:	00013403          	ld	s0,0(sp)
    8000430c:	01010113          	addi	sp,sp,16
    80004310:	00008067          	ret

    void set_time_slice(time_t time) { this->time_slice = time;}
    80004314:	00100793          	li	a5,1
    80004318:	04f53823          	sd	a5,80(a0)
        Scheduler::high_priority.put(thread);
    8000431c:	00006517          	auipc	a0,0x6
    80004320:	0ac50513          	addi	a0,a0,172 # 8000a3c8 <_ZN9Scheduler13high_priorityE>
    80004324:	ffffe097          	auipc	ra,0xffffe
    80004328:	300080e7          	jalr	768(ra) # 80002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
        return;
    8000432c:	fd9ff06f          	j	80004304 <_ZN9Scheduler3putEP3TCB+0x44>
    80004330:	00200793          	li	a5,2
    80004334:	04f53823          	sd	a5,80(a0)
        Scheduler::mid_priority.put(thread);
    80004338:	00006517          	auipc	a0,0x6
    8000433c:	0a850513          	addi	a0,a0,168 # 8000a3e0 <_ZN9Scheduler12mid_priorityE>
    80004340:	ffffe097          	auipc	ra,0xffffe
    80004344:	2e4080e7          	jalr	740(ra) # 80002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    80004348:	fbdff06f          	j	80004304 <_ZN9Scheduler3putEP3TCB+0x44>
    8000434c:	00400793          	li	a5,4
    80004350:	04f53823          	sd	a5,80(a0)
        Scheduler::low_priority.put(thread);
    80004354:	00006517          	auipc	a0,0x6
    80004358:	0a450513          	addi	a0,a0,164 # 8000a3f8 <_ZN9Scheduler12low_priorityE>
    8000435c:	ffffe097          	auipc	ra,0xffffe
    80004360:	2c8080e7          	jalr	712(ra) # 80002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    80004364:	fa1ff06f          	j	80004304 <_ZN9Scheduler3putEP3TCB+0x44>

0000000080004368 <_ZN3stm14CircularBufferIP3TCBE4peekEv>:
T &stm::CircularBuffer<T>::peek() {
    80004368:	ff010113          	addi	sp,sp,-16
    8000436c:	00813423          	sd	s0,8(sp)
    80004370:	01010413          	addi	s0,sp,16
    return this->queue[this->head];
    80004374:	00053703          	ld	a4,0(a0)
    80004378:	00852783          	lw	a5,8(a0)
    8000437c:	00379793          	slli	a5,a5,0x3
}
    80004380:	00f70533          	add	a0,a4,a5
    80004384:	00813403          	ld	s0,8(sp)
    80004388:	01010113          	addi	sp,sp,16
    8000438c:	00008067          	ret

0000000080004390 <_ZN10OwnedMutexD1Ev>:

OwnedMutex::OwnedMutex() : owner(nullptr), nesting_count(0) {
    sem_open(&this->myHandle, 1);
}

OwnedMutex::~OwnedMutex() {
    80004390:	fe010113          	addi	sp,sp,-32
    80004394:	00113c23          	sd	ra,24(sp)
    80004398:	00813823          	sd	s0,16(sp)
    8000439c:	00913423          	sd	s1,8(sp)
    800043a0:	02010413          	addi	s0,sp,32
    800043a4:	00050493          	mv	s1,a0
    800043a8:	00006797          	auipc	a5,0x6
    800043ac:	eb078793          	addi	a5,a5,-336 # 8000a258 <_ZTV10OwnedMutex+0x10>
    800043b0:	00f53023          	sd	a5,0(a0)
    sem_close(this->myHandle);
    800043b4:	00853503          	ld	a0,8(a0)
    800043b8:	ffffd097          	auipc	ra,0xffffd
    800043bc:	3c8080e7          	jalr	968(ra) # 80001780 <_Z9sem_closeP3Sem>
class Mutex : public Semaphore {
    800043c0:	00006797          	auipc	a5,0x6
    800043c4:	e6878793          	addi	a5,a5,-408 # 8000a228 <_ZTV5Mutex+0x10>
    800043c8:	00f4b023          	sd	a5,0(s1)
    800043cc:	00048513          	mv	a0,s1
    800043d0:	fffff097          	auipc	ra,0xfffff
    800043d4:	4f0080e7          	jalr	1264(ra) # 800038c0 <_ZN9SemaphoreD1Ev>
}
    800043d8:	01813083          	ld	ra,24(sp)
    800043dc:	01013403          	ld	s0,16(sp)
    800043e0:	00813483          	ld	s1,8(sp)
    800043e4:	02010113          	addi	sp,sp,32
    800043e8:	00008067          	ret

00000000800043ec <_ZN10OwnedMutexD0Ev>:
OwnedMutex::~OwnedMutex() {
    800043ec:	fe010113          	addi	sp,sp,-32
    800043f0:	00113c23          	sd	ra,24(sp)
    800043f4:	00813823          	sd	s0,16(sp)
    800043f8:	00913423          	sd	s1,8(sp)
    800043fc:	02010413          	addi	s0,sp,32
    80004400:	00050493          	mv	s1,a0
}
    80004404:	00000097          	auipc	ra,0x0
    80004408:	f8c080e7          	jalr	-116(ra) # 80004390 <_ZN10OwnedMutexD1Ev>
    8000440c:	00048513          	mv	a0,s1
    80004410:	fffff097          	auipc	ra,0xfffff
    80004414:	590080e7          	jalr	1424(ra) # 800039a0 <_ZdlPv>
    80004418:	01813083          	ld	ra,24(sp)
    8000441c:	01013403          	ld	s0,16(sp)
    80004420:	00813483          	ld	s1,8(sp)
    80004424:	02010113          	addi	sp,sp,32
    80004428:	00008067          	ret

000000008000442c <_ZN10OwnedMutex4waitEv>:

int OwnedMutex::wait() {
    if (this->owner == TCB::running) {
    8000442c:	01053783          	ld	a5,16(a0)
    80004430:	00006717          	auipc	a4,0x6
    80004434:	ec073703          	ld	a4,-320(a4) # 8000a2f0 <_GLOBAL_OFFSET_TABLE_+0x78>
    80004438:	00073703          	ld	a4,0(a4)
    8000443c:	02e78c63          	beq	a5,a4,80004474 <_ZN10OwnedMutex4waitEv+0x48>
int OwnedMutex::wait() {
    80004440:	ff010113          	addi	sp,sp,-16
    80004444:	00113423          	sd	ra,8(sp)
    80004448:	00813023          	sd	s0,0(sp)
    8000444c:	01010413          	addi	s0,sp,16
        this->nesting_count++;
        return 0;
    }
    if (this->owner == nullptr) {
    80004450:	02078c63          	beqz	a5,80004488 <_ZN10OwnedMutex4waitEv+0x5c>
        this->owner = TCB::running;
        this->nesting_count = 1;
    }
    sem_wait(this->myHandle);
    80004454:	00853503          	ld	a0,8(a0)
    80004458:	ffffd097          	auipc	ra,0xffffd
    8000445c:	368080e7          	jalr	872(ra) # 800017c0 <_Z8sem_waitP3Sem>
    return 0;
}
    80004460:	00000513          	li	a0,0
    80004464:	00813083          	ld	ra,8(sp)
    80004468:	00013403          	ld	s0,0(sp)
    8000446c:	01010113          	addi	sp,sp,16
    80004470:	00008067          	ret
        this->nesting_count++;
    80004474:	01852783          	lw	a5,24(a0)
    80004478:	0017879b          	addiw	a5,a5,1
    8000447c:	00f52c23          	sw	a5,24(a0)
}
    80004480:	00000513          	li	a0,0
    80004484:	00008067          	ret
        this->owner = TCB::running;
    80004488:	00e53823          	sd	a4,16(a0)
        this->nesting_count = 1;
    8000448c:	00100793          	li	a5,1
    80004490:	00f52c23          	sw	a5,24(a0)
    80004494:	fc1ff06f          	j	80004454 <_ZN10OwnedMutex4waitEv+0x28>

0000000080004498 <_ZN10OwnedMutex6signalEv>:

int OwnedMutex::signal() {
    if (this->owner != TCB::running) return -1;
    80004498:	01053703          	ld	a4,16(a0)
    8000449c:	00006797          	auipc	a5,0x6
    800044a0:	e547b783          	ld	a5,-428(a5) # 8000a2f0 <_GLOBAL_OFFSET_TABLE_+0x78>
    800044a4:	0007b783          	ld	a5,0(a5)
    800044a8:	04f71a63          	bne	a4,a5,800044fc <_ZN10OwnedMutex6signalEv+0x64>
    this->nesting_count --;
    800044ac:	01852783          	lw	a5,24(a0)
    800044b0:	fff7879b          	addiw	a5,a5,-1
    800044b4:	0007871b          	sext.w	a4,a5
    800044b8:	00f52c23          	sw	a5,24(a0)
    if (this->nesting_count == 0) {
    800044bc:	00070663          	beqz	a4,800044c8 <_ZN10OwnedMutex6signalEv+0x30>
        this->owner = nullptr;
        sem_signal(this->myHandle);
    }
    return 0;
    800044c0:	00000513          	li	a0,0
}
    800044c4:	00008067          	ret
int OwnedMutex::signal() {
    800044c8:	ff010113          	addi	sp,sp,-16
    800044cc:	00113423          	sd	ra,8(sp)
    800044d0:	00813023          	sd	s0,0(sp)
    800044d4:	01010413          	addi	s0,sp,16
        this->owner = nullptr;
    800044d8:	00053823          	sd	zero,16(a0)
        sem_signal(this->myHandle);
    800044dc:	00853503          	ld	a0,8(a0)
    800044e0:	ffffd097          	auipc	ra,0xffffd
    800044e4:	320080e7          	jalr	800(ra) # 80001800 <_Z10sem_signalP3Sem>
    return 0;
    800044e8:	00000513          	li	a0,0
}
    800044ec:	00813083          	ld	ra,8(sp)
    800044f0:	00013403          	ld	s0,0(sp)
    800044f4:	01010113          	addi	sp,sp,16
    800044f8:	00008067          	ret
    if (this->owner != TCB::running) return -1;
    800044fc:	fff00513          	li	a0,-1
    80004500:	00008067          	ret

0000000080004504 <_ZN10OwnedMutexC1Ev>:
OwnedMutex::OwnedMutex() : owner(nullptr), nesting_count(0) {
    80004504:	fe010113          	addi	sp,sp,-32
    80004508:	00113c23          	sd	ra,24(sp)
    8000450c:	00813823          	sd	s0,16(sp)
    80004510:	00913423          	sd	s1,8(sp)
    80004514:	01213023          	sd	s2,0(sp)
    80004518:	02010413          	addi	s0,sp,32
    8000451c:	00050493          	mv	s1,a0
    Mutex() : Semaphore(1) {}
    80004520:	00100593          	li	a1,1
    80004524:	fffff097          	auipc	ra,0xfffff
    80004528:	734080e7          	jalr	1844(ra) # 80003c58 <_ZN9SemaphoreC1Ej>
    8000452c:	00006797          	auipc	a5,0x6
    80004530:	d2c78793          	addi	a5,a5,-724 # 8000a258 <_ZTV10OwnedMutex+0x10>
    80004534:	00f4b023          	sd	a5,0(s1)
    80004538:	0004b823          	sd	zero,16(s1)
    8000453c:	0004ac23          	sw	zero,24(s1)
    sem_open(&this->myHandle, 1);
    80004540:	00100593          	li	a1,1
    80004544:	00848513          	addi	a0,s1,8
    80004548:	ffffd097          	auipc	ra,0xffffd
    8000454c:	1f4080e7          	jalr	500(ra) # 8000173c <_Z8sem_openPP3Semj>
    80004550:	02c0006f          	j	8000457c <_ZN10OwnedMutexC1Ev+0x78>
    80004554:	00050913          	mv	s2,a0
class Mutex : public Semaphore {
    80004558:	00006797          	auipc	a5,0x6
    8000455c:	cd078793          	addi	a5,a5,-816 # 8000a228 <_ZTV5Mutex+0x10>
    80004560:	00f4b023          	sd	a5,0(s1)
    80004564:	00048513          	mv	a0,s1
    80004568:	fffff097          	auipc	ra,0xfffff
    8000456c:	358080e7          	jalr	856(ra) # 800038c0 <_ZN9SemaphoreD1Ev>
    80004570:	00090513          	mv	a0,s2
    80004574:	00007097          	auipc	ra,0x7
    80004578:	f84080e7          	jalr	-124(ra) # 8000b4f8 <_Unwind_Resume>
}
    8000457c:	01813083          	ld	ra,24(sp)
    80004580:	01013403          	ld	s0,16(sp)
    80004584:	00813483          	ld	s1,8(sp)
    80004588:	00013903          	ld	s2,0(sp)
    8000458c:	02010113          	addi	sp,sp,32
    80004590:	00008067          	ret

0000000080004594 <_ZN5MutexD1Ev>:
    80004594:	ff010113          	addi	sp,sp,-16
    80004598:	00113423          	sd	ra,8(sp)
    8000459c:	00813023          	sd	s0,0(sp)
    800045a0:	01010413          	addi	s0,sp,16
    800045a4:	00006797          	auipc	a5,0x6
    800045a8:	c8478793          	addi	a5,a5,-892 # 8000a228 <_ZTV5Mutex+0x10>
    800045ac:	00f53023          	sd	a5,0(a0)
    800045b0:	fffff097          	auipc	ra,0xfffff
    800045b4:	310080e7          	jalr	784(ra) # 800038c0 <_ZN9SemaphoreD1Ev>
    800045b8:	00813083          	ld	ra,8(sp)
    800045bc:	00013403          	ld	s0,0(sp)
    800045c0:	01010113          	addi	sp,sp,16
    800045c4:	00008067          	ret

00000000800045c8 <_ZN5MutexD0Ev>:
    800045c8:	fe010113          	addi	sp,sp,-32
    800045cc:	00113c23          	sd	ra,24(sp)
    800045d0:	00813823          	sd	s0,16(sp)
    800045d4:	00913423          	sd	s1,8(sp)
    800045d8:	02010413          	addi	s0,sp,32
    800045dc:	00050493          	mv	s1,a0
    800045e0:	00006797          	auipc	a5,0x6
    800045e4:	c4878793          	addi	a5,a5,-952 # 8000a228 <_ZTV5Mutex+0x10>
    800045e8:	00f53023          	sd	a5,0(a0)
    800045ec:	fffff097          	auipc	ra,0xfffff
    800045f0:	2d4080e7          	jalr	724(ra) # 800038c0 <_ZN9SemaphoreD1Ev>
    800045f4:	00048513          	mv	a0,s1
    800045f8:	fffff097          	auipc	ra,0xfffff
    800045fc:	3a8080e7          	jalr	936(ra) # 800039a0 <_ZdlPv>
    80004600:	01813083          	ld	ra,24(sp)
    80004604:	01013403          	ld	s0,16(sp)
    80004608:	00813483          	ld	s1,8(sp)
    8000460c:	02010113          	addi	sp,sp,32
    80004610:	00008067          	ret

0000000080004614 <_ZN3TCB12thread_startEv>:
    if (TCB::running != thread->parent) return -4;
    thread->finish();
    return 0;
}

void TCB::thread_start() {
    80004614:	ff010113          	addi	sp,sp,-16
    80004618:	00113423          	sd	ra,8(sp)
    8000461c:	00813023          	sd	s0,0(sp)
    80004620:	01010413          	addi	s0,sp,16
    Riscv::popSppSpie();
    80004624:	00000097          	auipc	ra,0x0
    80004628:	b20080e7          	jalr	-1248(ra) # 80004144 <_ZN5Riscv10popSppSpieEv>
    TCB::running->_run(TCB::running->arg);
    8000462c:	00006797          	auipc	a5,0x6
    80004630:	de47b783          	ld	a5,-540(a5) # 8000a410 <_ZN3TCB7runningE>
    80004634:	0087b703          	ld	a4,8(a5)
    80004638:	0107b503          	ld	a0,16(a5)
    8000463c:	000700e7          	jalr	a4
    thread_exit();
    80004640:	ffffd097          	auipc	ra,0xffffd
    80004644:	f60080e7          	jalr	-160(ra) # 800015a0 <_Z11thread_exitv>
    80004648:	00813083          	ld	ra,8(sp)
    8000464c:	00013403          	ld	s0,0(sp)
    80004650:	01010113          	addi	sp,sp,16
    80004654:	00008067          	ret

0000000080004658 <_ZN3TCB9duplicateEPS_S0_>:
void TCB::duplicate(TCB *parent, TCB *child) {
    80004658:	fe010113          	addi	sp,sp,-32
    8000465c:	00113c23          	sd	ra,24(sp)
    80004660:	00813823          	sd	s0,16(sp)
    80004664:	00913423          	sd	s1,8(sp)
    80004668:	01213023          	sd	s2,0(sp)
    8000466c:	02010413          	addi	s0,sp,32
    80004670:	00050913          	mv	s2,a0
    80004674:	00058493          	mv	s1,a1
    Riscv::push();
    80004678:	ffffd097          	auipc	ra,0xffffd
    8000467c:	ce8080e7          	jalr	-792(ra) # 80001360 <_ZN5Riscv4pushEv>
    memcpy(parent->stack, child->stack, DEFAULT_STACK_SIZE);
    80004680:	00004637          	lui	a2,0x4
    80004684:	0184b583          	ld	a1,24(s1)
    80004688:	01893503          	ld	a0,24(s2)
    8000468c:	fffff097          	auipc	ra,0xfffff
    80004690:	d54080e7          	jalr	-684(ra) # 800033e0 <_Z6memcpyPKvS0_i>
    child->context = parent->context;
    80004694:	02893603          	ld	a2,40(s2)
    80004698:	03093683          	ld	a3,48(s2)
    8000469c:	03893703          	ld	a4,56(s2)
    800046a0:	04093783          	ld	a5,64(s2)
    800046a4:	02c4b423          	sd	a2,40(s1)
    800046a8:	02d4b823          	sd	a3,48(s1)
    800046ac:	02e4bc23          	sd	a4,56(s1)
    800046b0:	04f4b023          	sd	a5,64(s1)
    Riscv::pop();
    800046b4:	ffffd097          	auipc	ra,0xffffd
    800046b8:	d2c080e7          	jalr	-724(ra) # 800013e0 <_ZN5Riscv3popEv>
}
    800046bc:	01813083          	ld	ra,24(sp)
    800046c0:	01013403          	ld	s0,16(sp)
    800046c4:	00813483          	ld	s1,8(sp)
    800046c8:	00013903          	ld	s2,0(sp)
    800046cc:	02010113          	addi	sp,sp,32
    800046d0:	00008067          	ret

00000000800046d4 <_ZN3TCB5_killEPS_>:
int TCB::_kill(TCB *thread) {
    800046d4:	ff010113          	addi	sp,sp,-16
    800046d8:	00813423          	sd	s0,8(sp)
    800046dc:	01010413          	addi	s0,sp,16
    if (!thread) return -1;
    800046e0:	02050c63          	beqz	a0,80004718 <_ZN3TCB5_killEPS_+0x44>
    bool is_finished() const { return this->status == FINISHED; }
    800046e4:	04852703          	lw	a4,72(a0)
    if (thread->is_finished()) return -2;
    800046e8:	00400793          	li	a5,4
    800046ec:	02f70a63          	beq	a4,a5,80004720 <_ZN3TCB5_killEPS_+0x4c>
    if (TCB::running != thread->parent) return -4;
    800046f0:	02053703          	ld	a4,32(a0)
    800046f4:	00006797          	auipc	a5,0x6
    800046f8:	d1c7b783          	ld	a5,-740(a5) # 8000a410 <_ZN3TCB7runningE>
    800046fc:	02f71663          	bne	a4,a5,80004728 <_ZN3TCB5_killEPS_+0x54>
    void finish() { this->status = FINISHED; }
    80004700:	00400793          	li	a5,4
    80004704:	04f52423          	sw	a5,72(a0)
    return 0;
    80004708:	00000513          	li	a0,0
}
    8000470c:	00813403          	ld	s0,8(sp)
    80004710:	01010113          	addi	sp,sp,16
    80004714:	00008067          	ret
    if (!thread) return -1;
    80004718:	fff00513          	li	a0,-1
    8000471c:	ff1ff06f          	j	8000470c <_ZN3TCB5_killEPS_+0x38>
    if (thread->is_finished()) return -2;
    80004720:	ffe00513          	li	a0,-2
    80004724:	fe9ff06f          	j	8000470c <_ZN3TCB5_killEPS_+0x38>
    if (TCB::running != thread->parent) return -4;
    80004728:	ffc00513          	li	a0,-4
    8000472c:	fe1ff06f          	j	8000470c <_ZN3TCB5_killEPS_+0x38>

0000000080004730 <_ZN3TCBC1EPFvPvES0_S0_7Context>:
TCB::TCB(run_t start_routine, void *arg, void *stack, Context context) :
    80004730:	fe010113          	addi	sp,sp,-32
    80004734:	00113c23          	sd	ra,24(sp)
    80004738:	00813823          	sd	s0,16(sp)
    8000473c:	00913423          	sd	s1,8(sp)
    80004740:	01213023          	sd	s2,0(sp)
    80004744:	02010413          	addi	s0,sp,32
    80004748:	00050493          	mv	s1,a0
        t_id(TCB::ID++), _run(start_routine), arg(arg),
    8000474c:	00006917          	auipc	s2,0x6
    80004750:	cc490913          	addi	s2,s2,-828 # 8000a410 <_ZN3TCB7runningE>
    80004754:	00892783          	lw	a5,8(s2)
    80004758:	0017851b          	addiw	a0,a5,1
    8000475c:	00a92423          	sw	a0,8(s2)
        time_slice(DEFAULT_TIME_SLICE), preempted(false), joiner() {
    80004760:	00f4a023          	sw	a5,0(s1)
    80004764:	00b4b423          	sd	a1,8(s1)
    80004768:	00c4b823          	sd	a2,16(s1)
    8000476c:	00d4bc23          	sd	a3,24(s1)
    80004770:	00093783          	ld	a5,0(s2)
    80004774:	02f4b023          	sd	a5,32(s1)
    80004778:	00073583          	ld	a1,0(a4)
    8000477c:	00873603          	ld	a2,8(a4)
    80004780:	01073683          	ld	a3,16(a4)
    80004784:	01873783          	ld	a5,24(a4)
    80004788:	02b4b423          	sd	a1,40(s1)
    8000478c:	02c4b823          	sd	a2,48(s1)
    80004790:	02d4bc23          	sd	a3,56(s1)
    80004794:	04f4b023          	sd	a5,64(s1)
    80004798:	0404a423          	sw	zero,72(s1)
    8000479c:	00100793          	li	a5,1
    800047a0:	04f4b823          	sd	a5,80(s1)
    800047a4:	04048c23          	sb	zero,88(s1)
    800047a8:	0604b023          	sd	zero,96(s1)
    800047ac:	0604a423          	sw	zero,104(s1)
    800047b0:	0604a623          	sw	zero,108(s1)
    800047b4:	0604a823          	sw	zero,112(s1)
    800047b8:	0604aa23          	sw	zero,116(s1)
    this->joiner.init();
    800047bc:	06048513          	addi	a0,s1,96
    800047c0:	ffffe097          	auipc	ra,0xffffe
    800047c4:	cf0080e7          	jalr	-784(ra) # 800024b0 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    this->parent = TCB::running;
    800047c8:	00093783          	ld	a5,0(s2)
    800047cc:	02f4b023          	sd	a5,32(s1)
}
    800047d0:	01813083          	ld	ra,24(sp)
    800047d4:	01013403          	ld	s0,16(sp)
    800047d8:	00813483          	ld	s1,8(sp)
    800047dc:	00013903          	ld	s2,0(sp)
    800047e0:	02010113          	addi	sp,sp,32
    800047e4:	00008067          	ret

00000000800047e8 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_>:
int TCB::_thread_create(thread_t *handle, void(*start_routine)(void *), void *arg, void *stack) {
    800047e8:	f8010113          	addi	sp,sp,-128
    800047ec:	06113c23          	sd	ra,120(sp)
    800047f0:	06813823          	sd	s0,112(sp)
    800047f4:	06913423          	sd	s1,104(sp)
    800047f8:	07213023          	sd	s2,96(sp)
    800047fc:	05313c23          	sd	s3,88(sp)
    80004800:	05413823          	sd	s4,80(sp)
    80004804:	05513423          	sd	s5,72(sp)
    80004808:	08010413          	addi	s0,sp,128
    8000480c:	00050913          	mv	s2,a0
    80004810:	00058993          	mv	s3,a1
    80004814:	00060a93          	mv	s5,a2
    80004818:	00068a13          	mv	s4,a3
    *handle = new TCB(start_routine, arg, stack, {(uint64) thread_start, (uint64) stack + DEFAULT_STACK_SIZE - 1});
    8000481c:	fa043823          	sd	zero,-80(s0)
    80004820:	fa043c23          	sd	zero,-72(s0)
    80004824:	00000797          	auipc	a5,0x0
    80004828:	df078793          	addi	a5,a5,-528 # 80004614 <_ZN3TCB12thread_startEv>
    8000482c:	faf43023          	sd	a5,-96(s0)
    80004830:	000047b7          	lui	a5,0x4
    80004834:	fff78793          	addi	a5,a5,-1 # 3fff <_entry-0x7fffc001>
    80004838:	00f687b3          	add	a5,a3,a5
    8000483c:	faf43423          	sd	a5,-88(s0)
    80004840:	07800513          	li	a0,120
    80004844:	fffff097          	auipc	ra,0xfffff
    80004848:	10c080e7          	jalr	268(ra) # 80003950 <_Znwm>
    8000484c:	00050493          	mv	s1,a0
    80004850:	fa043783          	ld	a5,-96(s0)
    80004854:	f8f43023          	sd	a5,-128(s0)
    80004858:	fa843783          	ld	a5,-88(s0)
    8000485c:	f8f43423          	sd	a5,-120(s0)
    80004860:	fb043783          	ld	a5,-80(s0)
    80004864:	f8f43823          	sd	a5,-112(s0)
    80004868:	fb843783          	ld	a5,-72(s0)
    8000486c:	f8f43c23          	sd	a5,-104(s0)
    80004870:	f8040713          	addi	a4,s0,-128
    80004874:	000a0693          	mv	a3,s4
    80004878:	000a8613          	mv	a2,s5
    8000487c:	00098593          	mv	a1,s3
    80004880:	00000097          	auipc	ra,0x0
    80004884:	eb0080e7          	jalr	-336(ra) # 80004730 <_ZN3TCBC1EPFvPvES0_S0_7Context>
    80004888:	00993023          	sd	s1,0(s2)
    if (start_routine) Scheduler::put(*handle);
    8000488c:	02098e63          	beqz	s3,800048c8 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0xe0>
    80004890:	00048513          	mv	a0,s1
    80004894:	00000097          	auipc	ra,0x0
    80004898:	a2c080e7          	jalr	-1492(ra) # 800042c0 <_ZN9Scheduler3putEP3TCB>
    return (*handle)->t_id;
    8000489c:	00093783          	ld	a5,0(s2)
    800048a0:	0007a503          	lw	a0,0(a5)
}
    800048a4:	07813083          	ld	ra,120(sp)
    800048a8:	07013403          	ld	s0,112(sp)
    800048ac:	06813483          	ld	s1,104(sp)
    800048b0:	06013903          	ld	s2,96(sp)
    800048b4:	05813983          	ld	s3,88(sp)
    800048b8:	05013a03          	ld	s4,80(sp)
    800048bc:	04813a83          	ld	s5,72(sp)
    800048c0:	08010113          	addi	sp,sp,128
    800048c4:	00008067          	ret
    else TCB::running = *handle;
    800048c8:	00006797          	auipc	a5,0x6
    800048cc:	b497b423          	sd	s1,-1208(a5) # 8000a410 <_ZN3TCB7runningE>
    800048d0:	fcdff06f          	j	8000489c <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0xb4>
    800048d4:	00050913          	mv	s2,a0
    *handle = new TCB(start_routine, arg, stack, {(uint64) thread_start, (uint64) stack + DEFAULT_STACK_SIZE - 1});
    800048d8:	00048513          	mv	a0,s1
    800048dc:	fffff097          	auipc	ra,0xfffff
    800048e0:	0c4080e7          	jalr	196(ra) # 800039a0 <_ZdlPv>
    800048e4:	00090513          	mv	a0,s2
    800048e8:	00007097          	auipc	ra,0x7
    800048ec:	c10080e7          	jalr	-1008(ra) # 8000b4f8 <_Unwind_Resume>

00000000800048f0 <_ZN3TCBC1ERS_>:
TCB::TCB(TCB &parent) :
    800048f0:	fe010113          	addi	sp,sp,-32
    800048f4:	00113c23          	sd	ra,24(sp)
    800048f8:	00813823          	sd	s0,16(sp)
    800048fc:	00913423          	sd	s1,8(sp)
    80004900:	01213023          	sd	s2,0(sp)
    80004904:	02010413          	addi	s0,sp,32
    80004908:	00050493          	mv	s1,a0
    8000490c:	00058913          	mv	s2,a1
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    80004910:	00006717          	auipc	a4,0x6
    80004914:	b0070713          	addi	a4,a4,-1280 # 8000a410 <_ZN3TCB7runningE>
    80004918:	00872783          	lw	a5,8(a4)
    8000491c:	0017869b          	addiw	a3,a5,1
    80004920:	00d72423          	sw	a3,8(a4)
        preempted(false), joiner() {
    80004924:	00f52023          	sw	a5,0(a0)
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    80004928:	0085b783          	ld	a5,8(a1)
        preempted(false), joiner() {
    8000492c:	00f53423          	sd	a5,8(a0)
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    80004930:	0105b783          	ld	a5,16(a1)
        preempted(false), joiner() {
    80004934:	00f53823          	sd	a5,16(a0)
        stack(Allocator::_mem_alloc(DEFAULT_STACK_SIZE)),
    80004938:	00004537          	lui	a0,0x4
    8000493c:	ffffe097          	auipc	ra,0xffffe
    80004940:	7cc080e7          	jalr	1996(ra) # 80003108 <_ZN9Allocator10_mem_allocEm>
        preempted(false), joiner() {
    80004944:	00a4bc23          	sd	a0,24(s1)
    80004948:	0324b023          	sd	s2,32(s1)
    8000494c:	02893603          	ld	a2,40(s2)
    80004950:	03093683          	ld	a3,48(s2)
    80004954:	03893703          	ld	a4,56(s2)
    80004958:	04093783          	ld	a5,64(s2)
    8000495c:	02c4b423          	sd	a2,40(s1)
    80004960:	02d4b823          	sd	a3,48(s1)
    80004964:	02e4bc23          	sd	a4,56(s1)
    80004968:	04f4b023          	sd	a5,64(s1)
    8000496c:	0404a423          	sw	zero,72(s1)
    80004970:	00100793          	li	a5,1
    80004974:	04f4b823          	sd	a5,80(s1)
    80004978:	04048c23          	sb	zero,88(s1)
    8000497c:	0604b023          	sd	zero,96(s1)
    80004980:	0604a423          	sw	zero,104(s1)
    80004984:	0604a623          	sw	zero,108(s1)
    80004988:	0604a823          	sw	zero,112(s1)
    8000498c:	0604aa23          	sw	zero,116(s1)
    this->joiner.init();
    80004990:	06048513          	addi	a0,s1,96
    80004994:	ffffe097          	auipc	ra,0xffffe
    80004998:	b1c080e7          	jalr	-1252(ra) # 800024b0 <_ZN3stm14CircularBufferIP3TCBE4initEv>
}
    8000499c:	01813083          	ld	ra,24(sp)
    800049a0:	01013403          	ld	s0,16(sp)
    800049a4:	00813483          	ld	s1,8(sp)
    800049a8:	00013903          	ld	s2,0(sp)
    800049ac:	02010113          	addi	sp,sp,32
    800049b0:	00008067          	ret

00000000800049b4 <_ZN3TCB5_forkEv>:
int TCB::_fork() {
    800049b4:	fd010113          	addi	sp,sp,-48
    800049b8:	02113423          	sd	ra,40(sp)
    800049bc:	02813023          	sd	s0,32(sp)
    800049c0:	00913c23          	sd	s1,24(sp)
    800049c4:	01213823          	sd	s2,16(sp)
    800049c8:	01313423          	sd	s3,8(sp)
    800049cc:	03010413          	addi	s0,sp,48
    int id_parent = TCB::running->t_id;
    800049d0:	00006917          	auipc	s2,0x6
    800049d4:	a4090913          	addi	s2,s2,-1472 # 8000a410 <_ZN3TCB7runningE>
    800049d8:	00093783          	ld	a5,0(s2)
    800049dc:	0007a983          	lw	s3,0(a5)
    TCB *handle = new TCB(*TCB::running);
    800049e0:	07800513          	li	a0,120
    800049e4:	fffff097          	auipc	ra,0xfffff
    800049e8:	f6c080e7          	jalr	-148(ra) # 80003950 <_Znwm>
    800049ec:	00050493          	mv	s1,a0
    800049f0:	00093583          	ld	a1,0(s2)
    800049f4:	00000097          	auipc	ra,0x0
    800049f8:	efc080e7          	jalr	-260(ra) # 800048f0 <_ZN3TCBC1ERS_>
    TCB::duplicate(TCB::running, handle);
    800049fc:	00048593          	mv	a1,s1
    80004a00:	00093503          	ld	a0,0(s2)
    80004a04:	00000097          	auipc	ra,0x0
    80004a08:	c54080e7          	jalr	-940(ra) # 80004658 <_ZN3TCB9duplicateEPS_S0_>
    print(TCB::running->t_id);
    80004a0c:	00093783          	ld	a5,0(s2)
    80004a10:	0007a503          	lw	a0,0(a5)
    80004a14:	ffffe097          	auipc	ra,0xffffe
    80004a18:	df0080e7          	jalr	-528(ra) # 80002804 <_Z5printi>
    putc(' ');
    80004a1c:	02000513          	li	a0,32
    80004a20:	ffffd097          	auipc	ra,0xffffd
    80004a24:	f6c080e7          	jalr	-148(ra) # 8000198c <_Z4putcc>
    print(id_parent);
    80004a28:	00098513          	mv	a0,s3
    80004a2c:	ffffe097          	auipc	ra,0xffffe
    80004a30:	dd8080e7          	jalr	-552(ra) # 80002804 <_Z5printi>
    putc(' ');
    80004a34:	02000513          	li	a0,32
    80004a38:	ffffd097          	auipc	ra,0xffffd
    80004a3c:	f54080e7          	jalr	-172(ra) # 8000198c <_Z4putcc>
    print(handle->t_id);
    80004a40:	0004a503          	lw	a0,0(s1)
    80004a44:	ffffe097          	auipc	ra,0xffffe
    80004a48:	dc0080e7          	jalr	-576(ra) # 80002804 <_Z5printi>
    putc('\n');
    80004a4c:	00a00513          	li	a0,10
    80004a50:	ffffd097          	auipc	ra,0xffffd
    80004a54:	f3c080e7          	jalr	-196(ra) # 8000198c <_Z4putcc>
    if (TCB::running->t_id == id_parent) {
    80004a58:	00093783          	ld	a5,0(s2)
    80004a5c:	0007a503          	lw	a0,0(a5)
    80004a60:	03350663          	beq	a0,s3,80004a8c <_ZN3TCB5_forkEv+0xd8>
        print(TCB::running->t_id);
    80004a64:	ffffe097          	auipc	ra,0xffffe
    80004a68:	da0080e7          	jalr	-608(ra) # 80002804 <_Z5printi>
        return 0;
    80004a6c:	00000513          	li	a0,0
}
    80004a70:	02813083          	ld	ra,40(sp)
    80004a74:	02013403          	ld	s0,32(sp)
    80004a78:	01813483          	ld	s1,24(sp)
    80004a7c:	01013903          	ld	s2,16(sp)
    80004a80:	00813983          	ld	s3,8(sp)
    80004a84:	03010113          	addi	sp,sp,48
    80004a88:	00008067          	ret
        Scheduler::put(handle);
    80004a8c:	00048513          	mv	a0,s1
    80004a90:	00000097          	auipc	ra,0x0
    80004a94:	830080e7          	jalr	-2000(ra) # 800042c0 <_ZN9Scheduler3putEP3TCB>
        return handle->t_id;
    80004a98:	0004a503          	lw	a0,0(s1)
    80004a9c:	fd5ff06f          	j	80004a70 <_ZN3TCB5_forkEv+0xbc>
    80004aa0:	00050913          	mv	s2,a0
    TCB *handle = new TCB(*TCB::running);
    80004aa4:	00048513          	mv	a0,s1
    80004aa8:	fffff097          	auipc	ra,0xfffff
    80004aac:	ef8080e7          	jalr	-264(ra) # 800039a0 <_ZdlPv>
    80004ab0:	00090513          	mv	a0,s2
    80004ab4:	00007097          	auipc	ra,0x7
    80004ab8:	a44080e7          	jalr	-1468(ra) # 8000b4f8 <_Unwind_Resume>

0000000080004abc <_ZN3TCB14destroy_threadEPS_>:
TCB *TCB::destroy_thread(TCB *thread) {
    80004abc:	fe010113          	addi	sp,sp,-32
    80004ac0:	00113c23          	sd	ra,24(sp)
    80004ac4:	00813823          	sd	s0,16(sp)
    80004ac8:	00913423          	sd	s1,8(sp)
    80004acc:	02010413          	addi	s0,sp,32
    80004ad0:	00050493          	mv	s1,a0
        inline bool is_empty() const { return this->size == 0; }
    80004ad4:	0704a783          	lw	a5,112(s1)
    while (!thread->joiner.is_empty()) {
    80004ad8:	02078663          	beqz	a5,80004b04 <_ZN3TCB14destroy_threadEPS_+0x48>
        TCB *next = thread->joiner.get();
    80004adc:	06048513          	addi	a0,s1,96
    80004ae0:	ffffe097          	auipc	ra,0xffffe
    80004ae4:	a20080e7          	jalr	-1504(ra) # 80002500 <_ZN3stm14CircularBufferIP3TCBE3getEv>
    bool is_joined() const { return this->status == JOINED; }
    80004ae8:	04852703          	lw	a4,72(a0) # 4048 <_entry-0x7fffbfb8>
        if (next->is_joined()) {
    80004aec:	00300793          	li	a5,3
    80004af0:	fef712e3          	bne	a4,a5,80004ad4 <_ZN3TCB14destroy_threadEPS_+0x18>
    void run() { this->status = RUNNABLE; }
    80004af4:	04052423          	sw	zero,72(a0)
            Scheduler::put(next);
    80004af8:	fffff097          	auipc	ra,0xfffff
    80004afc:	7c8080e7          	jalr	1992(ra) # 800042c0 <_ZN9Scheduler3putEP3TCB>
    80004b00:	fd5ff06f          	j	80004ad4 <_ZN3TCB14destroy_threadEPS_+0x18>
    thread->joiner.destroy();
    80004b04:	06048513          	addi	a0,s1,96
    80004b08:	ffffe097          	auipc	ra,0xffffe
    80004b0c:	a44080e7          	jalr	-1468(ra) # 8000254c <_ZN3stm14CircularBufferIP3TCBE7destroyEv>
}
    80004b10:	00048513          	mv	a0,s1
    80004b14:	01813083          	ld	ra,24(sp)
    80004b18:	01013403          	ld	s0,16(sp)
    80004b1c:	00813483          	ld	s1,8(sp)
    80004b20:	02010113          	addi	sp,sp,32
    80004b24:	00008067          	ret

0000000080004b28 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80004b28:	fe010113          	addi	sp,sp,-32
    80004b2c:	00113c23          	sd	ra,24(sp)
    80004b30:	00813823          	sd	s0,16(sp)
    80004b34:	00913423          	sd	s1,8(sp)
    80004b38:	02010413          	addi	s0,sp,32
    thread_t old = TCB::running;
    80004b3c:	00006497          	auipc	s1,0x6
    80004b40:	8d44b483          	ld	s1,-1836(s1) # 8000a410 <_ZN3TCB7runningE>
    bool is_runnable() const { return this->status == RUNNABLE; }
    80004b44:	0484a783          	lw	a5,72(s1)
    if (old->is_runnable() && old != handle_bleya) {
    80004b48:	02079263          	bnez	a5,80004b6c <_ZN3TCB5yieldEv+0x44>
    80004b4c:	00005717          	auipc	a4,0x5
    80004b50:	74c73703          	ld	a4,1868(a4) # 8000a298 <_GLOBAL_OFFSET_TABLE_+0x20>
    80004b54:	00073703          	ld	a4,0(a4)
    80004b58:	00970a63          	beq	a4,s1,80004b6c <_ZN3TCB5yieldEv+0x44>
        Scheduler::put(old);
    80004b5c:	00048513          	mv	a0,s1
    80004b60:	fffff097          	auipc	ra,0xfffff
    80004b64:	760080e7          	jalr	1888(ra) # 800042c0 <_ZN9Scheduler3putEP3TCB>
    80004b68:	00c0006f          	j	80004b74 <_ZN3TCB5yieldEv+0x4c>
    } else if (old->is_finished()) {
    80004b6c:	00400713          	li	a4,4
    80004b70:	04e78663          	beq	a5,a4,80004bbc <_ZN3TCB5yieldEv+0x94>
    80004b74:	00005797          	auipc	a5,0x5
    80004b78:	7947b783          	ld	a5,1940(a5) # 8000a308 <_GLOBAL_OFFSET_TABLE_+0x90>
    80004b7c:	0107a783          	lw	a5,16(a5)
    80004b80:	06079463          	bnez	a5,80004be8 <_ZN3TCB5yieldEv+0xc0>
    80004b84:	00005797          	auipc	a5,0x5
    80004b88:	7647b783          	ld	a5,1892(a5) # 8000a2e8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80004b8c:	0107a783          	lw	a5,16(a5)
    80004b90:	04079c63          	bnez	a5,80004be8 <_ZN3TCB5yieldEv+0xc0>
    80004b94:	00005797          	auipc	a5,0x5
    80004b98:	72c7b783          	ld	a5,1836(a5) # 8000a2c0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004b9c:	0107a783          	lw	a5,16(a5)
    80004ba0:	04079463          	bnez	a5,80004be8 <_ZN3TCB5yieldEv+0xc0>
        TCB::running = handle_bleya;
    80004ba4:	00005797          	auipc	a5,0x5
    80004ba8:	6f47b783          	ld	a5,1780(a5) # 8000a298 <_GLOBAL_OFFSET_TABLE_+0x20>
    80004bac:	0007b783          	ld	a5,0(a5)
    80004bb0:	00006717          	auipc	a4,0x6
    80004bb4:	86f73023          	sd	a5,-1952(a4) # 8000a410 <_ZN3TCB7runningE>
    80004bb8:	0540006f          	j	80004c0c <_ZN3TCB5yieldEv+0xe4>
        Allocator::_mem_free(old->stack);
    80004bbc:	0184b503          	ld	a0,24(s1)
    80004bc0:	ffffe097          	auipc	ra,0xffffe
    80004bc4:	604080e7          	jalr	1540(ra) # 800031c4 <_ZN9Allocator9_mem_freeEPKv>
    80004bc8:	fadff06f          	j	80004b74 <_ZN3TCB5yieldEv+0x4c>
            Allocator::_mem_free(TCB::destroy_thread(Scheduler::get())->stack);
    80004bcc:	fffff097          	auipc	ra,0xfffff
    80004bd0:	608080e7          	jalr	1544(ra) # 800041d4 <_ZN9Scheduler3getEv>
    80004bd4:	00000097          	auipc	ra,0x0
    80004bd8:	ee8080e7          	jalr	-280(ra) # 80004abc <_ZN3TCB14destroy_threadEPS_>
    80004bdc:	01853503          	ld	a0,24(a0)
    80004be0:	ffffe097          	auipc	ra,0xffffe
    80004be4:	5e4080e7          	jalr	1508(ra) # 800031c4 <_ZN9Allocator9_mem_freeEPKv>
        while (Scheduler::peek()->is_finished()) {
    80004be8:	fffff097          	auipc	ra,0xfffff
    80004bec:	65c080e7          	jalr	1628(ra) # 80004244 <_ZN9Scheduler4peekEv>
    bool is_finished() const { return this->status == FINISHED; }
    80004bf0:	04852703          	lw	a4,72(a0)
    80004bf4:	00400793          	li	a5,4
    80004bf8:	fcf70ae3          	beq	a4,a5,80004bcc <_ZN3TCB5yieldEv+0xa4>
        TCB::running = Scheduler::get();
    80004bfc:	fffff097          	auipc	ra,0xfffff
    80004c00:	5d8080e7          	jalr	1496(ra) # 800041d4 <_ZN9Scheduler3getEv>
    80004c04:	00006797          	auipc	a5,0x6
    80004c08:	80a7b623          	sd	a0,-2036(a5) # 8000a410 <_ZN3TCB7runningE>
    TCB::context_switch(&old->context, &TCB::running->context);
    80004c0c:	00006597          	auipc	a1,0x6
    80004c10:	8045b583          	ld	a1,-2044(a1) # 8000a410 <_ZN3TCB7runningE>
    80004c14:	02858593          	addi	a1,a1,40
    80004c18:	02848513          	addi	a0,s1,40
    80004c1c:	ffffd097          	auipc	ra,0xffffd
    80004c20:	844080e7          	jalr	-1980(ra) # 80001460 <_ZN3TCB14context_switchEP7ContextS1_>
}
    80004c24:	01813083          	ld	ra,24(sp)
    80004c28:	01013403          	ld	s0,16(sp)
    80004c2c:	00813483          	ld	s1,8(sp)
    80004c30:	02010113          	addi	sp,sp,32
    80004c34:	00008067          	ret

0000000080004c38 <_ZN3TCB16_thread_dispatchEv>:
void TCB::_thread_dispatch() {
    80004c38:	ff010113          	addi	sp,sp,-16
    80004c3c:	00113423          	sd	ra,8(sp)
    80004c40:	00813023          	sd	s0,0(sp)
    80004c44:	01010413          	addi	s0,sp,16
    Riscv::push();
    80004c48:	ffffc097          	auipc	ra,0xffffc
    80004c4c:	718080e7          	jalr	1816(ra) # 80001360 <_ZN5Riscv4pushEv>
    TCB::yield();
    80004c50:	00000097          	auipc	ra,0x0
    80004c54:	ed8080e7          	jalr	-296(ra) # 80004b28 <_ZN3TCB5yieldEv>
    Riscv::pop();
    80004c58:	ffffc097          	auipc	ra,0xffffc
    80004c5c:	788080e7          	jalr	1928(ra) # 800013e0 <_ZN5Riscv3popEv>
}
    80004c60:	00813083          	ld	ra,8(sp)
    80004c64:	00013403          	ld	s0,0(sp)
    80004c68:	01010113          	addi	sp,sp,16
    80004c6c:	00008067          	ret

0000000080004c70 <_ZN3TCB12_thread_exitEv>:
void TCB::_thread_exit() {
    80004c70:	ff010113          	addi	sp,sp,-16
    80004c74:	00113423          	sd	ra,8(sp)
    80004c78:	00813023          	sd	s0,0(sp)
    80004c7c:	01010413          	addi	s0,sp,16
    TCB::running->finish();
    80004c80:	00005517          	auipc	a0,0x5
    80004c84:	79053503          	ld	a0,1936(a0) # 8000a410 <_ZN3TCB7runningE>
    void finish() { this->status = FINISHED; }
    80004c88:	00400793          	li	a5,4
    80004c8c:	04f52423          	sw	a5,72(a0)
    TCB::destroy_thread(TCB::running);
    80004c90:	00000097          	auipc	ra,0x0
    80004c94:	e2c080e7          	jalr	-468(ra) # 80004abc <_ZN3TCB14destroy_threadEPS_>
    TCB::_thread_dispatch();
    80004c98:	00000097          	auipc	ra,0x0
    80004c9c:	fa0080e7          	jalr	-96(ra) # 80004c38 <_ZN3TCB16_thread_dispatchEv>
}
    80004ca0:	00813083          	ld	ra,8(sp)
    80004ca4:	00013403          	ld	s0,0(sp)
    80004ca8:	01010113          	addi	sp,sp,16
    80004cac:	00008067          	ret

0000000080004cb0 <_ZN3TCB12_thread_joinEPS_>:
    bool is_finished() const { return this->status == FINISHED; }
    80004cb0:	04852703          	lw	a4,72(a0)
    if (handle->is_finished())
    80004cb4:	00400793          	li	a5,4
    80004cb8:	04f70463          	beq	a4,a5,80004d00 <_ZN3TCB12_thread_joinEPS_+0x50>
void TCB::_thread_join(thread_t handle) {
    80004cbc:	ff010113          	addi	sp,sp,-16
    80004cc0:	00113423          	sd	ra,8(sp)
    80004cc4:	00813023          	sd	s0,0(sp)
    80004cc8:	01010413          	addi	s0,sp,16
    TCB::running->enjoin();
    80004ccc:	00005597          	auipc	a1,0x5
    80004cd0:	7445b583          	ld	a1,1860(a1) # 8000a410 <_ZN3TCB7runningE>
    void enjoin() { this->status = JOINED; }
    80004cd4:	00300793          	li	a5,3
    80004cd8:	04f5a423          	sw	a5,72(a1)
    handle->joiner.put(TCB::running);
    80004cdc:	06050513          	addi	a0,a0,96
    80004ce0:	ffffe097          	auipc	ra,0xffffe
    80004ce4:	944080e7          	jalr	-1724(ra) # 80002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    TCB::_thread_dispatch();
    80004ce8:	00000097          	auipc	ra,0x0
    80004cec:	f50080e7          	jalr	-176(ra) # 80004c38 <_ZN3TCB16_thread_dispatchEv>
}
    80004cf0:	00813083          	ld	ra,8(sp)
    80004cf4:	00013403          	ld	s0,0(sp)
    80004cf8:	01010113          	addi	sp,sp,16
    80004cfc:	00008067          	ret
    80004d00:	00008067          	ret

0000000080004d04 <_ZN3TCB17_thread_join_timeEPS_m>:
    bool is_finished() const { return this->status == FINISHED; }
    80004d04:	04852703          	lw	a4,72(a0)
    if (handle->is_finished())
    80004d08:	00400793          	li	a5,4
    80004d0c:	06f70863          	beq	a4,a5,80004d7c <_ZN3TCB17_thread_join_timeEPS_m+0x78>
void TCB::_thread_join_time(thread_t handle, time_t time) {
    80004d10:	fe010113          	addi	sp,sp,-32
    80004d14:	00113c23          	sd	ra,24(sp)
    80004d18:	00813823          	sd	s0,16(sp)
    80004d1c:	00913423          	sd	s1,8(sp)
    80004d20:	01213023          	sd	s2,0(sp)
    80004d24:	02010413          	addi	s0,sp,32
    80004d28:	00058493          	mv	s1,a1
    TCB::running->enjoin();
    80004d2c:	00005917          	auipc	s2,0x5
    80004d30:	6e490913          	addi	s2,s2,1764 # 8000a410 <_ZN3TCB7runningE>
    80004d34:	00093583          	ld	a1,0(s2)
    void enjoin() { this->status = JOINED; }
    80004d38:	00300793          	li	a5,3
    80004d3c:	04f5a423          	sw	a5,72(a1)
    handle->joiner.put(TCB::running);
    80004d40:	06050513          	addi	a0,a0,96
    80004d44:	ffffe097          	auipc	ra,0xffffe
    80004d48:	8e0080e7          	jalr	-1824(ra) # 80002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    Cradle::insert(TCB::running, time);
    80004d4c:	00048593          	mv	a1,s1
    80004d50:	00093503          	ld	a0,0(s2)
    80004d54:	ffffe097          	auipc	ra,0xffffe
    80004d58:	f2c080e7          	jalr	-212(ra) # 80002c80 <_ZN6Cradle6insertEP3TCBm>
    TCB::_thread_dispatch();
    80004d5c:	00000097          	auipc	ra,0x0
    80004d60:	edc080e7          	jalr	-292(ra) # 80004c38 <_ZN3TCB16_thread_dispatchEv>
}
    80004d64:	01813083          	ld	ra,24(sp)
    80004d68:	01013403          	ld	s0,16(sp)
    80004d6c:	00813483          	ld	s1,8(sp)
    80004d70:	00013903          	ld	s2,0(sp)
    80004d74:	02010113          	addi	sp,sp,32
    80004d78:	00008067          	ret
    80004d7c:	00008067          	ret

0000000080004d80 <_ZN12MonitorMutex10relinquishEv>:
#include "../h/monitor.hpp"

int MonitorMutex::relinquish() {
    80004d80:	ff010113          	addi	sp,sp,-16
    80004d84:	00813423          	sd	s0,8(sp)
    80004d88:	01010413          	addi	s0,sp,16
    80004d8c:	00050793          	mv	a5,a0
    int ret = this->nesting_count;
    80004d90:	01852503          	lw	a0,24(a0)
    this->nesting_count = 1;
    80004d94:	00100713          	li	a4,1
    80004d98:	00e7ac23          	sw	a4,24(a5)
    return ret;
}
    80004d9c:	00813403          	ld	s0,8(sp)
    80004da0:	01010113          	addi	sp,sp,16
    80004da4:	00008067          	ret

0000000080004da8 <_ZN12MonitorMutex9reacquireEi>:

void MonitorMutex::reacquire(int count) {
    80004da8:	ff010113          	addi	sp,sp,-16
    80004dac:	00813423          	sd	s0,8(sp)
    80004db0:	01010413          	addi	s0,sp,16
    this->nesting_count = count;
    80004db4:	00b52c23          	sw	a1,24(a0)
}
    80004db8:	00813403          	ld	s0,8(sp)
    80004dbc:	01010113          	addi	sp,sp,16
    80004dc0:	00008067          	ret

0000000080004dc4 <_ZN11MonitorLockC1ER12MonitorMutex>:

MonitorLock::MonitorLock(MonitorMutex &mutex) : monitorMutex(mutex) {
    80004dc4:	ff010113          	addi	sp,sp,-16
    80004dc8:	00113423          	sd	ra,8(sp)
    80004dcc:	00813023          	sd	s0,0(sp)
    80004dd0:	01010413          	addi	s0,sp,16
    80004dd4:	00b53023          	sd	a1,0(a0)
    this->monitorMutex.wait();
    80004dd8:	0005b783          	ld	a5,0(a1)
    80004ddc:	0107b783          	ld	a5,16(a5)
    80004de0:	00058513          	mv	a0,a1
    80004de4:	000780e7          	jalr	a5
}
    80004de8:	00813083          	ld	ra,8(sp)
    80004dec:	00013403          	ld	s0,0(sp)
    80004df0:	01010113          	addi	sp,sp,16
    80004df4:	00008067          	ret

0000000080004df8 <_ZN11MonitorLockD1Ev>:

MonitorLock::~MonitorLock() {
    80004df8:	ff010113          	addi	sp,sp,-16
    80004dfc:	00113423          	sd	ra,8(sp)
    80004e00:	00813023          	sd	s0,0(sp)
    80004e04:	01010413          	addi	s0,sp,16
    this->monitorMutex.signal();
    80004e08:	00053503          	ld	a0,0(a0)
    80004e0c:	00053783          	ld	a5,0(a0)
    80004e10:	0187b783          	ld	a5,24(a5)
    80004e14:	000780e7          	jalr	a5
}
    80004e18:	00813083          	ld	ra,8(sp)
    80004e1c:	00013403          	ld	s0,0(sp)
    80004e20:	01010113          	addi	sp,sp,16
    80004e24:	00008067          	ret

0000000080004e28 <_ZN11ConditionalC1EP7Monitor>:

Conditional::Conditional(Monitor *monitor) : owner(monitor), count(0), blocker(0) {}
    80004e28:	ff010113          	addi	sp,sp,-16
    80004e2c:	00113423          	sd	ra,8(sp)
    80004e30:	00813023          	sd	s0,0(sp)
    80004e34:	01010413          	addi	s0,sp,16
    80004e38:	00b53023          	sd	a1,0(a0)
    80004e3c:	00052423          	sw	zero,8(a0)
    80004e40:	00000593          	li	a1,0
    80004e44:	01050513          	addi	a0,a0,16
    80004e48:	fffff097          	auipc	ra,0xfffff
    80004e4c:	e10080e7          	jalr	-496(ra) # 80003c58 <_ZN9SemaphoreC1Ej>
    80004e50:	00813083          	ld	ra,8(sp)
    80004e54:	00013403          	ld	s0,0(sp)
    80004e58:	01010113          	addi	sp,sp,16
    80004e5c:	00008067          	ret

0000000080004e60 <_ZN11Conditional4waitEv>:

void Conditional::wait() {
    80004e60:	fe010113          	addi	sp,sp,-32
    80004e64:	00113c23          	sd	ra,24(sp)
    80004e68:	00813823          	sd	s0,16(sp)
    80004e6c:	00913423          	sd	s1,8(sp)
    80004e70:	01213023          	sd	s2,0(sp)
    80004e74:	02010413          	addi	s0,sp,32
    80004e78:	00050493          	mv	s1,a0
    this->count++;
    80004e7c:	00852783          	lw	a5,8(a0)
    80004e80:	0017879b          	addiw	a5,a5,1
    80004e84:	00f52423          	sw	a5,8(a0)
    int nesting = this->owner->monitorMutex.relinquish();
    80004e88:	00053503          	ld	a0,0(a0)
    80004e8c:	00000097          	auipc	ra,0x0
    80004e90:	ef4080e7          	jalr	-268(ra) # 80004d80 <_ZN12MonitorMutex10relinquishEv>
    80004e94:	00050913          	mv	s2,a0
    Semaphore::signal_and_wait(this->owner->monitorMutex, this->blocker);
    80004e98:	01048593          	addi	a1,s1,16
    80004e9c:	0004b503          	ld	a0,0(s1)
    80004ea0:	fffff097          	auipc	ra,0xfffff
    80004ea4:	df0080e7          	jalr	-528(ra) # 80003c90 <_ZN9Semaphore15signal_and_waitERS_S0_>
    this->owner->monitorMutex.reacquire(nesting);
    80004ea8:	00090593          	mv	a1,s2
    80004eac:	0004b503          	ld	a0,0(s1)
    80004eb0:	00000097          	auipc	ra,0x0
    80004eb4:	ef8080e7          	jalr	-264(ra) # 80004da8 <_ZN12MonitorMutex9reacquireEi>
    this->owner->monitorMutex.wait();
    80004eb8:	0004b503          	ld	a0,0(s1)
    80004ebc:	fffff097          	auipc	ra,0xfffff
    80004ec0:	570080e7          	jalr	1392(ra) # 8000442c <_ZN10OwnedMutex4waitEv>
}
    80004ec4:	01813083          	ld	ra,24(sp)
    80004ec8:	01013403          	ld	s0,16(sp)
    80004ecc:	00813483          	ld	s1,8(sp)
    80004ed0:	00013903          	ld	s2,0(sp)
    80004ed4:	02010113          	addi	sp,sp,32
    80004ed8:	00008067          	ret

0000000080004edc <_ZN11Conditional6signalEv>:

void Conditional::signal() {
    if (this->count == 0) return;
    80004edc:	00852783          	lw	a5,8(a0)
    80004ee0:	00079463          	bnez	a5,80004ee8 <_ZN11Conditional6signalEv+0xc>
    80004ee4:	00008067          	ret
void Conditional::signal() {
    80004ee8:	fe010113          	addi	sp,sp,-32
    80004eec:	00113c23          	sd	ra,24(sp)
    80004ef0:	00813823          	sd	s0,16(sp)
    80004ef4:	00913423          	sd	s1,8(sp)
    80004ef8:	02010413          	addi	s0,sp,32
    80004efc:	00050493          	mv	s1,a0
    this->blocker.signal();
    80004f00:	01050513          	addi	a0,a0,16
    80004f04:	fffff097          	auipc	ra,0xfffff
    80004f08:	a20080e7          	jalr	-1504(ra) # 80003924 <_ZN9Semaphore6signalEv>
    this->count--;
    80004f0c:	0084a783          	lw	a5,8(s1)
    80004f10:	fff7879b          	addiw	a5,a5,-1
    80004f14:	00f4a423          	sw	a5,8(s1)
}
    80004f18:	01813083          	ld	ra,24(sp)
    80004f1c:	01013403          	ld	s0,16(sp)
    80004f20:	00813483          	ld	s1,8(sp)
    80004f24:	02010113          	addi	sp,sp,32
    80004f28:	00008067          	ret

0000000080004f2c <_ZN11Conditional9signalAllEv>:

void Conditional::signalAll() {
    80004f2c:	fe010113          	addi	sp,sp,-32
    80004f30:	00113c23          	sd	ra,24(sp)
    80004f34:	00813823          	sd	s0,16(sp)
    80004f38:	00913423          	sd	s1,8(sp)
    80004f3c:	01213023          	sd	s2,0(sp)
    80004f40:	02010413          	addi	s0,sp,32
    80004f44:	00050913          	mv	s2,a0
    for (unsigned int i = 0; i < this->count; i++)
    80004f48:	00000493          	li	s1,0
    80004f4c:	00892783          	lw	a5,8(s2)
    80004f50:	00f4fc63          	bgeu	s1,a5,80004f68 <_ZN11Conditional9signalAllEv+0x3c>
        this->blocker.signal();
    80004f54:	01090513          	addi	a0,s2,16
    80004f58:	fffff097          	auipc	ra,0xfffff
    80004f5c:	9cc080e7          	jalr	-1588(ra) # 80003924 <_ZN9Semaphore6signalEv>
    for (unsigned int i = 0; i < this->count; i++)
    80004f60:	0014849b          	addiw	s1,s1,1
    80004f64:	fe9ff06f          	j	80004f4c <_ZN11Conditional9signalAllEv+0x20>
    this->count = 0;
    80004f68:	00092423          	sw	zero,8(s2)
    80004f6c:	01813083          	ld	ra,24(sp)
    80004f70:	01013403          	ld	s0,16(sp)
    80004f74:	00813483          	ld	s1,8(sp)
    80004f78:	00013903          	ld	s2,0(sp)
    80004f7c:	02010113          	addi	sp,sp,32
    80004f80:	00008067          	ret

0000000080004f84 <start>:
    80004f84:	ff010113          	addi	sp,sp,-16
    80004f88:	00813423          	sd	s0,8(sp)
    80004f8c:	01010413          	addi	s0,sp,16
    80004f90:	300027f3          	csrr	a5,mstatus
    80004f94:	ffffe737          	lui	a4,0xffffe
    80004f98:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff316f>
    80004f9c:	00e7f7b3          	and	a5,a5,a4
    80004fa0:	00001737          	lui	a4,0x1
    80004fa4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004fa8:	00e7e7b3          	or	a5,a5,a4
    80004fac:	30079073          	csrw	mstatus,a5
    80004fb0:	00000797          	auipc	a5,0x0
    80004fb4:	16078793          	addi	a5,a5,352 # 80005110 <system_main>
    80004fb8:	34179073          	csrw	mepc,a5
    80004fbc:	00000793          	li	a5,0
    80004fc0:	18079073          	csrw	satp,a5
    80004fc4:	000107b7          	lui	a5,0x10
    80004fc8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80004fcc:	30279073          	csrw	medeleg,a5
    80004fd0:	30379073          	csrw	mideleg,a5
    80004fd4:	104027f3          	csrr	a5,sie
    80004fd8:	2227e793          	ori	a5,a5,546
    80004fdc:	10479073          	csrw	sie,a5
    80004fe0:	fff00793          	li	a5,-1
    80004fe4:	00a7d793          	srli	a5,a5,0xa
    80004fe8:	3b079073          	csrw	pmpaddr0,a5
    80004fec:	00f00793          	li	a5,15
    80004ff0:	3a079073          	csrw	pmpcfg0,a5
    80004ff4:	f14027f3          	csrr	a5,mhartid
    80004ff8:	0200c737          	lui	a4,0x200c
    80004ffc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005000:	0007869b          	sext.w	a3,a5
    80005004:	00269713          	slli	a4,a3,0x2
    80005008:	000f4637          	lui	a2,0xf4
    8000500c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005010:	00d70733          	add	a4,a4,a3
    80005014:	0037979b          	slliw	a5,a5,0x3
    80005018:	020046b7          	lui	a3,0x2004
    8000501c:	00d787b3          	add	a5,a5,a3
    80005020:	00c585b3          	add	a1,a1,a2
    80005024:	00371693          	slli	a3,a4,0x3
    80005028:	00005717          	auipc	a4,0x5
    8000502c:	40870713          	addi	a4,a4,1032 # 8000a430 <timer_scratch>
    80005030:	00b7b023          	sd	a1,0(a5)
    80005034:	00d70733          	add	a4,a4,a3
    80005038:	00f73c23          	sd	a5,24(a4)
    8000503c:	02c73023          	sd	a2,32(a4)
    80005040:	34071073          	csrw	mscratch,a4
    80005044:	00000797          	auipc	a5,0x0
    80005048:	6ec78793          	addi	a5,a5,1772 # 80005730 <timervec>
    8000504c:	30579073          	csrw	mtvec,a5
    80005050:	300027f3          	csrr	a5,mstatus
    80005054:	0087e793          	ori	a5,a5,8
    80005058:	30079073          	csrw	mstatus,a5
    8000505c:	304027f3          	csrr	a5,mie
    80005060:	0807e793          	ori	a5,a5,128
    80005064:	30479073          	csrw	mie,a5
    80005068:	f14027f3          	csrr	a5,mhartid
    8000506c:	0007879b          	sext.w	a5,a5
    80005070:	00078213          	mv	tp,a5
    80005074:	30200073          	mret
    80005078:	00813403          	ld	s0,8(sp)
    8000507c:	01010113          	addi	sp,sp,16
    80005080:	00008067          	ret

0000000080005084 <timerinit>:
    80005084:	ff010113          	addi	sp,sp,-16
    80005088:	00813423          	sd	s0,8(sp)
    8000508c:	01010413          	addi	s0,sp,16
    80005090:	f14027f3          	csrr	a5,mhartid
    80005094:	0200c737          	lui	a4,0x200c
    80005098:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000509c:	0007869b          	sext.w	a3,a5
    800050a0:	00269713          	slli	a4,a3,0x2
    800050a4:	000f4637          	lui	a2,0xf4
    800050a8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800050ac:	00d70733          	add	a4,a4,a3
    800050b0:	0037979b          	slliw	a5,a5,0x3
    800050b4:	020046b7          	lui	a3,0x2004
    800050b8:	00d787b3          	add	a5,a5,a3
    800050bc:	00c585b3          	add	a1,a1,a2
    800050c0:	00371693          	slli	a3,a4,0x3
    800050c4:	00005717          	auipc	a4,0x5
    800050c8:	36c70713          	addi	a4,a4,876 # 8000a430 <timer_scratch>
    800050cc:	00b7b023          	sd	a1,0(a5)
    800050d0:	00d70733          	add	a4,a4,a3
    800050d4:	00f73c23          	sd	a5,24(a4)
    800050d8:	02c73023          	sd	a2,32(a4)
    800050dc:	34071073          	csrw	mscratch,a4
    800050e0:	00000797          	auipc	a5,0x0
    800050e4:	65078793          	addi	a5,a5,1616 # 80005730 <timervec>
    800050e8:	30579073          	csrw	mtvec,a5
    800050ec:	300027f3          	csrr	a5,mstatus
    800050f0:	0087e793          	ori	a5,a5,8
    800050f4:	30079073          	csrw	mstatus,a5
    800050f8:	304027f3          	csrr	a5,mie
    800050fc:	0807e793          	ori	a5,a5,128
    80005100:	30479073          	csrw	mie,a5
    80005104:	00813403          	ld	s0,8(sp)
    80005108:	01010113          	addi	sp,sp,16
    8000510c:	00008067          	ret

0000000080005110 <system_main>:
    80005110:	fe010113          	addi	sp,sp,-32
    80005114:	00813823          	sd	s0,16(sp)
    80005118:	00913423          	sd	s1,8(sp)
    8000511c:	00113c23          	sd	ra,24(sp)
    80005120:	02010413          	addi	s0,sp,32
    80005124:	00000097          	auipc	ra,0x0
    80005128:	0c4080e7          	jalr	196(ra) # 800051e8 <cpuid>
    8000512c:	00005497          	auipc	s1,0x5
    80005130:	20448493          	addi	s1,s1,516 # 8000a330 <started>
    80005134:	02050263          	beqz	a0,80005158 <system_main+0x48>
    80005138:	0004a783          	lw	a5,0(s1)
    8000513c:	0007879b          	sext.w	a5,a5
    80005140:	fe078ce3          	beqz	a5,80005138 <system_main+0x28>
    80005144:	0ff0000f          	fence
    80005148:	00003517          	auipc	a0,0x3
    8000514c:	fa850513          	addi	a0,a0,-88 # 800080f0 <_ZN3stm4coutE+0x80>
    80005150:	00001097          	auipc	ra,0x1
    80005154:	a7c080e7          	jalr	-1412(ra) # 80005bcc <panic>
    80005158:	00001097          	auipc	ra,0x1
    8000515c:	9d0080e7          	jalr	-1584(ra) # 80005b28 <consoleinit>
    80005160:	00001097          	auipc	ra,0x1
    80005164:	15c080e7          	jalr	348(ra) # 800062bc <printfinit>
    80005168:	00003517          	auipc	a0,0x3
    8000516c:	06850513          	addi	a0,a0,104 # 800081d0 <_ZN3stm4coutE+0x160>
    80005170:	00001097          	auipc	ra,0x1
    80005174:	ab8080e7          	jalr	-1352(ra) # 80005c28 <__printf>
    80005178:	00003517          	auipc	a0,0x3
    8000517c:	f4850513          	addi	a0,a0,-184 # 800080c0 <_ZN3stm4coutE+0x50>
    80005180:	00001097          	auipc	ra,0x1
    80005184:	aa8080e7          	jalr	-1368(ra) # 80005c28 <__printf>
    80005188:	00003517          	auipc	a0,0x3
    8000518c:	04850513          	addi	a0,a0,72 # 800081d0 <_ZN3stm4coutE+0x160>
    80005190:	00001097          	auipc	ra,0x1
    80005194:	a98080e7          	jalr	-1384(ra) # 80005c28 <__printf>
    80005198:	00001097          	auipc	ra,0x1
    8000519c:	4b0080e7          	jalr	1200(ra) # 80006648 <kinit>
    800051a0:	00000097          	auipc	ra,0x0
    800051a4:	148080e7          	jalr	328(ra) # 800052e8 <trapinit>
    800051a8:	00000097          	auipc	ra,0x0
    800051ac:	16c080e7          	jalr	364(ra) # 80005314 <trapinithart>
    800051b0:	00000097          	auipc	ra,0x0
    800051b4:	5c0080e7          	jalr	1472(ra) # 80005770 <plicinit>
    800051b8:	00000097          	auipc	ra,0x0
    800051bc:	5e0080e7          	jalr	1504(ra) # 80005798 <plicinithart>
    800051c0:	00000097          	auipc	ra,0x0
    800051c4:	078080e7          	jalr	120(ra) # 80005238 <userinit>
    800051c8:	0ff0000f          	fence
    800051cc:	00100793          	li	a5,1
    800051d0:	00003517          	auipc	a0,0x3
    800051d4:	f0850513          	addi	a0,a0,-248 # 800080d8 <_ZN3stm4coutE+0x68>
    800051d8:	00f4a023          	sw	a5,0(s1)
    800051dc:	00001097          	auipc	ra,0x1
    800051e0:	a4c080e7          	jalr	-1460(ra) # 80005c28 <__printf>
    800051e4:	0000006f          	j	800051e4 <system_main+0xd4>

00000000800051e8 <cpuid>:
    800051e8:	ff010113          	addi	sp,sp,-16
    800051ec:	00813423          	sd	s0,8(sp)
    800051f0:	01010413          	addi	s0,sp,16
    800051f4:	00020513          	mv	a0,tp
    800051f8:	00813403          	ld	s0,8(sp)
    800051fc:	0005051b          	sext.w	a0,a0
    80005200:	01010113          	addi	sp,sp,16
    80005204:	00008067          	ret

0000000080005208 <mycpu>:
    80005208:	ff010113          	addi	sp,sp,-16
    8000520c:	00813423          	sd	s0,8(sp)
    80005210:	01010413          	addi	s0,sp,16
    80005214:	00020793          	mv	a5,tp
    80005218:	00813403          	ld	s0,8(sp)
    8000521c:	0007879b          	sext.w	a5,a5
    80005220:	00779793          	slli	a5,a5,0x7
    80005224:	00006517          	auipc	a0,0x6
    80005228:	23c50513          	addi	a0,a0,572 # 8000b460 <cpus>
    8000522c:	00f50533          	add	a0,a0,a5
    80005230:	01010113          	addi	sp,sp,16
    80005234:	00008067          	ret

0000000080005238 <userinit>:
    80005238:	ff010113          	addi	sp,sp,-16
    8000523c:	00813423          	sd	s0,8(sp)
    80005240:	01010413          	addi	s0,sp,16
    80005244:	00813403          	ld	s0,8(sp)
    80005248:	01010113          	addi	sp,sp,16
    8000524c:	ffffe317          	auipc	t1,0xffffe
    80005250:	50430067          	jr	1284(t1) # 80003750 <main>

0000000080005254 <either_copyout>:
    80005254:	ff010113          	addi	sp,sp,-16
    80005258:	00813023          	sd	s0,0(sp)
    8000525c:	00113423          	sd	ra,8(sp)
    80005260:	01010413          	addi	s0,sp,16
    80005264:	02051663          	bnez	a0,80005290 <either_copyout+0x3c>
    80005268:	00058513          	mv	a0,a1
    8000526c:	00060593          	mv	a1,a2
    80005270:	0006861b          	sext.w	a2,a3
    80005274:	00002097          	auipc	ra,0x2
    80005278:	c60080e7          	jalr	-928(ra) # 80006ed4 <__memmove>
    8000527c:	00813083          	ld	ra,8(sp)
    80005280:	00013403          	ld	s0,0(sp)
    80005284:	00000513          	li	a0,0
    80005288:	01010113          	addi	sp,sp,16
    8000528c:	00008067          	ret
    80005290:	00003517          	auipc	a0,0x3
    80005294:	e8850513          	addi	a0,a0,-376 # 80008118 <_ZN3stm4coutE+0xa8>
    80005298:	00001097          	auipc	ra,0x1
    8000529c:	934080e7          	jalr	-1740(ra) # 80005bcc <panic>

00000000800052a0 <either_copyin>:
    800052a0:	ff010113          	addi	sp,sp,-16
    800052a4:	00813023          	sd	s0,0(sp)
    800052a8:	00113423          	sd	ra,8(sp)
    800052ac:	01010413          	addi	s0,sp,16
    800052b0:	02059463          	bnez	a1,800052d8 <either_copyin+0x38>
    800052b4:	00060593          	mv	a1,a2
    800052b8:	0006861b          	sext.w	a2,a3
    800052bc:	00002097          	auipc	ra,0x2
    800052c0:	c18080e7          	jalr	-1000(ra) # 80006ed4 <__memmove>
    800052c4:	00813083          	ld	ra,8(sp)
    800052c8:	00013403          	ld	s0,0(sp)
    800052cc:	00000513          	li	a0,0
    800052d0:	01010113          	addi	sp,sp,16
    800052d4:	00008067          	ret
    800052d8:	00003517          	auipc	a0,0x3
    800052dc:	e6850513          	addi	a0,a0,-408 # 80008140 <_ZN3stm4coutE+0xd0>
    800052e0:	00001097          	auipc	ra,0x1
    800052e4:	8ec080e7          	jalr	-1812(ra) # 80005bcc <panic>

00000000800052e8 <trapinit>:
    800052e8:	ff010113          	addi	sp,sp,-16
    800052ec:	00813423          	sd	s0,8(sp)
    800052f0:	01010413          	addi	s0,sp,16
    800052f4:	00813403          	ld	s0,8(sp)
    800052f8:	00003597          	auipc	a1,0x3
    800052fc:	e7058593          	addi	a1,a1,-400 # 80008168 <_ZN3stm4coutE+0xf8>
    80005300:	00006517          	auipc	a0,0x6
    80005304:	1e050513          	addi	a0,a0,480 # 8000b4e0 <tickslock>
    80005308:	01010113          	addi	sp,sp,16
    8000530c:	00001317          	auipc	t1,0x1
    80005310:	5cc30067          	jr	1484(t1) # 800068d8 <initlock>

0000000080005314 <trapinithart>:
    80005314:	ff010113          	addi	sp,sp,-16
    80005318:	00813423          	sd	s0,8(sp)
    8000531c:	01010413          	addi	s0,sp,16
    80005320:	00000797          	auipc	a5,0x0
    80005324:	30078793          	addi	a5,a5,768 # 80005620 <kernelvec>
    80005328:	10579073          	csrw	stvec,a5
    8000532c:	00813403          	ld	s0,8(sp)
    80005330:	01010113          	addi	sp,sp,16
    80005334:	00008067          	ret

0000000080005338 <usertrap>:
    80005338:	ff010113          	addi	sp,sp,-16
    8000533c:	00813423          	sd	s0,8(sp)
    80005340:	01010413          	addi	s0,sp,16
    80005344:	00813403          	ld	s0,8(sp)
    80005348:	01010113          	addi	sp,sp,16
    8000534c:	00008067          	ret

0000000080005350 <usertrapret>:
    80005350:	ff010113          	addi	sp,sp,-16
    80005354:	00813423          	sd	s0,8(sp)
    80005358:	01010413          	addi	s0,sp,16
    8000535c:	00813403          	ld	s0,8(sp)
    80005360:	01010113          	addi	sp,sp,16
    80005364:	00008067          	ret

0000000080005368 <kerneltrap>:
    80005368:	fe010113          	addi	sp,sp,-32
    8000536c:	00813823          	sd	s0,16(sp)
    80005370:	00113c23          	sd	ra,24(sp)
    80005374:	00913423          	sd	s1,8(sp)
    80005378:	02010413          	addi	s0,sp,32
    8000537c:	142025f3          	csrr	a1,scause
    80005380:	100027f3          	csrr	a5,sstatus
    80005384:	0027f793          	andi	a5,a5,2
    80005388:	10079c63          	bnez	a5,800054a0 <kerneltrap+0x138>
    8000538c:	142027f3          	csrr	a5,scause
    80005390:	0207ce63          	bltz	a5,800053cc <kerneltrap+0x64>
    80005394:	00003517          	auipc	a0,0x3
    80005398:	e1c50513          	addi	a0,a0,-484 # 800081b0 <_ZN3stm4coutE+0x140>
    8000539c:	00001097          	auipc	ra,0x1
    800053a0:	88c080e7          	jalr	-1908(ra) # 80005c28 <__printf>
    800053a4:	141025f3          	csrr	a1,sepc
    800053a8:	14302673          	csrr	a2,stval
    800053ac:	00003517          	auipc	a0,0x3
    800053b0:	e1450513          	addi	a0,a0,-492 # 800081c0 <_ZN3stm4coutE+0x150>
    800053b4:	00001097          	auipc	ra,0x1
    800053b8:	874080e7          	jalr	-1932(ra) # 80005c28 <__printf>
    800053bc:	00003517          	auipc	a0,0x3
    800053c0:	e1c50513          	addi	a0,a0,-484 # 800081d8 <_ZN3stm4coutE+0x168>
    800053c4:	00001097          	auipc	ra,0x1
    800053c8:	808080e7          	jalr	-2040(ra) # 80005bcc <panic>
    800053cc:	0ff7f713          	andi	a4,a5,255
    800053d0:	00900693          	li	a3,9
    800053d4:	04d70063          	beq	a4,a3,80005414 <kerneltrap+0xac>
    800053d8:	fff00713          	li	a4,-1
    800053dc:	03f71713          	slli	a4,a4,0x3f
    800053e0:	00170713          	addi	a4,a4,1
    800053e4:	fae798e3          	bne	a5,a4,80005394 <kerneltrap+0x2c>
    800053e8:	00000097          	auipc	ra,0x0
    800053ec:	e00080e7          	jalr	-512(ra) # 800051e8 <cpuid>
    800053f0:	06050663          	beqz	a0,8000545c <kerneltrap+0xf4>
    800053f4:	144027f3          	csrr	a5,sip
    800053f8:	ffd7f793          	andi	a5,a5,-3
    800053fc:	14479073          	csrw	sip,a5
    80005400:	01813083          	ld	ra,24(sp)
    80005404:	01013403          	ld	s0,16(sp)
    80005408:	00813483          	ld	s1,8(sp)
    8000540c:	02010113          	addi	sp,sp,32
    80005410:	00008067          	ret
    80005414:	00000097          	auipc	ra,0x0
    80005418:	3d0080e7          	jalr	976(ra) # 800057e4 <plic_claim>
    8000541c:	00a00793          	li	a5,10
    80005420:	00050493          	mv	s1,a0
    80005424:	06f50863          	beq	a0,a5,80005494 <kerneltrap+0x12c>
    80005428:	fc050ce3          	beqz	a0,80005400 <kerneltrap+0x98>
    8000542c:	00050593          	mv	a1,a0
    80005430:	00003517          	auipc	a0,0x3
    80005434:	d6050513          	addi	a0,a0,-672 # 80008190 <_ZN3stm4coutE+0x120>
    80005438:	00000097          	auipc	ra,0x0
    8000543c:	7f0080e7          	jalr	2032(ra) # 80005c28 <__printf>
    80005440:	01013403          	ld	s0,16(sp)
    80005444:	01813083          	ld	ra,24(sp)
    80005448:	00048513          	mv	a0,s1
    8000544c:	00813483          	ld	s1,8(sp)
    80005450:	02010113          	addi	sp,sp,32
    80005454:	00000317          	auipc	t1,0x0
    80005458:	3c830067          	jr	968(t1) # 8000581c <plic_complete>
    8000545c:	00006517          	auipc	a0,0x6
    80005460:	08450513          	addi	a0,a0,132 # 8000b4e0 <tickslock>
    80005464:	00001097          	auipc	ra,0x1
    80005468:	498080e7          	jalr	1176(ra) # 800068fc <acquire>
    8000546c:	00005717          	auipc	a4,0x5
    80005470:	ec870713          	addi	a4,a4,-312 # 8000a334 <ticks>
    80005474:	00072783          	lw	a5,0(a4)
    80005478:	00006517          	auipc	a0,0x6
    8000547c:	06850513          	addi	a0,a0,104 # 8000b4e0 <tickslock>
    80005480:	0017879b          	addiw	a5,a5,1
    80005484:	00f72023          	sw	a5,0(a4)
    80005488:	00001097          	auipc	ra,0x1
    8000548c:	540080e7          	jalr	1344(ra) # 800069c8 <release>
    80005490:	f65ff06f          	j	800053f4 <kerneltrap+0x8c>
    80005494:	00001097          	auipc	ra,0x1
    80005498:	09c080e7          	jalr	156(ra) # 80006530 <uartintr>
    8000549c:	fa5ff06f          	j	80005440 <kerneltrap+0xd8>
    800054a0:	00003517          	auipc	a0,0x3
    800054a4:	cd050513          	addi	a0,a0,-816 # 80008170 <_ZN3stm4coutE+0x100>
    800054a8:	00000097          	auipc	ra,0x0
    800054ac:	724080e7          	jalr	1828(ra) # 80005bcc <panic>

00000000800054b0 <clockintr>:
    800054b0:	fe010113          	addi	sp,sp,-32
    800054b4:	00813823          	sd	s0,16(sp)
    800054b8:	00913423          	sd	s1,8(sp)
    800054bc:	00113c23          	sd	ra,24(sp)
    800054c0:	02010413          	addi	s0,sp,32
    800054c4:	00006497          	auipc	s1,0x6
    800054c8:	01c48493          	addi	s1,s1,28 # 8000b4e0 <tickslock>
    800054cc:	00048513          	mv	a0,s1
    800054d0:	00001097          	auipc	ra,0x1
    800054d4:	42c080e7          	jalr	1068(ra) # 800068fc <acquire>
    800054d8:	00005717          	auipc	a4,0x5
    800054dc:	e5c70713          	addi	a4,a4,-420 # 8000a334 <ticks>
    800054e0:	00072783          	lw	a5,0(a4)
    800054e4:	01013403          	ld	s0,16(sp)
    800054e8:	01813083          	ld	ra,24(sp)
    800054ec:	00048513          	mv	a0,s1
    800054f0:	0017879b          	addiw	a5,a5,1
    800054f4:	00813483          	ld	s1,8(sp)
    800054f8:	00f72023          	sw	a5,0(a4)
    800054fc:	02010113          	addi	sp,sp,32
    80005500:	00001317          	auipc	t1,0x1
    80005504:	4c830067          	jr	1224(t1) # 800069c8 <release>

0000000080005508 <devintr>:
    80005508:	142027f3          	csrr	a5,scause
    8000550c:	00000513          	li	a0,0
    80005510:	0007c463          	bltz	a5,80005518 <devintr+0x10>
    80005514:	00008067          	ret
    80005518:	fe010113          	addi	sp,sp,-32
    8000551c:	00813823          	sd	s0,16(sp)
    80005520:	00113c23          	sd	ra,24(sp)
    80005524:	00913423          	sd	s1,8(sp)
    80005528:	02010413          	addi	s0,sp,32
    8000552c:	0ff7f713          	andi	a4,a5,255
    80005530:	00900693          	li	a3,9
    80005534:	04d70c63          	beq	a4,a3,8000558c <devintr+0x84>
    80005538:	fff00713          	li	a4,-1
    8000553c:	03f71713          	slli	a4,a4,0x3f
    80005540:	00170713          	addi	a4,a4,1
    80005544:	00e78c63          	beq	a5,a4,8000555c <devintr+0x54>
    80005548:	01813083          	ld	ra,24(sp)
    8000554c:	01013403          	ld	s0,16(sp)
    80005550:	00813483          	ld	s1,8(sp)
    80005554:	02010113          	addi	sp,sp,32
    80005558:	00008067          	ret
    8000555c:	00000097          	auipc	ra,0x0
    80005560:	c8c080e7          	jalr	-884(ra) # 800051e8 <cpuid>
    80005564:	06050663          	beqz	a0,800055d0 <devintr+0xc8>
    80005568:	144027f3          	csrr	a5,sip
    8000556c:	ffd7f793          	andi	a5,a5,-3
    80005570:	14479073          	csrw	sip,a5
    80005574:	01813083          	ld	ra,24(sp)
    80005578:	01013403          	ld	s0,16(sp)
    8000557c:	00813483          	ld	s1,8(sp)
    80005580:	00200513          	li	a0,2
    80005584:	02010113          	addi	sp,sp,32
    80005588:	00008067          	ret
    8000558c:	00000097          	auipc	ra,0x0
    80005590:	258080e7          	jalr	600(ra) # 800057e4 <plic_claim>
    80005594:	00a00793          	li	a5,10
    80005598:	00050493          	mv	s1,a0
    8000559c:	06f50663          	beq	a0,a5,80005608 <devintr+0x100>
    800055a0:	00100513          	li	a0,1
    800055a4:	fa0482e3          	beqz	s1,80005548 <devintr+0x40>
    800055a8:	00048593          	mv	a1,s1
    800055ac:	00003517          	auipc	a0,0x3
    800055b0:	be450513          	addi	a0,a0,-1052 # 80008190 <_ZN3stm4coutE+0x120>
    800055b4:	00000097          	auipc	ra,0x0
    800055b8:	674080e7          	jalr	1652(ra) # 80005c28 <__printf>
    800055bc:	00048513          	mv	a0,s1
    800055c0:	00000097          	auipc	ra,0x0
    800055c4:	25c080e7          	jalr	604(ra) # 8000581c <plic_complete>
    800055c8:	00100513          	li	a0,1
    800055cc:	f7dff06f          	j	80005548 <devintr+0x40>
    800055d0:	00006517          	auipc	a0,0x6
    800055d4:	f1050513          	addi	a0,a0,-240 # 8000b4e0 <tickslock>
    800055d8:	00001097          	auipc	ra,0x1
    800055dc:	324080e7          	jalr	804(ra) # 800068fc <acquire>
    800055e0:	00005717          	auipc	a4,0x5
    800055e4:	d5470713          	addi	a4,a4,-684 # 8000a334 <ticks>
    800055e8:	00072783          	lw	a5,0(a4)
    800055ec:	00006517          	auipc	a0,0x6
    800055f0:	ef450513          	addi	a0,a0,-268 # 8000b4e0 <tickslock>
    800055f4:	0017879b          	addiw	a5,a5,1
    800055f8:	00f72023          	sw	a5,0(a4)
    800055fc:	00001097          	auipc	ra,0x1
    80005600:	3cc080e7          	jalr	972(ra) # 800069c8 <release>
    80005604:	f65ff06f          	j	80005568 <devintr+0x60>
    80005608:	00001097          	auipc	ra,0x1
    8000560c:	f28080e7          	jalr	-216(ra) # 80006530 <uartintr>
    80005610:	fadff06f          	j	800055bc <devintr+0xb4>
	...

0000000080005620 <kernelvec>:
    80005620:	f0010113          	addi	sp,sp,-256
    80005624:	00113023          	sd	ra,0(sp)
    80005628:	00213423          	sd	sp,8(sp)
    8000562c:	00313823          	sd	gp,16(sp)
    80005630:	00413c23          	sd	tp,24(sp)
    80005634:	02513023          	sd	t0,32(sp)
    80005638:	02613423          	sd	t1,40(sp)
    8000563c:	02713823          	sd	t2,48(sp)
    80005640:	02813c23          	sd	s0,56(sp)
    80005644:	04913023          	sd	s1,64(sp)
    80005648:	04a13423          	sd	a0,72(sp)
    8000564c:	04b13823          	sd	a1,80(sp)
    80005650:	04c13c23          	sd	a2,88(sp)
    80005654:	06d13023          	sd	a3,96(sp)
    80005658:	06e13423          	sd	a4,104(sp)
    8000565c:	06f13823          	sd	a5,112(sp)
    80005660:	07013c23          	sd	a6,120(sp)
    80005664:	09113023          	sd	a7,128(sp)
    80005668:	09213423          	sd	s2,136(sp)
    8000566c:	09313823          	sd	s3,144(sp)
    80005670:	09413c23          	sd	s4,152(sp)
    80005674:	0b513023          	sd	s5,160(sp)
    80005678:	0b613423          	sd	s6,168(sp)
    8000567c:	0b713823          	sd	s7,176(sp)
    80005680:	0b813c23          	sd	s8,184(sp)
    80005684:	0d913023          	sd	s9,192(sp)
    80005688:	0da13423          	sd	s10,200(sp)
    8000568c:	0db13823          	sd	s11,208(sp)
    80005690:	0dc13c23          	sd	t3,216(sp)
    80005694:	0fd13023          	sd	t4,224(sp)
    80005698:	0fe13423          	sd	t5,232(sp)
    8000569c:	0ff13823          	sd	t6,240(sp)
    800056a0:	cc9ff0ef          	jal	ra,80005368 <kerneltrap>
    800056a4:	00013083          	ld	ra,0(sp)
    800056a8:	00813103          	ld	sp,8(sp)
    800056ac:	01013183          	ld	gp,16(sp)
    800056b0:	02013283          	ld	t0,32(sp)
    800056b4:	02813303          	ld	t1,40(sp)
    800056b8:	03013383          	ld	t2,48(sp)
    800056bc:	03813403          	ld	s0,56(sp)
    800056c0:	04013483          	ld	s1,64(sp)
    800056c4:	04813503          	ld	a0,72(sp)
    800056c8:	05013583          	ld	a1,80(sp)
    800056cc:	05813603          	ld	a2,88(sp)
    800056d0:	06013683          	ld	a3,96(sp)
    800056d4:	06813703          	ld	a4,104(sp)
    800056d8:	07013783          	ld	a5,112(sp)
    800056dc:	07813803          	ld	a6,120(sp)
    800056e0:	08013883          	ld	a7,128(sp)
    800056e4:	08813903          	ld	s2,136(sp)
    800056e8:	09013983          	ld	s3,144(sp)
    800056ec:	09813a03          	ld	s4,152(sp)
    800056f0:	0a013a83          	ld	s5,160(sp)
    800056f4:	0a813b03          	ld	s6,168(sp)
    800056f8:	0b013b83          	ld	s7,176(sp)
    800056fc:	0b813c03          	ld	s8,184(sp)
    80005700:	0c013c83          	ld	s9,192(sp)
    80005704:	0c813d03          	ld	s10,200(sp)
    80005708:	0d013d83          	ld	s11,208(sp)
    8000570c:	0d813e03          	ld	t3,216(sp)
    80005710:	0e013e83          	ld	t4,224(sp)
    80005714:	0e813f03          	ld	t5,232(sp)
    80005718:	0f013f83          	ld	t6,240(sp)
    8000571c:	10010113          	addi	sp,sp,256
    80005720:	10200073          	sret
    80005724:	00000013          	nop
    80005728:	00000013          	nop
    8000572c:	00000013          	nop

0000000080005730 <timervec>:
    80005730:	34051573          	csrrw	a0,mscratch,a0
    80005734:	00b53023          	sd	a1,0(a0)
    80005738:	00c53423          	sd	a2,8(a0)
    8000573c:	00d53823          	sd	a3,16(a0)
    80005740:	01853583          	ld	a1,24(a0)
    80005744:	02053603          	ld	a2,32(a0)
    80005748:	0005b683          	ld	a3,0(a1)
    8000574c:	00c686b3          	add	a3,a3,a2
    80005750:	00d5b023          	sd	a3,0(a1)
    80005754:	00200593          	li	a1,2
    80005758:	14459073          	csrw	sip,a1
    8000575c:	01053683          	ld	a3,16(a0)
    80005760:	00853603          	ld	a2,8(a0)
    80005764:	00053583          	ld	a1,0(a0)
    80005768:	34051573          	csrrw	a0,mscratch,a0
    8000576c:	30200073          	mret

0000000080005770 <plicinit>:
    80005770:	ff010113          	addi	sp,sp,-16
    80005774:	00813423          	sd	s0,8(sp)
    80005778:	01010413          	addi	s0,sp,16
    8000577c:	00813403          	ld	s0,8(sp)
    80005780:	0c0007b7          	lui	a5,0xc000
    80005784:	00100713          	li	a4,1
    80005788:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000578c:	00e7a223          	sw	a4,4(a5)
    80005790:	01010113          	addi	sp,sp,16
    80005794:	00008067          	ret

0000000080005798 <plicinithart>:
    80005798:	ff010113          	addi	sp,sp,-16
    8000579c:	00813023          	sd	s0,0(sp)
    800057a0:	00113423          	sd	ra,8(sp)
    800057a4:	01010413          	addi	s0,sp,16
    800057a8:	00000097          	auipc	ra,0x0
    800057ac:	a40080e7          	jalr	-1472(ra) # 800051e8 <cpuid>
    800057b0:	0085171b          	slliw	a4,a0,0x8
    800057b4:	0c0027b7          	lui	a5,0xc002
    800057b8:	00e787b3          	add	a5,a5,a4
    800057bc:	40200713          	li	a4,1026
    800057c0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800057c4:	00813083          	ld	ra,8(sp)
    800057c8:	00013403          	ld	s0,0(sp)
    800057cc:	00d5151b          	slliw	a0,a0,0xd
    800057d0:	0c2017b7          	lui	a5,0xc201
    800057d4:	00a78533          	add	a0,a5,a0
    800057d8:	00052023          	sw	zero,0(a0)
    800057dc:	01010113          	addi	sp,sp,16
    800057e0:	00008067          	ret

00000000800057e4 <plic_claim>:
    800057e4:	ff010113          	addi	sp,sp,-16
    800057e8:	00813023          	sd	s0,0(sp)
    800057ec:	00113423          	sd	ra,8(sp)
    800057f0:	01010413          	addi	s0,sp,16
    800057f4:	00000097          	auipc	ra,0x0
    800057f8:	9f4080e7          	jalr	-1548(ra) # 800051e8 <cpuid>
    800057fc:	00813083          	ld	ra,8(sp)
    80005800:	00013403          	ld	s0,0(sp)
    80005804:	00d5151b          	slliw	a0,a0,0xd
    80005808:	0c2017b7          	lui	a5,0xc201
    8000580c:	00a78533          	add	a0,a5,a0
    80005810:	00452503          	lw	a0,4(a0)
    80005814:	01010113          	addi	sp,sp,16
    80005818:	00008067          	ret

000000008000581c <plic_complete>:
    8000581c:	fe010113          	addi	sp,sp,-32
    80005820:	00813823          	sd	s0,16(sp)
    80005824:	00913423          	sd	s1,8(sp)
    80005828:	00113c23          	sd	ra,24(sp)
    8000582c:	02010413          	addi	s0,sp,32
    80005830:	00050493          	mv	s1,a0
    80005834:	00000097          	auipc	ra,0x0
    80005838:	9b4080e7          	jalr	-1612(ra) # 800051e8 <cpuid>
    8000583c:	01813083          	ld	ra,24(sp)
    80005840:	01013403          	ld	s0,16(sp)
    80005844:	00d5179b          	slliw	a5,a0,0xd
    80005848:	0c201737          	lui	a4,0xc201
    8000584c:	00f707b3          	add	a5,a4,a5
    80005850:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005854:	00813483          	ld	s1,8(sp)
    80005858:	02010113          	addi	sp,sp,32
    8000585c:	00008067          	ret

0000000080005860 <consolewrite>:
    80005860:	fb010113          	addi	sp,sp,-80
    80005864:	04813023          	sd	s0,64(sp)
    80005868:	04113423          	sd	ra,72(sp)
    8000586c:	02913c23          	sd	s1,56(sp)
    80005870:	03213823          	sd	s2,48(sp)
    80005874:	03313423          	sd	s3,40(sp)
    80005878:	03413023          	sd	s4,32(sp)
    8000587c:	01513c23          	sd	s5,24(sp)
    80005880:	05010413          	addi	s0,sp,80
    80005884:	06c05c63          	blez	a2,800058fc <consolewrite+0x9c>
    80005888:	00060993          	mv	s3,a2
    8000588c:	00050a13          	mv	s4,a0
    80005890:	00058493          	mv	s1,a1
    80005894:	00000913          	li	s2,0
    80005898:	fff00a93          	li	s5,-1
    8000589c:	01c0006f          	j	800058b8 <consolewrite+0x58>
    800058a0:	fbf44503          	lbu	a0,-65(s0)
    800058a4:	0019091b          	addiw	s2,s2,1
    800058a8:	00148493          	addi	s1,s1,1
    800058ac:	00001097          	auipc	ra,0x1
    800058b0:	a9c080e7          	jalr	-1380(ra) # 80006348 <uartputc>
    800058b4:	03298063          	beq	s3,s2,800058d4 <consolewrite+0x74>
    800058b8:	00048613          	mv	a2,s1
    800058bc:	00100693          	li	a3,1
    800058c0:	000a0593          	mv	a1,s4
    800058c4:	fbf40513          	addi	a0,s0,-65
    800058c8:	00000097          	auipc	ra,0x0
    800058cc:	9d8080e7          	jalr	-1576(ra) # 800052a0 <either_copyin>
    800058d0:	fd5518e3          	bne	a0,s5,800058a0 <consolewrite+0x40>
    800058d4:	04813083          	ld	ra,72(sp)
    800058d8:	04013403          	ld	s0,64(sp)
    800058dc:	03813483          	ld	s1,56(sp)
    800058e0:	02813983          	ld	s3,40(sp)
    800058e4:	02013a03          	ld	s4,32(sp)
    800058e8:	01813a83          	ld	s5,24(sp)
    800058ec:	00090513          	mv	a0,s2
    800058f0:	03013903          	ld	s2,48(sp)
    800058f4:	05010113          	addi	sp,sp,80
    800058f8:	00008067          	ret
    800058fc:	00000913          	li	s2,0
    80005900:	fd5ff06f          	j	800058d4 <consolewrite+0x74>

0000000080005904 <consoleread>:
    80005904:	f9010113          	addi	sp,sp,-112
    80005908:	06813023          	sd	s0,96(sp)
    8000590c:	04913c23          	sd	s1,88(sp)
    80005910:	05213823          	sd	s2,80(sp)
    80005914:	05313423          	sd	s3,72(sp)
    80005918:	05413023          	sd	s4,64(sp)
    8000591c:	03513c23          	sd	s5,56(sp)
    80005920:	03613823          	sd	s6,48(sp)
    80005924:	03713423          	sd	s7,40(sp)
    80005928:	03813023          	sd	s8,32(sp)
    8000592c:	06113423          	sd	ra,104(sp)
    80005930:	01913c23          	sd	s9,24(sp)
    80005934:	07010413          	addi	s0,sp,112
    80005938:	00060b93          	mv	s7,a2
    8000593c:	00050913          	mv	s2,a0
    80005940:	00058c13          	mv	s8,a1
    80005944:	00060b1b          	sext.w	s6,a2
    80005948:	00006497          	auipc	s1,0x6
    8000594c:	bc048493          	addi	s1,s1,-1088 # 8000b508 <cons>
    80005950:	00400993          	li	s3,4
    80005954:	fff00a13          	li	s4,-1
    80005958:	00a00a93          	li	s5,10
    8000595c:	05705e63          	blez	s7,800059b8 <consoleread+0xb4>
    80005960:	09c4a703          	lw	a4,156(s1)
    80005964:	0984a783          	lw	a5,152(s1)
    80005968:	0007071b          	sext.w	a4,a4
    8000596c:	08e78463          	beq	a5,a4,800059f4 <consoleread+0xf0>
    80005970:	07f7f713          	andi	a4,a5,127
    80005974:	00e48733          	add	a4,s1,a4
    80005978:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000597c:	0017869b          	addiw	a3,a5,1
    80005980:	08d4ac23          	sw	a3,152(s1)
    80005984:	00070c9b          	sext.w	s9,a4
    80005988:	0b370663          	beq	a4,s3,80005a34 <consoleread+0x130>
    8000598c:	00100693          	li	a3,1
    80005990:	f9f40613          	addi	a2,s0,-97
    80005994:	000c0593          	mv	a1,s8
    80005998:	00090513          	mv	a0,s2
    8000599c:	f8e40fa3          	sb	a4,-97(s0)
    800059a0:	00000097          	auipc	ra,0x0
    800059a4:	8b4080e7          	jalr	-1868(ra) # 80005254 <either_copyout>
    800059a8:	01450863          	beq	a0,s4,800059b8 <consoleread+0xb4>
    800059ac:	001c0c13          	addi	s8,s8,1
    800059b0:	fffb8b9b          	addiw	s7,s7,-1
    800059b4:	fb5c94e3          	bne	s9,s5,8000595c <consoleread+0x58>
    800059b8:	000b851b          	sext.w	a0,s7
    800059bc:	06813083          	ld	ra,104(sp)
    800059c0:	06013403          	ld	s0,96(sp)
    800059c4:	05813483          	ld	s1,88(sp)
    800059c8:	05013903          	ld	s2,80(sp)
    800059cc:	04813983          	ld	s3,72(sp)
    800059d0:	04013a03          	ld	s4,64(sp)
    800059d4:	03813a83          	ld	s5,56(sp)
    800059d8:	02813b83          	ld	s7,40(sp)
    800059dc:	02013c03          	ld	s8,32(sp)
    800059e0:	01813c83          	ld	s9,24(sp)
    800059e4:	40ab053b          	subw	a0,s6,a0
    800059e8:	03013b03          	ld	s6,48(sp)
    800059ec:	07010113          	addi	sp,sp,112
    800059f0:	00008067          	ret
    800059f4:	00001097          	auipc	ra,0x1
    800059f8:	1d8080e7          	jalr	472(ra) # 80006bcc <push_on>
    800059fc:	0984a703          	lw	a4,152(s1)
    80005a00:	09c4a783          	lw	a5,156(s1)
    80005a04:	0007879b          	sext.w	a5,a5
    80005a08:	fef70ce3          	beq	a4,a5,80005a00 <consoleread+0xfc>
    80005a0c:	00001097          	auipc	ra,0x1
    80005a10:	234080e7          	jalr	564(ra) # 80006c40 <pop_on>
    80005a14:	0984a783          	lw	a5,152(s1)
    80005a18:	07f7f713          	andi	a4,a5,127
    80005a1c:	00e48733          	add	a4,s1,a4
    80005a20:	01874703          	lbu	a4,24(a4)
    80005a24:	0017869b          	addiw	a3,a5,1
    80005a28:	08d4ac23          	sw	a3,152(s1)
    80005a2c:	00070c9b          	sext.w	s9,a4
    80005a30:	f5371ee3          	bne	a4,s3,8000598c <consoleread+0x88>
    80005a34:	000b851b          	sext.w	a0,s7
    80005a38:	f96bf2e3          	bgeu	s7,s6,800059bc <consoleread+0xb8>
    80005a3c:	08f4ac23          	sw	a5,152(s1)
    80005a40:	f7dff06f          	j	800059bc <consoleread+0xb8>

0000000080005a44 <consputc>:
    80005a44:	10000793          	li	a5,256
    80005a48:	00f50663          	beq	a0,a5,80005a54 <consputc+0x10>
    80005a4c:	00001317          	auipc	t1,0x1
    80005a50:	9f430067          	jr	-1548(t1) # 80006440 <uartputc_sync>
    80005a54:	ff010113          	addi	sp,sp,-16
    80005a58:	00113423          	sd	ra,8(sp)
    80005a5c:	00813023          	sd	s0,0(sp)
    80005a60:	01010413          	addi	s0,sp,16
    80005a64:	00800513          	li	a0,8
    80005a68:	00001097          	auipc	ra,0x1
    80005a6c:	9d8080e7          	jalr	-1576(ra) # 80006440 <uartputc_sync>
    80005a70:	02000513          	li	a0,32
    80005a74:	00001097          	auipc	ra,0x1
    80005a78:	9cc080e7          	jalr	-1588(ra) # 80006440 <uartputc_sync>
    80005a7c:	00013403          	ld	s0,0(sp)
    80005a80:	00813083          	ld	ra,8(sp)
    80005a84:	00800513          	li	a0,8
    80005a88:	01010113          	addi	sp,sp,16
    80005a8c:	00001317          	auipc	t1,0x1
    80005a90:	9b430067          	jr	-1612(t1) # 80006440 <uartputc_sync>

0000000080005a94 <consoleintr>:
    80005a94:	fe010113          	addi	sp,sp,-32
    80005a98:	00813823          	sd	s0,16(sp)
    80005a9c:	00913423          	sd	s1,8(sp)
    80005aa0:	01213023          	sd	s2,0(sp)
    80005aa4:	00113c23          	sd	ra,24(sp)
    80005aa8:	02010413          	addi	s0,sp,32
    80005aac:	00006917          	auipc	s2,0x6
    80005ab0:	a5c90913          	addi	s2,s2,-1444 # 8000b508 <cons>
    80005ab4:	00050493          	mv	s1,a0
    80005ab8:	00090513          	mv	a0,s2
    80005abc:	00001097          	auipc	ra,0x1
    80005ac0:	e40080e7          	jalr	-448(ra) # 800068fc <acquire>
    80005ac4:	02048c63          	beqz	s1,80005afc <consoleintr+0x68>
    80005ac8:	0a092783          	lw	a5,160(s2)
    80005acc:	09892703          	lw	a4,152(s2)
    80005ad0:	07f00693          	li	a3,127
    80005ad4:	40e7873b          	subw	a4,a5,a4
    80005ad8:	02e6e263          	bltu	a3,a4,80005afc <consoleintr+0x68>
    80005adc:	00d00713          	li	a4,13
    80005ae0:	04e48063          	beq	s1,a4,80005b20 <consoleintr+0x8c>
    80005ae4:	07f7f713          	andi	a4,a5,127
    80005ae8:	00e90733          	add	a4,s2,a4
    80005aec:	0017879b          	addiw	a5,a5,1
    80005af0:	0af92023          	sw	a5,160(s2)
    80005af4:	00970c23          	sb	s1,24(a4)
    80005af8:	08f92e23          	sw	a5,156(s2)
    80005afc:	01013403          	ld	s0,16(sp)
    80005b00:	01813083          	ld	ra,24(sp)
    80005b04:	00813483          	ld	s1,8(sp)
    80005b08:	00013903          	ld	s2,0(sp)
    80005b0c:	00006517          	auipc	a0,0x6
    80005b10:	9fc50513          	addi	a0,a0,-1540 # 8000b508 <cons>
    80005b14:	02010113          	addi	sp,sp,32
    80005b18:	00001317          	auipc	t1,0x1
    80005b1c:	eb030067          	jr	-336(t1) # 800069c8 <release>
    80005b20:	00a00493          	li	s1,10
    80005b24:	fc1ff06f          	j	80005ae4 <consoleintr+0x50>

0000000080005b28 <consoleinit>:
    80005b28:	fe010113          	addi	sp,sp,-32
    80005b2c:	00113c23          	sd	ra,24(sp)
    80005b30:	00813823          	sd	s0,16(sp)
    80005b34:	00913423          	sd	s1,8(sp)
    80005b38:	02010413          	addi	s0,sp,32
    80005b3c:	00006497          	auipc	s1,0x6
    80005b40:	9cc48493          	addi	s1,s1,-1588 # 8000b508 <cons>
    80005b44:	00048513          	mv	a0,s1
    80005b48:	00002597          	auipc	a1,0x2
    80005b4c:	6a058593          	addi	a1,a1,1696 # 800081e8 <_ZN3stm4coutE+0x178>
    80005b50:	00001097          	auipc	ra,0x1
    80005b54:	d88080e7          	jalr	-632(ra) # 800068d8 <initlock>
    80005b58:	00000097          	auipc	ra,0x0
    80005b5c:	7ac080e7          	jalr	1964(ra) # 80006304 <uartinit>
    80005b60:	01813083          	ld	ra,24(sp)
    80005b64:	01013403          	ld	s0,16(sp)
    80005b68:	00000797          	auipc	a5,0x0
    80005b6c:	d9c78793          	addi	a5,a5,-612 # 80005904 <consoleread>
    80005b70:	0af4bc23          	sd	a5,184(s1)
    80005b74:	00000797          	auipc	a5,0x0
    80005b78:	cec78793          	addi	a5,a5,-788 # 80005860 <consolewrite>
    80005b7c:	0cf4b023          	sd	a5,192(s1)
    80005b80:	00813483          	ld	s1,8(sp)
    80005b84:	02010113          	addi	sp,sp,32
    80005b88:	00008067          	ret

0000000080005b8c <console_read>:
    80005b8c:	ff010113          	addi	sp,sp,-16
    80005b90:	00813423          	sd	s0,8(sp)
    80005b94:	01010413          	addi	s0,sp,16
    80005b98:	00813403          	ld	s0,8(sp)
    80005b9c:	00006317          	auipc	t1,0x6
    80005ba0:	a2433303          	ld	t1,-1500(t1) # 8000b5c0 <devsw+0x10>
    80005ba4:	01010113          	addi	sp,sp,16
    80005ba8:	00030067          	jr	t1

0000000080005bac <console_write>:
    80005bac:	ff010113          	addi	sp,sp,-16
    80005bb0:	00813423          	sd	s0,8(sp)
    80005bb4:	01010413          	addi	s0,sp,16
    80005bb8:	00813403          	ld	s0,8(sp)
    80005bbc:	00006317          	auipc	t1,0x6
    80005bc0:	a0c33303          	ld	t1,-1524(t1) # 8000b5c8 <devsw+0x18>
    80005bc4:	01010113          	addi	sp,sp,16
    80005bc8:	00030067          	jr	t1

0000000080005bcc <panic>:
    80005bcc:	fe010113          	addi	sp,sp,-32
    80005bd0:	00113c23          	sd	ra,24(sp)
    80005bd4:	00813823          	sd	s0,16(sp)
    80005bd8:	00913423          	sd	s1,8(sp)
    80005bdc:	02010413          	addi	s0,sp,32
    80005be0:	00050493          	mv	s1,a0
    80005be4:	00002517          	auipc	a0,0x2
    80005be8:	60c50513          	addi	a0,a0,1548 # 800081f0 <_ZN3stm4coutE+0x180>
    80005bec:	00006797          	auipc	a5,0x6
    80005bf0:	a607ae23          	sw	zero,-1412(a5) # 8000b668 <pr+0x18>
    80005bf4:	00000097          	auipc	ra,0x0
    80005bf8:	034080e7          	jalr	52(ra) # 80005c28 <__printf>
    80005bfc:	00048513          	mv	a0,s1
    80005c00:	00000097          	auipc	ra,0x0
    80005c04:	028080e7          	jalr	40(ra) # 80005c28 <__printf>
    80005c08:	00002517          	auipc	a0,0x2
    80005c0c:	5c850513          	addi	a0,a0,1480 # 800081d0 <_ZN3stm4coutE+0x160>
    80005c10:	00000097          	auipc	ra,0x0
    80005c14:	018080e7          	jalr	24(ra) # 80005c28 <__printf>
    80005c18:	00100793          	li	a5,1
    80005c1c:	00004717          	auipc	a4,0x4
    80005c20:	70f72e23          	sw	a5,1820(a4) # 8000a338 <panicked>
    80005c24:	0000006f          	j	80005c24 <panic+0x58>

0000000080005c28 <__printf>:
    80005c28:	f3010113          	addi	sp,sp,-208
    80005c2c:	08813023          	sd	s0,128(sp)
    80005c30:	07313423          	sd	s3,104(sp)
    80005c34:	09010413          	addi	s0,sp,144
    80005c38:	05813023          	sd	s8,64(sp)
    80005c3c:	08113423          	sd	ra,136(sp)
    80005c40:	06913c23          	sd	s1,120(sp)
    80005c44:	07213823          	sd	s2,112(sp)
    80005c48:	07413023          	sd	s4,96(sp)
    80005c4c:	05513c23          	sd	s5,88(sp)
    80005c50:	05613823          	sd	s6,80(sp)
    80005c54:	05713423          	sd	s7,72(sp)
    80005c58:	03913c23          	sd	s9,56(sp)
    80005c5c:	03a13823          	sd	s10,48(sp)
    80005c60:	03b13423          	sd	s11,40(sp)
    80005c64:	00006317          	auipc	t1,0x6
    80005c68:	9ec30313          	addi	t1,t1,-1556 # 8000b650 <pr>
    80005c6c:	01832c03          	lw	s8,24(t1)
    80005c70:	00b43423          	sd	a1,8(s0)
    80005c74:	00c43823          	sd	a2,16(s0)
    80005c78:	00d43c23          	sd	a3,24(s0)
    80005c7c:	02e43023          	sd	a4,32(s0)
    80005c80:	02f43423          	sd	a5,40(s0)
    80005c84:	03043823          	sd	a6,48(s0)
    80005c88:	03143c23          	sd	a7,56(s0)
    80005c8c:	00050993          	mv	s3,a0
    80005c90:	4a0c1663          	bnez	s8,8000613c <__printf+0x514>
    80005c94:	60098c63          	beqz	s3,800062ac <__printf+0x684>
    80005c98:	0009c503          	lbu	a0,0(s3)
    80005c9c:	00840793          	addi	a5,s0,8
    80005ca0:	f6f43c23          	sd	a5,-136(s0)
    80005ca4:	00000493          	li	s1,0
    80005ca8:	22050063          	beqz	a0,80005ec8 <__printf+0x2a0>
    80005cac:	00002a37          	lui	s4,0x2
    80005cb0:	00018ab7          	lui	s5,0x18
    80005cb4:	000f4b37          	lui	s6,0xf4
    80005cb8:	00989bb7          	lui	s7,0x989
    80005cbc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005cc0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005cc4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005cc8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005ccc:	00148c9b          	addiw	s9,s1,1
    80005cd0:	02500793          	li	a5,37
    80005cd4:	01998933          	add	s2,s3,s9
    80005cd8:	38f51263          	bne	a0,a5,8000605c <__printf+0x434>
    80005cdc:	00094783          	lbu	a5,0(s2)
    80005ce0:	00078c9b          	sext.w	s9,a5
    80005ce4:	1e078263          	beqz	a5,80005ec8 <__printf+0x2a0>
    80005ce8:	0024849b          	addiw	s1,s1,2
    80005cec:	07000713          	li	a4,112
    80005cf0:	00998933          	add	s2,s3,s1
    80005cf4:	38e78a63          	beq	a5,a4,80006088 <__printf+0x460>
    80005cf8:	20f76863          	bltu	a4,a5,80005f08 <__printf+0x2e0>
    80005cfc:	42a78863          	beq	a5,a0,8000612c <__printf+0x504>
    80005d00:	06400713          	li	a4,100
    80005d04:	40e79663          	bne	a5,a4,80006110 <__printf+0x4e8>
    80005d08:	f7843783          	ld	a5,-136(s0)
    80005d0c:	0007a603          	lw	a2,0(a5)
    80005d10:	00878793          	addi	a5,a5,8
    80005d14:	f6f43c23          	sd	a5,-136(s0)
    80005d18:	42064a63          	bltz	a2,8000614c <__printf+0x524>
    80005d1c:	00a00713          	li	a4,10
    80005d20:	02e677bb          	remuw	a5,a2,a4
    80005d24:	00002d97          	auipc	s11,0x2
    80005d28:	4f4d8d93          	addi	s11,s11,1268 # 80008218 <digits>
    80005d2c:	00900593          	li	a1,9
    80005d30:	0006051b          	sext.w	a0,a2
    80005d34:	00000c93          	li	s9,0
    80005d38:	02079793          	slli	a5,a5,0x20
    80005d3c:	0207d793          	srli	a5,a5,0x20
    80005d40:	00fd87b3          	add	a5,s11,a5
    80005d44:	0007c783          	lbu	a5,0(a5)
    80005d48:	02e656bb          	divuw	a3,a2,a4
    80005d4c:	f8f40023          	sb	a5,-128(s0)
    80005d50:	14c5d863          	bge	a1,a2,80005ea0 <__printf+0x278>
    80005d54:	06300593          	li	a1,99
    80005d58:	00100c93          	li	s9,1
    80005d5c:	02e6f7bb          	remuw	a5,a3,a4
    80005d60:	02079793          	slli	a5,a5,0x20
    80005d64:	0207d793          	srli	a5,a5,0x20
    80005d68:	00fd87b3          	add	a5,s11,a5
    80005d6c:	0007c783          	lbu	a5,0(a5)
    80005d70:	02e6d73b          	divuw	a4,a3,a4
    80005d74:	f8f400a3          	sb	a5,-127(s0)
    80005d78:	12a5f463          	bgeu	a1,a0,80005ea0 <__printf+0x278>
    80005d7c:	00a00693          	li	a3,10
    80005d80:	00900593          	li	a1,9
    80005d84:	02d777bb          	remuw	a5,a4,a3
    80005d88:	02079793          	slli	a5,a5,0x20
    80005d8c:	0207d793          	srli	a5,a5,0x20
    80005d90:	00fd87b3          	add	a5,s11,a5
    80005d94:	0007c503          	lbu	a0,0(a5)
    80005d98:	02d757bb          	divuw	a5,a4,a3
    80005d9c:	f8a40123          	sb	a0,-126(s0)
    80005da0:	48e5f263          	bgeu	a1,a4,80006224 <__printf+0x5fc>
    80005da4:	06300513          	li	a0,99
    80005da8:	02d7f5bb          	remuw	a1,a5,a3
    80005dac:	02059593          	slli	a1,a1,0x20
    80005db0:	0205d593          	srli	a1,a1,0x20
    80005db4:	00bd85b3          	add	a1,s11,a1
    80005db8:	0005c583          	lbu	a1,0(a1)
    80005dbc:	02d7d7bb          	divuw	a5,a5,a3
    80005dc0:	f8b401a3          	sb	a1,-125(s0)
    80005dc4:	48e57263          	bgeu	a0,a4,80006248 <__printf+0x620>
    80005dc8:	3e700513          	li	a0,999
    80005dcc:	02d7f5bb          	remuw	a1,a5,a3
    80005dd0:	02059593          	slli	a1,a1,0x20
    80005dd4:	0205d593          	srli	a1,a1,0x20
    80005dd8:	00bd85b3          	add	a1,s11,a1
    80005ddc:	0005c583          	lbu	a1,0(a1)
    80005de0:	02d7d7bb          	divuw	a5,a5,a3
    80005de4:	f8b40223          	sb	a1,-124(s0)
    80005de8:	46e57663          	bgeu	a0,a4,80006254 <__printf+0x62c>
    80005dec:	02d7f5bb          	remuw	a1,a5,a3
    80005df0:	02059593          	slli	a1,a1,0x20
    80005df4:	0205d593          	srli	a1,a1,0x20
    80005df8:	00bd85b3          	add	a1,s11,a1
    80005dfc:	0005c583          	lbu	a1,0(a1)
    80005e00:	02d7d7bb          	divuw	a5,a5,a3
    80005e04:	f8b402a3          	sb	a1,-123(s0)
    80005e08:	46ea7863          	bgeu	s4,a4,80006278 <__printf+0x650>
    80005e0c:	02d7f5bb          	remuw	a1,a5,a3
    80005e10:	02059593          	slli	a1,a1,0x20
    80005e14:	0205d593          	srli	a1,a1,0x20
    80005e18:	00bd85b3          	add	a1,s11,a1
    80005e1c:	0005c583          	lbu	a1,0(a1)
    80005e20:	02d7d7bb          	divuw	a5,a5,a3
    80005e24:	f8b40323          	sb	a1,-122(s0)
    80005e28:	3eeaf863          	bgeu	s5,a4,80006218 <__printf+0x5f0>
    80005e2c:	02d7f5bb          	remuw	a1,a5,a3
    80005e30:	02059593          	slli	a1,a1,0x20
    80005e34:	0205d593          	srli	a1,a1,0x20
    80005e38:	00bd85b3          	add	a1,s11,a1
    80005e3c:	0005c583          	lbu	a1,0(a1)
    80005e40:	02d7d7bb          	divuw	a5,a5,a3
    80005e44:	f8b403a3          	sb	a1,-121(s0)
    80005e48:	42eb7e63          	bgeu	s6,a4,80006284 <__printf+0x65c>
    80005e4c:	02d7f5bb          	remuw	a1,a5,a3
    80005e50:	02059593          	slli	a1,a1,0x20
    80005e54:	0205d593          	srli	a1,a1,0x20
    80005e58:	00bd85b3          	add	a1,s11,a1
    80005e5c:	0005c583          	lbu	a1,0(a1)
    80005e60:	02d7d7bb          	divuw	a5,a5,a3
    80005e64:	f8b40423          	sb	a1,-120(s0)
    80005e68:	42ebfc63          	bgeu	s7,a4,800062a0 <__printf+0x678>
    80005e6c:	02079793          	slli	a5,a5,0x20
    80005e70:	0207d793          	srli	a5,a5,0x20
    80005e74:	00fd8db3          	add	s11,s11,a5
    80005e78:	000dc703          	lbu	a4,0(s11)
    80005e7c:	00a00793          	li	a5,10
    80005e80:	00900c93          	li	s9,9
    80005e84:	f8e404a3          	sb	a4,-119(s0)
    80005e88:	00065c63          	bgez	a2,80005ea0 <__printf+0x278>
    80005e8c:	f9040713          	addi	a4,s0,-112
    80005e90:	00f70733          	add	a4,a4,a5
    80005e94:	02d00693          	li	a3,45
    80005e98:	fed70823          	sb	a3,-16(a4)
    80005e9c:	00078c93          	mv	s9,a5
    80005ea0:	f8040793          	addi	a5,s0,-128
    80005ea4:	01978cb3          	add	s9,a5,s9
    80005ea8:	f7f40d13          	addi	s10,s0,-129
    80005eac:	000cc503          	lbu	a0,0(s9)
    80005eb0:	fffc8c93          	addi	s9,s9,-1
    80005eb4:	00000097          	auipc	ra,0x0
    80005eb8:	b90080e7          	jalr	-1136(ra) # 80005a44 <consputc>
    80005ebc:	ffac98e3          	bne	s9,s10,80005eac <__printf+0x284>
    80005ec0:	00094503          	lbu	a0,0(s2)
    80005ec4:	e00514e3          	bnez	a0,80005ccc <__printf+0xa4>
    80005ec8:	1a0c1663          	bnez	s8,80006074 <__printf+0x44c>
    80005ecc:	08813083          	ld	ra,136(sp)
    80005ed0:	08013403          	ld	s0,128(sp)
    80005ed4:	07813483          	ld	s1,120(sp)
    80005ed8:	07013903          	ld	s2,112(sp)
    80005edc:	06813983          	ld	s3,104(sp)
    80005ee0:	06013a03          	ld	s4,96(sp)
    80005ee4:	05813a83          	ld	s5,88(sp)
    80005ee8:	05013b03          	ld	s6,80(sp)
    80005eec:	04813b83          	ld	s7,72(sp)
    80005ef0:	04013c03          	ld	s8,64(sp)
    80005ef4:	03813c83          	ld	s9,56(sp)
    80005ef8:	03013d03          	ld	s10,48(sp)
    80005efc:	02813d83          	ld	s11,40(sp)
    80005f00:	0d010113          	addi	sp,sp,208
    80005f04:	00008067          	ret
    80005f08:	07300713          	li	a4,115
    80005f0c:	1ce78a63          	beq	a5,a4,800060e0 <__printf+0x4b8>
    80005f10:	07800713          	li	a4,120
    80005f14:	1ee79e63          	bne	a5,a4,80006110 <__printf+0x4e8>
    80005f18:	f7843783          	ld	a5,-136(s0)
    80005f1c:	0007a703          	lw	a4,0(a5)
    80005f20:	00878793          	addi	a5,a5,8
    80005f24:	f6f43c23          	sd	a5,-136(s0)
    80005f28:	28074263          	bltz	a4,800061ac <__printf+0x584>
    80005f2c:	00002d97          	auipc	s11,0x2
    80005f30:	2ecd8d93          	addi	s11,s11,748 # 80008218 <digits>
    80005f34:	00f77793          	andi	a5,a4,15
    80005f38:	00fd87b3          	add	a5,s11,a5
    80005f3c:	0007c683          	lbu	a3,0(a5)
    80005f40:	00f00613          	li	a2,15
    80005f44:	0007079b          	sext.w	a5,a4
    80005f48:	f8d40023          	sb	a3,-128(s0)
    80005f4c:	0047559b          	srliw	a1,a4,0x4
    80005f50:	0047569b          	srliw	a3,a4,0x4
    80005f54:	00000c93          	li	s9,0
    80005f58:	0ee65063          	bge	a2,a4,80006038 <__printf+0x410>
    80005f5c:	00f6f693          	andi	a3,a3,15
    80005f60:	00dd86b3          	add	a3,s11,a3
    80005f64:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80005f68:	0087d79b          	srliw	a5,a5,0x8
    80005f6c:	00100c93          	li	s9,1
    80005f70:	f8d400a3          	sb	a3,-127(s0)
    80005f74:	0cb67263          	bgeu	a2,a1,80006038 <__printf+0x410>
    80005f78:	00f7f693          	andi	a3,a5,15
    80005f7c:	00dd86b3          	add	a3,s11,a3
    80005f80:	0006c583          	lbu	a1,0(a3)
    80005f84:	00f00613          	li	a2,15
    80005f88:	0047d69b          	srliw	a3,a5,0x4
    80005f8c:	f8b40123          	sb	a1,-126(s0)
    80005f90:	0047d593          	srli	a1,a5,0x4
    80005f94:	28f67e63          	bgeu	a2,a5,80006230 <__printf+0x608>
    80005f98:	00f6f693          	andi	a3,a3,15
    80005f9c:	00dd86b3          	add	a3,s11,a3
    80005fa0:	0006c503          	lbu	a0,0(a3)
    80005fa4:	0087d813          	srli	a6,a5,0x8
    80005fa8:	0087d69b          	srliw	a3,a5,0x8
    80005fac:	f8a401a3          	sb	a0,-125(s0)
    80005fb0:	28b67663          	bgeu	a2,a1,8000623c <__printf+0x614>
    80005fb4:	00f6f693          	andi	a3,a3,15
    80005fb8:	00dd86b3          	add	a3,s11,a3
    80005fbc:	0006c583          	lbu	a1,0(a3)
    80005fc0:	00c7d513          	srli	a0,a5,0xc
    80005fc4:	00c7d69b          	srliw	a3,a5,0xc
    80005fc8:	f8b40223          	sb	a1,-124(s0)
    80005fcc:	29067a63          	bgeu	a2,a6,80006260 <__printf+0x638>
    80005fd0:	00f6f693          	andi	a3,a3,15
    80005fd4:	00dd86b3          	add	a3,s11,a3
    80005fd8:	0006c583          	lbu	a1,0(a3)
    80005fdc:	0107d813          	srli	a6,a5,0x10
    80005fe0:	0107d69b          	srliw	a3,a5,0x10
    80005fe4:	f8b402a3          	sb	a1,-123(s0)
    80005fe8:	28a67263          	bgeu	a2,a0,8000626c <__printf+0x644>
    80005fec:	00f6f693          	andi	a3,a3,15
    80005ff0:	00dd86b3          	add	a3,s11,a3
    80005ff4:	0006c683          	lbu	a3,0(a3)
    80005ff8:	0147d79b          	srliw	a5,a5,0x14
    80005ffc:	f8d40323          	sb	a3,-122(s0)
    80006000:	21067663          	bgeu	a2,a6,8000620c <__printf+0x5e4>
    80006004:	02079793          	slli	a5,a5,0x20
    80006008:	0207d793          	srli	a5,a5,0x20
    8000600c:	00fd8db3          	add	s11,s11,a5
    80006010:	000dc683          	lbu	a3,0(s11)
    80006014:	00800793          	li	a5,8
    80006018:	00700c93          	li	s9,7
    8000601c:	f8d403a3          	sb	a3,-121(s0)
    80006020:	00075c63          	bgez	a4,80006038 <__printf+0x410>
    80006024:	f9040713          	addi	a4,s0,-112
    80006028:	00f70733          	add	a4,a4,a5
    8000602c:	02d00693          	li	a3,45
    80006030:	fed70823          	sb	a3,-16(a4)
    80006034:	00078c93          	mv	s9,a5
    80006038:	f8040793          	addi	a5,s0,-128
    8000603c:	01978cb3          	add	s9,a5,s9
    80006040:	f7f40d13          	addi	s10,s0,-129
    80006044:	000cc503          	lbu	a0,0(s9)
    80006048:	fffc8c93          	addi	s9,s9,-1
    8000604c:	00000097          	auipc	ra,0x0
    80006050:	9f8080e7          	jalr	-1544(ra) # 80005a44 <consputc>
    80006054:	ff9d18e3          	bne	s10,s9,80006044 <__printf+0x41c>
    80006058:	0100006f          	j	80006068 <__printf+0x440>
    8000605c:	00000097          	auipc	ra,0x0
    80006060:	9e8080e7          	jalr	-1560(ra) # 80005a44 <consputc>
    80006064:	000c8493          	mv	s1,s9
    80006068:	00094503          	lbu	a0,0(s2)
    8000606c:	c60510e3          	bnez	a0,80005ccc <__printf+0xa4>
    80006070:	e40c0ee3          	beqz	s8,80005ecc <__printf+0x2a4>
    80006074:	00005517          	auipc	a0,0x5
    80006078:	5dc50513          	addi	a0,a0,1500 # 8000b650 <pr>
    8000607c:	00001097          	auipc	ra,0x1
    80006080:	94c080e7          	jalr	-1716(ra) # 800069c8 <release>
    80006084:	e49ff06f          	j	80005ecc <__printf+0x2a4>
    80006088:	f7843783          	ld	a5,-136(s0)
    8000608c:	03000513          	li	a0,48
    80006090:	01000d13          	li	s10,16
    80006094:	00878713          	addi	a4,a5,8
    80006098:	0007bc83          	ld	s9,0(a5)
    8000609c:	f6e43c23          	sd	a4,-136(s0)
    800060a0:	00000097          	auipc	ra,0x0
    800060a4:	9a4080e7          	jalr	-1628(ra) # 80005a44 <consputc>
    800060a8:	07800513          	li	a0,120
    800060ac:	00000097          	auipc	ra,0x0
    800060b0:	998080e7          	jalr	-1640(ra) # 80005a44 <consputc>
    800060b4:	00002d97          	auipc	s11,0x2
    800060b8:	164d8d93          	addi	s11,s11,356 # 80008218 <digits>
    800060bc:	03ccd793          	srli	a5,s9,0x3c
    800060c0:	00fd87b3          	add	a5,s11,a5
    800060c4:	0007c503          	lbu	a0,0(a5)
    800060c8:	fffd0d1b          	addiw	s10,s10,-1
    800060cc:	004c9c93          	slli	s9,s9,0x4
    800060d0:	00000097          	auipc	ra,0x0
    800060d4:	974080e7          	jalr	-1676(ra) # 80005a44 <consputc>
    800060d8:	fe0d12e3          	bnez	s10,800060bc <__printf+0x494>
    800060dc:	f8dff06f          	j	80006068 <__printf+0x440>
    800060e0:	f7843783          	ld	a5,-136(s0)
    800060e4:	0007bc83          	ld	s9,0(a5)
    800060e8:	00878793          	addi	a5,a5,8
    800060ec:	f6f43c23          	sd	a5,-136(s0)
    800060f0:	000c9a63          	bnez	s9,80006104 <__printf+0x4dc>
    800060f4:	1080006f          	j	800061fc <__printf+0x5d4>
    800060f8:	001c8c93          	addi	s9,s9,1
    800060fc:	00000097          	auipc	ra,0x0
    80006100:	948080e7          	jalr	-1720(ra) # 80005a44 <consputc>
    80006104:	000cc503          	lbu	a0,0(s9)
    80006108:	fe0518e3          	bnez	a0,800060f8 <__printf+0x4d0>
    8000610c:	f5dff06f          	j	80006068 <__printf+0x440>
    80006110:	02500513          	li	a0,37
    80006114:	00000097          	auipc	ra,0x0
    80006118:	930080e7          	jalr	-1744(ra) # 80005a44 <consputc>
    8000611c:	000c8513          	mv	a0,s9
    80006120:	00000097          	auipc	ra,0x0
    80006124:	924080e7          	jalr	-1756(ra) # 80005a44 <consputc>
    80006128:	f41ff06f          	j	80006068 <__printf+0x440>
    8000612c:	02500513          	li	a0,37
    80006130:	00000097          	auipc	ra,0x0
    80006134:	914080e7          	jalr	-1772(ra) # 80005a44 <consputc>
    80006138:	f31ff06f          	j	80006068 <__printf+0x440>
    8000613c:	00030513          	mv	a0,t1
    80006140:	00000097          	auipc	ra,0x0
    80006144:	7bc080e7          	jalr	1980(ra) # 800068fc <acquire>
    80006148:	b4dff06f          	j	80005c94 <__printf+0x6c>
    8000614c:	40c0053b          	negw	a0,a2
    80006150:	00a00713          	li	a4,10
    80006154:	02e576bb          	remuw	a3,a0,a4
    80006158:	00002d97          	auipc	s11,0x2
    8000615c:	0c0d8d93          	addi	s11,s11,192 # 80008218 <digits>
    80006160:	ff700593          	li	a1,-9
    80006164:	02069693          	slli	a3,a3,0x20
    80006168:	0206d693          	srli	a3,a3,0x20
    8000616c:	00dd86b3          	add	a3,s11,a3
    80006170:	0006c683          	lbu	a3,0(a3)
    80006174:	02e557bb          	divuw	a5,a0,a4
    80006178:	f8d40023          	sb	a3,-128(s0)
    8000617c:	10b65e63          	bge	a2,a1,80006298 <__printf+0x670>
    80006180:	06300593          	li	a1,99
    80006184:	02e7f6bb          	remuw	a3,a5,a4
    80006188:	02069693          	slli	a3,a3,0x20
    8000618c:	0206d693          	srli	a3,a3,0x20
    80006190:	00dd86b3          	add	a3,s11,a3
    80006194:	0006c683          	lbu	a3,0(a3)
    80006198:	02e7d73b          	divuw	a4,a5,a4
    8000619c:	00200793          	li	a5,2
    800061a0:	f8d400a3          	sb	a3,-127(s0)
    800061a4:	bca5ece3          	bltu	a1,a0,80005d7c <__printf+0x154>
    800061a8:	ce5ff06f          	j	80005e8c <__printf+0x264>
    800061ac:	40e007bb          	negw	a5,a4
    800061b0:	00002d97          	auipc	s11,0x2
    800061b4:	068d8d93          	addi	s11,s11,104 # 80008218 <digits>
    800061b8:	00f7f693          	andi	a3,a5,15
    800061bc:	00dd86b3          	add	a3,s11,a3
    800061c0:	0006c583          	lbu	a1,0(a3)
    800061c4:	ff100613          	li	a2,-15
    800061c8:	0047d69b          	srliw	a3,a5,0x4
    800061cc:	f8b40023          	sb	a1,-128(s0)
    800061d0:	0047d59b          	srliw	a1,a5,0x4
    800061d4:	0ac75e63          	bge	a4,a2,80006290 <__printf+0x668>
    800061d8:	00f6f693          	andi	a3,a3,15
    800061dc:	00dd86b3          	add	a3,s11,a3
    800061e0:	0006c603          	lbu	a2,0(a3)
    800061e4:	00f00693          	li	a3,15
    800061e8:	0087d79b          	srliw	a5,a5,0x8
    800061ec:	f8c400a3          	sb	a2,-127(s0)
    800061f0:	d8b6e4e3          	bltu	a3,a1,80005f78 <__printf+0x350>
    800061f4:	00200793          	li	a5,2
    800061f8:	e2dff06f          	j	80006024 <__printf+0x3fc>
    800061fc:	00002c97          	auipc	s9,0x2
    80006200:	ffcc8c93          	addi	s9,s9,-4 # 800081f8 <_ZN3stm4coutE+0x188>
    80006204:	02800513          	li	a0,40
    80006208:	ef1ff06f          	j	800060f8 <__printf+0x4d0>
    8000620c:	00700793          	li	a5,7
    80006210:	00600c93          	li	s9,6
    80006214:	e0dff06f          	j	80006020 <__printf+0x3f8>
    80006218:	00700793          	li	a5,7
    8000621c:	00600c93          	li	s9,6
    80006220:	c69ff06f          	j	80005e88 <__printf+0x260>
    80006224:	00300793          	li	a5,3
    80006228:	00200c93          	li	s9,2
    8000622c:	c5dff06f          	j	80005e88 <__printf+0x260>
    80006230:	00300793          	li	a5,3
    80006234:	00200c93          	li	s9,2
    80006238:	de9ff06f          	j	80006020 <__printf+0x3f8>
    8000623c:	00400793          	li	a5,4
    80006240:	00300c93          	li	s9,3
    80006244:	dddff06f          	j	80006020 <__printf+0x3f8>
    80006248:	00400793          	li	a5,4
    8000624c:	00300c93          	li	s9,3
    80006250:	c39ff06f          	j	80005e88 <__printf+0x260>
    80006254:	00500793          	li	a5,5
    80006258:	00400c93          	li	s9,4
    8000625c:	c2dff06f          	j	80005e88 <__printf+0x260>
    80006260:	00500793          	li	a5,5
    80006264:	00400c93          	li	s9,4
    80006268:	db9ff06f          	j	80006020 <__printf+0x3f8>
    8000626c:	00600793          	li	a5,6
    80006270:	00500c93          	li	s9,5
    80006274:	dadff06f          	j	80006020 <__printf+0x3f8>
    80006278:	00600793          	li	a5,6
    8000627c:	00500c93          	li	s9,5
    80006280:	c09ff06f          	j	80005e88 <__printf+0x260>
    80006284:	00800793          	li	a5,8
    80006288:	00700c93          	li	s9,7
    8000628c:	bfdff06f          	j	80005e88 <__printf+0x260>
    80006290:	00100793          	li	a5,1
    80006294:	d91ff06f          	j	80006024 <__printf+0x3fc>
    80006298:	00100793          	li	a5,1
    8000629c:	bf1ff06f          	j	80005e8c <__printf+0x264>
    800062a0:	00900793          	li	a5,9
    800062a4:	00800c93          	li	s9,8
    800062a8:	be1ff06f          	j	80005e88 <__printf+0x260>
    800062ac:	00002517          	auipc	a0,0x2
    800062b0:	f5450513          	addi	a0,a0,-172 # 80008200 <_ZN3stm4coutE+0x190>
    800062b4:	00000097          	auipc	ra,0x0
    800062b8:	918080e7          	jalr	-1768(ra) # 80005bcc <panic>

00000000800062bc <printfinit>:
    800062bc:	fe010113          	addi	sp,sp,-32
    800062c0:	00813823          	sd	s0,16(sp)
    800062c4:	00913423          	sd	s1,8(sp)
    800062c8:	00113c23          	sd	ra,24(sp)
    800062cc:	02010413          	addi	s0,sp,32
    800062d0:	00005497          	auipc	s1,0x5
    800062d4:	38048493          	addi	s1,s1,896 # 8000b650 <pr>
    800062d8:	00048513          	mv	a0,s1
    800062dc:	00002597          	auipc	a1,0x2
    800062e0:	f3458593          	addi	a1,a1,-204 # 80008210 <_ZN3stm4coutE+0x1a0>
    800062e4:	00000097          	auipc	ra,0x0
    800062e8:	5f4080e7          	jalr	1524(ra) # 800068d8 <initlock>
    800062ec:	01813083          	ld	ra,24(sp)
    800062f0:	01013403          	ld	s0,16(sp)
    800062f4:	0004ac23          	sw	zero,24(s1)
    800062f8:	00813483          	ld	s1,8(sp)
    800062fc:	02010113          	addi	sp,sp,32
    80006300:	00008067          	ret

0000000080006304 <uartinit>:
    80006304:	ff010113          	addi	sp,sp,-16
    80006308:	00813423          	sd	s0,8(sp)
    8000630c:	01010413          	addi	s0,sp,16
    80006310:	100007b7          	lui	a5,0x10000
    80006314:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006318:	f8000713          	li	a4,-128
    8000631c:	00e781a3          	sb	a4,3(a5)
    80006320:	00300713          	li	a4,3
    80006324:	00e78023          	sb	a4,0(a5)
    80006328:	000780a3          	sb	zero,1(a5)
    8000632c:	00e781a3          	sb	a4,3(a5)
    80006330:	00700693          	li	a3,7
    80006334:	00d78123          	sb	a3,2(a5)
    80006338:	00e780a3          	sb	a4,1(a5)
    8000633c:	00813403          	ld	s0,8(sp)
    80006340:	01010113          	addi	sp,sp,16
    80006344:	00008067          	ret

0000000080006348 <uartputc>:
    80006348:	00004797          	auipc	a5,0x4
    8000634c:	ff07a783          	lw	a5,-16(a5) # 8000a338 <panicked>
    80006350:	00078463          	beqz	a5,80006358 <uartputc+0x10>
    80006354:	0000006f          	j	80006354 <uartputc+0xc>
    80006358:	fd010113          	addi	sp,sp,-48
    8000635c:	02813023          	sd	s0,32(sp)
    80006360:	00913c23          	sd	s1,24(sp)
    80006364:	01213823          	sd	s2,16(sp)
    80006368:	01313423          	sd	s3,8(sp)
    8000636c:	02113423          	sd	ra,40(sp)
    80006370:	03010413          	addi	s0,sp,48
    80006374:	00004917          	auipc	s2,0x4
    80006378:	fcc90913          	addi	s2,s2,-52 # 8000a340 <uart_tx_r>
    8000637c:	00093783          	ld	a5,0(s2)
    80006380:	00004497          	auipc	s1,0x4
    80006384:	fc848493          	addi	s1,s1,-56 # 8000a348 <uart_tx_w>
    80006388:	0004b703          	ld	a4,0(s1)
    8000638c:	02078693          	addi	a3,a5,32
    80006390:	00050993          	mv	s3,a0
    80006394:	02e69c63          	bne	a3,a4,800063cc <uartputc+0x84>
    80006398:	00001097          	auipc	ra,0x1
    8000639c:	834080e7          	jalr	-1996(ra) # 80006bcc <push_on>
    800063a0:	00093783          	ld	a5,0(s2)
    800063a4:	0004b703          	ld	a4,0(s1)
    800063a8:	02078793          	addi	a5,a5,32
    800063ac:	00e79463          	bne	a5,a4,800063b4 <uartputc+0x6c>
    800063b0:	0000006f          	j	800063b0 <uartputc+0x68>
    800063b4:	00001097          	auipc	ra,0x1
    800063b8:	88c080e7          	jalr	-1908(ra) # 80006c40 <pop_on>
    800063bc:	00093783          	ld	a5,0(s2)
    800063c0:	0004b703          	ld	a4,0(s1)
    800063c4:	02078693          	addi	a3,a5,32
    800063c8:	fce688e3          	beq	a3,a4,80006398 <uartputc+0x50>
    800063cc:	01f77693          	andi	a3,a4,31
    800063d0:	00005597          	auipc	a1,0x5
    800063d4:	2a058593          	addi	a1,a1,672 # 8000b670 <uart_tx_buf>
    800063d8:	00d586b3          	add	a3,a1,a3
    800063dc:	00170713          	addi	a4,a4,1
    800063e0:	01368023          	sb	s3,0(a3)
    800063e4:	00e4b023          	sd	a4,0(s1)
    800063e8:	10000637          	lui	a2,0x10000
    800063ec:	02f71063          	bne	a4,a5,8000640c <uartputc+0xc4>
    800063f0:	0340006f          	j	80006424 <uartputc+0xdc>
    800063f4:	00074703          	lbu	a4,0(a4)
    800063f8:	00f93023          	sd	a5,0(s2)
    800063fc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006400:	00093783          	ld	a5,0(s2)
    80006404:	0004b703          	ld	a4,0(s1)
    80006408:	00f70e63          	beq	a4,a5,80006424 <uartputc+0xdc>
    8000640c:	00564683          	lbu	a3,5(a2)
    80006410:	01f7f713          	andi	a4,a5,31
    80006414:	00e58733          	add	a4,a1,a4
    80006418:	0206f693          	andi	a3,a3,32
    8000641c:	00178793          	addi	a5,a5,1
    80006420:	fc069ae3          	bnez	a3,800063f4 <uartputc+0xac>
    80006424:	02813083          	ld	ra,40(sp)
    80006428:	02013403          	ld	s0,32(sp)
    8000642c:	01813483          	ld	s1,24(sp)
    80006430:	01013903          	ld	s2,16(sp)
    80006434:	00813983          	ld	s3,8(sp)
    80006438:	03010113          	addi	sp,sp,48
    8000643c:	00008067          	ret

0000000080006440 <uartputc_sync>:
    80006440:	ff010113          	addi	sp,sp,-16
    80006444:	00813423          	sd	s0,8(sp)
    80006448:	01010413          	addi	s0,sp,16
    8000644c:	00004717          	auipc	a4,0x4
    80006450:	eec72703          	lw	a4,-276(a4) # 8000a338 <panicked>
    80006454:	02071663          	bnez	a4,80006480 <uartputc_sync+0x40>
    80006458:	00050793          	mv	a5,a0
    8000645c:	100006b7          	lui	a3,0x10000
    80006460:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006464:	02077713          	andi	a4,a4,32
    80006468:	fe070ce3          	beqz	a4,80006460 <uartputc_sync+0x20>
    8000646c:	0ff7f793          	andi	a5,a5,255
    80006470:	00f68023          	sb	a5,0(a3)
    80006474:	00813403          	ld	s0,8(sp)
    80006478:	01010113          	addi	sp,sp,16
    8000647c:	00008067          	ret
    80006480:	0000006f          	j	80006480 <uartputc_sync+0x40>

0000000080006484 <uartstart>:
    80006484:	ff010113          	addi	sp,sp,-16
    80006488:	00813423          	sd	s0,8(sp)
    8000648c:	01010413          	addi	s0,sp,16
    80006490:	00004617          	auipc	a2,0x4
    80006494:	eb060613          	addi	a2,a2,-336 # 8000a340 <uart_tx_r>
    80006498:	00004517          	auipc	a0,0x4
    8000649c:	eb050513          	addi	a0,a0,-336 # 8000a348 <uart_tx_w>
    800064a0:	00063783          	ld	a5,0(a2)
    800064a4:	00053703          	ld	a4,0(a0)
    800064a8:	04f70263          	beq	a4,a5,800064ec <uartstart+0x68>
    800064ac:	100005b7          	lui	a1,0x10000
    800064b0:	00005817          	auipc	a6,0x5
    800064b4:	1c080813          	addi	a6,a6,448 # 8000b670 <uart_tx_buf>
    800064b8:	01c0006f          	j	800064d4 <uartstart+0x50>
    800064bc:	0006c703          	lbu	a4,0(a3)
    800064c0:	00f63023          	sd	a5,0(a2)
    800064c4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800064c8:	00063783          	ld	a5,0(a2)
    800064cc:	00053703          	ld	a4,0(a0)
    800064d0:	00f70e63          	beq	a4,a5,800064ec <uartstart+0x68>
    800064d4:	01f7f713          	andi	a4,a5,31
    800064d8:	00e806b3          	add	a3,a6,a4
    800064dc:	0055c703          	lbu	a4,5(a1)
    800064e0:	00178793          	addi	a5,a5,1
    800064e4:	02077713          	andi	a4,a4,32
    800064e8:	fc071ae3          	bnez	a4,800064bc <uartstart+0x38>
    800064ec:	00813403          	ld	s0,8(sp)
    800064f0:	01010113          	addi	sp,sp,16
    800064f4:	00008067          	ret

00000000800064f8 <uartgetc>:
    800064f8:	ff010113          	addi	sp,sp,-16
    800064fc:	00813423          	sd	s0,8(sp)
    80006500:	01010413          	addi	s0,sp,16
    80006504:	10000737          	lui	a4,0x10000
    80006508:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000650c:	0017f793          	andi	a5,a5,1
    80006510:	00078c63          	beqz	a5,80006528 <uartgetc+0x30>
    80006514:	00074503          	lbu	a0,0(a4)
    80006518:	0ff57513          	andi	a0,a0,255
    8000651c:	00813403          	ld	s0,8(sp)
    80006520:	01010113          	addi	sp,sp,16
    80006524:	00008067          	ret
    80006528:	fff00513          	li	a0,-1
    8000652c:	ff1ff06f          	j	8000651c <uartgetc+0x24>

0000000080006530 <uartintr>:
    80006530:	100007b7          	lui	a5,0x10000
    80006534:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006538:	0017f793          	andi	a5,a5,1
    8000653c:	0a078463          	beqz	a5,800065e4 <uartintr+0xb4>
    80006540:	fe010113          	addi	sp,sp,-32
    80006544:	00813823          	sd	s0,16(sp)
    80006548:	00913423          	sd	s1,8(sp)
    8000654c:	00113c23          	sd	ra,24(sp)
    80006550:	02010413          	addi	s0,sp,32
    80006554:	100004b7          	lui	s1,0x10000
    80006558:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000655c:	0ff57513          	andi	a0,a0,255
    80006560:	fffff097          	auipc	ra,0xfffff
    80006564:	534080e7          	jalr	1332(ra) # 80005a94 <consoleintr>
    80006568:	0054c783          	lbu	a5,5(s1)
    8000656c:	0017f793          	andi	a5,a5,1
    80006570:	fe0794e3          	bnez	a5,80006558 <uartintr+0x28>
    80006574:	00004617          	auipc	a2,0x4
    80006578:	dcc60613          	addi	a2,a2,-564 # 8000a340 <uart_tx_r>
    8000657c:	00004517          	auipc	a0,0x4
    80006580:	dcc50513          	addi	a0,a0,-564 # 8000a348 <uart_tx_w>
    80006584:	00063783          	ld	a5,0(a2)
    80006588:	00053703          	ld	a4,0(a0)
    8000658c:	04f70263          	beq	a4,a5,800065d0 <uartintr+0xa0>
    80006590:	100005b7          	lui	a1,0x10000
    80006594:	00005817          	auipc	a6,0x5
    80006598:	0dc80813          	addi	a6,a6,220 # 8000b670 <uart_tx_buf>
    8000659c:	01c0006f          	j	800065b8 <uartintr+0x88>
    800065a0:	0006c703          	lbu	a4,0(a3)
    800065a4:	00f63023          	sd	a5,0(a2)
    800065a8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800065ac:	00063783          	ld	a5,0(a2)
    800065b0:	00053703          	ld	a4,0(a0)
    800065b4:	00f70e63          	beq	a4,a5,800065d0 <uartintr+0xa0>
    800065b8:	01f7f713          	andi	a4,a5,31
    800065bc:	00e806b3          	add	a3,a6,a4
    800065c0:	0055c703          	lbu	a4,5(a1)
    800065c4:	00178793          	addi	a5,a5,1
    800065c8:	02077713          	andi	a4,a4,32
    800065cc:	fc071ae3          	bnez	a4,800065a0 <uartintr+0x70>
    800065d0:	01813083          	ld	ra,24(sp)
    800065d4:	01013403          	ld	s0,16(sp)
    800065d8:	00813483          	ld	s1,8(sp)
    800065dc:	02010113          	addi	sp,sp,32
    800065e0:	00008067          	ret
    800065e4:	00004617          	auipc	a2,0x4
    800065e8:	d5c60613          	addi	a2,a2,-676 # 8000a340 <uart_tx_r>
    800065ec:	00004517          	auipc	a0,0x4
    800065f0:	d5c50513          	addi	a0,a0,-676 # 8000a348 <uart_tx_w>
    800065f4:	00063783          	ld	a5,0(a2)
    800065f8:	00053703          	ld	a4,0(a0)
    800065fc:	04f70263          	beq	a4,a5,80006640 <uartintr+0x110>
    80006600:	100005b7          	lui	a1,0x10000
    80006604:	00005817          	auipc	a6,0x5
    80006608:	06c80813          	addi	a6,a6,108 # 8000b670 <uart_tx_buf>
    8000660c:	01c0006f          	j	80006628 <uartintr+0xf8>
    80006610:	0006c703          	lbu	a4,0(a3)
    80006614:	00f63023          	sd	a5,0(a2)
    80006618:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000661c:	00063783          	ld	a5,0(a2)
    80006620:	00053703          	ld	a4,0(a0)
    80006624:	02f70063          	beq	a4,a5,80006644 <uartintr+0x114>
    80006628:	01f7f713          	andi	a4,a5,31
    8000662c:	00e806b3          	add	a3,a6,a4
    80006630:	0055c703          	lbu	a4,5(a1)
    80006634:	00178793          	addi	a5,a5,1
    80006638:	02077713          	andi	a4,a4,32
    8000663c:	fc071ae3          	bnez	a4,80006610 <uartintr+0xe0>
    80006640:	00008067          	ret
    80006644:	00008067          	ret

0000000080006648 <kinit>:
    80006648:	fc010113          	addi	sp,sp,-64
    8000664c:	02913423          	sd	s1,40(sp)
    80006650:	fffff7b7          	lui	a5,0xfffff
    80006654:	00006497          	auipc	s1,0x6
    80006658:	03b48493          	addi	s1,s1,59 # 8000c68f <end+0xfff>
    8000665c:	02813823          	sd	s0,48(sp)
    80006660:	01313c23          	sd	s3,24(sp)
    80006664:	00f4f4b3          	and	s1,s1,a5
    80006668:	02113c23          	sd	ra,56(sp)
    8000666c:	03213023          	sd	s2,32(sp)
    80006670:	01413823          	sd	s4,16(sp)
    80006674:	01513423          	sd	s5,8(sp)
    80006678:	04010413          	addi	s0,sp,64
    8000667c:	000017b7          	lui	a5,0x1
    80006680:	01100993          	li	s3,17
    80006684:	00f487b3          	add	a5,s1,a5
    80006688:	01b99993          	slli	s3,s3,0x1b
    8000668c:	06f9e063          	bltu	s3,a5,800066ec <kinit+0xa4>
    80006690:	00005a97          	auipc	s5,0x5
    80006694:	000a8a93          	mv	s5,s5
    80006698:	0754ec63          	bltu	s1,s5,80006710 <kinit+0xc8>
    8000669c:	0734fa63          	bgeu	s1,s3,80006710 <kinit+0xc8>
    800066a0:	00088a37          	lui	s4,0x88
    800066a4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800066a8:	00004917          	auipc	s2,0x4
    800066ac:	ca890913          	addi	s2,s2,-856 # 8000a350 <kmem>
    800066b0:	00ca1a13          	slli	s4,s4,0xc
    800066b4:	0140006f          	j	800066c8 <kinit+0x80>
    800066b8:	000017b7          	lui	a5,0x1
    800066bc:	00f484b3          	add	s1,s1,a5
    800066c0:	0554e863          	bltu	s1,s5,80006710 <kinit+0xc8>
    800066c4:	0534f663          	bgeu	s1,s3,80006710 <kinit+0xc8>
    800066c8:	00001637          	lui	a2,0x1
    800066cc:	00100593          	li	a1,1
    800066d0:	00048513          	mv	a0,s1
    800066d4:	00000097          	auipc	ra,0x0
    800066d8:	5e4080e7          	jalr	1508(ra) # 80006cb8 <__memset>
    800066dc:	00093783          	ld	a5,0(s2)
    800066e0:	00f4b023          	sd	a5,0(s1)
    800066e4:	00993023          	sd	s1,0(s2)
    800066e8:	fd4498e3          	bne	s1,s4,800066b8 <kinit+0x70>
    800066ec:	03813083          	ld	ra,56(sp)
    800066f0:	03013403          	ld	s0,48(sp)
    800066f4:	02813483          	ld	s1,40(sp)
    800066f8:	02013903          	ld	s2,32(sp)
    800066fc:	01813983          	ld	s3,24(sp)
    80006700:	01013a03          	ld	s4,16(sp)
    80006704:	00813a83          	ld	s5,8(sp)
    80006708:	04010113          	addi	sp,sp,64
    8000670c:	00008067          	ret
    80006710:	00002517          	auipc	a0,0x2
    80006714:	b2050513          	addi	a0,a0,-1248 # 80008230 <digits+0x18>
    80006718:	fffff097          	auipc	ra,0xfffff
    8000671c:	4b4080e7          	jalr	1204(ra) # 80005bcc <panic>

0000000080006720 <freerange>:
    80006720:	fc010113          	addi	sp,sp,-64
    80006724:	000017b7          	lui	a5,0x1
    80006728:	02913423          	sd	s1,40(sp)
    8000672c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006730:	009504b3          	add	s1,a0,s1
    80006734:	fffff537          	lui	a0,0xfffff
    80006738:	02813823          	sd	s0,48(sp)
    8000673c:	02113c23          	sd	ra,56(sp)
    80006740:	03213023          	sd	s2,32(sp)
    80006744:	01313c23          	sd	s3,24(sp)
    80006748:	01413823          	sd	s4,16(sp)
    8000674c:	01513423          	sd	s5,8(sp)
    80006750:	01613023          	sd	s6,0(sp)
    80006754:	04010413          	addi	s0,sp,64
    80006758:	00a4f4b3          	and	s1,s1,a0
    8000675c:	00f487b3          	add	a5,s1,a5
    80006760:	06f5e463          	bltu	a1,a5,800067c8 <freerange+0xa8>
    80006764:	00005a97          	auipc	s5,0x5
    80006768:	f2ca8a93          	addi	s5,s5,-212 # 8000b690 <end>
    8000676c:	0954e263          	bltu	s1,s5,800067f0 <freerange+0xd0>
    80006770:	01100993          	li	s3,17
    80006774:	01b99993          	slli	s3,s3,0x1b
    80006778:	0734fc63          	bgeu	s1,s3,800067f0 <freerange+0xd0>
    8000677c:	00058a13          	mv	s4,a1
    80006780:	00004917          	auipc	s2,0x4
    80006784:	bd090913          	addi	s2,s2,-1072 # 8000a350 <kmem>
    80006788:	00002b37          	lui	s6,0x2
    8000678c:	0140006f          	j	800067a0 <freerange+0x80>
    80006790:	000017b7          	lui	a5,0x1
    80006794:	00f484b3          	add	s1,s1,a5
    80006798:	0554ec63          	bltu	s1,s5,800067f0 <freerange+0xd0>
    8000679c:	0534fa63          	bgeu	s1,s3,800067f0 <freerange+0xd0>
    800067a0:	00001637          	lui	a2,0x1
    800067a4:	00100593          	li	a1,1
    800067a8:	00048513          	mv	a0,s1
    800067ac:	00000097          	auipc	ra,0x0
    800067b0:	50c080e7          	jalr	1292(ra) # 80006cb8 <__memset>
    800067b4:	00093703          	ld	a4,0(s2)
    800067b8:	016487b3          	add	a5,s1,s6
    800067bc:	00e4b023          	sd	a4,0(s1)
    800067c0:	00993023          	sd	s1,0(s2)
    800067c4:	fcfa76e3          	bgeu	s4,a5,80006790 <freerange+0x70>
    800067c8:	03813083          	ld	ra,56(sp)
    800067cc:	03013403          	ld	s0,48(sp)
    800067d0:	02813483          	ld	s1,40(sp)
    800067d4:	02013903          	ld	s2,32(sp)
    800067d8:	01813983          	ld	s3,24(sp)
    800067dc:	01013a03          	ld	s4,16(sp)
    800067e0:	00813a83          	ld	s5,8(sp)
    800067e4:	00013b03          	ld	s6,0(sp)
    800067e8:	04010113          	addi	sp,sp,64
    800067ec:	00008067          	ret
    800067f0:	00002517          	auipc	a0,0x2
    800067f4:	a4050513          	addi	a0,a0,-1472 # 80008230 <digits+0x18>
    800067f8:	fffff097          	auipc	ra,0xfffff
    800067fc:	3d4080e7          	jalr	980(ra) # 80005bcc <panic>

0000000080006800 <kfree>:
    80006800:	fe010113          	addi	sp,sp,-32
    80006804:	00813823          	sd	s0,16(sp)
    80006808:	00113c23          	sd	ra,24(sp)
    8000680c:	00913423          	sd	s1,8(sp)
    80006810:	02010413          	addi	s0,sp,32
    80006814:	03451793          	slli	a5,a0,0x34
    80006818:	04079c63          	bnez	a5,80006870 <kfree+0x70>
    8000681c:	00005797          	auipc	a5,0x5
    80006820:	e7478793          	addi	a5,a5,-396 # 8000b690 <end>
    80006824:	00050493          	mv	s1,a0
    80006828:	04f56463          	bltu	a0,a5,80006870 <kfree+0x70>
    8000682c:	01100793          	li	a5,17
    80006830:	01b79793          	slli	a5,a5,0x1b
    80006834:	02f57e63          	bgeu	a0,a5,80006870 <kfree+0x70>
    80006838:	00001637          	lui	a2,0x1
    8000683c:	00100593          	li	a1,1
    80006840:	00000097          	auipc	ra,0x0
    80006844:	478080e7          	jalr	1144(ra) # 80006cb8 <__memset>
    80006848:	00004797          	auipc	a5,0x4
    8000684c:	b0878793          	addi	a5,a5,-1272 # 8000a350 <kmem>
    80006850:	0007b703          	ld	a4,0(a5)
    80006854:	01813083          	ld	ra,24(sp)
    80006858:	01013403          	ld	s0,16(sp)
    8000685c:	00e4b023          	sd	a4,0(s1)
    80006860:	0097b023          	sd	s1,0(a5)
    80006864:	00813483          	ld	s1,8(sp)
    80006868:	02010113          	addi	sp,sp,32
    8000686c:	00008067          	ret
    80006870:	00002517          	auipc	a0,0x2
    80006874:	9c050513          	addi	a0,a0,-1600 # 80008230 <digits+0x18>
    80006878:	fffff097          	auipc	ra,0xfffff
    8000687c:	354080e7          	jalr	852(ra) # 80005bcc <panic>

0000000080006880 <kalloc>:
    80006880:	fe010113          	addi	sp,sp,-32
    80006884:	00813823          	sd	s0,16(sp)
    80006888:	00913423          	sd	s1,8(sp)
    8000688c:	00113c23          	sd	ra,24(sp)
    80006890:	02010413          	addi	s0,sp,32
    80006894:	00004797          	auipc	a5,0x4
    80006898:	abc78793          	addi	a5,a5,-1348 # 8000a350 <kmem>
    8000689c:	0007b483          	ld	s1,0(a5)
    800068a0:	02048063          	beqz	s1,800068c0 <kalloc+0x40>
    800068a4:	0004b703          	ld	a4,0(s1)
    800068a8:	00001637          	lui	a2,0x1
    800068ac:	00500593          	li	a1,5
    800068b0:	00048513          	mv	a0,s1
    800068b4:	00e7b023          	sd	a4,0(a5)
    800068b8:	00000097          	auipc	ra,0x0
    800068bc:	400080e7          	jalr	1024(ra) # 80006cb8 <__memset>
    800068c0:	01813083          	ld	ra,24(sp)
    800068c4:	01013403          	ld	s0,16(sp)
    800068c8:	00048513          	mv	a0,s1
    800068cc:	00813483          	ld	s1,8(sp)
    800068d0:	02010113          	addi	sp,sp,32
    800068d4:	00008067          	ret

00000000800068d8 <initlock>:
    800068d8:	ff010113          	addi	sp,sp,-16
    800068dc:	00813423          	sd	s0,8(sp)
    800068e0:	01010413          	addi	s0,sp,16
    800068e4:	00813403          	ld	s0,8(sp)
    800068e8:	00b53423          	sd	a1,8(a0)
    800068ec:	00052023          	sw	zero,0(a0)
    800068f0:	00053823          	sd	zero,16(a0)
    800068f4:	01010113          	addi	sp,sp,16
    800068f8:	00008067          	ret

00000000800068fc <acquire>:
    800068fc:	fe010113          	addi	sp,sp,-32
    80006900:	00813823          	sd	s0,16(sp)
    80006904:	00913423          	sd	s1,8(sp)
    80006908:	00113c23          	sd	ra,24(sp)
    8000690c:	01213023          	sd	s2,0(sp)
    80006910:	02010413          	addi	s0,sp,32
    80006914:	00050493          	mv	s1,a0
    80006918:	10002973          	csrr	s2,sstatus
    8000691c:	100027f3          	csrr	a5,sstatus
    80006920:	ffd7f793          	andi	a5,a5,-3
    80006924:	10079073          	csrw	sstatus,a5
    80006928:	fffff097          	auipc	ra,0xfffff
    8000692c:	8e0080e7          	jalr	-1824(ra) # 80005208 <mycpu>
    80006930:	07852783          	lw	a5,120(a0)
    80006934:	06078e63          	beqz	a5,800069b0 <acquire+0xb4>
    80006938:	fffff097          	auipc	ra,0xfffff
    8000693c:	8d0080e7          	jalr	-1840(ra) # 80005208 <mycpu>
    80006940:	07852783          	lw	a5,120(a0)
    80006944:	0004a703          	lw	a4,0(s1)
    80006948:	0017879b          	addiw	a5,a5,1
    8000694c:	06f52c23          	sw	a5,120(a0)
    80006950:	04071063          	bnez	a4,80006990 <acquire+0x94>
    80006954:	00100713          	li	a4,1
    80006958:	00070793          	mv	a5,a4
    8000695c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006960:	0007879b          	sext.w	a5,a5
    80006964:	fe079ae3          	bnez	a5,80006958 <acquire+0x5c>
    80006968:	0ff0000f          	fence
    8000696c:	fffff097          	auipc	ra,0xfffff
    80006970:	89c080e7          	jalr	-1892(ra) # 80005208 <mycpu>
    80006974:	01813083          	ld	ra,24(sp)
    80006978:	01013403          	ld	s0,16(sp)
    8000697c:	00a4b823          	sd	a0,16(s1)
    80006980:	00013903          	ld	s2,0(sp)
    80006984:	00813483          	ld	s1,8(sp)
    80006988:	02010113          	addi	sp,sp,32
    8000698c:	00008067          	ret
    80006990:	0104b903          	ld	s2,16(s1)
    80006994:	fffff097          	auipc	ra,0xfffff
    80006998:	874080e7          	jalr	-1932(ra) # 80005208 <mycpu>
    8000699c:	faa91ce3          	bne	s2,a0,80006954 <acquire+0x58>
    800069a0:	00002517          	auipc	a0,0x2
    800069a4:	89850513          	addi	a0,a0,-1896 # 80008238 <digits+0x20>
    800069a8:	fffff097          	auipc	ra,0xfffff
    800069ac:	224080e7          	jalr	548(ra) # 80005bcc <panic>
    800069b0:	00195913          	srli	s2,s2,0x1
    800069b4:	fffff097          	auipc	ra,0xfffff
    800069b8:	854080e7          	jalr	-1964(ra) # 80005208 <mycpu>
    800069bc:	00197913          	andi	s2,s2,1
    800069c0:	07252e23          	sw	s2,124(a0)
    800069c4:	f75ff06f          	j	80006938 <acquire+0x3c>

00000000800069c8 <release>:
    800069c8:	fe010113          	addi	sp,sp,-32
    800069cc:	00813823          	sd	s0,16(sp)
    800069d0:	00113c23          	sd	ra,24(sp)
    800069d4:	00913423          	sd	s1,8(sp)
    800069d8:	01213023          	sd	s2,0(sp)
    800069dc:	02010413          	addi	s0,sp,32
    800069e0:	00052783          	lw	a5,0(a0)
    800069e4:	00079a63          	bnez	a5,800069f8 <release+0x30>
    800069e8:	00002517          	auipc	a0,0x2
    800069ec:	85850513          	addi	a0,a0,-1960 # 80008240 <digits+0x28>
    800069f0:	fffff097          	auipc	ra,0xfffff
    800069f4:	1dc080e7          	jalr	476(ra) # 80005bcc <panic>
    800069f8:	01053903          	ld	s2,16(a0)
    800069fc:	00050493          	mv	s1,a0
    80006a00:	fffff097          	auipc	ra,0xfffff
    80006a04:	808080e7          	jalr	-2040(ra) # 80005208 <mycpu>
    80006a08:	fea910e3          	bne	s2,a0,800069e8 <release+0x20>
    80006a0c:	0004b823          	sd	zero,16(s1)
    80006a10:	0ff0000f          	fence
    80006a14:	0f50000f          	fence	iorw,ow
    80006a18:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006a1c:	ffffe097          	auipc	ra,0xffffe
    80006a20:	7ec080e7          	jalr	2028(ra) # 80005208 <mycpu>
    80006a24:	100027f3          	csrr	a5,sstatus
    80006a28:	0027f793          	andi	a5,a5,2
    80006a2c:	04079a63          	bnez	a5,80006a80 <release+0xb8>
    80006a30:	07852783          	lw	a5,120(a0)
    80006a34:	02f05e63          	blez	a5,80006a70 <release+0xa8>
    80006a38:	fff7871b          	addiw	a4,a5,-1
    80006a3c:	06e52c23          	sw	a4,120(a0)
    80006a40:	00071c63          	bnez	a4,80006a58 <release+0x90>
    80006a44:	07c52783          	lw	a5,124(a0)
    80006a48:	00078863          	beqz	a5,80006a58 <release+0x90>
    80006a4c:	100027f3          	csrr	a5,sstatus
    80006a50:	0027e793          	ori	a5,a5,2
    80006a54:	10079073          	csrw	sstatus,a5
    80006a58:	01813083          	ld	ra,24(sp)
    80006a5c:	01013403          	ld	s0,16(sp)
    80006a60:	00813483          	ld	s1,8(sp)
    80006a64:	00013903          	ld	s2,0(sp)
    80006a68:	02010113          	addi	sp,sp,32
    80006a6c:	00008067          	ret
    80006a70:	00001517          	auipc	a0,0x1
    80006a74:	7f050513          	addi	a0,a0,2032 # 80008260 <digits+0x48>
    80006a78:	fffff097          	auipc	ra,0xfffff
    80006a7c:	154080e7          	jalr	340(ra) # 80005bcc <panic>
    80006a80:	00001517          	auipc	a0,0x1
    80006a84:	7c850513          	addi	a0,a0,1992 # 80008248 <digits+0x30>
    80006a88:	fffff097          	auipc	ra,0xfffff
    80006a8c:	144080e7          	jalr	324(ra) # 80005bcc <panic>

0000000080006a90 <holding>:
    80006a90:	00052783          	lw	a5,0(a0)
    80006a94:	00079663          	bnez	a5,80006aa0 <holding+0x10>
    80006a98:	00000513          	li	a0,0
    80006a9c:	00008067          	ret
    80006aa0:	fe010113          	addi	sp,sp,-32
    80006aa4:	00813823          	sd	s0,16(sp)
    80006aa8:	00913423          	sd	s1,8(sp)
    80006aac:	00113c23          	sd	ra,24(sp)
    80006ab0:	02010413          	addi	s0,sp,32
    80006ab4:	01053483          	ld	s1,16(a0)
    80006ab8:	ffffe097          	auipc	ra,0xffffe
    80006abc:	750080e7          	jalr	1872(ra) # 80005208 <mycpu>
    80006ac0:	01813083          	ld	ra,24(sp)
    80006ac4:	01013403          	ld	s0,16(sp)
    80006ac8:	40a48533          	sub	a0,s1,a0
    80006acc:	00153513          	seqz	a0,a0
    80006ad0:	00813483          	ld	s1,8(sp)
    80006ad4:	02010113          	addi	sp,sp,32
    80006ad8:	00008067          	ret

0000000080006adc <push_off>:
    80006adc:	fe010113          	addi	sp,sp,-32
    80006ae0:	00813823          	sd	s0,16(sp)
    80006ae4:	00113c23          	sd	ra,24(sp)
    80006ae8:	00913423          	sd	s1,8(sp)
    80006aec:	02010413          	addi	s0,sp,32
    80006af0:	100024f3          	csrr	s1,sstatus
    80006af4:	100027f3          	csrr	a5,sstatus
    80006af8:	ffd7f793          	andi	a5,a5,-3
    80006afc:	10079073          	csrw	sstatus,a5
    80006b00:	ffffe097          	auipc	ra,0xffffe
    80006b04:	708080e7          	jalr	1800(ra) # 80005208 <mycpu>
    80006b08:	07852783          	lw	a5,120(a0)
    80006b0c:	02078663          	beqz	a5,80006b38 <push_off+0x5c>
    80006b10:	ffffe097          	auipc	ra,0xffffe
    80006b14:	6f8080e7          	jalr	1784(ra) # 80005208 <mycpu>
    80006b18:	07852783          	lw	a5,120(a0)
    80006b1c:	01813083          	ld	ra,24(sp)
    80006b20:	01013403          	ld	s0,16(sp)
    80006b24:	0017879b          	addiw	a5,a5,1
    80006b28:	06f52c23          	sw	a5,120(a0)
    80006b2c:	00813483          	ld	s1,8(sp)
    80006b30:	02010113          	addi	sp,sp,32
    80006b34:	00008067          	ret
    80006b38:	0014d493          	srli	s1,s1,0x1
    80006b3c:	ffffe097          	auipc	ra,0xffffe
    80006b40:	6cc080e7          	jalr	1740(ra) # 80005208 <mycpu>
    80006b44:	0014f493          	andi	s1,s1,1
    80006b48:	06952e23          	sw	s1,124(a0)
    80006b4c:	fc5ff06f          	j	80006b10 <push_off+0x34>

0000000080006b50 <pop_off>:
    80006b50:	ff010113          	addi	sp,sp,-16
    80006b54:	00813023          	sd	s0,0(sp)
    80006b58:	00113423          	sd	ra,8(sp)
    80006b5c:	01010413          	addi	s0,sp,16
    80006b60:	ffffe097          	auipc	ra,0xffffe
    80006b64:	6a8080e7          	jalr	1704(ra) # 80005208 <mycpu>
    80006b68:	100027f3          	csrr	a5,sstatus
    80006b6c:	0027f793          	andi	a5,a5,2
    80006b70:	04079663          	bnez	a5,80006bbc <pop_off+0x6c>
    80006b74:	07852783          	lw	a5,120(a0)
    80006b78:	02f05a63          	blez	a5,80006bac <pop_off+0x5c>
    80006b7c:	fff7871b          	addiw	a4,a5,-1
    80006b80:	06e52c23          	sw	a4,120(a0)
    80006b84:	00071c63          	bnez	a4,80006b9c <pop_off+0x4c>
    80006b88:	07c52783          	lw	a5,124(a0)
    80006b8c:	00078863          	beqz	a5,80006b9c <pop_off+0x4c>
    80006b90:	100027f3          	csrr	a5,sstatus
    80006b94:	0027e793          	ori	a5,a5,2
    80006b98:	10079073          	csrw	sstatus,a5
    80006b9c:	00813083          	ld	ra,8(sp)
    80006ba0:	00013403          	ld	s0,0(sp)
    80006ba4:	01010113          	addi	sp,sp,16
    80006ba8:	00008067          	ret
    80006bac:	00001517          	auipc	a0,0x1
    80006bb0:	6b450513          	addi	a0,a0,1716 # 80008260 <digits+0x48>
    80006bb4:	fffff097          	auipc	ra,0xfffff
    80006bb8:	018080e7          	jalr	24(ra) # 80005bcc <panic>
    80006bbc:	00001517          	auipc	a0,0x1
    80006bc0:	68c50513          	addi	a0,a0,1676 # 80008248 <digits+0x30>
    80006bc4:	fffff097          	auipc	ra,0xfffff
    80006bc8:	008080e7          	jalr	8(ra) # 80005bcc <panic>

0000000080006bcc <push_on>:
    80006bcc:	fe010113          	addi	sp,sp,-32
    80006bd0:	00813823          	sd	s0,16(sp)
    80006bd4:	00113c23          	sd	ra,24(sp)
    80006bd8:	00913423          	sd	s1,8(sp)
    80006bdc:	02010413          	addi	s0,sp,32
    80006be0:	100024f3          	csrr	s1,sstatus
    80006be4:	100027f3          	csrr	a5,sstatus
    80006be8:	0027e793          	ori	a5,a5,2
    80006bec:	10079073          	csrw	sstatus,a5
    80006bf0:	ffffe097          	auipc	ra,0xffffe
    80006bf4:	618080e7          	jalr	1560(ra) # 80005208 <mycpu>
    80006bf8:	07852783          	lw	a5,120(a0)
    80006bfc:	02078663          	beqz	a5,80006c28 <push_on+0x5c>
    80006c00:	ffffe097          	auipc	ra,0xffffe
    80006c04:	608080e7          	jalr	1544(ra) # 80005208 <mycpu>
    80006c08:	07852783          	lw	a5,120(a0)
    80006c0c:	01813083          	ld	ra,24(sp)
    80006c10:	01013403          	ld	s0,16(sp)
    80006c14:	0017879b          	addiw	a5,a5,1
    80006c18:	06f52c23          	sw	a5,120(a0)
    80006c1c:	00813483          	ld	s1,8(sp)
    80006c20:	02010113          	addi	sp,sp,32
    80006c24:	00008067          	ret
    80006c28:	0014d493          	srli	s1,s1,0x1
    80006c2c:	ffffe097          	auipc	ra,0xffffe
    80006c30:	5dc080e7          	jalr	1500(ra) # 80005208 <mycpu>
    80006c34:	0014f493          	andi	s1,s1,1
    80006c38:	06952e23          	sw	s1,124(a0)
    80006c3c:	fc5ff06f          	j	80006c00 <push_on+0x34>

0000000080006c40 <pop_on>:
    80006c40:	ff010113          	addi	sp,sp,-16
    80006c44:	00813023          	sd	s0,0(sp)
    80006c48:	00113423          	sd	ra,8(sp)
    80006c4c:	01010413          	addi	s0,sp,16
    80006c50:	ffffe097          	auipc	ra,0xffffe
    80006c54:	5b8080e7          	jalr	1464(ra) # 80005208 <mycpu>
    80006c58:	100027f3          	csrr	a5,sstatus
    80006c5c:	0027f793          	andi	a5,a5,2
    80006c60:	04078463          	beqz	a5,80006ca8 <pop_on+0x68>
    80006c64:	07852783          	lw	a5,120(a0)
    80006c68:	02f05863          	blez	a5,80006c98 <pop_on+0x58>
    80006c6c:	fff7879b          	addiw	a5,a5,-1
    80006c70:	06f52c23          	sw	a5,120(a0)
    80006c74:	07853783          	ld	a5,120(a0)
    80006c78:	00079863          	bnez	a5,80006c88 <pop_on+0x48>
    80006c7c:	100027f3          	csrr	a5,sstatus
    80006c80:	ffd7f793          	andi	a5,a5,-3
    80006c84:	10079073          	csrw	sstatus,a5
    80006c88:	00813083          	ld	ra,8(sp)
    80006c8c:	00013403          	ld	s0,0(sp)
    80006c90:	01010113          	addi	sp,sp,16
    80006c94:	00008067          	ret
    80006c98:	00001517          	auipc	a0,0x1
    80006c9c:	5f050513          	addi	a0,a0,1520 # 80008288 <digits+0x70>
    80006ca0:	fffff097          	auipc	ra,0xfffff
    80006ca4:	f2c080e7          	jalr	-212(ra) # 80005bcc <panic>
    80006ca8:	00001517          	auipc	a0,0x1
    80006cac:	5c050513          	addi	a0,a0,1472 # 80008268 <digits+0x50>
    80006cb0:	fffff097          	auipc	ra,0xfffff
    80006cb4:	f1c080e7          	jalr	-228(ra) # 80005bcc <panic>

0000000080006cb8 <__memset>:
    80006cb8:	ff010113          	addi	sp,sp,-16
    80006cbc:	00813423          	sd	s0,8(sp)
    80006cc0:	01010413          	addi	s0,sp,16
    80006cc4:	1a060e63          	beqz	a2,80006e80 <__memset+0x1c8>
    80006cc8:	40a007b3          	neg	a5,a0
    80006ccc:	0077f793          	andi	a5,a5,7
    80006cd0:	00778693          	addi	a3,a5,7
    80006cd4:	00b00813          	li	a6,11
    80006cd8:	0ff5f593          	andi	a1,a1,255
    80006cdc:	fff6071b          	addiw	a4,a2,-1
    80006ce0:	1b06e663          	bltu	a3,a6,80006e8c <__memset+0x1d4>
    80006ce4:	1cd76463          	bltu	a4,a3,80006eac <__memset+0x1f4>
    80006ce8:	1a078e63          	beqz	a5,80006ea4 <__memset+0x1ec>
    80006cec:	00b50023          	sb	a1,0(a0)
    80006cf0:	00100713          	li	a4,1
    80006cf4:	1ae78463          	beq	a5,a4,80006e9c <__memset+0x1e4>
    80006cf8:	00b500a3          	sb	a1,1(a0)
    80006cfc:	00200713          	li	a4,2
    80006d00:	1ae78a63          	beq	a5,a4,80006eb4 <__memset+0x1fc>
    80006d04:	00b50123          	sb	a1,2(a0)
    80006d08:	00300713          	li	a4,3
    80006d0c:	18e78463          	beq	a5,a4,80006e94 <__memset+0x1dc>
    80006d10:	00b501a3          	sb	a1,3(a0)
    80006d14:	00400713          	li	a4,4
    80006d18:	1ae78263          	beq	a5,a4,80006ebc <__memset+0x204>
    80006d1c:	00b50223          	sb	a1,4(a0)
    80006d20:	00500713          	li	a4,5
    80006d24:	1ae78063          	beq	a5,a4,80006ec4 <__memset+0x20c>
    80006d28:	00b502a3          	sb	a1,5(a0)
    80006d2c:	00700713          	li	a4,7
    80006d30:	18e79e63          	bne	a5,a4,80006ecc <__memset+0x214>
    80006d34:	00b50323          	sb	a1,6(a0)
    80006d38:	00700e93          	li	t4,7
    80006d3c:	00859713          	slli	a4,a1,0x8
    80006d40:	00e5e733          	or	a4,a1,a4
    80006d44:	01059e13          	slli	t3,a1,0x10
    80006d48:	01c76e33          	or	t3,a4,t3
    80006d4c:	01859313          	slli	t1,a1,0x18
    80006d50:	006e6333          	or	t1,t3,t1
    80006d54:	02059893          	slli	a7,a1,0x20
    80006d58:	40f60e3b          	subw	t3,a2,a5
    80006d5c:	011368b3          	or	a7,t1,a7
    80006d60:	02859813          	slli	a6,a1,0x28
    80006d64:	0108e833          	or	a6,a7,a6
    80006d68:	03059693          	slli	a3,a1,0x30
    80006d6c:	003e589b          	srliw	a7,t3,0x3
    80006d70:	00d866b3          	or	a3,a6,a3
    80006d74:	03859713          	slli	a4,a1,0x38
    80006d78:	00389813          	slli	a6,a7,0x3
    80006d7c:	00f507b3          	add	a5,a0,a5
    80006d80:	00e6e733          	or	a4,a3,a4
    80006d84:	000e089b          	sext.w	a7,t3
    80006d88:	00f806b3          	add	a3,a6,a5
    80006d8c:	00e7b023          	sd	a4,0(a5)
    80006d90:	00878793          	addi	a5,a5,8
    80006d94:	fed79ce3          	bne	a5,a3,80006d8c <__memset+0xd4>
    80006d98:	ff8e7793          	andi	a5,t3,-8
    80006d9c:	0007871b          	sext.w	a4,a5
    80006da0:	01d787bb          	addw	a5,a5,t4
    80006da4:	0ce88e63          	beq	a7,a4,80006e80 <__memset+0x1c8>
    80006da8:	00f50733          	add	a4,a0,a5
    80006dac:	00b70023          	sb	a1,0(a4)
    80006db0:	0017871b          	addiw	a4,a5,1
    80006db4:	0cc77663          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006db8:	00e50733          	add	a4,a0,a4
    80006dbc:	00b70023          	sb	a1,0(a4)
    80006dc0:	0027871b          	addiw	a4,a5,2
    80006dc4:	0ac77e63          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006dc8:	00e50733          	add	a4,a0,a4
    80006dcc:	00b70023          	sb	a1,0(a4)
    80006dd0:	0037871b          	addiw	a4,a5,3
    80006dd4:	0ac77663          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006dd8:	00e50733          	add	a4,a0,a4
    80006ddc:	00b70023          	sb	a1,0(a4)
    80006de0:	0047871b          	addiw	a4,a5,4
    80006de4:	08c77e63          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006de8:	00e50733          	add	a4,a0,a4
    80006dec:	00b70023          	sb	a1,0(a4)
    80006df0:	0057871b          	addiw	a4,a5,5
    80006df4:	08c77663          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006df8:	00e50733          	add	a4,a0,a4
    80006dfc:	00b70023          	sb	a1,0(a4)
    80006e00:	0067871b          	addiw	a4,a5,6
    80006e04:	06c77e63          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e08:	00e50733          	add	a4,a0,a4
    80006e0c:	00b70023          	sb	a1,0(a4)
    80006e10:	0077871b          	addiw	a4,a5,7
    80006e14:	06c77663          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e18:	00e50733          	add	a4,a0,a4
    80006e1c:	00b70023          	sb	a1,0(a4)
    80006e20:	0087871b          	addiw	a4,a5,8
    80006e24:	04c77e63          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e28:	00e50733          	add	a4,a0,a4
    80006e2c:	00b70023          	sb	a1,0(a4)
    80006e30:	0097871b          	addiw	a4,a5,9
    80006e34:	04c77663          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e38:	00e50733          	add	a4,a0,a4
    80006e3c:	00b70023          	sb	a1,0(a4)
    80006e40:	00a7871b          	addiw	a4,a5,10
    80006e44:	02c77e63          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e48:	00e50733          	add	a4,a0,a4
    80006e4c:	00b70023          	sb	a1,0(a4)
    80006e50:	00b7871b          	addiw	a4,a5,11
    80006e54:	02c77663          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e58:	00e50733          	add	a4,a0,a4
    80006e5c:	00b70023          	sb	a1,0(a4)
    80006e60:	00c7871b          	addiw	a4,a5,12
    80006e64:	00c77e63          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e68:	00e50733          	add	a4,a0,a4
    80006e6c:	00b70023          	sb	a1,0(a4)
    80006e70:	00d7879b          	addiw	a5,a5,13
    80006e74:	00c7f663          	bgeu	a5,a2,80006e80 <__memset+0x1c8>
    80006e78:	00f507b3          	add	a5,a0,a5
    80006e7c:	00b78023          	sb	a1,0(a5)
    80006e80:	00813403          	ld	s0,8(sp)
    80006e84:	01010113          	addi	sp,sp,16
    80006e88:	00008067          	ret
    80006e8c:	00b00693          	li	a3,11
    80006e90:	e55ff06f          	j	80006ce4 <__memset+0x2c>
    80006e94:	00300e93          	li	t4,3
    80006e98:	ea5ff06f          	j	80006d3c <__memset+0x84>
    80006e9c:	00100e93          	li	t4,1
    80006ea0:	e9dff06f          	j	80006d3c <__memset+0x84>
    80006ea4:	00000e93          	li	t4,0
    80006ea8:	e95ff06f          	j	80006d3c <__memset+0x84>
    80006eac:	00000793          	li	a5,0
    80006eb0:	ef9ff06f          	j	80006da8 <__memset+0xf0>
    80006eb4:	00200e93          	li	t4,2
    80006eb8:	e85ff06f          	j	80006d3c <__memset+0x84>
    80006ebc:	00400e93          	li	t4,4
    80006ec0:	e7dff06f          	j	80006d3c <__memset+0x84>
    80006ec4:	00500e93          	li	t4,5
    80006ec8:	e75ff06f          	j	80006d3c <__memset+0x84>
    80006ecc:	00600e93          	li	t4,6
    80006ed0:	e6dff06f          	j	80006d3c <__memset+0x84>

0000000080006ed4 <__memmove>:
    80006ed4:	ff010113          	addi	sp,sp,-16
    80006ed8:	00813423          	sd	s0,8(sp)
    80006edc:	01010413          	addi	s0,sp,16
    80006ee0:	0e060863          	beqz	a2,80006fd0 <__memmove+0xfc>
    80006ee4:	fff6069b          	addiw	a3,a2,-1
    80006ee8:	0006881b          	sext.w	a6,a3
    80006eec:	0ea5e863          	bltu	a1,a0,80006fdc <__memmove+0x108>
    80006ef0:	00758713          	addi	a4,a1,7
    80006ef4:	00a5e7b3          	or	a5,a1,a0
    80006ef8:	40a70733          	sub	a4,a4,a0
    80006efc:	0077f793          	andi	a5,a5,7
    80006f00:	00f73713          	sltiu	a4,a4,15
    80006f04:	00174713          	xori	a4,a4,1
    80006f08:	0017b793          	seqz	a5,a5
    80006f0c:	00e7f7b3          	and	a5,a5,a4
    80006f10:	10078863          	beqz	a5,80007020 <__memmove+0x14c>
    80006f14:	00900793          	li	a5,9
    80006f18:	1107f463          	bgeu	a5,a6,80007020 <__memmove+0x14c>
    80006f1c:	0036581b          	srliw	a6,a2,0x3
    80006f20:	fff8081b          	addiw	a6,a6,-1
    80006f24:	02081813          	slli	a6,a6,0x20
    80006f28:	01d85893          	srli	a7,a6,0x1d
    80006f2c:	00858813          	addi	a6,a1,8
    80006f30:	00058793          	mv	a5,a1
    80006f34:	00050713          	mv	a4,a0
    80006f38:	01088833          	add	a6,a7,a6
    80006f3c:	0007b883          	ld	a7,0(a5)
    80006f40:	00878793          	addi	a5,a5,8
    80006f44:	00870713          	addi	a4,a4,8
    80006f48:	ff173c23          	sd	a7,-8(a4)
    80006f4c:	ff0798e3          	bne	a5,a6,80006f3c <__memmove+0x68>
    80006f50:	ff867713          	andi	a4,a2,-8
    80006f54:	02071793          	slli	a5,a4,0x20
    80006f58:	0207d793          	srli	a5,a5,0x20
    80006f5c:	00f585b3          	add	a1,a1,a5
    80006f60:	40e686bb          	subw	a3,a3,a4
    80006f64:	00f507b3          	add	a5,a0,a5
    80006f68:	06e60463          	beq	a2,a4,80006fd0 <__memmove+0xfc>
    80006f6c:	0005c703          	lbu	a4,0(a1)
    80006f70:	00e78023          	sb	a4,0(a5)
    80006f74:	04068e63          	beqz	a3,80006fd0 <__memmove+0xfc>
    80006f78:	0015c603          	lbu	a2,1(a1)
    80006f7c:	00100713          	li	a4,1
    80006f80:	00c780a3          	sb	a2,1(a5)
    80006f84:	04e68663          	beq	a3,a4,80006fd0 <__memmove+0xfc>
    80006f88:	0025c603          	lbu	a2,2(a1)
    80006f8c:	00200713          	li	a4,2
    80006f90:	00c78123          	sb	a2,2(a5)
    80006f94:	02e68e63          	beq	a3,a4,80006fd0 <__memmove+0xfc>
    80006f98:	0035c603          	lbu	a2,3(a1)
    80006f9c:	00300713          	li	a4,3
    80006fa0:	00c781a3          	sb	a2,3(a5)
    80006fa4:	02e68663          	beq	a3,a4,80006fd0 <__memmove+0xfc>
    80006fa8:	0045c603          	lbu	a2,4(a1)
    80006fac:	00400713          	li	a4,4
    80006fb0:	00c78223          	sb	a2,4(a5)
    80006fb4:	00e68e63          	beq	a3,a4,80006fd0 <__memmove+0xfc>
    80006fb8:	0055c603          	lbu	a2,5(a1)
    80006fbc:	00500713          	li	a4,5
    80006fc0:	00c782a3          	sb	a2,5(a5)
    80006fc4:	00e68663          	beq	a3,a4,80006fd0 <__memmove+0xfc>
    80006fc8:	0065c703          	lbu	a4,6(a1)
    80006fcc:	00e78323          	sb	a4,6(a5)
    80006fd0:	00813403          	ld	s0,8(sp)
    80006fd4:	01010113          	addi	sp,sp,16
    80006fd8:	00008067          	ret
    80006fdc:	02061713          	slli	a4,a2,0x20
    80006fe0:	02075713          	srli	a4,a4,0x20
    80006fe4:	00e587b3          	add	a5,a1,a4
    80006fe8:	f0f574e3          	bgeu	a0,a5,80006ef0 <__memmove+0x1c>
    80006fec:	02069613          	slli	a2,a3,0x20
    80006ff0:	02065613          	srli	a2,a2,0x20
    80006ff4:	fff64613          	not	a2,a2
    80006ff8:	00e50733          	add	a4,a0,a4
    80006ffc:	00c78633          	add	a2,a5,a2
    80007000:	fff7c683          	lbu	a3,-1(a5)
    80007004:	fff78793          	addi	a5,a5,-1
    80007008:	fff70713          	addi	a4,a4,-1
    8000700c:	00d70023          	sb	a3,0(a4)
    80007010:	fec798e3          	bne	a5,a2,80007000 <__memmove+0x12c>
    80007014:	00813403          	ld	s0,8(sp)
    80007018:	01010113          	addi	sp,sp,16
    8000701c:	00008067          	ret
    80007020:	02069713          	slli	a4,a3,0x20
    80007024:	02075713          	srli	a4,a4,0x20
    80007028:	00170713          	addi	a4,a4,1
    8000702c:	00e50733          	add	a4,a0,a4
    80007030:	00050793          	mv	a5,a0
    80007034:	0005c683          	lbu	a3,0(a1)
    80007038:	00178793          	addi	a5,a5,1
    8000703c:	00158593          	addi	a1,a1,1
    80007040:	fed78fa3          	sb	a3,-1(a5)
    80007044:	fee798e3          	bne	a5,a4,80007034 <__memmove+0x160>
    80007048:	f89ff06f          	j	80006fd0 <__memmove+0xfc>
	...
