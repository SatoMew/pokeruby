	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C42C0
sub_80C42C0: @ 80C42C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r6, 0
	mov r9, r6
	ldr r1, _080C4308 @ =gTasks
	lsls r0, 2
	add r0, r12
	lsls r0, 3
	adds r0, r1
	ldrb r5, [r0, 0x8]
	ldrh r7, [r0, 0xA]
	ldrh r1, [r0, 0xC]
	mov r8, r1
	movs r2, 0xC
	ldrsh r0, [r0, r2]
	cmp r0, 0
	beq _080C4310
	ldr r1, _080C430C @ =gSharedMem + 0x18000
	lsls r2, r5, 1
	adds r0, r1, 0
	adds r0, 0xC
	adds r0, r2, r0
	movs r3, 0
	ldrsh r0, [r0, r3]
	mov r10, r1
	adds r4, r2, 0
	cmp r0, 0
	bgt _080C4328
	b _080C4326
	.align 2, 0
_080C4308: .4byte gTasks
_080C430C: .4byte gSharedMem + 0x18000
_080C4310:
	ldr r1, _080C4350 @ =gSharedMem + 0x18000
	lsls r2, r5, 1
	adds r0, r1, 0
	adds r0, 0xC
	adds r0, r2, r0
	movs r3, 0
	ldrsh r0, [r0, r3]
	mov r10, r1
	adds r4, r2, 0
	cmp r0, 0x57
	ble _080C4328
_080C4326:
	movs r6, 0x1
_080C4328:
	mov r0, r10
	adds r0, 0xC
	adds r3, r4, r0
	ldrh r2, [r3]
	movs r0, 0
	ldrsh r1, [r3, r0]
	lsls r0, r7, 16
	asrs r0, 16
	cmp r1, r0
	bne _080C4340
	movs r1, 0x1
	mov r9, r1
_080C4340:
	mov r0, r9
	cmp r0, 0
	bne _080C4362
	cmp r6, 0
	beq _080C4354
	strh r7, [r3]
	b _080C4362
	.align 2, 0
_080C4350: .4byte gSharedMem + 0x18000
_080C4354:
	mov r1, r8
	cmp r1, 0
	beq _080C435E
	subs r0, r2, 0x1
	b _080C4360
_080C435E:
	adds r0, r2, 0x1
_080C4360:
	strh r0, [r3]
_080C4362:
	cmp r6, 0
	bne _080C43C8
	mov r2, r9
	cmp r2, 0
	bne _080C43CE
	movs r2, 0
	ldr r0, _080C4388 @ =gSharedMem + 0x1800C
	adds r6, r4, r0
	adds r0, r4, r5
	lsls r5, r0, 5
_080C4376:
	movs r0, 0
	ldrsh r3, [r6, r0]
	adds r0, r2, 0x1
	lsls r1, r0, 3
	adds r4, r0, 0
	cmp r3, r1
	blt _080C438C
	movs r0, 0x8
	b _080C43A8
	.align 2, 0
_080C4388: .4byte gSharedMem + 0x1800C
_080C438C:
	lsls r0, r2, 3
	cmp r3, r0
	blt _080C43A6
	adds r0, r3, 0
	cmp r3, 0
	bge _080C439A
	adds r0, r3, 0x7
_080C439A:
	asrs r0, 3
	lsls r0, 3
	subs r0, r3, r0
	lsls r0, 24
	lsrs r0, 24
	b _080C43A8
_080C43A6:
	movs r0, 0
_080C43A8:
	cmp r0, 0x3
	bhi _080C43B4
	ldr r3, _080C43B0 @ =0x0000504c
	b _080C43B6
	.align 2, 0
_080C43B0: .4byte 0x0000504c
_080C43B4:
	ldr r3, _080C43EC @ =0x00005057
