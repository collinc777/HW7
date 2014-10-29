	.file	"fib.c"
	.text
	.p2align 4,,15
	.globl	fib_rec
	.type	fib_rec, @function
fib_rec:
.LFB1:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	16(%esp), %edx
	movl	8(%esp), %ecx
	movl	12(%esp), %ebx
	testl	%edx, %edx
	movl	%ecx, %eax
	jne	.L6
	jmp	.L2
	.p2align 4,,7
	.p2align 3
.L5:
	movl	%ecx, %ebx
	movl	%eax, %ecx
.L6:
	subl	$1, %edx
	leal	(%ecx,%ebx), %eax
	jne	.L5
.L2:
	popl	%ebx
	.cfi_def_cfa_offset 4
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE1:
	.size	fib_rec, .-fib_rec
	.p2align 4,,15
	.globl	fib2
	.type	fib2, @function
fib2:
.LFB2:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	testl	%eax, %eax
	js	.L10
	cmpl	$1, %eax
	jle	.L9
	subl	$1, %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1, (%esp)
	call	fib_rec
.L9:
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
	.p2align 3
.L10:
	.cfi_restore_state
	xorl	%eax, %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE2:
	.size	fib2, .-fib2
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	subl	$4, %esp
	.cfi_def_cfa_offset 8
	movl	$31, (%esp)
	call	fib2
	addl	$4, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
