	.file	"cma.c"
	.local	class_membase
	.comm	class_membase,8,8
	.local	class_limit
	.comm	class_limit,8,8
	.local	class_inuse
	.comm	class_inuse,8,8
	.local	class_nouse
	.comm	class_nouse,8,8
	.local	class_counters
	.comm	class_counters,48,32
	.text
	.type	class_AddToList, @function
class_AddToList:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	class_AddToList, .-class_AddToList
	.type	class_RemoveFromList, @function
class_RemoveFromList:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L3
.L8:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jne	.L4
	cmpq	$0, -16(%rbp)
	jne	.L5
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L6
.L5:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
.L6:
	movq	-24(%rbp), %rax
	jmp	.L7
.L4:
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L3:
	cmpq	$0, -8(%rbp)
	jne	.L8
	movq	$-1, %rax
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	class_RemoveFromList, .-class_RemoveFromList
	.section	.rodata
.LC0:
	.string	"Node %p, %ld\n"
	.text
	.type	class_printList, @function
class_printList:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L12
.L10:
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movl	$.LC0, %eax
	movq	-8(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	class_printList
	jmp	.L9
.L12:
	nop
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	class_printList, .-class_printList
.globl class_memory
	.type	class_memory, @function
class_memory:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	class_membase(%rip), %rax
	testq	%rax, %rax
	je	.L14
	movl	$0, %eax
	jmp	.L13
.L14:
	movq	-24(%rbp), %rax
	movq	%rax, class_membase(%rip)
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movq	%rax, class_limit(%rip)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	subl	$16, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	class_nouse(%rip), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	class_AddToList
	movq	%rax, class_nouse(%rip)
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	class_memory, .-class_memory
.globl class_calloc
	.type	class_calloc, @function
class_calloc:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	class_malloc
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	imulq	-32(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	class_calloc, .-class_calloc
	.type	class_findNoUse, @function
class_findNoUse:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movl	$-1, -8(%rbp)
	movl	$2147483647, -4(%rbp)
	movq	$0, -16(%rbp)
	movq	class_nouse(%rip), %rax
	movq	%rax, -24(%rbp)
	jmp	.L17
.L19:
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	subq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jae	.L18
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
.L18:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
.L17:
	cmpq	$0, -24(%rbp)
	jne	.L19
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	class_findNoUse, .-class_findNoUse
.globl class_splitNode
	.type	class_splitNode, @function
class_splitNode:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	cmpq	$16, %rax
	je	.L21
	movq	-32(%rbp), %rax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
	movq	-32(%rbp), %rax
	addq	$16, %rax
	addq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-16(%rbp), %rax
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	subl	$16, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 8(%rax)
.L21:
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	class_splitNode, .-class_splitNode
.globl class_malloc
	.type	class_malloc, @function
class_malloc:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	class_findNoUse
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L23
	movq	class_nouse(%rip), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	class_RemoveFromList
	movq	%rax, class_nouse(%rip)
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	class_splitNode
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L24
	movq	class_nouse(%rip), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	class_AddToList
	movq	%rax, class_nouse(%rip)
.L24:
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	class_inuse(%rip), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	class_AddToList
	movq	%rax, class_inuse(%rip)
	movq	-8(%rbp), %rax
	addq	$16, %rax
	jmp	.L25
.L23:
	movl	$0, %eax
.L25:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	class_malloc, .-class_malloc
	.type	class_garbage, @function
class_garbage:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	class_garbage, .-class_garbage
.globl class_free
	.type	class_free, @function
class_free:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movq	%rdi, -24(%rbp)
	movq	$0, -8(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L31
.L28:
	movq	-24(%rbp), %rax
	leaq	-16(%rax), %rdx
	movq	class_inuse(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	class_RemoveFromList
	movq	%rax, -8(%rbp)
	cmpq	$-1, -8(%rbp)
	je	.L32
.L30:
	movq	-8(%rbp), %rax
	movq	%rax, class_inuse(%rip)
	movq	-24(%rbp), %rax
	leaq	-16(%rax), %rdx
	movq	class_nouse(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	class_AddToList
	movq	%rax, class_nouse(%rip)
	movl	$0, %eax
	call	class_garbage
	jmp	.L27
.L31:
	nop
	jmp	.L27
.L32:
	nop
.L27:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	class_free, .-class_free
.globl class_realloc
	.type	class_realloc, @function
class_realloc:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	class_malloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L34
	movl	$0, %eax
	jmp	.L35
.L34:
	movq	-24(%rbp), %rax
	subq	$16, %rax
	movl	8(%rax), %eax
	cltq
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	class_free
	movq	-8(%rbp), %rax
.L35:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	class_realloc, .-class_realloc
	.section	.rodata
.LC1:
	.string	"InUse"
.LC2:
	.string	"NoUse"
.LC3:
	.string	"Counters:"
.LC4:
	.string	" %10s : %d\n"
.LC5:
	.string	"malloc"
.LC6:
	.string	"calloc"
.LC7:
	.string	"realloc"
.LC8:
	.string	"free"
.LC9:
	.string	"gc"
.LC10:
	.string	"nomem"
	.text
.globl class_stats
	.type	class_stats, @function
class_stats:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movl	$.LC1, %edi
	call	puts
	movq	class_inuse(%rip), %rax
	movq	%rax, %rdi
	call	class_printList
	movl	$.LC2, %edi
	call	puts
	movq	class_nouse(%rip), %rax
	movq	%rax, %rdi
	call	class_printList
	movl	$.LC3, %edi
	call	puts
	movq	class_counters(%rip), %rdx
	movl	$.LC4, %eax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movq	class_counters+8(%rip), %rdx
	movl	$.LC4, %eax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movq	class_counters+16(%rip), %rdx
	movl	$.LC4, %eax
	movl	$.LC7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movq	class_counters+24(%rip), %rdx
	movl	$.LC4, %eax
	movl	$.LC8, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movq	class_counters+32(%rip), %rdx
	movl	$.LC4, %eax
	movl	$.LC9, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movq	class_counters+40(%rip), %rdx
	movl	$.LC4, %eax
	movl	$.LC10, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	class_stats, .-class_stats
	.ident	"GCC: (Ubuntu/Linaro 4.5.2-8ubuntu4) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