_080C43B6:
	adds r1, r0, r3
	adds r0, r5, r2
	lsls r0, 1
	ldr r2, _080C43F0 @ =0x0600e18e
	adds r0, r2
	strh r1, [r0]
	adds r2, r4, 0
	cmp r2, 0xA
	ble _080C4376
_080C43C8:
	mov r3, r9
	cmp r3, 0
	beq _080C43DC
_080C43CE:
	mov r1, r10
	ldrb r0, [r1, 0x14]
	subs r0, 0x1
	strb r0, [r1, 0x14]
	mov r0, r12
	bl DestroyTask
_080C43DC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C43EC: .4byte 0x00005057
_080C43F0: .4byte 0x0600e18e
	thumb_func_end sub_80C42C0

	thumb_func_start sub_80C43F4
sub_80C43F4: @ 80C43F4
	push {r4,r5,lr}
	ldr r0, _080C442C @ =gUnknown_02038694
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080C4430 @ =gPlayerParty
	adds r0, r1
	bl sub_80AE47C
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	cmp r5, 0
	beq _080C4422
	ldr r4, _080C4434 @ =gSpecialVar_ContestCategory
	ldrb r0, [r4]
	ldr r1, _080C4438 @ =gSpecialVar_ContestRank
	ldrb r1, [r1]
	bl Contest_InitAllPokemon
	ldrb r0, [r4]
	bl sub_80AE82C
_080C4422:
	ldr r0, _080C443C @ =gSpecialVar_Result
	strh r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C442C: .4byte gUnknown_02038694
_080C4430: .4byte gPlayerParty
_080C4434: .4byte gSpecialVar_ContestCategory
_080C4438: .4byte gSpecialVar_ContestRank
_080C443C: .4byte gSpecialVar_Result
	thumb_func_end sub_80C43F4

	thumb_func_start sub_80C4440
sub_80C4440: @ 80C4440
	push {r4,lr}
	movs r4, 0
	ldr r0, _080C4464 @ =gUnknown_02038694
	ldrb r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080C4468 @ =gPlayerParty
	adds r2, r1, r0
	ldr r0, _080C446C @ =gSpecialVar_ContestCategory
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080C44B2
	lsls r0, 2
	ldr r1, _080C4470 @ =_080C4474
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C4464: .4byte gUnknown_02038694
_080C4468: .4byte gPlayerParty
_080C446C: .4byte gSpecialVar_ContestCategory
_080C4470: .4byte _080C4474
	.align 2, 0
_080C4474:
	.4byte _080C4488
	.4byte _080C448E
	.4byte _080C4494
	.4byte _080C449A
	.4byte _080C44A0
_080C4488:
	adds r0, r2, 0
	movs r1, 0x32
	b _080C44A4
_080C448E:
	adds r0, r2, 0
	movs r1, 0x33
	b _080C44A4
_080C4494:
	adds r0, r2, 0
	movs r1, 0x34
	b _080C44A4
_080C449A:
	adds r0, r2, 0
	movs r1, 0x35
	b _080C44A4
_080C44A0:
	adds r0, r2, 0
	movs r1, 0x36
_080C44A4:
	bl GetMonData
	ldr r1, _080C44BC @ =gSpecialVar_ContestRank
	ldrh r1, [r1]
	cmp r0, r1
	bls _080C44B2
	movs r4, 0x1
_080C44B2:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C44BC: .4byte gSpecialVar_ContestRank
	thumb_func_end sub_80C4440

	thumb_func_start sub_80C44C0
sub_80C44C0: @ 80C44C0
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _080C44E8 @ =gContestFinalStandings
	ldr r0, _080C44EC @ =gContestPlayerMonIndex
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C44D4
	b _080C465E
_080C44D4:
	ldr r0, _080C44F0 @ =gSpecialVar_ContestCategory
	ldrh r0, [r0]
	cmp r0, 0x4
	bls _080C44DE
	b _080C465E
