
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	44813103          	ld	sp,1096(sp) # 8000a448 <_GLOBAL_OFFSET_TABLE_+0x50>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	3a4050ef          	jal	ra,800053c0 <start>

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
    800010a4:	1d0030ef          	jal	ra,80004274 <_ZN5Riscv20handleSupervisorTrapEmmmmm>

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
    800011ac:	1b0030ef          	jal	ra,8000435c <_ZN5Riscv15handleTimerTrapEv>

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
    80001238:	370030ef          	jal	ra,800045a8 <_ZN5Riscv14handleReadTrapEv>
    sret
    8000123c:	10200073          	sret

0000000080001240 <writeHandler>:

writeHandler:
    call _ZN5Riscv15handleWriteTrapEv
    80001240:	39c030ef          	jal	ra,800045dc <_ZN5Riscv15handleWriteTrapEv>
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
    800012cc:	1fc030ef          	jal	ra,800044c8 <_ZN5Riscv17handleConsoleTrapEv>

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
    80001a34:	e24080e7          	jalr	-476(ra) # 80003854 <_Z6memcpyPKvS0_i>
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
    80001b24:	2cc080e7          	jalr	716(ra) # 80003dec <_Znam>
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
    80001dec:	6a053503          	ld	a0,1696(a0) # 8000a488 <_GLOBAL_OFFSET_TABLE_+0x90>
    80001df0:	00002097          	auipc	ra,0x2
    80001df4:	b8c080e7          	jalr	-1140(ra) # 8000397c <_ZNK3stm7istreamlsEi>
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
    80001e38:	fb8080e7          	jalr	-72(ra) # 80003dec <_Znam>
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
    80001fd8:	f34080e7          	jalr	-204(ra) # 80003f08 <_ZdaPv>
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
    80002038:	ed4080e7          	jalr	-300(ra) # 80003f08 <_ZdaPv>
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
    80002138:	cb8080e7          	jalr	-840(ra) # 80003dec <_Znam>
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
    80002184:	00002097          	auipc	ra,0x2
    80002188:	c40080e7          	jalr	-960(ra) # 80003dc4 <_Znwm>
    8000218c:	00050493          	mv	s1,a0
    80002190:	00090593          	mv	a1,s2
    80002194:	00000097          	auipc	ra,0x0
    80002198:	f24080e7          	jalr	-220(ra) # 800020b8 <_ZN3stm6stringC1EPKc>
    8000219c:	0200006f          	j	800021bc <_ZN3stmplERKNS_6stringES2_+0x68>
    800021a0:	00050913          	mv	s2,a0
    800021a4:	00048513          	mv	a0,s1
    800021a8:	00002097          	auipc	ra,0x2
    800021ac:	c6c080e7          	jalr	-916(ra) # 80003e14 <_ZdlPv>
    800021b0:	00090513          	mv	a0,s2
    800021b4:	00009097          	auipc	ra,0x9
    800021b8:	4b4080e7          	jalr	1204(ra) # 8000b668 <_Unwind_Resume>
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
    8000224c:	334080e7          	jalr	820(ra) # 8000357c <_ZN9Allocator10_mem_allocEm>
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
    800022d8:	428080e7          	jalr	1064(ra) # 800046fc <_ZN9Scheduler3putEP3TCB>
        TCB::_thread_dispatch();
    800022dc:	00003097          	auipc	ra,0x3
    800022e0:	d98080e7          	jalr	-616(ra) # 80005074 <_ZN3TCB16_thread_dispatchEv>
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
    80002334:	3cc080e7          	jalr	972(ra) # 800046fc <_ZN9Scheduler3putEP3TCB>
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
    80002394:	36c080e7          	jalr	876(ra) # 800046fc <_ZN9Scheduler3putEP3TCB>
    while (!id->blocked.is_empty()) {
    80002398:	fe5ff06f          	j	8000237c <_ZN3Sem10_sem_closeEPS_+0x1c>
    id->blocked.destroy();
    8000239c:	00848513          	addi	a0,s1,8
    800023a0:	00000097          	auipc	ra,0x0
    800023a4:	1ac080e7          	jalr	428(ra) # 8000254c <_ZN3stm14CircularBufferIP3TCBE7destroyEv>
    if (Allocator::_mem_free(id)) return 2;
    800023a8:	00048513          	mv	a0,s1
    800023ac:	00001097          	auipc	ra,0x1
    800023b0:	28c080e7          	jalr	652(ra) # 80003638 <_ZN9Allocator9_mem_freeEPKv>
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
    80002410:	05c4b483          	ld	s1,92(s1) # 8000a468 <_GLOBAL_OFFSET_TABLE_+0x70>
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
    80002430:	c48080e7          	jalr	-952(ra) # 80005074 <_ZN3TCB16_thread_dispatchEv>
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
    800026c8:	d5c7b783          	ld	a5,-676(a5) # 8000a420 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80002700:	d247b783          	ld	a5,-732(a5) # 8000a420 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    8000274c:	cd87b783          	ld	a5,-808(a5) # 8000a420 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80002790:	c947b783          	ld	a5,-876(a5) # 8000a420 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80002914:	bc050513          	addi	a0,a0,-1088 # 8000a4d0 <_ZN2IO5InputE>
    80002918:	00000097          	auipc	ra,0x0
    8000291c:	fa4080e7          	jalr	-92(ra) # 800028bc <_ZN8IOBuffer4initEv>
    Output.init();
    80002920:	00008517          	auipc	a0,0x8
    80002924:	bd050513          	addi	a0,a0,-1072 # 8000a4f0 <_ZN2IO6OutputE>
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
    80002998:	b3c50513          	addi	a0,a0,-1220 # 8000a4d0 <_ZN2IO5InputE>
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
    80002a18:	adc50513          	addi	a0,a0,-1316 # 8000a4f0 <_ZN2IO6OutputE>
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
    80002a3c:	ab848493          	addi	s1,s1,-1352 # 8000a4f0 <_ZN2IO6OutputE>
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
    80002c40:	00001097          	auipc	ra,0x1
    80002c44:	93c080e7          	jalr	-1732(ra) # 8000357c <_ZN9Allocator10_mem_allocEm>
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
    80002c68:	00001097          	auipc	ra,0x1
    80002c6c:	9d0080e7          	jalr	-1584(ra) # 80003638 <_ZN9Allocator9_mem_freeEPKv>
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
    80002cac:	00008797          	auipc	a5,0x8
    80002cb0:	8647b783          	ld	a5,-1948(a5) # 8000a510 <_ZN6Cradle4headE>
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
    80002ccc:	00008717          	auipc	a4,0x8
    80002cd0:	84470713          	addi	a4,a4,-1980 # 8000a510 <_ZN6Cradle4headE>
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
    80002d10:	00008797          	auipc	a5,0x8
    80002d14:	80078793          	addi	a5,a5,-2048 # 8000a510 <_ZN6Cradle4headE>
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
    80002d98:	77c78793          	addi	a5,a5,1916 # 8000a510 <_ZN6Cradle4headE>
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
    80002de4:	73078793          	addi	a5,a5,1840 # 8000a510 <_ZN6Cradle4headE>
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
    80002e2c:	6e87b783          	ld	a5,1768(a5) # 8000a510 <_ZN6Cradle4headE>
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
    80002e5c:	6b87b783          	ld	a5,1720(a5) # 8000a510 <_ZN6Cradle4headE>
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
    80002e8c:	68853503          	ld	a0,1672(a0) # 8000a510 <_ZN6Cradle4headE>
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
    80002ebc:	5b04b483          	ld	s1,1456(s1) # 8000a468 <_GLOBAL_OFFSET_TABLE_+0x70>
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
    80002edc:	19c080e7          	jalr	412(ra) # 80005074 <_ZN3TCB16_thread_dispatchEv>
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
    80002f1c:	7e4080e7          	jalr	2020(ra) # 800046fc <_ZN9Scheduler3putEP3TCB>
    TCB::_thread_dispatch();
    80002f20:	00002097          	auipc	ra,0x2
    80002f24:	154080e7          	jalr	340(ra) # 80005074 <_ZN3TCB16_thread_dispatchEv>
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
    int time;
};

#define THRD 50

int userMain() {
    80002f44:	e4010113          	addi	sp,sp,-448
    80002f48:	1a113c23          	sd	ra,440(sp)
    80002f4c:	1a813823          	sd	s0,432(sp)
    80002f50:	1a913423          	sd	s1,424(sp)
    80002f54:	1b213023          	sd	s2,416(sp)
    80002f58:	19313c23          	sd	s3,408(sp)
    80002f5c:	1c010413          	addi	s0,sp,448
    dramatic_print("Hello There!! Welcome to my Operating System.\n");
    80002f60:	00005517          	auipc	a0,0x5
    80002f64:	0f050513          	addi	a0,a0,240 # 80008050 <CONSOLE_STATUS+0x40>
    80002f68:	fffff097          	auipc	ra,0xfffff
    80002f6c:	7c4080e7          	jalr	1988(ra) # 8000272c <_Z14dramatic_printPKc>
    Thread *threads[THRD];
    for (int i = 0; i < THRD; i++) {
    80002f70:	00000913          	li	s2,0
    80002f74:	0340006f          	j	80002fa8 <_Z8userMainv+0x64>
    explicit FibonacciThread(char c) : Thread(), c(c) {}
    80002f78:	00007797          	auipc	a5,0x7
    80002f7c:	2c078793          	addi	a5,a5,704 # 8000a238 <_ZTV15FibonacciThread+0x10>
    80002f80:	00f4b023          	sd	a5,0(s1)
    80002f84:	03348023          	sb	s3,32(s1)
        threads[i] = new FibonacciThread('A' + i);
    80002f88:	00391793          	slli	a5,s2,0x3
    80002f8c:	fd040713          	addi	a4,s0,-48
    80002f90:	00f707b3          	add	a5,a4,a5
    80002f94:	e697b823          	sd	s1,-400(a5)
        threads[i]->start();
    80002f98:	00048513          	mv	a0,s1
    80002f9c:	00001097          	auipc	ra,0x1
    80002fa0:	fc0080e7          	jalr	-64(ra) # 80003f5c <_ZN6Thread5startEv>
    for (int i = 0; i < THRD; i++) {
    80002fa4:	0019091b          	addiw	s2,s2,1
    80002fa8:	03100793          	li	a5,49
    80002fac:	0327c463          	blt	a5,s2,80002fd4 <_Z8userMainv+0x90>
        threads[i] = new FibonacciThread('A' + i);
    80002fb0:	02800513          	li	a0,40
    80002fb4:	00001097          	auipc	ra,0x1
    80002fb8:	e10080e7          	jalr	-496(ra) # 80003dc4 <_Znwm>
    80002fbc:	00050493          	mv	s1,a0
    80002fc0:	0419099b          	addiw	s3,s2,65
    80002fc4:	0ff9f993          	andi	s3,s3,255
    explicit FibonacciThread(char c) : Thread(), c(c) {}
    80002fc8:	00001097          	auipc	ra,0x1
    80002fcc:	0a0080e7          	jalr	160(ra) # 80004068 <_ZN6ThreadC1Ev>
    80002fd0:	fa9ff06f          	j	80002f78 <_Z8userMainv+0x34>
    }
    for (auto & thread : threads) {
    80002fd4:	e4040493          	addi	s1,s0,-448
    80002fd8:	fd040793          	addi	a5,s0,-48
    80002fdc:	00f48c63          	beq	s1,a5,80002ff4 <_Z8userMainv+0xb0>
        thread->join();
    80002fe0:	0004b503          	ld	a0,0(s1)
    80002fe4:	00001097          	auipc	ra,0x1
    80002fe8:	fb0080e7          	jalr	-80(ra) # 80003f94 <_ZN6Thread4joinEv>
    for (auto & thread : threads) {
    80002fec:	00848493          	addi	s1,s1,8
    80002ff0:	fe9ff06f          	j	80002fd8 <_Z8userMainv+0x94>
    }
    Thread *sleeper1 = new SleeperThread(10), *sleeper2 = new SleeperThread(20), *sleeper4 = new SleeperThread(40);
    80002ff4:	02800513          	li	a0,40
    80002ff8:	00001097          	auipc	ra,0x1
    80002ffc:	dcc080e7          	jalr	-564(ra) # 80003dc4 <_Znwm>
    80003000:	00050993          	mv	s3,a0
    explicit SleeperThread(int time) : time(time) {}
    80003004:	00001097          	auipc	ra,0x1
    80003008:	064080e7          	jalr	100(ra) # 80004068 <_ZN6ThreadC1Ev>
    8000300c:	00007797          	auipc	a5,0x7
    80003010:	25478793          	addi	a5,a5,596 # 8000a260 <_ZTV13SleeperThread+0x10>
    80003014:	00f9b023          	sd	a5,0(s3)
    80003018:	00a00793          	li	a5,10
    8000301c:	02f9a023          	sw	a5,32(s3)
    Thread *sleeper1 = new SleeperThread(10), *sleeper2 = new SleeperThread(20), *sleeper4 = new SleeperThread(40);
    80003020:	02800513          	li	a0,40
    80003024:	00001097          	auipc	ra,0x1
    80003028:	da0080e7          	jalr	-608(ra) # 80003dc4 <_Znwm>
    8000302c:	00050913          	mv	s2,a0
    explicit SleeperThread(int time) : time(time) {}
    80003030:	00001097          	auipc	ra,0x1
    80003034:	038080e7          	jalr	56(ra) # 80004068 <_ZN6ThreadC1Ev>
    80003038:	00007797          	auipc	a5,0x7
    8000303c:	22878793          	addi	a5,a5,552 # 8000a260 <_ZTV13SleeperThread+0x10>
    80003040:	00f93023          	sd	a5,0(s2)
    80003044:	01400793          	li	a5,20
    80003048:	02f92023          	sw	a5,32(s2)
    Thread *sleeper1 = new SleeperThread(10), *sleeper2 = new SleeperThread(20), *sleeper4 = new SleeperThread(40);
    8000304c:	02800513          	li	a0,40
    80003050:	00001097          	auipc	ra,0x1
    80003054:	d74080e7          	jalr	-652(ra) # 80003dc4 <_Znwm>
    80003058:	00050493          	mv	s1,a0
    explicit SleeperThread(int time) : time(time) {}
    8000305c:	00001097          	auipc	ra,0x1
    80003060:	00c080e7          	jalr	12(ra) # 80004068 <_ZN6ThreadC1Ev>
    80003064:	0740006f          	j	800030d8 <_Z8userMainv+0x194>
    80003068:	00050913          	mv	s2,a0
        threads[i] = new FibonacciThread('A' + i);
    8000306c:	00048513          	mv	a0,s1
    80003070:	00001097          	auipc	ra,0x1
    80003074:	da4080e7          	jalr	-604(ra) # 80003e14 <_ZdlPv>
    80003078:	00090513          	mv	a0,s2
    8000307c:	00008097          	auipc	ra,0x8
    80003080:	5ec080e7          	jalr	1516(ra) # 8000b668 <_Unwind_Resume>
    80003084:	00050493          	mv	s1,a0
    Thread *sleeper1 = new SleeperThread(10), *sleeper2 = new SleeperThread(20), *sleeper4 = new SleeperThread(40);
    80003088:	00098513          	mv	a0,s3
    8000308c:	00001097          	auipc	ra,0x1
    80003090:	d88080e7          	jalr	-632(ra) # 80003e14 <_ZdlPv>
    80003094:	00048513          	mv	a0,s1
    80003098:	00008097          	auipc	ra,0x8
    8000309c:	5d0080e7          	jalr	1488(ra) # 8000b668 <_Unwind_Resume>
    800030a0:	00050493          	mv	s1,a0
    800030a4:	00090513          	mv	a0,s2
    800030a8:	00001097          	auipc	ra,0x1
    800030ac:	d6c080e7          	jalr	-660(ra) # 80003e14 <_ZdlPv>
    800030b0:	00048513          	mv	a0,s1
    800030b4:	00008097          	auipc	ra,0x8
    800030b8:	5b4080e7          	jalr	1460(ra) # 8000b668 <_Unwind_Resume>
    800030bc:	00050913          	mv	s2,a0
    800030c0:	00048513          	mv	a0,s1
    800030c4:	00001097          	auipc	ra,0x1
    800030c8:	d50080e7          	jalr	-688(ra) # 80003e14 <_ZdlPv>
    800030cc:	00090513          	mv	a0,s2
    800030d0:	00008097          	auipc	ra,0x8
    800030d4:	598080e7          	jalr	1432(ra) # 8000b668 <_Unwind_Resume>
    explicit SleeperThread(int time) : time(time) {}
    800030d8:	00007797          	auipc	a5,0x7
    800030dc:	18878793          	addi	a5,a5,392 # 8000a260 <_ZTV13SleeperThread+0x10>
    800030e0:	00f4b023          	sd	a5,0(s1)
    800030e4:	02800793          	li	a5,40
    800030e8:	02f4a023          	sw	a5,32(s1)
    sleeper1->start();
    800030ec:	00098513          	mv	a0,s3
    800030f0:	00001097          	auipc	ra,0x1
    800030f4:	e6c080e7          	jalr	-404(ra) # 80003f5c <_ZN6Thread5startEv>
    sleeper2->start();
    800030f8:	00090513          	mv	a0,s2
    800030fc:	00001097          	auipc	ra,0x1
    80003100:	e60080e7          	jalr	-416(ra) # 80003f5c <_ZN6Thread5startEv>
    sleeper4->start();
    80003104:	00048513          	mv	a0,s1
    80003108:	00001097          	auipc	ra,0x1
    8000310c:	e54080e7          	jalr	-428(ra) # 80003f5c <_ZN6Thread5startEv>
    sleeper1->join();
    80003110:	00098513          	mv	a0,s3
    80003114:	00001097          	auipc	ra,0x1
    80003118:	e80080e7          	jalr	-384(ra) # 80003f94 <_ZN6Thread4joinEv>
    sleeper2->join();
    8000311c:	00090513          	mv	a0,s2
    80003120:	00001097          	auipc	ra,0x1
    80003124:	e74080e7          	jalr	-396(ra) # 80003f94 <_ZN6Thread4joinEv>
    sleeper4->join();
    80003128:	00048513          	mv	a0,s1
    8000312c:	00001097          	auipc	ra,0x1
    80003130:	e68080e7          	jalr	-408(ra) # 80003f94 <_ZN6Thread4joinEv>
    return 0;
    80003134:	00000513          	li	a0,0
    80003138:	1b813083          	ld	ra,440(sp)
    8000313c:	1b013403          	ld	s0,432(sp)
    80003140:	1a813483          	ld	s1,424(sp)
    80003144:	1a013903          	ld	s2,416(sp)
    80003148:	19813983          	ld	s3,408(sp)
    8000314c:	1c010113          	addi	sp,sp,448
    80003150:	00008067          	ret

0000000080003154 <_ZN15FibonacciThreadD1Ev>:
class FibonacciThread : public Thread {
    80003154:	ff010113          	addi	sp,sp,-16
    80003158:	00113423          	sd	ra,8(sp)
    8000315c:	00813023          	sd	s0,0(sp)
    80003160:	01010413          	addi	s0,sp,16
    80003164:	00007797          	auipc	a5,0x7
    80003168:	0d478793          	addi	a5,a5,212 # 8000a238 <_ZTV15FibonacciThread+0x10>
    8000316c:	00f53023          	sd	a5,0(a0)
    80003170:	00001097          	auipc	ra,0x1
    80003174:	ccc080e7          	jalr	-820(ra) # 80003e3c <_ZN6ThreadD1Ev>
    80003178:	00813083          	ld	ra,8(sp)
    8000317c:	00013403          	ld	s0,0(sp)
    80003180:	01010113          	addi	sp,sp,16
    80003184:	00008067          	ret

0000000080003188 <_ZN15FibonacciThreadD0Ev>:
    80003188:	fe010113          	addi	sp,sp,-32
    8000318c:	00113c23          	sd	ra,24(sp)
    80003190:	00813823          	sd	s0,16(sp)
    80003194:	00913423          	sd	s1,8(sp)
    80003198:	02010413          	addi	s0,sp,32
    8000319c:	00050493          	mv	s1,a0
    800031a0:	00007797          	auipc	a5,0x7
    800031a4:	09878793          	addi	a5,a5,152 # 8000a238 <_ZTV15FibonacciThread+0x10>
    800031a8:	00f53023          	sd	a5,0(a0)
    800031ac:	00001097          	auipc	ra,0x1
    800031b0:	c90080e7          	jalr	-880(ra) # 80003e3c <_ZN6ThreadD1Ev>
    800031b4:	00048513          	mv	a0,s1
    800031b8:	00001097          	auipc	ra,0x1
    800031bc:	c5c080e7          	jalr	-932(ra) # 80003e14 <_ZdlPv>
    800031c0:	01813083          	ld	ra,24(sp)
    800031c4:	01013403          	ld	s0,16(sp)
    800031c8:	00813483          	ld	s1,8(sp)
    800031cc:	02010113          	addi	sp,sp,32
    800031d0:	00008067          	ret

00000000800031d4 <_ZN13SleeperThreadD1Ev>:
class SleeperThread : public Thread {
    800031d4:	ff010113          	addi	sp,sp,-16
    800031d8:	00113423          	sd	ra,8(sp)
    800031dc:	00813023          	sd	s0,0(sp)
    800031e0:	01010413          	addi	s0,sp,16
    800031e4:	00007797          	auipc	a5,0x7
    800031e8:	07c78793          	addi	a5,a5,124 # 8000a260 <_ZTV13SleeperThread+0x10>
    800031ec:	00f53023          	sd	a5,0(a0)
    800031f0:	00001097          	auipc	ra,0x1
    800031f4:	c4c080e7          	jalr	-948(ra) # 80003e3c <_ZN6ThreadD1Ev>
    800031f8:	00813083          	ld	ra,8(sp)
    800031fc:	00013403          	ld	s0,0(sp)
    80003200:	01010113          	addi	sp,sp,16
    80003204:	00008067          	ret

0000000080003208 <_ZN13SleeperThreadD0Ev>:
    80003208:	fe010113          	addi	sp,sp,-32
    8000320c:	00113c23          	sd	ra,24(sp)
    80003210:	00813823          	sd	s0,16(sp)
    80003214:	00913423          	sd	s1,8(sp)
    80003218:	02010413          	addi	s0,sp,32
    8000321c:	00050493          	mv	s1,a0
    80003220:	00007797          	auipc	a5,0x7
    80003224:	04078793          	addi	a5,a5,64 # 8000a260 <_ZTV13SleeperThread+0x10>
    80003228:	00f53023          	sd	a5,0(a0)
    8000322c:	00001097          	auipc	ra,0x1
    80003230:	c10080e7          	jalr	-1008(ra) # 80003e3c <_ZN6ThreadD1Ev>
    80003234:	00048513          	mv	a0,s1
    80003238:	00001097          	auipc	ra,0x1
    8000323c:	bdc080e7          	jalr	-1060(ra) # 80003e14 <_ZdlPv>
    80003240:	01813083          	ld	ra,24(sp)
    80003244:	01013403          	ld	s0,16(sp)
    80003248:	00813483          	ld	s1,8(sp)
    8000324c:	02010113          	addi	sp,sp,32
    80003250:	00008067          	ret

0000000080003254 <_ZN13SleeperThread3runEv>:
    void run() override {
    80003254:	fe010113          	addi	sp,sp,-32
    80003258:	00113c23          	sd	ra,24(sp)
    8000325c:	00813823          	sd	s0,16(sp)
    80003260:	00913423          	sd	s1,8(sp)
    80003264:	01213023          	sd	s2,0(sp)
    80003268:	02010413          	addi	s0,sp,32
    8000326c:	00050913          	mv	s2,a0
        for (int i = 0; i < 100 / time; i++) {
    80003270:	00000493          	li	s1,0
    80003274:	02092503          	lw	a0,32(s2)
    80003278:	06400793          	li	a5,100
    8000327c:	02a7c7bb          	divw	a5,a5,a0
    80003280:	06f4d063          	bge	s1,a5,800032e0 <_ZN13SleeperThread3runEv+0x8c>
            Thread::sleep(time);
    80003284:	00001097          	auipc	ra,0x1
    80003288:	dbc080e7          	jalr	-580(ra) # 80004040 <_ZN6Thread5sleepEm>
            cout << "Hello thread " << time / 10 << "s!" <<  endl;
    8000328c:	00005597          	auipc	a1,0x5
    80003290:	dac58593          	addi	a1,a1,-596 # 80008038 <CONSOLE_STATUS+0x28>
    80003294:	00007517          	auipc	a0,0x7
    80003298:	1f453503          	ld	a0,500(a0) # 8000a488 <_GLOBAL_OFFSET_TABLE_+0x90>
    8000329c:	00000097          	auipc	ra,0x0
    800032a0:	62c080e7          	jalr	1580(ra) # 800038c8 <_ZNK3stm7istreamlsEPKc>
    800032a4:	02092583          	lw	a1,32(s2)
    800032a8:	00a00793          	li	a5,10
    800032ac:	02f5c5bb          	divw	a1,a1,a5
    800032b0:	00000097          	auipc	ra,0x0
    800032b4:	6cc080e7          	jalr	1740(ra) # 8000397c <_ZNK3stm7istreamlsEi>
    800032b8:	00005597          	auipc	a1,0x5
    800032bc:	d9058593          	addi	a1,a1,-624 # 80008048 <CONSOLE_STATUS+0x38>
    800032c0:	00000097          	auipc	ra,0x0
    800032c4:	608080e7          	jalr	1544(ra) # 800038c8 <_ZNK3stm7istreamlsEPKc>
    800032c8:	00007597          	auipc	a1,0x7
    800032cc:	1905b583          	ld	a1,400(a1) # 8000a458 <_GLOBAL_OFFSET_TABLE_+0x60>
    800032d0:	00000097          	auipc	ra,0x0
    800032d4:	7b0080e7          	jalr	1968(ra) # 80003a80 <_ZNK3stm7istreamlsERKNS_7endlineE>
        for (int i = 0; i < 100 / time; i++) {
    800032d8:	0014849b          	addiw	s1,s1,1
    800032dc:	f99ff06f          	j	80003274 <_ZN13SleeperThread3runEv+0x20>
    }
    800032e0:	01813083          	ld	ra,24(sp)
    800032e4:	01013403          	ld	s0,16(sp)
    800032e8:	00813483          	ld	s1,8(sp)
    800032ec:	00013903          	ld	s2,0(sp)
    800032f0:	02010113          	addi	sp,sp,32
    800032f4:	00008067          	ret

00000000800032f8 <_ZN15FibonacciThread9fibonacciEi>:
    int fibonacci(int i) {
    800032f8:	fe010113          	addi	sp,sp,-32
    800032fc:	00113c23          	sd	ra,24(sp)
    80003300:	00813823          	sd	s0,16(sp)
    80003304:	00913423          	sd	s1,8(sp)
    80003308:	02010413          	addi	s0,sp,32
        if (i < 0) return -1;
    8000330c:	0205cc63          	bltz	a1,80003344 <_ZN15FibonacciThread9fibonacciEi+0x4c>
    80003310:	00058493          	mv	s1,a1
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003314:	00059e63          	bnez	a1,80003330 <_ZN15FibonacciThread9fibonacciEi+0x38>
    }
    80003318:	00048513          	mv	a0,s1
    8000331c:	01813083          	ld	ra,24(sp)
    80003320:	01013403          	ld	s0,16(sp)
    80003324:	00813483          	ld	s1,8(sp)
    80003328:	02010113          	addi	sp,sp,32
    8000332c:	00008067          	ret
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003330:	fff5859b          	addiw	a1,a1,-1
    80003334:	00000097          	auipc	ra,0x0
    80003338:	fc4080e7          	jalr	-60(ra) # 800032f8 <_ZN15FibonacciThread9fibonacciEi>
    8000333c:	00a484bb          	addw	s1,s1,a0
    80003340:	fd9ff06f          	j	80003318 <_ZN15FibonacciThread9fibonacciEi+0x20>
        if (i < 0) return -1;
    80003344:	fff00493          	li	s1,-1
    80003348:	fd1ff06f          	j	80003318 <_ZN15FibonacciThread9fibonacciEi+0x20>

000000008000334c <_ZN15FibonacciThread3runEv>:
    void run() override {
    8000334c:	fb010113          	addi	sp,sp,-80
    80003350:	04113423          	sd	ra,72(sp)
    80003354:	04813023          	sd	s0,64(sp)
    80003358:	02913c23          	sd	s1,56(sp)
    8000335c:	03213823          	sd	s2,48(sp)
    80003360:	03313423          	sd	s3,40(sp)
    80003364:	03413023          	sd	s4,32(sp)
    80003368:	01513c23          	sd	s5,24(sp)
    8000336c:	01613823          	sd	s6,16(sp)
    80003370:	01713423          	sd	s7,8(sp)
    80003374:	01813023          	sd	s8,0(sp)
    80003378:	05010413          	addi	s0,sp,80
    8000337c:	00050493          	mv	s1,a0
        for (int i = 0; i < 10; i++) {
    80003380:	00000913          	li	s2,0
    80003384:	0140006f          	j	80003398 <_ZN15FibonacciThread3runEv+0x4c>
            putc(c);
    80003388:	0204c503          	lbu	a0,32(s1)
    8000338c:	ffffe097          	auipc	ra,0xffffe
    80003390:	600080e7          	jalr	1536(ra) # 8000198c <_Z4putcc>
        for (int i = 0; i < 10; i++) {
    80003394:	0019091b          	addiw	s2,s2,1
    80003398:	00900793          	li	a5,9
    8000339c:	0127ce63          	blt	a5,s2,800033b8 <_ZN15FibonacciThread3runEv+0x6c>
            for (int i = 0; i < 10000000; i++);
    800033a0:	00000713          	li	a4,0
    800033a4:	009897b7          	lui	a5,0x989
    800033a8:	67f78793          	addi	a5,a5,1663 # 98967f <_entry-0x7f676981>
    800033ac:	fce7cee3          	blt	a5,a4,80003388 <_ZN15FibonacciThread3runEv+0x3c>
    800033b0:	0017071b          	addiw	a4,a4,1
    800033b4:	ff1ff06f          	j	800033a4 <_ZN15FibonacciThread3runEv+0x58>
        for (int i = 0; i < 10000000; i++);
    800033b8:	00000713          	li	a4,0
    800033bc:	009897b7          	lui	a5,0x989
    800033c0:	67f78793          	addi	a5,a5,1663 # 98967f <_entry-0x7f676981>
    800033c4:	00e7c663          	blt	a5,a4,800033d0 <_ZN15FibonacciThread3runEv+0x84>
    800033c8:	0017071b          	addiw	a4,a4,1
    800033cc:	ff1ff06f          	j	800033bc <_ZN15FibonacciThread3runEv+0x70>
        for (int i = 0; i < 10000000; i++);
    800033d0:	00000713          	li	a4,0
    800033d4:	009897b7          	lui	a5,0x989
    800033d8:	67f78793          	addi	a5,a5,1663 # 98967f <_entry-0x7f676981>
    800033dc:	00e7c663          	blt	a5,a4,800033e8 <_ZN15FibonacciThread3runEv+0x9c>
    800033e0:	0017071b          	addiw	a4,a4,1
    800033e4:	ff1ff06f          	j	800033d4 <_ZN15FibonacciThread3runEv+0x88>
        cout << fibonacci(static_cast<int>(c)) << endl;
    800033e8:	0204c903          	lbu	s2,32(s1)
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    800033ec:	04091c63          	bnez	s2,80003444 <_ZN15FibonacciThread3runEv+0xf8>
        cout << fibonacci(static_cast<int>(c)) << endl;
    800033f0:	00090593          	mv	a1,s2
    800033f4:	00007517          	auipc	a0,0x7
    800033f8:	09453503          	ld	a0,148(a0) # 8000a488 <_GLOBAL_OFFSET_TABLE_+0x90>
    800033fc:	00000097          	auipc	ra,0x0
    80003400:	580080e7          	jalr	1408(ra) # 8000397c <_ZNK3stm7istreamlsEi>
    80003404:	00007597          	auipc	a1,0x7
    80003408:	0545b583          	ld	a1,84(a1) # 8000a458 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000340c:	00000097          	auipc	ra,0x0
    80003410:	674080e7          	jalr	1652(ra) # 80003a80 <_ZNK3stm7istreamlsERKNS_7endlineE>
    }
    80003414:	04813083          	ld	ra,72(sp)
    80003418:	04013403          	ld	s0,64(sp)
    8000341c:	03813483          	ld	s1,56(sp)
    80003420:	03013903          	ld	s2,48(sp)
    80003424:	02813983          	ld	s3,40(sp)
    80003428:	02013a03          	ld	s4,32(sp)
    8000342c:	01813a83          	ld	s5,24(sp)
    80003430:	01013b03          	ld	s6,16(sp)
    80003434:	00813b83          	ld	s7,8(sp)
    80003438:	00013c03          	ld	s8,0(sp)
    8000343c:	05010113          	addi	sp,sp,80
    80003440:	00008067          	ret
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003444:	fff9099b          	addiw	s3,s2,-1
    80003448:	0009879b          	sext.w	a5,s3
        if (i < 0) return -1;
    8000344c:	02099713          	slli	a4,s3,0x20
    80003450:	0c074e63          	bltz	a4,8000352c <_ZN15FibonacciThread3runEv+0x1e0>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003454:	00079663          	bnez	a5,80003460 <_ZN15FibonacciThread3runEv+0x114>
    80003458:	00f9093b          	addw	s2,s2,a5
    8000345c:	f95ff06f          	j	800033f0 <_ZN15FibonacciThread3runEv+0xa4>
    80003460:	fff98a1b          	addiw	s4,s3,-1
    80003464:	000a079b          	sext.w	a5,s4
        if (i < 0) return -1;
    80003468:	020a1713          	slli	a4,s4,0x20
    8000346c:	0a074c63          	bltz	a4,80003524 <_ZN15FibonacciThread3runEv+0x1d8>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    80003470:	00079663          	bnez	a5,8000347c <_ZN15FibonacciThread3runEv+0x130>
    80003474:	00f987bb          	addw	a5,s3,a5
    80003478:	fe1ff06f          	j	80003458 <_ZN15FibonacciThread3runEv+0x10c>
    8000347c:	fffa0a9b          	addiw	s5,s4,-1
    80003480:	000a879b          	sext.w	a5,s5
        if (i < 0) return -1;
    80003484:	020a9713          	slli	a4,s5,0x20
    80003488:	08074a63          	bltz	a4,8000351c <_ZN15FibonacciThread3runEv+0x1d0>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    8000348c:	00079663          	bnez	a5,80003498 <_ZN15FibonacciThread3runEv+0x14c>
    80003490:	00fa07bb          	addw	a5,s4,a5
    80003494:	fe1ff06f          	j	80003474 <_ZN15FibonacciThread3runEv+0x128>
    80003498:	fffa8b1b          	addiw	s6,s5,-1
    8000349c:	000b079b          	sext.w	a5,s6
        if (i < 0) return -1;
    800034a0:	020b1713          	slli	a4,s6,0x20
    800034a4:	06074863          	bltz	a4,80003514 <_ZN15FibonacciThread3runEv+0x1c8>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    800034a8:	00079663          	bnez	a5,800034b4 <_ZN15FibonacciThread3runEv+0x168>
    800034ac:	00fa87bb          	addw	a5,s5,a5
    800034b0:	fe1ff06f          	j	80003490 <_ZN15FibonacciThread3runEv+0x144>
    800034b4:	fffb0b9b          	addiw	s7,s6,-1
    800034b8:	000b879b          	sext.w	a5,s7
        if (i < 0) return -1;
    800034bc:	020b9713          	slli	a4,s7,0x20
    800034c0:	04074663          	bltz	a4,8000350c <_ZN15FibonacciThread3runEv+0x1c0>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    800034c4:	00079663          	bnez	a5,800034d0 <_ZN15FibonacciThread3runEv+0x184>
    800034c8:	00fb07bb          	addw	a5,s6,a5
    800034cc:	fe1ff06f          	j	800034ac <_ZN15FibonacciThread3runEv+0x160>
    800034d0:	fffb8c1b          	addiw	s8,s7,-1
    800034d4:	000c079b          	sext.w	a5,s8
        if (i < 0) return -1;
    800034d8:	020c1713          	slli	a4,s8,0x20
    800034dc:	02074463          	bltz	a4,80003504 <_ZN15FibonacciThread3runEv+0x1b8>
        return (i == 0 ? 0 : i + fibonacci(i - 1));
    800034e0:	00079663          	bnez	a5,800034ec <_ZN15FibonacciThread3runEv+0x1a0>
    800034e4:	00fb87bb          	addw	a5,s7,a5
    800034e8:	fe1ff06f          	j	800034c8 <_ZN15FibonacciThread3runEv+0x17c>
    800034ec:	fffc059b          	addiw	a1,s8,-1
    800034f0:	00048513          	mv	a0,s1
    800034f4:	00000097          	auipc	ra,0x0
    800034f8:	e04080e7          	jalr	-508(ra) # 800032f8 <_ZN15FibonacciThread9fibonacciEi>
    800034fc:	00ac07bb          	addw	a5,s8,a0
    80003500:	fe5ff06f          	j	800034e4 <_ZN15FibonacciThread3runEv+0x198>
        if (i < 0) return -1;
    80003504:	fff00793          	li	a5,-1
    80003508:	fddff06f          	j	800034e4 <_ZN15FibonacciThread3runEv+0x198>
    8000350c:	fff00793          	li	a5,-1
    80003510:	fb9ff06f          	j	800034c8 <_ZN15FibonacciThread3runEv+0x17c>
    80003514:	fff00793          	li	a5,-1
    80003518:	f95ff06f          	j	800034ac <_ZN15FibonacciThread3runEv+0x160>
    8000351c:	fff00793          	li	a5,-1
    80003520:	f71ff06f          	j	80003490 <_ZN15FibonacciThread3runEv+0x144>
    80003524:	fff00793          	li	a5,-1
    80003528:	f4dff06f          	j	80003474 <_ZN15FibonacciThread3runEv+0x128>
    8000352c:	fff00793          	li	a5,-1
    80003530:	f29ff06f          	j	80003458 <_ZN15FibonacciThread3runEv+0x10c>

0000000080003534 <_ZN9Allocator8mem_initEv>:
#include "../h/c_memory.hpp"
#include "../h/iostream.hpp"

Allocator::MemoryBlock *Allocator::free_pointer = nullptr;

void Allocator::mem_init() {
    80003534:	ff010113          	addi	sp,sp,-16
    80003538:	00813423          	sd	s0,8(sp)
    8000353c:	01010413          	addi	s0,sp,16
    Allocator::free_pointer = (Allocator::MemoryBlock *) HEAP_START_ADDR;
    80003540:	00007797          	auipc	a5,0x7
    80003544:	ee87b783          	ld	a5,-280(a5) # 8000a428 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003548:	0007b703          	ld	a4,0(a5)
    8000354c:	00007797          	auipc	a5,0x7
    80003550:	fce7ba23          	sd	a4,-44(a5) # 8000a520 <_ZN9Allocator12free_pointerE>
    *Allocator::free_pointer = {nullptr, reinterpret_cast<uint64>(HEAP_END_ADDR) -
    80003554:	00007797          	auipc	a5,0x7
    80003558:	f1c7b783          	ld	a5,-228(a5) # 8000a470 <_GLOBAL_OFFSET_TABLE_+0x78>
    8000355c:	0007b783          	ld	a5,0(a5)
    80003560:	40e787b3          	sub	a5,a5,a4
                                         reinterpret_cast<uint64>(HEAP_START_ADDR) - Allocator::HEADER_SIZE};
    80003564:	ff078793          	addi	a5,a5,-16
    *Allocator::free_pointer = {nullptr, reinterpret_cast<uint64>(HEAP_END_ADDR) -
    80003568:	00073023          	sd	zero,0(a4)
    8000356c:	00f73423          	sd	a5,8(a4)
}
    80003570:	00813403          	ld	s0,8(sp)
    80003574:	01010113          	addi	sp,sp,16
    80003578:	00008067          	ret

000000008000357c <_ZN9Allocator10_mem_allocEm>:

void *Allocator::_mem_alloc(size_t size) {
    8000357c:	ff010113          	addi	sp,sp,-16
    80003580:	00813423          	sd	s0,8(sp)
    80003584:	01010413          	addi	s0,sp,16
    80003588:	00050793          	mv	a5,a0
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    8000358c:	00007517          	auipc	a0,0x7
    80003590:	f9453503          	ld	a0,-108(a0) # 8000a520 <_ZN9Allocator12free_pointerE>
    if (available && available->size < size) {
    80003594:	02050863          	beqz	a0,800035c4 <_ZN9Allocator10_mem_allocEm+0x48>
    80003598:	00853703          	ld	a4,8(a0)
    8000359c:	02f77863          	bgeu	a4,a5,800035cc <_ZN9Allocator10_mem_allocEm+0x50>
        for (previous = available, available = available->next; available && available->size < size;
    800035a0:	00050693          	mv	a3,a0
    800035a4:	00053503          	ld	a0,0(a0)
    800035a8:	00c0006f          	j	800035b4 <_ZN9Allocator10_mem_allocEm+0x38>
             previous = available, available = available->next);
    800035ac:	00050693          	mv	a3,a0
    800035b0:	00053503          	ld	a0,0(a0)
        for (previous = available, available = available->next; available && available->size < size;
    800035b4:	00050e63          	beqz	a0,800035d0 <_ZN9Allocator10_mem_allocEm+0x54>
    800035b8:	00853703          	ld	a4,8(a0)
    800035bc:	fef768e3          	bltu	a4,a5,800035ac <_ZN9Allocator10_mem_allocEm+0x30>
    800035c0:	0100006f          	j	800035d0 <_ZN9Allocator10_mem_allocEm+0x54>
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    800035c4:	00050693          	mv	a3,a0
    800035c8:	0080006f          	j	800035d0 <_ZN9Allocator10_mem_allocEm+0x54>
    800035cc:	00000693          	li	a3,0
    }
    if (!available) return nullptr;
    800035d0:	04050463          	beqz	a0,80003618 <_ZN9Allocator10_mem_allocEm+0x9c>
    if (available->size > Allocator::HEADER_SIZE + size) {
    800035d4:	00853703          	ld	a4,8(a0)
    800035d8:	01078613          	addi	a2,a5,16
    800035dc:	04e67463          	bgeu	a2,a4,80003624 <_ZN9Allocator10_mem_allocEm+0xa8>
        uint64 next_size = available->size - size - Allocator::HEADER_SIZE;
    800035e0:	40f70733          	sub	a4,a4,a5
    800035e4:	ff070713          	addi	a4,a4,-16
        available->size = size;
    800035e8:	00f53423          	sd	a5,8(a0)
        next_node = reinterpret_cast<Allocator::MemoryBlock *>(reinterpret_cast<uint64>(available) +
                                                               Allocator::HEADER_SIZE + size);
    800035ec:	00f507b3          	add	a5,a0,a5
    800035f0:	01078613          	addi	a2,a5,16
        next_node->next = available->next;
    800035f4:	00053583          	ld	a1,0(a0)
    800035f8:	00b7b823          	sd	a1,16(a5)
        next_node->size = next_size;
    800035fc:	00e63423          	sd	a4,8(a2)
    } else {
        next_node = available->next;
    }
    available->next = reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(available) ^ available->size);
    80003600:	00853783          	ld	a5,8(a0)
    80003604:	00f547b3          	xor	a5,a0,a5
    80003608:	00f53023          	sd	a5,0(a0)
    if (previous) previous->next = next_node;
    8000360c:	02068063          	beqz	a3,8000362c <_ZN9Allocator10_mem_allocEm+0xb0>
    80003610:	00c6b023          	sd	a2,0(a3)
    else Allocator::free_pointer = next_node;
    return (void *) (available + 1);
    80003614:	01050513          	addi	a0,a0,16
}
    80003618:	00813403          	ld	s0,8(sp)
    8000361c:	01010113          	addi	sp,sp,16
    80003620:	00008067          	ret
        next_node = available->next;
    80003624:	00053603          	ld	a2,0(a0)
    80003628:	fd9ff06f          	j	80003600 <_ZN9Allocator10_mem_allocEm+0x84>
    else Allocator::free_pointer = next_node;
    8000362c:	00007797          	auipc	a5,0x7
    80003630:	eec7ba23          	sd	a2,-268(a5) # 8000a520 <_ZN9Allocator12free_pointerE>
    80003634:	fe1ff06f          	j	80003614 <_ZN9Allocator10_mem_allocEm+0x98>

0000000080003638 <_ZN9Allocator9_mem_freeEPKv>:

int Allocator::_mem_free(const void *pointer) {
    80003638:	ff010113          	addi	sp,sp,-16
    8000363c:	00813423          	sd	s0,8(sp)
    80003640:	01010413          	addi	s0,sp,16
    Allocator::MemoryBlock *freed = (Allocator::MemoryBlock *) pointer - 1;
    80003644:	ff050693          	addi	a3,a0,-16
    if (freed < HEAP_START_ADDR) return -1;
    80003648:	00007797          	auipc	a5,0x7
    8000364c:	de07b783          	ld	a5,-544(a5) # 8000a428 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003650:	0007b783          	ld	a5,0(a5)
    80003654:	0cf6ec63          	bltu	a3,a5,8000372c <_ZN9Allocator9_mem_freeEPKv+0xf4>
    if (freed->next != reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(freed) ^ freed->size)) return -2;
    80003658:	ff053703          	ld	a4,-16(a0)
    8000365c:	ff853783          	ld	a5,-8(a0)
    80003660:	00068813          	mv	a6,a3
    80003664:	00d7c7b3          	xor	a5,a5,a3
    80003668:	0cf71663          	bne	a4,a5,80003734 <_ZN9Allocator9_mem_freeEPKv+0xfc>
    Allocator::MemoryBlock *previous = Allocator::free_pointer, *next_node;
    8000366c:	00007717          	auipc	a4,0x7
    80003670:	eb473703          	ld	a4,-332(a4) # 8000a520 <_ZN9Allocator12free_pointerE>
    if (freed < Allocator::free_pointer) {
    80003674:	04e6fe63          	bgeu	a3,a4,800036d0 <_ZN9Allocator9_mem_freeEPKv+0x98>
        next_node = Allocator::free_pointer;
        Allocator::free_pointer = freed;
    80003678:	00007797          	auipc	a5,0x7
    8000367c:	ead7b423          	sd	a3,-344(a5) # 8000a520 <_ZN9Allocator12free_pointerE>
        next_node = Allocator::free_pointer;
    80003680:	00070793          	mv	a5,a4
        previous = nullptr;
    80003684:	00000713          	li	a4,0
inline bool Allocator::adjacent(Allocator::MemoryBlock *block1, Allocator::MemoryBlock *block2) {
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
}

inline void Allocator::merge(MemoryBlock *block1, MemoryBlock *block2) {
    if (!block1) return;
    80003688:	00068e63          	beqz	a3,800036a4 <_ZN9Allocator9_mem_freeEPKv+0x6c>
    if (block2 && Allocator::adjacent(block1, block2)) {
    8000368c:	00078a63          	beqz	a5,800036a0 <_ZN9Allocator9_mem_freeEPKv+0x68>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    80003690:	ff853583          	ld	a1,-8(a0)
    80003694:	00b68633          	add	a2,a3,a1
    80003698:	01060613          	addi	a2,a2,16
    if (block2 && Allocator::adjacent(block1, block2)) {
    8000369c:	04f60a63          	beq	a2,a5,800036f0 <_ZN9Allocator9_mem_freeEPKv+0xb8>
        block1->next = block2->next;
        block1->size += Allocator::HEADER_SIZE + block2->size;
    } else {
        block1->next = block2;
    800036a0:	fef53823          	sd	a5,-16(a0)
    if (!block1) return;
    800036a4:	08070c63          	beqz	a4,8000373c <_ZN9Allocator9_mem_freeEPKv+0x104>
    if (block2 && Allocator::adjacent(block1, block2)) {
    800036a8:	00068a63          	beqz	a3,800036bc <_ZN9Allocator9_mem_freeEPKv+0x84>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    800036ac:	00873603          	ld	a2,8(a4)
    800036b0:	00c707b3          	add	a5,a4,a2
    800036b4:	01078793          	addi	a5,a5,16
    if (block2 && Allocator::adjacent(block1, block2)) {
    800036b8:	04f80a63          	beq	a6,a5,8000370c <_ZN9Allocator9_mem_freeEPKv+0xd4>
        block1->next = block2;
    800036bc:	00d73023          	sd	a3,0(a4)
    return 0;
    800036c0:	00000513          	li	a0,0
}
    800036c4:	00813403          	ld	s0,8(sp)
    800036c8:	01010113          	addi	sp,sp,16
    800036cc:	00008067          	ret
        for (next_node = previous->next; next_node && !(previous < freed && next_node > freed);
    800036d0:	00073783          	ld	a5,0(a4)
    800036d4:	00c0006f          	j	800036e0 <_ZN9Allocator9_mem_freeEPKv+0xa8>
             previous = next_node, next_node = next_node->next);
    800036d8:	00078713          	mv	a4,a5
    800036dc:	0007b783          	ld	a5,0(a5)
        for (next_node = previous->next; next_node && !(previous < freed && next_node > freed);
    800036e0:	fa0784e3          	beqz	a5,80003688 <_ZN9Allocator9_mem_freeEPKv+0x50>
    800036e4:	fed77ae3          	bgeu	a4,a3,800036d8 <_ZN9Allocator9_mem_freeEPKv+0xa0>
    800036e8:	fef6f8e3          	bgeu	a3,a5,800036d8 <_ZN9Allocator9_mem_freeEPKv+0xa0>
    800036ec:	f9dff06f          	j	80003688 <_ZN9Allocator9_mem_freeEPKv+0x50>
        block1->next = block2->next;
    800036f0:	0007b603          	ld	a2,0(a5)
    800036f4:	fec53823          	sd	a2,-16(a0)
        block1->size += Allocator::HEADER_SIZE + block2->size;
    800036f8:	0087b783          	ld	a5,8(a5)
    800036fc:	00f585b3          	add	a1,a1,a5
    80003700:	01058593          	addi	a1,a1,16
    80003704:	feb53c23          	sd	a1,-8(a0)
    80003708:	f9dff06f          	j	800036a4 <_ZN9Allocator9_mem_freeEPKv+0x6c>
        block1->next = block2->next;
    8000370c:	ff053783          	ld	a5,-16(a0)
    80003710:	00f73023          	sd	a5,0(a4)
        block1->size += Allocator::HEADER_SIZE + block2->size;
    80003714:	ff853783          	ld	a5,-8(a0)
    80003718:	00f60633          	add	a2,a2,a5
    8000371c:	01060613          	addi	a2,a2,16
    80003720:	00c73423          	sd	a2,8(a4)
    return 0;
    80003724:	00000513          	li	a0,0
    80003728:	f9dff06f          	j	800036c4 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    if (freed < HEAP_START_ADDR) return -1;
    8000372c:	fff00513          	li	a0,-1
    80003730:	f95ff06f          	j	800036c4 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    if (freed->next != reinterpret_cast<MemoryBlock *>(reinterpret_cast<uint64>(freed) ^ freed->size)) return -2;
    80003734:	ffe00513          	li	a0,-2
    80003738:	f8dff06f          	j	800036c4 <_ZN9Allocator9_mem_freeEPKv+0x8c>
    return 0;
    8000373c:	00000513          	li	a0,0
    80003740:	f85ff06f          	j	800036c4 <_ZN9Allocator9_mem_freeEPKv+0x8c>

0000000080003744 <_ZN9Allocator9mem_checkEv>:
    }
}

__attribute__((unused))
bool Allocator::mem_check() {
    80003744:	ff010113          	addi	sp,sp,-16
    80003748:	00813423          	sd	s0,8(sp)
    8000374c:	01010413          	addi	s0,sp,16
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    80003750:	00007717          	auipc	a4,0x7
    80003754:	dd073703          	ld	a4,-560(a4) # 8000a520 <_ZN9Allocator12free_pointerE>
    80003758:	00070793          	mv	a5,a4
    8000375c:	00073703          	ld	a4,0(a4)
    80003760:	00070e63          	beqz	a4,8000377c <_ZN9Allocator9mem_checkEv+0x38>
    return reinterpret_cast<uint64>(block1) + Allocator::HEADER_SIZE + block1->size == reinterpret_cast<uint64>(block2);
    80003764:	0087b683          	ld	a3,8(a5)
    80003768:	00d787b3          	add	a5,a5,a3
    8000376c:	01078793          	addi	a5,a5,16
        if (Allocator::adjacent(curr, curr->next)) return false;
    80003770:	fee794e3          	bne	a5,a4,80003758 <_ZN9Allocator9mem_checkEv+0x14>
    80003774:	00000513          	li	a0,0
    80003778:	0080006f          	j	80003780 <_ZN9Allocator9mem_checkEv+0x3c>
    }
    return true;
    8000377c:	00100513          	li	a0,1
}
    80003780:	00813403          	ld	s0,8(sp)
    80003784:	01010113          	addi	sp,sp,16
    80003788:	00008067          	ret

000000008000378c <_ZN9Allocator8mem_showEv>:

__attribute__((unused))
void Allocator::mem_show() {
    8000378c:	fe010113          	addi	sp,sp,-32
    80003790:	00113c23          	sd	ra,24(sp)
    80003794:	00813823          	sd	s0,16(sp)
    80003798:	00913423          	sd	s1,8(sp)
    8000379c:	02010413          	addi	s0,sp,32
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    800037a0:	00007497          	auipc	s1,0x7
    800037a4:	d804b483          	ld	s1,-640(s1) # 8000a520 <_ZN9Allocator12free_pointerE>
    800037a8:	0004b783          	ld	a5,0(s1)
    800037ac:	04078e63          	beqz	a5,80003808 <_ZN9Allocator8mem_showEv+0x7c>
        stm::cout << curr << stm::endl << curr->next << stm::endl << stm::endl;
    800037b0:	00048593          	mv	a1,s1
    800037b4:	00007517          	auipc	a0,0x7
    800037b8:	cd453503          	ld	a0,-812(a0) # 8000a488 <_GLOBAL_OFFSET_TABLE_+0x90>
    800037bc:	00000097          	auipc	ra,0x0
    800037c0:	238080e7          	jalr	568(ra) # 800039f4 <_ZNK3stm7istreamlsEPv>
    800037c4:	00007597          	auipc	a1,0x7
    800037c8:	c945b583          	ld	a1,-876(a1) # 8000a458 <_GLOBAL_OFFSET_TABLE_+0x60>
    800037cc:	00000097          	auipc	ra,0x0
    800037d0:	2b4080e7          	jalr	692(ra) # 80003a80 <_ZNK3stm7istreamlsERKNS_7endlineE>
    800037d4:	0004b583          	ld	a1,0(s1)
    800037d8:	00000097          	auipc	ra,0x0
    800037dc:	21c080e7          	jalr	540(ra) # 800039f4 <_ZNK3stm7istreamlsEPv>
    800037e0:	00007597          	auipc	a1,0x7
    800037e4:	c785b583          	ld	a1,-904(a1) # 8000a458 <_GLOBAL_OFFSET_TABLE_+0x60>
    800037e8:	00000097          	auipc	ra,0x0
    800037ec:	298080e7          	jalr	664(ra) # 80003a80 <_ZNK3stm7istreamlsERKNS_7endlineE>
    800037f0:	00007597          	auipc	a1,0x7
    800037f4:	c685b583          	ld	a1,-920(a1) # 8000a458 <_GLOBAL_OFFSET_TABLE_+0x60>
    800037f8:	00000097          	auipc	ra,0x0
    800037fc:	288080e7          	jalr	648(ra) # 80003a80 <_ZNK3stm7istreamlsERKNS_7endlineE>
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
    80003800:	0004b483          	ld	s1,0(s1)
    80003804:	fa5ff06f          	j	800037a8 <_ZN9Allocator8mem_showEv+0x1c>
    }
}
    80003808:	01813083          	ld	ra,24(sp)
    8000380c:	01013403          	ld	s0,16(sp)
    80003810:	00813483          	ld	s1,8(sp)
    80003814:	02010113          	addi	sp,sp,32
    80003818:	00008067          	ret

000000008000381c <_ZN9Allocator8mem_sizeEv>:

__attribute__((unused))
int Allocator::mem_size() {
    8000381c:	ff010113          	addi	sp,sp,-16
    80003820:	00813423          	sd	s0,8(sp)
    80003824:	01010413          	addi	s0,sp,16
    int i = 0;
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr; i += curr->size, curr = curr->next);
    80003828:	00007797          	auipc	a5,0x7
    8000382c:	cf87b783          	ld	a5,-776(a5) # 8000a520 <_ZN9Allocator12free_pointerE>
    int i = 0;
    80003830:	00000513          	li	a0,0
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr; i += curr->size, curr = curr->next);
    80003834:	00078a63          	beqz	a5,80003848 <_ZN9Allocator8mem_sizeEv+0x2c>
    80003838:	0087b703          	ld	a4,8(a5)
    8000383c:	00a7053b          	addw	a0,a4,a0
    80003840:	0007b783          	ld	a5,0(a5)
    80003844:	ff1ff06f          	j	80003834 <_ZN9Allocator8mem_sizeEv+0x18>
    return i;
}
    80003848:	00813403          	ld	s0,8(sp)
    8000384c:	01010113          	addi	sp,sp,16
    80003850:	00008067          	ret

0000000080003854 <_Z6memcpyPKvS0_i>:

void memcpy(const void *src, const void *dst, int len) {
    80003854:	ff010113          	addi	sp,sp,-16
    80003858:	00813423          	sd	s0,8(sp)
    8000385c:	01010413          	addi	s0,sp,16
    char *src1 = (char *) src;
    char *dst1 = (char *) dst;
    for (int i = 0; i < len; i++)
    80003860:	00000793          	li	a5,0
    80003864:	00c7de63          	bge	a5,a2,80003880 <_Z6memcpyPKvS0_i+0x2c>
        dst1[i] = src1[i];
    80003868:	00f58733          	add	a4,a1,a5
    8000386c:	00f506b3          	add	a3,a0,a5
    80003870:	0006c683          	lbu	a3,0(a3)
    80003874:	00d70023          	sb	a3,0(a4)
    for (int i = 0; i < len; i++)
    80003878:	0017879b          	addiw	a5,a5,1
    8000387c:	fe9ff06f          	j	80003864 <_Z6memcpyPKvS0_i+0x10>
    80003880:	00813403          	ld	s0,8(sp)
    80003884:	01010113          	addi	sp,sp,16
    80003888:	00008067          	ret

000000008000388c <_ZNK3stm7istreamlsEc>:
#include "../h/string.hpp"

const stm::istream stm::cout;
const stm::endline stm::endl;

const stm::istream &stm::istream::operator<<(const char c) const {
    8000388c:	fe010113          	addi	sp,sp,-32
    80003890:	00113c23          	sd	ra,24(sp)
    80003894:	00813823          	sd	s0,16(sp)
    80003898:	00913423          	sd	s1,8(sp)
    8000389c:	02010413          	addi	s0,sp,32
    800038a0:	00050493          	mv	s1,a0
    putc(c);
    800038a4:	00058513          	mv	a0,a1
    800038a8:	ffffe097          	auipc	ra,0xffffe
    800038ac:	0e4080e7          	jalr	228(ra) # 8000198c <_Z4putcc>
    return *this;
}
    800038b0:	00048513          	mv	a0,s1
    800038b4:	01813083          	ld	ra,24(sp)
    800038b8:	01013403          	ld	s0,16(sp)
    800038bc:	00813483          	ld	s1,8(sp)
    800038c0:	02010113          	addi	sp,sp,32
    800038c4:	00008067          	ret

00000000800038c8 <_ZNK3stm7istreamlsEPKc>:

const stm::istream &stm::istream::operator<<(const char *string) const {
    800038c8:	fe010113          	addi	sp,sp,-32
    800038cc:	00113c23          	sd	ra,24(sp)
    800038d0:	00813823          	sd	s0,16(sp)
    800038d4:	00913423          	sd	s1,8(sp)
    800038d8:	02010413          	addi	s0,sp,32
    800038dc:	00050493          	mv	s1,a0
    print(string);
    800038e0:	00058513          	mv	a0,a1
    800038e4:	fffff097          	auipc	ra,0xfffff
    800038e8:	dc4080e7          	jalr	-572(ra) # 800026a8 <_Z5printPKc>
    return *this;
}
    800038ec:	00048513          	mv	a0,s1
    800038f0:	01813083          	ld	ra,24(sp)
    800038f4:	01013403          	ld	s0,16(sp)
    800038f8:	00813483          	ld	s1,8(sp)
    800038fc:	02010113          	addi	sp,sp,32
    80003900:	00008067          	ret

0000000080003904 <_ZNK3stm7istreamlsERKNS_6stringE>:

const stm::istream &stm::istream::operator<<(const stm::string &string) const {
    80003904:	fe010113          	addi	sp,sp,-32
    80003908:	00113c23          	sd	ra,24(sp)
    8000390c:	00813823          	sd	s0,16(sp)
    80003910:	00913423          	sd	s1,8(sp)
    80003914:	02010413          	addi	s0,sp,32
    80003918:	00050493          	mv	s1,a0
    print(string.actual_string);
    8000391c:	0085b503          	ld	a0,8(a1)
    80003920:	fffff097          	auipc	ra,0xfffff
    80003924:	d88080e7          	jalr	-632(ra) # 800026a8 <_Z5printPKc>
    return *this;
}
    80003928:	00048513          	mv	a0,s1
    8000392c:	01813083          	ld	ra,24(sp)
    80003930:	01013403          	ld	s0,16(sp)
    80003934:	00813483          	ld	s1,8(sp)
    80003938:	02010113          	addi	sp,sp,32
    8000393c:	00008067          	ret

0000000080003940 <_ZNK3stm7istreamlsEx>:

const stm::istream &stm::istream::operator<<(long long number) const {
    80003940:	fe010113          	addi	sp,sp,-32
    80003944:	00113c23          	sd	ra,24(sp)
    80003948:	00813823          	sd	s0,16(sp)
    8000394c:	00913423          	sd	s1,8(sp)
    80003950:	02010413          	addi	s0,sp,32
    80003954:	00050493          	mv	s1,a0
    print(number);
    80003958:	00058513          	mv	a0,a1
    8000395c:	fffff097          	auipc	ra,0xfffff
    80003960:	e60080e7          	jalr	-416(ra) # 800027bc <_Z5printx>
    return *this;
}
    80003964:	00048513          	mv	a0,s1
    80003968:	01813083          	ld	ra,24(sp)
    8000396c:	01013403          	ld	s0,16(sp)
    80003970:	00813483          	ld	s1,8(sp)
    80003974:	02010113          	addi	sp,sp,32
    80003978:	00008067          	ret

000000008000397c <_ZNK3stm7istreamlsEi>:

const stm::istream &stm::istream::operator<<(int number) const {
    8000397c:	fe010113          	addi	sp,sp,-32
    80003980:	00113c23          	sd	ra,24(sp)
    80003984:	00813823          	sd	s0,16(sp)
    80003988:	00913423          	sd	s1,8(sp)
    8000398c:	02010413          	addi	s0,sp,32
    80003990:	00050493          	mv	s1,a0
    print(number);
    80003994:	00058513          	mv	a0,a1
    80003998:	fffff097          	auipc	ra,0xfffff
    8000399c:	e6c080e7          	jalr	-404(ra) # 80002804 <_Z5printi>
    return *this;
}
    800039a0:	00048513          	mv	a0,s1
    800039a4:	01813083          	ld	ra,24(sp)
    800039a8:	01013403          	ld	s0,16(sp)
    800039ac:	00813483          	ld	s1,8(sp)
    800039b0:	02010113          	addi	sp,sp,32
    800039b4:	00008067          	ret

00000000800039b8 <_ZNK3stm7istreamlsEm>:

const stm::istream &stm::istream::operator<<(uint64 number) const {
    800039b8:	fe010113          	addi	sp,sp,-32
    800039bc:	00113c23          	sd	ra,24(sp)
    800039c0:	00813823          	sd	s0,16(sp)
    800039c4:	00913423          	sd	s1,8(sp)
    800039c8:	02010413          	addi	s0,sp,32
    800039cc:	00050493          	mv	s1,a0
    print(number);
    800039d0:	00058513          	mv	a0,a1
    800039d4:	fffff097          	auipc	ra,0xfffff
    800039d8:	e58080e7          	jalr	-424(ra) # 8000282c <_Z5printm>
    return *this;
}
    800039dc:	00048513          	mv	a0,s1
    800039e0:	01813083          	ld	ra,24(sp)
    800039e4:	01013403          	ld	s0,16(sp)
    800039e8:	00813483          	ld	s1,8(sp)
    800039ec:	02010113          	addi	sp,sp,32
    800039f0:	00008067          	ret

00000000800039f4 <_ZNK3stm7istreamlsEPv>:

const stm::istream &stm::istream::operator<<(void *pointer) const {
    800039f4:	fe010113          	addi	sp,sp,-32
    800039f8:	00113c23          	sd	ra,24(sp)
    800039fc:	00813823          	sd	s0,16(sp)
    80003a00:	00913423          	sd	s1,8(sp)
    80003a04:	02010413          	addi	s0,sp,32
    80003a08:	00050493          	mv	s1,a0
    print_h((uint64) pointer);
    80003a0c:	00058513          	mv	a0,a1
    80003a10:	fffff097          	auipc	ra,0xfffff
    80003a14:	e64080e7          	jalr	-412(ra) # 80002874 <_Z7print_hm>
    return *this;
}
    80003a18:	00048513          	mv	a0,s1
    80003a1c:	01813083          	ld	ra,24(sp)
    80003a20:	01013403          	ld	s0,16(sp)
    80003a24:	00813483          	ld	s1,8(sp)
    80003a28:	02010113          	addi	sp,sp,32
    80003a2c:	00008067          	ret

0000000080003a30 <_ZNK3stm7istreamlsEb>:

const stm::istream &stm::istream::operator<<(bool truth) const {
    80003a30:	fe010113          	addi	sp,sp,-32
    80003a34:	00113c23          	sd	ra,24(sp)
    80003a38:	00813823          	sd	s0,16(sp)
    80003a3c:	00913423          	sd	s1,8(sp)
    80003a40:	02010413          	addi	s0,sp,32
    80003a44:	00050493          	mv	s1,a0
    print(truth ? "true" : "false");
    80003a48:	02058663          	beqz	a1,80003a74 <_ZNK3stm7istreamlsEb+0x44>
    80003a4c:	00004517          	auipc	a0,0x4
    80003a50:	63c50513          	addi	a0,a0,1596 # 80008088 <CONSOLE_STATUS+0x78>
    80003a54:	fffff097          	auipc	ra,0xfffff
    80003a58:	c54080e7          	jalr	-940(ra) # 800026a8 <_Z5printPKc>
    return *this;
}
    80003a5c:	00048513          	mv	a0,s1
    80003a60:	01813083          	ld	ra,24(sp)
    80003a64:	01013403          	ld	s0,16(sp)
    80003a68:	00813483          	ld	s1,8(sp)
    80003a6c:	02010113          	addi	sp,sp,32
    80003a70:	00008067          	ret
    print(truth ? "true" : "false");
    80003a74:	00004517          	auipc	a0,0x4
    80003a78:	60c50513          	addi	a0,a0,1548 # 80008080 <CONSOLE_STATUS+0x70>
    80003a7c:	fd9ff06f          	j	80003a54 <_ZNK3stm7istreamlsEb+0x24>

0000000080003a80 <_ZNK3stm7istreamlsERKNS_7endlineE>:

const stm::istream &stm::istream::operator<<(const stm::endline &) const {
    80003a80:	fe010113          	addi	sp,sp,-32
    80003a84:	00113c23          	sd	ra,24(sp)
    80003a88:	00813823          	sd	s0,16(sp)
    80003a8c:	00913423          	sd	s1,8(sp)
    80003a90:	02010413          	addi	s0,sp,32
    80003a94:	00050493          	mv	s1,a0
    putc('\n');
    80003a98:	00a00513          	li	a0,10
    80003a9c:	ffffe097          	auipc	ra,0xffffe
    80003aa0:	ef0080e7          	jalr	-272(ra) # 8000198c <_Z4putcc>
    return *this;
}
    80003aa4:	00048513          	mv	a0,s1
    80003aa8:	01813083          	ld	ra,24(sp)
    80003aac:	01013403          	ld	s0,16(sp)
    80003ab0:	00813483          	ld	s1,8(sp)
    80003ab4:	02010113          	addi	sp,sp,32
    80003ab8:	00008067          	ret

0000000080003abc <_Z9bleya_nitPv>:
#include "../h/cpp_semaphores.hpp"
#include "../h/scheduler.hpp"
#include "../h/iostream.hpp"

[[noreturn]]
void bleya_nit(void *) {
    80003abc:	ff010113          	addi	sp,sp,-16
    80003ac0:	00813423          	sd	s0,8(sp)
    80003ac4:	01010413          	addi	s0,sp,16
    while (true) {
    80003ac8:	0000006f          	j	80003ac8 <_Z9bleya_nitPv+0xc>

0000000080003acc <_Z11userWrapperPv>:
    thread_create(&handle_main, nullptr, nullptr);
    thread_create(&handle_bleya, &bleya_nit, nullptr);
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
}

void userWrapper(void *ret) {
    80003acc:	fe010113          	addi	sp,sp,-32
    80003ad0:	00113c23          	sd	ra,24(sp)
    80003ad4:	00813823          	sd	s0,16(sp)
    80003ad8:	00913423          	sd	s1,8(sp)
    80003adc:	02010413          	addi	s0,sp,32
    80003ae0:	00050493          	mv	s1,a0
    *((int *) ret) = userMain();
    80003ae4:	fffff097          	auipc	ra,0xfffff
    80003ae8:	460080e7          	jalr	1120(ra) # 80002f44 <_Z8userMainv>
    80003aec:	00a4a023          	sw	a0,0(s1)
}
    80003af0:	01813083          	ld	ra,24(sp)
    80003af4:	01013403          	ld	s0,16(sp)
    80003af8:	00813483          	ld	s1,8(sp)
    80003afc:	02010113          	addi	sp,sp,32
    80003b00:	00008067          	ret

0000000080003b04 <_Z4callv>:

int call() {
    80003b04:	fe010113          	addi	sp,sp,-32
    80003b08:	00113c23          	sd	ra,24(sp)
    80003b0c:	00813823          	sd	s0,16(sp)
    80003b10:	02010413          	addi	s0,sp,32
    thread_t userHandle;
    int ret;
    thread_create(&userHandle, userWrapper, &ret);
    80003b14:	fe440613          	addi	a2,s0,-28
    80003b18:	00000597          	auipc	a1,0x0
    80003b1c:	fb458593          	addi	a1,a1,-76 # 80003acc <_Z11userWrapperPv>
    80003b20:	fe840513          	addi	a0,s0,-24
    80003b24:	ffffe097          	auipc	ra,0xffffe
    80003b28:	a00080e7          	jalr	-1536(ra) # 80001524 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_join(userHandle);
    80003b2c:	fe843503          	ld	a0,-24(s0)
    80003b30:	ffffe097          	auipc	ra,0xffffe
    80003b34:	aec080e7          	jalr	-1300(ra) # 8000161c <_Z11thread_joinP3TCB>
    return ret;
}
    80003b38:	fe442503          	lw	a0,-28(s0)
    80003b3c:	01813083          	ld	ra,24(sp)
    80003b40:	01013403          	ld	s0,16(sp)
    80003b44:	02010113          	addi	sp,sp,32
    80003b48:	00008067          	ret

0000000080003b4c <_Z3endi>:

int end(int ret) {
    80003b4c:	fe010113          	addi	sp,sp,-32
    80003b50:	00113c23          	sd	ra,24(sp)
    80003b54:	00813823          	sd	s0,16(sp)
    80003b58:	00913423          	sd	s1,8(sp)
    80003b5c:	02010413          	addi	s0,sp,32
    80003b60:	00050493          	mv	s1,a0
    print("\n\nProcess finished with exit code ");
    80003b64:	00004517          	auipc	a0,0x4
    80003b68:	53c50513          	addi	a0,a0,1340 # 800080a0 <_ZN3stm4coutE+0x8>
    80003b6c:	fffff097          	auipc	ra,0xfffff
    80003b70:	b3c080e7          	jalr	-1220(ra) # 800026a8 <_Z5printPKc>
    print(ret);
    80003b74:	00048513          	mv	a0,s1
    80003b78:	fffff097          	auipc	ra,0xfffff
    80003b7c:	c8c080e7          	jalr	-884(ra) # 80002804 <_Z5printi>
    print("\n\n");
    80003b80:	00004517          	auipc	a0,0x4
    80003b84:	54850513          	addi	a0,a0,1352 # 800080c8 <_ZN3stm4coutE+0x30>
    80003b88:	fffff097          	auipc	ra,0xfffff
    80003b8c:	b20080e7          	jalr	-1248(ra) # 800026a8 <_Z5printPKc>
        inline bool is_empty() const { return this->size == 0; }
    80003b90:	00007797          	auipc	a5,0x7
    80003b94:	8787b783          	ld	a5,-1928(a5) # 8000a408 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003b98:	0107a783          	lw	a5,16(a5)
    while (!IO::Output.is_empty());
    80003b9c:	fe079ae3          	bnez	a5,80003b90 <_Z3endi+0x44>
    time_sleep(10);
    80003ba0:	00a00513          	li	a0,10
    80003ba4:	ffffe097          	auipc	ra,0xffffe
    80003ba8:	d1c080e7          	jalr	-740(ra) # 800018c0 <_Z10time_sleepm>
    return 0;
}
    80003bac:	00000513          	li	a0,0
    80003bb0:	01813083          	ld	ra,24(sp)
    80003bb4:	01013403          	ld	s0,16(sp)
    80003bb8:	00813483          	ld	s1,8(sp)
    80003bbc:	02010113          	addi	sp,sp,32
    80003bc0:	00008067          	ret

0000000080003bc4 <main>:

int main() {
    80003bc4:	ff010113          	addi	sp,sp,-16
    80003bc8:	00113423          	sd	ra,8(sp)
    80003bcc:	00813023          	sd	s0,0(sp)
    80003bd0:	01010413          	addi	s0,sp,16
    init();
    80003bd4:	00000097          	auipc	ra,0x0
    80003bd8:	028080e7          	jalr	40(ra) # 80003bfc <_Z4initv>
    int ret = call();
    80003bdc:	00000097          	auipc	ra,0x0
    80003be0:	f28080e7          	jalr	-216(ra) # 80003b04 <_Z4callv>
    return end(ret);
    80003be4:	00000097          	auipc	ra,0x0
    80003be8:	f68080e7          	jalr	-152(ra) # 80003b4c <_Z3endi>
    80003bec:	00813083          	ld	ra,8(sp)
    80003bf0:	00013403          	ld	s0,0(sp)
    80003bf4:	01010113          	addi	sp,sp,16
    80003bf8:	00008067          	ret

0000000080003bfc <_Z4initv>:
inline void init() {
    80003bfc:	fd010113          	addi	sp,sp,-48
    80003c00:	02113423          	sd	ra,40(sp)
    80003c04:	02813023          	sd	s0,32(sp)
    80003c08:	00913c23          	sd	s1,24(sp)
    80003c0c:	01213823          	sd	s2,16(sp)
    80003c10:	03010413          	addi	s0,sp,48
    __asm__ volatile("mv t0, %0": : "r" (&supervisorTrap));
    80003c14:	00007797          	auipc	a5,0x7
    80003c18:	81c7b783          	ld	a5,-2020(a5) # 8000a430 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003c1c:	00078293          	mv	t0,a5
    __asm__ volatile("addi t0, t0, 1");
    80003c20:	00128293          	addi	t0,t0,1
    __asm__ volatile("csrw stvec, t0");
    80003c24:	10529073          	csrw	stvec,t0
    Allocator::mem_init();
    80003c28:	00000097          	auipc	ra,0x0
    80003c2c:	90c080e7          	jalr	-1780(ra) # 80003534 <_ZN9Allocator8mem_initEv>
    IO::init();
    80003c30:	fffff097          	auipc	ra,0xfffff
    80003c34:	cd0080e7          	jalr	-816(ra) # 80002900 <_ZN2IO4initEv>
#include "syscall_c.hpp"

class Scheduler final {
public:

    static void init() { high_priority.init(); mid_priority.init(); low_priority.init(); }
    80003c38:	00007517          	auipc	a0,0x7
    80003c3c:	84853503          	ld	a0,-1976(a0) # 8000a480 <_GLOBAL_OFFSET_TABLE_+0x88>
    80003c40:	fffff097          	auipc	ra,0xfffff
    80003c44:	870080e7          	jalr	-1936(ra) # 800024b0 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    80003c48:	00007517          	auipc	a0,0x7
    80003c4c:	81853503          	ld	a0,-2024(a0) # 8000a460 <_GLOBAL_OFFSET_TABLE_+0x68>
    80003c50:	fffff097          	auipc	ra,0xfffff
    80003c54:	860080e7          	jalr	-1952(ra) # 800024b0 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    80003c58:	00006517          	auipc	a0,0x6
    80003c5c:	7e053503          	ld	a0,2016(a0) # 8000a438 <_GLOBAL_OFFSET_TABLE_+0x40>
    80003c60:	fffff097          	auipc	ra,0xfffff
    80003c64:	850080e7          	jalr	-1968(ra) # 800024b0 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    printer = new OwnedMutex();
    80003c68:	02000513          	li	a0,32
    80003c6c:	00000097          	auipc	ra,0x0
    80003c70:	158080e7          	jalr	344(ra) # 80003dc4 <_Znwm>
    80003c74:	00050493          	mv	s1,a0
    80003c78:	00001097          	auipc	ra,0x1
    80003c7c:	cc8080e7          	jalr	-824(ra) # 80004940 <_ZN10OwnedMutexC1Ev>
    80003c80:	00007797          	auipc	a5,0x7
    80003c84:	8a97b423          	sd	s1,-1880(a5) # 8000a528 <printer>
    thread_create(&handle_main, nullptr, nullptr);
    80003c88:	00000613          	li	a2,0
    80003c8c:	00000593          	li	a1,0
    80003c90:	fd840513          	addi	a0,s0,-40
    80003c94:	ffffe097          	auipc	ra,0xffffe
    80003c98:	890080e7          	jalr	-1904(ra) # 80001524 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&handle_bleya, &bleya_nit, nullptr);
    80003c9c:	00000613          	li	a2,0
    80003ca0:	00000597          	auipc	a1,0x0
    80003ca4:	e1c58593          	addi	a1,a1,-484 # 80003abc <_Z9bleya_nitPv>
    80003ca8:	00007517          	auipc	a0,0x7
    80003cac:	88850513          	addi	a0,a0,-1912 # 8000a530 <handle_bleya>
    80003cb0:	ffffe097          	auipc	ra,0xffffe
    80003cb4:	874080e7          	jalr	-1932(ra) # 80001524 <_Z13thread_createPP3TCBPFvPvES2_>
inline void Riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80003cb8:	00200793          	li	a5,2
    80003cbc:	1007a073          	csrs	sstatus,a5
}
    80003cc0:	02813083          	ld	ra,40(sp)
    80003cc4:	02013403          	ld	s0,32(sp)
    80003cc8:	01813483          	ld	s1,24(sp)
    80003ccc:	01013903          	ld	s2,16(sp)
    80003cd0:	03010113          	addi	sp,sp,48
    80003cd4:	00008067          	ret
    80003cd8:	00050913          	mv	s2,a0
    printer = new OwnedMutex();
    80003cdc:	00048513          	mv	a0,s1
    80003ce0:	00000097          	auipc	ra,0x0
    80003ce4:	134080e7          	jalr	308(ra) # 80003e14 <_ZdlPv>
    80003ce8:	00090513          	mv	a0,s2
    80003cec:	00008097          	auipc	ra,0x8
    80003cf0:	97c080e7          	jalr	-1668(ra) # 8000b668 <_Unwind_Resume>

0000000080003cf4 <_ZN6Thread11threadStartEPv>:
Thread::Thread() {
    this->body = nullptr;
    this->arg = nullptr;
}

void Thread::threadStart(void *arg) {
    80003cf4:	ff010113          	addi	sp,sp,-16
    80003cf8:	00113423          	sd	ra,8(sp)
    80003cfc:	00813023          	sd	s0,0(sp)
    80003d00:	01010413          	addi	s0,sp,16
    Thread *thread = (Thread *) arg;
    if (thread->body) {
    80003d04:	01053783          	ld	a5,16(a0)
    80003d08:	00078e63          	beqz	a5,80003d24 <_ZN6Thread11threadStartEPv+0x30>
        thread->body(thread->arg);
    80003d0c:	01853503          	ld	a0,24(a0)
    80003d10:	000780e7          	jalr	a5
    } else {
        thread->run();
    }
}
    80003d14:	00813083          	ld	ra,8(sp)
    80003d18:	00013403          	ld	s0,0(sp)
    80003d1c:	01010113          	addi	sp,sp,16
    80003d20:	00008067          	ret
        thread->run();
    80003d24:	00053783          	ld	a5,0(a0)
    80003d28:	0107b783          	ld	a5,16(a5)
    80003d2c:	000780e7          	jalr	a5
}
    80003d30:	fe5ff06f          	j	80003d14 <_ZN6Thread11threadStartEPv+0x20>

0000000080003d34 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80003d34:	ff010113          	addi	sp,sp,-16
    80003d38:	00113423          	sd	ra,8(sp)
    80003d3c:	00813023          	sd	s0,0(sp)
    80003d40:	01010413          	addi	s0,sp,16
    80003d44:	00006797          	auipc	a5,0x6
    80003d48:	59c78793          	addi	a5,a5,1436 # 8000a2e0 <_ZTV9Semaphore+0x10>
    80003d4c:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80003d50:	00853503          	ld	a0,8(a0)
    80003d54:	ffffe097          	auipc	ra,0xffffe
    80003d58:	a2c080e7          	jalr	-1492(ra) # 80001780 <_Z9sem_closeP3Sem>
}
    80003d5c:	00813083          	ld	ra,8(sp)
    80003d60:	00013403          	ld	s0,0(sp)
    80003d64:	01010113          	addi	sp,sp,16
    80003d68:	00008067          	ret

0000000080003d6c <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80003d6c:	ff010113          	addi	sp,sp,-16
    80003d70:	00113423          	sd	ra,8(sp)
    80003d74:	00813023          	sd	s0,0(sp)
    80003d78:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80003d7c:	00853503          	ld	a0,8(a0)
    80003d80:	ffffe097          	auipc	ra,0xffffe
    80003d84:	a40080e7          	jalr	-1472(ra) # 800017c0 <_Z8sem_waitP3Sem>
}
    80003d88:	00813083          	ld	ra,8(sp)
    80003d8c:	00013403          	ld	s0,0(sp)
    80003d90:	01010113          	addi	sp,sp,16
    80003d94:	00008067          	ret

0000000080003d98 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80003d98:	ff010113          	addi	sp,sp,-16
    80003d9c:	00113423          	sd	ra,8(sp)
    80003da0:	00813023          	sd	s0,0(sp)
    80003da4:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80003da8:	00853503          	ld	a0,8(a0)
    80003dac:	ffffe097          	auipc	ra,0xffffe
    80003db0:	a54080e7          	jalr	-1452(ra) # 80001800 <_Z10sem_signalP3Sem>
}
    80003db4:	00813083          	ld	ra,8(sp)
    80003db8:	00013403          	ld	s0,0(sp)
    80003dbc:	01010113          	addi	sp,sp,16
    80003dc0:	00008067          	ret

0000000080003dc4 <_Znwm>:
void *operator new(size_t size) {
    80003dc4:	ff010113          	addi	sp,sp,-16
    80003dc8:	00113423          	sd	ra,8(sp)
    80003dcc:	00813023          	sd	s0,0(sp)
    80003dd0:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003dd4:	ffffd097          	auipc	ra,0xffffd
    80003dd8:	6c8080e7          	jalr	1736(ra) # 8000149c <_Z9mem_allocm>
}
    80003ddc:	00813083          	ld	ra,8(sp)
    80003de0:	00013403          	ld	s0,0(sp)
    80003de4:	01010113          	addi	sp,sp,16
    80003de8:	00008067          	ret

0000000080003dec <_Znam>:
void *operator new[](size_t size) {
    80003dec:	ff010113          	addi	sp,sp,-16
    80003df0:	00113423          	sd	ra,8(sp)
    80003df4:	00813023          	sd	s0,0(sp)
    80003df8:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003dfc:	ffffd097          	auipc	ra,0xffffd
    80003e00:	6a0080e7          	jalr	1696(ra) # 8000149c <_Z9mem_allocm>
}
    80003e04:	00813083          	ld	ra,8(sp)
    80003e08:	00013403          	ld	s0,0(sp)
    80003e0c:	01010113          	addi	sp,sp,16
    80003e10:	00008067          	ret

0000000080003e14 <_ZdlPv>:
void operator delete(void *mem) {
    80003e14:	ff010113          	addi	sp,sp,-16
    80003e18:	00113423          	sd	ra,8(sp)
    80003e1c:	00813023          	sd	s0,0(sp)
    80003e20:	01010413          	addi	s0,sp,16
    mem_free(mem);
    80003e24:	ffffd097          	auipc	ra,0xffffd
    80003e28:	6c0080e7          	jalr	1728(ra) # 800014e4 <_Z8mem_freePv>
}
    80003e2c:	00813083          	ld	ra,8(sp)
    80003e30:	00013403          	ld	s0,0(sp)
    80003e34:	01010113          	addi	sp,sp,16
    80003e38:	00008067          	ret

0000000080003e3c <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80003e3c:	00006797          	auipc	a5,0x6
    80003e40:	47c78793          	addi	a5,a5,1148 # 8000a2b8 <_ZTV6Thread+0x10>
    80003e44:	00f53023          	sd	a5,0(a0)
    if (myHandle->is_finished())
    80003e48:	00853503          	ld	a0,8(a0)
    bool is_finished() const { return this->status == FINISHED; }
    80003e4c:	04852703          	lw	a4,72(a0)
    80003e50:	00400793          	li	a5,4
    80003e54:	00f70463          	beq	a4,a5,80003e5c <_ZN6ThreadD1Ev+0x20>
    80003e58:	00008067          	ret
        delete myHandle;
    80003e5c:	fe050ee3          	beqz	a0,80003e58 <_ZN6ThreadD1Ev+0x1c>
Thread::~Thread() {
    80003e60:	ff010113          	addi	sp,sp,-16
    80003e64:	00113423          	sd	ra,8(sp)
    80003e68:	00813023          	sd	s0,0(sp)
    80003e6c:	01010413          	addi	s0,sp,16
        delete myHandle;
    80003e70:	00000097          	auipc	ra,0x0
    80003e74:	fa4080e7          	jalr	-92(ra) # 80003e14 <_ZdlPv>
}
    80003e78:	00813083          	ld	ra,8(sp)
    80003e7c:	00013403          	ld	s0,0(sp)
    80003e80:	01010113          	addi	sp,sp,16
    80003e84:	00008067          	ret

0000000080003e88 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80003e88:	fe010113          	addi	sp,sp,-32
    80003e8c:	00113c23          	sd	ra,24(sp)
    80003e90:	00813823          	sd	s0,16(sp)
    80003e94:	00913423          	sd	s1,8(sp)
    80003e98:	02010413          	addi	s0,sp,32
    80003e9c:	00050493          	mv	s1,a0
}
    80003ea0:	00000097          	auipc	ra,0x0
    80003ea4:	f9c080e7          	jalr	-100(ra) # 80003e3c <_ZN6ThreadD1Ev>
    80003ea8:	00048513          	mv	a0,s1
    80003eac:	00000097          	auipc	ra,0x0
    80003eb0:	f68080e7          	jalr	-152(ra) # 80003e14 <_ZdlPv>
    80003eb4:	01813083          	ld	ra,24(sp)
    80003eb8:	01013403          	ld	s0,16(sp)
    80003ebc:	00813483          	ld	s1,8(sp)
    80003ec0:	02010113          	addi	sp,sp,32
    80003ec4:	00008067          	ret

0000000080003ec8 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80003ec8:	fe010113          	addi	sp,sp,-32
    80003ecc:	00113c23          	sd	ra,24(sp)
    80003ed0:	00813823          	sd	s0,16(sp)
    80003ed4:	00913423          	sd	s1,8(sp)
    80003ed8:	02010413          	addi	s0,sp,32
    80003edc:	00050493          	mv	s1,a0
}
    80003ee0:	00000097          	auipc	ra,0x0
    80003ee4:	e54080e7          	jalr	-428(ra) # 80003d34 <_ZN9SemaphoreD1Ev>
    80003ee8:	00048513          	mv	a0,s1
    80003eec:	00000097          	auipc	ra,0x0
    80003ef0:	f28080e7          	jalr	-216(ra) # 80003e14 <_ZdlPv>
    80003ef4:	01813083          	ld	ra,24(sp)
    80003ef8:	01013403          	ld	s0,16(sp)
    80003efc:	00813483          	ld	s1,8(sp)
    80003f00:	02010113          	addi	sp,sp,32
    80003f04:	00008067          	ret

0000000080003f08 <_ZdaPv>:
void operator delete[](void *mem) {
    80003f08:	ff010113          	addi	sp,sp,-16
    80003f0c:	00113423          	sd	ra,8(sp)
    80003f10:	00813023          	sd	s0,0(sp)
    80003f14:	01010413          	addi	s0,sp,16
    mem_free(mem);
    80003f18:	ffffd097          	auipc	ra,0xffffd
    80003f1c:	5cc080e7          	jalr	1484(ra) # 800014e4 <_Z8mem_freePv>
}
    80003f20:	00813083          	ld	ra,8(sp)
    80003f24:	00013403          	ld	s0,0(sp)
    80003f28:	01010113          	addi	sp,sp,16
    80003f2c:	00008067          	ret

0000000080003f30 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80003f30:	ff010113          	addi	sp,sp,-16
    80003f34:	00813423          	sd	s0,8(sp)
    80003f38:	01010413          	addi	s0,sp,16
    80003f3c:	00006797          	auipc	a5,0x6
    80003f40:	37c78793          	addi	a5,a5,892 # 8000a2b8 <_ZTV6Thread+0x10>
    80003f44:	00f53023          	sd	a5,0(a0)
    this->body = body;
    80003f48:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    80003f4c:	00c53c23          	sd	a2,24(a0)
}
    80003f50:	00813403          	ld	s0,8(sp)
    80003f54:	01010113          	addi	sp,sp,16
    80003f58:	00008067          	ret

0000000080003f5c <_ZN6Thread5startEv>:
int Thread::start() {
    80003f5c:	ff010113          	addi	sp,sp,-16
    80003f60:	00113423          	sd	ra,8(sp)
    80003f64:	00813023          	sd	s0,0(sp)
    80003f68:	01010413          	addi	s0,sp,16
    return thread_create(&myHandle, &threadStart, this);
    80003f6c:	00050613          	mv	a2,a0
    80003f70:	00000597          	auipc	a1,0x0
    80003f74:	d8458593          	addi	a1,a1,-636 # 80003cf4 <_ZN6Thread11threadStartEPv>
    80003f78:	00850513          	addi	a0,a0,8
    80003f7c:	ffffd097          	auipc	ra,0xffffd
    80003f80:	5a8080e7          	jalr	1448(ra) # 80001524 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80003f84:	00813083          	ld	ra,8(sp)
    80003f88:	00013403          	ld	s0,0(sp)
    80003f8c:	01010113          	addi	sp,sp,16
    80003f90:	00008067          	ret

0000000080003f94 <_ZN6Thread4joinEv>:
void Thread::join() {
    80003f94:	ff010113          	addi	sp,sp,-16
    80003f98:	00113423          	sd	ra,8(sp)
    80003f9c:	00813023          	sd	s0,0(sp)
    80003fa0:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80003fa4:	00853503          	ld	a0,8(a0)
    80003fa8:	ffffd097          	auipc	ra,0xffffd
    80003fac:	674080e7          	jalr	1652(ra) # 8000161c <_Z11thread_joinP3TCB>
}
    80003fb0:	00813083          	ld	ra,8(sp)
    80003fb4:	00013403          	ld	s0,0(sp)
    80003fb8:	01010113          	addi	sp,sp,16
    80003fbc:	00008067          	ret

0000000080003fc0 <_ZN6Thread4joinEm>:
void Thread::join(time_t time) {
    80003fc0:	ff010113          	addi	sp,sp,-16
    80003fc4:	00113423          	sd	ra,8(sp)
    80003fc8:	00813023          	sd	s0,0(sp)
    80003fcc:	01010413          	addi	s0,sp,16
    thread_join(myHandle, time);
    80003fd0:	00853503          	ld	a0,8(a0)
    80003fd4:	ffffd097          	auipc	ra,0xffffd
    80003fd8:	684080e7          	jalr	1668(ra) # 80001658 <_Z11thread_joinP3TCBm>
}
    80003fdc:	00813083          	ld	ra,8(sp)
    80003fe0:	00013403          	ld	s0,0(sp)
    80003fe4:	01010113          	addi	sp,sp,16
    80003fe8:	00008067          	ret

0000000080003fec <_ZN6Thread4killEPS_>:
int Thread::kill(Thread *thread) {
    80003fec:	ff010113          	addi	sp,sp,-16
    80003ff0:	00113423          	sd	ra,8(sp)
    80003ff4:	00813023          	sd	s0,0(sp)
    80003ff8:	01010413          	addi	s0,sp,16
    return thread_kill(thread->myHandle);
    80003ffc:	00853503          	ld	a0,8(a0)
    80004000:	ffffd097          	auipc	ra,0xffffd
    80004004:	6fc080e7          	jalr	1788(ra) # 800016fc <_Z11thread_killP3TCB>
}
    80004008:	00813083          	ld	ra,8(sp)
    8000400c:	00013403          	ld	s0,0(sp)
    80004010:	01010113          	addi	sp,sp,16
    80004014:	00008067          	ret

0000000080004018 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80004018:	ff010113          	addi	sp,sp,-16
    8000401c:	00113423          	sd	ra,8(sp)
    80004020:	00813023          	sd	s0,0(sp)
    80004024:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80004028:	ffffd097          	auipc	ra,0xffffd
    8000402c:	5b8080e7          	jalr	1464(ra) # 800015e0 <_Z15thread_dispatchv>
}
    80004030:	00813083          	ld	ra,8(sp)
    80004034:	00013403          	ld	s0,0(sp)
    80004038:	01010113          	addi	sp,sp,16
    8000403c:	00008067          	ret

0000000080004040 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t ms) {
    80004040:	ff010113          	addi	sp,sp,-16
    80004044:	00113423          	sd	ra,8(sp)
    80004048:	00813023          	sd	s0,0(sp)
    8000404c:	01010413          	addi	s0,sp,16
    return time_sleep(ms);
    80004050:	ffffe097          	auipc	ra,0xffffe
    80004054:	870080e7          	jalr	-1936(ra) # 800018c0 <_Z10time_sleepm>
}
    80004058:	00813083          	ld	ra,8(sp)
    8000405c:	00013403          	ld	s0,0(sp)
    80004060:	01010113          	addi	sp,sp,16
    80004064:	00008067          	ret

0000000080004068 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80004068:	ff010113          	addi	sp,sp,-16
    8000406c:	00813423          	sd	s0,8(sp)
    80004070:	01010413          	addi	s0,sp,16
    80004074:	00006797          	auipc	a5,0x6
    80004078:	24478793          	addi	a5,a5,580 # 8000a2b8 <_ZTV6Thread+0x10>
    8000407c:	00f53023          	sd	a5,0(a0)
    this->body = nullptr;
    80004080:	00053823          	sd	zero,16(a0)
    this->arg = nullptr;
    80004084:	00053c23          	sd	zero,24(a0)
}
    80004088:	00813403          	ld	s0,8(sp)
    8000408c:	01010113          	addi	sp,sp,16
    80004090:	00008067          	ret

0000000080004094 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80004094:	ff010113          	addi	sp,sp,-16
    80004098:	00113423          	sd	ra,8(sp)
    8000409c:	00813023          	sd	s0,0(sp)
    800040a0:	01010413          	addi	s0,sp,16
    800040a4:	00006797          	auipc	a5,0x6
    800040a8:	23c78793          	addi	a5,a5,572 # 8000a2e0 <_ZTV9Semaphore+0x10>
    800040ac:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    800040b0:	00850513          	addi	a0,a0,8
    800040b4:	ffffd097          	auipc	ra,0xffffd
    800040b8:	688080e7          	jalr	1672(ra) # 8000173c <_Z8sem_openPP3Semj>
}
    800040bc:	00813083          	ld	ra,8(sp)
    800040c0:	00013403          	ld	s0,0(sp)
    800040c4:	01010113          	addi	sp,sp,16
    800040c8:	00008067          	ret

00000000800040cc <_ZN9Semaphore15signal_and_waitERS_S0_>:

int Semaphore::signal_and_wait(Semaphore &sem1, Semaphore &sem2) {
    800040cc:	ff010113          	addi	sp,sp,-16
    800040d0:	00113423          	sd	ra,8(sp)
    800040d4:	00813023          	sd	s0,0(sp)
    800040d8:	01010413          	addi	s0,sp,16
    return ::signal_and_wait(sem1.myHandle, sem2.myHandle);
    800040dc:	0085b583          	ld	a1,8(a1)
    800040e0:	00853503          	ld	a0,8(a0)
    800040e4:	ffffd097          	auipc	ra,0xffffd
    800040e8:	79c080e7          	jalr	1948(ra) # 80001880 <_Z15signal_and_waitP3SemS0_>
}
    800040ec:	00813083          	ld	ra,8(sp)
    800040f0:	00013403          	ld	s0,0(sp)
    800040f4:	01010113          	addi	sp,sp,16
    800040f8:	00008067          	ret

00000000800040fc <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate() {
    800040fc:	ff010113          	addi	sp,sp,-16
    80004100:	00113423          	sd	ra,8(sp)
    80004104:	00813023          	sd	s0,0(sp)
    80004108:	01010413          	addi	s0,sp,16
    thread_exit();
    8000410c:	ffffd097          	auipc	ra,0xffffd
    80004110:	494080e7          	jalr	1172(ra) # 800015a0 <_Z11thread_exitv>
}
    80004114:	00813083          	ld	ra,8(sp)
    80004118:	00013403          	ld	s0,0(sp)
    8000411c:	01010113          	addi	sp,sp,16
    80004120:	00008067          	ret

0000000080004124 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    80004124:	fe010113          	addi	sp,sp,-32
    80004128:	00113c23          	sd	ra,24(sp)
    8000412c:	00813823          	sd	s0,16(sp)
    80004130:	00913423          	sd	s1,8(sp)
    80004134:	01213023          	sd	s2,0(sp)
    80004138:	02010413          	addi	s0,sp,32
    8000413c:	00050493          	mv	s1,a0
    80004140:	00058913          	mv	s2,a1
    80004144:	00000097          	auipc	ra,0x0
    80004148:	f24080e7          	jalr	-220(ra) # 80004068 <_ZN6ThreadC1Ev>
    8000414c:	00006797          	auipc	a5,0x6
    80004150:	13c78793          	addi	a5,a5,316 # 8000a288 <_ZTV14PeriodicThread+0x10>
    80004154:	00f4b023          	sd	a5,0(s1)
    this->period = period;
    80004158:	0324b023          	sd	s2,32(s1)
}
    8000415c:	01813083          	ld	ra,24(sp)
    80004160:	01013403          	ld	s0,16(sp)
    80004164:	00813483          	ld	s1,8(sp)
    80004168:	00013903          	ld	s2,0(sp)
    8000416c:	02010113          	addi	sp,sp,32
    80004170:	00008067          	ret

0000000080004174 <_ZN7Console4getcEv>:

char Console::getc() {
    80004174:	ff010113          	addi	sp,sp,-16
    80004178:	00113423          	sd	ra,8(sp)
    8000417c:	00813023          	sd	s0,0(sp)
    80004180:	01010413          	addi	s0,sp,16
    return getc();
    80004184:	00000097          	auipc	ra,0x0
    80004188:	ff0080e7          	jalr	-16(ra) # 80004174 <_ZN7Console4getcEv>
}
    8000418c:	00813083          	ld	ra,8(sp)
    80004190:	00013403          	ld	s0,0(sp)
    80004194:	01010113          	addi	sp,sp,16
    80004198:	00008067          	ret

000000008000419c <_ZN7Console4putcEc>:

void Console::putc(char c) {
    8000419c:	ff010113          	addi	sp,sp,-16
    800041a0:	00113423          	sd	ra,8(sp)
    800041a4:	00813023          	sd	s0,0(sp)
    800041a8:	01010413          	addi	s0,sp,16
    putc(c);
    800041ac:	00000097          	auipc	ra,0x0
    800041b0:	ff0080e7          	jalr	-16(ra) # 8000419c <_ZN7Console4putcEc>
    800041b4:	00813083          	ld	ra,8(sp)
    800041b8:	00013403          	ld	s0,0(sp)
    800041bc:	01010113          	addi	sp,sp,16
    800041c0:	00008067          	ret

00000000800041c4 <_ZN6Thread3runEv>:
    static void threadStart(void *);

protected:
    Thread();

    virtual void run() {}
    800041c4:	ff010113          	addi	sp,sp,-16
    800041c8:	00813423          	sd	s0,8(sp)
    800041cc:	01010413          	addi	s0,sp,16
    800041d0:	00813403          	ld	s0,8(sp)
    800041d4:	01010113          	addi	sp,sp,16
    800041d8:	00008067          	ret

00000000800041dc <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    explicit PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    800041dc:	ff010113          	addi	sp,sp,-16
    800041e0:	00813423          	sd	s0,8(sp)
    800041e4:	01010413          	addi	s0,sp,16
    800041e8:	00813403          	ld	s0,8(sp)
    800041ec:	01010113          	addi	sp,sp,16
    800041f0:	00008067          	ret

00000000800041f4 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800041f4:	ff010113          	addi	sp,sp,-16
    800041f8:	00113423          	sd	ra,8(sp)
    800041fc:	00813023          	sd	s0,0(sp)
    80004200:	01010413          	addi	s0,sp,16
    80004204:	00006797          	auipc	a5,0x6
    80004208:	08478793          	addi	a5,a5,132 # 8000a288 <_ZTV14PeriodicThread+0x10>
    8000420c:	00f53023          	sd	a5,0(a0)
    80004210:	00000097          	auipc	ra,0x0
    80004214:	c2c080e7          	jalr	-980(ra) # 80003e3c <_ZN6ThreadD1Ev>
    80004218:	00813083          	ld	ra,8(sp)
    8000421c:	00013403          	ld	s0,0(sp)
    80004220:	01010113          	addi	sp,sp,16
    80004224:	00008067          	ret

0000000080004228 <_ZN14PeriodicThreadD0Ev>:
    80004228:	fe010113          	addi	sp,sp,-32
    8000422c:	00113c23          	sd	ra,24(sp)
    80004230:	00813823          	sd	s0,16(sp)
    80004234:	00913423          	sd	s1,8(sp)
    80004238:	02010413          	addi	s0,sp,32
    8000423c:	00050493          	mv	s1,a0
    80004240:	00006797          	auipc	a5,0x6
    80004244:	04878793          	addi	a5,a5,72 # 8000a288 <_ZTV14PeriodicThread+0x10>
    80004248:	00f53023          	sd	a5,0(a0)
    8000424c:	00000097          	auipc	ra,0x0
    80004250:	bf0080e7          	jalr	-1040(ra) # 80003e3c <_ZN6ThreadD1Ev>
    80004254:	00048513          	mv	a0,s1
    80004258:	00000097          	auipc	ra,0x0
    8000425c:	bbc080e7          	jalr	-1092(ra) # 80003e14 <_ZdlPv>
    80004260:	01813083          	ld	ra,24(sp)
    80004264:	01013403          	ld	s0,16(sp)
    80004268:	00813483          	ld	s1,8(sp)
    8000426c:	02010113          	addi	sp,sp,32
    80004270:	00008067          	ret

0000000080004274 <_ZN5Riscv20handleSupervisorTrapEmmmmm>:
        reinterpret_cast<Riscv::syscall_f>(Cradle::_thread_wake),
        reinterpret_cast<Riscv::syscall_f>(IO::_getc),
        reinterpret_cast<Riscv::syscall_f>(IO::_putc)
};

void Riscv::handleSupervisorTrap(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    80004274:	f9010113          	addi	sp,sp,-112
    80004278:	06113423          	sd	ra,104(sp)
    8000427c:	06813023          	sd	s0,96(sp)
    80004280:	04913c23          	sd	s1,88(sp)
    80004284:	05213823          	sd	s2,80(sp)
    80004288:	05313423          	sd	s3,72(sp)
    8000428c:	05413023          	sd	s4,64(sp)
    80004290:	03513c23          	sd	s5,56(sp)
    80004294:	03613823          	sd	s6,48(sp)
    80004298:	03713423          	sd	s7,40(sp)
    8000429c:	07010413          	addi	s0,sp,112
    800042a0:	00050493          	mv	s1,a0
    800042a4:	00058993          	mv	s3,a1
    800042a8:	00060a13          	mv	s4,a2
    800042ac:	00068a93          	mv	s5,a3
    800042b0:	00070b13          	mv	s6,a4
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800042b4:	100027f3          	csrr	a5,sstatus
    800042b8:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    800042bc:	fa843b83          	ld	s7,-88(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800042c0:	141027f3          	csrr	a5,sepc
    800042c4:	faf43023          	sd	a5,-96(s0)
    return sepc;
    800042c8:	fa043903          	ld	s2,-96(s0)
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    800042cc:	142027f3          	csrr	a5,scause
    800042d0:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    800042d4:	f9843703          	ld	a4,-104(s0)
    uint64 sstatus = r_sstatus();
    uint64 sepc = r_sepc();
    if (r_scause() == ILLEGAL_INSTRUCTION) {
    800042d8:	00200793          	li	a5,2
    800042dc:	06f70263          	beq	a4,a5,80004340 <_ZN5Riscv20handleSupervisorTrapEmmmmm+0xcc>
        print("\nIllegal Instruction\n");
        TCB::_thread_exit();
    }
    syscall_table[code](arg1, arg2, arg3, arg4);
    800042e0:	00349493          	slli	s1,s1,0x3
    800042e4:	00006797          	auipc	a5,0x6
    800042e8:	01c78793          	addi	a5,a5,28 # 8000a300 <_ZN5Riscv13syscall_tableE>
    800042ec:	009784b3          	add	s1,a5,s1
    800042f0:	0004b783          	ld	a5,0(s1)
    800042f4:	000b0693          	mv	a3,s6
    800042f8:	000a8613          	mv	a2,s5
    800042fc:	000a0593          	mv	a1,s4
    80004300:	00098513          	mv	a0,s3
    80004304:	000780e7          	jalr	a5
    w_sepc(sepc + 4);
    80004308:	00490793          	addi	a5,s2,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000430c:	14179073          	csrw	sepc,a5
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80004310:	100b9073          	csrw	sstatus,s7
    w_sstatus(sstatus);
}
    80004314:	06813083          	ld	ra,104(sp)
    80004318:	06013403          	ld	s0,96(sp)
    8000431c:	05813483          	ld	s1,88(sp)
    80004320:	05013903          	ld	s2,80(sp)
    80004324:	04813983          	ld	s3,72(sp)
    80004328:	04013a03          	ld	s4,64(sp)
    8000432c:	03813a83          	ld	s5,56(sp)
    80004330:	03013b03          	ld	s6,48(sp)
    80004334:	02813b83          	ld	s7,40(sp)
    80004338:	07010113          	addi	sp,sp,112
    8000433c:	00008067          	ret
        print("\nIllegal Instruction\n");
    80004340:	00004517          	auipc	a0,0x4
    80004344:	d9050513          	addi	a0,a0,-624 # 800080d0 <_ZN3stm4coutE+0x38>
    80004348:	ffffe097          	auipc	ra,0xffffe
    8000434c:	360080e7          	jalr	864(ra) # 800026a8 <_Z5printPKc>
        TCB::_thread_exit();
    80004350:	00001097          	auipc	ra,0x1
    80004354:	d5c080e7          	jalr	-676(ra) # 800050ac <_ZN3TCB12_thread_exitEv>
    80004358:	f89ff06f          	j	800042e0 <_ZN5Riscv20handleSupervisorTrapEmmmmm+0x6c>

000000008000435c <_ZN5Riscv15handleTimerTrapEv>:


void Riscv::handleTimerTrap() {
    8000435c:	fd010113          	addi	sp,sp,-48
    80004360:	02113423          	sd	ra,40(sp)
    80004364:	02813023          	sd	s0,32(sp)
    80004368:	00913c23          	sd	s1,24(sp)
    8000436c:	01213823          	sd	s2,16(sp)
    80004370:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80004374:	100027f3          	csrr	a5,sstatus
    80004378:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    8000437c:	fd843483          	ld	s1,-40(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80004380:	141027f3          	csrr	a5,sepc
    80004384:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80004388:	fd043903          	ld	s2,-48(s0)
    uint64 sstatus = r_sstatus();
    uint64 sepc = r_sepc();
    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IO::Output.is_empty()) {
    8000438c:	00006797          	auipc	a5,0x6
    80004390:	0847b783          	ld	a5,132(a5) # 8000a410 <_GLOBAL_OFFSET_TABLE_+0x18>
    80004394:	0007b783          	ld	a5,0(a5)
    80004398:	0007c783          	lbu	a5,0(a5)
    8000439c:	0207f793          	andi	a5,a5,32
    800043a0:	02078c63          	beqz	a5,800043d8 <_ZN5Riscv15handleTimerTrapEv+0x7c>
    800043a4:	00006797          	auipc	a5,0x6
    800043a8:	0647b783          	ld	a5,100(a5) # 8000a408 <_GLOBAL_OFFSET_TABLE_+0x10>
    800043ac:	0107a783          	lw	a5,16(a5)
    800043b0:	02078463          	beqz	a5,800043d8 <_ZN5Riscv15handleTimerTrapEv+0x7c>
        char c = IO::Output.get();
    800043b4:	00006517          	auipc	a0,0x6
    800043b8:	05453503          	ld	a0,84(a0) # 8000a408 <_GLOBAL_OFFSET_TABLE_+0x10>
    800043bc:	ffffe097          	auipc	ra,0xffffe
    800043c0:	584080e7          	jalr	1412(ra) # 80002940 <_ZN8IOBuffer3getEv>
        *(volatile char *) CONSOLE_TX_DATA = c;
    800043c4:	00006797          	auipc	a5,0x6
    800043c8:	07c7b783          	ld	a5,124(a5) # 8000a440 <_GLOBAL_OFFSET_TABLE_+0x48>
    800043cc:	0007b783          	ld	a5,0(a5)
    800043d0:	00a78023          	sb	a0,0(a5)
    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IO::Output.is_empty()) {
    800043d4:	fb9ff06f          	j	8000438c <_ZN5Riscv15handleTimerTrapEv+0x30>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800043d8:	00200793          	li	a5,2
    800043dc:	1447b073          	csrc	sip,a5
    }
    mc_sip(SIP_SSIE);
    Cradle::update();
    800043e0:	fffff097          	auipc	ra,0xfffff
    800043e4:	a3c080e7          	jalr	-1476(ra) # 80002e1c <_ZN6Cradle6updateEv>
    800043e8:	0580006f          	j	80004440 <_ZN5Riscv15handleTimerTrapEv+0xe4>
        if (next->is_joined() || next->is_sleeping()) {
            next->run();
            Scheduler::put(next);
        }
    }
    TCB::timer_counter++;
    800043ec:	00006717          	auipc	a4,0x6
    800043f0:	08c73703          	ld	a4,140(a4) # 8000a478 <_GLOBAL_OFFSET_TABLE_+0x80>
    800043f4:	00073783          	ld	a5,0(a4)
    800043f8:	00178793          	addi	a5,a5,1
    800043fc:	00f73023          	sd	a5,0(a4)
    if ((time_t) TCB::timer_counter >= TCB::running->get_time_slice() && !Scheduler::is_empty()) {
    80004400:	00006717          	auipc	a4,0x6
    80004404:	06873703          	ld	a4,104(a4) # 8000a468 <_GLOBAL_OFFSET_TABLE_+0x70>
    80004408:	00073703          	ld	a4,0(a4)

    void set_preempted() { this->preempted = true; }

    void reset_preempted() { this->preempted = false; }

    time_t get_time_slice() const { return this->time_slice; }
    8000440c:	05073683          	ld	a3,80(a4)
    80004410:	06d7f463          	bgeu	a5,a3,80004478 <_ZN5Riscv15handleTimerTrapEv+0x11c>
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80004414:	14191073          	csrw	sepc,s2
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80004418:	10049073          	csrw	sstatus,s1
        TCB::running->set_preempted();
        TCB::_thread_dispatch();
    }
    w_sepc(sepc);
    w_sstatus(sstatus);
}
    8000441c:	02813083          	ld	ra,40(sp)
    80004420:	02013403          	ld	s0,32(sp)
    80004424:	01813483          	ld	s1,24(sp)
    80004428:	01013903          	ld	s2,16(sp)
    8000442c:	03010113          	addi	sp,sp,48
    80004430:	00008067          	ret
    void run() { this->status = RUNNABLE; }
    80004434:	04052423          	sw	zero,72(a0)
            Scheduler::put(next);
    80004438:	00000097          	auipc	ra,0x0
    8000443c:	2c4080e7          	jalr	708(ra) # 800046fc <_ZN9Scheduler3putEP3TCB>
    while (!Cradle::is_empty() && Cradle::peak() == 0) {
    80004440:	fffff097          	auipc	ra,0xfffff
    80004444:	a3c080e7          	jalr	-1476(ra) # 80002e7c <_ZN6Cradle8is_emptyEv>
    80004448:	fa0512e3          	bnez	a0,800043ec <_ZN5Riscv15handleTimerTrapEv+0x90>
    8000444c:	fffff097          	auipc	ra,0xfffff
    80004450:	a00080e7          	jalr	-1536(ra) # 80002e4c <_ZN6Cradle4peakEv>
    80004454:	f8051ce3          	bnez	a0,800043ec <_ZN5Riscv15handleTimerTrapEv+0x90>
        thread_t next = Cradle::remove();
    80004458:	fffff097          	auipc	ra,0xfffff
    8000445c:	974080e7          	jalr	-1676(ra) # 80002dcc <_ZN6Cradle6removeEv>
    bool is_joined() const { return this->status == JOINED; }
    80004460:	04852783          	lw	a5,72(a0)
        if (next->is_joined() || next->is_sleeping()) {
    80004464:	00300713          	li	a4,3
    80004468:	fce786e3          	beq	a5,a4,80004434 <_ZN5Riscv15handleTimerTrapEv+0xd8>
    8000446c:	00200713          	li	a4,2
    80004470:	fce798e3          	bne	a5,a4,80004440 <_ZN5Riscv15handleTimerTrapEv+0xe4>
    80004474:	fc1ff06f          	j	80004434 <_ZN5Riscv15handleTimerTrapEv+0xd8>
    80004478:	00006797          	auipc	a5,0x6
    8000447c:	0087b783          	ld	a5,8(a5) # 8000a480 <_GLOBAL_OFFSET_TABLE_+0x88>
    80004480:	0107a783          	lw	a5,16(a5)
    static void put(TCB *thread);

    static TCB *get();

    static inline bool is_empty() {
        return high_priority.is_empty() && mid_priority.is_empty() && low_priority.is_empty();
    80004484:	02079263          	bnez	a5,800044a8 <_ZN5Riscv15handleTimerTrapEv+0x14c>
    80004488:	00006797          	auipc	a5,0x6
    8000448c:	fd87b783          	ld	a5,-40(a5) # 8000a460 <_GLOBAL_OFFSET_TABLE_+0x68>
    80004490:	0107a783          	lw	a5,16(a5)
    80004494:	00079a63          	bnez	a5,800044a8 <_ZN5Riscv15handleTimerTrapEv+0x14c>
    80004498:	00006797          	auipc	a5,0x6
    8000449c:	fa07b783          	ld	a5,-96(a5) # 8000a438 <_GLOBAL_OFFSET_TABLE_+0x40>
    800044a0:	0107a783          	lw	a5,16(a5)
    800044a4:	f60788e3          	beqz	a5,80004414 <_ZN5Riscv15handleTimerTrapEv+0xb8>
        TCB::timer_counter = 0;
    800044a8:	00006797          	auipc	a5,0x6
    800044ac:	fd07b783          	ld	a5,-48(a5) # 8000a478 <_GLOBAL_OFFSET_TABLE_+0x80>
    800044b0:	0007b023          	sd	zero,0(a5)
    void set_preempted() { this->preempted = true; }
    800044b4:	00100793          	li	a5,1
    800044b8:	04f70c23          	sb	a5,88(a4)
        TCB::_thread_dispatch();
    800044bc:	00001097          	auipc	ra,0x1
    800044c0:	bb8080e7          	jalr	-1096(ra) # 80005074 <_ZN3TCB16_thread_dispatchEv>
    800044c4:	f51ff06f          	j	80004414 <_ZN5Riscv15handleTimerTrapEv+0xb8>

00000000800044c8 <_ZN5Riscv17handleConsoleTrapEv>:

void Riscv::handleConsoleTrap() {
    800044c8:	fc010113          	addi	sp,sp,-64
    800044cc:	02113c23          	sd	ra,56(sp)
    800044d0:	02813823          	sd	s0,48(sp)
    800044d4:	02913423          	sd	s1,40(sp)
    800044d8:	03213023          	sd	s2,32(sp)
    800044dc:	04010413          	addi	s0,sp,64
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800044e0:	141027f3          	csrr	a5,sepc
    800044e4:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    800044e8:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800044ec:	100027f3          	csrr	a5,sstatus
    800044f0:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    800044f4:	fd043483          	ld	s1,-48(s0)
    uint64 sepc = r_sepc();
    uint64 sstatuc = r_sstatus();
    if (plic_claim() == CONSOLE_IRQ) {
    800044f8:	00001097          	auipc	ra,0x1
    800044fc:	71c080e7          	jalr	1820(ra) # 80005c14 <plic_claim>
    80004500:	00a00793          	li	a5,10
    80004504:	02f50263          	beq	a0,a5,80004528 <_ZN5Riscv17handleConsoleTrapEv+0x60>
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80004508:	14191073          	csrw	sepc,s2
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    8000450c:	10049073          	csrw	sstatus,s1
        }
        plic_complete(CONSOLE_IRQ);
    }
    w_sepc(sepc);
    w_sstatus(sstatuc);
}
    80004510:	03813083          	ld	ra,56(sp)
    80004514:	03013403          	ld	s0,48(sp)
    80004518:	02813483          	ld	s1,40(sp)
    8000451c:	02013903          	ld	s2,32(sp)
    80004520:	04010113          	addi	sp,sp,64
    80004524:	00008067          	ret
        if ((*((char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
    80004528:	00006797          	auipc	a5,0x6
    8000452c:	ee87b783          	ld	a5,-280(a5) # 8000a410 <_GLOBAL_OFFSET_TABLE_+0x18>
    80004530:	0007b783          	ld	a5,0(a5)
    80004534:	0007c783          	lbu	a5,0(a5)
    80004538:	0017f793          	andi	a5,a5,1
    8000453c:	00079a63          	bnez	a5,80004550 <_ZN5Riscv17handleConsoleTrapEv+0x88>
        plic_complete(CONSOLE_IRQ);
    80004540:	00a00513          	li	a0,10
    80004544:	00001097          	auipc	ra,0x1
    80004548:	708080e7          	jalr	1800(ra) # 80005c4c <plic_complete>
    8000454c:	fbdff06f          	j	80004508 <_ZN5Riscv17handleConsoleTrapEv+0x40>
            volatile char c = *(char *) CONSOLE_RX_DATA;
    80004550:	00006797          	auipc	a5,0x6
    80004554:	eb07b783          	ld	a5,-336(a5) # 8000a400 <_GLOBAL_OFFSET_TABLE_+0x8>
    80004558:	0007b783          	ld	a5,0(a5)
    8000455c:	0007c783          	lbu	a5,0(a5)
    80004560:	fcf407a3          	sb	a5,-49(s0)
            IO::Input.put(c);
    80004564:	fcf44583          	lbu	a1,-49(s0)
    80004568:	0ff5f593          	andi	a1,a1,255
    8000456c:	00006517          	auipc	a0,0x6
    80004570:	ee453503          	ld	a0,-284(a0) # 8000a450 <_GLOBAL_OFFSET_TABLE_+0x58>
    80004574:	ffffe097          	auipc	ra,0xffffe
    80004578:	440080e7          	jalr	1088(ra) # 800029b4 <_ZN8IOBuffer3putEc>
    8000457c:	fc5ff06f          	j	80004540 <_ZN5Riscv17handleConsoleTrapEv+0x78>

0000000080004580 <_ZN5Riscv10popSppSpieEv>:

void Riscv::popSppSpie() {
    80004580:	ff010113          	addi	sp,sp,-16
    80004584:	00813423          	sd	s0,8(sp)
    80004588:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000458c:	10000793          	li	a5,256
    80004590:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    80004594:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80004598:	10200073          	sret
}
    8000459c:	00813403          	ld	s0,8(sp)
    800045a0:	01010113          	addi	sp,sp,16
    800045a4:	00008067          	ret

00000000800045a8 <_ZN5Riscv14handleReadTrapEv>:


__attribute__((unused))
void Riscv::handleReadTrap() {
    800045a8:	ff010113          	addi	sp,sp,-16
    800045ac:	00813423          	sd	s0,8(sp)
    800045b0:	01010413          	addi	s0,sp,16
    *(volatile char *) CONSOLE_TX_DATA = '!';
    800045b4:	00006797          	auipc	a5,0x6
    800045b8:	e8c7b783          	ld	a5,-372(a5) # 8000a440 <_GLOBAL_OFFSET_TABLE_+0x48>
    800045bc:	0007b783          	ld	a5,0(a5)
    800045c0:	02100713          	li	a4,33
    800045c4:	00e78023          	sb	a4,0(a5)
    *(volatile char *) CONSOLE_TX_DATA = 'r';
    800045c8:	07200713          	li	a4,114
    800045cc:	00e78023          	sb	a4,0(a5)
}
    800045d0:	00813403          	ld	s0,8(sp)
    800045d4:	01010113          	addi	sp,sp,16
    800045d8:	00008067          	ret

00000000800045dc <_ZN5Riscv15handleWriteTrapEv>:


__attribute__((unused))
void Riscv::handleWriteTrap() {
    800045dc:	ff010113          	addi	sp,sp,-16
    800045e0:	00813423          	sd	s0,8(sp)
    800045e4:	01010413          	addi	s0,sp,16
    *(volatile char *) CONSOLE_TX_DATA = '!';
    800045e8:	00006797          	auipc	a5,0x6
    800045ec:	e587b783          	ld	a5,-424(a5) # 8000a440 <_GLOBAL_OFFSET_TABLE_+0x48>
    800045f0:	0007b783          	ld	a5,0(a5)
    800045f4:	02100713          	li	a4,33
    800045f8:	00e78023          	sb	a4,0(a5)
    *(volatile char *) CONSOLE_TX_DATA = 'w';
    800045fc:	07700713          	li	a4,119
    80004600:	00e78023          	sb	a4,0(a5)
    80004604:	00813403          	ld	s0,8(sp)
    80004608:	01010113          	addi	sp,sp,16
    8000460c:	00008067          	ret

0000000080004610 <_ZN9Scheduler3getEv>:
    } else {
        Scheduler::low_priority.put(thread);
    }
}

TCB *Scheduler::get() {
    80004610:	ff010113          	addi	sp,sp,-16
    80004614:	00113423          	sd	ra,8(sp)
    80004618:	00813023          	sd	s0,0(sp)
    8000461c:	01010413          	addi	s0,sp,16
    80004620:	00006797          	auipc	a5,0x6
    80004624:	f287a783          	lw	a5,-216(a5) # 8000a548 <_ZN9Scheduler13high_priorityE+0x10>
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.get();
    80004628:	02079863          	bnez	a5,80004658 <_ZN9Scheduler3getEv+0x48>
    8000462c:	00006797          	auipc	a5,0x6
    80004630:	f347a783          	lw	a5,-204(a5) # 8000a560 <_ZN9Scheduler12mid_priorityE+0x10>
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.get();
    80004634:	02078c63          	beqz	a5,8000466c <_ZN9Scheduler3getEv+0x5c>
    80004638:	00006517          	auipc	a0,0x6
    8000463c:	f1850513          	addi	a0,a0,-232 # 8000a550 <_ZN9Scheduler12mid_priorityE>
    80004640:	ffffe097          	auipc	ra,0xffffe
    80004644:	ec0080e7          	jalr	-320(ra) # 80002500 <_ZN3stm14CircularBufferIP3TCBE3getEv>
    return Scheduler::low_priority.get();
}
    80004648:	00813083          	ld	ra,8(sp)
    8000464c:	00013403          	ld	s0,0(sp)
    80004650:	01010113          	addi	sp,sp,16
    80004654:	00008067          	ret
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.get();
    80004658:	00006517          	auipc	a0,0x6
    8000465c:	ee050513          	addi	a0,a0,-288 # 8000a538 <_ZN9Scheduler13high_priorityE>
    80004660:	ffffe097          	auipc	ra,0xffffe
    80004664:	ea0080e7          	jalr	-352(ra) # 80002500 <_ZN3stm14CircularBufferIP3TCBE3getEv>
    80004668:	fe1ff06f          	j	80004648 <_ZN9Scheduler3getEv+0x38>
    return Scheduler::low_priority.get();
    8000466c:	00006517          	auipc	a0,0x6
    80004670:	efc50513          	addi	a0,a0,-260 # 8000a568 <_ZN9Scheduler12low_priorityE>
    80004674:	ffffe097          	auipc	ra,0xffffe
    80004678:	e8c080e7          	jalr	-372(ra) # 80002500 <_ZN3stm14CircularBufferIP3TCBE3getEv>
    8000467c:	fcdff06f          	j	80004648 <_ZN9Scheduler3getEv+0x38>

0000000080004680 <_ZN9Scheduler4peekEv>:

TCB *Scheduler::peek() {
    80004680:	ff010113          	addi	sp,sp,-16
    80004684:	00113423          	sd	ra,8(sp)
    80004688:	00813023          	sd	s0,0(sp)
    8000468c:	01010413          	addi	s0,sp,16
    80004690:	00006797          	auipc	a5,0x6
    80004694:	eb87a783          	lw	a5,-328(a5) # 8000a548 <_ZN9Scheduler13high_priorityE+0x10>
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.peek();
    80004698:	02078463          	beqz	a5,800046c0 <_ZN9Scheduler4peekEv+0x40>
    8000469c:	00006517          	auipc	a0,0x6
    800046a0:	e9c50513          	addi	a0,a0,-356 # 8000a538 <_ZN9Scheduler13high_priorityE>
    800046a4:	00000097          	auipc	ra,0x0
    800046a8:	100080e7          	jalr	256(ra) # 800047a4 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    800046ac:	00053503          	ld	a0,0(a0)
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.peek();
    return Scheduler::low_priority.peek();
}
    800046b0:	00813083          	ld	ra,8(sp)
    800046b4:	00013403          	ld	s0,0(sp)
    800046b8:	01010113          	addi	sp,sp,16
    800046bc:	00008067          	ret
    800046c0:	00006797          	auipc	a5,0x6
    800046c4:	ea07a783          	lw	a5,-352(a5) # 8000a560 <_ZN9Scheduler12mid_priorityE+0x10>
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.peek();
    800046c8:	00078e63          	beqz	a5,800046e4 <_ZN9Scheduler4peekEv+0x64>
    800046cc:	00006517          	auipc	a0,0x6
    800046d0:	e8450513          	addi	a0,a0,-380 # 8000a550 <_ZN9Scheduler12mid_priorityE>
    800046d4:	00000097          	auipc	ra,0x0
    800046d8:	0d0080e7          	jalr	208(ra) # 800047a4 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    800046dc:	00053503          	ld	a0,0(a0)
    800046e0:	fd1ff06f          	j	800046b0 <_ZN9Scheduler4peekEv+0x30>
    return Scheduler::low_priority.peek();
    800046e4:	00006517          	auipc	a0,0x6
    800046e8:	e8450513          	addi	a0,a0,-380 # 8000a568 <_ZN9Scheduler12low_priorityE>
    800046ec:	00000097          	auipc	ra,0x0
    800046f0:	0b8080e7          	jalr	184(ra) # 800047a4 <_ZN3stm14CircularBufferIP3TCBE4peekEv>
    800046f4:	00053503          	ld	a0,0(a0)
    800046f8:	fb9ff06f          	j	800046b0 <_ZN9Scheduler4peekEv+0x30>

00000000800046fc <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *thread) {
    800046fc:	ff010113          	addi	sp,sp,-16
    80004700:	00113423          	sd	ra,8(sp)
    80004704:	00813023          	sd	s0,0(sp)
    80004708:	01010413          	addi	s0,sp,16
    8000470c:	00050593          	mv	a1,a0
    bool was_preempted() const { return this->preempted; }
    80004710:	05854783          	lbu	a5,88(a0)
    if (!thread->was_preempted()) {
    80004714:	02078e63          	beqz	a5,80004750 <_ZN9Scheduler3putEP3TCB+0x54>
    void reset_preempted() { this->preempted = false; }
    80004718:	04050c23          	sb	zero,88(a0)
    time_t get_time_slice() const { return this->time_slice; }
    8000471c:	05053783          	ld	a5,80(a0)
    if (time_slice == TimeSlice::HIGH_PRIORITY) {
    80004720:	00100713          	li	a4,1
    80004724:	04e78463          	beq	a5,a4,8000476c <_ZN9Scheduler3putEP3TCB+0x70>
    } else if (time_slice == TimeSlice::MID_PRIORITY) {
    80004728:	00200713          	li	a4,2
    8000472c:	04e78e63          	beq	a5,a4,80004788 <_ZN9Scheduler3putEP3TCB+0x8c>
        Scheduler::low_priority.put(thread);
    80004730:	00006517          	auipc	a0,0x6
    80004734:	e3850513          	addi	a0,a0,-456 # 8000a568 <_ZN9Scheduler12low_priorityE>
    80004738:	ffffe097          	auipc	ra,0xffffe
    8000473c:	eec080e7          	jalr	-276(ra) # 80002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
}
    80004740:	00813083          	ld	ra,8(sp)
    80004744:	00013403          	ld	s0,0(sp)
    80004748:	01010113          	addi	sp,sp,16
    8000474c:	00008067          	ret

    void set_time_slice(time_t time) { this->time_slice = time;}
    80004750:	00100793          	li	a5,1
    80004754:	04f53823          	sd	a5,80(a0)
        Scheduler::high_priority.put(thread);
    80004758:	00006517          	auipc	a0,0x6
    8000475c:	de050513          	addi	a0,a0,-544 # 8000a538 <_ZN9Scheduler13high_priorityE>
    80004760:	ffffe097          	auipc	ra,0xffffe
    80004764:	ec4080e7          	jalr	-316(ra) # 80002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
        return;
    80004768:	fd9ff06f          	j	80004740 <_ZN9Scheduler3putEP3TCB+0x44>
    8000476c:	00200793          	li	a5,2
    80004770:	04f53823          	sd	a5,80(a0)
        Scheduler::mid_priority.put(thread);
    80004774:	00006517          	auipc	a0,0x6
    80004778:	ddc50513          	addi	a0,a0,-548 # 8000a550 <_ZN9Scheduler12mid_priorityE>
    8000477c:	ffffe097          	auipc	ra,0xffffe
    80004780:	ea8080e7          	jalr	-344(ra) # 80002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    80004784:	fbdff06f          	j	80004740 <_ZN9Scheduler3putEP3TCB+0x44>
    80004788:	00400793          	li	a5,4
    8000478c:	04f53823          	sd	a5,80(a0)
        Scheduler::low_priority.put(thread);
    80004790:	00006517          	auipc	a0,0x6
    80004794:	dd850513          	addi	a0,a0,-552 # 8000a568 <_ZN9Scheduler12low_priorityE>
    80004798:	ffffe097          	auipc	ra,0xffffe
    8000479c:	e8c080e7          	jalr	-372(ra) # 80002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    800047a0:	fa1ff06f          	j	80004740 <_ZN9Scheduler3putEP3TCB+0x44>

00000000800047a4 <_ZN3stm14CircularBufferIP3TCBE4peekEv>:
T &stm::CircularBuffer<T>::peek() {
    800047a4:	ff010113          	addi	sp,sp,-16
    800047a8:	00813423          	sd	s0,8(sp)
    800047ac:	01010413          	addi	s0,sp,16
    return this->queue[this->head];
    800047b0:	00053703          	ld	a4,0(a0)
    800047b4:	00852783          	lw	a5,8(a0)
    800047b8:	00379793          	slli	a5,a5,0x3
}
    800047bc:	00f70533          	add	a0,a4,a5
    800047c0:	00813403          	ld	s0,8(sp)
    800047c4:	01010113          	addi	sp,sp,16
    800047c8:	00008067          	ret

00000000800047cc <_ZN10OwnedMutexD1Ev>:

OwnedMutex::OwnedMutex() : owner(nullptr), nesting_count(0) {
    sem_open(&this->myHandle, 1);
}

OwnedMutex::~OwnedMutex() {
    800047cc:	fe010113          	addi	sp,sp,-32
    800047d0:	00113c23          	sd	ra,24(sp)
    800047d4:	00813823          	sd	s0,16(sp)
    800047d8:	00913423          	sd	s1,8(sp)
    800047dc:	02010413          	addi	s0,sp,32
    800047e0:	00050493          	mv	s1,a0
    800047e4:	00006797          	auipc	a5,0x6
    800047e8:	bf478793          	addi	a5,a5,-1036 # 8000a3d8 <_ZTV10OwnedMutex+0x10>
    800047ec:	00f53023          	sd	a5,0(a0)
    sem_close(this->myHandle);
    800047f0:	00853503          	ld	a0,8(a0)
    800047f4:	ffffd097          	auipc	ra,0xffffd
    800047f8:	f8c080e7          	jalr	-116(ra) # 80001780 <_Z9sem_closeP3Sem>
class Mutex : public Semaphore {
    800047fc:	00006797          	auipc	a5,0x6
    80004800:	bac78793          	addi	a5,a5,-1108 # 8000a3a8 <_ZTV5Mutex+0x10>
    80004804:	00f4b023          	sd	a5,0(s1)
    80004808:	00048513          	mv	a0,s1
    8000480c:	fffff097          	auipc	ra,0xfffff
    80004810:	528080e7          	jalr	1320(ra) # 80003d34 <_ZN9SemaphoreD1Ev>
}
    80004814:	01813083          	ld	ra,24(sp)
    80004818:	01013403          	ld	s0,16(sp)
    8000481c:	00813483          	ld	s1,8(sp)
    80004820:	02010113          	addi	sp,sp,32
    80004824:	00008067          	ret

0000000080004828 <_ZN10OwnedMutexD0Ev>:
OwnedMutex::~OwnedMutex() {
    80004828:	fe010113          	addi	sp,sp,-32
    8000482c:	00113c23          	sd	ra,24(sp)
    80004830:	00813823          	sd	s0,16(sp)
    80004834:	00913423          	sd	s1,8(sp)
    80004838:	02010413          	addi	s0,sp,32
    8000483c:	00050493          	mv	s1,a0
}
    80004840:	00000097          	auipc	ra,0x0
    80004844:	f8c080e7          	jalr	-116(ra) # 800047cc <_ZN10OwnedMutexD1Ev>
    80004848:	00048513          	mv	a0,s1
    8000484c:	fffff097          	auipc	ra,0xfffff
    80004850:	5c8080e7          	jalr	1480(ra) # 80003e14 <_ZdlPv>
    80004854:	01813083          	ld	ra,24(sp)
    80004858:	01013403          	ld	s0,16(sp)
    8000485c:	00813483          	ld	s1,8(sp)
    80004860:	02010113          	addi	sp,sp,32
    80004864:	00008067          	ret

0000000080004868 <_ZN10OwnedMutex4waitEv>:

int OwnedMutex::wait() {
    if (this->owner == TCB::running) {
    80004868:	01053783          	ld	a5,16(a0)
    8000486c:	00006717          	auipc	a4,0x6
    80004870:	bfc73703          	ld	a4,-1028(a4) # 8000a468 <_GLOBAL_OFFSET_TABLE_+0x70>
    80004874:	00073703          	ld	a4,0(a4)
    80004878:	02e78c63          	beq	a5,a4,800048b0 <_ZN10OwnedMutex4waitEv+0x48>
int OwnedMutex::wait() {
    8000487c:	ff010113          	addi	sp,sp,-16
    80004880:	00113423          	sd	ra,8(sp)
    80004884:	00813023          	sd	s0,0(sp)
    80004888:	01010413          	addi	s0,sp,16
        this->nesting_count++;
        return 0;
    }
    if (this->owner == nullptr) {
    8000488c:	02078c63          	beqz	a5,800048c4 <_ZN10OwnedMutex4waitEv+0x5c>
        this->owner = TCB::running;
        this->nesting_count = 1;
    }
    sem_wait(this->myHandle);
    80004890:	00853503          	ld	a0,8(a0)
    80004894:	ffffd097          	auipc	ra,0xffffd
    80004898:	f2c080e7          	jalr	-212(ra) # 800017c0 <_Z8sem_waitP3Sem>
    return 0;
}
    8000489c:	00000513          	li	a0,0
    800048a0:	00813083          	ld	ra,8(sp)
    800048a4:	00013403          	ld	s0,0(sp)
    800048a8:	01010113          	addi	sp,sp,16
    800048ac:	00008067          	ret
        this->nesting_count++;
    800048b0:	01852783          	lw	a5,24(a0)
    800048b4:	0017879b          	addiw	a5,a5,1
    800048b8:	00f52c23          	sw	a5,24(a0)
}
    800048bc:	00000513          	li	a0,0
    800048c0:	00008067          	ret
        this->owner = TCB::running;
    800048c4:	00e53823          	sd	a4,16(a0)
        this->nesting_count = 1;
    800048c8:	00100793          	li	a5,1
    800048cc:	00f52c23          	sw	a5,24(a0)
    800048d0:	fc1ff06f          	j	80004890 <_ZN10OwnedMutex4waitEv+0x28>

00000000800048d4 <_ZN10OwnedMutex6signalEv>:

int OwnedMutex::signal() {
    if (this->owner != TCB::running) return -1;
    800048d4:	01053703          	ld	a4,16(a0)
    800048d8:	00006797          	auipc	a5,0x6
    800048dc:	b907b783          	ld	a5,-1136(a5) # 8000a468 <_GLOBAL_OFFSET_TABLE_+0x70>
    800048e0:	0007b783          	ld	a5,0(a5)
    800048e4:	04f71a63          	bne	a4,a5,80004938 <_ZN10OwnedMutex6signalEv+0x64>
    this->nesting_count --;
    800048e8:	01852783          	lw	a5,24(a0)
    800048ec:	fff7879b          	addiw	a5,a5,-1
    800048f0:	0007871b          	sext.w	a4,a5
    800048f4:	00f52c23          	sw	a5,24(a0)
    if (this->nesting_count == 0) {
    800048f8:	00070663          	beqz	a4,80004904 <_ZN10OwnedMutex6signalEv+0x30>
        this->owner = nullptr;
        sem_signal(this->myHandle);
    }
    return 0;
    800048fc:	00000513          	li	a0,0
}
    80004900:	00008067          	ret
int OwnedMutex::signal() {
    80004904:	ff010113          	addi	sp,sp,-16
    80004908:	00113423          	sd	ra,8(sp)
    8000490c:	00813023          	sd	s0,0(sp)
    80004910:	01010413          	addi	s0,sp,16
        this->owner = nullptr;
    80004914:	00053823          	sd	zero,16(a0)
        sem_signal(this->myHandle);
    80004918:	00853503          	ld	a0,8(a0)
    8000491c:	ffffd097          	auipc	ra,0xffffd
    80004920:	ee4080e7          	jalr	-284(ra) # 80001800 <_Z10sem_signalP3Sem>
    return 0;
    80004924:	00000513          	li	a0,0
}
    80004928:	00813083          	ld	ra,8(sp)
    8000492c:	00013403          	ld	s0,0(sp)
    80004930:	01010113          	addi	sp,sp,16
    80004934:	00008067          	ret
    if (this->owner != TCB::running) return -1;
    80004938:	fff00513          	li	a0,-1
    8000493c:	00008067          	ret

0000000080004940 <_ZN10OwnedMutexC1Ev>:
OwnedMutex::OwnedMutex() : owner(nullptr), nesting_count(0) {
    80004940:	fe010113          	addi	sp,sp,-32
    80004944:	00113c23          	sd	ra,24(sp)
    80004948:	00813823          	sd	s0,16(sp)
    8000494c:	00913423          	sd	s1,8(sp)
    80004950:	01213023          	sd	s2,0(sp)
    80004954:	02010413          	addi	s0,sp,32
    80004958:	00050493          	mv	s1,a0
    Mutex() : Semaphore(1) {}
    8000495c:	00100593          	li	a1,1
    80004960:	fffff097          	auipc	ra,0xfffff
    80004964:	734080e7          	jalr	1844(ra) # 80004094 <_ZN9SemaphoreC1Ej>
    80004968:	00006797          	auipc	a5,0x6
    8000496c:	a7078793          	addi	a5,a5,-1424 # 8000a3d8 <_ZTV10OwnedMutex+0x10>
    80004970:	00f4b023          	sd	a5,0(s1)
    80004974:	0004b823          	sd	zero,16(s1)
    80004978:	0004ac23          	sw	zero,24(s1)
    sem_open(&this->myHandle, 1);
    8000497c:	00100593          	li	a1,1
    80004980:	00848513          	addi	a0,s1,8
    80004984:	ffffd097          	auipc	ra,0xffffd
    80004988:	db8080e7          	jalr	-584(ra) # 8000173c <_Z8sem_openPP3Semj>
    8000498c:	02c0006f          	j	800049b8 <_ZN10OwnedMutexC1Ev+0x78>
    80004990:	00050913          	mv	s2,a0
class Mutex : public Semaphore {
    80004994:	00006797          	auipc	a5,0x6
    80004998:	a1478793          	addi	a5,a5,-1516 # 8000a3a8 <_ZTV5Mutex+0x10>
    8000499c:	00f4b023          	sd	a5,0(s1)
    800049a0:	00048513          	mv	a0,s1
    800049a4:	fffff097          	auipc	ra,0xfffff
    800049a8:	390080e7          	jalr	912(ra) # 80003d34 <_ZN9SemaphoreD1Ev>
    800049ac:	00090513          	mv	a0,s2
    800049b0:	00007097          	auipc	ra,0x7
    800049b4:	cb8080e7          	jalr	-840(ra) # 8000b668 <_Unwind_Resume>
}
    800049b8:	01813083          	ld	ra,24(sp)
    800049bc:	01013403          	ld	s0,16(sp)
    800049c0:	00813483          	ld	s1,8(sp)
    800049c4:	00013903          	ld	s2,0(sp)
    800049c8:	02010113          	addi	sp,sp,32
    800049cc:	00008067          	ret

00000000800049d0 <_ZN5MutexD1Ev>:
    800049d0:	ff010113          	addi	sp,sp,-16
    800049d4:	00113423          	sd	ra,8(sp)
    800049d8:	00813023          	sd	s0,0(sp)
    800049dc:	01010413          	addi	s0,sp,16
    800049e0:	00006797          	auipc	a5,0x6
    800049e4:	9c878793          	addi	a5,a5,-1592 # 8000a3a8 <_ZTV5Mutex+0x10>
    800049e8:	00f53023          	sd	a5,0(a0)
    800049ec:	fffff097          	auipc	ra,0xfffff
    800049f0:	348080e7          	jalr	840(ra) # 80003d34 <_ZN9SemaphoreD1Ev>
    800049f4:	00813083          	ld	ra,8(sp)
    800049f8:	00013403          	ld	s0,0(sp)
    800049fc:	01010113          	addi	sp,sp,16
    80004a00:	00008067          	ret

0000000080004a04 <_ZN5MutexD0Ev>:
    80004a04:	fe010113          	addi	sp,sp,-32
    80004a08:	00113c23          	sd	ra,24(sp)
    80004a0c:	00813823          	sd	s0,16(sp)
    80004a10:	00913423          	sd	s1,8(sp)
    80004a14:	02010413          	addi	s0,sp,32
    80004a18:	00050493          	mv	s1,a0
    80004a1c:	00006797          	auipc	a5,0x6
    80004a20:	98c78793          	addi	a5,a5,-1652 # 8000a3a8 <_ZTV5Mutex+0x10>
    80004a24:	00f53023          	sd	a5,0(a0)
    80004a28:	fffff097          	auipc	ra,0xfffff
    80004a2c:	30c080e7          	jalr	780(ra) # 80003d34 <_ZN9SemaphoreD1Ev>
    80004a30:	00048513          	mv	a0,s1
    80004a34:	fffff097          	auipc	ra,0xfffff
    80004a38:	3e0080e7          	jalr	992(ra) # 80003e14 <_ZdlPv>
    80004a3c:	01813083          	ld	ra,24(sp)
    80004a40:	01013403          	ld	s0,16(sp)
    80004a44:	00813483          	ld	s1,8(sp)
    80004a48:	02010113          	addi	sp,sp,32
    80004a4c:	00008067          	ret

0000000080004a50 <_ZN3TCB12thread_startEv>:
    if (TCB::running != thread->parent) return -4;
    thread->finish();
    return 0;
}

void TCB::thread_start() {
    80004a50:	ff010113          	addi	sp,sp,-16
    80004a54:	00113423          	sd	ra,8(sp)
    80004a58:	00813023          	sd	s0,0(sp)
    80004a5c:	01010413          	addi	s0,sp,16
    Riscv::popSppSpie();
    80004a60:	00000097          	auipc	ra,0x0
    80004a64:	b20080e7          	jalr	-1248(ra) # 80004580 <_ZN5Riscv10popSppSpieEv>
    TCB::running->_run(TCB::running->arg);
    80004a68:	00006797          	auipc	a5,0x6
    80004a6c:	b187b783          	ld	a5,-1256(a5) # 8000a580 <_ZN3TCB7runningE>
    80004a70:	0087b703          	ld	a4,8(a5)
    80004a74:	0107b503          	ld	a0,16(a5)
    80004a78:	000700e7          	jalr	a4
    thread_exit();
    80004a7c:	ffffd097          	auipc	ra,0xffffd
    80004a80:	b24080e7          	jalr	-1244(ra) # 800015a0 <_Z11thread_exitv>
    80004a84:	00813083          	ld	ra,8(sp)
    80004a88:	00013403          	ld	s0,0(sp)
    80004a8c:	01010113          	addi	sp,sp,16
    80004a90:	00008067          	ret

0000000080004a94 <_ZN3TCB9duplicateEPS_S0_>:
void TCB::duplicate(TCB *parent, TCB *child) {
    80004a94:	fe010113          	addi	sp,sp,-32
    80004a98:	00113c23          	sd	ra,24(sp)
    80004a9c:	00813823          	sd	s0,16(sp)
    80004aa0:	00913423          	sd	s1,8(sp)
    80004aa4:	01213023          	sd	s2,0(sp)
    80004aa8:	02010413          	addi	s0,sp,32
    80004aac:	00050913          	mv	s2,a0
    80004ab0:	00058493          	mv	s1,a1
    Riscv::push();
    80004ab4:	ffffd097          	auipc	ra,0xffffd
    80004ab8:	8ac080e7          	jalr	-1876(ra) # 80001360 <_ZN5Riscv4pushEv>
    memcpy(parent->stack, child->stack, DEFAULT_STACK_SIZE);
    80004abc:	00004637          	lui	a2,0x4
    80004ac0:	0184b583          	ld	a1,24(s1)
    80004ac4:	01893503          	ld	a0,24(s2)
    80004ac8:	fffff097          	auipc	ra,0xfffff
    80004acc:	d8c080e7          	jalr	-628(ra) # 80003854 <_Z6memcpyPKvS0_i>
    child->context = parent->context;
    80004ad0:	02893603          	ld	a2,40(s2)
    80004ad4:	03093683          	ld	a3,48(s2)
    80004ad8:	03893703          	ld	a4,56(s2)
    80004adc:	04093783          	ld	a5,64(s2)
    80004ae0:	02c4b423          	sd	a2,40(s1)
    80004ae4:	02d4b823          	sd	a3,48(s1)
    80004ae8:	02e4bc23          	sd	a4,56(s1)
    80004aec:	04f4b023          	sd	a5,64(s1)
    Riscv::pop();
    80004af0:	ffffd097          	auipc	ra,0xffffd
    80004af4:	8f0080e7          	jalr	-1808(ra) # 800013e0 <_ZN5Riscv3popEv>
}
    80004af8:	01813083          	ld	ra,24(sp)
    80004afc:	01013403          	ld	s0,16(sp)
    80004b00:	00813483          	ld	s1,8(sp)
    80004b04:	00013903          	ld	s2,0(sp)
    80004b08:	02010113          	addi	sp,sp,32
    80004b0c:	00008067          	ret

0000000080004b10 <_ZN3TCB5_killEPS_>:
int TCB::_kill(TCB *thread) {
    80004b10:	ff010113          	addi	sp,sp,-16
    80004b14:	00813423          	sd	s0,8(sp)
    80004b18:	01010413          	addi	s0,sp,16
    if (!thread) return -1;
    80004b1c:	02050c63          	beqz	a0,80004b54 <_ZN3TCB5_killEPS_+0x44>
    bool is_finished() const { return this->status == FINISHED; }
    80004b20:	04852703          	lw	a4,72(a0)
    if (thread->is_finished()) return -2;
    80004b24:	00400793          	li	a5,4
    80004b28:	02f70a63          	beq	a4,a5,80004b5c <_ZN3TCB5_killEPS_+0x4c>
    if (TCB::running != thread->parent) return -4;
    80004b2c:	02053703          	ld	a4,32(a0)
    80004b30:	00006797          	auipc	a5,0x6
    80004b34:	a507b783          	ld	a5,-1456(a5) # 8000a580 <_ZN3TCB7runningE>
    80004b38:	02f71663          	bne	a4,a5,80004b64 <_ZN3TCB5_killEPS_+0x54>
    void finish() { this->status = FINISHED; }
    80004b3c:	00400793          	li	a5,4
    80004b40:	04f52423          	sw	a5,72(a0)
    return 0;
    80004b44:	00000513          	li	a0,0
}
    80004b48:	00813403          	ld	s0,8(sp)
    80004b4c:	01010113          	addi	sp,sp,16
    80004b50:	00008067          	ret
    if (!thread) return -1;
    80004b54:	fff00513          	li	a0,-1
    80004b58:	ff1ff06f          	j	80004b48 <_ZN3TCB5_killEPS_+0x38>
    if (thread->is_finished()) return -2;
    80004b5c:	ffe00513          	li	a0,-2
    80004b60:	fe9ff06f          	j	80004b48 <_ZN3TCB5_killEPS_+0x38>
    if (TCB::running != thread->parent) return -4;
    80004b64:	ffc00513          	li	a0,-4
    80004b68:	fe1ff06f          	j	80004b48 <_ZN3TCB5_killEPS_+0x38>

0000000080004b6c <_ZN3TCBC1EPFvPvES0_S0_7Context>:
TCB::TCB(run_t start_routine, void *arg, void *stack, Context context) :
    80004b6c:	fe010113          	addi	sp,sp,-32
    80004b70:	00113c23          	sd	ra,24(sp)
    80004b74:	00813823          	sd	s0,16(sp)
    80004b78:	00913423          	sd	s1,8(sp)
    80004b7c:	01213023          	sd	s2,0(sp)
    80004b80:	02010413          	addi	s0,sp,32
    80004b84:	00050493          	mv	s1,a0
        t_id(TCB::ID++), _run(start_routine), arg(arg),
    80004b88:	00006917          	auipc	s2,0x6
    80004b8c:	9f890913          	addi	s2,s2,-1544 # 8000a580 <_ZN3TCB7runningE>
    80004b90:	00892783          	lw	a5,8(s2)
    80004b94:	0017851b          	addiw	a0,a5,1
    80004b98:	00a92423          	sw	a0,8(s2)
        time_slice(DEFAULT_TIME_SLICE), preempted(false), joiner() {
    80004b9c:	00f4a023          	sw	a5,0(s1)
    80004ba0:	00b4b423          	sd	a1,8(s1)
    80004ba4:	00c4b823          	sd	a2,16(s1)
    80004ba8:	00d4bc23          	sd	a3,24(s1)
    80004bac:	00093783          	ld	a5,0(s2)
    80004bb0:	02f4b023          	sd	a5,32(s1)
    80004bb4:	00073583          	ld	a1,0(a4)
    80004bb8:	00873603          	ld	a2,8(a4)
    80004bbc:	01073683          	ld	a3,16(a4)
    80004bc0:	01873783          	ld	a5,24(a4)
    80004bc4:	02b4b423          	sd	a1,40(s1)
    80004bc8:	02c4b823          	sd	a2,48(s1)
    80004bcc:	02d4bc23          	sd	a3,56(s1)
    80004bd0:	04f4b023          	sd	a5,64(s1)
    80004bd4:	0404a423          	sw	zero,72(s1)
    80004bd8:	00100793          	li	a5,1
    80004bdc:	04f4b823          	sd	a5,80(s1)
    80004be0:	04048c23          	sb	zero,88(s1)
    80004be4:	0604b023          	sd	zero,96(s1)
    80004be8:	0604a423          	sw	zero,104(s1)
    80004bec:	0604a623          	sw	zero,108(s1)
    80004bf0:	0604a823          	sw	zero,112(s1)
    80004bf4:	0604aa23          	sw	zero,116(s1)
    this->joiner.init();
    80004bf8:	06048513          	addi	a0,s1,96
    80004bfc:	ffffe097          	auipc	ra,0xffffe
    80004c00:	8b4080e7          	jalr	-1868(ra) # 800024b0 <_ZN3stm14CircularBufferIP3TCBE4initEv>
    this->parent = TCB::running;
    80004c04:	00093783          	ld	a5,0(s2)
    80004c08:	02f4b023          	sd	a5,32(s1)
}
    80004c0c:	01813083          	ld	ra,24(sp)
    80004c10:	01013403          	ld	s0,16(sp)
    80004c14:	00813483          	ld	s1,8(sp)
    80004c18:	00013903          	ld	s2,0(sp)
    80004c1c:	02010113          	addi	sp,sp,32
    80004c20:	00008067          	ret

0000000080004c24 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_>:
int TCB::_thread_create(thread_t *handle, void(*start_routine)(void *), void *arg, void *stack) {
    80004c24:	f8010113          	addi	sp,sp,-128
    80004c28:	06113c23          	sd	ra,120(sp)
    80004c2c:	06813823          	sd	s0,112(sp)
    80004c30:	06913423          	sd	s1,104(sp)
    80004c34:	07213023          	sd	s2,96(sp)
    80004c38:	05313c23          	sd	s3,88(sp)
    80004c3c:	05413823          	sd	s4,80(sp)
    80004c40:	05513423          	sd	s5,72(sp)
    80004c44:	08010413          	addi	s0,sp,128
    80004c48:	00050913          	mv	s2,a0
    80004c4c:	00058993          	mv	s3,a1
    80004c50:	00060a93          	mv	s5,a2
    80004c54:	00068a13          	mv	s4,a3
    *handle = new TCB(start_routine, arg, stack, {(uint64) thread_start, (uint64) stack + DEFAULT_STACK_SIZE - 1});
    80004c58:	fa043823          	sd	zero,-80(s0)
    80004c5c:	fa043c23          	sd	zero,-72(s0)
    80004c60:	00000797          	auipc	a5,0x0
    80004c64:	df078793          	addi	a5,a5,-528 # 80004a50 <_ZN3TCB12thread_startEv>
    80004c68:	faf43023          	sd	a5,-96(s0)
    80004c6c:	000047b7          	lui	a5,0x4
    80004c70:	fff78793          	addi	a5,a5,-1 # 3fff <_entry-0x7fffc001>
    80004c74:	00f687b3          	add	a5,a3,a5
    80004c78:	faf43423          	sd	a5,-88(s0)
    80004c7c:	07800513          	li	a0,120
    80004c80:	fffff097          	auipc	ra,0xfffff
    80004c84:	144080e7          	jalr	324(ra) # 80003dc4 <_Znwm>
    80004c88:	00050493          	mv	s1,a0
    80004c8c:	fa043783          	ld	a5,-96(s0)
    80004c90:	f8f43023          	sd	a5,-128(s0)
    80004c94:	fa843783          	ld	a5,-88(s0)
    80004c98:	f8f43423          	sd	a5,-120(s0)
    80004c9c:	fb043783          	ld	a5,-80(s0)
    80004ca0:	f8f43823          	sd	a5,-112(s0)
    80004ca4:	fb843783          	ld	a5,-72(s0)
    80004ca8:	f8f43c23          	sd	a5,-104(s0)
    80004cac:	f8040713          	addi	a4,s0,-128
    80004cb0:	000a0693          	mv	a3,s4
    80004cb4:	000a8613          	mv	a2,s5
    80004cb8:	00098593          	mv	a1,s3
    80004cbc:	00000097          	auipc	ra,0x0
    80004cc0:	eb0080e7          	jalr	-336(ra) # 80004b6c <_ZN3TCBC1EPFvPvES0_S0_7Context>
    80004cc4:	00993023          	sd	s1,0(s2)
    if (start_routine) Scheduler::put(*handle);
    80004cc8:	02098e63          	beqz	s3,80004d04 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0xe0>
    80004ccc:	00048513          	mv	a0,s1
    80004cd0:	00000097          	auipc	ra,0x0
    80004cd4:	a2c080e7          	jalr	-1492(ra) # 800046fc <_ZN9Scheduler3putEP3TCB>
    return (*handle)->t_id;
    80004cd8:	00093783          	ld	a5,0(s2)
    80004cdc:	0007a503          	lw	a0,0(a5)
}
    80004ce0:	07813083          	ld	ra,120(sp)
    80004ce4:	07013403          	ld	s0,112(sp)
    80004ce8:	06813483          	ld	s1,104(sp)
    80004cec:	06013903          	ld	s2,96(sp)
    80004cf0:	05813983          	ld	s3,88(sp)
    80004cf4:	05013a03          	ld	s4,80(sp)
    80004cf8:	04813a83          	ld	s5,72(sp)
    80004cfc:	08010113          	addi	sp,sp,128
    80004d00:	00008067          	ret
    else TCB::running = *handle;
    80004d04:	00006797          	auipc	a5,0x6
    80004d08:	8697be23          	sd	s1,-1924(a5) # 8000a580 <_ZN3TCB7runningE>
    80004d0c:	fcdff06f          	j	80004cd8 <_ZN3TCB14_thread_createEPPS_PFvPvES2_S2_+0xb4>
    80004d10:	00050913          	mv	s2,a0
    *handle = new TCB(start_routine, arg, stack, {(uint64) thread_start, (uint64) stack + DEFAULT_STACK_SIZE - 1});
    80004d14:	00048513          	mv	a0,s1
    80004d18:	fffff097          	auipc	ra,0xfffff
    80004d1c:	0fc080e7          	jalr	252(ra) # 80003e14 <_ZdlPv>
    80004d20:	00090513          	mv	a0,s2
    80004d24:	00007097          	auipc	ra,0x7
    80004d28:	944080e7          	jalr	-1724(ra) # 8000b668 <_Unwind_Resume>

0000000080004d2c <_ZN3TCBC1ERS_>:
TCB::TCB(TCB &parent) :
    80004d2c:	fe010113          	addi	sp,sp,-32
    80004d30:	00113c23          	sd	ra,24(sp)
    80004d34:	00813823          	sd	s0,16(sp)
    80004d38:	00913423          	sd	s1,8(sp)
    80004d3c:	01213023          	sd	s2,0(sp)
    80004d40:	02010413          	addi	s0,sp,32
    80004d44:	00050493          	mv	s1,a0
    80004d48:	00058913          	mv	s2,a1
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    80004d4c:	00006717          	auipc	a4,0x6
    80004d50:	83470713          	addi	a4,a4,-1996 # 8000a580 <_ZN3TCB7runningE>
    80004d54:	00872783          	lw	a5,8(a4)
    80004d58:	0017869b          	addiw	a3,a5,1
    80004d5c:	00d72423          	sw	a3,8(a4)
        preempted(false), joiner() {
    80004d60:	00f52023          	sw	a5,0(a0)
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    80004d64:	0085b783          	ld	a5,8(a1)
        preempted(false), joiner() {
    80004d68:	00f53423          	sd	a5,8(a0)
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
    80004d6c:	0105b783          	ld	a5,16(a1)
        preempted(false), joiner() {
    80004d70:	00f53823          	sd	a5,16(a0)
        stack(Allocator::_mem_alloc(DEFAULT_STACK_SIZE)),
    80004d74:	00004537          	lui	a0,0x4
    80004d78:	fffff097          	auipc	ra,0xfffff
    80004d7c:	804080e7          	jalr	-2044(ra) # 8000357c <_ZN9Allocator10_mem_allocEm>
        preempted(false), joiner() {
    80004d80:	00a4bc23          	sd	a0,24(s1)
    80004d84:	0324b023          	sd	s2,32(s1)
    80004d88:	02893603          	ld	a2,40(s2)
    80004d8c:	03093683          	ld	a3,48(s2)
    80004d90:	03893703          	ld	a4,56(s2)
    80004d94:	04093783          	ld	a5,64(s2)
    80004d98:	02c4b423          	sd	a2,40(s1)
    80004d9c:	02d4b823          	sd	a3,48(s1)
    80004da0:	02e4bc23          	sd	a4,56(s1)
    80004da4:	04f4b023          	sd	a5,64(s1)
    80004da8:	0404a423          	sw	zero,72(s1)
    80004dac:	00100793          	li	a5,1
    80004db0:	04f4b823          	sd	a5,80(s1)
    80004db4:	04048c23          	sb	zero,88(s1)
    80004db8:	0604b023          	sd	zero,96(s1)
    80004dbc:	0604a423          	sw	zero,104(s1)
    80004dc0:	0604a623          	sw	zero,108(s1)
    80004dc4:	0604a823          	sw	zero,112(s1)
    80004dc8:	0604aa23          	sw	zero,116(s1)
    this->joiner.init();
    80004dcc:	06048513          	addi	a0,s1,96
    80004dd0:	ffffd097          	auipc	ra,0xffffd
    80004dd4:	6e0080e7          	jalr	1760(ra) # 800024b0 <_ZN3stm14CircularBufferIP3TCBE4initEv>
}
    80004dd8:	01813083          	ld	ra,24(sp)
    80004ddc:	01013403          	ld	s0,16(sp)
    80004de0:	00813483          	ld	s1,8(sp)
    80004de4:	00013903          	ld	s2,0(sp)
    80004de8:	02010113          	addi	sp,sp,32
    80004dec:	00008067          	ret

0000000080004df0 <_ZN3TCB5_forkEv>:
int TCB::_fork() {
    80004df0:	fd010113          	addi	sp,sp,-48
    80004df4:	02113423          	sd	ra,40(sp)
    80004df8:	02813023          	sd	s0,32(sp)
    80004dfc:	00913c23          	sd	s1,24(sp)
    80004e00:	01213823          	sd	s2,16(sp)
    80004e04:	01313423          	sd	s3,8(sp)
    80004e08:	03010413          	addi	s0,sp,48
    int id_parent = TCB::running->t_id;
    80004e0c:	00005917          	auipc	s2,0x5
    80004e10:	77490913          	addi	s2,s2,1908 # 8000a580 <_ZN3TCB7runningE>
    80004e14:	00093783          	ld	a5,0(s2)
    80004e18:	0007a983          	lw	s3,0(a5)
    TCB *handle = new TCB(*TCB::running);
    80004e1c:	07800513          	li	a0,120
    80004e20:	fffff097          	auipc	ra,0xfffff
    80004e24:	fa4080e7          	jalr	-92(ra) # 80003dc4 <_Znwm>
    80004e28:	00050493          	mv	s1,a0
    80004e2c:	00093583          	ld	a1,0(s2)
    80004e30:	00000097          	auipc	ra,0x0
    80004e34:	efc080e7          	jalr	-260(ra) # 80004d2c <_ZN3TCBC1ERS_>
    TCB::duplicate(TCB::running, handle);
    80004e38:	00048593          	mv	a1,s1
    80004e3c:	00093503          	ld	a0,0(s2)
    80004e40:	00000097          	auipc	ra,0x0
    80004e44:	c54080e7          	jalr	-940(ra) # 80004a94 <_ZN3TCB9duplicateEPS_S0_>
    print(TCB::running->t_id);
    80004e48:	00093783          	ld	a5,0(s2)
    80004e4c:	0007a503          	lw	a0,0(a5)
    80004e50:	ffffe097          	auipc	ra,0xffffe
    80004e54:	9b4080e7          	jalr	-1612(ra) # 80002804 <_Z5printi>
    putc(' ');
    80004e58:	02000513          	li	a0,32
    80004e5c:	ffffd097          	auipc	ra,0xffffd
    80004e60:	b30080e7          	jalr	-1232(ra) # 8000198c <_Z4putcc>
    print(id_parent);
    80004e64:	00098513          	mv	a0,s3
    80004e68:	ffffe097          	auipc	ra,0xffffe
    80004e6c:	99c080e7          	jalr	-1636(ra) # 80002804 <_Z5printi>
    putc(' ');
    80004e70:	02000513          	li	a0,32
    80004e74:	ffffd097          	auipc	ra,0xffffd
    80004e78:	b18080e7          	jalr	-1256(ra) # 8000198c <_Z4putcc>
    print(handle->t_id);
    80004e7c:	0004a503          	lw	a0,0(s1)
    80004e80:	ffffe097          	auipc	ra,0xffffe
    80004e84:	984080e7          	jalr	-1660(ra) # 80002804 <_Z5printi>
    putc('\n');
    80004e88:	00a00513          	li	a0,10
    80004e8c:	ffffd097          	auipc	ra,0xffffd
    80004e90:	b00080e7          	jalr	-1280(ra) # 8000198c <_Z4putcc>
    if (TCB::running->t_id == id_parent) {
    80004e94:	00093783          	ld	a5,0(s2)
    80004e98:	0007a503          	lw	a0,0(a5)
    80004e9c:	03350663          	beq	a0,s3,80004ec8 <_ZN3TCB5_forkEv+0xd8>
        print(TCB::running->t_id);
    80004ea0:	ffffe097          	auipc	ra,0xffffe
    80004ea4:	964080e7          	jalr	-1692(ra) # 80002804 <_Z5printi>
        return 0;
    80004ea8:	00000513          	li	a0,0
}
    80004eac:	02813083          	ld	ra,40(sp)
    80004eb0:	02013403          	ld	s0,32(sp)
    80004eb4:	01813483          	ld	s1,24(sp)
    80004eb8:	01013903          	ld	s2,16(sp)
    80004ebc:	00813983          	ld	s3,8(sp)
    80004ec0:	03010113          	addi	sp,sp,48
    80004ec4:	00008067          	ret
        Scheduler::put(handle);
    80004ec8:	00048513          	mv	a0,s1
    80004ecc:	00000097          	auipc	ra,0x0
    80004ed0:	830080e7          	jalr	-2000(ra) # 800046fc <_ZN9Scheduler3putEP3TCB>
        return handle->t_id;
    80004ed4:	0004a503          	lw	a0,0(s1)
    80004ed8:	fd5ff06f          	j	80004eac <_ZN3TCB5_forkEv+0xbc>
    80004edc:	00050913          	mv	s2,a0
    TCB *handle = new TCB(*TCB::running);
    80004ee0:	00048513          	mv	a0,s1
    80004ee4:	fffff097          	auipc	ra,0xfffff
    80004ee8:	f30080e7          	jalr	-208(ra) # 80003e14 <_ZdlPv>
    80004eec:	00090513          	mv	a0,s2
    80004ef0:	00006097          	auipc	ra,0x6
    80004ef4:	778080e7          	jalr	1912(ra) # 8000b668 <_Unwind_Resume>

0000000080004ef8 <_ZN3TCB14destroy_threadEPS_>:
TCB *TCB::destroy_thread(TCB *thread) {
    80004ef8:	fe010113          	addi	sp,sp,-32
    80004efc:	00113c23          	sd	ra,24(sp)
    80004f00:	00813823          	sd	s0,16(sp)
    80004f04:	00913423          	sd	s1,8(sp)
    80004f08:	02010413          	addi	s0,sp,32
    80004f0c:	00050493          	mv	s1,a0
        inline bool is_empty() const { return this->size == 0; }
    80004f10:	0704a783          	lw	a5,112(s1)
    while (!thread->joiner.is_empty()) {
    80004f14:	02078663          	beqz	a5,80004f40 <_ZN3TCB14destroy_threadEPS_+0x48>
        TCB *next = thread->joiner.get();
    80004f18:	06048513          	addi	a0,s1,96
    80004f1c:	ffffd097          	auipc	ra,0xffffd
    80004f20:	5e4080e7          	jalr	1508(ra) # 80002500 <_ZN3stm14CircularBufferIP3TCBE3getEv>
    bool is_joined() const { return this->status == JOINED; }
    80004f24:	04852703          	lw	a4,72(a0) # 4048 <_entry-0x7fffbfb8>
        if (next->is_joined()) {
    80004f28:	00300793          	li	a5,3
    80004f2c:	fef712e3          	bne	a4,a5,80004f10 <_ZN3TCB14destroy_threadEPS_+0x18>
    void run() { this->status = RUNNABLE; }
    80004f30:	04052423          	sw	zero,72(a0)
            Scheduler::put(next);
    80004f34:	fffff097          	auipc	ra,0xfffff
    80004f38:	7c8080e7          	jalr	1992(ra) # 800046fc <_ZN9Scheduler3putEP3TCB>
    80004f3c:	fd5ff06f          	j	80004f10 <_ZN3TCB14destroy_threadEPS_+0x18>
    thread->joiner.destroy();
    80004f40:	06048513          	addi	a0,s1,96
    80004f44:	ffffd097          	auipc	ra,0xffffd
    80004f48:	608080e7          	jalr	1544(ra) # 8000254c <_ZN3stm14CircularBufferIP3TCBE7destroyEv>
}
    80004f4c:	00048513          	mv	a0,s1
    80004f50:	01813083          	ld	ra,24(sp)
    80004f54:	01013403          	ld	s0,16(sp)
    80004f58:	00813483          	ld	s1,8(sp)
    80004f5c:	02010113          	addi	sp,sp,32
    80004f60:	00008067          	ret

0000000080004f64 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80004f64:	fe010113          	addi	sp,sp,-32
    80004f68:	00113c23          	sd	ra,24(sp)
    80004f6c:	00813823          	sd	s0,16(sp)
    80004f70:	00913423          	sd	s1,8(sp)
    80004f74:	02010413          	addi	s0,sp,32
    thread_t old = TCB::running;
    80004f78:	00005497          	auipc	s1,0x5
    80004f7c:	6084b483          	ld	s1,1544(s1) # 8000a580 <_ZN3TCB7runningE>
    bool is_runnable() const { return this->status == RUNNABLE; }
    80004f80:	0484a783          	lw	a5,72(s1)
    if (old->is_runnable() && old != handle_bleya) {
    80004f84:	02079263          	bnez	a5,80004fa8 <_ZN3TCB5yieldEv+0x44>
    80004f88:	00005717          	auipc	a4,0x5
    80004f8c:	49073703          	ld	a4,1168(a4) # 8000a418 <_GLOBAL_OFFSET_TABLE_+0x20>
    80004f90:	00073703          	ld	a4,0(a4)
    80004f94:	00970a63          	beq	a4,s1,80004fa8 <_ZN3TCB5yieldEv+0x44>
        Scheduler::put(old);
    80004f98:	00048513          	mv	a0,s1
    80004f9c:	fffff097          	auipc	ra,0xfffff
    80004fa0:	760080e7          	jalr	1888(ra) # 800046fc <_ZN9Scheduler3putEP3TCB>
    80004fa4:	00c0006f          	j	80004fb0 <_ZN3TCB5yieldEv+0x4c>
    } else if (old->is_finished()) {
    80004fa8:	00400713          	li	a4,4
    80004fac:	04e78663          	beq	a5,a4,80004ff8 <_ZN3TCB5yieldEv+0x94>
    80004fb0:	00005797          	auipc	a5,0x5
    80004fb4:	4d07b783          	ld	a5,1232(a5) # 8000a480 <_GLOBAL_OFFSET_TABLE_+0x88>
    80004fb8:	0107a783          	lw	a5,16(a5)
    80004fbc:	06079463          	bnez	a5,80005024 <_ZN3TCB5yieldEv+0xc0>
    80004fc0:	00005797          	auipc	a5,0x5
    80004fc4:	4a07b783          	ld	a5,1184(a5) # 8000a460 <_GLOBAL_OFFSET_TABLE_+0x68>
    80004fc8:	0107a783          	lw	a5,16(a5)
    80004fcc:	04079c63          	bnez	a5,80005024 <_ZN3TCB5yieldEv+0xc0>
    80004fd0:	00005797          	auipc	a5,0x5
    80004fd4:	4687b783          	ld	a5,1128(a5) # 8000a438 <_GLOBAL_OFFSET_TABLE_+0x40>
    80004fd8:	0107a783          	lw	a5,16(a5)
    80004fdc:	04079463          	bnez	a5,80005024 <_ZN3TCB5yieldEv+0xc0>
        TCB::running = handle_bleya;
    80004fe0:	00005797          	auipc	a5,0x5
    80004fe4:	4387b783          	ld	a5,1080(a5) # 8000a418 <_GLOBAL_OFFSET_TABLE_+0x20>
    80004fe8:	0007b783          	ld	a5,0(a5)
    80004fec:	00005717          	auipc	a4,0x5
    80004ff0:	58f73a23          	sd	a5,1428(a4) # 8000a580 <_ZN3TCB7runningE>
    80004ff4:	0540006f          	j	80005048 <_ZN3TCB5yieldEv+0xe4>
        Allocator::_mem_free(old->stack);
    80004ff8:	0184b503          	ld	a0,24(s1)
    80004ffc:	ffffe097          	auipc	ra,0xffffe
    80005000:	63c080e7          	jalr	1596(ra) # 80003638 <_ZN9Allocator9_mem_freeEPKv>
    80005004:	fadff06f          	j	80004fb0 <_ZN3TCB5yieldEv+0x4c>
            Allocator::_mem_free(TCB::destroy_thread(Scheduler::get())->stack);
    80005008:	fffff097          	auipc	ra,0xfffff
    8000500c:	608080e7          	jalr	1544(ra) # 80004610 <_ZN9Scheduler3getEv>
    80005010:	00000097          	auipc	ra,0x0
    80005014:	ee8080e7          	jalr	-280(ra) # 80004ef8 <_ZN3TCB14destroy_threadEPS_>
    80005018:	01853503          	ld	a0,24(a0)
    8000501c:	ffffe097          	auipc	ra,0xffffe
    80005020:	61c080e7          	jalr	1564(ra) # 80003638 <_ZN9Allocator9_mem_freeEPKv>
        while (Scheduler::peek()->is_finished()) {
    80005024:	fffff097          	auipc	ra,0xfffff
    80005028:	65c080e7          	jalr	1628(ra) # 80004680 <_ZN9Scheduler4peekEv>
    bool is_finished() const { return this->status == FINISHED; }
    8000502c:	04852703          	lw	a4,72(a0)
    80005030:	00400793          	li	a5,4
    80005034:	fcf70ae3          	beq	a4,a5,80005008 <_ZN3TCB5yieldEv+0xa4>
        TCB::running = Scheduler::get();
    80005038:	fffff097          	auipc	ra,0xfffff
    8000503c:	5d8080e7          	jalr	1496(ra) # 80004610 <_ZN9Scheduler3getEv>
    80005040:	00005797          	auipc	a5,0x5
    80005044:	54a7b023          	sd	a0,1344(a5) # 8000a580 <_ZN3TCB7runningE>
    TCB::context_switch(&old->context, &TCB::running->context);
    80005048:	00005597          	auipc	a1,0x5
    8000504c:	5385b583          	ld	a1,1336(a1) # 8000a580 <_ZN3TCB7runningE>
    80005050:	02858593          	addi	a1,a1,40
    80005054:	02848513          	addi	a0,s1,40
    80005058:	ffffc097          	auipc	ra,0xffffc
    8000505c:	408080e7          	jalr	1032(ra) # 80001460 <_ZN3TCB14context_switchEP7ContextS1_>
}
    80005060:	01813083          	ld	ra,24(sp)
    80005064:	01013403          	ld	s0,16(sp)
    80005068:	00813483          	ld	s1,8(sp)
    8000506c:	02010113          	addi	sp,sp,32
    80005070:	00008067          	ret

0000000080005074 <_ZN3TCB16_thread_dispatchEv>:
void TCB::_thread_dispatch() {
    80005074:	ff010113          	addi	sp,sp,-16
    80005078:	00113423          	sd	ra,8(sp)
    8000507c:	00813023          	sd	s0,0(sp)
    80005080:	01010413          	addi	s0,sp,16
    Riscv::push();
    80005084:	ffffc097          	auipc	ra,0xffffc
    80005088:	2dc080e7          	jalr	732(ra) # 80001360 <_ZN5Riscv4pushEv>
    TCB::yield();
    8000508c:	00000097          	auipc	ra,0x0
    80005090:	ed8080e7          	jalr	-296(ra) # 80004f64 <_ZN3TCB5yieldEv>
    Riscv::pop();
    80005094:	ffffc097          	auipc	ra,0xffffc
    80005098:	34c080e7          	jalr	844(ra) # 800013e0 <_ZN5Riscv3popEv>
}
    8000509c:	00813083          	ld	ra,8(sp)
    800050a0:	00013403          	ld	s0,0(sp)
    800050a4:	01010113          	addi	sp,sp,16
    800050a8:	00008067          	ret

00000000800050ac <_ZN3TCB12_thread_exitEv>:
void TCB::_thread_exit() {
    800050ac:	ff010113          	addi	sp,sp,-16
    800050b0:	00113423          	sd	ra,8(sp)
    800050b4:	00813023          	sd	s0,0(sp)
    800050b8:	01010413          	addi	s0,sp,16
    TCB::running->finish();
    800050bc:	00005517          	auipc	a0,0x5
    800050c0:	4c453503          	ld	a0,1220(a0) # 8000a580 <_ZN3TCB7runningE>
    void finish() { this->status = FINISHED; }
    800050c4:	00400793          	li	a5,4
    800050c8:	04f52423          	sw	a5,72(a0)
    TCB::destroy_thread(TCB::running);
    800050cc:	00000097          	auipc	ra,0x0
    800050d0:	e2c080e7          	jalr	-468(ra) # 80004ef8 <_ZN3TCB14destroy_threadEPS_>
    TCB::_thread_dispatch();
    800050d4:	00000097          	auipc	ra,0x0
    800050d8:	fa0080e7          	jalr	-96(ra) # 80005074 <_ZN3TCB16_thread_dispatchEv>
}
    800050dc:	00813083          	ld	ra,8(sp)
    800050e0:	00013403          	ld	s0,0(sp)
    800050e4:	01010113          	addi	sp,sp,16
    800050e8:	00008067          	ret

00000000800050ec <_ZN3TCB12_thread_joinEPS_>:
    bool is_finished() const { return this->status == FINISHED; }
    800050ec:	04852703          	lw	a4,72(a0)
    if (handle->is_finished())
    800050f0:	00400793          	li	a5,4
    800050f4:	04f70463          	beq	a4,a5,8000513c <_ZN3TCB12_thread_joinEPS_+0x50>
void TCB::_thread_join(thread_t handle) {
    800050f8:	ff010113          	addi	sp,sp,-16
    800050fc:	00113423          	sd	ra,8(sp)
    80005100:	00813023          	sd	s0,0(sp)
    80005104:	01010413          	addi	s0,sp,16
    TCB::running->enjoin();
    80005108:	00005597          	auipc	a1,0x5
    8000510c:	4785b583          	ld	a1,1144(a1) # 8000a580 <_ZN3TCB7runningE>
    void enjoin() { this->status = JOINED; }
    80005110:	00300793          	li	a5,3
    80005114:	04f5a423          	sw	a5,72(a1)
    handle->joiner.put(TCB::running);
    80005118:	06050513          	addi	a0,a0,96
    8000511c:	ffffd097          	auipc	ra,0xffffd
    80005120:	508080e7          	jalr	1288(ra) # 80002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    TCB::_thread_dispatch();
    80005124:	00000097          	auipc	ra,0x0
    80005128:	f50080e7          	jalr	-176(ra) # 80005074 <_ZN3TCB16_thread_dispatchEv>
}
    8000512c:	00813083          	ld	ra,8(sp)
    80005130:	00013403          	ld	s0,0(sp)
    80005134:	01010113          	addi	sp,sp,16
    80005138:	00008067          	ret
    8000513c:	00008067          	ret

0000000080005140 <_ZN3TCB17_thread_join_timeEPS_m>:
    bool is_finished() const { return this->status == FINISHED; }
    80005140:	04852703          	lw	a4,72(a0)
    if (handle->is_finished())
    80005144:	00400793          	li	a5,4
    80005148:	06f70863          	beq	a4,a5,800051b8 <_ZN3TCB17_thread_join_timeEPS_m+0x78>
void TCB::_thread_join_time(thread_t handle, time_t time) {
    8000514c:	fe010113          	addi	sp,sp,-32
    80005150:	00113c23          	sd	ra,24(sp)
    80005154:	00813823          	sd	s0,16(sp)
    80005158:	00913423          	sd	s1,8(sp)
    8000515c:	01213023          	sd	s2,0(sp)
    80005160:	02010413          	addi	s0,sp,32
    80005164:	00058493          	mv	s1,a1
    TCB::running->enjoin();
    80005168:	00005917          	auipc	s2,0x5
    8000516c:	41890913          	addi	s2,s2,1048 # 8000a580 <_ZN3TCB7runningE>
    80005170:	00093583          	ld	a1,0(s2)
    void enjoin() { this->status = JOINED; }
    80005174:	00300793          	li	a5,3
    80005178:	04f5a423          	sw	a5,72(a1)
    handle->joiner.put(TCB::running);
    8000517c:	06050513          	addi	a0,a0,96
    80005180:	ffffd097          	auipc	ra,0xffffd
    80005184:	4a4080e7          	jalr	1188(ra) # 80002624 <_ZN3stm14CircularBufferIP3TCBE3putES2_>
    Cradle::insert(TCB::running, time);
    80005188:	00048593          	mv	a1,s1
    8000518c:	00093503          	ld	a0,0(s2)
    80005190:	ffffe097          	auipc	ra,0xffffe
    80005194:	af0080e7          	jalr	-1296(ra) # 80002c80 <_ZN6Cradle6insertEP3TCBm>
    TCB::_thread_dispatch();
    80005198:	00000097          	auipc	ra,0x0
    8000519c:	edc080e7          	jalr	-292(ra) # 80005074 <_ZN3TCB16_thread_dispatchEv>
}
    800051a0:	01813083          	ld	ra,24(sp)
    800051a4:	01013403          	ld	s0,16(sp)
    800051a8:	00813483          	ld	s1,8(sp)
    800051ac:	00013903          	ld	s2,0(sp)
    800051b0:	02010113          	addi	sp,sp,32
    800051b4:	00008067          	ret
    800051b8:	00008067          	ret

00000000800051bc <_ZN12MonitorMutex10relinquishEv>:
#include "../h/monitor.hpp"

int MonitorMutex::relinquish() {
    800051bc:	ff010113          	addi	sp,sp,-16
    800051c0:	00813423          	sd	s0,8(sp)
    800051c4:	01010413          	addi	s0,sp,16
    800051c8:	00050793          	mv	a5,a0
    int ret = this->nesting_count;
    800051cc:	01852503          	lw	a0,24(a0)
    this->nesting_count = 1;
    800051d0:	00100713          	li	a4,1
    800051d4:	00e7ac23          	sw	a4,24(a5)
    return ret;
}
    800051d8:	00813403          	ld	s0,8(sp)
    800051dc:	01010113          	addi	sp,sp,16
    800051e0:	00008067          	ret

00000000800051e4 <_ZN12MonitorMutex9reacquireEi>:

void MonitorMutex::reacquire(int count) {
    800051e4:	ff010113          	addi	sp,sp,-16
    800051e8:	00813423          	sd	s0,8(sp)
    800051ec:	01010413          	addi	s0,sp,16
    this->nesting_count = count;
    800051f0:	00b52c23          	sw	a1,24(a0)
}
    800051f4:	00813403          	ld	s0,8(sp)
    800051f8:	01010113          	addi	sp,sp,16
    800051fc:	00008067          	ret

0000000080005200 <_ZN11MonitorLockC1ER12MonitorMutex>:

MonitorLock::MonitorLock(MonitorMutex &mutex) : monitorMutex(mutex) {
    80005200:	ff010113          	addi	sp,sp,-16
    80005204:	00113423          	sd	ra,8(sp)
    80005208:	00813023          	sd	s0,0(sp)
    8000520c:	01010413          	addi	s0,sp,16
    80005210:	00b53023          	sd	a1,0(a0)
    this->monitorMutex.wait();
    80005214:	0005b783          	ld	a5,0(a1)
    80005218:	0107b783          	ld	a5,16(a5)
    8000521c:	00058513          	mv	a0,a1
    80005220:	000780e7          	jalr	a5
}
    80005224:	00813083          	ld	ra,8(sp)
    80005228:	00013403          	ld	s0,0(sp)
    8000522c:	01010113          	addi	sp,sp,16
    80005230:	00008067          	ret

0000000080005234 <_ZN11MonitorLockD1Ev>:

MonitorLock::~MonitorLock() {
    80005234:	ff010113          	addi	sp,sp,-16
    80005238:	00113423          	sd	ra,8(sp)
    8000523c:	00813023          	sd	s0,0(sp)
    80005240:	01010413          	addi	s0,sp,16
    this->monitorMutex.signal();
    80005244:	00053503          	ld	a0,0(a0)
    80005248:	00053783          	ld	a5,0(a0)
    8000524c:	0187b783          	ld	a5,24(a5)
    80005250:	000780e7          	jalr	a5
}
    80005254:	00813083          	ld	ra,8(sp)
    80005258:	00013403          	ld	s0,0(sp)
    8000525c:	01010113          	addi	sp,sp,16
    80005260:	00008067          	ret

0000000080005264 <_ZN11ConditionalC1EP7Monitor>:

Conditional::Conditional(Monitor *monitor) : owner(monitor), count(0), blocker(0) {}
    80005264:	ff010113          	addi	sp,sp,-16
    80005268:	00113423          	sd	ra,8(sp)
    8000526c:	00813023          	sd	s0,0(sp)
    80005270:	01010413          	addi	s0,sp,16
    80005274:	00b53023          	sd	a1,0(a0)
    80005278:	00052423          	sw	zero,8(a0)
    8000527c:	00000593          	li	a1,0
    80005280:	01050513          	addi	a0,a0,16
    80005284:	fffff097          	auipc	ra,0xfffff
    80005288:	e10080e7          	jalr	-496(ra) # 80004094 <_ZN9SemaphoreC1Ej>
    8000528c:	00813083          	ld	ra,8(sp)
    80005290:	00013403          	ld	s0,0(sp)
    80005294:	01010113          	addi	sp,sp,16
    80005298:	00008067          	ret

000000008000529c <_ZN11Conditional4waitEv>:

void Conditional::wait() {
    8000529c:	fe010113          	addi	sp,sp,-32
    800052a0:	00113c23          	sd	ra,24(sp)
    800052a4:	00813823          	sd	s0,16(sp)
    800052a8:	00913423          	sd	s1,8(sp)
    800052ac:	01213023          	sd	s2,0(sp)
    800052b0:	02010413          	addi	s0,sp,32
    800052b4:	00050493          	mv	s1,a0
    this->count++;
    800052b8:	00852783          	lw	a5,8(a0)
    800052bc:	0017879b          	addiw	a5,a5,1
    800052c0:	00f52423          	sw	a5,8(a0)
    int nesting = this->owner->monitorMutex.relinquish();
    800052c4:	00053503          	ld	a0,0(a0)
    800052c8:	00000097          	auipc	ra,0x0
    800052cc:	ef4080e7          	jalr	-268(ra) # 800051bc <_ZN12MonitorMutex10relinquishEv>
    800052d0:	00050913          	mv	s2,a0
    Semaphore::signal_and_wait(this->owner->monitorMutex, this->blocker);
    800052d4:	01048593          	addi	a1,s1,16
    800052d8:	0004b503          	ld	a0,0(s1)
    800052dc:	fffff097          	auipc	ra,0xfffff
    800052e0:	df0080e7          	jalr	-528(ra) # 800040cc <_ZN9Semaphore15signal_and_waitERS_S0_>
    this->owner->monitorMutex.reacquire(nesting);
    800052e4:	00090593          	mv	a1,s2
    800052e8:	0004b503          	ld	a0,0(s1)
    800052ec:	00000097          	auipc	ra,0x0
    800052f0:	ef8080e7          	jalr	-264(ra) # 800051e4 <_ZN12MonitorMutex9reacquireEi>
    this->owner->monitorMutex.wait();
    800052f4:	0004b503          	ld	a0,0(s1)
    800052f8:	fffff097          	auipc	ra,0xfffff
    800052fc:	570080e7          	jalr	1392(ra) # 80004868 <_ZN10OwnedMutex4waitEv>
}
    80005300:	01813083          	ld	ra,24(sp)
    80005304:	01013403          	ld	s0,16(sp)
    80005308:	00813483          	ld	s1,8(sp)
    8000530c:	00013903          	ld	s2,0(sp)
    80005310:	02010113          	addi	sp,sp,32
    80005314:	00008067          	ret

0000000080005318 <_ZN11Conditional6signalEv>:

void Conditional::signal() {
    if (this->count == 0) return;
    80005318:	00852783          	lw	a5,8(a0)
    8000531c:	00079463          	bnez	a5,80005324 <_ZN11Conditional6signalEv+0xc>
    80005320:	00008067          	ret
void Conditional::signal() {
    80005324:	fe010113          	addi	sp,sp,-32
    80005328:	00113c23          	sd	ra,24(sp)
    8000532c:	00813823          	sd	s0,16(sp)
    80005330:	00913423          	sd	s1,8(sp)
    80005334:	02010413          	addi	s0,sp,32
    80005338:	00050493          	mv	s1,a0
    this->blocker.signal();
    8000533c:	01050513          	addi	a0,a0,16
    80005340:	fffff097          	auipc	ra,0xfffff
    80005344:	a58080e7          	jalr	-1448(ra) # 80003d98 <_ZN9Semaphore6signalEv>
    this->count--;
    80005348:	0084a783          	lw	a5,8(s1)
    8000534c:	fff7879b          	addiw	a5,a5,-1
    80005350:	00f4a423          	sw	a5,8(s1)
}
    80005354:	01813083          	ld	ra,24(sp)
    80005358:	01013403          	ld	s0,16(sp)
    8000535c:	00813483          	ld	s1,8(sp)
    80005360:	02010113          	addi	sp,sp,32
    80005364:	00008067          	ret

0000000080005368 <_ZN11Conditional9signalAllEv>:

void Conditional::signalAll() {
    80005368:	fe010113          	addi	sp,sp,-32
    8000536c:	00113c23          	sd	ra,24(sp)
    80005370:	00813823          	sd	s0,16(sp)
    80005374:	00913423          	sd	s1,8(sp)
    80005378:	01213023          	sd	s2,0(sp)
    8000537c:	02010413          	addi	s0,sp,32
    80005380:	00050913          	mv	s2,a0
    for (unsigned int i = 0; i < this->count; i++)
    80005384:	00000493          	li	s1,0
    80005388:	00892783          	lw	a5,8(s2)
    8000538c:	00f4fc63          	bgeu	s1,a5,800053a4 <_ZN11Conditional9signalAllEv+0x3c>
        this->blocker.signal();
    80005390:	01090513          	addi	a0,s2,16
    80005394:	fffff097          	auipc	ra,0xfffff
    80005398:	a04080e7          	jalr	-1532(ra) # 80003d98 <_ZN9Semaphore6signalEv>
    for (unsigned int i = 0; i < this->count; i++)
    8000539c:	0014849b          	addiw	s1,s1,1
    800053a0:	fe9ff06f          	j	80005388 <_ZN11Conditional9signalAllEv+0x20>
    this->count = 0;
    800053a4:	00092423          	sw	zero,8(s2)
    800053a8:	01813083          	ld	ra,24(sp)
    800053ac:	01013403          	ld	s0,16(sp)
    800053b0:	00813483          	ld	s1,8(sp)
    800053b4:	00013903          	ld	s2,0(sp)
    800053b8:	02010113          	addi	sp,sp,32
    800053bc:	00008067          	ret

00000000800053c0 <start>:
    800053c0:	ff010113          	addi	sp,sp,-16
    800053c4:	00813423          	sd	s0,8(sp)
    800053c8:	01010413          	addi	s0,sp,16
    800053cc:	300027f3          	csrr	a5,mstatus
    800053d0:	ffffe737          	lui	a4,0xffffe
    800053d4:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff2fff>
    800053d8:	00e7f7b3          	and	a5,a5,a4
    800053dc:	00001737          	lui	a4,0x1
    800053e0:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800053e4:	00e7e7b3          	or	a5,a5,a4
    800053e8:	30079073          	csrw	mstatus,a5
    800053ec:	00000797          	auipc	a5,0x0
    800053f0:	16078793          	addi	a5,a5,352 # 8000554c <system_main>
    800053f4:	34179073          	csrw	mepc,a5
    800053f8:	00000793          	li	a5,0
    800053fc:	18079073          	csrw	satp,a5
    80005400:	000107b7          	lui	a5,0x10
    80005404:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80005408:	30279073          	csrw	medeleg,a5
    8000540c:	30379073          	csrw	mideleg,a5
    80005410:	104027f3          	csrr	a5,sie
    80005414:	2227e793          	ori	a5,a5,546
    80005418:	10479073          	csrw	sie,a5
    8000541c:	fff00793          	li	a5,-1
    80005420:	00a7d793          	srli	a5,a5,0xa
    80005424:	3b079073          	csrw	pmpaddr0,a5
    80005428:	00f00793          	li	a5,15
    8000542c:	3a079073          	csrw	pmpcfg0,a5
    80005430:	f14027f3          	csrr	a5,mhartid
    80005434:	0200c737          	lui	a4,0x200c
    80005438:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000543c:	0007869b          	sext.w	a3,a5
    80005440:	00269713          	slli	a4,a3,0x2
    80005444:	000f4637          	lui	a2,0xf4
    80005448:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000544c:	00d70733          	add	a4,a4,a3
    80005450:	0037979b          	slliw	a5,a5,0x3
    80005454:	020046b7          	lui	a3,0x2004
    80005458:	00d787b3          	add	a5,a5,a3
    8000545c:	00c585b3          	add	a1,a1,a2
    80005460:	00371693          	slli	a3,a4,0x3
    80005464:	00005717          	auipc	a4,0x5
    80005468:	13c70713          	addi	a4,a4,316 # 8000a5a0 <timer_scratch>
    8000546c:	00b7b023          	sd	a1,0(a5)
    80005470:	00d70733          	add	a4,a4,a3
    80005474:	00f73c23          	sd	a5,24(a4)
    80005478:	02c73023          	sd	a2,32(a4)
    8000547c:	34071073          	csrw	mscratch,a4
    80005480:	00000797          	auipc	a5,0x0
    80005484:	6e078793          	addi	a5,a5,1760 # 80005b60 <timervec>
    80005488:	30579073          	csrw	mtvec,a5
    8000548c:	300027f3          	csrr	a5,mstatus
    80005490:	0087e793          	ori	a5,a5,8
    80005494:	30079073          	csrw	mstatus,a5
    80005498:	304027f3          	csrr	a5,mie
    8000549c:	0807e793          	ori	a5,a5,128
    800054a0:	30479073          	csrw	mie,a5
    800054a4:	f14027f3          	csrr	a5,mhartid
    800054a8:	0007879b          	sext.w	a5,a5
    800054ac:	00078213          	mv	tp,a5
    800054b0:	30200073          	mret
    800054b4:	00813403          	ld	s0,8(sp)
    800054b8:	01010113          	addi	sp,sp,16
    800054bc:	00008067          	ret

00000000800054c0 <timerinit>:
    800054c0:	ff010113          	addi	sp,sp,-16
    800054c4:	00813423          	sd	s0,8(sp)
    800054c8:	01010413          	addi	s0,sp,16
    800054cc:	f14027f3          	csrr	a5,mhartid
    800054d0:	0200c737          	lui	a4,0x200c
    800054d4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800054d8:	0007869b          	sext.w	a3,a5
    800054dc:	00269713          	slli	a4,a3,0x2
    800054e0:	000f4637          	lui	a2,0xf4
    800054e4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800054e8:	00d70733          	add	a4,a4,a3
    800054ec:	0037979b          	slliw	a5,a5,0x3
    800054f0:	020046b7          	lui	a3,0x2004
    800054f4:	00d787b3          	add	a5,a5,a3
    800054f8:	00c585b3          	add	a1,a1,a2
    800054fc:	00371693          	slli	a3,a4,0x3
    80005500:	00005717          	auipc	a4,0x5
    80005504:	0a070713          	addi	a4,a4,160 # 8000a5a0 <timer_scratch>
    80005508:	00b7b023          	sd	a1,0(a5)
    8000550c:	00d70733          	add	a4,a4,a3
    80005510:	00f73c23          	sd	a5,24(a4)
    80005514:	02c73023          	sd	a2,32(a4)
    80005518:	34071073          	csrw	mscratch,a4
    8000551c:	00000797          	auipc	a5,0x0
    80005520:	64478793          	addi	a5,a5,1604 # 80005b60 <timervec>
    80005524:	30579073          	csrw	mtvec,a5
    80005528:	300027f3          	csrr	a5,mstatus
    8000552c:	0087e793          	ori	a5,a5,8
    80005530:	30079073          	csrw	mstatus,a5
    80005534:	304027f3          	csrr	a5,mie
    80005538:	0807e793          	ori	a5,a5,128
    8000553c:	30479073          	csrw	mie,a5
    80005540:	00813403          	ld	s0,8(sp)
    80005544:	01010113          	addi	sp,sp,16
    80005548:	00008067          	ret

000000008000554c <system_main>:
    8000554c:	fe010113          	addi	sp,sp,-32
    80005550:	00813823          	sd	s0,16(sp)
    80005554:	00913423          	sd	s1,8(sp)
    80005558:	00113c23          	sd	ra,24(sp)
    8000555c:	02010413          	addi	s0,sp,32
    80005560:	00000097          	auipc	ra,0x0
    80005564:	0c4080e7          	jalr	196(ra) # 80005624 <cpuid>
    80005568:	00005497          	auipc	s1,0x5
    8000556c:	f3848493          	addi	s1,s1,-200 # 8000a4a0 <started>
    80005570:	02050263          	beqz	a0,80005594 <system_main+0x48>
    80005574:	0004a783          	lw	a5,0(s1)
    80005578:	0007879b          	sext.w	a5,a5
    8000557c:	fe078ce3          	beqz	a5,80005574 <system_main+0x28>
    80005580:	0ff0000f          	fence
    80005584:	00003517          	auipc	a0,0x3
    80005588:	b9450513          	addi	a0,a0,-1132 # 80008118 <_ZN3stm4coutE+0x80>
    8000558c:	00001097          	auipc	ra,0x1
    80005590:	a70080e7          	jalr	-1424(ra) # 80005ffc <panic>
    80005594:	00001097          	auipc	ra,0x1
    80005598:	9c4080e7          	jalr	-1596(ra) # 80005f58 <consoleinit>
    8000559c:	00001097          	auipc	ra,0x1
    800055a0:	150080e7          	jalr	336(ra) # 800066ec <printfinit>
    800055a4:	00003517          	auipc	a0,0x3
    800055a8:	c5450513          	addi	a0,a0,-940 # 800081f8 <_ZN3stm4coutE+0x160>
    800055ac:	00001097          	auipc	ra,0x1
    800055b0:	aac080e7          	jalr	-1364(ra) # 80006058 <__printf>
    800055b4:	00003517          	auipc	a0,0x3
    800055b8:	b3450513          	addi	a0,a0,-1228 # 800080e8 <_ZN3stm4coutE+0x50>
    800055bc:	00001097          	auipc	ra,0x1
    800055c0:	a9c080e7          	jalr	-1380(ra) # 80006058 <__printf>
    800055c4:	00003517          	auipc	a0,0x3
    800055c8:	c3450513          	addi	a0,a0,-972 # 800081f8 <_ZN3stm4coutE+0x160>
    800055cc:	00001097          	auipc	ra,0x1
    800055d0:	a8c080e7          	jalr	-1396(ra) # 80006058 <__printf>
    800055d4:	00001097          	auipc	ra,0x1
    800055d8:	4a4080e7          	jalr	1188(ra) # 80006a78 <kinit>
    800055dc:	00000097          	auipc	ra,0x0
    800055e0:	148080e7          	jalr	328(ra) # 80005724 <trapinit>
    800055e4:	00000097          	auipc	ra,0x0
    800055e8:	16c080e7          	jalr	364(ra) # 80005750 <trapinithart>
    800055ec:	00000097          	auipc	ra,0x0
    800055f0:	5b4080e7          	jalr	1460(ra) # 80005ba0 <plicinit>
    800055f4:	00000097          	auipc	ra,0x0
    800055f8:	5d4080e7          	jalr	1492(ra) # 80005bc8 <plicinithart>
    800055fc:	00000097          	auipc	ra,0x0
    80005600:	078080e7          	jalr	120(ra) # 80005674 <userinit>
    80005604:	0ff0000f          	fence
    80005608:	00100793          	li	a5,1
    8000560c:	00003517          	auipc	a0,0x3
    80005610:	af450513          	addi	a0,a0,-1292 # 80008100 <_ZN3stm4coutE+0x68>
    80005614:	00f4a023          	sw	a5,0(s1)
    80005618:	00001097          	auipc	ra,0x1
    8000561c:	a40080e7          	jalr	-1472(ra) # 80006058 <__printf>
    80005620:	0000006f          	j	80005620 <system_main+0xd4>

0000000080005624 <cpuid>:
    80005624:	ff010113          	addi	sp,sp,-16
    80005628:	00813423          	sd	s0,8(sp)
    8000562c:	01010413          	addi	s0,sp,16
    80005630:	00020513          	mv	a0,tp
    80005634:	00813403          	ld	s0,8(sp)
    80005638:	0005051b          	sext.w	a0,a0
    8000563c:	01010113          	addi	sp,sp,16
    80005640:	00008067          	ret

0000000080005644 <mycpu>:
    80005644:	ff010113          	addi	sp,sp,-16
    80005648:	00813423          	sd	s0,8(sp)
    8000564c:	01010413          	addi	s0,sp,16
    80005650:	00020793          	mv	a5,tp
    80005654:	00813403          	ld	s0,8(sp)
    80005658:	0007879b          	sext.w	a5,a5
    8000565c:	00779793          	slli	a5,a5,0x7
    80005660:	00006517          	auipc	a0,0x6
    80005664:	f7050513          	addi	a0,a0,-144 # 8000b5d0 <cpus>
    80005668:	00f50533          	add	a0,a0,a5
    8000566c:	01010113          	addi	sp,sp,16
    80005670:	00008067          	ret

0000000080005674 <userinit>:
    80005674:	ff010113          	addi	sp,sp,-16
    80005678:	00813423          	sd	s0,8(sp)
    8000567c:	01010413          	addi	s0,sp,16
    80005680:	00813403          	ld	s0,8(sp)
    80005684:	01010113          	addi	sp,sp,16
    80005688:	ffffe317          	auipc	t1,0xffffe
    8000568c:	53c30067          	jr	1340(t1) # 80003bc4 <main>

0000000080005690 <either_copyout>:
    80005690:	ff010113          	addi	sp,sp,-16
    80005694:	00813023          	sd	s0,0(sp)
    80005698:	00113423          	sd	ra,8(sp)
    8000569c:	01010413          	addi	s0,sp,16
    800056a0:	02051663          	bnez	a0,800056cc <either_copyout+0x3c>
    800056a4:	00058513          	mv	a0,a1
    800056a8:	00060593          	mv	a1,a2
    800056ac:	0006861b          	sext.w	a2,a3
    800056b0:	00002097          	auipc	ra,0x2
    800056b4:	c54080e7          	jalr	-940(ra) # 80007304 <__memmove>
    800056b8:	00813083          	ld	ra,8(sp)
    800056bc:	00013403          	ld	s0,0(sp)
    800056c0:	00000513          	li	a0,0
    800056c4:	01010113          	addi	sp,sp,16
    800056c8:	00008067          	ret
    800056cc:	00003517          	auipc	a0,0x3
    800056d0:	a7450513          	addi	a0,a0,-1420 # 80008140 <_ZN3stm4coutE+0xa8>
    800056d4:	00001097          	auipc	ra,0x1
    800056d8:	928080e7          	jalr	-1752(ra) # 80005ffc <panic>

00000000800056dc <either_copyin>:
    800056dc:	ff010113          	addi	sp,sp,-16
    800056e0:	00813023          	sd	s0,0(sp)
    800056e4:	00113423          	sd	ra,8(sp)
    800056e8:	01010413          	addi	s0,sp,16
    800056ec:	02059463          	bnez	a1,80005714 <either_copyin+0x38>
    800056f0:	00060593          	mv	a1,a2
    800056f4:	0006861b          	sext.w	a2,a3
    800056f8:	00002097          	auipc	ra,0x2
    800056fc:	c0c080e7          	jalr	-1012(ra) # 80007304 <__memmove>
    80005700:	00813083          	ld	ra,8(sp)
    80005704:	00013403          	ld	s0,0(sp)
    80005708:	00000513          	li	a0,0
    8000570c:	01010113          	addi	sp,sp,16
    80005710:	00008067          	ret
    80005714:	00003517          	auipc	a0,0x3
    80005718:	a5450513          	addi	a0,a0,-1452 # 80008168 <_ZN3stm4coutE+0xd0>
    8000571c:	00001097          	auipc	ra,0x1
    80005720:	8e0080e7          	jalr	-1824(ra) # 80005ffc <panic>

0000000080005724 <trapinit>:
    80005724:	ff010113          	addi	sp,sp,-16
    80005728:	00813423          	sd	s0,8(sp)
    8000572c:	01010413          	addi	s0,sp,16
    80005730:	00813403          	ld	s0,8(sp)
    80005734:	00003597          	auipc	a1,0x3
    80005738:	a5c58593          	addi	a1,a1,-1444 # 80008190 <_ZN3stm4coutE+0xf8>
    8000573c:	00006517          	auipc	a0,0x6
    80005740:	f1450513          	addi	a0,a0,-236 # 8000b650 <tickslock>
    80005744:	01010113          	addi	sp,sp,16
    80005748:	00001317          	auipc	t1,0x1
    8000574c:	5c030067          	jr	1472(t1) # 80006d08 <initlock>

0000000080005750 <trapinithart>:
    80005750:	ff010113          	addi	sp,sp,-16
    80005754:	00813423          	sd	s0,8(sp)
    80005758:	01010413          	addi	s0,sp,16
    8000575c:	00000797          	auipc	a5,0x0
    80005760:	2f478793          	addi	a5,a5,756 # 80005a50 <kernelvec>
    80005764:	10579073          	csrw	stvec,a5
    80005768:	00813403          	ld	s0,8(sp)
    8000576c:	01010113          	addi	sp,sp,16
    80005770:	00008067          	ret

0000000080005774 <usertrap>:
    80005774:	ff010113          	addi	sp,sp,-16
    80005778:	00813423          	sd	s0,8(sp)
    8000577c:	01010413          	addi	s0,sp,16
    80005780:	00813403          	ld	s0,8(sp)
    80005784:	01010113          	addi	sp,sp,16
    80005788:	00008067          	ret

000000008000578c <usertrapret>:
    8000578c:	ff010113          	addi	sp,sp,-16
    80005790:	00813423          	sd	s0,8(sp)
    80005794:	01010413          	addi	s0,sp,16
    80005798:	00813403          	ld	s0,8(sp)
    8000579c:	01010113          	addi	sp,sp,16
    800057a0:	00008067          	ret

00000000800057a4 <kerneltrap>:
    800057a4:	fe010113          	addi	sp,sp,-32
    800057a8:	00813823          	sd	s0,16(sp)
    800057ac:	00113c23          	sd	ra,24(sp)
    800057b0:	00913423          	sd	s1,8(sp)
    800057b4:	02010413          	addi	s0,sp,32
    800057b8:	142025f3          	csrr	a1,scause
    800057bc:	100027f3          	csrr	a5,sstatus
    800057c0:	0027f793          	andi	a5,a5,2
    800057c4:	10079c63          	bnez	a5,800058dc <kerneltrap+0x138>
    800057c8:	142027f3          	csrr	a5,scause
    800057cc:	0207ce63          	bltz	a5,80005808 <kerneltrap+0x64>
    800057d0:	00003517          	auipc	a0,0x3
    800057d4:	a0850513          	addi	a0,a0,-1528 # 800081d8 <_ZN3stm4coutE+0x140>
    800057d8:	00001097          	auipc	ra,0x1
    800057dc:	880080e7          	jalr	-1920(ra) # 80006058 <__printf>
    800057e0:	141025f3          	csrr	a1,sepc
    800057e4:	14302673          	csrr	a2,stval
    800057e8:	00003517          	auipc	a0,0x3
    800057ec:	a0050513          	addi	a0,a0,-1536 # 800081e8 <_ZN3stm4coutE+0x150>
    800057f0:	00001097          	auipc	ra,0x1
    800057f4:	868080e7          	jalr	-1944(ra) # 80006058 <__printf>
    800057f8:	00003517          	auipc	a0,0x3
    800057fc:	a0850513          	addi	a0,a0,-1528 # 80008200 <_ZN3stm4coutE+0x168>
    80005800:	00000097          	auipc	ra,0x0
    80005804:	7fc080e7          	jalr	2044(ra) # 80005ffc <panic>
    80005808:	0ff7f713          	andi	a4,a5,255
    8000580c:	00900693          	li	a3,9
    80005810:	04d70063          	beq	a4,a3,80005850 <kerneltrap+0xac>
    80005814:	fff00713          	li	a4,-1
    80005818:	03f71713          	slli	a4,a4,0x3f
    8000581c:	00170713          	addi	a4,a4,1
    80005820:	fae798e3          	bne	a5,a4,800057d0 <kerneltrap+0x2c>
    80005824:	00000097          	auipc	ra,0x0
    80005828:	e00080e7          	jalr	-512(ra) # 80005624 <cpuid>
    8000582c:	06050663          	beqz	a0,80005898 <kerneltrap+0xf4>
    80005830:	144027f3          	csrr	a5,sip
    80005834:	ffd7f793          	andi	a5,a5,-3
    80005838:	14479073          	csrw	sip,a5
    8000583c:	01813083          	ld	ra,24(sp)
    80005840:	01013403          	ld	s0,16(sp)
    80005844:	00813483          	ld	s1,8(sp)
    80005848:	02010113          	addi	sp,sp,32
    8000584c:	00008067          	ret
    80005850:	00000097          	auipc	ra,0x0
    80005854:	3c4080e7          	jalr	964(ra) # 80005c14 <plic_claim>
    80005858:	00a00793          	li	a5,10
    8000585c:	00050493          	mv	s1,a0
    80005860:	06f50863          	beq	a0,a5,800058d0 <kerneltrap+0x12c>
    80005864:	fc050ce3          	beqz	a0,8000583c <kerneltrap+0x98>
    80005868:	00050593          	mv	a1,a0
    8000586c:	00003517          	auipc	a0,0x3
    80005870:	94c50513          	addi	a0,a0,-1716 # 800081b8 <_ZN3stm4coutE+0x120>
    80005874:	00000097          	auipc	ra,0x0
    80005878:	7e4080e7          	jalr	2020(ra) # 80006058 <__printf>
    8000587c:	01013403          	ld	s0,16(sp)
    80005880:	01813083          	ld	ra,24(sp)
    80005884:	00048513          	mv	a0,s1
    80005888:	00813483          	ld	s1,8(sp)
    8000588c:	02010113          	addi	sp,sp,32
    80005890:	00000317          	auipc	t1,0x0
    80005894:	3bc30067          	jr	956(t1) # 80005c4c <plic_complete>
    80005898:	00006517          	auipc	a0,0x6
    8000589c:	db850513          	addi	a0,a0,-584 # 8000b650 <tickslock>
    800058a0:	00001097          	auipc	ra,0x1
    800058a4:	48c080e7          	jalr	1164(ra) # 80006d2c <acquire>
    800058a8:	00005717          	auipc	a4,0x5
    800058ac:	bfc70713          	addi	a4,a4,-1028 # 8000a4a4 <ticks>
    800058b0:	00072783          	lw	a5,0(a4)
    800058b4:	00006517          	auipc	a0,0x6
    800058b8:	d9c50513          	addi	a0,a0,-612 # 8000b650 <tickslock>
    800058bc:	0017879b          	addiw	a5,a5,1
    800058c0:	00f72023          	sw	a5,0(a4)
    800058c4:	00001097          	auipc	ra,0x1
    800058c8:	534080e7          	jalr	1332(ra) # 80006df8 <release>
    800058cc:	f65ff06f          	j	80005830 <kerneltrap+0x8c>
    800058d0:	00001097          	auipc	ra,0x1
    800058d4:	090080e7          	jalr	144(ra) # 80006960 <uartintr>
    800058d8:	fa5ff06f          	j	8000587c <kerneltrap+0xd8>
    800058dc:	00003517          	auipc	a0,0x3
    800058e0:	8bc50513          	addi	a0,a0,-1860 # 80008198 <_ZN3stm4coutE+0x100>
    800058e4:	00000097          	auipc	ra,0x0
    800058e8:	718080e7          	jalr	1816(ra) # 80005ffc <panic>

00000000800058ec <clockintr>:
    800058ec:	fe010113          	addi	sp,sp,-32
    800058f0:	00813823          	sd	s0,16(sp)
    800058f4:	00913423          	sd	s1,8(sp)
    800058f8:	00113c23          	sd	ra,24(sp)
    800058fc:	02010413          	addi	s0,sp,32
    80005900:	00006497          	auipc	s1,0x6
    80005904:	d5048493          	addi	s1,s1,-688 # 8000b650 <tickslock>
    80005908:	00048513          	mv	a0,s1
    8000590c:	00001097          	auipc	ra,0x1
    80005910:	420080e7          	jalr	1056(ra) # 80006d2c <acquire>
    80005914:	00005717          	auipc	a4,0x5
    80005918:	b9070713          	addi	a4,a4,-1136 # 8000a4a4 <ticks>
    8000591c:	00072783          	lw	a5,0(a4)
    80005920:	01013403          	ld	s0,16(sp)
    80005924:	01813083          	ld	ra,24(sp)
    80005928:	00048513          	mv	a0,s1
    8000592c:	0017879b          	addiw	a5,a5,1
    80005930:	00813483          	ld	s1,8(sp)
    80005934:	00f72023          	sw	a5,0(a4)
    80005938:	02010113          	addi	sp,sp,32
    8000593c:	00001317          	auipc	t1,0x1
    80005940:	4bc30067          	jr	1212(t1) # 80006df8 <release>

0000000080005944 <devintr>:
    80005944:	142027f3          	csrr	a5,scause
    80005948:	00000513          	li	a0,0
    8000594c:	0007c463          	bltz	a5,80005954 <devintr+0x10>
    80005950:	00008067          	ret
    80005954:	fe010113          	addi	sp,sp,-32
    80005958:	00813823          	sd	s0,16(sp)
    8000595c:	00113c23          	sd	ra,24(sp)
    80005960:	00913423          	sd	s1,8(sp)
    80005964:	02010413          	addi	s0,sp,32
    80005968:	0ff7f713          	andi	a4,a5,255
    8000596c:	00900693          	li	a3,9
    80005970:	04d70c63          	beq	a4,a3,800059c8 <devintr+0x84>
    80005974:	fff00713          	li	a4,-1
    80005978:	03f71713          	slli	a4,a4,0x3f
    8000597c:	00170713          	addi	a4,a4,1
    80005980:	00e78c63          	beq	a5,a4,80005998 <devintr+0x54>
    80005984:	01813083          	ld	ra,24(sp)
    80005988:	01013403          	ld	s0,16(sp)
    8000598c:	00813483          	ld	s1,8(sp)
    80005990:	02010113          	addi	sp,sp,32
    80005994:	00008067          	ret
    80005998:	00000097          	auipc	ra,0x0
    8000599c:	c8c080e7          	jalr	-884(ra) # 80005624 <cpuid>
    800059a0:	06050663          	beqz	a0,80005a0c <devintr+0xc8>
    800059a4:	144027f3          	csrr	a5,sip
    800059a8:	ffd7f793          	andi	a5,a5,-3
    800059ac:	14479073          	csrw	sip,a5
    800059b0:	01813083          	ld	ra,24(sp)
    800059b4:	01013403          	ld	s0,16(sp)
    800059b8:	00813483          	ld	s1,8(sp)
    800059bc:	00200513          	li	a0,2
    800059c0:	02010113          	addi	sp,sp,32
    800059c4:	00008067          	ret
    800059c8:	00000097          	auipc	ra,0x0
    800059cc:	24c080e7          	jalr	588(ra) # 80005c14 <plic_claim>
    800059d0:	00a00793          	li	a5,10
    800059d4:	00050493          	mv	s1,a0
    800059d8:	06f50663          	beq	a0,a5,80005a44 <devintr+0x100>
    800059dc:	00100513          	li	a0,1
    800059e0:	fa0482e3          	beqz	s1,80005984 <devintr+0x40>
    800059e4:	00048593          	mv	a1,s1
    800059e8:	00002517          	auipc	a0,0x2
    800059ec:	7d050513          	addi	a0,a0,2000 # 800081b8 <_ZN3stm4coutE+0x120>
    800059f0:	00000097          	auipc	ra,0x0
    800059f4:	668080e7          	jalr	1640(ra) # 80006058 <__printf>
    800059f8:	00048513          	mv	a0,s1
    800059fc:	00000097          	auipc	ra,0x0
    80005a00:	250080e7          	jalr	592(ra) # 80005c4c <plic_complete>
    80005a04:	00100513          	li	a0,1
    80005a08:	f7dff06f          	j	80005984 <devintr+0x40>
    80005a0c:	00006517          	auipc	a0,0x6
    80005a10:	c4450513          	addi	a0,a0,-956 # 8000b650 <tickslock>
    80005a14:	00001097          	auipc	ra,0x1
    80005a18:	318080e7          	jalr	792(ra) # 80006d2c <acquire>
    80005a1c:	00005717          	auipc	a4,0x5
    80005a20:	a8870713          	addi	a4,a4,-1400 # 8000a4a4 <ticks>
    80005a24:	00072783          	lw	a5,0(a4)
    80005a28:	00006517          	auipc	a0,0x6
    80005a2c:	c2850513          	addi	a0,a0,-984 # 8000b650 <tickslock>
    80005a30:	0017879b          	addiw	a5,a5,1
    80005a34:	00f72023          	sw	a5,0(a4)
    80005a38:	00001097          	auipc	ra,0x1
    80005a3c:	3c0080e7          	jalr	960(ra) # 80006df8 <release>
    80005a40:	f65ff06f          	j	800059a4 <devintr+0x60>
    80005a44:	00001097          	auipc	ra,0x1
    80005a48:	f1c080e7          	jalr	-228(ra) # 80006960 <uartintr>
    80005a4c:	fadff06f          	j	800059f8 <devintr+0xb4>

0000000080005a50 <kernelvec>:
    80005a50:	f0010113          	addi	sp,sp,-256
    80005a54:	00113023          	sd	ra,0(sp)
    80005a58:	00213423          	sd	sp,8(sp)
    80005a5c:	00313823          	sd	gp,16(sp)
    80005a60:	00413c23          	sd	tp,24(sp)
    80005a64:	02513023          	sd	t0,32(sp)
    80005a68:	02613423          	sd	t1,40(sp)
    80005a6c:	02713823          	sd	t2,48(sp)
    80005a70:	02813c23          	sd	s0,56(sp)
    80005a74:	04913023          	sd	s1,64(sp)
    80005a78:	04a13423          	sd	a0,72(sp)
    80005a7c:	04b13823          	sd	a1,80(sp)
    80005a80:	04c13c23          	sd	a2,88(sp)
    80005a84:	06d13023          	sd	a3,96(sp)
    80005a88:	06e13423          	sd	a4,104(sp)
    80005a8c:	06f13823          	sd	a5,112(sp)
    80005a90:	07013c23          	sd	a6,120(sp)
    80005a94:	09113023          	sd	a7,128(sp)
    80005a98:	09213423          	sd	s2,136(sp)
    80005a9c:	09313823          	sd	s3,144(sp)
    80005aa0:	09413c23          	sd	s4,152(sp)
    80005aa4:	0b513023          	sd	s5,160(sp)
    80005aa8:	0b613423          	sd	s6,168(sp)
    80005aac:	0b713823          	sd	s7,176(sp)
    80005ab0:	0b813c23          	sd	s8,184(sp)
    80005ab4:	0d913023          	sd	s9,192(sp)
    80005ab8:	0da13423          	sd	s10,200(sp)
    80005abc:	0db13823          	sd	s11,208(sp)
    80005ac0:	0dc13c23          	sd	t3,216(sp)
    80005ac4:	0fd13023          	sd	t4,224(sp)
    80005ac8:	0fe13423          	sd	t5,232(sp)
    80005acc:	0ff13823          	sd	t6,240(sp)
    80005ad0:	cd5ff0ef          	jal	ra,800057a4 <kerneltrap>
    80005ad4:	00013083          	ld	ra,0(sp)
    80005ad8:	00813103          	ld	sp,8(sp)
    80005adc:	01013183          	ld	gp,16(sp)
    80005ae0:	02013283          	ld	t0,32(sp)
    80005ae4:	02813303          	ld	t1,40(sp)
    80005ae8:	03013383          	ld	t2,48(sp)
    80005aec:	03813403          	ld	s0,56(sp)
    80005af0:	04013483          	ld	s1,64(sp)
    80005af4:	04813503          	ld	a0,72(sp)
    80005af8:	05013583          	ld	a1,80(sp)
    80005afc:	05813603          	ld	a2,88(sp)
    80005b00:	06013683          	ld	a3,96(sp)
    80005b04:	06813703          	ld	a4,104(sp)
    80005b08:	07013783          	ld	a5,112(sp)
    80005b0c:	07813803          	ld	a6,120(sp)
    80005b10:	08013883          	ld	a7,128(sp)
    80005b14:	08813903          	ld	s2,136(sp)
    80005b18:	09013983          	ld	s3,144(sp)
    80005b1c:	09813a03          	ld	s4,152(sp)
    80005b20:	0a013a83          	ld	s5,160(sp)
    80005b24:	0a813b03          	ld	s6,168(sp)
    80005b28:	0b013b83          	ld	s7,176(sp)
    80005b2c:	0b813c03          	ld	s8,184(sp)
    80005b30:	0c013c83          	ld	s9,192(sp)
    80005b34:	0c813d03          	ld	s10,200(sp)
    80005b38:	0d013d83          	ld	s11,208(sp)
    80005b3c:	0d813e03          	ld	t3,216(sp)
    80005b40:	0e013e83          	ld	t4,224(sp)
    80005b44:	0e813f03          	ld	t5,232(sp)
    80005b48:	0f013f83          	ld	t6,240(sp)
    80005b4c:	10010113          	addi	sp,sp,256
    80005b50:	10200073          	sret
    80005b54:	00000013          	nop
    80005b58:	00000013          	nop
    80005b5c:	00000013          	nop

0000000080005b60 <timervec>:
    80005b60:	34051573          	csrrw	a0,mscratch,a0
    80005b64:	00b53023          	sd	a1,0(a0)
    80005b68:	00c53423          	sd	a2,8(a0)
    80005b6c:	00d53823          	sd	a3,16(a0)
    80005b70:	01853583          	ld	a1,24(a0)
    80005b74:	02053603          	ld	a2,32(a0)
    80005b78:	0005b683          	ld	a3,0(a1)
    80005b7c:	00c686b3          	add	a3,a3,a2
    80005b80:	00d5b023          	sd	a3,0(a1)
    80005b84:	00200593          	li	a1,2
    80005b88:	14459073          	csrw	sip,a1
    80005b8c:	01053683          	ld	a3,16(a0)
    80005b90:	00853603          	ld	a2,8(a0)
    80005b94:	00053583          	ld	a1,0(a0)
    80005b98:	34051573          	csrrw	a0,mscratch,a0
    80005b9c:	30200073          	mret

0000000080005ba0 <plicinit>:
    80005ba0:	ff010113          	addi	sp,sp,-16
    80005ba4:	00813423          	sd	s0,8(sp)
    80005ba8:	01010413          	addi	s0,sp,16
    80005bac:	00813403          	ld	s0,8(sp)
    80005bb0:	0c0007b7          	lui	a5,0xc000
    80005bb4:	00100713          	li	a4,1
    80005bb8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80005bbc:	00e7a223          	sw	a4,4(a5)
    80005bc0:	01010113          	addi	sp,sp,16
    80005bc4:	00008067          	ret

0000000080005bc8 <plicinithart>:
    80005bc8:	ff010113          	addi	sp,sp,-16
    80005bcc:	00813023          	sd	s0,0(sp)
    80005bd0:	00113423          	sd	ra,8(sp)
    80005bd4:	01010413          	addi	s0,sp,16
    80005bd8:	00000097          	auipc	ra,0x0
    80005bdc:	a4c080e7          	jalr	-1460(ra) # 80005624 <cpuid>
    80005be0:	0085171b          	slliw	a4,a0,0x8
    80005be4:	0c0027b7          	lui	a5,0xc002
    80005be8:	00e787b3          	add	a5,a5,a4
    80005bec:	40200713          	li	a4,1026
    80005bf0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005bf4:	00813083          	ld	ra,8(sp)
    80005bf8:	00013403          	ld	s0,0(sp)
    80005bfc:	00d5151b          	slliw	a0,a0,0xd
    80005c00:	0c2017b7          	lui	a5,0xc201
    80005c04:	00a78533          	add	a0,a5,a0
    80005c08:	00052023          	sw	zero,0(a0)
    80005c0c:	01010113          	addi	sp,sp,16
    80005c10:	00008067          	ret

0000000080005c14 <plic_claim>:
    80005c14:	ff010113          	addi	sp,sp,-16
    80005c18:	00813023          	sd	s0,0(sp)
    80005c1c:	00113423          	sd	ra,8(sp)
    80005c20:	01010413          	addi	s0,sp,16
    80005c24:	00000097          	auipc	ra,0x0
    80005c28:	a00080e7          	jalr	-1536(ra) # 80005624 <cpuid>
    80005c2c:	00813083          	ld	ra,8(sp)
    80005c30:	00013403          	ld	s0,0(sp)
    80005c34:	00d5151b          	slliw	a0,a0,0xd
    80005c38:	0c2017b7          	lui	a5,0xc201
    80005c3c:	00a78533          	add	a0,a5,a0
    80005c40:	00452503          	lw	a0,4(a0)
    80005c44:	01010113          	addi	sp,sp,16
    80005c48:	00008067          	ret

0000000080005c4c <plic_complete>:
    80005c4c:	fe010113          	addi	sp,sp,-32
    80005c50:	00813823          	sd	s0,16(sp)
    80005c54:	00913423          	sd	s1,8(sp)
    80005c58:	00113c23          	sd	ra,24(sp)
    80005c5c:	02010413          	addi	s0,sp,32
    80005c60:	00050493          	mv	s1,a0
    80005c64:	00000097          	auipc	ra,0x0
    80005c68:	9c0080e7          	jalr	-1600(ra) # 80005624 <cpuid>
    80005c6c:	01813083          	ld	ra,24(sp)
    80005c70:	01013403          	ld	s0,16(sp)
    80005c74:	00d5179b          	slliw	a5,a0,0xd
    80005c78:	0c201737          	lui	a4,0xc201
    80005c7c:	00f707b3          	add	a5,a4,a5
    80005c80:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005c84:	00813483          	ld	s1,8(sp)
    80005c88:	02010113          	addi	sp,sp,32
    80005c8c:	00008067          	ret

0000000080005c90 <consolewrite>:
    80005c90:	fb010113          	addi	sp,sp,-80
    80005c94:	04813023          	sd	s0,64(sp)
    80005c98:	04113423          	sd	ra,72(sp)
    80005c9c:	02913c23          	sd	s1,56(sp)
    80005ca0:	03213823          	sd	s2,48(sp)
    80005ca4:	03313423          	sd	s3,40(sp)
    80005ca8:	03413023          	sd	s4,32(sp)
    80005cac:	01513c23          	sd	s5,24(sp)
    80005cb0:	05010413          	addi	s0,sp,80
    80005cb4:	06c05c63          	blez	a2,80005d2c <consolewrite+0x9c>
    80005cb8:	00060993          	mv	s3,a2
    80005cbc:	00050a13          	mv	s4,a0
    80005cc0:	00058493          	mv	s1,a1
    80005cc4:	00000913          	li	s2,0
    80005cc8:	fff00a93          	li	s5,-1
    80005ccc:	01c0006f          	j	80005ce8 <consolewrite+0x58>
    80005cd0:	fbf44503          	lbu	a0,-65(s0)
    80005cd4:	0019091b          	addiw	s2,s2,1
    80005cd8:	00148493          	addi	s1,s1,1
    80005cdc:	00001097          	auipc	ra,0x1
    80005ce0:	a9c080e7          	jalr	-1380(ra) # 80006778 <uartputc>
    80005ce4:	03298063          	beq	s3,s2,80005d04 <consolewrite+0x74>
    80005ce8:	00048613          	mv	a2,s1
    80005cec:	00100693          	li	a3,1
    80005cf0:	000a0593          	mv	a1,s4
    80005cf4:	fbf40513          	addi	a0,s0,-65
    80005cf8:	00000097          	auipc	ra,0x0
    80005cfc:	9e4080e7          	jalr	-1564(ra) # 800056dc <either_copyin>
    80005d00:	fd5518e3          	bne	a0,s5,80005cd0 <consolewrite+0x40>
    80005d04:	04813083          	ld	ra,72(sp)
    80005d08:	04013403          	ld	s0,64(sp)
    80005d0c:	03813483          	ld	s1,56(sp)
    80005d10:	02813983          	ld	s3,40(sp)
    80005d14:	02013a03          	ld	s4,32(sp)
    80005d18:	01813a83          	ld	s5,24(sp)
    80005d1c:	00090513          	mv	a0,s2
    80005d20:	03013903          	ld	s2,48(sp)
    80005d24:	05010113          	addi	sp,sp,80
    80005d28:	00008067          	ret
    80005d2c:	00000913          	li	s2,0
    80005d30:	fd5ff06f          	j	80005d04 <consolewrite+0x74>

0000000080005d34 <consoleread>:
    80005d34:	f9010113          	addi	sp,sp,-112
    80005d38:	06813023          	sd	s0,96(sp)
    80005d3c:	04913c23          	sd	s1,88(sp)
    80005d40:	05213823          	sd	s2,80(sp)
    80005d44:	05313423          	sd	s3,72(sp)
    80005d48:	05413023          	sd	s4,64(sp)
    80005d4c:	03513c23          	sd	s5,56(sp)
    80005d50:	03613823          	sd	s6,48(sp)
    80005d54:	03713423          	sd	s7,40(sp)
    80005d58:	03813023          	sd	s8,32(sp)
    80005d5c:	06113423          	sd	ra,104(sp)
    80005d60:	01913c23          	sd	s9,24(sp)
    80005d64:	07010413          	addi	s0,sp,112
    80005d68:	00060b93          	mv	s7,a2
    80005d6c:	00050913          	mv	s2,a0
    80005d70:	00058c13          	mv	s8,a1
    80005d74:	00060b1b          	sext.w	s6,a2
    80005d78:	00006497          	auipc	s1,0x6
    80005d7c:	90048493          	addi	s1,s1,-1792 # 8000b678 <cons>
    80005d80:	00400993          	li	s3,4
    80005d84:	fff00a13          	li	s4,-1
    80005d88:	00a00a93          	li	s5,10
    80005d8c:	05705e63          	blez	s7,80005de8 <consoleread+0xb4>
    80005d90:	09c4a703          	lw	a4,156(s1)
    80005d94:	0984a783          	lw	a5,152(s1)
    80005d98:	0007071b          	sext.w	a4,a4
    80005d9c:	08e78463          	beq	a5,a4,80005e24 <consoleread+0xf0>
    80005da0:	07f7f713          	andi	a4,a5,127
    80005da4:	00e48733          	add	a4,s1,a4
    80005da8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80005dac:	0017869b          	addiw	a3,a5,1
    80005db0:	08d4ac23          	sw	a3,152(s1)
    80005db4:	00070c9b          	sext.w	s9,a4
    80005db8:	0b370663          	beq	a4,s3,80005e64 <consoleread+0x130>
    80005dbc:	00100693          	li	a3,1
    80005dc0:	f9f40613          	addi	a2,s0,-97
    80005dc4:	000c0593          	mv	a1,s8
    80005dc8:	00090513          	mv	a0,s2
    80005dcc:	f8e40fa3          	sb	a4,-97(s0)
    80005dd0:	00000097          	auipc	ra,0x0
    80005dd4:	8c0080e7          	jalr	-1856(ra) # 80005690 <either_copyout>
    80005dd8:	01450863          	beq	a0,s4,80005de8 <consoleread+0xb4>
    80005ddc:	001c0c13          	addi	s8,s8,1
    80005de0:	fffb8b9b          	addiw	s7,s7,-1
    80005de4:	fb5c94e3          	bne	s9,s5,80005d8c <consoleread+0x58>
    80005de8:	000b851b          	sext.w	a0,s7
    80005dec:	06813083          	ld	ra,104(sp)
    80005df0:	06013403          	ld	s0,96(sp)
    80005df4:	05813483          	ld	s1,88(sp)
    80005df8:	05013903          	ld	s2,80(sp)
    80005dfc:	04813983          	ld	s3,72(sp)
    80005e00:	04013a03          	ld	s4,64(sp)
    80005e04:	03813a83          	ld	s5,56(sp)
    80005e08:	02813b83          	ld	s7,40(sp)
    80005e0c:	02013c03          	ld	s8,32(sp)
    80005e10:	01813c83          	ld	s9,24(sp)
    80005e14:	40ab053b          	subw	a0,s6,a0
    80005e18:	03013b03          	ld	s6,48(sp)
    80005e1c:	07010113          	addi	sp,sp,112
    80005e20:	00008067          	ret
    80005e24:	00001097          	auipc	ra,0x1
    80005e28:	1d8080e7          	jalr	472(ra) # 80006ffc <push_on>
    80005e2c:	0984a703          	lw	a4,152(s1)
    80005e30:	09c4a783          	lw	a5,156(s1)
    80005e34:	0007879b          	sext.w	a5,a5
    80005e38:	fef70ce3          	beq	a4,a5,80005e30 <consoleread+0xfc>
    80005e3c:	00001097          	auipc	ra,0x1
    80005e40:	234080e7          	jalr	564(ra) # 80007070 <pop_on>
    80005e44:	0984a783          	lw	a5,152(s1)
    80005e48:	07f7f713          	andi	a4,a5,127
    80005e4c:	00e48733          	add	a4,s1,a4
    80005e50:	01874703          	lbu	a4,24(a4)
    80005e54:	0017869b          	addiw	a3,a5,1
    80005e58:	08d4ac23          	sw	a3,152(s1)
    80005e5c:	00070c9b          	sext.w	s9,a4
    80005e60:	f5371ee3          	bne	a4,s3,80005dbc <consoleread+0x88>
    80005e64:	000b851b          	sext.w	a0,s7
    80005e68:	f96bf2e3          	bgeu	s7,s6,80005dec <consoleread+0xb8>
    80005e6c:	08f4ac23          	sw	a5,152(s1)
    80005e70:	f7dff06f          	j	80005dec <consoleread+0xb8>

0000000080005e74 <consputc>:
    80005e74:	10000793          	li	a5,256
    80005e78:	00f50663          	beq	a0,a5,80005e84 <consputc+0x10>
    80005e7c:	00001317          	auipc	t1,0x1
    80005e80:	9f430067          	jr	-1548(t1) # 80006870 <uartputc_sync>
    80005e84:	ff010113          	addi	sp,sp,-16
    80005e88:	00113423          	sd	ra,8(sp)
    80005e8c:	00813023          	sd	s0,0(sp)
    80005e90:	01010413          	addi	s0,sp,16
    80005e94:	00800513          	li	a0,8
    80005e98:	00001097          	auipc	ra,0x1
    80005e9c:	9d8080e7          	jalr	-1576(ra) # 80006870 <uartputc_sync>
    80005ea0:	02000513          	li	a0,32
    80005ea4:	00001097          	auipc	ra,0x1
    80005ea8:	9cc080e7          	jalr	-1588(ra) # 80006870 <uartputc_sync>
    80005eac:	00013403          	ld	s0,0(sp)
    80005eb0:	00813083          	ld	ra,8(sp)
    80005eb4:	00800513          	li	a0,8
    80005eb8:	01010113          	addi	sp,sp,16
    80005ebc:	00001317          	auipc	t1,0x1
    80005ec0:	9b430067          	jr	-1612(t1) # 80006870 <uartputc_sync>

0000000080005ec4 <consoleintr>:
    80005ec4:	fe010113          	addi	sp,sp,-32
    80005ec8:	00813823          	sd	s0,16(sp)
    80005ecc:	00913423          	sd	s1,8(sp)
    80005ed0:	01213023          	sd	s2,0(sp)
    80005ed4:	00113c23          	sd	ra,24(sp)
    80005ed8:	02010413          	addi	s0,sp,32
    80005edc:	00005917          	auipc	s2,0x5
    80005ee0:	79c90913          	addi	s2,s2,1948 # 8000b678 <cons>
    80005ee4:	00050493          	mv	s1,a0
    80005ee8:	00090513          	mv	a0,s2
    80005eec:	00001097          	auipc	ra,0x1
    80005ef0:	e40080e7          	jalr	-448(ra) # 80006d2c <acquire>
    80005ef4:	02048c63          	beqz	s1,80005f2c <consoleintr+0x68>
    80005ef8:	0a092783          	lw	a5,160(s2)
    80005efc:	09892703          	lw	a4,152(s2)
    80005f00:	07f00693          	li	a3,127
    80005f04:	40e7873b          	subw	a4,a5,a4
    80005f08:	02e6e263          	bltu	a3,a4,80005f2c <consoleintr+0x68>
    80005f0c:	00d00713          	li	a4,13
    80005f10:	04e48063          	beq	s1,a4,80005f50 <consoleintr+0x8c>
    80005f14:	07f7f713          	andi	a4,a5,127
    80005f18:	00e90733          	add	a4,s2,a4
    80005f1c:	0017879b          	addiw	a5,a5,1
    80005f20:	0af92023          	sw	a5,160(s2)
    80005f24:	00970c23          	sb	s1,24(a4)
    80005f28:	08f92e23          	sw	a5,156(s2)
    80005f2c:	01013403          	ld	s0,16(sp)
    80005f30:	01813083          	ld	ra,24(sp)
    80005f34:	00813483          	ld	s1,8(sp)
    80005f38:	00013903          	ld	s2,0(sp)
    80005f3c:	00005517          	auipc	a0,0x5
    80005f40:	73c50513          	addi	a0,a0,1852 # 8000b678 <cons>
    80005f44:	02010113          	addi	sp,sp,32
    80005f48:	00001317          	auipc	t1,0x1
    80005f4c:	eb030067          	jr	-336(t1) # 80006df8 <release>
    80005f50:	00a00493          	li	s1,10
    80005f54:	fc1ff06f          	j	80005f14 <consoleintr+0x50>

0000000080005f58 <consoleinit>:
    80005f58:	fe010113          	addi	sp,sp,-32
    80005f5c:	00113c23          	sd	ra,24(sp)
    80005f60:	00813823          	sd	s0,16(sp)
    80005f64:	00913423          	sd	s1,8(sp)
    80005f68:	02010413          	addi	s0,sp,32
    80005f6c:	00005497          	auipc	s1,0x5
    80005f70:	70c48493          	addi	s1,s1,1804 # 8000b678 <cons>
    80005f74:	00048513          	mv	a0,s1
    80005f78:	00002597          	auipc	a1,0x2
    80005f7c:	29858593          	addi	a1,a1,664 # 80008210 <_ZN3stm4coutE+0x178>
    80005f80:	00001097          	auipc	ra,0x1
    80005f84:	d88080e7          	jalr	-632(ra) # 80006d08 <initlock>
    80005f88:	00000097          	auipc	ra,0x0
    80005f8c:	7ac080e7          	jalr	1964(ra) # 80006734 <uartinit>
    80005f90:	01813083          	ld	ra,24(sp)
    80005f94:	01013403          	ld	s0,16(sp)
    80005f98:	00000797          	auipc	a5,0x0
    80005f9c:	d9c78793          	addi	a5,a5,-612 # 80005d34 <consoleread>
    80005fa0:	0af4bc23          	sd	a5,184(s1)
    80005fa4:	00000797          	auipc	a5,0x0
    80005fa8:	cec78793          	addi	a5,a5,-788 # 80005c90 <consolewrite>
    80005fac:	0cf4b023          	sd	a5,192(s1)
    80005fb0:	00813483          	ld	s1,8(sp)
    80005fb4:	02010113          	addi	sp,sp,32
    80005fb8:	00008067          	ret

0000000080005fbc <console_read>:
    80005fbc:	ff010113          	addi	sp,sp,-16
    80005fc0:	00813423          	sd	s0,8(sp)
    80005fc4:	01010413          	addi	s0,sp,16
    80005fc8:	00813403          	ld	s0,8(sp)
    80005fcc:	00005317          	auipc	t1,0x5
    80005fd0:	76433303          	ld	t1,1892(t1) # 8000b730 <devsw+0x10>
    80005fd4:	01010113          	addi	sp,sp,16
    80005fd8:	00030067          	jr	t1

0000000080005fdc <console_write>:
    80005fdc:	ff010113          	addi	sp,sp,-16
    80005fe0:	00813423          	sd	s0,8(sp)
    80005fe4:	01010413          	addi	s0,sp,16
    80005fe8:	00813403          	ld	s0,8(sp)
    80005fec:	00005317          	auipc	t1,0x5
    80005ff0:	74c33303          	ld	t1,1868(t1) # 8000b738 <devsw+0x18>
    80005ff4:	01010113          	addi	sp,sp,16
    80005ff8:	00030067          	jr	t1

0000000080005ffc <panic>:
    80005ffc:	fe010113          	addi	sp,sp,-32
    80006000:	00113c23          	sd	ra,24(sp)
    80006004:	00813823          	sd	s0,16(sp)
    80006008:	00913423          	sd	s1,8(sp)
    8000600c:	02010413          	addi	s0,sp,32
    80006010:	00050493          	mv	s1,a0
    80006014:	00002517          	auipc	a0,0x2
    80006018:	20450513          	addi	a0,a0,516 # 80008218 <_ZN3stm4coutE+0x180>
    8000601c:	00005797          	auipc	a5,0x5
    80006020:	7a07ae23          	sw	zero,1980(a5) # 8000b7d8 <pr+0x18>
    80006024:	00000097          	auipc	ra,0x0
    80006028:	034080e7          	jalr	52(ra) # 80006058 <__printf>
    8000602c:	00048513          	mv	a0,s1
    80006030:	00000097          	auipc	ra,0x0
    80006034:	028080e7          	jalr	40(ra) # 80006058 <__printf>
    80006038:	00002517          	auipc	a0,0x2
    8000603c:	1c050513          	addi	a0,a0,448 # 800081f8 <_ZN3stm4coutE+0x160>
    80006040:	00000097          	auipc	ra,0x0
    80006044:	018080e7          	jalr	24(ra) # 80006058 <__printf>
    80006048:	00100793          	li	a5,1
    8000604c:	00004717          	auipc	a4,0x4
    80006050:	44f72e23          	sw	a5,1116(a4) # 8000a4a8 <panicked>
    80006054:	0000006f          	j	80006054 <panic+0x58>

0000000080006058 <__printf>:
    80006058:	f3010113          	addi	sp,sp,-208
    8000605c:	08813023          	sd	s0,128(sp)
    80006060:	07313423          	sd	s3,104(sp)
    80006064:	09010413          	addi	s0,sp,144
    80006068:	05813023          	sd	s8,64(sp)
    8000606c:	08113423          	sd	ra,136(sp)
    80006070:	06913c23          	sd	s1,120(sp)
    80006074:	07213823          	sd	s2,112(sp)
    80006078:	07413023          	sd	s4,96(sp)
    8000607c:	05513c23          	sd	s5,88(sp)
    80006080:	05613823          	sd	s6,80(sp)
    80006084:	05713423          	sd	s7,72(sp)
    80006088:	03913c23          	sd	s9,56(sp)
    8000608c:	03a13823          	sd	s10,48(sp)
    80006090:	03b13423          	sd	s11,40(sp)
    80006094:	00005317          	auipc	t1,0x5
    80006098:	72c30313          	addi	t1,t1,1836 # 8000b7c0 <pr>
    8000609c:	01832c03          	lw	s8,24(t1)
    800060a0:	00b43423          	sd	a1,8(s0)
    800060a4:	00c43823          	sd	a2,16(s0)
    800060a8:	00d43c23          	sd	a3,24(s0)
    800060ac:	02e43023          	sd	a4,32(s0)
    800060b0:	02f43423          	sd	a5,40(s0)
    800060b4:	03043823          	sd	a6,48(s0)
    800060b8:	03143c23          	sd	a7,56(s0)
    800060bc:	00050993          	mv	s3,a0
    800060c0:	4a0c1663          	bnez	s8,8000656c <__printf+0x514>
    800060c4:	60098c63          	beqz	s3,800066dc <__printf+0x684>
    800060c8:	0009c503          	lbu	a0,0(s3)
    800060cc:	00840793          	addi	a5,s0,8
    800060d0:	f6f43c23          	sd	a5,-136(s0)
    800060d4:	00000493          	li	s1,0
    800060d8:	22050063          	beqz	a0,800062f8 <__printf+0x2a0>
    800060dc:	00002a37          	lui	s4,0x2
    800060e0:	00018ab7          	lui	s5,0x18
    800060e4:	000f4b37          	lui	s6,0xf4
    800060e8:	00989bb7          	lui	s7,0x989
    800060ec:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800060f0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800060f4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800060f8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800060fc:	00148c9b          	addiw	s9,s1,1
    80006100:	02500793          	li	a5,37
    80006104:	01998933          	add	s2,s3,s9
    80006108:	38f51263          	bne	a0,a5,8000648c <__printf+0x434>
    8000610c:	00094783          	lbu	a5,0(s2)
    80006110:	00078c9b          	sext.w	s9,a5
    80006114:	1e078263          	beqz	a5,800062f8 <__printf+0x2a0>
    80006118:	0024849b          	addiw	s1,s1,2
    8000611c:	07000713          	li	a4,112
    80006120:	00998933          	add	s2,s3,s1
    80006124:	38e78a63          	beq	a5,a4,800064b8 <__printf+0x460>
    80006128:	20f76863          	bltu	a4,a5,80006338 <__printf+0x2e0>
    8000612c:	42a78863          	beq	a5,a0,8000655c <__printf+0x504>
    80006130:	06400713          	li	a4,100
    80006134:	40e79663          	bne	a5,a4,80006540 <__printf+0x4e8>
    80006138:	f7843783          	ld	a5,-136(s0)
    8000613c:	0007a603          	lw	a2,0(a5)
    80006140:	00878793          	addi	a5,a5,8
    80006144:	f6f43c23          	sd	a5,-136(s0)
    80006148:	42064a63          	bltz	a2,8000657c <__printf+0x524>
    8000614c:	00a00713          	li	a4,10
    80006150:	02e677bb          	remuw	a5,a2,a4
    80006154:	00002d97          	auipc	s11,0x2
    80006158:	0ecd8d93          	addi	s11,s11,236 # 80008240 <digits>
    8000615c:	00900593          	li	a1,9
    80006160:	0006051b          	sext.w	a0,a2
    80006164:	00000c93          	li	s9,0
    80006168:	02079793          	slli	a5,a5,0x20
    8000616c:	0207d793          	srli	a5,a5,0x20
    80006170:	00fd87b3          	add	a5,s11,a5
    80006174:	0007c783          	lbu	a5,0(a5)
    80006178:	02e656bb          	divuw	a3,a2,a4
    8000617c:	f8f40023          	sb	a5,-128(s0)
    80006180:	14c5d863          	bge	a1,a2,800062d0 <__printf+0x278>
    80006184:	06300593          	li	a1,99
    80006188:	00100c93          	li	s9,1
    8000618c:	02e6f7bb          	remuw	a5,a3,a4
    80006190:	02079793          	slli	a5,a5,0x20
    80006194:	0207d793          	srli	a5,a5,0x20
    80006198:	00fd87b3          	add	a5,s11,a5
    8000619c:	0007c783          	lbu	a5,0(a5)
    800061a0:	02e6d73b          	divuw	a4,a3,a4
    800061a4:	f8f400a3          	sb	a5,-127(s0)
    800061a8:	12a5f463          	bgeu	a1,a0,800062d0 <__printf+0x278>
    800061ac:	00a00693          	li	a3,10
    800061b0:	00900593          	li	a1,9
    800061b4:	02d777bb          	remuw	a5,a4,a3
    800061b8:	02079793          	slli	a5,a5,0x20
    800061bc:	0207d793          	srli	a5,a5,0x20
    800061c0:	00fd87b3          	add	a5,s11,a5
    800061c4:	0007c503          	lbu	a0,0(a5)
    800061c8:	02d757bb          	divuw	a5,a4,a3
    800061cc:	f8a40123          	sb	a0,-126(s0)
    800061d0:	48e5f263          	bgeu	a1,a4,80006654 <__printf+0x5fc>
    800061d4:	06300513          	li	a0,99
    800061d8:	02d7f5bb          	remuw	a1,a5,a3
    800061dc:	02059593          	slli	a1,a1,0x20
    800061e0:	0205d593          	srli	a1,a1,0x20
    800061e4:	00bd85b3          	add	a1,s11,a1
    800061e8:	0005c583          	lbu	a1,0(a1)
    800061ec:	02d7d7bb          	divuw	a5,a5,a3
    800061f0:	f8b401a3          	sb	a1,-125(s0)
    800061f4:	48e57263          	bgeu	a0,a4,80006678 <__printf+0x620>
    800061f8:	3e700513          	li	a0,999
    800061fc:	02d7f5bb          	remuw	a1,a5,a3
    80006200:	02059593          	slli	a1,a1,0x20
    80006204:	0205d593          	srli	a1,a1,0x20
    80006208:	00bd85b3          	add	a1,s11,a1
    8000620c:	0005c583          	lbu	a1,0(a1)
    80006210:	02d7d7bb          	divuw	a5,a5,a3
    80006214:	f8b40223          	sb	a1,-124(s0)
    80006218:	46e57663          	bgeu	a0,a4,80006684 <__printf+0x62c>
    8000621c:	02d7f5bb          	remuw	a1,a5,a3
    80006220:	02059593          	slli	a1,a1,0x20
    80006224:	0205d593          	srli	a1,a1,0x20
    80006228:	00bd85b3          	add	a1,s11,a1
    8000622c:	0005c583          	lbu	a1,0(a1)
    80006230:	02d7d7bb          	divuw	a5,a5,a3
    80006234:	f8b402a3          	sb	a1,-123(s0)
    80006238:	46ea7863          	bgeu	s4,a4,800066a8 <__printf+0x650>
    8000623c:	02d7f5bb          	remuw	a1,a5,a3
    80006240:	02059593          	slli	a1,a1,0x20
    80006244:	0205d593          	srli	a1,a1,0x20
    80006248:	00bd85b3          	add	a1,s11,a1
    8000624c:	0005c583          	lbu	a1,0(a1)
    80006250:	02d7d7bb          	divuw	a5,a5,a3
    80006254:	f8b40323          	sb	a1,-122(s0)
    80006258:	3eeaf863          	bgeu	s5,a4,80006648 <__printf+0x5f0>
    8000625c:	02d7f5bb          	remuw	a1,a5,a3
    80006260:	02059593          	slli	a1,a1,0x20
    80006264:	0205d593          	srli	a1,a1,0x20
    80006268:	00bd85b3          	add	a1,s11,a1
    8000626c:	0005c583          	lbu	a1,0(a1)
    80006270:	02d7d7bb          	divuw	a5,a5,a3
    80006274:	f8b403a3          	sb	a1,-121(s0)
    80006278:	42eb7e63          	bgeu	s6,a4,800066b4 <__printf+0x65c>
    8000627c:	02d7f5bb          	remuw	a1,a5,a3
    80006280:	02059593          	slli	a1,a1,0x20
    80006284:	0205d593          	srli	a1,a1,0x20
    80006288:	00bd85b3          	add	a1,s11,a1
    8000628c:	0005c583          	lbu	a1,0(a1)
    80006290:	02d7d7bb          	divuw	a5,a5,a3
    80006294:	f8b40423          	sb	a1,-120(s0)
    80006298:	42ebfc63          	bgeu	s7,a4,800066d0 <__printf+0x678>
    8000629c:	02079793          	slli	a5,a5,0x20
    800062a0:	0207d793          	srli	a5,a5,0x20
    800062a4:	00fd8db3          	add	s11,s11,a5
    800062a8:	000dc703          	lbu	a4,0(s11)
    800062ac:	00a00793          	li	a5,10
    800062b0:	00900c93          	li	s9,9
    800062b4:	f8e404a3          	sb	a4,-119(s0)
    800062b8:	00065c63          	bgez	a2,800062d0 <__printf+0x278>
    800062bc:	f9040713          	addi	a4,s0,-112
    800062c0:	00f70733          	add	a4,a4,a5
    800062c4:	02d00693          	li	a3,45
    800062c8:	fed70823          	sb	a3,-16(a4)
    800062cc:	00078c93          	mv	s9,a5
    800062d0:	f8040793          	addi	a5,s0,-128
    800062d4:	01978cb3          	add	s9,a5,s9
    800062d8:	f7f40d13          	addi	s10,s0,-129
    800062dc:	000cc503          	lbu	a0,0(s9)
    800062e0:	fffc8c93          	addi	s9,s9,-1
    800062e4:	00000097          	auipc	ra,0x0
    800062e8:	b90080e7          	jalr	-1136(ra) # 80005e74 <consputc>
    800062ec:	ffac98e3          	bne	s9,s10,800062dc <__printf+0x284>
    800062f0:	00094503          	lbu	a0,0(s2)
    800062f4:	e00514e3          	bnez	a0,800060fc <__printf+0xa4>
    800062f8:	1a0c1663          	bnez	s8,800064a4 <__printf+0x44c>
    800062fc:	08813083          	ld	ra,136(sp)
    80006300:	08013403          	ld	s0,128(sp)
    80006304:	07813483          	ld	s1,120(sp)
    80006308:	07013903          	ld	s2,112(sp)
    8000630c:	06813983          	ld	s3,104(sp)
    80006310:	06013a03          	ld	s4,96(sp)
    80006314:	05813a83          	ld	s5,88(sp)
    80006318:	05013b03          	ld	s6,80(sp)
    8000631c:	04813b83          	ld	s7,72(sp)
    80006320:	04013c03          	ld	s8,64(sp)
    80006324:	03813c83          	ld	s9,56(sp)
    80006328:	03013d03          	ld	s10,48(sp)
    8000632c:	02813d83          	ld	s11,40(sp)
    80006330:	0d010113          	addi	sp,sp,208
    80006334:	00008067          	ret
    80006338:	07300713          	li	a4,115
    8000633c:	1ce78a63          	beq	a5,a4,80006510 <__printf+0x4b8>
    80006340:	07800713          	li	a4,120
    80006344:	1ee79e63          	bne	a5,a4,80006540 <__printf+0x4e8>
    80006348:	f7843783          	ld	a5,-136(s0)
    8000634c:	0007a703          	lw	a4,0(a5)
    80006350:	00878793          	addi	a5,a5,8
    80006354:	f6f43c23          	sd	a5,-136(s0)
    80006358:	28074263          	bltz	a4,800065dc <__printf+0x584>
    8000635c:	00002d97          	auipc	s11,0x2
    80006360:	ee4d8d93          	addi	s11,s11,-284 # 80008240 <digits>
    80006364:	00f77793          	andi	a5,a4,15
    80006368:	00fd87b3          	add	a5,s11,a5
    8000636c:	0007c683          	lbu	a3,0(a5)
    80006370:	00f00613          	li	a2,15
    80006374:	0007079b          	sext.w	a5,a4
    80006378:	f8d40023          	sb	a3,-128(s0)
    8000637c:	0047559b          	srliw	a1,a4,0x4
    80006380:	0047569b          	srliw	a3,a4,0x4
    80006384:	00000c93          	li	s9,0
    80006388:	0ee65063          	bge	a2,a4,80006468 <__printf+0x410>
    8000638c:	00f6f693          	andi	a3,a3,15
    80006390:	00dd86b3          	add	a3,s11,a3
    80006394:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006398:	0087d79b          	srliw	a5,a5,0x8
    8000639c:	00100c93          	li	s9,1
    800063a0:	f8d400a3          	sb	a3,-127(s0)
    800063a4:	0cb67263          	bgeu	a2,a1,80006468 <__printf+0x410>
    800063a8:	00f7f693          	andi	a3,a5,15
    800063ac:	00dd86b3          	add	a3,s11,a3
    800063b0:	0006c583          	lbu	a1,0(a3)
    800063b4:	00f00613          	li	a2,15
    800063b8:	0047d69b          	srliw	a3,a5,0x4
    800063bc:	f8b40123          	sb	a1,-126(s0)
    800063c0:	0047d593          	srli	a1,a5,0x4
    800063c4:	28f67e63          	bgeu	a2,a5,80006660 <__printf+0x608>
    800063c8:	00f6f693          	andi	a3,a3,15
    800063cc:	00dd86b3          	add	a3,s11,a3
    800063d0:	0006c503          	lbu	a0,0(a3)
    800063d4:	0087d813          	srli	a6,a5,0x8
    800063d8:	0087d69b          	srliw	a3,a5,0x8
    800063dc:	f8a401a3          	sb	a0,-125(s0)
    800063e0:	28b67663          	bgeu	a2,a1,8000666c <__printf+0x614>
    800063e4:	00f6f693          	andi	a3,a3,15
    800063e8:	00dd86b3          	add	a3,s11,a3
    800063ec:	0006c583          	lbu	a1,0(a3)
    800063f0:	00c7d513          	srli	a0,a5,0xc
    800063f4:	00c7d69b          	srliw	a3,a5,0xc
    800063f8:	f8b40223          	sb	a1,-124(s0)
    800063fc:	29067a63          	bgeu	a2,a6,80006690 <__printf+0x638>
    80006400:	00f6f693          	andi	a3,a3,15
    80006404:	00dd86b3          	add	a3,s11,a3
    80006408:	0006c583          	lbu	a1,0(a3)
    8000640c:	0107d813          	srli	a6,a5,0x10
    80006410:	0107d69b          	srliw	a3,a5,0x10
    80006414:	f8b402a3          	sb	a1,-123(s0)
    80006418:	28a67263          	bgeu	a2,a0,8000669c <__printf+0x644>
    8000641c:	00f6f693          	andi	a3,a3,15
    80006420:	00dd86b3          	add	a3,s11,a3
    80006424:	0006c683          	lbu	a3,0(a3)
    80006428:	0147d79b          	srliw	a5,a5,0x14
    8000642c:	f8d40323          	sb	a3,-122(s0)
    80006430:	21067663          	bgeu	a2,a6,8000663c <__printf+0x5e4>
    80006434:	02079793          	slli	a5,a5,0x20
    80006438:	0207d793          	srli	a5,a5,0x20
    8000643c:	00fd8db3          	add	s11,s11,a5
    80006440:	000dc683          	lbu	a3,0(s11)
    80006444:	00800793          	li	a5,8
    80006448:	00700c93          	li	s9,7
    8000644c:	f8d403a3          	sb	a3,-121(s0)
    80006450:	00075c63          	bgez	a4,80006468 <__printf+0x410>
    80006454:	f9040713          	addi	a4,s0,-112
    80006458:	00f70733          	add	a4,a4,a5
    8000645c:	02d00693          	li	a3,45
    80006460:	fed70823          	sb	a3,-16(a4)
    80006464:	00078c93          	mv	s9,a5
    80006468:	f8040793          	addi	a5,s0,-128
    8000646c:	01978cb3          	add	s9,a5,s9
    80006470:	f7f40d13          	addi	s10,s0,-129
    80006474:	000cc503          	lbu	a0,0(s9)
    80006478:	fffc8c93          	addi	s9,s9,-1
    8000647c:	00000097          	auipc	ra,0x0
    80006480:	9f8080e7          	jalr	-1544(ra) # 80005e74 <consputc>
    80006484:	ff9d18e3          	bne	s10,s9,80006474 <__printf+0x41c>
    80006488:	0100006f          	j	80006498 <__printf+0x440>
    8000648c:	00000097          	auipc	ra,0x0
    80006490:	9e8080e7          	jalr	-1560(ra) # 80005e74 <consputc>
    80006494:	000c8493          	mv	s1,s9
    80006498:	00094503          	lbu	a0,0(s2)
    8000649c:	c60510e3          	bnez	a0,800060fc <__printf+0xa4>
    800064a0:	e40c0ee3          	beqz	s8,800062fc <__printf+0x2a4>
    800064a4:	00005517          	auipc	a0,0x5
    800064a8:	31c50513          	addi	a0,a0,796 # 8000b7c0 <pr>
    800064ac:	00001097          	auipc	ra,0x1
    800064b0:	94c080e7          	jalr	-1716(ra) # 80006df8 <release>
    800064b4:	e49ff06f          	j	800062fc <__printf+0x2a4>
    800064b8:	f7843783          	ld	a5,-136(s0)
    800064bc:	03000513          	li	a0,48
    800064c0:	01000d13          	li	s10,16
    800064c4:	00878713          	addi	a4,a5,8
    800064c8:	0007bc83          	ld	s9,0(a5)
    800064cc:	f6e43c23          	sd	a4,-136(s0)
    800064d0:	00000097          	auipc	ra,0x0
    800064d4:	9a4080e7          	jalr	-1628(ra) # 80005e74 <consputc>
    800064d8:	07800513          	li	a0,120
    800064dc:	00000097          	auipc	ra,0x0
    800064e0:	998080e7          	jalr	-1640(ra) # 80005e74 <consputc>
    800064e4:	00002d97          	auipc	s11,0x2
    800064e8:	d5cd8d93          	addi	s11,s11,-676 # 80008240 <digits>
    800064ec:	03ccd793          	srli	a5,s9,0x3c
    800064f0:	00fd87b3          	add	a5,s11,a5
    800064f4:	0007c503          	lbu	a0,0(a5)
    800064f8:	fffd0d1b          	addiw	s10,s10,-1
    800064fc:	004c9c93          	slli	s9,s9,0x4
    80006500:	00000097          	auipc	ra,0x0
    80006504:	974080e7          	jalr	-1676(ra) # 80005e74 <consputc>
    80006508:	fe0d12e3          	bnez	s10,800064ec <__printf+0x494>
    8000650c:	f8dff06f          	j	80006498 <__printf+0x440>
    80006510:	f7843783          	ld	a5,-136(s0)
    80006514:	0007bc83          	ld	s9,0(a5)
    80006518:	00878793          	addi	a5,a5,8
    8000651c:	f6f43c23          	sd	a5,-136(s0)
    80006520:	000c9a63          	bnez	s9,80006534 <__printf+0x4dc>
    80006524:	1080006f          	j	8000662c <__printf+0x5d4>
    80006528:	001c8c93          	addi	s9,s9,1
    8000652c:	00000097          	auipc	ra,0x0
    80006530:	948080e7          	jalr	-1720(ra) # 80005e74 <consputc>
    80006534:	000cc503          	lbu	a0,0(s9)
    80006538:	fe0518e3          	bnez	a0,80006528 <__printf+0x4d0>
    8000653c:	f5dff06f          	j	80006498 <__printf+0x440>
    80006540:	02500513          	li	a0,37
    80006544:	00000097          	auipc	ra,0x0
    80006548:	930080e7          	jalr	-1744(ra) # 80005e74 <consputc>
    8000654c:	000c8513          	mv	a0,s9
    80006550:	00000097          	auipc	ra,0x0
    80006554:	924080e7          	jalr	-1756(ra) # 80005e74 <consputc>
    80006558:	f41ff06f          	j	80006498 <__printf+0x440>
    8000655c:	02500513          	li	a0,37
    80006560:	00000097          	auipc	ra,0x0
    80006564:	914080e7          	jalr	-1772(ra) # 80005e74 <consputc>
    80006568:	f31ff06f          	j	80006498 <__printf+0x440>
    8000656c:	00030513          	mv	a0,t1
    80006570:	00000097          	auipc	ra,0x0
    80006574:	7bc080e7          	jalr	1980(ra) # 80006d2c <acquire>
    80006578:	b4dff06f          	j	800060c4 <__printf+0x6c>
    8000657c:	40c0053b          	negw	a0,a2
    80006580:	00a00713          	li	a4,10
    80006584:	02e576bb          	remuw	a3,a0,a4
    80006588:	00002d97          	auipc	s11,0x2
    8000658c:	cb8d8d93          	addi	s11,s11,-840 # 80008240 <digits>
    80006590:	ff700593          	li	a1,-9
    80006594:	02069693          	slli	a3,a3,0x20
    80006598:	0206d693          	srli	a3,a3,0x20
    8000659c:	00dd86b3          	add	a3,s11,a3
    800065a0:	0006c683          	lbu	a3,0(a3)
    800065a4:	02e557bb          	divuw	a5,a0,a4
    800065a8:	f8d40023          	sb	a3,-128(s0)
    800065ac:	10b65e63          	bge	a2,a1,800066c8 <__printf+0x670>
    800065b0:	06300593          	li	a1,99
    800065b4:	02e7f6bb          	remuw	a3,a5,a4
    800065b8:	02069693          	slli	a3,a3,0x20
    800065bc:	0206d693          	srli	a3,a3,0x20
    800065c0:	00dd86b3          	add	a3,s11,a3
    800065c4:	0006c683          	lbu	a3,0(a3)
    800065c8:	02e7d73b          	divuw	a4,a5,a4
    800065cc:	00200793          	li	a5,2
    800065d0:	f8d400a3          	sb	a3,-127(s0)
    800065d4:	bca5ece3          	bltu	a1,a0,800061ac <__printf+0x154>
    800065d8:	ce5ff06f          	j	800062bc <__printf+0x264>
    800065dc:	40e007bb          	negw	a5,a4
    800065e0:	00002d97          	auipc	s11,0x2
    800065e4:	c60d8d93          	addi	s11,s11,-928 # 80008240 <digits>
    800065e8:	00f7f693          	andi	a3,a5,15
    800065ec:	00dd86b3          	add	a3,s11,a3
    800065f0:	0006c583          	lbu	a1,0(a3)
    800065f4:	ff100613          	li	a2,-15
    800065f8:	0047d69b          	srliw	a3,a5,0x4
    800065fc:	f8b40023          	sb	a1,-128(s0)
    80006600:	0047d59b          	srliw	a1,a5,0x4
    80006604:	0ac75e63          	bge	a4,a2,800066c0 <__printf+0x668>
    80006608:	00f6f693          	andi	a3,a3,15
    8000660c:	00dd86b3          	add	a3,s11,a3
    80006610:	0006c603          	lbu	a2,0(a3)
    80006614:	00f00693          	li	a3,15
    80006618:	0087d79b          	srliw	a5,a5,0x8
    8000661c:	f8c400a3          	sb	a2,-127(s0)
    80006620:	d8b6e4e3          	bltu	a3,a1,800063a8 <__printf+0x350>
    80006624:	00200793          	li	a5,2
    80006628:	e2dff06f          	j	80006454 <__printf+0x3fc>
    8000662c:	00002c97          	auipc	s9,0x2
    80006630:	bf4c8c93          	addi	s9,s9,-1036 # 80008220 <_ZN3stm4coutE+0x188>
    80006634:	02800513          	li	a0,40
    80006638:	ef1ff06f          	j	80006528 <__printf+0x4d0>
    8000663c:	00700793          	li	a5,7
    80006640:	00600c93          	li	s9,6
    80006644:	e0dff06f          	j	80006450 <__printf+0x3f8>
    80006648:	00700793          	li	a5,7
    8000664c:	00600c93          	li	s9,6
    80006650:	c69ff06f          	j	800062b8 <__printf+0x260>
    80006654:	00300793          	li	a5,3
    80006658:	00200c93          	li	s9,2
    8000665c:	c5dff06f          	j	800062b8 <__printf+0x260>
    80006660:	00300793          	li	a5,3
    80006664:	00200c93          	li	s9,2
    80006668:	de9ff06f          	j	80006450 <__printf+0x3f8>
    8000666c:	00400793          	li	a5,4
    80006670:	00300c93          	li	s9,3
    80006674:	dddff06f          	j	80006450 <__printf+0x3f8>
    80006678:	00400793          	li	a5,4
    8000667c:	00300c93          	li	s9,3
    80006680:	c39ff06f          	j	800062b8 <__printf+0x260>
    80006684:	00500793          	li	a5,5
    80006688:	00400c93          	li	s9,4
    8000668c:	c2dff06f          	j	800062b8 <__printf+0x260>
    80006690:	00500793          	li	a5,5
    80006694:	00400c93          	li	s9,4
    80006698:	db9ff06f          	j	80006450 <__printf+0x3f8>
    8000669c:	00600793          	li	a5,6
    800066a0:	00500c93          	li	s9,5
    800066a4:	dadff06f          	j	80006450 <__printf+0x3f8>
    800066a8:	00600793          	li	a5,6
    800066ac:	00500c93          	li	s9,5
    800066b0:	c09ff06f          	j	800062b8 <__printf+0x260>
    800066b4:	00800793          	li	a5,8
    800066b8:	00700c93          	li	s9,7
    800066bc:	bfdff06f          	j	800062b8 <__printf+0x260>
    800066c0:	00100793          	li	a5,1
    800066c4:	d91ff06f          	j	80006454 <__printf+0x3fc>
    800066c8:	00100793          	li	a5,1
    800066cc:	bf1ff06f          	j	800062bc <__printf+0x264>
    800066d0:	00900793          	li	a5,9
    800066d4:	00800c93          	li	s9,8
    800066d8:	be1ff06f          	j	800062b8 <__printf+0x260>
    800066dc:	00002517          	auipc	a0,0x2
    800066e0:	b4c50513          	addi	a0,a0,-1204 # 80008228 <_ZN3stm4coutE+0x190>
    800066e4:	00000097          	auipc	ra,0x0
    800066e8:	918080e7          	jalr	-1768(ra) # 80005ffc <panic>

00000000800066ec <printfinit>:
    800066ec:	fe010113          	addi	sp,sp,-32
    800066f0:	00813823          	sd	s0,16(sp)
    800066f4:	00913423          	sd	s1,8(sp)
    800066f8:	00113c23          	sd	ra,24(sp)
    800066fc:	02010413          	addi	s0,sp,32
    80006700:	00005497          	auipc	s1,0x5
    80006704:	0c048493          	addi	s1,s1,192 # 8000b7c0 <pr>
    80006708:	00048513          	mv	a0,s1
    8000670c:	00002597          	auipc	a1,0x2
    80006710:	b2c58593          	addi	a1,a1,-1236 # 80008238 <_ZN3stm4coutE+0x1a0>
    80006714:	00000097          	auipc	ra,0x0
    80006718:	5f4080e7          	jalr	1524(ra) # 80006d08 <initlock>
    8000671c:	01813083          	ld	ra,24(sp)
    80006720:	01013403          	ld	s0,16(sp)
    80006724:	0004ac23          	sw	zero,24(s1)
    80006728:	00813483          	ld	s1,8(sp)
    8000672c:	02010113          	addi	sp,sp,32
    80006730:	00008067          	ret

0000000080006734 <uartinit>:
    80006734:	ff010113          	addi	sp,sp,-16
    80006738:	00813423          	sd	s0,8(sp)
    8000673c:	01010413          	addi	s0,sp,16
    80006740:	100007b7          	lui	a5,0x10000
    80006744:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006748:	f8000713          	li	a4,-128
    8000674c:	00e781a3          	sb	a4,3(a5)
    80006750:	00300713          	li	a4,3
    80006754:	00e78023          	sb	a4,0(a5)
    80006758:	000780a3          	sb	zero,1(a5)
    8000675c:	00e781a3          	sb	a4,3(a5)
    80006760:	00700693          	li	a3,7
    80006764:	00d78123          	sb	a3,2(a5)
    80006768:	00e780a3          	sb	a4,1(a5)
    8000676c:	00813403          	ld	s0,8(sp)
    80006770:	01010113          	addi	sp,sp,16
    80006774:	00008067          	ret

0000000080006778 <uartputc>:
    80006778:	00004797          	auipc	a5,0x4
    8000677c:	d307a783          	lw	a5,-720(a5) # 8000a4a8 <panicked>
    80006780:	00078463          	beqz	a5,80006788 <uartputc+0x10>
    80006784:	0000006f          	j	80006784 <uartputc+0xc>
    80006788:	fd010113          	addi	sp,sp,-48
    8000678c:	02813023          	sd	s0,32(sp)
    80006790:	00913c23          	sd	s1,24(sp)
    80006794:	01213823          	sd	s2,16(sp)
    80006798:	01313423          	sd	s3,8(sp)
    8000679c:	02113423          	sd	ra,40(sp)
    800067a0:	03010413          	addi	s0,sp,48
    800067a4:	00004917          	auipc	s2,0x4
    800067a8:	d0c90913          	addi	s2,s2,-756 # 8000a4b0 <uart_tx_r>
    800067ac:	00093783          	ld	a5,0(s2)
    800067b0:	00004497          	auipc	s1,0x4
    800067b4:	d0848493          	addi	s1,s1,-760 # 8000a4b8 <uart_tx_w>
    800067b8:	0004b703          	ld	a4,0(s1)
    800067bc:	02078693          	addi	a3,a5,32
    800067c0:	00050993          	mv	s3,a0
    800067c4:	02e69c63          	bne	a3,a4,800067fc <uartputc+0x84>
    800067c8:	00001097          	auipc	ra,0x1
    800067cc:	834080e7          	jalr	-1996(ra) # 80006ffc <push_on>
    800067d0:	00093783          	ld	a5,0(s2)
    800067d4:	0004b703          	ld	a4,0(s1)
    800067d8:	02078793          	addi	a5,a5,32
    800067dc:	00e79463          	bne	a5,a4,800067e4 <uartputc+0x6c>
    800067e0:	0000006f          	j	800067e0 <uartputc+0x68>
    800067e4:	00001097          	auipc	ra,0x1
    800067e8:	88c080e7          	jalr	-1908(ra) # 80007070 <pop_on>
    800067ec:	00093783          	ld	a5,0(s2)
    800067f0:	0004b703          	ld	a4,0(s1)
    800067f4:	02078693          	addi	a3,a5,32
    800067f8:	fce688e3          	beq	a3,a4,800067c8 <uartputc+0x50>
    800067fc:	01f77693          	andi	a3,a4,31
    80006800:	00005597          	auipc	a1,0x5
    80006804:	fe058593          	addi	a1,a1,-32 # 8000b7e0 <uart_tx_buf>
    80006808:	00d586b3          	add	a3,a1,a3
    8000680c:	00170713          	addi	a4,a4,1
    80006810:	01368023          	sb	s3,0(a3)
    80006814:	00e4b023          	sd	a4,0(s1)
    80006818:	10000637          	lui	a2,0x10000
    8000681c:	02f71063          	bne	a4,a5,8000683c <uartputc+0xc4>
    80006820:	0340006f          	j	80006854 <uartputc+0xdc>
    80006824:	00074703          	lbu	a4,0(a4)
    80006828:	00f93023          	sd	a5,0(s2)
    8000682c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006830:	00093783          	ld	a5,0(s2)
    80006834:	0004b703          	ld	a4,0(s1)
    80006838:	00f70e63          	beq	a4,a5,80006854 <uartputc+0xdc>
    8000683c:	00564683          	lbu	a3,5(a2)
    80006840:	01f7f713          	andi	a4,a5,31
    80006844:	00e58733          	add	a4,a1,a4
    80006848:	0206f693          	andi	a3,a3,32
    8000684c:	00178793          	addi	a5,a5,1
    80006850:	fc069ae3          	bnez	a3,80006824 <uartputc+0xac>
    80006854:	02813083          	ld	ra,40(sp)
    80006858:	02013403          	ld	s0,32(sp)
    8000685c:	01813483          	ld	s1,24(sp)
    80006860:	01013903          	ld	s2,16(sp)
    80006864:	00813983          	ld	s3,8(sp)
    80006868:	03010113          	addi	sp,sp,48
    8000686c:	00008067          	ret

0000000080006870 <uartputc_sync>:
    80006870:	ff010113          	addi	sp,sp,-16
    80006874:	00813423          	sd	s0,8(sp)
    80006878:	01010413          	addi	s0,sp,16
    8000687c:	00004717          	auipc	a4,0x4
    80006880:	c2c72703          	lw	a4,-980(a4) # 8000a4a8 <panicked>
    80006884:	02071663          	bnez	a4,800068b0 <uartputc_sync+0x40>
    80006888:	00050793          	mv	a5,a0
    8000688c:	100006b7          	lui	a3,0x10000
    80006890:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006894:	02077713          	andi	a4,a4,32
    80006898:	fe070ce3          	beqz	a4,80006890 <uartputc_sync+0x20>
    8000689c:	0ff7f793          	andi	a5,a5,255
    800068a0:	00f68023          	sb	a5,0(a3)
    800068a4:	00813403          	ld	s0,8(sp)
    800068a8:	01010113          	addi	sp,sp,16
    800068ac:	00008067          	ret
    800068b0:	0000006f          	j	800068b0 <uartputc_sync+0x40>

00000000800068b4 <uartstart>:
    800068b4:	ff010113          	addi	sp,sp,-16
    800068b8:	00813423          	sd	s0,8(sp)
    800068bc:	01010413          	addi	s0,sp,16
    800068c0:	00004617          	auipc	a2,0x4
    800068c4:	bf060613          	addi	a2,a2,-1040 # 8000a4b0 <uart_tx_r>
    800068c8:	00004517          	auipc	a0,0x4
    800068cc:	bf050513          	addi	a0,a0,-1040 # 8000a4b8 <uart_tx_w>
    800068d0:	00063783          	ld	a5,0(a2)
    800068d4:	00053703          	ld	a4,0(a0)
    800068d8:	04f70263          	beq	a4,a5,8000691c <uartstart+0x68>
    800068dc:	100005b7          	lui	a1,0x10000
    800068e0:	00005817          	auipc	a6,0x5
    800068e4:	f0080813          	addi	a6,a6,-256 # 8000b7e0 <uart_tx_buf>
    800068e8:	01c0006f          	j	80006904 <uartstart+0x50>
    800068ec:	0006c703          	lbu	a4,0(a3)
    800068f0:	00f63023          	sd	a5,0(a2)
    800068f4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800068f8:	00063783          	ld	a5,0(a2)
    800068fc:	00053703          	ld	a4,0(a0)
    80006900:	00f70e63          	beq	a4,a5,8000691c <uartstart+0x68>
    80006904:	01f7f713          	andi	a4,a5,31
    80006908:	00e806b3          	add	a3,a6,a4
    8000690c:	0055c703          	lbu	a4,5(a1)
    80006910:	00178793          	addi	a5,a5,1
    80006914:	02077713          	andi	a4,a4,32
    80006918:	fc071ae3          	bnez	a4,800068ec <uartstart+0x38>
    8000691c:	00813403          	ld	s0,8(sp)
    80006920:	01010113          	addi	sp,sp,16
    80006924:	00008067          	ret

0000000080006928 <uartgetc>:
    80006928:	ff010113          	addi	sp,sp,-16
    8000692c:	00813423          	sd	s0,8(sp)
    80006930:	01010413          	addi	s0,sp,16
    80006934:	10000737          	lui	a4,0x10000
    80006938:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000693c:	0017f793          	andi	a5,a5,1
    80006940:	00078c63          	beqz	a5,80006958 <uartgetc+0x30>
    80006944:	00074503          	lbu	a0,0(a4)
    80006948:	0ff57513          	andi	a0,a0,255
    8000694c:	00813403          	ld	s0,8(sp)
    80006950:	01010113          	addi	sp,sp,16
    80006954:	00008067          	ret
    80006958:	fff00513          	li	a0,-1
    8000695c:	ff1ff06f          	j	8000694c <uartgetc+0x24>

0000000080006960 <uartintr>:
    80006960:	100007b7          	lui	a5,0x10000
    80006964:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006968:	0017f793          	andi	a5,a5,1
    8000696c:	0a078463          	beqz	a5,80006a14 <uartintr+0xb4>
    80006970:	fe010113          	addi	sp,sp,-32
    80006974:	00813823          	sd	s0,16(sp)
    80006978:	00913423          	sd	s1,8(sp)
    8000697c:	00113c23          	sd	ra,24(sp)
    80006980:	02010413          	addi	s0,sp,32
    80006984:	100004b7          	lui	s1,0x10000
    80006988:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000698c:	0ff57513          	andi	a0,a0,255
    80006990:	fffff097          	auipc	ra,0xfffff
    80006994:	534080e7          	jalr	1332(ra) # 80005ec4 <consoleintr>
    80006998:	0054c783          	lbu	a5,5(s1)
    8000699c:	0017f793          	andi	a5,a5,1
    800069a0:	fe0794e3          	bnez	a5,80006988 <uartintr+0x28>
    800069a4:	00004617          	auipc	a2,0x4
    800069a8:	b0c60613          	addi	a2,a2,-1268 # 8000a4b0 <uart_tx_r>
    800069ac:	00004517          	auipc	a0,0x4
    800069b0:	b0c50513          	addi	a0,a0,-1268 # 8000a4b8 <uart_tx_w>
    800069b4:	00063783          	ld	a5,0(a2)
    800069b8:	00053703          	ld	a4,0(a0)
    800069bc:	04f70263          	beq	a4,a5,80006a00 <uartintr+0xa0>
    800069c0:	100005b7          	lui	a1,0x10000
    800069c4:	00005817          	auipc	a6,0x5
    800069c8:	e1c80813          	addi	a6,a6,-484 # 8000b7e0 <uart_tx_buf>
    800069cc:	01c0006f          	j	800069e8 <uartintr+0x88>
    800069d0:	0006c703          	lbu	a4,0(a3)
    800069d4:	00f63023          	sd	a5,0(a2)
    800069d8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800069dc:	00063783          	ld	a5,0(a2)
    800069e0:	00053703          	ld	a4,0(a0)
    800069e4:	00f70e63          	beq	a4,a5,80006a00 <uartintr+0xa0>
    800069e8:	01f7f713          	andi	a4,a5,31
    800069ec:	00e806b3          	add	a3,a6,a4
    800069f0:	0055c703          	lbu	a4,5(a1)
    800069f4:	00178793          	addi	a5,a5,1
    800069f8:	02077713          	andi	a4,a4,32
    800069fc:	fc071ae3          	bnez	a4,800069d0 <uartintr+0x70>
    80006a00:	01813083          	ld	ra,24(sp)
    80006a04:	01013403          	ld	s0,16(sp)
    80006a08:	00813483          	ld	s1,8(sp)
    80006a0c:	02010113          	addi	sp,sp,32
    80006a10:	00008067          	ret
    80006a14:	00004617          	auipc	a2,0x4
    80006a18:	a9c60613          	addi	a2,a2,-1380 # 8000a4b0 <uart_tx_r>
    80006a1c:	00004517          	auipc	a0,0x4
    80006a20:	a9c50513          	addi	a0,a0,-1380 # 8000a4b8 <uart_tx_w>
    80006a24:	00063783          	ld	a5,0(a2)
    80006a28:	00053703          	ld	a4,0(a0)
    80006a2c:	04f70263          	beq	a4,a5,80006a70 <uartintr+0x110>
    80006a30:	100005b7          	lui	a1,0x10000
    80006a34:	00005817          	auipc	a6,0x5
    80006a38:	dac80813          	addi	a6,a6,-596 # 8000b7e0 <uart_tx_buf>
    80006a3c:	01c0006f          	j	80006a58 <uartintr+0xf8>
    80006a40:	0006c703          	lbu	a4,0(a3)
    80006a44:	00f63023          	sd	a5,0(a2)
    80006a48:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006a4c:	00063783          	ld	a5,0(a2)
    80006a50:	00053703          	ld	a4,0(a0)
    80006a54:	02f70063          	beq	a4,a5,80006a74 <uartintr+0x114>
    80006a58:	01f7f713          	andi	a4,a5,31
    80006a5c:	00e806b3          	add	a3,a6,a4
    80006a60:	0055c703          	lbu	a4,5(a1)
    80006a64:	00178793          	addi	a5,a5,1
    80006a68:	02077713          	andi	a4,a4,32
    80006a6c:	fc071ae3          	bnez	a4,80006a40 <uartintr+0xe0>
    80006a70:	00008067          	ret
    80006a74:	00008067          	ret

0000000080006a78 <kinit>:
    80006a78:	fc010113          	addi	sp,sp,-64
    80006a7c:	02913423          	sd	s1,40(sp)
    80006a80:	fffff7b7          	lui	a5,0xfffff
    80006a84:	00006497          	auipc	s1,0x6
    80006a88:	d7b48493          	addi	s1,s1,-645 # 8000c7ff <end+0xfff>
    80006a8c:	02813823          	sd	s0,48(sp)
    80006a90:	01313c23          	sd	s3,24(sp)
    80006a94:	00f4f4b3          	and	s1,s1,a5
    80006a98:	02113c23          	sd	ra,56(sp)
    80006a9c:	03213023          	sd	s2,32(sp)
    80006aa0:	01413823          	sd	s4,16(sp)
    80006aa4:	01513423          	sd	s5,8(sp)
    80006aa8:	04010413          	addi	s0,sp,64
    80006aac:	000017b7          	lui	a5,0x1
    80006ab0:	01100993          	li	s3,17
    80006ab4:	00f487b3          	add	a5,s1,a5
    80006ab8:	01b99993          	slli	s3,s3,0x1b
    80006abc:	06f9e063          	bltu	s3,a5,80006b1c <kinit+0xa4>
    80006ac0:	00005a97          	auipc	s5,0x5
    80006ac4:	d40a8a93          	addi	s5,s5,-704 # 8000b800 <end>
    80006ac8:	0754ec63          	bltu	s1,s5,80006b40 <kinit+0xc8>
    80006acc:	0734fa63          	bgeu	s1,s3,80006b40 <kinit+0xc8>
    80006ad0:	00088a37          	lui	s4,0x88
    80006ad4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006ad8:	00004917          	auipc	s2,0x4
    80006adc:	9e890913          	addi	s2,s2,-1560 # 8000a4c0 <kmem>
    80006ae0:	00ca1a13          	slli	s4,s4,0xc
    80006ae4:	0140006f          	j	80006af8 <kinit+0x80>
    80006ae8:	000017b7          	lui	a5,0x1
    80006aec:	00f484b3          	add	s1,s1,a5
    80006af0:	0554e863          	bltu	s1,s5,80006b40 <kinit+0xc8>
    80006af4:	0534f663          	bgeu	s1,s3,80006b40 <kinit+0xc8>
    80006af8:	00001637          	lui	a2,0x1
    80006afc:	00100593          	li	a1,1
    80006b00:	00048513          	mv	a0,s1
    80006b04:	00000097          	auipc	ra,0x0
    80006b08:	5e4080e7          	jalr	1508(ra) # 800070e8 <__memset>
    80006b0c:	00093783          	ld	a5,0(s2)
    80006b10:	00f4b023          	sd	a5,0(s1)
    80006b14:	00993023          	sd	s1,0(s2)
    80006b18:	fd4498e3          	bne	s1,s4,80006ae8 <kinit+0x70>
    80006b1c:	03813083          	ld	ra,56(sp)
    80006b20:	03013403          	ld	s0,48(sp)
    80006b24:	02813483          	ld	s1,40(sp)
    80006b28:	02013903          	ld	s2,32(sp)
    80006b2c:	01813983          	ld	s3,24(sp)
    80006b30:	01013a03          	ld	s4,16(sp)
    80006b34:	00813a83          	ld	s5,8(sp)
    80006b38:	04010113          	addi	sp,sp,64
    80006b3c:	00008067          	ret
    80006b40:	00001517          	auipc	a0,0x1
    80006b44:	71850513          	addi	a0,a0,1816 # 80008258 <digits+0x18>
    80006b48:	fffff097          	auipc	ra,0xfffff
    80006b4c:	4b4080e7          	jalr	1204(ra) # 80005ffc <panic>

0000000080006b50 <freerange>:
    80006b50:	fc010113          	addi	sp,sp,-64
    80006b54:	000017b7          	lui	a5,0x1
    80006b58:	02913423          	sd	s1,40(sp)
    80006b5c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006b60:	009504b3          	add	s1,a0,s1
    80006b64:	fffff537          	lui	a0,0xfffff
    80006b68:	02813823          	sd	s0,48(sp)
    80006b6c:	02113c23          	sd	ra,56(sp)
    80006b70:	03213023          	sd	s2,32(sp)
    80006b74:	01313c23          	sd	s3,24(sp)
    80006b78:	01413823          	sd	s4,16(sp)
    80006b7c:	01513423          	sd	s5,8(sp)
    80006b80:	01613023          	sd	s6,0(sp)
    80006b84:	04010413          	addi	s0,sp,64
    80006b88:	00a4f4b3          	and	s1,s1,a0
    80006b8c:	00f487b3          	add	a5,s1,a5
    80006b90:	06f5e463          	bltu	a1,a5,80006bf8 <freerange+0xa8>
    80006b94:	00005a97          	auipc	s5,0x5
    80006b98:	c6ca8a93          	addi	s5,s5,-916 # 8000b800 <end>
    80006b9c:	0954e263          	bltu	s1,s5,80006c20 <freerange+0xd0>
    80006ba0:	01100993          	li	s3,17
    80006ba4:	01b99993          	slli	s3,s3,0x1b
    80006ba8:	0734fc63          	bgeu	s1,s3,80006c20 <freerange+0xd0>
    80006bac:	00058a13          	mv	s4,a1
    80006bb0:	00004917          	auipc	s2,0x4
    80006bb4:	91090913          	addi	s2,s2,-1776 # 8000a4c0 <kmem>
    80006bb8:	00002b37          	lui	s6,0x2
    80006bbc:	0140006f          	j	80006bd0 <freerange+0x80>
    80006bc0:	000017b7          	lui	a5,0x1
    80006bc4:	00f484b3          	add	s1,s1,a5
    80006bc8:	0554ec63          	bltu	s1,s5,80006c20 <freerange+0xd0>
    80006bcc:	0534fa63          	bgeu	s1,s3,80006c20 <freerange+0xd0>
    80006bd0:	00001637          	lui	a2,0x1
    80006bd4:	00100593          	li	a1,1
    80006bd8:	00048513          	mv	a0,s1
    80006bdc:	00000097          	auipc	ra,0x0
    80006be0:	50c080e7          	jalr	1292(ra) # 800070e8 <__memset>
    80006be4:	00093703          	ld	a4,0(s2)
    80006be8:	016487b3          	add	a5,s1,s6
    80006bec:	00e4b023          	sd	a4,0(s1)
    80006bf0:	00993023          	sd	s1,0(s2)
    80006bf4:	fcfa76e3          	bgeu	s4,a5,80006bc0 <freerange+0x70>
    80006bf8:	03813083          	ld	ra,56(sp)
    80006bfc:	03013403          	ld	s0,48(sp)
    80006c00:	02813483          	ld	s1,40(sp)
    80006c04:	02013903          	ld	s2,32(sp)
    80006c08:	01813983          	ld	s3,24(sp)
    80006c0c:	01013a03          	ld	s4,16(sp)
    80006c10:	00813a83          	ld	s5,8(sp)
    80006c14:	00013b03          	ld	s6,0(sp)
    80006c18:	04010113          	addi	sp,sp,64
    80006c1c:	00008067          	ret
    80006c20:	00001517          	auipc	a0,0x1
    80006c24:	63850513          	addi	a0,a0,1592 # 80008258 <digits+0x18>
    80006c28:	fffff097          	auipc	ra,0xfffff
    80006c2c:	3d4080e7          	jalr	980(ra) # 80005ffc <panic>

0000000080006c30 <kfree>:
    80006c30:	fe010113          	addi	sp,sp,-32
    80006c34:	00813823          	sd	s0,16(sp)
    80006c38:	00113c23          	sd	ra,24(sp)
    80006c3c:	00913423          	sd	s1,8(sp)
    80006c40:	02010413          	addi	s0,sp,32
    80006c44:	03451793          	slli	a5,a0,0x34
    80006c48:	04079c63          	bnez	a5,80006ca0 <kfree+0x70>
    80006c4c:	00005797          	auipc	a5,0x5
    80006c50:	bb478793          	addi	a5,a5,-1100 # 8000b800 <end>
    80006c54:	00050493          	mv	s1,a0
    80006c58:	04f56463          	bltu	a0,a5,80006ca0 <kfree+0x70>
    80006c5c:	01100793          	li	a5,17
    80006c60:	01b79793          	slli	a5,a5,0x1b
    80006c64:	02f57e63          	bgeu	a0,a5,80006ca0 <kfree+0x70>
    80006c68:	00001637          	lui	a2,0x1
    80006c6c:	00100593          	li	a1,1
    80006c70:	00000097          	auipc	ra,0x0
    80006c74:	478080e7          	jalr	1144(ra) # 800070e8 <__memset>
    80006c78:	00004797          	auipc	a5,0x4
    80006c7c:	84878793          	addi	a5,a5,-1976 # 8000a4c0 <kmem>
    80006c80:	0007b703          	ld	a4,0(a5)
    80006c84:	01813083          	ld	ra,24(sp)
    80006c88:	01013403          	ld	s0,16(sp)
    80006c8c:	00e4b023          	sd	a4,0(s1)
    80006c90:	0097b023          	sd	s1,0(a5)
    80006c94:	00813483          	ld	s1,8(sp)
    80006c98:	02010113          	addi	sp,sp,32
    80006c9c:	00008067          	ret
    80006ca0:	00001517          	auipc	a0,0x1
    80006ca4:	5b850513          	addi	a0,a0,1464 # 80008258 <digits+0x18>
    80006ca8:	fffff097          	auipc	ra,0xfffff
    80006cac:	354080e7          	jalr	852(ra) # 80005ffc <panic>

0000000080006cb0 <kalloc>:
    80006cb0:	fe010113          	addi	sp,sp,-32
    80006cb4:	00813823          	sd	s0,16(sp)
    80006cb8:	00913423          	sd	s1,8(sp)
    80006cbc:	00113c23          	sd	ra,24(sp)
    80006cc0:	02010413          	addi	s0,sp,32
    80006cc4:	00003797          	auipc	a5,0x3
    80006cc8:	7fc78793          	addi	a5,a5,2044 # 8000a4c0 <kmem>
    80006ccc:	0007b483          	ld	s1,0(a5)
    80006cd0:	02048063          	beqz	s1,80006cf0 <kalloc+0x40>
    80006cd4:	0004b703          	ld	a4,0(s1)
    80006cd8:	00001637          	lui	a2,0x1
    80006cdc:	00500593          	li	a1,5
    80006ce0:	00048513          	mv	a0,s1
    80006ce4:	00e7b023          	sd	a4,0(a5)
    80006ce8:	00000097          	auipc	ra,0x0
    80006cec:	400080e7          	jalr	1024(ra) # 800070e8 <__memset>
    80006cf0:	01813083          	ld	ra,24(sp)
    80006cf4:	01013403          	ld	s0,16(sp)
    80006cf8:	00048513          	mv	a0,s1
    80006cfc:	00813483          	ld	s1,8(sp)
    80006d00:	02010113          	addi	sp,sp,32
    80006d04:	00008067          	ret

0000000080006d08 <initlock>:
    80006d08:	ff010113          	addi	sp,sp,-16
    80006d0c:	00813423          	sd	s0,8(sp)
    80006d10:	01010413          	addi	s0,sp,16
    80006d14:	00813403          	ld	s0,8(sp)
    80006d18:	00b53423          	sd	a1,8(a0)
    80006d1c:	00052023          	sw	zero,0(a0)
    80006d20:	00053823          	sd	zero,16(a0)
    80006d24:	01010113          	addi	sp,sp,16
    80006d28:	00008067          	ret

0000000080006d2c <acquire>:
    80006d2c:	fe010113          	addi	sp,sp,-32
    80006d30:	00813823          	sd	s0,16(sp)
    80006d34:	00913423          	sd	s1,8(sp)
    80006d38:	00113c23          	sd	ra,24(sp)
    80006d3c:	01213023          	sd	s2,0(sp)
    80006d40:	02010413          	addi	s0,sp,32
    80006d44:	00050493          	mv	s1,a0
    80006d48:	10002973          	csrr	s2,sstatus
    80006d4c:	100027f3          	csrr	a5,sstatus
    80006d50:	ffd7f793          	andi	a5,a5,-3
    80006d54:	10079073          	csrw	sstatus,a5
    80006d58:	fffff097          	auipc	ra,0xfffff
    80006d5c:	8ec080e7          	jalr	-1812(ra) # 80005644 <mycpu>
    80006d60:	07852783          	lw	a5,120(a0)
    80006d64:	06078e63          	beqz	a5,80006de0 <acquire+0xb4>
    80006d68:	fffff097          	auipc	ra,0xfffff
    80006d6c:	8dc080e7          	jalr	-1828(ra) # 80005644 <mycpu>
    80006d70:	07852783          	lw	a5,120(a0)
    80006d74:	0004a703          	lw	a4,0(s1)
    80006d78:	0017879b          	addiw	a5,a5,1
    80006d7c:	06f52c23          	sw	a5,120(a0)
    80006d80:	04071063          	bnez	a4,80006dc0 <acquire+0x94>
    80006d84:	00100713          	li	a4,1
    80006d88:	00070793          	mv	a5,a4
    80006d8c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006d90:	0007879b          	sext.w	a5,a5
    80006d94:	fe079ae3          	bnez	a5,80006d88 <acquire+0x5c>
    80006d98:	0ff0000f          	fence
    80006d9c:	fffff097          	auipc	ra,0xfffff
    80006da0:	8a8080e7          	jalr	-1880(ra) # 80005644 <mycpu>
    80006da4:	01813083          	ld	ra,24(sp)
    80006da8:	01013403          	ld	s0,16(sp)
    80006dac:	00a4b823          	sd	a0,16(s1)
    80006db0:	00013903          	ld	s2,0(sp)
    80006db4:	00813483          	ld	s1,8(sp)
    80006db8:	02010113          	addi	sp,sp,32
    80006dbc:	00008067          	ret
    80006dc0:	0104b903          	ld	s2,16(s1)
    80006dc4:	fffff097          	auipc	ra,0xfffff
    80006dc8:	880080e7          	jalr	-1920(ra) # 80005644 <mycpu>
    80006dcc:	faa91ce3          	bne	s2,a0,80006d84 <acquire+0x58>
    80006dd0:	00001517          	auipc	a0,0x1
    80006dd4:	49050513          	addi	a0,a0,1168 # 80008260 <digits+0x20>
    80006dd8:	fffff097          	auipc	ra,0xfffff
    80006ddc:	224080e7          	jalr	548(ra) # 80005ffc <panic>
    80006de0:	00195913          	srli	s2,s2,0x1
    80006de4:	fffff097          	auipc	ra,0xfffff
    80006de8:	860080e7          	jalr	-1952(ra) # 80005644 <mycpu>
    80006dec:	00197913          	andi	s2,s2,1
    80006df0:	07252e23          	sw	s2,124(a0)
    80006df4:	f75ff06f          	j	80006d68 <acquire+0x3c>

0000000080006df8 <release>:
    80006df8:	fe010113          	addi	sp,sp,-32
    80006dfc:	00813823          	sd	s0,16(sp)
    80006e00:	00113c23          	sd	ra,24(sp)
    80006e04:	00913423          	sd	s1,8(sp)
    80006e08:	01213023          	sd	s2,0(sp)
    80006e0c:	02010413          	addi	s0,sp,32
    80006e10:	00052783          	lw	a5,0(a0)
    80006e14:	00079a63          	bnez	a5,80006e28 <release+0x30>
    80006e18:	00001517          	auipc	a0,0x1
    80006e1c:	45050513          	addi	a0,a0,1104 # 80008268 <digits+0x28>
    80006e20:	fffff097          	auipc	ra,0xfffff
    80006e24:	1dc080e7          	jalr	476(ra) # 80005ffc <panic>
    80006e28:	01053903          	ld	s2,16(a0)
    80006e2c:	00050493          	mv	s1,a0
    80006e30:	fffff097          	auipc	ra,0xfffff
    80006e34:	814080e7          	jalr	-2028(ra) # 80005644 <mycpu>
    80006e38:	fea910e3          	bne	s2,a0,80006e18 <release+0x20>
    80006e3c:	0004b823          	sd	zero,16(s1)
    80006e40:	0ff0000f          	fence
    80006e44:	0f50000f          	fence	iorw,ow
    80006e48:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006e4c:	ffffe097          	auipc	ra,0xffffe
    80006e50:	7f8080e7          	jalr	2040(ra) # 80005644 <mycpu>
    80006e54:	100027f3          	csrr	a5,sstatus
    80006e58:	0027f793          	andi	a5,a5,2
    80006e5c:	04079a63          	bnez	a5,80006eb0 <release+0xb8>
    80006e60:	07852783          	lw	a5,120(a0)
    80006e64:	02f05e63          	blez	a5,80006ea0 <release+0xa8>
    80006e68:	fff7871b          	addiw	a4,a5,-1
    80006e6c:	06e52c23          	sw	a4,120(a0)
    80006e70:	00071c63          	bnez	a4,80006e88 <release+0x90>
    80006e74:	07c52783          	lw	a5,124(a0)
    80006e78:	00078863          	beqz	a5,80006e88 <release+0x90>
    80006e7c:	100027f3          	csrr	a5,sstatus
    80006e80:	0027e793          	ori	a5,a5,2
    80006e84:	10079073          	csrw	sstatus,a5
    80006e88:	01813083          	ld	ra,24(sp)
    80006e8c:	01013403          	ld	s0,16(sp)
    80006e90:	00813483          	ld	s1,8(sp)
    80006e94:	00013903          	ld	s2,0(sp)
    80006e98:	02010113          	addi	sp,sp,32
    80006e9c:	00008067          	ret
    80006ea0:	00001517          	auipc	a0,0x1
    80006ea4:	3e850513          	addi	a0,a0,1000 # 80008288 <digits+0x48>
    80006ea8:	fffff097          	auipc	ra,0xfffff
    80006eac:	154080e7          	jalr	340(ra) # 80005ffc <panic>
    80006eb0:	00001517          	auipc	a0,0x1
    80006eb4:	3c050513          	addi	a0,a0,960 # 80008270 <digits+0x30>
    80006eb8:	fffff097          	auipc	ra,0xfffff
    80006ebc:	144080e7          	jalr	324(ra) # 80005ffc <panic>

0000000080006ec0 <holding>:
    80006ec0:	00052783          	lw	a5,0(a0)
    80006ec4:	00079663          	bnez	a5,80006ed0 <holding+0x10>
    80006ec8:	00000513          	li	a0,0
    80006ecc:	00008067          	ret
    80006ed0:	fe010113          	addi	sp,sp,-32
    80006ed4:	00813823          	sd	s0,16(sp)
    80006ed8:	00913423          	sd	s1,8(sp)
    80006edc:	00113c23          	sd	ra,24(sp)
    80006ee0:	02010413          	addi	s0,sp,32
    80006ee4:	01053483          	ld	s1,16(a0)
    80006ee8:	ffffe097          	auipc	ra,0xffffe
    80006eec:	75c080e7          	jalr	1884(ra) # 80005644 <mycpu>
    80006ef0:	01813083          	ld	ra,24(sp)
    80006ef4:	01013403          	ld	s0,16(sp)
    80006ef8:	40a48533          	sub	a0,s1,a0
    80006efc:	00153513          	seqz	a0,a0
    80006f00:	00813483          	ld	s1,8(sp)
    80006f04:	02010113          	addi	sp,sp,32
    80006f08:	00008067          	ret

0000000080006f0c <push_off>:
    80006f0c:	fe010113          	addi	sp,sp,-32
    80006f10:	00813823          	sd	s0,16(sp)
    80006f14:	00113c23          	sd	ra,24(sp)
    80006f18:	00913423          	sd	s1,8(sp)
    80006f1c:	02010413          	addi	s0,sp,32
    80006f20:	100024f3          	csrr	s1,sstatus
    80006f24:	100027f3          	csrr	a5,sstatus
    80006f28:	ffd7f793          	andi	a5,a5,-3
    80006f2c:	10079073          	csrw	sstatus,a5
    80006f30:	ffffe097          	auipc	ra,0xffffe
    80006f34:	714080e7          	jalr	1812(ra) # 80005644 <mycpu>
    80006f38:	07852783          	lw	a5,120(a0)
    80006f3c:	02078663          	beqz	a5,80006f68 <push_off+0x5c>
    80006f40:	ffffe097          	auipc	ra,0xffffe
    80006f44:	704080e7          	jalr	1796(ra) # 80005644 <mycpu>
    80006f48:	07852783          	lw	a5,120(a0)
    80006f4c:	01813083          	ld	ra,24(sp)
    80006f50:	01013403          	ld	s0,16(sp)
    80006f54:	0017879b          	addiw	a5,a5,1
    80006f58:	06f52c23          	sw	a5,120(a0)
    80006f5c:	00813483          	ld	s1,8(sp)
    80006f60:	02010113          	addi	sp,sp,32
    80006f64:	00008067          	ret
    80006f68:	0014d493          	srli	s1,s1,0x1
    80006f6c:	ffffe097          	auipc	ra,0xffffe
    80006f70:	6d8080e7          	jalr	1752(ra) # 80005644 <mycpu>
    80006f74:	0014f493          	andi	s1,s1,1
    80006f78:	06952e23          	sw	s1,124(a0)
    80006f7c:	fc5ff06f          	j	80006f40 <push_off+0x34>

0000000080006f80 <pop_off>:
    80006f80:	ff010113          	addi	sp,sp,-16
    80006f84:	00813023          	sd	s0,0(sp)
    80006f88:	00113423          	sd	ra,8(sp)
    80006f8c:	01010413          	addi	s0,sp,16
    80006f90:	ffffe097          	auipc	ra,0xffffe
    80006f94:	6b4080e7          	jalr	1716(ra) # 80005644 <mycpu>
    80006f98:	100027f3          	csrr	a5,sstatus
    80006f9c:	0027f793          	andi	a5,a5,2
    80006fa0:	04079663          	bnez	a5,80006fec <pop_off+0x6c>
    80006fa4:	07852783          	lw	a5,120(a0)
    80006fa8:	02f05a63          	blez	a5,80006fdc <pop_off+0x5c>
    80006fac:	fff7871b          	addiw	a4,a5,-1
    80006fb0:	06e52c23          	sw	a4,120(a0)
    80006fb4:	00071c63          	bnez	a4,80006fcc <pop_off+0x4c>
    80006fb8:	07c52783          	lw	a5,124(a0)
    80006fbc:	00078863          	beqz	a5,80006fcc <pop_off+0x4c>
    80006fc0:	100027f3          	csrr	a5,sstatus
    80006fc4:	0027e793          	ori	a5,a5,2
    80006fc8:	10079073          	csrw	sstatus,a5
    80006fcc:	00813083          	ld	ra,8(sp)
    80006fd0:	00013403          	ld	s0,0(sp)
    80006fd4:	01010113          	addi	sp,sp,16
    80006fd8:	00008067          	ret
    80006fdc:	00001517          	auipc	a0,0x1
    80006fe0:	2ac50513          	addi	a0,a0,684 # 80008288 <digits+0x48>
    80006fe4:	fffff097          	auipc	ra,0xfffff
    80006fe8:	018080e7          	jalr	24(ra) # 80005ffc <panic>
    80006fec:	00001517          	auipc	a0,0x1
    80006ff0:	28450513          	addi	a0,a0,644 # 80008270 <digits+0x30>
    80006ff4:	fffff097          	auipc	ra,0xfffff
    80006ff8:	008080e7          	jalr	8(ra) # 80005ffc <panic>

0000000080006ffc <push_on>:
    80006ffc:	fe010113          	addi	sp,sp,-32
    80007000:	00813823          	sd	s0,16(sp)
    80007004:	00113c23          	sd	ra,24(sp)
    80007008:	00913423          	sd	s1,8(sp)
    8000700c:	02010413          	addi	s0,sp,32
    80007010:	100024f3          	csrr	s1,sstatus
    80007014:	100027f3          	csrr	a5,sstatus
    80007018:	0027e793          	ori	a5,a5,2
    8000701c:	10079073          	csrw	sstatus,a5
    80007020:	ffffe097          	auipc	ra,0xffffe
    80007024:	624080e7          	jalr	1572(ra) # 80005644 <mycpu>
    80007028:	07852783          	lw	a5,120(a0)
    8000702c:	02078663          	beqz	a5,80007058 <push_on+0x5c>
    80007030:	ffffe097          	auipc	ra,0xffffe
    80007034:	614080e7          	jalr	1556(ra) # 80005644 <mycpu>
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
    80007060:	5e8080e7          	jalr	1512(ra) # 80005644 <mycpu>
    80007064:	0014f493          	andi	s1,s1,1
    80007068:	06952e23          	sw	s1,124(a0)
    8000706c:	fc5ff06f          	j	80007030 <push_on+0x34>

0000000080007070 <pop_on>:
    80007070:	ff010113          	addi	sp,sp,-16
    80007074:	00813023          	sd	s0,0(sp)
    80007078:	00113423          	sd	ra,8(sp)
    8000707c:	01010413          	addi	s0,sp,16
    80007080:	ffffe097          	auipc	ra,0xffffe
    80007084:	5c4080e7          	jalr	1476(ra) # 80005644 <mycpu>
    80007088:	100027f3          	csrr	a5,sstatus
    8000708c:	0027f793          	andi	a5,a5,2
    80007090:	04078463          	beqz	a5,800070d8 <pop_on+0x68>
    80007094:	07852783          	lw	a5,120(a0)
    80007098:	02f05863          	blez	a5,800070c8 <pop_on+0x58>
    8000709c:	fff7879b          	addiw	a5,a5,-1
    800070a0:	06f52c23          	sw	a5,120(a0)
    800070a4:	07853783          	ld	a5,120(a0)
    800070a8:	00079863          	bnez	a5,800070b8 <pop_on+0x48>
    800070ac:	100027f3          	csrr	a5,sstatus
    800070b0:	ffd7f793          	andi	a5,a5,-3
    800070b4:	10079073          	csrw	sstatus,a5
    800070b8:	00813083          	ld	ra,8(sp)
    800070bc:	00013403          	ld	s0,0(sp)
    800070c0:	01010113          	addi	sp,sp,16
    800070c4:	00008067          	ret
    800070c8:	00001517          	auipc	a0,0x1
    800070cc:	1e850513          	addi	a0,a0,488 # 800082b0 <digits+0x70>
    800070d0:	fffff097          	auipc	ra,0xfffff
    800070d4:	f2c080e7          	jalr	-212(ra) # 80005ffc <panic>
    800070d8:	00001517          	auipc	a0,0x1
    800070dc:	1b850513          	addi	a0,a0,440 # 80008290 <digits+0x50>
    800070e0:	fffff097          	auipc	ra,0xfffff
    800070e4:	f1c080e7          	jalr	-228(ra) # 80005ffc <panic>

00000000800070e8 <__memset>:
    800070e8:	ff010113          	addi	sp,sp,-16
    800070ec:	00813423          	sd	s0,8(sp)
    800070f0:	01010413          	addi	s0,sp,16
    800070f4:	1a060e63          	beqz	a2,800072b0 <__memset+0x1c8>
    800070f8:	40a007b3          	neg	a5,a0
    800070fc:	0077f793          	andi	a5,a5,7
    80007100:	00778693          	addi	a3,a5,7
    80007104:	00b00813          	li	a6,11
    80007108:	0ff5f593          	andi	a1,a1,255
    8000710c:	fff6071b          	addiw	a4,a2,-1
    80007110:	1b06e663          	bltu	a3,a6,800072bc <__memset+0x1d4>
    80007114:	1cd76463          	bltu	a4,a3,800072dc <__memset+0x1f4>
    80007118:	1a078e63          	beqz	a5,800072d4 <__memset+0x1ec>
    8000711c:	00b50023          	sb	a1,0(a0)
    80007120:	00100713          	li	a4,1
    80007124:	1ae78463          	beq	a5,a4,800072cc <__memset+0x1e4>
    80007128:	00b500a3          	sb	a1,1(a0)
    8000712c:	00200713          	li	a4,2
    80007130:	1ae78a63          	beq	a5,a4,800072e4 <__memset+0x1fc>
    80007134:	00b50123          	sb	a1,2(a0)
    80007138:	00300713          	li	a4,3
    8000713c:	18e78463          	beq	a5,a4,800072c4 <__memset+0x1dc>
    80007140:	00b501a3          	sb	a1,3(a0)
    80007144:	00400713          	li	a4,4
    80007148:	1ae78263          	beq	a5,a4,800072ec <__memset+0x204>
    8000714c:	00b50223          	sb	a1,4(a0)
    80007150:	00500713          	li	a4,5
    80007154:	1ae78063          	beq	a5,a4,800072f4 <__memset+0x20c>
    80007158:	00b502a3          	sb	a1,5(a0)
    8000715c:	00700713          	li	a4,7
    80007160:	18e79e63          	bne	a5,a4,800072fc <__memset+0x214>
    80007164:	00b50323          	sb	a1,6(a0)
    80007168:	00700e93          	li	t4,7
    8000716c:	00859713          	slli	a4,a1,0x8
    80007170:	00e5e733          	or	a4,a1,a4
    80007174:	01059e13          	slli	t3,a1,0x10
    80007178:	01c76e33          	or	t3,a4,t3
    8000717c:	01859313          	slli	t1,a1,0x18
    80007180:	006e6333          	or	t1,t3,t1
    80007184:	02059893          	slli	a7,a1,0x20
    80007188:	40f60e3b          	subw	t3,a2,a5
    8000718c:	011368b3          	or	a7,t1,a7
    80007190:	02859813          	slli	a6,a1,0x28
    80007194:	0108e833          	or	a6,a7,a6
    80007198:	03059693          	slli	a3,a1,0x30
    8000719c:	003e589b          	srliw	a7,t3,0x3
    800071a0:	00d866b3          	or	a3,a6,a3
    800071a4:	03859713          	slli	a4,a1,0x38
    800071a8:	00389813          	slli	a6,a7,0x3
    800071ac:	00f507b3          	add	a5,a0,a5
    800071b0:	00e6e733          	or	a4,a3,a4
    800071b4:	000e089b          	sext.w	a7,t3
    800071b8:	00f806b3          	add	a3,a6,a5
    800071bc:	00e7b023          	sd	a4,0(a5)
    800071c0:	00878793          	addi	a5,a5,8
    800071c4:	fed79ce3          	bne	a5,a3,800071bc <__memset+0xd4>
    800071c8:	ff8e7793          	andi	a5,t3,-8
    800071cc:	0007871b          	sext.w	a4,a5
    800071d0:	01d787bb          	addw	a5,a5,t4
    800071d4:	0ce88e63          	beq	a7,a4,800072b0 <__memset+0x1c8>
    800071d8:	00f50733          	add	a4,a0,a5
    800071dc:	00b70023          	sb	a1,0(a4)
    800071e0:	0017871b          	addiw	a4,a5,1
    800071e4:	0cc77663          	bgeu	a4,a2,800072b0 <__memset+0x1c8>
    800071e8:	00e50733          	add	a4,a0,a4
    800071ec:	00b70023          	sb	a1,0(a4)
    800071f0:	0027871b          	addiw	a4,a5,2
    800071f4:	0ac77e63          	bgeu	a4,a2,800072b0 <__memset+0x1c8>
    800071f8:	00e50733          	add	a4,a0,a4
    800071fc:	00b70023          	sb	a1,0(a4)
    80007200:	0037871b          	addiw	a4,a5,3
    80007204:	0ac77663          	bgeu	a4,a2,800072b0 <__memset+0x1c8>
    80007208:	00e50733          	add	a4,a0,a4
    8000720c:	00b70023          	sb	a1,0(a4)
    80007210:	0047871b          	addiw	a4,a5,4
    80007214:	08c77e63          	bgeu	a4,a2,800072b0 <__memset+0x1c8>
    80007218:	00e50733          	add	a4,a0,a4
    8000721c:	00b70023          	sb	a1,0(a4)
    80007220:	0057871b          	addiw	a4,a5,5
    80007224:	08c77663          	bgeu	a4,a2,800072b0 <__memset+0x1c8>
    80007228:	00e50733          	add	a4,a0,a4
    8000722c:	00b70023          	sb	a1,0(a4)
    80007230:	0067871b          	addiw	a4,a5,6
    80007234:	06c77e63          	bgeu	a4,a2,800072b0 <__memset+0x1c8>
    80007238:	00e50733          	add	a4,a0,a4
    8000723c:	00b70023          	sb	a1,0(a4)
    80007240:	0077871b          	addiw	a4,a5,7
    80007244:	06c77663          	bgeu	a4,a2,800072b0 <__memset+0x1c8>
    80007248:	00e50733          	add	a4,a0,a4
    8000724c:	00b70023          	sb	a1,0(a4)
    80007250:	0087871b          	addiw	a4,a5,8
    80007254:	04c77e63          	bgeu	a4,a2,800072b0 <__memset+0x1c8>
    80007258:	00e50733          	add	a4,a0,a4
    8000725c:	00b70023          	sb	a1,0(a4)
    80007260:	0097871b          	addiw	a4,a5,9
    80007264:	04c77663          	bgeu	a4,a2,800072b0 <__memset+0x1c8>
    80007268:	00e50733          	add	a4,a0,a4
    8000726c:	00b70023          	sb	a1,0(a4)
    80007270:	00a7871b          	addiw	a4,a5,10
    80007274:	02c77e63          	bgeu	a4,a2,800072b0 <__memset+0x1c8>
    80007278:	00e50733          	add	a4,a0,a4
    8000727c:	00b70023          	sb	a1,0(a4)
    80007280:	00b7871b          	addiw	a4,a5,11
    80007284:	02c77663          	bgeu	a4,a2,800072b0 <__memset+0x1c8>
    80007288:	00e50733          	add	a4,a0,a4
    8000728c:	00b70023          	sb	a1,0(a4)
    80007290:	00c7871b          	addiw	a4,a5,12
    80007294:	00c77e63          	bgeu	a4,a2,800072b0 <__memset+0x1c8>
    80007298:	00e50733          	add	a4,a0,a4
    8000729c:	00b70023          	sb	a1,0(a4)
    800072a0:	00d7879b          	addiw	a5,a5,13
    800072a4:	00c7f663          	bgeu	a5,a2,800072b0 <__memset+0x1c8>
    800072a8:	00f507b3          	add	a5,a0,a5
    800072ac:	00b78023          	sb	a1,0(a5)
    800072b0:	00813403          	ld	s0,8(sp)
    800072b4:	01010113          	addi	sp,sp,16
    800072b8:	00008067          	ret
    800072bc:	00b00693          	li	a3,11
    800072c0:	e55ff06f          	j	80007114 <__memset+0x2c>
    800072c4:	00300e93          	li	t4,3
    800072c8:	ea5ff06f          	j	8000716c <__memset+0x84>
    800072cc:	00100e93          	li	t4,1
    800072d0:	e9dff06f          	j	8000716c <__memset+0x84>
    800072d4:	00000e93          	li	t4,0
    800072d8:	e95ff06f          	j	8000716c <__memset+0x84>
    800072dc:	00000793          	li	a5,0
    800072e0:	ef9ff06f          	j	800071d8 <__memset+0xf0>
    800072e4:	00200e93          	li	t4,2
    800072e8:	e85ff06f          	j	8000716c <__memset+0x84>
    800072ec:	00400e93          	li	t4,4
    800072f0:	e7dff06f          	j	8000716c <__memset+0x84>
    800072f4:	00500e93          	li	t4,5
    800072f8:	e75ff06f          	j	8000716c <__memset+0x84>
    800072fc:	00600e93          	li	t4,6
    80007300:	e6dff06f          	j	8000716c <__memset+0x84>

0000000080007304 <__memmove>:
    80007304:	ff010113          	addi	sp,sp,-16
    80007308:	00813423          	sd	s0,8(sp)
    8000730c:	01010413          	addi	s0,sp,16
    80007310:	0e060863          	beqz	a2,80007400 <__memmove+0xfc>
    80007314:	fff6069b          	addiw	a3,a2,-1
    80007318:	0006881b          	sext.w	a6,a3
    8000731c:	0ea5e863          	bltu	a1,a0,8000740c <__memmove+0x108>
    80007320:	00758713          	addi	a4,a1,7
    80007324:	00a5e7b3          	or	a5,a1,a0
    80007328:	40a70733          	sub	a4,a4,a0
    8000732c:	0077f793          	andi	a5,a5,7
    80007330:	00f73713          	sltiu	a4,a4,15
    80007334:	00174713          	xori	a4,a4,1
    80007338:	0017b793          	seqz	a5,a5
    8000733c:	00e7f7b3          	and	a5,a5,a4
    80007340:	10078863          	beqz	a5,80007450 <__memmove+0x14c>
    80007344:	00900793          	li	a5,9
    80007348:	1107f463          	bgeu	a5,a6,80007450 <__memmove+0x14c>
    8000734c:	0036581b          	srliw	a6,a2,0x3
    80007350:	fff8081b          	addiw	a6,a6,-1
    80007354:	02081813          	slli	a6,a6,0x20
    80007358:	01d85893          	srli	a7,a6,0x1d
    8000735c:	00858813          	addi	a6,a1,8
    80007360:	00058793          	mv	a5,a1
    80007364:	00050713          	mv	a4,a0
    80007368:	01088833          	add	a6,a7,a6
    8000736c:	0007b883          	ld	a7,0(a5)
    80007370:	00878793          	addi	a5,a5,8
    80007374:	00870713          	addi	a4,a4,8
    80007378:	ff173c23          	sd	a7,-8(a4)
    8000737c:	ff0798e3          	bne	a5,a6,8000736c <__memmove+0x68>
    80007380:	ff867713          	andi	a4,a2,-8
    80007384:	02071793          	slli	a5,a4,0x20
    80007388:	0207d793          	srli	a5,a5,0x20
    8000738c:	00f585b3          	add	a1,a1,a5
    80007390:	40e686bb          	subw	a3,a3,a4
    80007394:	00f507b3          	add	a5,a0,a5
    80007398:	06e60463          	beq	a2,a4,80007400 <__memmove+0xfc>
    8000739c:	0005c703          	lbu	a4,0(a1)
    800073a0:	00e78023          	sb	a4,0(a5)
    800073a4:	04068e63          	beqz	a3,80007400 <__memmove+0xfc>
    800073a8:	0015c603          	lbu	a2,1(a1)
    800073ac:	00100713          	li	a4,1
    800073b0:	00c780a3          	sb	a2,1(a5)
    800073b4:	04e68663          	beq	a3,a4,80007400 <__memmove+0xfc>
    800073b8:	0025c603          	lbu	a2,2(a1)
    800073bc:	00200713          	li	a4,2
    800073c0:	00c78123          	sb	a2,2(a5)
    800073c4:	02e68e63          	beq	a3,a4,80007400 <__memmove+0xfc>
    800073c8:	0035c603          	lbu	a2,3(a1)
    800073cc:	00300713          	li	a4,3
    800073d0:	00c781a3          	sb	a2,3(a5)
    800073d4:	02e68663          	beq	a3,a4,80007400 <__memmove+0xfc>
    800073d8:	0045c603          	lbu	a2,4(a1)
    800073dc:	00400713          	li	a4,4
    800073e0:	00c78223          	sb	a2,4(a5)
    800073e4:	00e68e63          	beq	a3,a4,80007400 <__memmove+0xfc>
    800073e8:	0055c603          	lbu	a2,5(a1)
    800073ec:	00500713          	li	a4,5
    800073f0:	00c782a3          	sb	a2,5(a5)
    800073f4:	00e68663          	beq	a3,a4,80007400 <__memmove+0xfc>
    800073f8:	0065c703          	lbu	a4,6(a1)
    800073fc:	00e78323          	sb	a4,6(a5)
    80007400:	00813403          	ld	s0,8(sp)
    80007404:	01010113          	addi	sp,sp,16
    80007408:	00008067          	ret
    8000740c:	02061713          	slli	a4,a2,0x20
    80007410:	02075713          	srli	a4,a4,0x20
    80007414:	00e587b3          	add	a5,a1,a4
    80007418:	f0f574e3          	bgeu	a0,a5,80007320 <__memmove+0x1c>
    8000741c:	02069613          	slli	a2,a3,0x20
    80007420:	02065613          	srli	a2,a2,0x20
    80007424:	fff64613          	not	a2,a2
    80007428:	00e50733          	add	a4,a0,a4
    8000742c:	00c78633          	add	a2,a5,a2
    80007430:	fff7c683          	lbu	a3,-1(a5)
    80007434:	fff78793          	addi	a5,a5,-1
    80007438:	fff70713          	addi	a4,a4,-1
    8000743c:	00d70023          	sb	a3,0(a4)
    80007440:	fec798e3          	bne	a5,a2,80007430 <__memmove+0x12c>
    80007444:	00813403          	ld	s0,8(sp)
    80007448:	01010113          	addi	sp,sp,16
    8000744c:	00008067          	ret
    80007450:	02069713          	slli	a4,a3,0x20
    80007454:	02075713          	srli	a4,a4,0x20
    80007458:	00170713          	addi	a4,a4,1
    8000745c:	00e50733          	add	a4,a0,a4
    80007460:	00050793          	mv	a5,a0
    80007464:	0005c683          	lbu	a3,0(a1)
    80007468:	00178793          	addi	a5,a5,1
    8000746c:	00158593          	addi	a1,a1,1
    80007470:	fed78fa3          	sb	a3,-1(a5)
    80007474:	fee798e3          	bne	a5,a4,80007464 <__memmove+0x160>
    80007478:	f89ff06f          	j	80007400 <__memmove+0xfc>
	...
