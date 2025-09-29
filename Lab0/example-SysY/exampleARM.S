	.arch armv8-a
	.file	"example.c"

	.text
	.section	.rodata
	.align	3
.LC1:
	.string	"%d\n"
	
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	sub	sp, sp, #80
	stp	x29, x30, [sp, 64]
	add	x29, sp, 64

	mov	w0, 10
	str	w0, [sp, 20]
	mov	w0, 5
	str	w0, [sp, 24]
	str	wzr, [sp, 12]
	str	wzr, [sp, 16]
	mov	w0, 5
	str	w0, [sp, 28]

	ldr	w1, [sp, 20]
	ldr	w0, [sp, 24]
	add	w0, w1, w0
	str	w0, [sp, 12]

	ldr	w1, [sp, 20]
	ldr	w0, [sp, 24]
	sub	w0, w1, w0
	str	w0, [sp, 12]
	
	ldr	w1, [sp, 20]
	ldr	w0, [sp, 24]
	mul	w0, w1, w0
	str	w0, [sp, 12]

	ldr	w1, [sp, 12]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf

	ldr	w1, [sp, 20]
	ldr	w0, [sp, 24]
	sdiv	w0, w1, w0
	str	w0, [sp, 12]

	ldr	w0, [sp, 20]
	ldr	w1, [sp, 24]
	sdiv	w2, w0, w1
	ldr	w1, [sp, 24]
	mul	w1, w2, w1
	sub	w0, w0, w1
	str	w0, [sp, 12]
	
	ldr	w0, [sp, 20]
	str	w0, [sp, 12]
	ldr	w0, [sp, 12]
	add	w0, w0, 1
	str	w0, [sp, 12]
	ldr	w0, [sp, 12]
	lsl	w0, w0, 1
	str	w0, [sp, 12]
	
	ldr	w1, [sp, 12]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	
	ldr	w1, [sp, 20]
	ldr	w0, [sp, 24]
	cmp	w1, w0
	ble	.L2
	mov	w0, 1
	str	w0, [sp, 12]
	b	.L3
.L2:
	str	wzr, [sp, 12]
.L3:
	ldr	w0, [sp, 20]
	cmp	w0, 0
	ble	.L4
	ldr	w0, [sp, 24]
	cmp	w0, 0
	ble	.L4
	mov	w0, 1
	str	w0, [sp, 12]
.L4:
	ldr	w0, [sp, 20]
	cmp	w0, 0
	bgt	.L5
	ldr	w0, [sp, 24]
	cmp	w0, 0
	ble	.L6
.L5:
	mov	w0, 1
	str	w0, [sp, 12]
.L6:
	ldr	w1, [sp, 20]
	ldr	w0, [sp, 24]
	cmp	w1, w0
	ble	.L7
	ldr	w1, [sp, 24]
	ldr	w0, [sp, 20]
	bl	max
	str	w0, [sp, 12]
	b	.L8
.L7:
	ldr	w1, [sp, 20]
	ldr	w0, [sp, 24]
	cmp	w1, w0
	bge	.L9
	ldr	w0, [sp, 24]
	str	w0, [sp, 12]
	b	.L8
.L9:
	str	wzr, [sp, 12]
.L8:
	ldr	w1, [sp, 12]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	
	str	wzr, [sp, 16]
	str	wzr, [sp, 12]
	b	.L10
.L11:
	ldr	w1, [sp, 12]
	ldr	w0, [sp, 16]
	add	w0, w1, w0
	str	w0, [sp, 12]
	ldr	w0, [sp, 16]
	add	w0, w0, 1
	str	w0, [sp, 16]
.L10:
	ldr	w0, [sp, 16]
	cmp	w0, 10
	ble	.L11

	str	wzr, [sp, 12]
	str	wzr, [sp, 16]
	b	.L12
.L16:
	ldr	w0, [sp, 16]
	and	w0, w0, 1
	cmp	w0, 0
	beq	.L19
	ldr	w1, [sp, 12]
	ldr	w0, [sp, 16]
	add	w0, w1, w0
	str	w0, [sp, 12]
	ldr	w0, [sp, 12]
	cmp	w0, 20
	bgt	.L20
	b	.L14
.L19:
	nop
.L14:
	ldr	w0, [sp, 16]
	add	w0, w0, 1
	str	w0, [sp, 16]
.L12:
	ldr	w0, [sp, 16]
	cmp	w0, 9
	ble	.L16
	b	.L15
.L20:
	nop
.L15:
	ldr	w0, [sp, 28]
	bl	factorial
	str	w0, [sp, 12]
	ldr	w1, [sp, 12]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf

	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	add	x2, sp, 32
	mov	x3, x0
	ldp	x0, x1, [x3]
	stp	x0, x1, [x2]
	ldr	w0, [x3, 16]
	str	w0, [x2, 16]
	mov	w0, 10
	str	w0, [sp, 32]
	ldr	w1, [sp, 32]
	ldr	w0, [sp, 36]
	add	w0, w1, w0
	str	w0, [sp, 12]
	ldr	w1, [sp, 12]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	
	mov	w0, 0
	ldp	x29, x30, [sp, 64]
	add	sp, sp, 80
	ret

	.section	.rodata
	.align	3
.LC0:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5

	.text
	.align	2
	.global	max
	.type	max, %function
max:
    cmp w0, w1
    ble .L22
    ret
.L22:
    mov w0, w1
    ret

	.align	2
	.global	factorial
	.type	factorial, %function
factorial:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 1
	bgt	.L23
	mov	w0, 1
	b	.L24
.L23:
	ldr	w0, [sp, 28]
	sub	w0, w0, #1
	bl	factorial
	mov	w1, w0
	ldr	w0, [sp, 28]
	mul	w0, w1, w0
.L24:
	ldp	x29, x30, [sp], 32
	ret