_080C44DE:
	lsls r0, 2
	ldr r1, _080C44F4 @ =_080C44F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C44E8: .4byte gContestFinalStandings
_080C44EC: .4byte gContestPlayerMonIndex
_080C44F0: .4byte gSpecialVar_ContestCategory
_080C44F4: .4byte _080C44F8
	.align 2, 0
_080C44F8:
	.4byte _080C450C
	.4byte _080C4554
	.4byte _080C4598
	.4byte _080C45DC
	.4byte _080C4624
_080C450C:
	ldr r6, _080C4548 @ =gUnknown_02038694
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080C454C @ =gPlayerParty
	adds r0, r4
	movs r1, 0x32
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	mov r0, sp
	strb r1, [r0]
	ldr r0, _080C4550 @ =gSpecialVar_ContestRank
	ldrh r0, [r0]
	cmp r1, r0
	bls _080C4530
	b _080C465E
_080C4530:
	adds r0, r1, 0
	cmp r0, 0x3
	bls _080C4538
	b _080C465E
_080C4538:
	adds r1, r0, 0x1
	mov r0, sp
	strb r1, [r0]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0x32
	b _080C4610
	.align 2, 0
_080C4548: .4byte gUnknown_02038694
_080C454C: .4byte gPlayerParty
_080C4550: .4byte gSpecialVar_ContestRank
_080C4554:
	mov r4, sp
	ldr r7, _080C458C @ =gUnknown_02038694
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080C4590 @ =gPlayerParty
	adds r0, r5
	movs r1, 0x33
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080C4594 @ =gSpecialVar_ContestRank
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080C465E
	cmp r2, 0x3
	bhi _080C465E
	mov r1, sp
	adds r0, r2, 0x1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x33
	b _080C4610
	.align 2, 0
_080C458C: .4byte gUnknown_02038694
_080C4590: .4byte gPlayerParty
_080C4594: .4byte gSpecialVar_ContestRank
_080C4598:
	mov r4, sp
	ldr r7, _080C45D0 @ =gUnknown_02038694
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080C45D4 @ =gPlayerParty
	adds r0, r5
	movs r1, 0x34
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080C45D8 @ =gSpecialVar_ContestRank
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080C465E
	cmp r2, 0x3
	bhi _080C465E
	mov r1, sp
	adds r0, r2, 0x1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x34
	b _080C4610
	.align 2, 0
_080C45D0: .4byte gUnknown_02038694
_080C45D4: .4byte gPlayerParty
_080C45D8: .4byte gSpecialVar_ContestRank
_080C45DC:
	mov r4, sp
	ldr r7, _080C4618 @ =gUnknown_02038694
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080C461C @ =gPlayerParty
	adds r0, r5
	movs r1, 0x35
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080C4620 @ =gSpecialVar_ContestRank
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080C465E
	cmp r2, 0x3
	bhi _080C465E
	mov r1, sp
	adds r0, r2, 0x1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x35
_080C4610:
	mov r2, sp
	bl SetMonData
	b _080C465E
	.align 2, 0
_080C4618: .4byte gUnknown_02038694
_080C461C: .4byte gPlayerParty
_080C4620: .4byte gSpecialVar_ContestRank
_080C4624:
	mov r4, sp
	ldr r7, _080C4668 @ =gUnknown_02038694
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080C466C @ =gPlayerParty
	adds r0, r5
	movs r1, 0x36
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080C4670 @ =gSpecialVar_ContestRank
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080C465E
	cmp r2, 0x3
	bhi _080C465E
	mov r1, sp
	adds r0, r2, 0x1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x36
	mov r2, sp
	bl SetMonData
_080C465E:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4668: .4byte gUnknown_02038694
_080C466C: .4byte gPlayerParty
_080C4670: .4byte gSpecialVar_ContestRank
	thumb_func_end sub_80C44C0

	thumb_func_start sub_80C4674
