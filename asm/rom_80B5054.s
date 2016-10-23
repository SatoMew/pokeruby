	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_80B5054
sub_80B5054: @ 80B5054
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, _080B5098 @ =sub_80B52B4
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B50A4
	ldr r1, _080B509C @ =gScriptResult
	movs r0, 0xFF
	strh r0, [r1]
	ldr r1, _080B50A0 @ =gMultichoiceLists
	lsls r0, r4, 3
	adds r0, r1
	ldrb r2, [r0, 0x4]
	ldr r3, [r0]
	str r5, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_80B5138
	movs r0, 0x1
	b _080B50A6
	.align 2, 0
_080B5098: .4byte sub_80B52B4
_080B509C: .4byte gScriptResult
_080B50A0: .4byte gMultichoiceLists
_080B50A4:
	movs r0, 0
_080B50A6:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B5054

	thumb_func_start sub_80B50B0
sub_80B50B0: @ 80B50B0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	ldr r4, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B5100 @ =sub_80B52B4
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B510C
	ldr r1, _080B5104 @ =gScriptResult
	movs r0, 0xFF
	strh r0, [r1]
	ldr r1, _080B5108 @ =gMultichoiceLists
	lsls r0, r5, 3
	adds r0, r1
	ldrb r2, [r0, 0x4]
	ldr r3, [r0]
	str r6, [sp]
	str r4, [sp, 0x4]
	mov r0, r8
	adds r1, r7, 0
	bl sub_80B5138
	movs r0, 0x1
	b _080B510E
	.align 2, 0
_080B5100: .4byte sub_80B52B4
_080B5104: .4byte gScriptResult
_080B5108: .4byte gMultichoiceLists
_080B510C:
	movs r0, 0
_080B510E:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B50B0

	thumb_func_start GetStringWidthInTilesForScriptMenu
GetStringWidthInTilesForScriptMenu: @ 80B511C
	push {lr}
	adds r1, r0, 0
	ldr r0, _080B5134 @ =gWindowConfig_81E6CE4
	bl GetStringWidthGivenWindowConfig
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0x7
	lsrs r0, r1, 3
	pop {r1}
	bx r1
	.align 2, 0
_080B5134: .4byte gWindowConfig_81E6CE4
	thumb_func_end GetStringWidthInTilesForScriptMenu

	thumb_func_start sub_80B5138
sub_80B5138: @ 80B5138
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r10, r3
	ldr r3, [sp, 0x34]
	ldr r4, [sp, 0x38]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x8]
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0xC]
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x10]
	mov r1, r10
	ldr r0, [r1]
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r5, r0, 16
	movs r4, 0x1
	cmp r4, r8
	bcs _080B5198
_080B517A:
	lsls r0, r4, 3
	add r0, r10
	ldr r0, [r0]
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r0, 16
	cmp r5, r0
	bcs _080B518E
	adds r5, r0, 0
_080B518E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r8
	bcc _080B517A
_080B5198:
	lsls r0, r5, 24
	lsrs r7, r0, 24
	mov r1, r9
	adds r0, r7, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x1D
	bls _080B51B8
	mov r0, r9
	adds r0, 0x1D
	subs r0, r7
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r7, 0x1D
_080B51B8:
	mov r1, r8
	lsls r0, r1, 1
	adds r0, 0x1
	ldr r1, [sp, 0x8]
	lsls r4, r1, 24
	asrs r4, 24
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	adds r2, r7, 0
	adds r3, r4, 0
	bl MenuDrawTextWindow
	mov r6, r9
	adds r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	ldr r5, [sp, 0x8]
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	adds r1, r5, 0
	mov r2, r8
	mov r3, r10
	bl PrintMenuItems
	ldr r0, [sp, 0x10]
	str r0, [sp]
	mov r1, r9
	subs r0, r7, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	adds r1, r6, 0
	adds r2, r5, 0
	mov r3, r8
	bl InitMenu
	ldr r0, [sp, 0xC]
	str r0, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	mov r0, r9
	ldr r1, [sp, 0x8]
	adds r2, r7, 0
	adds r3, r4, 0
	bl sub_80B5230
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5138

	thumb_func_start sub_80B5230
sub_80B5230: @ 80B5230
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, [sp, 0x1C]
	mov r8, r0
	ldr r0, [sp, 0x20]
	mov r9, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080B5298 @ =sub_80B52B4
	movs r1, 0x50
	str r3, [sp]
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B529C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xA]
	strh r6, [r1, 0xC]
	ldr r3, [sp]
	strh r3, [r1, 0xE]
	mov r0, r8
	strh r0, [r1, 0x10]
	mov r0, r9
	cmp r0, 0x3
	bls _080B52A0
	movs r0, 0x1
	b _080B52A2
	.align 2, 0
_080B5298: .4byte sub_80B52B4
_080B529C: .4byte gTasks
_080B52A0:
	movs r0, 0
_080B52A2:
	strh r0, [r1, 0x12]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5230

	thumb_func_start sub_80B52B4
sub_80B52B4: @ 80B52B4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080B52E0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B534E
	ldr r2, _080B52E4 @ =gTasks
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	adds r0, r2
	movs r2, 0x12
	ldrsh r0, [r0, r2]
	adds r5, r1, 0
	cmp r0, 0
	bne _080B52E8
	bl ProcessMenuInputNoWrap
	b _080B52EC
	.align 2, 0
_080B52E0: .4byte gPaletteFade
_080B52E4: .4byte gTasks
_080B52E8:
	bl ProcessMenuInput
_080B52EC:
	lsls r0, 24
	lsrs r0, 24
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _080B534E
	adds r0, 0x1
	cmp r1, r0
	bne _080B5328
	ldr r0, _080B5320 @ =gTasks
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x10
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080B534E
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080B5324 @ =gScriptResult
	movs r0, 0x7F
	strh r0, [r1]
	b _080B532C
	.align 2, 0
_080B5320: .4byte gTasks
_080B5324: .4byte gScriptResult
_080B5328:
	ldr r0, _080B5354 @ =gScriptResult
	strh r1, [r0]
_080B532C:
	bl sub_8072DEC
	ldr r0, _080B5358 @ =gTasks
	adds r3, r5, r4
	lsls r3, 3
	adds r3, r0
	ldrb r0, [r3, 0x8]
	ldrb r1, [r3, 0xA]
	ldrb r2, [r3, 0xC]
	ldrb r3, [r3, 0xE]
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080B534E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5354: .4byte gScriptResult
_080B5358: .4byte gTasks
	thumb_func_end sub_80B52B4

	thumb_func_start Multichoice
Multichoice: @ 80B535C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, _080B539C @ =sub_80B52B4
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B53A8
	ldr r1, _080B53A0 @ =gScriptResult
	movs r0, 0xFF
	strh r0, [r1]
	ldr r1, _080B53A4 @ =gMultichoiceLists
	lsls r0, r4, 3
	adds r0, r1
	ldrb r2, [r0, 0x4]
	ldr r3, [r0]
	str r5, [sp]
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_80B53B4
	movs r0, 0x1
	b _080B53AA
	.align 2, 0
_080B539C: .4byte sub_80B52B4
_080B53A0: .4byte gScriptResult
_080B53A4: .4byte gMultichoiceLists
_080B53A8:
	movs r0, 0
_080B53AA:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end Multichoice

	thumb_func_start sub_80B53B4
sub_80B53B4: @ 80B53B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r7, r3, 0
	ldr r3, [sp, 0x28]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	ldr r0, [r7]
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r4, r0, 16
	movs r5, 0x1
	cmp r5, r6
	bcs _080B5408
_080B53EA:
	lsls r0, r5, 3
	adds r0, r7
	ldr r0, [r0]
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	bcs _080B53FE
	adds r4, r0, 0
_080B53FE:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _080B53EA
_080B5408:
	lsls r4, 24
	lsrs r4, 24
	add r4, r8
	adds r4, 0x2
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r6, 1
	adds r0, 0x1
	mov r1, r9
	lsls r5, r1, 24
	asrs r5, 24
	adds r5, r0
	lsls r5, 24
	lsrs r5, 24
	mov r0, r8
	adds r2, r6, 0
	adds r3, r7, 0
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	mov r1, r8
	subs r0, r4, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	mov r2, r9
	adds r3, r6, 0
	bl InitMenu
	mov r0, r10
	str r0, [sp]
	str r6, [sp, 0x4]
	mov r0, r8
	mov r1, r9
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_80B5230
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B53B4

	thumb_func_start yes_no_box
yes_no_box: @ 80B546C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r6, _080B54B4 @ =task_yes_no_maybe
	adds r0, r6, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B54C0
	ldr r1, _080B54B8 @ =gScriptResult
	movs r0, 0xFF
	strh r0, [r1]
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl DisplayYesNoMenu
	adds r0, r6, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B54BC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	strh r4, [r1, 0xA]
	movs r0, 0x1
	b _080B54C2
	.align 2, 0
_080B54B4: .4byte task_yes_no_maybe
_080B54B8: .4byte gScriptResult
_080B54BC: .4byte gTasks
_080B54C0:
	movs r0, 0
_080B54C2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end yes_no_box

	thumb_func_start unref_sub_80B54C8
unref_sub_80B54C8: @ 80B54C8
	push {lr}
	ldr r0, _080B54D8 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0xFF
	beq _080B54DC
	movs r0, 0x1
	b _080B54DE
	.align 2, 0
_080B54D8: .4byte gScriptResult
_080B54DC:
	movs r0, 0
_080B54DE:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80B54C8

	thumb_func_start task_yes_no_maybe
task_yes_no_maybe: @ 80B54E4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080B5504 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0x4
	bgt _080B5508
	adds r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _080B556A
	.align 2, 0
_080B5504: .4byte gTasks
_080B5508:
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080B552C
	cmp r1, r0
	bgt _080B5524
	subs r0, 0x1
	cmp r1, r0
	beq _080B556A
	b _080B5542
_080B5524:
	cmp r1, 0
	beq _080B553C
	cmp r1, 0x1
	bne _080B5542
_080B552C:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080B5538 @ =gScriptResult
	movs r0, 0
	b _080B5540
	.align 2, 0
_080B5538: .4byte gScriptResult
_080B553C:
	ldr r1, _080B5570 @ =gScriptResult
	movs r0, 0x1
_080B5540:
	strh r0, [r1]
_080B5542:
	ldr r0, _080B5574 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x8]
	ldrb r1, [r1, 0xA]
	adds r2, r0, 0x6
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0x5
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080B556A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5570: .4byte gScriptResult
_080B5574: .4byte gTasks
	thumb_func_end task_yes_no_maybe

	thumb_func_start sub_80B5578
sub_80B5578: @ 80B5578
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r4, [sp, 0x30]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0xC]
	lsls r4, 24
	lsrs r5, r4, 24
	movs r7, 0
	ldr r0, _080B55B8 @ =sub_80B5684
	mov r10, r0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B55BC
	movs r0, 0
	b _080B5670
	.align 2, 0
_080B55B8: .4byte sub_80B5684
_080B55BC:
	ldr r1, _080B5620 @ =gScriptResult
	movs r0, 0xFF
	strh r0, [r1]
	ldr r0, _080B5624 @ =gMultichoiceLists
	lsls r4, r6, 3
	adds r0, r4, r0
	ldrb r6, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r7, [sp, 0x8]
	mov r0, r9
	mov r1, r8
	adds r2, r6, 0
	movs r3, 0
	bl sub_807274C
	mov r0, r10
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, r6, 24
	lsrs r1, r0, 24
	lsrs r0, 25
	cmp r0, r5
	bcc _080B55FE
	movs r0, 0x1
	ands r0, r6
	cmp r0, 0
	beq _080B5606
_080B55FE:
	cmp r5, 0x1
	beq _080B5606
	cmp r1, r5
	bne _080B5628
_080B5606:
	ldr r0, _080B5624 @ =gMultichoiceLists
	adds r0, r4, r0
	ldrb r0, [r0, 0x4]
	adds r1, r5, 0
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x1
	mov r2, r8
	lsls r1, r2, 24
	b _080B563A
	.align 2, 0
_080B5620: .4byte gScriptResult
_080B5624: .4byte gMultichoiceLists
_080B5628:
	adds r0, r6, 0
	adds r1, r5, 0
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x3
	mov r3, r8
	lsls r1, r3, 24
_080B563A:
	asrs r1, 24
	adds r1, r0
	lsls r1, 24
	lsrs r7, r1, 24
	adds r0, r5, 0
	bl sub_807288C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B5680 @ =gTasks
	mov r3, r10
	lsls r1, r3, 2
	add r1, r10
	lsls r1, 3
	adds r1, r2
	mov r2, r9
	strh r2, [r1, 0x8]
	mov r3, r8
	strh r3, [r1, 0xA]
	add r0, r9
	adds r0, 0x2
	strh r0, [r1, 0xC]
	strh r7, [r1, 0xE]
	mov r0, sp
	ldrh r0, [r0, 0xC]
	strh r0, [r1, 0x10]
	movs r0, 0x1
_080B5670:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B5680: .4byte gTasks
	thumb_func_end sub_80B5578

	thumb_func_start sub_80B5684
sub_80B5684: @ 80B5684
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80727CC
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _080B56F4
	adds r0, 0x1
	cmp r1, r0
	bne _080B56CC
	ldr r2, _080B56C4 @ =gTasks
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r0, r2
	movs r2, 0x10
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0
	bne _080B56F4
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080B56C8 @ =gScriptResult
	movs r0, 0x7F
	strh r0, [r1]
	b _080B56D2
	.align 2, 0
_080B56C4: .4byte gTasks
_080B56C8: .4byte gScriptResult
_080B56CC:
	ldr r0, _080B56FC @ =gScriptResult
	strh r1, [r0]
	lsls r4, r5, 2
_080B56D2:
	bl sub_8072DEC
	ldr r0, _080B5700 @ =gTasks
	adds r3, r4, r5
	lsls r3, 3
	adds r3, r0
	ldrb r0, [r3, 0x8]
	ldrb r1, [r3, 0xA]
	ldrb r2, [r3, 0xC]
	ldrb r3, [r3, 0xE]
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080B56F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B56FC: .4byte gScriptResult
_080B5700: .4byte gTasks
	thumb_func_end sub_80B5684

	thumb_func_start sp109_CreatePCMenu
sp109_CreatePCMenu: @ 80B5704
	push {lr}
	ldr r0, _080B5724 @ =sub_80B52B4
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B572C
	ldr r1, _080B5728 @ =gScriptResult
	movs r0, 0xFF
	strh r0, [r1]
	bl CreatePCMenu
	movs r0, 0x1
	b _080B572E
	.align 2, 0
_080B5724: .4byte sub_80B52B4
_080B5728: .4byte gScriptResult
_080B572C:
	movs r0, 0
_080B572E:
	pop {r1}
	bx r1
	thumb_func_end sp109_CreatePCMenu

	thumb_func_start CreatePCMenu
CreatePCMenu: @ 80B5734
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r0, _080B5758 @ =gPCText_PlayersPC
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080B575C @ =gPCText_SomeonesPC
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	bls _080B5760
	lsls r0, r4, 24
	lsrs r5, r0, 24
	b _080B5762
	.align 2, 0
_080B5758: .4byte gPCText_PlayersPC
_080B575C: .4byte gPCText_SomeonesPC
_080B5760:
	movs r5, 0x8
_080B5762:
	ldr r0, _080B5798 @ =0x00000804
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080B57A4
	movs r7, 0x4
	adds r4, r5, 0x2
	lsls r2, r4, 24
	lsrs r2, 24
	movs r0, 0
	movs r1, 0
	movs r3, 0x9
	bl MenuDrawTextWindow
	ldr r0, _080B579C @ =gPCText_HallOfFame
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
	ldr r0, _080B57A0 @ =gPCText_LogOff
	movs r1, 0x1
	movs r2, 0x7
	bl MenuPrint
	b _080B57C0
	.align 2, 0
_080B5798: .4byte 0x00000804
_080B579C: .4byte gPCText_HallOfFame
_080B57A0: .4byte gPCText_LogOff
_080B57A4:
	movs r7, 0x3
	adds r4, r5, 0x2
	lsls r2, r4, 24
	lsrs r2, 24
	movs r0, 0
	movs r1, 0
	movs r3, 0x7
	bl MenuDrawTextWindow
	ldr r0, _080B57DC @ =gPCText_LogOff
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
_080B57C0:
	adds r6, r4, 0
	ldr r0, _080B57E0 @ =0x0000084b
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080B57E8
	ldr r0, _080B57E4 @ =gPCText_LanettesPC
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	b _080B57F2
	.align 2, 0
_080B57DC: .4byte gPCText_LogOff
_080B57E0: .4byte 0x0000084b
_080B57E4: .4byte gPCText_LanettesPC
_080B57E8:
	ldr r0, _080B5830 @ =gPCText_SomeonesPC
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
_080B57F2:
	ldr r0, _080B5834 @ =gPCText_PlayersPC
	movs r1, 0x1
	movs r2, 0x3
	bl MenuPrint
	movs r4, 0
	str r4, [sp]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	adds r3, r7, 0
	bl InitMenu
	lsls r2, r6, 24
	lsrs r2, 24
	lsls r3, r7, 1
	adds r3, 0x1
	str r4, [sp]
	str r7, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	bl sub_80B5230
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5830: .4byte gPCText_SomeonesPC
_080B5834: .4byte gPCText_PlayersPC
	thumb_func_end CreatePCMenu

	thumb_func_start sub_80B5838
sub_80B5838: @ 80B5838
	push {lr}
	bl MenuDisplayMessageBox
	ldr r0, _080B584C @ =gUnknown_081A0A01
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_080B584C: .4byte gUnknown_081A0A01
	thumb_func_end sub_80B5838

	thumb_func_start task_picbox
task_picbox: @ 80B5850
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B5874 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B58BE
	cmp r0, 0x1
	bgt _080B5878
	cmp r0, 0
	beq _080B5894
	b _080B58BE
	.align 2, 0
_080B5874: .4byte gTasks
_080B5878:
	cmp r0, 0x2
	beq _080B5882
	cmp r0, 0x3
	beq _080B58A0
	b _080B58BE
_080B5882:
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B589C @ =gSprites
	adds r0, r1
	bl FreeResourcesAndDestroySprite
_080B5894:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B58BE
	.align 2, 0
_080B589C: .4byte gSprites
_080B58A0:
	ldrb r2, [r4, 0xE]
	adds r0, r2, 0
	ldrb r3, [r4, 0x10]
	adds r1, r3, 0
	adds r2, 0x9
	lsls r2, 24
	lsrs r2, 24
	adds r3, 0xA
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl DestroyTask
_080B58BE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end task_picbox

	thumb_func_start sub_80B58C4
sub_80B58C4: @ 80B58C4
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r4, _080B595C @ =task_picbox
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080B596C
	adds r2, r6, 0
	adds r2, 0x9
	lsls r2, 24
	lsrs r2, 24
	adds r3, r5, 0
	adds r3, 0xA
	lsls r3, 24
	lsrs r3, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl MenuDrawTextWindow
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B5960 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r7, [r4, 0xA]
	lsls r1, r6, 19
	movs r0, 0xA0
	lsls r0, 14
	adds r1, r0
	asrs r1, 16
	lsls r2, r5, 19
	adds r2, r0
	asrs r2, 16
	adds r0, r7, 0
	movs r3, 0
	bl CreateMonSprite_PicBox
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	strh r6, [r4, 0xE]
	strh r5, [r4, 0x10]
	ldr r3, _080B5964 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _080B5968 @ =SpriteCallbackDummy
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x1
	b _080B596E
	.align 2, 0
_080B595C: .4byte task_picbox
_080B5960: .4byte gTasks
_080B5964: .4byte gSprites
_080B5968: .4byte SpriteCallbackDummy
_080B596C:
	movs r0, 0
_080B596E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B58C4

	thumb_func_start picbox_close
picbox_close: @ 80B5974
	push {lr}
	ldr r0, _080B5998 @ =task_picbox
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080B59A4
	ldr r0, _080B599C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r0, _080B59A0 @ =sub_80B59AC
	b _080B59A6
	.align 2, 0
_080B5998: .4byte task_picbox
_080B599C: .4byte gTasks
_080B59A0: .4byte sub_80B59AC
_080B59A4:
	movs r0, 0
_080B59A6:
	pop {r1}
	bx r1
	thumb_func_end picbox_close

	thumb_func_start sub_80B59AC
sub_80B59AC: @ 80B59AC
	push {lr}
	ldr r0, _080B59C0 @ =task_picbox
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080B59C4
	movs r0, 0
	b _080B59C6
	.align 2, 0
_080B59C0: .4byte task_picbox
_080B59C4:
	movs r0, 0x1
_080B59C6:
	pop {r1}
	bx r1
	thumb_func_end sub_80B59AC

	thumb_func_start DoNamingScreen
DoNamingScreen: @ 80B59CC
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, [sp, 0x14]
	ldr r5, [sp, 0x18]
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	str r4, [sp]
	str r5, [sp, 0x4]
	bl AddNamingScreenTask
	ldr r0, _080B59F8 @ =C2_NamingScreen
	bl SetMainCallback2
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B59F8: .4byte C2_NamingScreen
	thumb_func_end DoNamingScreen

	thumb_func_start C2_NamingScreen
C2_NamingScreen: @ 80B59FC
	push {lr}
	ldr r0, _080B5A14 @ =gMain
	ldr r1, _080B5A18 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x7
	bhi _080B5A96
	lsls r0, 2
	ldr r1, _080B5A1C @ =_080B5A20
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B5A14: .4byte gMain
_080B5A18: .4byte 0x0000043c
_080B5A1C: .4byte _080B5A20
	.align 2, 0
_080B5A20:
	.4byte _080B5A40
	.4byte _080B5A4A
	.4byte _080B5A50
	.4byte _080B5A56
	.4byte _080B5A5C
	.4byte _080B5A62
	.4byte _080B5A68
	.4byte _080B5A84
_080B5A40:
	bl NamingScreen_TurnOffScreen
	bl NamingScreen_Init
	b _080B5A6C
_080B5A4A:
	bl NamingScreen_ClearVram
	b _080B5A6C
_080B5A50:
	bl NamingScreen_ClearOam
	b _080B5A6C
_080B5A56:
	bl NamingScreen_SetUpVideoRegs
	b _080B5A6C
_080B5A5C:
	bl sub_80B5DC8
	b _080B5A6C
_080B5A62:
	bl NamingScreen_ResetObjects
	b _080B5A6C
_080B5A68:
	bl sub_80B5DFC
_080B5A6C:
	ldr r1, _080B5A7C @ =gMain
	ldr r0, _080B5A80 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080B5A96
	.align 2, 0
_080B5A7C: .4byte gMain
_080B5A80: .4byte 0x0000043c
_080B5A84:
	bl sub_80B5E20
	bl sub_80B5E3C
	bl sub_80B5C04
	ldr r0, _080B5A9C @ =sub_80B5AA0
	bl SetMainCallback2
_080B5A96:
	pop {r0}
	bx r0
	.align 2, 0
_080B5A9C: .4byte sub_80B5AA0
	thumb_func_end C2_NamingScreen

	thumb_func_start sub_80B5AA0
sub_80B5AA0: @ 80B5AA0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80B5AA0

	thumb_func_start sub_80B5AB8
sub_80B5AB8: @ 80B5AB8
	push {r4,lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r1, _080B5B00 @ =REG_BG1VOFS
	ldr r4, _080B5B04 @ =0x02000000
	ldrh r0, [r4, 0x4]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r4, 0x6]
	strh r0, [r1]
	ldr r2, _080B5B08 @ =REG_BG1CNT
	ldrh r1, [r2]
	ldr r3, _080B5B0C @ =0x0000fffc
	adds r0, r3, 0
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	ldrh r1, [r4, 0x8]
	orrs r0, r1
	strh r0, [r2]
	adds r2, 0x2
	ldrh r0, [r2]
	ands r3, r0
	strh r3, [r2]
	ldrh r0, [r2]
	ldrh r1, [r4, 0xA]
	orrs r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5B00: .4byte REG_BG1VOFS
_080B5B04: .4byte 0x02000000
_080B5B08: .4byte REG_BG1CNT
_080B5B0C: .4byte 0x0000fffc
	thumb_func_end sub_80B5AB8

	thumb_func_start AddNamingScreenTask
AddNamingScreenTask: @ 80B5B10
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r0
	mov r9, r1
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r7, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080B5B74 @ =NamingScreenDummyTask
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080B5B78 @ =gTasks
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x8]
	strh r5, [r4, 0xA]
	strh r6, [r4, 0xC]
	lsrs r0, r7, 16
	strh r0, [r4, 0xE]
	strh r7, [r4, 0x10]
	adds r0, r4, 0
	adds r0, 0x12
	mov r1, r9
	bl StoreWordInTwoHalfwords
	adds r4, 0x16
	adds r0, r4, 0
	ldr r1, [sp, 0x20]
	bl StoreWordInTwoHalfwords
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5B74: .4byte NamingScreenDummyTask
_080B5B78: .4byte gTasks
	thumb_func_end AddNamingScreenTask

	thumb_func_start GetNamingScreenParameters
GetNamingScreenParameters: @ 80B5B7C
	push {r4-r6,lr}
	ldr r0, _080B5BD8 @ =NamingScreenDummyTask
	bl FindTaskIdByFunc
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080B5BDC @ =gTasks
	adds r4, r0
	ldr r6, _080B5BE0 @ =0x02000000
	ldrh r0, [r4, 0x8]
	strb r0, [r6, 0x1]
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x3E]
	ldrh r1, [r4, 0xC]
	adds r0, r6, 0
	adds r0, 0x40
	strh r1, [r0]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r0, 16
	ldrh r1, [r4, 0x10]
	orrs r0, r1
	str r0, [r6, 0x44]
	adds r0, r4, 0
	adds r0, 0x12
	adds r1, r6, 0
	adds r1, 0x38
	bl LoadWordFromTwoHalfwords
	adds r4, 0x16
	adds r1, r6, 0
	adds r1, 0x48
	adds r0, r4, 0
	bl LoadWordFromTwoHalfwords
	adds r0, r5, 0
	bl DestroyTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5BD8: .4byte NamingScreenDummyTask
_080B5BDC: .4byte gTasks
_080B5BE0: .4byte 0x02000000
	thumb_func_end GetNamingScreenParameters

	thumb_func_start NamingScreenDummyTask
NamingScreenDummyTask: @ 80B5BE4
	bx lr
	thumb_func_end NamingScreenDummyTask

	thumb_func_start NamingScreen_TurnOffScreen
NamingScreen_TurnOffScreen: @ 80B5BE8
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	thumb_func_end NamingScreen_TurnOffScreen

	thumb_func_start sub_80B5C04
sub_80B5C04: @ 80B5C04
	push {r4,lr}
	ldr r0, _080B5C3C @ =sub_80B5AB8
	bl SetVBlankCallback
	ldr r3, _080B5C40 @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _080B5C44 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _080B5C48 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5C3C: .4byte sub_80B5AB8
_080B5C40: .4byte 0x04000208
_080B5C44: .4byte 0x04000200
_080B5C48: .4byte REG_DISPSTAT
	thumb_func_end sub_80B5C04

	thumb_func_start NamingScreen_ClearVram
NamingScreen_ClearVram: @ 80B5C4C
	push {r4-r7,lr}
	sub sp, 0x4
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0x80
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	ldr r1, _080B5C98 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _080B5C9C @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_080B5C6A:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _080B5C6A
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5C98: .4byte 0x040000d4
_080B5C9C: .4byte 0x81000800
	thumb_func_end NamingScreen_ClearVram

	thumb_func_start NamingScreen_ClearOam
NamingScreen_ClearOam: @ 80B5CA0
	sub sp, 0x4
	movs r2, 0xE0
	lsls r2, 19
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080B5CBC @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080B5CC0 @ =0x81000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	add sp, 0x4
	bx lr
	.align 2, 0
_080B5CBC: .4byte 0x040000d4
_080B5CC0: .4byte 0x81000200
	thumb_func_end NamingScreen_ClearOam

	thumb_func_start NamingScreen_SetUpVideoRegs
NamingScreen_SetUpVideoRegs: @ 80B5CC4
	push {r4,r5,lr}
	ldr r5, _080B5D2C @ =REG_BG0CNT
	movs r1, 0
	strh r1, [r5]
	ldr r2, _080B5D30 @ =REG_BG1CNT
	strh r1, [r2]
	ldr r3, _080B5D34 @ =REG_BG2CNT
	strh r1, [r3]
	ldr r4, _080B5D38 @ =REG_BG3CNT
	strh r1, [r4]
	ldr r0, _080B5D3C @ =REG_BG0HOFS
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	movs r1, 0xF8
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r5]
	ldr r1, _080B5D40 @ =0x00001c01
	adds r0, r1, 0
	strh r0, [r2]
	ldr r2, _080B5D44 @ =0x00001d0a
	adds r0, r2, 0
	strh r0, [r3]
	ldr r1, _080B5D48 @ =0x00001e03
	adds r0, r1, 0
	strh r0, [r4]
	ldr r1, _080B5D4C @ =REG_BLDCNT
	movs r2, 0xC8
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080B5D50 @ =0x0000080c
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5D2C: .4byte REG_BG0CNT
_080B5D30: .4byte REG_BG1CNT
_080B5D34: .4byte REG_BG2CNT
_080B5D38: .4byte REG_BG3CNT
_080B5D3C: .4byte REG_BG0HOFS
_080B5D40: .4byte 0x00001c01
_080B5D44: .4byte 0x00001d0a
_080B5D48: .4byte 0x00001e03
_080B5D4C: .4byte REG_BLDCNT
_080B5D50: .4byte 0x0000080c
	thumb_func_end NamingScreen_SetUpVideoRegs

	thumb_func_start NamingScreen_Init
NamingScreen_Init: @ 80B5D54
	push {r4-r6,lr}
	bl GetNamingScreenParameters
	ldr r4, _080B5DBC @ =0x02000000
	movs r0, 0
	strb r0, [r4]
	movs r2, 0
	strh r0, [r4, 0x4]
	strh r0, [r4, 0x6]
	movs r1, 0x1
	movs r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x2
	strh r0, [r4, 0xA]
	strb r2, [r4, 0xC]
	strb r1, [r4, 0xD]
	ldr r1, _080B5DC0 @ =gUnknown_083CE398
	ldrb r0, [r4, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r4, 0x34]
	ldrb r1, [r0, 0x4]
	strb r1, [r4, 0xE]
	ldrb r1, [r0, 0x1]
	lsrs r1, 1
	movs r0, 0xE
	subs r0, r1
	strh r0, [r4, 0x2]
	ldr r6, _080B5DC4 @ =gKeyRepeatStartDelay
	ldrh r0, [r6]
	strh r0, [r4, 0x3C]
	adds r5, r4, 0
	adds r5, 0x11
	adds r0, r5, 0
	movs r1, 0xFF
	movs r2, 0x10
	bl memset
	ldr r0, [r4, 0x34]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B5DB2
	ldr r1, [r4, 0x38]
	adds r0, r5, 0
	bl StringCopy
_080B5DB2:
	movs r0, 0x10
	strh r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5DBC: .4byte 0x02000000
_080B5DC0: .4byte gUnknown_083CE398
_080B5DC4: .4byte gKeyRepeatStartDelay
	thumb_func_end NamingScreen_Init

	thumb_func_start sub_80B5DC8
sub_80B5DC8: @ 80B5DC8
	push {r4,lr}
	ldr r4, _080B5DE0 @ =gWindowConfig_81E6E88
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5DE0: .4byte gWindowConfig_81E6E88
	thumb_func_end sub_80B5DC8

	thumb_func_start NamingScreen_ResetObjects
NamingScreen_ResetObjects: @ 80B5DE4
	push {lr}
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	pop {r0}
	bx r0
	thumb_func_end NamingScreen_ResetObjects

	thumb_func_start sub_80B5DFC
sub_80B5DFC: @ 80B5DFC
	push {lr}
	bl sub_80B7558
	bl sub_80B753C
	bl sub_80B7680
	bl sub_80B75C4
	bl sub_80B7794
	bl sub_80B78A8
	bl sub_80B7960
	pop {r0}
	bx r0
	thumb_func_end sub_80B5DFC

	thumb_func_start sub_80B5E20
sub_80B5E20: @ 80B5E20
	push {lr}
	bl sub_80B6774
	bl sub_80B6A80
	bl sub_80B6CA8
	bl sub_80B6D04
	bl sub_80B6E44
	pop {r0}
	bx r0
	thumb_func_end sub_80B5E20

	thumb_func_start sub_80B5E3C
sub_80B5E3C: @ 80B5E3C
	push {lr}
	bl sub_80B61D8
	bl sub_80B6438
	bl sub_80B5E50
	pop {r0}
	bx r0
	thumb_func_end sub_80B5E3C

	thumb_func_start sub_80B5E50
sub_80B5E50: @ 80B5E50
	push {r4,lr}
	ldr r4, _080B5E6C @ =sub_80B5E70
	adds r0, r4, 0
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5E6C: .4byte sub_80B5E70
	thumb_func_end sub_80B5E50

	thumb_func_start sub_80B5E70
sub_80B5E70: @ 80B5E70
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r7, _080B5E9C @ =gUnknown_083CE218
	lsls r1, r0, 2
	adds r1, r0
	lsls r4, r1, 3
	ldr r6, _080B5EA0 @ =0x02000000
	ldr r5, _080B5EA4 @ =gTasks
_080B5E82:
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r4, r5
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080B5E82
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5E9C: .4byte gUnknown_083CE218
_080B5EA0: .4byte 0x02000000
_080B5EA4: .4byte gTasks
	thumb_func_end sub_80B5E70

	thumb_func_start sub_80B5EA8
sub_80B5EA8: @ 80B5EA8
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _080B5ECC @ =0x02000000
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_080B5ECC: .4byte 0x02000000
	thumb_func_end sub_80B5EA8

	thumb_func_start sub_80B5ED0
sub_80B5ED0: @ 80B5ED0
	push {lr}
	ldr r0, _080B5EF8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B5EF2
	movs r0, 0x1
	bl sub_80B6210
	movs r0, 0x1
	bl sub_80B68D8
	ldr r1, _080B5EFC @ =0x02000000
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080B5EF2:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B5EF8: .4byte gPaletteFade
_080B5EFC: .4byte 0x02000000
	thumb_func_end sub_80B5ED0

	thumb_func_start sub_80B5F00
sub_80B5F00: @ 80B5F00
	push {lr}
	bl sub_80B60B8
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80B5F00

	thumb_func_start sub_80B5F10
sub_80B5F10: @ 80B5F10
	push {lr}
	bl sub_80B6938
	lsls r0, 24
	cmp r0, 0
	beq _080B5F2C
	movs r0, 0x1
	bl sub_80B6210
	bl sub_80B6878
	ldr r1, _080B5F34 @ =0x02000000
	movs r0, 0x2
	strb r0, [r1]
_080B5F2C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B5F34: .4byte 0x02000000
	thumb_func_end sub_80B5F10

	thumb_func_start sub_80B5F38
sub_80B5F38: @ 80B5F38
	push {lr}
	movs r0, 0
	bl sub_80B6210
	bl sub_80B6B14
	bl sub_80B65F0
	movs r0, 0x1
	bl sub_80B6888
	movs r0, 0
	movs r1, 0
	movs r2, 0x1
	bl sub_80B6460
	movs r0, 0x6
	bl PlaySE
	ldr r1, _080B5F6C @ =0x02000000
	movs r0, 0x5
	strb r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B5F6C: .4byte 0x02000000
	thumb_func_end sub_80B5F38

	thumb_func_start sub_80B5F70
sub_80B5F70: @ 80B5F70
	push {r4,r5,lr}
	sub sp, 0x4
	bl sub_80B6610
	lsls r0, 24
	cmp r0, 0
	beq _080B5FDC
	ldr r4, _080B5FE8 @ =0x02000000
	movs r0, 0x2
	strb r0, [r4]
	ldrb r0, [r4, 0xE]
	adds r0, 0x1
	strb r0, [r4, 0xE]
	ldrb r0, [r4, 0xE]
	movs r1, 0x3
	bl __umodsi3
	strb r0, [r4, 0xE]
	bl sub_80B7614
	bl sub_80B77F8
	movs r0, 0x1
	bl sub_80B6210
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl sub_80B6858
	ldrb r0, [r4, 0xE]
	cmp r0, 0x2
	bne _080B5FC8
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080B5FC8
	mov r1, sp
	movs r0, 0x5
	strh r0, [r1]
_080B5FC8:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl sub_80B680C
	movs r0, 0
	bl sub_80B6888
_080B5FDC:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B5FE8: .4byte 0x02000000
	thumb_func_end sub_80B5F70

	thumb_func_start pokemon_store
pokemon_store: @ 80B5FEC
	push {r4,lr}
	bl sub_80B74B0
	movs r0, 0
	bl sub_80B6210
	movs r0, 0
	bl sub_80B68D8
	movs r0, 0x3
	movs r1, 0
	movs r2, 0x1
	bl sub_80B6460
	ldr r0, _080B6030 @ =gKeyRepeatStartDelay
	ldr r4, _080B6034 @ =0x02000000
	ldrh r1, [r4, 0x3C]
	strh r1, [r0]
	ldrb r0, [r4, 0x1]
	cmp r0, 0x2
	bne _080B6038
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _080B6038
	bl sub_80B74FC
	movs r0, 0x7
	strb r0, [r4]
	movs r0, 0
	b _080B6040
	.align 2, 0
_080B6030: .4byte gKeyRepeatStartDelay
_080B6034: .4byte 0x02000000
_080B6038:
	ldr r1, _080B6048 @ =0x02000000
	movs r0, 0x8
	strb r0, [r1]
	movs r0, 0x1
_080B6040:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6048: .4byte 0x02000000
	thumb_func_end pokemon_store

	thumb_func_start sub_80B604C
sub_80B604C: @ 80B604C
	push {lr}
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _080B6060
	ldr r1, _080B6068 @ =0x02000000
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080B6060:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B6068: .4byte 0x02000000
	thumb_func_end sub_80B604C

	thumb_func_start sub_80B606C
sub_80B606C: @ 80B606C
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080B6090 @ =0x02000000
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_080B6090: .4byte 0x02000000
	thumb_func_end sub_80B606C

	thumb_func_start sub_80B6094
sub_80B6094: @ 80B6094
	push {lr}
	ldr r0, _080B60B0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B60AA
	ldr r0, _080B60B4 @ =0x02000000
	ldr r0, [r0, 0x48]
	bl SetMainCallback2
_080B60AA:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B60B0: .4byte gPaletteFade
_080B60B4: .4byte 0x02000000
	thumb_func_end sub_80B6094

	thumb_func_start sub_80B60B8
sub_80B60B8: @ 80B60B8
	push {r4,r5,lr}
	bl sub_80B61EC
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_80B6958
	lsls r0, 24
	lsrs r0, 24
	cmp r4, 0x8
	bne _080B60D6
	bl sub_80B61C8
	b _080B60F2
_080B60D6:
	cmp r4, 0x6
	bne _080B60E0
	bl sub_80B6FBC
	b _080B6100
_080B60E0:
	cmp r5, 0x7
	beq _080B60FC
	ldr r1, _080B60F8 @ =gUnknown_083CE240
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
_080B60F2:
	lsls r0, 24
	lsrs r0, 24
	b _080B6102
	.align 2, 0
_080B60F8: .4byte gUnknown_083CE240
_080B60FC:
	bl sub_80B7090
_080B6100:
	movs r0, 0
_080B6102:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B60B8

	thumb_func_start sub_80B6108
sub_80B6108: @ 80B6108
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl sub_80B6460
	cmp r4, 0x5
	bne _080B613C
	bl sub_80B7004
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80B6914
	cmp r4, 0
	beq _080B613C
	movs r0, 0
	bl sub_80B6210
	ldr r1, _080B6144 @ =0x02000000
	movs r0, 0x3
	strb r0, [r1]
_080B613C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6144: .4byte 0x02000000
	thumb_func_end sub_80B6108

	thumb_func_start sub_80B6148
sub_80B6148: @ 80B6148
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_80B6460
	cmp r4, 0x5
	beq _080B6162
	movs r0, 0
	b _080B616A
_080B6162:
	bl sub_80B61C8
	lsls r0, 24
	lsrs r0, 24
_080B616A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80B6148

	thumb_func_start sub_80B6170
sub_80B6170: @ 80B6170
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl sub_80B6460
	cmp r4, 0x5
	bne _080B618A
	bl sub_80B6FBC
_080B618A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80B6170

	thumb_func_start sub_80B6194
sub_80B6194: @ 80B6194
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl sub_80B6460
	cmp r4, 0x5
	beq _080B61AE
	movs r0, 0
	b _080B61BC
_080B61AE:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080B61C4 @ =0x02000000
	movs r0, 0x6
	strb r0, [r1]
	movs r0, 0x1
_080B61BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B61C4: .4byte 0x02000000
	thumb_func_end sub_80B6194

	thumb_func_start sub_80B61C8
sub_80B61C8: @ 80B61C8
	ldr r1, _080B61D4 @ =0x02000000
	movs r0, 0x4
	strb r0, [r1]
	movs r0, 0x1
	bx lr
	.align 2, 0
_080B61D4: .4byte 0x02000000
	thumb_func_end sub_80B61C8

	thumb_func_start sub_80B61D8
sub_80B61D8: @ 80B61D8
	push {lr}
	ldr r0, _080B61E8 @ =sub_80B623C
	movs r1, 0x1
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080B61E8: .4byte sub_80B623C
	thumb_func_end sub_80B61D8

	thumb_func_start sub_80B61EC
sub_80B61EC: @ 80B61EC
	push {lr}
	ldr r0, _080B6208 @ =sub_80B623C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B620C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0xA]
	pop {r1}
	bx r1
	.align 2, 0
_080B6208: .4byte sub_80B623C
_080B620C: .4byte gTasks
	thumb_func_end sub_80B61EC

	thumb_func_start sub_80B6210
sub_80B6210: @ 80B6210
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B6234 @ =sub_80B623C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B6238 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6234: .4byte sub_80B623C
_080B6238: .4byte gTasks
	thumb_func_end sub_80B6210

	thumb_func_start sub_80B623C
sub_80B623C: @ 80B623C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080B6264 @ =gUnknown_083CE250
	ldr r2, _080B6268 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B6264: .4byte gUnknown_083CE250
_080B6268: .4byte gTasks
	thumb_func_end sub_80B623C

	thumb_func_start sub_80B626C
sub_80B626C: @ 80B626C
	movs r1, 0
	strh r1, [r0, 0xA]
	bx lr
	thumb_func_end sub_80B626C

	thumb_func_start sub_80B6274
sub_80B6274: @ 80B6274
	push {lr}
	adds r2, r0, 0
	movs r0, 0
	strh r0, [r2, 0xA]
	ldr r0, _080B6290 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B6294
	movs r0, 0x5
	strh r0, [r2, 0xA]
	b _080B62C8
	.align 2, 0
_080B6290: .4byte gMain
_080B6294:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B62A2
	movs r0, 0x6
	strh r0, [r2, 0xA]
	b _080B62C8
_080B62A2:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B62B0
	movs r0, 0x8
	strh r0, [r2, 0xA]
	b _080B62C8
_080B62B0:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080B62C2
	movs r0, 0x9
	strh r0, [r2, 0xA]
	bl sub_80B6878
	b _080B62C8
_080B62C2:
	adds r0, r2, 0
	bl sub_80B62CC
_080B62C8:
	pop {r0}
	bx r0
	thumb_func_end sub_80B6274

	thumb_func_start sub_80B62CC
sub_80B62CC: @ 80B62CC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl sub_80B6858
	ldr r0, _080B6374 @ =gMain
	ldrh r2, [r0, 0x30]
	movs r0, 0x40
	ands r0, r2
	lsls r0, 16
	lsrs r0, 16
	negs r0, r0
	lsrs r1, r0, 31
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080B62F8
	movs r1, 0x2
_080B62F8:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _080B6302
	movs r1, 0x3
_080B6302:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _080B630C
	movs r1, 0x4
_080B630C:
	mov r0, sp
	ldrh r6, [r0]
	mov r2, sp
	ldr r0, _080B6378 @ =gUnknown_083CE258
	lsls r1, 1
	adds r0, r1, r0
	ldrh r3, [r0]
	adds r0, r6, r3
	strh r0, [r2]
	ldr r0, _080B637C @ =gUnknown_083CE262
	adds r1, r0
	ldrh r0, [r1]
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r4]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _080B633A
	mov r1, sp
	movs r0, 0x8
	strh r0, [r1]
_080B633A:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x8
	ble _080B634A
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
_080B634A:
	lsls r0, r3, 16
	asrs r1, r0, 16
	cmp r1, 0
	beq _080B63CA
	ldr r0, _080B6380 @ =0x02000000
	ldrb r0, [r0, 0xE]
	cmp r0, 0x2
	bne _080B638A
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080B638A
	cmp r1, 0
	ble _080B6384
	mov r1, sp
	movs r0, 0x8
	b _080B6388
	.align 2, 0
_080B6374: .4byte gMain
_080B6378: .4byte gUnknown_083CE258
_080B637C: .4byte gUnknown_083CE262
_080B6380: .4byte 0x02000000
_080B6384:
	mov r1, sp
	movs r0, 0x5
_080B6388:
	strh r0, [r1]
_080B638A:
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0x8
	bne _080B63AC
	ldrh r0, [r4]
	strh r0, [r5, 0xC]
	ldr r1, _080B63A8 @ =gUnknown_083CE26C
	movs r2, 0
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	b _080B63C8
	.align 2, 0
_080B63A8: .4byte gUnknown_083CE26C
_080B63AC:
	cmp r6, 0x8
	bne _080B63CA
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080B63BC
	ldrh r0, [r5, 0xC]
	b _080B63C8
_080B63BC:
	ldr r0, _080B63FC @ =gUnknown_083CE274
	movs r2, 0
	ldrsh r1, [r4, r2]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
_080B63C8:
	strh r0, [r4]
_080B63CA:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x8
	bne _080B6408
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _080B63E0
	movs r0, 0x2
	strh r0, [r4]
_080B63E0:
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x2
	ble _080B63EC
	movs r0, 0
	strh r0, [r4]
_080B63EC:
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B6400
	movs r0, 0x1
	strh r0, [r5, 0xC]
	b _080B6420
	.align 2, 0
_080B63FC: .4byte gUnknown_083CE274
_080B6400:
	cmp r0, 0x2
	bne _080B6420
	strh r0, [r5, 0xC]
	b _080B6420
_080B6408:
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080B6414
	movs r0, 0x3
	strh r0, [r4]
_080B6414:
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	ble _080B6420
	movs r0, 0
	strh r0, [r4]
_080B6420:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl sub_80B680C
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B62CC

	thumb_func_start sub_80B6438
sub_80B6438: @ 80B6438
	push {lr}
	ldr r0, _080B6458 @ =sub_80B64D4
	movs r1, 0x3
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B645C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x3
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_080B6458: .4byte sub_80B64D4
_080B645C: .4byte gTasks
	thumb_func_end sub_80B6438

	thumb_func_start sub_80B6460
sub_80B6460: @ 80B6460
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _080B6498 @ =sub_80B64D4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B649C @ =gTasks
	adds r4, r1, r0
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r5, r0
	bne _080B64A0
	cmp r6, 0
	bne _080B64A0
	strh r7, [r4, 0xA]
	movs r0, 0x1
	strh r0, [r4, 0xC]
	b _080B64CC
	.align 2, 0
_080B6498: .4byte sub_80B64D4
_080B649C: .4byte gTasks
_080B64A0:
	cmp r5, 0x3
	bne _080B64B0
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B64B0
	cmp r6, 0
	beq _080B64CC
_080B64B0:
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	beq _080B64C2
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_80B65AC
_080B64C2:
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r7, 0
	bl sub_80B65D4
_080B64CC:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B6460

	thumb_func_start sub_80B64D4
sub_80B64D4: @ 80B64D4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B6548 @ =gTasks
	adds r4, r1, r0
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	beq _080B6540
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B6540
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_80B654C
	lsls r0, 16
	lsrs r0, 16
	ldrb r3, [r4, 0xE]
	adds r1, r3, 0
	adds r2, r3, 0
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r1, [r4, 0x12]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B6520
	subs r0, r1, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080B6540
_080B6520:
	movs r0, 0x2
	strh r0, [r4, 0x12]
	ldrh r1, [r4, 0x10]
	ldrh r2, [r4, 0xE]
	adds r0, r1, r2
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	beq _080B653C
	cmp r0, 0
	bne _080B6540
	ldrh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
_080B653C:
	negs r0, r1
	strh r0, [r4, 0x10]
_080B6540:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6548: .4byte gTasks
	thumb_func_end sub_80B64D4

	thumb_func_start sub_80B654C
sub_80B654C: @ 80B654C
	push {r4-r6,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x4
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x87
	lsls r1, 1
	adds r5, r1, 0
	adds r0, r5
	add r6, sp, 0x8
	strh r0, [r6]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x86
	lsls r1, 1
	adds r0, r1
	mov r1, sp
	adds r1, 0xA
	strh r0, [r1]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	adds r0, r5
	add r1, sp, 0xC
	strh r0, [r1]
	mov r0, sp
	adds r1, r6, 0
	movs r2, 0x6
	bl memcpy
	lsls r4, 1
	mov r1, sp
	adds r0, r1, r4
	ldrh r0, [r0]
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80B654C

	thumb_func_start sub_80B65AC
sub_80B65AC: @ 80B65AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80B654C
	lsls r0, 16
	ldr r2, _080B65CC @ =gPlttBufferFaded
	lsrs r0, 15
	adds r2, r0, r2
	ldr r1, _080B65D0 @ =gPlttBufferUnfaded
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080B65CC: .4byte gPlttBufferFaded
_080B65D0: .4byte gPlttBufferUnfaded
	thumb_func_end sub_80B65AC

	thumb_func_start sub_80B65D4
sub_80B65D4: @ 80B65D4
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0
	strh r1, [r0, 0x8]
	strh r2, [r0, 0xA]
	movs r2, 0x1
	strh r2, [r0, 0xC]
	movs r1, 0xF
	strh r1, [r0, 0xE]
	strh r2, [r0, 0x10]
	strh r3, [r0, 0x12]
	bx lr
	thumb_func_end sub_80B65D4

	thumb_func_start sub_80B65F0
sub_80B65F0: @ 80B65F0
	push {r4,lr}
	ldr r4, _080B660C @ =sub_80B6630
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B660C: .4byte sub_80B6630
	thumb_func_end sub_80B65F0

	thumb_func_start sub_80B6610
sub_80B6610: @ 80B6610
	push {lr}
	ldr r0, _080B6624 @ =sub_80B6630
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080B6628
	movs r0, 0
	b _080B662A
	.align 2, 0
_080B6624: .4byte sub_80B6630
_080B6628:
	movs r0, 0x1
_080B662A:
	pop {r1}
	bx r1
	thumb_func_end sub_80B6610

	thumb_func_start sub_80B6630
sub_80B6630: @ 80B6630
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080B6660 @ =gUnknown_083CE27C
	ldr r2, _080B6664 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080B6642:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080B6642
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6660: .4byte gUnknown_083CE27C
_080B6664: .4byte gTasks
	thumb_func_end sub_80B6630

	thumb_func_start sub_80B6668
sub_80B6668: @ 80B6668
	ldr r2, _080B667C @ =0x02000000
	movs r1, 0
	strh r1, [r2, 0x4]
	strh r1, [r2, 0x6]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	movs r0, 0
	bx lr
	.align 2, 0
_080B667C: .4byte 0x02000000
	thumb_func_end sub_80B6668

	thumb_func_start sub_80B6680
sub_80B6680: @ 80B6680
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, _080B66E4 @ =gUnknown_083CE28C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldrh r0, [r4, 0xA]
	adds r0, 0x4
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r1, 0x28
	bl Sin
	ldr r5, _080B66E8 @ =0x02000000
	ldrb r1, [r5, 0xC]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	ldrh r0, [r4, 0xA]
	adds r0, 0x80
	movs r1, 0xFF
	ands r0, r1
	movs r1, 0x28
	bl Sin
	ldrb r1, [r5, 0xD]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x3F
	ble _080B66DA
	ldrb r1, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080B66DA:
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B66E4: .4byte gUnknown_083CE28C
_080B66E8: .4byte 0x02000000
	thumb_func_end sub_80B6680

	thumb_func_start sub_80B66EC
sub_80B66EC: @ 80B66EC
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, _080B6750 @ =gUnknown_083CE28C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldrh r0, [r4, 0xA]
	adds r0, 0x4
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r1, 0x28
	bl Sin
	ldr r5, _080B6754 @ =0x02000000
	ldrb r1, [r5, 0xC]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	ldrh r0, [r4, 0xA]
	adds r0, 0x80
	movs r1, 0xFF
	ands r0, r1
	movs r1, 0x28
	bl Sin
	ldrb r1, [r5, 0xD]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _080B6746
	ldrb r1, [r5, 0xC]
	ldrb r0, [r5, 0xD]
	strb r0, [r5, 0xC]
	strb r1, [r5, 0xD]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080B6746:
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B6750: .4byte gUnknown_083CE28C
_080B6754: .4byte 0x02000000
	thumb_func_end sub_80B66EC

	thumb_func_start sub_80B6758
sub_80B6758: @ 80B6758
	push {lr}
	ldr r0, _080B6770 @ =sub_80B6630
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B6770: .4byte sub_80B6630
	thumb_func_end sub_80B6758

	thumb_func_start sub_80B6774
sub_80B6774: @ 80B6774
	push {r4,r5,lr}
	ldr r0, _080B67E0 @ =gSpriteTemplate_83CE640
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	ldr r4, _080B67E4 @ =0x02000000
	strb r0, [r4, 0xF]
	ldr r5, _080B67E8 @ =gSprites
	ldrb r0, [r4, 0xF]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ands r2, r1
	orrs r2, r3
	strb r2, [r0, 0x1]
	ldrb r1, [r4, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	strh r1, [r0, 0x3A]
	ldrb r1, [r4, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x2
	strh r1, [r0, 0x3A]
	movs r0, 0
	movs r1, 0
	bl sub_80B680C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B67E0: .4byte gSpriteTemplate_83CE640
_080B67E4: .4byte 0x02000000
_080B67E8: .4byte gSprites
	thumb_func_end sub_80B6774

	thumb_func_start sub_80B67EC
sub_80B67EC: @ 80B67EC
	ldr r3, _080B6804 @ =gUnknown_083CE294
	lsls r0, 16
	asrs r0, 16
	ldr r1, _080B6808 @ =0x02000000
	ldrb r2, [r1, 0xE]
	lsls r1, r2, 3
	adds r1, r2
	adds r0, r1
	adds r0, r3
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080B6804: .4byte gUnknown_083CE294
_080B6808: .4byte 0x02000000
	thumb_func_end sub_80B67EC

	thumb_func_start sub_80B680C
sub_80B680C: @ 80B680C
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r1, _080B6850 @ =0x02000000
	ldrb r1, [r1, 0xF]
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	ldr r1, _080B6854 @ =gSprites
	adds r4, r1
	lsrs r6, r0, 16
	asrs r0, 16
	bl sub_80B67EC
	lsls r0, 24
	lsrs r0, 21
	adds r0, 0x1B
	strh r0, [r4, 0x20]
	lsls r0, r5, 16
	asrs r0, 12
	adds r0, 0x50
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x34]
	strh r6, [r4, 0x2E]
	strh r5, [r4, 0x30]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6850: .4byte 0x02000000
_080B6854: .4byte gSprites
	thumb_func_end sub_80B680C

	thumb_func_start sub_80B6858
sub_80B6858: @ 80B6858
	ldr r2, _080B6870 @ =0x02000000
	ldrb r3, [r2, 0xF]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	ldr r3, _080B6874 @ =gSprites
	adds r2, r3
	ldrh r3, [r2, 0x2E]
	strh r3, [r0]
	ldrh r0, [r2, 0x30]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080B6870: .4byte 0x02000000
_080B6874: .4byte gSprites
	thumb_func_end sub_80B6858

	thumb_func_start sub_80B6878
sub_80B6878: @ 80B6878
	push {lr}
	movs r0, 0x8
	movs r1, 0x2
	bl sub_80B680C
	pop {r0}
	bx r0
	thumb_func_end sub_80B6878

	thumb_func_start sub_80B6888
sub_80B6888: @ 80B6888
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080B68CC @ =gSprites
	ldr r4, _080B68D0 @ =0x02000000
	ldrb r1, [r4, 0xF]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r5
	ldrh r3, [r2, 0x36]
	ldr r1, _080B68D4 @ =0xffffff00
	ands r1, r3
	strh r1, [r2, 0x36]
	ldrb r2, [r4, 0xF]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrh r2, [r1, 0x36]
	orrs r0, r2
	strh r0, [r1, 0x36]
	ldrb r1, [r4, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	bl StartSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B68CC: .4byte gSprites
_080B68D0: .4byte 0x02000000
_080B68D4: .4byte 0xffffff00
	thumb_func_end sub_80B6888

	thumb_func_start sub_80B68D8
sub_80B68D8: @ 80B68D8
	push {r4,r5,lr}
	lsls r0, 24
	ldr r5, _080B690C @ =gSprites
	ldr r4, _080B6910 @ =0x02000000
	ldrb r1, [r4, 0xF]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r5
	ldrh r3, [r2, 0x36]
	movs r1, 0xFF
	ands r1, r3
	strh r1, [r2, 0x36]
	ldrb r2, [r4, 0xF]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsrs r0, 16
	ldrh r2, [r1, 0x36]
	orrs r0, r2
	strh r0, [r1, 0x36]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B690C: .4byte gSprites
_080B6910: .4byte 0x02000000
	thumb_func_end sub_80B68D8

	thumb_func_start sub_80B6914
sub_80B6914: @ 80B6914
	push {lr}
	ldr r0, _080B6930 @ =0x02000000
	ldrb r1, [r0, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B6934 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_080B6930: .4byte 0x02000000
_080B6934: .4byte gSprites
	thumb_func_end sub_80B6914

	thumb_func_start sub_80B6938
sub_80B6938: @ 80B6938
	ldr r2, _080B6950 @ =gSprites
	ldr r0, _080B6954 @ =0x02000000
	ldrb r1, [r0, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r0, 31
	bx lr
	.align 2, 0
_080B6950: .4byte gSprites
_080B6954: .4byte 0x02000000
	thumb_func_end sub_80B6938

	thumb_func_start sub_80B6958
sub_80B6958: @ 80B6958
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r1, _080B6988 @ =gUnknown_083CE2AF
	mov r0, sp
	movs r2, 0x3
	bl memcpy
	add r4, sp, 0x4
	mov r5, sp
	adds r5, 0x6
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B6858
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	ble _080B698C
	movs r1, 0
	ldrsh r0, [r5, r1]
	add r0, sp
	ldrb r0, [r0]
	b _080B698E
	.align 2, 0
_080B6988: .4byte gUnknown_083CE2AF
_080B698C:
	movs r0, 0
_080B698E:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B6958

	thumb_func_start sub_80B6998
sub_80B6998: @ 80B6998
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B69B0
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_080B69B0:
	ldrh r1, [r4, 0x36]
	movs r0, 0xFF
	ands r0, r1
	adds r3, r4, 0
	adds r3, 0x3E
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	ldrb r1, [r3]
	movs r2, 0x5
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r3]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bne _080B69DA
	movs r0, 0x4
	orrs r2, r0
	strb r2, [r3]
_080B69DA:
	ldrb r1, [r3]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080B6A0A
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080B6A0A
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080B6A0A
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _080B6A16
_080B6A0A:
	movs r0, 0
	strh r0, [r4, 0x38]
	movs r0, 0x1
	strh r0, [r4, 0x3A]
	movs r0, 0x2
	strh r0, [r4, 0x3C]
_080B6A16:
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	cmp r0, 0
	bne _080B6A3E
	ldrh r1, [r4, 0x3A]
	ldrh r2, [r4, 0x38]
	adds r0, r1, r2
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	beq _080B6A36
	cmp r0, 0
	bne _080B6A3A
_080B6A36:
	negs r0, r1
	strh r0, [r4, 0x3A]
_080B6A3A:
	movs r0, 0x2
	strh r0, [r4, 0x3C]
_080B6A3E:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080B6A74
	ldrh r4, [r4, 0x38]
	lsls r5, r4, 24
	lsrs r5, 24
	lsls r4, 16
	asrs r4, 17
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r2, _080B6A7C @ =0x01010000
	adds r0, r2
	lsrs r0, 16
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r5, 0
	bl MultiplyInvertedPaletteRGBComponents
_080B6A74:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6A7C: .4byte 0x01010000
	thumb_func_end sub_80B6998

	thumb_func_start sub_80B6A80
sub_80B6A80: @ 80B6A80
	push {r4,r5,lr}
	ldr r0, _080B6AF8 @ =gSpriteTemplate_83CE5C8
	movs r1, 0xCC
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B6AFC @ =0x02000000
	strb r0, [r1, 0x10]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _080B6B00 @ =gSprites
	adds r4, r5
	ldr r1, _080B6B04 @ =gUnknown_083CE558
	adds r0, r4, 0
	bl SetSubspriteTables
	ldr r0, _080B6B08 @ =gSpriteTemplate_83CE5F8
	movs r1, 0xCC
	movs r2, 0x4C
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x3A]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldr r1, _080B6B0C @ =gUnknown_083CE560
	adds r0, r2, 0
	bl SetSubspriteTables
	ldr r0, _080B6B10 @ =gSpriteTemplate_83CE5E0
	movs r1, 0xCC
	movs r2, 0x4B
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	ands r2, r3
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1, 0x5]
	strh r0, [r4, 0x3C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6AF8: .4byte gSpriteTemplate_83CE5C8
_080B6AFC: .4byte 0x02000000
_080B6B00: .4byte gSprites
_080B6B04: .4byte gUnknown_083CE558
_080B6B08: .4byte gSpriteTemplate_83CE5F8
_080B6B0C: .4byte gUnknown_083CE560
_080B6B10: .4byte gSpriteTemplate_83CE5E0
	thumb_func_end sub_80B6A80

	thumb_func_start sub_80B6B14
sub_80B6B14: @ 80B6B14
	ldr r2, _080B6B2C @ =0x02000000
	ldrb r1, [r2, 0x10]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B6B30 @ =gSprites
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrb r1, [r2, 0xE]
	strh r1, [r0, 0x30]
	bx lr
	.align 2, 0
_080B6B2C: .4byte 0x02000000
_080B6B30: .4byte gSprites
	thumb_func_end sub_80B6B14

	thumb_func_start sub_80B6B34
sub_80B6B34: @ 80B6B34
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B6B58 @ =gUnknown_083CE2B4
_080B6B3A:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080B6B3A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6B58: .4byte gUnknown_083CE2B4
	thumb_func_end sub_80B6B34

	thumb_func_start sub_80B6B5C
sub_80B6B5C: @ 80B6B5C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r3, _080B6B90 @ =gSprites
	adds r1, r3
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _080B6B94 @ =0x02000000
	ldrb r0, [r0, 0xE]
	bl sub_80B6C48
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6B90: .4byte gSprites
_080B6B94: .4byte 0x02000000
	thumb_func_end sub_80B6B5C

	thumb_func_start sub_80B6B98
sub_80B6B98: @ 80B6B98
	movs r0, 0
	bx lr
	thumb_func_end sub_80B6B98

	thumb_func_start sub_80B6B9C
sub_80B6B9C: @ 80B6B9C
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r0, 0x3A
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r2, _080B6C00 @ =gSprites
	adds r4, r0, r2
	movs r0, 0x3C
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r2
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080B6BF8
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	ldr r0, _080B6C04 @ =0x0000fffc
	strh r0, [r4, 0x26]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x30]
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80B6C48
_080B6BF8:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B6C00: .4byte gSprites
_080B6C04: .4byte 0x0000fffc
	thumb_func_end sub_80B6B9C

	thumb_func_start sub_80B6C08
sub_80B6C08: @ 80B6C08
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B6C44 @ =gSprites
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x26]
	adds r0, 0x1
	strh r0, [r2, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080B6C3C
	movs r0, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r4, 0x2E]
_080B6C3C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6C44: .4byte gSprites
	thumb_func_end sub_80B6C08

	thumb_func_start sub_80B6C48
sub_80B6C48: @ 80B6C48
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080B6CA0 @ =gUnknown_083CE2C4
	lsls r4, r5, 1
	adds r0, r4, r0
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	mov r1, r8
	ldrb r2, [r1, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	mov r0, r8
	strb r1, [r0, 0x5]
	ldr r0, _080B6CA4 @ =gUnknown_083CE2CA
	adds r4, r0
	ldrh r0, [r4]
	bl GetSpriteTileStartByTag
	adds r1, r6, 0
	adds r1, 0x40
	strh r0, [r1]
	adds r6, 0x42
	movs r1, 0x3F
	ands r1, r5
	ldrb r2, [r6]
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6CA0: .4byte gUnknown_083CE2C4
_080B6CA4: .4byte gUnknown_083CE2CA
	thumb_func_end sub_80B6C48

	thumb_func_start sub_80B6CA8
sub_80B6CA8: @ 80B6CA8
	push {r4,r5,lr}
	ldr r0, _080B6CF4 @ =gSpriteTemplate_83CE610
	movs r1, 0xCC
	movs r2, 0x6C
	movs r3, 0
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080B6CF8 @ =gSprites
	adds r0, r4
	ldr r5, _080B6CFC @ =gUnknown_083CE578
	adds r1, r5, 0
	bl SetSubspriteTables
	ldr r0, _080B6D00 @ =gSpriteTemplate_83CE628
	movs r1, 0xCC
	movs r2, 0x84
	movs r3, 0
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r1, r5, 0
	bl SetSubspriteTables
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6CF4: .4byte gSpriteTemplate_83CE610
_080B6CF8: .4byte gSprites
_080B6CFC: .4byte gUnknown_083CE578
_080B6D00: .4byte gSpriteTemplate_83CE628
	thumb_func_end sub_80B6CA8

	thumb_func_start sub_80B6D04
sub_80B6D04: @ 80B6D04
	push {r4-r6,lr}
	ldr r4, _080B6D8C @ =0x02000000
	ldrh r1, [r4, 0x2]
	subs r1, 0x1
	lsls r1, 3
	adds r1, 0x4
	ldr r0, _080B6D90 @ =gSpriteTemplate_83CE658
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x28
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, _080B6D94 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldrh r0, [r4, 0x2]
	lsls r0, 3
	adds r0, 0x4
	lsls r0, 16
	lsrs r1, r0, 16
	movs r5, 0
	ldr r0, [r4, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r5, r0
	bcs _080B6D86
	adds r6, r3, 0
_080B6D4A:
	lsls r4, r1, 16
	asrs r4, 16
	ldr r0, _080B6D98 @ =gSpriteTemplate_83CE670
	adds r1, r4, 0
	movs r2, 0x2C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	strh r5, [r0, 0x2E]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x8
	lsls r4, 16
	lsrs r1, r4, 16
	ldr r0, _080B6D8C @ =0x02000000
	ldr r0, [r0, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r5, r0
	bcc _080B6D4A
_080B6D86:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6D8C: .4byte 0x02000000
_080B6D90: .4byte gSpriteTemplate_83CE658
_080B6D94: .4byte gSprites
_080B6D98: .4byte gSpriteTemplate_83CE670
	thumb_func_end sub_80B6D04

	thumb_func_start sub_80B6D9C
sub_80B6D9C: @ 80B6D9C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080B6DE4 @ =gUnknown_083CE2D0
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B6DC0
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080B6DCE
_080B6DC0:
	movs r0, 0x8
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r4, 0x30]
_080B6DCE:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x24]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6DE4: .4byte gUnknown_083CE2D0
	thumb_func_end sub_80B6D9C

	thumb_func_start sub_80B6DE8
sub_80B6DE8: @ 80B6DE8
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080B6E10 @ =gUnknown_083CE2D8
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	bl sub_80B6F44
	lsls r0, 24
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	cmp r0, r1
	beq _080B6E14
	movs r0, 0
	strh r0, [r4, 0x26]
	strh r0, [r4, 0x30]
	b _080B6E3A
	.align 2, 0
_080B6E10: .4byte gUnknown_083CE2D8
_080B6E14:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080B6E3C
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r0, 0
_080B6E3A:
	strh r0, [r4, 0x32]
_080B6E3C:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B6DE8

	thumb_func_start sub_80B6E44
sub_80B6E44: @ 80B6E44
	push {lr}
	ldr r1, _080B6E5C @ =gUnknown_083CE2E0
	ldr r0, _080B6E60 @ =0x02000000
	ldr r0, [r0, 0x34]
	ldrb r0, [r0, 0x2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_080B6E5C: .4byte gUnknown_083CE2E0
_080B6E60: .4byte 0x02000000
	thumb_func_end sub_80B6E44

	thumb_func_start nullsub_40
nullsub_40: @ 80B6E64
	bx lr
	thumb_func_end nullsub_40

	thumb_func_start sub_80B6E68
sub_80B6E68: @ 80B6E68
	push {lr}
	sub sp, 0x4
	ldr r0, _080B6EB0 @ =0x02000000
	ldrh r1, [r0, 0x3E]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_805983C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B6EB4 @ =SpriteCallbackDummy
	movs r2, 0
	str r2, [sp]
	movs r2, 0x38
	movs r3, 0x18
	bl AddPseudoFieldObject
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080B6EB8 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x4
	bl StartSpriteAnim
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080B6EB0: .4byte 0x02000000
_080B6EB4: .4byte SpriteCallbackDummy
_080B6EB8: .4byte gSprites
	thumb_func_end sub_80B6E68

	thumb_func_start sub_80B6EBC
sub_80B6EBC: @ 80B6EBC
	push {r4,lr}
	ldr r0, _080B6EF0 @ =gSpriteTemplate_83CE688
	movs r1, 0x34
	movs r2, 0x18
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080B6EF4 @ =gSprites
	adds r4, r0
	ldr r1, _080B6EF8 @ =gUnknown_083CE580
	adds r0, r4, 0
	bl SetSubspriteTables
	ldrb r0, [r4, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r4, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6EF0: .4byte gSpriteTemplate_83CE688
_080B6EF4: .4byte gSprites
_080B6EF8: .4byte gUnknown_083CE580
	thumb_func_end sub_80B6EBC

	thumb_func_start sub_80B6EFC
sub_80B6EFC: @ 80B6EFC
	push {lr}
	sub sp, 0x8
	bl sub_809D51C
	ldr r3, _080B6F38 @ =0x02000000
	ldrh r0, [r3, 0x3E]
	ldr r1, _080B6F3C @ =SpriteCallbackDummy
	movs r2, 0
	str r2, [sp]
	ldr r2, [r3, 0x44]
	str r2, [sp, 0x4]
	movs r2, 0x34
	movs r3, 0x18
	bl sub_809D2FC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B6F40 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x5]
	movs r2, 0xC
	orrs r0, r2
	strb r0, [r1, 0x5]
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080B6F38: .4byte 0x02000000
_080B6F3C: .4byte SpriteCallbackDummy
_080B6F40: .4byte gSprites
	thumb_func_end sub_80B6EFC

	thumb_func_start sub_80B6F44
sub_80B6F44: @ 80B6F44
	push {r4,lr}
	movs r2, 0
	ldr r1, _080B6F64 @ =0x02000000
	ldr r0, [r1, 0x34]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r2, r0
	bcs _080B6F72
	adds r1, 0x11
	adds r3, r0, 0
_080B6F58:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080B6F68
	adds r0, r2, 0
	b _080B6F7C
	.align 2, 0
_080B6F64: .4byte 0x02000000
_080B6F68:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _080B6F58
_080B6F72:
	ldr r0, [r4, 0x34]
	ldrb r0, [r0, 0x1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
_080B6F7C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80B6F44

	thumb_func_start sub_80B6F84
sub_80B6F84: @ 80B6F84
	push {lr}
	ldr r2, _080B6FA8 @ =0x02000000
	ldr r0, [r2, 0x34]
	ldrb r0, [r0, 0x1]
	subs r0, 0x1
	lsls r1, r0, 24
	cmp r1, 0
	ble _080B6FB4
	adds r3, r2, 0
	adds r3, 0x11
_080B6F98:
	asrs r2, r1, 24
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080B6FAC
	lsrs r0, r1, 24
	b _080B6FB6
	.align 2, 0
_080B6FA8: .4byte 0x02000000
_080B6FAC:
	subs r0, r2, 0x1
	lsls r1, r0, 24
	cmp r1, 0
	bgt _080B6F98
_080B6FB4:
	movs r0, 0
_080B6FB6:
	pop {r1}
	bx r1
	thumb_func_end sub_80B6F84

	thumb_func_start sub_80B6FBC
sub_80B6FBC: @ 80B6FBC
	push {r4,lr}
	bl sub_80B6F84
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B7000 @ =0x02000000
	adds r0, 0x11
	adds r4, r0
	movs r0, 0
	strb r0, [r4]
	bl sub_80B7960
	movs r0, 0xFF
	strb r0, [r4]
	bl sub_80B6958
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080B6FEA
	cmp r0, 0x2
	bne _080B6FF4
_080B6FEA:
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1
	bl sub_80B6460
_080B6FF4:
	movs r0, 0x17
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7000: .4byte 0x02000000
	thumb_func_end sub_80B6FBC

	thumb_func_start sub_80B7004
sub_80B7004: @ 80B7004
	push {r4,r5,lr}
	sub sp, 0x4
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl sub_80B6858
	mov r4, sp
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	bl sub_80B67EC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl sub_80B7768
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	movs r4, 0x1
	cmp r0, 0xFF
	bne _080B7046
	bl sub_80B7104
	b _080B704E
_080B7046:
	cmp r0, 0xFE
	bne _080B7054
	bl sub_80B713C
_080B704E:
	lsls r0, 24
	lsrs r4, r0, 24
	b _080B705A
_080B7054:
	adds r0, r1, 0
	bl sub_80B7174
_080B705A:
	bl sub_80B7960
	movs r0, 0x5
	bl PlaySE
	cmp r4, 0
	beq _080B7084
	bl sub_80B6F84
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B7080 @ =0x02000000
	ldr r1, [r1, 0x34]
	ldrb r1, [r1, 0x1]
	subs r1, 0x1
	cmp r0, r1
	bne _080B7084
	movs r0, 0x1
	b _080B7086
	.align 2, 0
_080B7080: .4byte 0x02000000
_080B7084:
	movs r0, 0
_080B7086:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B7004

	thumb_func_start sub_80B7090
sub_80B7090: @ 80B7090
	push {r4-r7,lr}
	bl sub_80B6F84
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	ldr r0, _080B70C8 @ =0x02000000
	adds r0, 0x11
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r6, r4, 0
	adds r0, r4, 0
	bl sub_80B7198
	lsls r0, 24
	cmp r0, 0
	beq _080B70D6
	adds r0, r4, 0
	bl sub_80B7264
	lsls r0, 24
	cmp r0, 0
	beq _080B70CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B7370
	b _080B70F4
	.align 2, 0
_080B70C8: .4byte 0x02000000
_080B70CC:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B73CC
	b _080B70F4
_080B70D6:
	adds r0, r4, 0
	bl sub_80B71E4
	lsls r0, 24
	cmp r0, 0
	beq _080B70EC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B7474
	b _080B70F4
_080B70EC:
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_80B72A4
_080B70F4:
	bl sub_80B7960
	movs r0, 0x5
	bl PlaySE
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7090

	thumb_func_start sub_80B7104
sub_80B7104: @ 80B7104
	push {r4,r5,lr}
	bl sub_80B6F84
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080B7128 @ =0x02000000
	adds r0, 0x11
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r0, r4, 0
	bl sub_80B720C
	lsls r0, 24
	cmp r0, 0
	bne _080B712C
	movs r0, 0
	b _080B7136
	.align 2, 0
_080B7128: .4byte 0x02000000
_080B712C:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B72A4
	movs r0, 0x1
_080B7136:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B7104

	thumb_func_start sub_80B713C
sub_80B713C: @ 80B713C
	push {r4,r5,lr}
	bl sub_80B6F84
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080B7160 @ =0x02000000
	adds r0, 0x11
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r0, r4, 0
	bl sub_80B7264
	lsls r0, 24
	cmp r0, 0
	bne _080B7164
	movs r0, 0
	b _080B716E
	.align 2, 0
_080B7160: .4byte 0x02000000
_080B7164:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B7370
	movs r0, 0x1
_080B716E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B713C

	thumb_func_start sub_80B7174
sub_80B7174: @ 80B7174
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80B6F44
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B7194 @ =0x02000000
	adds r1, 0x11
	adds r0, r1
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7194: .4byte 0x02000000
	thumb_func_end sub_80B7174

	thumb_func_start sub_80B7198
sub_80B7198: @ 80B7198
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC9
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x13
	bls _080B71DA
	adds r0, r1, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B71DA
	adds r0, r1, 0
	adds r0, 0x74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B71DA
	adds r0, r1, 0
	adds r0, 0x6F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B71DA
	adds r0, r1, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B71DE
_080B71DA:
	movs r0, 0x1
	b _080B71E0
_080B71DE:
	movs r0, 0
_080B71E0:
	pop {r1}
	bx r1
	thumb_func_end sub_80B7198

	thumb_func_start sub_80B71E4
sub_80B71E4: @ 80B71E4
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xB5
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7202
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7206
_080B7202:
	movs r0, 0x1
	b _080B7208
_080B7206:
	movs r0, 0
_080B7208:
	pop {r1}
	bx r1
	thumb_func_end sub_80B71E4

	thumb_func_start sub_80B720C
sub_80B720C: @ 80B720C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFA
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0xE
	bls _080B725A
	adds r0, r1, 0
	subs r0, 0x1A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B725A
	adds r0, r1, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B725A
	adds r0, r1, 0
	subs r0, 0x56
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE
	bls _080B725A
	adds r0, r1, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B725A
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B725E
_080B725A:
	movs r0, 0x1
	b _080B7260
_080B725E:
	movs r0, 0
_080B7260:
	pop {r1}
	bx r1
	thumb_func_end sub_80B720C

	thumb_func_start sub_80B7264
sub_80B7264: @ 80B7264
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xE6
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B729A
	adds r0, r1, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B729A
	adds r0, r1, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B729A
	adds r0, r1, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B729E
_080B729A:
	movs r0, 0x1
	b _080B72A0
_080B729E:
	movs r0, 0
_080B72A0:
	pop {r1}
	bx r1
	thumb_func_end sub_80B7264

	thumb_func_start sub_80B72A4
sub_80B72A4: @ 80B72A4
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xFA
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B72C0
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B72C0:
	adds r0, r2, 0
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B72D2
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B72D2:
	adds r0, r2, 0
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B72E4
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B72E4:
	adds r0, r2, 0
	subs r0, 0x1A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B72F6
	adds r0, r2, 0
	adds r0, 0x2C
	b _080B735A
_080B72F6:
	adds r0, r2, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7356
	adds r0, r2, 0
	subs r0, 0x56
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7314
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B7314:
	adds r0, r2, 0
	subs r0, 0x5B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7326
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B7326:
	adds r0, r2, 0
	subs r0, 0x60
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7338
	adds r0, r2, 0
	adds r0, 0x31
	b _080B735A
_080B7338:
	adds r0, r2, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B734A
	adds r0, r2, 0
	adds r0, 0x2C
	b _080B735A
_080B734A:
	adds r0, r2, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B735E
_080B7356:
	adds r0, r2, 0
	adds r0, 0xFB
_080B735A:
	lsls r0, 24
	lsrs r2, r0, 24
_080B735E:
	ldr r0, _080B736C @ =0x02000000
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B736C: .4byte 0x02000000
	thumb_func_end sub_80B72A4

	thumb_func_start sub_80B7370
sub_80B7370: @ 80B7370
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xE6
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B738C
	adds r0, r2, 0
	adds r0, 0x31
	b _080B73B8
_080B738C:
	adds r0, r2, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B73B6
	adds r0, r2, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B73AA
	adds r0, r2, 0
	adds r0, 0x31
	b _080B73B8
_080B73AA:
	adds r0, r2, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B73BC
_080B73B6:
	adds r0, r2, 0x5
_080B73B8:
	lsls r0, 24
	lsrs r2, r0, 24
_080B73BC:
	ldr r0, _080B73C8 @ =0x02000000
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B73C8: .4byte 0x02000000
	thumb_func_end sub_80B7370

	thumb_func_start sub_80B73CC
sub_80B73CC: @ 80B73CC
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xC9
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B73E8
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B73E8:
	adds r0, r2, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B73FA
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B73FA:
	adds r0, r2, 0
	subs r0, 0x41
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B740C
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B740C:
	adds r0, r2, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B745A
	adds r0, r2, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B742A
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B742A:
	adds r0, r2, 0
	adds r0, 0x74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B743C
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B743C:
	adds r0, r2, 0
	adds r0, 0x6F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B744E
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B745E
_080B744E:
	adds r0, r2, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7462
_080B745A:
	adds r0, r2, 0
	adds r0, 0xD4
_080B745E:
	lsls r0, 24
	lsrs r2, r0, 24
_080B7462:
	ldr r0, _080B7470 @ =0x02000000
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B7470: .4byte 0x02000000
	thumb_func_end sub_80B73CC

	thumb_func_start sub_80B7474
sub_80B7474: @ 80B7474
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xB5
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7496
	adds r0, r2, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B749E
_080B7496:
	adds r0, r2, 0
	adds r0, 0xCF
	lsls r0, 24
	lsrs r2, r0, 24
_080B749E:
	ldr r0, _080B74AC @ =0x02000000
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B74AC: .4byte 0x02000000
	thumb_func_end sub_80B7474

	thumb_func_start sub_80B74B0
sub_80B74B0: @ 80B74B0
	push {r4,lr}
	movs r1, 0
	ldr r3, _080B74E4 @ =0x02000000
	ldr r0, [r3, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r1, r0
	bcs _080B74F6
	adds r2, r3, 0
	adds r4, r3, 0
	adds r4, 0x11
_080B74C4:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B74E8
	cmp r0, 0xFF
	beq _080B74E8
	ldr r0, [r2, 0x38]
	ldr r1, [r2, 0x34]
	ldrb r2, [r1, 0x1]
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r1, r4, 0
	bl StringCopyN
	b _080B74F6
	.align 2, 0
_080B74E4: .4byte 0x02000000
_080B74E8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, [r3, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r1, r0
	bcc _080B74C4
_080B74F6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B74B0

	thumb_func_start sub_80B74FC
sub_80B74FC: @ 80B74FC
	push {r4,lr}
	ldr r0, _080B7528 @ =gStringVar1
	ldr r1, _080B752C @ =0x02000000
	ldr r1, [r1, 0x38]
	bl StringCopy
	ldr r4, _080B7530 @ =gStringVar4
	ldr r1, _080B7534 @ =gOtherText_SentToPC
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080B7538 @ =gWindowConfig_81E6E88
	bl BasicInitMenuWindow
	bl MenuDisplayMessageBox
	adds r0, r4, 0
	bl sub_8072044
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7528: .4byte gStringVar1
_080B752C: .4byte 0x02000000
_080B7530: .4byte gStringVar4
_080B7534: .4byte gOtherText_SentToPC
_080B7538: .4byte gWindowConfig_81E6E88
	thumb_func_end sub_80B74FC

	thumb_func_start sub_80B753C
sub_80B753C: @ 80B753C
	push {lr}
	ldr r0, _080B7550 @ =gUnknown_083CE6A0
	bl LoadSpriteSheets
	ldr r0, _080B7554 @ =gUnknown_083CE708
	bl LoadSpritePalettes
	pop {r0}
	bx r0
	.align 2, 0
_080B7550: .4byte gUnknown_083CE6A0
_080B7554: .4byte gUnknown_083CE708
	thumb_func_end sub_80B753C

	thumb_func_start sub_80B7558
sub_80B7558: @ 80B7558
	push {lr}
	bl sub_80B7568
	bl sub_80B75B0
	pop {r0}
	bx r0
	thumb_func_end sub_80B7558

	thumb_func_start sub_80B7568
sub_80B7568: @ 80B7568
	push {r4,lr}
	ldr r4, _080B759C @ =gNamingScreenMenu_Gfx
	ldr r3, _080B75A0 @ =gMenuMessageBoxContentTileOffset
	ldrh r0, [r3]
	lsls r0, 5
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	ldr r1, _080B75A4 @ =0x040000d4
	str r4, [r1]
	str r0, [r1, 0x4]
	ldr r2, _080B75A8 @ =0x80000400
	str r2, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldrh r0, [r3]
	lsls r0, 5
	ldr r3, _080B75AC @ =0x06008000
	adds r0, r3
	str r4, [r1]
	str r0, [r1, 0x4]
	str r2, [r1, 0x8]
	ldr r0, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B759C: .4byte gNamingScreenMenu_Gfx
_080B75A0: .4byte gMenuMessageBoxContentTileOffset
_080B75A4: .4byte 0x040000d4
_080B75A8: .4byte 0x80000400
_080B75AC: .4byte 0x06008000
	thumb_func_end sub_80B7568

	thumb_func_start sub_80B75B0
sub_80B75B0: @ 80B75B0
	push {lr}
	ldr r0, _080B75C0 @ =gNamingScreenPalettes
	movs r1, 0
	movs r2, 0x80
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_080B75C0: .4byte gNamingScreenPalettes
	thumb_func_end sub_80B75B0

	thumb_func_start sub_80B75C4
sub_80B75C4: @ 80B75C4
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _080B7608 @ =gUnknown_083CE308
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r4, _080B760C @ =gUnknown_083CE2F0
	ldr r5, _080B7610 @ =0x02000000
	ldrb r1, [r5, 0xE]
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r5, 0xC]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	ldrb r1, [r5, 0xE]
	lsls r1, 3
	adds r4, 0x4
	adds r1, r4
	ldrb r0, [r5, 0xD]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7608: .4byte gUnknown_083CE308
_080B760C: .4byte gUnknown_083CE2F0
_080B7610: .4byte 0x02000000
	thumb_func_end sub_80B75C4

	thumb_func_start sub_80B7614
sub_80B7614: @ 80B7614
	push {lr}
	sub sp, 0x8
	ldr r0, _080B7644 @ =gUnknown_083CE308
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _080B7648 @ =gUnknown_083CE2F0
	ldr r2, _080B764C @ =0x02000000
	ldrb r1, [r2, 0xE]
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldrb r0, [r2, 0xD]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080B7644: .4byte gUnknown_083CE308
_080B7648: .4byte gUnknown_083CE2F0
_080B764C: .4byte 0x02000000
	thumb_func_end sub_80B7614

	thumb_func_start sub_80B7650
sub_80B7650: @ 80B7650
	push {lr}
	ldr r1, _080B765C @ =gUnknown_083CE748
	bl sub_80B7698
	pop {r0}
	bx r0
	.align 2, 0
_080B765C: .4byte gUnknown_083CE748
	thumb_func_end sub_80B7650

	thumb_func_start sub_80B7660
sub_80B7660: @ 80B7660
	push {lr}
	ldr r1, _080B766C @ =gUnknown_083CEBF8
	bl sub_80B7698
	pop {r0}
	bx r0
	.align 2, 0
_080B766C: .4byte gUnknown_083CEBF8
	thumb_func_end sub_80B7660

	thumb_func_start sub_80B7670
sub_80B7670: @ 80B7670
	push {lr}
	ldr r1, _080B767C @ =gUnknown_083CF0A8
	bl sub_80B7698
	pop {r0}
	bx r0
	.align 2, 0
_080B767C: .4byte gUnknown_083CF0A8
	thumb_func_end sub_80B7670

	thumb_func_start sub_80B7680
sub_80B7680: @ 80B7680
	push {lr}
	ldr r0, _080B7690 @ =0x0600f000
	ldr r1, _080B7694 @ =gUnknown_08E86258
	bl sub_80B76E0
	pop {r0}
	bx r0
	.align 2, 0
_080B7690: .4byte 0x0600f000
_080B7694: .4byte gUnknown_08E86258
	thumb_func_end sub_80B7680

	thumb_func_start sub_80B7698
sub_80B7698: @ 80B7698
	push {r4-r7,lr}
	mov r12, r0
	adds r3, r1, 0
	movs r4, 0
	ldr r0, _080B76DC @ =gMenuMessageBoxContentTileOffset
	ldrh r6, [r0]
_080B76A4:
	movs r1, 0
	lsls r4, 16
	asrs r5, r4, 11
_080B76AA:
	lsls r0, r1, 16
	asrs r0, 16
	adds r1, r5, r0
	lsls r1, 1
	add r1, r12
	ldrh r7, [r3]
	adds r2, r6, r7
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	adds r3, 0x2
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080B76AA
	movs r1, 0x80
	lsls r1, 9
	adds r0, r4, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080B76A4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B76DC: .4byte gMenuMessageBoxContentTileOffset
	thumb_func_end sub_80B7698

	thumb_func_start sub_80B76E0
sub_80B76E0: @ 80B76E0
	push {r4-r7,lr}
	mov r12, r0
	adds r3, r1, 0
	movs r4, 0
	ldr r0, _080B7728 @ =gMenuMessageBoxContentTileOffset
	ldrh r6, [r0]
_080B76EC:
	movs r1, 0
	lsls r5, r4, 16
	asrs r4, r5, 11
_080B76F2:
	lsls r0, r1, 16
	asrs r0, 16
	adds r1, r4, r0
	lsls r1, 1
	add r1, r12
	ldrh r7, [r3]
	adds r2, r6, r7
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	adds r3, 0x2
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080B76F2
	adds r3, 0x4
	movs r1, 0x80
	lsls r1, 9
	adds r0, r5, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080B76EC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7728: .4byte gMenuMessageBoxContentTileOffset
	thumb_func_end sub_80B76E0

	thumb_func_start sub_80B772C
sub_80B772C: @ 80B772C
	push {lr}
	ldr r1, _080B773C @ =0x02000000
	ldrb r0, [r1, 0xE]
	ldrb r1, [r1, 0xC]
	bl nullsub_20
	pop {r0}
	bx r0
	.align 2, 0
_080B773C: .4byte 0x02000000
	thumb_func_end sub_80B772C

	thumb_func_start sub_80B7740
sub_80B7740: @ 80B7740
	push {r4,lr}
	ldr r4, _080B7760 @ =0x02000000
	ldrb r0, [r4, 0xE]
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4, 0xD]
	bl nullsub_20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7760: .4byte 0x02000000
	thumb_func_end sub_80B7740

	thumb_func_start nullsub_20
nullsub_20: @ 80B7764
	bx lr
	thumb_func_end nullsub_20

	thumb_func_start sub_80B7768
sub_80B7768: @ 80B7768
	ldr r3, _080B778C @ =gUnknown_083CE3A8
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	lsls r2, r1, 2
	adds r2, r1
	lsls r2, 2
	adds r0, r2
	ldr r1, _080B7790 @ =0x02000000
	ldrb r2, [r1, 0xE]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r3
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080B778C: .4byte gUnknown_083CE3A8
_080B7790: .4byte 0x02000000
	thumb_func_end sub_80B7768

	thumb_func_start sub_80B7794
sub_80B7794: @ 80B7794
	push {r4-r6,lr}
	ldr r6, _080B77EC @ =gUnknown_083CE328
	ldr r4, _080B77F0 @ =0x02000000
	ldrb r0, [r4, 0xC]
	lsls r0, 2
	ldrb r1, [r4, 0xE]
	lsls r1, 4
	adds r0, r1
	adds r0, r6
	ldr r0, [r0]
	bl BasicInitMenuWindow
	ldr r5, _080B77F4 @ =gUnknown_083CE310
	ldrb r0, [r4, 0xE]
	lsls r0, 3
	adds r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r1, [r4, 0xD]
	lsls r1, 2
	ldrb r0, [r4, 0xE]
	lsls r0, 4
	adds r1, r0
	adds r6, 0x8
	adds r1, r6
	ldr r0, [r1]
	bl BasicInitMenuWindow
	ldrb r0, [r4, 0xE]
	lsls r0, 3
	adds r5, 0x4
	adds r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_80B772C
	bl sub_80B7740
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B77EC: .4byte gUnknown_083CE328
_080B77F0: .4byte 0x02000000
_080B77F4: .4byte gUnknown_083CE310
	thumb_func_end sub_80B7794

	thumb_func_start sub_80B77F8
sub_80B77F8: @ 80B77F8
	push {r4,lr}
	ldr r2, _080B782C @ =gUnknown_083CE328
	ldr r4, _080B7830 @ =0x02000000
	ldrb r1, [r4, 0xD]
	lsls r1, 2
	ldrb r0, [r4, 0xE]
	lsls r0, 4
	adds r1, r0
	adds r2, 0x8
	adds r1, r2
	ldr r0, [r1]
	bl BasicInitMenuWindow
	ldr r1, _080B7834 @ =gUnknown_083CE310
	ldrb r0, [r4, 0xE]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_80B7740
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B782C: .4byte gUnknown_083CE328
_080B7830: .4byte 0x02000000
_080B7834: .4byte gUnknown_083CE310
	thumb_func_end sub_80B77F8

	thumb_func_start sub_80B7838
sub_80B7838: @ 80B7838
	push {lr}
	movs r0, 0x1
	bl sub_80B785C
	pop {r0}
	bx r0
	thumb_func_end sub_80B7838

	thumb_func_start sub_80B7844
sub_80B7844: @ 80B7844
	push {lr}
	movs r0, 0
	bl sub_80B785C
	pop {r0}
	bx r0
	thumb_func_end sub_80B7844

	thumb_func_start sub_80B7850
sub_80B7850: @ 80B7850
	push {lr}
	movs r0, 0x2
	bl sub_80B785C
	pop {r0}
	bx r0
	thumb_func_end sub_80B7850

	thumb_func_start sub_80B785C
sub_80B785C: @ 80B785C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	movs r5, 0x9
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 4
_080B786C:
	lsls r4, r2, 16
	asrs r4, 16
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 2
	ldr r1, _080B78A4 @ =gUnknown_083CE3A8
	adds r0, r1
	adds r0, r6, r0
	lsls r2, r5, 24
	lsrs r2, 24
	movs r1, 0x3
	bl MenuPrint
	adds r4, 0x1
	lsls r4, 16
	lsls r0, r5, 16
	movs r1, 0x80
	lsls r1, 10
	adds r0, r1
	lsrs r5, r0, 16
	lsrs r2, r4, 16
	asrs r4, 16
	cmp r4, 0x3
	ble _080B786C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B78A4: .4byte gUnknown_083CE3A8
	thumb_func_end sub_80B785C

	thumb_func_start sub_80B78A8
sub_80B78A8: @ 80B78A8
	push {r4,lr}
	ldr r0, _080B78E4 @ =gWindowConfig_81E6F4C
	bl BasicInitMenuWindow
	ldr r1, _080B78E8 @ =gUnknown_083CE358
	ldr r4, _080B78EC @ =0x02000000
	ldrb r0, [r4, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _080B78F0 @ =gUnknown_083CE368
	ldr r0, [r4, 0x34]
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, [r4, 0x34]
	ldr r0, [r0, 0x8]
	movs r1, 0x9
	movs r2, 0x2
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B78E4: .4byte gWindowConfig_81E6F4C
_080B78E8: .4byte gUnknown_083CE358
_080B78EC: .4byte 0x02000000
_080B78F0: .4byte gUnknown_083CE368
	thumb_func_end sub_80B78A8

	thumb_func_start nullsub_61
nullsub_61: @ 80B78F4
	bx lr
	thumb_func_end nullsub_61

	thumb_func_start sub_80B78F8
sub_80B78F8: @ 80B78F8
	push {lr}
	ldr r0, _080B7914 @ =gStringVar1
	ldr r1, _080B7918 @ =0x02000000
	movs r3, 0x3E
	ldrsh r2, [r1, r3]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080B791C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080B7914: .4byte gStringVar1
_080B7918: .4byte 0x02000000
_080B791C: .4byte gSpeciesNames
	thumb_func_end sub_80B78F8

	thumb_func_start nullsub_62
nullsub_62: @ 80B7920
	bx lr
	thumb_func_end nullsub_62

	thumb_func_start sub_80B7924
sub_80B7924: @ 80B7924
	push {lr}
	sub sp, 0x4
	ldr r1, _080B7958 @ =gUnknown_083CE370
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	ldr r0, _080B795C @ =0x02000000
	adds r0, 0x40
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0xFF
	beq _080B7952
	cmp r0, 0xFE
	bne _080B7948
	mov r1, sp
	movs r0, 0xB6
	strb r0, [r1]
_080B7948:
	mov r0, sp
	movs r1, 0x14
	movs r2, 0x4
	bl MenuPrint
_080B7952:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080B7958: .4byte gUnknown_083CE370
_080B795C: .4byte 0x02000000
	thumb_func_end sub_80B7924

	thumb_func_start sub_80B7960
sub_80B7960: @ 80B7960
	push {r4,lr}
	ldr r0, _080B799C @ =gStringVar1
	movs r2, 0xFC
	strb r2, [r0]
	movs r1, 0x14
	strb r1, [r0, 0x1]
	movs r1, 0x8
	strb r1, [r0, 0x2]
	strb r2, [r0, 0x3]
	movs r1, 0x11
	strb r1, [r0, 0x4]
	movs r1, 0x1
	strb r1, [r0, 0x5]
	adds r0, 0x6
	ldr r4, _080B79A0 @ =0x02000011
	adds r1, r4, 0
	bl StringCopy
	ldr r0, _080B79A4 @ =gWindowConfig_81E6F4C
	bl BasicInitMenuWindow
	ldr r0, _080B799C @ =gStringVar1
	subs r4, 0x11
	ldrb r1, [r4, 0x2]
	movs r2, 0x4
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B799C: .4byte gStringVar1
_080B79A0: .4byte 0x02000011
_080B79A4: .4byte gWindowConfig_81E6F4C
	thumb_func_end sub_80B7960

	thumb_func_start IsEnoughMoney
IsEnoughMoney: @ 80B79A8
	push {lr}
	cmp r0, r1
	bcs _080B79B2
	movs r0, 0
	b _080B79B4
_080B79B2:
	movs r0, 0x1
_080B79B4:
	pop {r1}
	bx r1
	thumb_func_end IsEnoughMoney

	thumb_func_start sub_80B79B8
sub_80B79B8: @ 80B79B8
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2]
	adds r1, r0, r1
	cmp r0, r1
	bls _080B79CC
	ldr r0, _080B79C8 @ =0x000f423f
	b _080B79D4
	.align 2, 0
_080B79C8: .4byte 0x000f423f
_080B79CC:
	str r1, [r2]
	ldr r0, _080B79DC @ =0x000f423f
	cmp r1, r0
	bls _080B79D6
_080B79D4:
	str r0, [r2]
_080B79D6:
	pop {r0}
	bx r0
	.align 2, 0
_080B79DC: .4byte 0x000f423f
	thumb_func_end sub_80B79B8

	thumb_func_start sub_80B79E0
sub_80B79E0: @ 80B79E0
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2]
	cmp r0, r1
	bcs _080B79EE
	movs r0, 0
	b _080B79F0
_080B79EE:
	subs r0, r1
_080B79F0:
	str r0, [r2]
	pop {r0}
	bx r0
	thumb_func_end sub_80B79E0

	thumb_func_start sub_80B79F8
sub_80B79F8: @ 80B79F8
	push {r4,lr}
	adds r3, r0, 0
	lsls r2, 24
	lsrs r4, r2, 24
	ldr r0, _080B7A0C @ =0x000f423f
	cmp r1, r0
	bls _080B7A10
	movs r2, 0x7
	b _080B7A46
	.align 2, 0
_080B7A0C: .4byte 0x000f423f
_080B7A10:
	ldr r0, _080B7A1C @ =0x0001869f
	cmp r1, r0
	bls _080B7A20
	movs r2, 0x6
	b _080B7A46
	.align 2, 0
_080B7A1C: .4byte 0x0001869f
_080B7A20:
	ldr r0, _080B7A2C @ =0x00002710
	cmp r1, r0
	bls _080B7A30
	movs r2, 0x5
	b _080B7A46
	.align 2, 0
_080B7A2C: .4byte 0x00002710
_080B7A30:
	ldr r0, _080B7A90 @ =0x000003e7
	movs r2, 0x4
	cmp r1, r0
	bhi _080B7A46
	movs r2, 0x3
	cmp r1, 0x63
	bhi _080B7A46
	movs r2, 0x1
	cmp r1, 0x9
	bls _080B7A46
	movs r2, 0x2
_080B7A46:
	movs r0, 0xFC
	strb r0, [r3]
	movs r0, 0x14
	strb r0, [r3, 0x1]
	movs r0, 0x6
	strb r0, [r3, 0x2]
	adds r3, 0x3
	movs r0, 0
	subs r2, r4, r2
	cmp r0, r2
	bge _080B7A6C
	movs r4, 0
_080B7A5E:
	strb r4, [r3]
	adds r3, 0x1
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r2
	blt _080B7A5E
_080B7A6C:
	movs r0, 0xB7
	strb r0, [r3]
	adds r3, 0x1
	adds r0, r3, 0
	bl ConvertIntToDecimalString
	adds r3, r0, 0
	movs r0, 0xFC
	strb r0, [r3]
	movs r0, 0x14
	strb r0, [r3, 0x1]
	movs r0, 0
	strb r0, [r3, 0x2]
	movs r0, 0xFF
	strb r0, [r3, 0x3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7A90: .4byte 0x000003e7
	thumb_func_end sub_80B79F8

	thumb_func_start sub_80B7A94
sub_80B7A94: @ 80B7A94
	push {r4-r7,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r7, r3, 24
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80B79F8
	mov r0, sp
	bl sub_8072CA4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r5, 0x1
	lsls r0, 3
	cmp r2, r0
	blt _080B7ACE
	mov r0, sp
	adds r1, r6, 0
	adds r2, r7, 0
	bl MenuPrint
	b _080B7AE4
_080B7ACE:
	adds r1, r6, 0x1
	adds r1, r5
	lsls r1, 3
	subs r1, r2
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r7, 3
	mov r0, sp
	movs r3, 0x1
	bl sub_80729D8
_080B7AE4:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7A94

	thumb_func_start sub_80B7AEC
sub_80B7AEC: @ 80B7AEC
	push {r4-r6,lr}
	sub sp, 0x20
	adds r3, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r6, sp
	movs r0, 0xB7
	strb r0, [r6]
	adds r6, 0x1
	adds r0, r6, 0
	adds r1, r3, 0
	bl ConvertIntToDecimalString
	adds r6, r0, 0
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8072B4C
	movs r0, 0xFC
	strb r0, [r6]
	movs r0, 0x14
	strb r0, [r6, 0x1]
	movs r0, 0
	strb r0, [r6, 0x2]
	movs r0, 0xFF
	strb r0, [r6, 0x3]
	add sp, 0x20
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7AEC

	thumb_func_start sub_80B7B34
sub_80B7B34: @ 80B7B34
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	mov r8, r0
	adds r5, r1, 0
	mov r9, r2
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, 24
	lsrs r5, 24
	mov r1, r9
	lsls r1, 8
	mov r9, r1
	ldr r4, _080B7BD8 @ =gDecoration10000_Gfx
	adds r0, r1, r4
	lsls r6, r5, 4
	subs r6, r5
	lsls r1, r6, 6
	mov r3, r8
	adds r3, 0x1
	lsls r3, 5
	ldr r2, _080B7BDC @ =0x06008000
	adds r3, r2
	adds r1, r3
	movs r2, 0x20
	str r3, [sp]
	bl CpuFastSet
	adds r4, 0x80
	add r9, r4
	adds r0, r5, 0x1
	lsls r4, r0, 4
	subs r4, r0
	lsls r1, r4, 6
	ldr r3, [sp]
	adds r1, r3
	mov r0, r9
	movs r2, 0x20
	bl CpuFastSet
	movs r3, 0
	lsls r5, 5
	mov r0, r8
	adds r7, r5, r0
	lsls r6, 1
	adds r6, 0x1
	add r6, r8
	ldr r1, _080B7BE0 @ =0xfffff000
	adds r5, r1, 0
	ldr r0, _080B7BE4 @ =0x0600f800
	mov r12, r0
	ldr r1, _080B7BE8 @ =0x0600f840
	mov r9, r1
	lsls r4, 1
	adds r4, 0x1
	add r4, r8
_080B7BAA:
	adds r1, r7, r3
	lsls r1, 1
	mov r0, r12
	adds r2, r1, r0
	adds r0, r3, r6
	adds r0, r5
	strh r0, [r2]
	add r1, r9
	adds r0, r3, r4
	adds r0, r5
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080B7BAA
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7BD8: .4byte gDecoration10000_Gfx
_080B7BDC: .4byte 0x06008000
_080B7BE0: .4byte 0xfffff000
_080B7BE4: .4byte 0x0600f800
_080B7BE8: .4byte 0x0600f840
	thumb_func_end sub_80B7B34

	thumb_func_start sub_80B7BEC
sub_80B7BEC: @ 80B7BEC
	push {r4,lr}
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r4, 24
	lsls r3, 24
	movs r1, 0xC0
	lsls r1, 19
	adds r4, r1
	lsrs r4, 24
	movs r1, 0x80
	lsls r1, 17
	adds r3, r1
	lsrs r3, 24
	movs r1, 0x6
	adds r2, r4, 0
	bl sub_80B7A94
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7BEC

	thumb_func_start sub_80B7C14
sub_80B7C14: @ 80B7C14
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r4, 24
	lsls r3, 24
	lsrs r6, r4, 24
	movs r0, 0xD0
	lsls r0, 20
	adds r4, r0
	lsrs r4, 24
	lsrs r5, r3, 24
	movs r1, 0xC0
	lsls r1, 18
	adds r3, r1
	lsrs r3, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuDrawTextWindow
	mov r0, r8
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80B7BEC
	ldr r0, _080B7C88 @ =gUnknown_083CF584
	bl LoadCompressedObjectPic
	ldr r0, _080B7C8C @ =gUnknown_083CF58C
	bl LoadCompressedObjectPalette
	ldr r0, _080B7C90 @ =gSpriteTemplate_83CF56C
	lsls r6, 19
	movs r1, 0x98
	lsls r1, 13
	adds r6, r1
	asrs r6, 16
	lsls r5, 19
	movs r1, 0xB0
	lsls r1, 12
	adds r5, r1
	asrs r5, 16
	adds r1, r6, 0
	adds r2, r5, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, _080B7C94 @ =gUnknown_02038734
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7C88: .4byte gUnknown_083CF584
_080B7C8C: .4byte gUnknown_083CF58C
_080B7C90: .4byte gSpriteTemplate_83CF56C
_080B7C94: .4byte gUnknown_02038734
	thumb_func_end sub_80B7C14

	thumb_func_start RemoveMoneyLabelObject
RemoveMoneyLabelObject: @ 80B7C98
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080B7CDC @ =gUnknown_02038734
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B7CE0 @ =gSprites
	adds r0, r1
	bl DestroySpriteAndFreeResources
	ldr r0, _080B7CE4 @ =0x00002722
	bl FreeSpritePaletteByTag
	adds r2, r4, 0
	adds r2, 0xD
	lsls r2, 24
	lsrs r2, 24
	adds r3, r5, 0x3
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl MenuZeroFillWindowRect
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7CDC: .4byte gUnknown_02038734
_080B7CE0: .4byte gSprites
_080B7CE4: .4byte 0x00002722
	thumb_func_end RemoveMoneyLabelObject

	thumb_func_start sub_80B7CE8
sub_80B7CE8: @ 80B7CE8
	push {lr}
	ldr r0, _080B7D04 @ =gSaveBlock1
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080B7D08 @ =gUnknown_0202E8CE
	ldrh r1, [r1]
	bl IsEnoughMoney
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080B7D04: .4byte gSaveBlock1
_080B7D08: .4byte gUnknown_0202E8CE
	thumb_func_end sub_80B7CE8

	thumb_func_start sub_80B7D0C
sub_80B7D0C: @ 80B7D0C
	push {lr}
	ldr r0, _080B7D1C @ =gSaveBlock1 + 0x490
	ldr r1, _080B7D20 @ =gUnknown_0202E8CE
	ldrh r1, [r1]
	bl sub_80B79E0
	pop {r0}
	bx r0
	.align 2, 0
_080B7D1C: .4byte gSaveBlock1 + 0x490
_080B7D20: .4byte gUnknown_0202E8CE
	thumb_func_end sub_80B7D0C

	thumb_func_start AreMovesContestCombo
AreMovesContestCombo: @ 80B7D24
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 16
	lsls r1, 16
	ldr r2, _080B7D78 @ =gContestMoves
	lsrs r0, 13
	adds r0, r2
	ldrb r4, [r0, 0x2]
	mov r3, sp
	lsrs r1, 13
	adds r1, r2
	ldrb r0, [r1, 0x3]
	strb r0, [r3]
	mov r2, sp
	ldrb r0, [r1, 0x4]
	strb r0, [r2, 0x1]
	ldrb r0, [r1, 0x5]
	strb r0, [r2, 0x2]
	mov r0, sp
	ldrb r1, [r1, 0x6]
	strb r1, [r0, 0x3]
	cmp r4, 0
	beq _080B7D80
	mov r0, sp
	ldrb r0, [r0]
	cmp r4, r0
	beq _080B7D6E
	mov r0, sp
	ldrb r0, [r0, 0x1]
	cmp r4, r0
	beq _080B7D6E
	mov r0, sp
	ldrb r0, [r0, 0x2]
	cmp r4, r0
	beq _080B7D6E
	cmp r4, r1
	bne _080B7D80
_080B7D6E:
	ldr r0, _080B7D7C @ =gComboStarterLookupTable
	adds r0, r4, r0
	ldrb r0, [r0]
	b _080B7D82
	.align 2, 0
_080B7D78: .4byte gContestMoves
_080B7D7C: .4byte gComboStarterLookupTable
_080B7D80:
	movs r0, 0
_080B7D82:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AreMovesContestCombo

	thumb_func_start ContestEffect_00
ContestEffect_00: @ 80B7D8C
	bx lr
	thumb_func_end ContestEffect_00

	thumb_func_start ContestEffect_01
ContestEffect_01: @ 80B7D90
	push {lr}
	ldr r3, _080B7DB8 @ =0x020192d0
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r3, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x10]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x10]
	ldrb r0, [r3, 0x11]
	movs r1, 0
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B7DB8: .4byte 0x020192d0
	thumb_func_end ContestEffect_01

	thumb_func_start ContestEffect_02
ContestEffect_02: @ 80B7DBC
	push {lr}
	ldr r3, _080B7DE4 @ =0x020192d0
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r3, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x11]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x11]
	ldrb r0, [r3, 0x11]
	movs r1, 0x1
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B7DE4: .4byte 0x020192d0
	thumb_func_end ContestEffect_02

	thumb_func_start ContestEffect_03
ContestEffect_03: @ 80B7DE8
	push {r4,lr}
	ldr r3, _080B7E30 @ =0x020192d0
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r4, r3, 0
	subs r4, 0x70
	adds r0, r4
	ldrb r1, [r0, 0x10]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x10]
	ldrb r0, [r3, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x15]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x15]
	ldrb r0, [r3, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0xB]
	movs r0, 0x71
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xB]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7E30: .4byte 0x020192d0
	thumb_func_end ContestEffect_03

	thumb_func_start ContestEffect_04
ContestEffect_04: @ 80B7E34
	push {lr}
	ldr r2, _080B7E58 @ =0x020192d0
	ldrb r1, [r2, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r2, 0
	subs r1, 0x70
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0, 0x12]
	ldrb r0, [r2, 0x11]
	movs r1, 0x2
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B7E58: .4byte 0x020192d0
	thumb_func_end ContestEffect_04

	thumb_func_start ContestEffect_05
ContestEffect_05: @ 80B7E5C
	push {lr}
	ldr r3, _080B7E84 @ =0x020192d0
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r3, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x10]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0, 0x10]
	ldrb r0, [r3, 0x11]
	movs r1, 0x3
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B7E84: .4byte 0x020192d0
	thumb_func_end ContestEffect_05

	thumb_func_start ContestEffect_06
ContestEffect_06: @ 80B7E88
	push {lr}
	ldr r2, _080B7EAC @ =0x020192d0
	ldrb r1, [r2, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r2, 0
	subs r1, 0x70
	adds r0, r1
	movs r1, 0x14
	strb r1, [r0, 0xF]
	ldrb r0, [r2, 0x11]
	movs r1, 0x4
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B7EAC: .4byte 0x020192d0
	thumb_func_end ContestEffect_06

	thumb_func_start ContestEffect_07
ContestEffect_07: @ 80B7EB0
	push {lr}
	ldr r3, _080B7ED8 @ =0x020192d0
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r3, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x10]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x10]
	ldrb r0, [r3, 0x11]
	movs r1, 0x5
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B7ED8: .4byte 0x020192d0
	thumb_func_end ContestEffect_07

	thumb_func_start ContestEffect_08
ContestEffect_08: @ 80B7EDC
	push {r4,lr}
	movs r2, 0
	ldr r3, _080B7F38 @ =0x020192d0
	ldrb r0, [r3, 0x11]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, 0
	beq _080B7F1A
	subs r0, 0x1
	ldrb r4, [r3]
	cmp r0, r4
	beq _080B7F0A
	adds r4, r3, 0
	adds r3, r1, 0
_080B7EF8:
	adds r2, 0x1
	cmp r2, 0x3
	bgt _080B7F0A
	ldrb r0, [r3]
	subs r0, 0x1
	adds r1, r2, r4
	ldrb r1, [r1]
	cmp r0, r1
	bne _080B7EF8
_080B7F0A:
	ldr r1, _080B7F38 @ =0x020192d0
	strb r2, [r1, 0x8]
	movs r0, 0xFF
	strb r0, [r1, 0x9]
	bl sub_80B9120
	lsls r0, 24
	lsrs r2, r0, 24
_080B7F1A:
	cmp r2, 0
	bne _080B7F28
	ldr r0, _080B7F38 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B7F28:
	ldr r0, _080B7F38 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7F38: .4byte 0x020192d0
	thumb_func_end ContestEffect_08

	thumb_func_start ContestEffect_09
ContestEffect_09: @ 80B7F3C
	push {r4-r6,lr}
	movs r2, 0
	ldr r1, _080B7F9C @ =0x020192d0
	ldrb r0, [r1, 0x11]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080B7F7C
	movs r3, 0
	adds r5, r1, 0
	adds r6, r5, 0
	adds r6, 0x8
_080B7F54:
	adds r1, r2, r5
	ldrb r0, [r4]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B7F64
	adds r0, r3, r6
	strb r2, [r0]
	adds r3, 0x1
_080B7F64:
	adds r2, 0x1
	cmp r2, 0x3
	ble _080B7F54
	ldr r0, _080B7F9C @ =0x020192d0
	adds r0, 0x8
	adds r0, r3, r0
	movs r1, 0xFF
	strb r1, [r0]
	bl sub_80B9120
	lsls r0, 24
	lsrs r2, r0, 24
_080B7F7C:
	cmp r2, 0
	bne _080B7F8A
	ldr r0, _080B7F9C @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B7F8A:
	ldr r0, _080B7F9C @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7F9C: .4byte 0x020192d0
	thumb_func_end ContestEffect_09

	thumb_func_start ContestEffect_14
ContestEffect_14: @ 80B7FA0
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x14
	cmp r0, 0x1
	bls _080B7FC2
	movs r1, 0x3C
	cmp r0, 0x7
	bhi _080B7FC2
	movs r1, 0x28
_080B7FC2:
	ldr r0, _080B7FD0 @ =0x020192d0
	strh r1, [r0, 0x4]
	bl ContestEffect_08
	pop {r0}
	bx r0
	.align 2, 0
_080B7FD0: .4byte 0x020192d0
	thumb_func_end ContestEffect_14

	thumb_func_start ContestEffect_15
ContestEffect_15: @ 80B7FD4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r7, 0
	ldr r0, _080B806C @ =0x020192d0
	ldrb r6, [r0, 0x11]
	adds r1, r6, r0
	ldrb r1, [r1]
	mov r8, r0
	cmp r1, 0
	beq _080B804A
	movs r5, 0
	mov r4, r8
_080B7FEE:
	adds r0, r6, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B8044
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r0, 0
	beq _080B8032
	movs r1, 0xA
	cmp r0, 0x2
	bls _080B8032
	movs r1, 0x14
	cmp r0, 0x4
	bls _080B8032
	movs r1, 0x1E
	cmp r0, 0x6
	bls _080B8032
	movs r1, 0x3C
	cmp r0, 0x8
	bhi _080B8032
	movs r1, 0x28
_080B8032:
	strh r1, [r4, 0x4]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B8044
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080B8044:
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B7FEE
_080B804A:
	mov r1, r8
	ldrb r0, [r1, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	cmp r7, 0
	bne _080B8062
	mov r1, r8
	ldrb r0, [r1, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B8062:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B806C: .4byte 0x020192d0
	thumb_func_end ContestEffect_15

	thumb_func_start ContestEffect_16
ContestEffect_16: @ 80B8070
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	mov r9, r0
	ldr r0, _080B8108 @ =0x020192d0
	ldrb r7, [r0, 0x11]
	adds r1, r7, r0
	ldrb r1, [r1]
	mov r10, r0
	cmp r1, 0
	beq _080B80E0
	movs r6, 0
	mov r8, r10
	mov r5, r10
	subs r5, 0x5B
_080B8094:
	mov r1, r8
	adds r0, r7, r1
	adds r1, r6, r1
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B80D8
	ldrb r1, [r5]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B80D8
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80B90C0
	lsls r0, 24
	cmp r0, 0
	beq _080B80D8
	ldrb r0, [r5]
	movs r2, 0x11
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5]
	adds r0, r4, 0
	movs r1, 0x8
	bl sub_80B13EC
	movs r0, 0x1
	mov r9, r0
_080B80D8:
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B8094
_080B80E0:
	mov r1, r10
	ldrb r0, [r1, 0x11]
	movs r1, 0x7
	bl sub_80B13EC
	mov r2, r9
	cmp r2, 0
	bne _080B80FA
	mov r1, r10
	ldrb r0, [r1, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B80FA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8108: .4byte 0x020192d0
	thumb_func_end ContestEffect_16

	thumb_func_start ContestEffect_17
ContestEffect_17: @ 80B810C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r0, 0
	mov r9, r0
	ldr r0, _080B8150 @ =0x020192d0
	ldrb r1, [r0, 0x11]
	mov r8, r1
	adds r1, r0
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0
	beq _080B817C
	movs r5, 0
	adds r4, r6, 0
	movs r7, 0
_080B812E:
	mov r2, r8
	adds r0, r2, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B8172
	adds r0, r6, 0
	subs r0, 0x70
	adds r0, r7, r0
	ldrb r1, [r0, 0x15]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B8154
	movs r0, 0x32
	b _080B8156
	.align 2, 0
_080B8150: .4byte 0x020192d0
_080B8154:
	movs r0, 0xA
_080B8156:
	strh r0, [r4, 0x4]
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B8172
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080B8172:
	adds r7, 0x1C
	adds r5, 0x1
	ldr r6, _080B81A0 @ =0x020192d0
	cmp r5, 0x3
	ble _080B812E
_080B817C:
	ldrb r0, [r6, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	mov r0, r9
	cmp r0, 0
	bne _080B8192
	ldrb r0, [r6, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B8192:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B81A0: .4byte 0x020192d0
	thumb_func_end ContestEffect_17

	thumb_func_start ContestEffect_18
ContestEffect_18: @ 80B81A4
	push {r4,lr}
	ldr r4, _080B81D0 @ =0x020192d0
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x11]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x11]
	bl ContestEffect_09
	ldrb r0, [r4, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B81D0: .4byte 0x020192d0
	thumb_func_end ContestEffect_18

	thumb_func_start ContestEffect_19
ContestEffect_19: @ 80B81D4
	push {r4,lr}
	ldr r4, _080B8208 @ =0x020192d0
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x70
	adds r0, r1
	ldrh r0, [r0, 0x6]
	ldr r1, _080B820C @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 29
	bl sub_80B9038
	ldrb r0, [r4, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8208: .4byte 0x020192d0
_080B820C: .4byte gContestMoves
	thumb_func_end ContestEffect_19

	thumb_func_start ContestEffect_20
ContestEffect_20: @ 80B8210
	push {lr}
	movs r0, 0
	bl sub_80B9038
	ldr r0, _080B8228 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B8228: .4byte 0x020192d0
	thumb_func_end ContestEffect_20

	thumb_func_start ContestEffect_21
ContestEffect_21: @ 80B822C
	push {lr}
	movs r0, 0x1
	bl sub_80B9038
	ldr r0, _080B8244 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B8244: .4byte 0x020192d0
	thumb_func_end ContestEffect_21

	thumb_func_start ContestEffect_22
ContestEffect_22: @ 80B8248
	push {lr}
	movs r0, 0x2
	bl sub_80B9038
	ldr r0, _080B8260 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B8260: .4byte 0x020192d0
	thumb_func_end ContestEffect_22

	thumb_func_start ContestEffect_23
ContestEffect_23: @ 80B8264
	push {lr}
	movs r0, 0x3
	bl sub_80B9038
	ldr r0, _080B827C @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B827C: .4byte 0x020192d0
	thumb_func_end ContestEffect_23

	thumb_func_start ContestEffect_24
ContestEffect_24: @ 80B8280
	push {lr}
	movs r0, 0x4
	bl sub_80B9038
	ldr r0, _080B8298 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B8298: .4byte 0x020192d0
	thumb_func_end ContestEffect_24

	thumb_func_start ContestEffect_25
ContestEffect_25: @ 80B829C
	push {r4-r7,lr}
	movs r4, 0
	ldr r0, _080B82E0 @ =0x020192d0
	ldrb r1, [r0, 0x11]
	adds r1, r0
	ldrb r1, [r1]
	adds r7, r0, 0
	cmp r1, 0x3
	beq _080B82F4
	movs r5, 0
	adds r6, r7, 0
_080B82B2:
	ldrb r0, [r6, 0x11]
	adds r0, r6
	ldrb r0, [r0]
	adds r0, 0x1
	adds r1, r5, r6
	ldrb r1, [r1]
	cmp r0, r1
	bne _080B82EE
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80B90C0
	lsls r0, 24
	cmp r0, 0
	beq _080B82E4
	adds r0, r4, 0
	bl sub_80B157C
	adds r0, r4, 0
	movs r1, 0xA
	b _080B82E8
	.align 2, 0
_080B82E0: .4byte 0x020192d0
_080B82E4:
	adds r0, r4, 0
	movs r1, 0x3C
_080B82E8:
	bl sub_80B13EC
	movs r4, 0x1
_080B82EE:
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B82B2
_080B82F4:
	ldrb r0, [r7, 0x11]
	movs r1, 0x9
	bl sub_80B13EC
	cmp r4, 0
	bne _080B8308
	ldrb r0, [r7, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B8308:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_25

	thumb_func_start ContestEffect_26
ContestEffect_26: @ 80B8310
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	movs r0, 0
	mov r9, r0
	movs r1, 0
	str r1, [sp, 0x18]
	mov r0, sp
	movs r1, 0xFF
	movs r2, 0x5
	bl memset
	movs r6, 0
	movs r4, 0
	add r2, sp, 0x10
	mov r8, r2
	add r3, sp, 0x8
	mov r10, r3
	ldr r5, _080B8384 @ =0x020192d0
	adds r7, r5, 0
	subs r7, 0x70
_080B8340:
	ldrb r0, [r5, 0x11]
	adds r0, r5
	adds r1, r6, r5
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _080B836E
	ldrb r1, [r7, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080B836E
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_80AF59C
	lsls r0, 24
	cmp r0, 0
	bne _080B836E
	mov r1, sp
	adds r0, r1, r4
	strb r6, [r0]
	adds r4, 0x1
_080B836E:
	adds r7, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B8340
	cmp r4, 0x1
	bne _080B8388
	movs r0, 0x3C
	mov r2, r8
	strh r0, [r2]
	b _080B83B6
	.align 2, 0
_080B8384: .4byte 0x020192d0
_080B8388:
	cmp r4, 0x2
	bne _080B8396
	movs r0, 0x1E
	mov r3, r8
	strh r0, [r3]
	strh r0, [r3, 0x2]
	b _080B83B6
_080B8396:
	cmp r4, 0x3
	bne _080B83A6
	movs r0, 0x14
	mov r7, r8
	strh r0, [r7]
	strh r0, [r7, 0x2]
	strh r0, [r7, 0x4]
	b _080B83B6
_080B83A6:
	mov r1, r8
	movs r2, 0
	mov r0, r8
	adds r0, 0x6
_080B83AE:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _080B83AE
_080B83B6:
	movs r6, 0
	movs r7, 0
	mov r4, r10
_080B83BC:
	ldr r0, _080B83F0 @ =0x02019260
	adds r5, r7, r0
	ldrb r1, [r5, 0x15]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B83FC
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_80B214C
	lsls r0, 24
	cmp r0, 0
	beq _080B83FC
	ldr r1, _080B83F4 @ =gContestMoves
	ldrh r0, [r5, 0x8]
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x2]
	ldr r1, _080B83F8 @ =gComboStarterLookupTable
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	b _080B83FE
	.align 2, 0
_080B83F0: .4byte 0x02019260
_080B83F4: .4byte gContestMoves
_080B83F8: .4byte gComboStarterLookupTable
_080B83FC:
	movs r0, 0
_080B83FE:
	strh r0, [r4]
	ldr r5, _080B8494 @ =0x02019260
	adds r0, r7, r5
	ldrb r0, [r0, 0xD]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	asrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4]
	subs r0, r1
	strh r0, [r4]
	adds r7, 0x1C
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B83BC
	mov r2, r8
	movs r3, 0
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080B84CA
	movs r6, 0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080B84CA
	adds r5, 0x7D
	mov r4, sp
_080B8442:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r6, 1
	add r1, r8
	movs r7, 0
	ldrsh r2, [r1, r7]
	ldrb r3, [r4]
	lsls r1, r3, 1
	add r1, r10
	movs r7, 0
	ldrsh r1, [r1, r7]
	adds r2, r1
	cmp r0, r2
	bge _080B8498
	adds r0, r3, 0
	bl sub_80B90C0
	lsls r0, 24
	cmp r0, 0
	beq _080B84A2
	ldrb r0, [r4]
	bl sub_80B157C
	ldrb r0, [r4]
	movs r1, 0xA
	bl sub_80B13EC
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	b _080B849C
	.align 2, 0
_080B8494: .4byte 0x02019260
_080B8498:
	movs r0, 0x1
	str r0, [sp, 0x18]
_080B849C:
	ldr r1, [sp, 0x18]
	cmp r1, 0
	beq _080B84B8
_080B84A2:
	movs r2, 0
	str r2, [sp, 0x18]
	ldrb r0, [r4]
	movs r1, 0x3C
	bl sub_80B13EC
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080B84B8:
	ldrb r0, [r4]
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	adds r4, 0x1
	adds r6, 0x1
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _080B8442
_080B84CA:
	ldr r4, _080B84F4 @ =0x020192d0
	ldrb r0, [r4, 0x11]
	movs r1, 0xB
	bl sub_80B13EC
	mov r3, r9
	cmp r3, 0
	bne _080B84E2
	ldrb r0, [r4, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B84E2:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B84F4: .4byte 0x020192d0
	thumb_func_end ContestEffect_26

	thumb_func_start ContestEffect_27
ContestEffect_27: @ 80B84F8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r0, 0
	mov r8, r0
	movs r6, 0
	ldr r7, _080B8580 @ =0x020192d0
	adds r5, r7, 0
	subs r5, 0x63
_080B850A:
	ldrb r0, [r7, 0x11]
	adds r0, r7
	adds r1, r6, r7
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B8556
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0
	ble _080B8556
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80B90C0
	lsls r0, 24
	cmp r0, 0
	beq _080B8556
	movs r0, 0
	strb r0, [r5]
	ldrb r1, [r5, 0x3]
	movs r2, 0x31
	negs r2, r2
	adds r0, r2, 0
	ands r1, r0
	movs r0, 0x20
	orrs r1, r0
	strb r1, [r5, 0x3]
	adds r0, r4, 0
	movs r1, 0xD
	bl sub_80B13EC
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
_080B8556:
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B850A
	ldr r4, _080B8580 @ =0x020192d0
	ldrb r0, [r4, 0x11]
	movs r1, 0xC
	bl sub_80B13EC
	mov r0, r8
	cmp r0, 0
	bne _080B8576
	ldrb r0, [r4, 0x11]
	movs r1, 0x39
	bl sub_80B1404
_080B8576:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8580: .4byte 0x020192d0
	thumb_func_end ContestEffect_27

	thumb_func_start ContestEffect_28
ContestEffect_28: @ 80B8584
	push {r4-r7,lr}
	movs r7, 0
	movs r5, 0
	ldr r4, _080B85B0 @ =0x020192d0
	movs r6, 0
_080B858E:
	ldrb r0, [r4, 0x11]
	adds r0, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B85CE
	adds r0, r4, 0
	subs r0, 0x70
	adds r0, r6, r0
	ldrb r0, [r0, 0xD]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	ble _080B85B4
	movs r0, 0x28
	b _080B85B6
	.align 2, 0
_080B85B0: .4byte 0x020192d0
_080B85B4:
	movs r0, 0xA
_080B85B6:
	strh r0, [r4, 0x4]
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B85CE
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080B85CE:
	adds r6, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B858E
	ldr r4, _080B85F4 @ =0x020192d0
	ldrb r0, [r4, 0x11]
	movs r1, 0xE
	bl sub_80B13EC
	cmp r7, 0
	bne _080B85EC
	ldrb r0, [r4, 0x11]
	movs r1, 0x39
	bl sub_80B1404
_080B85EC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B85F4: .4byte 0x020192d0
	thumb_func_end ContestEffect_28

	thumb_func_start ContestEffect_29
ContestEffect_29: @ 80B85F8
	push {r4,lr}
	ldr r0, _080B863C @ =gUnknown_02038696
	ldr r4, _080B8640 @ =0x020192d0
	ldrb r2, [r4, 0x11]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080B8636
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r0
	ldrh r0, [r1, 0x6]
	ldr r3, _080B8644 @ =gContestEffects
	ldr r2, _080B8648 @ =gContestMoves
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 1
	ldrh r2, [r1, 0x2]
	adds r0, r2
	strh r0, [r1, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0xF
	bl sub_80B13EC
_080B8636:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B863C: .4byte gUnknown_02038696
_080B8640: .4byte 0x020192d0
_080B8644: .4byte gContestEffects
_080B8648: .4byte gContestMoves
	thumb_func_end ContestEffect_29

	thumb_func_start ContestEffect_30
ContestEffect_30: @ 80B864C
	push {r4,lr}
	ldr r0, _080B8690 @ =gUnknown_02038696
	ldr r4, _080B8694 @ =0x020192d0
	ldrb r2, [r4, 0x11]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _080B868A
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r0
	ldrh r0, [r1, 0x6]
	ldr r3, _080B8698 @ =gContestEffects
	ldr r2, _080B869C @ =gContestMoves
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 1
	ldrh r2, [r1, 0x2]
	adds r0, r2
	strh r0, [r1, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x10
	bl sub_80B13EC
_080B868A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8690: .4byte gUnknown_02038696
_080B8694: .4byte 0x020192d0
_080B8698: .4byte gContestEffects
_080B869C: .4byte gContestMoves
	thumb_func_end ContestEffect_30

	thumb_func_start ContestEffect_31
ContestEffect_31: @ 80B86A0
	push {r4-r7,lr}
	movs r1, 0
	movs r3, 0
	ldr r4, _080B86EC @ =0x020192d0
	ldrb r0, [r4, 0x11]
	adds r0, r4
	ldrb r5, [r0]
	movs r2, 0
	adds r6, r4, 0
	subs r6, 0x70
_080B86B4:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r5, r0
	bls _080B86C4
	adds r0, r2, r6
	movs r7, 0x2
	ldrsh r0, [r0, r7]
	adds r3, r0
_080B86C4:
	adds r2, 0x1C
	adds r1, 0x1
	cmp r1, 0x3
	ble _080B86B4
	cmp r3, 0
	bge _080B86D2
	movs r3, 0
_080B86D2:
	ldr r4, _080B86EC @ =0x020192d0
	ldrb r2, [r4, 0x11]
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B86E2
	cmp r3, 0
	bne _080B86F0
_080B86E2:
	adds r0, r2, 0
	movs r1, 0x12
	bl sub_80B13EC
	b _080B8710
	.align 2, 0
_080B86EC: .4byte 0x020192d0
_080B86F0:
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r0
	lsrs r0, r3, 31
	adds r0, r3, r0
	asrs r0, 1
	ldrh r2, [r1, 0x2]
	adds r0, r2
	strh r0, [r1, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x11
	bl sub_80B13EC
_080B8710:
	ldr r4, _080B873C @ =0x020192d0
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r5, r4, 0
	subs r5, 0x70
	adds r0, r5
	movs r7, 0x2
	ldrsh r0, [r0, r7]
	bl sub_80B9224
	ldrb r2, [r4, 0x11]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B873C: .4byte 0x020192d0
	thumb_func_end ContestEffect_31

	thumb_func_start ContestEffect_32
ContestEffect_32: @ 80B8740
	push {r4-r7,lr}
	movs r6, 0
	ldr r0, _080B8794 @ =0x020192d0
	ldrb r1, [r0, 0x11]
	adds r3, r1, r0
	ldrb r1, [r3]
	adds r4, r0, 0
	cmp r1, 0
	beq _080B8788
	movs r2, 0
	adds r7, r4, 0
	adds r0, r1, 0
	subs r1, r0, 0x1
	movs r3, 0
	adds r5, r4, 0
	subs r5, 0x70
_080B8760:
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r1, r0
	bne _080B876C
	adds r0, r3, r5
	ldrh r6, [r0, 0x2]
_080B876C:
	adds r3, 0x1C
	adds r2, 0x1
	cmp r2, 0x3
	ble _080B8760
	adds r0, r4, 0
	ldrb r2, [r0, 0x11]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B8788
	lsls r0, r6, 16
	asrs r3, r0, 16
	cmp r3, 0
	bgt _080B8798
_080B8788:
	ldrb r0, [r4, 0x11]
	movs r1, 0x14
	bl sub_80B13EC
	b _080B87B2
	.align 2, 0
_080B8794: .4byte 0x020192d0
_080B8798:
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r0
	ldrh r0, [r1, 0x2]
	adds r0, r3, r0
	strh r0, [r1, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x13
	bl sub_80B13EC
_080B87B2:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_32

	thumb_func_start ContestEffect_33
ContestEffect_33: @ 80B87B8
	push {lr}
	ldr r0, _080B87D8 @ =0x020192d0
	ldrb r2, [r0, 0x11]
	adds r1, r2, r0
	ldrb r3, [r1]
	mov r12, r0
	cmp r3, 0
	bne _080B87DC
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	mov r1, r12
	subs r1, 0x70
	adds r0, r1
	movs r1, 0xA
	b _080B87EE
	.align 2, 0
_080B87D8: .4byte 0x020192d0
_080B87DC:
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	mov r1, r12
	subs r1, 0x70
	adds r0, r1
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
_080B87EE:
	strh r1, [r0, 0x2]
	cmp r3, 0
	bne _080B8800
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x15
	bl sub_80B13EC
	b _080B882A
_080B8800:
	cmp r3, 0x1
	bne _080B8810
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x16
	bl sub_80B13EC
	b _080B882A
_080B8810:
	cmp r3, 0x2
	bne _080B8820
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x17
	bl sub_80B13EC
	b _080B882A
_080B8820:
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x18
	bl sub_80B13EC
_080B882A:
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_33

	thumb_func_start ContestEffect_34
ContestEffect_34: @ 80B8830
	push {r4,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x2
	bhi _080B885C
	movs r4, 0xA
	ldr r0, _080B8858 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1A
	bl sub_80B13EC
	b _080B88B0
	.align 2, 0
_080B8858: .4byte 0x020192d0
_080B885C:
	cmp r0, 0x5
	bhi _080B8874
	movs r4, 0x14
	ldr r0, _080B8870 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1B
	bl sub_80B13EC
	b _080B88B0
	.align 2, 0
_080B8870: .4byte 0x020192d0
_080B8874:
	cmp r0, 0x7
	bhi _080B888C
	movs r4, 0x28
	ldr r0, _080B8888 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1C
	bl sub_80B13EC
	b _080B88B0
	.align 2, 0
_080B8888: .4byte 0x020192d0
_080B888C:
	cmp r1, 0x8
	bhi _080B88A4
	movs r4, 0x3C
	ldr r0, _080B88A0 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1D
	bl sub_80B13EC
	b _080B88B0
	.align 2, 0
_080B88A0: .4byte 0x020192d0
_080B88A4:
	movs r4, 0x50
	ldr r0, _080B88C8 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1E
	bl sub_80B13EC
_080B88B0:
	ldr r0, _080B88C8 @ =0x020192d0
	ldrb r2, [r0, 0x11]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	subs r0, 0x70
	adds r1, r0
	strh r4, [r1, 0x2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B88C8: .4byte 0x020192d0
	thumb_func_end ContestEffect_34

	thumb_func_start ContestEffect_35
ContestEffect_35: @ 80B88CC
	push {r4-r7,lr}
	ldr r1, _080B8940 @ =0x020192d0
	ldrb r0, [r1, 0x11]
	adds r0, r1
	movs r2, 0
	ldrsb r2, [r0, r2]
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	mov r12, r1
	cmp r2, 0
	beq _080B8994
	ldrb r5, [r1]
	mov r6, r12
	subs r6, 0x70
_080B88EA:
	movs r2, 0
	lsls r0, r4, 24
	asrs r1, r0, 24
	adds r4, r0, 0
	cmp r5, r1
	beq _080B8910
	ldr r3, _080B8940 @ =0x020192d0
_080B88F8:
	lsls r0, r2, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bgt _080B8910
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, r1
	bne _080B88F8
_080B8910:
	lsls r2, 24
	asrs r1, r2, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r3, r0, r6
	ldrb r1, [r3, 0xB]
	movs r0, 0x80
	ands r0, r1
	adds r7, r2, 0
	cmp r0, 0
	bne _080B8932
	ldrb r1, [r3, 0xC]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080B8944
_080B8932:
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r4, r1
	lsrs r4, r0, 24
	cmp r0, 0
	blt _080B8994
	b _080B88EA
	.align 2, 0
_080B8940: .4byte 0x020192d0
_080B8944:
	mov r2, r12
	ldrb r1, [r2, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r3, r12
	subs r3, 0x70
	adds r5, r0, r3
	ldrh r0, [r5, 0x6]
	ldr r4, _080B899C @ =gContestMoves
	lsls r0, 3
	adds r6, r0, r4
	ldrb r2, [r6, 0x1]
	lsls r2, 29
	asrs r1, r7, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x6]
	lsls r0, 3
	adds r0, r4
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	cmp r2, r0
	bne _080B8994
	ldr r1, _080B89A0 @ =gContestEffects
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 1
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r5, 0x2]
	mov r2, r12
	ldrb r0, [r2, 0x11]
	movs r1, 0x1F
	bl sub_80B13EC
_080B8994:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B899C: .4byte gContestMoves
_080B89A0: .4byte gContestEffects
	thumb_func_end ContestEffect_35

	thumb_func_start ContestEffect_36
ContestEffect_36: @ 80B89A4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080B8A28 @ =0x020192d0
	ldrb r2, [r0, 0x11]
	adds r1, r2, r0
	ldrb r1, [r1]
	mov r8, r0
	cmp r1, 0
	beq _080B8A3C
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	mov r1, r8
	subs r1, 0x70
	adds r0, r1
	ldrh r0, [r0, 0x6]
	mov r9, r0
	movs r4, 0
	mov r6, r8
	ldr r0, _080B8A2C @ =gContestMoves
	mov r12, r0
	movs r7, 0
_080B89D4:
	ldrb r2, [r6, 0x11]
	adds r0, r2, r6
	ldrb r0, [r0]
	subs r0, 0x1
	adds r1, r4, r6
	ldrb r1, [r1]
	cmp r0, r1
	bne _080B8A34
	mov r1, r9
	lsls r0, r1, 3
	mov r1, r12
	adds r3, r0, r1
	ldrb r1, [r3, 0x1]
	lsls r1, 29
	mov r5, r8
	subs r5, 0x70
	adds r0, r7, r5
	ldrh r0, [r0, 0x6]
	lsls r0, 3
	add r0, r12
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	cmp r1, r0
	beq _080B8A34
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r5
	ldr r2, _080B8A30 @ =gContestEffects
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	lsls r0, 1
	ldrh r2, [r1, 0x2]
	adds r0, r2
	strh r0, [r1, 0x2]
	ldrb r0, [r6, 0x11]
	movs r1, 0x20
	bl sub_80B13EC
	b _080B8A3C
	.align 2, 0
_080B8A28: .4byte 0x020192d0
_080B8A2C: .4byte gContestMoves
_080B8A30: .4byte gContestEffects
_080B8A34:
	adds r7, 0x1C
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B89D4
_080B8A3C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_36

	thumb_func_start ContestEffect_37
ContestEffect_37: @ 80B8A48
	push {r4-r7,lr}
	ldr r1, _080B8A94 @ =0x020192d0
	ldrb r0, [r1, 0x11]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B8AB0
	movs r5, 0
	adds r4, r1, 0
	adds r6, r4, 0
	subs r6, 0x70
	adds r7, r6, 0
_080B8A60:
	ldrb r2, [r4, 0x11]
	adds r0, r2, r4
	ldrb r0, [r0]
	subs r0, 0x1
	adds r1, r5, r4
	ldrb r1, [r1]
	cmp r0, r1
	bne _080B8AA8
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r2, r0, r7
	movs r0, 0x2
	ldrsh r1, [r2, r0]
	movs r3, 0x2
	ldrsh r0, [r6, r3]
	cmp r1, r0
	ble _080B8A98
	adds r0, r1, 0
	lsls r0, 1
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x21
	bl sub_80B13EC
	b _080B8AA8
	.align 2, 0
_080B8A94: .4byte 0x020192d0
_080B8A98:
	cmp r1, r0
	bge _080B8AA8
	movs r0, 0
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x22
	bl sub_80B13EC
_080B8AA8:
	adds r6, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B8A60
_080B8AB0:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_37

	thumb_func_start ContestEffect_38
ContestEffect_38: @ 80B8AB8
	push {r4,r5,lr}
	ldr r4, _080B8AFC @ =0x020192d0
	ldrb r2, [r4, 0x11]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r5, r4, 0
	subs r5, 0x70
	adds r1, r0, r5
	ldrb r3, [r1, 0xD]
	movs r0, 0xD
	ldrsb r0, [r1, r0]
	cmp r0, 0x1D
	bgt _080B8B00
	adds r0, r3, 0
	adds r0, 0xA
	strb r0, [r1, 0xD]
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r2, [r0, 0x10]
	movs r1, 0x31
	negs r1, r1
	ands r1, r2
	movs r2, 0x10
	orrs r1, r2
	strb r1, [r0, 0x10]
	ldrb r0, [r4, 0x11]
	movs r1, 0x23
	bl sub_80B13EC
	b _080B8B08
	.align 2, 0
_080B8AFC: .4byte 0x020192d0
_080B8B00:
	adds r0, r2, 0
	movs r1, 0x3A
	bl sub_80B13EC
_080B8B08:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_38

	thumb_func_start ContestEffect_39
ContestEffect_39: @ 80B8B10
	push {r4,lr}
	ldr r3, _080B8B48 @ =0x020192d0
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r4, r3, 0
	subs r4, 0x70
	adds r0, r4
	ldrb r1, [r0, 0x11]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x11]
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0xD]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080B8B4C
	adds r0, r1, 0
	movs r1, 0x24
	bl sub_80B13EC
	b _080B8B54
	.align 2, 0
_080B8B48: .4byte 0x020192d0
_080B8B4C:
	adds r0, r1, 0
	movs r1, 0x3B
	bl sub_80B13EC
_080B8B54:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_39

	thumb_func_start ContestEffect_40
ContestEffect_40: @ 80B8B5C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r1, _080B8BE4 @ =0x02019204
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	bne _080B8B6E
	b _080B8C76
_080B8B6E:
	movs r6, 0
	adds r7, r1, 0
	adds r7, 0xCC
	adds r3, r1, 0
	adds r3, 0x5C
_080B8B78:
	lsls r1, r6, 24
	asrs r1, 24
	mov r0, sp
	adds r2, r0, r1
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x19]
	strb r0, [r2]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8B78
	ldrb r0, [r7, 0x11]
	mov r2, sp
	adds r1, r2, r0
	movs r0, 0xFF
	strb r0, [r1]
	movs r6, 0
	mov r12, r7
	movs r4, 0x70
	negs r4, r4
	adds r4, r7
	mov r8, r4
_080B8BAE:
	movs r5, 0
_080B8BB0:
	lsls r0, r5, 24
	asrs r2, r0, 24
	mov r0, r12
	ldrb r0, [r0, 0x11]
	cmp r2, r0
	beq _080B8BE8
	lsls r0, r6, 24
	asrs r3, r0, 24
	mov r1, sp
	adds r4, r1, r2
	ldrb r0, [r4]
	cmp r3, r0
	bne _080B8BE8
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	add r1, r8
	lsls r0, r3, 24
	lsrs r0, 24
	ldrb r1, [r1, 0x19]
	cmp r0, r1
	bne _080B8BE8
	adds r0, r3, 0x1
	strb r0, [r4]
	b _080B8BF8
	.align 2, 0
_080B8BE4: .4byte 0x02019204
_080B8BE8:
	lsls r0, r5, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r5, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8BB0
_080B8BF8:
	cmp r5, 0x4
	beq _080B8C0C
	lsls r0, r6, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r6, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8BAE
_080B8C0C:
	ldrb r0, [r7, 0x11]
	mov r4, sp
	adds r1, r4, r0
	movs r0, 0
	strb r0, [r1]
	ldrb r0, [r7, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r3, r7, 0
	subs r3, 0x70
	adds r1, r3
	ldrb r2, [r1, 0x10]
	movs r0, 0x3F
	ands r0, r2
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r1, 0x10]
	movs r6, 0
_080B8C32:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	mov r4, sp
	adds r2, r4, r1
	ldrb r2, [r2]
	strb r2, [r0, 0x19]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8C32
	ldrb r0, [r7, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r7, 0
	subs r0, 0x70
	adds r1, r0
	ldrb r2, [r1, 0x11]
	movs r0, 0x4
	negs r0, r0
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1, 0x11]
	ldrb r0, [r7, 0x11]
	movs r1, 0x25
	bl sub_80B13EC
_080B8C76:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_40

	thumb_func_start ContestEffect_41
ContestEffect_41: @ 80B8C84
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r1, _080B8D14 @ =0x02019204
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	bne _080B8C98
	b _080B8DA6
_080B8C98:
	movs r6, 0
	adds r7, r1, 0
	adds r7, 0xCC
	adds r3, r1, 0
	adds r3, 0x5C
_080B8CA2:
	lsls r1, r6, 24
	asrs r1, 24
	mov r0, sp
	adds r2, r0, r1
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x19]
	strb r0, [r2]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8CA2
	ldrb r0, [r7, 0x11]
	mov r2, sp
	adds r1, r2, r0
	movs r0, 0xFF
	strb r0, [r1]
	movs r6, 0x3
	mov r12, r7
	movs r4, 0x70
	negs r4, r4
	adds r4, r7
	mov r8, r4
	movs r0, 0x1
	negs r0, r0
	mov r9, r0
_080B8CDE:
	movs r5, 0
_080B8CE0:
	lsls r0, r5, 24
	asrs r2, r0, 24
	mov r1, r12
	ldrb r1, [r1, 0x11]
	cmp r2, r1
	beq _080B8D18
	lsls r0, r6, 24
	asrs r3, r0, 24
	mov r0, sp
	adds r4, r0, r2
	ldrb r1, [r4]
	cmp r3, r1
	bne _080B8D18
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	add r1, r8
	lsls r0, r3, 24
	lsrs r0, 24
	ldrb r1, [r1, 0x19]
	cmp r0, r1
	bne _080B8D18
	subs r0, r3, 0x1
	strb r0, [r4]
	b _080B8D28
	.align 2, 0
_080B8D14: .4byte 0x02019204
_080B8D18:
	lsls r0, r5, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r5, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8CE0
_080B8D28:
	cmp r5, 0x4
	beq _080B8D3C
	lsls r0, r6, 24
	movs r4, 0xFF
	lsls r4, 24
	adds r0, r4
	lsrs r6, r0, 24
	asrs r0, 24
	cmp r0, r9
	bgt _080B8CDE
_080B8D3C:
	ldrb r0, [r7, 0x11]
	mov r2, sp
	adds r1, r2, r0
	movs r0, 0x3
	strb r0, [r1]
	ldrb r0, [r7, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r3, r7, 0
	subs r3, 0x70
	adds r1, r3
	ldrb r2, [r1, 0x10]
	movs r0, 0x3F
	ands r0, r2
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r1, 0x10]
	movs r6, 0
_080B8D62:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	mov r4, sp
	adds r2, r4, r1
	ldrb r2, [r2]
	strb r2, [r0, 0x19]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8D62
	ldrb r0, [r7, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r7, 0
	subs r0, 0x70
	adds r1, r0
	ldrb r2, [r1, 0x11]
	movs r0, 0x4
	negs r0, r0
	ands r0, r2
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1, 0x11]
	ldrb r0, [r7, 0x11]
	movs r1, 0x26
	bl sub_80B13EC
_080B8DA6:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_41

	thumb_func_start ContestEffect_42
ContestEffect_42: @ 80B8DB4
	bx lr
	thumb_func_end ContestEffect_42

	thumb_func_start ContestEffect_43
ContestEffect_43: @ 80B8DB8
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r1, _080B8E30 @ =0x02019204
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	beq _080B8EAE
	movs r6, 0
	add r3, sp, 0x4
	adds r5, r1, 0
	adds r5, 0x5C
	adds r4, r3, 0
_080B8DCE:
	lsls r1, r6, 24
	asrs r1, 24
	mov r0, sp
	adds r2, r0, r1
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x19]
	strb r0, [r2]
	adds r0, r4, r1
	strb r6, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8DCE
	movs r6, 0
	adds r7, r3, 0
_080B8DF6:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	lsls r2, r6, 24
	asrs r2, 24
	movs r1, 0x4
	subs r1, r2
	bl __modsi3
	lsls r0, 24
	lsrs r4, r0, 24
	movs r1, 0
_080B8E10:
	lsls r0, r1, 24
	asrs r2, r0, 24
	adds r3, r7, r2
	ldrb r1, [r3]
	adds r5, r0, 0
	cmp r1, 0xFF
	beq _080B8E3A
	cmp r4, 0
	bne _080B8E34
	mov r1, sp
	adds r0, r1, r2
	strb r6, [r0]
	movs r0, 0xFF
	strb r0, [r3]
	b _080B8E48
	.align 2, 0
_080B8E30: .4byte 0x02019204
_080B8E34:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080B8E3A:
	movs r3, 0x80
	lsls r3, 17
	adds r0, r5, r3
	lsrs r1, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8E10
_080B8E48:
	lsls r0, r6, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r6, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8DF6
	movs r6, 0
	ldr r4, _080B8EB8 @ =0x020192d0
	adds r7, r4, 0
	subs r7, 0x70
	movs r3, 0x3F
	mov r12, r3
	movs r5, 0x80
_080B8E66:
	lsls r2, r6, 24
	asrs r2, 24
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r7
	mov r3, sp
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x19]
	ldrb r3, [r1, 0x10]
	mov r0, r12
	ands r0, r3
	orrs r0, r5
	strb r0, [r1, 0x10]
	adds r2, 0x1
	lsls r2, 24
	lsrs r6, r2, 24
	asrs r2, 24
	cmp r2, 0x3
	ble _080B8E66
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x11]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x11]
	ldrb r0, [r4, 0x11]
	movs r1, 0x27
	bl sub_80B13EC
_080B8EAE:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8EB8: .4byte 0x020192d0
	thumb_func_end ContestEffect_43

	thumb_func_start ContestEffect_44
ContestEffect_44: @ 80B8EBC
	push {lr}
	ldr r3, _080B8EF0 @ =gContestMoves
	ldr r1, _080B8EF4 @ =0x020192d0
	ldrb r2, [r1, 0x11]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	subs r1, 0x70
	adds r2, r0, r1
	ldrh r0, [r2, 0x6]
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	ldr r1, _080B8EF8 @ =gUnknown_0203869C
	lsrs r0, 29
	ldrh r1, [r1]
	cmp r0, r1
	beq _080B8EEA
	ldrb r0, [r2, 0x11]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r2, 0x11]
_080B8EEA:
	pop {r0}
	bx r0
	.align 2, 0
_080B8EF0: .4byte gContestMoves
_080B8EF4: .4byte 0x020192d0
_080B8EF8: .4byte gUnknown_0203869C
	thumb_func_end ContestEffect_44

	thumb_func_start ContestEffect_45
ContestEffect_45: @ 80B8EFC
	push {r4-r7,lr}
	movs r7, 0
	movs r5, 0
	ldr r4, _080B8F34 @ =0x020192d0
	movs r6, 0
_080B8F06:
	ldrb r0, [r4, 0x11]
	adds r0, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B8F52
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r6, r0
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	cmp r0, 0
	ble _080B8F38
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x4]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	bl sub_80B9268
	b _080B8F3A
	.align 2, 0
_080B8F34: .4byte 0x020192d0
_080B8F38:
	movs r0, 0xA
_080B8F3A:
	strh r0, [r4, 0x4]
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B8F52
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080B8F52:
	adds r6, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B8F06
	cmp r7, 0
	bne _080B8F68
	ldr r0, _080B8F78 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B8F68:
	ldr r0, _080B8F78 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8F78: .4byte 0x020192d0
	thumb_func_end ContestEffect_45

	thumb_func_start ContestEffect_46
ContestEffect_46: @ 80B8F7C
	push {r4,lr}
	ldr r0, _080B8F98 @ =0x02019204
	movs r1, 0x13
	ldrsb r1, [r0, r1]
	cmp r1, 0
	bne _080B8F9C
	movs r4, 0xA
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1A
	bl sub_80B13EC
	b _080B8FDE
	.align 2, 0
_080B8F98: .4byte 0x02019204
_080B8F9C:
	cmp r1, 0x1
	bne _080B8FAE
	movs r4, 0x14
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1B
	bl sub_80B13EC
	b _080B8FDE
_080B8FAE:
	cmp r1, 0x2
	bne _080B8FC0
	movs r4, 0x1E
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1C
	bl sub_80B13EC
	b _080B8FDE
_080B8FC0:
	cmp r1, 0x3
	bne _080B8FD2
	movs r4, 0x32
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1D
	bl sub_80B13EC
	b _080B8FDE
_080B8FD2:
	movs r4, 0x3C
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1E
	bl sub_80B13EC
_080B8FDE:
	ldr r0, _080B8FF4 @ =0x020192d0
	ldrb r2, [r0, 0x11]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	subs r0, 0x70
	adds r1, r0
	strh r4, [r1, 0x2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8FF4: .4byte 0x020192d0
	thumb_func_end ContestEffect_46

	thumb_func_start ContestEffect_47
ContestEffect_47: @ 80B8FF8
	push {lr}
	ldr r3, _080B9034 @ =0x02019328
	ldrb r2, [r3, 0x1]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _080B902E
	movs r0, 0x1
	orrs r2, r0
	movs r0, 0x58
	negs r0, r0
	adds r0, r3
	mov r12, r0
	ldrb r1, [r0, 0x11]
	movs r0, 0x7
	ands r0, r1
	lsls r0, 1
	movs r1, 0xF
	negs r1, r1
	ands r2, r1
	orrs r2, r0
	strb r2, [r3, 0x1]
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x3D
	bl sub_80B13EC
_080B902E:
	pop {r0}
	bx r0
	.align 2, 0
_080B9034: .4byte 0x02019328
	thumb_func_end ContestEffect_47

	thumb_func_start sub_80B9038
sub_80B9038: @ 80B9038
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r7, 0
	movs r5, 0
	ldr r4, _080B907C @ =0x020192d0
	ldr r0, _080B9080 @ =gContestMoves
	mov r9, r0
	movs r6, 0
_080B9052:
	ldrb r0, [r4, 0x11]
	adds r0, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B909A
	adds r0, r4, 0
	subs r0, 0x70
	adds r0, r6, r0
	ldrh r0, [r0, 0x6]
	lsls r0, 3
	add r0, r9
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 29
	cmp r8, r0
	bne _080B9084
	movs r0, 0x28
	b _080B9086
	.align 2, 0
_080B907C: .4byte 0x020192d0
_080B9080: .4byte gContestMoves
_080B9084:
	movs r0, 0xA
_080B9086:
	strh r0, [r4, 0x4]
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B909A
	adds r7, 0x1
_080B909A:
	adds r6, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B9052
	cmp r7, 0
	bne _080B90B0
	ldr r0, _080B90BC @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B90B0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B90BC: .4byte 0x020192d0
	thumb_func_end sub_80B9038

	thumb_func_start sub_80B90C0
sub_80B90C0: @ 80B90C0
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080B90EC @ =0x020192d0
	adds r0, r2, 0
	adds r0, 0xD
	adds r0, r3, r0
	movs r1, 0x1
	strb r1, [r0]
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	subs r2, 0x70
	adds r2, r0, r2
	ldrb r1, [r2, 0x10]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B90F0
	adds r0, r3, 0
	movs r1, 0x2D
	b _080B9116
	.align 2, 0
_080B90EC: .4byte 0x020192d0
_080B90F0:
	ldrb r0, [r2, 0x12]
	cmp r0, 0
	bne _080B910E
	ldrb r1, [r2, 0xB]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B911A
	ldrb r1, [r2, 0xC]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	bne _080B911A
	movs r0, 0x1
	b _080B911C
_080B910E:
	subs r0, 0x1
	strb r0, [r2, 0x12]
	adds r0, r3, 0
	movs r1, 0x2C
_080B9116:
	bl sub_80B13EC
_080B911A:
	movs r0, 0
_080B911C:
	pop {r1}
	bx r1
	thumb_func_end sub_80B90C0

	thumb_func_start sub_80B9120
sub_80B9120: @ 80B9120
	push {r4-r7,lr}
	sub sp, 0xC
	mov r0, sp
	movs r1, 0
	movs r2, 0x8
	bl memset
	movs r7, 0
	ldr r1, _080B918C @ =0x020192d0
	ldrb r0, [r1, 0x8]
	cmp r0, 0xFF
	beq _080B91D8
	adds r5, r1, 0
_080B913A:
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r7, r0
	ldrb r4, [r0]
	adds r6, r4, 0
	adds r0, r4, 0
	str r1, [sp, 0x8]
	bl sub_80B90C0
	lsls r0, 24
	ldr r1, [sp, 0x8]
	cmp r0, 0
	beq _080B91C8
	ldrh r0, [r1, 0x4]
	strh r0, [r1, 0x6]
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	subs r1, 0x70
	adds r2, r0, r1
	ldrb r1, [r2, 0x10]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B9174
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	lsls r0, 1
	strh r0, [r5, 0x6]
_080B9174:
	ldrb r0, [r2, 0x10]
	movs r3, 0x1
	ands r3, r0
	cmp r3, 0
	beq _080B9190
	movs r0, 0xA
	strh r0, [r5, 0x6]
	adds r0, r4, 0
	movs r1, 0x2F
	bl sub_80B13EC
	b _080B91C8
	.align 2, 0
_080B918C: .4byte 0x020192d0
_080B9190:
	ldrb r1, [r2, 0xF]
	ldrh r0, [r5, 0x6]
	subs r0, r1
	adds r1, r0, 0
	strh r0, [r5, 0x6]
	lsls r0, 16
	cmp r0, 0
	bgt _080B91AC
	strh r3, [r5, 0x6]
	adds r0, r4, 0
	movs r1, 0x2E
	bl sub_80B13EC
	b _080B91C8
_080B91AC:
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_80B9200
	ldrb r1, [r5, 0x6]
	adds r0, r6, 0
	bl sub_80B141C
	lsls r0, r6, 1
	mov r2, sp
	adds r1, r2, r0
	ldrh r0, [r5, 0x6]
	strh r0, [r1]
_080B91C8:
	adds r7, 0x1
	ldr r1, _080B91E8 @ =0x020192d0
	adds r0, r1, 0
	adds r0, 0x8
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080B913A
_080B91D8:
	movs r7, 0
	mov r1, sp
_080B91DC:
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080B91EC
	movs r0, 0x1
	b _080B91F6
	.align 2, 0
_080B91E8: .4byte 0x020192d0
_080B91EC:
	adds r1, 0x2
	adds r7, 0x1
	cmp r7, 0x3
	ble _080B91DC
	movs r0, 0
_080B91F6:
	add sp, 0xC
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B9120

	thumb_func_start sub_80B9200
sub_80B9200: @ 80B9200
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	ldr r0, _080B9220 @ =0x02019260
	adds r2, r0
	ldrh r0, [r2, 0x2]
	subs r0, r1
	strh r0, [r2, 0x2]
	ldrb r0, [r2, 0xE]
	adds r1, r0
	strb r1, [r2, 0xE]
	bx lr
	.align 2, 0
_080B9220: .4byte 0x02019260
	thumb_func_end sub_80B9200

	thumb_func_start sub_80B9224
sub_80B9224: @ 80B9224
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	cmp r4, 0
	bge _080B9234
	negs r0, r4
_080B9234:
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r4, 0
	bge _080B9252
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	beq _080B925C
	adds r0, r4, 0
	subs r0, 0xA
	adds r0, r1, r0
	b _080B9258
_080B9252:
	lsls r0, 16
	asrs r0, 16
	subs r0, r4, r0
_080B9258:
	lsls r0, 16
	lsrs r5, r0, 16
_080B925C:
	lsls r0, r5, 16
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B9224

	thumb_func_start sub_80B9268
sub_80B9268: @ 80B9268
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	cmp r4, 0
	bge _080B9278
	negs r0, r4
_080B9278:
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	beq _080B9290
	adds r0, r4, 0
	adds r0, 0xA
	subs r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
_080B9290:
	lsls r0, r5, 16
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B9268

	thumb_func_start sub_80B929C
sub_80B929C: @ 80B929C
	push {lr}
	ldr r0, _080B92A8 @ =sub_80B9484
	bl sub_8083A84
	pop {r0}
	bx r0
	.align 2, 0
_080B92A8: .4byte sub_80B9484
	thumb_func_end sub_80B929C

	thumb_func_start sub_80B92AC
sub_80B92AC: @ 80B92AC
	push {r4-r6,lr}
	bl sub_80BC300
	bl sub_80C045C
	ldr r6, _080B9364 @ =0x02018000
	ldr r0, _080B9368 @ =gUnknown_083D026C
	ldr r1, [r0]
	movs r2, 0xC8
	lsls r2, 4
	adds r0, r6, 0
	bl memcpy
	movs r1, 0xC8
	lsls r1, 4
	adds r0, r6, r1
	ldr r1, _080B936C @ =gUnknown_083D0270
	ldr r1, [r1]
	movs r2, 0xE1
	lsls r2, 2
	bl memcpy
	ldr r2, _080B9370 @ =0x00001004
	adds r0, r6, r2
	ldr r1, _080B9374 @ =gUnknown_083D0274
	ldr r1, [r1]
	movs r2, 0x40
	bl memcpy
	ldr r1, _080B9378 @ =0x00001044
	adds r0, r6, r1
	ldr r1, _080B937C @ =gUnknown_083D0278
	ldr r1, [r1]
	movs r2, 0x40
	bl memcpy
	ldr r2, _080B9380 @ =0x00001084
	adds r0, r6, r2
	ldr r1, _080B9384 @ =gUnknown_083D027C
	ldr r1, [r1]
	movs r2, 0x28
	bl memcpy
	ldr r5, _080B9388 @ =gUnknown_02038738
	ldr r4, _080B938C @ =gSaveBlock1
	ldr r0, _080B9390 @ =0x0000303c
	adds r1, r4, r0
	adds r0, r5, 0
	movs r2, 0x38
	bl memcpy
	ldr r2, _080B9394 @ =0x00003074
	adds r1, r4, r2
	adds r0, r5, 0
	adds r0, 0x38
	movs r2, 0x38
	bl memcpy
	ldr r0, _080B9398 @ =0x00002f9c
	adds r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8041324
	ldr r1, _080B939C @ =0x000010ac
	adds r0, r6, r1
	ldr r1, _080B93A0 @ =gUnknown_083D0280
	ldr r1, [r1]
	movs r2, 0x78
	bl memcpy
	ldr r2, _080B93A4 @ =0x00001124
	adds r0, r6, r2
	ldr r1, _080B93A8 @ =gUnknown_083D0284
	ldr r1, [r1]
	movs r2, 0xA4
	bl memcpy
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080B935C
	bl sub_8126338
	ldr r2, _080B93AC @ =0x000011c8
	adds r1, r6, r2
	strh r0, [r1]
_080B935C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9364: .4byte 0x02018000
_080B9368: .4byte gUnknown_083D026C
_080B936C: .4byte gUnknown_083D0270
_080B9370: .4byte 0x00001004
_080B9374: .4byte gUnknown_083D0274
_080B9378: .4byte 0x00001044
_080B937C: .4byte gUnknown_083D0278
_080B9380: .4byte 0x00001084
_080B9384: .4byte gUnknown_083D027C
_080B9388: .4byte gUnknown_02038738
_080B938C: .4byte gSaveBlock1
_080B9390: .4byte 0x0000303c
_080B9394: .4byte 0x00003074
_080B9398: .4byte 0x00002f9c
_080B939C: .4byte 0x000010ac
_080B93A0: .4byte gUnknown_083D0280
_080B93A4: .4byte 0x00001124
_080B93A8: .4byte gUnknown_083D0284
_080B93AC: .4byte 0x000011c8
	thumb_func_end sub_80B92AC

	thumb_func_start sub_80B93B0
sub_80B93B0: @ 80B93B0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	ldr r5, _080B9430 @ =0x02008000
	ldr r6, _080B9434 @ =0x00001230
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80BD674
	movs r0, 0xC8
	lsls r0, 4
	adds r0, r5
	mov r8, r0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80BFD44
	ldr r1, _080B9438 @ =0x00001004
	adds r0, r5, r1
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80C0514
	ldr r1, _080B943C @ =0x00001044
	adds r0, r5, r1
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80B9B1C
	ldr r1, _080B9440 @ =0x00001084
	adds r0, r5, r1
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80FA4E4
	ldr r1, _080B9444 @ =0x000010ac
	adds r0, r5, r1
	adds r1, r6, 0
	adds r2, r4, 0
	mov r3, r8
	bl sub_80B9C6C
	ldr r1, _080B9448 @ =0x00001124
	adds r0, r5, r1
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_80B9B70
	ldr r0, _080B944C @ =0x000011c8
	adds r5, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80B9F3C
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9430: .4byte 0x02008000
_080B9434: .4byte 0x00001230
_080B9438: .4byte 0x00001004
_080B943C: .4byte 0x00001044
_080B9440: .4byte 0x00001084
_080B9444: .4byte 0x000010ac
_080B9448: .4byte 0x00001124
_080B944C: .4byte 0x000011c8
	thumb_func_end sub_80B93B0

	thumb_func_start sub_80B9450
sub_80B9450: @ 80B9450
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B9480 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	bne _080B9478
	movs r0, 0xE2
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x8]
_080B9478:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9480: .4byte gTasks
	thumb_func_end sub_80B9450

	thumb_func_start sub_80B9484
sub_80B9484: @ 80B9484
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B94A8 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080B949E
	b _080B95E6
_080B949E:
	lsls r0, 2
	ldr r1, _080B94AC @ =_080B94B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B94A8: .4byte gTasks + 0x8
_080B94AC: .4byte _080B94B0
	.align 2, 0
_080B94B0:
	.4byte _080B94C8
	.4byte _080B951C
	.4byte _080B9550
	.4byte _080B9570
	.4byte _080B95AC
	.4byte _080B95C0
_080B94C8:
	ldr r0, _080B950C @ =gUnknown_0202E8CE
	ldrb r0, [r0]
	bl sub_8007270
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x1
	bl VarSet
	ldr r1, _080B9510 @ =gUnknown_03000718
	movs r0, 0
	strb r0, [r1]
	bl sub_80B92AC
	bl sub_80C71D8
	movs r0, 0x1
	strh r0, [r4]
	ldr r0, _080B9514 @ =sub_80B95F0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	ldr r0, _080B9518 @ =sub_80B9450
	movs r1, 0x51
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	b _080B95E6
	.align 2, 0
_080B950C: .4byte gUnknown_0202E8CE
_080B9510: .4byte gUnknown_03000718
_080B9514: .4byte sub_80B95F0
_080B9518: .4byte sub_80B9450
_080B951C:
	ldr r2, _080B9548 @ =gTasks
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	bne _080B95E6
	movs r0, 0x2
	strh r0, [r4]
	ldr r0, _080B954C @ =0x00000834
	bl FlagSet
	bl sub_80C7240
	ldrb r0, [r4, 0x1E]
	bl DestroyTask
	b _080B95E6
	.align 2, 0
_080B9548: .4byte gTasks
_080B954C: .4byte 0x00000834
_080B9550:
	ldr r0, _080B956C @ =sub_80BA00C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	movs r0, 0x3
	strh r0, [r4]
	movs r0, 0xE0
	bl PlaySE
	b _080B95E6
	.align 2, 0
_080B956C: .4byte sub_80BA00C
_080B9570:
	ldr r2, _080B95A4 @ =gTasks
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r5, [r0, 0x4]
	cmp r5, 0
	bne _080B95E6
	movs r0, 0x4
	strh r0, [r4]
	bl sub_8083664
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	bl sub_80720B0
	ldr r0, _080B95A8 @ =gOtherText_MixingComplete
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	strh r5, [r4, 0x10]
	b _080B95E6
	.align 2, 0
_080B95A4: .4byte gTasks
_080B95A8: .4byte gOtherText_MixingComplete
_080B95AC:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080B95E6
	movs r0, 0x5
	strh r0, [r4]
	b _080B95E6
_080B95C0:
	ldr r2, _080B95EC @ =gTasks
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	bne _080B95E6
	bl sub_8055588
	bl MenuZeroFillScreen
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080B95E6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B95EC: .4byte gTasks
	thumb_func_end sub_80B9484

	thumb_func_start sub_80B95F0
sub_80B95F0: @ 80B95F0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r7, _080B961C @ =gTasks
	adds r5, r0, r7
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0x64
	beq _080B9678
	cmp r1, 0x64
	bgt _080B962E
	cmp r1, 0x1
	bne _080B9612
	b _080B9734
_080B9612:
	cmp r1, 0x1
	bgt _080B9620
	cmp r1, 0
	beq _080B9650
	b _080B97D6
	.align 2, 0
_080B961C: .4byte gTasks
_080B9620:
	cmp r1, 0x2
	bne _080B9626
	b _080B9760
_080B9626:
	cmp r1, 0x5
	bne _080B962C
	b _080B97C0
_080B962C:
	b _080B97D6
_080B962E:
	cmp r1, 0xC9
	beq _080B96D0
	cmp r1, 0xC9
	bgt _080B963C
	cmp r1, 0x65
	beq _080B9690
	b _080B97D6
_080B963C:
	ldr r0, _080B964C @ =0x0000012d
	cmp r1, r0
	beq _080B9706
	adds r0, 0x63
	cmp r1, r0
	beq _080B971C
	b _080B97D6
	.align 2, 0
_080B964C: .4byte 0x0000012d
_080B9650:
	bl sub_80B9A78
	bl MenuDisplayMessageBox
	ldr r0, _080B9674 @ =gOtherText_MixingRecordsWithFriend
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	movs r0, 0xE1
	lsls r0, 3
	strh r0, [r5, 0x18]
	movs r0, 0xC8
	lsls r0, 1
	strh r0, [r5, 0x8]
	bl ClearLinkCallback_2
	b _080B97D6
	.align 2, 0
_080B9674: .4byte gOtherText_MixingRecordsWithFriend
_080B9678:
	ldrh r0, [r5, 0x20]
	adds r0, 0x1
	strh r0, [r5, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bgt _080B9688
	b _080B97D6
_080B9688:
	movs r0, 0
	strh r0, [r5, 0x20]
	movs r0, 0x65
	b _080B97D4
_080B9690:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsLinkMaster
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B96C2
	bl sub_800820C
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _080B96B2
	b _080B97D6
_080B96B2:
	movs r0, 0x15
	bl PlaySE
	movs r1, 0
	movs r0, 0xC9
	strh r0, [r5, 0x8]
	strh r1, [r5, 0x20]
	b _080B97D6
_080B96C2:
	movs r0, 0x16
	bl PlaySE
	ldr r0, _080B96CC @ =0x0000012d
	b _080B97D4
	.align 2, 0
_080B96CC: .4byte 0x0000012d
_080B96D0:
	bl sub_800820C
	adds r4, r0, 0
	bl GetLinkPlayerCount_2
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080B97D6
	ldrh r4, [r5, 0x20]
	adds r4, 0x1
	strh r4, [r5, 0x20]
	lsls r4, 16
	asrs r4, 16
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	cmp r4, r1
	ble _080B97D6
	bl sub_8007F4C
	movs r0, 0x1
	b _080B97D4
_080B9706:
	bl sub_800820C
	adds r4, r0, 0
	bl GetLinkPlayerCount_2
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080B97D6
	movs r0, 0x1
	b _080B97D4
_080B971C:
	ldrh r0, [r5, 0x20]
	adds r0, 0x1
	strh r0, [r5, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080B97D6
	movs r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	strh r0, [r5, 0x20]
	b _080B97D6
_080B9734:
	ldr r0, _080B9758 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B97D6
	ldr r4, _080B975C @ =gStringVar1
	bl sub_80B9A58
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r0, 0x5
	b _080B97D4
	.align 2, 0
_080B9758: .4byte gReceivedRemoteLinkPlayers
_080B975C: .4byte gStringVar1
_080B9760:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	strh r0, [r5, 0x14]
	strh r1, [r5, 0x8]
	bl sub_80B9A58
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	ldr r0, _080B97B0 @ =sub_80B97DC
	str r0, [r5]
	ldr r4, _080B97B4 @ =0x02018000
	adds r1, r5, 0
	adds r1, 0xC
	adds r0, r4, 0
	bl sub_80B9A50
	ldr r0, _080B97B8 @ =sub_80B9890
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x1C]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r0, r1, r7
	strh r6, [r0, 0x8]
	ldr r0, _080B97BC @ =0xffff0000
	adds r4, r0
	adds r1, r7, r1
	adds r1, 0x12
	adds r0, r4, 0
	bl sub_80B9A50
	b _080B97D6
	.align 2, 0
_080B97B0: .4byte sub_80B97DC
_080B97B4: .4byte 0x02018000
_080B97B8: .4byte sub_80B9890
_080B97BC: .4byte 0xffff0000
_080B97C0:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080B97D6
	movs r0, 0
	strh r0, [r5, 0x1C]
	movs r0, 0x2
_080B97D4:
	strh r0, [r5, 0x8]
_080B97D6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B95F0

	thumb_func_start sub_80B97DC
sub_80B97DC: @ 80B97DC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B9800 @ =gTasks
	adds r4, r1, r0
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	adds r2, r0, 0
	cmp r1, 0x4
	bhi _080B9884
	lsls r0, r1, 2
	ldr r1, _080B9804 @ =_080B9808
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B9800: .4byte gTasks
_080B9804: .4byte _080B9808
	.align 2, 0
_080B9808:
	.4byte _080B981C
	.4byte _080B9840
	.4byte _080B9884
	.4byte _080B9852
	.4byte _080B986E
_080B981C:
	adds r0, r4, 0
	adds r0, 0xC
	bl sub_80B9A44
	adds r1, r0, 0
	movs r0, 0x10
	ldrsh r2, [r4, r0]
	movs r0, 0xC8
	muls r0, r2
	adds r1, r0
	ldr r0, _080B983C @ =gBlockSendBuffer
	movs r2, 0xC8
	bl memcpy
	b _080B9860
	.align 2, 0
_080B983C: .4byte gBlockSendBuffer
_080B9840:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080B9860
	movs r0, 0x1
	bl sub_8007E9C
	b _080B9860
_080B9852:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x18
	bne _080B9868
_080B9860:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B9884
_080B9868:
	movs r0, 0
	strh r0, [r4, 0x8]
	b _080B9884
_080B986E:
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	bne _080B9884
	ldr r0, _080B988C @ =sub_80B9A1C
	str r0, [r4]
_080B9884:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B988C: .4byte sub_80B9A1C
	thumb_func_end sub_80B97DC

	thumb_func_start sub_80B9890
sub_80B9890: @ 80B9890
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r0, 2
	ldr r1, [sp]
	adds r0, r1
	lsls r0, 3
	ldr r1, _080B98D0 @ =gTasks
	adds r0, r1
	mov r10, r0
	bl GetBlockRecievedStatus
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r2, 0
	str r2, [sp, 0x8]
	bl sub_8008198
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [sp, 0x4]
	cmp r3, r0
	bne _080B998A
	movs r0, 0
	b _080B9966
	.align 2, 0
_080B98D0: .4byte gTasks
_080B98D4:
	ldr r1, [sp, 0x4]
	mov r2, r9
	asrs r1, r2
	movs r0, 0x1
	ands r1, r0
	movs r3, 0x1
	add r3, r9
	mov r8, r3
	cmp r1, 0
	beq _080B9960
	mov r0, r10
	adds r0, 0x12
	bl sub_80B9A44
	mov r1, r8
	lsls r4, r1, 1
	mov r5, r10
	adds r5, 0x8
	adds r4, r5, r4
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0xC8
	muls r1, r3
	adds r0, r1
	ldr r7, _080B9930 @ =0x00001230
	mov r1, r9
	muls r1, r7
	adds r6, r0, r1
	mov r0, r9
	str r3, [sp, 0xC]
	bl sub_80B9A68
	adds r1, r0, 0
	movs r0, 0
	ldrsh r2, [r4, r0]
	adds r0, r2, 0x1
	ldr r3, [sp, 0xC]
	muls r0, r3
	cmp r0, r7
	bls _080B9934
	muls r2, r3
	subs r2, r7, r2
	adds r0, r6, 0
	bl memcpy
	b _080B993C
	.align 2, 0
_080B9930: .4byte 0x00001230
_080B9934:
	adds r0, r6, 0
	movs r2, 0xC8
	bl memcpy
_080B993C:
	mov r0, r9
	bl ResetBlockReceivedFlag
	mov r2, r8
	lsls r1, r2, 1
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x18
	bne _080B9960
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
_080B9960:
	mov r3, r8
	lsls r0, r3, 24
	lsrs r0, 24
_080B9966:
	mov r9, r0
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r9, r0
	bcc _080B98D4
	ldr r2, _080B99B0 @ =gTasks
	mov r0, r10
	movs r3, 0x8
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
_080B998A:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp, 0x8]
	cmp r1, r0
	bne _080B999E
	ldr r0, [sp]
	bl DestroyTask
_080B999E:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B99B0: .4byte gTasks
	thumb_func_end sub_80B9890

	thumb_func_start sub_80B99B4
sub_80B99B4: @ 80B99B4
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r2, _080B99E4 @ =gTasks
	adds r0, r2
	movs r4, 0x1C
	ldrsh r1, [r0, r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	bne _080B99DC
	adds r0, r3, 0
	bl DestroyTask
_080B99DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B99E4: .4byte gTasks
	thumb_func_end sub_80B99B4

	thumb_func_start sub_80B99E8
sub_80B99E8: @ 80B99E8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B9A10 @ =gTasks
	adds r1, r0
	ldr r0, _080B9A14 @ =sub_80B99B4
	str r0, [r1]
	ldr r0, _080B9A18 @ =gUnknown_03000718
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9A0C
	movs r2, 0x12
	ldrsh r0, [r1, r2]
	bl sub_80B93B0
_080B9A0C:
	pop {r0}
	bx r0
	.align 2, 0
_080B9A10: .4byte gTasks
_080B9A14: .4byte sub_80B99B4
_080B9A18: .4byte gUnknown_03000718
	thumb_func_end sub_80B99E8

	thumb_func_start sub_80B9A1C
sub_80B9A1C: @ 80B9A1C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B9A38 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080B9A3C @ =sub_80B99E8
	str r0, [r1]
	ldr r1, _080B9A40 @ =gUnknown_03000718
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080B9A38: .4byte gTasks
_080B9A3C: .4byte sub_80B99E8
_080B9A40: .4byte gUnknown_03000718
	thumb_func_end sub_80B9A1C

	thumb_func_start sub_80B9A44
sub_80B9A44: @ 80B9A44
	adds r1, r0, 0
	ldrh r0, [r1]
	ldrh r1, [r1, 0x2]
	lsls r1, 16
	orrs r0, r1
	bx lr
	thumb_func_end sub_80B9A44

	thumb_func_start sub_80B9A50
sub_80B9A50: @ 80B9A50
	strh r0, [r1]
	lsrs r0, 16
	strh r0, [r1, 0x2]
	bx lr
	thumb_func_end sub_80B9A50

	thumb_func_start sub_80B9A58
sub_80B9A58: @ 80B9A58
	push {lr}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80B9A58

	thumb_func_start sub_80B9A68
sub_80B9A68: @ 80B9A68
	lsls r0, 24
	lsrs r0, 16
	ldr r1, _080B9A74 @ =gBlockRecvBuffer
	adds r0, r1
	bx lr
	.align 2, 0
_080B9A74: .4byte gBlockRecvBuffer
	thumb_func_end sub_80B9A68

	thumb_func_start sub_80B9A78
sub_80B9A78: @ 80B9A78
	ldr r1, _080B9A80 @ =gUnknown_03005D2C
	ldr r0, _080B9A84 @ =0x00001230
	str r0, [r1]
	bx lr
	.align 2, 0
_080B9A80: .4byte gUnknown_03005D2C
_080B9A84: .4byte 0x00001230
	thumb_func_end sub_80B9A78

	thumb_func_start sub_80B9A88
sub_80B9A88: @ 80B9A88
	push {r4,lr}
	adds r4, r0, 0
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080B9AC0
	cmp r0, 0x3
	bhi _080B9AA2
	cmp r0, 0x2
	beq _080B9AA8
	b _080B9B10
_080B9AA2:
	cmp r0, 0x4
	beq _080B9AEC
	b _080B9B10
_080B9AA8:
	movs r2, 0
	ldr r3, _080B9ABC @ =gUnknown_083D0288
_080B9AAC:
	adds r0, r4, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x1
	bls _080B9AAC
	b _080B9B10
	.align 2, 0
_080B9ABC: .4byte gUnknown_083D0288
_080B9AC0:
	movs r0, 0
	bl GetLinkPlayerTrainerId
	adds r3, r0, 0
	movs r0, 0x1
	ands r3, r0
	movs r2, 0
	ldr r1, _080B9AE8 @ =gUnknown_083D028A
	lsls r0, r3, 1
	adds r0, r3
	adds r3, r0, r1
_080B9AD6:
	adds r1, r4, r2
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2
	bls _080B9AD6
	b _080B9B10
	.align 2, 0
_080B9AE8: .4byte gUnknown_083D028A
_080B9AEC:
	movs r0, 0
	bl GetLinkPlayerTrainerId
	movs r1, 0x9
	bl __umodsi3
	adds r3, r0, 0
	movs r2, 0
	ldr r1, _080B9B18 @ =gUnknown_083D0290
	lsls r0, r3, 2
	adds r3, r0, r1
_080B9B02:
	adds r1, r4, r2
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x3
	bls _080B9B02
_080B9B10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9B18: .4byte gUnknown_083D0290
	thumb_func_end sub_80B9A88

	thumb_func_start sub_80B9B1C
sub_80B9B1C: @ 80B9B1C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r5, r0, 0
	mov r8, r1
	lsls r4, r2, 24
	lsrs r4, 24
	mov r0, sp
	bl sub_80B9A88
	mov r0, r8
	muls r0, r4
	adds r0, r5, r0
	ldr r1, _080B9B6C @ =gUnknown_083D0278
	ldr r6, [r1]
	adds r1, r6, 0
	movs r2, 0x40
	bl memcpy
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r5, r0
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x40
	bl memcpy
	bl sub_80F7F30
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9B6C: .4byte gUnknown_083D0278
	thumb_func_end sub_80B9B1C

	thumb_func_start sub_80B9B70
sub_80B9B70: @ 80B9B70
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r6, r0, 0
	mov r9, r1
	lsls r4, r2, 24
	lsrs r4, 24
	ldr r0, _080B9BB8 @ =gUnknown_0300071C
	mov r8, r0
	bl sub_80B9A88
	mov r5, r9
	muls r5, r4
	adds r5, r6, r5
	add r4, r8
	ldrb r0, [r4]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	adds r6, r0
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0xA4
	bl memcpy
	adds r0, r5, 0
	bl sub_8134AC0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9BB8: .4byte gUnknown_0300071C
	thumb_func_end sub_80B9B70

	thumb_func_start sub_80B9BBC
sub_80B9BBC: @ 80B9BBC
	ldrh r0, [r0, 0x20]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	thumb_func_end sub_80B9BBC

	thumb_func_start sub_80B9BC4
sub_80B9BC4: @ 80B9BC4
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x38
	mov r8, r0
	mov r10, r1
	mov r9, r2
	adds r4, r3, 0
	ldr r5, [sp, 0x54]
	lsls r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsrs r4, 23
	add r4, r9
	ldrb r0, [r4]
	mov r6, r10
	muls r6, r0
	add r6, r8
	ldrb r0, [r4, 0x1]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	adds r1, r6, r1
	mov r0, sp
	movs r2, 0x38
	bl memcpy
	lsls r5, 1
	add r5, r9
	ldrb r0, [r5]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r8, r0
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 3
	adds r6, r0
	ldrb r0, [r5, 0x1]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	add r1, r8
	adds r0, r6, 0
	movs r2, 0x38
	bl memcpy
	ldrb r1, [r5, 0x1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 3
	add r8, r0
	mov r0, r8
	mov r1, sp
	movs r2, 0x38
	bl memcpy
	add sp, 0x38
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B9BC4

	thumb_func_start sub_80B9C4C
sub_80B9C4C: @ 80B9C4C
	push {lr}
	adds r3, r0, 0
	movs r2, 0
	movs r1, 0
_080B9C54:
	adds r0, r3, r1
	ldrb r0, [r0]
	adds r0, r2, r0
	lsls r0, 24
	lsrs r2, r0, 24
	adds r1, 0x1
	cmp r1, 0xFF
	ble _080B9C54
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80B9C4C

	thumb_func_start sub_80B9C6C
sub_80B9C6C: @ 80B9C6C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x58
	str r0, [sp, 0x2C]
	str r1, [sp, 0x30]
	str r3, [sp, 0x38]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x34]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x40]
	ldr r0, _080B9DA8 @ =gLinkPlayers
	ldrh r0, [r0, 0x4]
	bl SeedRng
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r3, 0
	add r0, sp, 0x1C
	mov r9, r0
	movs r1, 0x1D
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0xC
	str r2, [sp, 0x4C]
	movs r7, 0xFF
	add r4, sp, 0x8
	movs r2, 0
	mov r6, r9
	mov r5, r10
_080B9CBC:
	mov r1, sp
	adds r1, r3
	adds r1, 0x4
	ldrb r0, [r1]
	orrs r0, r7
	strb r0, [r1]
	adds r0, r4, r3
	strb r2, [r0]
	lsls r1, r3, 1
	adds r0, r6, r1
	strb r2, [r0]
	adds r1, r5, r1
	strb r2, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080B9CBC
	movs r4, 0
	str r4, [sp, 0x3C]
	movs r3, 0
	mov r1, r8
	lsls r0, r1, 16
	lsrs r1, r0, 16
	str r0, [sp, 0x50]
	ldr r4, [sp, 0x30]
	ldr r0, [sp, 0x34]
	adds r2, r4, 0
	muls r2, r0
	str r2, [sp, 0x48]
	ldr r2, [sp, 0x3C]
	cmp r2, r1
	bcs _080B9D46
	mov r8, r1
_080B9D00:
	ldr r4, [sp, 0x30]
	adds r0, r4, 0
	muls r0, r3
	ldr r1, [sp, 0x2C]
	adds r6, r1, r0
	ldr r0, [r6, 0x70]
	cmp r0, 0
	beq _080B9D3C
	movs r7, 0
	cmp r7, r0
	bcs _080B9D3C
	adds r4, r6, 0
	adds r4, 0x74
	mov r2, r9
	lsls r1, r3, 1
	movs r5, 0x1
_080B9D20:
	lsls r0, r7, 1
	adds r0, r4, r0
	ldrh r0, [r0]
	cmp r0, 0
	bne _080B9D30
	adds r0, r7, r1
	adds r0, r2, r0
	strb r5, [r0]
_080B9D30:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, [r6, 0x70]
	cmp r7, r0
	bcc _080B9D20
_080B9D3C:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r8
	bcc _080B9D00
_080B9D46:
	movs r7, 0
	movs r3, 0
	ldr r2, [sp, 0x50]
	cmp r2, 0
	beq _080B9E3E
	mov r4, sp
	adds r4, 0x24
	str r4, [sp, 0x44]
	movs r0, 0x25
	add r0, sp
	mov r8, r0
_080B9D5C:
	ldr r1, [sp, 0x30]
	adds r0, r1, 0
	muls r0, r3
	ldr r2, [sp, 0x2C]
	adds r6, r2, r0
	lsls r1, r3, 1
	mov r4, r9
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080B9D7C
	mov r2, r10
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9D86
_080B9D7C:
	ldr r0, [sp, 0x3C]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x3C]
_080B9D86:
	mov r4, r9
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9DAC
	mov r2, r10
	adds r0, r2, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _080B9DAC
_080B9D9A:
	lsls r1, r7, 1
	ldr r4, [sp, 0x44]
	adds r0, r4, r1
	strb r3, [r0]
	add r1, r8
	strb r2, [r1]
	b _080B9E2C
	.align 2, 0
_080B9DA8: .4byte gLinkPlayers
_080B9DAC:
	mov r2, r9
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080B9DC0
	mov r4, r10
	adds r0, r4, r1
	ldrb r2, [r0]
	cmp r2, 0x1
	beq _080B9D9A
_080B9DC0:
	mov r2, r9
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9E32
	mov r4, r10
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9E32
	lsls r5, r7, 1
	ldr r1, [sp, 0x44]
	adds r0, r1, r5
	strb r3, [r0]
	adds r0, r6, 0
	str r3, [sp, 0x54]
	bl sub_80B9BBC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r0, 0x38
	bl sub_80B9BBC
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, [sp, 0x54]
	cmp r4, 0
	bne _080B9E0A
	cmp r1, 0
	beq _080B9E0E
	mov r2, r8
	adds r1, r2, r5
	movs r0, 0x1
	strb r0, [r1]
	b _080B9E2C
_080B9E0A:
	cmp r1, 0
	beq _080B9E26
_080B9E0E:
	str r3, [sp, 0x54]
	bl Random
	mov r4, r8
	adds r2, r4, r5
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	strb r0, [r2]
	ldr r3, [sp, 0x54]
	b _080B9E2C
_080B9E26:
	mov r2, r8
	adds r0, r2, r5
	strb r1, [r0]
_080B9E2C:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
_080B9E32:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r4, [sp, 0x50]
	cmp r0, r4
	bcc _080B9D5C
_080B9E3E:
	movs r3, 0
	ldr r1, [sp, 0x48]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 3
	ldr r2, [sp, 0x2C]
	adds r6, r2, r0
	ldr r1, [sp, 0x4C]
_080B9E4E:
	lsls r0, r3, 2
	adds r0, r1, r0
	str r6, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080B9E4E
	ldr r0, [sp, 0x38]
	bl sub_80B9C4C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r4, [sp, 0x3C]
	cmp r4, 0x3
	beq _080B9E9C
	cmp r4, 0x3
	bgt _080B9E82
	cmp r4, 0x2
	beq _080B9E8A
	b _080B9EF0
_080B9E82:
	ldr r0, [sp, 0x3C]
	cmp r0, 0x4
	beq _080B9EBC
	b _080B9EF0
_080B9E8A:
	add r2, sp, 0x24
	movs r0, 0x1
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	ldr r1, [sp, 0x30]
	movs r3, 0
	bl sub_80B9BC4
	b _080B9EF0
_080B9E9C:
	ldr r0, _080B9EB8 @ =gUnknown_083D02B4
	lsls r1, 1
	adds r2, r1, r0
	ldrb r3, [r2]
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	add r2, sp, 0x24
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	ldr r1, [sp, 0x30]
	bl sub_80B9BC4
	b _080B9EF0
	.align 2, 0
_080B9EB8: .4byte gUnknown_083D02B4
_080B9EBC:
	add r6, sp, 0x24
	ldr r4, _080B9F2C @ =gUnknown_083D02BA
	lsls r5, r1, 2
	adds r0, r5, r4
	ldrb r3, [r0]
	adds r0, r4, 0x1
	adds r0, r5, r0
	ldrb r0, [r0]
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	ldr r1, [sp, 0x30]
	adds r2, r6, 0
	bl sub_80B9BC4
	adds r0, r4, 0x2
	adds r0, r5, r0
	ldrb r3, [r0]
	adds r4, 0x3
	adds r5, r4
	ldrb r0, [r5]
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	ldr r1, [sp, 0x30]
	adds r2, r6, 0
	bl sub_80B9BC4
_080B9EF0:
	ldr r1, [sp, 0x2C]
	ldr r2, [sp, 0x48]
	adds r6, r1, r2
	ldr r4, _080B9F30 @ =gSaveBlock1
	ldr r1, _080B9F34 @ =0x0000303c
	adds r0, r4, r1
	adds r1, r6, 0
	movs r2, 0x38
	bl memcpy
	ldr r2, _080B9F38 @ =0x00003074
	adds r4, r2
	adds r1, r6, 0
	adds r1, 0x38
	adds r0, r4, 0
	movs r2, 0x38
	bl memcpy
	ldr r0, [sp, 0x40]
	bl SeedRng
	add sp, 0x58
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9F2C: .4byte gUnknown_083D02BA
_080B9F30: .4byte gSaveBlock1
_080B9F34: .4byte 0x0000303c
_080B9F38: .4byte 0x00003074
	thumb_func_end sub_80B9C6C

	thumb_func_start sub_80B9F3C
sub_80B9F3C: @ 80B9F3C
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	cmp r1, 0
	beq _080BA000
	ldrh r0, [r4]
	cmp r0, 0
	beq _080BA000
	bl sub_80A9670
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _080B9FC8
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80A92D4
	lsls r0, 24
	cmp r0, 0
	bne _080B9FB8
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80A9718
	lsls r0, 24
	cmp r0, 0
	bne _080B9FB8
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80A9424
	lsls r0, 24
	cmp r0, 0
	beq _080B9FB8
	ldr r0, _080B9FA4 @ =0x00004001
	ldrh r1, [r4]
	bl VarSet
	ldr r0, _080B9FA8 @ =gStringVar1
	ldr r1, _080B9FAC @ =gLinkPlayers + 0x8
	bl StringCopy
	ldrh r1, [r4]
	ldr r0, _080B9FB0 @ =0x00000113
	cmp r1, r0
	bne _080BA000
	ldr r0, _080B9FB4 @ =0x00000853
	bl FlagSet
	b _080BA000
	.align 2, 0
_080B9FA4: .4byte 0x00004001
_080B9FA8: .4byte gStringVar1
_080B9FAC: .4byte gLinkPlayers + 0x8
_080B9FB0: .4byte 0x00000113
_080B9FB4: .4byte 0x00000853
_080B9FB8:
	ldr r0, _080B9FC4 @ =0x00004001
	movs r1, 0
	bl VarSet
	b _080BA000
	.align 2, 0
_080B9FC4: .4byte 0x00004001
_080B9FC8:
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80A9424
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B9FF8
	ldr r0, _080B9FEC @ =0x00004001
	ldrh r1, [r4]
	bl VarSet
	ldr r0, _080B9FF0 @ =gStringVar1
	ldr r1, _080B9FF4 @ =gLinkPlayers + 0x8
	bl StringCopy
	b _080BA000
	.align 2, 0
_080B9FEC: .4byte 0x00004001
_080B9FF0: .4byte gStringVar1
_080B9FF4: .4byte gLinkPlayers + 0x8
_080B9FF8:
	ldr r0, _080BA008 @ =0x00004001
	movs r1, 0
	bl VarSet
_080BA000:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA008: .4byte 0x00004001
	thumb_func_end sub_80B9F3C

	thumb_func_start sub_80BA00C
sub_80BA00C: @ 80BA00C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080BA030 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bhi _080BA09C
	lsls r0, 2
	ldr r1, _080BA034 @ =_080BA038
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BA030: .4byte gTasks
_080BA034: .4byte _080BA038
	.align 2, 0
_080BA038:
	.4byte _080BA086
	.4byte _080BA086
	.4byte _080BA050
	.4byte _080BA05A
	.4byte _080BA074
	.4byte _080BA08E
_080BA050:
	bl sub_8047A1C
	bl sub_8125E2C
	b _080BA086
_080BA05A:
	bl sub_8125E6C
	lsls r0, 24
	cmp r0, 0
	beq _080BA09C
	bl sub_8047A34
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	b _080BA09C
_080BA074:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	ble _080BA09C
	bl sub_800832C
_080BA086:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080BA09C
_080BA08E:
	ldr r0, _080BA0A4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BA09C
	adds r0, r2, 0
	bl DestroyTask
_080BA09C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA0A4: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80BA00C

	thumb_func_start sub_80BA0A8
sub_80BA0A8: @ 80BA0A8
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80BA0A8

	thumb_func_start sub_80BA0C0
sub_80BA0C0: @ 80BA0C0
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r0, _080BA0E8 @ =gUnknown_020387B0
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BA0E2
	bl m4aSoundMain
	bl m4aSoundMain
	bl m4aSoundMain
_080BA0E2:
	pop {r0}
	bx r0
	.align 2, 0
_080BA0E8: .4byte gUnknown_020387B0
	thumb_func_end sub_80BA0C0

	thumb_func_start unref_sub_80BA0EC
unref_sub_80BA0EC: @ 80BA0EC
	push {r4-r6,lr}
	sub sp, 0xC
	movs r0, 0
	bl SetVBlankCallback
	movs r6, 0x80
	lsls r6, 19
	movs r5, 0
	strh r5, [r6]
	ldr r0, _080BA20C @ =REG_BG2CNT
	strh r5, [r0]
	subs r0, 0x2
	strh r5, [r0]
	subs r0, 0x2
	strh r5, [r0]
	adds r0, 0x10
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	subs r0, 0x6
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	subs r0, 0x6
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	add r0, sp, 0x4
	strh r5, [r0]
	ldr r1, _080BA210 @ =0x040000d4
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _080BA214 @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r4, 0
	str r4, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _080BA218 @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0x4
	strh r4, [r0]
	str r0, [r1]
	movs r0, 0xA0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _080BA21C @ =0x81000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	bl ResetTasks
	bl ResetSpriteData
	ldr r0, _080BA220 @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _080BA224 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080BA228 @ =REG_WIN0H
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	subs r0, 0x2
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	ldr r1, _080BA22C @ =REG_WININ
	ldr r2, _080BA230 @ =0x00001111
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x31
	strh r0, [r1]
	adds r1, 0x6
	movs r0, 0xE1
	strh r0, [r1]
	ldr r0, _080BA234 @ =REG_BLDALPHA
	strh r4, [r0]
	adds r1, 0x4
	movs r0, 0x7
	strh r0, [r1]
	ldr r1, _080BA238 @ =0x04000200
	movs r2, 0x1
	strh r2, [r1]
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r2, _080BA23C @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080BA240 @ =sub_80BA0C0
	bl SetVBlankCallback
	ldr r0, _080BA244 @ =sub_80BA0A8
	bl SetMainCallback2
	ldr r1, _080BA248 @ =0x00007140
	adds r0, r1, 0
	strh r0, [r6]
	ldr r0, _080BA24C @ =sub_80BA258
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BA250 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	strh r4, [r1, 0xA]
	strh r4, [r1, 0xC]
	strh r4, [r1, 0xE]
	ldr r0, _080BA254 @ =gUnknown_020387B0
	strb r5, [r0]
	strh r4, [r1, 0xE]
	bl m4aSoundInit
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA20C: .4byte REG_BG2CNT
_080BA210: .4byte 0x040000d4
_080BA214: .4byte 0x8100c000
_080BA218: .4byte 0x85000100
_080BA21C: .4byte 0x81000200
_080BA220: .4byte gWindowConfig_81E6C3C
_080BA224: .4byte gWindowConfig_81E6CE4
_080BA228: .4byte REG_WIN0H
_080BA22C: .4byte REG_WININ
_080BA230: .4byte 0x00001111
_080BA234: .4byte REG_BLDALPHA
_080BA238: .4byte 0x04000200
_080BA23C: .4byte REG_DISPSTAT
_080BA240: .4byte sub_80BA0C0
_080BA244: .4byte sub_80BA0A8
_080BA248: .4byte 0x00007140
_080BA24C: .4byte sub_80BA258
_080BA250: .4byte gTasks
_080BA254: .4byte gUnknown_020387B0
	thumb_func_end unref_sub_80BA0EC

	thumb_func_start sub_80BA258
sub_80BA258: @ 80BA258
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x40
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080BA354 @ =gDebugText_SoundCheckJap
	mov r0, sp
	movs r2, 0x9
	bl memcpy
	add r7, sp, 0xC
	ldr r1, _080BA358 @ =gDebugText_BGM
	adds r0, r7, 0
	movs r2, 0x4
	bl memcpy
	add r0, sp, 0x10
	mov r8, r0
	ldr r1, _080BA35C @ =gDebugText_SE
	movs r2, 0x4
	bl memcpy
	add r5, sp, 0x14
	ldr r1, _080BA360 @ =gUnknown_083D02D9
	adds r0, r5, 0
	movs r2, 0xD
	bl memcpy
	add r4, sp, 0x24
	ldr r1, _080BA364 @ =gDebugText_UpDown
	adds r0, r4, 0
	movs r2, 0xC
	bl memcpy
	add r6, sp, 0x30
	ldr r1, _080BA368 @ =gDebugText_DriverTest
	adds r0, r6, 0
	movs r2, 0xE
	bl memcpy
	ldr r0, _080BA36C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BA344
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x1B
	movs r3, 0x3
	bl MenuDrawTextWindow
	movs r0, 0x2
	movs r1, 0x5
	movs r2, 0x1B
	movs r3, 0xA
	bl MenuDrawTextWindow
	movs r0, 0x2
	movs r1, 0xC
	movs r2, 0x1B
	movs r3, 0x11
	bl MenuDrawTextWindow
	mov r0, sp
	movs r1, 0x4
	movs r2, 0x1
	bl MenuPrint
	adds r0, r5, 0
	movs r1, 0xE
	movs r2, 0x1
	bl MenuPrint
	adds r0, r7, 0
	movs r1, 0x4
	movs r2, 0x6
	bl MenuPrint
	adds r0, r4, 0
	movs r1, 0xE
	movs r2, 0x6
	bl MenuPrint
	mov r0, r8
	movs r1, 0x4
	movs r2, 0xD
	bl MenuPrint
	adds r0, r4, 0
	movs r1, 0xE
	movs r2, 0xD
	bl MenuPrint
	adds r0, r6, 0
	movs r1, 0xE
	movs r2, 0x12
	bl MenuPrint
	ldr r1, _080BA370 @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BA374 @ =sub_80BA384
	str r1, [r0]
	ldr r1, _080BA378 @ =REG_WIN0H
	ldr r2, _080BA37C @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BA380 @ =0x0000011f
	adds r0, r2, 0
	strh r0, [r1]
_080BA344:
	add sp, 0x40
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA354: .4byte gDebugText_SoundCheckJap
_080BA358: .4byte gDebugText_BGM
_080BA35C: .4byte gDebugText_SE
_080BA360: .4byte gUnknown_083D02D9
_080BA364: .4byte gDebugText_UpDown
_080BA368: .4byte gDebugText_DriverTest
_080BA36C: .4byte gPaletteFade
_080BA370: .4byte gTasks
_080BA374: .4byte sub_80BA384
_080BA378: .4byte REG_WIN0H
_080BA37C: .4byte 0x000011df
_080BA380: .4byte 0x0000011f
	thumb_func_end sub_80BA258

	thumb_func_start sub_80BA384
sub_80BA384: @ 80BA384
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080BA3EC @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrb r0, [r4, 0x8]
	bl sub_80BA6B8
	ldr r1, _080BA3F0 @ =0x0000015d
	adds r0, r1, 0
	ldrh r2, [r4, 0xA]
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x7
	movs r2, 0x8
	bl sub_80BA700
	ldr r1, _080BA3F4 @ =gBGMNames
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xB
	movs r2, 0x8
	bl sub_80BA79C
	ldrh r0, [r4, 0xC]
	movs r1, 0x7
	movs r2, 0xF
	bl sub_80BA700
	ldr r1, _080BA3F8 @ =gSENames
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xB
	movs r2, 0xF
	bl sub_80BA79C
	ldr r0, _080BA3FC @ =Task_HandleMainMenuInput
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA3EC: .4byte gTasks
_080BA3F0: .4byte 0x0000015d
_080BA3F4: .4byte gBGMNames
_080BA3F8: .4byte gSENames
_080BA3FC: .4byte Task_HandleMainMenuInput
	thumb_func_end sub_80BA384

	thumb_func_start sub_80BA400
sub_80BA400: @ 80BA400
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080BA428 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BA434
	ldr r0, _080BA42C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080BA430 @ =sub_80BA800
	str r0, [r1]
	b _080BA64C
	.align 2, 0
_080BA428: .4byte gMain
_080BA42C: .4byte gTasks
_080BA430: .4byte sub_80BA800
_080BA434:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080BA458
	ldr r0, _080BA450 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080BA454 @ =sub_80BAF84
	str r0, [r1]
	b _080BA64C
	.align 2, 0
_080BA450: .4byte gTasks
_080BA454: .4byte sub_80BAF84
_080BA458:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080BA478
	ldr r0, _080BA470 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080BA474 @ =sub_80BB25C
	str r0, [r1]
	b _080BA64C
	.align 2, 0
_080BA470: .4byte gTasks
_080BA474: .4byte sub_80BB25C
_080BA478:
	movs r6, 0x1
	movs r5, 0x1
	ands r5, r1
	cmp r5, 0
	beq _080BA538
	ldr r0, _080BA4AC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r5, r1, r0
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080BA4D0
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080BA4BA
	movs r3, 0xC
	ldrsh r4, [r5, r3]
	cmp r4, 0
	beq _080BA4B0
	ldrh r0, [r5, 0x10]
	bl m4aSongNumStop
	b _080BA4C4
	.align 2, 0
_080BA4AC: .4byte gTasks
_080BA4B0:
	ldrh r0, [r5, 0x10]
	bl m4aSongNumStop
	strh r4, [r5, 0x10]
	b _080BA64C
_080BA4BA:
	movs r4, 0xC
	ldrsh r0, [r5, r4]
	cmp r0, 0
	bne _080BA4C4
	b _080BA64C
_080BA4C4:
	ldrh r0, [r5, 0xC]
	bl m4aSongNumStart
	ldrh r0, [r5, 0xC]
	strh r0, [r5, 0x10]
	b _080BA64C
_080BA4D0:
	ldrh r1, [r5, 0xE]
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080BA514
	movs r3, 0xA
	ldrsh r4, [r5, r3]
	cmp r4, 0
	beq _080BA500
	ldr r0, _080BA4FC @ =0x0000015d
	adds r4, r0, 0
	adds r0, r1, r4
	lsls r0, 16
	lsrs r0, 16
	bl m4aSongNumStop
	ldrh r1, [r5, 0xA]
	adds r4, r1
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	b _080BA528
	.align 2, 0
_080BA4FC: .4byte 0x0000015d
_080BA500:
	ldr r2, _080BA510 @ =0x0000015d
	adds r0, r1, r2
	lsls r0, 16
	lsrs r0, 16
	bl m4aSongNumStop
	strh r4, [r5, 0xE]
	b _080BA64C
	.align 2, 0
_080BA510: .4byte 0x0000015d
_080BA514:
	ldrh r1, [r5, 0xA]
	movs r3, 0xA
	ldrsh r0, [r5, r3]
	cmp r0, 0
	bne _080BA520
	b _080BA64C
_080BA520:
	ldr r4, _080BA534 @ =0x0000015d
	adds r0, r1, r4
	lsls r0, 16
	lsrs r0, 16
_080BA528:
	bl m4aSongNumStart
	ldrh r0, [r5, 0xA]
	strh r0, [r5, 0xE]
	b _080BA64C
	.align 2, 0
_080BA534: .4byte 0x0000015d
_080BA538:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BA570
	movs r0, 0x5
	bl m4aSongNumStart
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080BA568 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BA56C @ =sub_80BA68C
	str r1, [r0]
	b _080BA64C
	.align 2, 0
_080BA568: .4byte gTasks
_080BA56C: .4byte sub_80BA68C
_080BA570:
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080BA582
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BA59C
_080BA582:
	ldr r0, _080BA598 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	eors r0, r6
	strh r0, [r1, 0x8]
_080BA592:
	movs r0, 0x1
	b _080BA64E
	.align 2, 0
_080BA598: .4byte gTasks
_080BA59C:
	movs r0, 0x10
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _080BA5EA
	ldr r0, _080BA5CC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080BA5D6
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _080BA5D0
	subs r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _080BA592
	.align 2, 0
_080BA5CC: .4byte gTasks
_080BA5D0:
	movs r0, 0xF7
	strh r0, [r1, 0xC]
	b _080BA592
_080BA5D6:
	ldrh r2, [r1, 0xA]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r0, 0
	ble _080BA5E4
	subs r0, r2, 0x1
	b _080BA5E6
_080BA5E4:
	movs r0, 0x75
_080BA5E6:
	strh r0, [r1, 0xA]
	b _080BA592
_080BA5EA:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080BA630
	ldr r1, _080BA614 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x8
	ldrsh r2, [r1, r0]
	cmp r2, 0
	beq _080BA61C
	ldrh r2, [r1, 0xC]
	movs r4, 0xC
	ldrsh r0, [r1, r4]
	cmp r0, 0xF6
	bgt _080BA618
	adds r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _080BA592
	.align 2, 0
_080BA614: .4byte gTasks
_080BA618:
	strh r3, [r1, 0xC]
	b _080BA592
_080BA61C:
	ldrh r3, [r1, 0xA]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r0, 0x74
	bgt _080BA62C
	adds r0, r3, 0x1
	strh r0, [r1, 0xA]
	b _080BA592
_080BA62C:
	strh r2, [r1, 0xA]
	b _080BA592
_080BA630:
	ldrh r1, [r2, 0x2C]
	movs r0, 0x4
	ands r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080BA648
	ldr r0, _080BA644 @ =gUnknown_020387B0
	strb r6, [r0]
	b _080BA64C
	.align 2, 0
_080BA644: .4byte gUnknown_020387B0
_080BA648:
	ldr r0, _080BA658 @ =gUnknown_020387B0
	strb r1, [r0]
_080BA64C:
	movs r0, 0
_080BA64E:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BA658: .4byte gUnknown_020387B0
	thumb_func_end sub_80BA400

	thumb_func_start Task_HandleMainMenuInput
Task_HandleMainMenuInput: @ 80BA65C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80BA400
	lsls r0, 24
	cmp r0, 0
	beq _080BA67C
	ldr r0, _080BA684 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080BA688 @ =sub_80BA384
	str r0, [r1]
_080BA67C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA684: .4byte gTasks
_080BA688: .4byte sub_80BA384
	thumb_func_end Task_HandleMainMenuInput

	thumb_func_start sub_80BA68C
sub_80BA68C: @ 80BA68C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080BA6B0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BA6AA
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _080BA6B4 @ =CB2_InitTitleScreen
	bl SetMainCallback2
_080BA6AA:
	pop {r0}
	bx r0
	.align 2, 0
_080BA6B0: .4byte gPaletteFade
_080BA6B4: .4byte CB2_InitTitleScreen
	thumb_func_end sub_80BA68C

	thumb_func_start sub_80BA6B8
sub_80BA6B8: @ 80BA6B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080BA6C6
	cmp r0, 0x1
	beq _080BA6E0
_080BA6C6:
	ldr r1, _080BA6D4 @ =REG_WIN1H
	ldr r2, _080BA6D8 @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BA6DC @ =0x00002957
	b _080BA6EC
	.align 2, 0
_080BA6D4: .4byte REG_WIN1H
_080BA6D8: .4byte 0x000011df
_080BA6DC: .4byte 0x00002957
_080BA6E0:
	ldr r1, _080BA6F4 @ =REG_WIN1H
	ldr r2, _080BA6F8 @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BA6FC @ =0x0000618f
_080BA6EC:
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080BA6F4: .4byte REG_WIN1H
_080BA6F8: .4byte 0x000011df
_080BA6FC: .4byte 0x0000618f
	thumb_func_end sub_80BA6B8

	thumb_func_start sub_80BA700
sub_80BA700: @ 80BA700
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r7, r2, 16
	movs r1, 0
	movs r2, 0
_080BA714:
	mov r3, sp
	adds r0, r3, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _080BA714
	mov r1, sp
	movs r0, 0xB0
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	movs r4, 0
	adds r0, r5, 0
	movs r1, 0x64
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080BA748
	mov r1, sp
	adds r0, 0xA1
	strb r0, [r1]
	movs r4, 0x1
_080BA748:
	adds r0, r5, 0
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080BA766
	cmp r4, 0
	beq _080BA76C
_080BA766:
	mov r1, sp
	adds r0, 0xA1
	strb r0, [r1, 0x1]
_080BA76C:
	mov r4, sp
	adds r0, r5, 0
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4, 0x2]
	lsls r1, r6, 24
	lsrs r1, 24
	lsls r2, r7, 24
	lsrs r2, 24
	mov r0, sp
	bl MenuPrint
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BA700

	thumb_func_start sub_80BA79C
sub_80BA79C: @ 80BA79C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	movs r3, 0
	movs r1, 0
_080BA7AE:
	mov r2, sp
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xA
	bls _080BA7AE
	mov r0, sp
	movs r1, 0xFF
	strb r1, [r0, 0xA]
	movs r3, 0
	ldrb r0, [r4]
	lsls r2, r6, 24
	lsls r5, 24
	cmp r0, 0xFF
	beq _080BA7EC
_080BA7D0:
	mov r0, sp
	adds r1, r0, r3
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080BA7EC
	cmp r3, 0x9
	bls _080BA7D0
_080BA7EC:
	lsrs r1, r2, 24
	lsrs r2, r5, 24
	mov r0, sp
	bl MenuPrint
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BA79C

	thumb_func_start sub_80BA800
sub_80BA800: @ 80BA800
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xCC
	lsls r0, 24
	str r0, [sp, 0xB0]
	lsrs r2, r0, 24
	str r2, [sp, 0xAC]
	ldr r1, _080BA9E8 @ =gUnknown_083D0312
	mov r0, sp
	movs r2, 0xA
	bl memcpy
	mov r0, sp
	adds r0, 0xC
	str r0, [sp, 0xB4]
	ldr r1, _080BA9EC @ =gUnknown_083D031C
	movs r2, 0xB
	bl memcpy
	mov r2, sp
	adds r2, 0x18
	str r2, [sp, 0xB8]
	ldr r1, _080BA9F0 @ =gDebugText_Voice
	adds r0, r2, 0
	movs r2, 0xA
	bl memcpy
	mov r0, sp
	adds r0, 0x24
	str r0, [sp, 0xBC]
	ldr r1, _080BA9F4 @ =gDebugText_Volume
	movs r2, 0xA
	bl memcpy
	mov r2, sp
	adds r2, 0x30
	str r2, [sp, 0xC0]
	ldr r1, _080BA9F8 @ =gDebugText_Panpot
	adds r0, r2, 0
	movs r2, 0xA
	bl memcpy
	mov r0, sp
	adds r0, 0x3C
	str r0, [sp, 0xC4]
	ldr r1, _080BA9FC @ =gDebugText_Pitch
	movs r2, 0xA
	bl memcpy
	mov r2, sp
	adds r2, 0x48
	str r2, [sp, 0xC8]
	ldr r1, _080BAA00 @ =gDebugText_Length
	adds r0, r2, 0
	movs r2, 0xA
	bl memcpy
	add r4, sp, 0x54
	ldr r1, _080BAA04 @ =gDebugText_Release
	adds r0, r4, 0
	movs r2, 0xA
	bl memcpy
	add r7, sp, 0x60
	ldr r1, _080BAA08 @ =gDebugText_Progress
	adds r0, r7, 0
	movs r2, 0xA
	bl memcpy
	add r0, sp, 0x6C
	mov r10, r0
	ldr r1, _080BAA0C @ =gDebugText_Chorus
	movs r2, 0xA
	bl memcpy
	add r2, sp, 0x78
	mov r9, r2
	ldr r1, _080BAA10 @ =gDebugText_Priority
	mov r0, r9
	movs r2, 0xA
	bl memcpy
	add r0, sp, 0x84
	mov r8, r0
	ldr r1, _080BAA14 @ =gUnknown_083D0381
	movs r2, 0x9
	bl memcpy
	add r6, sp, 0x90
	ldr r1, _080BAA18 @ =gUnknown_083D038A
	adds r0, r6, 0
	movs r2, 0x9
	bl memcpy
	add r5, sp, 0x9C
	ldr r1, _080BAA1C @ =gUnknown_083D0393
	adds r0, r5, 0
	movs r2, 0x9
	bl memcpy
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xC5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	mov r0, sp
	movs r1, 0x13
	movs r2, 0x4
	bl MenuPrint
	ldr r0, [sp, 0xB4]
	movs r1, 0x13
	movs r2, 0x2
	bl MenuPrint
	ldr r0, [sp, 0xB8]
	movs r1, 0x2
	movs r2, 0x1
	bl MenuPrint
	ldr r0, [sp, 0xBC]
	movs r1, 0x2
	movs r2, 0x3
	bl MenuPrint
	ldr r0, [sp, 0xC0]
	movs r1, 0x2
	movs r2, 0x5
	bl MenuPrint
	ldr r0, [sp, 0xC4]
	movs r1, 0x2
	movs r2, 0x7
	bl MenuPrint
	ldr r0, [sp, 0xC8]
	movs r1, 0x2
	movs r2, 0x9
	bl MenuPrint
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xB
	bl MenuPrint
	adds r0, r7, 0
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	mov r0, r10
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	mov r0, r9
	movs r1, 0x2
	movs r2, 0x11
	bl MenuPrint
	mov r0, r8
	movs r1, 0x13
	movs r2, 0x10
	bl MenuPrint
	adds r0, r6, 0
	movs r1, 0x13
	movs r2, 0xE
	bl MenuPrint
	adds r0, r5, 0
	movs r1, 0x13
	movs r2, 0xC
	bl MenuPrint
	ldr r1, _080BAA20 @ =REG_WIN0H
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0xA0
	strh r0, [r1]
	ldr r0, _080BAA24 @ =gUnknown_020387B3
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080BAA28 @ =gUnknown_020387B1
	strb r1, [r0]
	ldr r0, _080BAA2C @ =gUnknown_020387B2
	strb r1, [r0]
	ldr r0, _080BAA30 @ =gUnknown_03005D30
	movs r2, 0
	str r2, [r0]
	ldr r0, _080BAA34 @ =gUnknown_020387D8
	strb r2, [r0]
	ldr r1, _080BAA38 @ =gUnknown_020387D9
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080BAA3C @ =gUnknown_020387B4
	str r2, [r0]
	movs r1, 0x78
	str r1, [r0, 0x4]
	str r2, [r0, 0x8]
	movs r1, 0xF0
	lsls r1, 6
	str r1, [r0, 0xC]
	movs r1, 0xB4
	str r1, [r0, 0x10]
	str r2, [r0, 0x18]
	str r2, [r0, 0x14]
	str r2, [r0, 0x1C]
	movs r1, 0x2
	str r1, [r0, 0x20]
	bl sub_80BAD5C
	movs r0, 0
	movs r1, 0
	bl sub_80BAE10
	ldr r1, _080BAA40 @ =gTasks
	ldr r2, [sp, 0xAC]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BAA44 @ =sub_80BAA48
	str r1, [r0]
	add sp, 0xCC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA9E8: .4byte gUnknown_083D0312
_080BA9EC: .4byte gUnknown_083D031C
_080BA9F0: .4byte gDebugText_Voice
_080BA9F4: .4byte gDebugText_Volume
_080BA9F8: .4byte gDebugText_Panpot
_080BA9FC: .4byte gDebugText_Pitch
_080BAA00: .4byte gDebugText_Length
_080BAA04: .4byte gDebugText_Release
_080BAA08: .4byte gDebugText_Progress
_080BAA0C: .4byte gDebugText_Chorus
_080BAA10: .4byte gDebugText_Priority
_080BAA14: .4byte gUnknown_083D0381
_080BAA18: .4byte gUnknown_083D038A
_080BAA1C: .4byte gUnknown_083D0393
_080BAA20: .4byte REG_WIN0H
_080BAA24: .4byte gUnknown_020387B3
_080BAA28: .4byte gUnknown_020387B1
_080BAA2C: .4byte gUnknown_020387B2
_080BAA30: .4byte gUnknown_03005D30
_080BAA34: .4byte gUnknown_020387D8
_080BAA38: .4byte gUnknown_020387D9
_080BAA3C: .4byte gUnknown_020387B4
_080BAA40: .4byte gTasks
_080BAA44: .4byte sub_80BAA48
	thumb_func_end sub_80BA800

	thumb_func_start sub_80BAA48
sub_80BAA48: @ 80BAA48
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080BAA90 @ =gMain
	ldrh r2, [r1, 0x2E]
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _080BAAA8
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _080BAA94 @ =0x00007140
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x40
	ldr r2, _080BAA98 @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BAA9C @ =0x0000011f
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080BAAA0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BAAA4 @ =sub_80BA258
	str r1, [r0]
	b _080BACC6
	.align 2, 0
_080BAA90: .4byte gMain
_080BAA94: .4byte 0x00007140
_080BAA98: .4byte 0x000011df
_080BAA9C: .4byte 0x0000011f
_080BAAA0: .4byte gTasks
_080BAAA4: .4byte sub_80BA258
_080BAAA8:
	ldrh r1, [r1, 0x30]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _080BAAD0
	ldr r1, _080BAACC @ =gUnknown_020387B3
	ldrb r2, [r1]
	subs r0, r2, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080BAAEA
	movs r0, 0x8
	strb r0, [r1]
	b _080BAAEA
	.align 2, 0
_080BAACC: .4byte gUnknown_020387B3
_080BAAD0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BAAF8
	ldr r1, _080BAAF4 @ =gUnknown_020387B3
	ldrb r2, [r1]
	adds r0, r2, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x8
	ble _080BAAEA
	strb r3, [r1]
_080BAAEA:
	ldrb r1, [r1]
	adds r0, r2, 0
	bl sub_80BAE10
	b _080BACC6
	.align 2, 0
_080BAAF4: .4byte gUnknown_020387B3
_080BAAF8:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080BAB14
	ldr r0, _080BAB10 @ =gUnknown_020387D8
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	bl sub_80BAD5C
	b _080BACC6
	.align 2, 0
_080BAB10: .4byte gUnknown_020387D8
_080BAB14:
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	beq _080BAB38
	ldr r4, _080BAB34 @ =gUnknown_020387D9
	ldrb r0, [r4]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4]
	bl sub_80BAD5C
	ldrb r0, [r4]
	bl SetPokemonCryStereo
	b _080BACC6
	.align 2, 0
_080BAB34: .4byte gUnknown_020387D9
_080BAB38:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BAB46
	movs r0, 0xA
	b _080BAB6E
_080BAB46:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080BAB56
	movs r0, 0xA
	negs r0, r0
	b _080BAB6E
_080BAB56:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080BAB64
	movs r0, 0x1
	negs r0, r0
	b _080BAB6E
_080BAB64:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080BAB78
	movs r0, 0x1
_080BAB6E:
	bl sub_80BACDC
	bl sub_80BAD5C
	b _080BACC6
_080BAB78:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _080BAB82
	b _080BACA2
_080BAB82:
	ldr r4, _080BABE4 @ =gUnknown_020387B4
	ldrb r0, [r4, 0x4]
	bl SetPokemonCryVolume
	movs r0, 0x8
	ldrsb r0, [r4, r0]
	bl SetPokemonCryPanpot
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	bl SetPokemonCryPitch
	ldrh r0, [r4, 0x10]
	bl SetPokemonCryLength
	ldr r0, [r4, 0x18]
	bl SetPokemonCryProgress
	ldrb r0, [r4, 0x14]
	bl SetPokemonCryRelease
	movs r0, 0x1C
	ldrsb r0, [r4, r0]
	bl SetPokemonCryChorus
	ldr r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	bl SetPokemonCryPriority
	ldr r4, [r4]
	adds r0, r4, 0
	cmp r4, 0
	bge _080BABC8
	adds r0, 0x7F
_080BABC8:
	asrs r2, r0, 7
	lsls r0, r2, 7
	subs r0, r4, r0
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r2, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BAC1C
	cmp r0, 0x1
	bgt _080BABE8
	cmp r0, 0
	beq _080BABF2
	b _080BACA2
	.align 2, 0
_080BABE4: .4byte gUnknown_020387B4
_080BABE8:
	cmp r0, 0x2
	beq _080BAC48
	cmp r0, 0x3
	beq _080BAC74
	b _080BACA2
_080BABF2:
	ldr r0, _080BAC04 @ =gUnknown_020387D8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BAC0C
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC08 @ =voicegroup_84537C0
	b _080BAC98
	.align 2, 0
_080BAC04: .4byte gUnknown_020387D8
_080BAC08: .4byte voicegroup_84537C0
_080BAC0C:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC18 @ =voicegroup_8452590
	b _080BAC98
	.align 2, 0
_080BAC18: .4byte voicegroup_8452590
_080BAC1C:
	ldr r0, _080BAC30 @ =gUnknown_020387D8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BAC38
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC34 @ =voicegroup_8453DC0
	b _080BAC98
	.align 2, 0
_080BAC30: .4byte gUnknown_020387D8
_080BAC34: .4byte voicegroup_8453DC0
_080BAC38:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC44 @ =voicegroup_8452B90
	b _080BAC98
	.align 2, 0
_080BAC44: .4byte voicegroup_8452B90
_080BAC48:
	ldr r0, _080BAC5C @ =gUnknown_020387D8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BAC64
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC60 @ =voicegroup_84543C0
	b _080BAC98
	.align 2, 0
_080BAC5C: .4byte gUnknown_020387D8
_080BAC60: .4byte voicegroup_84543C0
_080BAC64:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC70 @ =voicegroup_8453190
	b _080BAC98
	.align 2, 0
_080BAC70: .4byte voicegroup_8453190
_080BAC74:
	ldr r0, _080BAC88 @ =gUnknown_020387D8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BAC90
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAC8C @ =voicegroup_84549C0
	b _080BAC98
	.align 2, 0
_080BAC88: .4byte gUnknown_020387D8
_080BAC8C: .4byte voicegroup_84549C0
_080BAC90:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BACCC @ =voicegroup_8453790
_080BAC98:
	adds r0, r1
	bl SetPokemonCryTone
	ldr r1, _080BACD0 @ =gUnknown_03005D30
	str r0, [r1]
_080BACA2:
	ldr r0, _080BACD0 @ =gUnknown_03005D30
	ldr r0, [r0]
	cmp r0, 0
	beq _080BACC6
	ldr r5, _080BACD4 @ =gUnknown_020387B1
	bl IsPokemonCryPlaying
	strb r0, [r5]
	ldr r4, _080BACD8 @ =gUnknown_020387B2
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4]
	cmp r0, r2
	beq _080BACC2
	bl sub_80BAD5C
_080BACC2:
	ldrb r0, [r5]
	strb r0, [r4]
_080BACC6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BACCC: .4byte voicegroup_8453790
_080BACD0: .4byte gUnknown_03005D30
_080BACD4: .4byte gUnknown_020387B1
_080BACD8: .4byte gUnknown_020387B2
	thumb_func_end sub_80BAA48

	thumb_func_start sub_80BACDC
sub_80BACDC: @ 80BACDC
	push {r4-r6,lr}
	sub sp, 0x40
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080BAD50 @ =gUnknown_083D039C
	mov r0, sp
	movs r2, 0x40
	bl memcpy
	ldr r6, _080BAD54 @ =gUnknown_020387B4
	ldr r5, _080BAD58 @ =gUnknown_020387B3
	movs r1, 0
	ldrsb r1, [r5, r1]
	lsls r1, 2
	adds r1, r6
	lsls r4, 24
	asrs r4, 24
	ldr r0, [r1]
	adds r0, r4
	str r0, [r1]
	movs r2, 0
	ldrsb r2, [r5, r2]
	lsls r0, r2, 2
	adds r3, r0, r6
	lsls r0, r2, 1
	adds r0, 0x1
	lsls r0, 2
	add r0, sp
	ldr r1, [r3]
	ldr r0, [r0]
	cmp r1, r0
	ble _080BAD26
	lsls r0, r2, 3
	add r0, sp
	ldr r0, [r0]
	str r0, [r3]
_080BAD26:
	movs r2, 0
	ldrsb r2, [r5, r2]
	lsls r0, r2, 2
	adds r3, r0, r6
	lsls r0, r2, 3
	add r0, sp
	ldr r1, [r3]
	ldr r0, [r0]
	cmp r1, r0
	bge _080BAD46
	lsls r0, r2, 1
	adds r0, 0x1
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	str r0, [r3]
_080BAD46:
	add sp, 0x40
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BAD50: .4byte gUnknown_083D039C
_080BAD54: .4byte gUnknown_020387B4
_080BAD58: .4byte gUnknown_020387B3
	thumb_func_end sub_80BACDC

	thumb_func_start sub_80BAD5C
sub_80BAD5C: @ 80BAD5C
	push {r4,lr}
	ldr r4, _080BAE00 @ =gUnknown_020387B4
	ldr r0, [r4]
	adds r0, 0x1
	movs r1, 0xB
	movs r2, 0x1
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x4]
	movs r1, 0xB
	movs r2, 0x3
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x8]
	movs r1, 0xB
	movs r2, 0x5
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0xC]
	movs r1, 0xB
	movs r2, 0x7
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x10]
	movs r1, 0xB
	movs r2, 0x9
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x14]
	movs r1, 0xB
	movs r2, 0xB
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x18]
	movs r1, 0xB
	movs r2, 0xD
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x1C]
	movs r1, 0xB
	movs r2, 0xF
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x20]
	movs r1, 0xB
	movs r2, 0x11
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, _080BAE04 @ =gUnknown_020387B1
	ldrb r0, [r0]
	movs r1, 0x1B
	movs r2, 0x10
	movs r3, 0x1
	bl sub_80BAE78
	ldr r0, _080BAE08 @ =gUnknown_020387D8
	ldrb r0, [r0]
	movs r1, 0x1B
	movs r2, 0xE
	movs r3, 0x1
	bl sub_80BAE78
	ldr r0, _080BAE0C @ =gUnknown_020387D9
	ldrb r0, [r0]
	movs r1, 0x1B
	movs r2, 0xC
	movs r3, 0x1
	bl sub_80BAE78
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BAE00: .4byte gUnknown_020387B4
_080BAE04: .4byte gUnknown_020387B1
_080BAE08: .4byte gUnknown_020387D8
_080BAE0C: .4byte gUnknown_020387D9
	thumb_func_end sub_80BAD5C

	thumb_func_start sub_80BAE10
sub_80BAE10: @ 80BAE10
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080BAE6C @ =gUnknown_083D03DC
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	add r0, sp, 0x4
	mov r8, r0
	ldr r1, _080BAE70 @ =gUnknown_083D03DE
	movs r2, 0x2
	bl memcpy
	ldr r6, _080BAE74 @ =gUnknown_083D0300
	lsls r4, 1
	adds r0, r4, r6
	ldrb r1, [r0]
	adds r4, 0x1
	adds r4, r6
	ldrb r2, [r4]
	mov r0, r8
	bl MenuPrint
	lsls r5, 1
	adds r0, r5, r6
	ldrb r1, [r0]
	adds r5, 0x1
	adds r5, r6
	ldrb r2, [r5]
	mov r0, sp
	bl MenuPrint
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BAE6C: .4byte gUnknown_083D03DC
_080BAE70: .4byte gUnknown_083D03DE
_080BAE74: .4byte gUnknown_083D0300
	thumb_func_end sub_80BAE10

	thumb_func_start sub_80BAE78
sub_80BAE78: @ 80BAE78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	mov r8, r0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r7, r3, 24
	mov r1, sp
	ldr r0, _080BAF80 @ =gUnknown_083D03E0
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	movs r5, 0
	add r0, sp, 0x18
	mov r9, r0
	cmp r5, r7
	bgt _080BAEC0
	mov r4, r9
	movs r3, 0
_080BAEAC:
	lsls r0, r5, 24
	asrs r0, 24
	adds r1, r4, r0
	strb r3, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	asrs r0, 24
	cmp r0, r7
	ble _080BAEAC
_080BAEC0:
	adds r0, r7, 0x1
	add r0, r9
	movs r1, 0xFF
	strb r1, [r0]
	movs r1, 0
	mov r3, r8
	cmp r3, 0
	bge _080BAED6
	negs r3, r3
	mov r8, r3
	movs r1, 0x1
_080BAED6:
	movs r4, 0
	mov r10, r4
	cmp r7, 0x1
	bne _080BAEE2
	movs r5, 0x1
	mov r10, r5
_080BAEE2:
	subs r0, r7, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 24
	lsls r6, 24
	str r6, [sp, 0x24]
	lsls r2, 24
	str r2, [sp, 0x28]
	cmp r0, 0
	blt _080BAF62
	str r1, [sp, 0x20]
_080BAEF8:
	asrs r6, r0, 24
	lsls r0, r6, 2
	add r0, sp
	ldr r1, [r0]
	mov r0, r8
	bl __divsi3
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r0, 0
	bne _080BAF1A
	mov r0, r10
	cmp r0, 0
	bne _080BAF1A
	lsls r4, r5, 24
	cmp r6, 0
	bne _080BAF46
_080BAF1A:
	lsls r4, r5, 24
	ldr r3, [sp, 0x20]
	cmp r3, 0
	beq _080BAF34
	mov r5, r10
	cmp r5, 0
	bne _080BAF34
	asrs r0, r4, 24
	subs r0, r7, r0
	subs r0, 0x1
	add r0, r9
	movs r1, 0xAE
	strb r1, [r0]
_080BAF34:
	asrs r1, r4, 24
	subs r1, r7, r1
	add r1, r9
	lsls r0, r2, 24
	asrs r0, 24
	subs r0, 0x5F
	strb r0, [r1]
	movs r0, 0x1
	mov r10, r0
_080BAF46:
	asrs r4, 24
	lsls r0, r4, 2
	add r0, sp
	ldr r1, [r0]
	mov r0, r8
	bl __modsi3
	mov r8, r0
	subs r4, 0x1
	lsls r4, 24
	lsrs r5, r4, 24
	lsls r0, r5, 24
	cmp r0, 0
	bge _080BAEF8
_080BAF62:
	ldr r3, [sp, 0x24]
	lsrs r1, r3, 24
	ldr r4, [sp, 0x28]
	lsrs r2, r4, 24
	mov r0, r9
	bl MenuPrint
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BAF80: .4byte gUnknown_083D03E0
	thumb_func_end sub_80BAE78

	thumb_func_start sub_80BAF84
sub_80BAF84: @ 80BAF84
	push {r4-r6,lr}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080BB01C @ =gOtherText_SE
	mov r0, sp
	movs r2, 0x3
	bl memcpy
	add r6, sp, 0x4
	ldr r1, _080BB020 @ =gOtherText_Pan
	adds r0, r6, 0
	movs r2, 0x4
	bl memcpy
	add r5, sp, 0x8
	ldr r1, _080BB024 @ =gUnknown_083D0381
	adds r0, r5, 0
	movs r2, 0x9
	bl memcpy
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xC5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	mov r0, sp
	movs r1, 0x3
	movs r2, 0x2
	bl MenuPrint
	adds r0, r6, 0
	movs r1, 0x3
	movs r2, 0x4
	bl MenuPrint
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0x8
	bl MenuPrint
	ldr r1, _080BB028 @ =REG_WIN0H
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0xA0
	strh r0, [r1]
	ldr r1, _080BB02C @ =gUnknown_020387B4
	movs r0, 0x1
	str r0, [r1]
	movs r0, 0
	str r0, [r1, 0x8]
	str r0, [r1, 0x1C]
	str r0, [r1, 0x18]
	str r0, [r1, 0x14]
	bl sub_80BB1D4
	ldr r1, _080BB030 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BB034 @ =sub_80BB038
	str r1, [r0]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB01C: .4byte gOtherText_SE
_080BB020: .4byte gOtherText_Pan
_080BB024: .4byte gUnknown_083D0381
_080BB028: .4byte REG_WIN0H
_080BB02C: .4byte gUnknown_020387B4
_080BB030: .4byte gTasks
_080BB034: .4byte sub_80BB038
	thumb_func_end sub_80BAF84

	thumb_func_start sub_80BB038
sub_80BB038: @ 80BB038
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80BB1D4
	ldr r2, _080BB058 @ =gUnknown_020387B4
	ldr r0, [r2, 0x18]
	cmp r0, 0
	beq _080BB0A2
	ldr r0, [r2, 0x14]
	cmp r0, 0
	beq _080BB05C
	subs r0, 0x1
	str r0, [r2, 0x14]
	b _080BB0A2
	.align 2, 0
_080BB058: .4byte gUnknown_020387B4
_080BB05C:
	ldr r0, _080BB088 @ =gUnknown_083D03F8
	ldr r1, [r2, 0x8]
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x80
	negs r0, r0
	cmp r1, r0
	beq _080BB08C
	cmp r1, 0x7F
	bne _080BB0A2
	ldr r0, [r2, 0x1C]
	adds r0, 0x2
	str r0, [r2, 0x1C]
	cmp r0, 0x3E
	bgt _080BB0A2
	lsls r0, 24
	asrs r0, 24
	bl SE12PanpotControl
	b _080BB0A2
	.align 2, 0
_080BB088: .4byte gUnknown_083D03F8
_080BB08C:
	ldr r0, [r2, 0x1C]
	subs r1, r0, 0x2
	str r1, [r2, 0x1C]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	ble _080BB0A2
	lsls r0, r1, 24
	asrs r0, 24
	bl SE12PanpotControl
_080BB0A2:
	ldr r1, _080BB0EC @ =gMain
	ldrh r3, [r1, 0x2E]
	movs r0, 0x2
	ands r0, r3
	lsls r0, 16
	lsrs r4, r0, 16
	adds r7, r1, 0
	cmp r4, 0
	beq _080BB104
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _080BB0F0 @ =0x00007140
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x40
	ldr r2, _080BB0F4 @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BB0F8 @ =0x0000011f
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080BB0FC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BB100 @ =sub_80BA258
	str r1, [r0]
	b _080BB1C8
	.align 2, 0
_080BB0EC: .4byte gMain
_080BB0F0: .4byte 0x00007140
_080BB0F4: .4byte 0x000011df
_080BB0F8: .4byte 0x0000011f
_080BB0FC: .4byte gTasks
_080BB100: .4byte sub_80BA258
_080BB104:
	movs r6, 0x1
	adds r2, r6, 0
	ands r2, r3
	cmp r2, 0
	beq _080BB15E
	ldr r0, _080BB138 @ =gUnknown_083D03F8
	ldr r5, _080BB13C @ =gUnknown_020387B4
	ldr r1, [r5, 0x8]
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x80
	negs r0, r0
	cmp r1, r0
	beq _080BB140
	cmp r1, 0x7F
	bne _080BB154
	ldrh r0, [r5]
	movs r4, 0x40
	negs r4, r4
	adds r1, r4, 0
	bl PlaySE12WithPanning
	str r4, [r5, 0x1C]
	b _080BB14C
	.align 2, 0
_080BB138: .4byte gUnknown_083D03F8
_080BB13C: .4byte gUnknown_020387B4
_080BB140:
	ldrh r0, [r5]
	movs r1, 0x3F
	bl PlaySE12WithPanning
	movs r0, 0x3F
	str r0, [r5, 0x1C]
_080BB14C:
	str r6, [r5, 0x18]
	movs r0, 0x1E
	str r0, [r5, 0x14]
	b _080BB1C8
_080BB154:
	ldrh r0, [r5]
	bl PlaySE12WithPanning
	str r4, [r5, 0x18]
	b _080BB1C8
_080BB15E:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r3
	cmp r0, 0
	beq _080BB176
	ldr r1, _080BB1AC @ =gUnknown_020387B4
	ldr r0, [r1, 0x8]
	adds r0, 0x1
	str r0, [r1, 0x8]
	cmp r0, 0x4
	ble _080BB176
	str r2, [r1, 0x8]
_080BB176:
	ldrh r1, [r7, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BB192
	ldr r1, _080BB1AC @ =gUnknown_020387B4
	ldr r0, [r1, 0x8]
	subs r0, 0x1
	str r0, [r1, 0x8]
	cmp r0, 0
	bge _080BB192
	movs r0, 0x4
	str r0, [r1, 0x8]
_080BB192:
	ldrh r1, [r7, 0x30]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080BB1B0
	ldr r1, _080BB1AC @ =gUnknown_020387B4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0xF7
	ble _080BB1C8
	movs r0, 0
	b _080BB1C6
	.align 2, 0
_080BB1AC: .4byte gUnknown_020387B4
_080BB1B0:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080BB1C8
	ldr r1, _080BB1D0 @ =gUnknown_020387B4
	ldr r0, [r1]
	subs r0, 0x1
	str r0, [r1]
	cmp r0, 0
	bge _080BB1C8
	movs r0, 0xF7
_080BB1C6:
	str r0, [r1]
_080BB1C8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB1D0: .4byte gUnknown_020387B4
	thumb_func_end sub_80BB038

	thumb_func_start sub_80BB1D4
sub_80BB1D4: @ 80BB1D4
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r1, _080BB218 @ =gOtherText_LR
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	add r5, sp, 0x8
	ldr r1, _080BB21C @ =gOtherText_RL
	adds r0, r5, 0
	movs r2, 0x5
	bl memcpy
	ldr r4, _080BB220 @ =gUnknown_020387B4
	ldr r0, [r4]
	movs r1, 0x7
	movs r2, 0x2
	movs r3, 0x3
	bl sub_80BAE78
	ldr r1, _080BB224 @ =gUnknown_083D03F8
	ldr r0, [r4, 0x8]
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x80
	negs r0, r0
	cmp r1, r0
	beq _080BB228
	cmp r1, 0x7F
	bne _080BB234
	mov r0, sp
	b _080BB22A
	.align 2, 0
_080BB218: .4byte gOtherText_LR
_080BB21C: .4byte gOtherText_RL
_080BB220: .4byte gUnknown_020387B4
_080BB224: .4byte gUnknown_083D03F8
_080BB228:
	adds r0, r5, 0
_080BB22A:
	movs r1, 0x7
	movs r2, 0x4
	bl MenuPrint
	b _080BB240
_080BB234:
	adds r0, r1, 0
	movs r1, 0x7
	movs r2, 0x4
	movs r3, 0x3
	bl sub_80BAE78
_080BB240:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC
	movs r2, 0x8
	movs r3, 0x1
	bl sub_80BAE78
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB1D4

	thumb_func_start sub_80BB25C
sub_80BB25C: @ 80BB25C
	push {r4-r6,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080BB374 @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _080BB378 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	ldr r1, _080BB37C @ =gUnknown_03005D34
	movs r0, 0x1
	strh r0, [r1]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _080BB380 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	ldr r1, _080BB384 @ =0xff00ffff
	ands r0, r1
	movs r1, 0xE8
	lsls r1, 13
	orrs r0, r1
	ldr r1, _080BB388 @ =0x00ffffff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 20
	orrs r0, r1
	str r0, [sp, 0x4]
	ldr r1, _080BB38C @ =0xffff00ff
	ldr r0, [sp, 0x8]
	ands r0, r1
	movs r1, 0xF0
	lsls r1, 5
	orrs r0, r1
	ldr r1, _080BB390 @ =0xffffff00
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	str r0, [sp, 0x8]
	movs r1, 0
	ldr r0, _080BB394 @ =gUnknown_03005E98
	strb r1, [r0]
	add r4, sp, 0xC
_080BB2BE:
	add r0, sp, 0x4
	movs r1, 0x3
	bl sub_8119E3C
	lsls r0, 24
	cmp r0, 0
	beq _080BB2BE
	ldr r1, _080BB380 @ =0xffff0000
	ldr r0, [sp, 0xC]
	ands r0, r1
	ldr r1, _080BB384 @ =0xff00ffff
	ands r0, r1
	movs r1, 0xF0
	lsls r1, 12
	orrs r0, r1
	ldr r1, _080BB388 @ =0x00ffffff
	ands r0, r1
	movs r1, 0xD0
	lsls r1, 20
	orrs r0, r1
	str r0, [sp, 0xC]
	ldr r1, _080BB390 @ =0xffffff00
	ldr r0, [r4, 0x4]
	ands r0, r1
	movs r1, 0xC
	orrs r0, r1
	ldr r1, _080BB38C @ =0xffff00ff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 4
	orrs r0, r1
	str r0, [r4, 0x4]
	movs r1, 0
	ldr r0, _080BB394 @ =gUnknown_03005E98
	strb r1, [r0]
	lsls r5, r6, 2
_080BB306:
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_811A3CC
	lsls r0, 24
	cmp r0, 0
	beq _080BB306
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x5
	movs r3, 0x13
	bl MenuDrawTextWindow
	bl sub_80BB494
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080BB398 @ =REG_BG2HOFS
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r1, _080BB39C @ =REG_BG2CNT
	ldr r2, _080BB3A0 @ =0x00000f01
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080BB3A4 @ =0x00001d03
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	adds r2, 0x3D
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080BB3A8 @ =gMPlay_BGM
	movs r1, 0x2
	bl m4aMPlayFadeOutTemporarily
	ldr r1, _080BB3AC @ =gTasks
	adds r0, r5, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BB3B0 @ =sub_80BB3B4
	str r1, [r0]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB374: .4byte gWindowConfig_81E6C3C
_080BB378: .4byte gWindowConfig_81E6CE4
_080BB37C: .4byte gUnknown_03005D34
_080BB380: .4byte 0xffff0000
_080BB384: .4byte 0xff00ffff
_080BB388: .4byte 0x00ffffff
_080BB38C: .4byte 0xffff00ff
_080BB390: .4byte 0xffffff00
_080BB394: .4byte gUnknown_03005E98
_080BB398: .4byte REG_BG2HOFS
_080BB39C: .4byte REG_BG2CNT
_080BB3A0: .4byte 0x00000f01
_080BB3A4: .4byte 0x00001d03
_080BB3A8: .4byte gMPlay_BGM
_080BB3AC: .4byte gTasks
_080BB3B0: .4byte sub_80BB3B4
	thumb_func_end sub_80BB25C

	thumb_func_start sub_80BB3B4
sub_80BB3B4: @ 80BB3B4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x3
	bl sub_8119F88
	ldr r4, _080BB478 @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080BB3D4
	ldr r0, _080BB47C @ =gUnknown_03005D34
	ldrh r0, [r0]
	bl sub_811A050
_080BB3D4:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BB3E4
	bl StopCryAndClearCrySongs
_080BB3E4:
	ldrh r1, [r4, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080BB408
	ldr r1, _080BB47C @ =gUnknown_03005D34
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _080BB404
	movs r2, 0xC0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
_080BB404:
	bl sub_80BB494
_080BB408:
	ldr r0, _080BB478 @ =gMain
	ldrh r1, [r0, 0x30]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BB42E
	ldr r2, _080BB47C @ =gUnknown_03005D34
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 17
	cmp r0, r1
	bls _080BB42A
	movs r0, 0x1
	strh r0, [r2]
_080BB42A:
	bl sub_80BB494
_080BB42E:
	ldr r0, _080BB478 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BB472
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _080BB480 @ =0x00007140
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x40
	ldr r2, _080BB484 @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BB488 @ =0x0000011f
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080BB48C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BB490 @ =sub_80BA258
	str r1, [r0]
	bl sub_811A4F8
_080BB472:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB478: .4byte gMain
_080BB47C: .4byte gUnknown_03005D34
_080BB480: .4byte 0x00007140
_080BB484: .4byte 0x000011df
_080BB488: .4byte 0x0000011f
_080BB48C: .4byte gTasks
_080BB490: .4byte sub_80BA258
	thumb_func_end sub_80BB3B4

	thumb_func_start sub_80BB494
sub_80BB494: @ 80BB494
	push {lr}
	ldr r0, _080BB4A8 @ =gUnknown_03005D34
	ldrh r0, [r0]
	movs r1, 0x1
	movs r2, 0x11
	movs r3, 0x3
	bl sub_80BAE78
	pop {r0}
	bx r0
	.align 2, 0
_080BB4A8: .4byte gUnknown_03005D34
	thumb_func_end sub_80BB494

	thumb_func_start sub_80BB4AC
sub_80BB4AC: @ 80BB4AC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r3, r0, 0
	movs r0, 0
	strb r0, [r3]
	movs r2, 0
	adds r4, r3, 0x2
	movs r5, 0xFF
_080BB4C4:
	adds r0, r4, r2
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x6
	bls _080BB4C4
	movs r2, 0
	adds r5, r3, 0
	adds r5, 0x12
	adds r6, r3, 0
	adds r6, 0x22
	adds r7, r3, 0
	adds r7, 0x4C
	adds r0, r3, 0
	adds r0, 0x34
	str r0, [sp]
	adds r1, r3, 0
	adds r1, 0x9A
	str r1, [sp, 0x4]
	movs r0, 0x7C
	adds r0, r3
	mov r10, r0
	movs r1, 0x88
	adds r1, r3
	mov r9, r1
	movs r0, 0x94
	adds r0, r3
	mov r8, r0
	adds r1, r3, 0
	adds r1, 0x9
	movs r4, 0
_080BB508:
	adds r0, r1, r2
	strb r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x3
	bls _080BB508
	movs r0, 0
	movs r1, 0
	strh r1, [r3, 0xE]
	strb r0, [r3, 0x10]
	strb r0, [r3, 0x11]
	movs r0, 0
	strb r0, [r3, 0x1]
	movs r2, 0
	adds r4, r5, 0
	adds r3, r6, 0
_080BB52A:
	adds r0, r4, r2
	strb r1, [r0]
	adds r0, r3, r2
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _080BB52A
	movs r2, 0
	mov r12, r7
	movs r5, 0
_080BB542:
	movs r1, 0
	adds r7, r2, 0x1
	lsls r4, r2, 2
	lsls r6, r2, 1
	adds r3, r4, 0
_080BB54C:
	adds r0, r3, r1
	lsls r0, 1
	add r0, r12
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _080BB54C
	ldr r1, [sp]
	adds r0, r1, r4
	str r5, [r0]
	ldr r1, [sp, 0x4]
	adds r0, r1, r2
	strb r5, [r0]
	mov r1, r10
	adds r0, r1, r6
	strh r5, [r0]
	mov r1, r9
	adds r0, r1, r6
	strh r5, [r0]
	mov r1, r8
	adds r0, r1, r2
	strb r5, [r0]
	lsls r0, r7, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080BB542
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB4AC

	thumb_func_start sub_80BB594
sub_80BB594: @ 80BB594
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	ldr r1, _080BB5B0 @ =gSaveBlock1 + 0x1A08
	adds r0, r1
	bl sub_80BB4AC
	pop {r0}
	bx r0
	.align 2, 0
_080BB5B0: .4byte gSaveBlock1 + 0x1A08
	thumb_func_end sub_80BB594

	thumb_func_start sub_80BB5B4
sub_80BB5B4: @ 80BB5B4
	push {r4,lr}
	movs r4, 0
_080BB5B8:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80BB594
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _080BB5B8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB5B4

	thumb_func_start sub_80BB5D0
sub_80BB5D0: @ 80BB5D0
	ldr r0, _080BB5DC @ =gUnknown_020387DC
	ldr r1, _080BB5E0 @ =gUnknown_0202E8CC
	ldrh r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_080BB5DC: .4byte gUnknown_020387DC
_080BB5E0: .4byte gUnknown_0202E8CC
	thumb_func_end sub_80BB5D0

	thumb_func_start sub_80BB5E4
sub_80BB5E4: @ 80BB5E4
	push {r4,lr}
	ldr r0, _080BB5F4 @ =gScriptResult
	movs r1, 0
	strh r1, [r0]
	movs r3, 0
	adds r4, r0, 0
	b _080BB5FE
	.align 2, 0
_080BB5F4: .4byte gScriptResult
_080BB5F8:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
_080BB5FE:
	cmp r3, 0x13
	bhi _080BB626
	ldr r2, _080BB62C @ =gUnknown_020387DC
	ldr r1, _080BB630 @ =gSaveBlock1
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 5
	adds r0, r1
	ldr r1, _080BB634 @ =0x00001a08
	adds r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080BB5F8
	movs r0, 0x1
	strh r0, [r4]
	ldr r0, _080BB638 @ =0x00004054
	adds r1, r3, 0
	bl VarSet
_080BB626:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB62C: .4byte gUnknown_020387DC
_080BB630: .4byte gSaveBlock1
_080BB634: .4byte 0x00001a08
_080BB638: .4byte 0x00004054
	thumb_func_end sub_80BB5E4

	thumb_func_start sub_80BB63C
sub_80BB63C: @ 80BB63C
	push {lr}
	ldr r0, _080BB654 @ =gSaveBlock1
	ldr r1, _080BB658 @ =0x00001a08
	adds r0, r1
	ldrb r1, [r0]
	cmp r1, 0
	beq _080BB660
	ldr r1, _080BB65C @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	b _080BB664
	.align 2, 0
_080BB654: .4byte gSaveBlock1
_080BB658: .4byte 0x00001a08
_080BB65C: .4byte gScriptResult
_080BB660:
	ldr r0, _080BB668 @ =gScriptResult
	strh r1, [r0]
_080BB664:
	pop {r0}
	bx r0
	.align 2, 0
_080BB668: .4byte gScriptResult
	thumb_func_end sub_80BB63C

	thumb_func_start sub_80BB66C
sub_80BB66C: @ 80BB66C
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, 0
	ldr r2, _080BB6A4 @ =0x00000fff
	adds r0, r2, 0
	ands r1, r0
	adds r0, r1, 0
	subs r0, 0x90
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BB6A8
	movs r0, 0x1
	b _080BB702
	.align 2, 0
_080BB6A4: .4byte 0x00000fff
_080BB6A8:
	adds r0, r1, 0
	subs r0, 0x92
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BB6B8
	movs r0, 0x2
	b _080BB702
_080BB6B8:
	adds r0, r1, 0
	subs r0, 0x9A
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BB6C8
	movs r0, 0x3
	b _080BB702
_080BB6C8:
	adds r0, r1, 0
	subs r0, 0x94
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BB6D8
	movs r0, 0x4
	b _080BB702
_080BB6D8:
	adds r0, r1, 0
	subs r0, 0x96
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080BB6EC
	cmp r1, 0x9C
	beq _080BB6EC
	cmp r1, 0x9D
	bne _080BB6F0
_080BB6EC:
	movs r0, 0x5
	b _080BB702
_080BB6F0:
	adds r0, r1, 0
	subs r0, 0x98
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080BB700
	movs r0, 0
	b _080BB702
_080BB700:
	movs r0, 0x6
_080BB702:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BB66C

	thumb_func_start sub_80BB70C
sub_80BB70C: @ 80BB70C
	push {r4,lr}
	ldr r4, _080BB720 @ =gUnknown_0202E8D2
	bl sub_80BB66C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB720: .4byte gUnknown_0202E8D2
	thumb_func_end sub_80BB70C

	thumb_func_start unref_sub_80BB724
unref_sub_80BB724: @ 80BB724
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	movs r2, 0
	ldr r6, _080BB748 @ =0x00000fff
	lsrs r3, r1, 24
	ldr r5, _080BB74C @ =0x000001ff
_080BB732:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, r3
	bne _080BB750
	lsls r0, r2, 16
	asrs r0, 16
	b _080BB75E
	.align 2, 0
_080BB748: .4byte 0x00000fff
_080BB74C: .4byte 0x000001ff
_080BB750:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r5
	bls _080BB732
	movs r0, 0x1
	negs r0, r0
_080BB75E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80BB724

	thumb_func_start sub_80BB764
sub_80BB764: @ 80BB764
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r0
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	movs r0, 0
	mov r12, r0
	ldr r1, _080BB7C8 @ =gMapHeader
	ldr r0, [r1]
	ldr r3, [r0, 0x4]
	cmp r12, r3
	bge _080BB7EE
	ldr r0, [r0]
	str r0, [sp, 0x4]
	str r3, [sp]
_080BB78E:
	movs r2, 0
	mov r1, r12
	lsls r7, r1, 16
	ldr r0, [sp, 0x4]
	cmp r2, r0
	bge _080BB7DC
	ldr r0, _080BB7C8 @ =gMapHeader
	ldr r1, [r0]
	asrs r0, r7, 16
	ldr r4, [r1]
	adds r6, r0, 0
	muls r6, r4
	ldr r5, [r1, 0xC]
_080BB7A8:
	lsls r0, r2, 16
	asrs r3, r0, 16
	adds r0, r6, r3
	lsls r0, 1
	adds r0, r5
	ldrh r1, [r0]
	ldr r0, _080BB7CC @ =0x000003ff
	ands r0, r1
	cmp r0, r8
	bne _080BB7D0
	mov r1, r9
	strh r2, [r1]
	mov r1, r12
	mov r0, r10
	strh r1, [r0]
	b _080BB7EE
	.align 2, 0
_080BB7C8: .4byte gMapHeader
_080BB7CC: .4byte 0x000003ff
_080BB7D0:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, r4
	blt _080BB7A8
_080BB7DC:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r7, r1
	lsrs r1, r0, 16
	mov r12, r1
	asrs r0, 16
	ldr r1, [sp]
	cmp r0, r1
	blt _080BB78E
_080BB7EE:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB764

	thumb_func_start sub_80BB800
sub_80BB800: @ 80BB800
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	movs r5, 0
	mov r12, r4
	lsls r0, 16
	asrs r3, r0, 16
	ldr r1, _080BB84C @ =gUnknown_083D1358
	mov r8, r1
	adds r7, r0, 0
	mov r4, sp
	mov r6, r12
_080BB834:
	ldr r0, _080BB84C @ =gUnknown_083D1358
	lsls r1, r5, 2
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, r3
	bne _080BB850
	movs r3, 0
	ldrsh r0, [r4, r3]
	movs r5, 0
	ldrsh r1, [r6, r5]
	ldrh r3, [r2, 0x2]
	b _080BB878
	.align 2, 0
_080BB84C: .4byte gUnknown_083D1358
_080BB850:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x6
	bls _080BB834
	movs r5, 0
	mov r4, sp
	mov r6, r12
_080BB860:
	lsls r0, r5, 2
	mov r1, r8
	adds r3, r0, r1
	ldrh r1, [r3, 0x2]
	asrs r0, r7, 16
	cmp r1, r0
	bne _080BB892
	movs r2, 0
	ldrsh r0, [r4, r2]
	movs r5, 0
	ldrsh r1, [r6, r5]
	ldrh r3, [r3]
_080BB878:
	movs r5, 0xC0
	lsls r5, 4
	adds r2, r5, 0
	orrs r2, r3
	bl MapGridSetMetatileIdAt
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r6, r2]
	bl CurrentMapDrawMetatileAt
	b _080BB89C
_080BB892:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x6
	bls _080BB860
_080BB89C:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB800

	thumb_func_start sub_80BB8A8
sub_80BB8A8: @ 80BB8A8
	push {lr}
	adds r2, r0, 0
	movs r1, 0
_080BB8AE:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BB8BA
	adds r0, r1, 0
	b _080BB8C6
_080BB8BA:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _080BB8AE
	movs r0, 0x7
_080BB8C6:
	pop {r1}
	bx r1
	thumb_func_end sub_80BB8A8

	thumb_func_start sub_80BB8CC
sub_80BB8CC: @ 80BB8CC
	push {r4-r6,lr}
	ldr r2, _080BB948 @ =gSaveBlock1
	ldr r0, _080BB94C @ =gUnknown_020387DC
	ldrb r1, [r0]
	ldr r3, _080BB950 @ =0x00001a08
	adds r0, r2, r3
	strb r1, [r0]
	movs r3, 0
	ldr r0, _080BB954 @ =0x00001a11
	adds r2, r0
	ldr r4, _080BB958 @ =gSaveBlock2 + 0xA
_080BB8E2:
	adds r1, r3, r2
	adds r0, r3, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080BB8E2
	ldr r0, _080BB95C @ =0x00004054
	movs r1, 0
	bl VarSet
	ldr r6, _080BB960 @ =gSaveBlock2
	adds r0, r6, 0
	bl sub_80BB8A8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080BB964 @ =gSaveBlock1 + 0x1A0A
	adds r0, r5, 0
	movs r1, 0xFF
	movs r2, 0x7
	bl memset
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl StringCopyN
	ldrb r0, [r6, 0x8]
	subs r5, 0x1
	movs r1, 0x1
	ands r1, r0
	lsls r1, 4
	ldrb r2, [r5]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldr r0, _080BB968 @ =0x00004026
	ldr r1, _080BB96C @ =gMapHeader
	ldrb r1, [r1, 0x14]
	bl VarSet
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB948: .4byte gSaveBlock1
_080BB94C: .4byte gUnknown_020387DC
_080BB950: .4byte 0x00001a08
_080BB954: .4byte 0x00001a11
_080BB958: .4byte gSaveBlock2 + 0xA
_080BB95C: .4byte 0x00004054
_080BB960: .4byte gSaveBlock2
_080BB964: .4byte gSaveBlock1 + 0x1A0A
_080BB968: .4byte 0x00004026
_080BB96C: .4byte gMapHeader
	thumb_func_end sub_80BB8CC

	thumb_func_start sub_80BB970
sub_80BB970: @ 80BB970
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r2, 0
	b _080BBA06
_080BB978:
	ldr r0, [r5, 0x10]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3, 0x5]
	adds r7, r2, 0x1
	cmp r0, 0x8
	bne _080BBA02
	movs r2, 0
	ldr r4, _080BB9E0 @ =gSaveBlock1
	adds r6, r1, 0
_080BB990:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 5
	adds r0, r4
	ldr r1, _080BB9E4 @ =0x00001a08
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, [r3, 0x8]
	cmp r1, r0
	bne _080BB9F8
	ldrh r0, [r3]
	adds r0, 0x7
	ldrh r1, [r3, 0x2]
	adds r1, 0x7
	bl MapGridGetMetatileIdAt
	movs r3, 0
	lsls r0, 16
	asrs r4, r0, 16
_080BB9B6:
	ldr r0, _080BB9E8 @ =gUnknown_083D1358
	lsls r1, r3, 2
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, r4
	bne _080BB9EC
	ldr r1, [r5, 0x10]
	adds r1, r6, r1
	ldrh r0, [r1]
	adds r0, 0x7
	ldrh r1, [r1, 0x2]
	adds r1, 0x7
	ldrh r3, [r2, 0x2]
	movs r4, 0xC0
	lsls r4, 4
	adds r2, r4, 0
	orrs r2, r3
	bl MapGridSetMetatileIdAt
	b _080BBA02
	.align 2, 0
_080BB9E0: .4byte gSaveBlock1
_080BB9E4: .4byte 0x00001a08
_080BB9E8: .4byte gUnknown_083D1358
_080BB9EC:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x6
	bls _080BB9B6
	b _080BBA02
_080BB9F8:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x13
	bls _080BB990
_080BBA02:
	lsls r0, r7, 16
	lsrs r2, r0, 16
_080BBA06:
	ldrb r0, [r5, 0x3]
	cmp r2, r0
	bcc _080BB978
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB970

	thumb_func_start sub_80BBA14
sub_80BBA14: @ 80BBA14
	push {lr}
	ldr r0, _080BBA40 @ =gUnknown_020387DC
	ldrb r0, [r0]
	movs r1, 0xA
	bl __udivsi3
	ldr r2, _080BBA44 @ =gUnknown_083D1374
	lsls r0, 26
	asrs r0, 24
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	adds r0, 0x1
	adds r0, r2
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r0, 0x19
	bl warp1_set_2
	pop {r0}
	bx r0
	.align 2, 0
_080BBA40: .4byte gUnknown_020387DC
_080BBA44: .4byte gUnknown_083D1374
	thumb_func_end sub_80BBA14

	thumb_func_start sub_80BBA48
sub_80BBA48: @ 80BBA48
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080BBA6C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _080BBA7C
	cmp r0, 0x1
	bgt _080BBA70
	cmp r0, 0
	beq _080BBA76
	b _080BBAD0
	.align 2, 0
_080BBA6C: .4byte gTasks
_080BBA70:
	cmp r0, 0x2
	beq _080BBA94
	b _080BBAD0
_080BBA76:
	movs r0, 0x1
	strh r0, [r2, 0x8]
	b _080BBAD0
_080BBA7C:
	ldr r0, _080BBA90 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BBAD0
	movs r0, 0x2
	strh r0, [r2, 0x8]
	b _080BBAD0
	.align 2, 0
_080BBA90: .4byte gPaletteFade
_080BBA94:
	ldr r0, _080BBAD8 @ =0x00004054
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080BBADC @ =gSaveBlock1
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r2
	ldr r0, _080BBAE0 @ =0x00001a18
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0xFE
	bhi _080BBAB6
	adds r0, 0x1
	strb r0, [r1]
_080BBAB6:
	bl sub_80BBA14
	bl warp_in
	ldr r0, _080BBAE4 @ =gUnknown_0300485C
	ldr r1, _080BBAE8 @ =sub_8080990
	str r1, [r0]
	ldr r0, _080BBAEC @ =CB2_LoadMap
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_080BBAD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBAD8: .4byte 0x00004054
_080BBADC: .4byte gSaveBlock1
_080BBAE0: .4byte 0x00001a18
_080BBAE4: .4byte gUnknown_0300485C
_080BBAE8: .4byte sub_8080990
_080BBAEC: .4byte CB2_LoadMap
	thumb_func_end sub_80BBA48

	thumb_func_start sub_80BBAF0
sub_80BBAF0: @ 80BBAF0
	push {lr}
	ldr r0, _080BBB1C @ =sub_80BBA48
	movs r1, 0
	bl CreateTask
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080BBB20 @ =gSaveBlock1
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	movs r2, 0x5
	ldrsb r2, [r0, r2]
	movs r3, 0x1
	negs r3, r3
	movs r0, 0
	bl saved_warp2_set
	pop {r0}
	bx r0
	.align 2, 0
_080BBB1C: .4byte sub_80BBA48
_080BBB20: .4byte gSaveBlock1
	thumb_func_end sub_80BBAF0

	thumb_func_start sub_80BBB24
sub_80BBB24: @ 80BBB24
	push {lr}
	ldr r0, _080BBB40 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x9
	bne _080BBB48
	ldr r0, _080BBB44 @ =0x00004097
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _080BBB48
	movs r0, 0
	b _080BBB4A
	.align 2, 0
_080BBB40: .4byte gMapHeader
_080BBB44: .4byte 0x00004097
_080BBB48:
	movs r0, 0x1
_080BBB4A:
	pop {r1}
	bx r1
	thumb_func_end sub_80BBB24

	thumb_func_start sub_80BBB50
sub_80BBB50: @ 80BBB50
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BBB88 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BBB8C @ =gMapObjects
	adds r0, r1
	movs r1, 0x2
	bl FieldObjectTurn
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BBB80
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_080BBB80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBB88: .4byte gPlayerAvatar
_080BBB8C: .4byte gMapObjects
	thumb_func_end sub_80BBB50

	thumb_func_start sub_80BBB90
sub_80BBB90: @ 80BBB90
	push {r4,lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	bl HideMapNamePopUpWindow
	mov r4, sp
	adds r4, 0x2
	movs r2, 0x88
	lsls r2, 2
	mov r0, sp
	adds r1, r4, 0
	bl sub_80BB764
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x7
	movs r2, 0
	ldrsh r1, [r4, r2]
	adds r1, 0x7
	movs r2, 0xE2
	lsls r2, 4
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x7
	movs r2, 0
	ldrsh r1, [r4, r2]
	adds r1, 0x7
	bl CurrentMapDrawMetatileAt
	bl pal_fill_black
	ldr r0, _080BBBE8 @ =sub_80BBB50
	movs r1, 0
	bl CreateTask
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBBE8: .4byte sub_80BBB50
	thumb_func_end sub_80BBB90

	thumb_func_start sub_80BBBEC
sub_80BBBEC: @ 80BBBEC
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080BBC5C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BBC52
	ldr r0, _080BBC60 @ =gUnknown_020387DC
	ldrb r0, [r0]
	movs r1, 0xA
	bl __udivsi3
	ldr r1, _080BBC64 @ =gSaveBlock1
	movs r5, 0x4
	ldrsb r5, [r1, r5]
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	ldr r4, _080BBC68 @ =gUnknown_083D1374
	lsls r0, 26
	asrs r0, 24
	adds r3, r0, 0x2
	adds r3, r4
	ldrb r3, [r3]
	lsls r3, 24
	asrs r3, 24
	adds r0, 0x3
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	adds r0, r5, 0
	bl warp1_set
	bl warp_in
	ldr r1, _080BBC6C @ =gUnknown_0300485C
	ldr r0, _080BBC70 @ =sub_80BBB90
	str r0, [r1]
	ldr r0, _080BBC74 @ =CB2_LoadMap
	bl SetMainCallback2
	adds r0, r6, 0
	bl DestroyTask
_080BBC52:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBC5C: .4byte gPaletteFade
_080BBC60: .4byte gUnknown_020387DC
_080BBC64: .4byte gSaveBlock1
_080BBC68: .4byte gUnknown_083D1374
_080BBC6C: .4byte gUnknown_0300485C
_080BBC70: .4byte sub_80BBB90
_080BBC74: .4byte CB2_LoadMap
	thumb_func_end sub_80BBBEC

	thumb_func_start sub_80BBC78
sub_80BBC78: @ 80BBC78
	push {lr}
	ldr r0, _080BBCA0 @ =sub_80BBBEC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BBCA4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	.align 2, 0
_080BBCA0: .4byte sub_80BBBEC
_080BBCA4: .4byte gTasks
	thumb_func_end sub_80BBC78

	thumb_func_start CurrentMapIsSecretBase
CurrentMapIsSecretBase: @ 80BBCA8
	push {lr}
	ldr r1, _080BBCC0 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x19
	bne _080BBCC4
	ldrb r0, [r1, 0x5]
	cmp r0, 0x17
	bhi _080BBCC4
	movs r0, 0x1
	b _080BBCC6
	.align 2, 0
_080BBCC0: .4byte gSaveBlock1
_080BBCC4:
	movs r0, 0
_080BBCC6:
	pop {r1}
	bx r1
	thumb_func_end CurrentMapIsSecretBase

	thumb_func_start sub_80BBCCC
sub_80BBCCC: @ 80BBCCC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl CurrentMapIsSecretBase
	lsls r0, 24
	cmp r0, 0
	beq _080BBDBC
	ldr r0, _080BBD70 @ =0x00004054
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	ldr r6, _080BBD74 @ =gSaveBlock1
	mov r4, sp
	ldr r0, _080BBD78 @ =0x00001a2a
	adds r7, r6, r0
_080BBCFC:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	ldrh r1, [r4]
	adds r2, r0, r1
	ldr r1, _080BBD7C @ =0x00001a1a
	adds r0, r6, r1
	adds r1, r2, r0
	ldrb r0, [r1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	bhi _080BBD3A
	ldr r0, _080BBD80 @ =gDecorations
	ldrb r3, [r1]
	lsls r1, r3, 5
	adds r1, r0
	ldrb r0, [r1, 0x11]
	cmp r0, 0x4
	beq _080BBD3A
	adds r0, r2, r7
	ldrb r2, [r0]
	lsrs r0, r2, 4
	adds r0, 0x7
	movs r1, 0xF
	ands r1, r2
	adds r1, 0x7
	adds r2, r3, 0
	bl sub_80FF394
_080BBD3A:
	ldrh r0, [r4]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	strh r0, [r4]
	cmp r0, 0xF
	bls _080BBCFC
	cmp r5, 0
	beq _080BBD88
	mov r4, sp
	adds r4, 0x2
	movs r2, 0x88
	lsls r2, 2
	mov r0, sp
	adds r1, r4, 0
	bl sub_80BB764
	mov r0, sp
	ldrh r0, [r0]
	adds r0, 0x7
	ldrh r1, [r4]
	adds r1, 0x7
	ldr r2, _080BBD84 @ =0x00000e21
	bl MapGridSetMetatileIdAt
	b _080BBDBC
	.align 2, 0
_080BBD70: .4byte 0x00004054
_080BBD74: .4byte gSaveBlock1
_080BBD78: .4byte 0x00001a2a
_080BBD7C: .4byte 0x00001a1a
_080BBD80: .4byte gDecorations
_080BBD84: .4byte 0x00000e21
_080BBD88:
	mov r0, r8
	cmp r0, 0x1
	bne _080BBDBC
	ldr r0, _080BBDC8 @ =0x00004089
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _080BBDBC
	mov r4, sp
	adds r4, 0x2
	movs r2, 0x88
	lsls r2, 2
	mov r0, sp
	adds r1, r4, 0
	bl sub_80BB764
	mov r0, sp
	ldrh r0, [r0]
	adds r0, 0x7
	ldrh r1, [r4]
	adds r1, 0x7
	ldr r2, _080BBDCC @ =0x00000e0a
	bl MapGridSetMetatileIdAt
_080BBDBC:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBDC8: .4byte 0x00004089
_080BBDCC: .4byte 0x00000e0a
	thumb_func_end sub_80BBCCC

	thumb_func_start sub_80BBDD0
sub_80BBDD0: @ 80BBDD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r0, _080BBE00 @ =0x00004054
	bl VarGet
	lsls r0, 16
	lsrs r4, r0, 16
	bl CurrentMapIsSecretBase
	lsls r0, 24
	cmp r0, 0
	bne _080BBE08
	ldr r0, _080BBE04 @ =gSaveBlock1 + 0x2688
	str r0, [sp, 0x4]
	adds r0, 0xC
	str r0, [sp, 0x8]
	movs r1, 0xC
	str r1, [sp, 0xC]
	b _080BBE1E
	.align 2, 0
_080BBE00: .4byte 0x00004054
_080BBE04: .4byte gSaveBlock1 + 0x2688
_080BBE08:
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 5
	ldr r0, _080BBF7C @ =gSaveBlock1 + 0x1A1A
	adds r2, r1, r0
	str r2, [sp, 0x4]
	adds r0, 0x10
	adds r1, r0
	str r1, [sp, 0x8]
	movs r3, 0x10
	str r3, [sp, 0xC]
_080BBE1E:
	movs r6, 0
	ldr r4, [sp, 0xC]
	cmp r6, r4
	bcc _080BBE28
	b _080BBF6C
_080BBE28:
	ldr r5, _080BBF80 @ =gSaveBlock1
	mov r10, r5
_080BBE2C:
	ldr r1, [sp, 0x4]
	adds r0, r1, r6
	ldrb r1, [r0]
	mov r9, r0
	adds r2, r6, 0x1
	str r2, [sp, 0x10]
	cmp r1, 0
	bne _080BBE3E
	b _080BBF5E
_080BBE3E:
	ldrb r0, [r0]
	lsls r0, 5
	ldr r3, _080BBF84 @ =gDecorations
	adds r0, r3
	ldrb r0, [r0, 0x11]
	cmp r0, 0x4
	beq _080BBE4E
	b _080BBF5E
_080BBE4E:
	movs r5, 0
	ldr r0, _080BBF88 @ =gMapHeader
	ldr r2, [r0, 0x4]
	ldrb r3, [r2]
	mov r8, r0
	cmp r5, r3
	bcs _080BBE8E
	ldr r0, [r2, 0x4]
	ldrh r1, [r0, 0x14]
	ldr r4, _080BBF8C @ =gUnknown_0202E8CC
	ldrh r0, [r4]
	adds r0, 0xAE
	adds r7, r4, 0
	cmp r1, r0
	beq _080BBE8E
	adds r4, r2, 0
	adds r2, r3, 0
_080BBE70:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r2
	bcs _080BBE8E
	ldr r1, [r4, 0x4]
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x14]
	ldrh r0, [r7]
	adds r0, 0xAE
	cmp r1, r0
	bne _080BBE70
_080BBE8E:
	mov r1, r8
	ldr r0, [r1, 0x4]
	ldrb r0, [r0]
	cmp r5, r0
	beq _080BBF5E
	ldr r7, _080BBF90 @ =gUnknown_0202E8D0
	ldr r2, [sp, 0x8]
	adds r1, r2, r6
	ldrb r0, [r1]
	lsrs r0, 4
	strh r0, [r7]
	ldr r6, _080BBF94 @ =gUnknown_0202E8D2
	ldrb r1, [r1]
	movs r0, 0xF
	ands r0, r1
	strh r0, [r6]
	ldrh r0, [r7]
	adds r0, 0x7
	ldrh r1, [r6]
	adds r1, 0x7
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80572D8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BBEDA
	adds r0, r4, 0
	bl sub_80572EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BBF5E
_080BBEDA:
	mov r3, r8
	ldr r0, [r3, 0x4]
	ldr r1, [r0, 0x4]
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 3
	adds r1, r4, r1
	ldr r5, _080BBF98 @ =0x00003f20
	adds r0, r5, 0
	ldrb r1, [r1, 0x1]
	adds r0, r1
	ldr r1, _080BBF9C @ =gScriptResult
	strh r0, [r1]
	ldrh r0, [r1]
	mov r2, r9
	ldrb r1, [r2]
	lsls r1, 5
	ldr r3, _080BBFA0 @ =gDecorations + 0x1C
	adds r1, r3
	ldr r1, [r1]
	ldrh r1, [r1]
	bl VarSet
	mov r5, r8
	ldr r0, [r5, 0x4]
	ldr r0, [r0, 0x4]
	adds r4, r0
	ldrb r0, [r4]
	ldr r1, _080BBF9C @ =gScriptResult
	strh r0, [r1]
	ldr r2, _080BBF8C @ =gUnknown_0202E8CC
	ldrh r0, [r2]
	adds r0, 0xAE
	lsls r0, 16
	lsrs r0, 16
	bl FlagReset
	ldr r3, _080BBF9C @ =gScriptResult
	ldrb r0, [r3]
	mov r4, r10
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	bl show_sprite
	ldr r5, _080BBF9C @ =gScriptResult
	ldrb r0, [r5]
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	movs r4, 0
	ldrsh r3, [r7, r4]
	movs r5, 0
	ldrsh r4, [r6, r5]
	str r4, [sp]
	bl sub_805C0F8
	ldr r1, _080BBF9C @ =gScriptResult
	ldrb r0, [r1]
	mov r2, r10
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805C78C
	ldr r3, _080BBF8C @ =gUnknown_0202E8CC
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_080BBF5E:
	ldr r4, [sp, 0x10]
	lsls r0, r4, 24
	lsrs r6, r0, 24
	ldr r5, [sp, 0xC]
	cmp r6, r5
	bcs _080BBF6C
	b _080BBE2C
_080BBF6C:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBF7C: .4byte gSaveBlock1 + 0x1A1A
_080BBF80: .4byte gSaveBlock1
_080BBF84: .4byte gDecorations
_080BBF88: .4byte gMapHeader
_080BBF8C: .4byte gUnknown_0202E8CC
_080BBF90: .4byte gUnknown_0202E8D0
_080BBF94: .4byte gUnknown_0202E8D2
_080BBF98: .4byte 0x00003f20
_080BBF9C: .4byte gScriptResult
_080BBFA0: .4byte gDecorations + 0x1C
	thumb_func_end sub_80BBDD0

	thumb_func_start sub_80BBFA4
sub_80BBFA4: @ 80BBFA4
	push {r4,r5,lr}
	ldr r0, _080BBFCC @ =0x00004054
	bl VarGet
	ldr r5, _080BBFD0 @ =0x0000401f
	ldr r4, _080BBFD4 @ =gUnknown_083D13EC
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BCCA4
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r5, 0
	bl VarSet
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBFCC: .4byte 0x00004054
_080BBFD0: .4byte 0x0000401f
_080BBFD4: .4byte gUnknown_083D13EC
	thumb_func_end sub_80BBFA4

	thumb_func_start sub_80BBFD8
sub_80BBFD8: @ 80BBFD8
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r3, 0
	ldrb r0, [r4, 0x3]
	cmp r3, r0
	bge _080BC030
	ldr r6, _080BC01C @ =gUnknown_020387DC
_080BBFE8:
	lsls r3, 16
	asrs r1, r3, 16
	ldr r2, [r4, 0x10]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2, 0x5]
	cmp r0, 0x8
	bne _080BC020
	movs r0, 0
	ldrsh r1, [r5, r0]
	ldrh r0, [r2]
	adds r0, 0x7
	cmp r1, r0
	bne _080BC020
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	ldrh r0, [r2, 0x2]
	adds r0, 0x7
	cmp r1, r0
	bne _080BC020
	ldr r0, [r2, 0x8]
	strb r0, [r6]
	b _080BC030
	.align 2, 0
_080BC01C: .4byte gUnknown_020387DC
_080BC020:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r3, r0, 16
	asrs r0, 16
	ldrb r1, [r4, 0x3]
	cmp r0, r1
	blt _080BBFE8
_080BC030:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BBFD8

	thumb_func_start sub_80BC038
sub_80BC038: @ 80BC038
	push {lr}
	bl sub_80BBFD8
	bl sub_80BB5E4
	ldr r0, _080BC04C @ =gUnknown_081A2E14
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080BC04C: .4byte gUnknown_081A2E14
	thumb_func_end sub_80BC038

	thumb_func_start sub_80BC050
sub_80BC050: @ 80BC050
	push {lr}
	bl sub_80BB5D0
	bl sub_80BB5E4
	ldr r0, _080BC068 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080BC06C
	movs r0, 0x1
	b _080BC06E
	.align 2, 0
_080BC068: .4byte gScriptResult
_080BC06C:
	movs r0, 0
_080BC06E:
	pop {r1}
	bx r1
	thumb_func_end sub_80BC050

	thumb_func_start sub_80BC074
sub_80BC074: @ 80BC074
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080BC098 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080BC0AC
	cmp r0, 0x1
	bgt _080BC09C
	cmp r0, 0
	beq _080BC0A2
	b _080BC0E4
	.align 2, 0
_080BC098: .4byte gTasks
_080BC09C:
	cmp r0, 0x2
	beq _080BC0C4
	b _080BC0E4
_080BC0A2:
	bl ScriptContext2_Enable
	movs r0, 0x1
	strh r0, [r4, 0x8]
	b _080BC0E4
_080BC0AC:
	ldr r0, _080BC0C0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BC0E4
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080BC0E4
	.align 2, 0
_080BC0C0: .4byte gPaletteFade
_080BC0C4:
	movs r0, 0x7E
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	bl warp_in
	ldr r0, _080BC0EC @ =gUnknown_0300485C
	ldr r1, _080BC0F0 @ =mapldr_default
	str r1, [r0]
	ldr r0, _080BC0F4 @ =CB2_LoadMap
	bl SetMainCallback2
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_080BC0E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC0EC: .4byte gUnknown_0300485C
_080BC0F0: .4byte mapldr_default
_080BC0F4: .4byte CB2_LoadMap
	thumb_func_end sub_80BC074

	thumb_func_start sub_80BC0F8
sub_80BC0F8: @ 80BC0F8
	push {lr}
	ldr r0, _080BC110 @ =sub_80BC074
	movs r1, 0
	bl CreateTask
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	.align 2, 0
_080BC110: .4byte sub_80BC074
	thumb_func_end sub_80BC0F8

	thumb_func_start sub_80BC114
sub_80BC114: @ 80BC114
	push {lr}
	ldr r0, _080BC12C @ =gSaveBlock1
	ldr r1, _080BC130 @ =0x00001a08
	adds r0, r1
	ldr r1, _080BC134 @ =gUnknown_020387DC
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080BC13C
	ldr r1, _080BC138 @ =gScriptResult
	movs r0, 0x1
	b _080BC140
	.align 2, 0
_080BC12C: .4byte gSaveBlock1
_080BC130: .4byte 0x00001a08
_080BC134: .4byte gUnknown_020387DC
_080BC138: .4byte gScriptResult
_080BC13C:
	ldr r1, _080BC148 @ =gScriptResult
	movs r0, 0
_080BC140:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080BC148: .4byte gScriptResult
	thumb_func_end sub_80BC114

	thumb_func_start sub_80BC14C
sub_80BC14C: @ 80BC14C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r5, _080BC174 @ =gSaveBlock1
	ldr r4, _080BC178 @ =0x00001a08
_080BC158:
	lsls r0, r2, 16
	asrs r1, r0, 16
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r5
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080BC17C
	lsls r0, r2, 24
	lsrs r0, 24
	b _080BC18A
	.align 2, 0
_080BC174: .4byte gSaveBlock1
_080BC178: .4byte 0x00001a08
_080BC17C:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BC158
	movs r0, 0
_080BC18A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC14C

	thumb_func_start sub_80BC190
sub_80BC190: @ 80BC190
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r4, r1, 2
	adds r4, r1
	lsls r4, 5
	ldr r0, _080BC1C8 @ =gSaveBlock1 + 0x1A0A
	adds r4, r0
	adds r0, r4, 0
	bl sub_80BB8A8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringCopyN
	movs r1, 0xFF
	strb r1, [r0]
	ldr r1, _080BC1CC @ =gOtherText_PlayersBase
	adds r0, r5, 0
	bl StringAppend
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BC1C8: .4byte gSaveBlock1 + 0x1A0A
_080BC1CC: .4byte gOtherText_PlayersBase
	thumb_func_end sub_80BC190

	thumb_func_start GetSecretBaseMapName
GetSecretBaseMapName: @ 80BC1D0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r6, _080BC214 @ =gUnknown_020387DC
	ldr r5, _080BC218 @ =gSaveBlock1
	ldr r4, _080BC21C @ =0x00004054
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r5
	ldr r0, _080BC220 @ =0x00001a08
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r6]
	adds r0, r4, 0
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_80BC190
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BC214: .4byte gUnknown_020387DC
_080BC218: .4byte gSaveBlock1
_080BC21C: .4byte 0x00004054
_080BC220: .4byte 0x00001a08
	thumb_func_end GetSecretBaseMapName

	thumb_func_start sub_80BC224
sub_80BC224: @ 80BC224
	push {r4,r5,lr}
	ldr r0, _080BC25C @ =0x00004054
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 5
	ldr r0, _080BC260 @ =gSaveBlock1 + 0x1A0A
	adds r4, r0
	ldr r5, _080BC264 @ =gStringVar1
	adds r0, r4, 0
	bl sub_80BB8A8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringCopyN
	movs r1, 0xFF
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC25C: .4byte 0x00004054
_080BC260: .4byte gSaveBlock1 + 0x1A0A
_080BC264: .4byte gStringVar1
	thumb_func_end sub_80BC224

	thumb_func_start sub_80BC268
sub_80BC268: @ 80BC268
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BC288 @ =gSaveBlock1
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r2
	ldr r0, _080BC28C @ =0x00001a09
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 6
	cmp r0, 0
	bne _080BC290
	movs r0, 0
	b _080BC292
	.align 2, 0
_080BC288: .4byte gSaveBlock1
_080BC28C: .4byte 0x00001a09
_080BC290:
	movs r0, 0x1
_080BC292:
	pop {r1}
	bx r1
	thumb_func_end sub_80BC268

	thumb_func_start sub_80BC298
sub_80BC298: @ 80BC298
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x1A
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1B
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1C
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1D
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1E
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1F
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC298

	thumb_func_start sub_80BC300
sub_80BC300: @ 80BC300
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0
	mov r10, r0
	movs r6, 0
	mov r9, r6
_080BC314:
	movs r4, 0
	lsls r3, r6, 2
	lsls r2, r6, 1
	ldr r7, _080BC424 @ =gPlayerParty
	adds r1, r6, 0x1
	str r1, [sp]
	adds r1, r3, 0
_080BC322:
	adds r0, r1, r4
	lsls r0, 1
	ldr r5, _080BC428 @ =gSaveBlock1 + 0x1A54
	adds r0, r5, r0
	mov r5, r9
	strh r5, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080BC322
	ldr r1, _080BC42C @ =gSaveBlock1 + 0x1A84
	adds r0, r1, r2
	strh r5, [r0]
	ldr r5, _080BC430 @ =gSaveBlock1 + 0x1A90
	adds r0, r5, r2
	mov r1, r9
	strh r1, [r0]
	ldr r2, _080BC434 @ =gSaveBlock1 + 0x1A9C
	adds r0, r2, r6
	mov r5, r9
	strb r5, [r0]
	ldr r1, _080BC438 @ =gSaveBlock1 + 0x1A3C
	adds r0, r1, r3
	mov r2, r9
	str r2, [r0]
	ldr r3, _080BC43C @ =gSaveBlock1 + 0x1AA2
	adds r0, r3, r6
	strb r2, [r0]
	movs r0, 0x64
	adds r5, r6, 0
	muls r5, r0
	adds r4, r5, r7
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080BC408
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080BC408
	movs r4, 0
	mov r0, r10
	lsls r0, 2
	mov r8, r0
	mov r1, r10
	lsls r7, r1, 1
	adds r1, 0x1
	str r1, [sp, 0x4]
	ldr r2, _080BC424 @ =gPlayerParty
_080BC38E:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r5, r2
	str r2, [sp, 0x8]
	bl GetMonData
	mov r3, r8
	adds r1, r3, r4
	lsls r1, 1
	ldr r3, _080BC428 @ =gSaveBlock1 + 0x1A54
	adds r1, r3, r1
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r2, [sp, 0x8]
	cmp r4, 0x3
	bls _080BC38E
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _080BC424 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	ldr r5, _080BC42C @ =gSaveBlock1 + 0x1A84
	adds r1, r5, r7
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	ldr r2, _080BC430 @ =gSaveBlock1 + 0x1A90
	adds r1, r2, r7
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, _080BC434 @ =gSaveBlock1 + 0x1A9C
	add r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	ldr r1, _080BC438 @ =gSaveBlock1 + 0x1A3C
	add r1, r8
	str r0, [r1]
	adds r0, r4, 0
	bl sub_80BC298
	ldr r1, _080BC43C @ =gSaveBlock1 + 0x1AA2
	add r1, r10
	strb r0, [r1]
	ldr r3, [sp, 0x4]
	lsls r0, r3, 16
	lsrs r0, 16
	mov r10, r0
_080BC408:
	ldr r5, [sp]
	lsls r0, r5, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080BC314
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC424: .4byte gPlayerParty
_080BC428: .4byte gSaveBlock1 + 0x1A54
_080BC42C: .4byte gSaveBlock1 + 0x1A84
_080BC430: .4byte gSaveBlock1 + 0x1A90
_080BC434: .4byte gSaveBlock1 + 0x1A9C
_080BC438: .4byte gSaveBlock1 + 0x1A3C
_080BC43C: .4byte gSaveBlock1 + 0x1AA2
	thumb_func_end sub_80BC300

	thumb_func_start sub_80BC440
sub_80BC440: @ 80BC440
	push {r4,r5,lr}
	ldr r4, _080BC45C @ =gSaveBlock1
	ldr r0, _080BC460 @ =0x00001a16
	adds r4, r0
	ldrh r5, [r4]
	movs r0, 0
	bl sub_80BB594
	strh r5, [r4]
	bl sub_80BC0F8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC45C: .4byte gSaveBlock1
_080BC460: .4byte 0x00001a16
	thumb_func_end sub_80BC440

	thumb_func_start sub_80BC464
sub_80BC464: @ 80BC464
	push {lr}
	movs r0, 0x14
	bl sav12_xor_increment
	bl sub_80BC440
	pop {r0}
	bx r0
	thumb_func_end sub_80BC464

	thumb_func_start sub_80BC474
sub_80BC474: @ 80BC474
	push {r4-r7,lr}
	ldr r0, _080BC4CC @ =gMapHeader
	ldr r4, [r0, 0x4]
	movs r6, 0
	ldrb r0, [r4, 0x3]
	cmp r6, r0
	bcs _080BC504
	ldr r3, _080BC4D0 @ =gSaveBlock1 + 0x1A08
_080BC484:
	ldr r2, [r4, 0x10]
	lsls r1, r6, 1
	adds r0, r1, r6
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2, 0x5]
	adds r7, r1, 0
	cmp r0, 0x8
	bne _080BC4F8
	ldrb r1, [r3]
	ldr r0, [r2, 0x8]
	cmp r1, r0
	bne _080BC4F8
	ldrh r0, [r2]
	adds r0, 0x7
	ldrh r1, [r2, 0x2]
	adds r1, 0x7
	bl MapGridGetMetatileIdAt
	movs r1, 0
	ldr r5, _080BC4D4 @ =gUnknown_083D1358
	lsls r0, 16
	asrs r2, r0, 16
_080BC4B2:
	lsls r0, r1, 2
	adds r3, r0, r5
	ldrh r0, [r3, 0x2]
	cmp r0, r2
	beq _080BC4D8
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x6
	bls _080BC4B2
_080BC4C6:
	bl DrawWholeMapView
	b _080BC504
	.align 2, 0
_080BC4CC: .4byte gMapHeader
_080BC4D0: .4byte gSaveBlock1 + 0x1A08
_080BC4D4: .4byte gUnknown_083D1358
_080BC4D8:
	ldr r0, [r4, 0x10]
	adds r1, r7, r6
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x7
	ldrh r1, [r1, 0x2]
	adds r1, 0x7
	ldrh r3, [r3]
	movs r4, 0xC0
	lsls r4, 4
	adds r2, r4, 0
	orrs r2, r3
	bl MapGridSetMetatileIdAt
	b _080BC4C6
_080BC4F8:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r0, [r4, 0x3]
	cmp r6, r0
	bcc _080BC484
_080BC504:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BC474

	thumb_func_start sub_80BC50C
sub_80BC50C: @ 80BC50C
	push {r4,r5,lr}
	bl sub_80BC474
	movs r0, 0x14
	bl sav12_xor_increment
	ldr r4, _080BC530 @ =gSaveBlock1
	ldr r0, _080BC534 @ =0x00001a16
	adds r4, r0
	ldrh r5, [r4]
	movs r0, 0
	bl sub_80BB594
	strh r5, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC530: .4byte gSaveBlock1
_080BC534: .4byte 0x00001a16
	thumb_func_end sub_80BC50C

	thumb_func_start sub_80BC538
sub_80BC538: @ 80BC538
	push {r4,r5,lr}
	movs r5, 0
	movs r4, 0x1
_080BC53E:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80BC268
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BC554
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080BC554:
	lsls r0, r4, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BC53E
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC538

	thumb_func_start sub_80BC56C
sub_80BC56C: @ 80BC56C
	push {lr}
	ldr r0, _080BC58C @ =gUnknown_020387DC
	ldrb r0, [r0]
	bl sub_80BC14C
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BC268
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _080BC594
	ldr r0, _080BC590 @ =gScriptResult
	strh r1, [r0]
	b _080BC5B2
	.align 2, 0
_080BC58C: .4byte gUnknown_020387DC
_080BC590: .4byte gScriptResult
_080BC594:
	bl sub_80BC538
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bls _080BC5AC
	ldr r1, _080BC5A8 @ =gScriptResult
	movs r0, 0x2
	b _080BC5B0
	.align 2, 0
_080BC5A8: .4byte gScriptResult
_080BC5AC:
	ldr r1, _080BC5B8 @ =gScriptResult
	movs r0, 0
_080BC5B0:
	strh r0, [r1]
_080BC5B2:
	pop {r0}
	bx r0
	.align 2, 0
_080BC5B8: .4byte gScriptResult
	thumb_func_end sub_80BC56C

	thumb_func_start sub_80BC5BC
sub_80BC5BC: @ 80BC5BC
	push {lr}
	ldr r0, _080BC5F8 @ =gUnknown_020387DC
	ldrb r0, [r0]
	bl sub_80BC14C
	ldr r2, _080BC5FC @ =gSaveBlock1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r2
	ldr r0, _080BC600 @ =0x00001a09
	adds r1, r0
	ldrb r3, [r1]
	lsrs r2, r3, 6
	movs r0, 0x1
	eors r2, r0
	lsls r2, 6
	movs r0, 0x3F
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	movs r0, 0x86
	lsls r0, 1
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080BC5F8: .4byte gUnknown_020387DC
_080BC5FC: .4byte gSaveBlock1
_080BC600: .4byte 0x00001a09
	thumb_func_end sub_80BC5BC

	thumb_func_start sub_80BC604
sub_80BC604: @ 80BC604
	push {lr}
	ldr r0, _080BC614 @ =sub_80FE264
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC614: .4byte sub_80FE264
	thumb_func_end sub_80BC604

	thumb_func_start sub_80BC618
sub_80BC618: @ 80BC618
	push {lr}
	ldr r0, _080BC628 @ =sub_80BC62C
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC628: .4byte sub_80BC62C
	thumb_func_end sub_80BC618

	thumb_func_start sub_80BC62C
sub_80BC62C: @ 80BC62C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl ScriptContext2_Enable
	bl sub_80F944C
	bl InitMenuInUpperLeftCornerPlaySoundWhenAPressed
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080BC688 @ =gTasks + 0x8
	adds r4, r0, r1
	bl sub_80BC538
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	adds r1, r0, 0
	cmp r1, 0
	beq _080BC694
	cmp r1, 0x7
	ble _080BC65E
	movs r0, 0x7
_080BC65E:
	strh r0, [r4, 0x6]
	movs r0, 0
	strh r0, [r4, 0x2]
	strh r0, [r4, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl sub_80BC7D8
	ldr r1, _080BC68C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BC690 @ =sub_80BC824
	str r1, [r0]
	b _080BC6A0
	.align 2, 0
_080BC688: .4byte gTasks + 0x8
_080BC68C: .4byte gTasks
_080BC690: .4byte sub_80BC824
_080BC694:
	ldr r1, _080BC6A8 @ =gSecretBaseText_NoRegistry
	ldr r2, _080BC6AC @ =sub_80BCC54
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080BC6A0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC6A8: .4byte gSecretBaseText_NoRegistry
_080BC6AC: .4byte sub_80BCC54
	thumb_func_end sub_80BC62C

	thumb_func_start sub_80BC6B0
sub_80BC6B0: @ 80BC6B0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080BC6D8 @ =gTasks + 0x8
	adds r1, r0
	mov r8, r1
	movs r4, 0
	movs r6, 0
	movs r5, 0x1
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r6, r0
	bne _080BC6DC
	movs r4, 0x1
	b _080BC706
	.align 2, 0
_080BC6D8: .4byte gTasks + 0x8
_080BC6DC:
	adds r0, r5, 0
	bl sub_80BC268
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BC6F0
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080BC6F0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bhi _080BC706
	mov r1, r8
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bne _080BC6DC
	adds r4, r5, 0
_080BC706:
	adds r5, r4, 0
	cmp r5, 0x13
	bhi _080BC75A
	ldr r7, _080BC7A0 @ =gStringVar1
_080BC70E:
	adds r0, r5, 0
	bl sub_80BC268
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BC750
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_80BC190
	lsls r3, r6, 1
	adds r4, r3, 0x2
	lsls r4, 24
	lsrs r4, 24
	adds r3, 0x3
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x12
	adds r1, r4, 0
	movs r2, 0x1C
	bl MenuFillWindowRectWithBlankTile
	adds r0, r7, 0
	movs r1, 0x12
	adds r2, r4, 0
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x8
	beq _080BC75A
_080BC750:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BC70E
_080BC75A:
	cmp r6, 0x7
	bhi _080BC7A8
	lsls r3, r6, 1
	adds r4, r3, 0x2
	lsls r4, 24
	lsrs r4, 24
	adds r3, 0x3
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x12
	adds r1, r4, 0
	movs r2, 0x1C
	bl MenuFillWindowRectWithBlankTile
	ldr r0, _080BC7A4 @ =gUnknownText_Exit
	movs r1, 0x12
	adds r2, r4, 0
	bl MenuPrint
	movs r0, 0x1
	bl SetBgTilemapBuffer
	cmp r6, 0x7
	beq _080BC7B2
	lsls r1, r6, 25
	movs r0, 0x80
	lsls r0, 19
	adds r1, r0
	lsrs r1, 24
	movs r0, 0x12
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
	b _080BC7B2
	.align 2, 0
_080BC7A0: .4byte gStringVar1
_080BC7A4: .4byte gUnknownText_Exit
_080BC7A8:
	movs r0, 0x1
	movs r1, 0xBC
	movs r2, 0x98
	bl sub_80F953C
_080BC7B2:
	mov r1, r8
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080BC7C4
	movs r0, 0
	bl SetBgTilemapBuffer
	b _080BC7CE
_080BC7C4:
	movs r0, 0
	movs r1, 0xBC
	movs r2, 0x8
	bl sub_80F953C
_080BC7CE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BC6B0

	thumb_func_start sub_80BC7D8
sub_80BC7D8: @ 80BC7D8
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080BC820 @ =gTasks + 0x8
	adds r4, r0
	movs r0, 0x11
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldrb r3, [r4, 0x6]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x2]
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x12
	movs r2, 0x2
	bl InitMenu
	adds r0, r5, 0
	bl sub_80BC6B0
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC820: .4byte gTasks + 0x8
	thumb_func_end sub_80BC7D8

	thumb_func_start sub_80BC824
sub_80BC824: @ 80BC824
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080BC858 @ =gTasks + 0x8
	adds r4, r0, r1
	ldr r2, _080BC85C @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080BC874
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080BC860
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080BC8B6
	.align 2, 0
_080BC858: .4byte gTasks + 0x8
_080BC85C: .4byte gMain
_080BC860:
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080BC940
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4, 0x4]
	subs r0, 0x1
	b _080BC8A4
_080BC874:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BC8C2
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080BC8AE
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _080BC940
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
_080BC8A4:
	strh r0, [r4, 0x4]
	adds r0, r5, 0
	bl sub_80BC6B0
	b _080BC940
_080BC8AE:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_080BC8B6:
	bl MoveMenuCursor
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x2]
	b _080BC940
_080BC8C2:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080BC91C
	movs r0, 0x5
	bl PlaySE
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080BC8FC
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl sub_80BCC54
	b _080BC940
_080BC8FC:
	bl sub_8072DEC
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x2]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BC948
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x8]
	adds r0, r5, 0
	bl sub_80BC980
	b _080BC940
_080BC91C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BC940
	movs r0, 0x5
	bl PlaySE
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	bl sub_80BCC54
_080BC940:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BC824

	thumb_func_start sub_80BC948
sub_80BC948: @ 80BC948
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r4, 0x1
_080BC952:
	adds r0, r4, 0
	bl sub_80BC268
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BC96E
	cmp r6, r5
	bne _080BC968
	adds r0, r4, 0
	b _080BC97A
_080BC968:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080BC96E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _080BC952
	movs r0, 0
_080BC97A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC948

	thumb_func_start sub_80BC980
sub_80BC980: @ 80BC980
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80F996C
	movs r0, 0x1
	bl sub_80F996C
	movs r0, 0x1
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x5
	bl MenuDrawTextWindow
	ldr r3, _080BC9D8 @ =gUnknown_083D13D4
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x2
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0xA
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x1
	movs r3, 0x2
	bl InitMenu
	ldr r1, _080BC9DC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BC9E0 @ =sub_80BC9E4
	str r1, [r0]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC9D8: .4byte gUnknown_083D13D4
_080BC9DC: .4byte gTasks
_080BC9E0: .4byte sub_80BC9E4
	thumb_func_end sub_80BC980

	thumb_func_start sub_80BC9E4
sub_80BC9E4: @ 80BC9E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _080BCA14 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080BCA18
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	beq _080BCA7C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _080BCA7C
	.align 2, 0
_080BCA14: .4byte gMain
_080BCA18:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BCA3A
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BCA7C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _080BCA7C
_080BCA3A:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080BCA68
	movs r0, 0x5
	bl PlaySE
	ldr r4, _080BCA64 @ =gUnknown_083D13D4
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 21
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _080BCA7C
	.align 2, 0
_080BCA64: .4byte gUnknown_083D13D4
_080BCA68:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BCA7C
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80BCBF8
_080BCA7C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80BC9E4

	thumb_func_start sub_80BCA84
sub_80BCA84: @ 80BCA84
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080BCAD8 @ =gTasks + 0x8
	adds r4, r0
	movs r0, 0
	bl SetBgTilemapBuffer
	movs r0, 0x1
	bl SetBgTilemapBuffer
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _080BCADC @ =gStringVar1
	ldrb r1, [r4, 0x8]
	bl sub_80BC190
	ldr r4, _080BCAE0 @ =gStringVar4
	ldr r1, _080BCAE4 @ =gOtherText_OkayToDeleteFromRegistry
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080BCAE8 @ =sub_80BCAEC
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCAD8: .4byte gTasks + 0x8
_080BCADC: .4byte gStringVar1
_080BCAE0: .4byte gStringVar4
_080BCAE4: .4byte gOtherText_OkayToDeleteFromRegistry
_080BCAE8: .4byte sub_80BCAEC
	thumb_func_end sub_80BCA84

	thumb_func_start sub_80BCAEC
sub_80BCAEC: @ 80BCAEC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _080BCB0C @ =gUnknown_083D13E4
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCB0C: .4byte gUnknown_083D13E4
	thumb_func_end sub_80BCAEC

	thumb_func_start sub_80BCB10
sub_80BCB10: @ 80BCB10
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _080BCB80 @ =gTasks + 0x8
	adds r4, r6, r7
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r2, _080BCB84 @ =gSaveBlock1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r2
	ldr r1, _080BCB88 @ =0x00001a09
	adds r0, r1
	ldrb r2, [r0]
	movs r1, 0x3F
	ands r1, r2
	strb r1, [r0]
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	ldrh r1, [r4, 0x4]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080BCB5C
	subs r0, r1, 0x1
	strh r0, [r4, 0x4]
_080BCB5C:
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bgt _080BCB6A
	ldrh r0, [r4, 0x6]
	subs r0, 0x1
	strh r0, [r4, 0x6]
_080BCB6A:
	adds r0, r5, 0
	bl sub_80BC7D8
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _080BCB8C @ =sub_80BC824
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCB80: .4byte gTasks + 0x8
_080BCB84: .4byte gSaveBlock1
_080BCB88: .4byte 0x00001a09
_080BCB8C: .4byte sub_80BC824
	thumb_func_end sub_80BCB10

	thumb_func_start sub_80BCB90
sub_80BCB90: @ 80BCB90
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r1, _080BCBB8 @ =gOtherText_RegisteredDataDeleted
	ldr r2, _080BCBBC @ =sub_80BCB10
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCBB8: .4byte gOtherText_RegisteredDataDeleted
_080BCBBC: .4byte sub_80BCB10
	thumb_func_end sub_80BCB90

	thumb_func_start sub_80BCBC0
sub_80BCBC0: @ 80BCBC0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_80BC7D8
	ldr r1, _080BCBF0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BCBF4 @ =sub_80BC824
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCBF0: .4byte gTasks
_080BCBF4: .4byte sub_80BC824
	thumb_func_end sub_80BCBC0

	thumb_func_start sub_80BCBF8
sub_80BCBF8: @ 80BCBF8
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r5, _080BCC4C @ =gTasks + 0x8
	adds r0, r4, r5
	ldrb r3, [r0, 0x6]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r0, 0x2]
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x12
	movs r2, 0x2
	bl InitMenu
	movs r0, 0x1
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x5
	bl MenuZeroFillWindowRect
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	subs r5, 0x8
	adds r4, r5
	ldr r0, _080BCC50 @ =sub_80BC824
	str r0, [r4]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCC4C: .4byte gTasks + 0x8
_080BCC50: .4byte sub_80BC824
	thumb_func_end sub_80BCBF8

	thumb_func_start sub_80BCC54
sub_80BCC54: @ 80BCC54
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080BCC84 @ =0x00004054
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl BuyMenuFreeMemory
	movs r0, 0
	bl SetBgTilemapBuffer
	movs r0, 0x1
	bl SetBgTilemapBuffer
	cmp r4, 0
	bne _080BCC8C
	ldr r0, _080BCC88 @ =gUnknown_0815F399
	bl ScriptContext1_SetupScript
	b _080BCC92
	.align 2, 0
_080BCC84: .4byte 0x00004054
_080BCC88: .4byte gUnknown_0815F399
_080BCC8C:
	ldr r0, _080BCCA0 @ =gUnknown_0815F49A
	bl ScriptContext1_SetupScript
_080BCC92:
	adds r0, r5, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCCA0: .4byte gUnknown_0815F49A
	thumb_func_end sub_80BCC54

	thumb_func_start sub_80BCCA4
sub_80BCCA4: @ 80BCCA4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080BCCDC @ =gSaveBlock1
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 5
	adds r4, r1
	ldr r1, _080BCCE0 @ =0x00001a11
	adds r0, r4, r1
	ldrb r0, [r0]
	movs r1, 0x5
	bl __umodsi3
	ldr r1, _080BCCE4 @ =0x00001a09
	adds r4, r1
	ldrb r2, [r4]
	lsls r2, 27
	lsrs r2, 31
	lsls r1, r2, 2
	adds r1, r2
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BCCDC: .4byte gSaveBlock1
_080BCCE0: .4byte 0x00001a11
_080BCCE4: .4byte 0x00001a09
	thumb_func_end sub_80BCCA4

	thumb_func_start sub_80BCCE8
sub_80BCCE8: @ 80BCCE8
	push {lr}
	ldr r0, _080BCD08 @ =0x00004054
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BCCA4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0
	bne _080BCD10
	ldr r0, _080BCD0C @ =UnknownString_81A1BB2
	b _080BCD72
	.align 2, 0
_080BCD08: .4byte 0x00004054
_080BCD0C: .4byte UnknownString_81A1BB2
_080BCD10:
	cmp r0, 0x1
	bne _080BCD1C
	ldr r0, _080BCD18 @ =UnknownString_81A1F67
	b _080BCD72
	.align 2, 0
_080BCD18: .4byte UnknownString_81A1F67
_080BCD1C:
	cmp r0, 0x2
	bne _080BCD28
	ldr r0, _080BCD24 @ =UnknownString_81A2254
	b _080BCD72
	.align 2, 0
_080BCD24: .4byte UnknownString_81A2254
_080BCD28:
	cmp r0, 0x3
	bne _080BCD34
	ldr r0, _080BCD30 @ =UnknownString_81A25C3
	b _080BCD72
	.align 2, 0
_080BCD30: .4byte UnknownString_81A25C3
_080BCD34:
	cmp r0, 0x4
	bne _080BCD40
	ldr r0, _080BCD3C @ =UnknownString_81A2925
	b _080BCD72
	.align 2, 0
_080BCD3C: .4byte UnknownString_81A2925
_080BCD40:
	cmp r0, 0x5
	bne _080BCD4C
	ldr r0, _080BCD48 @ =UnknownString_81A1D74
	b _080BCD72
	.align 2, 0
_080BCD48: .4byte UnknownString_81A1D74
_080BCD4C:
	cmp r0, 0x6
	bne _080BCD58
	ldr r0, _080BCD54 @ =UnknownString_81A20C9
	b _080BCD72
	.align 2, 0
_080BCD54: .4byte UnknownString_81A20C9
_080BCD58:
	cmp r0, 0x7
	bne _080BCD64
	ldr r0, _080BCD60 @ =UnknownString_81A2439
	b _080BCD72
	.align 2, 0
_080BCD60: .4byte UnknownString_81A2439
_080BCD64:
	cmp r1, 0x8
	beq _080BCD70
	ldr r0, _080BCD6C @ =UnknownString_81A2B2A
	b _080BCD72
	.align 2, 0
_080BCD6C: .4byte UnknownString_81A2B2A
_080BCD70:
	ldr r0, _080BCD78 @ =UnknownString_81A2754
_080BCD72:
	pop {r1}
	bx r1
	.align 2, 0
_080BCD78: .4byte UnknownString_81A2754
	thumb_func_end sub_80BCCE8

	thumb_func_start unref_sub_80BCD7C
unref_sub_80BCD7C: @ 80BCD7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	ldr r7, _080BCDFC @ =gSaveBlock1
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 5
	ldr r0, _080BCE00 @ =0x00001a3c
	adds r0, r7
	mov r10, r0
	ldr r1, _080BCE04 @ =0x00001a54
	adds r1, r7
	mov r9, r1
	ldr r2, _080BCE08 @ =0x00001a84
	adds r2, r7
	mov r8, r2
	ldr r0, _080BCE0C @ =0x00000115
	mov r12, r0
_080BCDAA:
	lsls r4, r5, 2
	adds r0, r4, r6
	add r0, r10
	adds r3, r5, 0x1
	str r3, [r0]
	lsls r0, r5, 3
	adds r0, r6
	add r0, r9
	strh r3, [r0]
	lsls r1, r5, 1
	adds r1, r6
	mov r2, r8
	adds r0, r1, r2
	mov r2, r12
	strh r2, [r0]
	ldr r2, _080BCE10 @ =0x00001a90
	adds r0, r7, r2
	adds r1, r0
	strh r3, [r1]
	adds r2, r5, r6
	ldr r1, _080BCE14 @ =0x00001a9c
	adds r0, r7, r1
	adds r0, r2, r0
	adds r1, r5, 0x5
	strb r1, [r0]
	ldr r1, _080BCE18 @ =0x00001aa2
	adds r0, r7, r1
	adds r2, r0
	adds r4, r5
	strb r4, [r2]
	lsls r3, 16
	lsrs r5, r3, 16
	cmp r5, 0
	beq _080BCDAA
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCDFC: .4byte gSaveBlock1
_080BCE00: .4byte 0x00001a3c
_080BCE04: .4byte 0x00001a54
_080BCE08: .4byte 0x00001a84
_080BCE0C: .4byte 0x00000115
_080BCE10: .4byte 0x00001a90
_080BCE14: .4byte 0x00001a9c
_080BCE18: .4byte 0x00001aa2
	thumb_func_end unref_sub_80BCD7C

	thumb_func_start sub_80BCE1C
sub_80BCE1C: @ 80BCE1C
	push {r4,lr}
	ldr r0, _080BCE44 @ =0x00004054
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x1
	bl sub_810FB10
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 5
	ldr r1, _080BCE48 @ =gSaveBlock1 + 0x1A08
	adds r0, r1
	bl CreateSecretBaseEnemyParty
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCE44: .4byte 0x00004054
_080BCE48: .4byte gSaveBlock1 + 0x1A08
	thumb_func_end sub_80BCE1C

	thumb_func_start sub_80BCE4C
sub_80BCE4C: @ 80BCE4C
	push {lr}
	ldr r0, _080BCE80 @ =0x00004054
	bl VarGet
	ldr r2, _080BCE84 @ =gSaveBlock1
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r2
	ldr r0, _080BCE88 @ =gScriptResult
	ldrb r0, [r0]
	ldr r2, _080BCE8C @ =0x00001a09
	adds r1, r2
	movs r2, 0x1
	ands r2, r0
	lsls r2, 5
	ldrb r3, [r1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080BCE80: .4byte 0x00004054
_080BCE84: .4byte gSaveBlock1
_080BCE88: .4byte gScriptResult
_080BCE8C: .4byte 0x00001a09
	thumb_func_end sub_80BCE4C

	thumb_func_start sub_80BCE90
sub_80BCE90: @ 80BCE90
	push {r4-r7,lr}
	ldr r0, _080BCF04 @ =0x00004054
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080BCF08 @ =0x000008c2
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080BCED4
	movs r3, 0
	ldr r7, _080BCF0C @ =gSaveBlock1
	ldr r4, _080BCF10 @ =0x00001a09
	movs r6, 0x21
	negs r6, r6
_080BCEB2:
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 5
	adds r1, r7
	adds r1, r4
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x13
	bls _080BCEB2
	ldr r0, _080BCF08 @ =0x000008c2
	bl FlagSet
_080BCED4:
	ldr r4, _080BCF14 @ =gUnknown_0202E8CC
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80BCCA4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldr r2, _080BCF18 @ =gScriptResult
	ldr r1, _080BCF0C @ =gSaveBlock1
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	adds r0, r1
	ldr r1, _080BCF10 @ =0x00001a09
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 26
	lsrs r0, 31
	strh r0, [r2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCF04: .4byte 0x00004054
_080BCF08: .4byte 0x000008c2
_080BCF0C: .4byte gSaveBlock1
_080BCF10: .4byte 0x00001a09
_080BCF14: .4byte gUnknown_0202E8CC
_080BCF18: .4byte gScriptResult
	thumb_func_end sub_80BCE90

	thumb_func_start sub_80BCF1C
sub_80BCF1C: @ 80BCF1C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080BCF40 @ =gTasks + 0x8
	adds r4, r1, r0
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080BCF54
	cmp r0, 0x1
	bgt _080BCF44
	cmp r0, 0
	beq _080BCF4A
	b _080BD02C
	.align 2, 0
_080BCF40: .4byte gTasks + 0x8
_080BCF44:
	cmp r0, 0x2
	beq _080BD01C
	b _080BD02C
_080BCF4A:
	adds r0, r4, 0x4
	adds r1, r4, 0x6
	bl PlayerGetDestCoords
	b _080BD028
_080BCF54:
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080BCF7C
	movs r0, 0
	ldrsh r1, [r5, r0]
	movs r3, 0x6
	ldrsh r0, [r4, r3]
	cmp r1, r0
	beq _080BD02C
_080BCF7C:
	strh r2, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8057350
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BCFA8
	bl sub_80C6C90
	b _080BD02C
_080BCFA8:
	adds r0, r4, 0
	bl sub_8057314
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BCFD8
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	asrs r0, 16
	mov r1, sp
	movs r3, 0
	ldrsh r1, [r1, r3]
	movs r3, 0
	ldrsh r2, [r5, r3]
	bl sub_80C68A4
	b _080BD02C
_080BCFD8:
	adds r0, r4, 0
	bl sub_8057328
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BCFF6
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl sub_80C6A54
	b _080BD02C
_080BCFF6:
	adds r0, r4, 0
	bl sub_805733C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD02C
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	asrs r0, 16
	bl sub_80C6C30
	b _080BD02C
_080BD01C:
	ldrb r0, [r4, 0x8]
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080BD02C
_080BD028:
	movs r0, 0x1
	strh r0, [r4, 0x2]
_080BD02C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80BCF1C

	thumb_func_start sub_80BD034
sub_80BD034: @ 80BD034
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BD064 @ =gSaveBlock1
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 5
	adds r4, r2
	ldr r2, _080BD068 @ =0x00001a08
	adds r0, r4, r2
	movs r2, 0xA0
	bl memcpy
	ldr r0, _080BD06C @ =0x00001a09
	adds r4, r0
	ldrb r1, [r4]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD064: .4byte gSaveBlock1
_080BD068: .4byte 0x00001a08
_080BD06C: .4byte 0x00001a09
	thumb_func_end sub_80BD034

	thumb_func_start sub_80BD070
sub_80BD070: @ 80BD070
	push {r4,lr}
	movs r2, 0
	adds r4, r0, 0
	adds r4, 0x9
	adds r3, r1, 0
	adds r3, 0x9
_080BD07C:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080BD08C
	movs r0, 0
	b _080BD098
_080BD08C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080BD07C
	movs r0, 0x1
_080BD098:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD070

	thumb_func_start sub_80BD0A0
sub_80BD0A0: @ 80BD0A0
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r3, 0
	ldrb r0, [r6, 0x2]
	cmp r0, 0xFF
	bne _080BD0B4
	ldrb r0, [r5, 0x2]
	cmp r0, 0xFF
	beq _080BD0E2
_080BD0B4:
	adds r2, r6, 0x2
	adds r0, r2, r3
	adds r4, r5, 0x2
	adds r1, r4, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080BD0C8
	movs r0, 0
	b _080BD0E4
_080BD0C8:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x6
	bhi _080BD0E2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD0B4
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD0B4
_080BD0E2:
	movs r0, 0x1
_080BD0E4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD0A0

	thumb_func_start sub_80BD0EC
sub_80BD0EC: @ 80BD0EC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r2, [r4, 0x1]
	movs r0, 0x10
	adds r1, r0, 0
	ands r1, r2
	ldrb r2, [r5, 0x1]
	ands r0, r2
	cmp r1, r0
	bne _080BD122
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80BD070
	lsls r0, 24
	cmp r0, 0
	beq _080BD122
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80BD0A0
	lsls r0, 24
	cmp r0, 0
	beq _080BD122
	movs r0, 0x1
	b _080BD124
_080BD122:
	movs r0, 0
_080BD124:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD0EC

	thumb_func_start sub_80BD12C
sub_80BD12C: @ 80BD12C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r4, _080BD150 @ =gSaveBlock1
	ldr r3, _080BD154 @ =0x00001a08
_080BD138:
	lsls r0, r1, 16
	asrs r1, r0, 16
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r4
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _080BD158
	adds r0, r1, 0
	b _080BD168
	.align 2, 0
_080BD150: .4byte gSaveBlock1
_080BD154: .4byte 0x00001a08
_080BD158:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BD138
	movs r0, 0x1
	negs r0, r0
_080BD168:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD12C

	thumb_func_start sub_80BD170
sub_80BD170: @ 80BD170
	push {r4,lr}
	movs r2, 0x1
	ldr r4, _080BD194 @ =gSaveBlock1
	ldr r3, _080BD198 @ =0x00001a08
_080BD178:
	lsls r0, r2, 16
	asrs r1, r0, 16
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r4
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BD19C
	lsls r0, r2, 24
	lsrs r0, 24
	b _080BD1AA
	.align 2, 0
_080BD194: .4byte gSaveBlock1
_080BD198: .4byte 0x00001a08
_080BD19C:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BD178
	movs r0, 0
_080BD1AA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD170

	thumb_func_start sub_80BD1B0
sub_80BD1B0: @ 80BD1B0
	push {r4,lr}
	movs r3, 0x1
	ldr r4, _080BD1DC @ =gSaveBlock1
_080BD1B6:
	lsls r2, r3, 16
	asrs r1, r2, 16
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r4
	ldr r1, _080BD1E0 @ =0x00001a09
	adds r0, r1
	ldrb r1, [r0]
	lsrs r0, r1, 6
	cmp r0, 0
	bne _080BD1E4
	lsls r0, r1, 28
	cmp r0, 0
	bne _080BD1E4
	lsls r0, r3, 24
	lsrs r0, 24
	b _080BD1F4
	.align 2, 0
_080BD1DC: .4byte gSaveBlock1
_080BD1E0: .4byte 0x00001a09
_080BD1E4:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r2, r1
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BD1B6
	movs r0, 0
_080BD1F4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD1B0

	thumb_func_start sub_80BD1FC
sub_80BD1FC: @ 80BD1FC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r0, 0
	beq _080BD278
	ldrb r0, [r5]
	bl sub_80BD12C
	lsls r0, 16
	lsrs r4, r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	beq _080BD278
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _080BD254
	ldr r0, _080BD24C @ =gSaveBlock1
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 5
	adds r1, r0
	ldr r0, _080BD250 @ =0x00001a09
	adds r1, r0
	ldrb r1, [r1]
	lsls r0, r1, 28
	lsrs r0, 28
	cmp r0, 0x1
	beq _080BD278
	lsrs r0, r1, 6
	cmp r0, 0x2
	bne _080BD246
	ldrb r1, [r5, 0x1]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _080BD278
_080BD246:
	lsls r4, 24
	lsrs r4, 24
	b _080BD26C
	.align 2, 0
_080BD24C: .4byte gSaveBlock1
_080BD250: .4byte 0x00001a09
_080BD254:
	bl sub_80BD170
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080BD26C
	bl sub_80BD1B0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080BD278
_080BD26C:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80BD034
	adds r0, r4, 0
	b _080BD27A
_080BD278:
	movs r0, 0
_080BD27A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD1FC

	thumb_func_start sub_80BD280
sub_80BD280: @ 80BD280
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xA0
	ldr r0, _080BD324 @ =gSaveBlock1 + 0x1A08
	mov r8, r0
	movs r2, 0x1
_080BD290:
	adds r1, r2, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	mov r9, r1
	cmp r5, 0x13
	bhi _080BD30C
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 5
	mov r1, r8
	adds r6, r0, r1
	movs r7, 0xC0
_080BD2A8:
	ldrb r0, [r6, 0x1]
	adds r3, r7, 0
	ands r3, r0
	cmp r3, 0
	bne _080BD2C6
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 5
	add r0, r8
	ldrb r1, [r0, 0x1]
	adds r0, r7, 0
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0x40
	beq _080BD2DE
_080BD2C6:
	cmp r3, 0x80
	bne _080BD302
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 5
	add r0, r8
	ldrb r1, [r0, 0x1]
	adds r0, r7, 0
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0x80
	beq _080BD302
_080BD2DE:
	mov r0, sp
	adds r1, r6, 0
	movs r2, 0xA0
	bl memcpy
	adds r4, r5
	lsls r4, 5
	add r4, r8
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0xA0
	bl memcpy
	adds r0, r4, 0
	mov r1, sp
	movs r2, 0xA0
	bl memcpy
_080BD302:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD2A8
_080BD30C:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bls _080BD290
	add sp, 0xA0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD324: .4byte gSaveBlock1 + 0x1A08
	thumb_func_end sub_80BD280

	thumb_func_start sub_80BD328
sub_80BD328: @ 80BD328
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	movs r4, 0x1
_080BD332:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 5
	adds r1, r0, r6
	ldrb r0, [r1, 0x1]
	lsrs r0, 6
	cmp r0, r5
	bne _080BD348
	adds r0, r1, 0
	bl sub_80BD1FC
_080BD348:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _080BD332
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD328

	thumb_func_start sub_80BD358
sub_80BD358: @ 80BD358
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r0, 0
	beq _080BD372
	ldrb r0, [r5, 0x1]
	lsls r0, 27
	ldr r1, _080BD378 @ =gSaveBlock2
	lsrs r0, 31
	adds r4, r1, 0
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	beq _080BD37C
_080BD372:
	movs r0, 0
	b _080BD3D4
	.align 2, 0
_080BD378: .4byte gSaveBlock2
_080BD37C:
	movs r2, 0
	adds r3, r5, 0
	adds r3, 0x9
	adds r6, r4, 0
	adds r6, 0xA
_080BD386:
	adds r0, r3, r2
	adds r1, r2, r6
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BD372
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080BD386
	movs r2, 0
	ldrb r0, [r5, 0x2]
	cmp r0, 0xFF
	bne _080BD3AA
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080BD3D2
_080BD3AA:
	adds r3, r5, 0x2
	adds r0, r3, r2
	adds r1, r2, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BD372
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x6
	bhi _080BD3D2
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD3AA
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD3AA
_080BD3D2:
	movs r0, 0x1
_080BD3D4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD358

	thumb_func_start sub_80BD3DC
sub_80BD3DC: @ 80BD3DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	mov r9, r1
	mov r8, r2
	movs r5, 0
	movs r6, 0
_080BD3F0:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	bne _080BD41A
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 5
	mov r1, r10
	adds r4, r1, r0
	adds r0, r4, 0
	bl sub_80BD358
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD41A
	adds r0, r4, 0
	bl sub_80BB4AC
	movs r0, 0x1
	orrs r5, r0
_080BD41A:
	movs r7, 0x2
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	bne _080BD448
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 5
	mov r1, r9
	adds r4, r1, r0
	adds r0, r4, 0
	bl sub_80BD358
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD448
	adds r0, r4, 0
	bl sub_80BB4AC
	orrs r5, r7
	lsls r0, r5, 24
	lsrs r5, r0, 24
_080BD448:
	movs r7, 0x4
	movs r0, 0x4
	ands r0, r5
	cmp r0, 0
	bne _080BD476
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	bl sub_80BD358
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD476
	adds r0, r4, 0
	bl sub_80BB4AC
	orrs r5, r7
	lsls r0, r5, 24
	lsrs r5, r0, 24
_080BD476:
	cmp r5, 0x7
	beq _080BD484
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x13
	bls _080BD3F0
_080BD484:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD3DC

	thumb_func_start sub_80BD494
sub_80BD494: @ 80BD494
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	movs r5, 0
_080BD4A4:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	mov r1, r8
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080BD4FE
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_80BD0EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD4FE
	cmp r7, 0
	bne _080BD4D0
	adds r0, r4, 0
	bl sub_80BB4AC
	b _080BD508
_080BD4D0:
	ldrh r0, [r6, 0xE]
	ldrh r3, [r4, 0xE]
	cmp r0, r3
	bls _080BD4E0
	adds r0, r4, 0
	bl sub_80BB4AC
	b _080BD508
_080BD4E0:
	ldrb r0, [r6, 0x1]
	lsls r0, 28
	lsrs r0, 28
	ldrb r1, [r4, 0x1]
	movs r3, 0x10
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x1]
	adds r0, r6, 0
	bl sub_80BB4AC
	movs r0, 0x1
	b _080BD50A
_080BD4FE:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD4A4
_080BD508:
	movs r0, 0
_080BD50A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD494

	thumb_func_start sub_80BD514
sub_80BD514: @ 80BD514
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	adds r7, r1, 0
	mov r8, r2
	adds r6, r3, 0
	movs r5, 0x1
_080BD526:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	mov r1, r9
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080BD578
	ldrb r1, [r4, 0x1]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x40
	bne _080BD54E
	movs r2, 0x10
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
_080BD54E:
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r5, 0
	bl sub_80BD494
	lsls r0, 24
	cmp r0, 0
	bne _080BD578
	adds r0, r4, 0
	mov r1, r8
	adds r2, r5, 0
	bl sub_80BD494
	lsls r0, 24
	cmp r0, 0
	bne _080BD578
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80BD494
_080BD578:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD526
	movs r5, 0
_080BD584:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	adds r4, r0, r7
	ldrb r0, [r4]
	cmp r0, 0
	beq _080BD5B8
	ldrb r0, [r4, 0x1]
	movs r2, 0x21
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	mov r1, r8
	adds r2, r5, 0
	bl sub_80BD494
	lsls r0, 24
	cmp r0, 0
	bne _080BD5B8
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80BD494
_080BD5B8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD584
	movs r5, 0
	movs r0, 0x21
	negs r0, r0
	adds r7, r0, 0
_080BD5CA:
	lsls r0, r5, 2
	adds r0, r5
	lsls r4, r0, 5
	mov r2, r8
	adds r1, r4, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _080BD5EA
	ldrb r0, [r1, 0x1]
	ands r0, r7
	strb r0, [r1, 0x1]
	adds r0, r1, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80BD494
_080BD5EA:
	adds r1, r4, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _080BD5F8
	ldrb r0, [r1, 0x1]
	ands r0, r7
	strb r0, [r1, 0x1]
_080BD5F8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD5CA
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD514

	thumb_func_start sub_80BD610
sub_80BD610: @ 80BD610
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl sub_80BD3DC
	ldr r0, _080BD670 @ =gSaveBlock1 + 0x1A08
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_80BD514
	adds r0, r4, 0
	bl sub_80BD1FC
	adds r0, r5, 0
	bl sub_80BD1FC
	adds r0, r6, 0
	bl sub_80BD1FC
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80BD328
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80BD328
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_80BD328
	adds r0, r4, 0
	movs r1, 0
	bl sub_80BD328
	adds r0, r5, 0
	movs r1, 0
	bl sub_80BD328
	adds r0, r6, 0
	movs r1, 0
	bl sub_80BD328
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BD670: .4byte gSaveBlock1 + 0x1A08
	thumb_func_end sub_80BD610

	thumb_func_start sub_80BD674
sub_80BD674: @ 80BD674
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r7, r2, 24
	movs r0, 0x60
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080BD68C
	b _080BD790
_080BD68C:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080BD69E
	cmp r0, 0x3
	beq _080BD6BA
	b _080BD6C8
_080BD69E:
	lsls r4, r5, 1
	adds r0, r6, r4
	movs r1, 0
	adds r2, r5, 0
	bl memset
	adds r4, r5
	adds r4, r6, r4
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	b _080BD6C8
_080BD6BA:
	lsls r0, r5, 1
	adds r0, r5
	adds r0, r6, r0
	movs r1, 0
	adds r2, r5, 0
	bl memset
_080BD6C8:
	cmp r7, 0x1
	beq _080BD6F0
	cmp r7, 0x1
	bgt _080BD6D6
	cmp r7, 0
	beq _080BD6E0
	b _080BD71C
_080BD6D6:
	cmp r7, 0x2
	beq _080BD700
	cmp r7, 0x3
	beq _080BD710
	b _080BD71C
_080BD6E0:
	adds r0, r6, r5
	lsls r2, r5, 1
	adds r1, r6, r2
	adds r2, r5
	adds r2, r6, r2
	bl sub_80BD610
	b _080BD71C
_080BD6F0:
	lsls r1, r5, 1
	adds r0, r6, r1
	adds r1, r5
	adds r1, r6, r1
	adds r2, r6, 0
	bl sub_80BD610
	b _080BD71C
_080BD700:
	lsls r0, r5, 1
	adds r0, r5
	adds r0, r6, r0
	adds r2, r6, r5
	adds r1, r6, 0
	bl sub_80BD610
	b _080BD71C
_080BD710:
	adds r1, r6, r5
	lsls r2, r5, 1
	adds r2, r6, r2
	adds r0, r6, 0
	bl sub_80BD610
_080BD71C:
	movs r3, 0x1
	ldr r6, _080BD798 @ =gSaveBlock1
	movs r5, 0x10
	negs r5, r5
	ldr r4, _080BD79C @ =0x00001a09
_080BD726:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 5
	adds r0, r6
	adds r2, r0, r4
	ldrb r1, [r2]
	lsls r0, r1, 28
	lsrs r0, 28
	cmp r0, 0x1
	bne _080BD746
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	ands r0, r5
	strb r0, [r2]
_080BD746:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x13
	bls _080BD726
	bl sub_80BD280
	movs r3, 0x1
	ldr r4, _080BD798 @ =gSaveBlock1
	ldr r6, _080BD79C @ =0x00001a09
	adds r7, r4, 0
	movs r5, 0x3F
_080BD75E:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 5
	adds r0, r4
	adds r2, r0, r6
	ldrb r1, [r2]
	lsrs r0, r1, 6
	cmp r0, 0x2
	bne _080BD776
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r2]
_080BD776:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x13
	bls _080BD75E
	ldr r0, _080BD7A0 @ =0x00001a16
	adds r2, r7, r0
	ldrh r1, [r2]
	ldr r0, _080BD7A4 @ =0x0000ffff
	cmp r1, r0
	beq _080BD790
	adds r0, r1, 0x1
	strh r0, [r2]
_080BD790:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD798: .4byte gSaveBlock1
_080BD79C: .4byte 0x00001a09
_080BD7A0: .4byte 0x00001a16
_080BD7A4: .4byte 0x0000ffff
	thumb_func_end sub_80BD674

	thumb_func_start sub_80BD7A8
sub_80BD7A8: @ 80BD7A8
	push {r4-r7,lr}
	movs r3, 0
	ldr r6, _080BD7F0 @ =gSaveBlock1
	movs r4, 0
	ldr r0, _080BD7F4 @ =0x0000273a
	adds r5, r6, r0
_080BD7B4:
	lsls r2, r3, 3
	adds r2, r3
	lsls r2, 2
	adds r1, r2, r6
	ldr r7, _080BD7F8 @ =0x00002738
	adds r0, r1, r7
	strb r4, [r0]
	ldr r0, _080BD7FC @ =0x00002739
	adds r1, r0
	strb r4, [r1]
	movs r1, 0
	adds r3, 0x1
_080BD7CC:
	adds r0, r1, r2
	adds r0, r5
	strb r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x21
	bls _080BD7CC
	lsls r0, r3, 24
	lsrs r3, r0, 24
	cmp r3, 0x18
	bls _080BD7B4
	bl sub_80BEBF4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD7F0: .4byte gSaveBlock1
_080BD7F4: .4byte 0x0000273a
_080BD7F8: .4byte 0x00002738
_080BD7FC: .4byte 0x00002739
	thumb_func_end sub_80BD7A8

	thumb_func_start special_0x44
special_0x44: @ 80BD800
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r4, 0x5
	ldr r1, _080BD874 @ =gSaveBlock1
	ldr r2, _080BD878 @ =0x000027ec
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BD834
	adds r2, r1, 0
	ldr r1, _080BD87C @ =0x00002738
_080BD81A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x17
	bhi _080BD834
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BD81A
_080BD834:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	ldr r7, _080BD874 @ =gSaveBlock1
	ldr r0, _080BD87C @ =0x00002738
	adds r0, r7
	mov r9, r0
_080BD850:
	lsls r0, r4, 3
	adds r0, r4
	lsls r6, r0, 2
	adds r5, r6, r7
	ldr r1, _080BD87C @ =0x00002738
	adds r0, r5, r1
	ldrb r0, [r0]
	bl sub_80BFB54
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _080BD884
	ldr r2, _080BD880 @ =0x00002739
	adds r0, r5, r2
	ldrb r0, [r0]
	b _080BD890
	.align 2, 0
_080BD874: .4byte gSaveBlock1
_080BD878: .4byte 0x000027ec
_080BD87C: .4byte 0x00002738
_080BD880: .4byte 0x00002739
_080BD884:
	mov r0, r9
	adds r1, r6, r0
	ldrh r0, [r1, 0x16]
	cmp r0, 0
	bne _080BD898
	ldrb r0, [r1, 0x1]
_080BD890:
	cmp r0, 0x1
	bne _080BD898
	adds r0, r4, 0
	b _080BD8AC
_080BD898:
	cmp r4, 0
	bne _080BD8A0
	movs r4, 0x17
	b _080BD8A6
_080BD8A0:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080BD8A6:
	cmp r4, r8
	bne _080BD850
	movs r0, 0xFF
_080BD8AC:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end special_0x44

	thumb_func_start sub_80BD8B8
sub_80BD8B8: @ 80BD8B8
	push {lr}
	bl special_0x44
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	bne _080BD8CA
	movs r0, 0xFF
	b _080BD902
_080BD8CA:
	ldr r2, _080BD8F4 @ =gSaveBlock1
	ldr r3, _080BD8F8 @ =0x00002afc
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _080BD900
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r2, _080BD8FC @ =0x00002738
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x29
	bne _080BD900
	bl sub_80BDA30
	lsls r0, 24
	lsrs r0, 24
	b _080BD902
	.align 2, 0
_080BD8F4: .4byte gSaveBlock1
_080BD8F8: .4byte 0x00002afc
_080BD8FC: .4byte 0x00002738
_080BD900:
	adds r0, r1, 0
_080BD902:
	pop {r1}
	bx r1
	thumb_func_end sub_80BD8B8

	thumb_func_start UpdateTVScreensOnMap
UpdateTVScreensOnMap: @ 80BD908
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _080BD938 @ =0x00000831
	bl FlagSet
	bl CheckForBigMovieOrEmergencyNewsOnTV
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BD92C
	cmp r0, 0x2
	beq _080BD97E
	ldr r0, _080BD93C @ =gSaveBlock1
	ldrh r0, [r0, 0x4]
	cmp r0, 0xD
	bne _080BD940
_080BD92C:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl SetTVMetatilesOnMap
	b _080BD97E
	.align 2, 0
_080BD938: .4byte 0x00000831
_080BD93C: .4byte gSaveBlock1
_080BD940:
	ldr r0, _080BD984 @ =0x00000832
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080BD97E
	bl sub_80BD8B8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080BD96E
	bl sub_80BECA0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080BD96E
	bl IsTVShowInSearchOfTrainersAiring
	lsls r0, 24
	cmp r0, 0
	beq _080BD97E
_080BD96E:
	ldr r0, _080BD988 @ =0x00000831
	bl FlagReset
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl SetTVMetatilesOnMap
_080BD97E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD984: .4byte 0x00000832
_080BD988: .4byte 0x00000831
	thumb_func_end UpdateTVScreensOnMap

	thumb_func_start SetTVMetatilesOnMap
SetTVMetatilesOnMap: @ 80BD98C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	movs r5, 0
	cmp r5, r10
	bge _080BD9E0
	movs r1, 0xC0
	lsls r1, 4
	adds r0, r1, 0
	mov r8, r2
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_080BD9B2:
	movs r4, 0
	adds r7, r5, 0x1
	cmp r4, r9
	bge _080BD9DA
	mov r0, r8
	lsls r6, r0, 16
_080BD9BE:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	cmp r0, 0x86
	bne _080BD9D4
	adds r0, r4, 0
	adds r1, r5, 0
	lsrs r2, r6, 16
	bl MapGridSetMetatileIdAt
_080BD9D4:
	adds r4, 0x1
	cmp r4, r9
	blt _080BD9BE
_080BD9DA:
	adds r5, r7, 0
	cmp r5, r10
	blt _080BD9B2
_080BD9E0:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SetTVMetatilesOnMap

	thumb_func_start TurnOffTVScreen
TurnOffTVScreen: @ 80BD9F0
	push {lr}
	ldr r1, _080BDA08 @ =gUnknown_03004870
	ldr r0, [r1]
	ldr r1, [r1, 0x4]
	movs r2, 0x2
	bl SetTVMetatilesOnMap
	bl DrawWholeMapView
	pop {r0}
	bx r0
	.align 2, 0
_080BDA08: .4byte gUnknown_03004870
	thumb_func_end TurnOffTVScreen

	thumb_func_start sub_80BDA0C
sub_80BDA0C: @ 80BDA0C
	ldr r2, _080BDA24 @ =gSaveBlock1
	ldr r0, _080BDA28 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080BDA2C @ =0x00002738
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080BDA24: .4byte gSaveBlock1
_080BDA28: .4byte gUnknown_0202E8CC
_080BDA2C: .4byte 0x00002738
	thumb_func_end sub_80BDA0C

	thumb_func_start sub_80BDA30
sub_80BDA30: @ 80BDA30
	push {r4,lr}
	movs r2, 0
	ldr r3, _080BDA5C @ =gSaveBlock1
_080BDA36:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r3
	ldr r4, _080BDA60 @ =0x00002738
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BDA64
	cmp r0, 0x29
	beq _080BDA64
	adds r4, 0x1
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080BDA64
	adds r0, r2, 0
	b _080BDA70
	.align 2, 0
_080BDA5C: .4byte gSaveBlock1
_080BDA60: .4byte 0x00002738
_080BDA64:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x17
	bls _080BDA36
	movs r0, 0xFF
_080BDA70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BDA30

	thumb_func_start special_0x4a
special_0x4a: @ 80BDA78
	push {lr}
	ldr r2, _080BDAA4 @ =gUnknown_0202E8CC
	ldrh r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BDAA8 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x29
	bne _080BDAAC
	movs r3, 0xF1
	lsls r3, 2
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _080BDAAC
	bl sub_80BDA30
	lsls r0, 24
	lsrs r0, 24
	b _080BDAAE
	.align 2, 0
_080BDAA4: .4byte gUnknown_0202E8CC
_080BDAA8: .4byte gSaveBlock1 + 0x2738
_080BDAAC:
	ldrb r0, [r2]
_080BDAAE:
	pop {r1}
	bx r1
	thumb_func_end special_0x4a

	thumb_func_start sub_80BDAB4
sub_80BDAB4: @ 80BDAB4
	push {r4,lr}
	ldr r2, _080BDAF8 @ =gSaveBlock1
	ldr r1, _080BDAFC @ =0x00002b10
	adds r0, r2, r1
	movs r3, 0
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080BDB00 @ =0x00002b12
	adds r0, r2, r4
	strh r1, [r0]
	adds r4, 0x2
	adds r0, r2, r4
	strh r1, [r0]
	ldr r0, _080BDB04 @ =0x00002b16
	adds r1, r2, r0
	ldr r0, _080BDB08 @ =0x0000ffff
	strh r0, [r1]
	adds r4, 0x6
	adds r1, r2, r4
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080BDB0C @ =0x00002b1b
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080BDB10 @ =0x00002b18
	adds r0, r2, r1
	strb r3, [r0]
	subs r4, 0x1
	adds r2, r4
	strb r3, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BDAF8: .4byte gSaveBlock1
_080BDAFC: .4byte 0x00002b10
_080BDB00: .4byte 0x00002b12
_080BDB04: .4byte 0x00002b16
_080BDB08: .4byte 0x0000ffff
_080BDB0C: .4byte 0x00002b1b
_080BDB10: .4byte 0x00002b18
	thumb_func_end sub_80BDAB4

	thumb_func_start GabbyAndTyBeforeInterview
GabbyAndTyBeforeInterview: @ 80BDB14
	push {r4,r5,lr}
	ldr r2, _080BDB68 @ =gSaveBlock1
	ldr r3, _080BDB6C @ =gUnknown_030042E0
	ldrh r1, [r3, 0x6]
	ldr r4, _080BDB70 @ =0x00002b10
	adds r0, r2, r4
	strh r1, [r0]
	ldrh r1, [r3, 0x26]
	adds r4, 0x2
	adds r0, r2, r4
	strh r1, [r0]
	ldrh r1, [r3, 0x22]
	adds r4, 0x2
	adds r0, r2, r4
	strh r1, [r0]
	ldr r0, _080BDB74 @ =0x00002b19
	adds r4, r2, r0
	ldrb r1, [r4]
	adds r0, r1, 0
	adds r5, r2, 0
	cmp r0, 0xFF
	beq _080BDB44
	adds r0, r1, 0x1
	strb r0, [r4]
_080BDB44:
	ldrb r0, [r3, 0x5]
	lsls r0, 31
	ldr r1, _080BDB78 @ =0x00002b1a
	adds r4, r5, r1
	lsrs r0, 31
	ldrb r1, [r4]
	movs r2, 0x2
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r4]
	ldrb r0, [r3]
	cmp r0, 0
	beq _080BDB7C
	movs r0, 0x2
	orrs r2, r0
	b _080BDB82
	.align 2, 0
_080BDB68: .4byte gSaveBlock1
_080BDB6C: .4byte gUnknown_030042E0
_080BDB70: .4byte 0x00002b10
_080BDB74: .4byte 0x00002b19
_080BDB78: .4byte 0x00002b1a
_080BDB7C:
	movs r0, 0x3
	negs r0, r0
	ands r2, r0
_080BDB82:
	strb r2, [r4]
	ldrb r0, [r3, 0x3]
	cmp r0, 0
	beq _080BDB9C
	ldr r4, _080BDB98 @ =0x00002b1a
	adds r0, r5, r4
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _080BDBAA
	.align 2, 0
_080BDB98: .4byte 0x00002b1a
_080BDB9C:
	ldr r0, _080BDBDC @ =0x00002b1a
	adds r2, r5, r0
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080BDBAA:
	ldrb r1, [r3, 0x5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080BDBE0
	movs r1, 0
	adds r0, r3, 0
	adds r0, 0x36
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BDBE0
_080BDBC0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xA
	bhi _080BDBEC
	adds r0, r3, 0
	adds r0, 0x36
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BDBC0
	ldr r4, _080BDBDC @ =0x00002b1a
	adds r0, r5, r4
	b _080BDBE4
	.align 2, 0
_080BDBDC: .4byte 0x00002b1a
_080BDBE0:
	ldr r1, _080BDC08 @ =0x00002b1a
	adds r0, r5, r1
_080BDBE4:
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
_080BDBEC:
	bl TakeTVShowInSearchOfTrainersOffTheAir
	ldr r0, _080BDC0C @ =gSaveBlock1
	ldr r4, _080BDC10 @ =0x00002b14
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BDC02
	movs r0, 0x1
	bl FlagSet
_080BDC02:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BDC08: .4byte 0x00002b1a
_080BDC0C: .4byte gSaveBlock1
_080BDC10: .4byte 0x00002b14
	thumb_func_end GabbyAndTyBeforeInterview

	thumb_func_start sub_80BDC14
sub_80BDC14: @ 80BDC14
	push {r4-r6,lr}
	ldr r4, _080BDC70 @ =gSaveBlock1
	ldr r0, _080BDC74 @ =0x00002b1a
	adds r6, r4, r0
	ldrb r3, [r6]
	lsls r1, r3, 31
	adds r0, 0x1
	adds r5, r4, r0
	lsrs r1, 31
	ldrb r2, [r5]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	movs r1, 0x2
	ands r1, r3
	movs r2, 0x3
	negs r2, r2
	ands r0, r2
	orrs r0, r1
	movs r1, 0x4
	ands r1, r3
	subs r2, 0x2
	ands r0, r2
	orrs r0, r1
	movs r1, 0x8
	ands r1, r3
	subs r2, 0x4
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	movs r0, 0x10
	orrs r3, r0
	strb r3, [r6]
	ldr r0, _080BDC78 @ =gMapHeader
	ldrb r0, [r0, 0x14]
	ldr r1, _080BDC7C @ =0x00002b18
	adds r4, r1
	strb r0, [r4]
	movs r0, 0x6
	bl sav12_xor_increment
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BDC70: .4byte gSaveBlock1
_080BDC74: .4byte 0x00002b1a
_080BDC78: .4byte gMapHeader
_080BDC7C: .4byte 0x00002b18
	thumb_func_end sub_80BDC14

	thumb_func_start TakeTVShowInSearchOfTrainersOffTheAir
TakeTVShowInSearchOfTrainersOffTheAir: @ 80BDC80
	ldr r0, _080BDC94 @ =gSaveBlock1
	ldr r1, _080BDC98 @ =0x00002b1a
	adds r0, r1
	ldrb r2, [r0]
	movs r1, 0x11
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080BDC94: .4byte gSaveBlock1
_080BDC98: .4byte 0x00002b1a
	thumb_func_end TakeTVShowInSearchOfTrainersOffTheAir

	thumb_func_start GabbyAndTyGetBattleNum
GabbyAndTyGetBattleNum: @ 80BDC9C
	push {lr}
	ldr r0, _080BDCBC @ =gSaveBlock1
	ldr r2, _080BDCC0 @ =0x00002b19
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0x5
	bls _080BDCB8
	ldrb r0, [r1]
	movs r1, 0x3
	bl __umodsi3
	adds r0, 0x6
	lsls r0, 24
	lsrs r0, 24
_080BDCB8:
	pop {r1}
	bx r1
	.align 2, 0
_080BDCBC: .4byte gSaveBlock1
_080BDCC0: .4byte 0x00002b19
	thumb_func_end GabbyAndTyGetBattleNum

	thumb_func_start IsTVShowInSearchOfTrainersAiring
IsTVShowInSearchOfTrainersAiring: @ 80BDCC4
	ldr r0, _080BDCD4 @ =gSaveBlock1
	ldr r1, _080BDCD8 @ =0x00002b1a
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r0, 31
	bx lr
	.align 2, 0
_080BDCD4: .4byte gSaveBlock1
_080BDCD8: .4byte 0x00002b1a
	thumb_func_end IsTVShowInSearchOfTrainersAiring

	thumb_func_start GabbyAndTyGetLastQuote
GabbyAndTyGetLastQuote: @ 80BDCDC
	push {r4,r5,lr}
	ldr r0, _080BDD00 @ =gSaveBlock1
	ldr r1, _080BDD04 @ =0x00002b16
	adds r4, r0, r1
	ldrh r0, [r4]
	ldr r5, _080BDD08 @ =0x0000ffff
	cmp r0, r5
	beq _080BDD10
	ldr r0, _080BDD0C @ =gStringVar1
	ldrh r1, [r4]
	bl sub_80EB3FC
	ldrh r1, [r4]
	adds r0, r5, 0
	orrs r0, r1
	strh r0, [r4]
	movs r0, 0x1
	b _080BDD12
	.align 2, 0
_080BDD00: .4byte gSaveBlock1
_080BDD04: .4byte 0x00002b16
_080BDD08: .4byte 0x0000ffff
_080BDD0C: .4byte gStringVar1
_080BDD10:
	movs r0, 0
_080BDD12:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GabbyAndTyGetLastQuote

	thumb_func_start sub_80BDD18
sub_80BDD18: @ 80BDD18
	push {lr}
	ldr r0, _080BDD30 @ =gSaveBlock1
	ldr r1, _080BDD34 @ =0x00002b1b
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080BDD38
	movs r0, 0x1
	b _080BDD5E
	.align 2, 0
_080BDD30: .4byte gSaveBlock1
_080BDD34: .4byte 0x00002b1b
_080BDD38:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080BDD44
	movs r0, 0x2
	b _080BDD5E
_080BDD44:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080BDD50
	movs r0, 0x3
	b _080BDD5E
_080BDD50:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080BDD5C
	movs r0, 0
	b _080BDD5E
_080BDD5C:
	movs r0, 0x4
_080BDD5E:
	pop {r1}
	bx r1
	thumb_func_end sub_80BDD18

	thumb_func_start GabbyAndTySetScriptVarsToFieldObjectLocalIds
GabbyAndTySetScriptVarsToFieldObjectLocalIds: @ 80BDD64
	push {lr}
	bl GabbyAndTyGetBattleNum
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x7
	bhi _080BDE3C
	lsls r0, 2
	ldr r1, _080BDD80 @ =_080BDD84
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BDD80: .4byte _080BDD84
	.align 2, 0
_080BDD84:
	.4byte _080BDDA4
	.4byte _080BDDB8
	.4byte _080BDDCC
	.4byte _080BDDE0
	.4byte _080BDDF4
	.4byte _080BDE08
	.4byte _080BDE1C
	.4byte _080BDE30
_080BDDA4:
	ldr r1, _080BDDB0 @ =gUnknown_0202E8CC
	movs r0, 0xE
	strh r0, [r1]
	ldr r1, _080BDDB4 @ =gUnknown_0202E8CE
	movs r0, 0xD
	b _080BDE3A
	.align 2, 0
_080BDDB0: .4byte gUnknown_0202E8CC
_080BDDB4: .4byte gUnknown_0202E8CE
_080BDDB8:
	ldr r1, _080BDDC4 @ =gUnknown_0202E8CC
	movs r0, 0x5
	strh r0, [r1]
	ldr r1, _080BDDC8 @ =gUnknown_0202E8CE
	movs r0, 0x6
	b _080BDE3A
	.align 2, 0
_080BDDC4: .4byte gUnknown_0202E8CC
_080BDDC8: .4byte gUnknown_0202E8CE
_080BDDCC:
	ldr r1, _080BDDD8 @ =gUnknown_0202E8CC
	movs r0, 0x12
	strh r0, [r1]
	ldr r1, _080BDDDC @ =gUnknown_0202E8CE
	movs r0, 0x11
	b _080BDE3A
	.align 2, 0
_080BDDD8: .4byte gUnknown_0202E8CC
_080BDDDC: .4byte gUnknown_0202E8CE
_080BDDE0:
	ldr r1, _080BDDEC @ =gUnknown_0202E8CC
	movs r0, 0x15
	strh r0, [r1]
	ldr r1, _080BDDF0 @ =gUnknown_0202E8CE
	movs r0, 0x16
	b _080BDE3A
	.align 2, 0
_080BDDEC: .4byte gUnknown_0202E8CC
_080BDDF0: .4byte gUnknown_0202E8CE
_080BDDF4:
	ldr r1, _080BDE00 @ =gUnknown_0202E8CC
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _080BDE04 @ =gUnknown_0202E8CE
	movs r0, 0x9
	b _080BDE3A
	.align 2, 0
_080BDE00: .4byte gUnknown_0202E8CC
_080BDE04: .4byte gUnknown_0202E8CE
_080BDE08:
	ldr r1, _080BDE14 @ =gUnknown_0202E8CC
	movs r0, 0x13
	strh r0, [r1]
	ldr r1, _080BDE18 @ =gUnknown_0202E8CE
	movs r0, 0x14
	b _080BDE3A
	.align 2, 0
_080BDE14: .4byte gUnknown_0202E8CC
_080BDE18: .4byte gUnknown_0202E8CE
_080BDE1C:
	ldr r1, _080BDE28 @ =gUnknown_0202E8CC
	movs r0, 0x17
	strh r0, [r1]
	ldr r1, _080BDE2C @ =gUnknown_0202E8CE
	movs r0, 0x18
	b _080BDE3A
	.align 2, 0
_080BDE28: .4byte gUnknown_0202E8CC
_080BDE2C: .4byte gUnknown_0202E8CE
_080BDE30:
	ldr r1, _080BDE40 @ =gUnknown_0202E8CC
	movs r0, 0xA
	strh r0, [r1]
	ldr r1, _080BDE44 @ =gUnknown_0202E8CE
	movs r0, 0xB
_080BDE3A:
	strh r0, [r1]
_080BDE3C:
	pop {r0}
	bx r0
	.align 2, 0
_080BDE40: .4byte gUnknown_0202E8CC
_080BDE44: .4byte gUnknown_0202E8CE
	thumb_func_end GabbyAndTySetScriptVarsToFieldObjectLocalIds

	thumb_func_start sub_80BDE48
sub_80BDE48: @ 80BDE48
	push {lr}
	ldr r0, _080BDE60 @ =gUnknown_0202E8CE
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x6
	bhi _080BDEA6
	lsls r0, 2
	ldr r1, _080BDE64 @ =_080BDE68
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BDE60: .4byte gUnknown_0202E8CE
_080BDE64: .4byte _080BDE68
	.align 2, 0
_080BDE68:
	.4byte _080BDE84
	.4byte _080BDE8A
	.4byte _080BDE90
	.4byte _080BDE96
	.4byte _080BDEA6
	.4byte _080BDE9C
	.4byte _080BDEA2
_080BDE84:
	bl sub_80BE5FC
	b _080BDEA6
_080BDE8A:
	bl sub_80BE65C
	b _080BDEA6
_080BDE90:
	bl sub_80BE6A0
	b _080BDEA6
_080BDE96:
	bl nullsub_21
	b _080BDEA6
_080BDE9C:
	bl sub_80BE188
	b _080BDEA6
_080BDEA2:
	bl sub_80BE320
_080BDEA6:
	pop {r0}
	bx r0
	thumb_func_end sub_80BDE48

	thumb_func_start sub_80BDEAC
sub_80BDEAC: @ 80BDEAC
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2
	ldrb r0, [r1]
	cmp r0, 0xFC
	bne _080BDEC0
	ldrb r0, [r1, 0x1]
	cmp r0, 0x15
	bne _080BDEC0
	movs r2, 0x1
_080BDEC0:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80BDEAC

	thumb_func_start sub_80BDEC8
sub_80BDEC8: @ 80BDEC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	bl sub_80BEB20
	bl sub_80BE778
	ldr r5, _080BDEE8 @ =gUnknown_030042E0
	ldrh r0, [r5, 0x28]
	cmp r0, 0
	bne _080BDEEC
	bl sub_80BE074
	b _080BE012
	.align 2, 0
_080BDEE8: .4byte gUnknown_030042E0
_080BDEEC:
	bl sub_80BE028
	ldr r0, _080BDF98 @ =0x0000ffff
	bl sub_80BF77C
	lsls r0, 24
	cmp r0, 0
	beq _080BDEFE
	b _080BE012
_080BDEFE:
	ldrh r1, [r5, 0x28]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _080BDF9C @ =gSpeciesNames
	adds r0, r1
	adds r1, r5, 0
	adds r1, 0x2A
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _080BDF16
	b _080BE012
_080BDF16:
	ldr r0, _080BDFA0 @ =gSaveBlock1 + 0x2738
	bl sub_80BF74C
	ldr r1, _080BDFA4 @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE012
	movs r0, 0x15
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BE012
	movs r2, 0
	adds r7, r5, 0
	adds r1, r7, 0
	adds r1, 0x36
_080BDF42:
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bls _080BDF42
	cmp r4, 0
	bne _080BDF64
	ldrb r1, [r7, 0x5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BE012
_080BDF64:
	movs r4, 0
	ldr r0, _080BDFA4 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BDFA0 @ =gSaveBlock1 + 0x2738
	adds r5, r0, r1
	movs r0, 0x15
	strb r0, [r5]
	strb r4, [r5, 0x1]
	ldrb r1, [r7, 0x5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BDFAC
	movs r4, 0x1
	movs r0, 0x1
	adds r3, r5, 0
	adds r3, 0x13
	ldr r1, _080BDFA8 @ =gSaveBlock2
	mov r8, r1
	adds r6, r5, 0x4
	b _080BDFDE
	.align 2, 0
_080BDF98: .4byte 0x0000ffff
_080BDF9C: .4byte gSpeciesNames
_080BDFA0: .4byte gSaveBlock1 + 0x2738
_080BDFA4: .4byte gUnknown_03005D38
_080BDFA8: .4byte gSaveBlock2
_080BDFAC:
	movs r2, 0
	ldr r0, _080BE01C @ =gUnknown_02024C04
	mov r12, r0
	adds r3, r5, 0
	adds r3, 0x13
	ldr r1, _080BE020 @ =gSaveBlock2
	mov r8, r1
	adds r6, r5, 0x4
	adds r1, r7, 0
	adds r1, 0x36
_080BDFC0:
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bls _080BDFC0
	cmp r4, 0xFF
	bls _080BDFDA
	movs r4, 0xFF
_080BDFDA:
	mov r1, r12
	ldrh r0, [r1]
_080BDFDE:
	strb r4, [r5, 0x12]
	strb r0, [r5, 0xF]
	adds r0, r3, 0
	mov r1, r8
	bl StringCopy
	ldr r4, _080BE024 @ =gUnknown_0300430A
	adds r0, r6, 0
	adds r1, r4, 0
	bl StringCopy
	subs r4, 0x2A
	ldrh r0, [r4, 0x28]
	strh r0, [r5, 0x10]
	adds r0, r5, 0
	bl sub_80BE138
	movs r0, 0x2
	strb r0, [r5, 0x2]
	adds r0, r6, 0
	bl sub_80BDEAC
	strb r0, [r5, 0x3]
	adds r0, r6, 0
	bl SkipExtCtrlCodes
_080BE012:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE01C: .4byte gUnknown_02024C04
_080BE020: .4byte gSaveBlock2
_080BE024: .4byte gUnknown_0300430A
	thumb_func_end sub_80BDEC8

	thumb_func_start sub_80BE028
sub_80BE028: @ 80BE028
	push {r4,lr}
	ldr r4, _080BE064 @ =gSaveBlock1 + 0x2A98
	ldrb r0, [r4]
	cmp r0, 0x19
	beq _080BE048
	ldr r1, _080BE068 @ =0xfffffca0
	adds r0, r4, r1
	movs r1, 0x18
	bl sub_80BF55C
	movs r0, 0x5
	bl sub_8053108
	strh r0, [r4, 0x6]
	movs r0, 0x19
	strb r0, [r4]
_080BE048:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	ldr r1, _080BE06C @ =gUnknown_030042E0
	ldrh r0, [r1, 0x28]
	strh r0, [r4, 0x4]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x8]
	ldr r0, _080BE070 @ =gMapHeader
	ldrb r0, [r0, 0x14]
	strb r0, [r4, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE064: .4byte gSaveBlock1 + 0x2A98
_080BE068: .4byte 0xfffffca0
_080BE06C: .4byte gUnknown_030042E0
_080BE070: .4byte gMapHeader
	thumb_func_end sub_80BE028

	thumb_func_start sub_80BE074
sub_80BE074: @ 80BE074
	push {r4-r7,lr}
	ldr r0, _080BE118 @ =0x0000ffff
	bl sub_80BF77C
	lsls r0, 24
	cmp r0, 0
	bne _080BE112
	movs r1, 0
	movs r5, 0
	ldr r2, _080BE11C @ =gUnknown_03004316
_080BE088:
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xA
	bls _080BE088
	cmp r5, 0xFF
	bls _080BE0A2
	movs r5, 0xFF
_080BE0A2:
	cmp r5, 0x2
	bls _080BE112
	ldr r7, _080BE120 @ =gUnknown_02024D26
	ldrb r0, [r7]
	cmp r0, 0x1
	bne _080BE112
	ldr r6, _080BE124 @ =gSaveBlock1 + 0x2738
	adds r0, r6, 0
	bl sub_80BF74C
	ldr r4, _080BE128 @ =gUnknown_03005D38
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE112
	movs r0, 0x17
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BE112
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r6
	movs r1, 0
	movs r0, 0x17
	strb r0, [r4]
	strb r1, [r4, 0x1]
	ldr r1, _080BE12C @ =gUnknown_030042E0
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0xC]
	ldrh r0, [r1, 0x20]
	strh r0, [r4, 0xE]
	strb r5, [r4, 0x10]
	ldrb r0, [r7]
	strb r0, [r4, 0x11]
	ldr r0, _080BE130 @ =gMapHeader
	ldrb r0, [r0, 0x14]
	strb r0, [r4, 0x12]
	adds r0, r4, 0
	adds r0, 0x13
	ldr r1, _080BE134 @ =gSaveBlock2
	bl StringCopy
	adds r0, r4, 0
	bl sub_80BE138
	movs r0, 0x2
	strb r0, [r4, 0x2]
_080BE112:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE118: .4byte 0x0000ffff
_080BE11C: .4byte gUnknown_03004316
_080BE120: .4byte gUnknown_02024D26
_080BE124: .4byte gSaveBlock1 + 0x2738
_080BE128: .4byte gUnknown_03005D38
_080BE12C: .4byte gUnknown_030042E0
_080BE130: .4byte gMapHeader
_080BE134: .4byte gSaveBlock2
	thumb_func_end sub_80BE074

	thumb_func_start sub_80BE138
sub_80BE138: @ 80BE138
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80BFB94
	strb r0, [r4, 0x1E]
	lsrs r2, r0, 8
	strb r2, [r4, 0x1F]
	adds r1, r4, 0
	adds r1, 0x20
	strb r0, [r1]
	adds r1, 0x1
	strb r2, [r1]
	adds r1, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	adds r0, 0x23
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BE138

	thumb_func_start sub_80BE160
sub_80BE160: @ 80BE160
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80BFB94
	adds r1, r4, 0
	adds r1, 0x20
	strb r0, [r1]
	lsrs r1, r0, 8
	adds r2, r4, 0
	adds r2, 0x21
	strb r1, [r2]
	adds r2, 0x1
	strb r0, [r2]
	adds r0, r4, 0
	adds r0, 0x23
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BE160

	thumb_func_start sub_80BE188
sub_80BE188: @ 80BE188
	push {r4-r6,lr}
	ldr r6, _080BE22C @ =gSaveBlock1 + 0x2A98
	ldrb r1, [r6]
	cmp r1, 0x6
	bne _080BE224
	ldr r0, _080BE230 @ =gUnknown_03005D38
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r2, _080BE234 @ =0xfffffca0
	adds r0, r6, r2
	adds r4, r0
	strb r1, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	ldrh r0, [r6, 0x2]
	strh r0, [r4, 0x2]
	adds r0, r4, 0
	adds r0, 0x16
	ldr r1, _080BE238 @ =gSaveBlock2
	bl StringCopy
	adds r5, r4, 0
	adds r5, 0x8
	adds r1, r6, 0
	adds r1, 0x8
	adds r0, r5, 0
	bl StringCopy
	ldrb r0, [r6, 0x13]
	lsls r0, 29
	lsrs r0, 29
	ldrb r2, [r4, 0x13]
	movs r3, 0x8
	negs r3, r3
	adds r1, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x13]
	ldrb r2, [r6, 0x13]
	movs r0, 0x18
	ands r0, r2
	movs r2, 0x19
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, 0x13]
	ldrh r0, [r6, 0x14]
	strh r0, [r4, 0x14]
	ldrb r0, [r6, 0x13]
	movs r1, 0x60
	ands r1, r0
	movs r0, 0x61
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x13]
	ldrb r1, [r6, 0x13]
	lsls r1, 29
	lsrs r1, 29
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, 0x13]
	adds r0, r4, 0
	bl sub_80BE160
	movs r0, 0x2
	strb r0, [r4, 0x1E]
	adds r0, r5, 0
	bl sub_80BDEAC
	strb r0, [r4, 0x1F]
	adds r0, r5, 0
	bl SkipExtCtrlCodes
_080BE224:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE22C: .4byte gSaveBlock1 + 0x2A98
_080BE230: .4byte gUnknown_03005D38
_080BE234: .4byte 0xfffffca0
_080BE238: .4byte gSaveBlock2
	thumb_func_end sub_80BE188

	thumb_func_start sub_80BE23C
sub_80BE23C: @ 80BE23C
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r4, _080BE278 @ =gSaveBlock1 + 0x2A98
	bl sub_80BF484
	ldr r0, _080BE27C @ =0xfffffca0
	adds r5, r4, r0
	adds r0, r5, 0
	bl sub_80BF720
	ldr r1, _080BE280 @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE270
	adds r0, r5, 0
	movs r1, 0x18
	bl sub_80BF55C
	strh r6, [r4, 0x14]
	movs r0, 0x6
	strb r0, [r4]
_080BE270:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE278: .4byte gSaveBlock1 + 0x2A98
_080BE27C: .4byte 0xfffffca0
_080BE280: .4byte gUnknown_03005D38
	thumb_func_end sub_80BE23C

	thumb_func_start sub_80BE284
sub_80BE284: @ 80BE284
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r7, _080BE304 @ =gSaveBlock1 + 0x2A98
	ldr r1, _080BE308 @ =0xfffffca0
	adds r0, r7, r1
	bl sub_80BF720
	ldr r1, _080BE30C @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE2FE
	movs r3, 0x3
	adds r1, r4, 0
	ands r1, r3
	lsls r1, 5
	ldrb r2, [r7, 0x13]
	movs r0, 0x61
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	ldr r1, _080BE310 @ =gUnknown_0203869C
	ldrb r2, [r1]
	movs r1, 0x7
	ands r1, r2
	movs r2, 0x8
	negs r2, r2
	ands r0, r2
	orrs r0, r1
	ldr r1, _080BE314 @ =gUnknown_0203869E
	ldrb r1, [r1]
	ands r3, r1
	lsls r3, 3
	movs r1, 0x19
	negs r1, r1
	ands r0, r1
	orrs r0, r3
	strb r0, [r7, 0x13]
	ldr r6, _080BE318 @ =gUnknown_02038694
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080BE31C @ =gPlayerParty
	adds r0, r4
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x2]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	adds r2, r7, 0
	adds r2, 0x8
	movs r1, 0x2
	bl GetMonData
_080BE2FE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE304: .4byte gSaveBlock1 + 0x2A98
_080BE308: .4byte 0xfffffca0
_080BE30C: .4byte gUnknown_03005D38
_080BE310: .4byte gUnknown_0203869C
_080BE314: .4byte gUnknown_0203869E
_080BE318: .4byte gUnknown_02038694
_080BE31C: .4byte gPlayerParty
	thumb_func_end sub_80BE284

	thumb_func_start sub_80BE320
sub_80BE320: @ 80BE320
	push {r4-r6,lr}
	ldr r0, _080BE384 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BE388 @ =gSaveBlock1 + 0x2738
	adds r6, r0, r1
	movs r0, 0x7
	strb r0, [r6]
	movs r0, 0x1
	strb r0, [r6, 0x1]
	adds r0, r6, 0x2
	ldr r4, _080BE38C @ =gSaveBlock2
	adds r1, r4, 0
	bl StringCopy
	adds r0, r6, 0
	adds r0, 0xC
	ldr r2, _080BE390 @ =0x00000484
	adds r1, r4, r2
	bl StringCopy
	movs r1, 0x90
	lsls r1, 3
	adds r0, r4, r1
	ldrh r0, [r0]
	strh r0, [r6, 0xA]
	ldr r2, _080BE394 @ =0x00000482
	adds r0, r4, r2
	ldrh r0, [r0]
	strh r0, [r6, 0x14]
	movs r0, 0xAF
	lsls r0, 3
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_8135D3C
	strh r0, [r6, 0x16]
	ldr r1, _080BE398 @ =0x00000555
	adds r4, r1
	ldrb r0, [r4]
	strb r0, [r6, 0x1C]
	ldrb r0, [r5]
	cmp r0, 0
	bne _080BE39C
	movs r0, 0x32
	b _080BE39E
	.align 2, 0
_080BE384: .4byte gUnknown_03005D38
_080BE388: .4byte gSaveBlock1 + 0x2738
_080BE38C: .4byte gSaveBlock2
_080BE390: .4byte 0x00000484
_080BE394: .4byte 0x00000482
_080BE398: .4byte 0x00000555
_080BE39C:
	movs r0, 0x64
_080BE39E:
	strb r0, [r6, 0x1A]
	ldr r0, _080BE3B8 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	strb r0, [r6, 0x1B]
	adds r0, r6, 0
	bl sub_80BE160
	movs r0, 0x2
	strb r0, [r6, 0x1D]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE3B8: .4byte gUnknown_0202E8CC
	thumb_func_end sub_80BE320

	thumb_func_start sub_80BE3BC
sub_80BE3BC: @ 80BE3BC
	push {r4-r7,lr}
	ldr r0, _080BE460 @ =0x00005555
	bl sub_80BF77C
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080BE458
	ldr r6, _080BE464 @ =gSaveBlock1 + 0x2738
	adds r0, r6, 0
	bl sub_80BF74C
	ldr r5, _080BE468 @ =gUnknown_03005D38
	strb r0, [r5]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE458
	movs r0, 0x16
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BE458
	bl sub_80BF20C
	ldr r2, _080BE46C @ =gUnknown_02038724
	ldrh r0, [r2, 0x2]
	cmp r0, 0x13
	bls _080BE458
	movs r1, 0
	ldrsb r1, [r5, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r6
	movs r0, 0x16
	strb r0, [r5]
	strb r4, [r5, 0x1]
	ldr r0, _080BE470 @ =gMapHeader
	ldrb r0, [r0, 0x14]
	strb r0, [r5, 0x12]
	movs r4, 0
	adds r7, r5, 0x6
	mov r12, r2
	adds r6, r5, 0
	adds r6, 0xC
_080BE420:
	lsls r2, r4, 1
	adds r3, r7, r2
	lsls r1, r4, 2
	add r1, r12
	ldrh r0, [r1]
	strh r0, [r3]
	adds r2, r6, r2
	ldrh r0, [r1, 0x2]
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _080BE420
	movs r0, 0x1
	bl GetPriceReduction
	strb r0, [r5, 0x2]
	adds r0, r5, 0
	adds r0, 0x13
	ldr r1, _080BE474 @ =gSaveBlock2
	bl StringCopy
	adds r0, r5, 0
	bl sub_80BE138
	movs r0, 0x2
	strb r0, [r5, 0x3]
_080BE458:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE460: .4byte 0x00005555
_080BE464: .4byte gSaveBlock1 + 0x2738
_080BE468: .4byte gUnknown_03005D38
_080BE46C: .4byte gUnknown_02038724
_080BE470: .4byte gMapHeader
_080BE474: .4byte gSaveBlock2
	thumb_func_end sub_80BE3BC

	thumb_func_start sub_80BE478
sub_80BE478: @ 80BE478
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	bl sub_80BF478
	ldr r0, _080BE554 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080BE548
	ldr r0, _080BE558 @ =gUnknown_0202E8CC
	mov r8, r0
	ldrh r0, [r0]
	movs r7, 0x64
	muls r0, r7
	ldr r6, _080BE55C @ =gPlayerParty
	adds r0, r6
	ldr r4, _080BE560 @ =gStringVar1
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	ldr r1, _080BE564 @ =gSaveBlock2
	mov r9, r1
	mov r0, r9
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080BE548
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080BE548
	ldr r0, _080BE568 @ =gUnknown_03005D38
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080BE56C @ =gSaveBlock1 + 0x2738
	adds r4, r0
	movs r0, 0x5
	strb r0, [r4]
	movs r5, 0x1
	strb r5, [r4, 0x1]
	mov r1, r8
	ldrh r0, [r1]
	muls r0, r7
	adds r0, r6
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	strh r0, [r4, 0x2]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	strb r0, [r4, 0x1A]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ands r0, r5
	strb r0, [r4, 0x1B]
	ldrh r0, [r4, 0x2]
	bl sub_80BF674
	strh r0, [r4, 0x1C]
	adds r0, r4, 0
	adds r0, 0xF
	mov r1, r9
	bl StringCopy
	mov r1, r8
	ldrh r0, [r1]
	muls r0, r7
	adds r0, r6
	adds r5, r4, 0x4
	movs r1, 0x2
	adds r2, r5, 0
	bl GetMonData
	adds r0, r4, 0
	bl sub_80BE160
	movs r0, 0x2
	strb r0, [r4, 0x1E]
	adds r0, r5, 0
	bl sub_80BDEAC
	strb r0, [r4, 0x1F]
	adds r0, r5, 0
	bl SkipExtCtrlCodes
_080BE548:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE554: .4byte gScriptResult
_080BE558: .4byte gUnknown_0202E8CC
_080BE55C: .4byte gPlayerParty
_080BE560: .4byte gStringVar1
_080BE564: .4byte gSaveBlock2
_080BE568: .4byte gUnknown_03005D38
_080BE56C: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80BE478

	thumb_func_start StartMassOutbreak
StartMassOutbreak: @ 80BE570
	push {r4,lr}
	ldr r0, _080BE5F0 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r2, _080BE5F4 @ =gSaveBlock1 + 0x2738
	adds r0, r2
	ldrh r3, [r0, 0xC]
	movs r4, 0xF1
	lsls r4, 2
	adds r1, r2, r4
	strh r3, [r1]
	ldrb r3, [r0, 0x10]
	adds r4, 0x2
	adds r1, r2, r4
	strb r3, [r1]
	ldrb r3, [r0, 0x11]
	adds r4, 0x1
	adds r1, r2, r4
	strb r3, [r1]
	ldrb r3, [r0, 0x14]
	adds r4, 0x1
	adds r1, r2, r4
	strb r3, [r1]
	ldrb r3, [r0, 0x2]
	adds r4, 0x1
	adds r1, r2, r4
	strb r3, [r1]
	ldrh r3, [r0, 0xE]
	adds r4, 0x1
	adds r1, r2, r4
	strh r3, [r1]
	ldrh r3, [r0, 0x4]
	adds r4, 0x2
	adds r1, r2, r4
	strh r3, [r1]
	ldrh r3, [r0, 0x6]
	adds r4, 0x2
	adds r1, r2, r4
	strh r3, [r1]
	ldrh r3, [r0, 0x8]
	adds r4, 0x2
	adds r1, r2, r4
	strh r3, [r1]
	ldrh r3, [r0, 0xA]
	adds r4, 0x2
	adds r1, r2, r4
	strh r3, [r1]
	ldrb r3, [r0, 0x3]
	adds r4, 0x2
	adds r1, r2, r4
	strb r3, [r1]
	ldrb r1, [r0, 0x13]
	ldr r3, _080BE5F8 @ =0x000003d5
	adds r0, r2, r3
	strb r1, [r0]
	adds r4, 0x2
	adds r2, r4
	movs r0, 0x2
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE5F0: .4byte gUnknown_0202E8CC
_080BE5F4: .4byte gSaveBlock1 + 0x2738
_080BE5F8: .4byte 0x000003d5
	thumb_func_end StartMassOutbreak

	thumb_func_start sub_80BE5FC
sub_80BE5FC: @ 80BE5FC
	push {r4,lr}
	ldr r0, _080BE64C @ =gUnknown_03005D38
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080BE650 @ =gSaveBlock1 + 0x2738
	adds r4, r0
	movs r0, 0x1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	adds r0, 0x10
	ldr r1, _080BE654 @ =gSaveBlock2
	bl StringCopy
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080BE658 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	strh r0, [r4, 0x2]
	adds r0, r4, 0
	bl sub_80BE160
	movs r0, 0x2
	strb r0, [r4, 0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE64C: .4byte gUnknown_03005D38
_080BE650: .4byte gSaveBlock1 + 0x2738
_080BE654: .4byte gSaveBlock2
_080BE658: .4byte gPlayerParty
	thumb_func_end sub_80BE5FC

	thumb_func_start sub_80BE65C
sub_80BE65C: @ 80BE65C
	push {r4-r6,lr}
	ldr r0, _080BE694 @ =gUnknown_03005D38
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080BE698 @ =gSaveBlock1 + 0x2738
	adds r4, r0
	movs r6, 0
	movs r5, 0x2
	strb r5, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	adds r0, 0x10
	ldr r1, _080BE69C @ =gSaveBlock2
	bl StringCopy
	strh r6, [r4, 0x2]
	adds r0, r4, 0
	bl sub_80BE160
	strb r5, [r4, 0x18]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE694: .4byte gUnknown_03005D38
_080BE698: .4byte gSaveBlock1 + 0x2738
_080BE69C: .4byte gSaveBlock2
	thumb_func_end sub_80BE65C

	thumb_func_start sub_80BE6A0
sub_80BE6A0: @ 80BE6A0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _080BE760 @ =gUnknown_03005D38
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080BE764 @ =gSaveBlock1 + 0x2738
	adds r4, r0
	movs r0, 0x3
	strb r0, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r6, _080BE768 @ =gPlayerParty
	adds r0, r6
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	lsrs r0, 4
	movs r1, 0xF
	ands r0, r1
	ldrb r2, [r4, 0x4]
	movs r1, 0x10
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x4]
	ldr r0, _080BE76C @ =gUnknown_0202E8D2
	ldrb r0, [r0]
	lsls r0, 4
	movs r2, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x4]
	adds r0, r4, 0x5
	ldr r1, _080BE770 @ =gSaveBlock2
	bl StringCopy
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	adds r5, r4, 0
	adds r5, 0x10
	movs r1, 0x2
	adds r2, r5, 0
	bl GetMonData
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	strh r0, [r4, 0x2]
	adds r0, r4, 0
	bl sub_80BE160
	movs r0, 0x2
	strb r0, [r4, 0xD]
	adds r0, r5, 0
	bl sub_80BDEAC
	strb r0, [r4, 0xE]
	adds r0, r5, 0
	bl SkipExtCtrlCodes
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE760: .4byte gUnknown_03005D38
_080BE764: .4byte gSaveBlock1 + 0x2738
_080BE768: .4byte gPlayerParty
_080BE76C: .4byte gUnknown_0202E8D2
_080BE770: .4byte gSaveBlock2
	thumb_func_end sub_80BE6A0

	thumb_func_start nullsub_21
nullsub_21: @ 80BE774
	bx lr
	thumb_func_end nullsub_21

	thumb_func_start sub_80BE778
sub_80BE778: @ 80BE778
	push {r4-r6,lr}
	ldr r0, _080BE83C @ =0x00000804
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080BE836
	movs r1, 0
	ldr r3, _080BE840 @ =gSaveBlock1
	ldr r2, _080BE844 @ =0x00002738
_080BE78C:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x29
	beq _080BE836
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x17
	bls _080BE78C
	ldr r0, _080BE848 @ =0x00000147
	bl sub_80BF77C
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080BE836
	ldr r6, _080BE84C @ =gSaveBlock1 + 0x2738
	adds r0, r6, 0
	bl sub_80BF720
	ldr r4, _080BE850 @ =gUnknown_03005D38
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE836
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r4, r1, 3
	adds r4, r1
	lsls r4, 2
	adds r4, r6
	movs r1, 0x29
	strb r1, [r4]
	movs r3, 0x1
	strb r3, [r4, 0x1]
	ldr r2, _080BE854 @ =gUnknown_083D13F8
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0xA]
	strb r0, [r4, 0x14]
	strb r5, [r4, 0x2]
	strb r5, [r4, 0x3]
	ldrh r0, [r1]
	movs r2, 0
	strh r0, [r4, 0xC]
	strh r5, [r4, 0xE]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x4]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x6]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x8]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0xA]
	ldrb r0, [r1, 0xB]
	strb r0, [r4, 0x10]
	strb r2, [r4, 0x11]
	strb r2, [r4, 0x12]
	movs r0, 0x32
	strb r0, [r4, 0x13]
	strb r2, [r4, 0x15]
	strh r3, [r4, 0x16]
	adds r0, r4, 0
	bl sub_80BE160
	movs r0, 0x2
	strb r0, [r4, 0x18]
_080BE836:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE83C: .4byte 0x00000804
_080BE840: .4byte gSaveBlock1
_080BE844: .4byte 0x00002738
_080BE848: .4byte 0x00000147
_080BE84C: .4byte gSaveBlock1 + 0x2738
_080BE850: .4byte gUnknown_03005D38
_080BE854: .4byte gUnknown_083D13F8
	thumb_func_end sub_80BE778

	thumb_func_start EndMassOutbreak
EndMassOutbreak: @ 80BE858
	push {r4,lr}
	ldr r0, _080BE8B4 @ =gSaveBlock1
	ldr r2, _080BE8B8 @ =0x00002afc
	adds r1, r0, r2
	movs r3, 0
	movs r2, 0
	strh r2, [r1]
	ldr r4, _080BE8BC @ =0x00002afe
	adds r1, r0, r4
	strb r3, [r1]
	adds r4, 0x1
	adds r1, r0, r4
	strb r3, [r1]
	adds r4, 0x1
	adds r1, r0, r4
	strb r3, [r1]
	adds r4, 0x1
	adds r1, r0, r4
	strb r3, [r1]
	adds r4, 0x1
	adds r1, r0, r4
	strh r2, [r1]
	adds r4, 0x2
	adds r1, r0, r4
	strh r2, [r1]
	adds r4, 0x2
	adds r1, r0, r4
	strh r2, [r1]
	adds r4, 0x2
	adds r1, r0, r4
	strh r2, [r1]
	adds r4, 0x2
	adds r1, r0, r4
	strh r2, [r1]
	adds r4, 0x2
	adds r1, r0, r4
	strb r3, [r1]
	adds r4, 0x1
	adds r1, r0, r4
	strb r3, [r1]
	ldr r1, _080BE8C0 @ =0x00002b0e
	adds r0, r1
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE8B4: .4byte gSaveBlock1
_080BE8B8: .4byte 0x00002afc
_080BE8BC: .4byte 0x00002afe
_080BE8C0: .4byte 0x00002b0e
	thumb_func_end EndMassOutbreak

	thumb_func_start sub_80BE8C4
sub_80BE8C4: @ 80BE8C4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_80BE8EC
	adds r0, r4, 0
	bl UpdateMassOutbreakTimeLeft
	adds r0, r4, 0
	bl sub_80BEE84
	adds r0, r4, 0
	bl sub_80BEA5C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BE8C4

	thumb_func_start sub_80BE8EC
sub_80BE8EC: @ 80BE8EC
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _080BE930 @ =gSaveBlock1
	ldr r2, _080BE934 @ =0x00002afc
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BE94C
	movs r3, 0
	adds r5, r1, 0
	ldr r7, _080BE938 @ =0x00002738
	adds r6, r5, r7
_080BE906:
	lsls r0, r3, 3
	adds r0, r3
	lsls r2, r0, 2
	adds r1, r2, r5
	ldr r7, _080BE938 @ =0x00002738
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, 0x29
	bne _080BE942
	adds r7, 0x1
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080BE942
	adds r1, r2, r6
	ldrh r0, [r1, 0x16]
	cmp r0, r4
	bcs _080BE93C
	movs r0, 0
	strh r0, [r1, 0x16]
	b _080BE94C
	.align 2, 0
_080BE930: .4byte gSaveBlock1
_080BE934: .4byte 0x00002afc
_080BE938: .4byte 0x00002738
_080BE93C:
	subs r0, r4
	strh r0, [r1, 0x16]
	b _080BE94C
_080BE942:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x17
	bls _080BE906
_080BE94C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BE8EC

	thumb_func_start UpdateMassOutbreakTimeLeft
UpdateMassOutbreakTimeLeft: @ 80BE954
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080BE96C @ =gSaveBlock1
	ldr r3, _080BE970 @ =0x00002b0e
	adds r2, r0, r3
	ldrh r0, [r2]
	cmp r0, r1
	bhi _080BE974
	bl EndMassOutbreak
	b _080BE978
	.align 2, 0
_080BE96C: .4byte gSaveBlock1
_080BE970: .4byte 0x00002b0e
_080BE974:
	subs r0, r1
	strh r0, [r2]
_080BE978:
	pop {r0}
	bx r0
	thumb_func_end UpdateMassOutbreakTimeLeft

	thumb_func_start sub_80BE97C
sub_80BE97C: @ 80BE97C
	push {r4,lr}
	lsls r0, 24
	cmp r0, 0
	beq _080BE9A4
	ldr r4, _080BE9A0 @ =gUnknown_020387E2
	ldrh r0, [r4]
	lsrs r0, 8
	cmp r0, 0x4
	bls _080BE992
	bl sub_80BE9D4
_080BE992:
	ldrb r0, [r4]
	strh r0, [r4]
	cmp r0, 0xFF
	beq _080BE9C8
	adds r0, 0x1
	b _080BE9C6
	.align 2, 0
_080BE9A0: .4byte gUnknown_020387E2
_080BE9A4:
	ldr r4, _080BE9D0 @ =gUnknown_020387E2
	ldrb r0, [r4]
	cmp r0, 0x4
	bls _080BE9B0
	bl sub_80BE9D4
_080BE9B0:
	ldrh r0, [r4]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	strh r1, [r4]
	lsrs r0, r1, 8
	cmp r0, 0xFF
	beq _080BE9C8
	movs r2, 0x80
	lsls r2, 1
	adds r0, r1, r2
_080BE9C6:
	strh r0, [r4]
_080BE9C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE9D0: .4byte gUnknown_020387E2
	thumb_func_end sub_80BE97C

	thumb_func_start sub_80BE9D4
sub_80BE9D4: @ 80BE9D4
	push {r4,r5,lr}
	ldr r5, _080BEA3C @ =gSaveBlock1 + 0x2738
	adds r0, r5, 0
	bl sub_80BF74C
	ldr r4, _080BEA40 @ =gUnknown_03005D38
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BEA36
	movs r0, 0x18
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BEA36
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r5
	movs r1, 0
	movs r0, 0x18
	strb r0, [r4]
	strb r1, [r4, 0x1]
	ldr r1, _080BEA44 @ =gUnknown_020387E2
	ldrh r0, [r1]
	strb r0, [r4, 0x2]
	ldrh r0, [r1]
	lsrs r0, 8
	strb r0, [r4, 0x3]
	ldr r0, _080BEA48 @ =gUnknown_020387E0
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	adds r0, r4, 0
	adds r0, 0x13
	ldr r1, _080BEA4C @ =gSaveBlock2
	bl StringCopy
	adds r0, r4, 0
	bl sub_80BE138
	movs r0, 0x2
	strb r0, [r4, 0x6]
_080BEA36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BEA3C: .4byte gSaveBlock1 + 0x2738
_080BEA40: .4byte gUnknown_03005D38
_080BEA44: .4byte gUnknown_020387E2
_080BEA48: .4byte gUnknown_020387E0
_080BEA4C: .4byte gSaveBlock2
	thumb_func_end sub_80BE9D4

	thumb_func_start sub_80BEA50
sub_80BEA50: @ 80BEA50
	ldr r1, _080BEA58 @ =gUnknown_020387E0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080BEA58: .4byte gUnknown_020387E0
	thumb_func_end sub_80BEA50

	thumb_func_start sub_80BEA5C
sub_80BEA5C: @ 80BEA5C
	push {lr}
	ldr r1, _080BEA78 @ =gSaveBlock1 + 0x2A98
	ldrb r0, [r1]
	cmp r0, 0x19
	bne _080BEA84
	ldrh r0, [r1, 0x2]
	cmp r0, 0x13
	bhi _080BEA80
	ldr r2, _080BEA7C @ =0xfffffca0
	adds r0, r1, r2
	movs r1, 0x18
	bl sub_80BF55C
	b _080BEA84
	.align 2, 0
_080BEA78: .4byte gSaveBlock1 + 0x2A98
_080BEA7C: .4byte 0xfffffca0
_080BEA80:
	bl sub_80BEA88
_080BEA84:
	pop {r0}
	bx r0
	thumb_func_end sub_80BEA5C

	thumb_func_start sub_80BEA88
sub_80BEA88: @ 80BEA88
	push {r4-r7,lr}
	ldr r5, _080BEB0C @ =gSaveBlock1 + 0x2A98
	ldr r0, _080BEB10 @ =0x0000ffff
	bl sub_80BF77C
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _080BEB04
	ldr r0, _080BEB14 @ =0xfffffca0
	adds r7, r5, r0
	adds r0, r7, 0
	bl sub_80BF74C
	ldr r4, _080BEB18 @ =gUnknown_03005D38
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BEB04
	movs r0, 0x19
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BEB04
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r7
	movs r0, 0x19
	strb r0, [r4]
	strb r6, [r4, 0x1]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x2]
	movs r0, 0x5
	bl sub_8053108
	ldrh r1, [r5, 0x6]
	subs r0, r1
	strh r0, [r4, 0x6]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x8]
	ldrb r0, [r5, 0xA]
	strb r0, [r4, 0xA]
	adds r0, r4, 0
	adds r0, 0x13
	ldr r1, _080BEB1C @ =gSaveBlock2
	bl StringCopy
	adds r0, r4, 0
	bl sub_80BE138
	movs r0, 0x2
	strb r0, [r4, 0xB]
_080BEB04:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BEB0C: .4byte gSaveBlock1 + 0x2A98
_080BEB10: .4byte 0x0000ffff
_080BEB14: .4byte 0xfffffca0
_080BEB18: .4byte gUnknown_03005D38
_080BEB1C: .4byte gSaveBlock2
	thumb_func_end sub_80BEA88

	thumb_func_start sub_80BEB20
sub_80BEB20: @ 80BEB20
	push {r4-r6,lr}
	ldr r0, _080BEBAC @ =0x00000804
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080BEBA6
	ldr r6, _080BEBB0 @ =gSaveBlock1 + 0x2ABC
	adds r0, r6, 0
	bl sub_80BEBC8
	ldr r5, _080BEBB4 @ =gUnknown_03005D38
	strb r0, [r5]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BEBA6
	ldr r0, _080BEBB8 @ =0x0000028f
	bl sub_80BF77C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BEBA6
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80BEE48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BEBA6
	movs r0, 0
	ldrsb r0, [r5, r0]
	lsls r0, 2
	ldr r1, _080BEBBC @ =0xffffd544
	adds r2, r6, r1
	adds r0, r6, r0
	strb r4, [r0]
	movs r0, 0
	ldrsb r0, [r5, r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, _080BEBC0 @ =0x00002abe
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0]
	movs r0, 0
	ldrsb r0, [r5, r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, _080BEBC4 @ =0x00002abd
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_080BEBA6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BEBAC: .4byte 0x00000804
_080BEBB0: .4byte gSaveBlock1 + 0x2ABC
_080BEBB4: .4byte gUnknown_03005D38
_080BEBB8: .4byte 0x0000028f
_080BEBBC: .4byte 0xffffd544
_080BEBC0: .4byte 0x00002abe
_080BEBC4: .4byte 0x00002abd
	thumb_func_end sub_80BEB20

	thumb_func_start sub_80BEBC8
sub_80BEBC8: @ 80BEBC8
	push {lr}
	adds r2, r0, 0
	movs r1, 0
_080BEBCE:
	lsls r0, r1, 24
	asrs r1, r0, 24
	lsls r0, r1, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BEBE0
	adds r0, r1, 0
	b _080BEBF0
_080BEBE0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	asrs r0, 24
	cmp r0, 0xF
	ble _080BEBCE
	movs r0, 0x1
	negs r0, r0
_080BEBF0:
	pop {r1}
	bx r1
	thumb_func_end sub_80BEBC8

	thumb_func_start sub_80BEBF4
sub_80BEBF4: @ 80BEBF4
	push {r4,lr}
	movs r4, 0
_080BEBF8:
	adds r0, r4, 0
	bl sub_80BEC10
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080BEBF8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BEBF4

	thumb_func_start sub_80BEC10
sub_80BEC10: @ 80BEC10
	lsls r0, 24
	ldr r1, _080BEC30 @ =gSaveBlock1
	lsrs r0, 22
	adds r0, r1
	ldr r2, _080BEC34 @ =0x00002abc
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r3, _080BEC38 @ =0x00002abd
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _080BEC3C @ =0x00002abe
	adds r0, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_080BEC30: .4byte gSaveBlock1
_080BEC34: .4byte 0x00002abc
_080BEC38: .4byte 0x00002abd
_080BEC3C: .4byte 0x00002abe
	thumb_func_end sub_80BEC10

	thumb_func_start sub_80BEC40
sub_80BEC40: @ 80BEC40
	push {r4-r7,lr}
	movs r1, 0
	ldr r6, _080BEC80 @ =gSaveBlock1
_080BEC46:
	ldr r3, _080BEC80 @ =gSaveBlock1
	lsls r2, r1, 2
	adds r0, r2, r3
	ldr r4, _080BEC84 @ =0x00002abc
	adds r0, r4
	ldrb r0, [r0]
	adds r5, r1, 0x1
	cmp r0, 0
	bne _080BEC92
	lsls r0, r5, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bhi _080BEC92
	adds r4, r3, r4
	adds r3, r2, r4
_080BEC64:
	lsls r2, r1, 2
	adds r0, r2, r6
	ldr r7, _080BEC84 @ =0x00002abc
	adds r0, r7
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BEC88
	adds r0, r2, r4
	ldr r0, [r0]
	str r0, [r3]
	adds r0, r1, 0
	bl sub_80BEC10
	b _080BEC92
	.align 2, 0
_080BEC80: .4byte gSaveBlock1
_080BEC84: .4byte 0x00002abc
_080BEC88:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080BEC64
_080BEC92:
	lsls r0, r5, 24
	lsrs r1, r0, 24
	cmp r1, 0xE
	bls _080BEC46
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BEC40

	thumb_func_start sub_80BECA0
sub_80BECA0: @ 80BECA0
	push {r4,lr}
	movs r2, 0
	ldr r3, _080BECCC @ =gSaveBlock1
_080BECA6:
	lsls r0, r2, 2
	adds r1, r0, r3
	ldr r4, _080BECD0 @ =0x00002abc
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BECD4
	adds r4, 0x1
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080BECD4
	adds r4, 0x1
	adds r0, r1, r4
	ldrh r0, [r0]
	cmp r0, 0x2
	bhi _080BECD4
	adds r0, r2, 0
	b _080BECE0
	.align 2, 0
_080BECCC: .4byte gSaveBlock1
_080BECD0: .4byte 0x00002abc
_080BECD4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _080BECA6
	movs r0, 0xFF
_080BECE0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BECA0

	thumb_func_start sub_80BECE8
sub_80BECE8: @ 80BECE8
	push {r4,lr}
	bl sub_80BECA0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	bne _080BED00
	ldr r1, _080BECFC @ =gScriptResult
	movs r0, 0
	b _080BED86
	.align 2, 0
_080BECFC: .4byte gScriptResult
_080BED00:
	ldr r0, _080BED2C @ =gSaveBlock1
	lsls r1, 2
	adds r4, r1, r0
	ldr r0, _080BED30 @ =0x00002abe
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _080BED5C
	ldr r2, _080BED34 @ =0x00002abd
	adds r1, r4, r2
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _080BED38 @ =gLocalTime
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x13
	bgt _080BED40
	ldr r1, _080BED3C @ =gUnknown_083D1444
	subs r2, 0x1
	b _080BED44
	.align 2, 0
_080BED2C: .4byte gSaveBlock1
_080BED30: .4byte 0x00002abe
_080BED34: .4byte 0x00002abd
_080BED38: .4byte gLocalTime
_080BED3C: .4byte gUnknown_083D1444
_080BED40:
	ldr r1, _080BED54 @ =gUnknown_083D1454
	ldr r2, _080BED58 @ =0x00002abc
_080BED44:
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
	b _080BED82
	.align 2, 0
_080BED54: .4byte gUnknown_083D1454
_080BED58: .4byte 0x00002abc
_080BED5C:
	ldrh r1, [r1]
	ldr r0, _080BED90 @ =gStringVar1
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r0, _080BED94 @ =0x00002abd
	adds r1, r4, r0
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080BED98 @ =gUnknown_083D1434
	ldr r2, _080BED9C @ =0x00002abc
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
_080BED82:
	ldr r1, _080BEDA0 @ =gScriptResult
	movs r0, 0x1
_080BED86:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BED90: .4byte gStringVar1
_080BED94: .4byte 0x00002abd
_080BED98: .4byte gUnknown_083D1434
_080BED9C: .4byte 0x00002abc
_080BEDA0: .4byte gScriptResult
	thumb_func_end sub_80BECE8

	thumb_func_start GetPriceReduction
GetPriceReduction: @ 80BEDA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _080BEDB4
	b _080BEDF6
_080BEDB0:
	movs r0, 0x1
	b _080BEDF8
_080BEDB4:
	movs r2, 0
	ldr r4, _080BEDE0 @ =gSaveBlock1
_080BEDB8:
	lsls r0, r2, 2
	adds r1, r0, r4
	ldr r5, _080BEDE4 @ =0x00002abc
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, r3
	bne _080BEDEC
	ldr r2, _080BEDE8 @ =0x00002abd
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080BEDF6
	adds r0, r3, 0
	bl IsPriceDiscounted
	lsls r0, 24
	cmp r0, 0
	bne _080BEDB0
	b _080BEDF6
	.align 2, 0
_080BEDE0: .4byte gSaveBlock1
_080BEDE4: .4byte 0x00002abc
_080BEDE8: .4byte 0x00002abd
_080BEDEC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _080BEDB8
_080BEDF6:
	movs r0, 0
_080BEDF8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetPriceReduction

	thumb_func_start IsPriceDiscounted
IsPriceDiscounted: @ 80BEE00
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BEE12
	cmp r0, 0x3
	beq _080BEE30
_080BEE0E:
	movs r0, 0x1
	b _080BEE3C
_080BEE12:
	ldr r0, _080BEE28 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bne _080BEE3A
	ldr r0, _080BEE2C @ =gUnknown_0202E8DE
	ldrh r0, [r0]
	cmp r0, 0x1A
	beq _080BEE0E
	b _080BEE3A
	.align 2, 0
_080BEE28: .4byte gSaveBlock1
_080BEE2C: .4byte gUnknown_0202E8DE
_080BEE30:
	ldr r0, _080BEE40 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	ldr r0, _080BEE44 @ =0x0000160d
	cmp r1, r0
	beq _080BEE0E
_080BEE3A:
	movs r0, 0
_080BEE3C:
	pop {r1}
	bx r1
	.align 2, 0
_080BEE40: .4byte gSaveBlock1
_080BEE44: .4byte 0x0000160d
	thumb_func_end IsPriceDiscounted

	thumb_func_start sub_80BEE48
sub_80BEE48: @ 80BEE48
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080BEE56
_080BEE52:
	movs r0, 0x1
	b _080BEE74
_080BEE56:
	movs r1, 0
	ldr r4, _080BEE7C @ =gSaveBlock1
	ldr r3, _080BEE80 @ =0x00002abc
_080BEE5C:
	lsls r0, r1, 2
	adds r0, r4
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, r2
	beq _080BEE52
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080BEE5C
	movs r0, 0
_080BEE74:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BEE7C: .4byte gSaveBlock1
_080BEE80: .4byte 0x00002abc
	thumb_func_end sub_80BEE48

	thumb_func_start sub_80BEE84
sub_80BEE84: @ 80BEE84
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r7, r0, 16
	movs r5, 0
	ldr r0, _080BEEB8 @ =gSaveBlock1
	mov r8, r0
_080BEE94:
	lsls r0, r5, 2
	mov r1, r8
	adds r2, r0, r1
	ldr r3, _080BEEBC @ =0x00002abc
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0
	beq _080BEEEC
	ldr r1, _080BEEC0 @ =0x00002abe
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r7
	bcs _080BEEC4
	adds r0, r5, 0
	bl sub_80BEC10
	b _080BEEEC
	.align 2, 0
_080BEEB8: .4byte gSaveBlock1
_080BEEBC: .4byte 0x00002abc
_080BEEC0: .4byte 0x00002abe
_080BEEC4:
	ldr r3, _080BEF04 @ =0x00002abd
	adds r4, r2, r3
	ldrb r0, [r4]
	cmp r0, 0
	bne _080BEEDE
	ldr r0, _080BEF08 @ =0x00000804
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BEEDE
	strb r0, [r4]
_080BEEDE:
	mov r0, r8
	adds r1, r6, r0
	ldr r3, _080BEF0C @ =0x00002abe
	adds r1, r3
	ldrh r0, [r1]
	subs r0, r7
	strh r0, [r1]
_080BEEEC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _080BEE94
	bl sub_80BEC40
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BEF04: .4byte 0x00002abd
_080BEF08: .4byte 0x00000804
_080BEF0C: .4byte 0x00002abe
	thumb_func_end sub_80BEE84

	thumb_func_start sub_80BEF10
sub_80BEF10: @ 80BEF10
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x1
	beq _080BEF50
	cmp r1, 0x1
	bgt _080BEF2A
	cmp r1, 0
	beq _080BEF34
	b _080BEF98
_080BEF2A:
	cmp r2, 0x2
	beq _080BEF6C
	cmp r2, 0x3
	beq _080BEF88
	b _080BEF98
_080BEF34:
	ldr r1, _080BEF48 @ =gUnknown_083D1464
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BEF4C @ =gUnknown_083CE048
	ldr r1, [r1, 0x14]
	bl StringCopy
	b _080BEF98
	.align 2, 0
_080BEF48: .4byte gUnknown_083D1464
_080BEF4C: .4byte gUnknown_083CE048
_080BEF50:
	ldr r1, _080BEF64 @ =gUnknown_083D1464
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BEF68 @ =gUnknown_083CE048
	ldr r1, [r1, 0x18]
	bl StringCopy
	b _080BEF98
	.align 2, 0
_080BEF64: .4byte gUnknown_083D1464
_080BEF68: .4byte gUnknown_083CE048
_080BEF6C:
	ldr r1, _080BEF80 @ =gUnknown_083D1464
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BEF84 @ =gUnknown_083CE048
	ldr r1, [r1, 0x1C]
	bl StringCopy
	b _080BEF98
	.align 2, 0
_080BEF80: .4byte gUnknown_083D1464
_080BEF84: .4byte gUnknown_083CE048
_080BEF88:
	ldr r1, _080BEF9C @ =gUnknown_083D1464
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BEFA0 @ =gUnknown_083CE048
	ldr r1, [r1, 0x20]
	bl StringCopy
_080BEF98:
	pop {r0}
	bx r0
	.align 2, 0
_080BEF9C: .4byte gUnknown_083D1464
_080BEFA0: .4byte gUnknown_083CE048
	thumb_func_end sub_80BEF10

	thumb_func_start CopyContestCategoryToStringVar
CopyContestCategoryToStringVar: @ 80BEFA4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	cmp r0, 0x4
	bhi _080BF054
	lsls r0, 2
	ldr r1, _080BEFBC @ =_080BEFC0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BEFBC: .4byte _080BEFC0
	.align 2, 0
_080BEFC0:
	.4byte _080BEFD4
	.4byte _080BEFF0
	.4byte _080BF00C
	.4byte _080BF028
	.4byte _080BF044
_080BEFD4:
	ldr r1, _080BEFE8 @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BEFEC @ =gUnknown_083CE048
	ldr r1, [r1]
	bl StringCopy
	b _080BF054
	.align 2, 0
_080BEFE8: .4byte gUnknown_083D1464
_080BEFEC: .4byte gUnknown_083CE048
_080BEFF0:
	ldr r1, _080BF004 @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF008 @ =gUnknown_083CE048
	ldr r1, [r1, 0x4]
	bl StringCopy
	b _080BF054
	.align 2, 0
_080BF004: .4byte gUnknown_083D1464
_080BF008: .4byte gUnknown_083CE048
_080BF00C:
	ldr r1, _080BF020 @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF024 @ =gUnknown_083CE048
	ldr r1, [r1, 0x8]
	bl StringCopy
	b _080BF054
	.align 2, 0
_080BF020: .4byte gUnknown_083D1464
_080BF024: .4byte gUnknown_083CE048
_080BF028:
	ldr r1, _080BF03C @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF040 @ =gUnknown_083CE048
	ldr r1, [r1, 0xC]
	bl StringCopy
	b _080BF054
	.align 2, 0
_080BF03C: .4byte gUnknown_083D1464
_080BF040: .4byte gUnknown_083CE048
_080BF044:
	ldr r1, _080BF058 @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF05C @ =gUnknown_083CE048
	ldr r1, [r1, 0x10]
	bl StringCopy
_080BF054:
	pop {r0}
	bx r0
	.align 2, 0
_080BF058: .4byte gUnknown_083D1464
_080BF05C: .4byte gUnknown_083CE048
	thumb_func_end CopyContestCategoryToStringVar

	thumb_func_start SetContestCategoryStringVarForInterview
SetContestCategoryStringVarForInterview: @ 80BF060
	push {lr}
	ldr r0, _080BF080 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF084 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrb r1, [r0, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x1
	bl CopyContestCategoryToStringVar
	pop {r0}
	bx r0
	.align 2, 0
_080BF080: .4byte gUnknown_0202E8CC
_080BF084: .4byte gSaveBlock1 + 0x2738
	thumb_func_end SetContestCategoryStringVarForInterview

	thumb_func_start sub_80BF088
sub_80BF088: @ 80BF088
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	ldr r0, _080BF0B4 @ =gUnknown_083D1464
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	lsls r3, 24
	lsrs r3, 24
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BF0B4: .4byte gUnknown_083D1464
	thumb_func_end sub_80BF088

	thumb_func_start sub_80BF0B8
sub_80BF0B8: @ 80BF0B8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xA
	bl __divsi3
	cmp r0, 0
	beq _080BF144
	adds r0, r4, 0
	movs r1, 0x64
	bl __divsi3
	cmp r0, 0
	bne _080BF0D6
	movs r0, 0x2
	b _080BF14E
_080BF0D6:
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF0E8
	movs r0, 0x3
	b _080BF14E
_080BF0E8:
	ldr r1, _080BF0F8 @ =0x00002710
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF0FC
	movs r0, 0x4
	b _080BF14E
	.align 2, 0
_080BF0F8: .4byte 0x00002710
_080BF0FC:
	ldr r1, _080BF10C @ =0x000186a0
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF110
	movs r0, 0x5
	b _080BF14E
	.align 2, 0
_080BF10C: .4byte 0x000186a0
_080BF110:
	ldr r1, _080BF120 @ =0x000f4240
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF124
	movs r0, 0x6
	b _080BF14E
	.align 2, 0
_080BF120: .4byte 0x000f4240
_080BF124:
	ldr r1, _080BF134 @ =0x00989680
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF138
	movs r0, 0x7
	b _080BF14E
	.align 2, 0
_080BF134: .4byte 0x00989680
_080BF138:
	ldr r1, _080BF148 @ =0x05f5e100
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	beq _080BF14C
_080BF144:
	movs r0, 0x1
	b _080BF14E
	.align 2, 0
_080BF148: .4byte 0x05f5e100
_080BF14C:
	movs r0, 0x8
_080BF14E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF0B8

	thumb_func_start sub_80BF154
sub_80BF154: @ 80BF154
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r7, 0
	movs r5, 0
_080BF166:
	lsls r4, r5, 1
	adds r0, r6, 0x6
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, 0
	beq _080BF186
	bl itemid_get_market_price
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	adds r1, 0xC
	adds r1, r4
	ldrh r1, [r1]
	muls r0, r1
	adds r7, r0
_080BF186:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080BF166
	ldrb r0, [r6, 0x2]
	cmp r0, 0x1
	bne _080BF1A0
	asrs r1, r7, 1
	mov r0, r8
	bl sub_80BF088
	b _080BF1A8
_080BF1A0:
	mov r0, r8
	adds r1, r7, 0
	bl sub_80BF088
_080BF1A8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BF154

	thumb_func_start sub_80BF1B4
sub_80BF1B4: @ 80BF1B4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _080BF1F4 @ =gSaveBlock1 + 0x2738
	bl sub_80BFB94
	adds r5, r0, 0
	movs r4, 0x5
_080BF1C4:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r0, r6
	bne _080BF1F8
	movs r3, 0xFF
	adds r0, r5, 0
	ands r0, r3
	adds r2, r1, 0
	adds r2, 0x22
	ldrb r2, [r2]
	cmp r0, r2
	bne _080BF1F8
	lsrs r0, r5, 8
	ands r0, r3
	adds r1, 0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BF1F8
	movs r0, 0x1
	b _080BF204
	.align 2, 0
_080BF1F4: .4byte gSaveBlock1 + 0x2738
_080BF1F8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x17
	bls _080BF1C4
	movs r0, 0
_080BF204:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF1B4

	thumb_func_start sub_80BF20C
sub_80BF20C: @ 80BF20C
	push {r4-r7,lr}
	movs r2, 0
_080BF210:
	adds r1, r2, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	adds r7, r1, 0
	cmp r5, 0x2
	bhi _080BF248
	ldr r6, _080BF258 @ =gUnknown_02038724
	lsls r0, r2, 2
	adds r4, r0, r6
_080BF222:
	lsls r0, r5, 2
	adds r3, r0, r6
	ldrh r0, [r4, 0x2]
	ldrh r1, [r3, 0x2]
	cmp r0, r1
	bcs _080BF23E
	ldrh r1, [r4]
	adds r2, r0, 0
	ldrh r0, [r3]
	strh r0, [r4]
	ldrh r0, [r3, 0x2]
	strh r0, [r4, 0x2]
	strh r1, [r3]
	strh r2, [r3, 0x2]
_080BF23E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080BF222
_080BF248:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	cmp r2, 0x1
	bls _080BF210
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF258: .4byte gUnknown_02038724
	thumb_func_end sub_80BF20C

	thumb_func_start sub_80BF25C
sub_80BF25C: @ 80BF25C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0
	ldr r3, _080BF28C @ =gSaveBlock1
	ldr r0, _080BF290 @ =0x00002738
	adds r4, r3, r0
_080BF26A:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r3
	ldr r6, _080BF290 @ =0x00002738
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r5
	bne _080BF2AE
	ldr r3, _080BF294 @ =0x00002739
	adds r0, r2, r3
	ldrb r2, [r0]
	cmp r2, 0x1
	bne _080BF29C
	ldr r0, _080BF298 @ =gScriptResult
	strh r2, [r0]
	b _080BF2BC
	.align 2, 0
_080BF28C: .4byte gSaveBlock1
_080BF290: .4byte 0x00002738
_080BF294: .4byte 0x00002739
_080BF298: .4byte gScriptResult
_080BF29C:
	adds r0, r4, 0
	bl sub_80BF55C
	adds r0, r4, 0
	bl sub_80BF588
	bl sub_80BF6D8
	b _080BF2BC
_080BF2AE:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080BF26A
	bl sub_80BF6D8
_080BF2BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BF25C

	thumb_func_start sub_80BF2C4
sub_80BF2C4: @ 80BF2C4
	push {lr}
	ldr r1, _080BF2E0 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080BF2E4 @ =gUnknown_0202E8CE
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x6
	bhi _080BF330
	lsls r0, 2
	ldr r1, _080BF2E8 @ =_080BF2EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BF2E0: .4byte gScriptResult
_080BF2E4: .4byte gUnknown_0202E8CE
_080BF2E8: .4byte _080BF2EC
	.align 2, 0
_080BF2EC:
	.4byte _080BF308
	.4byte _080BF30E
	.4byte _080BF314
	.4byte _080BF31A
	.4byte _080BF320
	.4byte _080BF326
	.4byte _080BF32C
_080BF308:
	bl sub_80BF334
	b _080BF330
_080BF30E:
	bl sub_80BF3A4
	b _080BF330
_080BF314:
	bl sub_80BF3DC
	b _080BF330
_080BF31A:
	bl sub_80BF46C
	b _080BF330
_080BF320:
	bl sub_80BF478
	b _080BF330
_080BF326:
	bl sub_80BF484
	b _080BF330
_080BF32C:
	bl sub_80BF4BC
_080BF330:
	pop {r0}
	bx r0
	thumb_func_end sub_80BF2C4

	thumb_func_start sub_80BF334
sub_80BF334: @ 80BF334
	push {r4,lr}
	movs r0, 0x1
	bl sub_80BF25C
	ldr r0, _080BF38C @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF384
	ldr r4, _080BF390 @ =gStringVar1
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080BF394 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xB
	muls r1, r0
	ldr r0, _080BF398 @ =gSpeciesNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _080BF39C @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF3A0 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	adds r0, 0x4
	movs r1, 0x6
	bl sub_80EB6FC
_080BF384:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF38C: .4byte gScriptResult
_080BF390: .4byte gStringVar1
_080BF394: .4byte gPlayerParty
_080BF398: .4byte gSpeciesNames
_080BF39C: .4byte gUnknown_03005D38
_080BF3A0: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80BF334

	thumb_func_start sub_80BF3A4
sub_80BF3A4: @ 80BF3A4
	push {lr}
	movs r0, 0x2
	bl sub_80BF25C
	ldr r0, _080BF3D0 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF3CC
	ldr r0, _080BF3D4 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF3D8 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	adds r0, 0x4
	movs r1, 0x6
	bl sub_80EB6FC
_080BF3CC:
	pop {r0}
	bx r0
	.align 2, 0
_080BF3D0: .4byte gScriptResult
_080BF3D4: .4byte gUnknown_03005D38
_080BF3D8: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80BF3A4

	thumb_func_start sub_80BF3DC
sub_80BF3DC: @ 80BF3DC
	push {r4-r6,lr}
	movs r0, 0x3
	bl sub_80BF25C
	ldr r0, _080BF450 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF448
	ldr r6, _080BF454 @ =gStringVar1
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080BF458 @ =gPlayerParty
	adds r0, r4
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xB
	muls r1, r0
	ldr r0, _080BF45C @ =gSpeciesNames
	adds r1, r0
	adds r0, r6, 0
	bl StringCopy
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	muls r0, r5
	adds r0, r4
	ldr r4, _080BF460 @ =gStringVar2
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	ldr r0, _080BF464 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF468 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	adds r0, 0x1C
	movs r1, 0x2
	bl sub_80EB6FC
_080BF448:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF450: .4byte gScriptResult
_080BF454: .4byte gStringVar1
_080BF458: .4byte gPlayerParty
_080BF45C: .4byte gSpeciesNames
_080BF460: .4byte gStringVar2
_080BF464: .4byte gUnknown_03005D38
_080BF468: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80BF3DC

	thumb_func_start sub_80BF46C
sub_80BF46C: @ 80BF46C
	ldr r1, _080BF474 @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	bx lr
	.align 2, 0
_080BF474: .4byte gScriptResult
	thumb_func_end sub_80BF46C

	thumb_func_start sub_80BF478
sub_80BF478: @ 80BF478
	push {lr}
	movs r0, 0x5
	bl sub_80BF25C
	pop {r0}
	bx r0
	thumb_func_end sub_80BF478

	thumb_func_start sub_80BF484
sub_80BF484: @ 80BF484
	push {lr}
	movs r0, 0x6
	bl sub_80BF25C
	ldr r0, _080BF4B0 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF4AC
	ldr r0, _080BF4B4 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF4B8 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	adds r0, 0x4
	movs r1, 0x2
	bl sub_80EB6FC
_080BF4AC:
	pop {r0}
	bx r0
	.align 2, 0
_080BF4B0: .4byte gScriptResult
_080BF4B4: .4byte gUnknown_03005D38
_080BF4B8: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80BF484

	thumb_func_start sub_80BF4BC
sub_80BF4BC: @ 80BF4BC
	push {lr}
	movs r0, 0x7
	bl sub_80BF25C
	ldr r0, _080BF4E8 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF4E4
	ldr r0, _080BF4EC @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF4F0 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	adds r0, 0x18
	movs r1, 0x1
	bl sub_80EB6FC
_080BF4E4:
	pop {r0}
	bx r0
	.align 2, 0
_080BF4E8: .4byte gScriptResult
_080BF4EC: .4byte gUnknown_03005D38
_080BF4F0: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80BF4BC

	thumb_func_start sub_80BF4F4
sub_80BF4F4: @ 80BF4F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _080BF530 @ =gPlayerParty
	adds r4, r0
	ldr r5, _080BF534 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r5, 0
	bl GetMonData
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xB
	muls r0, r1
	ldr r1, _080BF538 @ =gSpeciesNames
	adds r0, r1
	adds r1, r5, 0
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _080BF53C
	movs r0, 0x1
	b _080BF53E
	.align 2, 0
_080BF530: .4byte gPlayerParty
_080BF534: .4byte gStringVar1
_080BF538: .4byte gSpeciesNames
_080BF53C:
	movs r0, 0
_080BF53E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF4F4

	thumb_func_start sub_80BF544
sub_80BF544: @ 80BF544
	push {lr}
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BF4F4
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80BF544

	thumb_func_start sub_80BF55C
sub_80BF55C: @ 80BF55C
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r1, 3
	adds r2, r1
	lsls r2, 2
	adds r2, r0
	movs r0, 0
	strb r0, [r2]
	strb r0, [r2, 0x1]
	movs r1, 0
	adds r2, 0x2
	movs r3, 0
_080BF576:
	adds r0, r2, r1
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x21
	bls _080BF576
	pop {r0}
	bx r0
	thumb_func_end sub_80BF55C

	thumb_func_start sub_80BF588
sub_80BF588: @ 80BF588
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r5, 0
_080BF58E:
	lsls r0, r5, 3
	adds r0, r5
	lsls r1, r0, 2
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BF5D2
	adds r0, r5, 0x1
	b _080BF5CA
_080BF5A0:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r4
	ldrb r0, [r3]
	cmp r0, 0
	beq _080BF5C8
	adds r1, r4
	adds r0, r3, 0
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80BF55C
	b _080BF5D2
_080BF5C8:
	adds r0, r2, 0x1
_080BF5CA:
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x4
	bls _080BF5A0
_080BF5D2:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080BF58E
	movs r5, 0x5
_080BF5DE:
	lsls r0, r5, 3
	adds r0, r5
	lsls r1, r0, 2
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r5, 0x1
	cmp r0, 0
	bne _080BF62A
	lsls r0, r5, 24
	b _080BF624
_080BF5F2:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r4
	ldrb r0, [r3]
	cmp r0, 0
	beq _080BF620
	adds r1, r4
	adds r0, r3, 0
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldr r0, _080BF61C @ =gSaveBlock1 + 0x2738
	adds r1, r2, 0
	bl sub_80BF55C
	b _080BF62A
	.align 2, 0
_080BF61C: .4byte gSaveBlock1 + 0x2738
_080BF620:
	adds r0, r2, 0x1
	lsls r0, 24
_080BF624:
	lsrs r2, r0, 24
	cmp r2, 0x17
	bls _080BF5F2
_080BF62A:
	lsls r0, r5, 24
	lsrs r5, r0, 24
	cmp r5, 0x17
	bls _080BF5DE
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BF588

	thumb_func_start sub_80BF638
sub_80BF638: @ 80BF638
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	lsrs r0, 16
	bl sub_80BF674
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _080BF66C @ =gUnknown_083D1464
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	movs r1, 0xB
	muls r1, r5
	ldr r2, _080BF670 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BF66C: .4byte gUnknown_083D1464
_080BF670: .4byte gSpeciesNames
	thumb_func_end sub_80BF638

	thumb_func_start sub_80BF674
sub_80BF674: @ 80BF674
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080BF694 @ =0x0000019b
	bl __umodsi3
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, r4, 0
	b _080BF6B2
	.align 2, 0
_080BF694: .4byte 0x0000019b
_080BF698:
	cmp r4, 0x1
	bne _080BF6A4
	ldr r4, _080BF6A0 @ =0x0000019b
	b _080BF6AA
	.align 2, 0
_080BF6A0: .4byte 0x0000019b
_080BF6A4:
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080BF6AA:
	cmp r4, r6
	bne _080BF6B2
	adds r4, r5, 0
	b _080BF6CE
_080BF6B2:
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl sub_8090D90
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _080BF698
	cmp r4, r5
	beq _080BF698
_080BF6CE:
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF674

	thumb_func_start sub_80BF6D8
sub_80BF6D8: @ 80BF6D8
	push {lr}
	ldr r0, _080BF700 @ =gSaveBlock1 + 0x2738
	bl sub_80BF720
	ldr r1, _080BF704 @ =gUnknown_03005D38
	strb r0, [r1]
	ldr r2, _080BF708 @ =gUnknown_0202E8D0
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	strh r1, [r2]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080BF710
	ldr r1, _080BF70C @ =gScriptResult
	movs r0, 0x1
	b _080BF714
	.align 2, 0
_080BF700: .4byte gSaveBlock1 + 0x2738
_080BF704: .4byte gUnknown_03005D38
_080BF708: .4byte gUnknown_0202E8D0
_080BF70C: .4byte gScriptResult
_080BF710:
	ldr r1, _080BF71C @ =gScriptResult
	movs r0, 0
_080BF714:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080BF71C: .4byte gScriptResult
	thumb_func_end sub_80BF6D8

	thumb_func_start sub_80BF720
sub_80BF720: @ 80BF720
	push {lr}
	adds r2, r0, 0
	movs r1, 0
_080BF726:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BF73A
	lsls r0, r1, 24
	asrs r0, 24
	b _080BF748
_080BF73A:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080BF726
	movs r0, 0x1
	negs r0, r0
_080BF748:
	pop {r1}
	bx r1
	thumb_func_end sub_80BF720

	thumb_func_start sub_80BF74C
sub_80BF74C: @ 80BF74C
	push {lr}
	adds r2, r0, 0
	movs r1, 0x5
_080BF752:
	lsls r0, r1, 24
	asrs r1, r0, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BF768
	adds r0, r1, 0
	b _080BF778
_080BF768:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	asrs r0, 24
	cmp r0, 0x17
	ble _080BF752
	movs r0, 0x1
	negs r0, r0
_080BF778:
	pop {r1}
	bx r1
	thumb_func_end sub_80BF74C

	thumb_func_start sub_80BF77C
sub_80BF77C: @ 80BF77C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	bls _080BF794
	movs r0, 0x1
	b _080BF796
_080BF794:
	movs r0, 0
_080BF796:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF77C

	thumb_func_start sub_80BF79C
sub_80BF79C: @ 80BF79C
	push {r4-r6,lr}
	adds r4, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r4, 0x4
	ldr r6, _080BF7B8 @ =0x0000ffff
	b _080BF7C2
	.align 2, 0
_080BF7B8: .4byte 0x0000ffff
_080BF7BC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080BF7C2:
	cmp r2, 0x6
	bne _080BF7C8
	movs r2, 0
_080BF7C8:
	lsls r1, r2, 1
	adds r0, r5, r1
	ldrh r0, [r0]
	adds r3, r4, 0x4
	cmp r0, r6
	beq _080BF7BC
	ldr r0, _080BF7E4 @ =gStringVar3
	adds r1, r3, r1
	ldrh r1, [r1]
	bl sub_80EB3FC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF7E4: .4byte gStringVar3
	thumb_func_end sub_80BF79C

	thumb_func_start sub_80BF7E8
sub_80BF7E8: @ 80BF7E8
	push {lr}
	adds r2, r0, 0
	movs r3, 0
	movs r1, 0
	ldrb r0, [r2, 0x4]
	cmp r0, 0xFF
	beq _080BF814
	adds r2, 0x4
_080BF7F8:
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, r3, r0
	lsls r0, 16
	lsrs r3, r0, 16
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xA
	bhi _080BF814
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BF7F8
_080BF814:
	movs r0, 0x7
	ands r3, r0
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80BF7E8

	thumb_func_start sub_80BF820
sub_80BF820: @ 80BF820
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	lsrs r4, 16
	movs r2, 0
	movs r7, 0xFF
_080BF844:
	mov r1, sp
	adds r0, r1, r2
	ldrb r1, [r0]
	orrs r1, r7
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _080BF844
	cmp r3, 0
	bne _080BF8A6
	ldr r4, [sp, 0x20]
	adds r4, 0xF
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r6, 0
	bne _080BF874
	mov r0, sp
	adds r1, r4, r5
	b _080BF920
_080BF874:
	cmp r6, 0x1
	bne _080BF880
	mov r0, sp
	subs r1, r2, r5
	adds r1, r4, r1
	b _080BF920
_080BF880:
	cmp r6, 0x2
	bne _080BF892
	mov r1, sp
	adds r0, r4, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, 0x1
	adds r0, r4, r0
	b _080BF950
_080BF892:
	mov r1, sp
	subs r0, r2, 0x2
	subs r0, r5
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r1]
	subs r0, r2, 0x1
	subs r0, r5
	adds r0, r4, r0
	b _080BF950
_080BF8A6:
	cmp r3, 0x1
	bne _080BF8F4
	ldr r4, [sp, 0x20]
	adds r4, 0x4
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r6, 0
	bne _080BF8C2
	mov r0, sp
	adds r1, r4, r5
	b _080BF920
_080BF8C2:
	cmp r6, 0x1
	bne _080BF8CE
	mov r0, sp
	subs r1, r2, r5
	adds r1, r4, r1
	b _080BF920
_080BF8CE:
	cmp r6, 0x2
	bne _080BF8E0
	mov r1, sp
	adds r0, r4, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, 0x1
	adds r0, r4, r0
	b _080BF950
_080BF8E0:
	mov r1, sp
	subs r0, r2, 0x2
	subs r0, r5
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r1]
	subs r0, r2, 0x1
	subs r0, r5
	adds r0, r4, r0
	b _080BF950
_080BF8F4:
	movs r0, 0xB
	muls r4, r0
	ldr r7, _080BF910 @ =gSpeciesNames
	adds r0, r4, r7
	bl StringLength
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r6, 0
	bne _080BF914
	mov r0, sp
	adds r1, r5, r4
	b _080BF91E
	.align 2, 0
_080BF910: .4byte gSpeciesNames
_080BF914:
	cmp r6, 0x1
	bne _080BF926
	mov r0, sp
	subs r1, r2, r5
	adds r1, r4
_080BF91E:
	adds r1, r7
_080BF920:
	ldrb r1, [r1]
	strb r1, [r0]
	b _080BF954
_080BF926:
	cmp r6, 0x2
	bne _080BF93A
	mov r1, sp
	adds r0, r5, r4
	adds r0, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	adds r0, r5, r0
	b _080BF94E
_080BF93A:
	mov r1, sp
	subs r0, r2, 0x2
	subs r0, r5
	adds r0, r4
	adds r0, r7
	ldrb r0, [r0]
	strb r0, [r1]
	subs r0, r2, 0x1
	subs r0, r5
	adds r0, r4
_080BF94E:
	adds r0, r7
_080BF950:
	ldrb r0, [r0]
	strb r0, [r1, 0x1]
_080BF954:
	ldr r0, _080BF970 @ =gUnknown_083D1464
	mov r2, r8
	lsls r1, r2, 2
	adds r1, r0
	ldr r0, [r1]
	mov r1, sp
	bl StringCopy
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF970: .4byte gUnknown_083D1464
	thumb_func_end sub_80BF820

	thumb_func_start sub_80BF974
sub_80BF974: @ 80BF974
	push {r4,lr}
	movs r1, 0
	ldr r4, _080BF994 @ =gSaveBlock1
	ldr r0, _080BF998 @ =gUnknown_0202E8CC
	ldrh r2, [r0]
	ldr r3, _080BF99C @ =0x00002738
_080BF980:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _080BF9A0
	movs r0, 0x1
	b _080BF9AC
	.align 2, 0
_080BF994: .4byte gSaveBlock1
_080BF998: .4byte gUnknown_0202E8CC
_080BF99C: .4byte 0x00002738
_080BF9A0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080BF980
	movs r0, 0
_080BF9AC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF974

	thumb_func_start sub_80BF9B4
sub_80BF9B4: @ 80BF9B4
	push {r4,lr}
	ldr r0, _080BF9E0 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BF9E4 @ =gPlayerParty
	adds r0, r1
	ldr r4, _080BF9E8 @ =gStringVar1
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	ldr r0, _080BF9EC @ =gStringVar3
	adds r1, r4, 0
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _080BF9F0
	bl sub_80BE478
	movs r0, 0x1
	b _080BF9F2
	.align 2, 0
_080BF9E0: .4byte gUnknown_0202E8CC
_080BF9E4: .4byte gPlayerParty
_080BF9E8: .4byte gStringVar1
_080BF9EC: .4byte gStringVar3
_080BF9F0:
	movs r0, 0
_080BF9F2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF9B4

	thumb_func_start sub_80BF9F8
sub_80BF9F8: @ 80BF9F8
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	ldr r0, _080BFAA0 @ =gUnknown_0202E8CC
	mov r9, r0
	ldrh r0, [r0]
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r6, _080BFAA4 @ =gPlayerParty
	adds r0, r6
	ldr r2, _080BFAA8 @ =gStringVar3
	movs r1, 0x2
	bl GetMonData
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	ldr r1, _080BFAAC @ =gStringVar2
	mov r10, r1
	movs r1, 0x2
	mov r2, r10
	bl GetMonData
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	bl GetMonGender
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	ldr r0, _080BFAB0 @ =c2_080CC144
	str r0, [sp, 0x4]
	movs r0, 0x3
	mov r1, r10
	adds r2, r5, 0
	adds r3, r4, 0
	bl DoNamingScreen
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BFAA0: .4byte gUnknown_0202E8CC
_080BFAA4: .4byte gPlayerParty
_080BFAA8: .4byte gStringVar3
_080BFAAC: .4byte gStringVar2
_080BFAB0: .4byte c2_080CC144
	thumb_func_end sub_80BF9F8

	thumb_func_start c2_080CC144
c2_080CC144: @ 80BFAB4
	push {lr}
	ldr r0, _080BFAD4 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BFAD8 @ =gPlayerParty
	adds r0, r1
	ldr r2, _080BFADC @ =gStringVar2
	movs r1, 0x2
	bl SetMonData
	bl c2_exit_to_overworld_1_continue_scripts_restart_music
	pop {r0}
	bx r0
	.align 2, 0
_080BFAD4: .4byte gUnknown_0202E8CC
_080BFAD8: .4byte gPlayerParty
_080BFADC: .4byte gStringVar2
	thumb_func_end c2_080CC144

	thumb_func_start sub_80BFAE0
sub_80BFAE0: @ 80BFAE0
	push {r4,lr}
	ldr r0, _080BFB04 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BFB08 @ =gPlayerParty
	adds r0, r1
	ldr r4, _080BFB0C @ =gStringVar1
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BFB04: .4byte gUnknown_0202E8CC
_080BFB08: .4byte gPlayerParty
_080BFB0C: .4byte gStringVar1
	thumb_func_end sub_80BFAE0

	thumb_func_start sub_80BFB10
sub_80BFB10: @ 80BFB10
	push {r4,lr}
	bl sub_80BFB94
	adds r4, r0, 0
	ldr r0, _080BFB38 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BFB3C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	bne _080BFB44
	ldr r1, _080BFB40 @ =gScriptResult
	movs r0, 0
	b _080BFB48
	.align 2, 0
_080BFB38: .4byte gUnknown_0202E8CC
_080BFB3C: .4byte gPlayerParty
_080BFB40: .4byte gScriptResult
_080BFB44:
	ldr r1, _080BFB50 @ =gScriptResult
	movs r0, 0x1
_080BFB48:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BFB50: .4byte gScriptResult
	thumb_func_end sub_80BFB10

	thumb_func_start sub_80BFB54
sub_80BFB54: @ 80BFB54
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	cmp r1, 0
	beq _080BFB8A
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _080BFB6E
	movs r0, 0x2
	b _080BFB90
_080BFB6E:
	adds r0, r1, 0
	subs r0, 0x15
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _080BFB7E
	movs r0, 0x3
	b _080BFB90
_080BFB7E:
	adds r0, r2, 0
	subs r0, 0x29
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _080BFB8E
_080BFB8A:
	movs r0, 0
	b _080BFB90
_080BFB8E:
	movs r0, 0x4
_080BFB90:
	pop {r1}
	bx r1
	thumb_func_end sub_80BFB54

	thumb_func_start sub_80BFB94
sub_80BFB94: @ 80BFB94
	ldr r2, _080BFBAC @ =gSaveBlock2
	ldrb r0, [r2, 0xD]
	lsls r0, 24
	ldrb r1, [r2, 0xC]
	lsls r1, 16
	orrs r0, r1
	ldrb r1, [r2, 0xB]
	lsls r1, 8
	orrs r0, r1
	ldrb r1, [r2, 0xA]
	orrs r0, r1
	bx lr
	.align 2, 0
_080BFBAC: .4byte gSaveBlock2
	thumb_func_end sub_80BFB94

	thumb_func_start CheckForBigMovieOrEmergencyNewsOnTV
CheckForBigMovieOrEmergencyNewsOnTV: @ 80BFBB0
	push {lr}
	ldr r1, _080BFBD0 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x1
	bne _080BFBCC
	ldr r0, _080BFBD4 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _080BFBD8
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, 0
	beq _080BFBE0
_080BFBCC:
	movs r0, 0
	b _080BFC0A
	.align 2, 0
_080BFBD0: .4byte gSaveBlock1
_080BFBD4: .4byte gSaveBlock2
_080BFBD8:
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, 0x2
	bne _080BFBCC
_080BFBE0:
	ldr r0, _080BFC04 @ =0x0000085d
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BFBFE
	movs r0, 0x83
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BFC08
_080BFBFE:
	movs r0, 0x1
	b _080BFC0A
	.align 2, 0
_080BFC04: .4byte 0x0000085d
_080BFC08:
	movs r0, 0x2
_080BFC0A:
	pop {r1}
	bx r1
	thumb_func_end CheckForBigMovieOrEmergencyNewsOnTV

	thumb_func_start GetMomOrDadStringForTVMessage
GetMomOrDadStringForTVMessage: @ 80BFC10
	push {r4,lr}
	ldr r1, _080BFC40 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x1
	bne _080BFC6C
	ldr r0, _080BFC44 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _080BFC54
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bne _080BFC6C
	ldr r0, _080BFC48 @ =gStringVar1
	ldr r1, _080BFC4C @ =gOtherText_Mom
	bl StringCopy
	ldr r0, _080BFC50 @ =0x00004003
	movs r1, 0x1
	bl VarSet
	b _080BFC6C
	.align 2, 0
_080BFC40: .4byte gSaveBlock1
_080BFC44: .4byte gSaveBlock2
_080BFC48: .4byte gStringVar1
_080BFC4C: .4byte gOtherText_Mom
_080BFC50: .4byte 0x00004003
_080BFC54:
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, 0x2
	bne _080BFC6C
	ldr r0, _080BFCB4 @ =gStringVar1
	ldr r1, _080BFCB8 @ =gOtherText_Mom
	bl StringCopy
	ldr r0, _080BFCBC @ =0x00004003
	movs r1, 0x1
	bl VarSet
_080BFC6C:
	ldr r4, _080BFCBC @ =0x00004003
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _080BFCAA
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	beq _080BFCC0
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bls _080BFCD4
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080BFCC0
_080BFCAA:
	ldr r0, _080BFCB4 @ =gStringVar1
	ldr r1, _080BFCB8 @ =gOtherText_Mom
	bl StringCopy
	b _080BFD10
	.align 2, 0
_080BFCB4: .4byte gStringVar1
_080BFCB8: .4byte gOtherText_Mom
_080BFCBC: .4byte 0x00004003
_080BFCC0:
	ldr r0, _080BFCCC @ =gStringVar1
	ldr r1, _080BFCD0 @ =gOtherText_Dad
	bl StringCopy
	b _080BFD10
	.align 2, 0
_080BFCCC: .4byte gStringVar1
_080BFCD0: .4byte gOtherText_Dad
_080BFCD4:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080BFD00
	ldr r0, _080BFCF8 @ =gStringVar1
	ldr r1, _080BFCFC @ =gOtherText_Mom
	bl StringCopy
	adds r0, r4, 0
	movs r1, 0x1
	bl VarSet
	b _080BFD10
	.align 2, 0
_080BFCF8: .4byte gStringVar1
_080BFCFC: .4byte gOtherText_Mom
_080BFD00:
	ldr r0, _080BFD18 @ =gStringVar1
	ldr r1, _080BFD1C @ =gOtherText_Dad
	bl StringCopy
	adds r0, r4, 0
	movs r1, 0x2
	bl VarSet
_080BFD10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BFD18: .4byte gStringVar1
_080BFD1C: .4byte gOtherText_Dad
	thumb_func_end GetMomOrDadStringForTVMessage

	thumb_func_start sub_80BFD20
sub_80BFD20: @ 80BFD20
	push {lr}
	ldr r0, _080BFD3C @ =0x000040bc
	movs r1, 0
	bl VarSet
	ldr r0, _080BFD40 @ =gSaveBlock1
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x5
	bl RemoveFieldObjectByLocalIdAndMap
	pop {r0}
	bx r0
	.align 2, 0
_080BFD3C: .4byte 0x000040bc
_080BFD40: .4byte gSaveBlock1
	thumb_func_end sub_80BFD20

	thumb_func_start sub_80BFD44
sub_80BFD44: @ 80BFD44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r6, r2, 24
	movs r4, 0
_080BFD54:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 5
	adds r0, r4
	lsls r0, 2
	ldr r5, _080BFD8C @ =0x02007000
	adds r0, r5
	adds r1, r4, 0
	muls r1, r7
	add r1, r8
	movs r2, 0xE1
	lsls r2, 2
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080BFD54
	adds r4, r5, 0
	cmp r6, 0x1
	beq _080BFDBC
	cmp r6, 0x1
	bgt _080BFD90
	cmp r6, 0
	beq _080BFD9A
	b _080BFDFC
	.align 2, 0
_080BFD8C: .4byte 0x02007000
_080BFD90:
	cmp r6, 0x2
	beq _080BFDCC
	cmp r6, 0x3
	beq _080BFDE8
	b _080BFDFC
_080BFD9A:
	ldr r0, _080BFDB4 @ =gSaveBlock1 + 0x2738
	movs r2, 0xE1
	lsls r2, 2
	adds r1, r4, r2
	movs r3, 0xE1
	lsls r3, 3
	adds r2, r4, r3
	ldr r5, _080BFDB8 @ =0x00000a8c
	adds r3, r4, r5
	bl sub_80BFE24
	b _080BFDFC
	.align 2, 0
_080BFDB4: .4byte gSaveBlock1 + 0x2738
_080BFDB8: .4byte 0x00000a8c
_080BFDBC:
	ldr r1, _080BFDC8 @ =gSaveBlock1 + 0x2738
	movs r0, 0xE1
	lsls r0, 3
	adds r2, r4, r0
	b _080BFDD4
	.align 2, 0
_080BFDC8: .4byte gSaveBlock1 + 0x2738
_080BFDCC:
	movs r0, 0xE1
	lsls r0, 2
	adds r1, r4, r0
	ldr r2, _080BFDE0 @ =gSaveBlock1 + 0x2738
_080BFDD4:
	ldr r5, _080BFDE4 @ =0x00000a8c
	adds r3, r4, r5
	adds r0, r4, 0
	bl sub_80BFE24
	b _080BFDFC
	.align 2, 0
_080BFDE0: .4byte gSaveBlock1 + 0x2738
_080BFDE4: .4byte 0x00000a8c
_080BFDE8:
	movs r0, 0xE1
	lsls r0, 2
	adds r1, r5, r0
	movs r3, 0xE1
	lsls r3, 3
	adds r2, r5, r3
	ldr r3, _080BFE20 @ =gSaveBlock1 + 0x2738
	adds r0, r5, 0
	bl sub_80BFE24
_080BFDFC:
	ldr r4, _080BFE20 @ =gSaveBlock1 + 0x2738
	adds r0, r4, 0
	bl sub_80BF588
	bl sub_80C04A0
	adds r0, r4, 0
	bl sub_80BF588
	bl sub_80C01D4
	bl sub_80C0408
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BFE20: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80BFD44

	thumb_func_start sub_80BFE24
sub_80BFE24: @ 80BFE24
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	str r0, [sp, 0x10]
	str r1, [sp, 0x14]
	str r2, [sp, 0x18]
	str r3, [sp, 0x1C]
	add r0, sp, 0x10
	str r0, [sp]
	add r0, sp, 0x14
	str r0, [sp, 0x4]
	add r0, sp, 0x18
	str r0, [sp, 0x8]
	add r0, sp, 0x1C
	str r0, [sp, 0xC]
	bl GetLinkPlayerCount
	ldr r1, _080BFEA0 @ =gUnknown_03000720
	strb r0, [r1]
_080BFE50:
	movs r6, 0
	ldr r0, _080BFEA0 @ =gUnknown_03000720
	ldrb r1, [r0]
	cmp r6, r1
	bcs _080BFE50
	mov r10, r0
_080BFE5C:
	cmp r6, 0
	bne _080BFE64
	ldr r2, _080BFEA4 @ =gUnknown_020387E4
	strb r6, [r2]
_080BFE64:
	lsls r4, r6, 2
	mov r3, sp
	adds r0, r3, r4
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_80C019C
	ldr r1, _080BFEA8 @ =gUnknown_03000722
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	adds r7, r4, 0
	cmp r0, r1
	bne _080BFEAC
	ldr r1, _080BFEA4 @ =gUnknown_020387E4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	mov r2, r10
	ldrb r2, [r2]
	cmp r0, r2
	beq _080BFF58
	adds r6, 0x1
	mov r9, r6
	b _080BFF3C
	.align 2, 0
_080BFEA0: .4byte gUnknown_03000720
_080BFEA4: .4byte gUnknown_020387E4
_080BFEA8: .4byte gUnknown_03000722
_080BFEAC:
	movs r5, 0
	mov r3, r10
	ldrb r0, [r3]
	subs r0, 0x1
	adds r2, r6, 0x1
	mov r9, r2
	cmp r5, r0
	bge _080BFF22
	ldr r3, _080BFF4C @ =gUnknown_03000720
	mov r8, r3
_080BFEC0:
	adds r0, r6, r5
	adds r4, r0, 0x1
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r4, 0
	bl __modsi3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_80BF74C
	ldr r1, _080BFF50 @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BFF12
	mov r2, r8
	ldrb r1, [r2]
	adds r0, r4, 0
	bl __modsi3
	adds r2, r0, 0
	lsls r0, r2, 2
	add r0, sp
	ldr r0, [r0]
	mov r3, sp
	adds r1, r3, r7
	ldr r1, [r1]
	lsls r2, 24
	lsrs r2, 24
	bl sub_80BFF68
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BFF22
_080BFF12:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r8
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r5, r0
	blt _080BFEC0
_080BFF22:
	mov r2, r10
	ldrb r0, [r2]
	subs r0, 0x1
	cmp r5, r0
	bne _080BFF3C
	mov r3, sp
	adds r0, r3, r7
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, _080BFF54 @ =gUnknown_03000722
	ldrb r1, [r1]
	bl sub_80BF55C
_080BFF3C:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r6, r0, 24
	mov r2, r10
	ldrb r2, [r2]
	cmp r6, r2
	bcc _080BFE5C
	b _080BFE50
	.align 2, 0
_080BFF4C: .4byte gUnknown_03000720
_080BFF50: .4byte gUnknown_03005D38
_080BFF54: .4byte gUnknown_03000722
_080BFF58:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BFE24

	thumb_func_start sub_80BFF68
sub_80BFF68: @ 80BFF68
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r4, [r0]
	ldr r6, [r1]
	movs r5, 0
	ldr r2, _080BFFA4 @ =gUnknown_03000722
	movs r1, 0
	ldrsb r1, [r2, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0]
	str r2, [sp]
	bl sub_80BFB54
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	ldr r2, [sp]
	cmp r0, 0x3
	beq _080BFFD8
	cmp r0, 0x3
	bgt _080BFFA8
	cmp r0, 0x2
	beq _080BFFAE
	b _080C0026
	.align 2, 0
_080BFFA4: .4byte gUnknown_03000722
_080BFFA8:
	cmp r1, 0x4
	beq _080C0000
	b _080C0026
_080BFFAE:
	ldr r0, _080BFFD4 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r6, r1
	adds r2, r7, 0
	bl sub_80C004C
	b _080C0022
	.align 2, 0
_080BFFD4: .4byte gUnknown_03005D38
_080BFFD8:
	ldr r0, _080BFFFC @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r6, r1
	adds r2, r7, 0
	bl sub_80C00B4
	b _080C0022
	.align 2, 0
_080BFFFC: .4byte gUnknown_03005D38
_080C0000:
	ldr r0, _080C0030 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r6, r1
	adds r2, r7, 0
	bl sub_80C0134
_080C0022:
	lsls r0, 24
	lsrs r5, r0, 24
_080C0026:
	cmp r5, 0x1
	beq _080C0034
	movs r0, 0
	b _080C0040
	.align 2, 0
_080C0030: .4byte gUnknown_03005D38
_080C0034:
	ldr r0, _080C0048 @ =gUnknown_03000722
	ldrb r1, [r0]
	adds r0, r6, 0
	bl sub_80BF55C
	movs r0, 0x1
_080C0040:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C0048: .4byte gUnknown_03000722
	thumb_func_end sub_80BFF68

	thumb_func_start sub_80C004C
sub_80C004C: @ 80C004C
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	bl GetLinkPlayerTrainerId
	adds r5, r0, 0
	movs r2, 0xFF
	ands r0, r2
	adds r1, r4, 0
	adds r1, 0x22
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C007C
	lsrs r0, r5, 8
	ands r0, r2
	adds r1, r4, 0
	adds r1, 0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C007C
	movs r0, 0
	b _080C00AC
_080C007C:
	adds r1, r4, 0
	adds r1, 0x20
	ldrb r0, [r1]
	adds r2, r4, 0
	adds r2, 0x22
	strb r0, [r2]
	adds r3, r4, 0
	adds r3, 0x21
	ldrb r0, [r3]
	adds r2, 0x1
	strb r0, [r2]
	strb r5, [r1]
	lsrs r0, r5, 8
	strb r0, [r3]
	adds r1, r6, 0
	adds r0, r4, 0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r0, 0x1
	strb r0, [r6, 0x1]
_080C00AC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C004C

	thumb_func_start sub_80C00B4
sub_80C00B4: @ 80C00B4
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	bl GetLinkPlayerTrainerId
	adds r2, r0, 0
	movs r3, 0xFF
	ands r0, r3
	adds r1, r4, 0
	adds r1, 0x20
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C00E0
	lsrs r0, r2, 8
	ands r0, r3
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	cmp r0, r1
	beq _080C0100
_080C00E0:
	movs r3, 0xFF
	adds r0, r2, 0
	ands r0, r3
	adds r1, r4, 0
	adds r1, 0x22
	lsrs r5, r2, 8
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C0104
	adds r0, r5, 0
	ands r0, r3
	adds r1, r4, 0
	adds r1, 0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C0104
_080C0100:
	movs r0, 0
	b _080C012C
_080C0104:
	ldrb r1, [r4, 0x1E]
	adds r0, r4, 0
	adds r0, 0x20
	strb r1, [r0]
	ldrb r0, [r4, 0x1F]
	adds r1, r4, 0
	adds r1, 0x21
	strb r0, [r1]
	strb r2, [r4, 0x1E]
	strb r5, [r4, 0x1F]
	adds r1, r6, 0
	adds r0, r4, 0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r0, 0x1
	strb r0, [r6, 0x1]
_080C012C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C00B4

	thumb_func_start sub_80C0134
sub_80C0134: @ 80C0134
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	bl GetLinkPlayerTrainerId
	adds r5, r0, 0
	movs r2, 0xFF
	ands r0, r2
	adds r1, r4, 0
	adds r1, 0x22
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C0164
	lsrs r0, r5, 8
	ands r0, r2
	adds r1, r4, 0
	adds r1, 0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C0164
	movs r0, 0
	b _080C0196
_080C0164:
	adds r1, r4, 0
	adds r1, 0x20
	ldrb r0, [r1]
	adds r2, r4, 0
	adds r2, 0x22
	strb r0, [r2]
	adds r3, r4, 0
	adds r3, 0x21
	ldrb r0, [r3]
	adds r2, 0x1
	strb r0, [r2]
	strb r5, [r1]
	lsrs r0, r5, 8
	strb r0, [r3]
	adds r1, r6, 0
	adds r0, r4, 0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r0, 0x1
	strb r0, [r6, 0x1]
	strh r0, [r6, 0x16]
_080C0196:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C0134

	thumb_func_start sub_80C019C
sub_80C019C: @ 80C019C
	push {lr}
	adds r3, r0, 0
	movs r2, 0
_080C01A2:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r3
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _080C01C2
	ldrb r0, [r1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bhi _080C01C2
	lsls r0, r2, 24
	asrs r0, 24
	b _080C01D0
_080C01C2:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x17
	bls _080C01A2
	movs r0, 0x1
	negs r0, r0
_080C01D0:
	pop {r1}
	bx r1
	thumb_func_end sub_80C019C

	thumb_func_start sub_80C01D4
sub_80C01D4: @ 80C01D4
	push {r4-r6,lr}
	movs r6, 0
_080C01D8:
	ldr r0, _080C01F8 @ =gSaveBlock1
	lsls r2, r6, 3
	adds r1, r2, r6
	lsls r1, 2
	adds r1, r0
	ldr r0, _080C01FC @ =0x00002738
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x29
	bls _080C01EE
	b _080C038C
_080C01EE:
	lsls r0, 2
	ldr r1, _080C0200 @ =_080C0204
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C01F8: .4byte gSaveBlock1
_080C01FC: .4byte 0x00002738
_080C0200: .4byte _080C0204
	.align 2, 0
_080C0204:
	.4byte _080C0394
	.4byte _080C02AC
	.4byte _080C0394
	.4byte _080C02BC
	.4byte _080C02CC
	.4byte _080C02DC
	.4byte _080C02F8
	.4byte _080C0308
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C0324
	.4byte _080C0394
	.4byte _080C0334
	.4byte _080C0350
	.4byte _080C0368
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C038C
	.4byte _080C0394
_080C02AC:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C02B8 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _080C035A
	.align 2, 0
_080C02B8: .4byte gSaveBlock1 + 0x2738
_080C02BC:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C02C8 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _080C035A
	.align 2, 0
_080C02C8: .4byte gSaveBlock1 + 0x2738
_080C02CC:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C02D8 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrh r0, [r0, 0x6]
	b _080C035A
	.align 2, 0
_080C02D8: .4byte gSaveBlock1 + 0x2738
_080C02DC:
	adds r4, r2, r6
	lsls r4, 2
	ldr r0, _080C02F4 @ =gSaveBlock1 + 0x2738
	adds r4, r0
	ldrh r0, [r4, 0x2]
	lsls r5, r6, 24
	lsrs r5, 24
	adds r1, r5, 0
	bl sub_80C03C8
	ldrh r0, [r4, 0x1C]
	b _080C037E
	.align 2, 0
_080C02F4: .4byte gSaveBlock1 + 0x2738
_080C02F8:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C0304 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _080C035A
	.align 2, 0
_080C0304: .4byte gSaveBlock1 + 0x2738
_080C0308:
	adds r4, r2, r6
	lsls r4, 2
	ldr r0, _080C0320 @ =gSaveBlock1 + 0x2738
	adds r4, r0
	ldrh r0, [r4, 0xA]
	lsls r5, r6, 24
	lsrs r5, 24
	adds r1, r5, 0
	bl sub_80C03C8
	ldrh r0, [r4, 0x14]
	b _080C037E
	.align 2, 0
_080C0320: .4byte gSaveBlock1 + 0x2738
_080C0324:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C0330 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrh r0, [r0, 0x10]
	b _080C035A
	.align 2, 0
_080C0330: .4byte gSaveBlock1 + 0x2738
_080C0334:
	adds r4, r2, r6
	lsls r4, 2
	ldr r0, _080C034C @ =gSaveBlock1 + 0x2738
	adds r4, r0
	ldrh r0, [r4, 0xC]
	lsls r5, r6, 24
	lsrs r5, 24
	adds r1, r5, 0
	bl sub_80C03C8
	ldrh r0, [r4, 0xE]
	b _080C037E
	.align 2, 0
_080C034C: .4byte gSaveBlock1 + 0x2738
_080C0350:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C0364 @ =gSaveBlock1 + 0x2738
	adds r0, r1
	ldrh r0, [r0, 0x4]
_080C035A:
	lsls r1, r6, 24
	lsrs r1, 24
	bl sub_80C03C8
	b _080C0394
	.align 2, 0
_080C0364: .4byte gSaveBlock1 + 0x2738
_080C0368:
	adds r4, r2, r6
	lsls r4, 2
	ldr r0, _080C0388 @ =gSaveBlock1 + 0x2738
	adds r4, r0
	ldrh r0, [r4, 0x8]
	lsls r5, r6, 24
	lsrs r5, 24
	adds r1, r5, 0
	bl sub_80C03C8
	ldrh r0, [r4, 0x4]
_080C037E:
	adds r1, r5, 0
	bl sub_80C03C8
	b _080C0394
	.align 2, 0
_080C0388: .4byte gSaveBlock1 + 0x2738
_080C038C:
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_80C03A8
_080C0394:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x17
	bhi _080C03A0
	b _080C01D8
_080C03A0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80C01D4

	thumb_func_start sub_80C03A8
sub_80C03A8: @ 80C03A8
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C03C0 @ =gSaveBlock1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r0, _080C03C4 @ =0x00002739
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080C03C0: .4byte gSaveBlock1
_080C03C4: .4byte 0x00002739
	thumb_func_end sub_80C03A8

	thumb_func_start sub_80C03C8
sub_80C03C8: @ 80C03C8
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl sub_8090D90
	lsls r0, 24
	asrs r2, r0, 24
	cmp r2, 0
	bne _080C03F8
	ldr r1, _080C0400 @ =gSaveBlock1
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldr r1, _080C0404 @ =0x00002739
	adds r0, r1
	strb r2, [r0]
_080C03F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C0400: .4byte gSaveBlock1
_080C0404: .4byte 0x00002739
	thumb_func_end sub_80C03C8

	thumb_func_start sub_80C0408
sub_80C0408: @ 80C0408
	push {r4-r6,lr}
	ldr r0, _080C044C @ =0x00000804
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C0444
	movs r2, 0
	ldr r6, _080C0450 @ =gSaveBlock1
	ldr r4, _080C0454 @ =0x00002739
	movs r3, 0
	ldr r5, _080C0458 @ =0x00002738
_080C0422:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r6
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _080C0436
	cmp r0, 0x29
	bne _080C043A
_080C0436:
	adds r0, r1, r4
	strb r3, [r0]
_080C043A:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x17
	bls _080C0422
_080C0444:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C044C: .4byte 0x00000804
_080C0450: .4byte gSaveBlock1
_080C0454: .4byte 0x00002739
_080C0458: .4byte 0x00002738
	thumb_func_end sub_80C0408

	thumb_func_start sub_80C045C
sub_80C045C: @ 80C045C
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _080C0494 @ =gSaveBlock1
_080C0462:
	lsls r0, r5, 3
	adds r0, r5
	lsls r0, 2
	adds r4, r0, r6
	ldr r1, _080C0498 @ =0x00002738
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_80BFB54
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080C0484
	ldr r0, _080C049C @ =0x00002739
	adds r1, r4, r0
	movs r0, 0
	strb r0, [r1]
_080C0484:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _080C0462
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C0494: .4byte gSaveBlock1
_080C0498: .4byte 0x00002738
_080C049C: .4byte 0x00002739
	thumb_func_end sub_80C045C

	thumb_func_start sub_80C04A0
sub_80C04A0: @ 80C04A0
	push {r4,r5,lr}
	movs r3, 0
	movs r2, 0x5
	ldr r5, _080C0508 @ =gSaveBlock1
	ldr r4, _080C050C @ =0x00002738
_080C04AA:
	lsls r0, r2, 24
	asrs r1, r0, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C04C8
	lsls r0, r3, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r3, r0, 24
_080C04C8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x17
	ble _080C04AA
	movs r2, 0
	lsls r0, r3, 24
	asrs r0, 24
	movs r1, 0x5
	subs r0, r1, r0
	cmp r2, r0
	bge _080C0502
	adds r5, r0, 0
_080C04E4:
	lsls r1, r2, 24
	asrs r4, r1, 24
	movs r0, 0xA0
	lsls r0, 19
	adds r1, r0
	lsrs r1, 24
	ldr r0, _080C0510 @ =gSaveBlock1 + 0x2738
	bl sub_80BF55C
	adds r4, 0x1
	lsls r4, 24
	lsrs r2, r4, 24
	asrs r4, 24
	cmp r4, r5
	blt _080C04E4
_080C0502:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0508: .4byte gSaveBlock1
_080C050C: .4byte 0x00002738
_080C0510: .4byte gSaveBlock1 + 0x2738
	thumb_func_end sub_80C04A0

	thumb_func_start sub_80C0514
sub_80C0514: @ 80C0514
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r5, r2, 24
	movs r4, 0
_080C0524:
	lsls r0, r4, 6
	ldr r6, _080C0550 @ =0x02007000
	adds r0, r6
	adds r1, r4, 0
	muls r1, r7
	add r1, r8
	movs r2, 0x40
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080C0524
	adds r4, r6, 0
	cmp r5, 0x1
	beq _080C0578
	cmp r5, 0x1
	bgt _080C0554
	cmp r5, 0
	beq _080C055E
	b _080C05AC
	.align 2, 0
_080C0550: .4byte 0x02007000
_080C0554:
	cmp r5, 0x2
	beq _080C0584
	cmp r5, 0x3
	beq _080C059C
	b _080C05AC
_080C055E:
	ldr r0, _080C0574 @ =gSaveBlock1 + 0x2ABC
	adds r1, r4, 0
	adds r1, 0x40
	adds r2, r4, 0
	adds r2, 0x80
	adds r3, r4, 0
	adds r3, 0xC0
	bl sub_80C05C4
	b _080C05AC
	.align 2, 0
_080C0574: .4byte gSaveBlock1 + 0x2ABC
_080C0578:
	ldr r1, _080C0580 @ =gSaveBlock1 + 0x2ABC
	adds r2, r4, 0
	adds r2, 0x80
	b _080C058A
	.align 2, 0
_080C0580: .4byte gSaveBlock1 + 0x2ABC
_080C0584:
	adds r1, r4, 0
	adds r1, 0x40
	ldr r2, _080C0598 @ =gSaveBlock1 + 0x2ABC
_080C058A:
	adds r3, r4, 0
	adds r3, 0xC0
	adds r0, r4, 0
	bl sub_80C05C4
	b _080C05AC
	.align 2, 0
_080C0598: .4byte gSaveBlock1 + 0x2ABC
_080C059C:
	adds r1, r6, 0
	adds r1, 0x40
	adds r2, r6, 0
	adds r2, 0x80
	ldr r3, _080C05C0 @ =gSaveBlock1 + 0x2ABC
	adds r0, r6, 0
	bl sub_80C05C4
_080C05AC:
	bl sub_80C0750
	bl sub_80C0788
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C05C0: .4byte gSaveBlock1 + 0x2ABC
	thumb_func_end sub_80C0514

	thumb_func_start sub_80C05C4
sub_80C05C4: @ 80C05C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	str r0, [sp, 0x10]
	str r1, [sp, 0x14]
	str r2, [sp, 0x18]
	str r3, [sp, 0x1C]
	add r0, sp, 0x10
	str r0, [sp]
	add r0, sp, 0x14
	str r0, [sp, 0x4]
	add r0, sp, 0x18
	str r0, [sp, 0x8]
	add r0, sp, 0x1C
	str r0, [sp, 0xC]
	bl GetLinkPlayerCount
	ldr r1, _080C0600 @ =gUnknown_03000721
	strb r0, [r1]
	movs r0, 0
	mov r10, r0
_080C05F4:
	movs r7, 0
	mov r1, r10
	adds r1, 0x1
	str r1, [sp, 0x20]
	b _080C068C
	.align 2, 0
_080C0600: .4byte gUnknown_03000721
_080C0604:
	lsls r4, r7, 2
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	ldr r0, [r0]
	mov r1, r10
	bl sub_80C0730
	ldr r1, _080C06B0 @ =gUnknown_03000722
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	mov r8, r4
	adds r1, r7, 0x1
	mov r9, r1
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080C0686
	movs r5, 0
	ldr r1, _080C06B4 @ =gUnknown_03000721
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r5, r0
	bge _080C0686
	adds r6, r1, 0
_080C0638:
	adds r0, r7, r5
	adds r4, r0, 0x1
	ldrb r1, [r6]
	adds r0, r4, 0
	bl __modsi3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_80BEBC8
	ldr r1, _080C06B8 @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080C0678
	ldrb r1, [r6]
	adds r0, r4, 0
	bl __modsi3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	mov r1, sp
	add r1, r8
	ldr r1, [r1]
	bl sub_80C06BC
_080C0678:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r6]
	subs r0, 0x1
	cmp r5, r0
	blt _080C0638
_080C0686:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r7, r0, 24
_080C068C:
	ldr r0, _080C06B4 @ =gUnknown_03000721
	ldrb r0, [r0]
	cmp r7, r0
	bcc _080C0604
	ldr r1, [sp, 0x20]
	lsls r0, r1, 24
	lsrs r0, 24
	mov r10, r0
	cmp r0, 0xF
	bls _080C05F4
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C06B0: .4byte gUnknown_03000722
_080C06B4: .4byte gUnknown_03000721
_080C06B8: .4byte gUnknown_03005D38
	thumb_func_end sub_80C05C4

	thumb_func_start sub_80C06BC
sub_80C06BC: @ 80C06BC
	push {lr}
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _080C06E0 @ =gUnknown_03000722
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	lsls r2, 2
	adds r1, r2
	ldr r2, _080C06E4 @ =gUnknown_03005D38
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	bl sub_80C06E8
	pop {r0}
	bx r0
	.align 2, 0
_080C06E0: .4byte gUnknown_03000722
_080C06E4: .4byte gUnknown_03005D38
	thumb_func_end sub_80C06BC

	thumb_func_start sub_80C06E8
sub_80C06E8: @ 80C06E8
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r6, r2, 24
	ldrb r3, [r5]
	adds r0, r3, 0
	cmp r0, 0
	bne _080C06FE
_080C06FA:
	movs r0, 0
	b _080C072A
_080C06FE:
	movs r1, 0
	adds r2, r3, 0
	adds r3, r0, 0
_080C0704:
	lsls r0, r1, 2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	beq _080C06FA
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080C0704
	lsls r0, r6, 24
	asrs r0, 22
	adds r0, r4
	strb r2, [r0]
	movs r1, 0x1
	strb r1, [r0, 0x1]
	ldrh r1, [r5, 0x2]
	strh r1, [r0, 0x2]
	movs r0, 0x1
_080C072A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C06E8

	thumb_func_start sub_80C0730
sub_80C0730: @ 80C0730
	push {lr}
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r1, r2, 2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080C0746
	lsls r0, r2, 24
	asrs r0, 24
	b _080C074A
_080C0746:
	movs r0, 0x1
	negs r0, r0
_080C074A:
	pop {r1}
	bx r1
	thumb_func_end sub_80C0730

	thumb_func_start sub_80C0750
sub_80C0750: @ 80C0750
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080C0780 @ =gSaveBlock1
_080C0756:
	lsls r0, r4, 2
	adds r0, r5
	ldr r1, _080C0784 @ =0x00002abc
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _080C076A
	adds r0, r4, 0
	bl sub_80BEC10
_080C076A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080C0756
	bl sub_80BEC40
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0780: .4byte gSaveBlock1
_080C0784: .4byte 0x00002abc
	thumb_func_end sub_80C0750

	thumb_func_start sub_80C0788
sub_80C0788: @ 80C0788
	push {r4,lr}
	ldr r0, _080C07B8 @ =0x00000804
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C07B2
	movs r1, 0
	ldr r4, _080C07BC @ =gSaveBlock1
	ldr r3, _080C07C0 @ =0x00002abd
	movs r2, 0
_080C07A0:
	lsls r0, r1, 2
	adds r0, r4
	adds r0, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080C07A0
_080C07B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C07B8: .4byte 0x00000804
_080C07BC: .4byte gSaveBlock1
_080C07C0: .4byte 0x00002abd
	thumb_func_end sub_80C0788

	thumb_func_start sub_80C07C4
sub_80C07C4: @ 80C07C4
	push {lr}
	ldr r2, _080C07F8 @ =gSaveBlock1
	ldr r0, _080C07FC @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldr r2, _080C0800 @ =0x00002739
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C07E0
	b _080C08F8
_080C07E0:
	subs r2, 0x1
	adds r0, r1, r2
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0x28
	bls _080C07EE
	b _080C08F8
_080C07EE:
	lsls r0, 2
	ldr r1, _080C0804 @ =_080C0808
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C07F8: .4byte gSaveBlock1
_080C07FC: .4byte gUnknown_0202E8CC
_080C0800: .4byte 0x00002739
_080C0804: .4byte _080C0808
	.align 2, 0
_080C0808:
	.4byte _080C08AC
	.4byte _080C08B2
	.4byte _080C08B8
	.4byte _080C08BE
	.4byte _080C08E2
	.4byte _080C08CA
	.4byte _080C08D0
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08D6
	.4byte _080C08DC
	.4byte _080C08E8
	.4byte _080C08EE
	.4byte _080C08F4
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08F8
	.4byte _080C08C4
_080C08AC:
	bl DoTVShowPokemonFanClubLetter
	b _080C08F8
_080C08B2:
	bl DoTVShowRecentHappenings
	b _080C08F8
_080C08B8:
	bl DoTVShowPokemonFanClubOpinions
	b _080C08F8
_080C08BE:
	bl nullsub_22
	b _080C08F8
_080C08C4:
	bl DoTVShowPokemonNewsMassOutbreak
	b _080C08F8
_080C08CA:
	bl DoTVShowBravoTrainerPokemonProfile
	b _080C08F8
_080C08D0:
	bl sub_80C0B9C
	b _080C08F8
_080C08D6:
	bl DoTVShowPokemonTodaySuccessfulCapture
	b _080C08F8
_080C08DC:
	bl DoTVShowTodaysSmartShopper
	b _080C08F8
_080C08E2:
	bl DoTVShowTheNameRaterShow
	b _080C08F8
_080C08E8:
	bl DoTVShowPokemonTodayFailedCapture
	b _080C08F8
_080C08EE:
	bl DoTVShowPokemonAngler
	b _080C08F8
_080C08F4:
	bl DoTVShowTheWorldOfMasters
_080C08F8:
	pop {r0}
	bx r0
	thumb_func_end sub_80C07C4

	thumb_func_start sub_80C08FC
sub_80C08FC: @ 80C08FC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r2, 24
	lsrs r4, 24
	bl StringCopy
	cmp r4, 0x1
	bhi _080C0914
	adds r0, r5, 0
	movs r1, 0x1
	bl ConvertInternationalString
_080C0914:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C08FC

	thumb_func_start DoTVShowBravoTrainerPokemonProfile
DoTVShowBravoTrainerPokemonProfile: @ 80C091C
	push {r4,r5,lr}
	ldr r0, _080C0948 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C094C @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r1, _080C0950 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C0954 @ =gUnknown_020387E8
	ldrb r5, [r0]
	cmp r5, 0x8
	bls _080C093C
	b _080C0B7A
_080C093C:
	lsls r0, r5, 2
	ldr r1, _080C0958 @ =_080C095C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0948: .4byte gUnknown_0202E8CC
_080C094C: .4byte gSaveBlock1 + 0x2738
_080C0950: .4byte gScriptResult
_080C0954: .4byte gUnknown_020387E8
_080C0958: .4byte _080C095C
	.align 2, 0
_080C095C:
	.4byte _080C0980
	.4byte _080C09D8
	.4byte _080C0A10
	.4byte _080C0A40
	.4byte _080C0A74
	.4byte _080C0AA8
	.4byte _080C0AEC
	.4byte _080C0B34
	.4byte _080C0B64
_080C0980:
	ldr r0, _080C09C0 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl sub_80C08FC
	ldrb r1, [r4, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x1
	bl CopyContestCategoryToStringVar
	ldrb r1, [r4, 0x13]
	lsls r1, 27
	lsrs r1, 30
	movs r0, 0x2
	bl sub_80BEF10
	ldrh r1, [r4, 0x2]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _080C09C4 @ =gSpeciesNames
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x8
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _080C09CC
	ldr r1, _080C09C8 @ =gUnknown_020387E8
	movs r0, 0x8
	b _080C0B78
	.align 2, 0
_080C09C0: .4byte gStringVar1
_080C09C4: .4byte gSpeciesNames
_080C09C8: .4byte gUnknown_020387E8
_080C09CC:
	ldr r1, _080C09D4 @ =gUnknown_020387E8
	movs r0, 0x1
	b _080C0B78
	.align 2, 0
_080C09D4: .4byte gUnknown_020387E8
_080C09D8:
	ldr r0, _080C0A04 @ =gStringVar1
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0A08 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C0A0C @ =gStringVar2
	adds r1, r4, 0
	adds r1, 0x8
	ldrb r2, [r4, 0x1F]
	bl sub_80C08FC
	ldrb r1, [r4, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x2
	bl CopyContestCategoryToStringVar
	b _080C0B74
	.align 2, 0
_080C0A04: .4byte gStringVar1
_080C0A08: .4byte gSpeciesNames
_080C0A0C: .4byte gStringVar2
_080C0A10:
	ldr r0, _080C0A2C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl sub_80C08FC
	ldrb r1, [r4, 0x13]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	bne _080C0A34
	ldr r1, _080C0A30 @ =gUnknown_020387E8
	movs r0, 0x3
	b _080C0B78
	.align 2, 0
_080C0A2C: .4byte gStringVar1
_080C0A30: .4byte gUnknown_020387E8
_080C0A34:
	ldr r1, _080C0A3C @ =gUnknown_020387E8
	movs r0, 0x4
	b _080C0B78
	.align 2, 0
_080C0A3C: .4byte gUnknown_020387E8
_080C0A40:
	ldr r0, _080C0A68 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl sub_80C08FC
	ldr r0, _080C0A6C @ =gStringVar2
	ldrh r1, [r4, 0x4]
	bl sub_80EB3FC
	ldrb r1, [r4, 0x13]
	lsls r1, 25
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x2
	bl sub_80BF088
	ldr r1, _080C0A70 @ =gUnknown_020387E8
	movs r0, 0x5
	b _080C0B78
	.align 2, 0
_080C0A68: .4byte gStringVar1
_080C0A6C: .4byte gStringVar2
_080C0A70: .4byte gUnknown_020387E8
_080C0A74:
	ldr r0, _080C0A9C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl sub_80C08FC
	ldr r0, _080C0AA0 @ =gStringVar2
	ldrh r1, [r4, 0x4]
	bl sub_80EB3FC
	ldrb r1, [r4, 0x13]
	lsls r1, 25
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x2
	bl sub_80BF088
	ldr r1, _080C0AA4 @ =gUnknown_020387E8
	movs r0, 0x5
	b _080C0B78
	.align 2, 0
_080C0A9C: .4byte gStringVar1
_080C0AA0: .4byte gStringVar2
_080C0AA4: .4byte gUnknown_020387E8
_080C0AA8:
	ldr r0, _080C0AD4 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl sub_80C08FC
	ldrb r1, [r4, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x1
	bl CopyContestCategoryToStringVar
	ldr r0, _080C0AD8 @ =gStringVar3
	ldrh r1, [r4, 0x6]
	bl sub_80EB3FC
	ldrh r0, [r4, 0x14]
	cmp r0, 0
	beq _080C0AE0
	ldr r1, _080C0ADC @ =gUnknown_020387E8
	movs r0, 0x6
	b _080C0B78
	.align 2, 0
_080C0AD4: .4byte gStringVar1
_080C0AD8: .4byte gStringVar3
_080C0ADC: .4byte gUnknown_020387E8
_080C0AE0:
	ldr r1, _080C0AE8 @ =gUnknown_020387E8
	movs r0, 0x7
	b _080C0B78
	.align 2, 0
_080C0AE8: .4byte gUnknown_020387E8
_080C0AEC:
	ldr r0, _080C0B1C @ =gStringVar1
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0B20 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C0B24 @ =gStringVar2
	ldrh r2, [r4, 0x14]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080C0B28 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C0B2C @ =gStringVar3
	ldrh r1, [r4, 0x6]
	bl sub_80EB3FC
	ldr r1, _080C0B30 @ =gUnknown_020387E8
	movs r0, 0x7
	b _080C0B78
	.align 2, 0
_080C0B1C: .4byte gStringVar1
_080C0B20: .4byte gSpeciesNames
_080C0B24: .4byte gStringVar2
_080C0B28: .4byte gMoveNames
_080C0B2C: .4byte gStringVar3
_080C0B30: .4byte gUnknown_020387E8
_080C0B34:
	ldr r0, _080C0B58 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl sub_80C08FC
	ldr r0, _080C0B5C @ =gStringVar2
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0B60 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	bl TVShowDone
	b _080C0B7A
	.align 2, 0
_080C0B58: .4byte gStringVar1
_080C0B5C: .4byte gStringVar2
_080C0B60: .4byte gSpeciesNames
_080C0B64:
	ldr r0, _080C0B8C @ =gStringVar1
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0B90 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
_080C0B74:
	ldr r1, _080C0B94 @ =gUnknown_020387E8
	movs r0, 0x2
_080C0B78:
	strb r0, [r1]
_080C0B7A:
	ldr r0, _080C0B98 @ =gUnknown_083D1524
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0B8C: .4byte gStringVar1
_080C0B90: .4byte gSpeciesNames
_080C0B94: .4byte gUnknown_020387E8
_080C0B98: .4byte gUnknown_083D1524
	thumb_func_end DoTVShowBravoTrainerPokemonProfile

	thumb_func_start sub_80C0B9C
sub_80C0B9C: @ 80C0B9C
	push {r4,r5,lr}
	ldr r0, _080C0BC8 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C0BCC @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r1, _080C0BD0 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C0BD4 @ =gUnknown_020387E8
	ldrb r5, [r0]
	adds r2, r0, 0
	cmp r5, 0xE
	bls _080C0BBE
	b _080C0DDE
_080C0BBE:
	lsls r0, r5, 2
	ldr r1, _080C0BD8 @ =_080C0BDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0BC8: .4byte gUnknown_0202E8CC
_080C0BCC: .4byte gSaveBlock1 + 0x2738
_080C0BD0: .4byte gScriptResult
_080C0BD4: .4byte gUnknown_020387E8
_080C0BD8: .4byte _080C0BDC
	.align 2, 0
_080C0BDC:
	.4byte _080C0C18
	.4byte _080C0C5C
	.4byte _080C0C8C
	.4byte _080C0CB0
	.4byte _080C0CDC
	.4byte _080C0D24
	.4byte _080C0D30
	.4byte _080C0D3C
	.4byte _080C0D42
	.4byte _080C0D42
	.4byte _080C0D42
	.4byte _080C0D5C
	.4byte _080C0D88
	.4byte _080C0D88
	.4byte _080C0DC0
_080C0C18:
	ldr r0, _080C0C40 @ =gStringVar1
	adds r1, r4, 0x2
	ldrb r2, [r4, 0x1D]
	bl sub_80C08FC
	ldr r0, _080C0C44 @ =gStringVar2
	ldrh r2, [r4, 0xA]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0C48 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrh r0, [r4, 0x16]
	cmp r0, 0x6
	bls _080C0C50
	ldr r1, _080C0C4C @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0C40: .4byte gStringVar1
_080C0C44: .4byte gStringVar2
_080C0C48: .4byte gSpeciesNames
_080C0C4C: .4byte gUnknown_020387E8
_080C0C50:
	ldr r1, _080C0C58 @ =gUnknown_020387E8
	movs r0, 0x2
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0C58: .4byte gUnknown_020387E8
_080C0C5C:
	ldrb r1, [r4, 0x1A]
	movs r0, 0
	bl sub_80BF088
	ldrh r1, [r4, 0x16]
	movs r0, 0x1
	bl sub_80BF088
	ldrb r0, [r4, 0x1C]
	cmp r0, 0x1
	bne _080C0C80
	ldr r1, _080C0C7C @ =gUnknown_020387E8
	movs r0, 0x3
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0C7C: .4byte gUnknown_020387E8
_080C0C80:
	ldr r1, _080C0C88 @ =gUnknown_020387E8
	movs r0, 0x4
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0C88: .4byte gUnknown_020387E8
_080C0C8C:
	ldr r0, _080C0CAC @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl sub_80C08FC
	ldrh r1, [r4, 0x16]
	adds r1, 0x1
	movs r0, 0x1
	bl sub_80BF088
_080C0CA2:
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	beq _080C0CFE
	b _080C0D18
	.align 2, 0
_080C0CAC: .4byte gStringVar1
_080C0CB0:
	ldr r0, _080C0CD0 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl sub_80C08FC
	ldr r0, _080C0CD4 @ =gStringVar2
	ldrh r2, [r4, 0x14]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0CD8 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	b _080C0CA2
	.align 2, 0
_080C0CD0: .4byte gStringVar1
_080C0CD4: .4byte gStringVar2
_080C0CD8: .4byte gSpeciesNames
_080C0CDC:
	ldr r0, _080C0D08 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl sub_80C08FC
	ldr r0, _080C0D0C @ =gStringVar2
	ldrh r2, [r4, 0x14]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0D10 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	bne _080C0D18
_080C0CFE:
	ldr r1, _080C0D14 @ =gUnknown_020387E8
	movs r0, 0x5
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D08: .4byte gStringVar1
_080C0D0C: .4byte gStringVar2
_080C0D10: .4byte gSpeciesNames
_080C0D14: .4byte gUnknown_020387E8
_080C0D18:
	ldr r1, _080C0D20 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D20: .4byte gUnknown_020387E8
_080C0D24:
	ldr r0, _080C0D2C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	b _080C0D46
	.align 2, 0
_080C0D2C: .4byte gStringVar1
_080C0D30:
	ldr r0, _080C0D38 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	b _080C0D46
	.align 2, 0
_080C0D38: .4byte gStringVar1
_080C0D3C:
	movs r0, 0xB
	strb r0, [r2]
	b _080C0DDE
_080C0D42:
	ldr r0, _080C0D54 @ =gStringVar1
	adds r1, r4, 0x2
_080C0D46:
	ldrb r2, [r4, 0x1D]
	bl sub_80C08FC
	ldr r1, _080C0D58 @ =gUnknown_020387E8
	movs r0, 0xB
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D54: .4byte gStringVar1
_080C0D58: .4byte gUnknown_020387E8
_080C0D5C:
	ldr r0, _080C0D74 @ =gStringVar1
	ldrh r1, [r4, 0x18]
	bl sub_80EB3FC
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	bne _080C0D7C
	ldr r1, _080C0D78 @ =gUnknown_020387E8
	movs r0, 0xC
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D74: .4byte gStringVar1
_080C0D78: .4byte gUnknown_020387E8
_080C0D7C:
	ldr r1, _080C0D84 @ =gUnknown_020387E8
	movs r0, 0xD
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0D84: .4byte gUnknown_020387E8
_080C0D88:
	ldr r0, _080C0DB0 @ =gStringVar1
	ldrh r1, [r4, 0x18]
	bl sub_80EB3FC
	ldr r0, _080C0DB4 @ =gStringVar2
	adds r1, r4, 0x2
	ldrb r2, [r4, 0x1D]
	bl sub_80C08FC
	ldr r0, _080C0DB8 @ =gStringVar3
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl sub_80C08FC
	ldr r1, _080C0DBC @ =gUnknown_020387E8
	movs r0, 0xE
	strb r0, [r1]
	b _080C0DDE
	.align 2, 0
_080C0DB0: .4byte gStringVar1
_080C0DB4: .4byte gStringVar2
_080C0DB8: .4byte gStringVar3
_080C0DBC: .4byte gUnknown_020387E8
_080C0DC0:
	ldr r0, _080C0DF0 @ =gStringVar1
	adds r1, r4, 0x2
	ldrb r2, [r4, 0x1D]
	bl sub_80C08FC
	ldr r0, _080C0DF4 @ =gStringVar2
	ldrh r2, [r4, 0xA]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0DF8 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	bl TVShowDone
_080C0DDE:
	ldr r0, _080C0DFC @ =gUnknown_083D1548
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0DF0: .4byte gStringVar1
_080C0DF4: .4byte gStringVar2
_080C0DF8: .4byte gSpeciesNames
_080C0DFC: .4byte gUnknown_083D1548
	thumb_func_end sub_80C0B9C

	thumb_func_start DoTVShowTodaysSmartShopper
DoTVShowTodaysSmartShopper: @ 80C0E00
	push {r4-r6,lr}
	ldr r0, _080C0E2C @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C0E30 @ =gSaveBlock1 + 0x2738
	adds r5, r0, r1
	ldr r1, _080C0E34 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C0E38 @ =gUnknown_020387E8
	ldrb r6, [r0]
	adds r2, r0, 0
	cmp r6, 0xC
	bls _080C0E22
	b _080C1014
_080C0E22:
	lsls r0, r6, 2
	ldr r1, _080C0E3C @ =_080C0E40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0E2C: .4byte gUnknown_0202E8CC
_080C0E30: .4byte gSaveBlock1 + 0x2738
_080C0E34: .4byte gScriptResult
_080C0E38: .4byte gUnknown_020387E8
_080C0E3C: .4byte _080C0E40
	.align 2, 0
_080C0E40:
	.4byte _080C0E74
	.4byte _080C0EB0
	.4byte _080C0EF8
	.4byte _080C0F0A
	.4byte _080C0EF8
	.4byte _080C0EF8
	.4byte _080C0F34
	.4byte _080C0F64
	.4byte _080C0F94
	.4byte _080C0FA0
	.4byte _080C0FAE
	.4byte _080C0FC0
	.4byte _080C1004
_080C0E74:
	ldr r0, _080C0E98 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl sub_80C08FC
	ldr r0, _080C0E9C @ =gStringVar2
	ldrb r1, [r5, 0x12]
	movs r2, 0
	bl sub_80FBFB4
	ldrh r0, [r5, 0xC]
	cmp r0, 0xFE
	bls _080C0EA4
	ldr r1, _080C0EA0 @ =gUnknown_020387E8
	movs r0, 0xB
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0E98: .4byte gStringVar1
_080C0E9C: .4byte gStringVar2
_080C0EA0: .4byte gUnknown_020387E8
_080C0EA4:
	ldr r1, _080C0EAC @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0EAC: .4byte gUnknown_020387E8
_080C0EB0:
	ldr r0, _080C0EEC @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl sub_80C08FC
	ldr r4, _080C0EF0 @ =gStringVar2
	ldrh r0, [r5, 0x6]
	bl itemid_get_item
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0xC]
	movs r0, 0x2
	bl sub_80BF088
	ldr r4, _080C0EF4 @ =gUnknown_020387E8
	bl Random
	ldrb r2, [r4]
	adds r2, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r0, r2
	strb r0, [r4]
	b _080C1014
	.align 2, 0
_080C0EEC: .4byte gStringVar1
_080C0EF0: .4byte gStringVar2
_080C0EF4: .4byte gUnknown_020387E8
_080C0EF8:
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	beq _080C0F04
	movs r0, 0x6
	strb r0, [r2]
	b _080C1014
_080C0F04:
	movs r0, 0xA
	strb r0, [r2]
	b _080C1014
_080C0F0A:
	ldrh r1, [r5, 0xC]
	adds r1, 0x1
	movs r0, 0x2
	bl sub_80BF088
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	beq _080C0F28
	ldr r1, _080C0F24 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F24: .4byte gUnknown_020387E8
_080C0F28:
	ldr r1, _080C0F30 @ =gUnknown_020387E8
	movs r0, 0xA
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F30: .4byte gUnknown_020387E8
_080C0F34:
	ldr r4, _080C0F5C @ =gStringVar2
	ldrh r0, [r5, 0x8]
	bl itemid_get_item
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0xE]
	movs r0, 0x2
	bl sub_80BF088
	ldrh r0, [r5, 0xA]
	cmp r0, 0
	beq _080C0F7C
	ldr r1, _080C0F60 @ =gUnknown_020387E8
	movs r0, 0x7
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F5C: .4byte gStringVar2
_080C0F60: .4byte gUnknown_020387E8
_080C0F64:
	ldr r4, _080C0F8C @ =gStringVar2
	ldrh r0, [r5, 0xA]
	bl itemid_get_item
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0x10]
	movs r0, 0x2
	bl sub_80BF088
_080C0F7C:
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	beq _080C0FE2
	ldr r1, _080C0F90 @ =gUnknown_020387E8
	movs r0, 0x9
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0F8C: .4byte gStringVar2
_080C0F90: .4byte gUnknown_020387E8
_080C0F94:
	ldrh r0, [r5, 0xC]
	cmp r0, 0xFE
	bls _080C0FBA
	movs r0, 0xC
	strb r0, [r2]
	b _080C1014
_080C0FA0:
	movs r0, 0x1
	adds r1, r5, 0
	bl sub_80BF154
	bl TVShowDone
	b _080C1014
_080C0FAE:
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	bne _080C0FBA
	movs r0, 0x8
	strb r0, [r2]
	b _080C1014
_080C0FBA:
	movs r0, 0x9
	strb r0, [r2]
	b _080C1014
_080C0FC0:
	ldr r0, _080C0FEC @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl sub_80C08FC
	ldr r4, _080C0FF0 @ =gStringVar2
	ldrh r0, [r5, 0x6]
	bl itemid_get_item
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	bne _080C0FF8
_080C0FE2:
	ldr r1, _080C0FF4 @ =gUnknown_020387E8
	movs r0, 0x8
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C0FEC: .4byte gStringVar1
_080C0FF0: .4byte gStringVar2
_080C0FF4: .4byte gUnknown_020387E8
_080C0FF8:
	ldr r1, _080C1000 @ =gUnknown_020387E8
	movs r0, 0xC
	strb r0, [r1]
	b _080C1014
	.align 2, 0
_080C1000: .4byte gUnknown_020387E8
_080C1004:
	ldr r0, _080C1028 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl sub_80C08FC
	bl TVShowDone
_080C1014:
	ldr r0, _080C102C @ =gUnknown_083D14F0
	lsls r1, r6, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C1028: .4byte gStringVar1
_080C102C: .4byte gUnknown_083D14F0
	thumb_func_end DoTVShowTodaysSmartShopper

	thumb_func_start DoTVShowTheNameRaterShow
DoTVShowTheNameRaterShow: @ 80C1030
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r0, _080C1060 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1064 @ =gSaveBlock1 + 0x2738
	adds r6, r0, r1
	ldr r1, _080C1068 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C106C @ =gUnknown_020387E8
	ldrb r7, [r0]
	adds r2, r0, 0
	cmp r7, 0x12
	bls _080C1054
	b _080C138A
_080C1054:
	lsls r0, r7, 2
	ldr r1, _080C1070 @ =_080C1074
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1060: .4byte gUnknown_0202E8CC
_080C1064: .4byte gSaveBlock1 + 0x2738
_080C1068: .4byte gScriptResult
_080C106C: .4byte gUnknown_020387E8
_080C1070: .4byte _080C1074
	.align 2, 0
_080C1074:
	.4byte _080C10C0
	.4byte _080C1108
	.4byte _080C112A
	.4byte _080C1108
	.4byte _080C1108
	.4byte _080C1108
	.4byte _080C1108
	.4byte _080C1108
	.4byte _080C1108
	.4byte _080C1170
	.4byte _080C1170
	.4byte _080C1170
	.4byte _080C136C
	.4byte _080C11CC
	.4byte _080C1228
	.4byte _080C127C
	.4byte _080C12D4
	.4byte _080C1314
	.4byte _080C1370
_080C10C0:
	ldr r0, _080C10F4 @ =gStringVar1
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	bl sub_80C08FC
	ldr r0, _080C10F8 @ =gStringVar2
	ldrh r2, [r6, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C10FC @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1100 @ =gStringVar3
	adds r1, r6, 0x4
	ldrb r2, [r6, 0x1F]
	bl sub_80C08FC
	ldr r4, _080C1104 @ =gUnknown_020387E8
	adds r0, r6, 0
	bl sub_80BF7E8
	adds r0, 0x1
	strb r0, [r4]
	b _080C138A
	.align 2, 0
_080C10F4: .4byte gStringVar1
_080C10F8: .4byte gStringVar2
_080C10FC: .4byte gSpeciesNames
_080C1100: .4byte gStringVar3
_080C1104: .4byte gUnknown_020387E8
_080C1108:
	ldrb r0, [r6, 0x1A]
	cmp r0, 0
	bne _080C1114
	movs r0, 0x9
	strb r0, [r2]
	b _080C138A
_080C1114:
	cmp r0, 0x1
	bne _080C111E
	movs r0, 0xA
	strb r0, [r2]
	b _080C138A
_080C111E:
	cmp r0, 0x2
	beq _080C1124
	b _080C138A
_080C1124:
	movs r0, 0xB
	strb r0, [r2]
	b _080C138A
_080C112A:
	ldr r0, _080C1144 @ =gStringVar1
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	bl sub_80C08FC
	ldrb r0, [r6, 0x1A]
	cmp r0, 0
	bne _080C114C
	ldr r1, _080C1148 @ =gUnknown_020387E8
	movs r0, 0x9
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C1144: .4byte gStringVar1
_080C1148: .4byte gUnknown_020387E8
_080C114C:
	cmp r0, 0x1
	bne _080C115C
	ldr r1, _080C1158 @ =gUnknown_020387E8
	movs r0, 0xA
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C1158: .4byte gUnknown_020387E8
_080C115C:
	cmp r0, 0x2
	beq _080C1162
	b _080C138A
_080C1162:
	ldr r1, _080C116C @ =gUnknown_020387E8
	movs r0, 0xB
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C116C: .4byte gUnknown_020387E8
_080C1170:
	movs r5, 0
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C11BC @ =gStringVar3
	ldr r4, _080C11C0 @ =gStringVar1
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl sub_80C08FC
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C11C4 @ =gStringVar2
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl sub_80C08FC
	adds r1, r6, 0x4
	ldrb r2, [r6, 0x1F]
	adds r0, r4, 0
	bl sub_80C08FC
	ldr r1, _080C11C8 @ =gUnknown_020387E8
	movs r0, 0xC
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C11BC: .4byte gStringVar3
_080C11C0: .4byte gStringVar1
_080C11C4: .4byte gStringVar2
_080C11C8: .4byte gUnknown_020387E8
_080C11CC:
	movs r5, 0
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C1218 @ =gStringVar3
	ldr r4, _080C121C @ =gStringVar1
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl sub_80C08FC
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0
	bl sub_80BF820
	ldr r0, _080C1220 @ =gStringVar2
	ldrb r2, [r6, 0x1E]
	adds r1, r4, 0
	bl sub_80C08FC
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	adds r0, r4, 0
	bl sub_80C08FC
	ldr r1, _080C1224 @ =gUnknown_020387E8
	movs r0, 0xE
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C1218: .4byte gStringVar3
_080C121C: .4byte gStringVar1
_080C1220: .4byte gStringVar2
_080C1224: .4byte gUnknown_020387E8
_080C1228:
	movs r5, 0
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_80BF820
	ldr r0, _080C1270 @ =gStringVar3
	ldr r4, _080C1274 @ =gStringVar1
	ldrb r2, [r6, 0x1E]
	adds r1, r4, 0
	bl sub_80C08FC
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C1278 @ =gStringVar2
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl sub_80C08FC
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	adds r0, r4, 0
	bl sub_80C08FC
	b _080C1354
	.align 2, 0
_080C1270: .4byte gStringVar3
_080C1274: .4byte gStringVar1
_080C1278: .4byte gStringVar2
_080C127C:
	movs r0, 0
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C12C4 @ =gStringVar1
	ldr r4, _080C12C8 @ =gStringVar2
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl sub_80C08FC
	ldrh r1, [r6, 0x2]
	movs r0, 0xB
	muls r1, r0
	ldr r0, _080C12CC @ =gSpeciesNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldrh r0, [r6, 0x2]
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_80BF820
	ldr r1, _080C12D0 @ =gUnknown_020387E8
	movs r0, 0x10
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C12C4: .4byte gStringVar1
_080C12C8: .4byte gStringVar2
_080C12CC: .4byte gSpeciesNames
_080C12D0: .4byte gUnknown_020387E8
_080C12D4:
	movs r0, 0
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C1308 @ =gStringVar3
	ldr r1, _080C130C @ =gStringVar1
	ldrb r2, [r6, 0x1F]
	bl sub_80C08FC
	ldrh r0, [r6, 0x2]
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_80BF820
	ldr r1, _080C1310 @ =gUnknown_020387E8
	movs r0, 0x11
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C1308: .4byte gStringVar3
_080C130C: .4byte gStringVar1
_080C1310: .4byte gUnknown_020387E8
_080C1314:
	movs r0, 0
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C135C @ =gStringVar1
	ldr r4, _080C1360 @ =gStringVar2
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl sub_80C08FC
	ldrh r0, [r6, 0x1C]
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_80BF820
	ldrh r1, [r6, 0x1C]
	movs r0, 0xB
	muls r1, r0
	ldr r0, _080C1364 @ =gSpeciesNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
_080C1354:
	ldr r1, _080C1368 @ =gUnknown_020387E8
	movs r0, 0x12
	strb r0, [r1]
	b _080C138A
	.align 2, 0
_080C135C: .4byte gStringVar1
_080C1360: .4byte gStringVar2
_080C1364: .4byte gSpeciesNames
_080C1368: .4byte gUnknown_020387E8
_080C136C:
	movs r7, 0x12
	strb r7, [r2]
_080C1370:
	ldr r0, _080C13A0 @ =gStringVar1
	adds r1, r6, 0x4
	ldrb r2, [r6, 0x1F]
	bl sub_80C08FC
	ldr r0, _080C13A4 @ =gStringVar2
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	bl sub_80C08FC
	bl TVShowDone
_080C138A:
	ldr r0, _080C13A8 @ =gUnknown_083D1584
	lsls r1, r7, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C13A0: .4byte gStringVar1
_080C13A4: .4byte gStringVar2
_080C13A8: .4byte gUnknown_083D1584
	thumb_func_end DoTVShowTheNameRaterShow

	thumb_func_start DoTVShowPokemonTodaySuccessfulCapture
DoTVShowPokemonTodaySuccessfulCapture: @ 80C13AC
	push {r4-r6,lr}
	ldr r0, _080C13D8 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C13DC @ =gSaveBlock1 + 0x2738
	adds r5, r0, r1
	ldr r1, _080C13E0 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C13E4 @ =gUnknown_020387E8
	ldrb r6, [r0]
	adds r2, r0, 0
	cmp r6, 0xB
	bls _080C13CE
	b _080C15DC
_080C13CE:
	lsls r0, r6, 2
	ldr r1, _080C13E8 @ =_080C13EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C13D8: .4byte gUnknown_0202E8CC
_080C13DC: .4byte gSaveBlock1 + 0x2738
_080C13E0: .4byte gScriptResult
_080C13E4: .4byte gUnknown_020387E8
_080C13E8: .4byte _080C13EC
	.align 2, 0
_080C13EC:
	.4byte _080C141C
	.4byte _080C1470
	.4byte _080C1476
	.4byte _080C14B0
	.4byte _080C14E8
	.4byte _080C14EE
	.4byte _080C1524
	.4byte _080C1578
	.4byte _080C1578
	.4byte _080C15A8
	.4byte _080C15A8
	.4byte _080C15D8
_080C141C:
	ldr r0, _080C1450 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x2]
	bl sub_80C08FC
	ldr r0, _080C1454 @ =gStringVar2
	ldrh r2, [r5, 0x10]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1458 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C145C @ =gStringVar3
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl sub_80C08FC
	ldrb r0, [r5, 0xF]
	cmp r0, 0x1
	bne _080C1464
	ldr r1, _080C1460 @ =gUnknown_020387E8
	movs r0, 0x5
	strb r0, [r1]
	b _080C15DC
	.align 2, 0
_080C1450: .4byte gStringVar1
_080C1454: .4byte gStringVar2
_080C1458: .4byte gSpeciesNames
_080C145C: .4byte gStringVar3
_080C1460: .4byte gUnknown_020387E8
_080C1464:
	ldr r1, _080C146C @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C15DC
	.align 2, 0
_080C146C: .4byte gUnknown_020387E8
_080C1470:
	movs r0, 0x2
	strb r0, [r2]
	b _080C15DC
_080C1476:
	ldr r4, _080C149C @ =gStringVar2
	ldrb r0, [r5, 0xF]
	bl itemid_get_item
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrb r1, [r5, 0x12]
	movs r0, 0x2
	bl sub_80BF088
	ldrb r0, [r5, 0x12]
	cmp r0, 0x3
	bhi _080C14A4
	ldr r1, _080C14A0 @ =gUnknown_020387E8
	movs r0, 0x3
	strb r0, [r1]
	b _080C15DC
	.align 2, 0
_080C149C: .4byte gStringVar2
_080C14A0: .4byte gUnknown_020387E8
_080C14A4:
	ldr r1, _080C14AC @ =gUnknown_020387E8
	movs r0, 0x4
	strb r0, [r1]
	b _080C15DC
	.align 2, 0
_080C14AC: .4byte gUnknown_020387E8
_080C14B0:
	ldr r0, _080C14D8 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x2]
	bl sub_80C08FC
	ldr r0, _080C14DC @ =gStringVar2
	ldrh r2, [r5, 0x10]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C14E0 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C14E4 @ =gStringVar3
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl sub_80C08FC
	b _080C150A
	.align 2, 0
_080C14D8: .4byte gStringVar1
_080C14DC: .4byte gStringVar2
_080C14E0: .4byte gSpeciesNames
_080C14E4: .4byte gStringVar3
_080C14E8:
	movs r0, 0x6
	strb r0, [r2]
	b _080C15DC
_080C14EE:
	ldr r0, _080C1514 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x2]
	bl sub_80C08FC
	ldr r0, _080C1518 @ =gStringVar2
	ldrh r2, [r5, 0x10]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C151C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
_080C150A:
	ldr r1, _080C1520 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C15DC
	.align 2, 0
_080C1514: .4byte gStringVar1
_080C1518: .4byte gStringVar2
_080C151C: .4byte gSpeciesNames
_080C1520: .4byte gUnknown_020387E8
_080C1524:
	ldr r0, _080C1564 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x2]
	bl sub_80C08FC
	ldr r0, _080C1568 @ =gStringVar2
	ldrh r2, [r5, 0x10]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C156C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1570 @ =gStringVar3
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl sub_80C08FC
	ldr r4, _080C1574 @ =gUnknown_020387E8
	bl Random
	ldrb r2, [r4]
	adds r2, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r0, r2
	strb r0, [r4]
	b _080C15DC
	.align 2, 0
_080C1564: .4byte gStringVar1
_080C1568: .4byte gStringVar2
_080C156C: .4byte gSpeciesNames
_080C1570: .4byte gStringVar3
_080C1574: .4byte gUnknown_020387E8
_080C1578:
	ldr r0, _080C159C @ =gStringVar1
	ldrh r1, [r5, 0x10]
	movs r4, 0xB
	muls r1, r4
	ldr r2, _080C15A0 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C15A4 @ =gStringVar2
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl sub_80C08FC
	ldrh r1, [r5, 0x10]
	movs r0, 0x2
	bl sub_80BF638
	b _080C15C2
	.align 2, 0
_080C159C: .4byte gStringVar1
_080C15A0: .4byte gSpeciesNames
_080C15A4: .4byte gStringVar2
_080C15A8:
	ldr r0, _080C15C8 @ =gStringVar1
	ldrh r1, [r5, 0x10]
	movs r4, 0xB
	muls r1, r4
	ldr r2, _080C15CC @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C15D0 @ =gStringVar2
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl sub_80C08FC
_080C15C2:
	ldr r0, _080C15D4 @ =gUnknown_020387E8
	strb r4, [r0]
	b _080C15DC
	.align 2, 0
_080C15C8: .4byte gStringVar1
_080C15CC: .4byte gSpeciesNames
_080C15D0: .4byte gStringVar2
_080C15D4: .4byte gUnknown_020387E8
_080C15D8:
	bl TVShowDone
_080C15DC:
	ldr r0, _080C15F0 @ =gUnknown_083D14C0
	lsls r1, r6, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C15F0: .4byte gUnknown_083D14C0
	thumb_func_end DoTVShowPokemonTodaySuccessfulCapture

	thumb_func_start DoTVShowPokemonTodayFailedCapture
DoTVShowPokemonTodayFailedCapture: @ 80C15F4
	push {r4,r5,lr}
	ldr r0, _080C1620 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1624 @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r1, _080C1628 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C162C @ =gUnknown_020387E8
	ldrb r5, [r0]
	cmp r5, 0x6
	bls _080C1614
	b _080C173C
_080C1614:
	lsls r0, r5, 2
	ldr r1, _080C1630 @ =_080C1634
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1620: .4byte gUnknown_0202E8CC
_080C1624: .4byte gSaveBlock1 + 0x2738
_080C1628: .4byte gScriptResult
_080C162C: .4byte gUnknown_020387E8
_080C1630: .4byte _080C1634
	.align 2, 0
_080C1634:
	.4byte _080C1650
	.4byte _080C1684
	.4byte _080C16D8
	.4byte _080C16D8
	.4byte _080C171C
	.4byte _080C171C
	.4byte _080C1738
_080C1650:
	ldr r0, _080C1674 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x2]
	bl sub_80C08FC
	ldr r0, _080C1678 @ =gStringVar2
	ldrh r2, [r4, 0xC]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C167C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r1, _080C1680 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C173C
	.align 2, 0
_080C1674: .4byte gStringVar1
_080C1678: .4byte gStringVar2
_080C167C: .4byte gSpeciesNames
_080C1680: .4byte gUnknown_020387E8
_080C1684:
	ldr r0, _080C16B8 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x2]
	bl sub_80C08FC
	ldr r0, _080C16BC @ =gStringVar2
	ldrb r1, [r4, 0x12]
	movs r2, 0
	bl sub_80FBFB4
	ldr r0, _080C16C0 @ =gStringVar3
	ldrh r2, [r4, 0xE]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C16C4 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrb r0, [r4, 0x11]
	cmp r0, 0x1
	bne _080C16CC
	ldr r1, _080C16C8 @ =gUnknown_020387E8
	movs r0, 0x3
	strb r0, [r1]
	b _080C173C
	.align 2, 0
_080C16B8: .4byte gStringVar1
_080C16BC: .4byte gStringVar2
_080C16C0: .4byte gStringVar3
_080C16C4: .4byte gSpeciesNames
_080C16C8: .4byte gUnknown_020387E8
_080C16CC:
	ldr r1, _080C16D4 @ =gUnknown_020387E8
	movs r0, 0x2
	strb r0, [r1]
	b _080C173C
	.align 2, 0
_080C16D4: .4byte gUnknown_020387E8
_080C16D8:
	ldr r0, _080C1708 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x2]
	bl sub_80C08FC
	ldrb r1, [r4, 0x10]
	movs r0, 0x1
	bl sub_80BF088
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _080C1710
	ldr r1, _080C170C @ =gUnknown_020387E8
	movs r0, 0x5
	strb r0, [r1]
	b _080C173C
	.align 2, 0
_080C1708: .4byte gStringVar1
_080C170C: .4byte gUnknown_020387E8
_080C1710:
	ldr r1, _080C1718 @ =gUnknown_020387E8
	movs r0, 0x4
	strb r0, [r1]
	b _080C173C
	.align 2, 0
_080C1718: .4byte gUnknown_020387E8
_080C171C:
	ldr r0, _080C1730 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x2]
	bl sub_80C08FC
	ldr r1, _080C1734 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C173C
	.align 2, 0
_080C1730: .4byte gStringVar1
_080C1734: .4byte gUnknown_020387E8
_080C1738:
	bl TVShowDone
_080C173C:
	ldr r0, _080C1750 @ =gUnknown_083D15D0
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C1750: .4byte gUnknown_083D15D0
	thumb_func_end DoTVShowPokemonTodayFailedCapture

	thumb_func_start DoTVShowPokemonFanClubLetter
DoTVShowPokemonFanClubLetter: @ 80C1754
	push {r4-r7,lr}
	ldr r0, _080C1780 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1784 @ =gSaveBlock1 + 0x2738
	adds r5, r0, r1
	ldr r1, _080C1788 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C178C @ =gUnknown_020387E8
	ldrb r7, [r0]
	adds r6, r0, 0
	cmp r7, 0x33
	bls _080C1776
	b _080C1960
_080C1776:
	lsls r0, r7, 2
	ldr r1, _080C1790 @ =_080C1794
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1780: .4byte gUnknown_0202E8CC
_080C1784: .4byte gSaveBlock1 + 0x2738
_080C1788: .4byte gScriptResult
_080C178C: .4byte gUnknown_020387E8
_080C1790: .4byte _080C1794
	.align 2, 0
_080C1794:
	.4byte _080C1864
	.4byte _080C1898
	.4byte _080C18C4
	.4byte _080C18CA
	.4byte _080C18E2
	.4byte _080C18E2
	.4byte _080C18E2
	.4byte _080C18F4
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1960
	.4byte _080C1916
	.4byte _080C193C
_080C1864:
	ldr r0, _080C1888 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x10
	ldrb r2, [r5, 0x18]
	bl sub_80C08FC
	ldr r0, _080C188C @ =gStringVar2
	ldrh r2, [r5, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1890 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r1, _080C1894 @ =gUnknown_020387E8
	movs r0, 0x32
	strb r0, [r1]
	b _080C1960
	.align 2, 0
_080C1888: .4byte gStringVar1
_080C188C: .4byte gStringVar2
_080C1890: .4byte gSpeciesNames
_080C1894: .4byte gUnknown_020387E8
_080C1898:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r2, r0, 0x1
	cmp r2, 0x1
	bne _080C18B8
	ldr r1, _080C18B4 @ =gUnknown_020387E8
	movs r0, 0x2
	strb r0, [r1]
	b _080C1960
	.align 2, 0
_080C18B4: .4byte gUnknown_020387E8
_080C18B8:
	ldr r1, _080C18C0 @ =gUnknown_020387E8
	adds r0, r2, 0x2
	strb r0, [r1]
	b _080C1960
	.align 2, 0
_080C18C0: .4byte gUnknown_020387E8
_080C18C4:
	movs r0, 0x33
	strb r0, [r6]
	b _080C1960
_080C18CA:
	bl Random
	ldrb r4, [r6]
	adds r4, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, r4
	strb r0, [r6]
	b _080C1960
_080C18E2:
	adds r0, r5, 0
	bl sub_80BF79C
	ldr r1, _080C18F0 @ =gUnknown_020387E8
	movs r0, 0x7
	strb r0, [r1]
	b _080C1960
	.align 2, 0
_080C18F0: .4byte gUnknown_020387E8
_080C18F4:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1F
	bl __umodsi3
	adds r0, 0x46
	lsls r0, 16
	lsrs r2, r0, 16
	movs r0, 0x2
	adds r1, r2, 0
	bl sub_80BF088
	bl TVShowDone
	b _080C1960
_080C1916:
	ldr r4, _080C1934 @ =gStringVar4
	adds r1, r5, 0x4
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertEasyChatWordsToString
	adds r0, r4, 0
	bl ShowFieldMessage
	ldr r1, _080C1938 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C196C
	.align 2, 0
_080C1934: .4byte gStringVar4
_080C1938: .4byte gUnknown_020387E8
_080C193C:
	ldr r4, _080C1958 @ =gStringVar4
	adds r1, r5, 0x4
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertEasyChatWordsToString
	adds r0, r4, 0
	bl ShowFieldMessage
	ldr r1, _080C195C @ =gUnknown_020387E8
	movs r0, 0x3
	strb r0, [r1]
	b _080C196C
	.align 2, 0
_080C1958: .4byte gStringVar4
_080C195C: .4byte gUnknown_020387E8
_080C1960:
	ldr r0, _080C1974 @ =gUnknown_083D1470
	lsls r1, r7, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
_080C196C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1974: .4byte gUnknown_083D1470
	thumb_func_end DoTVShowPokemonFanClubLetter

	thumb_func_start DoTVShowRecentHappenings
DoTVShowRecentHappenings: @ 80C1978
	push {r4-r7,lr}
	ldr r0, _080C19A4 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C19A8 @ =gSaveBlock1 + 0x2738
	adds r5, r0, r1
	ldr r1, _080C19AC @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C19B0 @ =gUnknown_020387E8
	ldrb r6, [r0]
	adds r7, r0, 0
	cmp r6, 0x32
	bls _080C199A
	b _080C1AF0
_080C199A:
	lsls r0, r6, 2
	ldr r1, _080C19B4 @ =_080C19B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C19A4: .4byte gUnknown_0202E8CC
_080C19A8: .4byte gSaveBlock1 + 0x2738
_080C19AC: .4byte gScriptResult
_080C19B0: .4byte gUnknown_020387E8
_080C19B4: .4byte _080C19B8
	.align 2, 0
_080C19B8:
	.4byte _080C1A84
	.4byte _080C1AA8
	.4byte _080C1AC0
	.4byte _080C1AC0
	.4byte _080C1AC0
	.4byte _080C1AC6
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1AF0
	.4byte _080C1ACC
_080C1A84:
	ldr r0, _080C1AA0 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x10
	ldrb r2, [r5, 0x18]
	bl sub_80C08FC
	adds r0, r5, 0
	bl sub_80BF79C
	ldr r1, _080C1AA4 @ =gUnknown_020387E8
	movs r0, 0x32
	strb r0, [r1]
	b _080C1AF0
	.align 2, 0
_080C1AA0: .4byte gStringVar1
_080C1AA4: .4byte gUnknown_020387E8
_080C1AA8:
	bl Random
	ldrb r4, [r7]
	adds r4, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, r4
	strb r0, [r7]
	b _080C1AF0
_080C1AC0:
	movs r0, 0x5
	strb r0, [r7]
	b _080C1AF0
_080C1AC6:
	bl TVShowDone
	b _080C1AF0
_080C1ACC:
	ldr r4, _080C1AE8 @ =gStringVar4
	adds r1, r5, 0x4
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertEasyChatWordsToString
	adds r0, r4, 0
	bl ShowFieldMessage
	ldr r1, _080C1AEC @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C1AFC
	.align 2, 0
_080C1AE8: .4byte gStringVar4
_080C1AEC: .4byte gUnknown_020387E8
_080C1AF0:
	ldr r0, _080C1B04 @ =gUnknown_083D1490
	lsls r1, r6, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
_080C1AFC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1B04: .4byte gUnknown_083D1490
	thumb_func_end DoTVShowRecentHappenings

	thumb_func_start DoTVShowPokemonFanClubOpinions
DoTVShowPokemonFanClubOpinions: @ 80C1B08
	push {r4-r6,lr}
	ldr r0, _080C1B30 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1B34 @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r1, _080C1B38 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r6, _080C1B3C @ =gUnknown_020387E8
	ldrb r5, [r6]
	cmp r5, 0x3
	bgt _080C1B40
	cmp r5, 0x1
	bge _080C1B88
	cmp r5, 0
	beq _080C1B46
	b _080C1BD6
	.align 2, 0
_080C1B30: .4byte gUnknown_0202E8CC
_080C1B34: .4byte gSaveBlock1 + 0x2738
_080C1B38: .4byte gScriptResult
_080C1B3C: .4byte gUnknown_020387E8
_080C1B40:
	cmp r5, 0x4
	beq _080C1BC0
	b _080C1BD6
_080C1B46:
	ldr r0, _080C1B78 @ =gStringVar1
	adds r1, r4, 0x5
	ldrb r2, [r4, 0xD]
	bl sub_80C08FC
	ldr r0, _080C1B7C @ =gStringVar2
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1B80 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1B84 @ =gStringVar3
	adds r1, r4, 0
	adds r1, 0x10
	ldrb r2, [r4, 0xE]
	bl sub_80C08FC
	ldrb r0, [r4, 0x4]
	lsrs r0, 4
	adds r0, 0x1
	strb r0, [r6]
	b _080C1BD6
	.align 2, 0
_080C1B78: .4byte gStringVar1
_080C1B7C: .4byte gStringVar2
_080C1B80: .4byte gSpeciesNames
_080C1B84: .4byte gStringVar3
_080C1B88:
	ldr r0, _080C1BB0 @ =gStringVar1
	adds r1, r4, 0x5
	ldrb r2, [r4, 0xD]
	bl sub_80C08FC
	ldr r0, _080C1BB4 @ =gStringVar2
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1BB8 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1BBC @ =gStringVar3
	ldrh r1, [r4, 0x1C]
	bl sub_80EB3FC
	movs r0, 0x4
	strb r0, [r6]
	b _080C1BD6
	.align 2, 0
_080C1BB0: .4byte gStringVar1
_080C1BB4: .4byte gStringVar2
_080C1BB8: .4byte gSpeciesNames
_080C1BBC: .4byte gStringVar3
_080C1BC0:
	ldr r0, _080C1BE8 @ =gStringVar1
	adds r1, r4, 0x5
	ldrb r2, [r4, 0xD]
	bl sub_80C08FC
	ldr r0, _080C1BEC @ =gStringVar3
	ldrh r1, [r4, 0x1E]
	bl sub_80EB3FC
	bl TVShowDone
_080C1BD6:
	ldr r0, _080C1BF0 @ =gUnknown_083D14A8
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C1BE8: .4byte gStringVar1
_080C1BEC: .4byte gStringVar3
_080C1BF0: .4byte gUnknown_083D14A8
	thumb_func_end DoTVShowPokemonFanClubOpinions

	thumb_func_start nullsub_22
nullsub_22: @ 80C1BF4
	bx lr
	thumb_func_end nullsub_22

	thumb_func_start DoTVShowPokemonNewsMassOutbreak
DoTVShowPokemonNewsMassOutbreak: @ 80C1BF8
	push {r4,lr}
	ldr r0, _080C1C40 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080C1C44 @ =gSaveBlock1 + 0x2738
	adds r4, r0
	ldr r0, _080C1C48 @ =gStringVar1
	ldrb r1, [r4, 0x10]
	movs r2, 0
	bl sub_80FBFB4
	ldr r0, _080C1C4C @ =gStringVar2
	ldrh r2, [r4, 0xC]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1C50 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	bl TVShowDone
	bl StartMassOutbreak
	ldr r1, _080C1C54 @ =gUnknown_083D14BC
	ldr r0, _080C1C58 @ =gUnknown_020387E8
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C1C40: .4byte gUnknown_0202E8CC
_080C1C44: .4byte gSaveBlock1 + 0x2738
_080C1C48: .4byte gStringVar1
_080C1C4C: .4byte gStringVar2
_080C1C50: .4byte gSpeciesNames
_080C1C54: .4byte gUnknown_083D14BC
_080C1C58: .4byte gUnknown_020387E8
	thumb_func_end DoTVShowPokemonNewsMassOutbreak

	thumb_func_start DoTVShowInSearchOfTrainers
DoTVShowInSearchOfTrainers: @ 80C1C5C
	push {r4-r7,lr}
	ldr r0, _080C1C7C @ =gScriptResult
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080C1C80 @ =gUnknown_020387E8
	ldrb r7, [r0]
	adds r2, r0, 0
	cmp r7, 0x8
	bls _080C1C70
	b _080C1DF8
_080C1C70:
	lsls r0, r7, 2
	ldr r1, _080C1C84 @ =_080C1C88
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1C7C: .4byte gScriptResult
_080C1C80: .4byte gUnknown_020387E8
_080C1C84: .4byte _080C1C88
	.align 2, 0
_080C1C88:
	.4byte _080C1CAC
	.4byte _080C1CF0
	.4byte _080C1CF6
	.4byte _080C1D44
	.4byte _080C1DB0
	.4byte _080C1DB0
	.4byte _080C1DB0
	.4byte _080C1DB0
	.4byte _080C1DB6
_080C1CAC:
	ldr r0, _080C1CD0 @ =gStringVar1
	ldr r4, _080C1CD4 @ =gSaveBlock1
	ldr r2, _080C1CD8 @ =0x00002b18
	adds r1, r4, r2
	ldrb r1, [r1]
	movs r2, 0
	bl sub_80FBFB4
	ldr r0, _080C1CDC @ =0x00002b19
	adds r4, r0
	ldrb r0, [r4]
	cmp r0, 0x1
	bls _080C1CE4
	ldr r1, _080C1CE0 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C1DF8
	.align 2, 0
_080C1CD0: .4byte gStringVar1
_080C1CD4: .4byte gSaveBlock1
_080C1CD8: .4byte 0x00002b18
_080C1CDC: .4byte 0x00002b19
_080C1CE0: .4byte gUnknown_020387E8
_080C1CE4:
	ldr r1, _080C1CEC @ =gUnknown_020387E8
	movs r0, 0x2
	strb r0, [r1]
	b _080C1DF8
	.align 2, 0
_080C1CEC: .4byte gUnknown_020387E8
_080C1CF0:
	movs r0, 0x2
	strb r0, [r2]
	b _080C1DF8
_080C1CF6:
	ldr r0, _080C1D0C @ =gSaveBlock1
	ldr r1, _080C1D10 @ =0x00002b1a
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080C1D14
	movs r0, 0x4
	strb r0, [r2]
	b _080C1DF8
	.align 2, 0
_080C1D0C: .4byte gSaveBlock1
_080C1D10: .4byte 0x00002b1a
_080C1D14:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080C1D22
	movs r0, 0x5
	strb r0, [r2]
	b _080C1DF8
_080C1D22:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080C1D30
	movs r0, 0x6
	strb r0, [r2]
	b _080C1DF8
_080C1D30:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080C1D3E
	movs r0, 0x7
	strb r0, [r2]
	b _080C1DF8
_080C1D3E:
	movs r0, 0x3
	strb r0, [r2]
	b _080C1DF8
_080C1D44:
	ldr r0, _080C1D88 @ =gStringVar1
	ldr r4, _080C1D8C @ =gSaveBlock1
	ldr r2, _080C1D90 @ =0x00002b10
	adds r1, r4, r2
	ldrh r1, [r1]
	movs r6, 0xB
	muls r1, r6
	ldr r5, _080C1D94 @ =gSpeciesNames
	adds r1, r5
	bl StringCopy
	ldr r0, _080C1D98 @ =gStringVar2
	ldr r2, _080C1D9C @ =0x00002b14
	adds r1, r4, r2
	ldrh r2, [r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080C1DA0 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1DA4 @ =gStringVar3
	ldr r1, _080C1DA8 @ =0x00002b12
	adds r4, r1
	ldrh r1, [r4]
	muls r1, r6
	adds r1, r5
	bl StringCopy
	ldr r1, _080C1DAC @ =gUnknown_020387E8
	movs r0, 0x8
	strb r0, [r1]
	b _080C1DF8
	.align 2, 0
_080C1D88: .4byte gStringVar1
_080C1D8C: .4byte gSaveBlock1
_080C1D90: .4byte 0x00002b10
_080C1D94: .4byte gSpeciesNames
_080C1D98: .4byte gStringVar2
_080C1D9C: .4byte 0x00002b14
_080C1DA0: .4byte gMoveNames
_080C1DA4: .4byte gStringVar3
_080C1DA8: .4byte 0x00002b12
_080C1DAC: .4byte gUnknown_020387E8
_080C1DB0:
	movs r0, 0x8
	strb r0, [r2]
	b _080C1DF8
_080C1DB6:
	ldr r0, _080C1E0C @ =gStringVar1
	ldr r4, _080C1E10 @ =gSaveBlock1
	ldr r2, _080C1E14 @ =0x00002b16
	adds r1, r4, r2
	ldrh r1, [r1]
	bl sub_80EB3FC
	ldr r0, _080C1E18 @ =gStringVar2
	ldr r2, _080C1E1C @ =0x00002b10
	adds r1, r4, r2
	ldrh r1, [r1]
	movs r6, 0xB
	muls r1, r6
	ldr r5, _080C1E20 @ =gSpeciesNames
	adds r1, r5
	bl StringCopy
	ldr r0, _080C1E24 @ =gStringVar3
	ldr r1, _080C1E28 @ =0x00002b12
	adds r4, r1
	ldrh r1, [r4]
	muls r1, r6
	adds r1, r5
	bl StringCopy
	ldr r1, _080C1E2C @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, _080C1E30 @ =gUnknown_020387E8
	movs r0, 0
	strb r0, [r1]
	bl TakeTVShowInSearchOfTrainersOffTheAir
_080C1DF8:
	ldr r0, _080C1E34 @ =gUnknown_083D1600
	lsls r1, r7, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1E0C: .4byte gStringVar1
_080C1E10: .4byte gSaveBlock1
_080C1E14: .4byte 0x00002b16
_080C1E18: .4byte gStringVar2
_080C1E1C: .4byte 0x00002b10
_080C1E20: .4byte gSpeciesNames
_080C1E24: .4byte gStringVar3
_080C1E28: .4byte 0x00002b12
_080C1E2C: .4byte gScriptResult
_080C1E30: .4byte gUnknown_020387E8
_080C1E34: .4byte gUnknown_083D1600
	thumb_func_end DoTVShowInSearchOfTrainers

	thumb_func_start DoTVShowPokemonAngler
DoTVShowPokemonAngler: @ 80C1E38
	push {r4,r5,lr}
	ldr r0, _080C1E5C @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1E60 @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r0, _080C1E64 @ =gScriptResult
	movs r1, 0
	strh r1, [r0]
	ldrb r0, [r4, 0x2]
	ldrb r2, [r4, 0x3]
	cmp r0, r2
	bcs _080C1E6C
	ldr r0, _080C1E68 @ =gUnknown_020387E8
	strb r1, [r0]
	b _080C1E74
	.align 2, 0
_080C1E5C: .4byte gUnknown_0202E8CC
_080C1E60: .4byte gSaveBlock1 + 0x2738
_080C1E64: .4byte gScriptResult
_080C1E68: .4byte gUnknown_020387E8
_080C1E6C:
	ldr r1, _080C1E80 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r1, 0
_080C1E74:
	ldrb r5, [r0]
	cmp r5, 0
	beq _080C1E84
	cmp r5, 0x1
	beq _080C1EBC
	b _080C1EE4
	.align 2, 0
_080C1E80: .4byte gUnknown_020387E8
_080C1E84:
	ldr r0, _080C1EB0 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x6]
	bl sub_80C08FC
	ldr r0, _080C1EB4 @ =gStringVar2
	ldrh r2, [r4, 0x4]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1EB8 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrb r1, [r4, 0x3]
	movs r0, 0x2
	bl sub_80BF088
	bl TVShowDone
	b _080C1EE4
	.align 2, 0
_080C1EB0: .4byte gStringVar1
_080C1EB4: .4byte gStringVar2
_080C1EB8: .4byte gSpeciesNames
_080C1EBC:
	ldr r0, _080C1EF8 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x6]
	bl sub_80C08FC
	ldr r0, _080C1EFC @ =gStringVar2
	ldrh r2, [r4, 0x4]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1F00 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrb r1, [r4, 0x2]
	movs r0, 0x2
	bl sub_80BF088
	bl TVShowDone
_080C1EE4:
	ldr r0, _080C1F04 @ =gUnknown_083D15EC
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C1EF8: .4byte gStringVar1
_080C1EFC: .4byte gStringVar2
_080C1F00: .4byte gSpeciesNames
_080C1F04: .4byte gUnknown_083D15EC
	thumb_func_end DoTVShowPokemonAngler

	thumb_func_start DoTVShowTheWorldOfMasters
DoTVShowTheWorldOfMasters: @ 80C1F08
	push {r4-r6,lr}
	ldr r0, _080C1F30 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1F34 @ =gSaveBlock1 + 0x2738
	adds r4, r0, r1
	ldr r1, _080C1F38 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r6, _080C1F3C @ =gUnknown_020387E8
	ldrb r5, [r6]
	cmp r5, 0x1
	beq _080C1F6C
	cmp r5, 0x1
	bgt _080C1F40
	cmp r5, 0
	beq _080C1F46
	b _080C1FB6
	.align 2, 0
_080C1F30: .4byte gUnknown_0202E8CC
_080C1F34: .4byte gSaveBlock1 + 0x2738
_080C1F38: .4byte gScriptResult
_080C1F3C: .4byte gUnknown_020387E8
_080C1F40:
	cmp r5, 0x2
	beq _080C1F8C
	b _080C1FB6
_080C1F46:
	ldr r0, _080C1F68 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0xB]
	bl sub_80C08FC
	ldrh r1, [r4, 0x6]
	movs r0, 0x1
	bl sub_80BF088
	ldrh r1, [r4, 0x2]
	movs r0, 0x2
	bl sub_80BF088
	movs r0, 0x1
	strb r0, [r6]
	b _080C1FB6
	.align 2, 0
_080C1F68: .4byte gStringVar1
_080C1F6C:
	ldr r0, _080C1F84 @ =gStringVar1
	ldrh r2, [r4, 0x8]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1F88 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	movs r0, 0x2
	strb r0, [r6]
	b _080C1FB6
	.align 2, 0
_080C1F84: .4byte gStringVar1
_080C1F88: .4byte gSpeciesNames
_080C1F8C:
	ldr r0, _080C1FC8 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0xB]
	bl sub_80C08FC
	ldr r0, _080C1FCC @ =gStringVar2
	ldrb r1, [r4, 0xA]
	movs r2, 0
	bl sub_80FBFB4
	ldr r0, _080C1FD0 @ =gStringVar3
	ldrh r2, [r4, 0x4]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1FD4 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	bl TVShowDone
_080C1FB6:
	ldr r0, _080C1FD8 @ =gUnknown_083D15F4
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C1FC8: .4byte gStringVar1
_080C1FCC: .4byte gStringVar2
_080C1FD0: .4byte gStringVar3
_080C1FD4: .4byte gSpeciesNames
_080C1FD8: .4byte gUnknown_083D15F4
	thumb_func_end DoTVShowTheWorldOfMasters

	thumb_func_start TVShowDone
TVShowDone: @ 80C1FDC
	ldr r1, _080C2000 @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, _080C2004 @ =gUnknown_020387E8
	movs r0, 0
	strb r0, [r1]
	ldr r2, _080C2008 @ =gSaveBlock1
	ldr r0, _080C200C @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080C2010 @ =0x00002739
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080C2000: .4byte gScriptResult
_080C2004: .4byte gUnknown_020387E8
_080C2008: .4byte gSaveBlock1
_080C200C: .4byte gUnknown_0202E8CC
_080C2010: .4byte 0x00002739
	thumb_func_end TVShowDone

	thumb_func_start sub_80C2014
sub_80C2014: @ 80C2014
	ldr r1, _080C201C @ =gUnknown_020387E8
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080C201C: .4byte gUnknown_020387E8
	thumb_func_end sub_80C2014

	thumb_func_start sub_80C2020
sub_80C2020: @ 80C2020
	push {r4,r5,lr}
	movs r5, 0x80
	lsls r5, 19
	movs r0, 0x40
	strh r0, [r5]
	ldr r4, _080C20F0 @ =gWindowConfig_81E6FA0
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, _080C20F4 @ =gMenuWindow
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r1, _080C20F8 @ =REG_BG0CNT
	movs r2, 0xF8
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080C20FC @ =0x00001803
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080C2100 @ =0x00001c03
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080C2104 @ =0x00003a03
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _080C2108 @ =REG_MOSAIC
	movs r2, 0
	strh r2, [r0]
	adds r1, 0x3A
	ldr r3, _080C210C @ =0x00003f3f
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	subs r3, 0x11
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _080C2110 @ =REG_WIN0H
	strh r2, [r0]
	adds r0, 0x4
	strh r2, [r0]
	subs r0, 0x2
	strh r2, [r0]
	adds r0, 0x4
	strh r2, [r0]
	adds r0, 0xA
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	subs r0, 0x44
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	ldrh r0, [r5]
	movs r3, 0xFE
	lsls r3, 7
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r5]
	ldr r0, _080C2114 @ =gUnknown_030042A4
	strh r2, [r0]
	ldr r0, _080C2118 @ =gUnknown_030042A0
	strh r2, [r0]
	ldr r0, _080C211C @ =gUnknown_030042C0
	strh r2, [r0]
	ldr r0, _080C2120 @ =gUnknown_030041B4
	strh r2, [r0]
	ldr r0, _080C2124 @ =gUnknown_03004288
	strh r2, [r0]
	ldr r0, _080C2128 @ =gUnknown_03004280
	strh r2, [r0]
	ldr r0, _080C212C @ =gUnknown_030041B0
	strh r2, [r0]
	ldr r0, _080C2130 @ =gUnknown_030041B8
	strh r2, [r0]
	ldr r0, _080C2134 @ =gUnknown_030042C4
	strh r2, [r0]
	ldr r0, _080C2138 @ =gUnknown_03004240
	strh r2, [r0]
	ldr r0, _080C213C @ =gUnknown_03004200
	strh r2, [r0]
	ldr r0, _080C2140 @ =gUnknown_03004244
	strh r2, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C20F0: .4byte gWindowConfig_81E6FA0
_080C20F4: .4byte gMenuWindow
_080C20F8: .4byte REG_BG0CNT
_080C20FC: .4byte 0x00001803
_080C2100: .4byte 0x00001c03
_080C2104: .4byte 0x00003a03
_080C2108: .4byte REG_MOSAIC
_080C210C: .4byte 0x00003f3f
_080C2110: .4byte REG_WIN0H
_080C2114: .4byte gUnknown_030042A4
_080C2118: .4byte gUnknown_030042A0
_080C211C: .4byte gUnknown_030042C0
_080C2120: .4byte gUnknown_030041B4
_080C2124: .4byte gUnknown_03004288
_080C2128: .4byte gUnknown_03004280
_080C212C: .4byte gUnknown_030041B0
_080C2130: .4byte gUnknown_030041B8
_080C2134: .4byte gUnknown_030042C4
_080C2138: .4byte gUnknown_03004240
_080C213C: .4byte gUnknown_03004200
_080C2140: .4byte gUnknown_03004244
	thumb_func_end sub_80C2020

	thumb_func_start sub_80C2144
sub_80C2144: @ 80C2144
	push {r4-r7,lr}
	sub sp, 0x4
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	ldr r0, _080C220C @ =gUnknown_08D1977C
	mov r12, r0
	movs r5, 0
	ldr r1, _080C2210 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _080C2214 @ =0x85000400
	movs r7, 0x85
	lsls r7, 24
_080C2162:
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080C2162
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r1, 0xC0
	lsls r1, 19
	mov r0, r12
	bl LZDecompressVram
	ldr r0, _080C2218 @ =gUnknown_08D1A490
	ldr r1, _080C221C @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _080C2220 @ =gUnknown_08D1A364
	ldr r1, _080C2224 @ =0x0600e000
	bl LZDecompressVram
	ldr r0, _080C2228 @ =gUnknown_08D1A250
	ldr r1, _080C222C @ =0x0600f000
	bl LZDecompressVram
	bl sub_80C37E4
	ldr r0, _080C2230 @ =gUnknown_08D1A618
	movs r2, 0x80
	lsls r2, 2
	movs r1, 0
	bl LoadCompressedPalette
	ldr r0, _080C2234 @ =gWindowConfig_81E6FA0
	bl LoadFontDefaultPalette
	movs r6, 0
_080C21C0:
	lsls r5, r6, 24
	lsrs r5, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80C3990
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80C39E4
	movs r5, 0
	lsls r1, r6, 1
	adds r2, r6, 0x1
	mov r12, r2
	lsls r4, 24
	asrs r7, r4, 24
	adds r1, r6
	lsls r1, 6
	lsls r4, r0, 24
_080C21EC:
	ldr r6, _080C2238 @ =0x000060b2
	cmp r5, r7
	bge _080C21F4
	adds r6, 0x2
_080C21F4:
	asrs r2, r4, 24
	adds r0, r2, 0
	cmp r2, 0
	bge _080C21FE
	negs r0, r2
_080C21FE:
	cmp r5, r0
	bge _080C2240
	ldr r3, _080C223C @ =0x000060a4
	cmp r2, 0
	bge _080C2242
	adds r3, 0x2
	b _080C2242
	.align 2, 0
_080C220C: .4byte gUnknown_08D1977C
_080C2210: .4byte 0x040000d4
_080C2214: .4byte 0x85000400
_080C2218: .4byte gUnknown_08D1A490
_080C221C: .4byte 0x0600d000
_080C2220: .4byte gUnknown_08D1A364
_080C2224: .4byte 0x0600e000
_080C2228: .4byte gUnknown_08D1A250
_080C222C: .4byte 0x0600f000
_080C2230: .4byte gUnknown_08D1A618
_080C2234: .4byte gWindowConfig_81E6FA0
_080C2238: .4byte 0x000060b2
_080C223C: .4byte 0x000060a4
_080C2240:
	ldr r3, _080C2264 @ =0x000060a2
_080C2242:
	ldr r2, _080C2268 @ =0x0600c166
	adds r0, r1, r2
	strh r6, [r0]
	adds r2, 0x40
	adds r0, r1, r2
	strh r3, [r0]
	adds r1, 0x2
	adds r5, 0x1
	cmp r5, 0x9
	ble _080C21EC
	mov r6, r12
	cmp r6, 0x3
	ble _080C21C0
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2264: .4byte 0x000060a2
_080C2268: .4byte 0x0600c166
	thumb_func_end sub_80C2144

	thumb_func_start sub_80C226C
sub_80C226C: @ 80C226C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C2288 @ =gUnknown_02038695
	ldrb r0, [r0]
	cmp r5, r0
	bne _080C2294
	ldr r0, _080C228C @ =gUnknown_020238CC
	ldr r1, _080C2290 @ =gUnknown_083D17DC
	bl StringCopy
	adds r2, r0, 0
	b _080C2296
	.align 2, 0
_080C2288: .4byte gUnknown_02038695
_080C228C: .4byte gUnknown_020238CC
_080C2290: .4byte gUnknown_083D17DC
_080C2294:
	ldr r2, _080C22E8 @ =gUnknown_020238CC
_080C2296:
	movs r4, 0xFC
	strb r4, [r2]
	movs r0, 0x6
	strb r0, [r2, 0x1]
	movs r0, 0x4
	strb r0, [r2, 0x2]
	adds r2, 0x3
	lsls r6, r5, 6
	ldr r7, _080C22EC @ =gUnknown_02038572
	adds r1, r6, r7
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	strb r4, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	movs r0, 0x32
	strb r0, [r2, 0x2]
	adds r2, 0x3
	ldr r1, _080C22F0 @ =gUnknown_083D17E0
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r0, _080C22F4 @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C22FC
	lsls r4, r5, 3
	subs r1, r4, r5
	lsls r1, 2
	ldr r0, _080C22F8 @ =gLinkPlayers + 0x8
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	b _080C230A
	.align 2, 0
_080C22E8: .4byte gUnknown_020238CC
_080C22EC: .4byte gUnknown_02038572
_080C22F0: .4byte gUnknown_083D17E0
_080C22F4: .4byte gUnknown_0203869A
_080C22F8: .4byte gLinkPlayers + 0x8
_080C22FC:
	adds r1, r7, 0
	adds r1, 0xB
	adds r1, r6, r1
	adds r0, r2, 0
	bl StringCopy
	lsls r4, r5, 3
_080C230A:
	ldr r0, _080C2334 @ =gMenuWindow
	ldr r1, _080C2338 @ =gUnknown_020238CC
	adds r2, r4, r5
	lsls r2, 18
	ldr r3, _080C233C @ =0x03020000
	adds r2, r3
	lsrs r2, 16
	lsls r3, r5, 1
	adds r3, r5
	adds r3, 0x4
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	movs r3, 0x7
	bl sub_8003460
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2334: .4byte gMenuWindow
_080C2338: .4byte gUnknown_020238CC
_080C233C: .4byte 0x03020000
	thumb_func_end sub_80C226C

	thumb_func_start sub_80C2340
sub_80C2340: @ 80C2340
	push {r4,lr}
	movs r4, 0
_080C2344:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80C226C
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C2344
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C2340

	thumb_func_start sub_80C2358
sub_80C2358: @ 80C2358
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080C240C @ =gPaletteFade
	ldrb r0, [r5, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r5, 0x8]
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80C2020
	bl dp12_8087EA4
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	bl sub_80C2144
	bl sub_80C310C
	movs r0, 0
	movs r1, 0x1
	bl sub_80C30D4
	bl sub_80C2340
	ldr r4, _080C2410 @ =0x02018000
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x18
	bl memset
	adds r0, r4, 0
	adds r0, 0x18
	movs r1, 0
	movs r2, 0x50
	bl memset
	bl sub_80C33DC
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrb r1, [r5, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r5, 0x8]
	ldr r0, _080C2414 @ =sub_80C24F4
	movs r1, 0x5
	bl CreateTask
	strb r0, [r4, 0x2]
	ldr r0, _080C2418 @ =sub_80C2430
	bl SetMainCallback2
	ldr r1, _080C241C @ =gUnknown_03004200
	movs r0, 0xF0
	strh r0, [r1]
	ldr r1, _080C2420 @ =gUnknown_03004244
	ldr r2, _080C2424 @ =0x000080a0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080C2428 @ =sub_80C2F28
	movs r1, 0x14
	bl CreateTask
	bl sub_80C3F00
	movs r0, 0xDF
	lsls r0, 1
	bl PlayBGM
	ldr r0, _080C242C @ =sub_80C2448
	bl SetVBlankCallback
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C240C: .4byte gPaletteFade
_080C2410: .4byte 0x02018000
_080C2414: .4byte sub_80C24F4
_080C2418: .4byte sub_80C2430
_080C241C: .4byte gUnknown_03004200
_080C2420: .4byte gUnknown_03004244
_080C2424: .4byte 0x000080a0
_080C2428: .4byte sub_80C2F28
_080C242C: .4byte sub_80C2448
	thumb_func_end sub_80C2358

	thumb_func_start sub_80C2430
sub_80C2430: @ 80C2430
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80C2430

	thumb_func_start sub_80C2448
sub_80C2448: @ 80C2448
	push {lr}
	ldr r1, _080C24C0 @ =REG_BG0HOFS
	ldr r0, _080C24C4 @ =gUnknown_030042A4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24C8 @ =gUnknown_030042A0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24CC @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24D0 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24D4 @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24D8 @ =gUnknown_03004280
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24DC @ =gUnknown_030041B0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C24E0 @ =gUnknown_030041B8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x22
	ldr r0, _080C24E4 @ =gUnknown_030042C4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _080C24E8 @ =gUnknown_03004240
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	ldr r0, _080C24EC @ =gUnknown_03004200
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _080C24F0 @ =gUnknown_03004244
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_080C24C0: .4byte REG_BG0HOFS
_080C24C4: .4byte gUnknown_030042A4
_080C24C8: .4byte gUnknown_030042A0
_080C24CC: .4byte gUnknown_030042C0
_080C24D0: .4byte gUnknown_030041B4
_080C24D4: .4byte gUnknown_03004288
_080C24D8: .4byte gUnknown_03004280
_080C24DC: .4byte gUnknown_030041B0
_080C24E0: .4byte gUnknown_030041B8
_080C24E4: .4byte gUnknown_030042C4
_080C24E8: .4byte gUnknown_03004240
_080C24EC: .4byte gUnknown_03004200
_080C24F0: .4byte gUnknown_03004244
	thumb_func_end sub_80C2448

	thumb_func_start sub_80C24F4
sub_80C24F4: @ 80C24F4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r2, r4, 0
	ldr r0, _080C252C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C254E
	ldr r0, _080C2530 @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C2540
	ldr r0, _080C2534 @ =gOtherText_LinkStandby
	bl sub_80C3698
	ldr r1, _080C2538 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C253C @ =sub_80C255C
	str r1, [r0]
	b _080C254E
	.align 2, 0
_080C252C: .4byte gPaletteFade
_080C2530: .4byte gUnknown_0203869A
_080C2534: .4byte gOtherText_LinkStandby
_080C2538: .4byte gTasks
_080C253C: .4byte sub_80C255C
_080C2540:
	ldr r0, _080C2554 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C2558 @ =sub_80C2600
	str r0, [r1]
_080C254E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2554: .4byte gTasks
_080C2558: .4byte sub_80C2600
	thumb_func_end sub_80C24F4

	thumb_func_start sub_80C255C
sub_80C255C: @ 80C255C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C2594 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C258C
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080C258C
	ldr r0, _080C2598 @ =sub_80C25A4
	movs r1, 0
	bl CreateTask
	ldr r1, _080C259C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C25A0 @ =TaskDummy
	str r1, [r0]
_080C258C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2594: .4byte gReceivedRemoteLinkPlayers
_080C2598: .4byte sub_80C25A4
_080C259C: .4byte gTasks
_080C25A0: .4byte TaskDummy
	thumb_func_end sub_80C255C

	thumb_func_start sub_80C25A4
sub_80C25A4: @ 80C25A4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C25B8 @ =sub_80C89DC
	ldr r2, _080C25BC @ =sub_80C25C0
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080C25B8: .4byte sub_80C89DC
_080C25BC: .4byte sub_80C25C0
	thumb_func_end sub_80C25A4

	thumb_func_start sub_80C25C0
sub_80C25C0: @ 80C25C0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C25EC
	adds r0, r4, 0
	bl DestroyTask
	ldr r2, _080C25F4 @ =gTasks
	ldr r0, _080C25F8 @ =0x02018000
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080C25FC @ =sub_80C2600
	str r1, [r0]
	bl sub_80C3764
_080C25EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C25F4: .4byte gTasks
_080C25F8: .4byte 0x02018000
_080C25FC: .4byte sub_80C2600
	thumb_func_end sub_80C25C0

	thumb_func_start sub_80C2600
sub_80C2600: @ 80C2600
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C2644 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrh r1, [r5, 0x8]
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080C2654
	ldr r0, _080C2648 @ =sub_80C2F64
	movs r1, 0x14
	bl CreateTask
	ldr r4, _080C264C @ =gContestText_AnnounceResults
	ldr r0, _080C2650 @ =0x02018000
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_80C3158
	adds r0, r4, 0
	bl sub_80C34AC
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x88
	lsls r3, 3
	movs r1, 0x90
	movs r2, 0x78
	b _080C26A6
	.align 2, 0
_080C2644: .4byte gTasks
_080C2648: .4byte sub_80C2F64
_080C264C: .4byte gContestText_AnnounceResults
_080C2650: .4byte 0x02018000
_080C2654:
	cmp r0, 0x1
	bne _080C2668
	ldr r0, _080C2664 @ =0x02018000
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	bne _080C26D4
	b _080C267C
	.align 2, 0
_080C2664: .4byte 0x02018000
_080C2668:
	cmp r0, 0x2
	bne _080C2684
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080C26D4
	movs r0, 0
_080C267C:
	strh r0, [r5, 0xA]
	adds r0, r1, 0x1
	strh r0, [r5, 0x8]
	b _080C26D4
_080C2684:
	cmp r0, 0x3
	bne _080C26C0
	ldr r4, _080C26B4 @ =gContestText_PreliminaryResults
	ldr r0, _080C26B8 @ =0x02018000
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_80C3158
	adds r0, r4, 0
	bl sub_80C34AC
	lsls r0, 16
	asrs r0, 16
	ldr r2, _080C26BC @ =0x0000ffff
	movs r3, 0x88
	lsls r3, 3
	movs r1, 0x90
_080C26A6:
	bl sub_80C34CC
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080C26D4
	.align 2, 0
_080C26B4: .4byte gContestText_PreliminaryResults
_080C26B8: .4byte 0x02018000
_080C26BC: .4byte 0x0000ffff
_080C26C0:
	cmp r0, 0x4
	bne _080C26D4
	ldr r0, _080C26DC @ =0x02018000
	ldrb r0, [r0, 0x4]
	cmp r0, 0x2
	bne _080C26D4
	movs r0, 0
	strh r0, [r5, 0x8]
	ldr r0, _080C26E0 @ =sub_80C26E4
	str r0, [r5]
_080C26D4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C26DC: .4byte 0x02018000
_080C26E0: .4byte sub_80C26E4
	thumb_func_end sub_80C2600

	thumb_func_start sub_80C26E4
sub_80C26E4: @ 80C26E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C2708 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080C2744
	cmp r0, 0x1
	bgt _080C270C
	cmp r0, 0
	beq _080C2712
	b _080C2766
	.align 2, 0
_080C2708: .4byte gTasks
_080C270C:
	cmp r0, 0x2
	beq _080C2754
	b _080C2766
_080C2712:
	ldr r5, _080C2738 @ =0x02018000
	ldrb r0, [r5, 0xA]
	cmp r0, 0
	bne _080C2766
	ldrh r1, [r4, 0xC]
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_80C40D4
	ldrb r0, [r5, 0x14]
	cmp r0, 0
	bne _080C273C
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080C2766
	.align 2, 0
_080C2738: .4byte 0x02018000
_080C273C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C2766
_080C2744:
	ldr r0, _080C2750 @ =0x02018000
	ldrb r0, [r0, 0x14]
	cmp r0, 0
	bne _080C2766
	strh r0, [r4, 0x8]
	b _080C2766
	.align 2, 0
_080C2750: .4byte 0x02018000
_080C2754:
	movs r0, 0x88
	lsls r0, 3
	bl sub_80C3520
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xC]
	ldr r0, _080C276C @ =sub_80C2770
	str r0, [r4]
_080C2766:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C276C: .4byte sub_80C2770
	thumb_func_end sub_80C26E4

	thumb_func_start sub_80C2770
sub_80C2770: @ 80C2770
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r4, r2, 0
	ldr r5, _080C27BC @ =0x02018000
	ldrb r3, [r5, 0x4]
	cmp r3, 0
	bne _080C27CC
	ldr r1, _080C27C0 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080C27DE
	strh r3, [r1, 0xA]
	ldr r4, _080C27C4 @ =gContestText_Round2Results
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_80C3158
	adds r0, r4, 0
	bl sub_80C34AC
	lsls r0, 16
	asrs r0, 16
	ldr r2, _080C27C8 @ =0x0000ffff
	movs r3, 0x88
	lsls r3, 3
	movs r1, 0x90
	bl sub_80C34CC
	b _080C27DE
	.align 2, 0
_080C27BC: .4byte 0x02018000
_080C27C0: .4byte gTasks
_080C27C4: .4byte gContestText_Round2Results
_080C27C8: .4byte 0x0000ffff
_080C27CC:
	cmp r3, 0x2
	bne _080C27DE
	ldr r0, _080C27E4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C27E8 @ =sub_80C27EC
	str r0, [r1]
_080C27DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C27E4: .4byte gTasks
_080C27E8: .4byte sub_80C27EC
	thumb_func_end sub_80C2770

	thumb_func_start sub_80C27EC
sub_80C27EC: @ 80C27EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C2810 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080C284C
	cmp r0, 0x1
	bgt _080C2814
	cmp r0, 0
	beq _080C281A
	b _080C286C
	.align 2, 0
_080C2810: .4byte gTasks
_080C2814:
	cmp r0, 0x2
	beq _080C285C
	b _080C286C
_080C281A:
	ldr r5, _080C2840 @ =0x02018000
	ldrb r0, [r5, 0xA]
	cmp r0, 0
	bne _080C286C
	ldrh r1, [r4, 0xC]
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	bl sub_80C40D4
	ldrb r0, [r5, 0x14]
	cmp r0, 0
	bne _080C2844
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080C286C
	.align 2, 0
_080C2840: .4byte 0x02018000
_080C2844:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C286C
_080C284C:
	ldr r0, _080C2858 @ =0x02018000
	ldrb r0, [r0, 0x14]
	cmp r0, 0
	bne _080C286C
	strh r0, [r4, 0x8]
	b _080C286C
	.align 2, 0
_080C2858: .4byte 0x02018000
_080C285C:
	movs r0, 0x88
	lsls r0, 3
	bl sub_80C3520
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _080C2874 @ =sub_80C2878
	str r0, [r4]
_080C286C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C2874: .4byte sub_80C2878
	thumb_func_end sub_80C27EC

	thumb_func_start sub_80C2878
sub_80C2878: @ 80C2878
	push {r4-r7,lr}
	sub sp, 0x64
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080C28A0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x5
	bls _080C2896
	b _080C2A80
_080C2896:
	lsls r0, 2
	ldr r1, _080C28A4 @ =_080C28A8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C28A0: .4byte gTasks
_080C28A4: .4byte _080C28A8
	.align 2, 0
_080C28A8:
	.4byte _080C28C0
	.4byte _080C28E0
	.4byte _080C28FE
	.4byte _080C2938
	.4byte _080C299C
	.4byte _080C2A70
_080C28C0:
	ldr r0, _080C28DC @ =0x02018000
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _080C28CA
	b _080C2A80
_080C28CA:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080C2A80
	.align 2, 0
_080C28DC: .4byte 0x02018000
_080C28E0:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	beq _080C28F8
	b _080C2A80
_080C28F8:
	movs r0, 0
	strh r0, [r1, 0xA]
	b _080C2A4A
_080C28FE:
	movs r4, 0
	lsls r6, r5, 2
	ldr r7, _080C292C @ =gTasks
_080C2904:
	ldr r0, _080C2930 @ =sub_80C3A5C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r7
	ldr r0, _080C2934 @ =gUnknown_02038690
	adds r0, r4, r0
	ldrb r0, [r0]
	strh r0, [r1, 0x8]
	strh r4, [r1, 0xA]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C2904
	b _080C2A42
	.align 2, 0
_080C292C: .4byte gTasks
_080C2930: .4byte sub_80C3A5C
_080C2934: .4byte gUnknown_02038690
_080C2938:
	ldr r0, _080C2990 @ =0x02018000
	ldrb r0, [r0, 0x5]
	cmp r0, 0x4
	beq _080C2942
	b _080C2A80
_080C2942:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r2
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	beq _080C295A
	b _080C2A80
_080C295A:
	movs r0, 0
	strh r0, [r4, 0xA]
	ldr r0, _080C2994 @ =sub_80C3B30
	movs r1, 0xA
	bl CreateTask
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r4, 0
	ldr r1, _080C2998 @ =gUnknown_02038690
	ldrb r0, [r1]
	cmp r0, 0
	beq _080C2984
_080C2976:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _080C2984
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C2976
_080C2984:
	lsls r0, r4, 24
	lsrs r0, 24
	movs r1, 0xE
	bl sub_80C3E60
	b _080C2A80
	.align 2, 0
_080C2990: .4byte 0x02018000
_080C2994: .4byte sub_80C3B30
_080C2998: .4byte gUnknown_02038690
_080C299C:
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r2, r0, r2
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	adds r6, r1, 0
	cmp r0, 0x15
	bne _080C2A80
	movs r0, 0
	strh r0, [r2, 0xA]
	movs r4, 0
	ldr r2, _080C29F4 @ =gUnknown_02038690
	ldrb r0, [r2]
	ldr r1, _080C29F8 @ =gUnknown_0203869A
	ldr r3, _080C29FC @ =gStringVar1
	cmp r0, 0
	beq _080C29D4
_080C29C6:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _080C29D4
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C29C6
_080C29D4:
	ldrb r1, [r1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C2A04
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	ldr r0, _080C2A00 @ =gLinkPlayers + 0x8
	adds r1, r0
	adds r0, r3, 0
	bl StringCopy
	lsls r4, 6
	b _080C2A10
	.align 2, 0
_080C29F4: .4byte gUnknown_02038690
_080C29F8: .4byte gUnknown_0203869A
_080C29FC: .4byte gStringVar1
_080C2A00: .4byte gLinkPlayers + 0x8
_080C2A04:
	lsls r4, 6
	ldr r1, _080C2A54 @ =gUnknown_0203857D
	adds r1, r4, r1
	adds r0, r3, 0
	bl StringCopy
_080C2A10:
	ldr r0, _080C2A58 @ =gStringVar2
	ldr r1, _080C2A5C @ =gUnknown_02038572
	adds r1, r4, r1
	bl StringCopy
	ldr r1, _080C2A60 @ =gContestText_PokeWon
	mov r0, sp
	bl StringExpandPlaceholders
	ldr r0, _080C2A64 @ =0x02018000
	ldrb r1, [r0]
	mov r0, sp
	bl sub_80C3158
	mov r0, sp
	bl sub_80C34AC
	lsls r0, 16
	asrs r0, 16
	ldr r2, _080C2A68 @ =0x0000ffff
	movs r3, 0x88
	lsls r3, 3
	movs r1, 0x90
	bl sub_80C34CC
_080C2A42:
	ldr r0, _080C2A6C @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
_080C2A4A:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080C2A80
	.align 2, 0
_080C2A54: .4byte gUnknown_0203857D
_080C2A58: .4byte gStringVar2
_080C2A5C: .4byte gUnknown_02038572
_080C2A60: .4byte gContestText_PokeWon
_080C2A64: .4byte 0x02018000
_080C2A68: .4byte 0x0000ffff
_080C2A6C: .4byte gTasks
_080C2A70:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x8]
	ldr r1, _080C2A88 @ =sub_80C2A8C
	str r1, [r0]
_080C2A80:
	add sp, 0x64
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2A88: .4byte sub_80C2A8C
	thumb_func_end sub_80C2878

	thumb_func_start sub_80C2A8C
sub_80C2A8C: @ 80C2A8C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080C2ABC @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x5
	bls _080C2AB2
	b _080C2D04
_080C2AB2:
	lsls r0, 2
	ldr r1, _080C2AC0 @ =_080C2AC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C2ABC: .4byte gTasks
_080C2AC0: .4byte _080C2AC4
	.align 2, 0
_080C2AC4:
	.4byte _080C2ADC
	.4byte _080C2C04
	.4byte _080C2C54
	.4byte _080C2C64
	.4byte _080C2CA8
	.4byte _080C2CE8
_080C2ADC:
	ldr r1, _080C2BC4 @ =gUnknown_030042C4
	movs r0, 0xF0
	strh r0, [r1]
	ldr r1, _080C2BC8 @ =gUnknown_03004240
	ldr r3, _080C2BCC @ =0x00005050
	adds r0, r3, 0
	strh r0, [r1]
	movs r1, 0
	ldr r3, _080C2BD0 @ =gUnknown_02038690
	ldrb r0, [r3]
	lsls r4, r7, 2
	mov r10, r4
	ldr r2, _080C2BD4 @ =gUnknown_02038570
	ldr r5, _080C2BD8 @ =gMonFrontPicTable
	mov r12, r5
	ldr r4, _080C2BDC @ =gMonFrontPicCoords
	mov r8, r4
	ldr r5, _080C2BE0 @ =gUnknown_081FAF4C
	mov r9, r5
	cmp r0, 0
	beq _080C2B14
_080C2B06:
	adds r1, 0x1
	cmp r1, 0x3
	bgt _080C2B14
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C2B06
_080C2B14:
	lsls r1, 6
	adds r0, r1, r2
	ldrh r6, [r0]
	adds r0, r2, 0
	adds r0, 0x38
	adds r0, r1, r0
	ldr r4, [r0]
	adds r0, r2, 0
	adds r0, 0x3C
	adds r1, r0
	ldr r1, [r1]
	str r1, [sp, 0xC]
	lsls r0, r6, 3
	add r0, r12
	lsls r2, r6, 2
	add r2, r8
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	mov r5, r9
	ldr r3, [r5, 0x4]
	str r3, [sp]
	str r6, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r3, _080C2BE4 @ =0x02000000
	bl sub_800D334
	adds r0, r6, 0
	ldr r1, [sp, 0xC]
	adds r2, r4, 0
	bl sub_80409C8
	adds r4, r0, 0
	bl LoadCompressedObjectPalette
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _080C2BE8 @ =gUnknown_02024E8C
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x2]
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x50
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080C2BEC @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r3, r2, r5
	strh r6, [r3, 0x30]
	ldrb r4, [r3, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	strb r1, [r3, 0x5]
	adds r5, 0x1C
	adds r2, r5
	ldr r1, _080C2BF0 @ =sub_80C3C44
	str r1, [r2]
	ldr r2, _080C2BE4 @ =0x02000000
	movs r3, 0xC0
	lsls r3, 9
	adds r1, r2, r3
	strb r0, [r1, 0x8]
	ldr r0, _080C2BF4 @ =gUnknown_083D17CC
	bl LoadCompressedObjectPic
	ldr r0, _080C2BF8 @ =gUnknown_083D17D4
	bl LoadCompressedObjectPalette
	ldr r0, _080C2BFC @ =sub_80C3D04
	movs r1, 0xA
	bl CreateTask
	ldr r0, _080C2C00 @ =gTasks
	mov r4, r10
	adds r1, r4, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080C2D04
	.align 2, 0
_080C2BC4: .4byte gUnknown_030042C4
_080C2BC8: .4byte gUnknown_03004240
_080C2BCC: .4byte 0x00005050
_080C2BD0: .4byte gUnknown_02038690
_080C2BD4: .4byte gUnknown_02038570
_080C2BD8: .4byte gMonFrontPicTable
_080C2BDC: .4byte gMonFrontPicCoords
_080C2BE0: .4byte gUnknown_081FAF4C
_080C2BE4: .4byte 0x02000000
_080C2BE8: .4byte gUnknown_02024E8C
_080C2BEC: .4byte gSprites
_080C2BF0: .4byte sub_80C3C44
_080C2BF4: .4byte gUnknown_083D17CC
_080C2BF8: .4byte gUnknown_083D17D4
_080C2BFC: .4byte sub_80C3D04
_080C2C00: .4byte gTasks
_080C2C04:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r4, r0, r4
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080C2D04
	movs r0, 0
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0xC]
	adds r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	ble _080C2C30
	movs r0, 0x20
	strh r0, [r4, 0xC]
_080C2C30:
	ldrb r2, [r4, 0xC]
	ldr r3, _080C2C50 @ =gUnknown_03004240
	movs r0, 0x50
	subs r0, r2
	lsls r0, 8
	adds r1, r2, 0
	adds r1, 0x50
	orrs r0, r1
	strh r0, [r3]
	cmp r2, 0x20
	bne _080C2D04
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C2D04
	.align 2, 0
_080C2C50: .4byte gUnknown_03004240
_080C2C54:
	ldr r0, _080C2C60 @ =0x02018000
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	bne _080C2D04
	b _080C2CD0
	.align 2, 0
_080C2C60: .4byte 0x02018000
_080C2C64:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r4
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x79
	bne _080C2D04
	movs r0, 0
	strh r0, [r3, 0xA]
	ldr r2, _080C2C9C @ =gSprites
	ldr r0, _080C2CA0 @ =0x02018000
	ldrb r1, [r0, 0x8]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080C2CA4 @ =sub_80C3CB8
	str r1, [r0]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _080C2D04
	.align 2, 0
_080C2C9C: .4byte gSprites
_080C2CA0: .4byte 0x02018000
_080C2CA4: .4byte sub_80C3CB8
_080C2CA8:
	ldr r0, _080C2CE0 @ =0x02018000
	ldrb r0, [r0, 0x6]
	cmp r0, 0x2
	bne _080C2D04
	ldr r3, _080C2CE4 @ =gUnknown_03004240
	ldrh r0, [r3]
	lsrs r2, r0, 8
	adds r0, r2, 0x2
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x50
	bls _080C2CC2
	movs r2, 0x50
_080C2CC2:
	lsls r1, r2, 8
	movs r0, 0xA0
	subs r0, r2
	orrs r1, r0
	strh r1, [r3]
	cmp r2, 0x50
	bne _080C2D04
_080C2CD0:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r4
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080C2D04
	.align 2, 0
_080C2CE0: .4byte 0x02018000
_080C2CE4: .4byte gUnknown_03004240
_080C2CE8:
	ldr r2, _080C2D14 @ =0x02018000
	ldrb r0, [r2, 0x6]
	cmp r0, 0x2
	bne _080C2D04
	movs r1, 0
	movs r0, 0x1
	strb r0, [r2, 0x9]
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r4
	strh r1, [r0, 0x8]
	ldr r1, _080C2D18 @ =sub_80C2D1C
	str r1, [r0]
_080C2D04:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2D14: .4byte 0x02018000
_080C2D18: .4byte sub_80C2D1C
	thumb_func_end sub_80C2A8C

	thumb_func_start sub_80C2D1C
sub_80C2D1C: @ 80C2D1C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080C2D6C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080C2D66
	ldr r0, _080C2D70 @ =gUnknown_0203869A
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	lsls r6, r7, 2
	cmp r0, 0
	bne _080C2D5A
	ldr r5, _080C2D74 @ =gUnknown_02038570
	movs r4, 0x3
_080C2D42:
	ldrh r0, [r5]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bge _080C2D42
_080C2D5A:
	ldr r0, _080C2D78 @ =gTasks
	adds r1, r6, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C2D7C @ =sub_80C2D80
	str r0, [r1]
_080C2D66:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2D6C: .4byte gMain
_080C2D70: .4byte gUnknown_0203869A
_080C2D74: .4byte gUnknown_02038570
_080C2D78: .4byte gTasks
_080C2D7C: .4byte sub_80C2D80
	thumb_func_end sub_80C2D1C

	thumb_func_start sub_80C2D80
sub_80C2D80: @ 80C2D80
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C2DAC @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C2DBC
	ldr r0, _080C2DB0 @ =gOtherText_LinkStandby
	bl sub_80C3698
	bl sub_800832C
	ldr r1, _080C2DB4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C2DB8 @ =sub_80C2DD8
	str r1, [r0]
	b _080C2DCA
	.align 2, 0
_080C2DAC: .4byte gUnknown_0203869A
_080C2DB0: .4byte gOtherText_LinkStandby
_080C2DB4: .4byte gTasks
_080C2DB8: .4byte sub_80C2DD8
_080C2DBC:
	ldr r0, _080C2DD0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C2DD4 @ =sub_80C2E14
	str r0, [r1]
_080C2DCA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2DD0: .4byte gTasks
_080C2DD4: .4byte sub_80C2E14
	thumb_func_end sub_80C2D80

	thumb_func_start sub_80C2DD8
sub_80C2DD8: @ 80C2DD8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C2E04 @ =gReceivedRemoteLinkPlayers
	ldrb r1, [r0]
	cmp r1, 0
	bne _080C2DFC
	ldr r0, _080C2E08 @ =gUnknown_0203869A
	strb r1, [r0]
	bl sub_80C3764
	ldr r1, _080C2E0C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C2E10 @ =sub_80C2E14
	str r1, [r0]
_080C2DFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2E04: .4byte gReceivedRemoteLinkPlayers
_080C2E08: .4byte gUnknown_0203869A
_080C2E0C: .4byte gTasks
_080C2E10: .4byte sub_80C2E14
	thumb_func_end sub_80C2DD8

	thumb_func_start sub_80C2E14
sub_80C2E14: @ 80C2E14
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080C2E80 @ =gUnknown_02038690
	ldr r0, _080C2E84 @ =gUnknown_02038695
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80BE284
	movs r0, 0x2
	bl sub_810FB10
	ldr r0, _080C2E88 @ =gUnknown_0203869E
	ldrb r0, [r0]
	bl sub_80B2A7C
	movs r0, 0xFE
	bl sub_80B2A7C
	ldr r4, _080C2E8C @ =0x02000000
	ldr r0, _080C2E90 @ =0x00015ddf
	adds r1, r4, r0
	movs r6, 0
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0xFE
	movs r1, 0
	bl sub_80B2C4C
	ldr r1, _080C2E94 @ =0x00015dde
	adds r4, r1
	strb r0, [r4]
	str r6, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginHardwarePaletteFade
	ldr r1, _080C2E98 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C2E9C @ =sub_80C2EA0
	str r1, [r0]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C2E80: .4byte gUnknown_02038690
_080C2E84: .4byte gUnknown_02038695
_080C2E88: .4byte gUnknown_0203869E
_080C2E8C: .4byte 0x02000000
_080C2E90: .4byte 0x00015ddf
_080C2E94: .4byte 0x00015dde
_080C2E98: .4byte gTasks
_080C2E9C: .4byte sub_80C2EA0
	thumb_func_end sub_80C2E14

	thumb_func_start sub_80C2EA0
sub_80C2EA0: @ 80C2EA0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	ldr r0, _080C2ED8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _080C2F18
	ldr r1, _080C2EDC @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C2EE8
	ldr r0, _080C2EE0 @ =0x02018000
	ldrb r0, [r0, 0x3]
	bl DestroyTask
	ldr r0, _080C2EE4 @ =0x0000ffff
	b _080C2EEE
	.align 2, 0
_080C2ED8: .4byte gPaletteFade
_080C2EDC: .4byte gTasks
_080C2EE0: .4byte 0x02018000
_080C2EE4: .4byte 0x0000ffff
_080C2EE8:
	cmp r0, 0x1
	bne _080C2F04
	ldr r0, _080C2F00 @ =0xffff0000
_080C2EEE:
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080C2F18
	.align 2, 0
_080C2F00: .4byte 0xffff0000
_080C2F04:
	ldr r0, _080C2F20 @ =REG_BLDCNT
	strh r3, [r0]
	adds r0, 0x4
	strh r3, [r0]
	adds r0, r5, 0
	bl DestroyTask
	ldr r0, _080C2F24 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_080C2F18:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C2F20: .4byte REG_BLDCNT
_080C2F24: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80C2EA0

	thumb_func_start sub_80C2F28
sub_80C2F28: @ 80C2F28
	push {r4,r5,lr}
	ldr r2, _080C2F5C @ =gUnknown_030041B0
	ldrh r3, [r2]
	adds r0, r3, 0x2
	strh r0, [r2]
	ldr r4, _080C2F60 @ =gUnknown_030041B8
	ldrh r5, [r4]
	adds r1, r5, 0x1
	strh r1, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bls _080C2F48
	adds r0, r3, 0
	subs r0, 0xFD
	strh r0, [r2]
_080C2F48:
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bls _080C2F56
	adds r0, r5, 0
	subs r0, 0xFE
	strh r0, [r4]
_080C2F56:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C2F5C: .4byte gUnknown_030041B0
_080C2F60: .4byte gUnknown_030041B8
	thumb_func_end sub_80C2F28

	thumb_func_start sub_80C2F64
sub_80C2F64: @ 80C2F64
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080C2F94 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080C2FE6
	movs r0, 0
	strh r0, [r2, 0x8]
	movs r3, 0xC
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080C2F98
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	b _080C2F9C
	.align 2, 0
_080C2F94: .4byte gTasks
_080C2F98:
	ldrh r0, [r2, 0xA]
	subs r0, 0x1
_080C2F9C:
	strh r0, [r2, 0xA]
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x10
	bne _080C2FB2
	movs r0, 0x1
	b _080C2FB6
_080C2FB2:
	cmp r0, 0
	bne _080C2FB8
_080C2FB6:
	strh r0, [r1, 0xC]
_080C2FB8:
	ldr r0, _080C3000 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r2, [r4, 0xA]
	ldr r3, _080C3004 @ =0x00002ede
	movs r0, 0x6B
	movs r1, 0x1
	bl BlendPalette
	ldrb r2, [r4, 0xA]
	ldr r3, _080C3008 @ =0x00007fff
	movs r0, 0x68
	movs r1, 0x1
	bl BlendPalette
	ldrb r2, [r4, 0xA]
	ldr r3, _080C300C @ =0x000077be
	movs r0, 0x6E
	movs r1, 0x1
	bl BlendPalette
_080C2FE6:
	ldr r1, _080C3000 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r3, 0xA
	ldrsh r4, [r0, r3]
	cmp r4, 0
	bne _080C3014
	ldr r0, _080C3010 @ =0x02018000
	strb r4, [r0, 0xA]
	b _080C301A
	.align 2, 0
_080C3000: .4byte gTasks
_080C3004: .4byte 0x00002ede
_080C3008: .4byte 0x00007fff
_080C300C: .4byte 0x000077be
_080C3010: .4byte 0x02018000
_080C3014:
	ldr r1, _080C3020 @ =0x02018000
	movs r0, 0x1
	strb r0, [r1, 0xA]
_080C301A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3020: .4byte 0x02018000
	thumb_func_end sub_80C2F64

	thumb_func_start sub_80C3024
sub_80C3024: @ 80C3024
	push {r4-r6,lr}
	ldr r6, [sp, 0x10]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	cmp r3, 0
	beq _080C30B0
	adds r1, r6, 0
	bl sub_809D4F4
	lsls r1, r5, 9
	adds r0, r1
	adds r0, 0x80
	lsls r1, r4, 9
	ldr r2, _080C30A0 @ =0x06004000
	adds r1, r2
	ldr r2, _080C30A4 @ =0x040000d4
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080C30A8 @ =0x84000060
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r1, r4, 0
	adds r1, 0xA
	lsls r1, 28
	lsls r0, r4, 20
	movs r2, 0x80
	lsls r2, 18
	adds r0, r2
	orrs r0, r1
	lsrs r1, r0, 16
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 21
	movs r2, 0x83
	lsls r2, 16
	adds r0, r2
	lsrs r5, r0, 16
	movs r2, 0
	ldr r6, _080C30AC @ =0x0600c000
_080C307C:
	lsls r0, r2, 5
	adds r4, r2, 0x1
	adds r0, r5
	movs r3, 0x3
	lsls r0, 1
	adds r2, r0, r6
_080C3088:
	strh r1, [r2]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C3088
	adds r2, r4, 0
	cmp r2, 0x2
	ble _080C307C
	b _080C30CA
	.align 2, 0
_080C30A0: .4byte 0x06004000
_080C30A4: .4byte 0x040000d4
_080C30A8: .4byte 0x84000060
_080C30AC: .4byte 0x0600c000
_080C30B0:
	adds r1, r6, 0
	bl sub_809D4F4
	lsls r1, r5, 9
	adds r0, r1
	adds r0, 0x80
	lsls r1, r4, 9
	ldr r2, _080C30D0 @ =0x06004000
	adds r1, r2
	movs r2, 0xC0
	lsls r2, 1
	bl RequestSpriteCopy
_080C30CA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C30D0: .4byte 0x06004000
	thumb_func_end sub_80C3024

	thumb_func_start sub_80C30D4
sub_80C30D4: @ 80C30D4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	movs r5, 0
	ldr r4, _080C3108 @ =gUnknown_02038570
_080C30E4:
	ldrh r0, [r4]
	lsls r1, r5, 24
	lsrs r1, 24
	ldr r2, [r4, 0x38]
	str r2, [sp]
	adds r2, r7, 0
	adds r3, r6, 0
	bl sub_80C3024
	adds r4, 0x40
	adds r5, 0x1
	cmp r5, 0x3
	ble _080C30E4
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3108: .4byte gUnknown_02038570
	thumb_func_end sub_80C30D4

	thumb_func_start sub_80C310C
sub_80C310C: @ 80C310C
	push {r4-r6,lr}
	movs r4, 0
	ldr r6, _080C314C @ =gMonIconPaletteIndices
	movs r5, 0xA0
	lsls r5, 16
_080C3116:
	ldr r1, _080C3150 @ =gUnknown_02038570
	lsls r0, r4, 6
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0
	bl mon_icon_convert_unown_species_id
	lsls r0, 16
	lsrs r0, 16
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 5
	ldr r1, _080C3154 @ =gMonIconPalettes
	adds r0, r1
	lsrs r1, r5, 16
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x80
	lsls r0, 13
	adds r5, r0
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C3116
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C314C: .4byte gMonIconPaletteIndices
_080C3150: .4byte gUnknown_02038570
_080C3154: .4byte gMonIconPalettes
	thumb_func_end sub_80C310C

	thumb_func_start sub_80C3158
sub_80C3158: @ 80C3158
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	ldr r3, _080C32C0 @ =gSprites
	adds r2, r3
	mov r1, sp
	ldrh r0, [r2, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r1]
	mov r4, sp
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r4, 0x2]
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r4, 0x4]
	movs r0, 0x32
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r4, 0x6]
	ldr r1, _080C32C4 @ =gWindowConfig_81E7278
	mov r8, r1
	ldr r7, _080C32C8 @ =0x06010000
	ldr r2, _080C32CC @ =0x040000d4
	ldr r6, _080C32D0 @ =0x85000100
	mov r1, sp
	movs r5, 0
	add r3, sp, 0x8
	movs r4, 0x3
_080C31CE:
	ldrh r0, [r1]
	lsls r0, 5
	adds r0, r7
	str r5, [sp, 0x8]
	str r3, [r2]
	str r0, [r2, 0x4]
	str r6, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080C31CE
	mov r0, r8
	mov r1, r9
	bl GetStringWidthGivenWindowConfig
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080C32D4 @ =gUnknown_020238CC
	ldr r1, _080C32D8 @ =gUnknown_083D17E2
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	mvns r0, r5
	adds r1, r0, 0x1
	movs r0, 0x7
	ands r1, r0
	cmp r1, 0
	beq _080C3218
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x11
	strb r0, [r2, 0x1]
	lsrs r0, r1, 1
	strb r0, [r2, 0x2]
	adds r2, 0x3
_080C3218:
	adds r6, r5, 0x7
	movs r1, 0x8
	negs r1, r1
	adds r0, r1, 0
	ands r6, r0
	lsls r6, 24
	lsrs r5, r6, 24
	adds r0, r2, 0
	mov r1, r9
	bl StringCopy
	adds r2, r0, 0
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	strb r5, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r0, _080C32DC @ =0x02018068
	mov r10, r0
	ldr r1, _080C32D4 @ =gUnknown_020238CC
	bl sub_80034D4
	mov r0, sp
	ldrh r4, [r0]
	lsls r4, 5
	ldr r1, _080C32C8 @ =0x06010000
	adds r7, r4, r1
	ldr r0, _080C32E0 @ =gUnknown_083D1624
	mov r9, r0
	ldr r1, _080C32E4 @ =REG_BG0CNT
	mov r8, r1
	adds r1, r7, 0
	mov r2, r8
	bl CpuSet
	mov r5, r9
	adds r5, 0x80
	ldr r0, _080C32E8 @ =0x06010100
	adds r1, r4, r0
	adds r0, r5, 0
	mov r2, r8
	bl CpuSet
	ldr r0, _080C32EC @ =0x06010200
	adds r1, r4, r0
	adds r0, r5, 0
	mov r2, r8
	bl CpuSet
	mov r0, r9
	adds r0, 0x40
	ldr r1, _080C32F0 @ =0x06010300
	adds r4, r1
	adds r1, r4, 0
	mov r2, r8
	bl CpuSet
	lsrs r5, r6, 27
	movs r4, 0
	cmp r4, r5
	bgt _080C3382
	mov r6, sp
	mov r0, r10
	adds r0, 0x20
	str r0, [sp, 0xC]
	mov r1, r10
	str r1, [sp, 0x10]
	ldr r0, _080C32F4 @ =0x0600fd20
	str r0, [sp, 0x14]
	ldr r1, _080C32F8 @ =0x0600fe20
	str r1, [sp, 0x18]
	ldr r0, _080C32FC @ =0x0600ff20
	mov r10, r0
	ldr r1, _080C3300 @ =0x06010020
	mov r9, r1
_080C32B2:
	cmp r4, 0x6
	bgt _080C3304
	ldrh r0, [r6]
	lsls r0, 5
	mov r1, r9
	b _080C3322
	.align 2, 0
_080C32C0: .4byte gSprites
_080C32C4: .4byte gWindowConfig_81E7278
_080C32C8: .4byte 0x06010000
_080C32CC: .4byte 0x040000d4
_080C32D0: .4byte 0x85000100
_080C32D4: .4byte gUnknown_020238CC
_080C32D8: .4byte gUnknown_083D17E2
_080C32DC: .4byte 0x02018068
_080C32E0: .4byte gUnknown_083D1624
_080C32E4: .4byte REG_BG0CNT
_080C32E8: .4byte 0x06010100
_080C32EC: .4byte 0x06010200
_080C32F0: .4byte 0x06010300
_080C32F4: .4byte 0x0600fd20
_080C32F8: .4byte 0x0600fe20
_080C32FC: .4byte 0x0600ff20
_080C3300: .4byte 0x06010020
_080C3304:
	cmp r4, 0xE
	bgt _080C3310
	ldrh r0, [r6, 0x2]
	lsls r0, 5
	mov r1, r10
	b _080C3322
_080C3310:
	cmp r4, 0x16
	bgt _080C331C
	ldrh r0, [r6, 0x4]
	lsls r0, 5
	ldr r1, [sp, 0x18]
	b _080C3322
_080C331C:
	ldrh r0, [r6, 0x6]
	lsls r0, 5
	ldr r1, [sp, 0x14]
_080C3322:
	adds r7, r0, r1
	cmp r4, r5
	beq _080C3382
	ldr r0, _080C33D0 @ =gUnknown_083D16E4
	adds r1, r7, 0
	mov r2, r8
	bl CpuSet
	movs r0, 0xC0
	lsls r0, 2
	adds r1, r7, r0
	ldr r0, _080C33D0 @ =gUnknown_083D16E4
	adds r0, 0x20
	mov r2, r8
	bl CpuSet
	movs r0, 0x80
	lsls r0, 1
	adds r1, r7, r0
	ldr r0, [sp, 0x10]
	mov r2, r8
	bl CpuSet
	movs r0, 0x80
	lsls r0, 2
	adds r1, r7, r0
	ldr r0, [sp, 0xC]
	mov r2, r8
	bl CpuSet
	ldr r1, [sp, 0xC]
	adds r1, 0x40
	str r1, [sp, 0xC]
	ldr r0, [sp, 0x10]
	adds r0, 0x40
	str r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	adds r1, 0x20
	str r1, [sp, 0x14]
	ldr r0, [sp, 0x18]
	adds r0, 0x20
	str r0, [sp, 0x18]
	movs r1, 0x20
	add r10, r1
	add r9, r1
	adds r4, 0x1
	cmp r4, r5
	ble _080C32B2
_080C3382:
	ldr r4, _080C33D4 @ =gUnknown_083D1644
	ldr r5, _080C33D8 @ =REG_BG0CNT
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r5, 0
	bl CpuSet
	adds r6, r4, 0
	adds r6, 0x80
	movs r0, 0x80
	lsls r0, 1
	adds r1, r7, r0
	adds r0, r6, 0
	adds r2, r5, 0
	bl CpuSet
	movs r0, 0x80
	lsls r0, 2
	adds r1, r7, r0
	adds r0, r6, 0
	adds r2, r5, 0
	bl CpuSet
	adds r4, 0x40
	movs r0, 0xC0
	lsls r0, 2
	adds r1, r7, r0
	adds r0, r4, 0
	adds r2, r5, 0
	bl CpuSet
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C33D0: .4byte gUnknown_083D16E4
_080C33D4: .4byte gUnknown_083D1644
_080C33D8: .4byte REG_BG0CNT
	thumb_func_end sub_80C3158

	thumb_func_start sub_80C33DC
sub_80C33DC: @ 80C33DC
	push {r4-r6,lr}
	sub sp, 0x20
	mov r1, sp
	ldr r0, _080C3498 @ =gSpriteTemplate_83D174C
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	add r5, sp, 0x18
	ldr r6, _080C349C @ =gUnknown_083D1764
	movs r4, 0x7
_080C33F2:
	adds r0, r6, 0
	bl LoadSpriteSheet
	adds r6, 0x8
	subs r4, 0x1
	cmp r4, 0
	bge _080C33F2
	ldr r0, _080C34A0 @ =gUnknown_083D17A4
	bl LoadSpritePalette
	movs r4, 0
	mov r6, sp
_080C340A:
	mov r0, sp
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x90
	movs r3, 0xA
	bl CreateSprite
	adds r1, r5, r4
	strb r0, [r1]
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	adds r4, 0x1
	cmp r4, 0x7
	ble _080C340A
	ldr r2, _080C34A4 @ =gSprites
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x1]
	movs r3, 0
	strh r1, [r0, 0x2E]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x2]
	strh r1, [r0, 0x30]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x3]
	strh r1, [r0, 0x32]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x5]
	strh r1, [r0, 0x2E]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x6]
	strh r1, [r0, 0x30]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x7]
	strh r1, [r0, 0x32]
	ldr r1, _080C34A8 @ =0x02018000
	ldrb r0, [r5]
	strb r0, [r1]
	strb r3, [r1, 0x4]
	ldrb r0, [r5, 0x4]
	strb r0, [r1, 0x1]
	bl sub_80C3764
	add sp, 0x20
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C3498: .4byte gSpriteTemplate_83D174C
_080C349C: .4byte gUnknown_083D1764
_080C34A0: .4byte gUnknown_083D17A4
_080C34A4: .4byte gSprites
_080C34A8: .4byte 0x02018000
	thumb_func_end sub_80C33DC

	thumb_func_start sub_80C34AC
sub_80C34AC: @ 80C34AC
	push {lr}
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 25
	lsrs r1, 25
	movs r0, 0x70
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80C34AC

	thumb_func_start sub_80C34CC
sub_80C34CC: @ 80C34CC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r4, _080C3514 @ =0x02018000
	mov r8, r4
	ldrb r5, [r4]
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r5, _080C3518 @ =gSprites
	adds r4, r5
	movs r6, 0
	movs r5, 0x88
	lsls r5, 1
	strh r5, [r4, 0x20]
	strh r1, [r4, 0x22]
	strh r6, [r4, 0x24]
	strh r6, [r4, 0x26]
	lsls r0, 16
	asrs r0, 16
	adds r0, 0x20
	strh r0, [r4, 0x36]
	strh r2, [r4, 0x38]
	strh r3, [r4, 0x3A]
	strh r6, [r4, 0x3C]
	ldr r0, _080C351C @ =sub_80C3588
	str r0, [r4, 0x1C]
	movs r0, 0x1
	mov r1, r8
	strb r0, [r1, 0x4]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C3514: .4byte 0x02018000
_080C3518: .4byte gSprites
_080C351C: .4byte sub_80C3588
	thumb_func_end sub_80C34CC

	thumb_func_start sub_80C3520
sub_80C3520: @ 80C3520
	push {r4,r5,lr}
	ldr r4, _080C3558 @ =0x02018000
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _080C355C @ =gSprites
	adds r1, r2
	ldrh r2, [r1, 0x24]
	ldrh r3, [r1, 0x20]
	adds r2, r3
	movs r3, 0
	strh r2, [r1, 0x20]
	ldrh r2, [r1, 0x26]
	ldrh r5, [r1, 0x22]
	adds r2, r5
	strh r2, [r1, 0x22]
	strh r3, [r1, 0x26]
	strh r3, [r1, 0x24]
	strh r0, [r1, 0x3A]
	strh r3, [r1, 0x3C]
	ldr r0, _080C3560 @ =sub_80C3630
	str r0, [r1, 0x1C]
	movs r0, 0x3
	strb r0, [r4, 0x4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3558: .4byte 0x02018000
_080C355C: .4byte gSprites
_080C3560: .4byte sub_80C3630
	thumb_func_end sub_80C3520

	thumb_func_start sub_80C3564
sub_80C3564: @ 80C3564
	movs r3, 0
	movs r2, 0
	movs r1, 0x88
	lsls r1, 1
	strh r1, [r0, 0x20]
	movs r1, 0x90
	strh r1, [r0, 0x22]
	strh r2, [r0, 0x26]
	strh r2, [r0, 0x24]
	ldr r1, _080C3580 @ =SpriteCallbackDummy
	str r1, [r0, 0x1C]
	ldr r0, _080C3584 @ =0x02018000
	strb r3, [r0, 0x4]
	bx lr
	.align 2, 0
_080C3580: .4byte SpriteCallbackDummy
_080C3584: .4byte 0x02018000
	thumb_func_end sub_80C3564

	thumb_func_start sub_80C3588
sub_80C3588: @ 80C3588
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x3A]
	ldrh r0, [r3, 0x3C]
	adds r2, r0
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r3, 0x20]
	subs r0, r1
	strh r0, [r3, 0x20]
	movs r1, 0xFF
	ands r2, r1
	strh r2, [r3, 0x3C]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r3, 0x36]
	movs r4, 0x36
	ldrsh r1, [r3, r4]
	cmp r0, r1
	bge _080C35B2
	strh r2, [r3, 0x20]
_080C35B2:
	movs r4, 0
	ldr r6, _080C35F4 @ =gSprites
	movs r5, 0x40
	adds r2, r3, 0
	adds r2, 0x2E
_080C35BC:
	movs r7, 0
	ldrsh r0, [r2, r7]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r3, 0x24]
	ldrh r7, [r3, 0x20]
	adds r0, r7
	adds r0, r5
	strh r0, [r1, 0x20]
	adds r5, 0x40
	adds r2, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _080C35BC
	movs r0, 0x20
	ldrsh r1, [r3, r0]
	movs r2, 0x36
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _080C35EC
	ldr r0, _080C35F8 @ =sub_80C35FC
	str r0, [r3, 0x1C]
_080C35EC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C35F4: .4byte gSprites
_080C35F8: .4byte sub_80C35FC
	thumb_func_end sub_80C3588

	thumb_func_start sub_80C35FC
sub_80C35FC: @ 80C35FC
	push {lr}
	adds r2, r0, 0
	ldr r0, _080C3628 @ =0x02018000
	movs r1, 0x2
	strb r1, [r0, 0x4]
	ldrh r3, [r2, 0x38]
	ldr r1, _080C362C @ =0xffff0000
	lsrs r0, r1, 16
	cmp r3, r0
	beq _080C3624
	subs r0, r3, 0x1
	strh r0, [r2, 0x38]
	lsls r0, 16
	asrs r0, 16
	asrs r1, 16
	cmp r0, r1
	bne _080C3624
	ldrh r0, [r2, 0x3A]
	bl sub_80C3520
_080C3624:
	pop {r0}
	bx r0
	.align 2, 0
_080C3628: .4byte 0x02018000
_080C362C: .4byte 0xffff0000
	thumb_func_end sub_80C35FC

	thumb_func_start sub_80C3630
sub_80C3630: @ 80C3630
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x3A]
	ldrh r0, [r3, 0x3C]
	adds r2, r0
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r3, 0x20]
	subs r0, r1
	strh r0, [r3, 0x20]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r3, 0x3C]
	movs r4, 0
	ldr r6, _080C3694 @ =gSprites
	movs r5, 0x40
	adds r2, r3, 0
	adds r2, 0x2E
_080C3654:
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r3, 0x24]
	ldrh r7, [r3, 0x20]
	adds r0, r7
	adds r0, r5
	strh r0, [r1, 0x20]
	adds r5, 0x40
	adds r2, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _080C3654
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	movs r2, 0x24
	ldrsh r1, [r3, r2]
	adds r0, r1
	movs r1, 0xE0
	negs r1, r1
	cmp r0, r1
	bge _080C368C
	adds r0, r3, 0
	bl sub_80C3564
_080C368C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3694: .4byte gSprites
	thumb_func_end sub_80C3630

	thumb_func_start sub_80C3698
sub_80C3698: @ 80C3698
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r5, _080C374C @ =0x02018000
	ldrb r1, [r5, 0x1]
	bl sub_80C3158
	adds r0, r4, 0
	bl sub_80C34AC
	lsls r0, 16
	lsrs r0, 16
	ldrb r2, [r5, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r3, _080C3750 @ =gSprites
	adds r4, r1, r3
	adds r0, 0x20
	strh r0, [r4, 0x20]
	movs r0, 0x50
	strh r0, [r4, 0x22]
	adds r5, r4, 0
	adds r5, 0x3E
	ldrb r1, [r5]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	strb r0, [r5]
	movs r5, 0
	adds r6, r3, 0
	mov r12, r2
	movs r3, 0x40
_080C36DA:
	lsls r0, r5, 1
	adds r2, r4, 0
	adds r2, 0x2E
	adds r2, r0
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r4, 0x24]
	ldrh r7, [r4, 0x20]
	adds r0, r7
	adds r0, r3
	strh r0, [r1, 0x20]
	movs r0, 0
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r4, 0x22]
	strh r1, [r0, 0x22]
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r12
	ands r0, r2
	strb r0, [r1]
	adds r3, 0x40
	adds r5, 0x1
	cmp r5, 0x2
	ble _080C36DA
	ldr r1, _080C3754 @ =gUnknown_030042C4
	movs r0, 0xF0
	strh r0, [r1]
	ldr r2, _080C3758 @ =gUnknown_03004240
	ldrh r1, [r4, 0x22]
	adds r0, r1, 0
	subs r0, 0x10
	lsls r0, 8
	adds r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080C375C @ =REG_WININ
	ldr r2, _080C3760 @ =0x00003f3e
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C374C: .4byte 0x02018000
_080C3750: .4byte gSprites
_080C3754: .4byte gUnknown_030042C4
_080C3758: .4byte gUnknown_03004240
_080C375C: .4byte REG_WININ
_080C3760: .4byte 0x00003f3e
	thumb_func_end sub_80C3698

	thumb_func_start sub_80C3764
sub_80C3764: @ 80C3764
	push {r4-r7,lr}
	ldr r0, _080C37C8 @ =0x02018000
	ldrb r0, [r0, 0x1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r3, _080C37CC @ =gSprites
	adds r2, r3
	movs r0, 0x3E
	adds r0, r2
	mov r12, r0
	ldrb r0, [r0]
	movs r1, 0x4
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldr r7, _080C37D0 @ =gUnknown_030042C4
	ldr r6, _080C37D4 @ =gUnknown_03004240
	adds r5, r3, 0
	movs r4, 0x4
	adds r2, 0x2E
	movs r3, 0x2
_080C3790:
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C3790
	movs r1, 0
	strh r1, [r7]
	strh r1, [r6]
	ldr r0, _080C37D8 @ =REG_WIN0H
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r1, _080C37DC @ =REG_WININ
	ldr r2, _080C37E0 @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C37C8: .4byte 0x02018000
_080C37CC: .4byte gSprites
_080C37D0: .4byte gUnknown_030042C4
_080C37D4: .4byte gUnknown_03004240
_080C37D8: .4byte REG_WIN0H
_080C37DC: .4byte REG_WININ
_080C37E0: .4byte 0x00003f3f
	thumb_func_end sub_80C3764

	thumb_func_start sub_80C37E4
sub_80C37E4: @ 80C37E4
	push {r4-r6,lr}
	sub sp, 0x10
	movs r5, 0x1
	movs r4, 0
	ldr r0, _080C3808 @ =gUnknown_0203869A
	ldrb r0, [r0]
	adds r1, r5, 0
	ands r1, r0
	cmp r1, 0
	beq _080C3814
	ldr r0, _080C380C @ =0x0600e000
	ldr r3, _080C3810 @ =gUnknown_08E964B8
	movs r1, 0x9
	str r1, [sp]
	movs r2, 0x2
	str r2, [sp, 0x4]
	b _080C386A
	.align 2, 0
_080C3808: .4byte gUnknown_0203869A
_080C380C: .4byte 0x0600e000
_080C3810: .4byte gUnknown_08E964B8
_080C3814:
	ldr r0, _080C3830 @ =gUnknown_0203869E
	ldrh r2, [r0]
	cmp r2, 0
	bne _080C383C
	movs r4, 0x1
	ldr r0, _080C3834 @ =0x0600e000
	ldr r3, _080C3838 @ =gUnknown_08E964B8
	str r2, [sp]
	str r2, [sp, 0x4]
	movs r1, 0x9
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	b _080C3870
	.align 2, 0
_080C3830: .4byte gUnknown_0203869E
_080C3834: .4byte 0x0600e000
_080C3838: .4byte gUnknown_08E964B8
_080C383C:
	cmp r2, 0x1
	bne _080C385C
	ldr r0, _080C3854 @ =0x0600e000
	ldr r3, _080C3858 @ =gUnknown_08E964B8
	movs r1, 0x9
	str r1, [sp]
	str r4, [sp, 0x4]
	movs r1, 0x8
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	b _080C3870
	.align 2, 0
_080C3854: .4byte 0x0600e000
_080C3858: .4byte gUnknown_08E964B8
_080C385C:
	cmp r2, 0x2
	bne _080C3884
	ldr r0, _080C387C @ =0x0600e000
	ldr r3, _080C3880 @ =gUnknown_08E964B8
	movs r1, 0x11
	str r1, [sp]
	str r4, [sp, 0x4]
_080C386A:
	movs r1, 0x8
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
_080C3870:
	movs r1, 0x5
	movs r2, 0x1
	bl sub_809D104
	b _080C389E
	.align 2, 0
_080C387C: .4byte 0x0600e000
_080C3880: .4byte gUnknown_08E964B8
_080C3884:
	movs r4, 0x1
	ldr r0, _080C38C0 @ =0x0600e000
	ldr r3, _080C38C4 @ =gUnknown_08E964B8
	str r1, [sp]
	movs r2, 0x2
	str r2, [sp, 0x4]
	movs r1, 0x9
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	movs r1, 0x5
	movs r2, 0x1
	bl sub_809D104
_080C389E:
	adds r4, 0xD
	ldr r0, _080C38C8 @ =gUnknown_0203869C
	ldrh r0, [r0]
	cmp r0, 0
	bne _080C38CC
	movs r6, 0
	ldr r0, _080C38C0 @ =0x0600e000
	ldr r3, _080C38C4 @ =gUnknown_08E964B8
	movs r1, 0x11
	str r1, [sp]
	movs r2, 0x2
	str r2, [sp, 0x4]
	movs r1, 0xA
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	b _080C392A
	.align 2, 0
_080C38C0: .4byte 0x0600e000
_080C38C4: .4byte gUnknown_08E964B8
_080C38C8: .4byte gUnknown_0203869C
_080C38CC:
	cmp r0, 0x1
	bne _080C38EC
	movs r6, 0x1
	ldr r0, _080C38E4 @ =0x0600e000
	ldr r3, _080C38E8 @ =gUnknown_08E964B8
	movs r1, 0
	str r1, [sp]
	movs r1, 0x4
	str r1, [sp, 0x4]
	movs r1, 0xB
	b _080C3924
	.align 2, 0
_080C38E4: .4byte 0x0600e000
_080C38E8: .4byte gUnknown_08E964B8
_080C38EC:
	cmp r0, 0x2
	bne _080C3910
	movs r6, 0x2
	ldr r0, _080C3908 @ =0x0600e000
	ldr r3, _080C390C @ =gUnknown_08E964B8
	movs r1, 0xB
	str r1, [sp]
	movs r1, 0x4
	str r1, [sp, 0x4]
	movs r1, 0xA
	str r1, [sp, 0x8]
	str r6, [sp, 0xC]
	b _080C392A
	.align 2, 0
_080C3908: .4byte 0x0600e000
_080C390C: .4byte gUnknown_08E964B8
_080C3910:
	cmp r0, 0x3
	bne _080C393C
	movs r6, 0x3
	ldr r0, _080C3934 @ =0x0600e000
	ldr r3, _080C3938 @ =gUnknown_08E964B8
	movs r1, 0x15
	str r1, [sp]
	movs r1, 0x4
	str r1, [sp, 0x4]
	movs r1, 0xA
_080C3924:
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
_080C392A:
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_809D104
	b _080C395A
	.align 2, 0
_080C3934: .4byte 0x0600e000
_080C3938: .4byte gUnknown_08E964B8
_080C393C:
	movs r6, 0x4
	ldr r0, _080C3984 @ =0x0600e000
	ldr r3, _080C3988 @ =gUnknown_08E964B8
	movs r1, 0
	str r1, [sp]
	movs r1, 0x6
	str r1, [sp, 0x4]
	movs r1, 0xA
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_809D104
_080C395A:
	ldr r5, _080C398C @ =0x00000fff
	lsls r4, r6, 12
	ldr r2, _080C3984 @ =0x0600e000
	movs r3, 0x7F
_080C3962:
	ldrh r1, [r2]
	adds r0, r5, 0
	ands r0, r1
	strh r0, [r2]
	ldrh r1, [r2]
	adds r0, r4, 0
	orrs r0, r1
	strh r0, [r2]
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C3962
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C3984: .4byte 0x0600e000
_080C3988: .4byte gUnknown_08E964B8
_080C398C: .4byte 0x00000fff
	thumb_func_end sub_80C37E4

	thumb_func_start sub_80C3990
sub_80C3990: @ 80C3990
	push {r4,r5,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r1, _080C39DC @ =gUnknown_02038670
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	lsls r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x3F
	bl __udivsi3
	adds r1, r0, 0
	ldr r0, _080C39E0 @ =0x0000ffff
	ands r0, r1
	cmp r0, 0
	beq _080C39BC
	movs r0, 0x80
	lsls r0, 9
	adds r1, r0
_080C39BC:
	lsrs r1, 16
	cmp r1, 0
	bne _080C39C8
	cmp r4, 0
	beq _080C39C8
	movs r1, 0x1
_080C39C8:
	cmp r5, 0
	beq _080C39D2
	cmp r1, 0xA
	bls _080C39D2
	movs r1, 0xA
_080C39D2:
	lsls r0, r1, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C39DC: .4byte gUnknown_02038670
_080C39E0: .4byte 0x0000ffff
	thumb_func_end sub_80C3990

	thumb_func_start sub_80C39E4
sub_80C39E4: @ 80C39E4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _080C3A44 @ =gUnknown_02038688
	lsls r0, r5, 1
	adds r0, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r7, r1, 0
	cmp r0, 0
	bge _080C3A00
	negs r0, r0
_080C3A00:
	lsls r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x50
	bl __udivsi3
	adds r2, r0, 0
	ldr r0, _080C3A48 @ =0x0000ffff
	ands r0, r2
	cmp r0, 0
	beq _080C3A1A
	movs r0, 0x80
	lsls r0, 9
	adds r2, r0
_080C3A1A:
	lsrs r2, 16
	cmp r2, 0
	bne _080C3A26
	cmp r4, 0
	beq _080C3A26
	movs r2, 0x1
_080C3A26:
	cmp r6, 0
	beq _080C3A30
	cmp r2, 0xA
	bls _080C3A30
	movs r2, 0xA
_080C3A30:
	lsls r0, r5, 1
	adds r0, r7
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _080C3A4C
	negs r0, r2
	lsls r0, 24
	b _080C3A4E
	.align 2, 0
_080C3A44: .4byte gUnknown_02038688
_080C3A48: .4byte 0x0000ffff
_080C3A4C:
	lsls r0, r2, 24
_080C3A4E:
	lsrs r0, 24
	lsls r0, 24
	asrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C39E4

	thumb_func_start sub_80C3A5C
sub_80C3A5C: @ 80C3A5C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r1, _080C3A90 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r3, r0, r1
	ldrh r2, [r3, 0x1C]
	movs r1, 0x1C
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080C3A94
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	movs r1, 0x3
	subs r1, r0
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	strh r0, [r3, 0x1E]
	adds r0, r2, 0x1
	strh r0, [r3, 0x1C]
	b _080C3B12
	.align 2, 0
_080C3A90: .4byte gTasks
_080C3A94:
	cmp r0, 0x1
	bne _080C3B12
	ldrh r0, [r3, 0x1E]
	subs r0, 0x1
	strh r0, [r3, 0x1E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080C3B12
	movs r0, 0x8
	ldrsh r2, [r3, r0]
	lsls r2, 17
	ldr r1, _080C3B18 @ =0x50430000
	adds r2, r1
	lsrs r2, 16
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 6
	ldr r1, _080C3B1C @ =0x0600e142
	adds r0, r1
	strh r2, [r0]
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 6
	ldr r1, _080C3B20 @ =0x0600e144
	adds r0, r1
	adds r1, r2, 0x1
	strh r1, [r0]
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 6
	ldr r1, _080C3B24 @ =0x0600e182
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0x10
	strh r1, [r0]
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 6
	ldr r1, _080C3B28 @ =0x0600e184
	adds r0, r1
	adds r2, 0x11
	strh r2, [r0]
	ldr r1, _080C3B2C @ =0x02018000
	ldrb r0, [r1, 0x5]
	adds r0, 0x1
	strb r0, [r1, 0x5]
	adds r0, r4, 0
	bl DestroyTask
	movs r0, 0x18
	bl PlaySE
_080C3B12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3B18: .4byte 0x50430000
_080C3B1C: .4byte 0x0600e142
_080C3B20: .4byte 0x0600e144
_080C3B24: .4byte 0x0600e182
_080C3B28: .4byte 0x0600e184
_080C3B2C: .4byte 0x02018000
	thumb_func_end sub_80C3A5C

	thumb_func_start sub_80C3B30
sub_80C3B30: @ 80C3B30
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r5, 0
	ldr r1, _080C3BC0 @ =gUnknown_02038690
	ldrb r0, [r1]
	ldr r2, _080C3BC4 @ =gTasks
	mov r10, r2
	cmp r0, 0
	beq _080C3B5C
_080C3B4E:
	adds r5, 0x1
	cmp r5, 0x3
	bgt _080C3B5C
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C3B4E
_080C3B5C:
	movs r1, 0
	lsls r0, r5, 1
	mov r2, r12
	lsls r2, 2
	mov r9, r2
	adds r0, r5
	lsls r0, 5
	mov r8, r0
	ldr r7, _080C3BC8 @ =0x00000fff
	movs r0, 0x90
	lsls r0, 8
	adds r6, r0, 0
_080C3B74:
	lsls r0, r1, 5
	adds r4, r1, 0x1
	add r0, r8
	movs r3, 0x1D
	lsls r0, 1
	ldr r1, _080C3BCC @ =0x0600e100
	adds r2, r0, r1
_080C3B82:
	ldrh r1, [r2]
	adds r0, r7, 0
	ands r0, r1
	orrs r0, r6
	strh r0, [r2]
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C3B82
	adds r1, r4, 0
	cmp r1, 0x2
	ble _080C3B74
	mov r0, r9
	add r0, r12
	lsls r0, 3
	add r0, r10
	strh r5, [r0, 0x1C]
	movs r1, 0x1
	strh r1, [r0, 0x20]
	ldr r2, _080C3BD0 @ =sub_80C3BD8
	str r2, [r0]
	mov r1, r12
	ldr r0, _080C3BD4 @ =0x02018000
	strb r1, [r0, 0x3]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3BC0: .4byte gUnknown_02038690
_080C3BC4: .4byte gTasks
_080C3BC8: .4byte 0x00000fff
_080C3BCC: .4byte 0x0600e100
_080C3BD0: .4byte sub_80C3BD8
_080C3BD4: .4byte 0x02018000
	thumb_func_end sub_80C3B30

	thumb_func_start sub_80C3BD8
sub_80C3BD8: @ 80C3BD8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C3C24 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r5, r0, 16
	cmp r5, 0x1
	bne _080C3C3C
	movs r0, 0
	strh r0, [r4, 0x1E]
	ldrh r2, [r4, 0x20]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080C3C28 @ =0x00006f8d
	movs r0, 0x91
	movs r1, 0x1
	bl BlendPalette
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C3C2C
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _080C3C3C
	strh r5, [r4, 0x22]
	b _080C3C3C
	.align 2, 0
_080C3C24: .4byte gTasks
_080C3C28: .4byte 0x00006f8d
_080C3C2C:
	ldrh r0, [r4, 0x20]
	subs r0, 0x1
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080C3C3C
	strh r0, [r4, 0x22]
_080C3C3C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C3BD8

	thumb_func_start sub_80C3C44
sub_80C3C44: @ 80C3C44
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x9
	bgt _080C3C6C
	adds r0, r1, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080C3CA8
	ldrh r0, [r4, 0x30]
	movs r1, 0
	bl PlayCry1
	movs r0, 0
	strh r0, [r4, 0x30]
	b _080C3CA8
_080C3C6C:
	movs r0, 0xC0
	lsls r0, 3
	adds r2, r0, 0
	ldrh r1, [r4, 0x30]
	adds r2, r1
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x20]
	subs r0, r1
	strh r0, [r4, 0x20]
	movs r1, 0xFF
	ands r2, r1
	strh r2, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x77
	bgt _080C3C92
	movs r0, 0x78
	strh r0, [r4, 0x20]
_080C3C92:
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x78
	bne _080C3CA8
	ldr r0, _080C3CB0 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x30]
	ldr r1, _080C3CB4 @ =0x02018000
	movs r0, 0x1
	strb r0, [r1, 0x6]
_080C3CA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3CB0: .4byte SpriteCallbackDummy
_080C3CB4: .4byte 0x02018000
	thumb_func_end sub_80C3C44

	thumb_func_start sub_80C3CB8
sub_80C3CB8: @ 80C3CB8
	push {lr}
	adds r3, r0, 0
	movs r0, 0xC0
	lsls r0, 3
	adds r2, r0, 0
	ldrh r0, [r3, 0x30]
	adds r2, r0
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r3, 0x20]
	subs r0, r1
	strh r0, [r3, 0x20]
	movs r1, 0xFF
	ands r2, r1
	strh r2, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080C3CF8
	ldr r0, _080C3CFC @ =SpriteCallbackDummy
	str r0, [r3, 0x1C]
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080C3D00 @ =0x02018000
	movs r0, 0x2
	strb r0, [r1, 0x6]
_080C3CF8:
	pop {r0}
	bx r0
	.align 2, 0
_080C3CFC: .4byte SpriteCallbackDummy
_080C3D00: .4byte 0x02018000
	thumb_func_end sub_80C3CB8

	thumb_func_start sub_80C3D04
sub_80C3D04: @ 80C3D04
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080C3DD8 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080C3DBE
	movs r0, 0
	strh r0, [r1, 0x8]
	ldr r0, _080C3DDC @ =0x02018000
	mov r8, r0
	ldrb r0, [r0, 0x7]
	cmp r0, 0x27
	bhi _080C3DBE
	ldr r4, _080C3DE0 @ =gSpriteTemplate_83D17B4
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	adds r1, r0, 0
	subs r1, 0x14
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0x2C
	movs r3, 0x5
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	ldr r1, _080C3DE4 @ =gSprites
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r5, r1
	lsls r0, 23
	lsrs r0, 23
	strh r0, [r5, 0x2E]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x18
	bl __umodsi3
	adds r0, 0x10
	strh r0, [r5, 0x30]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xFF
	ands r0, r1
	adds r0, 0x30
	strh r0, [r5, 0x32]
	bl Random
	ldrh r6, [r5, 0x4]
	lsls r4, r6, 22
	lsrs r4, 22
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x11
	bl __umodsi3
	adds r4, r0
	ldr r1, _080C3DE8 @ =0x000003ff
	adds r0, r1, 0
	ands r4, r0
	ldr r0, _080C3DEC @ =0xfffffc00
	ands r0, r6
	orrs r0, r4
	strh r0, [r5, 0x4]
	mov r1, r8
	ldrb r0, [r1, 0x7]
	adds r0, 0x1
	strb r0, [r1, 0x7]
_080C3DBE:
	ldr r0, _080C3DDC @ =0x02018000
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	beq _080C3DCC
	adds r0, r7, 0
	bl DestroyTask
_080C3DCC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3DD8: .4byte gTasks
_080C3DDC: .4byte 0x02018000
_080C3DE0: .4byte gSpriteTemplate_83D17B4
_080C3DE4: .4byte gSprites
_080C3DE8: .4byte 0x000003ff
_080C3DEC: .4byte 0xfffffc00
	thumb_func_end sub_80C3D04

	thumb_func_start sub_80C3DF0
sub_80C3DF0: @ 80C3DF0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r1, [r4, 0x32]
	ldrh r0, [r4, 0x36]
	adds r1, r0
	lsls r0, r1, 16
	asrs r0, 24
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r4, 0x36]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
	ldr r5, _080C3E5C @ =0x02018000
	ldrb r0, [r5, 0x9]
	cmp r0, 0
	beq _080C3E3A
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080C3E3A:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r0, 0xF8
	bgt _080C3E4A
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0x74
	ble _080C3E56
_080C3E4A:
	adds r0, r4, 0
	bl DestroySprite
	ldrb r0, [r5, 0x7]
	subs r0, 0x1
	strb r0, [r5, 0x7]
_080C3E56:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3E5C: .4byte 0x02018000
	thumb_func_end sub_80C3DF0

	thumb_func_start sub_80C3E60
sub_80C3E60: @ 80C3E60
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080C3E98 @ =sub_80C3EA4
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C3E9C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xA]
	ldr r0, _080C3EA0 @ =gUnknown_02038570
	lsls r4, 6
	adds r4, r0
	ldrh r0, [r4]
	strh r0, [r1, 0xC]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3E98: .4byte sub_80C3EA4
_080C3E9C: .4byte gTasks
_080C3EA0: .4byte gUnknown_02038570
	thumb_func_end sub_80C3E60

	thumb_func_start sub_80C3EA4
sub_80C3EA4: @ 80C3EA4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C3EF8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrb r5, [r4, 0x8]
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080C3EEE
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0xC]
	ldrb r2, [r4, 0x1E]
	ldr r1, _080C3EFC @ =gUnknown_02038570
	lsls r3, r5, 6
	adds r1, 0x38
	adds r3, r1
	ldr r1, [r3]
	str r1, [sp]
	adds r1, r5, 0
	movs r3, 0
	bl sub_80C3024
	ldrh r0, [r4, 0x1E]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x1E]
_080C3EEE:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3EF8: .4byte gTasks
_080C3EFC: .4byte gUnknown_02038570
	thumb_func_end sub_80C3EA4

	thumb_func_start sub_80C3F00
sub_80C3F00: @ 80C3F00
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _080C4098 @ =gUnknown_02038678
	ldrh r2, [r0]
	adds r4, r0, 0
	adds r3, r4, 0x2
	movs r0, 0x2
	mov r8, r0
_080C3F16:
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0
	ldrsh r1, [r3, r5]
	cmp r0, r1
	bge _080C3F24
	ldrh r2, [r3]
_080C3F24:
	adds r3, 0x2
	movs r0, 0x1
	negs r0, r0
	add r8, r0
	mov r1, r8
	cmp r1, 0
	bge _080C3F16
	lsls r0, r2, 16
	mov r9, r0
	cmp r0, 0
	bge _080C3F62
	ldrh r2, [r4]
	adds r3, r4, 0x2
	movs r4, 0x2
	mov r8, r4
_080C3F42:
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0
	ldrsh r1, [r3, r5]
	cmp r0, r1
	ble _080C3F50
	ldrh r2, [r3]
_080C3F50:
	adds r3, 0x2
	movs r0, 0x1
	negs r0, r0
	add r8, r0
	lsls r1, r2, 16
	mov r9, r1
	mov r4, r8
	cmp r4, 0
	bge _080C3F42
_080C3F62:
	movs r5, 0
	mov r8, r5
	mov r10, r5
_080C3F68:
	ldr r0, _080C409C @ =gUnknown_02038670
	mov r1, r8
	lsls r7, r1, 1
	adds r0, r7, r0
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 5
	subs r0, r1
	lsls r0, 2
	adds r0, r1
	lsls r0, 3
	mov r4, r9
	asrs r6, r4, 16
	adds r1, r6, 0
	cmp r6, 0
	bge _080C3F8A
	negs r1, r6
_080C3F8A:
	bl __divsi3
	adds r4, r0, 0
	movs r1, 0xA
	bl __modsi3
	cmp r0, 0x4
	ble _080C3F9C
	adds r4, 0xA
_080C3F9C:
	ldr r0, _080C40A0 @ =0x02018018
	mov r1, r10
	adds r5, r1, r0
	adds r0, r4, 0
	movs r1, 0xA
	bl __divsi3
	str r0, [r5]
	ldr r0, _080C40A4 @ =gUnknown_02038688
	adds r7, r0
	movs r2, 0
	ldrsh r1, [r7, r2]
	cmp r1, 0
	bge _080C3FBA
	negs r1, r1
_080C3FBA:
	lsls r0, r1, 5
	subs r0, r1
	lsls r0, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r6, 0
	cmp r1, 0
	bge _080C3FCC
	negs r1, r1
_080C3FCC:
	bl __divsi3
	adds r4, r0, 0
	movs r1, 0xA
	bl __modsi3
	cmp r0, 0x4
	ble _080C3FDE
	adds r4, 0xA
_080C3FDE:
	adds r0, r4, 0
	movs r1, 0xA
	bl __divsi3
	str r0, [r5, 0x4]
	movs r4, 0
	ldrsh r0, [r7, r4]
	cmp r0, 0
	bge _080C3FF4
	movs r0, 0x1
	strb r0, [r5, 0x10]
_080C3FF4:
	ldr r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	subs r0, r1
	lsls r0, 11
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	movs r4, 0xFF
	ands r0, r4
	cmp r0, 0x7F
	bls _080C4016
	movs r0, 0x80
	lsls r0, 1
	adds r1, r0
_080C4016:
	lsrs r0, r1, 8
	str r0, [r5, 0x8]
	ldr r1, [r5, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	subs r0, r1
	lsls r0, 11
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	ands r0, r4
	cmp r0, 0x7F
	bls _080C403A
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2
_080C403A:
	lsrs r0, r1, 8
	str r0, [r5, 0xC]
	mov r0, r8
	lsls r4, r0, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80C3990
	strb r0, [r5, 0x11]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80C39E4
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bge _080C4060
	negs r0, r0
_080C4060:
	strb r0, [r5, 0x12]
	ldr r0, _080C40A8 @ =gUnknown_02038690
	add r0, r8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C40B4
	ldr r4, [r5, 0x8]
	ldrh r2, [r5, 0x8]
	ldr r3, [r5, 0xC]
	ldrh r1, [r5, 0xC]
	ldrb r0, [r5, 0x10]
	cmp r0, 0
	beq _080C4080
	lsls r0, r1, 16
	negs r0, r0
	lsrs r1, r0, 16
_080C4080:
	lsls r0, r2, 16
	asrs r2, r0, 16
	lsls r0, r1, 16
	asrs r1, r0, 16
	adds r0, r2, r1
	cmp r0, 0x58
	bne _080C40B4
	cmp r1, 0
	ble _080C40AC
	subs r0, r3, 0x1
	str r0, [r5, 0xC]
	b _080C40B4
	.align 2, 0
_080C4098: .4byte gUnknown_02038678
_080C409C: .4byte gUnknown_02038670
_080C40A0: .4byte 0x02018018
_080C40A4: .4byte gUnknown_02038688
_080C40A8: .4byte gUnknown_02038690
_080C40AC:
	cmp r2, 0
	ble _080C40B4
	subs r0, r4, 0x1
	str r0, [r5, 0x8]
_080C40B4:
	movs r1, 0x14
	add r10, r1
	movs r2, 0x1
	add r8, r2
	mov r4, r8
	cmp r4, 0x3
	bgt _080C40C4
	b _080C3F68
_080C40C4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C3F00

	thumb_func_start sub_80C40D4
sub_80C40D4: @ 80C40D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	movs r1, 0
	mov r10, r1
	movs r2, 0
	str r2, [sp]
	cmp r0, 0
	bne _080C4198
	mov r8, r2
	ldr r0, _080C417C @ =0x02018018
	subs r1, 0x18
	adds r1, r0
	mov r9, r1
	adds r4, r0, 0
	adds r4, 0x8
	movs r6, 0xA0
_080C4102:
	ldrb r0, [r4, 0x9]
	cmp r7, r0
	bcs _080C416A
	adds r0, 0x13
	adds r0, r6, r0
	subs r0, r7
	lsls r0, 1
	ldr r2, _080C4180 @ =0x0600bffe
	adds r0, r2
	ldr r2, _080C4184 @ =0x000060b3
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _080C4188 @ =sub_80C42C0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r4]
	lsls r0, 16
	ldrb r1, [r4, 0x9]
	bl __udivsi3
	adds r1, r7, 0x1
	adds r3, r0, 0
	muls r3, r1
	ldr r0, _080C418C @ =0x0000ffff
	ands r0, r3
	ldr r1, _080C4190 @ =0x00007fff
	cmp r0, r1
	bls _080C4146
	movs r0, 0x80
	lsls r0, 9
	adds r3, r0
_080C4146:
	ldr r1, _080C4194 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	mov r1, r8
	strh r1, [r0, 0x8]
	lsrs r1, r3, 16
	strh r1, [r0, 0xA]
	mov r2, r9
	ldrb r0, [r2, 0x14]
	adds r0, 0x1
	strb r0, [r2, 0x14]
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_080C416A:
	adds r4, 0x14
	adds r6, 0x60
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x3
	ble _080C4102
	b _080C4292
	.align 2, 0
_080C417C: .4byte 0x02018018
_080C4180: .4byte 0x0600bffe
_080C4184: .4byte 0x000060b3
_080C4188: .4byte sub_80C42C0
_080C418C: .4byte 0x0000ffff
_080C4190: .4byte 0x00007fff
_080C4194: .4byte gTasks
_080C4198:
	movs r2, 0
	mov r8, r2
	ldr r0, _080C4220 @ =0x02018018
	mov r12, r0
	mov r9, r2
	movs r1, 0xC0
	str r1, [sp, 0x4]
_080C41A6:
	mov r6, r9
	add r6, r12
	ldrb r1, [r6, 0x12]
	ldrb r0, [r6, 0x10]
	ldr r2, _080C4224 @ =0x000060a3
	cmp r0, 0
	beq _080C41B6
	adds r2, 0x2
_080C41B6:
	lsls r0, r1, 24
	asrs r0, 24
	cmp r7, r0
	bge _080C427E
	adds r0, 0x13
	ldr r1, [sp, 0x4]
	adds r0, r1, r0
	subs r0, r7
	lsls r0, 1
	ldr r1, _080C4228 @ =0x0600bffe
	adds r0, r1
	strh r2, [r0]
	ldr r0, _080C422C @ =sub_80C42C0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r6, 0xC]
	lsls r0, 16
	ldrb r1, [r6, 0x12]
	bl __udivsi3
	adds r1, r7, 0x1
	adds r3, r0, 0
	muls r3, r1
	ldr r0, _080C4230 @ =0x0000ffff
	ands r0, r3
	ldr r1, _080C4234 @ =0x00007fff
	cmp r0, r1
	bls _080C41FA
	movs r2, 0x80
	lsls r2, 9
	adds r3, r2
_080C41FA:
	ldr r1, _080C4238 @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r4, r0, r1
	mov r0, r8
	strh r0, [r4, 0x8]
	ldrb r0, [r6, 0x10]
	adds r6, r1, 0
	cmp r0, 0
	beq _080C423C
	movs r0, 0x1
	strh r0, [r4, 0xC]
	ldr r0, [sp]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	b _080C4246
	.align 2, 0
_080C4220: .4byte 0x02018018
_080C4224: .4byte 0x000060a3
_080C4228: .4byte 0x0600bffe
_080C422C: .4byte sub_80C42C0
_080C4230: .4byte 0x0000ffff
_080C4234: .4byte 0x00007fff
_080C4238: .4byte gTasks
_080C423C:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_080C4246:
	ldr r0, _080C4264 @ =0x02018018
	mov r1, r9
	adds r4, r1, r0
	ldrb r1, [r4, 0x10]
	mov r12, r0
	cmp r1, 0
	beq _080C4268
	adds r0, r2, r5
	lsls r0, 3
	adds r0, r6
	lsrs r2, r3, 16
	ldr r1, [r4, 0x8]
	subs r1, r2
	b _080C4274
	.align 2, 0
_080C4264: .4byte 0x02018018
_080C4268:
	adds r0, r2, r5
	lsls r0, 3
	adds r0, r6
	lsrs r2, r3, 16
	ldr r1, [r4, 0x8]
	adds r1, r2
_080C4274:
	strh r1, [r0, 0xA]
	ldr r1, _080C42BC @ =0x02018000
	ldrb r0, [r1, 0x14]
	adds r0, 0x1
	strb r0, [r1, 0x14]
_080C427E:
	movs r2, 0x14
	add r9, r2
	ldr r0, [sp, 0x4]
	adds r0, 0x60
	str r0, [sp, 0x4]
	movs r1, 0x1
	add r8, r1
	mov r2, r8
	cmp r2, 0x3
	ble _080C41A6
_080C4292:
	ldr r0, [sp]
	cmp r0, 0
	beq _080C429E
	movs r0, 0x16
	bl PlaySE
_080C429E:
	mov r1, r10
	cmp r1, 0
	beq _080C42AA
	movs r0, 0x15
	bl PlaySE
_080C42AA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C42BC: .4byte 0x02018000
	thumb_func_end sub_80C40D4

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
	ldr r1, _080C430C @ =0x02018000
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
_080C430C: .4byte 0x02018000
_080C4310:
	ldr r1, _080C4350 @ =0x02018000
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
_080C4350: .4byte 0x02018000
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
	ldr r0, _080C4388 @ =0x0201800c
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
_080C4388: .4byte 0x0201800c
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
	ldr r4, _080C4434 @ =gUnknown_0203869C
	ldrb r0, [r4]
	ldr r1, _080C4438 @ =gUnknown_0203869E
	ldrb r1, [r1]
	bl sub_80AE398
	ldrb r0, [r4]
	bl sub_80AE82C
_080C4422:
	ldr r0, _080C443C @ =gScriptResult
	strh r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C442C: .4byte gUnknown_02038694
_080C4430: .4byte gPlayerParty
_080C4434: .4byte gUnknown_0203869C
_080C4438: .4byte gUnknown_0203869E
_080C443C: .4byte gScriptResult
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
	ldr r0, _080C446C @ =gUnknown_0203869C
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
_080C446C: .4byte gUnknown_0203869C
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
	ldr r1, _080C44BC @ =gUnknown_0203869E
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
_080C44BC: .4byte gUnknown_0203869E
	thumb_func_end sub_80C4440

	thumb_func_start sub_80C44C0
sub_80C44C0: @ 80C44C0
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _080C44E8 @ =gUnknown_02038690
	ldr r0, _080C44EC @ =gUnknown_02038695
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C44D4
	b _080C465E
_080C44D4:
	ldr r0, _080C44F0 @ =gUnknown_0203869C
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
_080C44E8: .4byte gUnknown_02038690
_080C44EC: .4byte gUnknown_02038695
_080C44F0: .4byte gUnknown_0203869C
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
	ldr r0, _080C4550 @ =gUnknown_0203869E
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
_080C4550: .4byte gUnknown_0203869E
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
	ldr r0, _080C4594 @ =gUnknown_0203869E
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
_080C4594: .4byte gUnknown_0203869E
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
	ldr r0, _080C45D8 @ =gUnknown_0203869E
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
_080C45D8: .4byte gUnknown_0203869E
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
	ldr r0, _080C4620 @ =gUnknown_0203869E
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
_080C4620: .4byte gUnknown_0203869E
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
	ldr r0, _080C4670 @ =gUnknown_0203869E
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
_080C4670: .4byte gUnknown_0203869E
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
	ldr r0, _080C46E0 @ =gUnknown_02038572
	adds r1, r0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _080C46E4 @ =gUnknown_0203869A
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
_080C46E0: .4byte gUnknown_02038572
_080C46E4: .4byte gUnknown_0203869A
_080C46E8: .4byte gLinkPlayers
	thumb_func_end sub_80C4698

	thumb_func_start sub_80C46EC
sub_80C46EC: @ 80C46EC
	push {lr}
	ldr r0, _080C4710 @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C4720
	ldr r0, _080C4714 @ =gStringVar1
	ldr r1, _080C4718 @ =gUnknown_0202E8D0
	ldrh r2, [r1]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r2, _080C471C @ =gLinkPlayers + 0x8
	adds r1, r2
	bl sub_80C4674
	b _080C4730
	.align 2, 0
_080C4710: .4byte gUnknown_0203869A
_080C4714: .4byte gStringVar1
_080C4718: .4byte gUnknown_0202E8D0
_080C471C: .4byte gLinkPlayers + 0x8
_080C4720:
	ldr r0, _080C4734 @ =gStringVar1
	ldr r1, _080C4738 @ =gUnknown_0202E8D0
	ldrh r1, [r1]
	lsls r1, 6
	ldr r2, _080C473C @ =gUnknown_0203857D
	adds r1, r2
	bl sub_80C4674
_080C4730:
	pop {r0}
	bx r0
	.align 2, 0
_080C4734: .4byte gStringVar1
_080C4738: .4byte gUnknown_0202E8D0
_080C473C: .4byte gUnknown_0203857D
	thumb_func_end sub_80C46EC

	thumb_func_start sub_80C4740
sub_80C4740: @ 80C4740
	push {lr}
	ldr r0, _080C4750 @ =gStringVar3
	ldr r1, _080C4754 @ =gUnknown_0202E8D0
	ldrb r1, [r1]
	bl sub_80C4698
	pop {r0}
	bx r0
	.align 2, 0
_080C4750: .4byte gStringVar3
_080C4754: .4byte gUnknown_0202E8D0
	thumb_func_end sub_80C4740

	thumb_func_start sub_80C4758
sub_80C4758: @ 80C4758
	push {r4-r6,lr}
	movs r1, 0
	movs r2, 0
	ldr r5, _080C4794 @ =gUnknown_0202E8CC
	ldr r4, _080C4798 @ =gUnknown_02038670
	ldr r0, _080C479C @ =gUnknown_0202E8D0
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
_080C4794: .4byte gUnknown_0202E8CC
_080C4798: .4byte gUnknown_02038670
_080C479C: .4byte gUnknown_0202E8D0
	thumb_func_end sub_80C4758

	thumb_func_start sub_80C47A0
sub_80C47A0: @ 80C47A0
	ldr r2, _080C47B4 @ =gUnknown_0202E8CC
	ldr r1, _080C47B8 @ =gUnknown_02038670
	ldr r0, _080C47BC @ =gUnknown_0202E8D0
	ldrh r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_080C47B4: .4byte gUnknown_0202E8CC
_080C47B8: .4byte gUnknown_02038670
_080C47BC: .4byte gUnknown_0202E8D0
	thumb_func_end sub_80C47A0

	thumb_func_start sub_80C47C0
sub_80C47C0: @ 80C47C0
	push {lr}
	movs r1, 0
	ldr r2, _080C47E8 @ =gUnknown_02038690
	ldrb r0, [r2]
	ldr r3, _080C47EC @ =gUnknown_0202E8CE
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
_080C47E8: .4byte gUnknown_02038690
_080C47EC: .4byte gUnknown_0202E8CE
	thumb_func_end sub_80C47C0

	thumb_func_start sub_80C47F0
sub_80C47F0: @ 80C47F0
	push {r4,lr}
	movs r2, 0
	ldr r3, _080C4830 @ =gUnknown_02038690
	ldrb r0, [r3]
	ldr r1, _080C4834 @ =gUnknown_0203869A
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
_080C4830: .4byte gUnknown_02038690
_080C4834: .4byte gUnknown_0203869A
_080C4838: .4byte gStringVar3
_080C483C: .4byte gLinkPlayers + 0x8
_080C4840:
	lsls r1, r2, 6
	ldr r0, _080C4854 @ =gUnknown_0203857D
	adds r1, r0
	adds r0, r4, 0
	bl sub_80C4674
_080C484C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4854: .4byte gUnknown_0203857D
	thumb_func_end sub_80C47F0

	thumb_func_start sub_80C4858
sub_80C4858: @ 80C4858
	push {lr}
	movs r1, 0
	ldr r2, _080C4884 @ =gUnknown_02038690
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
_080C4884: .4byte gUnknown_02038690
_080C4888: .4byte gStringVar1
	thumb_func_end sub_80C4858

	thumb_func_start sub_80C488C
sub_80C488C: @ 80C488C
	push {lr}
	ldr r0, _080C4898 @ =sub_80AB47C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080C4898: .4byte sub_80AB47C
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
	ldr r2, _080C4908 @ =gUnknown_0202E8CC
	ldr r1, _080C490C @ =gUnknown_02038570
	ldr r0, _080C4910 @ =gUnknown_0202E8D0
	ldrh r0, [r0]
	lsls r0, 6
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_080C4908: .4byte gUnknown_0202E8CC
_080C490C: .4byte gUnknown_02038570
_080C4910: .4byte gUnknown_0202E8D0
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
	ldr r0, _080C4978 @ =gUnknown_0202E8CC
	ldr r1, _080C497C @ =gUnknown_02038695
	ldrb r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_080C4978: .4byte gUnknown_0202E8CC
_080C497C: .4byte gUnknown_02038695
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
	bl sub_80AE098
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
	ldr r0, _080C4AA0 @ =gUnknown_0202E8CC
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
_080C4AA0: .4byte gUnknown_0202E8CC
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
	ldr r0, _080C4B00 @ =gUnknown_0203869C
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
_080C4B00: .4byte gUnknown_0203869C
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
	ldr r0, _080C4B84 @ =gUnknown_0202E8CC
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _080C4B90
	bl sub_8007ECC
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
_080C4B84: .4byte gUnknown_0202E8CC
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

	thumb_func_start sub_80C4BF0
sub_80C4BF0: @ 80C4BF0
	push {r4,lr}
	ldr r2, _080C4C1C @ =gSaveBlock1
	ldr r1, _080C4C20 @ =gUnknown_02038570
	ldrb r3, [r1, 0x15]
	movs r4, 0x9B
	lsls r4, 5
	adds r0, r2, r4
	strh r3, [r0]
	adds r0, r1, 0
	adds r0, 0x55
	ldrb r3, [r0]
	adds r4, 0x2
	adds r0, r2, r4
	strh r3, [r0]
	adds r1, 0x95
	ldrb r0, [r1]
	ldr r1, _080C4C24 @ =0x00001364
	adds r2, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4C1C: .4byte gSaveBlock1
_080C4C20: .4byte gUnknown_02038570
_080C4C24: .4byte 0x00001364
	thumb_func_end sub_80C4BF0

	thumb_func_start sub_80C4C28
sub_80C4C28: @ 80C4C28
	push {lr}
	ldr r0, _080C4C40 @ =gUnknown_0202E8CE
	ldrb r0, [r0]
	adds r1, r0, 0
	cmp r0, 0x1
	beq _080C4C4E
	cmp r0, 0x1
	bgt _080C4C44
	cmp r0, 0
	beq _080C4C4A
	b _080C4C56
	.align 2, 0
_080C4C40: .4byte gUnknown_0202E8CE
_080C4C44:
	cmp r1, 0x2
	beq _080C4C52
	b _080C4C56
_080C4C4A:
	movs r1, 0x3
	b _080C4C58
_080C4C4E:
	movs r1, 0x4
	b _080C4C58
_080C4C52:
	movs r1, 0x5
	b _080C4C58
_080C4C56:
	movs r1, 0x64
_080C4C58:
	ldr r0, _080C4C60 @ =gUnknown_0202E8CC
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080C4C60: .4byte gUnknown_0202E8CC
	thumb_func_end sub_80C4C28

	thumb_func_start sub_80C4C64
sub_80C4C64: @ 80C4C64
	push {lr}
	bl sub_80C46EC
	bl sub_80C4740
	bl sub_80C48F4
	pop {r0}
	bx r0
	thumb_func_end sub_80C4C64

	thumb_func_start sub_80C4C78
sub_80C4C78: @ 80C4C78
	push {lr}
	ldr r0, _080C4C8C @ =gUnknown_0203869C
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080C4CB8
	lsls r0, 2
	ldr r1, _080C4C90 @ =_080C4C94
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C4C8C: .4byte gUnknown_0203869C
_080C4C90: .4byte _080C4C94
	.align 2, 0
_080C4C94:
	.4byte _080C4CA8
	.4byte _080C4CAC
	.4byte _080C4CB0
	.4byte _080C4CB4
	.4byte _080C4CB8
_080C4CA8:
	movs r0, 0x8
	b _080C4CBA
_080C4CAC:
	movs r0, 0x9
	b _080C4CBA
_080C4CB0:
	movs r0, 0xA
	b _080C4CBA
_080C4CB4:
	movs r0, 0xB
	b _080C4CBA
_080C4CB8:
	movs r0, 0xC
_080C4CBA:
	ldr r1, _080C4CD0 @ =gSaveBlock1
	lsls r0, 5
	adds r0, r1
	ldr r1, _080C4CD4 @ =0x00002e04
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, 0
	bne _080C4CDC
	ldr r0, _080C4CD8 @ =gUnknown_0202E8CC
	strh r1, [r0]
	b _080C4CE2
	.align 2, 0
_080C4CD0: .4byte gSaveBlock1
_080C4CD4: .4byte 0x00002e04
_080C4CD8: .4byte gUnknown_0202E8CC
_080C4CDC:
	ldr r1, _080C4CE8 @ =gUnknown_0202E8CC
	movs r0, 0x1
	strh r0, [r1]
_080C4CE2:
	pop {r0}
	bx r0
	.align 2, 0
_080C4CE8: .4byte gUnknown_0202E8CC
	thumb_func_end sub_80C4C78

	thumb_func_start sub_80C4CEC
sub_80C4CEC: @ 80C4CEC
	push {lr}
	movs r0, 0xFF
	bl sub_80B2A7C
	pop {r0}
	bx r0
	thumb_func_end sub_80C4CEC

	thumb_func_start sub_80C4CF8
sub_80C4CF8: @ 80C4CF8
	push {lr}
	ldr r0, _080C4D28 @ =gUnknown_02038690
	ldr r1, _080C4D2C @ =gUnknown_02038695
	ldrb r2, [r1]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C4D40
	ldr r0, _080C4D30 @ =gUnknown_0203869E
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _080C4D40
	ldr r1, _080C4D34 @ =gUnknown_02038678
	lsls r0, r2, 1
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, _080C4D38 @ =0x0000031f
	cmp r1, r0
	ble _080C4D40
	ldr r1, _080C4D3C @ =gUnknown_0202E8CC
	movs r0, 0x1
	b _080C4D44
	.align 2, 0
_080C4D28: .4byte gUnknown_02038690
_080C4D2C: .4byte gUnknown_02038695
_080C4D30: .4byte gUnknown_0203869E
_080C4D34: .4byte gUnknown_02038678
_080C4D38: .4byte 0x0000031f
_080C4D3C: .4byte gUnknown_0202E8CC
_080C4D40:
	ldr r1, _080C4D4C @ =gUnknown_0202E8CC
	movs r0, 0
_080C4D44:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080C4D4C: .4byte gUnknown_0202E8CC
	thumb_func_end sub_80C4CF8

	thumb_func_start sub_80C4D50
sub_80C4D50: @ 80C4D50
	push {lr}
	movs r3, 0
	ldr r0, _080C4D78 @ =gSaveBlock1
	ldr r1, _080C4D7C @ =0x00002f04
	adds r2, r0, r1
	movs r1, 0x4
_080C4D5C:
	ldrh r0, [r2]
	cmp r0, 0
	beq _080C4D68
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_080C4D68:
	adds r2, 0x20
	subs r1, 0x1
	cmp r1, 0
	bge _080C4D5C
	adds r0, r3, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C4D78: .4byte gSaveBlock1
_080C4D7C: .4byte 0x00002f04
	thumb_func_end sub_80C4D50

	thumb_func_start sub_80C4D80
sub_80C4D80: @ 80C4D80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, _080C4EA0 @ =gUnknown_02038670
	mov r12, r0
	ldr r1, _080C4EA4 @ =gUnknown_0202E8D0
	mov r8, r1
	ldr r2, _080C4EA8 @ =gStringVar1
	mov r9, r2
	mov r2, r12
	mov r1, sp
	movs r6, 0x3
_080C4D9E:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _080C4D9E
	movs r6, 0
_080C4DAE:
	movs r1, 0x3
	cmp r1, r6
	ble _080C4DD8
_080C4DB4:
	subs r4, r1, 0x1
	lsls r0, r4, 1
	mov r5, sp
	adds r3, r5, r0
	lsls r0, r1, 1
	adds r2, r5, r0
	ldrh r5, [r3]
	movs r7, 0
	ldrsh r1, [r3, r7]
	movs r7, 0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080C4DD2
	strh r5, [r2]
	strh r0, [r3]
_080C4DD2:
	adds r1, r4, 0
	cmp r1, r6
	bgt _080C4DB4
_080C4DD8:
	adds r6, 0x1
	cmp r6, 0x2
	ble _080C4DAE
	mov r2, r8
	ldrh r0, [r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	movs r2, 0
	movs r7, 0
	movs r6, 0
	lsls r0, 16
	asrs r4, r0, 16
	adds r3, r0, 0
	mov r1, sp
_080C4DF6:
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r0, r4
	bne _080C4E12
	lsls r0, r2, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r2, r0, 24
	mov r5, r8
	ldrh r5, [r5]
	cmp r6, r5
	bne _080C4E12
	adds r7, r2, 0
_080C4E12:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _080C4DF6
	movs r6, 0
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	asrs r1, r3, 16
	lsls r2, 24
	mov r10, r2
	cmp r0, r1
	beq _080C4E40
	adds r2, r1, 0
	mov r1, sp
_080C4E30:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	bgt _080C4E40
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, r2
	bne _080C4E30
_080C4E40:
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r2, r7, 0
	movs r6, 0
	asrs r5, r3, 16
	mov r8, r5
	mov r1, r12
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r8, r0
	bne _080C4E60
	cmp r7, 0x1
	beq _080C4E78
_080C4E5A:
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080C4E60:
	adds r6, 0x1
	cmp r6, 0x3
	bgt _080C4E78
	lsls r0, r6, 1
	add r0, r12
	asrs r1, r3, 16
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	bne _080C4E60
	cmp r2, 0x1
	bne _080C4E5A
_080C4E78:
	lsls r1, r6, 24
	lsrs r1, 24
	mov r0, r9
	bl sub_80C4698
	ldr r0, _080C4EAC @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C4EB8
	ldr r0, _080C4EB0 @ =gStringVar2
	lsls r1, r6, 3
	subs r1, r6
	lsls r1, 2
	ldr r2, _080C4EB4 @ =gLinkPlayers + 0x8
	adds r1, r2
	bl sub_80C4674
	b _080C4EC4
	.align 2, 0
_080C4EA0: .4byte gUnknown_02038670
_080C4EA4: .4byte gUnknown_0202E8D0
_080C4EA8: .4byte gStringVar1
_080C4EAC: .4byte gUnknown_0203869A
_080C4EB0: .4byte gStringVar2
_080C4EB4: .4byte gLinkPlayers + 0x8
_080C4EB8:
	ldr r0, _080C4ED8 @ =gStringVar2
	lsls r1, r6, 6
	ldr r2, _080C4EDC @ =gUnknown_0203857D
	adds r1, r2
	bl sub_80C4674
_080C4EC4:
	mov r1, r10
	asrs r0, r1, 24
	cmp r0, 0x1
	beq _080C4ED0
	cmp r7, r0
	bne _080C4EE4
_080C4ED0:
	ldr r0, _080C4EE0 @ =gUnknown_0202E8D0
	strh r4, [r0]
	b _080C4EEA
	.align 2, 0
_080C4ED8: .4byte gStringVar2
_080C4EDC: .4byte gUnknown_0203857D
_080C4EE0: .4byte gUnknown_0202E8D0
_080C4EE4:
	ldr r1, _080C4EFC @ =gUnknown_0202E8D0
	adds r0, r4, 0x4
	strh r0, [r1]
_080C4EEA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4EFC: .4byte gUnknown_0202E8D0
	thumb_func_end sub_80C4D80

	thumb_func_start sub_80C4F00
sub_80C4F00: @ 80C4F00
	push {lr}
	ldr r0, _080C4F0C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080C4F0C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80C4F00

	thumb_func_start sub_80C4F10
sub_80C4F10: @ 80C4F10
	push {r4-r6,lr}
	ldr r6, _080C4F54 @ =gUnknown_0203856C
	ldrb r0, [r6]
	cmp r0, 0
	beq _080C4F40
	bl sub_80AAF30
	ldr r4, _080C4F58 @ =0x02000000
	ldr r0, _080C4F5C @ =0x00015ddf
	adds r1, r4, r0
	movs r5, 0
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0xFE
	movs r1, 0
	bl sub_80B2C4C
	ldr r1, _080C4F60 @ =0x00015dde
	adds r4, r1
	strb r0, [r4]
	movs r0, 0x3
	bl sub_80B2A7C
	strb r5, [r6]
_080C4F40:
	ldr r0, _080C4F64 @ =sub_8106668
	bl SetMainCallback2
	ldr r1, _080C4F68 @ =gMain
	ldr r0, _080C4F6C @ =sub_80C4F00
	str r0, [r1, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C4F54: .4byte gUnknown_0203856C
_080C4F58: .4byte 0x02000000
_080C4F5C: .4byte 0x00015ddf
_080C4F60: .4byte 0x00015dde
_080C4F64: .4byte sub_8106668
_080C4F68: .4byte gMain
_080C4F6C: .4byte sub_80C4F00
	thumb_func_end sub_80C4F10

	thumb_func_start sub_80C4F70
sub_80C4F70: @ 80C4F70
	push {r4,lr}
	ldr r0, _080C4FA8 @ =0x00004010
	ldr r4, _080C4FAC @ =gUnknown_02038570
	ldrb r1, [r4, 0x15]
	bl VarSet
	ldr r0, _080C4FB0 @ =0x00004011
	adds r1, r4, 0
	adds r1, 0x55
	ldrb r1, [r1]
	bl VarSet
	ldr r0, _080C4FB4 @ =0x00004012
	adds r1, r4, 0
	adds r1, 0x95
	ldrb r1, [r1]
	bl VarSet
	ldr r0, _080C4FB8 @ =0x00004013
	adds r1, r4, 0
	adds r1, 0xD5
	ldrb r1, [r1]
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4FA8: .4byte 0x00004010
_080C4FAC: .4byte gUnknown_02038570
_080C4FB0: .4byte 0x00004011
_080C4FB4: .4byte 0x00004012
_080C4FB8: .4byte 0x00004013
	thumb_func_end sub_80C4F70

	thumb_func_start sub_80C4FBC
sub_80C4FBC: @ 80C4FBC
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _080C501C @ =gUnknown_02038694
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080C5020 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x46
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	cmp r0, 0
	bne _080C5038
	ldr r0, _080C5024 @ =gUnknown_02038690
	ldr r1, _080C5028 @ =gUnknown_02038695
	ldrb r2, [r1]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C5038
	ldr r0, _080C502C @ =gUnknown_0203869E
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _080C5038
	ldr r1, _080C5030 @ =gUnknown_02038678
	lsls r0, r2, 1
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, _080C5034 @ =0x0000031f
	cmp r1, r0
	ble _080C5038
	movs r1, 0x1
	mov r0, sp
	strb r1, [r0]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0x46
	mov r2, sp
	bl SetMonData
	movs r0, 0x1
	b _080C503A
	.align 2, 0
_080C501C: .4byte gUnknown_02038694
_080C5020: .4byte gPlayerParty
_080C5024: .4byte gUnknown_02038690
_080C5028: .4byte gUnknown_02038695
_080C502C: .4byte gUnknown_0203869E
_080C5030: .4byte gUnknown_02038678
_080C5034: .4byte 0x0000031f
_080C5038:
	movs r0, 0
_080C503A:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C4FBC

	thumb_func_start sub_80C5044
sub_80C5044: @ 80C5044
	ldr r0, _080C504C @ =gUnknown_0203856C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080C504C: .4byte gUnknown_0203856C
	thumb_func_end sub_80C5044

	thumb_func_start sub_80C5050
sub_80C5050: @ 80C5050
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r4, _080C513C @ =sub_80C5190
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080C512A
	movs r0, 0xA
	mov r10, r0
	movs r7, 0x3
	movs r1, 0x3
	movs r2, 0x13
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r2, _080C5140 @ =gUnknown_02038570
	ldr r0, _080C5144 @ =gUnknown_0202E8D0
	ldrh r1, [r0]
	lsls r1, 6
	adds r0, r1, r2
	ldrh r6, [r0]
	adds r0, r2, 0
	adds r0, 0x38
	adds r0, r1, r0
	ldr r0, [r0]
	mov r8, r0
	adds r2, 0x3C
	adds r1, r2
	ldr r1, [r1]
	mov r9, r1
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C5148 @ =gTasks
	lsls r5, r0, 2
	adds r5, r0
	lsls r5, 3
	adds r5, r1
	movs r0, 0
	strh r0, [r5, 0x8]
	strh r6, [r5, 0xA]
	lsls r0, r6, 3
	ldr r1, _080C514C @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _080C5150 @ =gMonFrontPicCoords
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r4, _080C5154 @ =gUnknown_081FAF4C
	ldr r3, [r4]
	ldr r4, [r4, 0x4]
	str r4, [sp]
	str r6, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl sub_800D334
	adds r0, r6, 0
	mov r1, r9
	mov r2, r8
	bl sub_80409C8
	adds r4, r0, 0
	bl LoadCompressedObjectPalette
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _080C5158 @ =gUnknown_02024E8C
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x2]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xC]
	mov r1, r10
	strh r1, [r5, 0xE]
	strh r7, [r5, 0x10]
	ldr r3, _080C515C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _080C5160 @ =SpriteCallbackDummy
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
_080C512A:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C513C: .4byte sub_80C5190
_080C5140: .4byte gUnknown_02038570
_080C5144: .4byte gUnknown_0202E8D0
_080C5148: .4byte gTasks
_080C514C: .4byte gMonFrontPicTable
_080C5150: .4byte gMonFrontPicCoords
_080C5154: .4byte gUnknown_081FAF4C
_080C5158: .4byte gUnknown_02024E8C
_080C515C: .4byte gSprites
_080C5160: .4byte SpriteCallbackDummy
	thumb_func_end sub_80C5050

	thumb_func_start sub_80C5164
sub_80C5164: @ 80C5164
	push {lr}
	ldr r0, _080C5188 @ =sub_80C5190
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080C5184
	ldr r0, _080C518C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C5184:
	pop {r0}
	bx r0
	.align 2, 0
_080C5188: .4byte sub_80C5190
_080C518C: .4byte gTasks
	thumb_func_end sub_80C5164

	thumb_func_start sub_80C5190
sub_80C5190: @ 80C5190
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C51B4 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080C5222
	cmp r0, 0x1
	bgt _080C51B8
	cmp r0, 0
	beq _080C51F8
	b _080C5222
	.align 2, 0
_080C51B4: .4byte gTasks
_080C51B8:
	cmp r0, 0x2
	beq _080C51C2
	cmp r0, 0x3
	beq _080C5204
	b _080C5222
_080C51C2:
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C5200 @ =gSprites
	adds r5, r0, r1
	ldrb r0, [r5, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	ldrb r0, [r5, 0x1]
	lsls r0, 30
	cmp r0, 0
	beq _080C51F2
	ldrb r0, [r5, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
_080C51F2:
	adds r0, r5, 0
	bl DestroySprite
_080C51F8:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C5222
	.align 2, 0
_080C5200: .4byte gSprites
_080C5204:
	ldrb r2, [r4, 0xE]
	adds r0, r2, 0
	ldrb r3, [r4, 0x10]
	adds r1, r3, 0
	adds r2, 0x9
	lsls r2, 24
	lsrs r2, 24
	adds r3, 0xA
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl DestroyTask
_080C5222:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C5190

	thumb_func_start sub_80C5228
sub_80C5228: @ 80C5228
	push {r4,lr}
	ldr r0, _080C5244 @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C524C
	ldr r4, _080C5248 @ =gScriptResult
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	b _080C5252
	.align 2, 0
_080C5244: .4byte gUnknown_0203869A
_080C5248: .4byte gScriptResult
_080C524C:
	ldr r1, _080C5258 @ =gScriptResult
	movs r0, 0x4
	strh r0, [r1]
_080C5252:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5258: .4byte gScriptResult
	thumb_func_end sub_80C5228

	thumb_func_start sub_80C525C
sub_80C525C: @ 80C525C
	push {r4,lr}
	ldr r0, _080C5280 @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C5294
	ldr r2, _080C5284 @ =gUnknown_03005D28
	ldr r1, [r2]
	ldr r0, _080C5288 @ =0x41c64e6d
	muls r0, r1
	ldr r1, _080C528C @ =0x00006073
	adds r0, r1
	str r0, [r2]
	lsrs r0, 16
	ldr r4, _080C5290 @ =gScriptResult
	b _080C529E
	.align 2, 0
_080C5280: .4byte gUnknown_0203869A
_080C5284: .4byte gUnknown_03005D28
_080C5288: .4byte 0x41c64e6d
_080C528C: .4byte 0x00006073
_080C5290: .4byte gScriptResult
_080C5294:
	ldr r4, _080C52AC @ =gScriptResult
	bl Random
	lsls r0, 16
	lsrs r0, 16
_080C529E:
	ldrh r1, [r4]
	bl __umodsi3
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C52AC: .4byte gScriptResult
	thumb_func_end sub_80C525C

	thumb_func_start sp000_heal_pokemon
sp000_heal_pokemon: @ 80C52B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	mov r8, r0
	ldr r0, _080C536C @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r8, r0
	bcs _080C535C
	ldr r1, _080C5370 @ =gPlayerParty
	mov r10, r1
	mov r6, sp
_080C52CE:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	add r4, r10
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	lsls r1, r0, 16
	strb r0, [r6]
	lsrs r1, 24
	strb r1, [r6, 0x1]
	adds r0, r4, 0
	movs r1, 0x39
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	lsls r0, 24
	lsrs r7, r0, 24
	movs r5, 0
	movs r1, 0x1
	add r1, r8
	mov r9, r1
_080C5304:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	adds r1, r7, 0
	adds r2, r5, 0
	bl CalculatePPWithBonus
	strb r0, [r6]
	adds r1, r5, 0
	adds r1, 0x11
	adds r0, r4, 0
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080C5304
	movs r0, 0
	strb r0, [r6]
	strb r0, [r6, 0x1]
	strb r0, [r6, 0x2]
	strb r0, [r6, 0x3]
	movs r1, 0x64
	mov r0, r8
	muls r0, r1
	add r0, r10
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _080C536C @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r8, r0
	bcc _080C52CE
_080C535C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C536C: .4byte gPlayerPartyCount
_080C5370: .4byte gPlayerParty
	thumb_func_end sp000_heal_pokemon

	thumb_func_start sub_80C5374
sub_80C5374: @ 80C5374
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x78
	adds r5, r0, 0
	adds r3, r1, 0
	adds r4, r2, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 16
	lsrs r0, r4, 16
	mov r8, r0
	add r6, sp, 0x14
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r3, 0
	movs r3, 0x20
	bl CreateMon
	add r0, sp, 0x10
	mov r1, r8
	strb r1, [r0]
	lsrs r4, 24
	strb r4, [r0, 0x1]
	adds r0, r6, 0
	movs r1, 0xC
	add r2, sp, 0x10
	bl SetMonData
	adds r0, r6, 0
	bl GiveMonToPlayer
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r4, 0x1
	bgt _080C53E8
	cmp r4, 0
	blt _080C53E8
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8090D90
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8090D90
_080C53E8:
	adds r0, r4, 0
	add sp, 0x78
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C5374

	thumb_func_start sub_80C53F8
sub_80C53F8: @ 80C53F8
	push {lr}
	sub sp, 0x68
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r0, sp
	movs r2, 0x1
	bl sub_8042044
	add r2, sp, 0x64
	movs r0, 0x1
	strb r0, [r2]
	mov r0, sp
	movs r1, 0x2D
	bl SetMonData
	mov r0, sp
	bl GiveMonToPlayer
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x68
	pop {r1}
	bx r1
	thumb_func_end sub_80C53F8

	thumb_func_start sub_80C5428
sub_80C5428: @ 80C5428
	push {lr}
	bl sub_803DAA0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	beq _080C5444
	cmp r1, 0x1
	bgt _080C5440
	cmp r1, 0
	beq _080C5444
	b _080C5448
_080C5440:
	cmp r1, 0x2
	bne _080C5448
_080C5444:
	ldr r0, _080C544C @ =gScriptResult
	strh r1, [r0]
_080C5448:
	pop {r0}
	bx r0
	.align 2, 0
_080C544C: .4byte gScriptResult
	thumb_func_end sub_80C5428

	thumb_func_start sub_80C5450
sub_80C5450: @ 80C5450
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	movs r5, 0
	movs r7, 0xCE
	lsls r7, 1
_080C545C:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080C548C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _080C5490
	cmp r0, r7
	beq _080C5490
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	cmp r0, r6
	bne _080C5490
	movs r0, 0x1
	b _080C5498
	.align 2, 0
_080C548C: .4byte gPlayerParty
_080C5490:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080C545C
	movs r0, 0
_080C5498:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C5450

	thumb_func_start sub_80C54A0
sub_80C54A0: @ 80C54A0
	push {r4,lr}
	movs r0, 0xAF
	bl sub_80C5450
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r4, 0x1
	bne _080C54C2
	movs r0, 0xAF
	bl ItemIdToBerryType
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C54CC @ =gStringVar1
	bl GetBerryNameByBerryType
_080C54C2:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C54CC: .4byte gStringVar1
	thumb_func_end sub_80C54A0

	thumb_func_start sub_80C54D0
sub_80C54D0: @ 80C54D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r7, r2, 16
	lsrs r6, r7, 16
	bl ZeroEnemyPartyMons
	ldr r0, _080C552C @ =gEnemyParty
	mov r8, r0
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x20
	bl CreateMon
	cmp r6, 0
	beq _080C551E
	add r0, sp, 0x10
	strb r6, [r0]
	adds r1, r0, 0
	lsrs r0, r7, 24
	strb r0, [r1, 0x1]
	mov r0, r8
	movs r1, 0xC
	add r2, sp, 0x10
	bl SetMonData
_080C551E:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C552C: .4byte gEnemyParty
	thumb_func_end sub_80C54D0

	thumb_func_start sub_80C5530
sub_80C5530: @ 80C5530
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r3, 0x6
	bls _080C554C
	ldr r0, _080C5560 @ =gPlayerPartyCount
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_080C554C:
	movs r0, 0x64
	muls r0, r3
	ldr r1, _080C5564 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	bl SetMonMoveSlot
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5560: .4byte gPlayerPartyCount
_080C5564: .4byte gPlayerParty
	thumb_func_end sub_80C5530

	thumb_func_start sub_80C5568
sub_80C5568: @ 80C5568
	push {lr}
	ldr r1, _080C5578 @ =gMain
	ldr r0, _080C557C @ =sub_80C5580
	str r0, [r1, 0x8]
	bl sub_8121E10
	pop {r0}
	bx r0
	.align 2, 0
_080C5578: .4byte gMain
_080C557C: .4byte sub_80C5580
	thumb_func_end sub_80C5568

	thumb_func_start sub_80C5580
sub_80C5580: @ 80C5580
	push {lr}
	ldr r0, _080C5590 @ =gUnknown_02039270
	ldrb r1, [r0]
	cmp r1, 0
	bne _080C5598
	ldr r0, _080C5594 @ =gScriptResult
	strh r1, [r0]
	b _080C559E
	.align 2, 0
_080C5590: .4byte gUnknown_02039270
_080C5594: .4byte gScriptResult
_080C5598:
	ldr r1, _080C55A8 @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
_080C559E:
	ldr r0, _080C55AC @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080C55A8: .4byte gScriptResult
_080C55AC: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80C5580

	thumb_func_start sub_80C55B0
sub_80C55B0: @ 80C55B0
	push {lr}
	ldr r1, _080C55C0 @ =gMain
	ldr r0, _080C55C4 @ =sub_80C55C8
	str r0, [r1, 0x8]
	bl sub_8121E34
	pop {r0}
	bx r0
	.align 2, 0
_080C55C0: .4byte gMain
_080C55C4: .4byte sub_80C55C8
	thumb_func_end sub_80C55B0

	thumb_func_start sub_80C55C8
sub_80C55C8: @ 80C55C8
	push {r4,lr}
	ldr r0, _080C55DC @ =gUnknown_02039270
	ldrb r4, [r0]
	cmp r4, 0
	bne _080C55E4
	bl copy_player_party_from_sav1
	ldr r0, _080C55E0 @ =gScriptResult
	strh r4, [r0]
	b _080C55EE
	.align 2, 0
_080C55DC: .4byte gUnknown_02039270
_080C55E0: .4byte gScriptResult
_080C55E4:
	bl sub_80C5604
	ldr r1, _080C55FC @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
_080C55EE:
	ldr r0, _080C5600 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C55FC: .4byte gScriptResult
_080C5600: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80C55C8

	thumb_func_start sub_80C5604
sub_80C5604: @ 80C5604
	push {r4-r7,lr}
	sub sp, 0x134
	add r0, sp, 0x12C
	movs r1, 0
	str r1, [r0]
	ldr r2, _080C5674 @ =0x0500004b
	mov r1, sp
	bl CpuSet
	movs r5, 0
	movs r7, 0x64
	ldr r6, _080C5678 @ =gPlayerParty
	mov r4, sp
_080C561E:
	ldr r0, _080C567C @ =gUnknown_02039270
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080C5638
	subs r0, 0x1
	adds r1, r0, 0
	muls r1, r7
	adds r1, r6
	adds r0, r4, 0
	movs r2, 0x64
	bl memcpy
_080C5638:
	adds r4, 0x64
	adds r5, 0x1
	cmp r5, 0x2
	ble _080C561E
	add r0, sp, 0x130
	movs r1, 0
	str r1, [r0]
	ldr r4, _080C5678 @ =gPlayerParty
	ldr r2, _080C5680 @ =0x05000096
	adds r1, r4, 0
	bl CpuSet
	mov r5, sp
	add r6, sp, 0xC8
_080C5654:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r5, 0x64
	adds r4, 0x64
	cmp r5, r6
	ble _080C5654
	bl CalculatePlayerPartyCount
	add sp, 0x134
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5674: .4byte 0x0500004b
_080C5678: .4byte gPlayerParty
_080C567C: .4byte gUnknown_02039270
_080C5680: .4byte 0x05000096
	thumb_func_end sub_80C5604

	thumb_func_start sub_80C5684
sub_80C5684: @ 80C5684
	push {lr}
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080C569C
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _080C56A0
_080C569C:
	movs r0, 0
	b _080C56A2
_080C56A0:
	movs r0, 0x1
_080C56A2:
	pop {r1}
	bx r1
	thumb_func_end sub_80C5684

	thumb_func_start sub_80C56A8
sub_80C56A8: @ 80C56A8
	push {r4,r5,lr}
	ldr r4, _080C56C8 @ =gPlayerParty
	movs r5, 0
_080C56AE:
	adds r0, r4, 0
	bl sub_80C5684
	cmp r0, 0
	beq _080C56CC
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080C56CC
	movs r0, 0
	b _080C56D6
	.align 2, 0
_080C56C8: .4byte gPlayerParty
_080C56CC:
	adds r5, 0x1
	adds r4, 0x64
	cmp r5, 0x5
	ble _080C56AE
	movs r0, 0x1
_080C56D6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80C56A8

	thumb_func_start sub_80C56DC
sub_80C56DC: @ 80C56DC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _080C5720 @ =gPlayerParty
	adds r4, r0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x7
	bl sub_803FCD4
	adds r0, r4, 0
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	ldr r5, _080C5724 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r5, 0
	bl GetMonData
	adds r0, r5, 0
	bl StringGetEnd10
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5720: .4byte gPlayerParty
_080C5724: .4byte gStringVar1
	thumb_func_end sub_80C56DC

	thumb_func_start sub_80C5728
sub_80C5728: @ 80C5728
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _080C5764 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	bl sub_80C5684
	cmp r0, 0
	beq _080C5768
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _080C5768
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C5768
	movs r0, 0x1
	b _080C576A
	.align 2, 0
_080C5764: .4byte gPlayerParty
_080C5768:
	movs r0, 0
_080C576A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C5728

	thumb_func_start sub_80C5770
sub_80C5770: @ 80C5770
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C5794 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080C57CA
	cmp r0, 0x1
	bgt _080C5798
	cmp r0, 0
	beq _080C579E
	b _080C581A
	.align 2, 0
_080C5794: .4byte gTasks + 0x8
_080C5798:
	cmp r0, 0x2
	beq _080C57DC
	b _080C581A
_080C579E:
	ldrh r1, [r4, 0x2]
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	bgt _080C57C4
_080C57A8:
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_80C5728
	cmp r0, 0
	bne _080C57F4
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	adds r1, r0, 0
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080C57A8
_080C57C4:
	movs r0, 0x2
	strh r0, [r4]
	b _080C581A
_080C57CA:
	bl IsFieldMessageBoxHidden
	lsls r0, 24
	cmp r0, 0
	beq _080C581A
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	b _080C581A
_080C57DC:
	bl sub_80C56A8
	adds r1, r0, 0
	cmp r1, 0
	beq _080C580C
	ldr r1, _080C57F0 @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	b _080C5810
	.align 2, 0
_080C57F0: .4byte gScriptResult
_080C57F4:
	ldrb r0, [r4, 0x2]
	bl sub_80C56DC
	ldr r0, _080C5808 @ =UnknownString_81A1132
	bl ShowFieldMessage
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080C581A
	.align 2, 0
_080C5808: .4byte UnknownString_81A1132
_080C580C:
	ldr r0, _080C5820 @ =gScriptResult
	strh r1, [r0]
_080C5810:
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
_080C581A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5820: .4byte gScriptResult
	thumb_func_end sub_80C5770

	thumb_func_start sub_80C5824
sub_80C5824: @ 80C5824
	push {lr}
	ldr r0, _080C5838 @ =sub_80C5770
	movs r1, 0x50
	bl CreateTask
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_080C5838: .4byte sub_80C5770
	thumb_func_end sub_80C5824

	thumb_func_start overworld_poison
overworld_poison: @ 80C583C
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r4, _080C58A8 @ =gPlayerParty
	movs r7, 0
	movs r6, 0
	movs r5, 0x5
_080C5848:
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _080C588C
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C588C
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	str r0, [sp]
	cmp r0, 0
	beq _080C587E
	subs r0, 0x1
	str r0, [sp]
	cmp r0, 0
	bne _080C5880
_080C587E:
	adds r6, 0x1
_080C5880:
	adds r0, r4, 0
	movs r1, 0x39
	mov r2, sp
	bl SetMonData
	adds r7, 0x1
_080C588C:
	adds r4, 0x64
	subs r5, 0x1
	cmp r5, 0
	bge _080C5848
	cmp r6, 0
	bne _080C589C
	cmp r7, 0
	beq _080C58A0
_080C589C:
	bl overworld_posion_effect
_080C58A0:
	cmp r6, 0
	beq _080C58AC
	movs r0, 0x2
	b _080C58B6
	.align 2, 0
_080C58A8: .4byte gPlayerParty
_080C58AC:
	cmp r7, 0
	bne _080C58B4
	movs r0, 0
	b _080C58B6
_080C58B4:
	movs r0, 0x1
_080C58B6:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end overworld_poison

	thumb_func_start sub_80C58C0
sub_80C58C0: @ 80C58C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r0, 0
	movs r1, 0
	bl GetMonData
	lsls r0, 16
	str r0, [sp, 0x4]
	lsrs r0, 16
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x27
	bl GetMonData
	adds r7, r0, 0
	movs r6, 0xF
	ands r7, r6
	adds r0, r5, 0
	movs r1, 0x28
	bl GetMonData
	mov r8, r0
	mov r1, r8
	ands r1, r6
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0x29
	bl GetMonData
	mov r9, r0
	mov r3, r9
	ands r3, r6
	mov r9, r3
	adds r0, r5, 0
	movs r1, 0x2A
	bl GetMonData
	mov r10, r0
	ands r0, r6
	mov r10, r0
	adds r0, r5, 0
	movs r1, 0x2B
	bl GetMonData
	adds r4, r0, 0
	ands r4, r6
	adds r0, r5, 0
	movs r1, 0x2C
	bl GetMonData
	adds r2, r0, 0
	ands r2, r6
	mov r1, r8
	mov r3, r9
	eors r1, r3
	mov r8, r1
	mov r0, r8
	muls r0, r7
	movs r1, 0xFF
	ldr r3, [sp]
	ands r3, r1
	eors r0, r3
	eors r4, r2
	mov r1, r10
	muls r1, r4
	ldr r3, [sp, 0x4]
	lsrs r2, r3, 24
	eors r1, r2
	lsls r0, 8
	adds r0, r1
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C58C0

	thumb_func_start sub_80C5964
sub_80C5964: @ 80C5964
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x1
	ldr r3, _080C5980 @ =gUnknown_083D180C
_080C596E:
	lsls r0, r1, 3
	adds r0, r3
	ldrh r0, [r0, 0x4]
	cmp r2, r0
	bcs _080C5984
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	b _080C5990
	.align 2, 0
_080C5980: .4byte gUnknown_083D180C
_080C5984:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xE
	bls _080C596E
	adds r0, r1, 0
_080C5990:
	pop {r1}
	bx r1
	thumb_func_end sub_80C5964

	thumb_func_start sub_80C5994
sub_80C5994: @ 80C5994
	push {r4-r7,lr}
	sub sp, 0x8
	adds r6, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r6, 16
	lsrs r6, 16
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl sub_8090D54
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r6, 0
	bl sub_80C5964
	lsls r0, 24
	ldr r1, _080C5A04 @ =gUnknown_083D180C
	lsrs r0, 21
	adds r0, r1
	ldrh r1, [r0]
	str r1, [sp]
	movs r2, 0
	str r2, [sp, 0x4]
	ldrb r2, [r0, 0x2]
	movs r3, 0
	ldrh r4, [r0, 0x4]
	movs r5, 0
	adds r0, r6, 0
	movs r1, 0
	subs r0, r4
	sbcs r1, r5
	bl __udivdi3
	ldr r2, [sp]
	ldr r3, [sp, 0x4]
	adds r2, r0
	adcs r3, r1
	str r2, [sp]
	str r3, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0
	bl __muldi3
	movs r2, 0xA
	movs r3, 0
	bl __udivdi3
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C5A04: .4byte gUnknown_083D180C
	thumb_func_end sub_80C5994

	thumb_func_start sub_80C5A08
sub_80C5A08: @ 80C5A08
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	ldr r1, _080C5A78 @ =gUnknown_083D188C
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 1
	adds r0, r4, 0
	bl __floatsidf
	cmp r4, 0
	bge _080C5A32
	ldr r2, _080C5A7C @ =0x41f00000
	ldr r3, _080C5A80 @ =0x00000000
	bl __adddf3
_080C5A32:
	ldr r2, _080C5A84 @ =0x40396666
	ldr r3, _080C5A88 @ =0x66666666
	bl __divdf3
	bl __fixunsdfsi
	adds r5, r0, 0
	movs r1, 0xA
	bl __udivsi3
	adds r1, r0, 0
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x8
	bl ConvertIntToDecimalStringN
	adds r6, r0, 0
	mov r1, sp
	bl StringAppend
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C5A78: .4byte gUnknown_083D188C
_080C5A7C: .4byte 0x41f00000
_080C5A80: .4byte 0x00000000
_080C5A84: .4byte 0x40396666
_080C5A88: .4byte 0x66666666
	thumb_func_end sub_80C5A08

	thumb_func_start sub_80C5A8C
sub_80C5A8C: @ 80C5A8C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _080C5AA4 @ =gScriptResult
	ldrh r0, [r1]
	cmp r0, 0xFF
	bne _080C5AA8
	movs r0, 0
	b _080C5B12
	.align 2, 0
_080C5AA4: .4byte gScriptResult
_080C5AA8:
	ldrh r1, [r1]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080C5AD0 @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0x1
	beq _080C5ACA
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, r6
	beq _080C5AD4
_080C5ACA:
	movs r0, 0x1
	b _080C5B12
	.align 2, 0
_080C5AD0: .4byte gPlayerParty
_080C5AD4:
	mov r4, sp
	adds r0, r5, 0
	bl sub_80C58C0
	strh r0, [r4]
	mov r0, sp
	ldrh r1, [r0]
	adds r0, r6, 0
	bl sub_80C5994
	adds r5, r0, 0
	ldrh r1, [r7]
	adds r0, r6, 0
	bl sub_80C5994
	adds r4, r0, 0
	ldr r0, _080C5B0C @ =gStringVar2
	adds r1, r5, 0
	bl sub_80C5A08
	cmp r5, r4
	bls _080C5B10
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r7]
	movs r0, 0x3
	b _080C5B12
	.align 2, 0
_080C5B0C: .4byte gStringVar2
_080C5B10:
	movs r0, 0x2
_080C5B12:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C5A8C

	thumb_func_start sub_80C5B1C
sub_80C5B1C: @ 80C5B1C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	ldrh r1, [r5]
	adds r0, r4, 0
	bl sub_80C5994
	adds r1, r0, 0
	ldr r0, _080C5B58 @ =gStringVar3
	bl sub_80C5A08
	ldr r0, _080C5B5C @ =gStringVar1
	movs r1, 0xB
	muls r1, r4
	ldr r2, _080C5B60 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrh r1, [r5]
	movs r0, 0x81
	lsls r0, 8
	cmp r1, r0
	bne _080C5B6C
	ldr r0, _080C5B64 @ =gStringVar2
	ldr r1, _080C5B68 @ =gOtherText_Marco
	bl StringCopy
	b _080C5B74
	.align 2, 0
_080C5B58: .4byte gStringVar3
_080C5B5C: .4byte gStringVar1
_080C5B60: .4byte gSpeciesNames
_080C5B64: .4byte gStringVar2
_080C5B68: .4byte gOtherText_Marco
_080C5B6C:
	ldr r0, _080C5B7C @ =gStringVar2
	ldr r1, _080C5B80 @ =gSaveBlock2
	bl StringCopy
_080C5B74:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5B7C: .4byte gStringVar2
_080C5B80: .4byte gSaveBlock2
	thumb_func_end sub_80C5B1C

	thumb_func_start sub_80C5B84
sub_80C5B84: @ 80C5B84
	push {lr}
	ldr r0, _080C5B94 @ =0x00004047
	movs r1, 0x81
	lsls r1, 8
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_080C5B94: .4byte 0x00004047
	thumb_func_end sub_80C5B84

	thumb_func_start sub_80C5B98
sub_80C5B98: @ 80C5B98
	push {lr}
	ldr r0, _080C5BB0 @ =0x00004047
	bl GetVarPointer
	adds r1, r0, 0
	movs r0, 0x99
	lsls r0, 1
	bl sub_80C5B1C
	pop {r0}
	bx r0
	.align 2, 0
_080C5BB0: .4byte 0x00004047
	thumb_func_end sub_80C5B98

	thumb_func_start sub_80C5BB4
sub_80C5BB4: @ 80C5BB4
	push {r4,lr}
	ldr r0, _080C5BD4 @ =0x00004047
	bl GetVarPointer
	adds r1, r0, 0
	ldr r4, _080C5BD8 @ =gScriptResult
	movs r0, 0x99
	lsls r0, 1
	bl sub_80C5A8C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5BD4: .4byte 0x00004047
_080C5BD8: .4byte gScriptResult
	thumb_func_end sub_80C5BB4

	thumb_func_start sub_80C5BDC
sub_80C5BDC: @ 80C5BDC
	push {lr}
	ldr r0, _080C5BEC @ =0x0000404f
	movs r1, 0x81
	lsls r1, 8
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_080C5BEC: .4byte 0x0000404f
	thumb_func_end sub_80C5BDC

	thumb_func_start sub_80C5BF0
sub_80C5BF0: @ 80C5BF0
	push {lr}
	ldr r0, _080C5C04 @ =0x0000404f
	bl GetVarPointer
	adds r1, r0, 0
	ldr r0, _080C5C08 @ =0x00000143
	bl sub_80C5B1C
	pop {r0}
	bx r0
	.align 2, 0
_080C5C04: .4byte 0x0000404f
_080C5C08: .4byte 0x00000143
	thumb_func_end sub_80C5BF0

	thumb_func_start sub_80C5C0C
sub_80C5C0C: @ 80C5C0C
	push {r4,lr}
	ldr r0, _080C5C2C @ =0x0000404f
	bl GetVarPointer
	adds r1, r0, 0
	ldr r4, _080C5C30 @ =gScriptResult
	ldr r0, _080C5C34 @ =0x00000143
	bl sub_80C5A8C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5C2C: .4byte 0x0000404f
_080C5C30: .4byte gScriptResult
_080C5C34: .4byte 0x00000143
	thumb_func_end sub_80C5C0C

	thumb_func_start sub_80C5C38
sub_80C5C38: @ 80C5C38
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r7, 0
	add r4, sp, 0x8
	movs r0, 0x1
	strb r0, [r4]
	ldr r1, _080C5CC0 @ =gUnknown_083D188E
	mov r0, sp
	movs r2, 0x7
	bl memcpy
	mov r8, r4
	cmp r6, 0xA
	bhi _080C5CB2
	cmp r5, 0x40
	bhi _080C5CB2
	ldr r0, _080C5CC4 @ =gSaveBlock1
	ldr r1, _080C5CC8 @ =0x00003110
	adds r0, r1
	adds r0, r6, r0
	strb r5, [r0]
	movs r5, 0
_080C5C70:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080C5CCC @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080C5CA2
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _080C5CA2
	mov r1, sp
	adds r0, r1, r6
	ldrb r1, [r0]
	adds r0, r4, 0
	mov r2, r8
	bl SetMonData
	movs r7, 0x1
_080C5CA2:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080C5C70
	cmp r7, 0
	beq _080C5CB2
	ldr r0, _080C5CD0 @ =0x0000083b
	bl FlagSet
_080C5CB2:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5CC0: .4byte gUnknown_083D188E
_080C5CC4: .4byte gSaveBlock1
_080C5CC8: .4byte 0x00003110
_080C5CCC: .4byte gPlayerParty
_080C5CD0: .4byte 0x0000083b
	thumb_func_end sub_80C5C38

	thumb_func_start sub_80C5CD4
sub_80C5CD4: @ 80C5CD4
	push {r4-r7,lr}
	sub sp, 0x28
	adds r7, r0, 0
	ldr r0, _080C5D64 @ =gUnknown_083D1898
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r0, _080C5D68 @ =gUnknown_083D18A0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	mov r1, sp
	ldr r0, _080C5D6C @ =gSpriteTemplate_83D18A8
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldrh r3, [r7]
	lsls r2, r3, 16
	add r0, sp, 0x18
	ldrh r1, [r0, 0x4]
	orrs r1, r2
	str r1, [r0, 0x4]
	mov r1, sp
	movs r6, 0
	strh r3, [r1]
	ldrh r2, [r7, 0x2]
	ldr r5, _080C5D70 @ =0xffff0000
	add r4, sp, 0x20
	ldr r1, [r4, 0x4]
	ands r1, r5
	orrs r1, r2
	str r1, [r4, 0x4]
	mov r1, sp
	strh r2, [r1, 0x2]
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	movs r0, 0x1
	strh r0, [r7, 0xC]
	strh r6, [r7, 0xA]
	strh r6, [r7, 0x8]
	ldrh r0, [r7, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	bics r5, r1
	str r5, [r7, 0x10]
	ldrh r0, [r7, 0x4]
	cmp r0, 0
	bne _080C5D4E
	movs r0, 0x10
	strh r0, [r7, 0x4]
_080C5D4E:
	ldrh r0, [r7, 0x6]
	cmp r0, 0
	bne _080C5D58
	movs r0, 0x14
	strh r0, [r7, 0x6]
_080C5D58:
	ldr r0, _080C5D74 @ =gUnknown_020387EC
	str r7, [r0]
	movs r4, 0
	ldr r5, _080C5D78 @ =gSprites
	b _080C5D94
	.align 2, 0
_080C5D64: .4byte gUnknown_083D1898
_080C5D68: .4byte gUnknown_083D18A0
_080C5D6C: .4byte gSpriteTemplate_83D18A8
_080C5D70: .4byte 0xffff0000
_080C5D74: .4byte gUnknown_020387EC
_080C5D78: .4byte gSprites
_080C5D7C:
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r7, 0x4]
	cmp r4, 0x3
	bhi _080C5D8C
	negs r1, r1
_080C5D8C:
	strh r1, [r0, 0x2E]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080C5D94:
	cmp r4, 0x7
	bhi _080C5DB2
	lsls r1, r4, 5
	adds r1, 0x8
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _080C5D7C
_080C5DB2:
	ldr r1, _080C5DC8 @ =REG_BLDCNT
	movs r0, 0xBF
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0x10
	strh r0, [r1]
	add sp, 0x28
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5DC8: .4byte REG_BLDCNT
	thumb_func_end sub_80C5CD4

	thumb_func_start sub_80C5DCC
sub_80C5DCC: @ 80C5DCC
	push {r4,lr}
	ldr r4, _080C5E10 @ =gUnknown_020387EC
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	cmp r0, 0
	bne _080C5DF0
	ldr r0, [r1, 0x10]
	ldr r2, _080C5E14 @ =0x0000ffff
	movs r1, 0x10
	bl BlendPalettes
	ldr r0, _080C5E18 @ =sub_80C603C
	bl sub_80C61B0
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C5DF0:
	ldr r1, [r4]
	ldrh r0, [r1, 0xA]
	cmp r0, 0x7
	bls _080C5E0A
	ldrh r0, [r1, 0x6]
	ldrh r2, [r1, 0xC]
	adds r0, r2
	movs r2, 0
	strh r0, [r1, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4F
	bgt _080C5E1C
_080C5E0A:
	movs r0, 0
	b _080C5E2E
	.align 2, 0
_080C5E10: .4byte gUnknown_020387EC
_080C5E14: .4byte 0x0000ffff
_080C5E18: .4byte sub_80C603C
_080C5E1C:
	movs r0, 0x50
	strh r0, [r1, 0xC]
	ldr r0, _080C5E34 @ =REG_BLDCNT
	strh r2, [r0]
	adds r0, 0x4
	strh r2, [r0]
	bl ClearGpuRegBits
	movs r0, 0x1
_080C5E2E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C5E34: .4byte REG_BLDCNT
	thumb_func_end sub_80C5DCC

	thumb_func_start sub_80C5E38
sub_80C5E38: @ 80C5E38
	push {r4-r7,lr}
	sub sp, 0x28
	adds r7, r0, 0
	ldr r0, _080C5EC8 @ =gUnknown_083D1898
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r0, _080C5ECC @ =gUnknown_083D18A0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	mov r1, sp
	ldr r0, _080C5ED0 @ =gSpriteTemplate_83D18C0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldrh r3, [r7]
	lsls r2, r3, 16
	add r0, sp, 0x18
	ldrh r1, [r0, 0x4]
	orrs r1, r2
	str r1, [r0, 0x4]
	mov r1, sp
	movs r6, 0
	strh r3, [r1]
	ldrh r2, [r7, 0x2]
	ldr r5, _080C5ED4 @ =0xffff0000
	add r4, sp, 0x20
	ldr r1, [r4, 0x4]
	ands r1, r5
	orrs r1, r2
	str r1, [r4, 0x4]
	mov r1, sp
	strh r2, [r1, 0x2]
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	movs r0, 0x50
	strh r0, [r7, 0xC]
	strh r6, [r7, 0x8]
	strh r6, [r7, 0xA]
	ldrh r0, [r7, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	bics r5, r1
	str r5, [r7, 0x10]
	ldrh r0, [r7, 0x4]
	cmp r0, 0
	bne _080C5EB2
	movs r0, 0x10
	strh r0, [r7, 0x4]
_080C5EB2:
	ldrh r0, [r7, 0x6]
	cmp r0, 0
	bne _080C5EBC
	movs r0, 0x14
	strh r0, [r7, 0x6]
_080C5EBC:
	ldr r0, _080C5ED8 @ =gUnknown_020387EC
	str r7, [r0]
	movs r5, 0
	ldr r6, _080C5EDC @ =gSprites
	b _080C5F4A
	.align 2, 0
_080C5EC8: .4byte gUnknown_083D1898
_080C5ECC: .4byte gUnknown_083D18A0
_080C5ED0: .4byte gSpriteTemplate_83D18C0
_080C5ED4: .4byte 0xffff0000
_080C5ED8: .4byte gUnknown_020387EC
_080C5EDC: .4byte gSprites
_080C5EE0:
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r7, 0x4]
	strh r0, [r1, 0x2E]
	movs r0, 0x1
	strh r0, [r1, 0x30]
	ldr r1, _080C5EF4 @ =gSprites
	b _080C5F2A
	.align 2, 0
_080C5EF4: .4byte gSprites
_080C5EF8:
	lsls r1, r5, 21
	movs r0, 0x80
	lsls r0, 16
	adds r1, r0
	asrs r1, 16
	mov r0, sp
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080C5F6E
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r7, 0x4]
	negs r0, r0
	strh r0, [r1, 0x2E]
	ldr r0, _080C5F88 @ =0x0000ffff
	strh r0, [r1, 0x30]
	ldr r1, _080C5F8C @ =gSprites
	lsls r4, r5, 5
_080C5F2A:
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x8
	movs r2, 0
	strh r1, [r0, 0x32]
	strh r2, [r0, 0x36]
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080C5F4A:
	cmp r5, 0x7
	bhi _080C5F6E
	cmp r5, 0x3
	bhi _080C5EF8
	lsls r4, r5, 5
	adds r1, r4, 0
	subs r1, 0x70
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	bne _080C5EE0
_080C5F6E:
	ldr r1, _080C5F90 @ =REG_BLDCNT
	movs r0, 0xFF
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, _080C5F94 @ =sub_80C6078
	bl sub_80C61B0
	add sp, 0x28
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5F88: .4byte 0x0000ffff
_080C5F8C: .4byte gSprites
_080C5F90: .4byte REG_BLDCNT
_080C5F94: .4byte sub_80C6078
	thumb_func_end sub_80C5E38

	thumb_func_start sub_80C5F98
sub_80C5F98: @ 80C5F98
	push {r4,lr}
	ldr r4, _080C5FB0 @ =gUnknown_020387EC
	ldr r2, [r4]
	ldrh r0, [r2, 0x8]
	cmp r0, 0x1
	beq _080C5FEC
	cmp r0, 0x1
	bgt _080C5FB4
	cmp r0, 0
	beq _080C5FBA
	b _080C602C
	.align 2, 0
_080C5FB0: .4byte gUnknown_020387EC
_080C5FB4:
	cmp r0, 0x2
	beq _080C6008
	b _080C602C
_080C5FBA:
	ldrh r0, [r2, 0xC]
	ldrh r1, [r2, 0x6]
	subs r0, r1
	strh r0, [r2, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bgt _080C6034
	ldr r0, [r2, 0x10]
	ldr r2, _080C5FE4 @ =0x0000ffff
	movs r1, 0x10
	bl BlendPalettes
	ldr r0, _080C5FE8 @ =sub_80C603C
	bl SetHBlankCallback
	ldr r1, [r4]
	movs r0, 0x1
	strh r0, [r1, 0xC]
	b _080C6000
	.align 2, 0
_080C5FE4: .4byte 0x0000ffff
_080C5FE8: .4byte sub_80C603C
_080C5FEC:
	ldrh r0, [r2, 0xA]
	cmp r0, 0x8
	bne _080C6034
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r1, [r4]
_080C6000:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080C6034
_080C6008:
	ldr r0, _080C6030 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldrh r0, [r2]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	ldrh r0, [r0, 0x2]
	bl FreeSpritePaletteByTag
	bl ClearGpuRegBits
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C602C:
	movs r0, 0x1
	b _080C6036
	.align 2, 0
_080C6030: .4byte REG_BLDCNT
_080C6034:
	movs r0, 0
_080C6036:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C5F98

	thumb_func_start sub_80C603C
sub_80C603C: @ 80C603C
	push {lr}
	sub sp, 0x4
	mov r2, sp
	ldr r0, _080C6060 @ =REG_VCOUNT
	ldrh r1, [r0]
	movs r3, 0xFF
	adds r0, r3, 0
	ands r0, r1
	strh r0, [r2]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, 0x50
	bne _080C6068
	ldr r1, _080C6064 @ =REG_BLDCNT
	movs r0, 0x8F
	strh r0, [r1]
	b _080C606C
	.align 2, 0
_080C6060: .4byte REG_VCOUNT
_080C6064: .4byte REG_BLDCNT
_080C6068:
	ldr r0, _080C6074 @ =REG_BLDCNT
	strh r3, [r0]
_080C606C:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C6074: .4byte REG_BLDCNT
	thumb_func_end sub_80C603C

	thumb_func_start sub_80C6078
sub_80C6078: @ 80C6078
	push {lr}
	sub sp, 0x4
	mov r2, sp
	ldr r0, _080C60B0 @ =REG_VCOUNT
	ldrh r1, [r0]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r2]
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _080C60B4 @ =gUnknown_020387EC
	ldr r0, [r0]
	movs r3, 0xC
	ldrsh r2, [r0, r3]
	movs r0, 0x50
	subs r0, r2
	cmp r1, r0
	ble _080C60BC
	mov r0, sp
	ldrh r1, [r0]
	adds r0, r2, 0
	adds r0, 0x50
	cmp r1, r0
	bge _080C60BC
	ldr r1, _080C60B8 @ =REG_BLDY
	movs r0, 0
	b _080C60C0
	.align 2, 0
_080C60B0: .4byte REG_VCOUNT
_080C60B4: .4byte gUnknown_020387EC
_080C60B8: .4byte REG_BLDY
_080C60BC:
	ldr r1, _080C60C8 @ =REG_BLDY
	movs r0, 0x10
_080C60C0:
	strh r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C60C8: .4byte REG_BLDY
	thumb_func_end sub_80C6078

	thumb_func_start sub_80C60CC
sub_80C60CC: @ 80C60CC
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bls _080C611C
	adds r0, r2, 0
	bl DestroySprite
	ldr r4, _080C6124 @ =gUnknown_020387EC
	ldr r1, [r4]
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bne _080C611C
	ldrh r0, [r1]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	ldrh r0, [r0, 0x2]
	bl FreeSpritePaletteByTag
	ldr r0, [r4]
	ldr r0, [r0, 0x10]
	ldr r2, _080C6128 @ =0x0000ffff
	movs r1, 0
	bl BlendPalettes
	ldr r0, _080C612C @ =sub_80C6078
	bl SetHBlankCallback
_080C611C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6124: .4byte gUnknown_020387EC
_080C6128: .4byte 0x0000ffff
_080C612C: .4byte sub_80C6078
	thumb_func_end sub_80C60CC

	thumb_func_start sub_80C6130
sub_80C6130: @ 80C6130
	push {r4,r5,lr}
	adds r2, r0, 0
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080C61AA
	ldr r1, _080C6184 @ =gUnknown_020387EC
	ldr r0, [r1]
	movs r3, 0xC
	ldrsh r4, [r0, r3]
	adds r5, r1, 0
	cmp r4, 0x1
	bne _080C61AA
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	adds r0, 0xF
	lsls r0, 16
	movs r1, 0x87
	lsls r1, 17
	cmp r0, r1
	bhi _080C616C
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
_080C616C:
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080C6188
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r1, r0
	blt _080C6196
	b _080C6194
	.align 2, 0
_080C6184: .4byte gUnknown_020387EC
_080C6188:
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bgt _080C6196
_080C6194:
	strh r4, [r2, 0x36]
_080C6196:
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080C61AA
	ldr r0, [r5]
	ldrh r1, [r0, 0xA]
	adds r1, 0x1
	strh r1, [r0, 0xA]
	ldrh r0, [r2, 0x32]
	strh r0, [r2, 0x20]
_080C61AA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C6130

	thumb_func_start sub_80C61B0
sub_80C61B0: @ 80C61B0
	push {r4-r6,lr}
	ldr r2, _080C61F0 @ =INTR_CHECK
	ldrh r1, [r2]
	movs r5, 0x2
	orrs r1, r5
	strh r1, [r2]
	ldr r3, _080C61F4 @ =REG_DISPSTAT
	ldrh r1, [r3]
	movs r2, 0x10
	orrs r1, r2
	strh r1, [r3]
	ldr r4, _080C61F8 @ =0x04000208
	ldrh r2, [r4]
	movs r6, 0
	strh r6, [r4]
	ldr r3, _080C61FC @ =0x04000200
	ldrh r1, [r3]
	orrs r1, r5
	strh r1, [r3]
	strh r2, [r4]
	ldr r2, _080C6200 @ =gMain
	ldrh r1, [r2, 0x1C]
	orrs r1, r5
	ldrh r3, [r2, 0x1C]
	orrs r1, r6
	strh r1, [r2, 0x1C]
	bl SetHBlankCallback
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C61F0: .4byte INTR_CHECK
_080C61F4: .4byte REG_DISPSTAT
_080C61F8: .4byte 0x04000208
_080C61FC: .4byte 0x04000200
_080C6200: .4byte gMain
	thumb_func_end sub_80C61B0

	thumb_func_start ClearGpuRegBits
ClearGpuRegBits: @ 80C6204
	push {r4,r5,lr}
	ldr r3, _080C6248 @ =INTR_CHECK
	ldrh r1, [r3]
	ldr r2, _080C624C @ =0x0000fffd
	adds r0, r2, 0
	ands r0, r1
	strh r0, [r3]
	ldr r3, _080C6250 @ =REG_DISPSTAT
	ldrh r1, [r3]
	ldr r0, _080C6254 @ =0x0000ffef
	ands r0, r1
	strh r0, [r3]
	ldr r4, _080C6258 @ =0x04000208
	ldrh r3, [r4]
	movs r0, 0
	strh r0, [r4]
	ldr r5, _080C625C @ =0x04000200
	ldrh r1, [r5]
	adds r0, r2, 0
	ands r0, r1
	strh r0, [r5]
	strh r3, [r4]
	ldr r0, _080C6260 @ =gMain
	ldrh r1, [r0, 0x1C]
	ands r2, r1
	ldrh r1, [r0, 0x1C]
	strh r2, [r0, 0x1C]
	movs r0, 0
	bl SetHBlankCallback
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6248: .4byte INTR_CHECK
_080C624C: .4byte 0x0000fffd
_080C6250: .4byte REG_DISPSTAT
_080C6254: .4byte 0x0000ffef
_080C6258: .4byte 0x04000208
_080C625C: .4byte 0x04000200
_080C6260: .4byte gMain
	thumb_func_end ClearGpuRegBits

	thumb_func_start sub_80C6264
sub_80C6264: @ 80C6264
	push {lr}
	ldr r0, _080C6278 @ =gUnknown_0203923C
	ldr r1, _080C627C @ =gMapHeader
	ldr r1, [r1, 0x4]
	bl sub_80BBFD8
	bl sub_80BB5E4
	pop {r0}
	bx r0
	.align 2, 0
_080C6278: .4byte gUnknown_0203923C
_080C627C: .4byte gMapHeader
	thumb_func_end sub_80C6264

	thumb_func_start sub_80C6280
sub_80C6280: @ 80C6280
	push {lr}
	ldr r1, _080C6294 @ =gUnknown_0202FF84
	ldr r0, [r1, 0x4]
	cmp r0, 0x2
	beq _080C62AA
	cmp r0, 0x2
	bgt _080C6298
	cmp r0, 0x1
	beq _080C62A2
	b _080C62BE
	.align 2, 0
_080C6294: .4byte gUnknown_0202FF84
_080C6298:
	cmp r0, 0x3
	beq _080C62AE
	cmp r0, 0x4
	beq _080C62B8
	b _080C62BE
_080C62A2:
	movs r0, 0x8
	str r0, [r1, 0x14]
	movs r0, 0x28
	b _080C62BC
_080C62AA:
	movs r0, 0x8
	b _080C62BA
_080C62AE:
	movs r0, 0x8
	negs r0, r0
	str r0, [r1, 0x14]
	movs r0, 0x18
	b _080C62BC
_080C62B8:
	movs r0, 0x18
_080C62BA:
	str r0, [r1, 0x14]
_080C62BC:
	str r0, [r1, 0x18]
_080C62BE:
	pop {r0}
	bx r0
	thumb_func_end sub_80C6280

	thumb_func_start SetUpFieldMove_SecretPower
SetUpFieldMove_SecretPower: @ 80C62C4
	push {r4,lr}
	bl sub_80BB63C
	ldr r0, _080C6318 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080C636E
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080C636E
	ldr r4, _080C631C @ =gUnknown_0203923C
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80571EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C6330
	bl sub_80C6264
	ldr r1, _080C6320 @ =gUnknown_0300485C
	ldr r0, _080C6324 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _080C6328 @ =gUnknown_03005CE4
	ldr r0, _080C632C @ =sub_80C639C
	b _080C6380
	.align 2, 0
_080C6318: .4byte gScriptResult
_080C631C: .4byte gUnknown_0203923C
_080C6320: .4byte gUnknown_0300485C
_080C6324: .4byte sub_808AB90
_080C6328: .4byte gUnknown_03005CE4
_080C632C: .4byte sub_80C639C
_080C6330:
	adds r0, r4, 0
	bl sub_805720C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C6360
	bl sub_80C6264
	ldr r1, _080C6350 @ =gUnknown_0300485C
	ldr r0, _080C6354 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _080C6358 @ =gUnknown_03005CE4
	ldr r0, _080C635C @ =sub_80C64A8
	b _080C6380
	.align 2, 0
_080C6350: .4byte gUnknown_0300485C
_080C6354: .4byte sub_808AB90
_080C6358: .4byte gUnknown_03005CE4
_080C635C: .4byte sub_80C64A8
_080C6360:
	adds r0, r4, 0
	bl is_tile_x98
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C6372
_080C636E:
	movs r0, 0
	b _080C6384
_080C6372:
	bl sub_80C6264
	ldr r1, _080C638C @ =gUnknown_0300485C
	ldr r0, _080C6390 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _080C6394 @ =gUnknown_03005CE4
	ldr r0, _080C6398 @ =sub_80C660C
_080C6380:
	str r0, [r1]
	movs r0, 0x1
_080C6384:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C638C: .4byte gUnknown_0300485C
_080C6390: .4byte sub_808AB90
_080C6394: .4byte gUnknown_03005CE4
_080C6398: .4byte sub_80C660C
	thumb_func_end SetUpFieldMove_SecretPower

	thumb_func_start sub_80C639C
sub_80C639C: @ 80C639C
	push {lr}
	ldr r1, _080C63B0 @ =gUnknown_0202FF84
	ldr r0, _080C63B4 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080C63B8 @ =gUnknown_081A2CE6
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C63B0: .4byte gUnknown_0202FF84
_080C63B4: .4byte gUnknown_03005CE0
_080C63B8: .4byte gUnknown_081A2CE6
	thumb_func_end sub_80C639C

	thumb_func_start FldEff_UseSecretPowerCave
FldEff_UseSecretPowerCave: @ 80C63BC
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C63E0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C63E4 @ =sub_80C63E8
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C63E0: .4byte gTasks
_080C63E4: .4byte sub_80C63E8
	thumb_func_end FldEff_UseSecretPowerCave

	thumb_func_start sub_80C63E8
sub_80C63E8: @ 80C63E8
	push {lr}
	movs r0, 0xB
	bl FieldEffectActiveListRemove
	movs r0, 0x37
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80C63E8

	thumb_func_start FldEff_SecretPowerCave
FldEff_SecretPowerCave: @ 80C63FC
	push {r4,lr}
	bl sub_80C6280
	ldr r0, _080C643C @ =gSpriteTemplate_83D2614
	ldr r3, _080C6440 @ =gSprites
	ldr r1, _080C6444 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 23
	ldr r4, _080C6448 @ =gUnknown_0202FF84
	ldr r3, [r4, 0x14]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	ldrb r2, [r2]
	ldr r3, [r4, 0x18]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x94
	bl CreateSprite
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C643C: .4byte gSpriteTemplate_83D2614
_080C6440: .4byte gSprites
_080C6444: .4byte gPlayerAvatar
_080C6448: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_SecretPowerCave

	thumb_func_start sub_80C644C
sub_80C644C: @ 80C644C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x83
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080C6464 @ =sub_80C6468
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6464: .4byte sub_80C6468
	thumb_func_end sub_80C644C

	thumb_func_start sub_80C6468
sub_80C6468: @ 80C6468
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0x27
	bgt _080C6488
	adds r0, r2, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080C6490
	bl sub_80BB800
	b _080C6490
_080C6488:
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080C6494 @ =sub_80C6498
	str r0, [r1, 0x1C]
_080C6490:
	pop {r0}
	bx r0
	.align 2, 0
_080C6494: .4byte sub_80C6498
	thumb_func_end sub_80C6468

	thumb_func_start sub_80C6498
sub_80C6498: @ 80C6498
	push {lr}
	movs r1, 0x37
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C6498

	thumb_func_start sub_80C64A8
sub_80C64A8: @ 80C64A8
	push {lr}
	ldr r1, _080C64BC @ =gUnknown_0202FF84
	ldr r0, _080C64C0 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080C64C4 @ =gUnknown_081A2D3E
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C64BC: .4byte gUnknown_0202FF84
_080C64C0: .4byte gUnknown_03005CE0
_080C64C4: .4byte gUnknown_081A2D3E
	thumb_func_end sub_80C64A8

	thumb_func_start FldEff_UseSecretPowerTree
FldEff_UseSecretPowerTree: @ 80C64C8
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C64EC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C64F0 @ =sub_80C64F4
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C64EC: .4byte gTasks
_080C64F0: .4byte sub_80C64F4
	thumb_func_end FldEff_UseSecretPowerTree

	thumb_func_start sub_80C64F4
sub_80C64F4: @ 80C64F4
	push {lr}
	movs r0, 0x1A
	bl FieldEffectActiveListRemove
	movs r0, 0x38
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80C64F4

	thumb_func_start FldEff_SecretPowerTree
FldEff_SecretPowerTree: @ 80C6508
	push {r4,lr}
	ldr r1, _080C6580 @ =gUnknown_0203923C
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x2
	ldrsh r1, [r1, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r2, r0, 0
	ldr r1, _080C6584 @ =0x00000fff
	adds r0, r1, 0
	ands r2, r0
	cmp r2, 0x96
	bne _080C652A
	ldr r1, _080C6588 @ =gUnknown_0202FF84
	movs r0, 0
	str r0, [r1, 0x1C]
_080C652A:
	cmp r2, 0x9C
	bne _080C6534
	ldr r1, _080C6588 @ =gUnknown_0202FF84
	movs r0, 0x2
	str r0, [r1, 0x1C]
_080C6534:
	bl sub_80C6280
	ldr r0, _080C658C @ =gSpriteTemplate_83D262C
	ldr r3, _080C6590 @ =gSprites
	ldr r1, _080C6594 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 23
	ldr r4, _080C6588 @ =gUnknown_0202FF84
	ldr r3, [r4, 0x14]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	ldrb r2, [r2]
	ldr r3, [r4, 0x18]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x94
	bl CreateSprite
	ldr r0, [r4, 0x1C]
	cmp r0, 0x1
	beq _080C6572
	cmp r0, 0x3
	bne _080C6576
_080C6572:
	bl sub_80BB800
_080C6576:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C6580: .4byte gUnknown_0203923C
_080C6584: .4byte 0x00000fff
_080C6588: .4byte gUnknown_0202FF84
_080C658C: .4byte gSpriteTemplate_83D262C
_080C6590: .4byte gSprites
_080C6594: .4byte gPlayerAvatar
	thumb_func_end FldEff_SecretPowerTree

	thumb_func_start sub_80C6598
sub_80C6598: @ 80C6598
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x9B
	bl PlaySE
	ldr r0, _080C65BC @ =gUnknown_0202FF84
	ldr r1, [r0, 0x1C]
	adds r2, r4, 0
	adds r2, 0x2A
	movs r0, 0
	strb r1, [r2]
	strh r0, [r4, 0x2E]
	ldr r0, _080C65C0 @ =sub_80C65C4
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C65BC: .4byte gUnknown_0202FF84
_080C65C0: .4byte sub_80C65C4
	thumb_func_end sub_80C6598

	thumb_func_start sub_80C65C4
sub_80C65C4: @ 80C65C4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	ble _080C65EE
	ldr r0, _080C65F4 @ =gUnknown_0202FF84
	ldr r0, [r0, 0x1C]
	cmp r0, 0
	beq _080C65E2
	cmp r0, 0x2
	bne _080C65E6
_080C65E2:
	bl sub_80BB800
_080C65E6:
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080C65F8 @ =sub_80C65FC
	str r0, [r4, 0x1C]
_080C65EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C65F4: .4byte gUnknown_0202FF84
_080C65F8: .4byte sub_80C65FC
	thumb_func_end sub_80C65C4

	thumb_func_start sub_80C65FC
sub_80C65FC: @ 80C65FC
	push {lr}
	movs r1, 0x38
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C65FC

	thumb_func_start sub_80C660C
sub_80C660C: @ 80C660C
	push {lr}
	ldr r1, _080C6620 @ =gUnknown_0202FF84
	ldr r0, _080C6624 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080C6628 @ =gUnknown_081A2D96
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C6620: .4byte gUnknown_0202FF84
_080C6624: .4byte gUnknown_03005CE0
_080C6628: .4byte gUnknown_081A2D96
	thumb_func_end sub_80C660C

	thumb_func_start FldEff_UseSecretPowerShrub
FldEff_UseSecretPowerShrub: @ 80C662C
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C6650 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C6654 @ =sub_80C6658
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C6650: .4byte gTasks
_080C6654: .4byte sub_80C6658
	thumb_func_end FldEff_UseSecretPowerShrub

	thumb_func_start sub_80C6658
sub_80C6658: @ 80C6658
	push {lr}
	movs r0, 0x1B
	bl FieldEffectActiveListRemove
	movs r0, 0x39
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80C6658

	thumb_func_start FldEff_SecretPowerShrub
FldEff_SecretPowerShrub: @ 80C666C
	push {r4,lr}
	bl sub_80C6280
	ldr r0, _080C66AC @ =gSpriteTemplate_83D2644
	ldr r3, _080C66B0 @ =gSprites
	ldr r1, _080C66B4 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 23
	ldr r4, _080C66B8 @ =gUnknown_0202FF84
	ldr r3, [r4, 0x14]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	ldrb r2, [r2]
	ldr r3, [r4, 0x18]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x94
	bl CreateSprite
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C66AC: .4byte gSpriteTemplate_83D2644
_080C66B0: .4byte gSprites
_080C66B4: .4byte gPlayerAvatar
_080C66B8: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_SecretPowerShrub

	thumb_func_start sub_80C66BC
sub_80C66BC: @ 80C66BC
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xA9
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080C66D4 @ =sub_80C66D8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C66D4: .4byte sub_80C66D8
	thumb_func_end sub_80C66BC

	thumb_func_start sub_80C66D8
sub_80C66D8: @ 80C66D8
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0x27
	bgt _080C66F8
	adds r0, r2, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080C6700
	bl sub_80BB800
	b _080C6700
_080C66F8:
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080C6704 @ =sub_80C6708
	str r0, [r1, 0x1C]
_080C6700:
	pop {r0}
	bx r0
	.align 2, 0
_080C6704: .4byte sub_80C6708
	thumb_func_end sub_80C66D8

	thumb_func_start sub_80C6708
sub_80C6708: @ 80C6708
	push {lr}
	movs r1, 0x39
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C6708

	thumb_func_start FldEff_PCTurnOn
FldEff_PCTurnOn: @ 80C6718
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r0, _080C6758 @ =sub_80C6760
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C675C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	mov r0, sp
	ldrh r0, [r0]
	movs r2, 0
	strh r0, [r1, 0x8]
	ldrh r0, [r4]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C6758: .4byte sub_80C6760
_080C675C: .4byte gTasks
	thumb_func_end FldEff_PCTurnOn

	thumb_func_start sub_80C6760
sub_80C6760: @ 80C6760
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C6788 @ =gTasks + 0x8
	adds r4, r0, r1
	ldrh r0, [r4, 0x4]
	subs r0, 0x4
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bhi _080C682E
	lsls r0, 2
	ldr r1, _080C678C @ =_080C6790
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C6788: .4byte gTasks + 0x8
_080C678C: .4byte _080C6790
	.align 2, 0
_080C6790:
	.4byte _080C67D4
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C67E2
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C67D4
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C67E2
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C6800
_080C67D4:
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0x89
	lsls r2, 2
	b _080C67EE
_080C67E2:
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0x88
	lsls r2, 2
_080C67EE:
	bl MapGridSetMetatileIdAt
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	b _080C682E
_080C6800:
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0x89
	lsls r2, 2
	bl MapGridSetMetatileIdAt
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	movs r0, 0x3D
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
	b _080C6834
_080C682E:
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
_080C6834:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C6760

	thumb_func_start sub_80C683C
sub_80C683C: @ 80C683C
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r0, 0x3
	bl PlaySE
	ldr r0, _080C6874 @ =0x00004054
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _080C6878
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r2, 0xE2
	lsls r2, 4
	bl MapGridSetMetatileIdAt
	b _080C6888
	.align 2, 0
_080C6874: .4byte 0x00004054
_080C6878:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _080C68A0 @ =0x00000e21
	bl MapGridSetMetatileIdAt
_080C6888:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C68A0: .4byte 0x00000e21
	thumb_func_end sub_80C683C

	thumb_func_start sub_80C68A4
sub_80C68A4: @ 80C68A4
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080C68E4 @ =sub_80C68EC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C68E8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xA]
	strh r6, [r1, 0xC]
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x10]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C68E4: .4byte sub_80C68EC
_080C68E8: .4byte gTasks
	thumb_func_end sub_80C68A4

	thumb_func_start sub_80C68EC
sub_80C68EC: @ 80C68EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C690C @ =gTasks + 0x8
	adds r4, r0, r1
	ldrh r1, [r4, 0x6]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0x6
	bne _080C6910
	movs r0, 0
	b _080C6912
	.align 2, 0
_080C690C: .4byte gTasks + 0x8
_080C6910:
	adds r0, r1, 0x1
_080C6912:
	strh r0, [r4, 0x6]
	movs r3, 0x6
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080C6964
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x2
	bne _080C692C
	movs r2, 0
	ldrsh r0, [r4, r2]
	bl sub_80C696C
_080C692C:
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, 0x8]
	ldrh r3, [r4]
	adds r2, r3
	lsls r2, 16
	lsrs r2, 16
	bl MapGridSetMetatileIdAt
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	ldrh r1, [r4, 0x8]
	movs r3, 0x8
	ldrsh r0, [r4, r3]
	cmp r0, 0x3
	bne _080C6960
	adds r0, r5, 0
	bl DestroyTask
	b _080C6964
_080C6960:
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
_080C6964:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C68EC

	thumb_func_start sub_80C696C
sub_80C696C: @ 80C696C
	push {lr}
	lsls r0, 16
	asrs r1, r0, 16
	movs r0, 0xCE
	lsls r0, 2
	cmp r1, r0
	beq _080C6998
	cmp r1, r0
	bgt _080C6988
	movs r0, 0x8A
	lsls r0, 2
	cmp r1, r0
	beq _080C69B0
	b _080C69B6
_080C6988:
	movs r0, 0xCF
	lsls r0, 2
	cmp r1, r0
	beq _080C69A0
	adds r0, 0x4
	cmp r1, r0
	beq _080C69A8
	b _080C69B6
_080C6998:
	movs r0, 0x4A
	bl PlaySE
	b _080C69B6
_080C69A0:
	movs r0, 0x4B
	bl PlaySE
	b _080C69B6
_080C69A8:
	movs r0, 0x4C
	bl PlaySE
	b _080C69B6
_080C69B0:
	movs r0, 0x4E
	bl PlaySE
_080C69B6:
	pop {r0}
	bx r0
	thumb_func_end sub_80C696C

	thumb_func_start FldEff_Nop47
FldEff_Nop47: @ 80C69BC
	movs r0, 0
	bx lr
	thumb_func_end FldEff_Nop47

	thumb_func_start FldEff_Nop48
FldEff_Nop48: @ 80C69C0
	movs r0, 0
	bx lr
	thumb_func_end FldEff_Nop48

	thumb_func_start sub_80C69C4
sub_80C69C4: @ 80C69C4
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x4D
	bl PlaySE
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	ldr r2, _080C6A0C @ =0x00000276
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	subs r6, r4, 0x1
	ldr r2, _080C6A10 @ =0x0000026e
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r6, 0
	bl CurrentMapDrawMetatileAt
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C6A0C: .4byte 0x00000276
_080C6A10: .4byte 0x0000026e
	thumb_func_end sub_80C69C4

	thumb_func_start sub_80C6A14
sub_80C6A14: @ 80C6A14
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C6A44 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0x7
	bne _080C6A48
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	movs r3, 0xC
	ldrsh r1, [r1, r3]
	bl sub_80C69C4
	adds r0, r4, 0
	bl DestroyTask
	b _080C6A4C
	.align 2, 0
_080C6A44: .4byte gTasks
_080C6A48:
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
_080C6A4C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C6A14

	thumb_func_start sub_80C6A54
sub_80C6A54: @ 80C6A54
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	adds r7, r5, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C6A7C
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, r4, 16
	asrs r1, 16
	bl sub_80C69C4
	b _080C6A9E
_080C6A7C:
	cmp r0, 0x2
	bne _080C6A9E
	ldr r0, _080C6AA4 @ =sub_80C6A14
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C6AA8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r7, [r1, 0xA]
	strh r6, [r1, 0xC]
_080C6A9E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6AA4: .4byte sub_80C6A14
_080C6AA8: .4byte gTasks
	thumb_func_end sub_80C6A54

	thumb_func_start sub_80C6AAC
sub_80C6AAC: @ 80C6AAC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C6AE4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x7
	beq _080C6AC8
	b _080C6C26
_080C6AC8:
	ldr r2, _080C6AE8 @ =0xfffffd88
	adds r0, r2, 0
	ldrh r1, [r1, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	bls _080C6ADA
	b _080C6C1E
_080C6ADA:
	lsls r0, 2
	ldr r1, _080C6AEC @ =_080C6AF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C6AE4: .4byte gTasks
_080C6AE8: .4byte 0xfffffd88
_080C6AEC: .4byte _080C6AF0
	.align 2, 0
_080C6AF0:
	.4byte _080C6BE0
	.4byte _080C6BE8
	.4byte _080C6BF0
	.4byte _080C6BF8
	.4byte _080C6C00
	.4byte _080C6C08
	.4byte _080C6C10
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C1E
	.4byte _080C6C18
_080C6BE0:
	movs r0, 0x3E
	bl PlaySE
	b _080C6C1E
_080C6BE8:
	movs r0, 0x3F
	bl PlaySE
	b _080C6C1E
_080C6BF0:
	movs r0, 0x40
	bl PlaySE
	b _080C6C1E
_080C6BF8:
	movs r0, 0x41
	bl PlaySE
	b _080C6C1E
_080C6C00:
	movs r0, 0x42
	bl PlaySE
	b _080C6C1E
_080C6C08:
	movs r0, 0x43
	bl PlaySE
	b _080C6C1E
_080C6C10:
	movs r0, 0x44
	bl PlaySE
	b _080C6C1E
_080C6C18:
	movs r0, 0x45
	bl PlaySE
_080C6C1E:
	adds r0, r4, 0
	bl DestroyTask
	b _080C6C2A
_080C6C26:
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
_080C6C2A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C6AAC

	thumb_func_start sub_80C6C30
sub_80C6C30: @ 80C6C30
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _080C6C5C @ =sub_80C6AAC
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C6C60 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r4, [r1, 0x8]
	strh r0, [r1, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6C5C: .4byte sub_80C6AAC
_080C6C60: .4byte gTasks
	thumb_func_end sub_80C6C30

	thumb_func_start sub_80C6C64
sub_80C6C64: @ 80C6C64
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _080C6C7C
	movs r0, 0xC3
	bl PlaySE
_080C6C7C:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1F
	ble _080C6C8A
	adds r0, r4, 0
	bl DestroySprite
_080C6C8A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C6C64

	thumb_func_start sub_80C6C90
sub_80C6C90: @ 80C6C90
	push {r4,lr}
	sub sp, 0x4
	ldr r3, _080C6D28 @ =gMapObjects
	ldr r2, _080C6D2C @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x4
	bl sub_8060470
	ldr r0, _080C6D30 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x58]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080C6D1E
	ldr r3, _080C6D34 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r4, r2, r3
	movs r0, 0x3E
	adds r0, r4
	mov r12, r0
	ldrb r0, [r0]
	movs r1, 0x2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x50
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r3, 0x1C
	adds r2, r3
	ldr r0, _080C6D38 @ =sub_80C6C64
	str r0, [r2]
	movs r0, 0
	strh r0, [r4, 0x2E]
_080C6D1E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6D28: .4byte gMapObjects
_080C6D2C: .4byte gPlayerAvatar
_080C6D30: .4byte gFieldEffectObjectTemplatePointers
_080C6D34: .4byte gSprites
_080C6D38: .4byte sub_80C6C64
	thumb_func_end sub_80C6C90

	thumb_func_start FldEff_SandPillar
FldEff_SandPillar: @ 80C6D3C
	push {r4,lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r1, _080C6D78 @ =gUnknown_0202FF84
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	str r0, [r1, 0x14]
	movs r3, 0
	ldrsh r0, [r4, r3]
	str r0, [r1, 0x18]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080C6DBC
	cmp r0, 0x2
	bgt _080C6D7C
	cmp r0, 0x1
	beq _080C6D86
	b _080C6E4C
	.align 2, 0
_080C6D78: .4byte gUnknown_0202FF84
_080C6D7C:
	cmp r0, 0x3
	beq _080C6DEC
	cmp r0, 0x4
	beq _080C6E24
	b _080C6E4C
_080C6D86:
	ldr r0, _080C6DB0 @ =gSpriteTemplate_83D26A0
	ldr r3, _080C6DB4 @ =gSprites
	ldr r1, _080C6DB8 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r3, 0x80
	lsls r3, 12
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	adds r2, 0x20
	movs r3, 0
	bl CreateSprite
	b _080C6E4C
	.align 2, 0
_080C6DB0: .4byte gSpriteTemplate_83D26A0
_080C6DB4: .4byte gSprites
_080C6DB8: .4byte gPlayerAvatar
_080C6DBC:
	ldr r0, _080C6DE0 @ =gSpriteTemplate_83D26A0
	ldr r3, _080C6DE4 @ =gSprites
	ldr r1, _080C6DE8 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r3, 0x80
	lsls r3, 12
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	b _080C6E0C
	.align 2, 0
_080C6DE0: .4byte gSpriteTemplate_83D26A0
_080C6DE4: .4byte gSprites
_080C6DE8: .4byte gPlayerAvatar
_080C6DEC:
	ldr r0, _080C6E14 @ =gSpriteTemplate_83D26A0
	ldr r3, _080C6E18 @ =gSprites
	ldr r1, _080C6E1C @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	ldr r3, _080C6E20 @ =0xfff80000
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	adds r2, 0x10
_080C6E0C:
	movs r3, 0x94
	bl CreateSprite
	b _080C6E4C
	.align 2, 0
_080C6E14: .4byte gSpriteTemplate_83D26A0
_080C6E18: .4byte gSprites
_080C6E1C: .4byte gPlayerAvatar
_080C6E20: .4byte 0xfff80000
_080C6E24:
	ldr r0, _080C6E58 @ =gSpriteTemplate_83D26A0
	ldr r3, _080C6E5C @ =gSprites
	ldr r1, _080C6E60 @ =gPlayerAvatar
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r3, 0xC0
	lsls r3, 13
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	adds r2, 0x10
	movs r3, 0x94
	bl CreateSprite
_080C6E4C:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C6E58: .4byte gSpriteTemplate_83D26A0
_080C6E5C: .4byte gSprites
_080C6E60: .4byte gPlayerAvatar
	thumb_func_end FldEff_SandPillar

	thumb_func_start door_restore_tilemap
door_restore_tilemap: @ 80C6E64
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r0, 0x83
	bl PlaySE
	ldr r4, _080C6E90 @ =gUnknown_0202FF84
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	bl MapGridGetMetatileIdAt
	ldr r1, _080C6E94 @ =0x00000286
	cmp r0, r1
	bne _080C6E9C
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	ldr r2, _080C6E98 @ =0x00000e02
	bl MapGridSetMetatileIdAt
	b _080C6EAA
	.align 2, 0
_080C6E90: .4byte gUnknown_0202FF84
_080C6E94: .4byte 0x00000286
_080C6E98: .4byte 0x00000e02
_080C6E9C:
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	movs r2, 0xA1
	lsls r2, 2
	bl MapGridSetMetatileIdAt
_080C6EAA:
	ldr r4, _080C6ED8 @ =gUnknown_0202FF84
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	ldr r2, _080C6EDC @ =0x0000020a
	bl MapGridSetMetatileIdAt
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	bl CurrentMapDrawMetatileAt
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	bl CurrentMapDrawMetatileAt
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080C6EE0 @ =sub_80C6EE4
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6ED8: .4byte gUnknown_0202FF84
_080C6EDC: .4byte 0x0000020a
_080C6EE0: .4byte sub_80C6EE4
	thumb_func_end door_restore_tilemap

	thumb_func_start sub_80C6EE4
sub_80C6EE4: @ 80C6EE4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x11
	bgt _080C6EF8
	adds r0, r1, 0x1
	strh r0, [r5, 0x2E]
	b _080C6F14
_080C6EF8:
	ldr r4, _080C6F1C @ =gUnknown_0202FF84
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	ldr r2, _080C6F20 @ =0x00000e8c
	bl MapGridSetMetatileIdAt
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	bl CurrentMapDrawMetatileAt
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080C6F24 @ =sub_80C6F28
	str r0, [r5, 0x1C]
_080C6F14:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6F1C: .4byte gUnknown_0202FF84
_080C6F20: .4byte 0x00000e8c
_080C6F24: .4byte sub_80C6F28
	thumb_func_end sub_80C6EE4

	thumb_func_start sub_80C6F28
sub_80C6F28: @ 80C6F28
	push {lr}
	movs r1, 0x34
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C6F28

	thumb_func_start sub_80C6F38
sub_80C6F38: @ 80C6F38
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _080C6F70 @ =0x000002f5
	cmp r1, r0
	beq _080C6FE8
	cmp r1, r0
	bgt _080C6F74
	subs r0, 0x17
	cmp r1, r0
	beq _080C6FB0
	adds r0, 0x16
	cmp r1, r0
	beq _080C6FDC
	b _080C6FFA
	.align 2, 0
_080C6F70: .4byte 0x000002f5
_080C6F74:
	ldr r0, _080C6F9C @ =0x000002f6
	cmp r1, r0
	beq _080C6FF4
	adds r0, 0x40
	cmp r1, r0
	bne _080C6FFA
	ldr r0, _080C6FA0 @ =gStringVar1
	movs r1, 0x64
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _080C6FA4 @ =gStringVar2
	ldr r1, _080C6FA8 @ =gSecretBaseText_GoldRank
	bl StringCopy
	ldr r1, _080C6FAC @ =gScriptResult
	movs r0, 0
	b _080C6FF8
	.align 2, 0
_080C6F9C: .4byte 0x000002f6
_080C6FA0: .4byte gStringVar1
_080C6FA4: .4byte gStringVar2
_080C6FA8: .4byte gSecretBaseText_GoldRank
_080C6FAC: .4byte gScriptResult
_080C6FB0:
	ldr r0, _080C6FCC @ =gStringVar1
	movs r1, 0x32
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _080C6FD0 @ =gStringVar2
	ldr r1, _080C6FD4 @ =gSecretBaseText_SilverRank
	bl StringCopy
	ldr r1, _080C6FD8 @ =gScriptResult
	movs r0, 0
	b _080C6FF8
	.align 2, 0
_080C6FCC: .4byte gStringVar1
_080C6FD0: .4byte gStringVar2
_080C6FD4: .4byte gSecretBaseText_SilverRank
_080C6FD8: .4byte gScriptResult
_080C6FDC:
	ldr r1, _080C6FE4 @ =gScriptResult
	movs r0, 0x1
	b _080C6FF8
	.align 2, 0
_080C6FE4: .4byte gScriptResult
_080C6FE8:
	ldr r1, _080C6FF0 @ =gScriptResult
	movs r0, 0x2
	b _080C6FF8
	.align 2, 0
_080C6FF0: .4byte gScriptResult
_080C6FF4:
	ldr r1, _080C7004 @ =gScriptResult
	movs r0, 0x3
_080C6FF8:
	strh r0, [r1]
_080C6FFA:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7004: .4byte gScriptResult
	thumb_func_end sub_80C6F38

	thumb_func_start task50_overworld_posion_effect
task50_overworld_posion_effect: @ 80C7008
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080C702C @ =gTasks + 0x8
	adds r1, r0, r1
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	beq _080C7046
	cmp r0, 0x1
	bgt _080C7030
	cmp r0, 0
	beq _080C7036
	b _080C7062
	.align 2, 0
_080C702C: .4byte gTasks + 0x8
_080C7030:
	cmp r0, 0x2
	beq _080C705A
	b _080C7062
_080C7036:
	ldrh r0, [r1, 0x2]
	adds r0, 0x2
	strh r0, [r1, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080C7062
	b _080C7052
_080C7046:
	ldrh r0, [r1, 0x2]
	subs r0, 0x2
	strh r0, [r1, 0x2]
	lsls r0, 16
	cmp r0, 0
	bne _080C7062
_080C7052:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080C7062
_080C705A:
	adds r0, r2, 0
	bl DestroyTask
	b _080C706C
_080C7062:
	ldr r2, _080C7070 @ =REG_MOSAIC
	ldrh r1, [r1, 0x2]
	lsls r0, r1, 4
	orrs r0, r1
	strh r0, [r2]
_080C706C:
	pop {r0}
	bx r0
	.align 2, 0
_080C7070: .4byte REG_MOSAIC
	thumb_func_end task50_overworld_posion_effect

	thumb_func_start overworld_posion_effect
overworld_posion_effect: @ 80C7074
	push {lr}
	movs r0, 0x4F
	bl PlaySE
	ldr r0, _080C7088 @ =task50_overworld_posion_effect
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080C7088: .4byte task50_overworld_posion_effect
	thumb_func_end overworld_posion_effect

	thumb_func_start c3_80A0DD8_is_running
c3_80A0DD8_is_running: @ 80C708C
	push {lr}
	ldr r0, _080C709C @ =task50_overworld_posion_effect
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080C709C: .4byte task50_overworld_posion_effect
	thumb_func_end c3_80A0DD8_is_running

	thumb_func_start sub_80C70A0
sub_80C70A0: @ 80C70A0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C70B4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080C70B8 @ =sub_80C70BC
	str r0, [r1]
	bx lr
	.align 2, 0
_080C70B4: .4byte gTasks
_080C70B8: .4byte sub_80C70BC
	thumb_func_end sub_80C70A0

	thumb_func_start sub_80C70BC
sub_80C70BC: @ 80C70BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C7120 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C7124 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080C70E8
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080C711A
_080C70E8:
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059D08
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r1, _080C7128 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C712C @ =sub_80C7130
	str r1, [r0]
_080C711A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7120: .4byte gPlayerAvatar
_080C7124: .4byte gMapObjects
_080C7128: .4byte gTasks
_080C712C: .4byte sub_80C7130
	thumb_func_end sub_80C70BC

	thumb_func_start sub_80C7130
sub_80C7130: @ 80C7130
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C7184 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C7188 @ =gMapObjects
	adds r5, r0, r1
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080C7194
	ldr r1, _080C718C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0xA]
	adds r1, r0, 0x1
	strh r1, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bgt _080C7190
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	b _080C7194
	.align 2, 0
_080C7184: .4byte gPlayerAvatar
_080C7188: .4byte gMapObjects
_080C718C: .4byte gTasks
_080C7190:
	ldr r0, _080C719C @ =sub_80C71A0
	str r0, [r2]
_080C7194:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C719C: .4byte sub_80C71A0
	thumb_func_end sub_80C7130

	thumb_func_start sub_80C71A0
sub_80C71A0: @ 80C71A0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80597D0
	lsls r0, 24
	lsrs r0, 24
	bl SetPlayerAvatarTransitionFlags
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C71A0

	thumb_func_start sub_80C71C4
sub_80C71C4: @ 80C71C4
	push {lr}
	ldr r0, _080C71D4 @ =sub_80C70A0
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080C71D4: .4byte sub_80C70A0
	thumb_func_end sub_80C71C4

	thumb_func_start sub_80C71D8
sub_80C71D8: @ 80C71D8
	push {r4,r5,lr}
	ldr r0, _080C722C @ =gUnknown_083D2878
	bl LoadSpritePalette
	ldr r0, _080C7230 @ =gSpriteTemplate_83D2894
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080C7238
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r1, _080C7234 @ =gSprites
	adds r4, r0, r1
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r0, 0x10
	movs r1, 0xD
	bl sub_8060388
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x20]
	adds r0, 0x10
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	adds r0, 0x2
	strh r0, [r4, 0x22]
	adds r0, r5, 0
	b _080C723A
	.align 2, 0
_080C722C: .4byte gUnknown_083D2878
_080C7230: .4byte gSpriteTemplate_83D2894
_080C7234: .4byte gSprites
_080C7238:
	movs r0, 0x40
_080C723A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80C71D8

	thumb_func_start sub_80C7240
sub_80C7240: @ 80C7240
	push {r4-r7,lr}
	ldr r4, _080C7274 @ =gSprites
	adds r7, r4, 0
	movs r6, 0
	movs r5, 0x3F
_080C724A:
	adds r0, r7, 0
	adds r0, 0x14
	adds r0, r6, r0
	ldr r1, [r0]
	ldr r0, _080C7278 @ =gSpriteTemplate_83D2894
	cmp r1, r0
	bne _080C7264
	adds r0, r4, 0
	bl FreeSpritePalette
	adds r0, r4, 0
	bl DestroySprite
_080C7264:
	adds r4, 0x44
	adds r6, 0x44
	subs r5, 0x1
	cmp r5, 0
	bge _080C724A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7274: .4byte gSprites
_080C7278: .4byte gSpriteTemplate_83D2894
	thumb_func_end sub_80C7240

	thumb_func_start sub_80C727C
sub_80C727C: @ 80C727C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x78
	bl __modsi3
	cmp r0, 0
	bne _080C7290
	movs r0, 0x1
	negs r0, r0
	b _080C72A2
_080C7290:
	adds r0, r4, 0
	movs r1, 0xA
	bl __modsi3
	cmp r0, 0x4
	ble _080C72A0
	movs r0, 0
	b _080C72A2
_080C72A0:
	movs r0, 0x1
_080C72A2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C727C

	thumb_func_start sub_80C72A8
sub_80C72A8: @ 80C72A8
	push {lr}
	adds r0, 0x78
	movs r1, 0xB4
	bl __modsi3
	cmp r0, 0
	beq _080C72BA
	movs r0, 0
	b _080C72BE
_080C72BA:
	movs r0, 0x1
	negs r0, r0
_080C72BE:
	pop {r1}
	bx r1
	thumb_func_end sub_80C72A8

	thumb_func_start sub_80C72C4
sub_80C72C4: @ 80C72C4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080C7364 @ =gTasks + 0x8
	adds r5, r1, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	adds r0, 0x1E
	bl sub_80C72A8
	ldr r4, _080C7368 @ =gSaveBlock1
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	lsls r0, 18
	movs r3, 0xC0
	lsls r3, 10
	orrs r0, r3
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x1
	movs r3, 0x3
	bl sub_805BD90
	movs r3, 0
	ldrsh r0, [r5, r3]
	bl sub_80C72A8
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	lsls r0, 17
	ldr r3, _080C736C @ =0xfffd0000
	adds r0, r3
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x2
	movs r3, 0
	bl sub_805BD90
	movs r1, 0
	ldrsh r0, [r5, r1]
	bl sub_80C72A8
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	movs r4, 0
	movs r3, 0x3
	negs r3, r3
	lsls r0, 18
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x3
	bl sub_805BD90
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	ldr r1, _080C7370 @ =0x75300000
	cmp r0, r1
	bne _080C7346
	strh r4, [r5]
_080C7346:
	movs r3, 0
	ldrsh r0, [r5, r3]
	bl sub_80C727C
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl SetCameraPanning
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7364: .4byte gTasks + 0x8
_080C7368: .4byte gSaveBlock1
_080C736C: .4byte 0xfffd0000
_080C7370: .4byte 0x75300000
	thumb_func_end sub_80C72C4

	thumb_func_start sub_80C7374
sub_80C7374: @ 80C7374
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r3, r0, 3
	ldr r4, _080C73B4 @ =gTasks + 0x8
	adds r7, r3, r4
	ldrh r1, [r7]
	adds r1, 0x1
	strh r1, [r7]
	ldrh r0, [r7, 0x4]
	adds r0, 0x1
	strh r0, [r7, 0x4]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x5
	ble _080C73A4
	movs r0, 0
	strh r0, [r7]
	ldrh r0, [r7, 0x2]
	adds r0, 0x1
	strh r0, [r7, 0x2]
_080C73A4:
	ldrh r0, [r7, 0x2]
	cmp r0, 0x13
	bne _080C73B8
	adds r0, r2, 0
	bl DestroyTask
	b _080C746A
	.align 2, 0
_080C73B4: .4byte gTasks + 0x8
_080C73B8:
	ldr r2, _080C7474 @ =gUnknown_083D294C
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2
	bne _080C73D4
	adds r0, r4, 0
	subs r0, 0x8
	adds r0, r3, r0
	ldr r1, _080C7478 @ =sub_80C7484
	str r1, [r0]
_080C73D4:
	movs r4, 0x2
	ldrsh r0, [r7, r4]
	adds r0, r2
	movs r5, 0
	ldrsb r5, [r0, r5]
	lsls r5, 16
	lsrs r5, 16
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	bl sub_80C727C
	adds r1, r0, 0
	lsls r5, 16
	asrs r5, 16
	lsls r1, 16
	asrs r1, 16
	adds r0, r5, 0
	bl SetCameraPanning
	movs r4, 0x4
	ldrsh r0, [r7, r4]
	adds r0, 0x1E
	bl sub_80C72A8
	ldr r6, _080C747C @ =gSaveBlock1
	ldrb r1, [r6, 0x5]
	ldrb r2, [r6, 0x4]
	movs r3, 0x3
	subs r3, r5
	lsls r3, 16
	asrs r3, 16
	lsls r0, 18
	movs r4, 0xC0
	lsls r4, 10
	orrs r0, r4
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x1
	bl sub_805BD90
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	bl sub_80C72A8
	ldrb r1, [r6, 0x5]
	ldrb r2, [r6, 0x4]
	negs r3, r5
	lsls r3, 16
	asrs r3, 16
	lsls r0, 17
	ldr r4, _080C7480 @ =0xfffd0000
	adds r0, r4
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x2
	bl sub_805BD90
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	bl sub_80C72A8
	ldrb r1, [r6, 0x5]
	ldrb r2, [r6, 0x4]
	movs r4, 0x3
	negs r4, r4
	adds r3, r4, 0
	subs r3, r5
	lsls r3, 16
	asrs r3, 16
	lsls r0, 18
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x3
	bl sub_805BD90
_080C746A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7474: .4byte gUnknown_083D294C
_080C7478: .4byte sub_80C7484
_080C747C: .4byte gSaveBlock1
_080C7480: .4byte 0xfffd0000
	thumb_func_end sub_80C7374

	thumb_func_start sub_80C7484
sub_80C7484: @ 80C7484
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080C74C4 @ =gTasks + 0x8
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080C74B4
	movs r0, 0
	strh r0, [r2]
	ldrh r0, [r2, 0x2]
	adds r0, 0x1
	strh r0, [r2, 0x2]
_080C74B4:
	ldrh r0, [r2, 0x2]
	cmp r0, 0x13
	bne _080C74C8
	adds r0, r3, 0
	bl DestroyTask
	b _080C7516
	.align 2, 0
_080C74C4: .4byte gTasks + 0x8
_080C74C8:
	ldr r1, _080C7524 @ =gUnknown_083D294C
	movs r3, 0x2
	ldrsh r0, [r2, r3]
	adds r0, r1
	movs r1, 0
	mov r8, r1
	movs r6, 0
	ldrsb r6, [r0, r6]
	adds r0, r6, 0
	bl SetCameraPanning
	ldr r5, _080C7528 @ =gSaveBlock1
	ldrb r1, [r5, 0x5]
	ldrb r2, [r5, 0x4]
	movs r3, 0x3
	subs r3, r6
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	bl sub_805BD90
	ldrb r1, [r5, 0x5]
	ldrb r2, [r5, 0x4]
	negs r3, r6
	mov r4, r8
	subs r4, 0x3
	str r4, [sp]
	movs r0, 0x2
	bl sub_805BD90
	ldrb r1, [r5, 0x5]
	ldrb r2, [r5, 0x4]
	subs r4, r6
	mov r3, r8
	str r3, [sp]
	movs r0, 0x3
	adds r3, r4, 0
	bl sub_805BD90
_080C7516:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7524: .4byte gUnknown_083D294C
_080C7528: .4byte gSaveBlock1
	thumb_func_end sub_80C7484

	thumb_func_start sub_80C752C
sub_80C752C: @ 80C752C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C7550 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080C7546
	b _080C7698
_080C7546:
	lsls r0, 2
	ldr r1, _080C7554 @ =_080C7558
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C7550: .4byte gTasks + 0x8
_080C7554: .4byte _080C7558
	.align 2, 0
_080C7558:
	.4byte _080C7570
	.4byte _080C75A8
	.4byte _080C75C4
	.4byte _080C7610
	.4byte _080C7634
	.4byte _080C7652
_080C7570:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5A
	beq _080C7580
	b _080C7698
_080C7580:
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0
	strh r0, [r4, 0x2]
	ldr r0, _080C75A4 @ =sub_80C72C4
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x4]
	movs r0, 0x1
	strh r0, [r4]
	movs r0, 0x31
	bl PlaySE
	b _080C7698
	.align 2, 0
_080C75A4: .4byte sub_80C72C4
_080C75A8:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x96
	bne _080C7698
	bl pal_fill_black
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r4]
	b _080C7698
_080C75C4:
	ldrh r0, [r4, 0x2]
	adds r3, r0, 0x1
	strh r3, [r4, 0x2]
	ldr r0, _080C7608 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080C7698
	lsls r1, r3, 16
	movs r0, 0x96
	lsls r0, 17
	cmp r1, r0
	ble _080C7698
	strh r2, [r4, 0x2]
	ldrb r0, [r4, 0x4]
	bl DestroyTask
	ldr r0, _080C760C @ =sub_80C7374
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x6]
	movs r0, 0x3
	strh r0, [r4]
	movs r0, 0x32
	bl PlaySE
	b _080C7698
	.align 2, 0
_080C7608: .4byte gPaletteFade
_080C760C: .4byte sub_80C7374
_080C7610:
	ldr r2, _080C7630 @ =gTasks
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r5, [r0, 0x4]
	cmp r5, 0
	bne _080C7698
	bl InstallCameraPanAheadCallback
	strh r5, [r4, 0x2]
	movs r0, 0x4
	strh r0, [r4]
	b _080C7698
	.align 2, 0
_080C7630: .4byte gTasks
_080C7634:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5A
	bne _080C7698
	movs r0, 0x33
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r0, 0x5
	strh r0, [r4]
	b _080C7698
_080C7652:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	bne _080C7698
	movs r2, 0x82
	lsls r2, 2
	movs r0, 0xB
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	movs r2, 0x84
	lsls r2, 2
	movs r0, 0xB
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	movs r2, 0x86
	lsls r2, 2
	movs r0, 0xB
	movs r1, 0xA
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x34
	bl PlaySE
	adds r0, r5, 0
	bl DestroyTask
	bl ScriptContext2_Disable
_080C7698:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C752C

	thumb_func_start sub_80C76A0
sub_80C76A0: @ 80C76A0
	push {lr}
	sub sp, 0x4
	ldr r2, _080C76E8 @ =0x0000020d
	movs r0, 0xB
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _080C76EC @ =0x00000215
	movs r0, 0xB
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	ldr r2, _080C76F0 @ =0x0000021d
	movs r0, 0xB
	movs r1, 0xA
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	bl ScriptContext2_Enable
	movs r0, 0
	str r0, [sp]
	ldr r1, _080C76F4 @ =gPlttBufferFaded
	ldr r2, _080C76F8 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	ldr r0, _080C76FC @ =sub_80C752C
	movs r1, 0xA
	bl CreateTask
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C76E8: .4byte 0x0000020d
_080C76EC: .4byte 0x00000215
_080C76F0: .4byte 0x0000021d
_080C76F4: .4byte gPlttBufferFaded
_080C76F8: .4byte 0x01000100
_080C76FC: .4byte sub_80C752C
	thumb_func_end sub_80C76A0

	thumb_func_start sub_80C7700
sub_80C7700: @ 80C7700
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _080C774C @ =sub_80C752C
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _080C7744
	ldr r4, _080C7750 @ =gSaveBlock1
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	movs r3, 0x3
	bl sub_805BD90
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	movs r5, 0x3
	negs r5, r5
	str r5, [sp]
	movs r0, 0x2
	movs r3, 0
	bl sub_805BD90
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	str r6, [sp]
	movs r0, 0x3
	adds r3, r5, 0
	bl sub_805BD90
_080C7744:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C774C: .4byte sub_80C752C
_080C7750: .4byte gSaveBlock1
	thumb_func_end sub_80C7700

	thumb_func_start sub_80C7754
sub_80C7754: @ 80C7754
	push {r4-r6,lr}
	sub sp, 0xC
	mov r4, sp
	adds r4, 0x5
	mov r5, sp
	adds r5, 0x6
	add r6, sp, 0x8
	add r0, sp, 0x4
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_810D9EC
	lsls r0, 24
	cmp r0, 0
	bne _080C7796
	add r0, sp, 0x4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r4, r1]
	movs r2, 0x1
	negs r2, r2
	movs r3, 0
	ldrsb r3, [r5, r3]
	movs r4, 0
	ldrsb r4, [r6, r4]
	str r4, [sp]
	bl warp1_set
	movs r0, 0x1
	b _080C7798
_080C7796:
	movs r0, 0
_080C7798:
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C7754

	thumb_func_start sub_80C77A0
sub_80C77A0: @ 80C77A0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C77CC @ =gTasks + 0x8
	adds r4, r0, r1
	ldr r0, _080C77D0 @ =0x000040b4
	bl GetVarPointer
	adds r6, r0, 0
	ldr r7, _080C77D4 @ =gSaveBlock1 + 0x4
	movs r0, 0
	ldrsh r2, [r4, r0]
	cmp r2, 0x1
	beq _080C77FC
	cmp r2, 0x1
	bgt _080C77D8
	cmp r2, 0
	beq _080C77E2
	b _080C7896
	.align 2, 0
_080C77CC: .4byte gTasks + 0x8
_080C77D0: .4byte 0x000040b4
_080C77D4: .4byte gSaveBlock1 + 0x4
_080C77D8:
	cmp r2, 0x2
	beq _080C783E
	cmp r2, 0x3
	beq _080C7878
	b _080C7896
_080C77E2:
	ldr r0, _080C77F8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C7896
	strh r2, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r4]
	b _080C7896
	.align 2, 0
_080C77F8: .4byte gPaletteFade
_080C77FC:
	ldr r0, _080C7830 @ =gMain
	ldrh r1, [r0, 0x2E]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080C780A
	strh r2, [r4, 0x2]
_080C780A:
	ldrb r1, [r7, 0x1]
	ldrb r2, [r7]
	movs r0, 0xFF
	bl sub_80A212C
	lsls r0, 24
	cmp r0, 0
	beq _080C7896
	movs r0, 0x1
	bl sub_810D9B0
	cmp r0, 0x1
	bne _080C783A
	ldrh r0, [r6]
	cmp r0, 0x2
	bne _080C7834
	movs r0, 0x9
	b _080C7836
	.align 2, 0
_080C7830: .4byte gMain
_080C7834:
	movs r0, 0xA
_080C7836:
	strh r0, [r6]
	b _080C7846
_080C783A:
	movs r0, 0x2
	strh r0, [r4]
_080C783E:
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C784C
_080C7846:
	movs r0, 0x3
	strh r0, [r4]
	b _080C7896
_080C784C:
	ldrh r0, [r6]
	cmp r0, 0x2
	bne _080C7860
	ldrb r1, [r7, 0x1]
	ldrb r2, [r7]
	ldr r3, _080C785C @ =gUnknown_083D295F
	b _080C7866
	.align 2, 0
_080C785C: .4byte gUnknown_083D295F
_080C7860:
	ldrb r1, [r7, 0x1]
	ldrb r2, [r7]
	ldr r3, _080C7874 @ =gUnknown_083D2961
_080C7866:
	movs r0, 0xFF
	bl exec_movement
	movs r0, 0x1
	strh r0, [r4]
	b _080C7896
	.align 2, 0
_080C7874: .4byte gUnknown_083D2961
_080C7878:
	ldr r0, _080C789C @ =0x00004001
	bl FlagReset
	movs r0, 0x80
	lsls r0, 7
	bl FlagReset
	movs r0, 0
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	bl sp13E_warp_to_last_warp
	adds r0, r5, 0
	bl DestroyTask
_080C7896:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C789C: .4byte 0x00004001
	thumb_func_end sub_80C77A0

	thumb_func_start sub_80C78A0
sub_80C78A0: @ 80C78A0
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080C78F4 @ =SpriteCallbackDummy
	movs r0, 0
	str r0, [sp]
	movs r0, 0x8C
	movs r2, 0x70
	movs r3, 0x50
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C78F8 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r4, r1, r2
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080C78FC @ =0x000040b4
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _080C7900
	movs r0, 0x4
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	b _080C7912
	.align 2, 0
_080C78F4: .4byte SpriteCallbackDummy
_080C78F8: .4byte gSprites
_080C78FC: .4byte 0x000040b4
_080C7900:
	movs r0, 0x3
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_080C7912:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C78A0

	thumb_func_start sub_80C791C
sub_80C791C: @ 80C791C
	push {lr}
	bl sub_80C78A0
	ldr r2, _080C794C @ =gMapObjects
	ldr r0, _080C7950 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	bl pal_fill_black
	ldr r0, _080C7954 @ =sub_80C77A0
	movs r1, 0x50
	bl CreateTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_080C794C: .4byte gMapObjects
_080C7950: .4byte gPlayerAvatar
_080C7954: .4byte sub_80C77A0
	thumb_func_end sub_80C791C

	thumb_func_start sub_80C7958
sub_80C7958: @ 80C7958
	push {lr}
	ldr r0, _080C7990 @ =0x0000082d
	bl FlagSet
	ldr r0, _080C7994 @ =0x00004001
	bl FlagSet
	movs r0, 0x80
	lsls r0, 7
	bl FlagSet
	ldr r0, _080C7998 @ =gSaveBlock1
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	movs r2, 0x5
	ldrsb r2, [r0, r2]
	movs r3, 0x1
	negs r3, r3
	movs r0, 0
	bl saved_warp2_set
	bl sub_80C7754
	bl sub_8080F9C
	pop {r0}
	bx r0
	.align 2, 0
_080C7990: .4byte 0x0000082d
_080C7994: .4byte 0x00004001
_080C7998: .4byte gSaveBlock1
	thumb_func_end sub_80C7958

	thumb_func_start GetCurrentMapRotatingGatePuzzleType
GetCurrentMapRotatingGatePuzzleType: @ 80C799C
	push {lr}
	ldr r0, _080C79B0 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0x86
	lsls r0, 1
	cmp r1, r0
	bne _080C79B4
	movs r0, 0x1
	b _080C79C6
	.align 2, 0
_080C79B0: .4byte gSaveBlock1
_080C79B4:
	ldr r0, _080C79C0 @ =0x0000081d
	cmp r1, r0
	beq _080C79C4
	movs r0, 0
	b _080C79C6
	.align 2, 0
_080C79C0: .4byte 0x0000081d
_080C79C4:
	movs r0, 0x2
_080C79C6:
	pop {r1}
	bx r1
	thumb_func_end GetCurrentMapRotatingGatePuzzleType

	thumb_func_start sub_80C79CC
sub_80C79CC: @ 80C79CC
	push {r4-r6,lr}
	movs r0, 0x80
	lsls r0, 7
	bl GetVarPointer
	adds r5, r0, 0
	movs r3, 0
	ldr r4, _080C7A00 @ =gUnknown_02038804
	ldrb r0, [r4]
	cmp r3, r0
	bge _080C79F8
	ldr r6, _080C7A04 @ =gUnknown_02038800
_080C79E4:
	adds r2, r5, r3
	ldr r1, [r6]
	lsls r0, r3, 3
	adds r0, r1
	ldrb r0, [r0, 0x5]
	strb r0, [r2]
	adds r3, 0x1
	ldrb r0, [r4]
	cmp r3, r0
	blt _080C79E4
_080C79F8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7A00: .4byte gUnknown_02038804
_080C7A04: .4byte gUnknown_02038800
	thumb_func_end sub_80C79CC

	thumb_func_start sub_80C7A08
sub_80C7A08: @ 80C7A08
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x80
	lsls r0, 7
	bl GetVarPointer
	adds r0, r4
	ldrb r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C7A08

	thumb_func_start sub_80C7A24
sub_80C7A24: @ 80C7A24
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x80
	lsls r0, 7
	bl GetVarPointer
	adds r0, r4
	strb r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7A24

	thumb_func_start sub_80C7A44
sub_80C7A44: @ 80C7A44
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_80C7A08
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, 0x1
	bne _080C7A68
	cmp r1, 0
	beq _080C7A64
	subs r0, r1, 0x1
	lsls r0, 24
	b _080C7A72
_080C7A64:
	movs r1, 0x3
	b _080C7A74
_080C7A68:
	adds r1, 0x1
	lsls r1, 24
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r1
_080C7A72:
	lsrs r1, r0, 24
_080C7A74:
	adds r0, r5, 0
	bl sub_80C7A24
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7A44

	thumb_func_start sub_80C7A80
sub_80C7A80: @ 80C7A80
	push {lr}
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0x1
	beq _080C7A94
	cmp r0, 0x1
	ble _080C7AC8
	cmp r0, 0x2
	beq _080C7AAC
	b _080C7AC8
_080C7A94:
	ldr r1, _080C7AA0 @ =gUnknown_02038800
	ldr r0, _080C7AA4 @ =gUnknown_083D2964
	str r0, [r1]
	ldr r1, _080C7AA8 @ =gUnknown_02038804
	movs r0, 0x7
	b _080C7AB6
	.align 2, 0
_080C7AA0: .4byte gUnknown_02038800
_080C7AA4: .4byte gUnknown_083D2964
_080C7AA8: .4byte gUnknown_02038804
_080C7AAC:
	ldr r1, _080C7ACC @ =gUnknown_02038800
	ldr r0, _080C7AD0 @ =gUnknown_083D299C
	str r0, [r1]
	ldr r1, _080C7AD4 @ =gUnknown_02038804
	movs r0, 0xE
_080C7AB6:
	strb r0, [r1]
	movs r1, 0
	ldr r3, _080C7AD8 @ =gUnknown_020387F0
	movs r2, 0x40
_080C7ABE:
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, 0x1
	cmp r1, 0xD
	bls _080C7ABE
_080C7AC8:
	pop {r0}
	bx r0
	.align 2, 0
_080C7ACC: .4byte gUnknown_02038800
_080C7AD0: .4byte gUnknown_083D299C
_080C7AD4: .4byte gUnknown_02038804
_080C7AD8: .4byte gUnknown_020387F0
	thumb_func_end sub_80C7A80

	thumb_func_start sub_80C7ADC
sub_80C7ADC: @ 80C7ADC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	ldr r2, _080C7B9C @ =gSaveBlock1
	ldrh r1, [r2]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r3, r0, 16
	adds r1, 0x11
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldrh r1, [r2, 0x2]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r2, r0, 16
	adds r1, 0xE
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	movs r5, 0
	ldr r0, _080C7BA0 @ =gUnknown_02038804
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080C7B8C
	lsls r0, r2, 16
	asrs r7, r0, 16
	lsls r0, r3, 16
	asrs r6, r0, 16
_080C7B28:
	ldr r0, _080C7BA4 @ =gUnknown_02038800
	ldr r0, [r0]
	lsls r1, r5, 3
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x7
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r1, 0x2]
	adds r0, 0x7
	lsls r0, 16
	asrs r1, r0, 16
	cmp r7, r1
	bgt _080C7B7E
	mov r3, r8
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, r1
	blt _080C7B7E
	lsls r0, r2, 16
	asrs r1, r0, 16
	cmp r6, r1
	bgt _080C7B7E
	mov r2, r9
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, r1
	blt _080C7B7E
	ldr r0, _080C7BA8 @ =gUnknown_020387F0
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0x40
	bne _080C7B7E
	ldr r3, [sp]
	lsls r1, r3, 16
	mov r0, r10
	lsls r2, r0, 16
	adds r0, r5, 0
	asrs r1, 16
	asrs r2, 16
	bl sub_80C7BAC
	strb r0, [r4]
_080C7B7E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C7BA0 @ =gUnknown_02038804
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080C7B28
_080C7B8C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7B9C: .4byte gSaveBlock1
_080C7BA0: .4byte gUnknown_02038804
_080C7BA4: .4byte gUnknown_02038800
_080C7BA8: .4byte gUnknown_020387F0
	thumb_func_end sub_80C7ADC

	thumb_func_start sub_80C7BAC
sub_80C7BAC: @ 80C7BAC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r0, _080C7BDC @ =gUnknown_02038800
	lsls r1, r6, 3
	ldr r0, [r0]
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _080C7BD4
	cmp r0, 0x4
	bne _080C7BE4
_080C7BD4:
	mov r1, sp
	ldr r0, _080C7BE0 @ =gSpriteTemplate_83D60A4
	b _080C7BE8
	.align 2, 0
_080C7BDC: .4byte gUnknown_02038800
_080C7BE0: .4byte gSpriteTemplate_83D60A4
_080C7BE4:
	mov r1, sp
	ldr r0, _080C7C7C @ =gSpriteTemplate_83D608C
_080C7BE8:
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	mov r2, sp
	ldrb r0, [r4, 0x4]
	movs r3, 0x98
	lsls r3, 5
	adds r1, r3, 0
	adds r0, r1
	strh r0, [r2]
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0x94
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080C7C84
	ldrh r0, [r4]
	adds r0, 0x7
	ldrh r1, [r4, 0x2]
	adds r1, 0x7
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r2, _080C7C80 @ =gSprites
	adds r4, r2
	strh r6, [r4, 0x2E]
	movs r2, 0x3E
	adds r2, r4
	mov r12, r2
	ldrb r2, [r2]
	movs r3, 0x2
	orrs r2, r3
	mov r3, r12
	strb r2, [r3]
	lsls r0, 16
	asrs r0, 16
	lsls r2, r7, 16
	asrs r2, 16
	adds r0, r2
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	mov r3, r8
	lsls r2, r3, 16
	asrs r2, 16
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_8060388
	adds r0, r4, 0
	bl sub_80C7D14
	adds r0, r6, 0
	bl sub_80C7A08
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	adds r0, r5, 0
	b _080C7C86
	.align 2, 0
_080C7C7C: .4byte gSpriteTemplate_83D608C
_080C7C80: .4byte gSprites
_080C7C84:
	movs r0, 0x40
_080C7C86:
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C7BAC

	thumb_func_start sub_80C7C94
sub_80C7C94: @ 80C7C94
	push {r4-r7,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0x30]
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r6, 0x32]
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	adds r0, r6, 0
	bl sub_80C7D14
	cmp r5, 0x1
	bne _080C7CDA
	adds r0, r4, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _080C7CCA
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
_080C7CCA:
	movs r0, 0x30
	bl PlaySE
	adds r0, r6, 0
	adds r1, r4, 0
	bl StartSpriteAffineAnim
	b _080C7D08
_080C7CDA:
	cmp r5, 0x2
	bne _080C7D08
	adds r0, r7, 0
	adds r0, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _080C7CFA
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
_080C7CFA:
	movs r0, 0x30
	bl PlaySE
	adds r0, r6, 0
	adds r1, r4, 0
	bl StartSpriteAffineAnim
_080C7D08:
	movs r0, 0
	strh r0, [r6, 0x30]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7C94

	thumb_func_start sub_80C7D14
sub_80C7D14: @ 80C7D14
	push {r4-r6,lr}
	mov r12, r0
	mov r4, r12
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r5, 0x5
	negs r5, r5
	ands r5, r0
	strb r5, [r4]
	mov r0, r12
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	adds r0, 0x28
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldr r0, _080C7DA8 @ =gSpriteCoordOffsetX
	adds r2, r1
	ldrh r0, [r0]
	adds r2, r0
	lsls r2, 16
	mov r3, r12
	ldrh r1, [r3, 0x26]
	ldrh r0, [r3, 0x22]
	adds r1, r0
	mov r0, r12
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r3, _080C7DAC @ =gSpriteCoordOffsetY
	adds r0, r1
	ldrh r3, [r3]
	adds r0, r3
	lsls r0, 16
	movs r3, 0x80
	lsls r3, 15
	adds r1, r2, r3
	lsrs r1, 16
	lsrs r6, r0, 16
	adds r0, r3
	lsrs r3, r0, 16
	asrs r2, 16
	cmp r2, 0xFF
	bgt _080C7D7A
	lsls r0, r1, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _080C7D82
_080C7D7A:
	movs r1, 0x4
	adds r0, r5, 0
	orrs r0, r1
	strb r0, [r4]
_080C7D82:
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0xAF
	bgt _080C7D96
	lsls r0, r3, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _080C7DA2
_080C7D96:
	mov r0, r12
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080C7DA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7DA8: .4byte gSpriteCoordOffsetX
_080C7DAC: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_80C7D14

	thumb_func_start LoadRotatingGatePics
LoadRotatingGatePics: @ 80C7DB0
	push {lr}
	ldr r0, _080C7DBC @ =gRotatingGatesGraphicsTable
	bl LoadSpriteSheets
	pop {r0}
	bx r0
	.align 2, 0
_080C7DBC: .4byte gRotatingGatesGraphicsTable
	thumb_func_end LoadRotatingGatePics

	thumb_func_start sub_80C7DC0
sub_80C7DC0: @ 80C7DC0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, _080C7DF4 @ =gSaveBlock1
	ldrh r1, [r2]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	adds r1, 0x11
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldrh r1, [r2, 0x2]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r1, 0xE
	lsls r1, 16
	lsrs r7, r1, 16
	movs r6, 0
	b _080C7E66
	.align 2, 0
_080C7DF4: .4byte gSaveBlock1
_080C7DF8:
	ldr r0, _080C7E7C @ =gUnknown_02038800
	ldr r0, [r0]
	lsls r1, r6, 3
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x7
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r1, 0x2]
	adds r0, 0x7
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080C7E80 @ =gUnknown_020387F0
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, 0x40
	beq _080C7E64
	lsls r0, r2, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r2, r0, 16
	cmp r0, r1
	blt _080C7E44
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	cmp r2, r0
	bgt _080C7E44
	lsls r0, r3, 16
	mov r2, r8
	lsls r1, r2, 16
	asrs r2, r0, 16
	cmp r0, r1
	blt _080C7E44
	lsls r0, r7, 16
	asrs r0, 16
	cmp r2, r0
	ble _080C7E64
_080C7E44:
	ldr r0, _080C7E80 @ =gUnknown_020387F0
	adds r5, r6, r0
	ldrb r0, [r5]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080C7E84 @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	movs r0, 0x40
	strb r0, [r5]
_080C7E64:
	adds r6, 0x1
_080C7E66:
	ldr r0, _080C7E88 @ =gUnknown_02038804
	ldrb r0, [r0]
	cmp r6, r0
	blt _080C7DF8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7E7C: .4byte gUnknown_02038800
_080C7E80: .4byte gUnknown_020387F0
_080C7E84: .4byte gSprites
_080C7E88: .4byte gUnknown_02038804
	thumb_func_end sub_80C7DC0

	thumb_func_start sub_80C7E8C
sub_80C7E8C: @ 80C7E8C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r1, 0x1
	bne _080C7EAC
	ldr r0, _080C7EA8 @ =gUnknown_083D611C
	mov r10, r0
	b _080C7EB8
	.align 2, 0
_080C7EA8: .4byte gUnknown_083D611C
_080C7EAC:
	cmp r1, 0x2
	beq _080C7EB4
_080C7EB0:
	movs r0, 0
	b _080C7F48
_080C7EB4:
	ldr r1, _080C7F58 @ =gUnknown_083D60FC
	mov r10, r1
_080C7EB8:
	adds r0, r4, 0
	bl sub_80C7A08
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	ldr r0, _080C7F5C @ =gUnknown_02038800
	ldr r1, [r0]
	lsls r0, r4, 3
	adds r0, r1
	ldrb r2, [r0, 0x4]
	ldrh r1, [r0]
	adds r1, 0x7
	ldrh r0, [r0, 0x2]
	adds r0, 0x7
	movs r3, 0
	lsls r2, 3
	str r2, [sp, 0x4]
	lsls r1, 16
	asrs r1, 16
	mov r9, r1
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
_080C7EE8:
	movs r6, 0
	ldr r2, [sp]
	adds r7, r2, r3
	lsls r0, r3, 1
	adds r5, r7, 0
	ldr r1, [sp, 0x4]
	adds r0, r1
	ldr r2, _080C7F60 @ =gUnknown_083D613C
	adds r4, r0, r2
_080C7EFA:
	adds r0, r5, 0
	cmp r5, 0
	bge _080C7F02
	adds r0, r7, 0x3
_080C7F02:
	asrs r0, 2
	lsls r0, 2
	subs r0, r5, r0
	lsls r0, 1
	adds r0, r6
	lsls r0, 24
	lsrs r1, r0, 24
	ldrb r0, [r4]
	cmp r0, 0
	beq _080C7F38
	lsls r1, 2
	add r1, r10
	movs r0, 0
	ldrsb r0, [r1, r0]
	add r0, r9
	ldrb r1, [r1, 0x1]
	lsls r1, 24
	asrs r1, 24
	add r1, r8
	str r3, [sp, 0x8]
	bl MapGridIsImpassableAt
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [sp, 0x8]
	cmp r0, 0x1
	beq _080C7EB0
_080C7F38:
	adds r4, 0x1
	adds r6, 0x1
	cmp r6, 0x1
	ble _080C7EFA
	adds r3, 0x1
	cmp r3, 0x3
	ble _080C7EE8
	movs r0, 0x1
_080C7F48:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C7F58: .4byte gUnknown_083D60FC
_080C7F5C: .4byte gUnknown_02038800
_080C7F60: .4byte gUnknown_083D613C
	thumb_func_end sub_80C7E8C

	thumb_func_start sub_80C7F64
sub_80C7F64: @ 80C7F64
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	lsls r4, 24
	lsrs r5, r4, 24
	lsrs r4, 25
	movs r0, 0x1
	ands r5, r0
	adds r0, r6, 0
	bl sub_80C7A08
	subs r4, r0
	adds r1, r4, 0x4
	adds r0, r1, 0
	cmp r1, 0
	bge _080C7F8A
	adds r0, r4, 0x7
_080C7F8A:
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	ldr r1, _080C7FB0 @ =gUnknown_02038800
	ldr r2, [r1]
	lsls r1, r6, 3
	adds r1, r2
	ldrb r1, [r1, 0x4]
	ldr r2, _080C7FB4 @ =gUnknown_083D613C
	lsls r0, 24
	asrs r0, 23
	adds r0, r5
	lsls r1, 3
	adds r0, r1
	adds r0, r2
	ldrb r0, [r0]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080C7FB0: .4byte gUnknown_02038800
_080C7FB4: .4byte gUnknown_083D613C
	thumb_func_end sub_80C7F64

	thumb_func_start sub_80C7FB8
sub_80C7FB8: @ 80C7FB8
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080C7FE4 @ =gUnknown_020387F0
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, 0x40
	beq _080C7FDC
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080C7FE8 @ =gSprites
	adds r4, r0
	strh r1, [r4, 0x30]
	adds r0, r3, 0
	bl sub_80C7A08
	strh r0, [r4, 0x32]
_080C7FDC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7FE4: .4byte gUnknown_020387F0
_080C7FE8: .4byte gSprites
	thumb_func_end sub_80C7FB8

	thumb_func_start sub_80C7FEC
sub_80C7FEC: @ 80C7FEC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	cmp r0, 0x2
	bne _080C8008
	ldr r3, _080C8004 @ =gUnknown_083D60BC
	b _080C802A
	.align 2, 0
_080C8004: .4byte gUnknown_083D60BC
_080C8008:
	cmp r0, 0x1
	bne _080C8014
	ldr r3, _080C8010 @ =gUnknown_083D60CC
	b _080C802A
	.align 2, 0
_080C8010: .4byte gUnknown_083D60CC
_080C8014:
	cmp r0, 0x3
	bne _080C8020
	ldr r3, _080C801C @ =gUnknown_083D60DC
	b _080C802A
	.align 2, 0
_080C801C: .4byte gUnknown_083D60DC
_080C8020:
	cmp r3, 0x4
	beq _080C8028
	movs r0, 0xFF
	b _080C8038
_080C8028:
	ldr r3, _080C803C @ =gUnknown_083D60EC
_080C802A:
	lsls r0, r2, 16
	lsls r1, 16
	asrs r1, 16
	asrs r0, 14
	adds r0, r1
	adds r0, r3, r0
	ldrb r0, [r0]
_080C8038:
	pop {r1}
	bx r1
	.align 2, 0
_080C803C: .4byte gUnknown_083D60EC
	thumb_func_end sub_80C7FEC

	thumb_func_start sub_80C8040
sub_80C8040: @ 80C8040
	push {lr}
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0
	beq _080C8052
	bl sub_80C7A80
	bl sub_80C79CC
_080C8052:
	pop {r0}
	bx r0
	thumb_func_end sub_80C8040

	thumb_func_start RotatingGatePuzzleCameraUpdate
RotatingGatePuzzleCameraUpdate: @ 80C8058
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0
	beq _080C807A
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	bl sub_80C7ADC
	bl sub_80C7DC0
_080C807A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end RotatingGatePuzzleCameraUpdate

	thumb_func_start sub_80C8080
sub_80C8080: @ 80C8080
	push {lr}
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0
	beq _080C809A
	bl LoadRotatingGatePics
	bl sub_80C7A80
	movs r0, 0
	movs r1, 0
	bl sub_80C7ADC
_080C809A:
	pop {r0}
	bx r0
	thumb_func_end sub_80C8080

	thumb_func_start CheckForRotatingGatePuzzleCollision
CheckForRotatingGatePuzzleCollision: @ 80C80A0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0
	bne _080C80D4
	b _080C8172
_080C80C2:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80C7FB8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80C7A44
	b _080C8172
_080C80D4:
	movs r6, 0
	ldr r0, _080C8160 @ =gUnknown_02038804
	ldrb r0, [r0]
	cmp r6, r0
	bge _080C8172
	lsls r0, r4, 16
	asrs r7, r0, 16
_080C80E2:
	ldr r0, _080C8164 @ =gUnknown_02038800
	ldr r1, [r0]
	lsls r0, r6, 3
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x7
	ldrh r0, [r0, 0x2]
	adds r0, 0x7
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	subs r0, r4, 0x2
	cmp r0, r7
	bgt _080C8168
	adds r0, r4, 0x1
	cmp r7, r0
	bgt _080C8168
	lsls r0, r2, 16
	asrs r3, r0, 16
	subs r1, r3, 0x2
	mov r2, r8
	lsls r0, r2, 16
	asrs r2, r0, 16
	cmp r1, r2
	bgt _080C8168
	adds r0, r3, 0x1
	cmp r2, r0
	bgt _080C8168
	subs r1, r7, r4
	adds r1, 0x2
	subs r2, r3
	adds r2, 0x2
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	mov r0, r9
	bl sub_80C7FEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080C8168
	lsrs r5, r0, 4
	movs r1, 0xF
	ands r1, r0
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80C7F64
	cmp r0, 0
	beq _080C8168
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80C7E8C
	cmp r0, 0
	bne _080C80C2
	movs r0, 0x1
	b _080C8174
	.align 2, 0
_080C8160: .4byte gUnknown_02038804
_080C8164: .4byte gUnknown_02038800
_080C8168:
	adds r6, 0x1
	ldr r0, _080C8180 @ =gUnknown_02038804
	ldrb r0, [r0]
	cmp r6, r0
	blt _080C80E2
_080C8172:
	movs r0, 0
_080C8174:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C8180: .4byte gUnknown_02038804
	thumb_func_end CheckForRotatingGatePuzzleCollision

	thumb_func_start GetSafariZoneFlag
GetSafariZoneFlag: @ 80C8184
	push {lr}
	ldr r0, _080C8194 @ =0x0000082c
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080C8194: .4byte 0x0000082c
	thumb_func_end GetSafariZoneFlag

	thumb_func_start SetSafariZoneFlag
SetSafariZoneFlag: @ 80C8198
	push {lr}
	ldr r0, _080C81A4 @ =0x0000082c
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080C81A4: .4byte 0x0000082c
	thumb_func_end SetSafariZoneFlag

	thumb_func_start ResetSafariZoneFlag
ResetSafariZoneFlag: @ 80C81A8
	push {lr}
	ldr r0, _080C81B4 @ =0x0000082c
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080C81B4: .4byte 0x0000082c
	thumb_func_end ResetSafariZoneFlag

	thumb_func_start sub_80C81B8
sub_80C81B8: @ 80C81B8
	push {lr}
	movs r0, 0x11
	bl sav12_xor_increment
	bl SetSafariZoneFlag
	bl sub_80C82D8
	ldr r1, _080C81DC @ =gUnknown_02038808
	movs r0, 0x1E
	strb r0, [r1]
	ldr r1, _080C81E0 @ =gUnknown_0203880A
	movs r2, 0xFA
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080C81DC: .4byte gUnknown_02038808
_080C81E0: .4byte gUnknown_0203880A
	thumb_func_end sub_80C81B8

	thumb_func_start sub_80C81E4
sub_80C81E4: @ 80C81E4
	push {lr}
	bl ResetSafariZoneFlag
	bl sub_80C82D8
	ldr r1, _080C8200 @ =gUnknown_02038808
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080C8204 @ =gUnknown_0203880A
	movs r0, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080C8200: .4byte gUnknown_02038808
_080C8204: .4byte gUnknown_0203880A
	thumb_func_end sub_80C81E4

	thumb_func_start safari_step
safari_step: @ 80C8208
	push {lr}
	bl GetSafariZoneFlag
	cmp r0, 0
	beq _080C8224
	bl sub_80C8508
	ldr r1, _080C8228 @ =gUnknown_0203880A
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _080C822C
_080C8224:
	movs r0, 0
	b _080C8234
	.align 2, 0
_080C8228: .4byte gUnknown_0203880A
_080C822C:
	ldr r0, _080C8238 @ =gUnknown_081C3448
	bl ScriptContext1_SetupScript
	movs r0, 0x1
_080C8234:
	pop {r1}
	bx r1
	.align 2, 0
_080C8238: .4byte gUnknown_081C3448
	thumb_func_end safari_step

	thumb_func_start sub_80C823C
sub_80C823C: @ 80C823C
	push {lr}
	ldr r0, _080C8248 @ =gUnknown_081C342D
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C8248: .4byte gUnknown_081C342D
	thumb_func_end sub_80C823C

	thumb_func_start sub_80C824C
sub_80C824C: @ 80C824C
	push {lr}
	ldr r0, _080C8260 @ =gUnknown_02038808
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C8268
	ldr r0, _080C8264 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	b _080C82B0
	.align 2, 0
_080C8260: .4byte gUnknown_02038808
_080C8264: .4byte c2_exit_to_overworld_2_switch
_080C8268:
	ldr r0, _080C8288 @ =gUnknown_02024D26
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _080C829C
	ldr r0, _080C828C @ =gUnknown_081C340A
	bl ScriptContext2_RunNewScript
	bl warp_in
	ldr r1, _080C8290 @ =gUnknown_0300485C
	ldr r0, _080C8294 @ =sub_8080E44
	str r0, [r1]
	ldr r0, _080C8298 @ =CB2_LoadMap
	bl SetMainCallback2
	b _080C82B0
	.align 2, 0
_080C8288: .4byte gUnknown_02024D26
_080C828C: .4byte gUnknown_081C340A
_080C8290: .4byte gUnknown_0300485C
_080C8294: .4byte sub_8080E44
_080C8298: .4byte CB2_LoadMap
_080C829C:
	cmp r0, 0x7
	bne _080C82B0
	ldr r0, _080C82B4 @ =gUnknown_081C3459
	bl ScriptContext1_SetupScript
	bl ScriptContext1_Stop
	ldr r0, _080C82B8 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_080C82B0:
	pop {r0}
	bx r0
	.align 2, 0
_080C82B4: .4byte gUnknown_081C3459
_080C82B8: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80C824C

	thumb_func_start sub_80C82BC
sub_80C82BC: @ 80C82BC
	push {lr}
	lsls r0, 24
	lsrs r0, 20
	ldr r1, _080C82D4 @ =gUnknown_0203880C
	adds r0, r1
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080C82D4: .4byte gUnknown_0203880C
	thumb_func_end sub_80C82BC

	thumb_func_start sub_80C82D8
sub_80C82D8: @ 80C82D8
	push {lr}
	ldr r0, _080C82E8 @ =gUnknown_0203880C
	movs r1, 0
	movs r2, 0xA0
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080C82E8: .4byte gUnknown_0203880C
	thumb_func_end sub_80C82D8

	thumb_func_start sub_80C82EC
sub_80C82EC: @ 80C82EC
	push {r4-r6,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r3, 0
	adds r5, r4, 0
	ldr r4, _080C8344 @ =gSaveBlock1
_080C8302:
	ldr r1, _080C8348 @ =gUnknown_0203880C
	lsls r0, r3, 4
	adds r2, r0, r1
	movs r1, 0x5
	ldrsb r1, [r4, r1]
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080C8358
	mov r0, sp
	movs r6, 0
	ldrsh r1, [r2, r6]
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r1, r0
	bne _080C8358
	movs r0, 0x2
	ldrsh r1, [r2, r0]
	movs r6, 0
	ldrsh r0, [r5, r6]
	cmp r1, r0
	bne _080C8358
	ldr r0, _080C834C @ =gScriptResult
	strh r3, [r0]
	ldr r1, _080C8350 @ =gUnknown_083F7EB8
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _080C8354 @ =gStringVar1
	bl StringCopy
	b _080C836A
	.align 2, 0
_080C8344: .4byte gSaveBlock1
_080C8348: .4byte gUnknown_0203880C
_080C834C: .4byte gScriptResult
_080C8350: .4byte gUnknown_083F7EB8
_080C8354: .4byte gStringVar1
_080C8358:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bls _080C8302
	ldr r1, _080C8374 @ =gScriptResult
	ldr r2, _080C8378 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
_080C836A:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C8374: .4byte gScriptResult
_080C8378: .4byte 0x0000ffff
	thumb_func_end sub_80C82EC

	thumb_func_start sub_80C837C
sub_80C837C: @ 80C837C
	push {r4-r7,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	movs r5, 0
	adds r6, r4, 0
	ldr r0, _080C83E8 @ =gSaveBlock1
	movs r7, 0x5
	ldrsb r7, [r0, r7]
	mov r4, sp
	ldr r0, _080C83EC @ =gUnknown_0203880C
	mov r12, r0
_080C839C:
	lsls r0, r5, 4
	mov r1, r12
	adds r2, r0, r1
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r7, r0
	bne _080C83F4
	ldrh r0, [r4]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4]
	adds r3, r6, 0
	ldrh r0, [r3]
	ldrh r1, [r2, 0x2]
	subs r0, r1
	strh r0, [r3]
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _080C83C8
	negs r0, r0
	strh r0, [r4]
_080C83C8:
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _080C83D4
	negs r0, r0
	strh r0, [r3]
_080C83D4:
	movs r2, 0
	ldrsh r0, [r4, r2]
	movs r2, 0
	ldrsh r1, [r6, r2]
	adds r0, r1
	cmp r0, 0x5
	bgt _080C83F4
	ldr r0, _080C83F0 @ =gScriptResult
	strh r5, [r0]
	b _080C8406
	.align 2, 0
_080C83E8: .4byte gSaveBlock1
_080C83EC: .4byte gUnknown_0203880C
_080C83F0: .4byte gScriptResult
_080C83F4:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x9
	bls _080C839C
	ldr r1, _080C8410 @ =gScriptResult
	ldr r2, _080C8414 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
_080C8406:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8410: .4byte gScriptResult
_080C8414: .4byte 0x0000ffff
	thumb_func_end sub_80C837C

	thumb_func_start unref_sub_80C8418
unref_sub_80C8418: @ 80C8418
	push {lr}
	bl sub_80C82EC
	ldr r2, _080C8434 @ =gScriptResult
	ldrh r1, [r2]
	ldr r0, _080C8438 @ =0x0000ffff
	cmp r1, r0
	beq _080C8440
	adds r0, r1, 0
	lsls r0, 4
	ldr r1, _080C843C @ =gUnknown_02038814
	adds r0, r1
	b _080C8442
	.align 2, 0
_080C8434: .4byte gScriptResult
_080C8438: .4byte 0x0000ffff
_080C843C: .4byte gUnknown_02038814
_080C8440:
	movs r0, 0
_080C8442:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80C8418

	thumb_func_start sub_80C8448
sub_80C8448: @ 80C8448
	push {lr}
	bl sub_80C837C
	ldr r2, _080C8464 @ =gScriptResult
	ldrh r1, [r2]
	ldr r0, _080C8468 @ =0x0000ffff
	cmp r1, r0
	beq _080C8470
	adds r0, r1, 0
	lsls r0, 4
	ldr r1, _080C846C @ =gUnknown_02038814
	adds r0, r1
	b _080C8472
	.align 2, 0
_080C8464: .4byte gScriptResult
_080C8468: .4byte 0x0000ffff
_080C846C: .4byte gUnknown_02038814
_080C8470:
	movs r0, 0
_080C8472:
	pop {r1}
	bx r1
	thumb_func_end sub_80C8448

	thumb_func_start sub_80C8478
sub_80C8478: @ 80C8478
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	movs r2, 0
	ldr r3, _080C84E8 @ =gUnknown_0203880C
	mov r6, sp
	adds r6, 0x2
	ldr r7, _080C84EC @ =gSaveBlock1
	movs r1, 0x8
	adds r1, r3
	mov r9, r1
	movs r4, 0xFF
	lsls r4, 3
	adds r1, r7, r4
	lsrs r0, 21
	adds r0, r1
	mov r8, r0
_080C84A0:
	lsls r5, r2, 4
	adds r4, r5, r3
	movs r0, 0x4
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bne _080C84F0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C84F0
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C84F0
	mov r0, sp
	adds r1, r6, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldrb r0, [r7, 0x5]
	strb r0, [r4, 0x4]
	mov r3, r9
	adds r2, r5, r3
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0x64
	strb r0, [r4, 0x5]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4]
	ldrh r0, [r6]
	strh r0, [r4, 0x2]
	b _080C84FA
	.align 2, 0
_080C84E8: .4byte gUnknown_0203880C
_080C84EC: .4byte gSaveBlock1
_080C84F0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x9
	bls _080C84A0
_080C84FA:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8478

	thumb_func_start sub_80C8508
sub_80C8508: @ 80C8508
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080C8538 @ =gUnknown_0203880C
_080C850E:
	lsls r0, r4, 4
	adds r1, r0, r5
	ldrb r0, [r1, 0x5]
	cmp r0, 0
	beq _080C8528
	subs r0, 0x1
	strb r0, [r1, 0x5]
	lsls r0, 24
	cmp r0, 0
	bne _080C8528
	adds r0, r4, 0
	bl sub_80C82BC
_080C8528:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _080C850E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C8538: .4byte gUnknown_0203880C
	thumb_func_end sub_80C8508

	thumb_func_start unref_sub_80C853C
unref_sub_80C853C: @ 80C853C
	push {lr}
	bl sub_80C82EC
	ldr r3, _080C8564 @ =gScriptResult
	ldrh r1, [r3]
	ldr r0, _080C8568 @ =0x0000ffff
	cmp r1, r0
	beq _080C8574
	ldr r0, _080C856C @ =gStringVar2
	ldr r2, _080C8570 @ =gUnknown_0203880C
	lsls r1, 4
	adds r1, r2
	ldrb r1, [r1, 0x5]
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x1
	b _080C8576
	.align 2, 0
_080C8564: .4byte gScriptResult
_080C8568: .4byte 0x0000ffff
_080C856C: .4byte gStringVar2
_080C8570: .4byte gUnknown_0203880C
_080C8574:
	movs r0, 0
_080C8576:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80C853C

	thumb_func_start sub_80C857C
sub_80C857C: @ 80C857C
	push {r4,r5,lr}
	adds r2, r0, 0
	lsls r4, r1, 16
	lsrs r4, 16
	ldr r5, _080C85A8 @ =0x0201e000
	adds r0, r5, 0
	adds r1, r2, 0
	adds r2, r4, 0
	bl memcpy
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl SendBlock
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C85A8: .4byte 0x0201e000
	thumb_func_end sub_80C857C

	thumb_func_start sub_80C85AC
sub_80C85AC: @ 80C85AC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 17
	lsls r1, r0
	lsrs r4, r1, 24
	bl GetBlockRecievedStatus
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _080C85D0
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	movs r0, 0x1
	b _080C85D2
_080C85D0:
	movs r0, 0
_080C85D2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C85AC

	thumb_func_start sub_80C85D8
sub_80C85D8: @ 80C85D8
	push {r4,lr}
	movs r4, 0
_080C85DC:
	bl GetBlockRecievedStatus
	lsls r0, 24
	lsrs r0, 24
	asrs r0, r4
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080C85F2
	movs r0, 0
	b _080C85FE
_080C85F2:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C85DC
	bl ResetBlockReceivedFlags
	movs r0, 0x1
_080C85FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C85D8

	thumb_func_start sub_80C8604
sub_80C8604: @ 80C8604
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r5, _080C8638 @ =gTasks
	ldr r6, _080C863C @ =sub_80C8644
	ldr r4, _080C8640 @ =gBlockRecvBuffer
	movs r3, 0xFF
_080C8614:
	lsls r0, r1, 8
	adds r0, r4
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _080C8614
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r5
	movs r1, 0
	strh r1, [r0, 0x8]
	str r6, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C8638: .4byte gTasks
_080C863C: .4byte sub_80C8644
_080C8640: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8604

	thumb_func_start sub_80C8644
sub_80C8644: @ 80C8644
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C8658 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080C865C @ =sub_80C8660
	str r0, [r1]
	bx lr
	.align 2, 0
_080C8658: .4byte gTasks
_080C865C: .4byte sub_80C8660
	thumb_func_end sub_80C8644

	thumb_func_start sub_80C8660
sub_80C8660: @ 80C8660
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C8694 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C868E
	bl GetMultiplayerId
	ldr r1, _080C8698 @ =gUnknown_02038695
	strb r0, [r1]
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080C868E
	ldr r1, _080C869C @ =gUnknown_0203869A
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
_080C868E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8694: .4byte gReceivedRemoteLinkPlayers
_080C8698: .4byte gUnknown_02038695
_080C869C: .4byte gUnknown_0203869A
	thumb_func_end sub_80C8660

	thumb_func_start sub_80C86A0
sub_80C86A0: @ 80C86A0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0x2
	ldrb r0, [r4]
	cmp r0, 0xFC
	bne _080C86B6
	ldrb r0, [r4, 0x1]
	cmp r0, 0x15
	bne _080C86B6
	movs r0, 0x2
	b _080C872C
_080C86B6:
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bhi _080C872A
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080C872A
_080C86CA:
	ldrb r1, [r4]
	adds r0, r1, 0
	adds r0, 0x45
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x33
	bls _080C871E
	adds r0, r1, 0
	adds r0, 0x5F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bls _080C871E
	adds r0, r1, 0
	cmp r0, 0
	beq _080C871E
	cmp r0, 0xAD
	beq _080C871E
	cmp r0, 0xB8
	beq _080C871E
	cmp r0, 0xAB
	beq _080C871E
	cmp r0, 0xAC
	beq _080C871E
	cmp r0, 0xB5
	beq _080C871E
	cmp r0, 0xB6
	beq _080C871E
	cmp r0, 0xBA
	beq _080C871E
	cmp r0, 0xAE
	beq _080C871E
	cmp r0, 0xB0
	beq _080C871E
	cmp r0, 0xB1
	beq _080C871E
	cmp r0, 0xB2
	beq _080C871E
	cmp r0, 0xB3
	beq _080C871E
	cmp r0, 0xB1
	bne _080C8728
_080C871E:
	adds r4, 0x1
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _080C86CA
	b _080C872A
_080C8728:
	movs r5, 0x1
_080C872A:
	adds r0, r5, 0
_080C872C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80C86A0

	thumb_func_start sub_80C8734
sub_80C8734: @ 80C8734
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080C8768 @ =gTasks
	lsls r5, r0, 2
	adds r0, r5, r0
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C876C
	cmp r0, 0x1
	beq _080C87D0
	movs r0, 0
	strh r0, [r4, 0x8]
	mov r0, r9
	bl SwitchTaskToFollowupFunc
	b _080C8896
	.align 2, 0
_080C8768: .4byte gTasks
_080C876C:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C87A8
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _080C8782
	b _080C8896
_080C8782:
	ldr r0, _080C879C @ =gBlockSendBuffer
	ldr r1, _080C87A0 @ =gUnknown_02038695
	ldrb r1, [r1]
	lsls r1, 6
	ldr r2, _080C87A4 @ =gUnknown_02038570
	adds r1, r2
	movs r2, 0x40
	bl memcpy
	movs r0, 0x2
	bl sub_8007E9C
	b _080C87BA
	.align 2, 0
_080C879C: .4byte gBlockSendBuffer
_080C87A0: .4byte gUnknown_02038695
_080C87A4: .4byte gUnknown_02038570
_080C87A8:
	ldr r0, _080C87C4 @ =gBlockSendBuffer
	ldr r1, _080C87C8 @ =gUnknown_02038695
	ldrb r1, [r1]
	lsls r1, 6
	ldr r2, _080C87CC @ =gUnknown_02038570
	adds r1, r2
	movs r2, 0x40
	bl memcpy
_080C87BA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C8896
	.align 2, 0
_080C87C4: .4byte gBlockSendBuffer
_080C87C8: .4byte gUnknown_02038695
_080C87CC: .4byte gUnknown_02038570
_080C87D0:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8896
	movs r7, 0
	str r5, [sp]
	ldr r0, _080C8818 @ =gUnknown_02038570
	ldr r6, _080C881C @ =gLinkPlayers
	movs r5, 0
	mov r10, r0
	movs r2, 0xFF
	mov r8, r2
_080C87EA:
	lsls r1, r7, 8
	ldr r0, _080C8820 @ =gBlockRecvBuffer
	adds r1, r0
	mov r0, r10
	movs r2, 0x40
	bl memcpy
	ldr r0, _080C8824 @ =gUnknown_02038572
	adds r4, r5, r0
	ldrh r0, [r6, 0x1A]
	cmp r0, 0x1
	bne _080C8828
	adds r0, r4, 0
	bl sub_80C86A0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ConvertInternationalString
	b _080C883E
	.align 2, 0
_080C8818: .4byte gUnknown_02038570
_080C881C: .4byte gLinkPlayers
_080C8820: .4byte gBlockRecvBuffer
_080C8824: .4byte gUnknown_02038572
_080C8828:
	ldrb r0, [r4, 0xA]
	cmp r0, 0xFC
	bne _080C8838
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
	b _080C883E
_080C8838:
	strb r0, [r4, 0x5]
	mov r1, r8
	strb r1, [r4, 0xA]
_080C883E:
	ldr r0, _080C886C @ =gUnknown_0203857D
	adds r4, r5, r0
	ldrh r0, [r6, 0x1A]
	cmp r0, 0x1
	bne _080C8870
	mov r2, r8
	strb r2, [r4, 0x7]
	ldrb r0, [r4, 0x4]
	strb r0, [r4, 0x6]
	ldrb r0, [r4, 0x3]
	strb r0, [r4, 0x5]
	ldrb r0, [r4, 0x2]
	strb r0, [r4, 0x4]
	ldrb r0, [r4, 0x1]
	strb r0, [r4, 0x3]
	ldrb r0, [r4]
	strb r0, [r4, 0x2]
	movs r0, 0x15
	strb r0, [r4, 0x1]
	movs r0, 0xFC
	strb r0, [r4]
	b _080C8878
	.align 2, 0
_080C886C: .4byte gUnknown_0203857D
_080C8870:
	ldrb r0, [r4, 0x7]
	strb r0, [r4, 0x5]
	mov r0, r8
	strb r0, [r4, 0x7]
_080C8878:
	adds r6, 0x1C
	adds r5, 0x40
	movs r1, 0x40
	add r10, r1
	adds r7, 0x1
	cmp r7, 0x3
	ble _080C87EA
	ldr r0, _080C88A8 @ =gTasks
	ldr r1, [sp]
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C8896:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C88A8: .4byte gTasks
	thumb_func_end sub_80C8734

	thumb_func_start sub_80C88AC
sub_80C88AC: @ 80C88AC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C88D4 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080C88D8
	cmp r0, 0x1
	beq _080C88FC
	movs r0, 0
	strh r0, [r5, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C8924
	.align 2, 0
_080C88D4: .4byte gTasks
_080C88D8:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C891E
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8924
	ldr r0, _080C88F8 @ =gRngValue
	movs r1, 0x4
	bl sub_80C857C
	b _080C891E
	.align 2, 0
_080C88F8: .4byte gRngValue
_080C88FC:
	movs r0, 0
	bl sub_80C85AC
	lsls r0, 24
	cmp r0, 0
	beq _080C8924
	ldr r0, _080C892C @ =gRngValue
	ldr r4, _080C8930 @ =gBlockRecvBuffer
	adds r1, r4, 0
	movs r2, 0x4
	bl memcpy
	ldr r0, _080C8934 @ =gUnknown_03005D28
	adds r1, r4, 0
	movs r2, 0x4
	bl memcpy
_080C891E:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080C8924:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C892C: .4byte gRngValue
_080C8930: .4byte gBlockRecvBuffer
_080C8934: .4byte gUnknown_03005D28
	thumb_func_end sub_80C88AC

	thumb_func_start sub_80C8938
sub_80C8938: @ 80C8938
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C8968 @ =gTasks
	mov r8, r0
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r7, r0, 3
	mov r1, r8
	adds r4, r7, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C896C
	cmp r0, 0x1
	beq _080C8998
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
	b _080C89CE
	.align 2, 0
_080C8968: .4byte gTasks
_080C896C:
	ldr r1, _080C8994 @ =gBlockSendBuffer
	ldrh r0, [r4, 0x1A]
	strb r0, [r1]
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C898C
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C89CE
	movs r0, 0x2
	bl sub_8007E9C
_080C898C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C89CE
	.align 2, 0
_080C8994: .4byte gBlockSendBuffer
_080C8998:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C89CE
	movs r3, 0
	mov r12, r8
	adds r1, r6, 0
	ldr r4, _080C89D8 @ =gBlockRecvBuffer
	mov r0, r12
	adds r0, 0xA
	adds r2, r7, r0
	movs r6, 0x80
	lsls r6, 1
_080C89B4:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, r6
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _080C89B4
	adds r1, r5
	lsls r1, 3
	add r1, r12
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C89CE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C89D8: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8938

	thumb_func_start sub_80C89DC
sub_80C89DC: @ 80C89DC
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C8A04 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8A08
	cmp r0, 0x1
	beq _080C8A20
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C8A30
	.align 2, 0
_080C8A04: .4byte gTasks
_080C8A08:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8A30
	ldr r0, _080C8A1C @ =gUnknown_02038695
	movs r1, 0x1
	bl sub_80C857C
	b _080C8A2A
	.align 2, 0
_080C8A1C: .4byte gUnknown_02038695
_080C8A20:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8A30
_080C8A2A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C8A30:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C89DC

	thumb_func_start sub_80C8A38
sub_80C8A38: @ 80C8A38
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r7, _080C8A60 @ =gTasks
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r0, 3
	adds r4, r0, r7
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8A64
	cmp r0, 0x1
	beq _080C8A94
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
	b _080C8AC2
	.align 2, 0
_080C8A60: .4byte gTasks
_080C8A64:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8AC2
	ldr r0, _080C8A8C @ =gUnknown_02038695
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _080C8A90 @ =0x02019266
	adds r0, r1
	movs r1, 0x2
	bl sub_80C857C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C8AC2
	.align 2, 0
_080C8A8C: .4byte gUnknown_02038695
_080C8A90: .4byte 0x02019266
_080C8A94:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8AC2
	ldr r1, _080C8AC8 @ =gBlockRecvBuffer
	ldr r3, _080C8ACC @ =0x02019266
	movs r4, 0x80
	lsls r4, 1
	movs r2, 0x3
_080C8AA8:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, r4
	adds r3, 0x1C
	subs r2, 0x1
	cmp r2, 0
	bge _080C8AA8
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r7
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C8AC2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8AC8: .4byte gBlockRecvBuffer
_080C8ACC: .4byte 0x02019266
	thumb_func_end sub_80C8A38

	thumb_func_start sub_80C8AD0
sub_80C8AD0: @ 80C8AD0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C8AF8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	adds r3, r1, 0
	cmp r0, 0xB
	bls _080C8AEC
	b _080C8C70
_080C8AEC:
	lsls r0, 2
	ldr r1, _080C8AFC @ =_080C8B00
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8AF8: .4byte gTasks
_080C8AFC: .4byte _080C8B00
	.align 2, 0
_080C8B00:
	.4byte _080C8B30
	.4byte _080C8B4C
	.4byte _080C8B74
	.4byte _080C8B98
	.4byte _080C8BB0
	.4byte _080C8B74
	.4byte _080C8BD8
	.4byte _080C8BF0
	.4byte _080C8B74
	.4byte _080C8C18
	.4byte _080C8C30
	.4byte _080C8B74
_080C8B30:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _080C8B3C
	b _080C8C7A
_080C8B3C:
	ldr r0, _080C8B48 @ =gUnknown_02038678
	movs r1, 0x8
	bl sub_80C857C
	b _080C8C4C
	.align 2, 0
_080C8B48: .4byte gUnknown_02038678
_080C8B4C:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	bne _080C8B58
	b _080C8C7A
_080C8B58:
	ldr r0, _080C8B68 @ =gUnknown_02038678
	ldr r1, _080C8B6C @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8B70 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x8
	b _080C8C48
	.align 2, 0
_080C8B68: .4byte gUnknown_02038678
_080C8B6C: .4byte gUnknown_0203869B
_080C8B70: .4byte gBlockRecvBuffer
_080C8B74:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0xA]
	adds r1, r0, 0x1
	strh r1, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bgt _080C8B8C
	b _080C8C7A
_080C8B8C:
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080C8C7A
_080C8B98:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8C7A
	ldr r0, _080C8BAC @ =gUnknown_02038680
	movs r1, 0x8
	bl sub_80C857C
	b _080C8C4C
	.align 2, 0
_080C8BAC: .4byte gUnknown_02038680
_080C8BB0:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8C7A
	ldr r0, _080C8BCC @ =gUnknown_02038680
	ldr r1, _080C8BD0 @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8BD4 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x8
	b _080C8C48
	.align 2, 0
_080C8BCC: .4byte gUnknown_02038680
_080C8BD0: .4byte gUnknown_0203869B
_080C8BD4: .4byte gBlockRecvBuffer
_080C8BD8:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8C7A
	ldr r0, _080C8BEC @ =gUnknown_02038688
	movs r1, 0x8
	bl sub_80C857C
	b _080C8C4C
	.align 2, 0
_080C8BEC: .4byte gUnknown_02038688
_080C8BF0:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8C7A
	ldr r0, _080C8C0C @ =gUnknown_02038688
	ldr r1, _080C8C10 @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8C14 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x8
	b _080C8C48
	.align 2, 0
_080C8C0C: .4byte gUnknown_02038688
_080C8C10: .4byte gUnknown_0203869B
_080C8C14: .4byte gBlockRecvBuffer
_080C8C18:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8C7A
	ldr r0, _080C8C2C @ =gUnknown_02038690
	movs r1, 0x4
	bl sub_80C857C
	b _080C8C4C
	.align 2, 0
_080C8C2C: .4byte gUnknown_02038690
_080C8C30:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8C7A
	ldr r0, _080C8C60 @ =gUnknown_02038690
	ldr r1, _080C8C64 @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8C68 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x4
_080C8C48:
	bl memcpy
_080C8C4C:
	ldr r1, _080C8C6C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080C8C7A
	.align 2, 0
_080C8C60: .4byte gUnknown_02038690
_080C8C64: .4byte gUnknown_0203869B
_080C8C68: .4byte gBlockRecvBuffer
_080C8C6C: .4byte gTasks
_080C8C70:
	movs r0, 0
	strh r0, [r2, 0x8]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
_080C8C7A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8AD0

	thumb_func_start sub_80C8C80
sub_80C8C80: @ 80C8C80
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C8CA8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	adds r3, r1, 0
	cmp r0, 0xB
	bls _080C8C9C
	b _080C8E0C
_080C8C9C:
	lsls r0, 2
	ldr r1, _080C8CAC @ =_080C8CB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8CA8: .4byte gTasks
_080C8CAC: .4byte _080C8CB0
	.align 2, 0
_080C8CB0:
	.4byte _080C8CE0
	.4byte _080C8CFC
	.4byte _080C8D24
	.4byte _080C8D46
	.4byte _080C8D60
	.4byte _080C8D24
	.4byte _080C8D88
	.4byte _080C8DA0
	.4byte _080C8D24
	.4byte _080C8DB4
	.4byte _080C8DCC
	.4byte _080C8D24
_080C8CE0:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _080C8CEC
	b _080C8E16
_080C8CEC:
	ldr r0, _080C8CF8 @ =0x02019260
	movs r1, 0x70
	bl sub_80C857C
	b _080C8DE8
	.align 2, 0
_080C8CF8: .4byte 0x02019260
_080C8CFC:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	bne _080C8D08
	b _080C8E16
_080C8D08:
	ldr r0, _080C8D18 @ =0x02019260
	ldr r1, _080C8D1C @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8D20 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x70
	b _080C8DE4
	.align 2, 0
_080C8D18: .4byte 0x02019260
_080C8D1C: .4byte gUnknown_0203869B
_080C8D20: .4byte gBlockRecvBuffer
_080C8D24:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0xA]
	adds r1, r0, 0x1
	strh r1, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	ble _080C8E16
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080C8E16
_080C8D46:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8E16
	ldr r0, _080C8D5C @ =0x020192d0
	movs r1, 0x14
	bl sub_80C857C
	b _080C8DE8
	.align 2, 0
_080C8D5C: .4byte 0x020192d0
_080C8D60:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8E16
	ldr r0, _080C8D7C @ =0x020192d0
	ldr r1, _080C8D80 @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8D84 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x14
	b _080C8DE4
	.align 2, 0
_080C8D7C: .4byte 0x020192d0
_080C8D80: .4byte gUnknown_0203869B
_080C8D84: .4byte gBlockRecvBuffer
_080C8D88:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8E16
	ldr r0, _080C8D9C @ =0x02019328
	movs r1, 0x4
	bl sub_80C857C
	b _080C8DE8
	.align 2, 0
_080C8D9C: .4byte 0x02019328
_080C8DA0:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8E16
	ldr r0, _080C8DB0 @ =0x02019328
	b _080C8DD8
	.align 2, 0
_080C8DB0: .4byte 0x02019328
_080C8DB4:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8E16
	ldr r0, _080C8DC8 @ =gUnknown_02038696
	movs r1, 0x4
	bl sub_80C857C
	b _080C8DE8
	.align 2, 0
_080C8DC8: .4byte gUnknown_02038696
_080C8DCC:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8E16
	ldr r0, _080C8DFC @ =gUnknown_02038696
_080C8DD8:
	ldr r1, _080C8E00 @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8E04 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x4
_080C8DE4:
	bl memcpy
_080C8DE8:
	ldr r1, _080C8E08 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080C8E16
	.align 2, 0
_080C8DFC: .4byte gUnknown_02038696
_080C8E00: .4byte gUnknown_0203869B
_080C8E04: .4byte gBlockRecvBuffer
_080C8E08: .4byte gTasks
_080C8E0C:
	movs r0, 0
	strh r0, [r2, 0x8]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
_080C8E16:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8C80

	thumb_func_start sub_80C8E1C
sub_80C8E1C: @ 80C8E1C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C8E4C @ =gTasks
	mov r8, r0
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r7, r0, 3
	mov r1, r8
	adds r4, r7, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8E50
	cmp r0, 0x1
	beq _080C8E7C
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
	b _080C8EAE
	.align 2, 0
_080C8E4C: .4byte gTasks
_080C8E50:
	ldr r1, _080C8E78 @ =gBlockSendBuffer
	movs r0, 0x64
	strb r0, [r1]
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C8E70
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8EAE
	movs r0, 0x2
	bl sub_8007E9C
_080C8E70:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C8EAE
	.align 2, 0
_080C8E78: .4byte gBlockSendBuffer
_080C8E7C:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8EAE
	ldr r1, _080C8EB8 @ =gBlockRecvBuffer
	mov r0, r8
	adds r0, 0x12
	adds r2, r7, r0
	movs r4, 0x80
	lsls r4, 1
	movs r3, 0x3
_080C8E94:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, r4
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C8E94
	adds r1, r6, r5
	lsls r1, 3
	add r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C8EAE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8EB8: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8E1C

	thumb_func_start sub_80C8EBC
sub_80C8EBC: @ 80C8EBC
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C8EE4 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8EE8
	cmp r0, 0x1
	beq _080C8F00
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C8F22
	.align 2, 0
_080C8EE4: .4byte gTasks
_080C8EE8:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8F22
	ldr r0, _080C8EFC @ =gUnknown_02038670
	movs r1, 0x8
	bl sub_80C857C
	b _080C8F1C
	.align 2, 0
_080C8EFC: .4byte gUnknown_02038670
_080C8F00:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8F22
	ldr r0, _080C8F28 @ =gUnknown_02038670
	ldr r1, _080C8F2C @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8F30 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x8
	bl memcpy
_080C8F1C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C8F22:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8F28: .4byte gUnknown_02038670
_080C8F2C: .4byte gUnknown_0203869B
_080C8F30: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8EBC

	thumb_func_start sub_80C8F34
sub_80C8F34: @ 80C8F34
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C8F5C @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8F60
	cmp r0, 0x1
	beq _080C8F78
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C8F9A
	.align 2, 0
_080C8F5C: .4byte gTasks
_080C8F60:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8F9A
	ldr r0, _080C8F74 @ =gUnknown_02038696
	movs r1, 0x4
	bl sub_80C857C
	b _080C8F94
	.align 2, 0
_080C8F74: .4byte gUnknown_02038696
_080C8F78:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8F9A
	ldr r0, _080C8FA0 @ =gUnknown_02038696
	ldr r1, _080C8FA4 @ =gUnknown_0203869B
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8FA8 @ =gBlockRecvBuffer
	adds r1, r2
	movs r2, 0x4
	bl memcpy
_080C8F94:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C8F9A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8FA0: .4byte gUnknown_02038696
_080C8FA4: .4byte gUnknown_0203869B
_080C8FA8: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8F34

	thumb_func_start sub_80C8FAC
sub_80C8FAC: @ 80C8FAC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C8FD0 @ =word_203855E
	ldrh r0, [r1]
	cmp r0, 0xAF
	bne _080C8FD8
	ldr r1, _080C8FD4 @ =gTasks
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x26]
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _080C8FE6
	.align 2, 0
_080C8FD0: .4byte word_203855E
_080C8FD4: .4byte gTasks
_080C8FD8:
	ldrh r0, [r1]
	bl itemid_get_type
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r2, r4, 2
_080C8FE6:
	ldr r0, _080C9008 @ =gTasks
	adds r1, r2, r4
	lsls r1, 3
	adds r1, r0
	ldr r2, _080C900C @ =gUnknown_083D61E4
	lsls r0, r3, 2
	adds r0, r2
	ldr r2, [r0]
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _080C9010 @ =sub_80A5B00
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9008: .4byte gTasks
_080C900C: .4byte gUnknown_083D61E4
_080C9010: .4byte sub_80A5B00
	thumb_func_end sub_80C8FAC

	thumb_func_start unknown_ItemMenu_Confirm
unknown_ItemMenu_Confirm: @ 80C9014
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	bl sub_80C8FAC
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
	thumb_func_end unknown_ItemMenu_Confirm

	thumb_func_start sub_80C9038
sub_80C9038: @ 80C9038
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80C8FAC
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	thumb_func_end sub_80C9038

	thumb_func_start SetUpItemUseOnFieldCallback
SetUpItemUseOnFieldCallback: @ 80C9050
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C9078 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080C9084
	ldr r1, _080C907C @ =gUnknown_0300485C
	ldr r0, _080C9080 @ =sub_80A5CC4
	str r0, [r1]
	adds r0, r2, 0
	bl unknown_ItemMenu_Confirm
	b _080C908E
	.align 2, 0
_080C9078: .4byte gTasks
_080C907C: .4byte gUnknown_0300485C
_080C9080: .4byte sub_80A5CC4
_080C9084:
	ldr r0, _080C9094 @ =gUnknown_03005D00
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
_080C908E:
	pop {r0}
	bx r0
	.align 2, 0
_080C9094: .4byte gUnknown_03005D00
	thumb_func_end SetUpItemUseOnFieldCallback

	thumb_func_start sub_80C9098
sub_80C9098: @ 80C9098
	push {r4-r6,lr}
	adds r4, r1, 0
	adds r1, r2, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080C90CC @ =gStringVar4
	adds r0, r5, 0
	bl StringExpandPlaceholders
	cmp r4, 0
	bne _080C90D4
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r2, _080C90D0 @ =sub_80A5C48
	adds r0, r6, 0
	adds r1, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080C90E0
	.align 2, 0
_080C90CC: .4byte gStringVar4
_080C90D0: .4byte sub_80A5C48
_080C90D4:
	ldr r2, _080C90E8 @ =sub_80A5C9C
	adds r0, r6, 0
	adds r1, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C90E0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C90E8: .4byte sub_80A5C9C
	thumb_func_end sub_80C9098

	thumb_func_start DisplayDadsAdviceCannotUseItemMessage
DisplayDadsAdviceCannotUseItemMessage: @ 80C90EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080C9100 @ =gOtherText_DadsAdvice
	bl sub_80C9098
	pop {r0}
	bx r0
	.align 2, 0
_080C9100: .4byte gOtherText_DadsAdvice
	thumb_func_end DisplayDadsAdviceCannotUseItemMessage

	thumb_func_start sub_80C9104
sub_80C9104: @ 80C9104
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080C9118 @ =gOtherText_CantGetOffBike
	bl sub_80C9098
	pop {r0}
	bx r0
	.align 2, 0
_080C9118: .4byte gOtherText_CantGetOffBike
	thumb_func_end sub_80C9104

	thumb_func_start CheckIfItemIsTMHMOrEvolutionStone
CheckIfItemIsTMHMOrEvolutionStone: @ 80C911C
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl itemid_get_overworld_function
	ldr r1, _080C9134 @ =ItemUseOutOfBattle_TMHM
	cmp r0, r1
	bne _080C9138
	movs r0, 0x1
	b _080C914E
	.align 2, 0
_080C9134: .4byte ItemUseOutOfBattle_TMHM
_080C9138:
	adds r0, r4, 0
	bl itemid_get_overworld_function
	ldr r1, _080C9148 @ =ItemUseOutOfBattle_EvolutionStone
	cmp r0, r1
	beq _080C914C
	movs r0, 0
	b _080C914E
	.align 2, 0
_080C9148: .4byte ItemUseOutOfBattle_EvolutionStone
_080C914C:
	movs r0, 0x2
_080C914E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CheckIfItemIsTMHMOrEvolutionStone

	thumb_func_start sub_80C9154
sub_80C9154: @ 80C9154
	push {r4,lr}
	sub sp, 0x24
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C9188 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C9180
	mov r1, sp
	ldr r0, _080C918C @ =word_203855E
	ldrh r0, [r0]
	strh r0, [r1, 0x20]
	ldr r1, _080C9190 @ =sub_80A5D04
	mov r0, sp
	movs r2, 0
	bl sub_80F890C
	adds r0, r4, 0
	bl DestroyTask
_080C9180:
	add sp, 0x24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9188: .4byte gPaletteFade
_080C918C: .4byte word_203855E
_080C9190: .4byte sub_80A5D04
	thumb_func_end sub_80C9154

	thumb_func_start ItemUseOutOfBattle_Mail
ItemUseOutOfBattle_Mail: @ 80C9194
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080C91C4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C91C8 @ =sub_80C9154
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C91C4: .4byte gTasks
_080C91C8: .4byte sub_80C9154
	thumb_func_end ItemUseOutOfBattle_Mail

	thumb_func_start ItemUseOutOfBattle_Bike
ItemUseOutOfBattle_Bike: @ 80C91CC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C924C @ =0x0000082b
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9238
	adds r0, r4, 0
	bl MetatileBehavior_IsVerticalRail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9238
	adds r0, r4, 0
	bl MetatileBehavior_IsHorizontalRail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9238
	adds r0, r4, 0
	bl MetatileBehavior_IsIsolatedVerticalRail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9238
	adds r0, r4, 0
	bl MetatileBehavior_IsIsolatedHorizontalRail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9254
_080C9238:
	ldr r0, _080C9250 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r5, 0
	bl sub_80C9104
	b _080C928E
	.align 2, 0
_080C924C: .4byte 0x0000082b
_080C9250: .4byte gTasks
_080C9254:
	bl sub_8053C44
	cmp r0, 0x1
	bne _080C927C
	bl sub_80E5EF4
	lsls r0, 24
	cmp r0, 0
	bne _080C927C
	ldr r1, _080C9274 @ =gUnknown_03005D00
	ldr r0, _080C9278 @ =ItemUseOnFieldCB_Bike
	str r0, [r1]
	adds r0, r5, 0
	bl SetUpItemUseOnFieldCallback
	b _080C928E
	.align 2, 0
_080C9274: .4byte gUnknown_03005D00
_080C9278: .4byte ItemUseOnFieldCB_Bike
_080C927C:
	ldr r0, _080C9298 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r5, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080C928E:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9298: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_Bike

	thumb_func_start ItemUseOnFieldCB_Bike
ItemUseOnFieldCB_Bike: @ 80C929C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080C92E0 @ =word_203855E
	ldrh r0, [r4]
	bl itemid_get_x28
	lsls r0, 24
	cmp r0, 0
	bne _080C92B6
	movs r0, 0x2
	bl GetOnOffBike
_080C92B6:
	ldrh r0, [r4]
	bl itemid_get_x28
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C92CA
	movs r0, 0x4
	bl GetOnOffBike
_080C92CA:
	bl sub_8064E2C
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C92E0: .4byte word_203855E
	thumb_func_end ItemUseOnFieldCB_Bike

	thumb_func_start CanFish
CanFish: @ 80C92E4
	push {r4-r6,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r6, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	cmp r0, 0
	bne _080C936C
	movs r0, 0x10
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _080C936C
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _080C933C
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	cmp r0, 0
	beq _080C936C
_080C9338:
	movs r0, 0x1
	b _080C936E
_080C933C:
	adds r0, r5, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	beq _080C935C
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridIsImpassableAt
	lsls r0, 24
	cmp r0, 0
	beq _080C9338
_080C935C:
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_8057434
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9338
_080C936C:
	movs r0, 0
_080C936E:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CanFish

	thumb_func_start ItemUseOutOfBattle_Rod
ItemUseOutOfBattle_Rod: @ 80C9378
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl CanFish
	cmp r0, 0x1
	bne _080C939C
	ldr r1, _080C9394 @ =gUnknown_03005D00
	ldr r0, _080C9398 @ =ItemUseOnFieldCB_Rod
	str r0, [r1]
	adds r0, r4, 0
	bl SetUpItemUseOnFieldCallback
	b _080C93AE
	.align 2, 0
_080C9394: .4byte gUnknown_03005D00
_080C9398: .4byte ItemUseOnFieldCB_Rod
_080C939C:
	ldr r0, _080C93B4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080C93AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C93B4: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_Rod

	thumb_func_start ItemUseOnFieldCB_Rod
ItemUseOnFieldCB_Rod: @ 80C93B8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080C93DC @ =word_203855E
	ldrh r0, [r0]
	bl itemid_get_x28
	lsls r0, 24
	lsrs r0, 24
	bl StartFishing
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C93DC: .4byte word_203855E
	thumb_func_end ItemUseOnFieldCB_Rod

	thumb_func_start ItemUseOutOfBattle_Itemfinder
ItemUseOutOfBattle_Itemfinder: @ 80C93E0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x27
	bl sav12_xor_increment
	ldr r1, _080C9400 @ =gUnknown_03005D00
	ldr r0, _080C9404 @ =ItemUseOnFieldCB_Itemfinder
	str r0, [r1]
	adds r0, r4, 0
	bl SetUpItemUseOnFieldCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9400: .4byte gUnknown_03005D00
_080C9404: .4byte ItemUseOnFieldCB_Itemfinder
	thumb_func_end ItemUseOutOfBattle_Itemfinder

	thumb_func_start ItemUseOnFieldCB_Itemfinder
ItemUseOnFieldCB_Itemfinder: @ 80C9408
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C9430 @ =gMapHeader
	ldr r0, [r0, 0x4]
	adds r1, r4, 0
	bl ItemfinderCheckForHiddenItems
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C943C
	ldr r0, _080C9434 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C9438 @ =sub_80C9458
	str r0, [r1]
	b _080C9448
	.align 2, 0
_080C9430: .4byte gMapHeader
_080C9434: .4byte gTasks
_080C9438: .4byte sub_80C9458
_080C943C:
	ldr r1, _080C9450 @ =gOtherText_NoResponse
	ldr r2, _080C9454 @ =sub_80C9520
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9448:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9450: .4byte gOtherText_NoResponse
_080C9454: .4byte sub_80C9520
	thumb_func_end ItemUseOnFieldCB_Itemfinder

	thumb_func_start sub_80C9458
sub_80C9458: @ 80C9458
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r7, r0, 3
	ldr r0, _080C94AC @ =gTasks + 0x8
	mov r8, r0
	adds r4, r7, r0
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C950C
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0x4
	bne _080C9500
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl sub_80C9908
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080C94B8
	ldr r1, _080C94B0 @ =gUnknown_083D61F0
	subs r0, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80C997C
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _080C94B4 @ =sub_80C99EC
	str r1, [r0]
	b _080C9516
	.align 2, 0
_080C94AC: .4byte gTasks + 0x8
_080C94B0: .4byte gUnknown_083D61F0
_080C94B4: .4byte sub_80C99EC
_080C94B8:
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	adds r3, r6, 0
	ldr r7, _080C94F4 @ =gUnknown_083D61F0
	movs r6, 0x3
_080C94C8:
	adds r0, r1, r7
	adds r1, 0x1
	ldrb r0, [r0]
	cmp r2, r0
	bne _080C94D8
	adds r0, r1, 0
	ands r0, r6
	strh r0, [r4, 0xA]
_080C94D8:
	lsls r0, r1, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _080C94C8
	ldr r1, _080C94F8 @ =gTasks
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C94FC @ =sub_80C9A38
	str r1, [r0]
	movs r0, 0
	strh r0, [r4, 0x6]
	strh r0, [r4, 0x4]
	b _080C9516
	.align 2, 0
_080C94F4: .4byte gUnknown_083D61F0
_080C94F8: .4byte gTasks
_080C94FC: .4byte sub_80C9A38
_080C9500:
	movs r0, 0x48
	bl PlaySE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C950C:
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	strh r0, [r4, 0x6]
_080C9516:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C9458

	thumb_func_start sub_80C9520
sub_80C9520: @ 80C9520
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_8064E2C
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C9520

	thumb_func_start ItemfinderCheckForHiddenItems
ItemfinderCheckForHiddenItems: @ 80C9548
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	ldr r1, _080C9618 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	movs r3, 0
	mov r9, r4
	ldrb r0, [r5, 0x3]
	cmp r3, r0
	bge _080C95FC
	subs r1, 0x5
	mov r8, r1
_080C9580:
	lsls r3, 16
	asrs r1, r3, 16
	ldr r2, [r5, 0x10]
	lsls r0, r1, 1
	adds r0, r1
	lsls r4, r0, 2
	adds r1, r4, r2
	ldrb r0, [r1, 0x5]
	adds r7, r3, 0
	cmp r0, 0x7
	bne _080C95EC
	movs r2, 0x96
	lsls r2, 2
	adds r0, r2, 0
	ldrh r1, [r1, 0xA]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080C95EC
	ldr r1, [r5, 0x10]
	adds r1, r4, r1
	ldrh r2, [r1]
	adds r2, 0x7
	mov r0, sp
	ldrh r0, [r0]
	subs r2, r0
	ldrh r0, [r1, 0x2]
	adds r0, 0x7
	mov r3, r9
	ldrh r1, [r3]
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 16
	asrs r1, r2, 16
	movs r3, 0xE0
	lsls r3, 11
	adds r2, r3
	lsrs r2, 16
	cmp r2, 0xE
	bhi _080C95EC
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, r8
	blt _080C95EC
	cmp r2, 0x5
	bgt _080C95EC
	adds r0, r6, 0
	bl sub_80C9838
_080C95EC:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r7, r1
	lsrs r3, r0, 16
	asrs r0, 16
	ldrb r2, [r5, 0x3]
	cmp r0, r2
	blt _080C9580
_080C95FC:
	adds r0, r6, 0
	bl sub_80C9720
	ldr r0, _080C9618 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	beq _080C961C
	movs r0, 0
	b _080C961E
	.align 2, 0
_080C9618: .4byte gTasks
_080C961C:
	movs r0, 0x1
_080C961E:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ItemfinderCheckForHiddenItems

	thumb_func_start sub_80C962C
sub_80C962C: @ 80C962C
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	ldrb r2, [r0, 0x3]
	ldr r5, [r0, 0x10]
	movs r1, 0
	cmp r1, r2
	bge _080C9680
	lsls r0, r3, 16
	asrs r6, r0, 16
	lsls r0, r4, 16
	asrs r4, r0, 16
	adds r3, r5, 0
_080C964A:
	ldrb r0, [r3, 0x5]
	cmp r0, 0x7
	bne _080C9678
	ldrh r0, [r3]
	cmp r6, r0
	bne _080C9678
	ldrh r0, [r3, 0x2]
	cmp r4, r0
	bne _080C9678
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1, 0
	ldrh r3, [r3, 0xA]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080C9680
	movs r0, 0x1
	b _080C9682
_080C9678:
	adds r3, 0xC
	adds r1, 0x1
	cmp r1, r2
	blt _080C964A
_080C9680:
	movs r0, 0
_080C9682:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C962C

	thumb_func_start sub_80C9688
sub_80C9688: @ 80C9688
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl mapconnection_get_mapheader
	adds r3, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _080C96B0
	cmp r0, 0x2
	bgt _080C96A6
	cmp r0, 0x1
	beq _080C96C4
	b _080C9704
_080C96A6:
	cmp r0, 0x3
	beq _080C96DC
	cmp r0, 0x4
	beq _080C96E6
	b _080C9704
_080C96B0:
	ldr r0, [r4, 0x4]
	adds r0, 0x7
	subs r0, r5, r0
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r3]
	ldr r0, [r0, 0x4]
	subs r0, 0x7
	adds r0, r6
	b _080C96FA
_080C96C4:
	ldr r0, [r4, 0x4]
	adds r0, 0x7
	subs r0, r5, r0
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080C96D8 @ =gMapHeader
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	b _080C96F6
	.align 2, 0
_080C96D8: .4byte gMapHeader
_080C96DC:
	ldr r0, [r3]
	ldr r0, [r0]
	subs r0, 0x7
	adds r0, r5
	b _080C96F0
_080C96E6:
	ldr r0, _080C9700 @ =gMapHeader
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, 0x7
	subs r0, r5, r0
_080C96F0:
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r4, 0x4]
_080C96F6:
	adds r0, 0x7
	subs r0, r6, r0
_080C96FA:
	lsls r0, 16
	lsrs r2, r0, 16
	b _080C9708
	.align 2, 0
_080C9700: .4byte gMapHeader
_080C9704:
	movs r0, 0
	b _080C971A
_080C9708:
	ldr r0, [r3, 0x4]
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	bl sub_80C962C
	lsls r0, 24
	lsrs r0, 24
_080C971A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C9688

	thumb_func_start sub_80C9720
sub_80C9720: @ 80C9720
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldr r0, _080C9834 @ =gMapHeader
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	ldr r0, [r1, 0x4]
	adds r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	adds r1, 0x7
	cmp r0, r1
	bgt _080C9824
_080C976E:
	mov r5, sp
	ldrh r0, [r5, 0x2]
	subs r0, 0x5
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r2, r4, 16
	asrs r1, r2, 16
	movs r6, 0x2
	ldrsh r0, [r5, r6]
	adds r0, 0x5
	lsls r3, 16
	mov r8, r3
	cmp r1, r0
	bgt _080C980E
	movs r0, 0x7
	str r0, [sp, 0x10]
	mov r1, r8
	asrs r1, 16
	mov r9, r1
	mov r10, r0
_080C9796:
	ldr r3, [sp, 0x10]
	cmp r3, r9
	bgt _080C97B8
	ldr r5, [sp, 0x8]
	lsls r0, r5, 16
	asrs r0, 16
	cmp r9, r0
	bge _080C97B8
	asrs r1, r2, 16
	cmp r10, r1
	bgt _080C97B8
	ldr r6, [sp, 0xC]
	lsls r0, r6, 16
	asrs r0, 16
	lsls r7, r4, 16
	cmp r1, r0
	blt _080C97F6
_080C97B8:
	mov r0, r8
	asrs r5, r0, 16
	lsls r4, 16
	asrs r6, r4, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8056BA0
	adds r7, r4, 0
	cmp r0, 0
	beq _080C97F6
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_80C9688
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C97F6
	mov r0, sp
	ldrh r1, [r0]
	subs r1, r5, r1
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, r6, r2
	lsls r2, 16
	asrs r2, 16
	ldr r0, [sp, 0x4]
	bl sub_80C9838
_080C97F6:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r7, r1
	lsrs r4, r0, 16
	lsls r2, r4, 16
	asrs r1, r2, 16
	mov r3, sp
	movs r5, 0x2
	ldrsh r0, [r3, r5]
	adds r0, 0x5
	cmp r1, r0
	ble _080C9796
_080C980E:
	movs r1, 0x80
	lsls r1, 9
	add r1, r8
	lsrs r3, r1, 16
	asrs r1, 16
	mov r0, sp
	movs r6, 0
	ldrsh r0, [r0, r6]
	adds r0, 0x7
	cmp r1, r0
	ble _080C976E
_080C9824:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C9834: .4byte gMapHeader
	thumb_func_end sub_80C9720

	thumb_func_start sub_80C9838
sub_80C9838: @ 80C9838
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r12, r2
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080C986C @ =gTasks + 0x8
	adds r3, r1, r0
	movs r1, 0x4
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080C9870
	strh r7, [r3]
	mov r0, r12
	strh r0, [r3, 0x2]
	movs r0, 0x1
	strh r0, [r3, 0x4]
	b _080C98FA
	.align 2, 0
_080C986C: .4byte gTasks + 0x8
_080C9870:
	movs r1, 0
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bge _080C9880
	negs r0, r0
	lsls r0, 16
	lsrs r4, r0, 16
	b _080C9882
_080C9880:
	ldrh r4, [r3]
_080C9882:
	movs r1, 0x2
	ldrsh r0, [r3, r1]
	ldrh r1, [r3, 0x2]
	mov r9, r1
	cmp r0, 0
	bge _080C9896
	negs r0, r0
	lsls r0, 16
	lsrs r2, r0, 16
	b _080C9898
_080C9896:
	ldrh r2, [r3, 0x2]
_080C9898:
	lsls r1, r7, 16
	asrs r0, r1, 16
	cmp r0, 0
	bge _080C98A8
	negs r0, r0
	lsls r0, 16
	lsrs r6, r0, 16
	b _080C98AA
_080C98A8:
	lsrs r6, r1, 16
_080C98AA:
	mov r1, r12
	lsls r0, r1, 16
	asrs r1, r0, 16
	mov r8, r0
	cmp r1, 0
	bge _080C98BC
	negs r0, r1
	lsls r0, 16
	b _080C98BE
_080C98BC:
	mov r0, r8
_080C98BE:
	lsrs r5, r0, 16
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r2, 16
	asrs r2, r1, 16
	adds r4, r0, r2
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	adds r0, r1
	cmp r4, r0
	ble _080C98E0
	strh r7, [r3]
	mov r1, r12
	strh r1, [r3, 0x2]
	b _080C98FA
_080C98E0:
	cmp r4, r0
	bne _080C98FA
	cmp r2, r1
	bgt _080C98F4
	cmp r2, r1
	bne _080C98FA
	mov r1, r9
	lsls r0, r1, 16
	cmp r0, r8
	bge _080C98FA
_080C98F4:
	strh r7, [r3]
	mov r0, r12
	strh r0, [r3, 0x2]
_080C98FA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C9838

	thumb_func_start sub_80C9908
sub_80C9908: @ 80C9908
	push {r4,r5,lr}
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsrs r2, r0, 16
	cmp r0, 0
	bne _080C991A
	cmp r1, 0
	beq _080C9974
_080C991A:
	lsls r0, r2, 16
	asrs r2, r0, 16
	adds r5, r0, 0
	cmp r2, 0
	bge _080C992C
	negs r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	b _080C992E
_080C992C:
	lsrs r4, r5, 16
_080C992E:
	lsls r0, r1, 16
	asrs r2, r0, 16
	adds r1, r0, 0
	cmp r2, 0
	bge _080C9940
	negs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	b _080C9942
_080C9940:
	lsrs r3, r1, 16
_080C9942:
	lsls r0, r4, 16
	asrs r2, r0, 16
	lsls r0, r3, 16
	asrs r0, 16
	cmp r2, r0
	ble _080C995A
	cmp r5, 0
	bge _080C9956
	movs r0, 0x4
	b _080C9976
_080C9956:
	movs r0, 0x2
	b _080C9976
_080C995A:
	cmp r2, r0
	bge _080C9964
	cmp r1, 0
	blt _080C996C
	b _080C9970
_080C9964:
	cmp r2, r0
	bne _080C9974
	cmp r1, 0
	bge _080C9970
_080C996C:
	movs r0, 0x1
	b _080C9976
_080C9970:
	movs r0, 0x3
	b _080C9976
_080C9974:
	movs r0, 0
_080C9976:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80C9908

	thumb_func_start sub_80C997C
sub_80C997C: @ 80C997C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r4, _080C99E8 @ =gMapObjects
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimFinished
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FieldObjectClearAnim
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl npc_sync_anim_pause_bits
	adds r0, r5, 0
	bl PlayerTurnInPlace
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C99E8: .4byte gMapObjects
	thumb_func_end sub_80C997C

	thumb_func_start sub_80C99EC
sub_80C99EC: @ 80C99EC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C9A2C @ =gMapObjects
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9A24
	ldr r1, _080C9A30 @ =gOtherText_ItemfinderResponding
	ldr r2, _080C9A34 @ =sub_80C9520
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9A24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9A2C: .4byte gMapObjects
_080C9A30: .4byte gOtherText_ItemfinderResponding
_080C9A34: .4byte sub_80C9520
	thumb_func_end sub_80C99EC

	thumb_func_start sub_80C9A38
sub_80C9A38: @ 80C9A38
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C9AB4 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C9AB8 @ =gMapObjects
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9A78
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C9AAE
_080C9A78:
	ldr r1, _080C9ABC @ =gUnknown_083D61F0
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80C997C
	movs r0, 0x1
	strh r0, [r4, 0x4]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080C9AAE
	ldr r1, _080C9AC0 @ =gOtherText_ItemfinderFoundItem
	ldr r2, _080C9AC4 @ =sub_80C9520
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9AAE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9AB4: .4byte gTasks + 0x8
_080C9AB8: .4byte gMapObjects
_080C9ABC: .4byte gUnknown_083D61F0
_080C9AC0: .4byte gOtherText_ItemfinderFoundItem
_080C9AC4: .4byte sub_80C9520
	thumb_func_end sub_80C9A38

	thumb_func_start ItemUseOutOfBattle_PokeblockCase
ItemUseOutOfBattle_PokeblockCase: @ 80C9AC8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9AF4
	ldr r0, _080C9AF0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
	b _080C9B2A
	.align 2, 0
_080C9AF0: .4byte gTasks
_080C9AF4:
	ldr r0, _080C9B14 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0xC
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _080C9B18
	movs r0, 0
	bl sub_810BA7C
	adds r0, r4, 0
	bl unknown_ItemMenu_Confirm
	b _080C9B2A
	.align 2, 0
_080C9B14: .4byte gTasks
_080C9B18:
	ldr r1, _080C9B30 @ =gUnknown_0300485C
	ldr r0, _080C9B34 @ =sub_8080E28
	str r0, [r1]
	movs r0, 0x1
	bl sub_810BA7C
	adds r0, r5, 0
	bl sub_80C9038
_080C9B2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9B30: .4byte gUnknown_0300485C
_080C9B34: .4byte sub_8080E28
	thumb_func_end ItemUseOutOfBattle_PokeblockCase

	thumb_func_start ItemUseOutOfBattle_CoinCase
ItemUseOutOfBattle_CoinCase: @ 80C9B38
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080C9B8C @ =gStringVar1
	bl GetCoins
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r4, _080C9B90 @ =gStringVar4
	ldr r1, _080C9B94 @ =gOtherText_Coins3
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, _080C9B98 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080C9BA0
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r2, _080C9B9C @ =sub_80A5C48
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080C9BAC
	.align 2, 0
_080C9B8C: .4byte gStringVar1
_080C9B90: .4byte gStringVar4
_080C9B94: .4byte gOtherText_Coins3
_080C9B98: .4byte gTasks
_080C9B9C: .4byte sub_80A5C48
_080C9BA0:
	ldr r2, _080C9BB4 @ =sub_80A5C9C
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9BAC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9BB4: .4byte sub_80A5C9C
	thumb_func_end ItemUseOutOfBattle_CoinCase

	thumb_func_start sub_80C9BB8
sub_80C9BB8: @ 80C9BB8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080C9BD4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C9BD0
	adds r0, r2, 0
	bl sub_80A5C48
_080C9BD0:
	pop {r0}
	bx r0
	.align 2, 0
_080C9BD4: .4byte gMain
	thumb_func_end sub_80C9BB8

	thumb_func_start sub_80C9BD8
sub_80C9BD8: @ 80C9BD8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080C9BF4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C9BF0
	adds r0, r2, 0
	bl sub_80A5C9C
_080C9BF0:
	pop {r0}
	bx r0
	.align 2, 0
_080C9BF4: .4byte gMain
	thumb_func_end sub_80C9BD8

	thumb_func_start unref_sub_80C9BF8
unref_sub_80C9BF8: @ 80C9BF8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080C9C3C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080C9C4C
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r4, _080C9C40 @ =gUnknown_083D61DC
	ldr r0, _080C9C44 @ =word_203855E
	ldrh r0, [r0]
	bl itemid_get_x28
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r1, [r0]
	ldr r2, _080C9C48 @ =sub_80C9BB8
	adds r0, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080C9C68
	.align 2, 0
_080C9C3C: .4byte gTasks
_080C9C40: .4byte gUnknown_083D61DC
_080C9C44: .4byte word_203855E
_080C9C48: .4byte sub_80C9BB8
_080C9C4C:
	ldr r4, _080C9C70 @ =gUnknown_083D61DC
	ldr r0, _080C9C74 @ =word_203855E
	ldrh r0, [r0]
	bl itemid_get_x28
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r1, [r0]
	ldr r2, _080C9C78 @ =sub_80C9BD8
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9C68:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9C70: .4byte gUnknown_083D61DC
_080C9C74: .4byte word_203855E
_080C9C78: .4byte sub_80C9BD8
	thumb_func_end unref_sub_80C9BF8

	thumb_func_start sub_80C9C7C
sub_80C9C7C: @ 80C9C7C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPlayerFacingPlantedBerryTree
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9CE4
	ldr r1, _080C9CC8 @ =gUnknown_03005D00
	ldr r0, _080C9CCC @ =sub_80C9D00
	str r0, [r1]
	ldr r1, _080C9CD0 @ =gUnknown_0300485C
	ldr r0, _080C9CD4 @ =sub_80A5CC4
	str r0, [r1]
	ldr r1, _080C9CD8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080C9CDC @ =c2_exit_to_overworld_2_switch
	lsrs r1, r2, 16
	movs r3, 0
	strh r1, [r0, 0x18]
	strh r2, [r0, 0x1A]
	ldr r1, _080C9CE0 @ =sub_80A5B00
	str r1, [r0]
	movs r0, 0x1
	negs r0, r0
	str r3, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080C9CF4
	.align 2, 0
_080C9CC8: .4byte gUnknown_03005D00
_080C9CCC: .4byte sub_80C9D00
_080C9CD0: .4byte gUnknown_0300485C
_080C9CD4: .4byte sub_80A5CC4
_080C9CD8: .4byte gTasks
_080C9CDC: .4byte c2_exit_to_overworld_2_switch
_080C9CE0: .4byte sub_80A5B00
_080C9CE4:
	ldr r0, _080C9CFC @ =word_203855E
	ldrh r0, [r0]
	bl itemid_get_overworld_function
	adds r1, r0, 0
	adds r0, r4, 0
	bl _call_via_r1
_080C9CF4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9CFC: .4byte word_203855E
	thumb_func_end sub_80C9C7C

	thumb_func_start sub_80C9D00
sub_80C9D00: @ 80C9D00
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080C9D28 @ =word_203855E
	ldrh r0, [r0]
	movs r1, 0x1
	bl sub_80A9538
	bl ScriptContext2_Enable
	ldr r0, _080C9D2C @ =gUnknown_081A1654
	bl ScriptContext1_SetupScript
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D28: .4byte word_203855E
_080C9D2C: .4byte gUnknown_081A1654
	thumb_func_end sub_80C9D00

	thumb_func_start ItemUseOutOfBattle_WailmerPail
ItemUseOutOfBattle_WailmerPail: @ 80C9D30
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl WaterBerryTree
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9D58
	ldr r1, _080C9D50 @ =gUnknown_03005D00
	ldr r0, _080C9D54 @ =sub_80C9D74
	str r0, [r1]
	adds r0, r4, 0
	bl SetUpItemUseOnFieldCallback
	b _080C9D6A
	.align 2, 0
_080C9D50: .4byte gUnknown_03005D00
_080C9D54: .4byte sub_80C9D74
_080C9D58:
	ldr r0, _080C9D70 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080C9D6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D70: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_WailmerPail

	thumb_func_start sub_80C9D74
sub_80C9D74: @ 80C9D74
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	ldr r0, _080C9D94 @ =gUnknown_081A168F
	bl ScriptContext1_SetupScript
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D94: .4byte gUnknown_081A168F
	thumb_func_end sub_80C9D74

	thumb_func_start sub_80C9D98
sub_80C9D98: @ 80C9D98
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9DAC @ =gUnknown_02038561
	movs r1, 0
	strb r1, [r2]
	bl unknown_ItemMenu_Confirm
	pop {r0}
	bx r0
	.align 2, 0
_080C9DAC: .4byte gUnknown_02038561
	thumb_func_end sub_80C9D98

	thumb_func_start ItemUseOutOfBattle_Medicine
ItemUseOutOfBattle_Medicine: @ 80C9DB0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9DC4 @ =gUnknown_03004AE4
	ldr r1, _080C9DC8 @ =sub_806FE2C
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080C9DC4: .4byte gUnknown_03004AE4
_080C9DC8: .4byte sub_806FE2C
	thumb_func_end ItemUseOutOfBattle_Medicine

	thumb_func_start ItemUseOutOfBattle_SacredAsh
ItemUseOutOfBattle_SacredAsh: @ 80C9DCC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080C9DDC @ =gUnknown_03005CE0
	movs r0, 0
	strb r0, [r1]
	movs r5, 0
	b _080C9DE6
	.align 2, 0
_080C9DDC: .4byte gUnknown_03005CE0
_080C9DE0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080C9DE6:
	cmp r5, 0x5
	bhi _080C9E10
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080C9E28 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080C9DE0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _080C9DE0
	ldr r0, _080C9E2C @ =gUnknown_03005CE0
	strb r5, [r0]
_080C9E10:
	ldr r1, _080C9E30 @ =gUnknown_03004AE4
	ldr r0, _080C9E34 @ =sub_8070048
	str r0, [r1]
	ldr r1, _080C9E38 @ =gUnknown_02038561
	movs r0, 0x4
	strb r0, [r1]
	adds r0, r6, 0
	bl unknown_ItemMenu_Confirm
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C9E28: .4byte gPlayerParty
_080C9E2C: .4byte gUnknown_03005CE0
_080C9E30: .4byte gUnknown_03004AE4
_080C9E34: .4byte sub_8070048
_080C9E38: .4byte gUnknown_02038561
	thumb_func_end ItemUseOutOfBattle_SacredAsh

	thumb_func_start ItemUseOutOfBattle_PPRecovery
ItemUseOutOfBattle_PPRecovery: @ 80C9E3C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9E50 @ =gUnknown_03004AE4
	ldr r1, _080C9E54 @ =dp05_ether
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080C9E50: .4byte gUnknown_03004AE4
_080C9E54: .4byte dp05_ether
	thumb_func_end ItemUseOutOfBattle_PPRecovery

	thumb_func_start ItemUseOutOfBattle_PPUp
ItemUseOutOfBattle_PPUp: @ 80C9E58
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9E6C @ =gUnknown_03004AE4
	ldr r1, _080C9E70 @ =dp05_pp_up
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080C9E6C: .4byte gUnknown_03004AE4
_080C9E70: .4byte dp05_pp_up
	thumb_func_end ItemUseOutOfBattle_PPUp

	thumb_func_start ItemUseOutOfBattle_RareCandy
ItemUseOutOfBattle_RareCandy: @ 80C9E74
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9E88 @ =gUnknown_03004AE4
	ldr r1, _080C9E8C @ =sub_8070680
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080C9E88: .4byte gUnknown_03004AE4
_080C9E8C: .4byte sub_8070680
	thumb_func_end ItemUseOutOfBattle_RareCandy

	thumb_func_start ItemUseOutOfBattle_TMHM
ItemUseOutOfBattle_TMHM: @ 80C9E90
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r0, _080C9EBC @ =word_203855E
	ldrh r1, [r0]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bls _080C9EC8
	ldr r1, _080C9EC0 @ =gOtherText_BootedHM
	ldr r2, _080C9EC4 @ =sub_80C9EE4
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080C9ED4
	.align 2, 0
_080C9EBC: .4byte word_203855E
_080C9EC0: .4byte gOtherText_BootedHM
_080C9EC4: .4byte sub_80C9EE4
_080C9EC8:
	ldr r1, _080C9EDC @ =gOtherText_BootedTM
	ldr r2, _080C9EE0 @ =sub_80C9EE4
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080C9ED4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9EDC: .4byte gOtherText_BootedTM
_080C9EE0: .4byte sub_80C9EE4
	thumb_func_end ItemUseOutOfBattle_TMHM

	thumb_func_start sub_80C9EE4
sub_80C9EE4: @ 80C9EE4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	bl PlaySE
	ldr r1, _080C9F08 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C9F0C @ =sub_80C9F10
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9F08: .4byte gTasks
_080C9F0C: .4byte sub_80C9F10
	thumb_func_end sub_80C9EE4

	thumb_func_start sub_80C9F10
sub_80C9F10: @ 80C9F10
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C9F64 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080C9F2A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080C9F5C
_080C9F2A:
	ldr r4, _080C9F68 @ =gStringVar1
	ldr r0, _080C9F6C @ =word_203855E
	ldrh r0, [r0]
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	muls r1, r0
	ldr r0, _080C9F70 @ =gMoveNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r4, _080C9F74 @ =gStringVar4
	ldr r1, _080C9F78 @ =gOtherText_ContainsMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080C9F7C @ =sub_80C9F80
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080C9F5C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9F64: .4byte gMain
_080C9F68: .4byte gStringVar1
_080C9F6C: .4byte word_203855E
_080C9F70: .4byte gMoveNames
_080C9F74: .4byte gStringVar4
_080C9F78: .4byte gOtherText_ContainsMove
_080C9F7C: .4byte sub_80C9F80
	thumb_func_end sub_80C9F10

	thumb_func_start sub_80C9F80
sub_80C9F80: @ 80C9F80
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _080C9FB8 @ =gBG1TilemapBuffer
	movs r1, 0x4
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x8
	movs r2, 0x8
	movs r3, 0x5
	bl sub_80A3FA0
	ldr r1, _080C9FBC @ =gUnknown_083D61F4
	adds r0, r4, 0
	bl sub_80F914C
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9FB8: .4byte gBG1TilemapBuffer
_080C9FBC: .4byte gUnknown_083D61F4
	thumb_func_end sub_80C9F80

	thumb_func_start sub_80C9FC0
sub_80C9FC0: @ 80C9FC0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9FD4 @ =gUnknown_03004AE4
	ldr r1, _080C9FD8 @ =sub_806F06C
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080C9FD4: .4byte gUnknown_03004AE4
_080C9FD8: .4byte sub_806F06C
	thumb_func_end sub_80C9FC0

	thumb_func_start sub_80C9FDC
sub_80C9FDC: @ 80C9FDC
	push {r4,lr}
	ldr r4, _080CA004 @ =word_203855E
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80A9538
	bl sub_80A3E0C
	ldrh r0, [r4]
	ldr r1, _080CA008 @ =gStringVar2
	bl itemid_copy_name
	ldr r0, _080CA00C @ =gStringVar4
	ldr r1, _080CA010 @ =gOtherText_UsedItem
	bl StringExpandPlaceholders
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA004: .4byte word_203855E
_080CA008: .4byte gStringVar2
_080CA00C: .4byte gStringVar4
_080CA010: .4byte gOtherText_UsedItem
	thumb_func_end sub_80C9FDC

	thumb_func_start ItemUseOutOfBattle_Repel
ItemUseOutOfBattle_Repel: @ 80CA014
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _080CA050 @ =0x00004021
	adds r0, r5, 0
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _080CA060
	ldr r0, _080CA054 @ =word_203855E
	ldrh r0, [r0]
	bl itemid_get_quality
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl VarSet
	bl sub_80C9FDC
	ldr r1, _080CA058 @ =gStringVar4
	ldr r2, _080CA05C @ =sub_80A5C48
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080CA06C
	.align 2, 0
_080CA050: .4byte 0x00004021
_080CA054: .4byte word_203855E
_080CA058: .4byte gStringVar4
_080CA05C: .4byte sub_80A5C48
_080CA060:
	ldr r1, _080CA074 @ =gOtherText_RepelLingers
	ldr r2, _080CA078 @ =sub_80A5C48
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA06C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA074: .4byte gOtherText_RepelLingers
_080CA078: .4byte sub_80A5C48
	thumb_func_end ItemUseOutOfBattle_Repel

	thumb_func_start sub_80CA07C
sub_80CA07C: @ 80CA07C
	push {lr}
	bl sub_80A3E0C
	ldr r0, _080CA090 @ =word_203855E
	ldrh r0, [r0]
	ldr r1, _080CA094 @ =gStringVar2
	bl itemid_copy_name
	pop {r0}
	bx r0
	.align 2, 0
_080CA090: .4byte word_203855E
_080CA094: .4byte gStringVar2
	thumb_func_end sub_80CA07C

	thumb_func_start sub_80CA098
sub_80CA098: @ 80CA098
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CA0D0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080CA0C8
	movs r0, 0x75
	bl PlaySE
	ldr r1, _080CA0D4 @ =gStringVar4
	ldr r2, _080CA0D8 @ =sub_80A5C48
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA0C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA0D0: .4byte gTasks
_080CA0D4: .4byte gStringVar4
_080CA0D8: .4byte sub_80A5C48
	thumb_func_end sub_80CA098

	thumb_func_start ItemUseOutOfBattle_BlackWhiteFlute
ItemUseOutOfBattle_BlackWhiteFlute: @ 80CA0DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _080CA10C @ =word_203855E
	ldrh r0, [r0]
	cmp r0, 0x2B
	bne _080CA124
	ldr r0, _080CA110 @ =0x0000084d
	bl FlagSet
	ldr r0, _080CA114 @ =0x0000084e
	bl FlagReset
	bl sub_80CA07C
	ldr r0, _080CA118 @ =gStringVar4
	ldr r1, _080CA11C @ =gOtherText_UsedFlute
	bl StringExpandPlaceholders
	ldr r1, _080CA120 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	b _080CA146
	.align 2, 0
_080CA10C: .4byte word_203855E
_080CA110: .4byte 0x0000084d
_080CA114: .4byte 0x0000084e
_080CA118: .4byte gStringVar4
_080CA11C: .4byte gOtherText_UsedFlute
_080CA120: .4byte gTasks
_080CA124:
	cmp r0, 0x2A
	bne _080CA152
	ldr r0, _080CA158 @ =0x0000084e
	bl FlagSet
	ldr r0, _080CA15C @ =0x0000084d
	bl FlagReset
	bl sub_80CA07C
	ldr r0, _080CA160 @ =gStringVar4
	ldr r1, _080CA164 @ =gOtherText_UsedRepel
	bl StringExpandPlaceholders
	ldr r1, _080CA168 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
_080CA146:
	lsls r0, 3
	adds r0, r1
	ldr r1, _080CA16C @ =sub_80CA098
	str r1, [r0]
	movs r1, 0
	strh r1, [r0, 0x26]
_080CA152:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA158: .4byte 0x0000084e
_080CA15C: .4byte 0x0000084d
_080CA160: .4byte gStringVar4
_080CA164: .4byte gOtherText_UsedRepel
_080CA168: .4byte gTasks
_080CA16C: .4byte sub_80CA098
	thumb_func_end ItemUseOutOfBattle_BlackWhiteFlute

	thumb_func_start task08_080A1C44
task08_080A1C44: @ 80CA170
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl player_avatar_init_params_reset
	bl sub_80878A8
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task08_080A1C44

	thumb_func_start sub_80CA18C
sub_80CA18C: @ 80CA18C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8053014
	bl sub_80C9FDC
	ldr r1, _080CA1BC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	ldr r1, _080CA1C0 @ =gStringVar4
	ldr r2, _080CA1C4 @ =task08_080A1C44
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA1BC: .4byte gTasks
_080CA1C0: .4byte gStringVar4
_080CA1C4: .4byte task08_080A1C44
	thumb_func_end sub_80CA18C

	thumb_func_start sub_80CA1C8
sub_80CA1C8: @ 80CA1C8
	push {lr}
	ldr r0, _080CA1D8 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x4
	beq _080CA1DC
	movs r0, 0
	b _080CA1DE
	.align 2, 0
_080CA1D8: .4byte gMapHeader
_080CA1DC:
	movs r0, 0x1
_080CA1DE:
	pop {r1}
	bx r1
	thumb_func_end sub_80CA1C8

	thumb_func_start ItemUseOutOfBattle_EscapeRope
ItemUseOutOfBattle_EscapeRope: @ 80CA1E4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80CA1C8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CA20C
	ldr r1, _080CA204 @ =gUnknown_03005D00
	ldr r0, _080CA208 @ =sub_80CA18C
	str r0, [r1]
	adds r0, r4, 0
	bl SetUpItemUseOnFieldCallback
	b _080CA21E
	.align 2, 0
_080CA204: .4byte gUnknown_03005D00
_080CA208: .4byte sub_80CA18C
_080CA20C:
	ldr r0, _080CA224 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080CA21E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA224: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_EscapeRope

	thumb_func_start ItemUseOutOfBattle_EvolutionStone
ItemUseOutOfBattle_EvolutionStone: @ 80CA228
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA23C @ =gUnknown_03004AE4
	ldr r1, _080CA240 @ =sub_8070DBC
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080CA23C: .4byte gUnknown_03004AE4
_080CA240: .4byte sub_8070DBC
	thumb_func_end ItemUseOutOfBattle_EvolutionStone

	thumb_func_start ItemUseInBattle_PokeBall
ItemUseInBattle_PokeBall: @ 80CA244
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl PlayerPartyAndPokemonStorageFull
	lsls r0, 24
	cmp r0, 0
	bne _080CA26C
	ldr r0, _080CA268 @ =word_203855E
	ldrh r0, [r0]
	movs r1, 0x1
	bl sub_80A9538
	adds r0, r4, 0
	bl sub_80A7094
	b _080CA284
	.align 2, 0
_080CA268: .4byte word_203855E
_080CA26C:
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r1, _080CA28C @ =gOtherText_BoxIsFull
	ldr r2, _080CA290 @ =sub_80A5C48
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA284:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA28C: .4byte gOtherText_BoxIsFull
_080CA290: .4byte sub_80A5C48
	thumb_func_end ItemUseInBattle_PokeBall

	thumb_func_start sub_80CA294
sub_80CA294: @ 80CA294
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080CA2B8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080CA2AE
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080CA2B4
_080CA2AE:
	adds r0, r2, 0
	bl sub_80A7094
_080CA2B4:
	pop {r0}
	bx r0
	.align 2, 0
_080CA2B8: .4byte gMain
	thumb_func_end sub_80CA294

	thumb_func_start sub_80CA2BC
sub_80CA2BC: @ 80CA2BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080CA304 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080CA2FC
	movs r0, 0x1
	bl PlaySE
	ldr r4, _080CA308 @ =word_203855E
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80A9538
	ldrh r0, [r4]
	bl sub_803F378
	adds r1, r0, 0
	ldr r2, _080CA30C @ =sub_80CA294
	adds r0, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA2FC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA304: .4byte gTasks
_080CA308: .4byte word_203855E
_080CA30C: .4byte sub_80CA294
	thumb_func_end sub_80CA2BC

	thumb_func_start ItemUseInBattle_StatIncrease
ItemUseInBattle_StatIncrease: @ 80CA310
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080CA35C @ =gUnknown_02024A6A
	ldr r0, _080CA360 @ =gUnknown_02024E6C
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r4, [r0]
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080CA364 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080CA368 @ =word_203855E
	ldrh r1, [r1]
	lsls r4, 24
	lsrs r4, 24
	adds r2, r4, 0
	movs r3, 0
	bl ExecuteTableBasedItemEffect_
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080CA374
	ldr r1, _080CA36C @ =gOtherText_WontHaveAnyEffect
	ldr r2, _080CA370 @ =sub_80A5C48
	adds r0, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080CA384
	.align 2, 0
_080CA35C: .4byte gUnknown_02024A6A
_080CA360: .4byte gUnknown_02024E6C
_080CA364: .4byte gPlayerParty
_080CA368: .4byte word_203855E
_080CA36C: .4byte gOtherText_WontHaveAnyEffect
_080CA370: .4byte sub_80A5C48
_080CA374:
	ldr r0, _080CA38C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080CA390 @ =sub_80CA2BC
	str r0, [r1]
	strh r2, [r1, 0x26]
_080CA384:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA38C: .4byte gTasks
_080CA390: .4byte sub_80CA2BC
	thumb_func_end ItemUseInBattle_StatIncrease

	thumb_func_start sub_80CA394
sub_80CA394: @ 80CA394
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CA3BC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CA3B4
	bl sub_8094E4C
	bl gpu_pal_allocator_reset__manage_upper_four
	adds r0, r4, 0
	bl DestroyTask
_080CA3B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA3BC: .4byte gPaletteFade
	thumb_func_end sub_80CA394

	thumb_func_start sub_80CA3C0
sub_80CA3C0: @ 80CA3C0
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA3EC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080CA3F0 @ =sub_80CA394
	str r0, [r1]
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
_080CA3EC: .4byte gTasks
_080CA3F0: .4byte sub_80CA394
	thumb_func_end sub_80CA3C0

	thumb_func_start ItemUseInBattle_Medicine
ItemUseInBattle_Medicine: @ 80CA3F4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA408 @ =gUnknown_03004AE4
	ldr r1, _080CA40C @ =sub_806FE2C
	str r1, [r2]
	bl sub_80CA3C0
	pop {r0}
	bx r0
	.align 2, 0
_080CA408: .4byte gUnknown_03004AE4
_080CA40C: .4byte sub_806FE2C
	thumb_func_end ItemUseInBattle_Medicine

	thumb_func_start unref_sub_80CA410
unref_sub_80CA410: @ 80CA410
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA424 @ =gUnknown_03004AE4
	ldr r1, _080CA428 @ =sub_8070048
	str r1, [r2]
	bl sub_80CA3C0
	pop {r0}
	bx r0
	.align 2, 0
_080CA424: .4byte gUnknown_03004AE4
_080CA428: .4byte sub_8070048
	thumb_func_end unref_sub_80CA410

	thumb_func_start ItemUseInBattle_PPRecovery
ItemUseInBattle_PPRecovery: @ 80CA42C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA440 @ =gUnknown_03004AE4
	ldr r1, _080CA444 @ =dp05_ether
	str r1, [r2]
	bl sub_80CA3C0
	pop {r0}
	bx r0
	.align 2, 0
_080CA440: .4byte gUnknown_03004AE4
_080CA444: .4byte dp05_ether
	thumb_func_end ItemUseInBattle_PPRecovery

	thumb_func_start unref_sub_80CA448
unref_sub_80CA448: @ 80CA448
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r4, _080CA494 @ =word_203855E
	ldrh r1, [r4]
	movs r0, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	bne _080CA4AC
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80A9538
	ldr r0, _080CA498 @ =gPlayerParty
	ldr r1, _080CA49C @ =gStringVar1
	bl GetMonNickname
	ldr r4, _080CA4A0 @ =gStringVar4
	ldr r1, _080CA4A4 @ =gOtherText_SnapConfusion
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080CA4A8 @ =sub_80A7094
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080CA4B8
	.align 2, 0
_080CA494: .4byte word_203855E
_080CA498: .4byte gPlayerParty
_080CA49C: .4byte gStringVar1
_080CA4A0: .4byte gStringVar4
_080CA4A4: .4byte gOtherText_SnapConfusion
_080CA4A8: .4byte sub_80A7094
_080CA4AC:
	ldr r1, _080CA4C0 @ =gOtherText_WontHaveAnyEffect
	ldr r2, _080CA4C4 @ =sub_80A5C48
	adds r0, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA4B8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA4C0: .4byte gOtherText_WontHaveAnyEffect
_080CA4C4: .4byte sub_80A5C48
	thumb_func_end unref_sub_80CA448

	thumb_func_start ItemUseInBattle_Escape
ItemUseInBattle_Escape: @ 80CA4C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r0, _080CA4F8 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _080CA504
	bl sub_80C9FDC
	ldr r1, _080CA4FC @ =gStringVar4
	ldr r2, _080CA500 @ =sub_80A7094
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080CA516
	.align 2, 0
_080CA4F8: .4byte gUnknown_020239F8
_080CA4FC: .4byte gStringVar4
_080CA500: .4byte sub_80A7094
_080CA504:
	ldr r0, _080CA51C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080CA516:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA51C: .4byte gTasks
	thumb_func_end ItemUseInBattle_Escape

	thumb_func_start ItemUseOutOfBattle_EnigmaBerry
ItemUseOutOfBattle_EnigmaBerry: @ 80CA520
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CA544 @ =word_203855E
	ldrh r0, [r0]
	bl sub_8070E48
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x14
	bls _080CA53A
	b _080CA62C
_080CA53A:
	lsls r0, 2
	ldr r1, _080CA548 @ =_080CA54C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CA544: .4byte word_203855E
_080CA548: .4byte _080CA54C
	.align 2, 0
_080CA54C:
	.4byte _080CA5D8
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA62C
	.4byte _080CA62C
	.4byte _080CA5BC
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA62C
	.4byte _080CA5F4
	.4byte _080CA5F4
	.4byte _080CA610
_080CA5A0:
	ldr r0, _080CA5B8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_Medicine
	b _080CA640
	.align 2, 0
_080CA5B8: .4byte gTasks
_080CA5BC:
	ldr r0, _080CA5D4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_SacredAsh
	b _080CA640
	.align 2, 0
_080CA5D4: .4byte gTasks
_080CA5D8:
	ldr r0, _080CA5F0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_RareCandy
	b _080CA640
	.align 2, 0
_080CA5F0: .4byte gTasks
_080CA5F4:
	ldr r0, _080CA60C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_PPUp
	b _080CA640
	.align 2, 0
_080CA60C: .4byte gTasks
_080CA610:
	ldr r0, _080CA628 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_PPRecovery
	b _080CA640
	.align 2, 0
_080CA628: .4byte gTasks
_080CA62C:
	ldr r0, _080CA648 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x4
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_CannotUse
_080CA640:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA648: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_EnigmaBerry

	thumb_func_start ItemUseInBattle_EnigmaBerry
ItemUseInBattle_EnigmaBerry: @ 80CA64C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CA66C @ =word_203855E
	ldrh r0, [r0]
	bl sub_8070E48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	bhi _080CA6E4
	lsls r0, 2
	ldr r1, _080CA670 @ =_080CA674
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CA66C: .4byte word_203855E
_080CA670: .4byte _080CA674
	.align 2, 0
_080CA674:
	.4byte _080CA6CC
	.4byte _080CA6E4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6E4
	.4byte _080CA6D4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6DC
_080CA6CC:
	adds r0, r4, 0
	bl ItemUseInBattle_StatIncrease
	b _080CA6EA
_080CA6D4:
	adds r0, r4, 0
	bl ItemUseInBattle_Medicine
	b _080CA6EA
_080CA6DC:
	adds r0, r4, 0
	bl ItemUseInBattle_PPRecovery
	b _080CA6EA
_080CA6E4:
	adds r0, r4, 0
	bl ItemUseOutOfBattle_CannotUse
_080CA6EA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ItemUseInBattle_EnigmaBerry

	thumb_func_start ItemUseOutOfBattle_CannotUse
ItemUseOutOfBattle_CannotUse: @ 80CA6F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA70C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r1, [r1, 0xC]
	bl DisplayDadsAdviceCannotUseItemMessage
	pop {r0}
	bx r0
	.align 2, 0
_080CA70C: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_CannotUse

	thumb_func_start sub_80CA710
sub_80CA710: @ 80CA710
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080CA744 @ =gUnknown_03004B00
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080CA748 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CA74C
	ldrh r0, [r5, 0x8]
	negs r0, r0
	b _080CA74E
	.align 2, 0
_080CA744: .4byte gUnknown_03004B00
_080CA748: .4byte gUnknown_0202F7C8
_080CA74C:
	ldrh r0, [r5, 0x8]
_080CA74E:
	strh r0, [r4, 0x34]
	ldr r0, _080CA760 @ =gUnknown_03004B00
	ldrh r0, [r0, 0xA]
	strh r0, [r4, 0x36]
	ldr r0, _080CA764 @ =sub_80CA768
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA760: .4byte gUnknown_03004B00
_080CA764: .4byte sub_80CA768
	thumb_func_end sub_80CA710

	thumb_func_start sub_80CA768
sub_80CA768: @ 80CA768
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080CA7A4
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r1, r0
	strh r1, [r4, 0x32]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080CA7AA
_080CA7A4:
	adds r0, r4, 0
	bl move_anim_8072740
_080CA7AA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CA768

	thumb_func_start sub_80CA7B0
sub_80CA7B0: @ 80CA7B0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080CA7F0 @ =gUnknown_03004B00
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r5, _080CA7F4 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _080CA7F8 @ =sub_8078B34
	str r0, [r4, 0x1C]
	ldr r1, _080CA7FC @ =move_anim_8074EE0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA7F0: .4byte gUnknown_03004B00
_080CA7F4: .4byte gUnknown_0202F7C8
_080CA7F8: .4byte sub_8078B34
_080CA7FC: .4byte move_anim_8074EE0
	thumb_func_end sub_80CA7B0

	thumb_func_start sub_80CA800
sub_80CA800: @ 80CA800
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r5, _080CA848 @ =gUnknown_03004B00
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldr r5, _080CA84C @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _080CA850 @ =sub_8078B34
	str r0, [r4, 0x1C]
	ldr r1, _080CA854 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA848: .4byte gUnknown_03004B00
_080CA84C: .4byte gUnknown_0202F7C9
_080CA850: .4byte sub_8078B34
_080CA854: .4byte move_anim_8072740
	thumb_func_end sub_80CA800

	thumb_func_start sub_80CA858
sub_80CA858: @ 80CA858
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r6, _080CA8A8 @ =gUnknown_03004B00
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r5, _080CA8AC @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r6, 0x6]
	strh r0, [r4, 0x38]
	ldr r1, _080CA8B0 @ =sub_80CA8B4
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CA8A8: .4byte gUnknown_03004B00
_080CA8AC: .4byte gUnknown_0202F7C9
_080CA8B0: .4byte sub_80CA8B4
	thumb_func_end sub_80CA858

	thumb_func_start sub_80CA8B4
sub_80CA8B4: @ 80CA8B4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080CA8CA
	adds r0, r4, 0
	bl DestroySprite
	b _080CA91E
_080CA8CA:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _080CA8E4
	ldr r0, _080CA8E0 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl sub_8079E90
	adds r0, 0x1
	b _080CA8EE
	.align 2, 0
_080CA8E0: .4byte gUnknown_0202F7C9
_080CA8E4:
	ldr r0, _080CA924 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl sub_8079E90
	adds r0, 0x6
_080CA8EE:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xE
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0xF
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
_080CA91E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA924: .4byte gUnknown_0202F7C9
	thumb_func_end sub_80CA8B4

	thumb_func_start sub_80CA928
sub_80CA928: @ 80CA928
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080CA998 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	subs r0, 0x1
	movs r2, 0
	strh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080CA982
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	movs r0, 0x6
	strh r0, [r5, 0x8]
	ldr r1, _080CA99C @ =gUnknown_03004B00
	movs r0, 0xF
	strh r0, [r1]
	strh r2, [r1, 0x2]
	movs r0, 0x50
	strh r0, [r1, 0x4]
	strh r2, [r1, 0x6]
	ldr r4, _080CA9A0 @ =gSpriteTemplate_83D631C
	ldr r0, _080CA9A4 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl sub_8079E90
	adds r3, r0, 0
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl CreateSpriteAndAnimate
_080CA982:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0xF
	bne _080CA990
	adds r0, r6, 0
	bl move_anim_task_del
_080CA990:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CA998: .4byte gTasks
_080CA99C: .4byte gUnknown_03004B00
_080CA9A0: .4byte gSpriteTemplate_83D631C
_080CA9A4: .4byte gUnknown_0202F7C9
	thumb_func_end sub_80CA928

	thumb_func_start sub_80CA9A8
sub_80CA9A8: @ 80CA9A8
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r6, _080CA9EC @ =gUnknown_03004B00
	ldrh r0, [r6, 0x6]
	strh r0, [r4, 0x2E]
	ldr r5, _080CA9F0 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _080CA9F4 @ =sub_80CA9F8
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CA9EC: .4byte gUnknown_03004B00
_080CA9F0: .4byte gUnknown_0202F7C8
_080CA9F4: .4byte sub_80CA9F8
	thumb_func_end sub_80CA9A8

	thumb_func_start sub_80CA9F8
sub_80CA9F8: @ 80CA9F8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080CAA0C
	adds r0, r4, 0
	bl move_anim_8072740
_080CAA0C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CA9F8

	thumb_func_start sub_80CAA14
sub_80CAA14: @ 80CAA14
	push {r4,r5,lr}
	adds r5, r0, 0
	bl Random
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x7
	ands r1, r0
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r4, _080CAA5C @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CAA60
	ldrh r0, [r5, 0x20]
	subs r0, 0x14
	b _080CAA64
	.align 2, 0
_080CAA5C: .4byte gUnknown_0202F7C8
_080CAA60:
	ldrh r0, [r5, 0x20]
	adds r0, 0x14
_080CAA64:
	strh r0, [r5, 0x20]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1F
	ands r0, r1
	adds r0, 0x40
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080CAAC4 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078D60
	bl Random
	movs r1, 0xFF
	ands r1, r0
	strh r1, [r5, 0x38]
	adds r0, r5, 0
	adds r0, 0x43
	ldrb r0, [r0]
	strh r0, [r5, 0x3A]
	ldr r1, _080CAAC8 @ =sub_80CAACC
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CAAC4: .4byte gUnknown_0202F7C9
_080CAAC8: .4byte sub_80CAACC
	thumb_func_end sub_80CAA14

	thumb_func_start sub_80CAACC
sub_80CAACC: @ 80CAACC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078CE8
	lsls r0, 24
	cmp r0, 0
	beq _080CAAE2
	adds r0, r4, 0
	bl move_anim_8072740
	b _080CAB12
_080CAAE2:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xC
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x7E
	bgt _080CAAFE
	ldrh r0, [r4, 0x3A]
	b _080CAB02
_080CAAFE:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
_080CAB02:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrh r0, [r4, 0x38]
	adds r0, 0x18
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
_080CAB12:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CAACC

	thumb_func_start sub_80CAB18
sub_80CAB18: @ 80CAB18
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080CAB78 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CAB38
	ldr r1, _080CAB7C @ =gUnknown_03004B00
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080CAB38:
	ldr r4, _080CAB7C @ =gUnknown_03004B00
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080CAB80 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r6, 0x36]
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x38]
	adds r0, r6, 0
	bl sub_80786EC
	ldr r0, _080CAB84 @ =sub_80CAB88
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CAB78: .4byte gUnknown_0202F7C8
_080CAB7C: .4byte gUnknown_03004B00
_080CAB80: .4byte gUnknown_0202F7C9
_080CAB84: .4byte sub_80CAB88
	thumb_func_end sub_80CAB18

	thumb_func_start sub_80CAB88
sub_80CAB88: @ 80CAB88
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080CABB2
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	ldr r0, _080CABB8 @ =sub_80782D8
	str r0, [r4, 0x1C]
	ldr r1, _080CABBC @ =sub_80CABC0
	adds r0, r4, 0
	bl oamt_set_x3A_32
_080CABB2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CABB8: .4byte sub_80782D8
_080CABBC: .4byte sub_80CABC0
	thumb_func_end sub_80CAB88

	thumb_func_start sub_80CABC0
sub_80CABC0: @ 80CABC0
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0x3C
	strh r0, [r4, 0x2E]
	ldr r0, _080CABF0 @ =sub_80782D8
	str r0, [r4, 0x1C]
	ldr r1, _080CABF4 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CABF0: .4byte sub_80782D8
_080CABF4: .4byte move_anim_8072740
	thumb_func_end sub_80CABC0

	thumb_func_start sub_80CABF8
sub_80CABF8: @ 80CABF8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r5, _080CAC3C @ =gUnknown_03004B00
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080CAC22
	ldrb r0, [r4, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x1]
_080CAC22:
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x30]
	ldr r1, _080CAC40 @ =sub_80CAC44
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CAC3C: .4byte gUnknown_03004B00
_080CAC40: .4byte sub_80CAC44
	thumb_func_end sub_80CABF8

	thumb_func_start sub_80CAC44
sub_80CAC44: @ 80CAC44
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	negs r1, r1
	bl Cos
	ldrh r1, [r4, 0x32]
	adds r1, 0x18
	strh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7F
	bhi _080CAC98
	ldr r0, _080CAC94 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	b _080CACBC
	.align 2, 0
_080CAC94: .4byte gUnknown_0202F7C9
_080CAC98:
	ldr r0, _080CACE8 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl sub_8079ED4
	adds r0, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080CACAC
	movs r2, 0x3
_080CACAC:
	movs r0, 0x3
	ands r2, r0
	lsls r2, 2
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
_080CACBC:
	strb r0, [r4, 0x5]
	ldrh r0, [r4, 0x30]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080CACE0
	adds r0, r4, 0
	bl move_anim_8072740
_080CACE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CACE8: .4byte gUnknown_0202F7C9
	thumb_func_end sub_80CAC44

	thumb_func_start sub_80CACEC
sub_80CACEC: @ 80CACEC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080CAD06
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _080CAD0E
_080CAD06:
	adds r0, r4, 0
	bl move_anim_task_del
	b _080CAD4A
_080CAD0E:
	ldr r0, _080CAD2C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CAD34
	ldr r0, _080CAD30 @ =REG_BG2CNT
	ldrb r1, [r0]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0]
	b _080CAD44
	.align 2, 0
_080CAD2C: .4byte gUnknown_0202F7C9
_080CAD30: .4byte REG_BG2CNT
_080CAD34:
	ldr r2, _080CAD50 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_080CAD44:
	adds r0, r4, 0
	bl move_anim_task_del
_080CAD4A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CAD50: .4byte REG_BG1CNT
	thumb_func_end sub_80CACEC

	thumb_func_start sub_80CAD54
sub_80CAD54: @ 80CAD54
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_80787B0
	ldr r5, _080CAD9C @ =gUnknown_03004B00
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldr r0, _080CADA0 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x4]
	adds r0, r5
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x40
	strh r0, [r4, 0x38]
	ldr r1, _080CADA4 @ =sub_80CADA8
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CAD9C: .4byte gUnknown_03004B00
_080CADA0: .4byte gUnknown_0202F7C8
_080CADA4: .4byte sub_80CADA8
	thumb_func_end sub_80CAD54

	thumb_func_start sub_80CADA8
sub_80CADA8: @ 80CADA8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080CAE14
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	negs r1, r1
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7F
	bhi _080CADF4
	ldr r0, _080CADF0 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	b _080CADFE
	.align 2, 0
_080CADF0: .4byte gUnknown_0202F7C8
_080CADF4:
	ldr r0, _080CAE10 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl sub_8079E90
	adds r0, 0x1
_080CADFE:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrh r0, [r4, 0x38]
	adds r0, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080CAE1A
	.align 2, 0
_080CAE10: .4byte gUnknown_0202F7C8
_080CAE14:
	adds r0, r4, 0
	bl move_anim_8072740
_080CAE1A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CADA8

	thumb_func_start sub_80CAE20
sub_80CAE20: @ 80CAE20
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r5, _080CAE68 @ =gUnknown_03004B00
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldr r0, _080CAE6C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x4]
	adds r0, r5
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x40
	strh r0, [r4, 0x38]
	ldr r1, _080CAE70 @ =sub_80CAE74
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CAE68: .4byte gUnknown_03004B00
_080CAE6C: .4byte gUnknown_0202F7C8
_080CAE70: .4byte sub_80CAE74
	thumb_func_end sub_80CAE20

	thumb_func_start sub_80CAE74
sub_80CAE74: @ 80CAE74
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080CAECC
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldrh r1, [r4, 0x38]
	adds r0, r1, 0
	subs r0, 0x3B
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _080CAEAC
	adds r0, r1, 0
	subs r0, 0xBB
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bhi _080CAEC0
_080CAEAC:
	ldrb r2, [r4, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x8
	eors r1, r0
	lsls r1, 1
	subs r0, 0x47
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
_080CAEC0:
	ldrh r0, [r4, 0x38]
	adds r0, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080CAED2
_080CAECC:
	adds r0, r4, 0
	bl move_anim_8072740
_080CAED2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CAE74

	thumb_func_start sub_80CAED8
sub_80CAED8: @ 80CAED8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080CAF14 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r1, _080CAF18 @ =gUnknown_03004B00
	ldrh r0, [r1]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x32]
	ldr r0, _080CAF1C @ =sub_80CAF20
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CAF14: .4byte gUnknown_0202F7C8
_080CAF18: .4byte gUnknown_03004B00
_080CAF1C: .4byte sub_80CAF20
	thumb_func_end sub_80CAED8

	thumb_func_start sub_80CAF20
sub_80CAF20: @ 80CAF20
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x32]
	movs r2, 0x32
	ldrsh r3, [r1, r2]
	cmp r3, 0
	bne _080CAF54
	ldrh r0, [r1, 0x30]
	movs r2, 0x1
	ands r2, r0
	cmp r2, 0
	beq _080CAF42
	movs r0, 0x80
	strh r0, [r1, 0x2E]
	strh r3, [r1, 0x30]
	strh r3, [r1, 0x32]
	b _080CAF48
_080CAF42:
	strh r2, [r1, 0x2E]
	strh r2, [r1, 0x30]
	strh r2, [r1, 0x32]
_080CAF48:
	ldr r0, _080CAF50 @ =sub_80CAF6C
	str r0, [r1, 0x1C]
	b _080CAF68
	.align 2, 0
_080CAF50: .4byte sub_80CAF6C
_080CAF54:
	subs r0, 0x1
	strh r0, [r1, 0x32]
	ldrh r0, [r1, 0x2E]
	ldrh r2, [r1, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x30]
	ldrh r2, [r1, 0x22]
	adds r0, r2
	strh r0, [r1, 0x22]
_080CAF68:
	pop {r0}
	bx r0
	thumb_func_end sub_80CAF20

	thumb_func_start sub_80CAF6C
sub_80CAF6C: @ 80CAF6C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080CAF8C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CAF90
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x19
	bl Sin
	negs r0, r0
	b _080CAF9A
	.align 2, 0
_080CAF8C: .4byte gUnknown_0202F7C8
_080CAF90:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x19
	bl Sin
_080CAF9A:
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080CAFBA
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
_080CAFBA:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x50
	ble _080CAFC8
	adds r0, r4, 0
	bl move_anim_8072740
_080CAFC8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CAF6C

	thumb_func_start sub_80CAFD0
sub_80CAFD0: @ 80CAFD0
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080CB024 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CAFF0
	ldr r1, _080CB028 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080CAFF0:
	ldr r6, _080CB028 @ =gUnknown_03004B00
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	movs r1, 0xC
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080CB030
	ldr r4, _080CB02C @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x6]
	adds r0, r6
	b _080CB050
	.align 2, 0
_080CB024: .4byte gUnknown_0202F7C8
_080CB028: .4byte gUnknown_03004B00
_080CB02C: .4byte gUnknown_0202F7C9
_080CB030:
	ldr r0, _080CB07C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_807A3FC
	ldrh r0, [r6, 0x4]
	ldrh r1, [r5, 0x32]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r6, 0x6]
	ldrh r1, [r5, 0x36]
	adds r0, r1
_080CB050:
	strh r0, [r5, 0x36]
	ldr r0, _080CB080 @ =gUnknown_03004B00
	ldrh r0, [r0, 0xA]
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_80786EC
	ldr r0, _080CB084 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r0, _080CB07C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080CB088
	movs r0, 0x1
	b _080CB08A
	.align 2, 0
_080CB07C: .4byte gUnknown_0202F7C9
_080CB080: .4byte gUnknown_03004B00
_080CB084: .4byte gUnknown_0202F7C8
_080CB088:
	movs r0, 0
_080CB08A:
	strh r0, [r5, 0x2E]
	ldr r0, _080CB098 @ =sub_80CB09C
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB098: .4byte sub_80CB09C
	thumb_func_end sub_80CAFD0

	thumb_func_start sub_80CB09C
sub_80CB09C: @ 80CB09C
	push {r4-r7,lr}
	adds r6, r0, 0
	movs r7, 0
	ldrh r5, [r6, 0x2E]
	ldrh r4, [r6, 0x3C]
	movs r0, 0x1
	strh r0, [r6, 0x2E]
	adds r0, r6, 0
	bl sub_8078718
	ldrh r0, [r6, 0x3C]
	strh r5, [r6, 0x2E]
	lsls r4, 16
	asrs r4, 16
	cmp r4, 0xC8
	ble _080CB0CE
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x37
	bgt _080CB0CE
	ldrh r0, [r6, 0x6]
	cmp r0, 0
	bne _080CB0D4
	adds r0, 0x1
	strh r0, [r6, 0x6]
_080CB0CE:
	ldrh r0, [r6, 0x6]
	cmp r0, 0
	beq _080CB106
_080CB0D4:
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080CB106
	adds r3, r6, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r6, 0x6]
	adds r0, 0x1
	strh r0, [r6, 0x6]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bne _080CB106
	movs r7, 0x1
_080CB106:
	movs r2, 0x20
	ldrsh r0, [r6, r2]
	movs r2, 0x24
	ldrsh r1, [r6, r2]
	adds r0, r1
	adds r0, 0x10
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	bhi _080CB130
	movs r0, 0x22
	ldrsh r1, [r6, r0]
	movs r2, 0x26
	ldrsh r0, [r6, r2]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080CB130
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080CB132
_080CB130:
	movs r7, 0x1
_080CB132:
	cmp r7, 0
	beq _080CB13C
	adds r0, r6, 0
	bl move_anim_8072740
_080CB13C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80CB09C

	thumb_func_start sub_80CB144
sub_80CB144: @ 80CB144
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080CB170
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CB170
	ldr r0, _080CB198 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_807A3FC
_080CB170:
	ldrh r0, [r4, 0x22]
	adds r0, 0x20
	strh r0, [r4, 0x22]
	ldr r1, _080CB19C @ =gUnknown_03004B00
	ldrh r0, [r1]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x36]
	ldr r0, _080CB1A0 @ =sub_80CB1A4
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB198: .4byte gUnknown_0202F7C9
_080CB19C: .4byte gUnknown_03004B00
_080CB1A0: .4byte sub_80CB1A4
	thumb_func_end sub_80CB144

	thumb_func_start sub_80CB1A4
sub_80CB1A4: @ 80CB1A4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0xFF
	bne _080CB1BA
	ldrh r0, [r4, 0x22]
	subs r0, 0x2
	strh r0, [r4, 0x22]
	b _080CB1C8
_080CB1BA:
	cmp r0, 0
	ble _080CB1C8
	ldrh r0, [r4, 0x22]
	subs r0, 0x2
	strh r0, [r4, 0x22]
	subs r0, r1, 0x2
	strh r0, [r4, 0x30]
_080CB1C8:
	ldrh r3, [r4, 0x32]
	ldrh r5, [r4, 0x38]
	adds r2, r3, r5
	strh r2, [r4, 0x38]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r5, 0x36
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _080CB1E0
	adds r0, r2, r3
	strh r0, [r4, 0x38]
_080CB1E0:
	ldrh r1, [r4, 0x38]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r5, 0x38
	ldrsh r0, [r4, r5]
	movs r1, 0x5
	bl Sin
	strh r0, [r4, 0x26]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	bgt _080CB220
	ldr r0, _080CB21C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	b _080CB22E
	.align 2, 0
_080CB21C: .4byte gUnknown_0202F7C9
_080CB220:
	ldr r0, _080CB258 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
_080CB22E:
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080CB252
	adds r0, r4, 0
	bl move_anim_8072740
_080CB252:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB258: .4byte gUnknown_0202F7C9
	thumb_func_end sub_80CB1A4

	thumb_func_start sub_80CB25C
sub_80CB25C: @ 80CB25C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0
	bl sub_8078764
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r4, _080CB290 @ =gUnknown_03004B00
	ldrb r1, [r4, 0x4]
	adds r0, r5, 0
	bl StartSpriteAffineAnim
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x3A]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x3C]
	ldr r0, _080CB294 @ =sub_80CB298
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB290: .4byte gUnknown_03004B00
_080CB294: .4byte sub_80CB298
	thumb_func_end sub_80CB25C

	thumb_func_start sub_80CB298
sub_80CB298: @ 80CB298
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080CB2C8 @ =gUnknown_03004B00
	ldrh r1, [r0, 0xE]
	ldr r0, _080CB2CC @ =0x0000ffff
	cmp r1, r0
	bne _080CB2C2
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0x2E]
	ldr r0, _080CB2D0 @ =sub_80CB2D4
	str r0, [r4, 0x1C]
_080CB2C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB2C8: .4byte gUnknown_03004B00
_080CB2CC: .4byte 0x0000ffff
_080CB2D0: .4byte sub_80CB2D4
	thumb_func_end sub_80CB298

	thumb_func_start sub_80CB2D4
sub_80CB2D4: @ 80CB2D4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080CB2EC
	ldrh r0, [r4, 0x2E]
	adds r0, 0xB
	b _080CB2F0
_080CB2EC:
	ldrh r0, [r4, 0x2E]
	subs r0, 0xB
_080CB2F0:
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080CB30C
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x32]
_080CB30C:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080CB33A
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	cmp r0, 0
	ble _080CB334
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	b _080CB33A
_080CB334:
	adds r0, r4, 0
	bl move_anim_8072740
_080CB33A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CB2D4

	thumb_func_start sub_80CB340
sub_80CB340: @ 80CB340
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080CB36C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _080CB370
	adds r0, r4, 0
	bl move_anim_task_del
	b _080CB396
	.align 2, 0
_080CB36C: .4byte gSprites
_080CB370:
	adds r0, r2, 0
	movs r1, 0x1
	bl sub_8078E70
	ldr r1, _080CB39C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080CB3A0 @ =gUnknown_03004B00
	ldrh r1, [r2]
	strh r1, [r0, 0x8]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0xA]
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r0, 0x1E]
	ldr r1, _080CB3A4 @ =sub_80CB3A8
	str r1, [r0]
_080CB396:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB39C: .4byte gTasks
_080CB3A0: .4byte gUnknown_03004B00
_080CB3A4: .4byte sub_80CB3A8
	thumb_func_end sub_80CB340

	thumb_func_start sub_80CB3A8
sub_80CB3A8: @ 80CB3A8
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080CB428 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x8]
	ldrh r0, [r4, 0x1C]
	adds r1, r0
	strh r1, [r4, 0x1C]
	ldr r2, _080CB42C @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r2
	lsls r1, 16
	asrs r1, 24
	strh r1, [r5, 0x24]
	ldr r0, _080CB430 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CB3F2
	ldrh r0, [r5, 0x24]
	negs r0, r0
	strh r0, [r5, 0x24]
_080CB3F2:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x10
	strh r0, [r4, 0x1E]
	movs r0, 0x1E
	ldrsh r2, [r4, r0]
	adds r0, r6, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	adds r0, r6, 0
	bl sub_8079A64
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080CB420
	strh r0, [r4, 0x8]
	ldr r0, _080CB434 @ =sub_80CB438
	str r0, [r4]
_080CB420:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB428: .4byte gTasks
_080CB42C: .4byte gSprites
_080CB430: .4byte gUnknown_0202F7C9
_080CB434: .4byte sub_80CB438
	thumb_func_end sub_80CB3A8

	thumb_func_start sub_80CB438
sub_80CB438: @ 80CB438
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080CB484 @ =gUnknown_03004B00
	ldrh r1, [r0, 0xE]
	ldr r0, _080CB488 @ =0x0000ffff
	cmp r1, r0
	bne _080CB494
	ldr r0, _080CB48C @ =gTasks
	lsls r2, r3, 2
	adds r1, r2, r3
	lsls r1, 3
	adds r6, r1, r0
	movs r1, 0x8
	ldrsh r5, [r6, r1]
	adds r4, r0, 0
	cmp r5, 0
	bne _080CB4A8
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8078F40
	ldr r1, _080CB490 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	strh r5, [r0, 0x24]
	strh r5, [r0, 0x26]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	b _080CB4C2
	.align 2, 0
_080CB484: .4byte gUnknown_03004B00
_080CB488: .4byte 0x0000ffff
_080CB48C: .4byte gTasks
_080CB490: .4byte gSprites
_080CB494:
	ldr r1, _080CB4C8 @ =gTasks
	lsls r2, r3, 2
	adds r0, r2, r3
	lsls r0, 3
	adds r0, r1
	movs r4, 0x8
	ldrsh r0, [r0, r4]
	adds r4, r1, 0
	cmp r0, 0
	beq _080CB4C2
_080CB4A8:
	adds r1, r2, r3
	lsls r1, 3
	adds r1, r4
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080CB4C2
	adds r0, r3, 0
	bl move_anim_task_del
_080CB4C2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB4C8: .4byte gTasks
	thumb_func_end sub_80CB438

	thumb_func_start sub_80CB4CC
sub_80CB4CC: @ 80CB4CC
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080CB4DE
	cmp r0, 0x1
	beq _080CB538
	b _080CB58A
_080CB4DE:
	ldr r6, _080CB530 @ =gUnknown_0202F7C9
	ldrb r0, [r6]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CB4F6
	ldr r1, _080CB534 @ =gUnknown_03004B00
	movs r2, 0
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1]
_080CB4F6:
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080CB534 @ =gUnknown_03004B00
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
	strh r0, [r5, 0x22]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080CB58A
	.align 2, 0
_080CB530: .4byte gUnknown_0202F7C9
_080CB534: .4byte gUnknown_03004B00
_080CB538:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080CB58A
	adds r0, r5, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
	movs r0, 0x19
	strh r0, [r5, 0x2E]
	ldr r4, _080CB590 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _080CB594 @ =sub_8078CC0
	str r0, [r5, 0x1C]
	ldr r1, _080CB598 @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
_080CB58A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB590: .4byte gUnknown_0202F7C8
_080CB594: .4byte sub_8078CC0
_080CB598: .4byte move_anim_8072740
	thumb_func_end sub_80CB4CC

	thumb_func_start sub_80CB59C
sub_80CB59C: @ 80CB59C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080CB608
	ldr r4, _080CB614 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r4, _080CB618 @ =gUnknown_03004B00
	ldrh r0, [r4]
	strh r0, [r5, 0x24]
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x26]
	ldrb r0, [r4, 0x4]
	adds r0, 0x1E
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r4, 0x6]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	movs r2, 0x22
	ldrsh r0, [r5, r2]
	movs r2, 0x26
	ldrsh r1, [r5, r2]
	adds r0, r1
	cmp r0, 0x78
	ble _080CB608
	ldrh r0, [r5, 0x22]
	adds r1, r0, 0
	subs r1, 0x78
	ldrh r2, [r5, 0x26]
	adds r0, r2
	adds r1, r0
	strh r1, [r5, 0x22]
_080CB608:
	ldr r0, _080CB61C @ =sub_80CB710
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB614: .4byte gUnknown_0202F7C8
_080CB618: .4byte gUnknown_03004B00
_080CB61C: .4byte sub_80CB710
	thumb_func_end sub_80CB59C

	thumb_func_start sub_80CB620
sub_80CB620: @ 80CB620
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	mov r9, r0
	ldr r4, _080CB6FC @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r6, _080CB700 @ =gUnknown_0202F7C9
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	adds r2, r0, 0
	lsls r2, 24
	subs r4, r5
	lsls r4, 16
	lsrs r2, 24
	mov r1, r8
	subs r2, r1
	lsls r2, 16
	lsrs r2, 16
	lsrs r3, r4, 16
	mov r10, r3
	asrs r4, 16
	ldr r6, _080CB704 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r6, r1]
	muls r0, r4
	movs r1, 0x64
	str r2, [sp]
	bl __divsi3
	adds r5, r0
	mov r3, r9
	strh r5, [r3, 0x20]
	ldr r2, [sp]
	lsls r0, r2, 16
	asrs r0, 16
	movs r3, 0
	ldrsh r1, [r6, r3]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	add r8, r0
	mov r1, r8
	mov r0, r9
	strh r1, [r0, 0x22]
	ldrh r0, [r6, 0x2]
	mov r3, r9
	strh r0, [r3, 0x24]
	ldrh r0, [r6, 0x4]
	strh r0, [r3, 0x26]
	ldrb r0, [r6, 0x6]
	adds r0, 0x1E
	mov r1, r9
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r6, 0x8]
	mov r0, r9
	bl StartSpriteAnim
	ldrh r0, [r6, 0xA]
	mov r1, r9
	strh r0, [r1, 0x32]
	ldr r0, _080CB708 @ =sub_80CB710
	str r0, [r1, 0x1C]
	ldr r1, _080CB70C @ =gUnknown_03000728
	mov r3, r9
	ldrh r0, [r3, 0x20]
	strh r0, [r1]
	ldrh r0, [r3, 0x22]
	strh r0, [r1, 0x2]
	mov r0, r10
	strh r0, [r1, 0x4]
	ldr r2, [sp]
	strh r2, [r1, 0x6]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB6FC: .4byte gUnknown_0202F7C8
_080CB700: .4byte gUnknown_0202F7C9
_080CB704: .4byte gUnknown_03004B00
_080CB708: .4byte sub_80CB710
_080CB70C: .4byte gUnknown_03000728
	thumb_func_end sub_80CB620

	thumb_func_start sub_80CB710
sub_80CB710: @ 80CB710
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x2E]
	adds r1, 0x1
	strh r1, [r3, 0x2E]
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	subs r0, 0xA
	cmp r1, r0
	ble _080CB750
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	movs r2, 0x3E
	adds r2, r3
	mov r12, r2
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
_080CB750:
	movs r2, 0x2E
	ldrsh r1, [r3, r2]
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	cmp r1, r0
	ble _080CB762
	adds r0, r3, 0
	bl move_anim_8072740
_080CB762:
	pop {r0}
	bx r0
	thumb_func_end sub_80CB710

	thumb_func_start sub_80CB768
sub_80CB768: @ 80CB768
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080CB7A8
	ldr r5, _080CB7E4 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080CB7E8 @ =gUnknown_03004B00
	lsrs r0, 24
	ldrh r2, [r4]
	adds r0, r2
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x30]
	ldrh r0, [r4, 0x6]
	strh r0, [r6, 0x32]
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x34]
_080CB7A8:
	ldrh r0, [r6, 0x2E]
	adds r0, 0x1
	strh r0, [r6, 0x2E]
	ldrh r1, [r6, 0x30]
	muls r0, r1
	strh r0, [r6, 0x24]
	movs r2, 0x2E
	ldrsh r1, [r6, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	movs r1, 0xFF
	ands r0, r1
	movs r2, 0x32
	ldrsh r1, [r6, r2]
	bl Sin
	strh r0, [r6, 0x26]
	movs r0, 0x2E
	ldrsh r1, [r6, r0]
	movs r2, 0x34
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _080CB7DE
	adds r0, r6, 0
	bl move_anim_8072740
_080CB7DE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB7E4: .4byte gUnknown_0202F7C8
_080CB7E8: .4byte gUnknown_03004B00
	thumb_func_end sub_80CB768

	thumb_func_start sub_80CB7EC
sub_80CB7EC: @ 80CB7EC
	push {r4,r5,lr}
	movs r2, 0x20
	ldrsh r4, [r0, r2]
	lsls r4, 8
	movs r3, 0x22
	ldrsh r2, [r0, r3]
	orrs r4, r2
	movs r5, 0x3A
	ldrsh r2, [r0, r5]
	lsls r2, 8
	movs r5, 0x3C
	ldrsh r3, [r0, r5]
	orrs r2, r3
	lsls r1, 8
	strh r4, [r0, 0x38]
	strh r2, [r0, 0x3A]
	strh r1, [r0, 0x3C]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CB7EC

	thumb_func_start sub_80CB814
sub_80CB814: @ 80CB814
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r0
	ldrh r0, [r0, 0x38]
	lsrs r1, r0, 8
	mov r10, r1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r1, r8
	ldrh r0, [r1, 0x3A]
	lsrs r2, r0, 8
	lsls r0, 24
	lsrs r4, r0, 24
	ldrh r1, [r1, 0x3C]
	lsls r0, r1, 16
	asrs r0, 24
	lsls r0, 16
	lsrs r6, r0, 16
	movs r3, 0xFF
	ands r3, r1
	cmp r2, 0
	bne _080CB84E
	movs r2, 0x20
	negs r2, r2
	b _080CB856
_080CB84E:
	cmp r2, 0xFF
	bne _080CB856
	movs r2, 0x88
	lsls r2, 1
_080CB856:
	mov r0, r9
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	mov r1, r10
	subs r0, r2, r1
	lsls r5, r3, 16
	asrs r5, 16
	muls r0, r5
	lsls r1, r6, 16
	asrs r7, r1, 16
	adds r1, r7, 0
	bl __divsi3
	adds r6, r0, 0
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	muls r0, r5
	adds r1, r7, 0
	bl __divsi3
	add r6, r10
	mov r1, r8
	strh r6, [r1, 0x20]
	add r0, r9
	strh r0, [r1, 0x22]
	adds r5, 0x1
	lsls r5, 16
	lsrs r3, r5, 16
	asrs r5, 16
	cmp r5, r7
	beq _080CB8A8
	lsls r1, r7, 8
	lsls r0, r3, 16
	asrs r0, 16
	orrs r0, r1
	mov r1, r8
	strh r0, [r1, 0x3C]
	movs r0, 0
	b _080CB8AA
_080CB8A8:
	movs r0, 0x1
_080CB8AA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80CB814

	thumb_func_start sub_80CB8B8
sub_80CB8B8: @ 80CB8B8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xA
	bne _080CB8CC
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080CB8CC:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	ble _080CB8E0
	adds r0, r4, 0
	bl move_anim_8072740
_080CB8E0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CB8B8

	thumb_func_start sub_80CB8E8
sub_80CB8E8: @ 80CB8E8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 7
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, 0x2E]
	adds r1, r0
	movs r5, 0
	strh r1, [r4, 0x2E]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _080CB912
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x2E]
_080CB912:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	lsls r2, 3
	movs r1, 0x1E
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	bl sub_80CB814
	lsls r0, 24
	cmp r0, 0
	beq _080CB942
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x2E]
	ldr r0, _080CB948 @ =sub_80CB8B8
	str r0, [r4, 0x1C]
_080CB942:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB948: .4byte sub_80CB8B8
	thumb_func_end sub_80CB8E8

	thumb_func_start sub_80CB94C
sub_80CB94C: @ 80CB94C
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0
	bl sub_80787B0
	ldr r4, _080CB994 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080CB998 @ =gUnknown_0202F7C8
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	ldrb r4, [r4]
	cmp r0, r4
	bne _080CB99C
	strh r6, [r5, 0x3A]
	adds r0, r2, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3C
	bl sub_80CB7EC
	movs r0, 0x1
	b _080CB9AE
	.align 2, 0
_080CB994: .4byte gUnknown_0202F7C9
_080CB998: .4byte gUnknown_0202F7C8
_080CB99C:
	strh r6, [r5, 0x3A]
	adds r0, r2, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3C
	bl sub_80CB7EC
	movs r0, 0x3
_080CB9AE:
	strh r0, [r5, 0x34]
	movs r0, 0x3C
	strh r0, [r5, 0x36]
	ldr r0, _080CB9C0 @ =sub_80CB8E8
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB9C0: .4byte sub_80CB8E8
	thumb_func_end sub_80CB94C

	thumb_func_start sub_80CB9C4
sub_80CB9C4: @ 80CB9C4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 7
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, 0x2E]
	adds r1, r0
	movs r5, 0
	strh r1, [r4, 0x2E]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _080CB9EE
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x2E]
_080CB9EE:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	lsls r2, 3
	movs r1, 0x1E
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	bl sub_80CB814
	lsls r0, 24
	cmp r0, 0
	beq _080CBA20
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x2E]
	adds r0, r4, 0
	bl move_anim_8072740
_080CBA20:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CB9C4

	thumb_func_start sub_80CBA28
sub_80CBA28: @ 80CBA28
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _080CBA64 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080CBA6C
	strh r0, [r5, 0x3A]
	adds r0, r6, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x28
	bl sub_80CB7EC
	movs r0, 0x3
	strh r0, [r5, 0x34]
	movs r0, 0x3C
	strh r0, [r5, 0x36]
	ldr r0, _080CBA68 @ =sub_80CB8E8
	b _080CBA96
	.align 2, 0
_080CBA64: .4byte gUnknown_0202F7C9
_080CBA68: .4byte sub_80CB8E8
_080CBA6C:
	movs r0, 0xFF
	strh r0, [r5, 0x3A]
	adds r0, r6, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CBA84
	movs r0, 0
	strh r0, [r5, 0x3A]
_080CBA84:
	adds r0, r5, 0
	movs r1, 0x28
	bl sub_80CB7EC
	movs r0, 0x3
	strh r0, [r5, 0x34]
	movs r0, 0x3C
	strh r0, [r5, 0x36]
	ldr r0, _080CBAA0 @ =sub_80CB9C4
_080CBA96:
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CBAA0: .4byte sub_80CB9C4
	thumb_func_end sub_80CBA28

	thumb_func_start sub_80CBAA4
sub_80CBAA4: @ 80CBAA4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080CBABE
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
	ldr r0, _080CBAE4 @ =gUnknown_03004B00
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x30]
_080CBABE:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	muls r0, r1
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080CBADE
	adds r0, r4, 0
	bl move_anim_8072740
_080CBADE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBAE4: .4byte gUnknown_03004B00
	thumb_func_end sub_80CBAA4

	thumb_func_start sub_80CBAE8
sub_80CBAE8: @ 80CBAE8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0
	bl sub_8078764
	ldr r4, _080CBB30 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080CBB34 @ =gUnknown_0202F7C9
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	ldrb r4, [r4]
	cmp r0, r4
	bne _080CBB38
	strh r6, [r5, 0x3A]
	adds r0, r2, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3C
	bl sub_80CB7EC
	movs r0, 0x1
	b _080CBB4A
	.align 2, 0
_080CBB30: .4byte gUnknown_0202F7C8
_080CBB34: .4byte gUnknown_0202F7C9
_080CBB38:
	strh r6, [r5, 0x3A]
	adds r0, r2, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3C
	bl sub_80CB7EC
	movs r0, 0x3
_080CBB4A:
	strh r0, [r5, 0x34]
	movs r0, 0x3C
	strh r0, [r5, 0x36]
	ldr r0, _080CBB5C @ =sub_80CBB60
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CBB5C: .4byte sub_80CBB60
	thumb_func_end sub_80CBAE8

	thumb_func_start sub_80CBB60
sub_80CBB60: @ 80CBB60
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 7
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, 0x2E]
	adds r1, r0
	movs r5, 0
	strh r1, [r4, 0x2E]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _080CBB8A
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x2E]
_080CBB8A:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	lsls r2, 3
	movs r1, 0x1E
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	bne _080CBBBE
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x7D
	bl PlaySE12WithPanning
_080CBBBE:
	adds r0, r4, 0
	bl sub_80CB814
	lsls r0, 24
	cmp r0, 0
	beq _080CBBE6
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x2E]
	ldr r0, _080CBBEC @ =sub_80CB8B8
	str r0, [r4, 0x1C]
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x7D
	bl PlaySE12WithPanning
_080CBBE6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CBBEC: .4byte sub_80CB8B8
	thumb_func_end sub_80CBB60

	thumb_func_start sub_80CBBF0
sub_80CBBF0: @ 80CBBF0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080CBC84
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080CBC18
	ldr r0, _080CBC14 @ =gUnknown_03004B00
	ldrh r1, [r0, 0x2]
	strh r1, [r4, 0x30]
	movs r1, 0x78
	strh r1, [r4, 0x20]
	adds r5, r0, 0
	b _080CBC3A
	.align 2, 0
_080CBC14: .4byte gUnknown_03004B00
_080CBC18:
	ldr r0, _080CBC74 @ =gUnknown_03004B00
	movs r1, 0x2
	ldrsh r3, [r0, r1]
	adds r1, r3, 0
	subs r1, 0x20
	adds r2, r1, 0
	adds r5, r0, 0
	cmp r1, 0
	bge _080CBC2E
	adds r2, r3, 0
	adds r2, 0xDF
_080CBC2E:
	asrs r0, r2, 8
	lsls r0, 8
	subs r0, r1, r0
	strh r0, [r4, 0x30]
	movs r0, 0x46
	strh r0, [r4, 0x20]
_080CBC3A:
	ldrh r0, [r5]
	strh r0, [r4, 0x22]
	strh r0, [r4, 0x32]
	movs r0, 0x14
	strh r0, [r4, 0x36]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x3C
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Sin
	strh r0, [r4, 0x26]
	ldr r0, _080CBC78 @ =sub_80CBC8C
	str r0, [r4, 0x1C]
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xBE
	bhi _080CBC7C
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1F
	b _080CBC82
	.align 2, 0
_080CBC74: .4byte gUnknown_03004B00
_080CBC78: .4byte sub_80CBC8C
_080CBC7C:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1D
_080CBC82:
	strb r0, [r1]
_080CBC84:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CBBF0

	thumb_func_start sub_80CBC8C
sub_80CBC8C: @ 80CBC8C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080CBC9E
	cmp r0, 0x1
	beq _080CBCCE
	b _080CBCEE
_080CBC9E:
	ldrh r5, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x4E
	ble _080CBCB6
	movs r0, 0x1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080CBCEE
_080CBCB6:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	adds r0, r5, r0
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x36]
	adds r1, 0x3
	strh r1, [r4, 0x36]
	strh r0, [r4, 0x22]
	b _080CBCEE
_080CBCCE:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080CBCEE
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080CBCEE
	movs r0, 0
	strh r0, [r4, 0x2E]
	strh r0, [r4, 0x32]
	ldr r0, _080CBCF4 @ =sub_80CBCF8
	str r0, [r4, 0x1C]
_080CBCEE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CBCF4: .4byte sub_80CBCF8
	thumb_func_end sub_80CBC8C

	thumb_func_start sub_80CBCF8
sub_80CBCF8: @ 80CBCF8
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080CBD3C @ =gUnknown_083D680C
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r3, r0, r1
	adds r0, r5, 0x1
	adds r0, r3, r0
	ldrh r2, [r4, 0x32]
	movs r6, 0x32
	ldrsh r1, [r4, r6]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080CBD44
	adds r0, r5, 0x2
	adds r0, r3, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x7F
	bne _080CBD30
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080CBD40 @ =sub_80CBDB0
	str r0, [r4, 0x1C]
_080CBD30:
	movs r0, 0
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080CBDAA
	.align 2, 0
_080CBD3C: .4byte gUnknown_083D680C
_080CBD40: .4byte sub_80CBDB0
_080CBD44:
	adds r0, r2, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r1
	adds r1, r0, r5
	movs r2, 0
	ldrsb r2, [r1, r2]
	adds r1, r5, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	muls r0, r2
	ldrh r1, [r4, 0x30]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080CBD92
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xBE
	bhi _080CBD8A
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1F
	b _080CBD90
_080CBD8A:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1D
_080CBD90:
	strb r0, [r1]
_080CBD92:
	movs r6, 0x30
	ldrsh r0, [r4, r6]
	movs r1, 0x3C
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Sin
	strh r0, [r4, 0x26]
_080CBDAA:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80CBCF8

	thumb_func_start sub_80CBDB0
sub_80CBDB0: @ 80CBDB0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x14
	ble _080CBDC2
	adds r0, r4, 0
	bl move_anim_8072740
_080CBDC2:
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CBDB0

	thumb_func_start sub_80CBDF4
sub_80CBDF4: @ 80CBDF4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080CBF48 @ =gTasks
	adds r5, r0, r1
	ldr r4, _080CBF4C @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	strh r0, [r5, 0x10]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x16]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_807A100
	strh r0, [r5, 0x1C]
	ldrb r0, [r4]
	movs r1, 0
	bl sub_807A100
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0x1
	bne _080CBE5C
	movs r1, 0x1
_080CBE5C:
	strh r1, [r5, 0x12]
	movs r3, 0x12
	ldrsh r0, [r5, r3]
	lsls r0, 6
	movs r1, 0x38
	subs r1, r0
	strh r1, [r5, 0x1A]
	ldrh r0, [r5, 0x16]
	subs r0, r1
	ldrh r1, [r5, 0x14]
	adds r0, r1
	strh r0, [r5, 0x18]
	ldr r0, _080CBF50 @ =gSpriteTemplate_83D6884
	movs r2, 0x18
	ldrsh r1, [r5, r2]
	movs r3, 0x1A
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, 0x10]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xC]
	cmp r0, 0x40
	bne _080CBE94
	adds r0, r6, 0
	bl move_anim_task_del
_080CBE94:
	ldr r4, _080CBF54 @ =gSprites
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xA
	strh r1, [r0, 0x2E]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x18]
	strh r1, [r0, 0x30]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r5, r3]
	muls r1, r0
	ldrh r0, [r5, 0x14]
	subs r0, r1
	strh r0, [r2, 0x32]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x1A]
	strh r1, [r0, 0x34]
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	lsrs r2, r0, 31
	adds r0, r2
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r2, [r5, r3]
	muls r0, r2
	ldrh r2, [r5, 0x16]
	adds r0, r2
	strh r0, [r1, 0x36]
	movs r3, 0xC
	ldrsh r1, [r5, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl sub_80CC338
	movs r1, 0xC
	ldrsh r2, [r5, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x38]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl sub_80786EC
	ldr r0, _080CBF58 @ =sub_80CBF5C
	str r0, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CBF48: .4byte gTasks
_080CBF4C: .4byte gUnknown_0202F7C9
_080CBF50: .4byte gSpriteTemplate_83D6884
_080CBF54: .4byte gSprites
_080CBF58: .4byte sub_80CBF5C
	thumb_func_end sub_80CBDF4

	thumb_func_start sub_80CBF5C
sub_80CBF5C: @ 80CBF5C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080CBFA0 @ =gTasks
	adds r6, r0, r1
	movs r0, 0xC
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080CBFA4 @ =gSprites
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r5, [r6, r1]
	cmp r5, 0x7
	bne _080CBF84
	b _080CC1B4
_080CBF84:
	cmp r5, 0x7
	bgt _080CBFD2
	cmp r5, 0x3
	bne _080CBF8E
	b _080CC0A6
_080CBF8E:
	cmp r5, 0x3
	bgt _080CBFA8
	cmp r5, 0x1
	beq _080CC038
	cmp r5, 0x1
	bgt _080CC088
	cmp r5, 0
	beq _080CC01A
	b _080CC330
	.align 2, 0
_080CBFA0: .4byte gTasks
_080CBFA4: .4byte gSprites
_080CBFA8:
	cmp r5, 0x5
	bne _080CBFAE
	b _080CC11C
_080CBFAE:
	cmp r5, 0x5
	ble _080CBFB4
	b _080CC196
_080CBFB4:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	bne _080CBFCA
	b _080CC330
_080CBFCA:
	movs r0, 0x5
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080CC32E
_080CBFD2:
	cmp r5, 0xB
	bne _080CBFD8
	b _080CC298
_080CBFD8:
	cmp r5, 0xB
	bgt _080CC006
	cmp r5, 0x9
	bne _080CBFE2
	b _080CC206
_080CBFE2:
	cmp r5, 0x9
	ble _080CBFE8
	b _080CC27C
_080CBFE8:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	bne _080CBFFE
	b _080CC330
_080CBFFE:
	movs r0, 0x9
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080CC32E
_080CC006:
	cmp r5, 0xD
	bne _080CC00C
	b _080CC30A
_080CC00C:
	cmp r5, 0xD
	bge _080CC012
	b _080CC2EA
_080CC012:
	cmp r5, 0xFF
	bne _080CC018
	b _080CC31A
_080CC018:
	b _080CC330
_080CC01A:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	bne _080CC030
	b _080CC330
_080CC030:
	movs r0, 0x1
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080CC32E
_080CC038:
	ldrh r2, [r4, 0x24]
	ldrh r3, [r4, 0x20]
	adds r2, r3
	movs r0, 0
	strh r2, [r4, 0x20]
	ldrh r1, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r1, r3
	strh r1, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r2, [r4, 0x30]
	ldrh r0, [r6, 0x14]
	strh r0, [r4, 0x32]
	strh r1, [r4, 0x34]
	ldrh r0, [r6, 0x16]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80CC338
	strh r0, [r4, 0x38]
	ldrh r0, [r6, 0x10]
	adds r0, 0x2
	strh r0, [r6, 0x10]
	strh r5, [r6, 0xE]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_80786EC
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC32E
_080CC088:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	bne _080CC09E
	b _080CC330
_080CC09E:
	movs r0, 0x3
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080CC32E
_080CC0A6:
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	movs r0, 0
	strh r1, [r4, 0x20]
	ldrh r2, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r2, r3
	strh r2, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	muls r1, r0
	ldrh r0, [r6, 0x14]
	subs r0, r1
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	movs r1, 0x1E
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	muls r1, r0
	ldrh r0, [r6, 0x16]
	subs r0, r1
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80CC338
	strh r0, [r4, 0x38]
	movs r0, 0x2
	strh r0, [r6, 0xE]
	ldrh r0, [r6, 0x10]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_80786EC
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC32E
_080CC11C:
	ldrh r1, [r4, 0x24]
	ldrh r3, [r4, 0x20]
	adds r1, r3
	movs r0, 0
	strh r1, [r4, 0x20]
	ldrh r2, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r2, r3
	strh r2, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	muls r0, r1
	ldrh r1, [r6, 0x14]
	adds r0, r1
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	movs r2, 0x1E
	ldrsh r0, [r6, r2]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	muls r0, r1
	ldrh r1, [r6, 0x16]
	adds r0, r1
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80CC338
	strh r0, [r4, 0x38]
	ldrh r1, [r6, 0x10]
	subs r1, 0x2
	strh r1, [r6, 0x10]
	movs r0, 0x3
	strh r0, [r6, 0xE]
	adds r0, r4, 0
	adds r0, 0x43
	strb r1, [r0]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_80786EC
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC32E
_080CC196:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	bne _080CC1AC
	b _080CC330
_080CC1AC:
	movs r0, 0x7
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080CC32E
_080CC1B4:
	ldrh r2, [r4, 0x24]
	ldrh r3, [r4, 0x20]
	adds r2, r3
	movs r0, 0
	strh r2, [r4, 0x20]
	ldrh r1, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r1, r3
	strh r1, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r2, [r4, 0x30]
	ldrh r0, [r6, 0x14]
	strh r0, [r4, 0x32]
	strh r1, [r4, 0x34]
	ldrh r0, [r6, 0x16]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80CC338
	strh r0, [r4, 0x38]
	ldrh r1, [r6, 0x10]
	adds r1, 0x2
	strh r1, [r6, 0x10]
	movs r0, 0x4
	strh r0, [r6, 0xE]
	adds r0, r4, 0
	adds r0, 0x43
	strb r1, [r0]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_80786EC
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC32E
_080CC206:
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	movs r0, 0
	strh r1, [r4, 0x20]
	ldrh r2, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r2, r3
	strh r2, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	muls r1, r0
	ldrh r0, [r6, 0x14]
	subs r0, r1
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	movs r1, 0x1E
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	muls r0, r1
	ldrh r3, [r6, 0x16]
	adds r0, r3
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80CC338
	strh r0, [r4, 0x38]
	movs r0, 0x5
	strh r0, [r6, 0xE]
	ldrh r0, [r6, 0x10]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_80786EC
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC32E
_080CC27C:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080CC330
	movs r0, 0xB
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080CC32E
_080CC298:
	ldrh r2, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r2, r0
	movs r0, 0
	strh r2, [r4, 0x20]
	ldrh r1, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r1, r3
	strh r1, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r2, [r4, 0x30]
	ldrh r0, [r6, 0x18]
	strh r0, [r4, 0x32]
	strh r1, [r4, 0x34]
	ldrh r0, [r6, 0x1A]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80CC338
	strh r0, [r4, 0x38]
	ldrh r1, [r6, 0x10]
	subs r1, 0x2
	strh r1, [r6, 0x10]
	movs r0, 0x6
	strh r0, [r6, 0xE]
	adds r0, r4, 0
	adds r0, 0x43
	strb r1, [r0]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_80786EC
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC32E
_080CC2EA:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080CC330
	adds r0, r4, 0
	bl DestroySprite
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC32E
_080CC30A:
	movs r1, 0x20
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080CC330
	adds r0, r2, 0
	bl move_anim_task_del
	b _080CC330
_080CC31A:
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080CC330
	movs r0, 0
	strh r0, [r6, 0xA]
	ldrh r0, [r6, 0x26]
_080CC32E:
	strh r0, [r6, 0x8]
_080CC330:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80CBF5C

	thumb_func_start sub_80CC338
sub_80CC338: @ 80CC338
	push {lr}
	movs r2, 0x8
	movs r3, 0x36
	ldrsh r1, [r0, r3]
	movs r3, 0x22
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _080CC34E
	negs r0, r2
	lsls r0, 16
	lsrs r2, r0, 16
_080CC34E:
	lsls r0, r2, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80CC338

	thumb_func_start sub_80CC358
sub_80CC358: @ 80CC358
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	ldrh r0, [r6, 0x24]
	adds r0, 0x1
	strh r0, [r6, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _080CC3EE
	movs r0, 0
	strh r0, [r6, 0x24]
	ldr r0, _080CC3F8 @ =gSprites
	mov r8, r0
	movs r2, 0xC
	ldrsh r1, [r6, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	ldrh r2, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r2, r0
	ldr r0, _080CC3FC @ =gSpriteTemplate_83D6884
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	ldrb r3, [r6, 0x10]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080CC3EE
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	mov r0, r8
	adds r4, r5, r0
	strh r7, [r4, 0x3A]
	movs r0, 0xC
	strh r0, [r4, 0x3C]
	ldr r0, _080CC400 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	ldrh r2, [r6, 0x22]
	movs r0, 0x1
	ands r0, r2
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x22]
	adds r0, 0x1
	strh r0, [r1, 0x22]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r6, 0x10]
	adds r4, 0x43
	strb r0, [r4]
	mov r0, r8
	adds r0, 0x1C
	adds r5, r0
	ldr r0, _080CC404 @ =sub_80CC408
	str r0, [r5]
_080CC3EE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC3F8: .4byte gSprites
_080CC3FC: .4byte gSpriteTemplate_83D6884
_080CC400: .4byte gTasks
_080CC404: .4byte sub_80CC408
	thumb_func_end sub_80CC358

	thumb_func_start sub_80CC408
sub_80CC408: @ 80CC408
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CC46A
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080CC46A
	ldr r3, _080CC470 @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080CC46A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC470: .4byte gTasks
	thumb_func_end sub_80CC408

	thumb_func_start sub_80CC474
sub_80CC474: @ 80CC474
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, _080CC488 @ =gUnknown_03004B00
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CC490
	ldr r0, _080CC48C @ =gUnknown_0202F7C8
	b _080CC492
	.align 2, 0
_080CC488: .4byte gUnknown_03004B00
_080CC48C: .4byte gUnknown_0202F7C8
_080CC490:
	ldr r0, _080CC4B0 @ =gUnknown_0202F7C9
_080CC492:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CC4BC
	movs r0, 0
	strh r0, [r4, 0x36]
	ldr r1, _080CC4B4 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x32]
	ldr r0, _080CC4B8 @ =0x0000fff0
	b _080CC4CC
	.align 2, 0
_080CC4B0: .4byte gUnknown_0202F7C9
_080CC4B4: .4byte gUnknown_03004B00
_080CC4B8: .4byte 0x0000fff0
_080CC4BC:
	movs r0, 0x1
	strh r0, [r4, 0x36]
	ldr r1, _080CC4F0 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r4, 0x32]
	movs r0, 0x80
	lsls r0, 1
_080CC4CC:
	strh r0, [r4, 0x20]
	adds r7, r1, 0
	adds r5, r7, 0
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x34]
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080CC502
	cmp r0, 0x1
	bgt _080CC4F4
	cmp r0, 0
	beq _080CC4FE
	b _080CC56C
	.align 2, 0
_080CC4F0: .4byte gUnknown_03004B00
_080CC4F4:
	cmp r0, 0x2
	beq _080CC508
	cmp r0, 0x3
	beq _080CC534
	b _080CC56C
_080CC4FE:
	ldrh r0, [r5]
	b _080CC518
_080CC502:
	ldrh r0, [r5]
	strh r0, [r4, 0x22]
	b _080CC54E
_080CC508:
	adds r0, r6, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5]
	adds r0, r5
_080CC518:
	strh r0, [r4, 0x22]
	adds r0, r6, 0
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	b _080CC56C
_080CC534:
	ldr r0, _080CC578 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r7, [r7]
	adds r0, r7
	strh r0, [r4, 0x22]
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
_080CC54E:
	adds r0, r6, 0
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_080CC56C:
	ldr r0, _080CC57C @ =sub_80CC580
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC578: .4byte gUnknown_0202F7C9
_080CC57C: .4byte sub_80CC580
	thumb_func_end sub_80CC474

	thumb_func_start sub_80CC580
sub_80CC580: @ 80CC580
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x3C
	ldrsh r3, [r4, r0]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	ldr r1, _080CC5D4 @ =gSineTable
	movs r5, 0x2E
	ldrsh r0, [r4, r5]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	muls r0, r2
	asrs r0, 8
	strh r0, [r4, 0x26]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	muls r0, r3
	strh r0, [r4, 0x24]
	movs r5, 0x34
	ldrsh r0, [r4, r5]
	muls r0, r3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080CC5D8
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	movs r5, 0x20
	ldrsh r1, [r4, r5]
	adds r0, r1
	cmp r0, 0xF7
	ble _080CC5F0
	b _080CC5EA
	.align 2, 0
_080CC5D4: .4byte gSineTable
_080CC5D8:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	movs r2, 0x20
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bgt _080CC5F0
_080CC5EA:
	adds r0, r4, 0
	bl move_anim_8074EE0
_080CC5F0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CC580

	thumb_func_start sub_80CC5F8
sub_80CC5F8: @ 80CC5F8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080CC618 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080CC61C
	cmp r0, 0x1
	beq _080CC650
	b _080CC6AA
	.align 2, 0
_080CC618: .4byte gTasks
_080CC61C:
	ldr r0, _080CC648 @ =0x0000274f
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r2, 0x80
	lsls r2, 1
	adds r4, r2, 0
	adds r0, r4
	strh r0, [r5, 0x18]
	ldr r0, _080CC64C @ =0x000027b0
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	adds r0, r4
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080CC6AA
	.align 2, 0
_080CC648: .4byte 0x0000274f
_080CC64C: .4byte 0x000027b0
_080CC650:
	ldrh r0, [r5, 0x1A]
	adds r0, 0x1
	movs r7, 0
	strh r0, [r5, 0x1A]
	lsls r0, 16
	cmp r0, 0
	blt _080CC6AA
	strh r7, [r5, 0x1A]
	ldrh r0, [r5, 0x18]
	ldrb r2, [r5, 0x1C]
	ldr r4, _080CC6C4 @ =gUnknown_083D6984
	movs r3, 0x1E
	ldrsh r1, [r5, r3]
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r5, 0x20]
	ldrb r2, [r5, 0x1C]
	movs r3, 0x1E
	ldrsh r1, [r5, r3]
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	bne _080CC6AA
	strh r7, [r5, 0x1C]
	ldrh r0, [r5, 0x1E]
	adds r0, 0x1
	strh r0, [r5, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	bne _080CC6AA
	strh r7, [r5, 0x1E]
_080CC6AA:
	ldr r0, _080CC6C8 @ =gUnknown_03004B00
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080CC6BE
	adds r0, r6, 0
	bl move_anim_task_del
_080CC6BE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC6C4: .4byte gUnknown_083D6984
_080CC6C8: .4byte gUnknown_03004B00
	thumb_func_end sub_80CC5F8

	thumb_func_start sub_80CC6CC
sub_80CC6CC: @ 80CC6CC
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r1, _080CC6E4 @ =gUnknown_03004B00
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080CC6E8
	adds r0, r6, 0
	bl move_anim_8072740
	b _080CC7C2
	.align 2, 0
_080CC6E4: .4byte gUnknown_03004B00
_080CC6E8:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080CC6F8
	ldr r4, _080CC6F4 @ =gUnknown_0202F7C8
	b _080CC6FA
	.align 2, 0
_080CC6F4: .4byte gUnknown_0202F7C8
_080CC6F8:
	ldr r4, _080CC734 @ =gUnknown_0202F7C9
_080CC6FA:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080CC738 @ =gUnknown_03004B00
	ldrh r1, [r0, 0x8]
	strh r1, [r6, 0x2E]
	movs r3, 0x2
	ldrsh r1, [r0, r3]
	adds r7, r0, 0
	cmp r1, 0
	bne _080CC73C
	ldrh r0, [r7, 0x4]
	adds r0, r5
	strh r0, [r6, 0x20]
	ldrh r0, [r7, 0x6]
	adds r0, r2
	strh r0, [r6, 0x22]
	strh r5, [r6, 0x38]
	strh r2, [r6, 0x3A]
	b _080CC74C
	.align 2, 0
_080CC734: .4byte gUnknown_0202F7C9
_080CC738: .4byte gUnknown_03004B00
_080CC73C:
	strh r5, [r6, 0x20]
	strh r2, [r6, 0x22]
	ldrh r0, [r7, 0x4]
	adds r0, r5
	strh r0, [r6, 0x38]
	ldrh r0, [r7, 0x6]
	adds r0, r2
	strh r0, [r6, 0x3A]
_080CC74C:
	ldrh r4, [r6, 0x20]
	lsls r0, r4, 4
	strh r0, [r6, 0x30]
	ldrh r5, [r6, 0x22]
	lsls r0, r5, 4
	strh r0, [r6, 0x32]
	movs r1, 0x38
	ldrsh r0, [r6, r1]
	movs r2, 0x20
	ldrsh r1, [r6, r2]
	subs r0, r1
	lsls r0, 4
	movs r3, 0x8
	ldrsh r1, [r7, r3]
	bl __divsi3
	strh r0, [r6, 0x34]
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	movs r2, 0x22
	ldrsh r1, [r6, r2]
	subs r0, r1
	lsls r0, 4
	movs r3, 0x8
	ldrsh r1, [r7, r3]
	bl __divsi3
	strh r0, [r6, 0x36]
	ldrh r0, [r6, 0x38]
	subs r0, r4
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r6, 0x3A]
	subs r1, r5
	lsls r1, 16
	asrs r1, 16
	bl sub_80790F0
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CC7AE
	ldr r1, _080CC7CC @ =0xffff8000
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
_080CC7AE:
	movs r3, 0x80
	lsls r3, 1
	str r4, [sp]
	adds r0, r6, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8078FDC
	ldr r0, _080CC7D0 @ =sub_80CC7D4
	str r0, [r6, 0x1C]
_080CC7C2:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC7CC: .4byte 0xffff8000
_080CC7D0: .4byte sub_80CC7D4
	thumb_func_end sub_80CC6CC

	thumb_func_start sub_80CC7D4
sub_80CC7D4: @ 80CC7D4
	push {r4,lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080CC804
	ldrh r0, [r2, 0x34]
	ldrh r4, [r2, 0x30]
	adds r0, r4
	strh r0, [r2, 0x30]
	ldrh r1, [r2, 0x36]
	ldrh r4, [r2, 0x32]
	adds r1, r4
	strh r1, [r2, 0x32]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r2, 0x22]
	subs r0, r3, 0x1
	strh r0, [r2, 0x2E]
	b _080CC80A
_080CC804:
	adds r0, r2, 0
	bl move_anim_8074EE0
_080CC80A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CC7D4

	thumb_func_start sub_80CC810
sub_80CC810: @ 80CC810
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080CC826
	adds r0, r2, 0
	bl move_anim_8072740
_080CC826:
	pop {r0}
	bx r0
	thumb_func_end sub_80CC810

	thumb_func_start sub_80CC82C
sub_80CC82C: @ 80CC82C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080CC84C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CC854
	ldr r2, _080CC850 @ =gUnknown_03004B00
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	b _080CC860
	.align 2, 0
_080CC84C: .4byte gUnknown_0202F7C8
_080CC850: .4byte gUnknown_03004B00
_080CC854:
	ldr r0, _080CC878 @ =gUnknown_03004B00
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
_080CC860:
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080CC87C @ =sub_8078600
	str r0, [r4, 0x1C]
	ldr r1, _080CC880 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC878: .4byte gUnknown_03004B00
_080CC87C: .4byte sub_8078600
_080CC880: .4byte move_anim_8072740
	thumb_func_end sub_80CC82C

	thumb_func_start sub_80CC884
sub_80CC884: @ 80CC884
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080CC8BC @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CC89E
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080CC89E:
	ldr r0, _080CC8C0 @ =sub_80CC810
	str r0, [r5, 0x1C]
	ldr r4, _080CC8C4 @ =gUnknown_03004B00
	movs r0, 0
	ldrsh r1, [r4, r0]
	adds r0, r5, 0
	bl sub_807867C
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CC8BC: .4byte gUnknown_0202F7C8
_080CC8C0: .4byte sub_80CC810
_080CC8C4: .4byte gUnknown_03004B00
	thumb_func_end sub_80CC884

	thumb_func_start sub_80CC8C8
sub_80CC8C8: @ 80CC8C8
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080CC908 @ =gUnknown_03004B00
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x38]
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	ldr r1, _080CC90C @ =move_anim_8074EE0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CC910 @ =sub_8078504
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC908: .4byte gUnknown_03004B00
_080CC90C: .4byte move_anim_8074EE0
_080CC910: .4byte sub_8078504
	thumb_func_end sub_80CC8C8

	thumb_func_start sub_80CC914
sub_80CC914: @ 80CC914
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080CC964 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CC948
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r5, 0x22]
_080CC948:
	ldr r0, _080CC968 @ =sub_80CCB00
	str r0, [r5, 0x1C]
	ldr r0, _080CC96C @ =gUnknown_03004B00
	movs r2, 0x4
	ldrsh r1, [r0, r2]
	adds r3, r0, 0
	cmp r1, 0
	bne _080CC970
	ldrh r0, [r3]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x20]
	b _080CC984
	.align 2, 0
_080CC964: .4byte gUnknown_0202F7C9
_080CC968: .4byte sub_80CCB00
_080CC96C: .4byte gUnknown_03004B00
_080CC970:
	ldrh r0, [r5, 0x20]
	ldrh r1, [r3]
	subs r0, r1
	strh r0, [r5, 0x20]
	adds r2, r5, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_080CC984:
	ldrh r0, [r3, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldr r1, _080CC9B8 @ =0xfffffc00
	adds r0, r1, 0
	ldrh r2, [r5, 0x30]
	adds r1, r0, r2
	strh r1, [r5, 0x30]
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	ldrh r2, [r5, 0x32]
	adds r0, r2
	strh r0, [r5, 0x32]
	ldrh r0, [r3, 0x4]
	strh r0, [r5, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080CC9B2
	negs r0, r1
	strh r0, [r5, 0x30]
_080CC9B2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CC9B8: .4byte 0xfffffc00
	thumb_func_end sub_80CC914

	thumb_func_start sub_80CC9BC
sub_80CC9BC: @ 80CC9BC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r0, _080CC9D8 @ =gUnknown_03004B00
	movs r1, 0x6
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080CC9DC
	cmp r0, 0x1
	ble _080CCA58
	cmp r0, 0x2
	beq _080CC9FC
	b _080CCA58
	.align 2, 0
_080CC9D8: .4byte gUnknown_03004B00
_080CC9DC:
	ldr r5, _080CC9F8 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r5]
	eors r4, r0
	adds r0, r4, 0
	b _080CCA68
	.align 2, 0
_080CC9F8: .4byte gUnknown_0202F7C9
_080CC9FC:
	ldr r5, _080CCA54 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5]
	movs r2, 0x2
	mov r8, r2
	mov r1, r8
	eors r0, r1
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080CCA72
	ldrb r0, [r5]
	mov r2, r8
	eors r0, r2
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r7
	lsrs r7, r0, 1
	ldrb r0, [r5]
	mov r1, r8
	eors r0, r1
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	lsrs r4, r0, 1
	b _080CCA72
	.align 2, 0
_080CCA54: .4byte gUnknown_0202F7C9
_080CCA58:
	ldr r4, _080CCAA4 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r4]
_080CCA68:
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r4, r0, 24
_080CCA72:
	strh r7, [r6, 0x20]
	strh r4, [r6, 0x22]
	ldr r0, _080CCAA4 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CCA8A
	ldrh r0, [r6, 0x22]
	adds r0, 0x8
	strh r0, [r6, 0x22]
_080CCA8A:
	ldr r0, _080CCAA8 @ =sub_80CCB00
	str r0, [r6, 0x1C]
	ldr r0, _080CCAAC @ =gUnknown_03004B00
	movs r2, 0x4
	ldrsh r1, [r0, r2]
	adds r3, r0, 0
	cmp r1, 0
	bne _080CCAB0
	ldrh r0, [r3]
	ldrh r1, [r6, 0x20]
	adds r0, r1
	strh r0, [r6, 0x20]
	b _080CCAC4
	.align 2, 0
_080CCAA4: .4byte gUnknown_0202F7C9
_080CCAA8: .4byte sub_80CCB00
_080CCAAC: .4byte gUnknown_03004B00
_080CCAB0:
	ldrh r0, [r6, 0x20]
	ldrh r1, [r3]
	subs r0, r1
	strh r0, [r6, 0x20]
	adds r2, r6, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_080CCAC4:
	ldrh r0, [r3, 0x2]
	ldrh r2, [r6, 0x22]
	adds r0, r2
	strh r0, [r6, 0x22]
	ldr r1, _080CCAFC @ =0xfffffc00
	adds r0, r1, 0
	ldrh r2, [r6, 0x30]
	adds r1, r0, r2
	strh r1, [r6, 0x30]
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	ldrh r2, [r6, 0x32]
	adds r0, r2
	strh r0, [r6, 0x32]
	ldrh r0, [r3, 0x4]
	strh r0, [r6, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080CCAF2
	negs r0, r1
	strh r0, [r6, 0x30]
_080CCAF2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CCAFC: .4byte 0xfffffc00
	thumb_func_end sub_80CC9BC

	thumb_func_start sub_80CCB00
sub_80CCB00: @ 80CCB00
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	ldrh r2, [r4, 0x34]
	adds r0, r1, r2
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080CCB22
	adds r0, r1, 0
	adds r0, 0x18
	b _080CCB26
_080CCB22:
	adds r0, r1, 0
	subs r0, 0x18
_080CCB26:
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	subs r0, 0x18
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080CCB5C
	ldr r1, _080CCB64 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	movs r0, 0x3
	strh r0, [r4, 0x2E]
	ldr r0, _080CCB68 @ =sub_80782D8
	str r0, [r4, 0x1C]
_080CCB5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CCB64: .4byte move_anim_8072740
_080CCB68: .4byte sub_80782D8
	thumb_func_end sub_80CCB00

	thumb_func_start unref_sub_80CCB6C
unref_sub_80CCB6C: @ 80CCB6C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x32]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	cmp r0, 0x1
	ble _080CCC10
	ldrh r1, [r5, 0x34]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CCBC8
	adds r3, r5, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	strb r0, [r3]
	ldr r4, _080CCBC4 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r3, [r0]
	adds r1, r2, 0
	ands r1, r3
	strb r1, [r0]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	b _080CCBFE
	.align 2, 0
_080CCBC4: .4byte gSprites
_080CCBC8:
	adds r1, r5, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r3, _080CCC0C @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
_080CCBFE:
	movs r0, 0
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	b _080CCC14
	.align 2, 0
_080CCC0C: .4byte gSprites
_080CCC10:
	adds r0, r1, 0x1
	strh r0, [r5, 0x32]
_080CCC14:
	movs r1, 0x34
	ldrsh r0, [r5, r1]
	cmp r0, 0xA
	bne _080CCC44
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080CCC4C @ =gSprites
	adds r0, r4
	bl DestroySprite
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r0, r5, 0
	bl move_anim_8072740
_080CCC44:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CCC4C: .4byte gSprites
	thumb_func_end unref_sub_80CCB6C

	thumb_func_start sub_80CCC50
sub_80CCC50: @ 80CCC50
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080CCC70 @ =gUnknown_03004B00
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x2E]
	ldr r0, _080CCC74 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CCC78
	ldrh r0, [r5, 0x20]
	ldrh r1, [r4]
	subs r0, r1
	b _080CCC7E
	.align 2, 0
_080CCC70: .4byte gUnknown_03004B00
_080CCC74: .4byte gUnknown_0202F7C8
_080CCC78:
	ldrh r0, [r4]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080CCC7E:
	strh r0, [r5, 0x20]
	ldr r4, _080CCCAC @ =gUnknown_03004B00
	ldrb r1, [r4, 0xA]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x6]
	negs r0, r0
	strh r0, [r5, 0x30]
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x34]
	ldr r1, _080CCCB0 @ =sub_80CCCB4
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CCCAC: .4byte gUnknown_03004B00
_080CCCB0: .4byte sub_80CCCB4
	thumb_func_end sub_80CCC50

	thumb_func_start sub_80CCCB4
sub_80CCCB4: @ 80CCCB4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x64
	bl Cos
	strh r0, [r4, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r1, 0x14
	bl Sin
	strh r0, [r4, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	bgt _080CCCE0
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0
	b _080CCCE6
_080CCCE0:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0xE
_080CCCE6:
	strb r0, [r1]
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x2E]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	adds r0, 0x82
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080CCD1C
	adds r0, r4, 0
	bl move_anim_8072740
_080CCD1C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CCCB4

	thumb_func_start sub_80CCD24
sub_80CCD24: @ 80CCD24
	push {r4-r6,lr}
	adds r5, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CCD3A
	ldr r1, _080CCD98 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	adds r0, 0x8
	strh r0, [r1, 0x2]
_080CCD3A:
	ldr r6, _080CCD9C @ =gUnknown_0202F7C8
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8077EE4
	lsls r0, 24
	ldr r4, _080CCD98 @ =gUnknown_03004B00
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
	strh r0, [r5, 0x22]
	ldrb r0, [r6]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CCD78
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CCDA0
_080CCD78:
	ldrb r0, [r6]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r5, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x5]
	b _080CCDB8
	.align 2, 0
_080CCD98: .4byte gUnknown_03004B00
_080CCD9C: .4byte gUnknown_0202F7C8
_080CCDA0:
	ldrb r0, [r6]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
_080CCDB8:
	ldr r0, _080CCDF8 @ =gUnknown_03004B00
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x2E]
	ldr r0, _080CCDFC @ =0x00002828
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r3, 0x80
	lsls r3, 1
	adds r0, r3
	strh r0, [r5, 0x32]
	movs r2, 0x10
	movs r0, 0x10
	strh r0, [r5, 0x3C]
	ldr r1, _080CCE00 @ =REG_BLDCNT
	movs r3, 0xFD
	lsls r3, 6
	adds r0, r3, 0
	strh r0, [r1]
	ldr r3, _080CCE04 @ =REG_BLDALPHA
	ldrh r1, [r5, 0x3C]
	lsls r0, r1, 8
	subs r2, r1
	orrs r0, r2
	strh r0, [r3]
	ldr r0, _080CCE08 @ =sub_80CCE0C
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CCDF8: .4byte gUnknown_03004B00
_080CCDFC: .4byte 0x00002828
_080CCE00: .4byte REG_BLDCNT
_080CCE04: .4byte REG_BLDALPHA
_080CCE08: .4byte sub_80CCE0C
	thumb_func_end sub_80CCD24

	thumb_func_start sub_80CCE0C
sub_80CCE0C: @ 80CCE0C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	adds r0, 0x60
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CCE6A
	movs r0, 0
	strh r0, [r4, 0x30]
	ldr r1, _080CCEB0 @ =gPlttBufferFaded
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	adds r0, 0x1
	lsls r0, 1
	adds r0, r1
	ldrh r5, [r0]
	movs r2, 0
	adds r6, r1, 0
	adds r3, r6, 0
_080CCE44:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	adds r2, 0x1
	adds r0, r2
	lsls r1, r0, 1
	adds r1, r3
	adds r0, 0x1
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	cmp r2, 0x5
	ble _080CCE44
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	adds r0, 0x7
	lsls r0, 1
	adds r0, r6
	strh r5, [r0]
_080CCE6A:
	ldrh r2, [r4, 0x3C]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	ble _080CCE9E
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	ble _080CCEB8
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CCE9E
	movs r0, 0
	strh r0, [r4, 0x3A]
	subs r2, 0x1
	strh r2, [r4, 0x3C]
	ldr r3, _080CCEB4 @ =REG_BLDALPHA
	lsls r1, r2, 8
	movs r0, 0x10
	subs r0, r2
	orrs r1, r0
	strh r1, [r3]
_080CCE9E:
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080CCEB8
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	b _080CCEF4
	.align 2, 0
_080CCEB0: .4byte gPlttBufferFaded
_080CCEB4: .4byte REG_BLDALPHA
_080CCEB8:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CCEF4
	movs r0, 0
	strh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	adds r1, 0x1
	strh r1, [r4, 0x3C]
	ldr r3, _080CCEFC @ =REG_BLDALPHA
	lsls r2, r1, 8
	movs r0, 0x10
	subs r0, r1
	orrs r2, r0
	strh r2, [r3]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080CCEF4
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080CCF00 @ =sub_807861C
	str r0, [r4, 0x1C]
_080CCEF4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CCEFC: .4byte REG_BLDALPHA
_080CCF00: .4byte sub_807861C
	thumb_func_end sub_80CCE0C

	thumb_func_start sub_80CCF04
sub_80CCF04: @ 80CCF04
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080CCF5C @ =gUnknown_0202F7C9
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080CCF60 @ =0x0000ffe8
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x2E]
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x32]
	strh r5, [r4, 0x34]
	strh r5, [r4, 0x36]
	strh r5, [r4, 0x3A]
	movs r0, 0x10
	strh r0, [r4, 0x3C]
	ldr r1, _080CCF64 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080CCF68 @ =REG_BLDALPHA
	ldrh r0, [r4, 0x3C]
	lsls r0, 8
	ldrh r1, [r4, 0x3A]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080CCF6C @ =sub_80CCF70
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CCF5C: .4byte gUnknown_0202F7C9
_080CCF60: .4byte 0x0000ffe8
_080CCF64: .4byte REG_BLDCNT
_080CCF68: .4byte REG_BLDALPHA
_080CCF6C: .4byte sub_80CCF70
	thumb_func_end sub_80CCF04

	thumb_func_start sub_80CCF70
sub_80CCF70: @ 80CCF70
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080CCF7E
	b _080CD0C0
_080CCF7E:
	lsls r0, 2
	ldr r1, _080CCF88 @ =_080CCF8C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CCF88: .4byte _080CCF8C
	.align 2, 0
_080CCF8C:
	.4byte _080CCFA0
	.4byte _080CD004
	.4byte _080CD020
	.4byte _080CD09C
	.4byte _080CD0B0
_080CCFA0:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	cmp r0, 0
	bgt _080CCFAE
	b _080CD0C0
_080CCFAE:
	movs r0, 0
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CCFD0
	ldrh r1, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080CCFDE
	adds r0, r1, 0x1
	strh r0, [r4, 0x3A]
	b _080CCFDE
_080CCFD0:
	ldrh r1, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080CCFDE
	subs r0, r1, 0x1
	strh r0, [r4, 0x3C]
_080CCFDE:
	ldr r2, _080CD000 @ =REG_BLDALPHA
	ldrh r0, [r4, 0x3C]
	lsls r0, 8
	ldrh r1, [r4, 0x3A]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080CD0C0
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080CD0C0
	strh r0, [r4, 0x30]
	b _080CD0A8
	.align 2, 0
_080CD000: .4byte REG_BLDALPHA
_080CD004:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080CD0C0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080CD0A8
_080CD020:
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x4
	bl sub_80CD0CC
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080CD042
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
_080CD042:
	ldrh r0, [r4, 0x32]
	adds r1, r0, 0x1
	strh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080CD0C0
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080CD068
	ldrh r1, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080CD076
	subs r0, r1, 0x1
	strh r0, [r4, 0x3A]
	b _080CD076
_080CD068:
	ldrh r1, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080CD076
	adds r0, r1, 0x1
	strh r0, [r4, 0x3C]
_080CD076:
	ldr r0, _080CD098 @ =REG_BLDALPHA
	ldrh r1, [r4, 0x3C]
	lsls r1, 8
	ldrh r2, [r4, 0x3A]
	orrs r1, r2
	strh r1, [r0]
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _080CD0C0
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0x10
	bne _080CD0C0
	strh r1, [r4, 0x30]
	strh r1, [r4, 0x32]
	b _080CD0A8
	.align 2, 0
_080CD098: .4byte REG_BLDALPHA
_080CD09C:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080CD0A8:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080CD0C0
_080CD0B0:
	ldr r0, _080CD0C8 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r4, 0
	bl move_anim_8072740
_080CD0C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD0C8: .4byte REG_BLDCNT
	thumb_func_end sub_80CCF70

	thumb_func_start sub_80CD0CC
sub_80CD0CC: @ 80CD0CC
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0xB
	bgt _080CD0DE
	ldrh r0, [r4, 0x36]
	adds r0, 0x2
	strh r0, [r4, 0x36]
_080CD0DE:
	ldrh r5, [r4, 0x34]
	adds r0, r5, 0
	subs r0, 0x12
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	cmp r0, 0x17
	bhi _080CD0F4
	ldrh r0, [r4, 0x36]
	subs r0, 0x2
	strh r0, [r4, 0x36]
_080CD0F4:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x2F
	ble _080CD102
	ldrh r0, [r4, 0x36]
	adds r0, 0x2
	strh r0, [r4, 0x36]
_080CD102:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0x9
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xE
	bl __divsi3
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	bge _080CD128
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x26]
_080CD128:
	adds r0, r5, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	ble _080CD138
	movs r0, 0
	strh r0, [r4, 0x34]
_080CD138:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD0CC

	thumb_func_start sub_80CD140
sub_80CD140: @ 80CD140
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080CD184 @ =gUnknown_03004B00
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080CD154
	adds r0, r4, 0
	bl sub_8078650
_080CD154:
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_807867C
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x32]
	ldr r1, _080CD188 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CD18C @ =sub_8078394
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD184: .4byte gUnknown_03004B00
_080CD188: .4byte move_anim_8072740
_080CD18C: .4byte sub_8078394
	thumb_func_end sub_80CD140

	thumb_func_start sub_80CD190
sub_80CD190: @ 80CD190
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080CD1A4 @ =gUnknown_03004B00
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CD1AC
	ldr r0, _080CD1A8 @ =gUnknown_0202F7C8
	b _080CD1AE
	.align 2, 0
_080CD1A4: .4byte gUnknown_03004B00
_080CD1A8: .4byte gUnknown_0202F7C8
_080CD1AC:
	ldr r0, _080CD1F0 @ =gUnknown_0202F7C9
_080CD1AE:
	ldrb r6, [r0]
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _080CD1F8
	movs r1, 0x2
	adds r0, r6, 0
	eors r0, r1
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080CD1F8
	ldr r4, _080CD1F4 @ =gUnknown_03004B00
	ldrb r1, [r4, 0xC]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	adds r0, r6, 0
	bl sub_807A3FC
	movs r2, 0
	ldrsh r1, [r4, r2]
	adds r0, r5, 0
	bl sub_807867C
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	b _080CD248
	.align 2, 0
_080CD1F0: .4byte gUnknown_0202F7C9
_080CD1F4: .4byte gUnknown_03004B00
_080CD1F8:
	ldr r4, _080CD218 @ =gUnknown_03004B00
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080CD21C
	adds r0, r6, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x1
	b _080CD22E
	.align 2, 0
_080CD218: .4byte gUnknown_03004B00
_080CD21C:
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x3
_080CD22E:
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
	strh r0, [r5, 0x22]
	ldr r0, _080CD268 @ =gUnknown_03004B00
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r0, r5, 0
	bl sub_807867C
_080CD248:
	ldr r1, _080CD268 @ =gUnknown_03004B00
	ldrh r0, [r1, 0xA]
	strh r0, [r5, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x32]
	ldr r1, _080CD26C @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080CD270 @ =sub_8078394
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD268: .4byte gUnknown_03004B00
_080CD26C: .4byte move_anim_8072740
_080CD270: .4byte sub_8078394
	thumb_func_end sub_80CD190

	thumb_func_start sub_80CD274
sub_80CD274: @ 80CD274
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _080CD2A0 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CD2A8
	ldr r0, _080CD2A4 @ =gUnknown_03004B00
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	b _080CD2C2
	.align 2, 0
_080CD2A0: .4byte gUnknown_0202F7C8
_080CD2A4: .4byte gUnknown_03004B00
_080CD2A8:
	ldr r2, _080CD2CC @ =gUnknown_03004B00
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080CD2C2:
	ldr r0, _080CD2D0 @ =sub_80CD2D4
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD2CC: .4byte gUnknown_03004B00
_080CD2D0: .4byte sub_80CD2D4
	thumb_func_end sub_80CD274

	thumb_func_start sub_80CD2D4
sub_80CD2D4: @ 80CD2D4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _080CD30C
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r0, 0x1E
	subs r0, r1
	movs r1, 0x3
	bl __divsi3
	strh r0, [r4, 0x26]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 18
	asrs r0, 16
	movs r1, 0x3
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_080CD30C:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080CD320
	adds r0, r4, 0
	bl move_anim_8072740
_080CD320:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD2D4

	thumb_func_start sub_80CD328
sub_80CD328: @ 80CD328
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _080CD358 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CD360
	ldr r1, _080CD35C @ =gUnknown_03004B00
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0x1
	strh r0, [r4, 0x34]
	b _080CD37E
	.align 2, 0
_080CD358: .4byte gUnknown_0202F7C8
_080CD35C: .4byte gUnknown_03004B00
_080CD360:
	ldr r2, _080CD388 @ =gUnknown_03004B00
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldr r0, _080CD38C @ =0x0000ffff
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080CD37E:
	ldr r0, _080CD390 @ =sub_80CD394
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD388: .4byte gUnknown_03004B00
_080CD38C: .4byte 0x0000ffff
_080CD390: .4byte sub_80CD394
	thumb_func_end sub_80CD328

	thumb_func_start sub_80CD394
sub_80CD394: @ 80CD394
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x28
	bl __divsi3
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 1
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080CD3D8
	adds r0, r4, 0
	bl move_anim_8074EE0
_080CD3D8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD394

	thumb_func_start sub_80CD3E0
sub_80CD3E0: @ 80CD3E0
	push {lr}
	ldrh r1, [r0, 0x20]
	subs r1, 0x20
	strh r1, [r0, 0x20]
	ldrh r1, [r0, 0x22]
	subs r1, 0x20
	strh r1, [r0, 0x22]
	movs r1, 0x14
	strh r1, [r0, 0x2E]
	ldr r1, _080CD400 @ =sub_80782D8
	str r1, [r0, 0x1C]
	ldr r1, _080CD404 @ =sub_80CD408
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080CD400: .4byte sub_80782D8
_080CD404: .4byte sub_80CD408
	thumb_func_end sub_80CD3E0

	thumb_func_start sub_80CD408
sub_80CD408: @ 80CD408
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r6, [r5, 0x38]
	movs r1, 0x1
	adds r0, r1, 0
	ands r0, r6
	cmp r0, 0
	beq _080CD41E
	cmp r0, 0x1
	beq _080CD438
	b _080CD49E
_080CD41E:
	strh r1, [r5, 0x2E]
	ldr r0, _080CD430 @ =sub_80782D8
	str r0, [r5, 0x1C]
	ldr r1, _080CD434 @ =sub_80CD408
	adds r0, r5, 0
	bl oamt_set_x3A_32
	b _080CD49E
	.align 2, 0
_080CD430: .4byte sub_80782D8
_080CD434: .4byte sub_80CD408
_080CD438:
	ldrh r3, [r5, 0x24]
	ldrh r0, [r5, 0x20]
	adds r3, r0
	movs r0, 0
	strh r3, [r5, 0x20]
	ldrh r4, [r5, 0x26]
	ldrh r1, [r5, 0x22]
	adds r4, r1
	strh r4, [r5, 0x22]
	strh r0, [r5, 0x26]
	strh r0, [r5, 0x24]
	movs r0, 0x8
	strh r0, [r5, 0x2E]
	ldr r2, _080CD4AC @ =gUnknown_083D6DDC
	lsls r0, r6, 16
	asrs r0, 24
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	adds r3, r1
	strh r3, [r5, 0x32]
	adds r2, 0x1
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r4, r0
	strh r4, [r5, 0x36]
	ldr r0, _080CD4B0 @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _080CD4B4 @ =sub_80CD4B8
	adds r0, r5, 0
	bl oamt_set_x3A_32
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	ldrh r1, [r5, 0x38]
	adds r0, r1
	strh r0, [r5, 0x38]
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xD2
	bl PlaySE12WithPanning
_080CD49E:
	ldrh r0, [r5, 0x38]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r5, 0x38]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD4AC: .4byte gUnknown_083D6DDC
_080CD4B0: .4byte sub_8078B34
_080CD4B4: .4byte sub_80CD4B8
	thumb_func_end sub_80CD408

	thumb_func_start sub_80CD4B8
sub_80CD4B8: @ 80CD4B8
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x38]
	lsls r0, 16
	asrs r0, 24
	cmp r0, 0x4
	bne _080CD4E0
	movs r0, 0xA
	strh r0, [r2, 0x2E]
	ldr r0, _080CD4D8 @ =sub_80782D8
	str r0, [r2, 0x1C]
	ldr r1, _080CD4DC @ =sub_80CD4EC
	adds r0, r2, 0
	bl oamt_set_x3A_32
	b _080CD4E4
	.align 2, 0
_080CD4D8: .4byte sub_80782D8
_080CD4DC: .4byte sub_80CD4EC
_080CD4E0:
	ldr r0, _080CD4E8 @ =sub_80CD408
	str r0, [r2, 0x1C]
_080CD4E4:
	pop {r0}
	bx r0
	.align 2, 0
_080CD4E8: .4byte sub_80CD408
	thumb_func_end sub_80CD4B8

	thumb_func_start sub_80CD4EC
sub_80CD4EC: @ 80CD4EC
	push {r4-r7,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x6]
	cmp r1, 0
	bne _080CD514
	movs r0, 0x3
	strh r0, [r5, 0x2E]
	strh r1, [r5, 0x30]
	strh r1, [r5, 0x32]
	ldr r0, _080CD50C @ =sub_80782D8
	str r0, [r5, 0x1C]
	ldr r1, _080CD510 @ =sub_80CD5A8
	adds r0, r5, 0
	bl oamt_set_x3A_32
	b _080CD594
	.align 2, 0
_080CD50C: .4byte sub_80782D8
_080CD510: .4byte sub_80CD5A8
_080CD514:
	ldrh r0, [r5, 0x6]
	cmp r0, 0x2
	beq _080CD534
	cmp r0, 0x2
	bgt _080CD524
	cmp r0, 0x1
	beq _080CD52A
	b _080CD548
_080CD524:
	cmp r0, 0x3
	beq _080CD53C
	b _080CD548
_080CD52A:
	ldr r6, _080CD530 @ =0x0000fff8
	adds r7, r6, 0
	b _080CD54C
	.align 2, 0
_080CD530: .4byte 0x0000fff8
_080CD534:
	ldr r7, _080CD538 @ =0x0000fff8
	b _080CD54A
	.align 2, 0
_080CD538: .4byte 0x0000fff8
_080CD53C:
	movs r7, 0x8
	ldr r6, _080CD544 @ =0x0000fff8
	b _080CD54C
	.align 2, 0
_080CD544: .4byte 0x0000fff8
_080CD548:
	movs r7, 0x8
_080CD54A:
	movs r6, 0x8
_080CD54C:
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	movs r0, 0x6
	strh r0, [r5, 0x2E]
	ldr r4, _080CD59C @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r7
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x36]
	ldr r0, _080CD5A0 @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _080CD5A4 @ =sub_80CD654
	adds r0, r5, 0
	bl oamt_set_x3A_32
_080CD594:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CD59C: .4byte gUnknown_0202F7C9
_080CD5A0: .4byte sub_8078B34
_080CD5A4: .4byte sub_80CD654
	thumb_func_end sub_80CD4EC

	thumb_func_start sub_80CD5A8
sub_80CD5A8: @ 80CD5A8
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080CD5C8
	ldrh r0, [r4, 0x30]
	adds r0, 0x3
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080CD5D8
	movs r0, 0x10
	b _080CD5D6
_080CD5C8:
	ldrh r0, [r4, 0x30]
	subs r0, 0x3
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _080CD5D8
	movs r0, 0
_080CD5D6:
	strh r0, [r4, 0x30]
_080CD5D8:
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x1
	bl sub_80791A8
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080CD634 @ =0x00007fff
	bl BlendPalettes
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	cmp r0, 0x10
	bne _080CD640
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	lsls r0, r1, 5
	ldr r2, _080CD638 @ =gPlttBufferUnfaded + 0x210
	adds r0, r2
	lsls r1, 4
	ldr r3, _080CD63C @ =0x00000101
	adds r2, r3, 0
	orrs r1, r2
	movs r2, 0x4
	bl LoadPalette
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xC0
	bl PlaySE12WithPanning
	b _080CD648
	.align 2, 0
_080CD634: .4byte 0x00007fff
_080CD638: .4byte gPlttBufferUnfaded + 0x210
_080CD63C: .4byte 0x00000101
_080CD640:
	cmp r0, 0
	bne _080CD648
	ldr r0, _080CD650 @ =sub_80CD654
	str r0, [r4, 0x1C]
_080CD648:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD650: .4byte sub_80CD654
	thumb_func_end sub_80CD5A8

	thumb_func_start sub_80CD654
sub_80CD654: @ 80CD654
	push {lr}
	adds r2, r0, 0
	ldr r0, _080CD670 @ =gUnknown_03004B00
	ldrh r1, [r0, 0xE]
	ldr r0, _080CD674 @ =0x0000ffff
	cmp r1, r0
	bne _080CD66C
	movs r0, 0
	strh r0, [r2, 0x30]
	strh r0, [r2, 0x2E]
	ldr r0, _080CD678 @ =sub_80CD67C
	str r0, [r2, 0x1C]
_080CD66C:
	pop {r0}
	bx r0
	.align 2, 0
_080CD670: .4byte gUnknown_03004B00
_080CD674: .4byte 0x0000ffff
_080CD678: .4byte sub_80CD67C
	thumb_func_end sub_80CD654

	thumb_func_start sub_80CD67C
sub_80CD67C: @ 80CD67C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080CD6B0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080CD6B0:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bne _080CD6C4
	adds r0, r4, 0
	bl move_anim_8072740
_080CD6C4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD67C

	thumb_func_start sub_80CD6CC
sub_80CD6CC: @ 80CD6CC
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _080CD6EC @ =gUnknown_03004B00
	ldrh r0, [r0]
	strh r0, [r3, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080CD6F0
	ldrh r0, [r3, 0x20]
	subs r0, 0x18
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x22]
	subs r0, 0x18
	strh r0, [r3, 0x22]
	b _080CD742
	.align 2, 0
_080CD6EC: .4byte gUnknown_03004B00
_080CD6F0:
	cmp r0, 0x2
	bne _080CD70C
	ldrh r0, [r3, 0x20]
	subs r0, 0x18
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x22]
	adds r0, 0x18
	strh r0, [r3, 0x22]
	ldrb r1, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x20
	b _080CD73E
_080CD70C:
	cmp r0, 0x3
	bne _080CD728
	ldrh r0, [r3, 0x20]
	adds r0, 0x18
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x22]
	subs r0, 0x18
	strh r0, [r3, 0x22]
	ldrb r1, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	b _080CD73E
_080CD728:
	ldrh r0, [r3, 0x20]
	adds r0, 0x18
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x22]
	adds r0, 0x18
	strh r0, [r3, 0x22]
	ldrb r1, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x30
_080CD73E:
	orrs r0, r1
	strb r0, [r3, 0x3]
_080CD742:
	ldrh r2, [r3, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r4, _080CD768 @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080CD76C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldr r1, _080CD770 @ =sub_80CD3E0
	str r1, [r3, 0x1C]
	adds r0, r3, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD768: .4byte 0x000003ff
_080CD76C: .4byte 0xfffffc00
_080CD770: .4byte sub_80CD3E0
	thumb_func_end sub_80CD6CC

	thumb_func_start sub_80CD774
sub_80CD774: @ 80CD774
	push {lr}
	adds r3, r0, 0
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	strh r0, [r3, 0x2E]
	ldr r0, _080CD79C @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080CD7B0
	cmp r0, 0x1
	bgt _080CD7A0
	cmp r0, 0
	beq _080CD7A6
	b _080CD7C0
	.align 2, 0
_080CD79C: .4byte gUnknown_03004B00
_080CD7A0:
	cmp r0, 0x2
	beq _080CD7B8
	b _080CD7C0
_080CD7A6:
	ldr r0, _080CD7AC @ =sub_80CD7CC
	b _080CD7C2
	.align 2, 0
_080CD7AC: .4byte sub_80CD7CC
_080CD7B0:
	ldr r0, _080CD7B4 @ =sub_80CD8A8
	b _080CD7C2
	.align 2, 0
_080CD7B4: .4byte sub_80CD8A8
_080CD7B8:
	ldr r0, _080CD7BC @ =sub_80CD8F8
	b _080CD7C2
	.align 2, 0
_080CD7BC: .4byte sub_80CD8F8
_080CD7C0:
	ldr r0, _080CD7C8 @ =sub_80CD9B8
_080CD7C2:
	str r0, [r3, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_080CD7C8: .4byte sub_80CD9B8
	thumb_func_end sub_80CD774

	thumb_func_start sub_80CD7CC
sub_80CD7CC: @ 80CD7CC
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x6
	strh r0, [r4, 0x2E]
	ldr r5, _080CD80C @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	movs r2, 0x2
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	beq _080CD7EA
	movs r1, 0x2
_080CD7EA:
	strh r1, [r4, 0x30]
	movs r0, 0
	strh r0, [r4, 0x32]
	ldr r1, _080CD810 @ =gUnknown_02024BE0
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x34]
	ldr r1, _080CD814 @ =sub_80CD81C
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CD818 @ =sub_8078458
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD80C: .4byte gUnknown_0202F7C8
_080CD810: .4byte gUnknown_02024BE0
_080CD814: .4byte sub_80CD81C
_080CD818: .4byte sub_8078458
	thumb_func_end sub_80CD7CC

	thumb_func_start sub_80CD81C
sub_80CD81C: @ 80CD81C
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0x2E
	ldrsh r6, [r5, r0]
	cmp r6, 0
	bne _080CD858
	ldr r1, _080CD898 @ =gUnknown_02024BE0
	ldr r4, _080CD89C @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r5, 0x34]
	movs r1, 0
	bl sub_8078E70
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3A]
	ldr r2, _080CD8A0 @ =0xfffffd00
	adds r1, r2, 0
	cmp r0, 0
	beq _080CD854
	movs r0, 0xC0
	lsls r0, 2
	adds r1, r0, 0
_080CD854:
	strh r1, [r5, 0x36]
	strh r6, [r5, 0x38]
_080CD858:
	ldrh r0, [r5, 0x36]
	ldrh r1, [r5, 0x38]
	adds r0, r1
	strh r0, [r5, 0x38]
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r5, 0x38]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080CD892
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080CD8A4 @ =sub_80CD9B8
	str r0, [r5, 0x1C]
_080CD892:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD898: .4byte gUnknown_02024BE0
_080CD89C: .4byte gUnknown_0202F7C8
_080CD8A0: .4byte 0xfffffd00
_080CD8A4: .4byte sub_80CD9B8
	thumb_func_end sub_80CD81C

	thumb_func_start sub_80CD8A8
sub_80CD8A8: @ 80CD8A8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x4
	strh r0, [r4, 0x2E]
	ldr r5, _080CD8E8 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	movs r1, 0x3
	cmp r0, 0
	beq _080CD8C6
	movs r0, 0x3
	negs r0, r0
	adds r1, r0, 0
_080CD8C6:
	strh r1, [r4, 0x30]
	movs r0, 0
	strh r0, [r4, 0x32]
	ldr r1, _080CD8EC @ =gUnknown_02024BE0
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x34]
	ldr r1, _080CD8F0 @ =sub_80CD9B8
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CD8F4 @ =sub_8078458
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD8E8: .4byte gUnknown_0202F7C8
_080CD8EC: .4byte gUnknown_02024BE0
_080CD8F0: .4byte sub_80CD9B8
_080CD8F4: .4byte sub_8078458
	thumb_func_end sub_80CD8A8

	thumb_func_start sub_80CD8F8
sub_80CD8F8: @ 80CD8F8
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080CD912
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080CD918 @ =sub_80CD91C
	str r0, [r1, 0x1C]
_080CD912:
	pop {r0}
	bx r0
	.align 2, 0
_080CD918: .4byte sub_80CD91C
	thumb_func_end sub_80CD8F8

	thumb_func_start sub_80CD91C
sub_80CD91C: @ 80CD91C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080CD96C
	ldr r1, _080CD958 @ =gUnknown_02024BE0
	ldr r4, _080CD95C @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3A]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CD960
	movs r0, 0xFC
	lsls r0, 8
	strh r0, [r5, 0x36]
	movs r0, 0xC0
	lsls r0, 4
	b _080CD96A
	.align 2, 0
_080CD958: .4byte gUnknown_02024BE0
_080CD95C: .4byte gUnknown_0202F7C8
_080CD960:
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r5, 0x36]
	movs r0, 0xF4
	lsls r0, 8
_080CD96A:
	strh r0, [r5, 0x38]
_080CD96C:
	ldrh r0, [r5, 0x36]
	ldrh r1, [r5, 0x38]
	adds r0, r1
	strh r0, [r5, 0x38]
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r5, 0x38]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080CD9AC
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	ldr r0, _080CD9B4 @ =sub_80CD9B8
	str r0, [r5, 0x1C]
_080CD9AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD9B4: .4byte sub_80CD9B8
	thumb_func_end sub_80CD91C

	thumb_func_start sub_80CD9B8
sub_80CD9B8: @ 80CD9B8
	push {lr}
	bl move_anim_8072740
	pop {r0}
	bx r0
	thumb_func_end sub_80CD9B8

	thumb_func_start sub_80CD9C4
sub_80CD9C4: @ 80CD9C4
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldr r1, _080CD9D0 @ =sub_80CD9D4
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080CD9D0: .4byte sub_80CD9D4
	thumb_func_end sub_80CD9C4

	thumb_func_start sub_80CD9D4
sub_80CD9D4: @ 80CD9D4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080CDA2E
	cmp r5, 0x1
	bgt _080CD9EA
	cmp r5, 0
	beq _080CD9F0
	b _080CDAC2
_080CD9EA:
	cmp r5, 0x2
	beq _080CDA80
	b _080CDAC2
_080CD9F0:
	strh r5, [r4, 0x30]
	ldr r1, _080CDA74 @ =gUnknown_02024BE0
	ldr r2, _080CDA78 @ =gUnknown_0202F7C8
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x32]
	ldrb r0, [r2]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x34]
	ldr r2, _080CDA7C @ =0xfffffe00
	adds r1, r2, 0
	cmp r0, 0
	beq _080CDA18
	movs r0, 0x80
	lsls r0, 2
	adds r1, r0, 0
_080CDA18:
	strh r1, [r4, 0x36]
	strh r5, [r4, 0x38]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8078E70
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_080CDA2E:
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0x38]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080CDAC2
	movs r0, 0
	strh r0, [r4, 0x30]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080CDAC2
	.align 2, 0
_080CDA74: .4byte gUnknown_02024BE0
_080CDA78: .4byte gUnknown_0202F7C8
_080CDA7C: .4byte 0xfffffe00
_080CDA80:
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0x38]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080CDAC2
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	adds r0, r4, 0
	bl move_anim_8072740
_080CDAC2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD9D4

	thumb_func_start sub_80CDAC8
sub_80CDAC8: @ 80CDAC8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080CDB0C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldr r1, _080CDB10 @ =gUnknown_02024BE0
	ldr r2, _080CDB14 @ =gUnknown_0202F7C8
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0
	strh r0, [r5, 0x8]
	ldrb r0, [r2]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r2, r0, 24
	strh r2, [r5, 0xA]
	strh r4, [r5, 0xC]
	ldr r0, _080CDB18 @ =gUnknown_03004B00
	movs r3, 0
	ldrsh r1, [r0, r3]
	cmp r1, 0
	beq _080CDB1C
	cmp r1, 0x1
	beq _080CDB38
	adds r0, r6, 0
	bl move_anim_task_del
	b _080CDB56
	.align 2, 0
_080CDB0C: .4byte gTasks
_080CDB10: .4byte gUnknown_02024BE0
_080CDB14: .4byte gUnknown_0202F7C8
_080CDB18: .4byte gUnknown_03004B00
_080CDB1C:
	strh r1, [r5, 0xC]
	movs r0, 0x8
	strh r0, [r5, 0xE]
	strh r1, [r5, 0x10]
	movs r0, 0x3
	strh r0, [r5, 0x12]
	cmp r2, 0
	bne _080CDB30
	negs r0, r0
	strh r0, [r5, 0x12]
_080CDB30:
	ldr r0, _080CDB34 @ =sub_80CDB60
	b _080CDB54
	.align 2, 0
_080CDB34: .4byte sub_80CDB60
_080CDB38:
	movs r0, 0x8
	strh r0, [r5, 0xE]
	movs r0, 0xC0
	lsls r0, 3
	strh r0, [r5, 0x10]
	movs r1, 0xC0
	strh r1, [r5, 0x12]
	cmp r2, 0
	bne _080CDB52
	negs r0, r0
	strh r0, [r5, 0x10]
	negs r0, r1
	strh r0, [r5, 0x12]
_080CDB52:
	ldr r0, _080CDB5C @ =sub_80CDD20
_080CDB54:
	str r0, [r5]
_080CDB56:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CDB5C: .4byte sub_80CDD20
	thumb_func_end sub_80CDAC8

	thumb_func_start sub_80CDB60
sub_80CDB60: @ 80CDB60
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080CDB84 @ =gTasks
	adds r4, r0, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080CDB7A
	b _080CDD1A
_080CDB7A:
	lsls r0, 2
	ldr r1, _080CDB88 @ =_080CDB8C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CDB84: .4byte gTasks
_080CDB88: .4byte _080CDB8C
	.align 2, 0
_080CDB8C:
	.4byte _080CDBA0
	.4byte _080CDBD2
	.4byte _080CDC2C
	.4byte _080CDCA4
	.4byte _080CDCE8
_080CDBA0:
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r1, 0
	beq _080CDBB0
	ldrh r2, [r4, 0x12]
	ldrh r3, [r4, 0x10]
	adds r2, r3
	b _080CDCF6
_080CDBB0:
	movs r0, 0x8
	strh r0, [r4, 0xE]
	strh r1, [r4, 0x10]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r1, 0xC0
	cmp r0, 0
	bne _080CDBC6
	movs r2, 0xC0
	negs r2, r2
	adds r1, r2, 0
_080CDBC6:
	strh r1, [r4, 0x12]
	ldrb r0, [r4, 0x8]
	movs r1, 0
	bl sub_8078E70
	b _080CDCDC
_080CDBD2:
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080CDBF8
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x10]
	adds r0, r1
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0x10]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x8]
	bl sub_8078F9C
	b _080CDD08
_080CDBF8:
	movs r0, 0x8
	strh r0, [r4, 0xE]
	ldr r2, _080CDC28 @ =gSprites
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x24]
	strh r0, [r4, 0x10]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080CDC1E
	movs r1, 0x2
_080CDC1E:
	strh r1, [r4, 0x12]
	movs r0, 0x1
	strh r0, [r4, 0x14]
	b _080CDCDC
	.align 2, 0
_080CDC28: .4byte gSprites
_080CDC2C:
	ldrh r2, [r4, 0xE]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080CDC88
	ldrh r1, [r4, 0x14]
	movs r3, 0x14
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080CDC46
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	b _080CDD1A
_080CDC46:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _080CDC68
	ldr r2, _080CDC64 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x12]
	ldrh r2, [r4, 0x10]
	adds r1, r2
	b _080CDC7C
	.align 2, 0
_080CDC64: .4byte gSprites
_080CDC68:
	ldr r2, _080CDC84 @ =gSprites
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x10]
	ldrh r2, [r4, 0x12]
	subs r1, r2
_080CDC7C:
	strh r1, [r0, 0x24]
	movs r0, 0x1
	strh r0, [r4, 0x14]
	b _080CDD08
	.align 2, 0
_080CDC84: .4byte gSprites
_080CDC88:
	ldr r2, _080CDCA0 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x10]
	strh r1, [r0, 0x24]
	movs r0, 0xC
	strh r0, [r4, 0xE]
	b _080CDCDC
	.align 2, 0
_080CDCA0: .4byte gSprites
_080CDCA4:
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080CDCB4
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080CDD1A
_080CDCB4:
	movs r0, 0x3
	strh r0, [r4, 0xE]
	ldr r2, _080CDCE4 @ =gSprites
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x24]
	strh r0, [r4, 0x10]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x8
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080CDCDA
	movs r1, 0x8
_080CDCDA:
	strh r1, [r4, 0x12]
_080CDCDC:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _080CDD1A
	.align 2, 0
_080CDCE4: .4byte gSprites
_080CDCE8:
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080CDD14
	ldrh r2, [r4, 0x12]
	ldrh r0, [r4, 0x10]
	adds r2, r0
_080CDCF6:
	strh r2, [r4, 0x10]
	ldr r3, _080CDD10 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x24]
_080CDD08:
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080CDD1A
	.align 2, 0
_080CDD10: .4byte gSprites
_080CDD14:
	adds r0, r2, 0
	bl move_anim_task_del
_080CDD1A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CDB60

	thumb_func_start sub_80CDD20
sub_80CDD20: @ 80CDD20
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080CDD5C @ =gTasks
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080CDD60
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0x10]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x8]
	bl sub_8078F9C
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080CDD6C
	.align 2, 0
_080CDD5C: .4byte gTasks
_080CDD60:
	ldrb r0, [r4, 0x8]
	bl sub_8078F40
	adds r0, r5, 0
	bl move_anim_task_del
_080CDD6C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CDD20

	thumb_func_start sub_80CDD74
sub_80CDD74: @ 80CDD74
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080CDD88 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080CDD90
	ldr r4, _080CDD8C @ =gUnknown_0202F7C8
	b _080CDD92
	.align 2, 0
_080CDD88: .4byte gUnknown_03004B00
_080CDD8C: .4byte gUnknown_0202F7C8
_080CDD90:
	ldr r4, _080CDDD0 @ =gUnknown_0202F7C9
_080CDD92:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x2]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x4]
	adds r0, r6
	strh r0, [r5, 0x22]
	movs r0, 0
	strh r0, [r5, 0x2E]
	strh r0, [r5, 0x30]
	ldr r1, _080CDDD4 @ =sub_80CDEC0
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080CDDD8 @ =sub_8078600
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CDDD0: .4byte gUnknown_0202F7C9
_080CDDD4: .4byte sub_80CDEC0
_080CDDD8: .4byte sub_8078600
	thumb_func_end sub_80CDD74

	thumb_func_start sub_80CDDDC
sub_80CDDDC: @ 80CDDDC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080CDE14 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080CDE18 @ =0x0000ffd0
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r1, _080CDE1C @ =sub_80CDE78
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CDE20 @ =sub_8078600
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CDE14: .4byte gUnknown_0202F7C9
_080CDE18: .4byte 0x0000ffd0
_080CDE1C: .4byte sub_80CDE78
_080CDE20: .4byte sub_8078600
	thumb_func_end sub_80CDDDC

	thumb_func_start sub_80CDE24
sub_80CDE24: @ 80CDE24
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080CDE68 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080CDE6C @ =gUnknown_03004B00
	ldr r2, _080CDE70 @ =0x0000ffd0
	adds r0, r2
	ldrh r1, [r1]
	adds r0, r1
	movs r6, 0
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	strh r6, [r4, 0x2E]
	strh r6, [r4, 0x30]
	ldr r0, _080CDE74 @ =sub_80CDEC0
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CDE68: .4byte gUnknown_0202F7C9
_080CDE6C: .4byte gUnknown_03004B00
_080CDE70: .4byte 0x0000ffd0
_080CDE74: .4byte sub_80CDEC0
	thumb_func_end sub_80CDE24

	thumb_func_start sub_80CDE78
sub_80CDE78: @ 80CDE78
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080CDEA2
	movs r0, 0xC
	strh r0, [r4, 0x2E]
	movs r0, 0x8
	strh r0, [r4, 0x30]
	movs r0, 0
	strh r0, [r4, 0x32]
	ldr r1, _080CDEA8 @ =sub_80CDEB0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CDEAC @ =sub_8078364
	str r0, [r4, 0x1C]
_080CDEA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CDEA8: .4byte sub_80CDEB0
_080CDEAC: .4byte sub_8078364
	thumb_func_end sub_80CDE78

	thumb_func_start sub_80CDEB0
sub_80CDEB0: @ 80CDEB0
	movs r1, 0
	strh r1, [r0, 0x2E]
	strh r1, [r0, 0x30]
	ldr r1, _080CDEBC @ =sub_80CDEC0
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080CDEBC: .4byte sub_80CDEC0
	thumb_func_end sub_80CDEB0

	thumb_func_start sub_80CDEC0
sub_80CDEC0: @ 80CDEC0
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CDF08
	movs r0, 0
	strh r0, [r3, 0x2E]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080CDF08
	adds r0, r3, 0
	bl move_anim_8072740
_080CDF08:
	pop {r0}
	bx r0
	thumb_func_end sub_80CDEC0

	thumb_func_start sub_80CDF0C
sub_80CDF0C: @ 80CDF0C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080CDF20 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080CDF28
	ldr r4, _080CDF24 @ =gUnknown_0202F7C8
	b _080CDF2A
	.align 2, 0
_080CDF20: .4byte gUnknown_03004B00
_080CDF24: .4byte gUnknown_0202F7C8
_080CDF28:
	ldr r4, _080CDF64 @ =gUnknown_0202F7C9
_080CDF2A:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x2]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x4]
	adds r0, r6
	strh r0, [r5, 0x22]
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080CDF68 @ =gUnknown_03004B00
	ldrh r0, [r0, 0x6]
	strh r0, [r5, 0x30]
	ldr r0, _080CDF6C @ =sub_80CDF70
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CDF64: .4byte gUnknown_0202F7C9
_080CDF68: .4byte gUnknown_03004B00
_080CDF6C: .4byte sub_80CDF70
	thumb_func_end sub_80CDF0C

	thumb_func_start sub_80CDF70
sub_80CDF70: @ 80CDF70
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x30
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _080CDF90
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldrh r0, [r2, 0x22]
	subs r0, 0x1
	strh r0, [r2, 0x22]
_080CDF90:
	ldrh r0, [r2, 0x22]
	ldrh r1, [r2, 0x2E]
	subs r0, r1
	strh r0, [r2, 0x22]
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080CDFAC
	adds r0, r2, 0
	bl move_anim_8072740
_080CDFAC:
	pop {r0}
	bx r0
	thumb_func_end sub_80CDF70

	thumb_func_start sub_80CDFB0
sub_80CDFB0: @ 80CDFB0
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080CDFF8 @ =gUnknown_0202F7C8
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0xC
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x2E]
	movs r0, 0x2
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x32]
	strh r5, [r4, 0x34]
	strh r5, [r4, 0x36]
	subs r0, 0x42
	bl sub_8076F98
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x38]
	ldr r0, _080CDFFC @ =sub_80CE000
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CDFF8: .4byte gUnknown_0202F7C8
_080CDFFC: .4byte sub_80CE000
	thumb_func_end sub_80CDFB0

	thumb_func_start sub_80CE000
sub_80CE000: @ 80CE000
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080CE06C
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080CE052
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080CE052
	ldrh r1, [r4, 0x38]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xC2
	bl PlaySE12WithPanning
_080CE052:
	movs r1, 0
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CE06C
	strh r1, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_080CE06C:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080CE096
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	ble _080CE096
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080CE096
	adds r0, r4, 0
	bl move_anim_8072740
_080CE096:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CE000

	thumb_func_start sub_80CE09C
sub_80CE09C: @ 80CE09C
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080CE0E6
	ldr r4, _080CE0FC @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r5, _080CE100 @ =gUnknown_03004B00
	lsrs r0, 24
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x2]
	adds r0, r5
	strh r0, [r6, 0x22]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CE0E0
	ldrh r0, [r6, 0x22]
	adds r0, 0xA
	strh r0, [r6, 0x22]
_080CE0E0:
	ldrh r0, [r6, 0x2E]
	adds r0, 0x1
	strh r0, [r6, 0x2E]
_080CE0E6:
	ldr r0, _080CE100 @ =gUnknown_03004B00
	ldrh r1, [r0, 0xE]
	ldr r0, _080CE104 @ =0x0000ffff
	cmp r1, r0
	bne _080CE0F6
	adds r0, r6, 0
	bl move_anim_8072740
_080CE0F6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CE0FC: .4byte gUnknown_0202F7C8
_080CE100: .4byte gUnknown_03004B00
_080CE104: .4byte 0x0000ffff
	thumb_func_end sub_80CE09C

	thumb_func_start sub_80CE108
sub_80CE108: @ 80CE108
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080CE128 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080CE134
	ldr r1, _080CE12C @ =gUnknown_03004B00
	ldr r0, _080CE130 @ =0x0000ffff
	strh r0, [r1, 0xE]
	b _080CE16C
	.align 2, 0
_080CE128: .4byte gTasks
_080CE12C: .4byte gUnknown_03004B00
_080CE130: .4byte 0x0000ffff
_080CE134:
	cmp r0, 0x2
	bne _080CE140
	adds r0, r2, 0
	bl move_anim_task_del
	b _080CE172
_080CE140:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080CE172
	movs r0, 0
	strh r0, [r4, 0x8]
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	ldr r3, _080CE178 @ =REG_BLDALPHA
	lsls r2, r1, 8
	movs r0, 0x10
	subs r0, r1
	orrs r2, r0
	strh r2, [r3]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080CE172
_080CE16C:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_080CE172:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE178: .4byte REG_BLDALPHA
	thumb_func_end sub_80CE108

	thumb_func_start sub_80CE17C
sub_80CE17C: @ 80CE17C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8078764
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080CE1A4 @ =gUnknown_03004B00
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080CE1A8 @ =sub_80CE1AC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE1A4: .4byte gUnknown_03004B00
_080CE1A8: .4byte sub_80CE1AC
	thumb_func_end sub_80CE17C

	thumb_func_start sub_80CE1AC
sub_80CE1AC: @ 80CE1AC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080CE1C0
	subs r0, r1, 0x1
	strh r0, [r5, 0x2E]
	b _080CE1FC
_080CE1C0:
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1E
	strh r0, [r5, 0x2E]
	ldr r4, _080CE204 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _080CE208 @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _080CE20C @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
_080CE1FC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CE204: .4byte gUnknown_0202F7C8
_080CE208: .4byte sub_8078B34
_080CE20C: .4byte move_anim_8072740
	thumb_func_end sub_80CE1AC

	thumb_func_start sub_80CE210
sub_80CE210: @ 80CE210
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080CE258 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080CE252
	movs r0, 0
	strh r0, [r3, 0x8]
	ldrh r1, [r3, 0xA]
	adds r1, 0x1
	strh r1, [r3, 0xA]
	ldr r2, _080CE25C @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0x10
	bne _080CE252
	adds r0, r4, 0
	bl move_anim_task_del
_080CE252:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE258: .4byte gTasks
_080CE25C: .4byte REG_BLDALPHA
	thumb_func_end sub_80CE210

	thumb_func_start unref_sub_80CE260
unref_sub_80CE260: @ 80CE260
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0
	ldr r0, _080CE2C8 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r4, r0
	bcs _080CE2BC
	ldr r6, _080CE2CC @ =gUnknown_03004B00
	ldr r5, _080CE2D0 @ =gUnknown_03004340
_080CE274:
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	bne _080CE290
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CE290
	adds r0, r4, r5
	ldrb r0, [r0]
	bl sub_8043DB0
_080CE290:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	bne _080CE2AE
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CE2AE
	adds r0, r4, r5
	ldrb r0, [r0]
	bl sub_8043DB0
_080CE2AE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CE2C8 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r4, r0
	bcc _080CE274
_080CE2BC:
	adds r0, r7, 0
	bl move_anim_task_del
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE2C8: .4byte gUnknown_02024A68
_080CE2CC: .4byte gUnknown_03004B00
_080CE2D0: .4byte gUnknown_03004340
	thumb_func_end unref_sub_80CE260

	thumb_func_start unref_sub_80CE2D4
unref_sub_80CE2D4: @ 80CE2D4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	b _080CE2EE
_080CE2DE:
	ldr r0, _080CE304 @ =gUnknown_03004340
	adds r0, r4, r0
	ldrb r0, [r0]
	bl sub_8043DFC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080CE2EE:
	ldr r0, _080CE308 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r4, r0
	bcc _080CE2DE
	adds r0, r5, 0
	bl move_anim_task_del
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CE304: .4byte gUnknown_03004340
_080CE308: .4byte gUnknown_02024A68
	thumb_func_end unref_sub_80CE2D4

	thumb_func_start sub_80CE30C
sub_80CE30C: @ 80CE30C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CE322
	movs r0, 0x30
	strh r0, [r4, 0x20]
	movs r0, 0x28
	b _080CE32A
_080CE322:
	ldr r0, _080CE34C @ =gUnknown_03004B00
	ldrh r1, [r0]
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
_080CE32A:
	strh r0, [r4, 0x22]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080CE350 @ =sub_80CE354
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE34C: .4byte gUnknown_03004B00
_080CE350: .4byte sub_80CE354
	thumb_func_end sub_80CE30C

	thumb_func_start sub_80CE354
sub_80CE354: @ 80CE354
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080CE366
	adds r0, r1, 0
	bl move_anim_8072740
_080CE366:
	pop {r0}
	bx r0
	thumb_func_end sub_80CE354

	thumb_func_start sub_80CE36C
sub_80CE36C: @ 80CE36C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080CE3A4 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r2, _080CE3A8 @ =gUnknown_03004B00
	lsrs r0, 24
	ldrh r1, [r2]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x30]
	strh r1, [r4, 0x32]
	strh r1, [r4, 0x34]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	ldr r0, _080CE3AC @ =sub_80CE3B0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE3A4: .4byte gUnknown_0202F7C8
_080CE3A8: .4byte gUnknown_03004B00
_080CE3AC: .4byte sub_80CE3B0
	thumb_func_end sub_80CE36C

	thumb_func_start sub_80CE3B0
sub_80CE3B0: @ 80CE3B0
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CE3DA
	movs r0, 0
	strh r0, [r1, 0x30]
	ldrh r2, [r1, 0x32]
	movs r3, 0x32
	ldrsh r0, [r1, r3]
	cmp r0, 0x77
	bgt _080CE3DA
	ldrh r0, [r1, 0x22]
	adds r0, 0x1
	strh r0, [r1, 0x22]
	adds r0, r2, 0x1
	strh r0, [r1, 0x32]
_080CE3DA:
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080CE3E8
	adds r0, r1, 0
	bl move_anim_8072740
_080CE3E8:
	pop {r0}
	bx r0
	thumb_func_end sub_80CE3B0

	thumb_func_start sub_80CE3EC
sub_80CE3EC: @ 80CE3EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80791A8
	mov r8, r0
	ldr r0, _080CE4BC @ =0x0000ffff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldr r0, _080CE4C0 @ =gTasks
	mov r9, r0
	lsls r5, r7, 2
	adds r5, r7
	lsls r5, 3
	adds r6, r5, r0
	strh r4, [r6, 0x8]
	strh r4, [r6, 0xA]
	strh r4, [r6, 0xC]
	strh r1, [r6, 0xE]
	strh r4, [r6, 0x10]
	strh r4, [r6, 0x12]
	strh r4, [r6, 0x14]
	movs r0, 0xD
	strh r0, [r6, 0x16]
	movs r0, 0xE
	strh r0, [r6, 0x18]
	movs r0, 0xF
	strh r0, [r6, 0x1A]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x1
	bl sub_80792C0
	mov r10, r0
	mov r1, r8
	orrs r1, r0
	mov r8, r1
	movs r0, 0x8
	add r9, r0
	add r5, r9
	adds r0, r5, 0
	adds r0, 0x1C
	adds r5, 0x1E
	adds r1, r5, 0
	mov r2, r8
	bl sub_8079BF4
	ldr r0, _080CE4C4 @ =0x000027d2
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x80
	lsls r4, 9
	adds r1, r4, 0
	lsls r1, r0
	mov r0, r10
	orrs r0, r1
	mov r10, r0
	ldr r0, _080CE4C8 @ =0x000027d3
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0
	mov r1, r10
	orrs r4, r1
	ldr r0, _080CE4CC @ =0x00007fbb
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080CE4D0 @ =sub_80CE4D4
	str r1, [r6]
	adds r0, r7, 0
	bl _call_via_r1
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE4BC: .4byte 0x0000ffff
_080CE4C0: .4byte gTasks
_080CE4C4: .4byte 0x000027d2
_080CE4C8: .4byte 0x000027d3
_080CE4CC: .4byte 0x00007fbb
_080CE4D0: .4byte sub_80CE4D4
	thumb_func_end sub_80CE3EC

	thumb_func_start sub_80CE4D4
sub_80CE4D4: @ 80CE4D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080CE4FC @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080CE5C0
	cmp r1, 0x1
	bgt _080CE500
	cmp r1, 0
	beq _080CE50E
	b _080CE65E
	.align 2, 0
_080CE4FC: .4byte gTasks
_080CE500:
	cmp r1, 0x2
	bne _080CE506
	b _080CE618
_080CE506:
	cmp r1, 0x3
	bne _080CE50C
	b _080CE64C
_080CE50C:
	b _080CE65E
_080CE50E:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _080CE51C
	b _080CE65E
_080CE51C:
	strh r1, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _080CE568
	ldrh r0, [r4, 0x16]
	ldrh r1, [r4, 0x10]
	adds r0, r1
	strh r0, [r4, 0x10]
	ldrh r2, [r4, 0x18]
	ldrh r3, [r4, 0x12]
	adds r2, r3
	strh r2, [r4, 0x12]
	ldrh r1, [r4, 0x1A]
	ldrh r5, [r4, 0x14]
	adds r1, r5
	strh r1, [r4, 0x14]
	lsls r0, 16
	asrs r0, 19
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 16
	asrs r2, 19
	lsls r2, 16
	lsls r1, 16
	asrs r1, 19
	lsls r1, 16
	lsrs r2, 11
	orrs r0, r2
	lsrs r1, 6
	orrs r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	b _080CE572
_080CE568:
	ldr r7, _080CE5B8 @ =0x00007fbb
	mov r12, r7
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080CE572:
	movs r2, 0x1
	movs r3, 0
	movs r1, 0
_080CE578:
	movs r5, 0xE
	ldrsh r0, [r4, r5]
	ands r0, r2
	lsls r5, r2, 17
	adds r6, r3, 0
	adds r6, 0x10
	adds r1, 0x1
	mov r8, r1
	cmp r0, 0
	beq _080CE5A4
	movs r1, 0x1
	ldr r2, _080CE5BC @ =gPlttBufferFaded
_080CE590:
	adds r0, r3, r1
	lsls r0, 1
	adds r0, r2
	mov r7, r12
	strh r7, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _080CE590
_080CE5A4:
	lsrs r2, r5, 16
	lsls r0, r6, 16
	lsrs r3, r0, 16
	mov r1, r8
	lsls r0, r1, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _080CE578
	b _080CE65E
	.align 2, 0
_080CE5B8: .4byte 0x00007fbb
_080CE5BC: .4byte gPlttBufferFaded
_080CE5C0:
	ldr r0, _080CE608 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CE65E
	movs r2, 0
	ldr r3, _080CE60C @ =gSprites
	movs r5, 0x14
	adds r5, r3
	mov r12, r5
	ldr r7, _080CE610 @ =gBattleAnimSpriteTemplate_83D6FC8
	mov r8, r7
	ldr r6, _080CE614 @ =gBattleAnimSpriteTemplate_83D6FF8
	movs r5, 0x1
_080CE5DE:
	lsls r0, r2, 4
	adds r0, r2
	lsls r1, r0, 2
	mov r7, r12
	adds r0, r1, r7
	ldr r0, [r0]
	cmp r0, r8
	beq _080CE5F2
	cmp r0, r6
	bne _080CE5F6
_080CE5F2:
	adds r0, r1, r3
	strh r5, [r0, 0x2E]
_080CE5F6:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _080CE5DE
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080CE640
	.align 2, 0
_080CE608: .4byte gPaletteFade
_080CE60C: .4byte gSprites
_080CE610: .4byte gBattleAnimSpriteTemplate_83D6FC8
_080CE614: .4byte gBattleAnimSpriteTemplate_83D6FF8
_080CE618:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _080CE65E
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	bl sub_8079BFC
	ldr r1, _080CE648 @ =0x00007fbb
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_080CE640:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080CE65E
	.align 2, 0
_080CE648: .4byte 0x00007fbb
_080CE64C:
	ldr r0, _080CE66C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CE65E
	adds r0, r2, 0
	bl move_anim_task_del
_080CE65E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE66C: .4byte gPaletteFade
	thumb_func_end sub_80CE4D4

	thumb_func_start sub_80CE670
sub_80CE670: @ 80CE670
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080CE6F4 @ =gUnknown_03004B00
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	bgt _080CE682
	movs r0, 0x2
	strh r0, [r6, 0x4]
_080CE682:
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0x7F
	ble _080CE68E
	movs r0, 0x7F
	strh r0, [r6, 0x4]
_080CE68E:
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldrh r0, [r6, 0x4]
	strh r0, [r5, 0x30]
	ldr r4, _080CE6F8 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x2]
	adds r0, r6
	strh r0, [r5, 0x22]
	ldrh r1, [r5, 0x20]
	strh r1, [r5, 0x3A]
	strh r0, [r5, 0x3C]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CE700
	ldrb r1, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldrh r0, [r5, 0x20]
	adds r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r4, [r5, 0x22]
	adds r4, 0x14
	strh r4, [r5, 0x22]
	lsls r0, 7
	strh r0, [r5, 0x32]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	ldr r0, _080CE6FC @ =0xffffec00
	b _080CE726
	.align 2, 0
_080CE6F4: .4byte gUnknown_03004B00
_080CE6F8: .4byte gUnknown_0202F7C9
_080CE6FC: .4byte 0xffffec00
_080CE700:
	ldr r0, _080CE740 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CE748
	ldrh r0, [r5, 0x20]
	subs r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r4, [r5, 0x22]
	adds r4, 0x14
	strh r4, [r5, 0x22]
	lsls r0, 7
	strh r0, [r5, 0x32]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	movs r0, 0xA0
	lsls r0, 5
_080CE726:
	bl __divsi3
	strh r0, [r5, 0x34]
	lsls r4, 7
	strh r4, [r5, 0x36]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	ldr r0, _080CE744 @ =0xfffff600
	bl __divsi3
	strh r0, [r5, 0x38]
	b _080CE784
	.align 2, 0
_080CE740: .4byte gUnknown_0202F7C8
_080CE744: .4byte 0xfffff600
_080CE748:
	ldrh r0, [r5, 0x20]
	adds r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r4, [r5, 0x22]
	subs r4, 0x14
	strh r4, [r5, 0x22]
	lsls r0, 7
	strh r0, [r5, 0x32]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	ldr r0, _080CE790 @ =0xffffec00
	bl __divsi3
	strh r0, [r5, 0x34]
	lsls r4, 7
	strh r4, [r5, 0x36]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	movs r0, 0xA0
	lsls r0, 4
	bl __divsi3
	strh r0, [r5, 0x38]
	ldrb r1, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x30
	orrs r0, r1
	strb r0, [r5, 0x3]
_080CE784:
	ldr r0, _080CE794 @ =sub_80CE798
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CE790: .4byte 0xffffec00
_080CE794: .4byte sub_80CE798
	thumb_func_end sub_80CE670

	thumb_func_start sub_80CE798
sub_80CE798: @ 80CE798
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	ldrh r1, [r2, 0x38]
	ldrh r3, [r2, 0x36]
	adds r1, r3
	strh r1, [r2, 0x36]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 23
	strh r1, [r2, 0x22]
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080CE7CE
	ldrh r0, [r2, 0x3A]
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x3C]
	strh r0, [r2, 0x22]
_080CE7CE:
	movs r1, 0x30
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080CE7DC
	adds r0, r2, 0
	bl move_anim_8072740
_080CE7DC:
	pop {r0}
	bx r0
	thumb_func_end sub_80CE798

	thumb_func_start sub_80CE7E0
sub_80CE7E0: @ 80CE7E0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _080CE870 @ =gTasks
	adds r6, r0, r1
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x8]
	ldr r0, _080CE874 @ =0x00002771
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0xA]
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	lsls r0, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r3, r0, 16
	ldr r2, _080CE878 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	lsls r4, r0, 4
	movs r5, 0x1
	ldr r2, _080CE87C @ =gPlttBufferUnfaded
_080CE838:
	adds r1, r3, r5
	lsls r1, 1
	adds r1, r2
	adds r0, r4, r5
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xF
	bls _080CE838
	adds r0, r3, 0
	movs r1, 0x10
	movs r2, 0xB
	movs r3, 0
	bl BlendPalette
	movs r0, 0
	strh r0, [r6, 0xE]
	movs r5, 0
	ldr r7, _080CE878 @ =gSprites
	movs r1, 0x1C
	adds r1, r7
	mov r9, r1
	b _080CE8B4
	.align 2, 0
_080CE870: .4byte gTasks
_080CE874: .4byte 0x00002771
_080CE878: .4byte gSprites
_080CE87C: .4byte gPlttBufferUnfaded
_080CE880:
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r4, r2, r7
	ldrb r1, [r6, 0xA]
	lsls r1, 4
	ldrb r3, [r4, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, 0x5]
	movs r0, 0
	strh r0, [r4, 0x2E]
	lsls r0, r5, 7
	strh r0, [r4, 0x30]
	mov r0, r8
	strh r0, [r4, 0x32]
	add r2, r9
	ldr r0, _080CE8E4 @ =sub_80CE974
	str r0, [r2]
	ldrh r0, [r6, 0xE]
	adds r0, 0x1
	strh r0, [r6, 0xE]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080CE8B4:
	cmp r5, 0x1
	bhi _080CE8C6
	movs r0, 0
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080CE880
_080CE8C6:
	ldr r0, _080CE8E8 @ =sub_80CE910
	str r0, [r6]
	ldr r0, _080CE8EC @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CE8F4
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080CE8F0 @ =0x0000fdff
	b _080CE8FC
	.align 2, 0
_080CE8E4: .4byte sub_80CE974
_080CE8E8: .4byte sub_80CE910
_080CE8EC: .4byte gUnknown_0202F7C8
_080CE8F0: .4byte 0x0000fdff
_080CE8F4:
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080CE90C @ =0x0000fbff
_080CE8FC:
	ands r0, r1
	strh r0, [r2]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE90C: .4byte 0x0000fbff
	thumb_func_end sub_80CE7E0

	thumb_func_start sub_80CE910
sub_80CE910: @ 80CE910
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080CE944 @ =gTasks
	adds r0, r1
	movs r1, 0xE
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CE968
	ldr r0, _080CE948 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CE94C
	movs r0, 0x80
	lsls r0, 19
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 2
	b _080CE956
	.align 2, 0
_080CE944: .4byte gTasks
_080CE948: .4byte gUnknown_0202F7C8
_080CE94C:
	movs r0, 0x80
	lsls r0, 19
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 3
_080CE956:
	adds r2, r3, 0
	orrs r1, r2
	strh r1, [r0]
	ldr r0, _080CE970 @ =0x00002771
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl move_anim_task_del
_080CE968:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE970: .4byte 0x00002771
	thumb_func_end sub_80CE910

	thumb_func_start sub_80CE974
sub_80CE974: @ 80CE974
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CE990
	movs r0, 0
	strh r0, [r5, 0x34]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_080CE990:
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x40
	ble _080CE9B8
	ldr r2, _080CE9B4 @ =gTasks
	movs r0, 0x32
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0xE]
	subs r1, 0x1
	strh r1, [r0, 0xE]
	adds r0, r5, 0
	bl obj_delete_but_dont_free_vram
	b _080CE9FA
	.align 2, 0
_080CE9B4: .4byte gTasks
_080CE9B8:
	ldr r4, _080CEA00 @ =gSineTable
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r0, 1
	adds r0, r4
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0x6
	bl __divsi3
	strh r0, [r5, 0x36]
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r0, 1
	adds r0, r4
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0xD
	bl __divsi3
	strh r0, [r5, 0x38]
	ldrh r1, [r5, 0x30]
	adds r1, r0
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r5, 0x30]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
_080CE9FA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CEA00: .4byte gSineTable
	thumb_func_end sub_80CE974

	thumb_func_start sub_80CEA04
sub_80CEA04: @ 80CEA04
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080CEA18 @ =move_anim_8072740
	bl oamt_set_x3A_32
	ldr r0, _080CEA1C @ =sub_8078600
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CEA18: .4byte move_anim_8072740
_080CEA1C: .4byte sub_8078600
	thumb_func_end sub_80CEA04

	thumb_func_start sub_80CEA20
sub_80CEA20: @ 80CEA20
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _080CEAD0 @ =gUnknown_083D712C
	ldrh r0, [r4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xFF
	beq _080CEA64
	lsls r0, r3, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r3, r0, 16
	movs r2, 0x1
	ldr r5, _080CEAD4 @ =gPlttBufferFaded
_080CEA4C:
	adds r1, r3, r2
	lsls r1, 1
	adds r1, r5
	lsls r0, r2, 1
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080CEA4C
_080CEA64:
	movs r4, 0x1
	ldr r0, _080CEAD0 @ =gUnknown_083D712C
	mov r8, r0
_080CEA6A:
	lsls r0, r4, 1
	adds r0, r4
	lsls r5, r0, 2
	mov r1, r8
	adds r0, r5, r1
	ldrh r0, [r0]
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, 0x1
	mov r12, r4
	cmp r3, 0xFF
	beq _080CEAB2
	lsls r0, r3, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r3, r0, 16
	movs r2, 0x1
	ldr r7, _080CEAD4 @ =gPlttBufferFaded
	ldr r6, _080CEAD0 @ =gUnknown_083D712C
	adds r4, r5, 0
_080CEA98:
	adds r1, r3, r2
	lsls r1, 1
	adds r1, r7
	lsls r0, r2, 1
	adds r0, r4
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080CEA98
_080CEAB2:
	mov r1, r12
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080CEA6A
	mov r0, r9
	bl move_anim_task_del
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CEAD0: .4byte gUnknown_083D712C
_080CEAD4: .4byte gPlttBufferFaded
	thumb_func_end sub_80CEA20

	thumb_func_start sub_80CEAD8
sub_80CEAD8: @ 80CEAD8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0x1
	ldr r6, _080CEB08 @ =gUnknown_083D712C
_080CEAE2:
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r6
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080CEAE2
	adds r0, r5, 0
	bl move_anim_task_del
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CEB08: .4byte gUnknown_083D712C
	thumb_func_end sub_80CEAD8

	thumb_func_start sub_80CEB0C
sub_80CEB0C: @ 80CEB0C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	bl sub_8078650
	ldr r4, _080CEB64 @ =gUnknown_03004B00
	ldrb r1, [r4]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r2, _080CEB68 @ =gUnknown_083D712C
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080CEB48
	lsls r2, r0, 4
	ldrb r1, [r5, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
_080CEB48:
	ldrh r0, [r4, 0x2]
	movs r1, 0
	strh r0, [r5, 0x30]
	strh r1, [r5, 0x32]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x34]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CEB6C
	movs r6, 0x30
	movs r3, 0x28
	b _080CEB86
	.align 2, 0
_080CEB64: .4byte gUnknown_03004B00
_080CEB68: .4byte gUnknown_083D712C
_080CEB6C:
	ldr r4, _080CEBBC @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r3, r0, 24
_080CEB86:
	ldrh r0, [r5, 0x20]
	lsls r1, r0, 4
	strh r1, [r5, 0x36]
	ldrh r1, [r5, 0x22]
	lsls r2, r1, 4
	strh r2, [r5, 0x38]
	subs r0, r6, r0
	lsls r0, 16
	asrs r0, 16
	subs r1, r3, r1
	lsls r1, 16
	asrs r1, 16
	adds r2, r5, 0
	adds r2, 0x3A
	adds r3, r5, 0
	adds r3, 0x3C
	movs r4, 0x28
	str r4, [sp]
	bl sub_80CEBC4
	ldr r0, _080CEBC0 @ =sub_80CEC1C
	str r0, [r5, 0x1C]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CEBBC: .4byte gUnknown_0202F7C9
_080CEBC0: .4byte sub_80CEC1C
	thumb_func_end sub_80CEB0C

	thumb_func_start sub_80CEBC4
sub_80CEBC4: @ 80CEBC4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r2, 0
	mov r8, r3
	ldr r2, [sp, 0x18]
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r1, r2, 24
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bge _080CEBE6
	lsls r0, r1, 24
	negs r0, r0
	lsrs r1, r0, 24
_080CEBE6:
	lsls r5, r2, 8
	lsls r1, 24
	asrs r1, 24
	adds r0, r5, 0
	bl __divsi3
	adds r4, r0, 0
	cmp r4, 0
	bne _080CEBFA
	movs r4, 0x1
_080CEBFA:
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	strh r0, [r7]
	lsls r0, r6, 16
	asrs r0, 8
	adds r1, r4, 0
	bl __divsi3
	mov r1, r8
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80CEBC4

	thumb_func_start sub_80CEC1C
sub_80CEC1C: @ 80CEC1C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x2E]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r1, r0, r1
	adds r0, r1, 0
	cmp r1, 0
	bge _080CEC38
	adds r0, 0xFF
_080CEC38:
	asrs r0, 8
	lsls r0, 8
	subs r0, r1, r0
	ldrh r1, [r4, 0x3A]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	ldrh r2, [r4, 0x3C]
	ldrh r3, [r4, 0x38]
	adds r2, r3
	strh r2, [r4, 0x38]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x20]
	lsls r2, 16
	asrs r2, 20
	strh r2, [r4, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0xF
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	ldrh r0, [r4, 0x20]
	adds r0, 0x10
	lsls r0, 16
	movs r1, 0x88
	lsls r1, 17
	cmp r0, r1
	bhi _080CEC86
	lsls r0, r2, 16
	asrs r1, r0, 16
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	blt _080CEC86
	cmp r1, 0x80
	ble _080CEC8E
_080CEC86:
	adds r0, r4, 0
	bl move_anim_8074EE0
	b _080CECDE
_080CEC8E:
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _080CECDE
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, r1
	ble _080CECDE
	strh r5, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080CECB6
	strh r5, [r4, 0x30]
_080CECB6:
	ldr r2, _080CECE4 @ =gUnknown_083D712C
	movs r3, 0x30
	ldrsh r1, [r4, r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080CECDE
	lsls r2, r0, 4
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
_080CECDE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CECE4: .4byte gUnknown_083D712C
	thumb_func_end sub_80CEC1C

	thumb_func_start sub_80CECE8
sub_80CECE8: @ 80CECE8
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r7, _080CED6C @ =gUnknown_0202F7C8
	ldrb r0, [r7]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CED06
	ldr r1, _080CED70 @ =gUnknown_03004B00
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080CED06:
	ldrb r0, [r7]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080CED70 @ =gUnknown_03004B00
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	movs r5, 0
	strh r0, [r6, 0x20]
	ldrb r0, [r7]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r4, 0x4]
	adds r0, r2
	strh r0, [r6, 0x22]
	ldrb r1, [r4]
	adds r0, r6, 0
	bl StartSpriteAnim
	strh r5, [r6, 0x32]
	strh r5, [r6, 0x34]
	ldrh r0, [r6, 0x20]
	lsls r0, 4
	strh r0, [r6, 0x36]
	ldrh r0, [r6, 0x22]
	lsls r0, 4
	strh r0, [r6, 0x38]
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	lsls r0, 4
	movs r1, 0x5
	bl __divsi3
	strh r0, [r6, 0x3A]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	lsls r0, 7
	movs r1, 0x5
	bl __divsi3
	strh r0, [r6, 0x3C]
	ldr r0, _080CED74 @ =sub_80CED78
	str r0, [r6, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CED6C: .4byte gUnknown_0202F7C8
_080CED70: .4byte gUnknown_03004B00
_080CED74: .4byte sub_80CED78
	thumb_func_end sub_80CECE8

	thumb_func_start sub_80CED78
sub_80CED78: @ 80CED78
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x36]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldrh r1, [r4, 0x3C]
	ldrh r2, [r4, 0x38]
	adds r1, r2
	strh r1, [r4, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x22]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	ble _080CEDD6
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080CEDD6
	ldrh r0, [r4, 0x32]
	adds r0, 0x10
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x12
	bl Cos
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x12
	bl Sin
	strh r0, [r4, 0x26]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080CEDD6
	movs r0, 0x1
	strh r0, [r4, 0x34]
_080CEDD6:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x30
	bne _080CEDEA
	adds r0, r4, 0
	bl move_anim_8074EE0
_080CEDEA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CED78

	thumb_func_start sub_80CEDF0
sub_80CEDF0: @ 80CEDF0
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080CEE10 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _080CEE14
	ldrb r0, [r5, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r5, 0x3]
	movs r6, 0x10
	b _080CEE16
	.align 2, 0
_080CEE10: .4byte gUnknown_03004B00
_080CEE14:
	ldr r6, _080CEE50 @ =0x0000fff0
_080CEE16:
	ldr r4, _080CEE54 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x8
	strh r0, [r5, 0x22]
	movs r0, 0x8
	strh r0, [r5, 0x2E]
	ldr r0, _080CEE58 @ =sub_80782D8
	str r0, [r5, 0x1C]
	ldr r1, _080CEE5C @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CEE50: .4byte 0x0000fff0
_080CEE54: .4byte gUnknown_0202F7C8
_080CEE58: .4byte sub_80782D8
_080CEE5C: .4byte move_anim_8072740
	thumb_func_end sub_80CEDF0

	thumb_func_start sub_80CEE60
sub_80CEE60: @ 80CEE60
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldrh r0, [r4, 0x22]
	adds r0, 0x8
	strh r0, [r4, 0x22]
	ldr r5, _080CEED8 @ =gUnknown_03004B00
	ldrb r1, [r5, 0x2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r2, _080CEEDC @ =gUnknown_083D712C
	movs r0, 0x4
	ldrsh r1, [r5, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080CEEA0
	lsls r2, r0, 4
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
_080CEEA0:
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	cmp r0, 0
	bne _080CEEAC
	ldr r2, _080CEEE0 @ =0x0000ffe0
_080CEEAC:
	movs r0, 0x28
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x20]
	strh r1, [r4, 0x30]
	lsls r0, r2, 16
	asrs r0, 16
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	subs r0, 0x28
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x38]
	ldr r0, _080CEEE4 @ =sub_80CEEE8
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CEED8: .4byte gUnknown_03004B00
_080CEEDC: .4byte gUnknown_083D712C
_080CEEE0: .4byte 0x0000ffe0
_080CEEE4: .4byte sub_80CEEE8
	thumb_func_end sub_80CEE60

	thumb_func_start sub_80CEEE8
sub_80CEEE8: @ 80CEEE8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080CEF38
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Sin
	lsls r0, 16
	lsrs r1, r0, 16
	ldrh r2, [r4, 0x24]
	movs r3, 0x24
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _080CEF14
	lsls r0, r1, 16
	negs r0, r0
	lsrs r1, r0, 16
_080CEF14:
	lsls r0, r1, 16
	asrs r0, 16
	adds r0, r2
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Sin
	ldrh r3, [r4, 0x26]
	adds r0, r3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080CEF3E
_080CEF38:
	adds r0, r4, 0
	bl move_anim_8072740
_080CEF3E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CEEE8

	thumb_func_start sub_80CEF44
sub_80CEF44: @ 80CEF44
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CEF64
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_807A100
	adds r0, 0x8
	b _080CEF6E
_080CEF64:
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_807A100
	subs r0, 0x8
_080CEF6E:
	strh r0, [r6, 0x20]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8077ABC
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0
	bl sub_807A100
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080CEF90
	adds r0, 0x3
_080CEF90:
	asrs r0, 2
	subs r0, r4, r0
	strh r0, [r6, 0x22]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80CEF44

	thumb_func_start sub_80CEF9C
sub_80CEF9C: @ 80CEF9C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080CEFB0 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CEFB8
	ldr r0, _080CEFB4 @ =gUnknown_0202F7C8
	b _080CEFBA
	.align 2, 0
_080CEFB0: .4byte gUnknown_03004B00
_080CEFB4: .4byte gUnknown_0202F7C8
_080CEFB8:
	ldr r0, _080CEFF8 @ =gUnknown_0202F7C9
_080CEFBA:
	ldrb r4, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80CEF44
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	ldr r0, _080CEFFC @ =gUnknown_03004B00
	ldrh r0, [r0, 0x2]
	strh r0, [r5, 0x2E]
	adds r0, r1, 0x2
	strh r0, [r5, 0x30]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r1, _080CF000 @ =sub_80CF008
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080CF004 @ =sub_8078600
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CEFF8: .4byte gUnknown_0202F7C9
_080CEFFC: .4byte gUnknown_03004B00
_080CF000: .4byte sub_80CF008
_080CF004: .4byte sub_8078600
	thumb_func_end sub_80CEF9C

	thumb_func_start sub_80CF008
sub_80CF008: @ 80CF008
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080CF030
	ldr r1, _080CF038 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080CF03C @ =sub_8078600
	str r0, [r4, 0x1C]
_080CF030:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF038: .4byte move_anim_8072740
_080CF03C: .4byte sub_8078600
	thumb_func_end sub_80CF008

	thumb_func_start sub_80CF040
sub_80CF040: @ 80CF040
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080CF054 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CF05C
	ldr r0, _080CF058 @ =gUnknown_0202F7C8
	b _080CF05E
	.align 2, 0
_080CF054: .4byte gUnknown_03004B00
_080CF058: .4byte gUnknown_0202F7C8
_080CF05C:
	ldr r0, _080CF07C @ =gUnknown_0202F7C9
_080CF05E:
	ldrb r0, [r0]
	adds r1, r4, 0
	bl sub_80CEF44
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r1, _080CF080 @ =sub_80CF088
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CF084 @ =sub_80785E4
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF07C: .4byte gUnknown_0202F7C9
_080CF080: .4byte sub_80CF088
_080CF084: .4byte sub_80785E4
	thumb_func_end sub_80CF040

	thumb_func_start sub_80CF088
sub_80CF088: @ 80CF088
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080CF0AE
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r1, _080CF0B4 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CF0B8 @ =sub_80785E4
	str r0, [r4, 0x1C]
_080CF0AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF0B4: .4byte move_anim_8074EE0
_080CF0B8: .4byte sub_80785E4
	thumb_func_end sub_80CF088

	thumb_func_start sub_80CF0BC
sub_80CF0BC: @ 80CF0BC
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r0, _080CF0D0 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CF0D8
	ldr r0, _080CF0D4 @ =gUnknown_0202F7C8
	b _080CF0DA
	.align 2, 0
_080CF0D0: .4byte gUnknown_03004B00
_080CF0D4: .4byte gUnknown_0202F7C8
_080CF0D8:
	ldr r0, _080CF12C @ =gUnknown_0202F7C9
_080CF0DA:
	ldrb r5, [r0]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_807A100
	strh r0, [r4, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bgt _080CF102
	movs r0, 0xA
	strh r0, [r4, 0x22]
_080CF102:
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	strh r6, [r4, 0x30]
	adds r1, r4, 0
	adds r1, 0x43
	ldrb r0, [r1]
	strh r0, [r4, 0x32]
	ldrb r0, [r1]
	adds r0, 0x4
	strh r0, [r4, 0x34]
	strh r6, [r4, 0x36]
	ldr r1, _080CF130 @ =sub_80CF138
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CF134 @ =sub_80785E4
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CF12C: .4byte gUnknown_0202F7C9
_080CF130: .4byte sub_80CF138
_080CF134: .4byte sub_80785E4
	thumb_func_end sub_80CF0BC

	thumb_func_start sub_80CF138
sub_80CF138: @ 80CF138
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x36]
	adds r0, 0x1
	strh r0, [r1, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080CF14E
	ldr r0, _080CF154 @ =sub_80CF158
	str r0, [r1, 0x1C]
_080CF14E:
	pop {r0}
	bx r0
	.align 2, 0
_080CF154: .4byte sub_80CF158
	thumb_func_end sub_80CF138

	thumb_func_start sub_80CF158
sub_80CF158: @ 80CF158
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0x4
	strh r1, [r2, 0x30]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFE
	ble _080CF18A
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080CF184
	strh r0, [r2, 0x24]
	ldr r0, _080CF180 @ =sub_80CF088
	str r0, [r2, 0x1C]
	b _080CF1C0
	.align 2, 0
_080CF180: .4byte sub_80CF088
_080CF184:
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2, 0x30]
_080CF18A:
	movs r1, 0x30
	ldrsh r0, [r2, r1]
	cmp r0, 0x4F
	ble _080CF19A
	ldrh r0, [r2, 0x34]
	adds r1, r2, 0
	adds r1, 0x43
	strb r0, [r1]
_080CF19A:
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0x9F
	ble _080CF1AA
	ldrh r0, [r2, 0x32]
	adds r1, r2, 0
	adds r1, 0x43
	strb r0, [r1]
_080CF1AA:
	ldr r1, _080CF1C4 @ =gSineTable
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	asrs r1, r0, 1
	adds r0, r1
	strh r0, [r2, 0x24]
_080CF1C0:
	pop {r0}
	bx r0
	.align 2, 0
_080CF1C4: .4byte gSineTable
	thumb_func_end sub_80CF158

	thumb_func_start sub_80CF1C8
sub_80CF1C8: @ 80CF1C8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080CF1DC @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CF1E4
	ldr r0, _080CF1E0 @ =gUnknown_0202F7C8
	b _080CF1E6
	.align 2, 0
_080CF1DC: .4byte gUnknown_03004B00
_080CF1E0: .4byte gUnknown_0202F7C8
_080CF1E4:
	ldr r0, _080CF208 @ =gUnknown_0202F7C9
_080CF1E6:
	ldrb r4, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80CEF44
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CF20C
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0x2
	b _080CF216
	.align 2, 0
_080CF208: .4byte gUnknown_0202F7C9
_080CF20C:
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0x3
_080CF216:
	strh r0, [r5, 0x2E]
	ldr r0, _080CF224 @ =sub_80CF228
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CF224: .4byte sub_80CF228
	thumb_func_end sub_80CF1C8

	thumb_func_start sub_80CF228
sub_80CF228: @ 80CF228
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	ble _080CF256
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r1, _080CF25C @ =sub_80CF264
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CF260 @ =sub_8078600
	str r0, [r4, 0x1C]
_080CF256:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF25C: .4byte sub_80CF264
_080CF260: .4byte sub_8078600
	thumb_func_end sub_80CF228

	thumb_func_start sub_80CF264
sub_80CF264: @ 80CF264
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080CF27C
	adds r0, r1, 0
	bl move_anim_8072740
_080CF27C:
	pop {r0}
	bx r0
	thumb_func_end sub_80CF264

	thumb_func_start sub_80CF280
sub_80CF280: @ 80CF280
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r5, _080CF2C4 @ =gUnknown_03004B00
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_807867C
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x34]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x36]
	ldr r1, _080CF2C8 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r1, _080CF2CC @ =sub_8078278
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CF2C4: .4byte gUnknown_03004B00
_080CF2C8: .4byte move_anim_8074EE0
_080CF2CC: .4byte sub_8078278
	thumb_func_end sub_80CF280

	thumb_func_start sub_80CF2D0
sub_80CF2D0: @ 80CF2D0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080CF2E4 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CF2EC
	ldr r0, _080CF2E8 @ =gUnknown_0202F7C8
	b _080CF2EE
	.align 2, 0
_080CF2E4: .4byte gUnknown_03004B00
_080CF2E8: .4byte gUnknown_0202F7C8
_080CF2EC:
	ldr r0, _080CF308 @ =gUnknown_0202F7C9
_080CF2EE:
	ldrb r0, [r0]
	adds r1, r4, 0
	bl sub_80CEF44
	movs r0, 0
	strh r0, [r4, 0x2E]
	strh r0, [r4, 0x30]
	ldr r0, _080CF30C @ =sub_80CF310
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF308: .4byte gUnknown_0202F7C9
_080CF30C: .4byte sub_80CF310
	thumb_func_end sub_80CF2D0

	thumb_func_start sub_80CF310
sub_80CF310: @ 80CF310
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _080CF342
	cmp r0, 0x1
	bgt _080CF326
	cmp r0, 0
	beq _080CF32C
	b _080CF370
_080CF326:
	cmp r0, 0x2
	beq _080CF35C
	b _080CF370
_080CF32C:
	ldrh r0, [r1, 0x26]
	subs r0, 0x3
	strh r0, [r1, 0x26]
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080CF370
	b _080CF354
_080CF342:
	ldrh r0, [r1, 0x26]
	adds r0, 0x3
	strh r0, [r1, 0x26]
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080CF370
_080CF354:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	b _080CF370
_080CF35C:
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x40
	bne _080CF370
	adds r0, r1, 0
	bl move_anim_8072740
_080CF370:
	pop {r0}
	bx r0
	thumb_func_end sub_80CF310

	thumb_func_start sub_80CF374
sub_80CF374: @ 80CF374
	push {r4,lr}
	adds r4, r0, 0
	ldr r3, _080CF3C0 @ =gSprites
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r4, 0x30]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x30]
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	cmp r2, 0
	bne _080CF3B2
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x24]
	adds r0, r4, 0
	bl move_anim_8074EE0
_080CF3B2:
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF3C0: .4byte gSprites
	thumb_func_end sub_80CF374

	thumb_func_start sub_80CF3C4
sub_80CF3C4: @ 80CF3C4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _080CF40C @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080CF410 @ =gUnknown_02024BE0
	ldr r0, _080CF414 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	adds r0, r1
	ldrb r6, [r0]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CF41C
	ldr r0, _080CF418 @ =gUnknown_03004B00
	ldrh r1, [r5, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r5, 0x20]
	adds r1, r0, 0
	b _080CF426
	.align 2, 0
_080CF40C: .4byte gUnknown_0202F7C8
_080CF410: .4byte gUnknown_02024BE0
_080CF414: .4byte gUnknown_0202F7C9
_080CF418: .4byte gUnknown_03004B00
_080CF41C:
	ldr r1, _080CF450 @ =gUnknown_03004B00
	ldrh r0, [r1]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	strh r0, [r5, 0x20]
_080CF426:
	ldrh r0, [r1, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	strh r6, [r5, 0x32]
	ldr r0, _080CF454 @ =sub_80CF374
	str r0, [r5, 0x1C]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CF450: .4byte gUnknown_03004B00
_080CF454: .4byte sub_80CF374
	thumb_func_end sub_80CF3C4

	thumb_func_start sub_80CF458
sub_80CF458: @ 80CF458
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r1, _080CF484 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x38]
	ldr r0, _080CF488 @ =sub_80782D8
	str r0, [r4, 0x1C]
	ldr r1, _080CF48C @ =sub_80CF490
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF484: .4byte gUnknown_03004B00
_080CF488: .4byte sub_80782D8
_080CF48C: .4byte sub_80CF490
	thumb_func_end sub_80CF458

	thumb_func_start sub_80CF490
sub_80CF490: @ 80CF490
	push {lr}
	ldrh r1, [r0, 0x30]
	strh r1, [r0, 0x2E]
	ldrh r1, [r0, 0x20]
	strh r1, [r0, 0x32]
	ldrh r1, [r0, 0x22]
	adds r1, 0xF
	strh r1, [r0, 0x36]
	ldr r1, _080CF4B0 @ =sub_8078B34
	str r1, [r0, 0x1C]
	ldr r1, _080CF4B4 @ =sub_80CF4B8
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080CF4B0: .4byte sub_8078B34
_080CF4B4: .4byte sub_80CF4B8
	thumb_func_end sub_80CF490

	thumb_func_start sub_80CF4B8
sub_80CF4B8: @ 80CF4B8
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x38]
	movs r3, 0x38
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080CF4CE
	adds r0, r1, 0
	bl move_anim_8072740
	b _080CF4D2
_080CF4CE:
	subs r0, r2, 0x1
	strh r0, [r1, 0x38]
_080CF4D2:
	pop {r0}
	bx r0
	thumb_func_end sub_80CF4B8

	thumb_func_start sub_80CF4D8
sub_80CF4D8: @ 80CF4D8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080CF504 @ =gUnknown_02024BE0
	ldr r0, _080CF508 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8078E70
	ldr r1, _080CF50C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080CF510 @ =sub_80CF514
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF504: .4byte gUnknown_02024BE0
_080CF508: .4byte gUnknown_0202F7C8
_080CF50C: .4byte gTasks
_080CF510: .4byte sub_80CF514
	thumb_func_end sub_80CF4D8

	thumb_func_start sub_80CF514
sub_80CF514: @ 80CF514
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080CF544 @ =gUnknown_02024BE0
	ldr r0, _080CF548 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r1, r0, r1
	ldrb r4, [r1]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CF550
	ldr r1, _080CF54C @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	negs r0, r0
	lsls r0, 16
	lsrs r3, r0, 16
	adds r6, r2, 0
	b _080CF55E
	.align 2, 0
_080CF544: .4byte gUnknown_02024BE0
_080CF548: .4byte gUnknown_0202F7C8
_080CF54C: .4byte gTasks
_080CF550:
	ldr r2, _080CF590 @ =gTasks
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r0, r2
	ldrh r3, [r0, 0x8]
	adds r6, r1, 0
_080CF55E:
	movs r2, 0x80
	lsls r2, 1
	adds r0, r4, 0
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldr r1, _080CF590 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080CF598
	ldrh r0, [r1, 0x8]
	adds r0, 0xB0
	strh r0, [r1, 0x8]
	ldr r1, _080CF594 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x26]
	adds r1, 0x1
	b _080CF5C2
	.align 2, 0
_080CF590: .4byte gTasks
_080CF594: .4byte gSprites
_080CF598:
	cmp r0, 0x1
	bne _080CF5AE
	ldrh r0, [r1, 0xE]
	adds r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	bne _080CF608
	movs r0, 0x2
	b _080CF606
_080CF5AE:
	ldrh r0, [r1, 0x8]
	subs r0, 0xB0
	strh r0, [r1, 0x8]
	ldr r1, _080CF5FC @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x26]
	subs r1, 0x1
_080CF5C2:
	strh r1, [r0, 0x26]
	adds r0, r4, 0
	bl sub_8078F9C
	ldr r0, _080CF600 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r2, [r1, r3]
	movs r0, 0xF2
	lsls r0, 4
	cmp r2, r0
	beq _080CF5E2
	cmp r2, 0
	bne _080CF608
_080CF5E2:
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x2
	bne _080CF604
	adds r0, r4, 0
	bl sub_8078F40
	adds r0, r5, 0
	bl move_anim_task_del
	b _080CF608
	.align 2, 0
_080CF5FC: .4byte gSprites
_080CF600: .4byte gTasks
_080CF604:
	adds r0, r2, 0x1
_080CF606:
	strh r0, [r1, 0xA]
_080CF608:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80CF514

	thumb_func_start sub_80CF610
sub_80CF610: @ 80CF610
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r5, _080CF658 @ =gUnknown_03004B00
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_807867C
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080CF65C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CF660
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r1, r0
	strb r1, [r2]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _080CF674
	movs r0, 0x2
	orrs r1, r0
	strb r1, [r2]
	b _080CF674
	.align 2, 0
_080CF658: .4byte gUnknown_03004B00
_080CF65C: .4byte gUnknown_0202F7C8
_080CF660:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080CF674
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
_080CF674:
	ldr r0, _080CF688 @ =sub_8078600
	str r0, [r4, 0x1C]
	ldr r1, _080CF68C @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CF688: .4byte sub_8078600
_080CF68C: .4byte move_anim_8072740
	thumb_func_end sub_80CF610

	thumb_func_start sub_80CF690
sub_80CF690: @ 80CF690
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_80787B0
	ldr r0, _080CF6AC @ =sub_80785E4
	str r0, [r4, 0x1C]
	ldr r1, _080CF6B0 @ =sub_80CF6B4
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF6AC: .4byte sub_80785E4
_080CF6B0: .4byte sub_80CF6B4
	thumb_func_end sub_80CF690

	thumb_func_start sub_80CF6B4
sub_80CF6B4: @ 80CF6B4
	push {lr}
	movs r1, 0x6
	strh r1, [r0, 0x2E]
	ldrh r1, [r0, 0x20]
	strh r1, [r0, 0x32]
	ldrh r1, [r0, 0x22]
	subs r1, 0x20
	strh r1, [r0, 0x36]
	ldr r1, _080CF6D4 @ =sub_8078B34
	str r1, [r0, 0x1C]
	ldr r1, _080CF6D8 @ =move_anim_8072740
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080CF6D4: .4byte sub_8078B34
_080CF6D8: .4byte move_anim_8072740
	thumb_func_end sub_80CF6B4

	thumb_func_start sub_80CF6DC
sub_80CF6DC: @ 80CF6DC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CF700
	ldr r1, _080CF6FC @ =gUnknown_03004B00
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	b _080CF722
	.align 2, 0
_080CF6FC: .4byte gUnknown_03004B00
_080CF700:
	ldr r0, _080CF7C8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CF722
	ldr r1, _080CF7CC @ =gUnknown_03004B00
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r1, 0x6]
_080CF722:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r4, _080CF7D0 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r6, _080CF7CC @ =gUnknown_03004B00
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r6, 0x6]
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	adds r7, r0, 0
	ldrh r1, [r5, 0x20]
	mov r2, r8
	lsls r0, r2, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r5, 0x22]
	lsls r1, r7, 16
	asrs r1, 16
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl sub_80790F0
	lsls r0, 16
	movs r1, 0xF0
	lsls r1, 24
	adds r0, r1
	lsrs r4, r0, 16
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CF794
	ldr r2, _080CF7D4 @ =0xffffa000
	adds r0, r4, r2
	lsls r0, 16
	lsrs r4, r0, 16
_080CF794:
	movs r3, 0x80
	lsls r3, 1
	str r4, [sp]
	adds r0, r5, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8078FDC
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	mov r0, r8
	strh r0, [r5, 0x32]
	strh r7, [r5, 0x36]
	ldr r0, _080CF7D8 @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _080CF7DC @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CF7C8: .4byte gUnknown_0202F7C8
_080CF7CC: .4byte gUnknown_03004B00
_080CF7D0: .4byte gUnknown_0202F7C9
_080CF7D4: .4byte 0xffffa000
_080CF7D8: .4byte sub_8078B34
_080CF7DC: .4byte move_anim_8072740
	thumb_func_end sub_80CF6DC

	thumb_func_start sub_80CF7E0
sub_80CF7E0: @ 80CF7E0
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r3, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080CF80A
	ldr r2, _080CF810 @ =gTasks
	movs r0, 0x3C
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0xA]
	subs r1, 0x1
	strh r1, [r0, 0xA]
	adds r0, r3, 0
	bl DestroySprite
_080CF80A:
	pop {r0}
	bx r0
	.align 2, 0
_080CF810: .4byte gTasks
	thumb_func_end sub_80CF7E0

	thumb_func_start sub_80CF814
sub_80CF814: @ 80CF814
	push {r4,lr}
	adds r2, r0, 0
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080CF844 @ =gTasks
	adds r4, r0, r1
	movs r3, 0x2E
	ldrsh r1, [r2, r3]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	ble _080CF848
	ldrh r0, [r2, 0x34]
	ldrh r1, [r2, 0x38]
	adds r0, r1
	strh r0, [r2, 0x38]
	ldrh r0, [r2, 0x36]
	ldrh r3, [r2, 0x3A]
	adds r0, r3
	b _080CF856
	.align 2, 0
_080CF844: .4byte gTasks
_080CF848:
	ldrh r0, [r2, 0x38]
	ldrh r1, [r2, 0x34]
	subs r0, r1
	strh r0, [r2, 0x38]
	ldrh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x36]
	subs r0, r1
_080CF856:
	strh r0, [r2, 0x3A]
	ldrh r0, [r2, 0x38]
	ldrh r1, [r2, 0x30]
	adds r3, r0, r1
	strh r3, [r2, 0x30]
	ldrh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	ldrh r1, [r4, 0x16]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CF87A
	lsls r0, r3, 16
	lsrs r0, 24
	negs r0, r0
	b _080CF87E
_080CF87A:
	lsls r0, r3, 16
	lsrs r0, 24
_080CF87E:
	strh r0, [r2, 0x24]
	ldrh r1, [r4, 0x18]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CF892
	ldrh r0, [r2, 0x32]
	lsrs r0, 8
	negs r0, r0
	b _080CF896
_080CF892:
	ldrh r0, [r2, 0x32]
	lsrs r0, 8
_080CF896:
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r2, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080CF8AC
	movs r0, 0x1E
	strh r0, [r2, 0x2E]
	ldr r0, _080CF8B4 @ =sub_80CF7E0
	str r0, [r2, 0x1C]
_080CF8AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF8B4: .4byte sub_80CF7E0
	thumb_func_end sub_80CF814

	thumb_func_start sub_80CF8B8
sub_80CF8B8: @ 80CF8B8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	movs r0, 0x3C
	ldrsh r1, [r7, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080CF8FC @ =gTasks
	adds r6, r0, r1
	ldrh r2, [r6, 0x16]
	movs r1, 0x2
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	ldrh r3, [r7, 0x30]
	adds r2, r0, r3
	strh r2, [r7, 0x30]
	ldrh r0, [r6, 0x18]
	ands r1, r0
	ldrh r0, [r7, 0x32]
	adds r1, r0
	strh r1, [r7, 0x32]
	ldrh r1, [r6, 0x16]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CF900
	lsls r0, r2, 16
	lsrs r0, 24
	negs r0, r0
	b _080CF904
	.align 2, 0
_080CF8FC: .4byte gTasks
_080CF900:
	lsls r0, r2, 16
	lsrs r0, 24
_080CF904:
	strh r0, [r7, 0x24]
	ldrh r1, [r6, 0x18]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CF918
	ldrh r0, [r7, 0x32]
	lsrs r0, 8
	negs r0, r0
	b _080CF91C
_080CF918:
	ldrh r0, [r7, 0x32]
	lsrs r0, 8
_080CF91C:
	strh r0, [r7, 0x26]
	ldrh r0, [r7, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r7, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080CF9E8
	movs r4, 0
	movs r0, 0x8
	strh r0, [r7, 0x2E]
	movs r0, 0x4
	strh r0, [r6, 0x12]
	movs r0, 0x80
	lsls r0, 5
	bl sub_81174E0
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r7, 0x24]
	ldrh r1, [r7, 0x20]
	adds r2, r0, r1
	strh r2, [r7, 0x20]
	ldrh r0, [r7, 0x26]
	ldrh r3, [r7, 0x22]
	adds r0, r3
	strh r0, [r7, 0x22]
	strh r4, [r7, 0x26]
	strh r4, [r7, 0x24]
	ldrh r3, [r6, 0x1E]
	movs r0, 0x1E
	ldrsh r1, [r6, r0]
	lsls r0, r2, 16
	asrs r0, 16
	cmp r1, r0
	blt _080CF966
	subs r0, r3, r2
	b _080CF968
_080CF966:
	subs r0, r2, r3
_080CF968:
	lsls r0, 24
	lsrs r4, r0, 16
	ldrh r3, [r6, 0x20]
	movs r0, 0x20
	ldrsh r1, [r6, r0]
	ldrh r2, [r7, 0x22]
	movs r6, 0x22
	ldrsh r0, [r7, r6]
	cmp r1, r0
	blt _080CF980
	subs r0, r3, r2
	b _080CF982
_080CF980:
	subs r0, r2, r3
_080CF982:
	lsls r0, 24
	lsrs r0, 16
	mov r8, r0
	movs r0, 0
	strh r0, [r7, 0x32]
	strh r0, [r7, 0x30]
	strh r0, [r7, 0x3A]
	strh r0, [r7, 0x38]
	lsls r0, r4, 16
	asrs r0, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r5, 0
	bl sub_81174C4
	adds r4, r0, 0
	lsls r4, 16
	asrs r4, 16
	movs r6, 0xE0
	lsls r6, 1
	adds r0, r6, 0
	bl sub_81174E0
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_81174C4
	strh r0, [r7, 0x34]
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	adds r1, r5, 0
	bl sub_81174C4
	adds r4, r0, 0
	lsls r4, 16
	asrs r4, 16
	adds r0, r6, 0
	bl sub_81174E0
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_81174C4
	strh r0, [r7, 0x36]
	ldr r0, _080CF9F4 @ =sub_80CF814
	str r0, [r7, 0x1C]
_080CF9E8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CF9F4: .4byte sub_80CF814
	thumb_func_end sub_80CF8B8

	thumb_func_start sub_80CF9F8
sub_80CF9F8: @ 80CF9F8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080CFA1C @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CFA16
	adds r0, r2, 0
	bl move_anim_task_del
_080CFA16:
	pop {r0}
	bx r0
	.align 2, 0
_080CFA1C: .4byte gTasks
	thumb_func_end sub_80CF9F8

	thumb_func_start sub_80CFA20
sub_80CFA20: @ 80CFA20
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080CFA74 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	subs r1, r0, 0x1
	strh r1, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bgt _080CFAF4
	ldr r0, _080CFA78 @ =gSpriteTemplate_83D74BC
	movs r2, 0x1A
	ldrsh r1, [r5, r2]
	movs r3, 0x1C
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, 0xC]
	ldrb r4, [r5, 0xA]
	subs r3, r4
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r0, 4
	add r0, r12
	lsls r0, 2
	ldr r1, _080CFA7C @ =gSprites
	adds r6, r0, r1
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080CFA80
	cmp r0, 0x2
	beq _080CFA96
	b _080CFAA4
	.align 2, 0
_080CFA74: .4byte gTasks
_080CFA78: .4byte gSpriteTemplate_83D74BC
_080CFA7C: .4byte gSprites
_080CFA80:
	ldrb r2, [r6, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x18
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x57
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x3]
	b _080CFAA4
_080CFA96:
	ldrb r0, [r6, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r6, 0x3]
_080CFAA4:
	ldr r3, _080CFAFC @ =gTasks
	lsls r2, r7, 2
	adds r2, r7
	lsls r2, 3
	adds r4, r2, r3
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x14]
	subs r0, r1
	strh r0, [r6, 0x2E]
	strh r7, [r6, 0x3C]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	adds r0, 0xD
	lsls r0, 1
	adds r0, r2
	adds r3, 0x8
	adds r0, r3
	mov r2, r12
	strh r2, [r0]
	ldrh r0, [r4, 0xE]
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r0, 0x3F
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x9A
	bl PlaySE12WithPanning
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0x2
	ble _080CFAF4
	ldr r0, _080CFB00 @ =sub_80CF9F8
	str r0, [r4]
_080CFAF4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CFAFC: .4byte gTasks
_080CFB00: .4byte sub_80CF9F8
	thumb_func_end sub_80CFA20

	thumb_func_start sub_80CFB04
sub_80CFB04: @ 80CFB04
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r9, r0
	movs r5, 0
	mov r0, sp
	mov r1, r9
	strh r1, [r0]
	mov r4, sp
	adds r4, 0x2
	strh r1, [r4]
	bl sub_8076BE0
	lsls r0, 24
	mov r10, r4
	cmp r0, 0
	beq _080CFB70
	ldr r1, _080CFB60 @ =gTasks
	lsls r2, r7, 2
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x10]
	ldr r3, _080CFB64 @ =gUnknown_03004B00
	ldrh r0, [r3]
	negs r0, r0
	strh r0, [r3]
	ldrh r1, [r3, 0x4]
	movs r0, 0x1
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _080CFB68
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strh r0, [r3, 0x4]
	b _080CFBCA
	.align 2, 0
_080CFB60: .4byte gTasks
_080CFB64: .4byte gUnknown_03004B00
_080CFB68:
	movs r0, 0x1
	orrs r0, r1
	strh r0, [r3, 0x4]
	b _080CFBCA
_080CFB70:
	ldr r1, _080CFBB4 @ =gUnknown_02024A72
	ldr r0, _080CFBB8 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	lsls r2, r7, 2
	mov r8, r2
	cmp r0, 0
	bne _080CFBCA
	ldr r1, _080CFBBC @ =gTasks
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0x10]
	ldr r2, _080CFBC0 @ =gUnknown_03004B00
	ldrh r0, [r2]
	negs r0, r0
	strh r0, [r2]
	ldrh r0, [r2, 0x2]
	negs r0, r0
	strh r0, [r2, 0x2]
	ldrh r1, [r2, 0x4]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080CFBC4
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	b _080CFBC8
	.align 2, 0
_080CFBB4: .4byte gUnknown_02024A72
_080CFBB8: .4byte gUnknown_0202F7C9
_080CFBBC: .4byte gTasks
_080CFBC0: .4byte gUnknown_03004B00
_080CFBC4:
	movs r0, 0x1
	orrs r0, r1
_080CFBC8:
	strh r0, [r2, 0x4]
_080CFBCA:
	ldr r5, _080CFC24 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	ldr r1, _080CFC28 @ =gTasks
	mov r3, r8
	adds r4, r3, r7
	lsls r4, 3
	adds r4, r1
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1A]
	adds r6, r0, 0
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	mov r9, r0
	ldr r0, _080CFC2C @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CFC34
	ldr r4, _080CFC30 @ =gUnknown_0202F7C9
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080CFC34
	ldrb r0, [r4]
	movs r1, 0
	mov r2, sp
	mov r3, r10
	bl sub_807A3FC
	b _080CFC56
	.align 2, 0
_080CFC24: .4byte gUnknown_0202F7C8
_080CFC28: .4byte gTasks
_080CFC2C: .4byte gUnknown_020239F8
_080CFC30: .4byte gUnknown_0202F7C9
_080CFC34:
	mov r5, sp
	ldr r4, _080CFC90 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r1, r10
	strh r0, [r1]
_080CFC56:
	mov r4, sp
	ldr r0, _080CFC94 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	mov r2, sp
	ldr r3, _080CFC98 @ =gUnknown_03004B00
	ldrh r0, [r3]
	ldrh r2, [r2]
	adds r0, r2
	strh r0, [r1, 0x1E]
	strh r0, [r4]
	ldrh r0, [r3, 0x2]
	mov r3, r10
	ldrh r3, [r3]
	adds r0, r3
	strh r0, [r1, 0x20]
	mov r1, r10
	strh r0, [r1]
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r0, [r0, r3]
	adds r1, r6, 0
	cmp r0, r1
	blt _080CFC9C
	subs r0, r2, r1
	b _080CFC9E
	.align 2, 0
_080CFC90: .4byte gUnknown_0202F7C9
_080CFC94: .4byte gTasks
_080CFC98: .4byte gUnknown_03004B00
_080CFC9C:
	subs r0, r1, r2
_080CFC9E:
	lsls r0, 16
	lsrs r0, 16
	lsls r4, r0, 16
	asrs r4, 16
	ldr r5, _080CFD14 @ =gUnknown_03004B00
	ldrh r1, [r5, 0x4]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	lsls r0, 16
	asrs r0, 16
	bl sub_81174E0
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_81174C4
	ldr r2, _080CFD18 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r6, r1, r2
	strh r0, [r6, 0x12]
	movs r1, 0x12
	ldrsh r0, [r6, r1]
	movs r1, 0x80
	bl sub_81174C4
	strh r0, [r6, 0x14]
	ldrh r0, [r5, 0x4]
	strh r0, [r6, 0x16]
	mov r2, r10
	ldrh r1, [r2]
	movs r3, 0
	ldrsh r0, [r2, r3]
	mov r4, r9
	cmp r0, r4
	blt _080CFD1C
	subs r4, r1, r4
	lsls r4, 16
	asrs r4, 16
	movs r1, 0x12
	ldrsh r0, [r6, r1]
	bl sub_81174E0
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_81174C4
	movs r1, 0x2
	negs r1, r1
	ands r1, r0
	strh r1, [r6, 0x18]
	b _080CFD3C
	.align 2, 0
_080CFD14: .4byte gUnknown_03004B00
_080CFD18: .4byte gTasks
_080CFD1C:
	subs r4, r1
	lsls r4, 16
	asrs r4, 16
	movs r2, 0x12
	ldrsh r0, [r6, r2]
	bl sub_81174E0
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_81174C4
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r6, 0x18]
_080CFD3C:
	ldr r1, _080CFD7C @ =gTasks
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	adds r5, r0, r1
	ldr r4, _080CFD80 @ =gUnknown_03004B00
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0xE]
	ldrh r1, [r4, 0x8]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080CFD8C
	movs r0, 0x80
	eors r0, r1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3F
	ble _080CFDB4
	ldr r0, _080CFD84 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CFD88 @ =0x0000ffc0
	adds r1, r2, 0
	ldrh r4, [r4, 0x8]
	adds r1, r4
	adds r0, r1
	b _080CFDC4
	.align 2, 0
_080CFD7C: .4byte gTasks
_080CFD80: .4byte gUnknown_03004B00
_080CFD84: .4byte gUnknown_0202F7C9
_080CFD88: .4byte 0x0000ffc0
_080CFD8C:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x3F
	ble _080CFDB4
	ldr r0, _080CFDAC @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080CFDB0 @ =0x0000ffc0
	adds r1, r3, 0
	ldrh r4, [r4, 0x8]
	adds r1, r4
	adds r0, r1
	b _080CFDC4
	.align 2, 0
_080CFDAC: .4byte gUnknown_0202F7C9
_080CFDB0: .4byte 0x0000ffc0
_080CFDB4:
	ldr r0, _080CFDF0 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x8]
	subs r0, r1
_080CFDC4:
	strh r0, [r5, 0xC]
	ldr r0, _080CFDF4 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0x2
	bgt _080CFDDC
	movs r0, 0x3
	strh r0, [r1, 0xC]
_080CFDDC:
	ldr r0, _080CFDF8 @ =sub_80CFA20
	str r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CFDF0: .4byte gUnknown_0202F7C9
_080CFDF4: .4byte gTasks
_080CFDF8: .4byte sub_80CFA20
	thumb_func_end sub_80CFB04

	thumb_func_start sub_80CFDFC
sub_80CFDFC: @ 80CFDFC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_80787B0
	ldr r0, _080CFE24 @ =gSpriteTemplate_83D75AC
	ldrh r0, [r0, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r4, 0x2E]
	ldr r0, _080CFE28 @ =sub_80CFE2C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CFE24: .4byte gSpriteTemplate_83D75AC
_080CFE28: .4byte sub_80CFE2C
	thumb_func_end sub_80CFDFC

	thumb_func_start sub_80CFE2C
sub_80CFE2C: @ 80CFE2C
	push {r4-r7,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080CFE90
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r5, [r4, 0x2E]
	ldr r1, _080CFE98 @ =gPlttBufferFaded
	adds r0, r5, 0
	adds r0, 0x8
	lsls r0, 1
	adds r0, r1
	ldrh r7, [r0]
	adds r6, r1, 0
	adds r1, r5, 0
	adds r1, 0x9
	lsls r0, r5, 1
	adds r0, r6
	adds r2, r0, 0
	adds r2, 0x10
	movs r3, 0x7
	lsls r1, 1
	adds r1, r6
_080CFE64:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080CFE64
	adds r0, r5, 0
	adds r0, 0xF
	lsls r0, 1
	adds r0, r6
	strh r7, [r0]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x18
	bne _080CFE90
	adds r0, r4, 0
	bl move_anim_8072740
_080CFE90:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CFE98: .4byte gPlttBufferFaded
	thumb_func_end sub_80CFE2C

	thumb_func_start sub_80CFE9C
sub_80CFE9C: @ 80CFE9C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r4, _080CFF3C @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080CFF40 @ =gUnknown_03004B00
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _080CFF44 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CFEE0
	ldrh r0, [r4, 0x4]
	negs r0, r0
	strh r0, [r4, 0x4]
_080CFEE0:
	lsls r0, r6, 16
	asrs r0, 16
	ldrh r1, [r4, 0x4]
	adds r0, r1
	lsls r0, 16
	ldrh r1, [r5, 0x20]
	lsrs r6, r0, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r5, 0x22]
	lsls r1, r7, 16
	asrs r1, 16
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl sub_80790F0
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 1
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8078FDC
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x2E]
	strh r6, [r5, 0x32]
	strh r7, [r5, 0x36]
	ldr r0, _080CFF48 @ =sub_8078C00
	str r0, [r5, 0x1C]
	ldr r1, _080CFF4C @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CFF3C: .4byte gUnknown_0202F7C9
_080CFF40: .4byte gUnknown_03004B00
_080CFF44: .4byte gUnknown_0202F7C8
_080CFF48: .4byte sub_8078C00
_080CFF4C: .4byte move_anim_8072740
	thumb_func_end sub_80CFE9C

	thumb_func_start sub_80CFF50
sub_80CFF50: @ 80CFF50
	ldr r1, _080CFF60 @ =0x0000fff0
	strh r1, [r0, 0x32]
	ldrh r1, [r0, 0x22]
	adds r1, 0x8
	strh r1, [r0, 0x22]
	ldr r1, _080CFF64 @ =sub_80CFF68
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080CFF60: .4byte 0x0000fff0
_080CFF64: .4byte sub_80CFF68
	thumb_func_end sub_80CFF50

	thumb_func_start sub_80CFF68
sub_80CFF68: @ 80CFF68
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldr r0, _080CFFD4 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CFF8C
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
_080CFF8C:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x5
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7E
	ble _080CFFCC
	movs r0, 0
	strh r0, [r4, 0x30]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080CFFCC
	adds r0, r4, 0
	bl move_anim_8072740
_080CFFCC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CFFD4: .4byte gUnknown_0202F7C8
	thumb_func_end sub_80CFF68

	thumb_func_start sub_80CFFD8
sub_80CFFD8: @ 80CFFD8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	ldr r5, _080D0024 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _080D0028 @ =sub_8078B34
	str r0, [r4, 0x1C]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080D002C @ =sub_80D0030
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0024: .4byte gUnknown_0202F7C9
_080D0028: .4byte sub_8078B34
_080D002C: .4byte sub_80D0030
	thumb_func_end sub_80CFFD8

	thumb_func_start sub_80D0030
sub_80D0030: @ 80D0030
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xA6
	bl PlaySE12WithPanning
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	movs r2, 0
	movs r1, 0x7
	adds r0, r4, 0
	adds r0, 0x3C
_080D0064:
	strh r2, [r0]
	subs r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _080D0064
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x7
	ands r0, r1
	ldr r2, _080D00AC @ =0x0000fff4
	adds r1, r2, 0
	subs r1, r0
	strh r1, [r4, 0x3A]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA0
	bl __umodsi3
	adds r0, 0xA0
	strh r0, [r4, 0x3C]
	ldr r0, _080D00B0 @ =sub_80D00B4
	str r0, [r4, 0x1C]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D00AC: .4byte 0x0000fff4
_080D00B0: .4byte sub_80D00B4
	thumb_func_end sub_80D0030

	thumb_func_start sub_80D00B4
sub_80D00B4: @ 80D00B4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x3C]
	ldrh r2, [r4, 0x2E]
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r2, r0, 24
	strh r2, [r4, 0x24]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D00D2
	negs r0, r2
	strh r0, [r4, 0x24]
_080D00D2:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x3A
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x8
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7E
	ble _080D0112
	movs r0, 0
	strh r0, [r4, 0x30]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080D0112
	adds r0, r4, 0
	bl move_anim_8072740
_080D0112:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D00B4

	thumb_func_start sub_80D0118
sub_80D0118: @ 80D0118
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_80787B0
	ldr r0, _080D0168 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D0136
	ldrh r0, [r4, 0x22]
	adds r0, 0x10
	strh r0, [r4, 0x22]
_080D0136:
	ldr r1, _080D016C @ =gUnknown_03004B00
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0xC]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldr r0, _080D0170 @ =sub_8078114
	str r0, [r4, 0x1C]
	ldr r1, _080D0174 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0168: .4byte gUnknown_0202F7C8
_080D016C: .4byte gUnknown_03004B00
_080D0170: .4byte sub_8078114
_080D0174: .4byte move_anim_8072740
	thumb_func_end sub_80D0118

	thumb_func_start sub_80D0178
sub_80D0178: @ 80D0178
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	movs r7, 0x20
	ldr r4, _080D01F4 @ =0x0000ffe0
	movs r0, 0x10
	mov r8, r0
	ldr r6, _080D01F8 @ =0x0000fff0
	ldr r0, _080D01FC @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080D01A4
	adds r7, r4, 0
	movs r4, 0x20
	mov r8, r6
	movs r6, 0x10
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080D01A4:
	lsls r0, r7, 16
	asrs r0, 16
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x20]
	lsls r0, r4, 16
	asrs r0, 16
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	movs r0, 0x6
	strh r0, [r5, 0x2E]
	ldr r4, _080D0200 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	add r0, r8
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x36]
	ldr r0, _080D0204 @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _080D0208 @ =sub_80D020C
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D01F4: .4byte 0x0000ffe0
_080D01F8: .4byte 0x0000fff0
_080D01FC: .4byte gUnknown_03004B00
_080D0200: .4byte gUnknown_0202F7C9
_080D0204: .4byte sub_8078B34
_080D0208: .4byte sub_80D020C
	thumb_func_end sub_80D0178

	thumb_func_start sub_80D020C
sub_80D020C: @ 80D020C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D0222
	adds r0, r2, 0
	bl move_anim_8072740
_080D0222:
	pop {r0}
	bx r0
	thumb_func_end sub_80D020C

	thumb_func_start sub_80D0228
sub_80D0228: @ 80D0228
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	movs r0, 0x20
	mov r8, r0
	ldr r4, _080D02BC @ =0x0000ffe0
	movs r2, 0x10
	mov r9, r2
	ldr r6, _080D02C0 @ =0x0000fff0
	ldr r7, _080D02C4 @ =gUnknown_03004B00
	ldrh r1, [r7]
	movs r2, 0
	ldrsh r0, [r7, r2]
	cmp r0, 0
	beq _080D025C
	mov r8, r4
	movs r4, 0x20
	mov r9, r6
	movs r6, 0x10
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
_080D025C:
	mov r0, r8
	lsls r1, r0, 16
	asrs r1, 16
	ldrh r2, [r5, 0x20]
	adds r1, r2
	strh r1, [r5, 0x20]
	lsls r0, r4, 16
	asrs r0, 16
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	movs r0, 0x6
	strh r0, [r5, 0x2E]
	strh r1, [r5, 0x30]
	ldr r4, _080D02C8 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	add r0, r9
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r7]
	strh r0, [r5, 0x38]
	ldrh r0, [r5, 0x2E]
	strh r0, [r5, 0x3A]
	ldr r0, _080D02CC @ =sub_80D02D0
	str r0, [r5, 0x1C]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D02BC: .4byte 0x0000ffe0
_080D02C0: .4byte 0x0000fff0
_080D02C4: .4byte gUnknown_03004B00
_080D02C8: .4byte gUnknown_0202F7C9
_080D02CC: .4byte sub_80D02D0
	thumb_func_end sub_80D0228

	thumb_func_start sub_80D02D0
sub_80D02D0: @ 80D02D0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D0334
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D0334
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r2, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0x2
	strh r0, [r4, 0x24]
	ldr r0, _080D033C @ =0x0000fffe
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	eors r0, r1
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x36]
	strh r2, [r4, 0x34]
	ldr r0, _080D0340 @ =sub_80D0344
	str r0, [r4, 0x1C]
_080D0334:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D033C: .4byte 0x0000fffe
_080D0340: .4byte sub_80D0344
	thumb_func_end sub_80D02D0

	thumb_func_start sub_80D0344
sub_80D0344: @ 80D0344
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D035C
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	negs r0, r0
	strh r0, [r4, 0x26]
_080D035C:
	ldrh r0, [r4, 0x34]
	movs r1, 0x1
	eors r0, r1
	movs r1, 0
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080D039E
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x36]
	strh r1, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	movs r1, 0x1
	eors r1, r0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080D03A4 @ =sub_80D03A8
	str r0, [r4, 0x1C]
_080D039E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D03A4: .4byte sub_80D03A8
	thumb_func_end sub_80D0344

	thumb_func_start sub_80D03A8
sub_80D03A8: @ 80D03A8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D03BC
	adds r0, r4, 0
	bl move_anim_8072740
_080D03BC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D03A8

	thumb_func_start sub_80D03C4
sub_80D03C4: @ 80D03C4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078E70
	adds r0, r4, 0
	movs r1, 0xD0
	movs r2, 0xD0
	movs r3, 0
	bl obj_id_set_rotscale
	ldr r1, _080D041C @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	movs r1, 0
	bl sub_8079108
	ldr r1, _080D0420 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x50
	strh r1, [r0, 0x8]
	ldr r1, _080D0424 @ =sub_80D0428
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D041C: .4byte gSprites
_080D0420: .4byte gTasks
_080D0424: .4byte sub_80D0428
	thumb_func_end sub_80D03C4

	thumb_func_start sub_80D0428
sub_80D0428: @ 80D0428
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080D0480 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	subs r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080D0478
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8078F40
	ldr r1, _080D0484 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	movs r1, 0x1
	bl sub_8079108
	adds r0, r5, 0
	bl move_anim_task_del
_080D0478:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0480: .4byte gTasks
_080D0484: .4byte gSprites
	thumb_func_end sub_80D0428

	thumb_func_start sub_80D0488
sub_80D0488: @ 80D0488
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080D04D4 @ =gTasks
	adds r4, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x8]
	movs r1, 0
	bl sub_8078E70
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0x10]
	strh r5, [r4, 0x12]
	strh r5, [r4, 0x14]
	ldr r0, _080D04D8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x16]
	ldr r0, _080D04DC @ =sub_80D04E0
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D04D4: .4byte gTasks
_080D04D8: .4byte gUnknown_0202F7C8
_080D04DC: .4byte sub_80D04E0
	thumb_func_end sub_80D0488

	thumb_func_start sub_80D04E0
sub_80D04E0: @ 80D04E0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080D0504 @ =gTasks
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080D04FA
	b _080D060A
_080D04FA:
	lsls r0, 2
	ldr r1, _080D0508 @ =_080D050C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D0504: .4byte gTasks
_080D0508: .4byte _080D050C
	.align 2, 0
_080D050C:
	.4byte _080D0524
	.4byte _080D056C
	.4byte _080D05A2
	.4byte _080D05A8
	.4byte _080D05B8
	.4byte _080D05EC
_080D0524:
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080D0534
	cmp r0, 0x3
	beq _080D0534
	cmp r0, 0x6
	bne _080D053C
_080D0534:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80D0614
_080D053C:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x10]
	adds r0, 0x28
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	movs r1, 0x10
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x8]
	bl sub_8079A64
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x20
	bne _080D060A
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	b _080D05E4
_080D056C:
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D060A
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	cmp r1, 0x3
	bne _080D0582
	strh r0, [r4, 0xC]
	strh r1, [r4, 0xA]
	b _080D060A
_080D0582:
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	movs r2, 0x80
	lsls r2, 1
	strh r2, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x8]
	bl sub_8079A64
	movs r0, 0x2
	strh r0, [r4, 0xA]
	b _080D060A
_080D05A2:
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080D060A
_080D05A8:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	ble _080D060A
	b _080D05E0
_080D05B8:
	ldrh r0, [r4, 0xC]
	adds r0, 0x2
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x10]
	subs r0, 0x50
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	movs r1, 0x10
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x8]
	bl sub_8079A64
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x20
	bne _080D060A
_080D05E0:
	movs r0, 0
	strh r0, [r4, 0xC]
_080D05E4:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080D060A
_080D05EC:
	ldrb r0, [r4, 0x8]
	bl sub_8078F40
	ldr r2, _080D0610 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x26]
	adds r0, r5, 0
	bl move_anim_task_del
_080D060A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0610: .4byte gSprites
	thumb_func_end sub_80D04E0

	thumb_func_start sub_80D0614
sub_80D0614: @ 80D0614
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r0, 0
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r0, 16
	asrs r4, r0, 16
	cmp r4, 0
	blt _080D06EE
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xFF
	bne _080D0658
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _080D0654 @ =gSprites
	adds r0, r1
	bl obj_delete_but_dont_free_vram
	b _080D06EE
	.align 2, 0
_080D0654: .4byte gSprites
_080D0658:
	ldr r5, _080D06FC @ =gSprites
	lsls r3, r4, 4
	adds r3, r4
	lsls r3, 2
	adds r4, r3, r5
	ldrb r1, [r4, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1F
	ands r6, r0
	lsls r2, r6, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	ldrb r0, [r7, 0x16]
	ldrb r1, [r7, 0xE]
	subs r0, r1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrh r0, [r7, 0xE]
	adds r0, 0x1
	strh r0, [r7, 0xE]
	ldrh r0, [r7, 0x14]
	adds r0, 0x1
	strh r0, [r7, 0x14]
	movs r0, 0x10
	strh r0, [r4, 0x2E]
	mov r0, r9
	strh r0, [r4, 0x30]
	movs r0, 0x6
	strh r0, [r4, 0x32]
	adds r5, 0x1C
	adds r3, r5
	ldr r0, _080D0700 @ =sub_80D0704
	str r0, [r3]
	mov r1, r8
	lsls r0, r1, 24
	lsrs r0, 24
	movs r1, 0x10
	ldrsh r2, [r7, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x1]
	movs r3, 0x4
	negs r3, r3
	ands r3, r0
	movs r0, 0x1
	orrs r3, r0
	strb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
_080D06EE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D06FC: .4byte gSprites
_080D0700: .4byte sub_80D0704
	thumb_func_end sub_80D0614

	thumb_func_start sub_80D0704
sub_80D0704: @ 80D0704
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080D0742
	ldr r3, _080D0748 @ =gTasks
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl obj_delete_but_dont_free_vram
_080D0742:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0748: .4byte gTasks
	thumb_func_end sub_80D0704

	thumb_func_start sub_80D074C
sub_80D074C: @ 80D074C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D0770 @ =gTasks
	adds r4, r0, r1
	ldr r5, _080D0774 @ =gUnknown_03004B00
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D0778
	adds r0, r2, 0
	bl move_anim_task_del
	b _080D079E
	.align 2, 0
_080D0770: .4byte gTasks
_080D0774: .4byte gUnknown_03004B00
_080D0778:
	ldrb r0, [r5]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	strh r1, [r4, 0x8]
	strh r2, [r4, 0xA]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0xC]
	strh r2, [r4, 0xE]
	strh r2, [r4, 0x10]
	ldr r2, _080D07A4 @ =gUnknown_083D76F4
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080D07A8 @ =sub_80D07AC
	str r0, [r4]
_080D079E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D07A4: .4byte gUnknown_083D76F4
_080D07A8: .4byte sub_80D07AC
	thumb_func_end sub_80D074C

	thumb_func_start sub_80D07AC
sub_80D07AC: @ 80D07AC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080D07D0 @ =gTasks
	adds r4, r0, r1
	movs r0, 0xA
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080D0814
	cmp r5, 0x1
	bgt _080D07D4
	cmp r5, 0
	beq _080D07DE
	b _080D08BC
	.align 2, 0
_080D07D0: .4byte gTasks
_080D07D4:
	cmp r5, 0x2
	beq _080D0848
	cmp r5, 0x3
	beq _080D0878
	b _080D08BC
_080D07DE:
	adds r0, r4, 0
	bl sub_807992C
	ldrh r2, [r4, 0x10]
	adds r2, 0x3
	strh r2, [r4, 0x10]
	ldr r3, _080D0810 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	adds r1, r2
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080D08BC
	strh r5, [r4, 0xE]
	b _080D0870
	.align 2, 0
_080D0810: .4byte gSprites
_080D0814:
	adds r0, r4, 0
	bl sub_807992C
	ldr r2, _080D0844 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x10]
	ldrh r2, [r0, 0x26]
	adds r1, r2
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080D08BC
	movs r0, 0
	strh r0, [r4, 0xE]
	b _080D0870
	.align 2, 0
_080D0844: .4byte gSprites
_080D0848:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D0870
	ldr r2, _080D086C @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x2
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0x10]
	subs r0, 0x2
	strh r0, [r4, 0x10]
	b _080D08BC
	.align 2, 0
_080D086C: .4byte gSprites
_080D0870:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080D08BC
_080D0878:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080D08BC
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _080D08B0
	ldr r2, _080D08AC @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x26]
	adds r0, r6, 0
	bl move_anim_task_del
	b _080D08BC
	.align 2, 0
_080D08AC: .4byte gSprites
_080D08B0:
	ldrb r1, [r4, 0x8]
	ldr r2, _080D08C4 @ =gUnknown_083D76F4
	adds r0, r4, 0
	bl sub_80798F4
	strh r5, [r4, 0xA]
_080D08BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D08C4: .4byte gUnknown_083D76F4
	thumb_func_end sub_80D07AC

	thumb_func_start sub_80D08C8
sub_80D08C8: @ 80D08C8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080D08F8 @ =gTasks
	adds r4, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080D08FC @ =gUnknown_083D7714
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080D0900 @ =sub_80D0904
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D08F8: .4byte gTasks
_080D08FC: .4byte gUnknown_083D7714
_080D0900: .4byte sub_80D0904
	thumb_func_end sub_80D08C8

	thumb_func_start sub_80D0904
sub_80D0904: @ 80D0904
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080D092C @ =gTasks
	adds r0, r1
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _080D0924
	adds r0, r4, 0
	bl move_anim_task_del
_080D0924:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D092C: .4byte gTasks

	push {r4,r5,lr}
