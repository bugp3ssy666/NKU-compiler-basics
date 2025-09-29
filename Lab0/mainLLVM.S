	.text
	.file	"main.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI0_0:
	.quad	0x412e848000000000              # double 1.0E+6
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movl	$0, -20(%rbp)
	movl	$0, -12(%rbp)
	movl	$1, -4(%rbp)
	movl	$1, -8(%rbp)
	movabsq	$.L.str, %rdi
	leaq	-16(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	cmpl	$50, -16(%rbp)
	jle	.LBB0_2
# %bb.1:
	movabsq	$.L.str.1, %rdi
	movl	$50, %esi
	movb	$0, %al
	callq	printf@PLT
	movl	$1, -20(%rbp)
	jmp	.LBB0_6
.LBB0_2:
	leaq	-64(%rbp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday@PLT
	movl	-12(%rbp), %esi
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	-4(%rbp), %esi
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	movl	-4(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	-12(%rbp), %eax
	addl	-4(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %esi
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	-24(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_3
.LBB0_5:
	leaq	-48(%rbp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday@PLT
	movq	-48(%rbp), %rax
	subq	-64(%rbp), %rax
	cvtsi2sd	%rax, %xmm0
	movq	-40(%rbp), %rax
	subq	-56(%rbp), %rax
	cvtsi2sd	%rax, %xmm1
	movsd	.LCPI0_0(%rip), %xmm2           # xmm2 = [1.0E+6,0.0E+0]
	divsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-32(%rbp), %xmm0                # xmm0 = mem[0],zero
	movabsq	$.L.str.3, %rdi
	movb	$1, %al
	callq	printf@PLT
.LBB0_6:
	movl	-20(%rbp), %eax
	addq	$64, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Input exceeds maximum value %d\n"
	.size	.L.str.1, 32

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"%d\n"
	.size	.L.str.2, 4

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Execution time: %.6f seconds\n"
	.size	.L.str.3, 30

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