sub_80C4674: @ 80C4674
	push {r4,lr}
	adds r4, r0, 0
	bl StringCopy
	ldrb r0, [r4]
	cmp r0, 0xFC
	bne _080C4690
	ldrb r0, [r4, 0x1]
	cmp r0, 0x15
	bne _080C4690
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
_080C4690:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C4674

	thumb_func_start sub_80C4698
sub_80C4698: @ 80C4698
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r1, r4, 6
	ldr r0, _080C46E0 @ =gContestMons + 0x2
	adds r1, r0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _080C46E4 @ =gIsLinkContest
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C46DA
	ldr r0, _080C46E8 @ =gLinkPlayers
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x1A]
	cmp r0, 0x1
	bne _080C46DA
	adds r0, r5, 0
	bl sub_80C86A0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl ConvertInternationalString
_080C46DA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C46E0: .4byte gContestMons + 0x2
_080C46E4: .4byte gIsLinkContest
_080C46E8: .4byte gLinkPlayers
	thumb_func_end sub_80C4698

	thumb_func_start sub_80C46EC
sub_80C46EC: @ 80C46EC
	push {lr}
	ldr r0, _080C4710 @ =gIsLinkContest
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C4720
	ldr r0, _080C4714 @ =gStringVar1
	ldr r1, _080C4718 @ =gSpecialVar_0x8006
	ldrh r2, [r1]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r2, _080C471C @ =gLinkPlayers + 0x8
	adds r1, r2
	bl sub_80C4674
	b _080C4730
	.align 2, 0
_080C4710: .4byte gIsLinkContest
_080C4714: .4byte gStringVar1
_080C4718: .4byte gSpecialVar_0x8006
_080C471C: .4byte gLinkPlayers + 0x8
_080C4720:
	ldr r0, _080C4734 @ =gStringVar1
	ldr r1, _080C4738 @ =gSpecialVar_0x8006
	ldrh r1, [r1]
	lsls r1, 6
	ldr r2, _080C473C @ =gContestMons + 0xD
	adds r1, r2
	bl sub_80C4674
_080C4730:
	pop {r0}
	bx r0
	.align 2, 0
_080C4734: .4byte gStringVar1
_080C4738: .4byte gSpecialVar_0x8006
_080C473C: .4byte gContestMons + 0xD
	thumb_func_end sub_80C46EC

	thumb_func_start sub_80C4740
sub_80C4740: @ 80C4740
	push {lr}
	ldr r0, _080C4750 @ =gStringVar3
	ldr r1, _080C4754 @ =gSpecialVar_0x8006
	ldrb r1, [r1]
	bl sub_80C4698
	pop {r0}
	bx r0
	.align 2, 0
_080C4750: .4byte gStringVar3
_080C4754: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C4740

	thumb_func_start sub_80C4758
sub_80C4758: @ 80C4758
	push {r4-r6,lr}
	movs r1, 0
	movs r2, 0
	ldr r5, _080C4794 @ =gSpecialVar_0x8004
	ldr r4, _080C4798 @ =gUnknown_02038670
	ldr r0, _080C479C @ =gSpecialVar_0x8006
	ldrh r0, [r0]
	lsls r0, 1
	adds r0, r4
	movs r6, 0
	ldrsh r3, [r0, r6]
_080C476E:
	lsls r0, r1, 1
	adds r0, r4
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r3, r0
	bge _080C4780
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080C4780:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _080C476E
	strh r2, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C4794: .4byte gSpecialVar_0x8004
_080C4798: .4byte gUnknown_02038670
_080C479C: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C4758

	thumb_func_start sub_80C47A0
sub_80C47A0: @ 80C47A0
	ldr r2, _080C47B4 @ =gSpecialVar_0x8004
	ldr r1, _080C47B8 @ =gUnknown_02038670
	ldr r0, _080C47BC @ =gSpecialVar_0x8006
	ldrh r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_080C47B4: .4byte gSpecialVar_0x8004
_080C47B8: .4byte gUnknown_02038670
_080C47BC: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C47A0

	thumb_func_start sub_80C47C0
sub_80C47C0: @ 80C47C0
	push {lr}
	movs r1, 0
	ldr r2, _080C47E8 @ =gContestFinalStandings
	ldrb r0, [r2]
	ldr r3, _080C47EC @ =gSpecialVar_0x8005
	cmp r0, 0
	beq _080C47E0
_080C47CE:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bhi _080C47E0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C47CE
_080C47E0:
	strh r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_080C47E8: .4byte gContestFinalStandings
_080C47EC: .4byte gSpecialVar_0x8005
	thumb_func_end sub_80C47C0

	thumb_func_start sub_80C47F0
sub_80C47F0: @ 80C47F0
	push {r4,lr}
	movs r2, 0
	ldr r3, _080C4830 @ =gContestFinalStandings
	ldrb r0, [r3]
	ldr r1, _080C4834 @ =gIsLinkContest
	ldr r4, _080C4838 @ =gStringVar3
	cmp r0, 0
	beq _080C4812
_080C4800:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bhi _080C4812
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C4800
_080C4812:
	ldrb r1, [r1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C4840
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _080C483C @ =gLinkPlayers + 0x8
	adds r1, r0
	adds r0, r4, 0
	bl sub_80C4674
	b _080C484C
	.align 2, 0
_080C4830: .4byte gContestFinalStandings
_080C4834: .4byte gIsLinkContest
_080C4838: .4byte gStringVar3
_080C483C: .4byte gLinkPlayers + 0x8
_080C4840:
	lsls r1, r2, 6
	ldr r0, _080C4854 @ =gContestMons + 0xD
	adds r1, r0
	adds r0, r4, 0
	bl sub_80C4674
_080C484C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4854: .4byte gContestMons + 0xD
	thumb_func_end sub_80C47F0

	thumb_func_start sub_80C4858
sub_80C4858: @ 80C4858
	push {lr}
	movs r1, 0
	ldr r2, _080C4884 @ =gContestFinalStandings
	ldrb r0, [r2]
	ldr r3, _080C4888 @ =gStringVar1
	cmp r0, 0
	beq _080C4878
_080C4866:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bhi _080C4878
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C4866
_080C4878:
	adds r0, r3, 0
	bl sub_80C4698
	pop {r0}
	bx r0
	.align 2, 0
_080C4884: .4byte gContestFinalStandings
_080C4888: .4byte gStringVar1
	thumb_func_end sub_80C4858

	thumb_func_start sub_80C488C
sub_80C488C: @ 80C488C
	push {lr}
	ldr r0, _080C4898 @ =CB2_StartContest
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080C4898: .4byte CB2_StartContest
	thumb_func_end sub_80C488C

	thumb_func_start sub_80C489C
sub_80C489C: @ 80C489C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080C48C0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C48BA
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _080C48C4 @ =sub_80C488C
	bl SetMainCallback2
_080C48BA:
	pop {r0}
	bx r0
	.align 2, 0
_080C48C0: .4byte gPaletteFade
_080C48C4: .4byte sub_80C488C
	thumb_func_end sub_80C489C

	thumb_func_start sub_80C48C8
sub_80C48C8: @ 80C48C8
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080C48F0 @ =sub_80C489C
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C48F0: .4byte sub_80C489C
	thumb_func_end sub_80C48C8

	thumb_func_start sub_80C48F4
sub_80C48F4: @ 80C48F4
	ldr r2, _080C4908 @ =gSpecialVar_0x8004
	ldr r1, _080C490C @ =gContestMons
	ldr r0, _080C4910 @ =gSpecialVar_0x8006
	ldrh r0, [r0]
	lsls r0, 6
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_080C4908: .4byte gSpecialVar_0x8004
_080C490C: .4byte gContestMons
_080C4910: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C48F4

	thumb_func_start sub_80C4914
sub_80C4914: @ 80C4914
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080C4938 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C4932
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _080C493C @ =sub_80C2358
	bl SetMainCallback2
_080C4932:
	pop {r0}
	bx r0
	.align 2, 0
_080C4938: .4byte gPaletteFade
_080C493C: .4byte sub_80C2358
	thumb_func_end sub_80C4914

	thumb_func_start sub_80C4940
sub_80C4940: @ 80C4940
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080C4968 @ =sub_80C4914
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C4968: .4byte sub_80C4914
	thumb_func_end sub_80C4940

	thumb_func_start sub_80C496C
sub_80C496C: @ 80C496C
	ldr r0, _080C4978 @ =gSpecialVar_0x8004
	ldr r1, _080C497C @ =gContestPlayerMonIndex
	ldrb r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_080C4978: .4byte gSpecialVar_0x8004
_080C497C: .4byte gContestPlayerMonIndex
	thumb_func_end sub_80C496C

	thumb_func_start sub_80C4980
sub_80C4980: @ 80C4980
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl ScriptContext2_Enable
	ldr r6, _080C49B8 @ =sub_80C8604
	adds r0, r6, 0
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _080C49BC @ =sub_80C49C4
	adds r0, r4, 0
	adds r1, r6, 0
	bl SetTaskFuncWithFollowupFunc
	ldr r1, _080C49C0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x1A]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C49B8: .4byte sub_80C8604
_080C49BC: .4byte sub_80C49C4
_080C49C0: .4byte gTasks
	thumb_func_end sub_80C4980

	thumb_func_start sub_80C49C4
sub_80C49C4: @ 80C49C4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080C49E4 @ =gUnknown_02038694
	ldrb r0, [r0]
	bl Contest_CreatePlayerMon
	ldr r1, _080C49E8 @ =sub_80C8734
	ldr r2, _080C49EC @ =sub_80C49F0
	adds r0, r4, 0
	bl SetTaskFuncWithFollowupFunc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C49E4: .4byte gUnknown_02038694
_080C49E8: .4byte sub_80C8734
_080C49EC: .4byte sub_80C49F0
	thumb_func_end sub_80C49C4

	thumb_func_start sub_80C49F0
sub_80C49F0: @ 80C49F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C4A04 @ =sub_80C88AC
	ldr r2, _080C4A08 @ =sub_80C4A0C
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080C4A04: .4byte sub_80C88AC
_080C4A08: .4byte sub_80C4A0C
	thumb_func_end sub_80C49F0

	thumb_func_start sub_80C4A0C
sub_80C4A0C: @ 80C4A0C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C4A20 @ =sub_80C8E1C
	ldr r2, _080C4A24 @ =sub_80C4A28
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080C4A20: .4byte sub_80C8E1C
_080C4A24: .4byte sub_80C4A28
	thumb_func_end sub_80C4A0C

	thumb_func_start sub_80C4A28
sub_80C4A28: @ 80C4A28
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C4A3C @ =sub_80C8938
	ldr r2, _080C4A40 @ =sub_80C4A44
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080C4A3C: .4byte sub_80C8938
_080C4A40: .4byte sub_80C4A44
	thumb_func_end sub_80C4A28

	thumb_func_start sub_80C4A44
sub_80C4A44: @ 80C4A44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	ldr r0, _080C4AA0 @ =gSpecialVar_0x8004
	mov r8, r0
	add r1, sp, 0x4
	mov r12, r1
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r4, r0, 3
	ldr r6, _080C4AA4 @ =gTasks + 0x8
	adds r7, r1, 0
_080C4A64:
	mov r0, sp
	adds r2, r0, r3
	adds r1, r3, 0x1
	lsls r0, r1, 1
	adds r0, r4
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r2]
	lsls r1, 24
	lsrs r3, r1, 24
	cmp r3, 0x3
	bls _080C4A64
	movs r3, 0
	mov r2, sp
_080C4A80:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bhi _080C4A96
	mov r0, sp
	adds r1, r0, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080C4A80
_080C4A96:
	cmp r3, 0x4
	bne _080C4AA8
	movs r0, 0
	b _080C4AAA
	.align 2, 0
_080C4AA0: .4byte gSpecialVar_0x8004
_080C4AA4: .4byte gTasks + 0x8
_080C4AA8:
	movs r0, 0x1
_080C4AAA:
	mov r1, r8
	strh r0, [r1]
	movs r3, 0
	mov r4, r12
	adds r0, r7, r5
	lsls r2, r0, 3
	ldr r6, _080C4AF8 @ =gTasks + 0x8
_080C4AB8:
	adds r1, r4, r3
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r2
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080C4AB8
	mov r0, r12
	bl sub_80C4B34
	ldr r1, _080C4AFC @ =gUnknown_0203869B
	strb r0, [r1]
	ldr r0, _080C4B00 @ =gSpecialVar_ContestCategory
	ldrb r0, [r0]
	bl sub_80AE82C
	ldr r1, _080C4B04 @ =sub_80C8EBC
	ldr r2, _080C4B08 @ =sub_80C4B0C
	adds r0, r5, 0
	bl SetTaskFuncWithFollowupFunc
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4AF8: .4byte gTasks + 0x8
_080C4AFC: .4byte gUnknown_0203869B
_080C4B00: .4byte gSpecialVar_ContestCategory
_080C4B04: .4byte sub_80C8EBC
_080C4B08: .4byte sub_80C4B0C
	thumb_func_end sub_80C4A44

	thumb_func_start sub_80C4B0C
sub_80C4B0C: @ 80C4B0C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80B0F28
	ldr r1, _080C4B2C @ =sub_80C8F34
	ldr r2, _080C4B30 @ =sub_80C4B5C
	adds r0, r4, 0
	bl SetTaskFuncWithFollowupFunc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4B2C: .4byte sub_80C8F34
_080C4B30: .4byte sub_80C4B5C
	thumb_func_end sub_80C4B0C

	thumb_func_start sub_80C4B34
sub_80C4B34: @ 80C4B34
	push {r4,lr}
	adds r3, r0, 0
	movs r4, 0
	movs r2, 0x1
_080C4B3C:
	adds r0, r3, r4
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _080C4B4C
	lsls r0, r2, 24
	lsrs r4, r0, 24
_080C4B4C:
	adds r2, 0x1
	cmp r2, 0x3
	ble _080C4B3C
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C4B34

	thumb_func_start sub_80C4B5C
sub_80C4B5C: @ 80C4B5C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C4B84 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _080C4B90
	bl IsLinkTaskFinished
	lsls r0, 24
	cmp r0, 0
	beq _080C4B9E
	ldr r0, _080C4B88 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C4B8C @ =sub_80C4BA4
	str r0, [r1]
	b _080C4B9E
	.align 2, 0
_080C4B84: .4byte gSpecialVar_0x8004
_080C4B88: .4byte gTasks
_080C4B8C: .4byte sub_80C4BA4
_080C4B90:
	adds r0, r4, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_080C4B9E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C4B5C

	thumb_func_start sub_80C4BA4
sub_80C4BA4: @ 80C4BA4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_800832C
	ldr r1, _080C4BC4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C4BC8 @ =sub_80C4BCC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4BC4: .4byte gTasks
_080C4BC8: .4byte sub_80C4BCC
	thumb_func_end sub_80C4BA4

	thumb_func_start sub_80C4BCC
sub_80C4BCC: @ 80C4BCC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080C4BEC @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C4BE8
	adds r0, r1, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_080C4BE8:
	pop {r0}
	bx r0
	.align 2, 0
_080C4BEC: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80C4BCC

	.align 2, 0 @ Don't pad with nop.
