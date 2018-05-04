	.file	"integrate.i"
	.section	.rodata.str1.32,"aMS",@progbits,1
	.align 32
.LC0:
	.string	"varargs function cannot be inline"
	.align 32
.LC1:
	.string	"function too large to be inline"
	.align 32
.LC4:
	.string	"address of an aggregate parameter is used; cannot be inline"
	.align 32
.LC3:
	.string	"no prototype, and parameter address used; cannot be inline"
	.align 32
.LC2:
	.string	"function with large aggregate parameter cannot be inline"
	.text
	.align 2
	.p2align 4,,15
.globl function_cannot_inline_p
	.type	function_cannot_inline_p,@function
function_cannot_inline_p:
.LFB1:
	pushq	%r12
.LCFI0:
	xorl	%eax, %eax
	pushq	%rbp
.LCFI1:
	pushq	%rbx
.LCFI2:
	movq	16(%rdi), %rdx
	movq	%rdi, %rbx
	movq	32(%rdx), %rdi
	call	tree_last
	movq	96(%rbx), %rdi
	movq	%rax, %rbp
	xorl	%eax, %eax
	call	list_length
	movzbl	26(%rbx), %ecx
	shrb	$6, %cl
	andl	$1, %ecx
	sall	$4, %ecx
	addl	%ecx, %eax
	testq	%rbp, %rbp
	leal	64(,%rax,8), %r12d
	je	.L2
	movq	void_type_node(%rip), %rcx
	cmpq	%rcx, 40(%rbp)
	je	.L2
	movl	$.LC0, %ecx
.L1:
	popq	%rbx
	popq	%rbp
	popq	%r12
	movq	%rcx, %rax
	ret
	.p2align 6,,7
.L2:
	xorl	%eax, %eax
	call	get_max_uid
	movl	$.LC1, %ecx
	leal	(%r12,%r12), %esi
	cmpl	%esi, %eax
	jg	.L1
	movq	96(%rbx), %rdx
	testq	%rdx, %rdx
	je	.L22
	.p2align 4,,7
.L11:
	movq	16(%rdx), %rax
	cmpb	$26, 56(%rax)
	je	.L25
	testq	%rbp, %rbp
	je	.L28
.L9:
	movzbl	24(%rax), %ebx
	subb	$19, %bl
	cmpb	$1, %bl
	ja	.L6
	movq	120(%rdx), %rdi
	cmpw	$37, (%rdi)
	je	.L27
.L6:
	movq	8(%rdx), %rdx
	testq	%rdx, %rdx
	jne	.L11
.L22:
	xorl	%eax, %eax
	call	get_max_uid
	cmpl	%r12d, %eax
	jg	.L29
.L12:
	xorl	%ecx, %ecx
	jmp	.L1
.L29:
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	get_first_nonparm_insn
	testq	%rax, %rax
	movq	%rax, %rcx
	je	.L14
	cmpl	%r12d, %ebx
	jge	.L24
	.p2align 4,,7
.L19:
	movzwl	(%rcx), %eax
	leal	1(%rbx), %ebp
	movq	24(%rcx), %rcx
	subl	$13, %eax
	cmpw	$2, %ax
	cmovbe	%ebp, %ebx
	testq	%rcx, %rcx
	je	.L14
	cmpl	%r12d, %ebx
	jl	.L19
.L24:
	movl	$.LC1, %ecx
	jmp	.L1
.L14:
	cmpl	%r12d, %ebx
	jl	.L12
	jmp	.L24
.L27:
	movl	$.LC4, %ecx
	jmp	.L1
	.p2align 6,,7
.L28:
	testb	$2, 26(%rdx)
	je	.L9
	movl	$.LC3, %ecx
	jmp	.L1
.L25:
	movl	$.LC2, %ecx
	jmp	.L1
.LFE1:
.Lfe1:
	.size	function_cannot_inline_p,.Lfe1-function_cannot_inline_p
	.align 2
	.p2align 4,,15
.globl save_for_inline
	.type	save_for_inline,@function
save_for_inline:
.LFB2:
	pushq	%rbp
.LCFI3:
	movq	%rsp, %rbp
.LCFI4:
	pushq	%r15
.LCFI5:
	pushq	%r14
.LCFI6:
	pushq	%r13
.LCFI7:
	pushq	%r12
.LCFI8:
	pushq	%rbx
.LCFI9:
	subq	$200, %rsp
.LCFI10:
	cmpq	$0, return_label(%rip)
	movq	%rdi, -48(%rbp)
	je	.L191
.L31:
	xorl	%eax, %eax
	call	max_label_num
	movl	%eax, -76(%rbp)
	xorl	%eax, %eax
	call	get_first_label_num
	movl	%eax, %r14d
	xorl	%eax, %eax
	call	max_parm_reg_num
	movl	%eax, max_parm_reg(%rip)
	xorl	%eax, %eax
	call	max_reg_num
	movslq	max_parm_reg(%rip),%rcx
	movl	%eax, -84(%rbp)
	xorl	%eax, %eax
	cld
	salq	$3, %rcx
	leaq	15(%rcx), %rdx
	shrq	$3, %rcx
	andq	$-16, %rdx
	subq	%rdx, %rsp
	leaq	8(%rsp), %rdi
	movq	%rdi, parmdecl_map(%rip)
	rep
	stosq
	movq	-48(%rbp), %rcx
	movq	96(%rcx), %rdx
	testq	%rdx, %rdx
	je	.L175
	.p2align 4,,7
.L41:
	movq	120(%rdx), %rax
	cmpw	$34, (%rax)
	je	.L192
	orb	$8, 25(%rdx)
.L40:
	orb	$32, 25(%rdx)
	movq	8(%rdx), %rdx
	testq	%rdx, %rdx
	jne	.L41
.L175:
	movl	current_function_args_size(%rip), %eax
	movl	-76(%rbp), %ecx
	xorl	%edi, %edi
	movl	max_parm_reg(%rip), %r8d
	movl	-84(%rbp), %r9d
	xorl	%esi, %esi
	movl	%r14d, %edx
	movl	%eax, (%rsp)
	xorl	%eax, %eax
	call	gen_inline_header_rtx
	movq	%rax, -72(%rbp)
	movl	8(%rax), %ebx
	xorl	%eax, %eax
	movl	%ebx, -88(%rbp)
	call	preserve_data
	xorl	%eax, %eax
	call	get_insns
	cmpw	$18, (%rax)
	movq	%rax, -64(%rbp)
	jne	.L171
	movl	$18, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	-64(%rbp), %r9
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %r8
	movq	32(%r9), %r10
	movq	%r10, 32(%r8)
	movl	40(%r9), %eax
	movl	%eax, 40(%r8)
	movl	8(%r9), %eax
	movq	$0, 24(%r8)
	movq	$0, 16(%r8)
	movl	%eax, 8(%r8)
	movl	-84(%rbp), %r12d
	movl	-84(%rbp), %eax
	movq	%r8, -208(%rbp)
	incl	%eax
	decl	%r12d
	cltq
	leaq	15(,%rax,8), %rdi
	movl	rtx_length+136(%rip), %eax
	andq	$-16, %rdi
	subq	%rdi, %rsp
	decl	%eax
	leaq	8(%rsp), %rsi
	cmpl	$55, %r12d
	leal	16(,%rax,8), %eax
	movq	%rsi, reg_map(%rip)
	movl	%eax, -80(%rbp)
	jle	.L177
	movq	maybepermanent_obstack+24(%rip), %rdi
	movq	maybepermanent_obstack+32(%rip), %rcx
	movslq	%eax,%r13
	.p2align 4,,7
.L51:
	movslq	%r12d,%r15
	leaq	(%r13,%rdi), %r11
	leaq	0(,%r15,8), %rbx
	movq	%rbx, %r15
	addq	reg_map(%rip), %r15
	cmpq	%rcx, %r11
	ja	.L193
.L48:
	movq	%rbx, %rdx
	xorl	%eax, %eax
	addq	regno_reg_rtx(%rip), %rdx
	movq	(%rdx), %rsi
	movq	%r13, %rdx
	call	memcpy
	movq	maybepermanent_obstack+32(%rip), %rdx
	movq	maybepermanent_obstack+8(%rip), %rbx
	movq	maybepermanent_obstack+24(%rip), %r9
	movl	maybepermanent_obstack+44(%rip), %eax
	movq	maybepermanent_obstack+16(%rip), %rsi
	movq	%rdx, %rdi
	movslq	%eax,%rcx
	addq	%r13, %r9
	subq	%rbx, %rdi
	notl	%eax
	addq	%rcx, %r9
	movq	%rdx, %rcx
	cltq
	andq	%rax, %r9
	movq	%r9, maybepermanent_obstack+24(%rip)
	subq	%rbx, %r9
	cmpq	%rdi, %r9
	jle	.L50
	movq	%rdx, maybepermanent_obstack+24(%rip)
.L50:
	movq	maybepermanent_obstack+24(%rip), %rdi
	decl	%r12d
	movq	%rsi, (%r15)
	cmpl	$55, %r12d
	movq	%rdi, maybepermanent_obstack+16(%rip)
	jg	.L51
.L177:
	movl	-84(%rbp), %eax
	movq	regno_reg_rtx(%rip), %rdi
	movslq	%r14d,%rbx
	movq	reg_map(%rip), %rsi
	leaq	0(,%rbx,8), %r13
	cld
	subl	$56, %eax
	addq	$448, %rdi
	movslq	%eax,%rcx
	addq	$448, %rsi
	salq	$3, %rcx
	shrq	$3, %rcx
	rep
	movsq
	movl	-76(%rbp), %eax
	subl	%r14d, %eax
	cltq
	leaq	15(,%rax,8), %rsi
	andq	$-16, %rsi
	subq	%rsi, %rsp
	leaq	8(%rsp), %r12
	subq	%r13, %r12
	cmpl	-76(%rbp), %r14d
	movq	%r12, label_map(%rip)
	jge	.L179
	.p2align 4,,7
.L59:
	xorl	%eax, %eax
	incl	%r14d
	call	gen_label_rtx
	leaq	0(,%rbx,8), %r10
	addq	label_map(%rip), %r10
	cmpl	-76(%rbp), %r14d
	movq	%rax, (%r10)
	jge	.L179
	movslq	%r14d,%rbx
	jmp	.L59
	.p2align 6,,7
.L179:
	movslq	-88(%rbp),%rcx
	xorl	%eax, %eax
	cld
	salq	$3, %rcx
	leaq	15(%rcx), %r14
	shrq	$3, %rcx
	andq	$-16, %r14
	subq	%r14, %rsp
	leaq	8(%rsp), %rdi
	movq	%rdi, insn_map(%rip)
	rep
	stosq
	movq	-64(%rbp), %r11
	movq	24(%r11), %r14
	testq	%r14, %r14
	je	.L181
	.p2align 4,,7
.L173:
	movzwl	(%r14), %edx
	movq	$0, orig_asm_operands_vector(%rip)
	movq	$0, copy_asm_operands_vector(%rip)
	movzwl	%dx, %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L171
	mov	%eax, %r15d
	jmp	*.L172(,%r15,8)
	.section	.rodata
	.align 8
	.align 4
.L172:
	.quad	.L72
	.quad	.L72
	.quad	.L72
	.quad	.L170
	.quad	.L169
	.quad	.L68
	.text
	.p2align 6,,7
.L68:
	cmpl	$-6, 40(%r14)
	je	.L65
	movl	$18, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	32(%r14), %r8
	movq	%rax, %r15
	movq	%r8, 32(%rax)
	movl	40(%r14), %eax
	movl	%eax, 40(%r15)
	.p2align 4,,7
.L67:
	movl	8(%r14), %eax
	movl	%eax, 8(%r15)
	movq	-208(%rbp), %rcx
	movslq	8(%r14),%r8
	salq	$3, %r8
	addq	insn_map(%rip), %r8
	movq	%r15, (%r8)
	movq	%r15, 24(%rcx)
	movq	%rcx, 16(%r15)
	movq	%r15, -208(%rbp)
.L65:
	movq	24(%r14), %r14
	testq	%r14, %r14
	jne	.L173
.L181:
	movq	-208(%rbp), %r10
	xorl	%eax, %eax
	movq	$0, 24(%r10)
	call	get_first_nonparm_insn
	movq	-72(%rbp), %r12
	movq	%rax, 24(%r12)
	xorl	%eax, %eax
	call	get_insns
	movq	%rax, 32(%r12)
	xorl	%eax, %eax
	movq	-48(%rbp), %r15
	movq	%r12, 136(%r15)
	call	get_frame_size
	movq	-48(%rbp), %r14
	orb	$64, 26(%r14)
	movl	%eax, 128(%r14)
	xorl	%eax, %eax
	movq	-56(%rbp), %rdi
	movq	-208(%rbp), %rsi
	movq	$0, parmdecl_map(%rip)
	movq	$0, label_map(%rip)
	movq	$0, reg_map(%rip)
	movq	$0, return_label(%rip)
	call	set_new_first_and_last_insn
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	leave
	ret
	.p2align 6,,7
.L72:
	xorl	%eax, %eax
	movzwl	%dx, %edi
	call	rtx_alloc
	leaq	32(%rax), %r9
	movq	%rax, %r15
	movq	%r9, -96(%rbp)
	movq	32(%r14), %r8
	testq	%r8, %r8
	movq	%r8, %rbx
	je	.L74
	movzwl	(%r8), %eax
	movl	%eax, -100(%rbp)
	subl	$22, %eax
	cmpl	$19, %eax
	ja	.L75
	mov	%eax, %edi
	jmp	*.L97(,%rdi,8)
	.section	.rodata
	.align 8
	.align 4
.L97:
	.quad	.L82
	.quad	.L75
	.quad	.L75
	.quad	.L95
	.quad	.L75
	.quad	.L75
	.quad	.L75
	.quad	.L75
	.quad	.L74
	.quad	.L74
	.quad	.L75
	.quad	.L74
	.quad	.L92
	.quad	.L75
	.quad	.L75
	.quad	.L84
	.quad	.L91
	.quad	.L74
	.quad	.L74
	.quad	.L74
	.text
.L82:
	movq	32(%r8), %rcx
	cmpq	%rcx, orig_asm_operands_vector(%rip)
	je	.L194
	.p2align 4,,7
.L75:
	movl	-100(%rbp), %edi
	xorl	%eax, %eax
	movq	%r8, -216(%rbp)
	call	rtx_alloc
	movq	-216(%rbp), %r8
	movq	%rax, -192(%rbp)
	movq	-192(%rbp), %rdi
	movslq	-100(%rbp),%rax
	cld
	movq	%r8, %rsi
	movq	%rax, %rdx
	movq	%rax, -112(%rbp)
	salq	$2, %rdx
	movl	rtx_length(%rdx), %eax
	incl	%eax
	cltq
	salq	$2, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	testl	$4, %eax 
	rep
	movsq
	je	.L101
	movl	(%rsi), %eax
	movl	%eax, (%rdi)
.L101:
	movq	-112(%rbp), %r13
	movq	rtx_format(,%r13,8), %r12
	xorl	%r13d, %r13d
	cmpl	rtx_length(%rdx), %r13d
	jge	.L183
	movq	-192(%rbp), %rsi
	addq	$8, %rsi
	movq	%rsi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	.p2align 4,,7
.L119:
	movsbl	(%r12),%eax
	incq	%r12
	cmpl	$101, %eax
	je	.L107
	cmpl	$101, %eax
	jg	.L118
	cmpl	$69, %eax
	je	.L109
.L104:
	movq	-112(%rbp), %rdx
	incl	%r13d
	cmpl	rtx_length(,%rdx,4), %r13d
	jl	.L119
.L183:
	cmpl	$22, -100(%rbp)
	je	.L195
.L120:
	movq	-192(%rbp), %r8
.L74:
	movq	-96(%rbp), %r9
	leaq	56(%r15), %r11
	movq	%r8, (%r9)
	movq	$0, 48(%r15)
	movl	$-1, 40(%r15)
	movq	%r11, -144(%rbp)
	movq	56(%r14), %r8
	testq	%r8, %r8
	movq	%r8, %rbx
	je	.L122
	movzwl	(%r8), %edi
	movl	%edi, %eax
	movl	%edi, -148(%rbp)
	subl	$22, %eax
	cmpl	$19, %eax
	ja	.L123
	mov	%eax, %ecx
	jmp	*.L145(,%rcx,8)
	.section	.rodata
	.align 8
	.align 4
.L145:
	.quad	.L130
	.quad	.L123
	.quad	.L123
	.quad	.L143
	.quad	.L123
	.quad	.L123
	.quad	.L123
	.quad	.L123
	.quad	.L122
	.quad	.L122
	.quad	.L123
	.quad	.L122
	.quad	.L140
	.quad	.L123
	.quad	.L123
	.quad	.L132
	.quad	.L139
	.quad	.L122
	.quad	.L122
	.quad	.L122
	.text
.L130:
	movq	32(%r8), %rsi
	cmpq	%rsi, orig_asm_operands_vector(%rip)
	je	.L196
	.p2align 4,,7
.L123:
	movl	-148(%rbp), %edi
	xorl	%eax, %eax
	movq	%r8, -216(%rbp)
	call	rtx_alloc
	movq	-216(%rbp), %r8
	movslq	-148(%rbp),%rdx
	movq	%rax, -200(%rbp)
	movq	-200(%rbp), %rdi
	cld
	movq	%r8, %rsi
	movq	%rdx, -160(%rbp)
	salq	$2, %rdx
	movl	rtx_length(%rdx), %eax
	incl	%eax
	cltq
	salq	$2, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	testl	$4, %eax 
	rep
	movsq
	je	.L149
	movl	(%rsi), %eax
	movl	%eax, (%rdi)
.L149:
	xorl	%r13d, %r13d
	movq	-160(%rbp), %rax
	cmpl	rtx_length(%rdx), %r13d
	movq	rtx_format(,%rax,8), %r12
	jge	.L186
	movq	-200(%rbp), %rsi
	addq	$8, %rsi
	movq	%rsi, -168(%rbp)
	movq	%rsi, -176(%rbp)
	.p2align 4,,7
.L167:
	movsbl	(%r12),%eax
	incq	%r12
	cmpl	$101, %eax
	je	.L155
	cmpl	$101, %eax
	jg	.L166
	cmpl	$69, %eax
	je	.L157
.L152:
	movq	-160(%rbp), %r9
	incl	%r13d
	cmpl	rtx_length(,%r9,4), %r13d
	jl	.L167
.L186:
	cmpl	$22, -148(%rbp)
	je	.L197
.L168:
	movq	-200(%rbp), %r8
.L122:
	movq	-144(%rbp), %r13
	movq	%r8, (%r13)
	jmp	.L67
.L197:
	cmpq	$0, orig_asm_operands_vector(%rip)
	jne	.L168
	movq	-200(%rbp), %rax
	movq	32(%r8), %rdx
	movq	32(%rax), %r12
	movq	%rdx, orig_asm_operands_vector(%rip)
	movq	%r12, copy_asm_operands_vector(%rip)
	jmp	.L168
.L157:
	movq	-200(%rbp), %rdi
	movslq	%r13d,%rcx
	leaq	8(%rdi,%rcx,8), %rbx
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L152
	movl	(%rax), %edi
	testl	%edi, %edi
	je	.L152
	leaq	8(%rax), %rsi
	movq	%r8, -216(%rbp)
	xorl	%eax, %eax
	call	gen_rtvec_v
	xorl	%r9d, %r9d
	movq	%rax, (%rbx)
	movq	-216(%rbp), %r8
	cmpl	(%rax), %r9d
	jae	.L152
	movq	%rbx, -184(%rbp)
.L163:
	movq	-184(%rbp), %rbx
	movslq	%r9d,%rsi
	xorl	%eax, %eax
	movq	(%rbx), %r11
	addq	$8, %r11
	leaq	(%r11,%rsi,8), %rbx
	movq	(%rbx), %rdi
	movl	%r9d, -224(%rbp)
	movq	%r8, -216(%rbp)
	call	copy_for_inline
	movq	%rax, (%rbx)
	movq	-184(%rbp), %r10
	movl	-224(%rbp), %r9d
	movq	(%r10), %r8
	incl	%r9d
	cmpl	(%r8), %r9d
	movq	-216(%rbp), %r8
	jb	.L163
	jmp	.L152
	.p2align 6,,7
.L166:
	cmpl	$117, %eax
	jne	.L152
	movslq	%r13d,%r12
	movq	-176(%rbp), %r13
	movq	(%r13,%r12,8), %rdx
	movslq	8(%rdx),%rax
	salq	$3, %rax
	addq	insn_map(%rip), %rax
.L190:
	movq	(%rax), %r8
	jmp	.L122
.L155:
	movq	-168(%rbp), %r9
	movslq	%r13d,%r11
	xorl	%eax, %eax
	leaq	(%r9,%r11,8), %rbx
	movq	(%rbx), %rdi
	movq	%r8, -216(%rbp)
	call	copy_for_inline
	movq	%rax, (%rbx)
	movq	-216(%rbp), %r8
	jmp	.L152
.L196:
	movl	$22, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	copy_asm_operands_vector(%rip), %rdx
	movq	8(%rbx), %r12
	movq	%rax, %r8
	movq	%r12, 8(%rax)
	movq	16(%rbx), %r13
	movq	%r13, 16(%rax)
	movl	24(%rbx), %eax
	movq	%rdx, 32(%r8)
	movl	%eax, 24(%r8)
	movq	40(%rbx), %r10
	movq	%r10, 40(%r8)
	jmp	.L122
.L143:
	movq	8(%r8), %rax
	cmpw	$34, (%rax)
	jne	.L123
	movl	8(%rax), %eax
	cmpl	max_parm_reg(%rip), %eax
	jge	.L123
	cmpl	$55, %eax
	jle	.L123
	cltq
	salq	$3, %rax
	addq	parmdecl_map(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L123
	andb	$-33, 25(%rax)
	jmp	.L123
	.p2align 6,,7
.L140:
	movl	8(%r8), %eax
	cmpl	$55, %eax
	jle	.L122
	cltq
	salq	$3, %rax
	addq	reg_map(%rip), %rax
	jmp	.L190
.L132:
	movq	8(%r8), %rcx
	movzwl	(%rcx), %edx
	leal	-38(%rdx), %ebx
	cmpw	$1, %bx
	jbe	.L122
	cmpw	$30, %dx
	je	.L122
	cmpw	$32, %dx
	je	.L122
	cmpw	$44, %dx
	jne	.L123
	movq	8(%rcx), %rax
	cmpw	$34, (%rax)
	jne	.L123
	cmpl	$14, 8(%rax)
	jne	.L123
	movq	16(%rcx), %r9
	movzwl	(%r9), %edx
	leal	-38(%rdx), %r11d
	cmpw	$1, %r11w
	jbe	.L136
	cmpw	$30, %dx
	je	.L136
	cmpw	$32, %dx
	jne	.L123
.L136:
	cmpw	$34, (%rcx)
	jne	.L123
	cmpl	$14, 8(%rcx)
	jne	.L123
	movq	16(%r8), %rcx
	movzwl	(%rcx), %edx
	leal	-38(%rdx), %edi
	cmpw	$1, %di
	jbe	.L122
	cmpw	$30, %dx
	je	.L122
	cmpw	$32, %dx
	jne	.L123
	jmp	.L122
	.p2align 6,,7
.L139:
	movq	8(%r8), %r10
	movzbl	2(%r8), %esi
	movl	$38, %edi
	xorl	%eax, %eax
	movslq	32(%r10),%r8
	salq	$3, %r8
	addq	label_map(%rip), %r8
	movq	(%r8), %rdx
	call	gen_rtx
	movq	%rax, %r8
	jmp	.L122
.L195:
	cmpq	$0, orig_asm_operands_vector(%rip)
	jne	.L120
	movq	-192(%rbp), %r12
	movq	32(%r8), %rbx
	movq	32(%r12), %r13
	movq	%rbx, orig_asm_operands_vector(%rip)
	movq	%r13, copy_asm_operands_vector(%rip)
	jmp	.L120
.L109:
	movq	-192(%rbp), %r9
	movslq	%r13d,%rdi
	leaq	8(%r9,%rdi,8), %rbx
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L104
	movl	(%rax), %edi
	testl	%edi, %edi
	je	.L104
	leaq	8(%rax), %rsi
	movq	%r8, -216(%rbp)
	xorl	%eax, %eax
	call	gen_rtvec_v
	xorl	%r9d, %r9d
	movq	%rax, (%rbx)
	movq	-216(%rbp), %r8
	cmpl	(%rax), %r9d
	jae	.L104
	movq	%rbx, -136(%rbp)
.L115:
	movq	-136(%rbp), %rax
	movslq	%r9d,%rsi
	movq	(%rax), %r10
	xorl	%eax, %eax
	addq	$8, %r10
	leaq	(%r10,%rsi,8), %rbx
	movq	(%rbx), %rdi
	movl	%r9d, -224(%rbp)
	movq	%r8, -216(%rbp)
	call	copy_for_inline
	movq	%rax, (%rbx)
	movq	-136(%rbp), %rcx
	movl	-224(%rbp), %r9d
	movq	(%rcx), %r8
	incl	%r9d
	cmpl	(%r8), %r9d
	movq	-216(%rbp), %r8
	jb	.L115
	jmp	.L104
	.p2align 6,,7
.L118:
	cmpl	$117, %eax
	jne	.L104
	movq	-128(%rbp), %r11
	movslq	%r13d,%rbx
	movq	(%r11,%rbx,8), %r12
	movslq	8(%r12),%rax
	salq	$3, %rax
	addq	insn_map(%rip), %rax
.L189:
	movq	(%rax), %r8
	jmp	.L74
.L107:
	movq	-120(%rbp), %r10
	movslq	%r13d,%rdx
	xorl	%eax, %eax
	leaq	(%r10,%rdx,8), %rbx
	movq	(%rbx), %rdi
	movq	%r8, -216(%rbp)
	call	copy_for_inline
	movq	%rax, (%rbx)
	movq	-216(%rbp), %r8
	jmp	.L104
.L194:
	movl	$22, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	copy_asm_operands_vector(%rip), %r12
	movq	8(%rbx), %rsi
	movq	%rax, %r8
	movq	%rsi, 8(%rax)
	movq	16(%rbx), %r13
	movq	%r13, 16(%rax)
	movl	24(%rbx), %eax
	movq	%r12, 32(%r8)
	movl	%eax, 24(%r8)
	movq	40(%rbx), %rdx
	movq	%rdx, 40(%r8)
	jmp	.L74
.L95:
	movq	8(%r8), %rax
	cmpw	$34, (%rax)
	jne	.L75
	movl	8(%rax), %eax
	cmpl	max_parm_reg(%rip), %eax
	jge	.L75
	cmpl	$55, %eax
	jle	.L75
	cltq
	salq	$3, %rax
	addq	parmdecl_map(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L75
	andb	$-33, 25(%rax)
	jmp	.L75
	.p2align 6,,7
.L92:
	movl	8(%r8), %eax
	cmpl	$55, %eax
	jle	.L74
	cltq
	salq	$3, %rax
	addq	reg_map(%rip), %rax
	jmp	.L189
.L84:
	movq	8(%r8), %rcx
	movzwl	(%rcx), %edx
	leal	-38(%rdx), %ebx
	cmpw	$1, %bx
	jbe	.L74
	cmpw	$30, %dx
	je	.L74
	cmpw	$32, %dx
	je	.L74
	cmpw	$44, %dx
	jne	.L75
	movq	8(%rcx), %rax
	cmpw	$34, (%rax)
	jne	.L75
	cmpl	$14, 8(%rax)
	jne	.L75
	movq	16(%rcx), %r11
	movzwl	(%r11), %edx
	leal	-38(%rdx), %r10d
	cmpw	$1, %r10w
	jbe	.L88
	cmpw	$30, %dx
	je	.L88
	cmpw	$32, %dx
	jne	.L75
.L88:
	cmpw	$34, (%rcx)
	jne	.L75
	cmpl	$14, 8(%rcx)
	jne	.L75
	movq	16(%r8), %rdi
	movzwl	(%rdi), %edx
	leal	-38(%rdx), %r9d
	cmpw	$1, %r9w
	jbe	.L74
	cmpw	$30, %dx
	je	.L74
	cmpw	$32, %dx
	jne	.L75
	jmp	.L74
	.p2align 6,,7
.L91:
	movq	8(%r8), %rcx
	movzbl	2(%r8), %esi
	movl	$38, %edi
	xorl	%eax, %eax
	movslq	32(%rcx),%r8
	salq	$3, %r8
	addq	label_map(%rip), %r8
	movq	(%r8), %rdx
	call	gen_rtx
	movq	%rax, %r8
	jmp	.L74
	.p2align 6,,7
.L170:
	movl	$16, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	%rax, %r15
	jmp	.L67
	.p2align 6,,7
.L169:
	movslq	32(%r14),%rdi
	salq	$3, %rdi
	addq	label_map(%rip), %rdi
	movq	(%rdi), %r15
	jmp	.L67
	.p2align 6,,7
.L193:
	movl	-80(%rbp), %esi
	movl	$maybepermanent_obstack, %edi
	xorl	%eax, %eax
	call	_obstack_newchunk
	movq	maybepermanent_obstack+24(%rip), %rdi
	jmp	.L48
	.p2align 6,,7
.L192:
	movslq	8(%rax),%rcx
	salq	$3, %rcx
	addq	parmdecl_map(%rip), %rcx
	movq	%rdx, (%rcx)
	andb	$-9, 25(%rdx)
	jmp	.L40
.L191:
	xorl	%eax, %eax
	call	gen_label_rtx
	movq	%rax, %rdi
	movq	%rax, return_label(%rip)
	xorl	%eax, %eax
	call	emit_label
	jmp	.L31
.L171:
	xorl	%eax, %eax
	call	abort
.LFE2:
.Lfe2:
	.size	save_for_inline,.Lfe2-save_for_inline
	.align 2
	.p2align 4,,15
.globl expand_inline_function
	.type	expand_inline_function,@function
expand_inline_function:
.LFB3:
	pushq	%rbp
.LCFI11:
	movq	%rsp, %rbp
.LCFI12:
	pushq	%r15
.LCFI13:
	movq	%rsi, %r15
	pushq	%r14
.LCFI14:
	pushq	%r13
.LCFI15:
	pushq	%r12
.LCFI16:
	pushq	%rbx
.LCFI17:
	subq	$584, %rsp
.LCFI18:
	movq	%r9, -72(%rbp)
	movq	%r8, -64(%rbp)
	movq	%rdi, -48(%rbp)
	movq	%rdx, -616(%rbp)
	movl	%ecx, -52(%rbp)
	movq	136(%rdi), %rsi
	movq	%rsi, -80(%rbp)
	movq	24(%rsi), %rbx
	movq	%rbx, -472(%rbp)
	movl	64(%rsi), %edx
	incl	%edx
	movl	%edx, -84(%rbp)
	cmpl	$55, %edx
	movl	40(%rsi), %eax
	movl	%eax, -452(%rbp)
	movl	48(%rsi), %ecx
	movq	$0, -448(%rbp)
	movq	$0, -576(%rbp)
	movq	$0, -464(%rbp)
	movl	%ecx, -88(%rbp)
	jle	.L1316
	movq	-48(%rbp), %rdx
	xorl	%eax, %eax
	movq	96(%rdx), %rdi
	call	list_length
	movq	%r15, %rdi
	movl	$8, first_parm_offset(%rip)
	movl	%eax, %ebx
	xorl	%eax, %eax
	call	list_length
	cmpl	%ebx, %eax
	je	.L1597
.L1454:
	movq	$-1, -616(%rbp)
.L247:
	movq	-616(%rbp), %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	leave
	ret
	.p2align 6,,7
.L1597:
	movq	-48(%rbp), %rdi
	movq	%r15, %rsi
	movq	96(%rdi), %rcx
	testq	%rcx, %rcx
	je	.L1334
	.p2align 4,,7
.L256:
	movq	40(%rsi), %r9
	movq	96(%rcx), %r10
	movq	16(%r9), %rdi
	movzbl	56(%r10), %edx
	movzbl	56(%rdi), %r8d
	cmpl	%r8d, %edx
	jne	.L1454
	cmpl	$26, %edx
	je	.L1598
.L252:
	movq	8(%rcx), %rcx
	movq	8(%rsi), %rsi
	testq	%rcx, %rcx
	jne	.L256
.L1334:
	xorl	%edi, %edi
	xorl	%eax, %eax
	movslq	%ebx,%r13
	call	pushlevel
	leaq	15(,%r13,8), %r12
	xorl	%eax, %eax
	xorl	%edi, %edi
	andq	$-16, %r12
	call	expand_start_bindings
	movq	-48(%rbp), %r11
	subq	%r12, %rsp
	movq	%rsp, -96(%rbp)
	movq	96(%r11), %rax
	movl	$0, -436(%rbp)
	testq	%rax, %rax
	movq	%rax, %rbx
	jne	.L268
.L1336:
	xorl	%r12d, %r12d
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L273
.L1338:
	xorl	%eax, %eax
	call	emit_queue
	xorl	%eax, %eax
	call	do_pending_stack_adjust
	cmpq	$0, -72(%rbp)
	je	.L275
	movq	struct_value_rtx(%rip), %rax
	cmpw	$37, (%rax)
	je	.L1599
	movq	-72(%rbp), %rsi
	movq	%rax, -448(%rbp)
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	emit_move_insn
.L275:
	movslq	-84(%rbp),%rcx
	xorl	%r8d, %r8d
	movq	%r8, %rax
	cld
	salq	$3, %rcx
	leaq	15(%rcx), %r12
	shrq	$3, %rcx
	andq	$-16, %r12
	subq	%r12, %rsp
	movq	%rsp, %rdi
	movq	%rsp, reg_map(%rip)
	rep
	stosq
	movq	-48(%rbp), %rbx
	movq	96(%rbx), %rax
	testq	%rax, %rax
	je	.L281
	movq	%rax, %rsi
	movq	-80(%rbp), %rax
	movl	72(%rax), %r14d
	cmpl	$-1, %r14d
	leal	3(%r14), %ecx
	movl	%r14d, %eax
	cmovle	%ecx, %eax
	sarl	$2, %eax
	cltq
	leaq	15(,%rax,8), %rdx
	movq	%r8, %rax
	andq	$-16, %rdx
	subq	%rdx, %rsp
	cmpl	$-1, %r14d
	cmovle	%ecx, %r14d
	movq	%rsp, %rdi
	movq	%rsp, parm_map(%rip)
	sarl	$2, %r14d
	movslq	%r14d,%rcx
	salq	$3, %rcx
	shrq	$3, %rcx
	rep
	stosq
	movl	first_parm_offset(%rip), %eax
	cmpl	$-1, %eax
	leal	3(%rax), %edi
	cmovle	%edi, %eax
	sarl	$2, %eax
	cltq
	salq	$3, %rax
	subq	%rax, parm_map(%rip)
	.p2align 4,,7
.L306:
	movl	80(%rsi), %edx
	testl	%edx, %edx
	js	.L292
	cmpl	$-1, %edx
	leal	31(%rdx), %r8d
	cmovle	%r8d, %edx
	sarl	$5, %edx
	movslq	%edx,%rax
.L1456:
	movq	-96(%rbp), %r11
	salq	$3, %rax
	movslq	%ecx,%r10
	addq	parm_map(%rip), %rax
	movq	(%r11,%r10,8), %r15
	movq	%r15, (%rax)
	movq	120(%rsi), %rax
.L294:
	cmpw	$34, (%rax)
	je	.L1600
.L290:
	movq	8(%rsi), %rsi
	incl	%ecx
	testq	%rsi, %rsi
	jne	.L306
	cmpq	$0, -448(%rbp)
	je	.L313
	movq	struct_value_incoming_rtx(%rip), %rdx
	movzwl	(%rdx), %eax
	cmpw	$34, %ax
	je	.L313
	cmpw	$37, %ax
	jne	.L1316
	movq	8(%rdx), %rax
	movq	frame_pointer_rtx(%rip), %rbx
	cmpq	%rbx, 8(%rax)
	jne	.L1316
	movq	16(%rax), %rax
	cmpw	$30, (%rax)
	jne	.L1316
	movl	8(%rax), %eax
	movq	-448(%rbp), %rsi
	cmpl	$-1, %eax
	leal	3(%rax), %ecx
	cmovle	%ecx, %eax
	sarl	$2, %eax
	cltq
	salq	$3, %rax
	addq	parm_map(%rip), %rax
	movq	%rsi, (%rax)
.L313:
	movl	-88(%rbp), %eax
	movslq	-452(%rbp),%rbx
	subl	-452(%rbp), %eax
	movl	-88(%rbp), %edx
	leaq	0(,%rbx,8), %r15
	cltq
	leaq	15(,%rax,8), %r10
	andq	$-16, %r10
	subq	%r10, %rsp
	movq	%rsp, %r9
	subq	%r15, %r9
	cmpl	%edx, -452(%rbp)
	movq	%r9, label_map(%rip)
	jge	.L1342
	.p2align 4,,7
.L318:
	xorl	%eax, %eax
	call	gen_label_rtx
	incl	-452(%rbp)
	leaq	0(,%rbx,8), %r11
	addq	label_map(%rip), %r11
	movq	%rax, (%r11)
	movl	-88(%rbp), %eax
	cmpl	%eax, -452(%rbp)
	jge	.L1342
	movslq	-452(%rbp),%rbx
	jmp	.L318
	.p2align 6,,7
.L1342:
	movq	-80(%rbp), %rax
	cld
	movslq	8(%rax),%rcx
	xorl	%eax, %eax
	salq	$3, %rcx
	leaq	15(%rcx), %r13
	shrq	$3, %rcx
	andq	$-16, %r13
	subq	%r13, %rsp
	movq	%rsp, %rdi
	movq	%rsp, insn_map(%rip)
	rep
	stosq
	cmpq	$0, -72(%rbp)
	je	.L1601
.L323:
	movq	$0, inline_target(%rip)
.L324:
	xorl	%eax, %eax
	call	get_frame_size
	movq	frame_pointer_rtx(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	negl	%esi
	movl	%esi, fp_delta(%rip)
	call	plus_constant
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	copy_to_mode_reg
	movq	-48(%rbp), %rbx
	xorl	%edi, %edi
	movq	%rax, inline_fp_rtx(%rip)
	xorl	%eax, %eax
	movl	128(%rbx), %esi
	call	assign_stack_local
	cmpq	$0, -472(%rbp)
	je	.L1344
	.p2align 4,,7
.L1168:
	movq	-472(%rbp), %rdx
	xorl	%ebx, %ebx
	movq	$0, orig_asm_operands_vector(%rip)
	movq	$0, copy_asm_operands_vector(%rip)
	movzwl	(%rdx), %eax
	subl	$13, %eax
	cmpl	$5, %eax
	ja	.L1316
	mov	%eax, %r8d
	jmp	*.L1167(,%r8,8)
	.section	.rodata
	.align 8
	.align 4
.L1167:
	.quad	.L333
	.quad	.L868
	.quad	.L1015
	.quad	.L1162
	.quad	.L1161
	.quad	.L1163
	.text
	.p2align 6,,7
.L333:
	movq	-472(%rbp), %r9
	cmpq	$0, -464(%rbp)
	movq	32(%r9), %rax
	movq	%rax, -208(%rbp)
	je	.L1401
	movzwl	(%rax), %edx
	cmpw	$25, %dx
	je	.L1602
.L336:
	cmpw	$26, %dx
	je	.L1603
.L481:
	movq	$0, -464(%rbp)
.L334:
	cmpw	$26, %dx
	movq	$0, -112(%rbp)
	je	.L1604
.L483:
	cmpw	$25, %dx
	je	.L1605
.L484:
	testq	%rbx, %rbx
	je	.L724
	movq	%rbx, -472(%rbp)
	.p2align 4,,7
.L332:
	movq	-472(%rbp), %r10
	movq	-112(%rbp), %rcx
	movslq	8(%r10),%r11
	salq	$3, %r11
	addq	insn_map(%rip), %r11
	movq	%rcx, (%r11)
	movq	24(%r10), %r8
	testq	%r8, %r8
	movq	%r8, -472(%rbp)
	jne	.L1168
.L1344:
	cmpq	$0, -576(%rbp)
	jne	.L1606
.L1169:
	movq	-48(%rbp), %r9
	xorl	%edi, %edi
	xorl	%eax, %eax
	movq	112(%r9), %r13
	movq	%r13, -352(%rbp)
	call	pushlevel
	movq	56(%r13), %r12
	testq	%r12, %r12
	jne	.L1322
.L1387:
	movq	-352(%rbp), %r12
	movq	48(%r12), %rbx
	testq	%rbx, %rbx
	jne	.L1327
.L1397:
	xorl	%eax, %eax
	testl	%eax, %eax
	setg	%r13b
	xorl	%edx, %edx
	xorl	%esi, %esi
	movzbl	%r13b, %edi
	call	poplevel
	xorl	%eax, %eax
	call	getdecls
	movl	$1, %edx
	movl	$1, %esi
	movl	%eax, %edi
	xorl	%eax, %eax
	call	expand_end_bindings
	xorl	%edx, %edx
	xorl	%eax, %eax
	movl	$1, %edi
	movl	$1, %esi
	call	poplevel
	movl	-52(%rbp), %eax
	movq	$0, label_map(%rip)
	movq	$0, reg_map(%rip)
	testl	%eax, %eax
	jne	.L1330
	movq	-64(%rbp), %rdx
	cmpb	$0, 56(%rdx)
	jne	.L1329
.L1330:
	movq	$0, -616(%rbp)
	jmp	.L247
.L1329:
	cmpq	$0, -72(%rbp)
	je	.L247
	cmpq	$0, -616(%rbp)
	jne	.L247
	movq	-72(%rbp), %rsi
	movl	$26, %edi
	xorl	%eax, %eax
	call	memory_address
	movl	$26, %esi
	movl	$37, %edi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	gen_rtx
	movq	%rax, -616(%rbp)
	jmp	.L247
	.p2align 6,,7
.L1327:
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	$1, %esi
	call	copy_decl_tree
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1327
	jmp	.L1397
	.p2align 6,,7
.L1322:
	movzbl	24(%r12), %edi
	movq	64(%r12), %rsi
	xorl	%eax, %eax
	movq	16(%r12), %rdx
	call	build_decl
	movq	120(%r12), %r15
	movq	32(%r12), %rbx
	movq	%rax, %r13
	movl	40(%r12), %eax
	testq	%r15, %r15
	movq	%rbx, 32(%r13)
	movl	%eax, 40(%r13)
	je	.L1174
	cmpw	$37, (%r15)
	je	.L1607
.L1175:
	leaq	120(%r13), %rdx
	xorl	%ebx, %ebx
	testq	%r15, %r15
	movq	%rdx, -360(%rbp)
	je	.L1179
	movzwl	(%r15), %eax
	movl	%eax, -364(%rbp)
	subl	$17, %eax
	movzbl	2(%r15), %esi
	cmpl	$27, %eax
	movl	%esi, -368(%rbp)
	ja	.L1180
	mov	%eax, %r8d
	jmp	*.L1297(,%r8,8)
	.section	.rodata
	.align 8
	.align 4
.L1297:
	.quad	.L1188
	.quad	.L1180
	.quad	.L1180
	.quad	.L1180
	.quad	.L1180
	.quad	.L1195
	.quad	.L1180
	.quad	.L1180
	.quad	.L1180
	.quad	.L1180
	.quad	.L1180
	.quad	.L1197
	.quad	.L1316
	.quad	.L1194
	.quad	.L1194
	.quad	.L1180
	.quad	.L1194
	.quad	.L1181
	.quad	.L1180
	.quad	.L1180
	.quad	.L1218
	.quad	.L1189
	.quad	.L1194
	.quad	.L1194
	.quad	.L1180
	.quad	.L1180
	.quad	.L1180
	.quad	.L1200
	.text
.L1181:
	movl	8(%r15), %eax
	cmpl	$55, %eax
	jg	.L1182
	testb	$64, 3(%r15)
	je	.L1183
	movq	inline_target(%rip), %rdx
	testq	%rdx, %rdx
	je	.L1316
	movzbl	2(%rdx), %r15d
	movq	%rdx, %rbx
	cmpl	%r15d, -368(%rbp)
	je	.L1179
	movl	-368(%rbp), %esi
	movl	$35, %edi
.L1569:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	call	gen_rtx
.L1484:
	movq	%rax, %rbx
	.p2align 4,,7
.L1179:
	movq	-360(%rbp), %r14
	movq	%rbx, (%r14)
.L1174:
	movzbl	25(%r12), %r15d
	movzbl	25(%r13), %ecx
	movzbl	26(%r13), %ebx
	andb	$1, %r15b
	andb	$-2, %cl
	orb	%r15b, %cl
	andb	$-3, %bl
	movb	%cl, 25(%r13)
	andb	$-5, %cl
	movzbl	25(%r12), %r9d
	andb	$4, %r9b
	orb	%r9b, %cl
	movb	%cl, 25(%r13)
	andb	$-3, %cl
	movzbl	25(%r12), %r11d
	andb	$2, %r11b
	orb	%r11b, %cl
	movb	%cl, 25(%r13)
	andb	$-65, %cl
	movzbl	25(%r12), %eax
	andb	$64, %al
	orb	%al, %cl
	xorl	%eax, %eax
	movb	%cl, 25(%r13)
	andb	$-33, %cl
	movzbl	26(%r12), %esi
	andb	$2, %sil
	orb	%sil, %bl
	movb	%bl, 26(%r13)
	orb	$-128, %bl
	movzbl	25(%r12), %edi
	andb	$32, %dil
	orb	%dil, %cl
	movq	%r13, %rdi
	movb	%cl, 25(%r13)
	andb	$-9, %cl
	movzbl	25(%r12), %r8d
	movb	%bl, 26(%r13)
	andb	$8, %r8b
	orb	%r8b, %cl
	movb	%cl, 25(%r13)
	call	pushdecl
	movq	8(%r12), %r12
	testq	%r12, %r12
	jne	.L1322
	jmp	.L1387
.L1183:
	cmpl	$14, %eax
	movq	%r15, %rdi
	je	.L1570
.L1194:
	movq	%r15, %rbx
	jmp	.L1179
.L1570:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1484
.L1182:
	movq	reg_map(%rip), %rdx
	cltq
	leaq	0(,%rax,8), %rbx
	cmpq	$0, (%rdx,%rbx)
	je	.L1608
.L1187:
	movq	(%rdx,%rbx), %rbx
	jmp	.L1179
.L1608:
	movl	-368(%rbp), %edi
	xorl	%eax, %eax
	call	gen_reg_rtx
	movq	reg_map(%rip), %rdx
	movq	%rax, (%rdx,%rbx)
	jmp	.L1187
.L1188:
	movslq	32(%r15),%r10
	salq	$3, %r10
	addq	label_map(%rip), %r10
	movq	(%r10), %rbx
	jmp	.L1179
.L1195:
	movq	32(%r15), %r14
	cmpq	%r14, orig_asm_operands_vector(%rip)
	je	.L1609
.L1180:
	movl	-364(%rbp), %edi
	xorl	%eax, %eax
	call	rtx_alloc
	xorl	%esi, %esi
	movzbl	-368(%rbp), %r10d
	movq	%rax, %r14
	movb	%r10b, 2(%rax)
	movzwl	(%r14), %edx
	movzbl	3(%r14), %r9d
	movzbl	3(%r15), %eax
	andb	$-17, %r9b
	movzwl	%dx, %edi 
	andb	$16, %al
	orb	%al, %r9b
	movb	%r9b, 3(%r14)
	andb	$-9, %r9b
	movzbl	3(%r15), %r8d
	andb	$8, %r8b
	orb	%r8b, %r9b
	movb	%r9b, 3(%r14)
	andb	$-5, %r9b
	movzbl	3(%r15), %ebx
	andb	$4, %bl
	orb	%bl, %r9b
	movb	%r9b, 3(%r14)
	cmpl	rtx_length(,%rdi,4), %esi
	movl	$0, -604(%rbp)
	movq	rtx_format(,%rdi,8), %r11
	movq	%r11, -600(%rbp)
	jge	.L1394
	.p2align 4,,7
.L1320:
	movq	-600(%rbp), %rcx
	movsbl	(%rcx),%eax
	incq	%rcx
	movq	%rcx, -600(%rbp)
	cmpl	$101, %eax
	je	.L1305
	cmpl	$101, %eax
	jg	.L1318
	cmpl	$48, %eax
	je	.L1301
	cmpl	$69, %eax
	jne	.L1316
	movslq	-604(%rbp),%rdi
	leaq	8(%r15), %rdx
	movq	%rdx, -416(%rbp)
	leaq	0(,%rdi,8), %rbx
	leaq	8(%rbx,%r14), %r10
	leaq	(%rdx,%rbx), %r8
	movq	%r10, -408(%rbp)
	movq	(%r8), %rcx
	movq	%rcx, (%r10)
	movq	(%r8), %rax
	testq	%rax, %rax
	je	.L1452
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L1611
	.p2align 4,,7
.L1452:
	movzwl	(%r14), %edx
.L1301:
	incl	-604(%rbp)
	movzwl	%dx, %r11d 
	movl	-604(%rbp), %r9d
	cmpl	rtx_length(,%r11,4), %r9d
	jl	.L1320
.L1394:
	cmpl	$22, -364(%rbp)
	je	.L1612
.L1321:
	movq	%r14, %rbx
	jmp	.L1179
.L1612:
	cmpq	$0, orig_asm_operands_vector(%rip)
	jne	.L1321
	movq	32(%r15), %r10
	movq	32(%r14), %r15
	movq	%r10, orig_asm_operands_vector(%rip)
	movq	%r15, copy_asm_operands_vector(%rip)
	jmp	.L1321
.L1611:
	xorl	%eax, %eax
	call	rtvec_alloc
	xorl	%r8d, %r8d
	movq	-408(%rbp), %rdx
	movq	%rax, (%rdx)
	cmpl	(%rax), %r8d
	jae	.L1452
	movq	%rbx, -424(%rbp)
	movq	%rdx, -432(%rbp)
.L1313:
	movq	-424(%rbp), %rcx
	movq	-416(%rbp), %r10
	movslq	%r8d,%r9
	movq	-432(%rbp), %rbx
	salq	$3, %r9
	xorl	%eax, %eax
	movq	(%r10,%rcx), %r11
	movq	(%rbx), %rdx
	addq	$8, %r11
	movq	(%r11,%r9), %rdi
	addq	$8, %rdx
	movl	%r8d, -624(%rbp)
	leaq	(%rdx,%r9), %rbx
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	-432(%rbp), %rax
	movl	-624(%rbp), %r8d
	movq	(%rax), %rsi
	incl	%r8d
	cmpl	(%rsi), %r8d
	jb	.L1313
	jmp	.L1452
	.p2align 6,,7
.L1318:
	cmpl	$115, %eax
	je	.L1315
	cmpl	$115, %eax
	jg	.L1319
	cmpl	$105, %eax
	jne	.L1316
	movslq	-604(%rbp),%r8
	salq	$3, %r8
	movl	8(%r15,%r8), %edi
	movl	%edi, 8(%r14,%r8)
	jmp	.L1452
.L1319:
	cmpl	$117, %eax
	jne	.L1316
	movslq	-604(%rbp),%rdi
	salq	$3, %rdi
	movq	8(%rdi,%r15), %r9
	movslq	8(%r9),%r11
	salq	$3, %r11
	addq	insn_map(%rip), %r11
	movq	(%r11), %rsi
	movq	%rsi, 8(%rdi,%r14)
	jmp	.L1452
.L1315:
	movslq	-604(%rbp),%rsi
	salq	$3, %rsi
	movq	8(%rsi,%r15), %rax
	movq	%rax, 8(%rsi,%r14)
	jmp	.L1452
.L1305:
	movslq	-604(%rbp),%rdx
	xorl	%eax, %eax
	salq	$3, %rdx
	movq	8(%rdx,%r15), %rdi
	leaq	8(%rdx,%r14), %rbx
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	jmp	.L1452
.L1609:
	movl	$22, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	copy_asm_operands_vector(%rip), %rdx
	movq	8(%r15), %r8
	movq	%rax, %rbx
	movq	%r8, 8(%rax)
	movq	16(%r15), %rsi
	movq	%rsi, 16(%rax)
	movl	24(%r15), %eax
	movq	%rdx, 32(%rbx)
	movl	%eax, 24(%rbx)
	movq	40(%r15), %rdi
	movq	%rdi, 40(%rbx)
	jmp	.L1179
.L1197:
	movl	optimize(%rip), %ebx
	testl	%ebx, %ebx
	je	.L1199
	movl	flag_no_function_cse(%rip), %r10d
	testl	%r10d, %r10d
	je	.L1180
.L1199:
	movq	8(%r15), %rcx
	xorl	%eax, %eax
	movq	8(%rcx), %rdi
	call	copy_rtx_and_substitute
	movl	$37, %edi
	movq	8(%r15), %r11
	movq	%rax, %rdx
	xorl	%eax, %eax
	movzbl	2(%r11), %esi
	call	gen_rtx
	movq	16(%r15), %rdi
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movl	$28, %edi
	movzbl	2(%r15), %esi
	movq	%rax, %rcx
.L1594:
	movq	%rbx, %rdx
.L1573:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1484
.L1218:
	movq	8(%r15), %r14
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %r14
	je	.L1220
	cmpq	arg_pointer_rtx(%rip), %r14
	je	.L1220
	cmpw	$63, (%r14)
	je	.L1615
.L1221:
	movl	-368(%rbp), %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	call	memory_address_p
	testl	%eax, %eax
	jne	.L1222
	movzwl	(%r14), %edi
	movzbl	2(%r14), %ebx
	leal	-17(%rdi), %eax
	cmpl	$27, %eax
	ja	.L1225
	mov	%eax, %esi
	jmp	*.L1238(,%rsi,8)
	.section	.rodata
	.align 8
	.align 4
.L1238:
	.quad	.L1232
	.quad	.L1225
	.quad	.L1225
	.quad	.L1225
	.quad	.L1225
	.quad	.L1225
	.quad	.L1225
	.quad	.L1225
	.quad	.L1225
	.quad	.L1225
	.quad	.L1225
	.quad	.L1225
	.quad	.L1225
	.quad	.L1224
	.quad	.L1224
	.quad	.L1225
	.quad	.L1224
	.quad	.L1226
	.quad	.L1225
	.quad	.L1225
	.quad	.L1230
	.quad	.L1232
	.quad	.L1224
	.quad	.L1224
	.quad	.L1225
	.quad	.L1225
	.quad	.L1225
	.quad	.L1228
	.text
.L1226:
	cmpl	$14, 8(%r14)
	je	.L1616
.L1232:
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L1482:
	movq	%rax, %r14
.L1224:
	movl	-368(%rbp), %esi
	movl	$37, %edi
	movq	%r14, %rdx
.L1576:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1484
.L1616:
	movq	frame_pointer_rtx(%rip), %rdi
.L1566:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1482
.L1230:
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	copy_to_reg
	jmp	.L1482
.L1225:
	xorl	%eax, %eax
	call	rtx_alloc
	xorl	%r8d, %r8d
	movzbl	3(%rax), %r10d
	movb	%bl, 2(%rax)
	movzwl	(%rax), %edx
	movzbl	3(%r14), %r9d
	movq	%rax, %r15
	andb	$-17, %r10b
	movzwl	%dx, %edi 
	andb	$16, %r9b
	orb	%r9b, %r10b
	movb	%r10b, 3(%rax)
	andb	$-9, %r10b
	movzbl	3(%r14), %ecx
	andb	$8, %cl
	orb	%cl, %r10b
	movb	%r10b, 3(%rax)
	andb	$-5, %r10b
	movzbl	3(%r14), %r11d
	andb	$4, %r11b
	orb	%r11b, %r10b
	movb	%r10b, 3(%rax)
	cmpl	rtx_length(,%rdi,4), %r8d
	movl	$0, -588(%rbp)
	movq	rtx_format(,%rdi,8), %rbx
	movq	%rbx, -584(%rbp)
	jge	.L1389
.L1261:
	movq	-584(%rbp), %rdi
	movsbl	(%rdi),%eax
	incq	%rdi
	movq	%rdi, -584(%rbp)
	cmpl	$101, %eax
	je	.L1246
	cmpl	$101, %eax
	jg	.L1259
	cmpl	$48, %eax
	je	.L1242
	cmpl	$69, %eax
	jne	.L1316
	movslq	-588(%rbp),%rdx
	leaq	8(%r14), %rax
	movq	%rax, -384(%rbp)
	leaq	0(,%rdx,8), %rbx
	leaq	(%rax,%rbx), %r11
	leaq	8(%rbx,%r15), %rdi
	movq	%rdi, -376(%rbp)
	movq	-376(%rbp), %r9
	movq	(%r11), %rcx
	movq	%rcx, (%r9)
	movq	(%r11), %rax
	testq	%rax, %rax
	je	.L1448
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L1618
.L1448:
	movzwl	(%r15), %edx
.L1242:
	incl	-588(%rbp)
	movzwl	%dx, %r11d 
	movl	-588(%rbp), %r9d
	cmpl	rtx_length(,%r11,4), %r9d
	jl	.L1261
.L1389:
	movq	%r15, %r14
	jmp	.L1224
.L1618:
	xorl	%eax, %eax
	call	rtvec_alloc
	xorl	%r8d, %r8d
	movq	-376(%rbp), %rsi
	movq	%rax, (%rsi)
	cmpl	(%rax), %r8d
	jae	.L1448
	movq	%rbx, -392(%rbp)
	movq	%rsi, -400(%rbp)
.L1254:
	movq	-392(%rbp), %rax
	movq	-384(%rbp), %r9
	movslq	%r8d,%r11
	movq	-400(%rbp), %rdi
	salq	$3, %r11
	movq	(%r9,%rax), %r10
	xorl	%eax, %eax
	movq	(%rdi), %rcx
	addq	$8, %r10
	movq	(%r10,%r11), %rdi
	addq	$8, %rcx
	movl	%r8d, -624(%rbp)
	leaq	(%rcx,%r11), %rbx
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	-400(%rbp), %rbx
	movl	-624(%rbp), %r8d
	movq	(%rbx), %rsi
	incl	%r8d
	cmpl	(%rsi), %r8d
	jb	.L1254
	jmp	.L1448
	.p2align 6,,7
.L1259:
	cmpl	$115, %eax
	je	.L1256
	cmpl	$115, %eax
	jg	.L1260
	cmpl	$105, %eax
	jne	.L1316
	movslq	-588(%rbp),%r8
	salq	$3, %r8
	movl	8(%r14,%r8), %esi
	movl	%esi, 8(%r15,%r8)
	jmp	.L1448
.L1260:
	cmpl	$117, %eax
	jne	.L1316
	movslq	-588(%rbp),%rsi
	salq	$3, %rsi
	movq	8(%rsi,%r14), %r10
	movslq	8(%r10),%rbx
	salq	$3, %rbx
	addq	insn_map(%rip), %rbx
	movq	(%rbx), %r8
	movq	%r8, 8(%rsi,%r15)
	jmp	.L1448
.L1256:
	movslq	-588(%rbp),%rbx
	salq	$3, %rbx
	movq	8(%rbx,%r14), %r10
	movq	%r10, 8(%rbx,%r15)
	jmp	.L1448
.L1246:
	movslq	-588(%rbp),%rdx
	xorl	%eax, %eax
	salq	$3, %rdx
	movq	8(%rdx,%r14), %rdi
	leaq	8(%rdx,%r15), %rbx
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	jmp	.L1448
.L1228:
	movq	8(%r14), %rax
	cmpw	$34, (%rax)
	jne	.L1225
	cmpl	$14, 8(%rax)
	jne	.L1225
	movq	%r14, %rdi
	jmp	.L1566
	.p2align 6,,7
.L1222:
	cmpw	$44, (%r14)
	je	.L1621
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L1295:
	movq	%r15, %rdi
.L1577:
	movl	-368(%rbp), %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	change_address
	jmp	.L1484
.L1621:
	movq	8(%r14), %rdx
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L1449
	movq	16(%r14), %rax
	cmpq	%rdi, %rax
	je	.L1622
	xorl	%eax, %eax
	movq	%r14, %rsi
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L1285
	movq	8(%r14), %rdi
	cmpw	$30, (%rdi)
	je	.L1623
	movq	16(%r14), %rcx
	cmpw	$30, (%rcx)
	je	.L1568
.L1293:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r14), %rdi
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rbx, %rdx
	movl	$44, %edi
	movzbl	2(%r14), %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1295
.L1568:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	16(%r14), %rax
.L1483:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1295
.L1623:
	movq	16(%r14), %rdi
.L1567:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	8(%r14), %rax
	jmp	.L1483
	.p2align 6,,7
.L1285:
	movq	16(%r14), %rax
	cmpw	$30, (%rax)
	je	.L1625
	movq	8(%r14), %rdi
	cmpw	$30, (%rdi)
	jne	.L1293
	movq	%rax, %rdi
	jmp	.L1567
.L1625:
	movq	8(%r14), %rdi
	jmp	.L1568
	.p2align 6,,7
.L1622:
	cmpq	%rdi, %rdx
	je	.L1266
	cmpq	arg_pointer_rtx(%rip), %rdx
	je	.L1266
	movq	%rdx, %r14
.L1267:
	cmpw	$30, (%r14)
	je	.L1627
.L1268:
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	fp_delta(%rip), %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	plus_constant
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L1295
.L1627:
	cmpq	arg_pointer_rtx(%rip), %rdi
	movl	8(%r14), %ebx
	je	.L1628
.L1269:
	movl	%ebx, %edx
	movl	$30, %edi
	movl	$4, %esi
	addl	fp_delta(%rip), %edx
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address_p
	testl	%eax, %eax
	jne	.L1268
	movq	inline_fp_rtx(%rip), %rdi
	movl	%ebx, %esi
.L1596:
	xorl	%eax, %eax
	call	plus_constant
.L1595:
	movl	$37, %edi
	movl	-368(%rbp), %esi
	movq	%rax, %rdx
	jmp	.L1576
.L1628:
	movl	first_parm_offset(%rip), %edi
	cmpl	%edi, %ebx
	jl	.L1269
	cmpl	$-1, %ebx
	leal	3(%rbx), %r14d
	movl	%ebx, %ecx
	cmovle	%r14d, %ecx
	movq	parm_map(%rip), %rdx
	movl	%ebx, %esi
	sarl	$2, %ecx
	leal	0(,%rcx,4), %r15d
	movslq	%ecx,%rax
	subl	%r15d, %esi
	cmpq	$0, (%rdx,%rax,8)
	jne	.L1392
	leal	3(%rdi), %r8d
.L1277:
	decl	%ecx
	movl	%edi, %ebx
	cmpl	$-1, %edi
	cmovle	%r8d, %ebx
	sarl	$2, %ebx
	cmpl	%ebx, %ecx
	jl	.L1316
	movslq	%ecx,%rax
	addl	$4, %esi
	cmpq	$0, (%rdx,%rax,8)
	je	.L1277
.L1392:
	movq	(%rdx,%rax,8), %rbx
	movzbl	2(%rbx), %edi
	movzbl	%dil, %r8d
	movslq	%r8d,%r10
	movl	mode_size(,%r10,4), %ecx
	cmpl	$3, %ecx
	leal	-4(%rcx,%rsi), %eax
	cmovle	%eax, %esi
	cmpl	-368(%rbp), %r8d
	je	.L1179
	testb	%dil, %dil
	je	.L1179
	movzwl	(%rbx), %eax
	cmpw	$37, %ax
	je	.L1629
	cmpw	$34, %ax
	jne	.L1316
	movslq	-368(%rbp),%rdx
	addl	mode_size(,%rdx,4), %esi
	cmpl	%ecx, %esi
	jne	.L1316
	movl	$35, %edi
	movl	-368(%rbp), %esi
	movq	%rbx, %rdx
	jmp	.L1569
.L1629:
	movq	8(%rbx), %rdi
	xorl	%eax, %eax
	call	plus_constant
	movq	%rbx, %rdi
	jmp	.L1577
	.p2align 6,,7
.L1266:
	movq	%rdx, %rdi
	movq	%rax, %r14
	jmp	.L1267
.L1449:
	movq	16(%r14), %rax
	jmp	.L1266
.L1615:
	movq	stack_pointer_rtx(%rip), %rax
	cmpq	%rax, 8(%r14)
	jne	.L1221
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	jmp	.L1595
	.p2align 6,,7
.L1220:
	movl	fp_delta(%rip), %esi
	jmp	.L1596
.L1189:
	movl	$38, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	%rax, %rbx
	movzbl	-368(%rbp), %eax
	movb	%al, 2(%rbx)
	movq	8(%r15), %r9
	movslq	32(%r9),%rcx
	salq	$3, %rcx
	addq	label_map(%rip), %rcx
	movq	(%rcx), %r11
	movq	%r11, 8(%rbx)
	jmp	.L1179
.L1200:
	movq	8(%r15), %rax
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %rax
	je	.L1445
	movq	16(%r15), %rdx
	cmpq	%rdi, %rdx
	je	.L1630
	xorl	%eax, %eax
	movq	%r15, %rsi
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L1210
	movl	-368(%rbp), %edi
	xorl	%eax, %eax
	movq	%r15, %rsi
	call	memory_address_p
	testl	%eax, %eax
	je	.L1210
	movq	8(%r15), %rdi
	cmpw	$30, (%rdi)
	je	.L1631
	movq	16(%r15), %rdx
	cmpw	$30, (%rdx)
	je	.L1632
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r15), %rdi
	movq	%rax, %r14
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%r14, %rdx
	movl	$44, %edi
	movzbl	2(%r15), %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	gen_rtx
.L1213:
	movl	-368(%rbp), %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L1484
.L1632:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	16(%r15), %rax
.L1481:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1213
.L1631:
	movq	16(%r15), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	8(%r15), %rax
	jmp	.L1481
	.p2align 6,,7
.L1210:
	movq	8(%r15), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r15), %rdi
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movl	$44, %edi
	movzbl	2(%r15), %esi
	movq	%rax, %rcx
	jmp	.L1594
.L1630:
	cmpq	%rdi, %rax
	je	.L1204
	cmpq	arg_pointer_rtx(%rip), %rax
	je	.L1204
	movq	%rax, %rdi
.L1205:
	cmpw	$30, (%rdi)
	je	.L1634
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	-368(%rbp), %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	-368(%rbp), %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	force_reg
	movq	%rax, %rdi
	jmp	.L1570
.L1634:
	movl	8(%rdi), %edx
	testl	%edx, %edx
	jle	.L1207
	cmpl	$-1, %edx
	leal	3(%rdx), %r14d
	cmovle	%r14d, %edx
	sarl	$2, %edx
	movslq	%edx,%r9
	salq	$3, %r9
	addq	parm_map(%rip), %r9
	movq	(%r9), %r15
	movq	8(%r15), %rbx
	jmp	.L1179
.L1207:
	addl	fp_delta(%rip), %edx
	movl	$30, %edi
	movl	$4, %esi
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	-368(%rbp), %esi
	movq	%rax, %rcx
	movl	$44, %edi
	jmp	.L1573
	.p2align 6,,7
.L1204:
	movq	%rdx, %rdi
	jmp	.L1205
.L1445:
	movq	16(%r15), %rdx
	jmp	.L1204
	.p2align 6,,7
.L1607:
	movq	8(%r15), %rdi
	movzwl	(%rdi), %edx
	leal	-38(%rdx), %r14d
	cmpw	$1, %r14w
	jbe	.L1176
	cmpw	$30, %dx
	je	.L1176
	cmpw	$32, %dx
	jne	.L1175
.L1176:
	movq	%r15, 120(%r13)
	jmp	.L1174
.L1606:
	movq	-576(%rbp), %rdi
	xorl	%eax, %eax
	call	emit_label
	jmp	.L1169
.L724:
	movq	-208(%rbp), %r12
	movq	-208(%rbp), %rax
	movzwl	(%r12), %edi
	movl	%edi, -212(%rbp)
	movzbl	2(%rax), %r14d
	movl	%edi, %eax
	subl	$17, %eax
	cmpl	$27, %eax
	ja	.L726
	mov	%eax, %edx
	jmp	*.L843(,%rdx,8)
	.section	.rodata
	.align 8
	.align 4
.L843:
	.quad	.L734
	.quad	.L726
	.quad	.L726
	.quad	.L726
	.quad	.L726
	.quad	.L741
	.quad	.L726
	.quad	.L726
	.quad	.L726
	.quad	.L726
	.quad	.L726
	.quad	.L743
	.quad	.L1316
	.quad	.L740
	.quad	.L740
	.quad	.L726
	.quad	.L740
	.quad	.L727
	.quad	.L726
	.quad	.L726
	.quad	.L764
	.quad	.L735
	.quad	.L740
	.quad	.L740
	.quad	.L726
	.quad	.L726
	.quad	.L726
	.quad	.L746
	.text
.L727:
	movq	-208(%rbp), %rdx
	movl	8(%rdx), %eax
	cmpl	$55, %eax
	jg	.L728
	testb	$64, 3(%rdx)
	je	.L729
	movq	inline_target(%rip), %rdx
	testq	%rdx, %rdx
	je	.L1316
	movzbl	2(%rdx), %r15d
	movq	%rdx, %rbx
	cmpl	%r15d, %r14d
	je	.L725
	movl	$35, %edi
	movl	%r14d, %esi
.L1532:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	call	gen_rtx
.L1469:
	movq	%rax, %rbx
.L725:
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	emit_insn
.L1479:
	movq	%rax, -112(%rbp)
	orb	$64, 3(%rax)
	jmp	.L332
.L729:
	cmpl	$14, %eax
	je	.L1635
.L740:
	movq	-208(%rbp), %rbx
	jmp	.L725
.L1635:
	movq	-208(%rbp), %rdi
.L1533:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1469
.L728:
	movq	reg_map(%rip), %rdx
	cltq
	leaq	0(,%rax,8), %rbx
	cmpq	$0, (%rdx,%rbx)
	je	.L1636
.L733:
	movq	(%rdx,%rbx), %rbx
	jmp	.L725
.L1636:
	movl	%r14d, %edi
	xorl	%eax, %eax
	call	gen_reg_rtx
	movq	reg_map(%rip), %rdx
	movq	%rax, (%rdx,%rbx)
	jmp	.L733
.L734:
	movq	-208(%rbp), %r14
	movslq	32(%r14),%r13
	salq	$3, %r13
	addq	label_map(%rip), %r13
	movq	(%r13), %rbx
	jmp	.L725
.L741:
	movq	-208(%rbp), %rbx
	movq	32(%rbx), %rsi
	cmpq	%rsi, orig_asm_operands_vector(%rip)
	je	.L1637
.L726:
	movl	-212(%rbp), %edi
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	call	rtx_alloc
	movq	-208(%rbp), %r8
	movb	%r14b, 2(%rax)
	movzwl	(%rax), %edx
	movq	%rax, %r12
	movzbl	3(%rax), %r14d
	movzbl	3(%r8), %r10d
	movzwl	%dx, %edi 
	andb	$-17, %r14b
	andb	$16, %r10b
	orb	%r10b, %r14b
	movb	%r14b, 3(%rax)
	andb	$-9, %r14b
	movzbl	3(%r8), %ebx
	andb	$8, %bl
	orb	%bl, %r14b
	movb	%r14b, 3(%rax)
	andb	$-5, %r14b
	movzbl	3(%r8), %esi
	andb	$4, %sil
	orb	%sil, %r14b
	movb	%r14b, 3(%rax)
	cmpl	rtx_length(,%rdi,4), %r15d
	movq	rtx_format(,%rdi,8), %r14
	jge	.L1368
	.p2align 4,,7
.L866:
	movsbl	(%r14),%eax
	incq	%r14
	cmpl	$101, %eax
	je	.L851
	cmpl	$101, %eax
	jg	.L864
	cmpl	$48, %eax
	je	.L847
	cmpl	$69, %eax
	jne	.L1316
	movq	-208(%rbp), %r11
	movslq	%r15d,%r13
	leaq	0(,%r13,8), %rbx
	leaq	8(%rbx,%r12), %r13
	addq	$8, %r11
	leaq	(%r11,%rbx), %r8
	movq	%r11, -240(%rbp)
	movq	(%r8), %r10
	movq	%r10, (%r13)
	movq	(%r8), %rax
	testq	%rax, %rax
	je	.L1428
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L1639
.L1428:
	movzwl	(%r12), %edx
.L847:
	movzwl	%dx, %ebx 
	incl	%r15d
	cmpl	rtx_length(,%rbx,4), %r15d
	jl	.L866
.L1368:
	cmpl	$22, -212(%rbp)
	je	.L1640
.L867:
	movq	%r12, %rbx
	jmp	.L725
.L1640:
	cmpq	$0, orig_asm_operands_vector(%rip)
	jne	.L867
	movq	-208(%rbp), %rdx
	movq	32(%r12), %r15
	movq	32(%rdx), %r14
	movq	%r15, copy_asm_operands_vector(%rip)
	movq	%r14, orig_asm_operands_vector(%rip)
	jmp	.L867
.L1639:
	xorl	%eax, %eax
	call	rtvec_alloc
	xorl	%r8d, %r8d
	movq	%rax, (%r13)
	cmpl	(%rax), %r8d
	jae	.L1428
	movq	%rbx, -248(%rbp)
.L859:
	movq	-240(%rbp), %rdi
	movq	-248(%rbp), %rsi
	movslq	%r8d,%rdx
	salq	$3, %rdx
	movq	(%r13), %rcx
	xorl	%eax, %eax
	movq	(%rdi,%rsi), %r9
	addq	$8, %rcx
	leaq	(%rcx,%rdx), %rbx
	addq	$8, %r9
	movq	(%r9,%rdx), %rdi
	movl	%r8d, -624(%rbp)
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	(%r13), %rbx
	movl	-624(%rbp), %r8d
	incl	%r8d
	cmpl	(%rbx), %r8d
	jb	.L859
	jmp	.L1428
	.p2align 6,,7
.L864:
	cmpl	$115, %eax
	je	.L861
	cmpl	$115, %eax
	jg	.L865
	cmpl	$105, %eax
	jne	.L1316
	movq	-208(%rbp), %r10
	movslq	%r15d,%r8
	salq	$3, %r8
	movl	8(%r10,%r8), %eax
	movl	%eax, 8(%r12,%r8)
	jmp	.L1428
.L865:
	cmpl	$117, %eax
	jne	.L1316
	movq	-208(%rbp), %rax
	movslq	%r15d,%rdi
	salq	$3, %rdi
	movq	8(%rdi,%rax), %rsi
	movslq	8(%rsi),%rcx
	salq	$3, %rcx
	addq	insn_map(%rip), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, 8(%rdi,%r12)
	jmp	.L1428
.L861:
	movq	-208(%rbp), %r9
	movslq	%r15d,%r11
	salq	$3, %r11
	movq	8(%r11,%r9), %r13
	movq	%r13, 8(%r11,%r12)
	jmp	.L1428
.L851:
	movq	-208(%rbp), %r9
	movslq	%r15d,%r11
	xorl	%eax, %eax
	salq	$3, %r11
	leaq	8(%r11,%r12), %r13
	movq	8(%r11,%r9), %rdi
	call	copy_rtx_and_substitute
	movq	%rax, (%r13)
	jmp	.L1428
.L1637:
	movl	$22, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	copy_asm_operands_vector(%rip), %r12
	movq	-208(%rbp), %rdi
	movq	%rax, %rbx
	movq	8(%rdi), %r15
	movq	%r15, 8(%rax)
	movq	16(%rdi), %rdx
	movq	%rdx, 16(%rax)
	movl	24(%rdi), %eax
	movq	%r12, 32(%rbx)
	movl	%eax, 24(%rbx)
	movq	40(%rdi), %r8
	movq	%r8, 40(%rbx)
	jmp	.L725
.L743:
	movl	optimize(%rip), %eax
	testl	%eax, %eax
	je	.L745
	movl	flag_no_function_cse(%rip), %r13d
	testl	%r13d, %r13d
	je	.L726
.L745:
	movq	-208(%rbp), %rbx
	xorl	%eax, %eax
	movq	8(%rbx), %rsi
	movq	8(%rsi), %rdi
	call	copy_rtx_and_substitute
	movl	$37, %edi
	movq	-208(%rbp), %r9
	movq	%rax, %rdx
	xorl	%eax, %eax
	movq	8(%r9), %r11
	movzbl	2(%r11), %esi
	call	gen_rtx
	movq	-208(%rbp), %r10
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	16(%r10), %rdi
	call	copy_rtx_and_substitute
	movl	$28, %edi
	movq	-208(%rbp), %r14
	movq	%rax, %rcx
	movzbl	2(%r14), %esi
.L1585:
	movq	%rbx, %rdx
.L1536:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1469
.L764:
	movq	-208(%rbp), %r8
	movq	frame_pointer_rtx(%rip), %rdi
	movq	8(%r8), %r12
	cmpq	%rdi, %r12
	je	.L766
	cmpq	arg_pointer_rtx(%rip), %r12
	je	.L766
	cmpw	$63, (%r12)
	je	.L1643
.L767:
	xorl	%eax, %eax
	movl	%r14d, %edi
	movq	%r12, %rsi
	call	memory_address_p
	testl	%eax, %eax
	jne	.L768
	movzwl	(%r12), %edi
	movzbl	2(%r12), %ebx
	leal	-17(%rdi), %eax
	cmpl	$27, %eax
	ja	.L771
	mov	%eax, %ecx
	jmp	*.L784(,%rcx,8)
	.section	.rodata
	.align 8
	.align 4
.L784:
	.quad	.L778
	.quad	.L771
	.quad	.L771
	.quad	.L771
	.quad	.L771
	.quad	.L771
	.quad	.L771
	.quad	.L771
	.quad	.L771
	.quad	.L771
	.quad	.L771
	.quad	.L771
	.quad	.L771
	.quad	.L770
	.quad	.L770
	.quad	.L771
	.quad	.L770
	.quad	.L772
	.quad	.L771
	.quad	.L771
	.quad	.L776
	.quad	.L778
	.quad	.L770
	.quad	.L770
	.quad	.L771
	.quad	.L771
	.quad	.L771
	.quad	.L774
	.text
.L772:
	cmpl	$14, 8(%r12)
	je	.L1644
.L778:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L1467:
	movq	%rax, %r12
.L770:
	movl	$37, %edi
	movl	%r14d, %esi
	movq	%r12, %rdx
.L1539:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1469
.L1644:
	movq	frame_pointer_rtx(%rip), %rdi
.L1529:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1467
	.p2align 6,,7
.L776:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	copy_to_reg
	jmp	.L1467
.L771:
	xorl	%eax, %eax
	call	rtx_alloc
	movzbl	3(%rax), %r11d
	movb	%bl, 2(%rax)
	movzwl	(%rax), %edx
	movzbl	3(%r12), %ebx
	movq	%rax, %r13
	andb	$-17, %r11b
	movzwl	%dx, %r15d 
	andb	$16, %bl
	orb	%bl, %r11b
	movb	%r11b, 3(%rax)
	andb	$-9, %r11b
	movzbl	3(%r12), %esi
	andb	$8, %sil
	orb	%sil, %r11b
	movb	%r11b, 3(%rax)
	andb	$-5, %r11b
	movzbl	3(%r12), %r9d
	andb	$4, %r9b
	orb	%r9b, %r11b
	movb	%r11b, 3(%rax)
	xorl	%eax, %eax
	movl	$0, -532(%rbp)
	cmpl	rtx_length(,%r15,4), %eax
	movq	rtx_format(,%r15,8), %r10
	movq	%r10, -528(%rbp)
	jge	.L1363
.L807:
	movq	-528(%rbp), %r8
	movsbl	(%r8),%eax
	incq	%r8
	movq	%r8, -528(%rbp)
	cmpl	$101, %eax
	je	.L792
	cmpl	$101, %eax
	jg	.L805
	cmpl	$48, %eax
	je	.L788
	cmpl	$69, %eax
	jne	.L1316
	movslq	-532(%rbp),%r8
	leaq	8(%r12), %rax
	movq	%rax, -224(%rbp)
	leaq	0(,%r8,8), %rbx
	leaq	(%rax,%rbx), %r9
	leaq	8(%rbx,%r13), %r15
	movq	(%r9), %rsi
	movq	%rsi, (%r15)
	movq	(%r9), %rax
	testq	%rax, %rax
	je	.L1424
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L1646
.L1424:
	movzwl	(%r13), %edx
.L788:
	incl	-532(%rbp)
	movzwl	%dx, %r8d 
	movl	-532(%rbp), %ebx
	cmpl	rtx_length(,%r8,4), %ebx
	jl	.L807
.L1363:
	movq	%r13, %r12
	jmp	.L770
.L1646:
	xorl	%eax, %eax
	call	rtvec_alloc
	xorl	%r8d, %r8d
	movq	%rax, (%r15)
	cmpl	(%rax), %r8d
	jae	.L1424
	movq	%rbx, -232(%rbp)
.L800:
	movq	-224(%rbp), %rdi
	movq	-232(%rbp), %r11
	movslq	%r8d,%rdx
	salq	$3, %rdx
	movq	(%r15), %rcx
	xorl	%eax, %eax
	movq	(%rdi,%r11), %r10
	addq	$8, %rcx
	leaq	(%rcx,%rdx), %rbx
	addq	$8, %r10
	movq	(%r10,%rdx), %rdi
	movl	%r8d, -624(%rbp)
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	(%r15), %rbx
	movl	-624(%rbp), %r8d
	incl	%r8d
	cmpl	(%rbx), %r8d
	jb	.L800
	jmp	.L1424
	.p2align 6,,7
.L805:
	cmpl	$115, %eax
	je	.L802
	cmpl	$115, %eax
	jg	.L806
	cmpl	$105, %eax
	jne	.L1316
	movslq	-532(%rbp),%r15
	salq	$3, %r15
	movl	8(%r12,%r15), %r9d
	movl	%r9d, 8(%r13,%r15)
	jmp	.L1424
.L806:
	cmpl	$117, %eax
	jne	.L1316
	movslq	-532(%rbp),%rdi
	salq	$3, %rdi
	movq	8(%rdi,%r12), %r11
	movslq	8(%r11),%r10
	salq	$3, %r10
	addq	insn_map(%rip), %r10
	movq	(%r10), %rcx
	movq	%rcx, 8(%rdi,%r13)
	jmp	.L1424
.L802:
	movslq	-532(%rbp),%rsi
	salq	$3, %rsi
	movq	8(%rsi,%r12), %rax
	movq	%rax, 8(%rsi,%r13)
	jmp	.L1424
.L792:
	movslq	-532(%rbp),%rdx
	xorl	%eax, %eax
	salq	$3, %rdx
	movq	8(%rdx,%r12), %rdi
	leaq	8(%rdx,%r13), %r15
	call	copy_rtx_and_substitute
	movq	%rax, (%r15)
	jmp	.L1424
.L774:
	movq	8(%r12), %rax
	cmpw	$34, (%rax)
	jne	.L771
	cmpl	$14, 8(%rax)
	jne	.L771
	movq	%r12, %rdi
	jmp	.L1529
	.p2align 6,,7
.L768:
	cmpw	$44, (%r12)
	je	.L1649
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L841:
	movq	-208(%rbp), %rdi
.L1540:
	movq	%rax, %rdx
	movl	%r14d, %esi
	xorl	%eax, %eax
	call	change_address
	jmp	.L1469
.L1649:
	movq	8(%r12), %rdx
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L1425
	movq	16(%r12), %rax
	cmpq	%rdi, %rax
	je	.L1650
	xorl	%eax, %eax
	movq	%r12, %rsi
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L831
	movq	8(%r12), %rdi
	cmpw	$30, (%rdi)
	je	.L1651
	movq	16(%r12), %rcx
	cmpw	$30, (%rcx)
	je	.L1531
.L839:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r12), %rdi
	movq	%rax, %r13
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%r13, %rdx
	movl	$44, %edi
	movzbl	2(%r12), %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L841
.L1531:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	16(%r12), %rax
.L1468:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L841
.L1651:
	movq	16(%r12), %rdi
.L1530:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	8(%r12), %rax
	jmp	.L1468
	.p2align 6,,7
.L831:
	movq	16(%r12), %rax
	cmpw	$30, (%rax)
	je	.L1653
	movq	8(%r12), %rdi
	cmpw	$30, (%rdi)
	jne	.L839
	movq	%rax, %rdi
	jmp	.L1530
.L1653:
	movq	8(%r12), %rdi
	jmp	.L1531
	.p2align 6,,7
.L1650:
	cmpq	%rdi, %rdx
	je	.L812
	cmpq	arg_pointer_rtx(%rip), %rdx
	je	.L812
	movq	%rdx, %r12
.L813:
	cmpw	$30, (%r12)
	je	.L1655
.L814:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	fp_delta(%rip), %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	plus_constant
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L841
.L1655:
	cmpq	arg_pointer_rtx(%rip), %rdi
	movl	8(%r12), %ebx
	je	.L1656
.L815:
	movl	%ebx, %edx
	movl	$30, %edi
	movl	$4, %esi
	addl	fp_delta(%rip), %edx
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address_p
	testl	%eax, %eax
	jne	.L814
	movq	inline_fp_rtx(%rip), %rdi
	movl	%ebx, %esi
.L1587:
	xorl	%eax, %eax
	call	plus_constant
.L1586:
	movl	$37, %edi
	movl	%r14d, %esi
	movq	%rax, %rdx
	jmp	.L1539
.L1656:
	movl	first_parm_offset(%rip), %r9d
	cmpl	%r9d, %ebx
	movl	%r9d, %edi
	jl	.L815
	cmpl	$-1, %ebx
	leal	3(%rbx), %r10d
	movl	%ebx, %r8d
	cmovle	%r10d, %r8d
	movq	parm_map(%rip), %r13
	movl	%ebx, %esi
	sarl	$2, %r8d
	leal	0(,%r8,4), %r12d
	movslq	%r8d,%rax
	subl	%r12d, %esi
	movq	%r13, %rdx
	cmpq	$0, (%r13,%rax,8)
	jne	.L1366
	leal	3(%r9), %ecx
.L823:
	decl	%r8d
	movl	%edi, %r11d
	cmpl	$-1, %edi
	cmovle	%ecx, %r11d
	sarl	$2, %r11d
	cmpl	%r11d, %r8d
	jl	.L1316
	movslq	%r8d,%rax
	addl	$4, %esi
	cmpq	$0, (%rdx,%rax,8)
	je	.L823
.L1366:
	movq	(%rdx,%rax,8), %rbx
	movzbl	2(%rbx), %edi
	movzbl	%dil, %r15d
	movslq	%r15d,%rax
	movl	mode_size(,%rax,4), %ecx
	cmpl	$3, %ecx
	leal	-4(%rcx,%rsi), %r9d
	cmovle	%r9d, %esi
	cmpl	%r14d, %r15d
	je	.L725
	testb	%dil, %dil
	je	.L725
	movzwl	(%rbx), %eax
	cmpw	$37, %ax
	je	.L1657
	cmpw	$34, %ax
	jne	.L1316
	movslq	%r14d,%rdx
	addl	mode_size(,%rdx,4), %esi
	cmpl	%ecx, %esi
	jne	.L1316
	movl	$35, %edi
	movl	%r14d, %esi
	movq	%rbx, %rdx
	jmp	.L1532
.L1657:
	movq	8(%rbx), %rdi
	xorl	%eax, %eax
	call	plus_constant
	movq	%rbx, %rdi
	jmp	.L1540
	.p2align 6,,7
.L812:
	movq	%rdx, %rdi
	movq	%rax, %r12
	jmp	.L813
.L1425:
	movq	16(%r12), %rax
	jmp	.L812
.L1643:
	movq	stack_pointer_rtx(%rip), %rdi
	cmpq	%rdi, 8(%r12)
	jne	.L767
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	jmp	.L1586
	.p2align 6,,7
.L766:
	movl	fp_delta(%rip), %esi
	jmp	.L1587
.L735:
	movl	$38, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	-208(%rbp), %rcx
	movb	%r14b, 2(%rax)
	movq	%rax, %rbx
	movq	8(%rcx), %r9
	movslq	32(%r9),%r11
	salq	$3, %r11
	addq	label_map(%rip), %r11
	movq	(%r11), %r10
	movq	%r10, 8(%rax)
	jmp	.L725
.L746:
	movq	-208(%rbp), %rdx
	movq	frame_pointer_rtx(%rip), %rdi
	movq	8(%rdx), %rax
	cmpq	%rdi, %rax
	je	.L1421
	movq	16(%rdx), %rdx
	cmpq	%rdi, %rdx
	je	.L1658
	movq	-208(%rbp), %rsi
	xorl	%eax, %eax
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L756
	movq	-208(%rbp), %rsi
	xorl	%eax, %eax
	movl	%r14d, %edi
	call	memory_address_p
	testl	%eax, %eax
	je	.L756
	movq	-208(%rbp), %rsi
	movq	8(%rsi), %rdi
	cmpw	$30, (%rdi)
	je	.L1659
	movq	-208(%rbp), %rax
	movq	16(%rax), %rdx
	cmpw	$30, (%rdx)
	je	.L1660
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	-208(%rbp), %r9
	movq	%rax, %r12
	xorl	%eax, %eax
	movq	16(%r9), %rdi
	call	copy_rtx_and_substitute
	movq	%r12, %rdx
	movl	$44, %edi
	movq	-208(%rbp), %r11
	movq	%rax, %rcx
	xorl	%eax, %eax
	movzbl	2(%r11), %esi
	call	gen_rtx
.L759:
	movq	%rax, %rsi
	movl	%r14d, %edi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L1469
.L1660:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	-208(%rbp), %r10
	movq	%rax, %rdi
	movq	16(%r10), %rax
.L1466:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L759
.L1659:
	movq	16(%rsi), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	-208(%rbp), %r13
	movq	%rax, %rdi
	movq	8(%r13), %rax
	jmp	.L1466
.L756:
	movq	-208(%rbp), %rbx
	xorl	%eax, %eax
	movq	8(%rbx), %rdi
	call	copy_rtx_and_substitute
	movq	-208(%rbp), %rsi
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	16(%rsi), %rdi
	call	copy_rtx_and_substitute
	movl	$44, %edi
	movq	-208(%rbp), %r14
	movq	%rax, %rcx
	movzbl	2(%r14), %esi
	jmp	.L1585
.L1658:
	cmpq	%rdi, %rax
	je	.L750
	cmpq	arg_pointer_rtx(%rip), %rax
	je	.L750
	movq	%rax, %rdi
.L751:
	cmpw	$30, (%rdi)
	je	.L1662
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	%r14d, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	%r14d, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	force_reg
	movq	%rax, %rdi
	jmp	.L1533
.L1662:
	movl	8(%rdi), %edx
	testl	%edx, %edx
	jle	.L753
	cmpl	$-1, %edx
	leal	3(%rdx), %r15d
	cmovle	%r15d, %edx
	sarl	$2, %edx
	movslq	%edx,%r12
	salq	$3, %r12
	addq	parm_map(%rip), %r12
	movq	(%r12), %rdi
	movq	8(%rdi), %rbx
	jmp	.L725
.L753:
	addl	fp_delta(%rip), %edx
	movl	$30, %edi
	movl	$4, %esi
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	%r14d, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	jmp	.L1536
	.p2align 6,,7
.L750:
	movq	%rdx, %rdi
	jmp	.L751
.L1421:
	movq	-208(%rbp), %rcx
	movq	16(%rcx), %rdx
	jmp	.L750
	.p2align 6,,7
.L1605:
	movq	-208(%rbp), %rcx
	movq	cc0_rtx(%rip), %rdx
	cmpq	%rdx, 8(%rcx)
	jne	.L484
	movq	-472(%rbp), %r8
	movq	32(%r8), %rbx
	movq	16(%rbx), %rsi
	xorl	%ebx, %ebx
	testq	%rsi, %rsi
	movq	%rsi, -160(%rbp)
	je	.L486
	movq	-160(%rbp), %r12
	movq	-160(%rbp), %r10
	movzwl	(%r12), %r13d
	movl	%r13d, -164(%rbp)
	movzbl	2(%r10), %eax
	movl	%eax, -168(%rbp)
	movl	%r13d, %eax
	subl	$17, %eax
	cmpl	$27, %eax
	ja	.L487
	mov	%eax, %r11d
	jmp	*.L604(,%r11,8)
	.section	.rodata
	.align 8
	.align 4
.L604:
	.quad	.L495
	.quad	.L487
	.quad	.L487
	.quad	.L487
	.quad	.L487
	.quad	.L502
	.quad	.L487
	.quad	.L487
	.quad	.L487
	.quad	.L487
	.quad	.L487
	.quad	.L504
	.quad	.L1316
	.quad	.L501
	.quad	.L501
	.quad	.L487
	.quad	.L501
	.quad	.L488
	.quad	.L487
	.quad	.L487
	.quad	.L525
	.quad	.L496
	.quad	.L501
	.quad	.L501
	.quad	.L487
	.quad	.L487
	.quad	.L487
	.quad	.L507
	.text
.L488:
	movq	-160(%rbp), %rsi
	movl	8(%rsi), %eax
	cmpl	$55, %eax
	jg	.L489
	testb	$64, 3(%rsi)
	je	.L490
	movq	inline_target(%rip), %rdx
	testq	%rdx, %rdx
	je	.L1316
	movzbl	2(%rdx), %edi
	movq	%rdx, %rbx
	cmpl	%edi, -168(%rbp)
	je	.L486
	movl	-168(%rbp), %esi
	movl	$35, %edi
.L1501:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	call	gen_rtx
.L1464:
	movq	%rax, %rbx
.L486:
	movzwl	(%rbx), %ecx
	leal	-38(%rcx), %r12d
	cmpw	$1, %r12w
	jbe	.L630
	cmpw	$30, %cx
	je	.L630
	cmpw	$32, %cx
	je	.L630
.L629:
	xorl	%eax, %eax
.L717:
	movq	%rax, %rbx
	jmp	.L484
.L630:
	movq	-472(%rbp), %rdx
	movq	24(%rdx), %rax
	testq	%rax, %rax
	je	.L629
	movq	32(%rax), %rax
	cmpw	$25, (%rax)
	jne	.L629
	movq	pc_rtx(%rip), %r15
	cmpq	%r15, 8(%rax)
	jne	.L629
	movq	16(%rax), %rdi
	cmpw	$42, (%rdi)
	jne	.L629
	movq	8(%rdi), %r9
	movzwl	(%r9), %r11d
	movzwl	%r11w, %r13d 
	cmpl	$2, rtx_length(,%r13,4)
	jne	.L629
	movq	cc0_rtx(%rip), %r10
	cmpq	%r10, 8(%r9)
	je	.L1663
	movq	16(%r9), %r8
.L633:
	cmpq	%r10, %r8
	jne	.L629
	movq	8(%r9), %rsi
	movzwl	(%rsi), %edx
	leal	-38(%rdx), %r10d
	cmpw	$1, %r10w
	jbe	.L635
	cmpw	$30, %dx
	je	.L635
	cmpw	$32, %dx
	jne	.L629
.L635:
	testq	%rsi, %rsi
	je	.L629
.L632:
	xorl	%edx, %edx
	movq	16(%rdi), %r12
	movq	24(%rdi), %r13
	cmpw	$30, %cx
	movl	$1, %edi
	sete	%dl
	xorl	%ecx, %ecx
	cmpw	$30, (%rsi)
	sete	%cl
	testl	%edx, %edx
	je	.L637
	movl	8(%rbx), %edi
.L637:
	testl	%ecx, %ecx
	movl	$1, %r8d
	je	.L639
	movl	8(%rsi), %r8d
.L639:
	movzwl	%r11w, %eax
	subl	$67, %eax
	cmpl	$9, %eax
	ja	.L640
	mov	%eax, %r11d
	jmp	*.L706(,%r11,8)
	.section	.rodata
	.align 8
	.align 4
.L706:
	.quad	.L641
	.quad	.L650
	.quad	.L658
	.quad	.L664
	.quad	.L670
	.quad	.L676
	.quad	.L682
	.quad	.L688
	.quad	.L694
	.quad	.L700
	.text
.L641:
	testl	%edx, %edx
	je	.L642
	testl	%ecx, %ecx
	je	.L642
	cmpl	%r8d, %edi
	je	.L1510
.L1528:
	movq	%r12, %rdi
.L1465:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdx
.L644:
	testq	%rdx, %rdx
	je	.L629
	cmpw	$38, (%rdx)
	je	.L1665
	cmpq	pc_rtx(%rip), %rdx
	jne	.L1316
	movq	-472(%rbp), %r8
	movq	24(%r8), %rax
	jmp	.L717
.L1665:
	movq	-472(%rbp), %rsi
	movq	24(%rsi), %rcx
	testq	%rcx, %rcx
	je	.L1316
	cmpw	$17, (%rcx)
	je	.L715
.L714:
	movq	24(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L1316
	cmpw	$17, (%rcx)
	jne	.L714
.L715:
	movslq	32(%rcx),%r9
	movq	8(%rdx), %rbx
	salq	$3, %r9
	addq	label_map(%rip), %r9
	cmpq	%rbx, (%r9)
	je	.L1666
	movq	%rdx, %rdi
	xorl	%eax, %eax
	call	emit_jump
	movq	-472(%rbp), %rcx
	movq	24(%rcx), %rax
	jmp	.L717
.L1666:
	movq	16(%rcx), %rax
	jmp	.L717
.L1510:
	movq	%r13, %rdi
	jmp	.L1465
.L642:
	testl	%edi, %edi
	je	.L1528
	testl	%r8d, %r8d
	je	.L1528
	testl	%edx, %edx
	jne	.L640
	testl	%ecx, %ecx
	je	.L1667
.L640:
	xorl	%edx, %edx
	jmp	.L644
.L1667:
	xorl	%eax, %eax
	movq	%rbx, %rdi
	call	rtx_equal_p
	testl	%eax, %eax
	je	.L640
	jmp	.L1510
.L650:
	testl	%edx, %edx
	je	.L651
	testl	%ecx, %ecx
	je	.L651
	cmpl	%r8d, %edi
	je	.L1528
	jmp	.L1510
.L651:
	testl	%edi, %edi
	je	.L1510
	testl	%r8d, %r8d
	je	.L1510
	testl	%edx, %edx
	jne	.L640
	testl	%ecx, %ecx
	jne	.L640
	xorl	%eax, %eax
	movq	%rbx, %rdi
	call	rtx_equal_p
	testl	%eax, %eax
	je	.L640
	jmp	.L1528
.L658:
	testl	%edx, %edx
	je	.L689
	testl	%ecx, %ecx
	je	.L689
	cmpl	%r8d, %edi
	jge	.L1528
	jmp	.L1510
.L689:
	testl	%edi, %edi
	je	.L1510
	testl	%r8d, %r8d
	jne	.L640
	jmp	.L1528
.L664:
	testl	%edx, %edx
	je	.L689
	testl	%ecx, %ecx
	je	.L689
	cmpl	%r8d, %edi
	jg	.L1528
	jmp	.L1510
.L670:
	testl	%edx, %edx
	je	.L701
	testl	%ecx, %ecx
	je	.L701
	cmpl	%r8d, %edi
	jle	.L1528
	jmp	.L1510
.L701:
	testl	%edi, %edi
	je	.L1528
	testl	%r8d, %r8d
	jne	.L640
	jmp	.L1510
.L676:
	testl	%edx, %edx
	je	.L701
	testl	%ecx, %ecx
	je	.L701
	cmpl	%r8d, %edi
	jl	.L1528
	jmp	.L1510
.L682:
	testl	%edx, %edx
	je	.L689
	testl	%ecx, %ecx
	je	.L689
	cmpl	%r8d, %edi
	jae	.L1528
	jmp	.L1510
.L688:
	testl	%edx, %edx
	je	.L689
	testl	%ecx, %ecx
	je	.L689
	cmpl	%r8d, %edi
	ja	.L1528
	jmp	.L1510
.L694:
	testl	%edx, %edx
	je	.L701
	testl	%ecx, %ecx
	je	.L701
	cmpl	%r8d, %edi
	jbe	.L1528
	jmp	.L1510
.L700:
	testl	%edx, %edx
	je	.L701
	testl	%ecx, %ecx
	je	.L701
	cmpl	%r8d, %edi
	jb	.L1528
	jmp	.L1510
.L1663:
	movq	16(%r9), %r8
	movzwl	(%r8), %edx
	movq	%r8, %rsi
	leal	-38(%rdx), %r14d
	cmpw	$1, %r14w
	jbe	.L634
	cmpw	$30, %dx
	je	.L634
	cmpw	$32, %dx
	jne	.L633
.L634:
	testq	%rsi, %rsi
	jne	.L632
	jmp	.L633
	.p2align 6,,7
.L490:
	cmpl	$14, %eax
	je	.L1668
.L501:
	movq	-160(%rbp), %rbx
	jmp	.L486
.L1668:
	movq	-160(%rbp), %rdi
.L1502:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1464
.L489:
	movq	reg_map(%rip), %rdx
	cltq
	leaq	0(,%rax,8), %rbx
	cmpq	$0, (%rdx,%rbx)
	je	.L1669
.L494:
	movq	(%rdx,%rbx), %rbx
	jmp	.L486
.L1669:
	movl	-168(%rbp), %edi
	xorl	%eax, %eax
	call	gen_reg_rtx
	movq	reg_map(%rip), %rdx
	movq	%rax, (%rdx,%rbx)
	jmp	.L494
.L495:
	movq	-160(%rbp), %r15
	movslq	32(%r15),%r9
	salq	$3, %r9
	addq	label_map(%rip), %r9
	movq	(%r9), %rbx
	jmp	.L486
.L502:
	movq	-160(%rbp), %r13
	movq	32(%r13), %rbx
	cmpq	%rbx, orig_asm_operands_vector(%rip)
	je	.L1670
.L487:
	movl	-164(%rbp), %edi
	xorl	%eax, %eax
	call	rtx_alloc
	xorl	%r8d, %r8d
	movq	-160(%rbp), %r13
	movzbl	-168(%rbp), %r11d
	movzbl	3(%rax), %ecx
	movq	%rax, %r12
	movb	%r11b, 2(%rax)
	andb	$-17, %cl
	movzbl	3(%r13), %r10d
	andb	$16, %r10b
	orb	%r10b, %cl
	movb	%cl, 3(%rax)
	andb	$-9, %cl
	movzbl	3(%r13), %esi
	andb	$8, %sil
	orb	%sil, %cl
	movb	%cl, 3(%rax)
	movzwl	(%r12), %edx
	andb	$-5, %cl
	movzbl	3(%r13), %eax
	movzwl	%dx, %edi 
	andb	$4, %al
	orb	%al, %cl
	movb	%cl, 3(%r12)
	cmpl	rtx_length(,%rdi,4), %r8d
	movl	$0, -520(%rbp)
	movq	rtx_format(,%rdi,8), %r14
	jge	.L1359
.L627:
	movsbl	(%r14),%eax
	incq	%r14
	cmpl	$101, %eax
	je	.L612
	cmpl	$101, %eax
	jg	.L625
	cmpl	$48, %eax
	je	.L608
	cmpl	$69, %eax
	jne	.L1316
	movslq	-520(%rbp),%r11
	movq	-160(%rbp), %r10
	addq	$8, %r10
	leaq	0(,%r11,8), %rbx
	movq	%r10, -192(%rbp)
	leaq	(%r10,%rbx), %rcx
	leaq	8(%rbx,%r12), %r13
	movq	(%rcx), %rsi
	movq	%rsi, (%r13)
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L1419
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L1672
.L1419:
	movzwl	(%r12), %edx
.L608:
	incl	-520(%rbp)
	movzwl	%dx, %r9d 
	movl	-520(%rbp), %r8d
	cmpl	rtx_length(,%r9,4), %r8d
	jl	.L627
.L1359:
	cmpl	$22, -164(%rbp)
	je	.L1673
.L628:
	movq	%r12, %rbx
	jmp	.L486
.L1673:
	cmpq	$0, orig_asm_operands_vector(%rip)
	jne	.L628
	movq	-160(%rbp), %rax
	movq	32(%r12), %r14
	movq	32(%rax), %rdi
	movq	%r14, copy_asm_operands_vector(%rip)
	movq	%rdi, orig_asm_operands_vector(%rip)
	jmp	.L628
.L1672:
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	call	rtvec_alloc
	movq	%rax, (%r13)
	cmpl	(%rax), %r15d
	jae	.L1419
	movq	%rbx, -200(%rbp)
.L620:
	movq	-200(%rbp), %rax
	movq	-192(%rbp), %rdi
	movslq	%r15d,%rdx
	salq	$3, %rdx
	movq	(%r13), %rcx
	incl	%r15d
	movq	(%rdi,%rax), %r8
	xorl	%eax, %eax
	addq	$8, %rcx
	leaq	(%rcx,%rdx), %rbx
	addq	$8, %r8
	movq	(%r8,%rdx), %rdi
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	(%r13), %r9
	cmpl	(%r9), %r15d
	jb	.L620
	jmp	.L1419
	.p2align 6,,7
.L625:
	cmpl	$115, %eax
	je	.L622
	cmpl	$115, %eax
	jg	.L626
	cmpl	$105, %eax
	jne	.L1316
	movslq	-520(%rbp),%r15
	movq	-160(%rbp), %r13
	salq	$3, %r15
	movl	8(%r13,%r15), %ebx
	movl	%ebx, 8(%r12,%r15)
	jmp	.L1419
.L626:
	cmpl	$117, %eax
	jne	.L1316
	movslq	-520(%rbp),%rbx
	movq	-160(%rbp), %rax
	salq	$3, %rbx
	movq	8(%rbx,%rax), %r13
	movslq	8(%r13),%r8
	salq	$3, %r8
	addq	insn_map(%rip), %r8
	movq	(%r8), %rdi
	movq	%rdi, 8(%rbx,%r12)
	jmp	.L1419
.L622:
	movslq	-520(%rbp),%rsi
	movq	-160(%rbp), %r11
	salq	$3, %rsi
	movq	8(%rsi,%r11), %r10
	movq	%r10, 8(%rsi,%r12)
	jmp	.L1419
.L612:
	movslq	-520(%rbp),%r9
	movq	-160(%rbp), %rdx
	xorl	%eax, %eax
	salq	$3, %r9
	movq	8(%r9,%rdx), %rdi
	leaq	8(%r9,%r12), %r15
	call	copy_rtx_and_substitute
	movq	%rax, (%r15)
	jmp	.L1419
.L1670:
	movl	$22, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	copy_asm_operands_vector(%rip), %r11
	movq	-160(%rbp), %r12
	movq	%rax, %rbx
	movq	8(%r12), %r9
	movq	%r9, 8(%rax)
	movq	16(%r12), %rdi
	movq	%rdi, 16(%rax)
	movl	24(%r12), %eax
	movq	%r11, 32(%rbx)
	movl	%eax, 24(%rbx)
	movq	40(%r12), %r10
	movq	%r10, 40(%rbx)
	jmp	.L486
.L504:
	movl	optimize(%rip), %eax
	testl	%eax, %eax
	je	.L506
	movl	flag_no_function_cse(%rip), %r15d
	testl	%r15d, %r15d
	je	.L487
.L506:
	movq	-160(%rbp), %rbx
	xorl	%eax, %eax
	movq	8(%rbx), %rsi
	movq	8(%rsi), %rdi
	call	copy_rtx_and_substitute
	movl	$37, %edi
	movq	-160(%rbp), %r8
	movq	%rax, %rdx
	xorl	%eax, %eax
	movq	8(%r8), %rcx
	movzbl	2(%rcx), %esi
	call	gen_rtx
	movq	-160(%rbp), %rdx
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	16(%rdx), %rdi
	call	copy_rtx_and_substitute
	movl	$28, %edi
	movq	-160(%rbp), %r14
	movq	%rax, %rcx
	movzbl	2(%r14), %esi
.L1581:
	movq	%rbx, %rdx
.L1505:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1464
.L525:
	movq	-160(%rbp), %r10
	movq	frame_pointer_rtx(%rip), %rdi
	movq	8(%r10), %r12
	cmpq	%rdi, %r12
	je	.L527
	cmpq	arg_pointer_rtx(%rip), %r12
	je	.L527
	cmpw	$63, (%r12)
	je	.L1676
.L528:
	movl	-168(%rbp), %edi
	xorl	%eax, %eax
	movq	%r12, %rsi
	call	memory_address_p
	testl	%eax, %eax
	jne	.L529
	movzwl	(%r12), %edi
	movzbl	2(%r12), %ebx
	leal	-17(%rdi), %eax
	cmpl	$27, %eax
	ja	.L532
	mov	%eax, %r9d
	jmp	*.L545(,%r9,8)
	.section	.rodata
	.align 8
	.align 4
.L545:
	.quad	.L539
	.quad	.L532
	.quad	.L532
	.quad	.L532
	.quad	.L532
	.quad	.L532
	.quad	.L532
	.quad	.L532
	.quad	.L532
	.quad	.L532
	.quad	.L532
	.quad	.L532
	.quad	.L532
	.quad	.L531
	.quad	.L531
	.quad	.L532
	.quad	.L531
	.quad	.L533
	.quad	.L532
	.quad	.L532
	.quad	.L537
	.quad	.L539
	.quad	.L531
	.quad	.L531
	.quad	.L532
	.quad	.L532
	.quad	.L532
	.quad	.L535
	.text
.L533:
	cmpl	$14, 8(%r12)
	je	.L1677
.L539:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L1462:
	movq	%rax, %r12
.L531:
	movl	-168(%rbp), %esi
	movl	$37, %edi
	movq	%r12, %rdx
.L1508:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1464
.L1677:
	movq	frame_pointer_rtx(%rip), %rdi
.L1498:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1462
.L537:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	copy_to_reg
	jmp	.L1462
	.p2align 6,,7
.L532:
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	call	rtx_alloc
	movzbl	3(%rax), %r14d
	movb	%bl, 2(%rax)
	movzwl	(%rax), %edx
	movzbl	3(%r12), %esi
	movq	%rax, %r13
	andb	$-17, %r14b
	movzwl	%dx, %edi 
	andb	$16, %sil
	orb	%sil, %r14b
	movb	%r14b, 3(%rax)
	andb	$-9, %r14b
	movzbl	3(%r12), %r8d
	andb	$8, %r8b
	orb	%r8b, %r14b
	movb	%r14b, 3(%rax)
	andb	$-5, %r14b
	movzbl	3(%r12), %ecx
	andb	$4, %cl
	orb	%cl, %r14b
	movb	%r14b, 3(%rax)
	cmpl	rtx_length(,%rdi,4), %r15d
	movl	$0, -516(%rbp)
	movq	rtx_format(,%rdi,8), %rax
	movq	%rax, -512(%rbp)
	jge	.L1354
.L568:
	movq	-512(%rbp), %rbx
	movsbl	(%rbx),%eax
	incq	%rbx
	movq	%rbx, -512(%rbp)
	cmpl	$101, %eax
	je	.L553
	cmpl	$101, %eax
	jg	.L566
	cmpl	$48, %eax
	je	.L549
	cmpl	$69, %eax
	jne	.L1316
	movslq	-516(%rbp),%r14
	leaq	8(%r12), %rax
	movq	%rax, -176(%rbp)
	leaq	0(,%r14,8), %rbx
	leaq	(%rax,%rbx), %rcx
	leaq	8(%rbx,%r13), %r14
	movq	(%rcx), %r8
	movq	%r8, (%r14)
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L1415
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L1679
.L1415:
	movzwl	(%r13), %edx
.L549:
	incl	-516(%rbp)
	movzwl	%dx, %r14d 
	movl	-516(%rbp), %eax
	cmpl	rtx_length(,%r14,4), %eax
	jl	.L568
.L1354:
	movq	%r13, %r12
	jmp	.L531
.L1679:
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	call	rtvec_alloc
	movq	%rax, (%r14)
	cmpl	(%rax), %r15d
	jae	.L1415
	movq	%rbx, -184(%rbp)
.L561:
	movq	-184(%rbp), %r9
	movq	-176(%rbp), %r11
	movslq	%r15d,%rdx
	movq	(%r14), %rdi
	salq	$3, %rdx
	xorl	%eax, %eax
	incl	%r15d
	movq	(%r11,%r9), %r10
	addq	$8, %rdi
	leaq	(%rdi,%rdx), %rbx
	addq	$8, %r10
	movq	(%r10,%rdx), %rdi
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	(%r14), %rsi
	cmpl	(%rsi), %r15d
	jb	.L561
	jmp	.L1415
	.p2align 6,,7
.L566:
	cmpl	$115, %eax
	je	.L563
	cmpl	$115, %eax
	jg	.L567
	cmpl	$105, %eax
	jne	.L1316
	movslq	-516(%rbp),%rbx
	salq	$3, %rbx
	movl	8(%r12,%rbx), %r15d
	movl	%r15d, 8(%r13,%rbx)
	jmp	.L1415
.L567:
	cmpl	$117, %eax
	jne	.L1316
	movslq	-516(%rbp),%r10
	salq	$3, %r10
	movq	8(%r10,%r12), %rdi
	movslq	8(%rdi),%r9
	salq	$3, %r9
	addq	insn_map(%rip), %r9
	movq	(%r9), %r11
	movq	%r11, 8(%r10,%r13)
	jmp	.L1415
.L563:
	movslq	-516(%rbp),%rcx
	salq	$3, %rcx
	movq	8(%rcx,%r12), %r8
	movq	%r8, 8(%rcx,%r13)
	jmp	.L1415
	.p2align 6,,7
.L553:
	movslq	-516(%rbp),%rdx
	xorl	%eax, %eax
	salq	$3, %rdx
	movq	8(%rdx,%r12), %rdi
	leaq	8(%rdx,%r13), %r15
	call	copy_rtx_and_substitute
	movq	%rax, (%r15)
	jmp	.L1415
.L535:
	movq	8(%r12), %rax
	cmpw	$34, (%rax)
	jne	.L532
	cmpl	$14, 8(%rax)
	jne	.L532
	movq	%r12, %rdi
	jmp	.L1498
	.p2align 6,,7
.L529:
	cmpw	$44, (%r12)
	je	.L1682
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L602:
	movq	-160(%rbp), %rdi
.L1509:
	movl	-168(%rbp), %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	change_address
	jmp	.L1464
.L1682:
	movq	8(%r12), %rdx
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L1416
	movq	16(%r12), %rax
	cmpq	%rdi, %rax
	je	.L1683
	xorl	%eax, %eax
	movq	%r12, %rsi
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L592
	movq	8(%r12), %rdi
	cmpw	$30, (%rdi)
	je	.L1684
	movq	16(%r12), %rbx
	cmpw	$30, (%rbx)
	je	.L1500
.L600:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r12), %rdi
	movq	%rax, %r14
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%r14, %rdx
	movl	$44, %edi
	movzbl	2(%r12), %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L602
.L1500:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	16(%r12), %rax
.L1463:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L602
.L1684:
	movq	16(%r12), %rdi
.L1499:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	8(%r12), %rax
	jmp	.L1463
.L592:
	movq	16(%r12), %rax
	cmpw	$30, (%rax)
	je	.L1686
	movq	8(%r12), %rdi
	cmpw	$30, (%rdi)
	jne	.L600
	movq	%rax, %rdi
	jmp	.L1499
.L1686:
	movq	8(%r12), %rdi
	jmp	.L1500
.L1683:
	cmpq	%rdi, %rdx
	je	.L573
	cmpq	arg_pointer_rtx(%rip), %rdx
	je	.L573
	movq	%rdx, %r12
.L574:
	cmpw	$30, (%r12)
	je	.L1688
.L575:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	fp_delta(%rip), %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	plus_constant
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L602
.L1688:
	cmpq	arg_pointer_rtx(%rip), %rdi
	movl	8(%r12), %ebx
	je	.L1689
.L576:
	movl	%ebx, %edx
	movl	$30, %edi
	movl	$4, %esi
	addl	fp_delta(%rip), %edx
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address_p
	testl	%eax, %eax
	jne	.L575
	movq	inline_fp_rtx(%rip), %rdi
	movl	%ebx, %esi
.L1583:
	xorl	%eax, %eax
	call	plus_constant
.L1582:
	movl	$37, %edi
	movl	-168(%rbp), %esi
	movq	%rax, %rdx
	jmp	.L1508
.L1689:
	movl	first_parm_offset(%rip), %r9d
	cmpl	%r9d, %ebx
	movl	%r9d, %edi
	jl	.L576
	cmpl	$-1, %ebx
	leal	3(%rbx), %esi
	movl	%ebx, %r8d
	cmovle	%esi, %r8d
	movq	parm_map(%rip), %r12
	movl	%ebx, %esi
	sarl	$2, %r8d
	leal	0(,%r8,4), %r13d
	movslq	%r8d,%rax
	subl	%r13d, %esi
	movq	%r12, %rdx
	cmpq	$0, (%r12,%rax,8)
	jne	.L1357
	leal	3(%r9), %ecx
.L584:
	decl	%r8d
	movl	%edi, %r10d
	cmpl	$-1, %edi
	cmovle	%ecx, %r10d
	sarl	$2, %r10d
	cmpl	%r10d, %r8d
	jl	.L1316
	movslq	%r8d,%rax
	addl	$4, %esi
	cmpq	$0, (%rdx,%rax,8)
	je	.L584
.L1357:
	movq	(%rdx,%rax,8), %rbx
	movzbl	2(%rbx), %edi
	movzbl	%dil, %r11d
	movslq	%r11d,%r15
	movl	mode_size(,%r15,4), %ecx
	cmpl	$3, %ecx
	leal	-4(%rcx,%rsi), %r9d
	cmovle	%r9d, %esi
	cmpl	-168(%rbp), %r11d
	je	.L486
	testb	%dil, %dil
	je	.L486
	movzwl	(%rbx), %eax
	cmpw	$37, %ax
	je	.L1690
	cmpw	$34, %ax
	jne	.L1316
	movslq	-168(%rbp),%rdx
	addl	mode_size(,%rdx,4), %esi
	cmpl	%ecx, %esi
	jne	.L1316
	movl	$35, %edi
	movl	-168(%rbp), %esi
	movq	%rbx, %rdx
	jmp	.L1501
.L1690:
	movq	8(%rbx), %rdi
	xorl	%eax, %eax
	call	plus_constant
	movq	%rbx, %rdi
	jmp	.L1509
.L573:
	movq	%rdx, %rdi
	movq	%rax, %r12
	jmp	.L574
.L1416:
	movq	16(%r12), %rax
	jmp	.L573
	.p2align 6,,7
.L1676:
	movq	stack_pointer_rtx(%rip), %r11
	cmpq	%r11, 8(%r12)
	jne	.L528
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	jmp	.L1582
	.p2align 6,,7
.L527:
	movl	fp_delta(%rip), %esi
	jmp	.L1583
.L496:
	movl	$38, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	-160(%rbp), %r8
	movzbl	-168(%rbp), %esi
	movq	%rax, %rbx
	movb	%sil, 2(%rax)
	movq	8(%r8), %rcx
	movslq	32(%rcx),%rdx
	salq	$3, %rdx
	addq	label_map(%rip), %rdx
	movq	(%rdx), %r14
	movq	%r14, 8(%rax)
	jmp	.L486
.L507:
	movq	-160(%rbp), %rdx
	movq	frame_pointer_rtx(%rip), %rdi
	movq	8(%rdx), %rax
	cmpq	%rdi, %rax
	je	.L1412
	movq	16(%rdx), %rdx
	cmpq	%rdi, %rdx
	je	.L1691
	movq	-160(%rbp), %rsi
	xorl	%eax, %eax
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L517
	movl	-168(%rbp), %edi
	movq	-160(%rbp), %rsi
	xorl	%eax, %eax
	call	memory_address_p
	testl	%eax, %eax
	je	.L517
	movq	-160(%rbp), %rsi
	movq	8(%rsi), %rdi
	cmpw	$30, (%rdi)
	je	.L1692
	movq	-160(%rbp), %rax
	movq	16(%rax), %r15
	cmpw	$30, (%r15)
	je	.L1693
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	-160(%rbp), %rcx
	movq	%rax, %r13
	xorl	%eax, %eax
	movq	16(%rcx), %rdi
	call	copy_rtx_and_substitute
	movl	$44, %edi
	movq	-160(%rbp), %rdx
	movq	%rax, %rcx
	xorl	%eax, %eax
	movzbl	2(%rdx), %esi
	movq	%r13, %rdx
	call	gen_rtx
.L520:
	movl	-168(%rbp), %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L1464
.L1693:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	-160(%rbp), %r14
	movq	%rax, %rdi
	movq	16(%r14), %rax
.L1461:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L520
.L1692:
	movq	16(%rsi), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	-160(%rbp), %r9
	movq	%rax, %rdi
	movq	8(%r9), %rax
	jmp	.L1461
	.p2align 6,,7
.L517:
	movq	-160(%rbp), %rbx
	xorl	%eax, %eax
	movq	8(%rbx), %rdi
	call	copy_rtx_and_substitute
	movq	-160(%rbp), %rsi
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	16(%rsi), %rdi
	call	copy_rtx_and_substitute
	movl	$44, %edi
	movq	-160(%rbp), %r8
	movq	%rax, %rcx
	movzbl	2(%r8), %esi
	jmp	.L1581
.L1691:
	cmpq	%rdi, %rax
	je	.L511
	cmpq	arg_pointer_rtx(%rip), %rax
	je	.L511
	movq	%rax, %rdi
.L512:
	cmpw	$30, (%rdi)
	je	.L1695
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	-168(%rbp), %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	-168(%rbp), %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	force_reg
	movq	%rax, %rdi
	jmp	.L1502
.L1695:
	movl	8(%rdi), %edx
	testl	%edx, %edx
	jle	.L514
	cmpl	$-1, %edx
	leal	3(%rdx), %edi
	cmovle	%edi, %edx
	sarl	$2, %edx
	movslq	%edx,%r11
	salq	$3, %r11
	addq	parm_map(%rip), %r11
	movq	(%r11), %r12
	movq	8(%r12), %rbx
	jmp	.L486
.L514:
	addl	fp_delta(%rip), %edx
	movl	$30, %edi
	movl	$4, %esi
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	-168(%rbp), %esi
	movq	%rax, %rcx
	movl	$44, %edi
	jmp	.L1505
	.p2align 6,,7
.L511:
	movq	%rdx, %rdi
	jmp	.L512
.L1412:
	movq	-160(%rbp), %r10
	movq	16(%r10), %rdx
	jmp	.L511
	.p2align 6,,7
.L1604:
	movq	-208(%rbp), %r14
	movq	8(%r14), %r15
	movl	(%r15), %eax
	andl	$1073807359, %eax
	cmpl	$1073741858, %eax
	jne	.L483
	jmp	.L332
.L1603:
	movq	-208(%rbp), %r11
	movq	-464(%rbp), %rsi
	xorl	%eax, %eax
	movq	8(%r11), %rdi
	call	rtx_equal_p
	testl	%eax, %eax
	jne	.L1696
	movq	-208(%rbp), %rdi
	movzwl	(%rdi), %edx
	jmp	.L481
.L1696:
	movl	$25, %edi
	xorl	%esi, %esi
	movq	inline_target(%rip), %rdx
.L1565:
	movq	-464(%rbp), %rcx
	xorl	%eax, %eax
	call	gen_rtx
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	emit_insn
	movq	%rax, -112(%rbp)
	orb	$64, 3(%rax)
	.p2align 4,,7
.L1480:
	movq	$0, -464(%rbp)
	jmp	.L332
.L1602:
	movq	stack_pointer_rtx(%rip), %r15
	cmpq	%r15, 8(%rax)
	je	.L334
	movq	16(%rax), %rdi
	movq	-464(%rbp), %rsi
	xorl	%eax, %eax
	call	rtx_equal_p
	testl	%eax, %eax
	je	.L1402
	movq	-208(%rbp), %r10
	xorl	%ebx, %ebx
	movq	8(%r10), %r13
	testq	%r13, %r13
	je	.L338
	movzwl	(%r13), %r11d
	movl	%r11d, -116(%rbp)
	movl	%r11d, %eax
	movzbl	2(%r13), %r12d
	subl	$17, %eax
	cmpl	$27, %eax
	movl	%r12d, -120(%rbp)
	ja	.L339
	mov	%eax, %edi
	jmp	*.L456(,%rdi,8)
	.section	.rodata
	.align 8
	.align 4
.L456:
	.quad	.L347
	.quad	.L339
	.quad	.L339
	.quad	.L339
	.quad	.L339
	.quad	.L354
	.quad	.L339
	.quad	.L339
	.quad	.L339
	.quad	.L339
	.quad	.L339
	.quad	.L356
	.quad	.L1316
	.quad	.L353
	.quad	.L353
	.quad	.L339
	.quad	.L353
	.quad	.L340
	.quad	.L339
	.quad	.L339
	.quad	.L377
	.quad	.L348
	.quad	.L353
	.quad	.L353
	.quad	.L339
	.quad	.L339
	.quad	.L339
	.quad	.L359
	.text
.L340:
	movl	8(%r13), %eax
	cmpl	$55, %eax
	jg	.L341
	testb	$64, 3(%r13)
	je	.L342
	movq	inline_target(%rip), %rdx
	testq	%rdx, %rdx
	je	.L1316
	movzbl	2(%rdx), %r13d
	movq	%rdx, %rbx
	cmpl	%r13d, -120(%rbp)
	je	.L338
	movl	-120(%rbp), %esi
	movl	$35, %edi
.L1489:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	call	gen_rtx
.L1460:
	movq	%rax, %rbx
.L338:
	movl	$25, %edi
	xorl	%esi, %esi
	movq	%rbx, %rdx
	jmp	.L1565
.L342:
	cmpl	$14, %eax
	movq	%r13, %rdi
	je	.L1490
.L353:
	movq	%r13, %rbx
	jmp	.L338
.L1490:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1460
.L341:
	movq	reg_map(%rip), %rdx
	cltq
	leaq	0(,%rax,8), %rbx
	cmpq	$0, (%rdx,%rbx)
	je	.L1697
.L346:
	movq	(%rdx,%rbx), %rbx
	jmp	.L338
.L1697:
	movl	-120(%rbp), %edi
	xorl	%eax, %eax
	call	gen_reg_rtx
	movq	reg_map(%rip), %rdx
	movq	%rax, (%rdx,%rbx)
	jmp	.L346
	.p2align 6,,7
.L347:
	movslq	32(%r13),%r14
	salq	$3, %r14
	addq	label_map(%rip), %r14
	movq	(%r14), %rbx
	jmp	.L338
.L354:
	movq	32(%r13), %rbx
	cmpq	%rbx, orig_asm_operands_vector(%rip)
	je	.L1698
.L339:
	movl	-116(%rbp), %edi
	xorl	%eax, %eax
	call	rtx_alloc
	xorl	%r11d, %r11d
	movzbl	-120(%rbp), %r10d
	movzbl	3(%rax), %esi
	movq	%rax, %r12
	movb	%r10b, 2(%rax)
	movzbl	3(%r13), %r8d
	andb	$-17, %sil
	andb	$16, %r8b
	orb	%r8b, %sil
	movb	%sil, 3(%rax)
	andb	$-9, %sil
	movzbl	3(%r13), %r9d
	andb	$8, %r9b
	orb	%r9b, %sil
	movb	%sil, 3(%rax)
	movzwl	(%r12), %edx
	andb	$-5, %sil
	movzbl	3(%r13), %eax
	movzwl	%dx, %ebx 
	andb	$4, %al
	orb	%al, %sil
	movb	%sil, 3(%r12)
	cmpl	rtx_length(,%rbx,4), %r11d
	movl	$0, -500(%rbp)
	movq	rtx_format(,%rbx,8), %rdi
	movq	%rdi, -496(%rbp)
	jge	.L1351
.L479:
	movq	-496(%rbp), %r15
	movsbl	(%r15),%eax
	incq	%r15
	movq	%r15, -496(%rbp)
	cmpl	$101, %eax
	je	.L464
	cmpl	$101, %eax
	jg	.L477
	cmpl	$48, %eax
	je	.L460
	cmpl	$69, %eax
	jne	.L1316
	movslq	-500(%rbp),%r8
	leaq	8(%r13), %rax
	movq	%rax, -144(%rbp)
	leaq	0(,%r8,8), %rbx
	leaq	(%rax,%rbx), %r9
	leaq	8(%rbx,%r12), %r14
	movq	(%r9), %rsi
	movq	%rsi, (%r14)
	movq	(%r9), %rax
	testq	%rax, %rax
	je	.L1410
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L1700
.L1410:
	movzwl	(%r12), %edx
.L460:
	incl	-500(%rbp)
	movzwl	%dx, %r8d 
	movl	-500(%rbp), %eax
	cmpl	rtx_length(,%r8,4), %eax
	jl	.L479
.L1351:
	cmpl	$22, -116(%rbp)
	je	.L1701
.L480:
	movq	%r12, %rbx
	jmp	.L338
.L1701:
	cmpq	$0, orig_asm_operands_vector(%rip)
	jne	.L480
	movq	32(%r13), %r10
	movq	32(%r12), %r13
	movq	%r10, orig_asm_operands_vector(%rip)
	movq	%r13, copy_asm_operands_vector(%rip)
	jmp	.L480
.L1700:
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	call	rtvec_alloc
	movq	%rax, (%r14)
	cmpl	(%rax), %r15d
	jae	.L1410
	movq	%rbx, -152(%rbp)
.L472:
	movq	-144(%rbp), %rdi
	movq	-152(%rbp), %r9
	movslq	%r15d,%rdx
	salq	$3, %rdx
	movq	(%r14), %rcx
	xorl	%eax, %eax
	incl	%r15d
	movq	(%rdi,%r9), %r11
	addq	$8, %rcx
	leaq	(%rcx,%rdx), %rbx
	addq	$8, %r11
	movq	(%r11,%rdx), %rdi
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	(%r14), %r10
	cmpl	(%r10), %r15d
	jb	.L472
	jmp	.L1410
	.p2align 6,,7
.L477:
	cmpl	$115, %eax
	je	.L474
	cmpl	$115, %eax
	jg	.L478
	cmpl	$105, %eax
	jne	.L1316
	movslq	-500(%rbp),%r15
	salq	$3, %r15
	movl	8(%r13,%r15), %r14d
	movl	%r14d, 8(%r12,%r15)
	jmp	.L1410
.L478:
	cmpl	$117, %eax
	jne	.L1316
	movslq	-500(%rbp),%rcx
	salq	$3, %rcx
	movq	8(%rcx,%r13), %rdi
	movslq	8(%rdi),%r11
	salq	$3, %r11
	addq	insn_map(%rip), %r11
	movq	(%r11), %rbx
	movq	%rbx, 8(%rcx,%r12)
	jmp	.L1410
.L474:
	movslq	-500(%rbp),%rbx
	salq	$3, %rbx
	movq	8(%rbx,%r13), %rsi
	movq	%rsi, 8(%rbx,%r12)
	jmp	.L1410
.L464:
	movslq	-500(%rbp),%rdx
	xorl	%eax, %eax
	salq	$3, %rdx
	movq	8(%rdx,%r13), %rdi
	leaq	8(%rdx,%r12), %r14
	call	copy_rtx_and_substitute
	movq	%rax, (%r14)
	jmp	.L1410
.L1698:
	movl	$22, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	copy_asm_operands_vector(%rip), %r9
	movq	8(%r13), %r10
	movq	%rax, %rbx
	movq	%r10, 8(%rax)
	movq	16(%r13), %r15
	movq	%r15, 16(%rax)
	movl	24(%r13), %eax
	movq	%r9, 32(%rbx)
	movl	%eax, 24(%rbx)
	movq	40(%r13), %r8
	movq	%r8, 40(%rbx)
	jmp	.L338
	.p2align 6,,7
.L356:
	movl	optimize(%rip), %r11d
	testl	%r11d, %r11d
	je	.L358
	movl	flag_no_function_cse(%rip), %r12d
	testl	%r12d, %r12d
	je	.L339
.L358:
	movq	8(%r13), %r14
	xorl	%eax, %eax
	movq	8(%r14), %rdi
	call	copy_rtx_and_substitute
	movq	8(%r13), %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	movzbl	2(%rdi), %esi
	movl	$37, %edi
	call	gen_rtx
	movq	16(%r13), %rdi
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movl	$28, %edi
	movzbl	2(%r13), %esi
	movq	%rax, %rcx
.L1578:
	movq	%rbx, %rdx
.L1493:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1460
.L377:
	movq	8(%r13), %r12
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %r12
	je	.L379
	cmpq	arg_pointer_rtx(%rip), %r12
	je	.L379
	cmpw	$63, (%r12)
	je	.L1704
.L380:
	movl	-120(%rbp), %edi
	xorl	%eax, %eax
	movq	%r12, %rsi
	call	memory_address_p
	testl	%eax, %eax
	jne	.L381
	movzwl	(%r12), %edi
	movzbl	2(%r12), %ebx
	leal	-17(%rdi), %eax
	cmpl	$27, %eax
	ja	.L384
	mov	%eax, %r8d
	jmp	*.L397(,%r8,8)
	.section	.rodata
	.align 8
	.align 4
.L397:
	.quad	.L391
	.quad	.L384
	.quad	.L384
	.quad	.L384
	.quad	.L384
	.quad	.L384
	.quad	.L384
	.quad	.L384
	.quad	.L384
	.quad	.L384
	.quad	.L384
	.quad	.L384
	.quad	.L384
	.quad	.L383
	.quad	.L383
	.quad	.L384
	.quad	.L383
	.quad	.L385
	.quad	.L384
	.quad	.L384
	.quad	.L389
	.quad	.L391
	.quad	.L383
	.quad	.L383
	.quad	.L384
	.quad	.L384
	.quad	.L384
	.quad	.L387
	.text
.L385:
	cmpl	$14, 8(%r12)
	je	.L1705
.L391:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L1458:
	movq	%rax, %r12
.L383:
	movl	-120(%rbp), %esi
	movl	$37, %edi
	movq	%r12, %rdx
.L1496:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1460
.L1705:
	movq	frame_pointer_rtx(%rip), %rdi
.L1486:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1458
.L389:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	copy_to_reg
	jmp	.L1458
.L384:
	xorl	%eax, %eax
	call	rtx_alloc
	xorl	%r9d, %r9d
	movb	%bl, 2(%rax)
	movzbl	3(%rax), %r11d
	movzwl	(%rax), %edx
	movzbl	3(%r12), %esi
	movq	%rax, %r13
	andb	$-17, %r11b
	movzwl	%dx, %ebx 
	andb	$16, %sil
	orb	%sil, %r11b
	movb	%r11b, 3(%rax)
	andb	$-9, %r11b
	movzbl	3(%r12), %r14d
	andb	$8, %r14b
	orb	%r14b, %r11b
	movb	%r11b, 3(%rax)
	andb	$-5, %r11b
	movzbl	3(%r12), %edi
	andb	$4, %dil
	orb	%dil, %r11b
	movb	%r11b, 3(%rax)
	cmpl	rtx_length(,%rbx,4), %r9d
	movl	$0, -484(%rbp)
	movq	rtx_format(,%rbx,8), %r10
	movq	%r10, -480(%rbp)
	jge	.L1346
.L420:
	movq	-480(%rbp), %rcx
	movsbl	(%rcx),%eax
	incq	%rcx
	movq	%rcx, -480(%rbp)
	cmpl	$101, %eax
	je	.L405
	cmpl	$101, %eax
	jg	.L418
	cmpl	$48, %eax
	je	.L401
	cmpl	$69, %eax
	jne	.L1316
	movslq	-484(%rbp),%r14
	leaq	8(%r12), %rax
	movq	%rax, -128(%rbp)
	leaq	0(,%r14,8), %rbx
	leaq	(%rax,%rbx), %r11
	leaq	8(%rbx,%r13), %r14
	movq	(%r11), %rdi
	movq	%rdi, (%r14)
	movq	(%r11), %rax
	testq	%rax, %rax
	je	.L1406
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L1707
.L1406:
	movzwl	(%r13), %edx
.L401:
	incl	-484(%rbp)
	movzwl	%dx, %r14d 
	movl	-484(%rbp), %eax
	cmpl	rtx_length(,%r14,4), %eax
	jl	.L420
.L1346:
	movq	%r13, %r12
	jmp	.L383
.L1707:
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	call	rtvec_alloc
	movq	%rax, (%r14)
	cmpl	(%rax), %r15d
	jae	.L1406
	movq	%rbx, -136(%rbp)
.L413:
	movq	-136(%rbp), %r10
	movq	-128(%rbp), %r9
	movslq	%r15d,%rdx
	salq	$3, %rdx
	movq	(%r14), %rcx
	xorl	%eax, %eax
	incl	%r15d
	movq	(%r9,%r10), %r8
	addq	$8, %rcx
	leaq	(%rcx,%rdx), %rbx
	addq	$8, %r8
	movq	(%r8,%rdx), %rdi
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	(%r14), %rsi
	cmpl	(%rsi), %r15d
	jb	.L413
	jmp	.L1406
	.p2align 6,,7
.L418:
	cmpl	$115, %eax
	je	.L415
	cmpl	$115, %eax
	jg	.L419
	cmpl	$105, %eax
	jne	.L1316
	movslq	-484(%rbp),%r15
	salq	$3, %r15
	movl	8(%r12,%r15), %ebx
	movl	%ebx, 8(%r13,%r15)
	jmp	.L1406
.L419:
	cmpl	$117, %eax
	jne	.L1316
	movslq	-484(%rbp),%r8
	salq	$3, %r8
	movq	8(%r8,%r12), %r10
	movslq	8(%r10),%r9
	salq	$3, %r9
	addq	insn_map(%rip), %r9
	movq	(%r9), %rbx
	movq	%rbx, 8(%r8,%r13)
	jmp	.L1406
.L415:
	movslq	-484(%rbp),%r11
	salq	$3, %r11
	movq	8(%r11,%r12), %rdi
	movq	%rdi, 8(%r11,%r13)
	jmp	.L1406
.L405:
	movslq	-484(%rbp),%rdx
	xorl	%eax, %eax
	salq	$3, %rdx
	movq	8(%rdx,%r12), %rdi
	leaq	8(%rdx,%r13), %r15
	call	copy_rtx_and_substitute
	movq	%rax, (%r15)
	jmp	.L1406
.L387:
	movq	8(%r12), %rax
	cmpw	$34, (%rax)
	jne	.L384
	cmpl	$14, 8(%rax)
	jne	.L384
	movq	%r12, %rdi
	jmp	.L1486
	.p2align 6,,7
.L381:
	cmpw	$44, (%r12)
	je	.L1710
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L454:
	movq	%r13, %rdi
.L1497:
	movl	-120(%rbp), %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	change_address
	jmp	.L1460
.L1710:
	movq	8(%r12), %rdx
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L1407
	movq	16(%r12), %rax
	cmpq	%rdi, %rax
	je	.L1711
	xorl	%eax, %eax
	movq	%r12, %rsi
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L444
	movq	8(%r12), %rdi
	cmpw	$30, (%rdi)
	je	.L1712
	movq	16(%r12), %rcx
	cmpw	$30, (%rcx)
	je	.L1488
.L452:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r12), %rdi
	movq	%rax, %r14
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%r14, %rdx
	movl	$44, %edi
	movzbl	2(%r12), %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L454
.L1488:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	16(%r12), %rax
.L1459:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L454
.L1712:
	movq	16(%r12), %rdi
.L1487:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	8(%r12), %rax
	jmp	.L1459
.L444:
	movq	16(%r12), %rax
	cmpw	$30, (%rax)
	je	.L1714
	movq	8(%r12), %rdi
	cmpw	$30, (%rdi)
	jne	.L452
	movq	%rax, %rdi
	jmp	.L1487
.L1714:
	movq	8(%r12), %rdi
	jmp	.L1488
.L1711:
	cmpq	%rdi, %rdx
	je	.L425
	cmpq	arg_pointer_rtx(%rip), %rdx
	je	.L425
	movq	%rdx, %r12
.L426:
	cmpw	$30, (%r12)
	je	.L1716
.L427:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	fp_delta(%rip), %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	plus_constant
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L454
.L1716:
	cmpq	arg_pointer_rtx(%rip), %rdi
	movl	8(%r12), %ebx
	je	.L1717
.L428:
	movl	%ebx, %edx
	movl	$30, %edi
	movl	$4, %esi
	addl	fp_delta(%rip), %edx
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address_p
	testl	%eax, %eax
	jne	.L427
	movq	inline_fp_rtx(%rip), %rdi
	movl	%ebx, %esi
.L1580:
	xorl	%eax, %eax
	call	plus_constant
.L1579:
	movl	$37, %edi
	movl	-120(%rbp), %esi
	movq	%rax, %rdx
	jmp	.L1496
.L1717:
	movl	first_parm_offset(%rip), %r9d
	cmpl	%r9d, %ebx
	movl	%r9d, %edi
	jl	.L428
	cmpl	$-1, %ebx
	leal	3(%rbx), %esi
	movl	%ebx, %r8d
	cmovle	%esi, %r8d
	movq	parm_map(%rip), %r12
	movl	%ebx, %esi
	sarl	$2, %r8d
	leal	0(,%r8,4), %r13d
	movslq	%r8d,%rax
	subl	%r13d, %esi
	movq	%r12, %rdx
	cmpq	$0, (%r12,%rax,8)
	jne	.L1349
	leal	3(%r9), %ecx
.L436:
	decl	%r8d
	movl	%edi, %r9d
	cmpl	$-1, %edi
	cmovle	%ecx, %r9d
	sarl	$2, %r9d
	cmpl	%r9d, %r8d
	jl	.L1316
	movslq	%r8d,%rax
	addl	$4, %esi
	cmpq	$0, (%rdx,%rax,8)
	je	.L436
.L1349:
	movq	(%rdx,%rax,8), %rbx
	movzbl	2(%rbx), %edi
	movzbl	%dil, %r8d
	movslq	%r8d,%r15
	movl	mode_size(,%r15,4), %ecx
	cmpl	$3, %ecx
	leal	-4(%rcx,%rsi), %r10d
	cmovle	%r10d, %esi
	cmpl	-120(%rbp), %r8d
	je	.L338
	testb	%dil, %dil
	je	.L338
	movzwl	(%rbx), %eax
	cmpw	$37, %ax
	je	.L1718
	cmpw	$34, %ax
	jne	.L1316
	movslq	-120(%rbp),%rdx
	addl	mode_size(,%rdx,4), %esi
	cmpl	%ecx, %esi
	jne	.L1316
	movl	$35, %edi
	movl	-120(%rbp), %esi
	movq	%rbx, %rdx
	jmp	.L1489
.L1718:
	movq	8(%rbx), %rdi
	xorl	%eax, %eax
	call	plus_constant
	movq	%rbx, %rdi
	jmp	.L1497
.L425:
	movq	%rdx, %rdi
	movq	%rax, %r12
	jmp	.L426
.L1407:
	movq	16(%r12), %rax
	jmp	.L425
	.p2align 6,,7
.L1704:
	movq	stack_pointer_rtx(%rip), %rax
	cmpq	%rax, 8(%r12)
	jne	.L380
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	jmp	.L1579
	.p2align 6,,7
.L379:
	movl	fp_delta(%rip), %esi
	jmp	.L1580
.L348:
	movl	$38, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	%rax, %rbx
	movzbl	-120(%rbp), %eax
	movb	%al, 2(%rbx)
	movq	8(%r13), %rdx
	movslq	32(%rdx),%rcx
	salq	$3, %rcx
	addq	label_map(%rip), %rcx
	movq	(%rcx), %rsi
	movq	%rsi, 8(%rbx)
	jmp	.L338
.L359:
	movq	8(%r13), %rax
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %rax
	je	.L1403
	movq	16(%r13), %rdx
	cmpq	%rdi, %rdx
	je	.L1719
	xorl	%eax, %eax
	movq	%r13, %rsi
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L369
	movl	-120(%rbp), %edi
	xorl	%eax, %eax
	movq	%r13, %rsi
	call	memory_address_p
	testl	%eax, %eax
	je	.L369
	movq	8(%r13), %rdi
	cmpw	$30, (%rdi)
	je	.L1720
	movq	16(%r13), %rdx
	cmpw	$30, (%rdx)
	je	.L1721
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r13), %rdi
	movq	%rax, %r15
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%r15, %rdx
	movl	$44, %edi
	movzbl	2(%r13), %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	gen_rtx
.L372:
	movl	-120(%rbp), %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L1460
.L1721:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	16(%r13), %rax
.L1457:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L372
.L1720:
	movq	16(%r13), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	8(%r13), %rax
	jmp	.L1457
.L369:
	movq	8(%r13), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r13), %rdi
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movl	$44, %edi
	movzbl	2(%r13), %esi
	movq	%rax, %rcx
	jmp	.L1578
	.p2align 6,,7
.L1719:
	cmpq	%rdi, %rax
	je	.L363
	cmpq	arg_pointer_rtx(%rip), %rax
	je	.L363
	movq	%rax, %rdi
.L364:
	cmpw	$30, (%rdi)
	je	.L1723
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	-120(%rbp), %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	-120(%rbp), %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	force_reg
	movq	%rax, %rdi
	jmp	.L1490
.L1723:
	movl	8(%rdi), %edx
	testl	%edx, %edx
	jle	.L366
	cmpl	$-1, %edx
	leal	3(%rdx), %ecx
	cmovle	%ecx, %edx
	sarl	$2, %edx
	movslq	%edx,%rsi
	salq	$3, %rsi
	addq	parm_map(%rip), %rsi
	movq	(%rsi), %r13
	movq	8(%r13), %rbx
	jmp	.L338
.L366:
	addl	fp_delta(%rip), %edx
	movl	$30, %edi
	movl	$4, %esi
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	-120(%rbp), %esi
	movq	%rax, %rcx
	movl	$44, %edi
	jmp	.L1493
	.p2align 6,,7
.L363:
	movq	%rdx, %rdi
	jmp	.L364
.L1403:
	movq	16(%r13), %rdx
	jmp	.L363
	.p2align 6,,7
.L1402:
	movq	-208(%rbp), %r12
	movzwl	(%r12), %edx
	jmp	.L336
	.p2align 6,,7
.L1401:
	movq	-208(%rbp), %r9
	movzwl	(%r9), %edx
	jmp	.L334
	.p2align 6,,7
.L868:
	movq	-472(%rbp), %rsi
	movq	$0, -464(%rbp)
	movq	32(%rsi), %rdi
	movzwl	(%rdi), %eax
	movq	%rdi, -256(%rbp)
	cmpw	$29, %ax
	je	.L1724
	xorl	%ebx, %ebx
	cmpq	$0, -256(%rbp)
	je	.L872
	movzwl	%ax, %eax
	movq	-256(%rbp), %r8
	movl	%eax, -260(%rbp)
	subl	$17, %eax
	cmpl	$27, %eax
	movzbl	2(%r8), %r13d
	ja	.L873
	mov	%eax, %ecx
	jmp	*.L990(,%rcx,8)
	.section	.rodata
	.align 8
	.align 4
.L990:
	.quad	.L881
	.quad	.L873
	.quad	.L873
	.quad	.L873
	.quad	.L873
	.quad	.L888
	.quad	.L873
	.quad	.L873
	.quad	.L873
	.quad	.L873
	.quad	.L873
	.quad	.L890
	.quad	.L1316
	.quad	.L887
	.quad	.L887
	.quad	.L873
	.quad	.L887
	.quad	.L874
	.quad	.L873
	.quad	.L873
	.quad	.L911
	.quad	.L882
	.quad	.L887
	.quad	.L887
	.quad	.L873
	.quad	.L873
	.quad	.L873
	.quad	.L893
	.text
.L874:
	movq	-256(%rbp), %rbx
	movl	8(%rbx), %eax
	cmpl	$55, %eax
	jg	.L875
	testb	$64, 3(%rbx)
	je	.L876
	movq	inline_target(%rip), %rdx
	testq	%rdx, %rdx
	je	.L1316
	movzbl	2(%rdx), %r10d
	movq	%rdx, %rbx
	cmpl	%r10d, %r13d
	je	.L872
	movl	$35, %edi
	movl	%r13d, %esi
.L1544:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	call	gen_rtx
.L1473:
	movq	%rax, %rbx
.L872:
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	emit_jump_insn
	jmp	.L1479
.L876:
	cmpl	$14, %eax
	je	.L1725
.L887:
	movq	-256(%rbp), %rbx
	jmp	.L872
.L1725:
	movq	-256(%rbp), %rdi
.L1545:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1473
.L875:
	movq	reg_map(%rip), %rdx
	cltq
	leaq	0(,%rax,8), %rbx
	cmpq	$0, (%rdx,%rbx)
	je	.L1726
.L880:
	movq	(%rdx,%rbx), %rbx
	jmp	.L872
.L1726:
	movl	%r13d, %edi
	xorl	%eax, %eax
	call	gen_reg_rtx
	movq	reg_map(%rip), %rdx
	movq	%rax, (%rdx,%rbx)
	jmp	.L880
.L881:
	movq	-256(%rbp), %rax
	movslq	32(%rax),%r11
	salq	$3, %r11
	addq	label_map(%rip), %r11
	movq	(%r11), %rbx
	jmp	.L872
.L888:
	movq	-256(%rbp), %rdx
	movq	32(%rdx), %rbx
	cmpq	%rbx, orig_asm_operands_vector(%rip)
	je	.L1727
.L873:
	movl	-260(%rbp), %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	-256(%rbp), %r14
	movb	%r13b, 2(%rax)
	movzbl	3(%rax), %edi
	movzwl	(%rax), %edx
	movq	%rax, %r12
	movzbl	3(%r14), %r10d
	andb	$-17, %dil
	movzwl	%dx, %r13d 
	andb	$16, %r10b
	orb	%r10b, %dil
	movb	%dil, 3(%rax)
	andb	$-9, %dil
	movzbl	3(%r14), %ebx
	andb	$8, %bl
	orb	%bl, %dil
	movb	%dil, 3(%rax)
	andb	$-5, %dil
	movzbl	3(%r14), %ecx
	xorl	%r14d, %r14d
	andb	$4, %cl
	orb	%cl, %dil
	movb	%dil, 3(%rax)
	cmpl	rtx_length(,%r13,4), %r14d
	movq	rtx_format(,%r13,8), %r15
	jge	.L1376
	.p2align 4,,7
.L1013:
	movsbl	(%r15),%eax
	incq	%r15
	cmpl	$101, %eax
	je	.L998
	cmpl	$101, %eax
	jg	.L1011
	cmpl	$48, %eax
	je	.L994
	cmpl	$69, %eax
	jne	.L1316
	movq	-256(%rbp), %r11
	movslq	%r14d,%r13
	leaq	0(,%r13,8), %rbx
	leaq	8(%rbx,%r12), %r13
	addq	$8, %r11
	leaq	(%r11,%rbx), %rcx
	movq	%r11, -288(%rbp)
	movq	(%rcx), %r10
	movq	%r10, (%r13)
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L1436
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L1729
	.p2align 4,,7
.L1436:
	movzwl	(%r12), %edx
.L994:
	movzwl	%dx, %ebx 
	incl	%r14d
	cmpl	rtx_length(,%rbx,4), %r14d
	jl	.L1013
.L1376:
	cmpl	$22, -260(%rbp)
	je	.L1730
.L1014:
	movq	%r12, %rbx
	jmp	.L872
.L1730:
	cmpq	$0, orig_asm_operands_vector(%rip)
	jne	.L1014
	movq	-256(%rbp), %rdx
	movq	32(%r12), %r15
	movq	32(%rdx), %r14
	movq	%r15, copy_asm_operands_vector(%rip)
	movq	%r14, orig_asm_operands_vector(%rip)
	jmp	.L1014
.L1729:
	xorl	%eax, %eax
	call	rtvec_alloc
	xorl	%r8d, %r8d
	movq	%rax, (%r13)
	cmpl	(%rax), %r8d
	jae	.L1436
	movq	%rbx, -296(%rbp)
.L1006:
	movq	-288(%rbp), %rdi
	movq	-296(%rbp), %rsi
	movslq	%r8d,%rdx
	movq	(%r13), %rax
	salq	$3, %rdx
	movq	(%rdi,%rsi), %r9
	addq	$8, %rax
	leaq	(%rax,%rdx), %rbx
	xorl	%eax, %eax
	addq	$8, %r9
	movq	(%r9,%rdx), %rdi
	movl	%r8d, -624(%rbp)
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	(%r13), %rbx
	movl	-624(%rbp), %r8d
	incl	%r8d
	cmpl	(%rbx), %r8d
	jb	.L1006
	jmp	.L1436
	.p2align 6,,7
.L1011:
	cmpl	$115, %eax
	je	.L1008
	cmpl	$115, %eax
	jg	.L1012
	cmpl	$105, %eax
	jne	.L1316
	movq	-256(%rbp), %r11
	movslq	%r14d,%r8
	salq	$3, %r8
	movl	8(%r11,%r8), %r10d
	movl	%r10d, 8(%r12,%r8)
	jmp	.L1436
.L1012:
	cmpl	$117, %eax
	jne	.L1316
	movq	-256(%rbp), %rax
	movslq	%r14d,%r9
	salq	$3, %r9
	movq	8(%r9,%rax), %rdi
	movslq	8(%rdi),%rsi
	salq	$3, %rsi
	addq	insn_map(%rip), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, 8(%r9,%r12)
	jmp	.L1436
.L1008:
	movq	-256(%rbp), %r9
	movslq	%r14d,%rcx
	salq	$3, %rcx
	movq	8(%rcx,%r9), %r13
	movq	%r13, 8(%rcx,%r12)
	jmp	.L1436
.L998:
	movq	-256(%rbp), %r8
	movslq	%r14d,%r11
	xorl	%eax, %eax
	salq	$3, %r11
	leaq	8(%r11,%r12), %r13
	movq	8(%r11,%r8), %rdi
	call	copy_rtx_and_substitute
	movq	%rax, (%r13)
	jmp	.L1436
.L1727:
	movl	$22, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	copy_asm_operands_vector(%rip), %rsi
	movq	-256(%rbp), %rdi
	movq	%rax, %rbx
	movq	8(%rdi), %rcx
	movq	%rcx, 8(%rax)
	movq	16(%rdi), %r8
	movq	%r8, 16(%rax)
	movl	24(%rdi), %eax
	movq	%rsi, 32(%rbx)
	movl	%eax, 24(%rbx)
	movq	40(%rdi), %r12
	movq	%r12, 40(%rbx)
	jmp	.L872
.L890:
	movl	optimize(%rip), %r10d
	testl	%r10d, %r10d
	je	.L892
	movl	flag_no_function_cse(%rip), %r11d
	testl	%r11d, %r11d
	je	.L873
.L892:
	movq	-256(%rbp), %rbx
	xorl	%eax, %eax
	movq	8(%rbx), %r14
	movq	8(%r14), %rdi
	call	copy_rtx_and_substitute
	movl	$37, %edi
	movq	-256(%rbp), %r15
	movq	%rax, %rdx
	xorl	%eax, %eax
	movq	8(%r15), %r9
	movzbl	2(%r9), %esi
	call	gen_rtx
	movq	%rax, %rbx
	movq	-256(%rbp), %rax
	movq	16(%rax), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movl	$28, %edi
	movq	-256(%rbp), %r13
	movq	%rax, %rcx
	movzbl	2(%r13), %esi
.L1588:
	movq	%rbx, %rdx
.L1548:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1473
.L911:
	movq	-256(%rbp), %rdi
	movq	8(%rdi), %r12
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %r12
	je	.L913
	cmpq	arg_pointer_rtx(%rip), %r12
	je	.L913
	cmpw	$63, (%r12)
	je	.L1733
.L914:
	xorl	%eax, %eax
	movl	%r13d, %edi
	movq	%r12, %rsi
	call	memory_address_p
	testl	%eax, %eax
	jne	.L915
	movzwl	(%r12), %edi
	movzbl	2(%r12), %ebx
	leal	-17(%rdi), %eax
	cmpl	$27, %eax
	ja	.L918
	mov	%eax, %esi
	jmp	*.L931(,%rsi,8)
	.section	.rodata
	.align 8
	.align 4
.L931:
	.quad	.L925
	.quad	.L918
	.quad	.L918
	.quad	.L918
	.quad	.L918
	.quad	.L918
	.quad	.L918
	.quad	.L918
	.quad	.L918
	.quad	.L918
	.quad	.L918
	.quad	.L918
	.quad	.L918
	.quad	.L917
	.quad	.L917
	.quad	.L918
	.quad	.L917
	.quad	.L919
	.quad	.L918
	.quad	.L918
	.quad	.L923
	.quad	.L925
	.quad	.L917
	.quad	.L917
	.quad	.L918
	.quad	.L918
	.quad	.L918
	.quad	.L921
	.text
.L919:
	cmpl	$14, 8(%r12)
	je	.L1734
.L925:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L1471:
	movq	%rax, %r12
.L917:
	movl	$37, %edi
	movl	%r13d, %esi
	movq	%r12, %rdx
.L1551:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1473
.L1734:
	movq	frame_pointer_rtx(%rip), %rdi
.L1541:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1471
	.p2align 6,,7
.L923:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	copy_to_reg
	jmp	.L1471
.L918:
	xorl	%eax, %eax
	call	rtx_alloc
	xorl	%ecx, %ecx
	movq	%rax, %r14
	movb	%bl, 2(%rax)
	movzbl	3(%r12), %eax
	movzbl	3(%r14), %r11d
	movzwl	(%r14), %edx
	andb	$16, %al
	andb	$-17, %r11b
	movzwl	%dx, %r8d 
	orb	%al, %r11b
	movb	%r11b, 3(%r14)
	andb	$-9, %r11b
	movzbl	3(%r12), %r15d
	andb	$8, %r15b
	orb	%r15b, %r11b
	movb	%r11b, 3(%r14)
	andb	$-5, %r11b
	movzbl	3(%r12), %r9d
	andb	$4, %r9b
	orb	%r9b, %r11b
	movb	%r11b, 3(%r14)
	cmpl	rtx_length(,%r8,4), %ecx
	movl	$0, -548(%rbp)
	movq	rtx_format(,%r8,8), %r10
	movq	%r10, -544(%rbp)
	jge	.L1371
.L954:
	movq	-544(%rbp), %rbx
	movsbl	(%rbx),%eax
	incq	%rbx
	movq	%rbx, -544(%rbp)
	cmpl	$101, %eax
	je	.L939
	cmpl	$101, %eax
	jg	.L952
	cmpl	$48, %eax
	je	.L935
	cmpl	$69, %eax
	jne	.L1316
	movslq	-548(%rbp),%r15
	leaq	8(%r12), %r9
	movq	%r9, -272(%rbp)
	leaq	0(,%r15,8), %rbx
	leaq	(%r9,%rbx), %r10
	leaq	8(%rbx,%r14), %r15
	movq	(%r10), %r11
	movq	%r11, (%r15)
	movq	(%r10), %rax
	testq	%rax, %rax
	je	.L1432
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L1736
.L1432:
	movzwl	(%r14), %edx
.L935:
	incl	-548(%rbp)
	movzwl	%dx, %r15d 
	movl	-548(%rbp), %ebx
	cmpl	rtx_length(,%r15,4), %ebx
	jl	.L954
.L1371:
	movq	%r14, %r12
	jmp	.L917
.L1736:
	xorl	%eax, %eax
	call	rtvec_alloc
	xorl	%r8d, %r8d
	movq	%rax, (%r15)
	cmpl	(%rax), %r8d
	jae	.L1432
	movq	%rbx, -280(%rbp)
.L947:
	movq	-280(%rbp), %rdi
	movq	-272(%rbp), %rax
	movslq	%r8d,%rdx
	salq	$3, %rdx
	movq	(%r15), %rsi
	movq	(%rax,%rdi), %r10
	xorl	%eax, %eax
	addq	$8, %rsi
	leaq	(%rsi,%rdx), %rbx
	addq	$8, %r10
	movq	(%r10,%rdx), %rdi
	movl	%r8d, -624(%rbp)
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	(%r15), %rbx
	movl	-624(%rbp), %r8d
	incl	%r8d
	cmpl	(%rbx), %r8d
	jb	.L947
	jmp	.L1432
	.p2align 6,,7
.L952:
	cmpl	$115, %eax
	je	.L949
	cmpl	$115, %eax
	jg	.L953
	cmpl	$105, %eax
	jne	.L1316
	movslq	-548(%rbp),%r8
	salq	$3, %r8
	movl	8(%r12,%r8), %ecx
	movl	%ecx, 8(%r14,%r8)
	jmp	.L1432
.L953:
	cmpl	$117, %eax
	jne	.L1316
	movslq	-548(%rbp),%rdi
	salq	$3, %rdi
	movq	8(%rdi,%r12), %rcx
	movslq	8(%rcx),%r8
	salq	$3, %r8
	addq	insn_map(%rip), %r8
	movq	(%r8), %rsi
	movq	%rsi, 8(%rdi,%r14)
	jmp	.L1432
.L949:
	movslq	-548(%rbp),%r11
	salq	$3, %r11
	movq	8(%r11,%r12), %r9
	movq	%r9, 8(%r11,%r14)
	jmp	.L1432
.L939:
	movslq	-548(%rbp),%rdx
	xorl	%eax, %eax
	salq	$3, %rdx
	movq	8(%rdx,%r12), %rdi
	leaq	8(%rdx,%r14), %r15
	call	copy_rtx_and_substitute
	movq	%rax, (%r15)
	jmp	.L1432
.L921:
	movq	8(%r12), %rax
	cmpw	$34, (%rax)
	jne	.L918
	cmpl	$14, 8(%rax)
	jne	.L918
	movq	%r12, %rdi
	jmp	.L1541
	.p2align 6,,7
.L915:
	cmpw	$44, (%r12)
	je	.L1739
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L988:
	movq	-256(%rbp), %rdi
.L1552:
	movq	%rax, %rdx
	movl	%r13d, %esi
	xorl	%eax, %eax
	call	change_address
	jmp	.L1473
.L1739:
	movq	8(%r12), %rdx
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L1433
	movq	16(%r12), %rax
	cmpq	%rdi, %rax
	je	.L1740
	xorl	%eax, %eax
	movq	%r12, %rsi
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L978
	movq	8(%r12), %rdi
	cmpw	$30, (%rdi)
	je	.L1741
	movq	16(%r12), %rsi
	cmpw	$30, (%rsi)
	je	.L1543
.L986:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r12), %rdi
	movq	%rax, %r15
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%r15, %rdx
	movl	$44, %edi
	movzbl	2(%r12), %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L988
.L1543:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	16(%r12), %rax
.L1472:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L988
.L1741:
	movq	16(%r12), %rdi
.L1542:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	8(%r12), %rax
	jmp	.L1472
	.p2align 6,,7
.L978:
	movq	16(%r12), %rax
	cmpw	$30, (%rax)
	je	.L1743
	movq	8(%r12), %rdi
	cmpw	$30, (%rdi)
	jne	.L986
	movq	%rax, %rdi
	jmp	.L1542
.L1743:
	movq	8(%r12), %rdi
	jmp	.L1543
	.p2align 6,,7
.L1740:
	cmpq	%rdi, %rdx
	je	.L959
	cmpq	arg_pointer_rtx(%rip), %rdx
	je	.L959
	movq	%rdx, %r12
.L960:
	cmpw	$30, (%r12)
	je	.L1745
.L961:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	fp_delta(%rip), %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	plus_constant
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L988
.L1745:
	cmpq	arg_pointer_rtx(%rip), %rdi
	movl	8(%r12), %ebx
	je	.L1746
.L962:
	movl	%ebx, %edx
	movl	$30, %edi
	movl	$4, %esi
	addl	fp_delta(%rip), %edx
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address_p
	testl	%eax, %eax
	jne	.L961
	movq	inline_fp_rtx(%rip), %rdi
	movl	%ebx, %esi
.L1590:
	xorl	%eax, %eax
	call	plus_constant
.L1589:
	movl	$37, %edi
	movl	%r13d, %esi
	movq	%rax, %rdx
	jmp	.L1551
.L1746:
	movl	first_parm_offset(%rip), %r9d
	cmpl	%r9d, %ebx
	movl	%r9d, %edi
	jl	.L962
	cmpl	$-1, %ebx
	leal	3(%rbx), %r10d
	movl	%ebx, %r8d
	cmovle	%r10d, %r8d
	movq	parm_map(%rip), %r14
	movl	%ebx, %esi
	sarl	$2, %r8d
	leal	0(,%r8,4), %r12d
	movslq	%r8d,%rax
	subl	%r12d, %esi
	movq	%r14, %rdx
	cmpq	$0, (%r14,%rax,8)
	jne	.L1374
	leal	3(%r9), %ecx
.L970:
	decl	%r8d
	movl	%edi, %r11d
	cmpl	$-1, %edi
	cmovle	%ecx, %r11d
	sarl	$2, %r11d
	cmpl	%r11d, %r8d
	jl	.L1316
	movslq	%r8d,%rax
	addl	$4, %esi
	cmpq	$0, (%rdx,%rax,8)
	je	.L970
.L1374:
	movq	(%rdx,%rax,8), %rbx
	movzbl	2(%rbx), %edi
	movzbl	%dil, %r8d
	movslq	%r8d,%r9
	movl	mode_size(,%r9,4), %ecx
	cmpl	$3, %ecx
	leal	-4(%rcx,%rsi), %eax
	cmovle	%eax, %esi
	cmpl	%r13d, %r8d
	je	.L872
	testb	%dil, %dil
	je	.L872
	movzwl	(%rbx), %eax
	cmpw	$37, %ax
	je	.L1747
	cmpw	$34, %ax
	jne	.L1316
	movslq	%r13d,%rdx
	addl	mode_size(,%rdx,4), %esi
	cmpl	%ecx, %esi
	jne	.L1316
	movl	$35, %edi
	movl	%r13d, %esi
	movq	%rbx, %rdx
	jmp	.L1544
.L1747:
	movq	8(%rbx), %rdi
	xorl	%eax, %eax
	call	plus_constant
	movq	%rbx, %rdi
	jmp	.L1552
	.p2align 6,,7
.L959:
	movq	%rdx, %rdi
	movq	%rax, %r12
	jmp	.L960
.L1433:
	movq	16(%r12), %rax
	jmp	.L959
.L1733:
	movq	stack_pointer_rtx(%rip), %rdx
	cmpq	%rdx, 8(%r12)
	jne	.L914
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	jmp	.L1589
.L913:
	movl	fp_delta(%rip), %esi
	jmp	.L1590
.L882:
	movl	$38, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	-256(%rbp), %r14
	movb	%r13b, 2(%rax)
	movq	%rax, %rbx
	movq	8(%r14), %r15
	movslq	32(%r15),%r9
	salq	$3, %r9
	addq	label_map(%rip), %r9
	movq	(%r9), %r13
	movq	%r13, 8(%rax)
	jmp	.L872
.L893:
	movq	-256(%rbp), %rdx
	movq	frame_pointer_rtx(%rip), %rdi
	movq	8(%rdx), %rax
	cmpq	%rdi, %rax
	je	.L1429
	movq	16(%rdx), %rdx
	cmpq	%rdi, %rdx
	je	.L1748
	movq	-256(%rbp), %rsi
	xorl	%eax, %eax
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L903
	movq	-256(%rbp), %rsi
	xorl	%eax, %eax
	movl	%r13d, %edi
	call	memory_address_p
	testl	%eax, %eax
	je	.L903
	movq	-256(%rbp), %rsi
	movq	8(%rsi), %rdi
	cmpw	$30, (%rdi)
	je	.L1749
	movq	-256(%rbp), %r11
	movq	16(%r11), %r10
	cmpw	$30, (%r10)
	je	.L1750
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %r15
	movq	-256(%rbp), %rax
	movq	16(%rax), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%r15, %rdx
	movl	$44, %edi
	movq	-256(%rbp), %r14
	movq	%rax, %rcx
	xorl	%eax, %eax
	movzbl	2(%r14), %esi
	call	gen_rtx
.L906:
	movq	%rax, %rsi
	movl	%r13d, %edi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L1473
.L1750:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	-256(%rbp), %r9
	movq	%rax, %rdi
	movq	16(%r9), %rax
.L1470:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L906
.L1749:
	movq	16(%rsi), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	-256(%rbp), %rcx
	movq	%rax, %rdi
	movq	8(%rcx), %rax
	jmp	.L1470
.L903:
	movq	-256(%rbp), %rbx
	xorl	%eax, %eax
	movq	8(%rbx), %rdi
	call	copy_rtx_and_substitute
	movq	-256(%rbp), %r12
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	16(%r12), %rdi
	call	copy_rtx_and_substitute
	movl	$44, %edi
	movq	-256(%rbp), %r13
	movq	%rax, %rcx
	movzbl	2(%r13), %esi
	jmp	.L1588
.L1748:
	cmpq	%rdi, %rax
	je	.L897
	cmpq	arg_pointer_rtx(%rip), %rax
	je	.L897
	movq	%rax, %rdi
.L898:
	cmpw	$30, (%rdi)
	je	.L1752
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	%r13d, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	%r13d, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	force_reg
	movq	%rax, %rdi
	jmp	.L1545
.L1752:
	movl	8(%rdi), %edx
	testl	%edx, %edx
	jle	.L900
	cmpl	$-1, %edx
	leal	3(%rdx), %r8d
	cmovle	%r8d, %edx
	sarl	$2, %edx
	movslq	%edx,%rsi
	salq	$3, %rsi
	addq	parm_map(%rip), %rsi
	movq	(%rsi), %rdx
	movq	8(%rdx), %rbx
	jmp	.L872
.L900:
	addl	fp_delta(%rip), %edx
	movl	$30, %edi
	movl	$4, %esi
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	%r13d, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	jmp	.L1548
	.p2align 6,,7
.L897:
	movq	%rdx, %rdi
	jmp	.L898
.L1429:
	movq	-256(%rbp), %rdi
	movq	16(%rdi), %rdx
	jmp	.L897
	.p2align 6,,7
.L1724:
	cmpq	$0, -576(%rbp)
	je	.L1753
.L870:
	movq	-576(%rbp), %rdi
	xorl	%eax, %eax
	call	emit_jump
	jmp	.L332
.L1753:
	xorl	%eax, %eax
	call	gen_label_rtx
	movq	%rax, -576(%rbp)
	jmp	.L870
	.p2align 6,,7
.L1015:
	movq	-472(%rbp), %rdi
	xorl	%ebx, %ebx
	movq	32(%rdi), %r12
	testq	%r12, %r12
	movq	%r12, -304(%rbp)
	je	.L1017
	movq	-304(%rbp), %r8
	movq	-304(%rbp), %rax
	movzwl	(%r8), %esi
	movl	%esi, -308(%rbp)
	movzbl	2(%rax), %r13d
	movl	%esi, %eax
	subl	$17, %eax
	cmpl	$27, %eax
	ja	.L1018
	mov	%eax, %r10d
	jmp	*.L1135(,%r10,8)
	.section	.rodata
	.align 8
	.align 4
.L1135:
	.quad	.L1026
	.quad	.L1018
	.quad	.L1018
	.quad	.L1018
	.quad	.L1018
	.quad	.L1033
	.quad	.L1018
	.quad	.L1018
	.quad	.L1018
	.quad	.L1018
	.quad	.L1018
	.quad	.L1035
	.quad	.L1316
	.quad	.L1032
	.quad	.L1032
	.quad	.L1018
	.quad	.L1032
	.quad	.L1019
	.quad	.L1018
	.quad	.L1018
	.quad	.L1056
	.quad	.L1027
	.quad	.L1032
	.quad	.L1032
	.quad	.L1018
	.quad	.L1018
	.quad	.L1018
	.quad	.L1038
	.text
.L1019:
	movq	-304(%rbp), %rbx
	movl	8(%rbx), %eax
	cmpl	$55, %eax
	jg	.L1020
	testb	$64, 3(%rbx)
	je	.L1021
	movq	inline_target(%rip), %rdx
	testq	%rdx, %rdx
	je	.L1316
	movzbl	2(%rdx), %r11d
	movq	%rdx, %rbx
	cmpl	%r11d, %r13d
	je	.L1017
	movl	$35, %edi
	movl	%r13d, %esi
.L1556:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	call	gen_rtx
.L1477:
	movq	%rax, %rbx
.L1017:
	xorl	%eax, %eax
	movq	%rbx, %rdi
	call	emit_call_insn
	movq	%rax, -112(%rbp)
	orb	$64, 3(%rax)
	movq	-472(%rbp), %r12
	movq	32(%r12), %rax
	cmpw	$25, (%rax)
	jne	.L332
	movq	8(%rax), %rdi
	movq	%rdi, -464(%rbp)
	jmp	.L332
.L1021:
	cmpl	$14, %eax
	je	.L1754
.L1032:
	movq	-304(%rbp), %rbx
	jmp	.L1017
.L1754:
	movq	-304(%rbp), %rdi
.L1557:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1477
.L1020:
	movq	reg_map(%rip), %rdx
	cltq
	leaq	0(,%rax,8), %rbx
	cmpq	$0, (%rdx,%rbx)
	je	.L1755
.L1025:
	movq	(%rdx,%rbx), %rbx
	jmp	.L1017
.L1755:
	movl	%r13d, %edi
	xorl	%eax, %eax
	call	gen_reg_rtx
	movq	reg_map(%rip), %rdx
	movq	%rax, (%rdx,%rbx)
	jmp	.L1025
.L1026:
	movq	-304(%rbp), %r13
	movslq	32(%r13),%rcx
	salq	$3, %rcx
	addq	label_map(%rip), %rcx
	movq	(%rcx), %rbx
	jmp	.L1017
.L1033:
	movq	-304(%rbp), %rdx
	movq	32(%rdx), %rbx
	cmpq	%rbx, orig_asm_operands_vector(%rip)
	je	.L1756
.L1018:
	movl	-308(%rbp), %edi
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	call	rtx_alloc
	movq	-304(%rbp), %r8
	movb	%r13b, 2(%rax)
	movzbl	3(%rax), %edi
	movzwl	(%rax), %edx
	movq	%rax, %r12
	movzbl	3(%r8), %r10d
	andb	$-17, %dil
	movzwl	%dx, %r13d 
	andb	$16, %r10b
	orb	%r10b, %dil
	movb	%dil, 3(%rax)
	andb	$-9, %dil
	movzbl	3(%r8), %ebx
	andb	$8, %bl
	orb	%bl, %dil
	movb	%dil, 3(%rax)
	andb	$-5, %dil
	movzbl	3(%r8), %ecx
	andb	$4, %cl
	orb	%cl, %dil
	movb	%dil, 3(%rax)
	cmpl	rtx_length(,%r13,4), %r14d
	movq	rtx_format(,%r13,8), %r15
	jge	.L1384
	.p2align 4,,7
.L1158:
	movsbl	(%r15),%eax
	incq	%r15
	cmpl	$101, %eax
	je	.L1143
	cmpl	$101, %eax
	jg	.L1156
	cmpl	$48, %eax
	je	.L1139
	cmpl	$69, %eax
	jne	.L1316
	movq	-304(%rbp), %r11
	movslq	%r14d,%r13
	leaq	0(,%r13,8), %rbx
	leaq	8(%rbx,%r12), %r13
	addq	$8, %r11
	leaq	(%r11,%rbx), %rcx
	movq	%r11, -336(%rbp)
	movq	(%rcx), %r10
	movq	%r10, (%r13)
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L1444
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L1758
	.p2align 4,,7
.L1444:
	movzwl	(%r12), %edx
.L1139:
	movzwl	%dx, %ebx 
	incl	%r14d
	cmpl	rtx_length(,%rbx,4), %r14d
	jl	.L1158
.L1384:
	cmpl	$22, -308(%rbp)
	je	.L1759
.L1159:
	movq	%r12, %rbx
	jmp	.L1017
.L1759:
	cmpq	$0, orig_asm_operands_vector(%rip)
	jne	.L1159
	movq	-304(%rbp), %rdx
	movq	32(%r12), %r15
	movq	32(%rdx), %r14
	movq	%r15, copy_asm_operands_vector(%rip)
	movq	%r14, orig_asm_operands_vector(%rip)
	jmp	.L1159
.L1758:
	xorl	%eax, %eax
	call	rtvec_alloc
	xorl	%r8d, %r8d
	movq	%rax, (%r13)
	cmpl	(%rax), %r8d
	jae	.L1444
	movq	%rbx, -344(%rbp)
.L1151:
	movq	-336(%rbp), %rdi
	movq	-344(%rbp), %rsi
	movslq	%r8d,%rdx
	movq	(%r13), %rax
	salq	$3, %rdx
	movq	(%rdi,%rsi), %r9
	addq	$8, %rax
	leaq	(%rax,%rdx), %rbx
	xorl	%eax, %eax
	addq	$8, %r9
	movq	(%r9,%rdx), %rdi
	movl	%r8d, -624(%rbp)
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	(%r13), %rbx
	movl	-624(%rbp), %r8d
	incl	%r8d
	cmpl	(%rbx), %r8d
	jb	.L1151
	jmp	.L1444
	.p2align 6,,7
.L1156:
	cmpl	$115, %eax
	je	.L1153
	cmpl	$115, %eax
	jg	.L1157
	cmpl	$105, %eax
	jne	.L1316
	movq	-304(%rbp), %r11
	movslq	%r14d,%r8
	salq	$3, %r8
	movl	8(%r11,%r8), %r10d
	movl	%r10d, 8(%r12,%r8)
	jmp	.L1444
.L1157:
	cmpl	$117, %eax
	jne	.L1316
	movq	-304(%rbp), %rax
	movslq	%r14d,%rsi
	salq	$3, %rsi
	movq	8(%rsi,%rax), %r8
	movslq	8(%r8),%rdi
	salq	$3, %rdi
	addq	insn_map(%rip), %rdi
	movq	(%rdi), %rdx
	movq	%rdx, 8(%rsi,%r12)
	jmp	.L1444
.L1153:
	movq	-304(%rbp), %r9
	movslq	%r14d,%rcx
	salq	$3, %rcx
	movq	8(%rcx,%r9), %r13
	movq	%r13, 8(%rcx,%r12)
	jmp	.L1444
.L1143:
	movq	-304(%rbp), %r9
	movslq	%r14d,%r11
	xorl	%eax, %eax
	salq	$3, %r11
	leaq	8(%r11,%r12), %r13
	movq	8(%r11,%r9), %rdi
	call	copy_rtx_and_substitute
	movq	%rax, (%r13)
	jmp	.L1444
.L1756:
	movl	$22, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	copy_asm_operands_vector(%rip), %rsi
	movq	-304(%rbp), %r8
	movq	%rax, %rbx
	movq	8(%r8), %r11
	movq	%r11, 8(%rax)
	movq	16(%r8), %r10
	movq	%r10, 16(%rax)
	movl	24(%r8), %eax
	movq	%rsi, 32(%rbx)
	movl	%eax, 24(%rbx)
	movq	40(%r8), %rdi
	movq	%rdi, 40(%rbx)
	jmp	.L1017
.L1035:
	movl	optimize(%rip), %eax
	testl	%eax, %eax
	je	.L1037
	movl	flag_no_function_cse(%rip), %ecx
	testl	%ecx, %ecx
	je	.L1018
.L1037:
	movq	-304(%rbp), %rbx
	xorl	%eax, %eax
	movq	8(%rbx), %r12
	movq	8(%r12), %rdi
	call	copy_rtx_and_substitute
	movl	$37, %edi
	movq	-304(%rbp), %r14
	movq	%rax, %rdx
	xorl	%eax, %eax
	movq	8(%r14), %r15
	movzbl	2(%r15), %esi
	call	gen_rtx
	movq	-304(%rbp), %r9
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	16(%r9), %rdi
	call	copy_rtx_and_substitute
	movl	$28, %edi
	movq	-304(%rbp), %r13
	movq	%rax, %rcx
	movzbl	2(%r13), %esi
.L1591:
	movq	%rbx, %rdx
.L1560:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1477
.L1056:
	movq	-304(%rbp), %rdi
	movq	8(%rdi), %r12
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %r12
	je	.L1058
	cmpq	arg_pointer_rtx(%rip), %r12
	je	.L1058
	cmpw	$63, (%r12)
	je	.L1762
.L1059:
	xorl	%eax, %eax
	movl	%r13d, %edi
	movq	%r12, %rsi
	call	memory_address_p
	testl	%eax, %eax
	jne	.L1060
	movzwl	(%r12), %edi
	movzbl	2(%r12), %ebx
	leal	-17(%rdi), %eax
	cmpl	$27, %eax
	ja	.L1063
	mov	%eax, %esi
	jmp	*.L1076(,%rsi,8)
	.section	.rodata
	.align 8
	.align 4
.L1076:
	.quad	.L1070
	.quad	.L1063
	.quad	.L1063
	.quad	.L1063
	.quad	.L1063
	.quad	.L1063
	.quad	.L1063
	.quad	.L1063
	.quad	.L1063
	.quad	.L1063
	.quad	.L1063
	.quad	.L1063
	.quad	.L1063
	.quad	.L1062
	.quad	.L1062
	.quad	.L1063
	.quad	.L1062
	.quad	.L1064
	.quad	.L1063
	.quad	.L1063
	.quad	.L1068
	.quad	.L1070
	.quad	.L1062
	.quad	.L1062
	.quad	.L1063
	.quad	.L1063
	.quad	.L1063
	.quad	.L1066
	.text
.L1064:
	cmpl	$14, 8(%r12)
	je	.L1763
.L1070:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L1475:
	movq	%rax, %r12
.L1062:
	movl	$37, %edi
	movl	%r13d, %esi
	movq	%r12, %rdx
.L1563:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1477
.L1763:
	movq	frame_pointer_rtx(%rip), %rdi
.L1553:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1475
.L1068:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	copy_to_reg
	jmp	.L1475
.L1063:
	xorl	%eax, %eax
	call	rtx_alloc
	xorl	%r11d, %r11d
	movb	%bl, 2(%rax)
	movzbl	3(%rax), %ecx
	movq	%rax, %r14
	movzbl	3(%r12), %r8d
	andb	$-17, %cl
	andb	$16, %r8b
	orb	%r8b, %cl
	movb	%cl, 3(%rax)
	andb	$-9, %cl
	movzbl	3(%r12), %r15d
	andb	$8, %r15b
	orb	%r15b, %cl
	movb	%cl, 3(%rax)
	movzwl	(%r14), %edx
	andb	$-5, %cl
	movzbl	3(%r12), %eax
	movzwl	%dx, %r10d 
	andb	$4, %al
	orb	%al, %cl
	movb	%cl, 3(%r14)
	cmpl	rtx_length(,%r10,4), %r11d
	movl	$0, -564(%rbp)
	movq	rtx_format(,%r10,8), %r9
	movq	%r9, -560(%rbp)
	jge	.L1379
.L1099:
	movq	-560(%rbp), %rbx
	movsbl	(%rbx),%eax
	incq	%rbx
	movq	%rbx, -560(%rbp)
	cmpl	$101, %eax
	je	.L1084
	cmpl	$101, %eax
	jg	.L1097
	cmpl	$48, %eax
	je	.L1080
	cmpl	$69, %eax
	jne	.L1316
	movslq	-564(%rbp),%r8
	leaq	8(%r12), %rax
	movq	%rax, -320(%rbp)
	leaq	0(,%r8,8), %rbx
	leaq	(%rax,%rbx), %r9
	leaq	8(%rbx,%r14), %r15
	movq	(%r9), %rcx
	movq	%rcx, (%r15)
	movq	(%r9), %rax
	testq	%rax, %rax
	je	.L1440
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L1765
.L1440:
	movzwl	(%r14), %edx
.L1080:
	incl	-564(%rbp)
	movzwl	%dx, %r8d 
	movl	-564(%rbp), %ebx
	cmpl	rtx_length(,%r8,4), %ebx
	jl	.L1099
.L1379:
	movq	%r14, %r12
	jmp	.L1062
.L1765:
	xorl	%eax, %eax
	call	rtvec_alloc
	xorl	%r8d, %r8d
	movq	%rax, (%r15)
	cmpl	(%rax), %r8d
	jae	.L1440
	movq	%rbx, -328(%rbp)
.L1092:
	movq	-320(%rbp), %rdi
	movq	-328(%rbp), %rsi
	movslq	%r8d,%rdx
	salq	$3, %rdx
	movq	(%r15), %r11
	xorl	%eax, %eax
	movq	(%rdi,%rsi), %r10
	addq	$8, %r11
	leaq	(%r11,%rdx), %rbx
	addq	$8, %r10
	movq	(%r10,%rdx), %rdi
	movl	%r8d, -624(%rbp)
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	(%r15), %rbx
	movl	-624(%rbp), %r8d
	incl	%r8d
	cmpl	(%rbx), %r8d
	jb	.L1092
	jmp	.L1440
	.p2align 6,,7
.L1097:
	cmpl	$115, %eax
	je	.L1094
	cmpl	$115, %eax
	jg	.L1098
	cmpl	$105, %eax
	jne	.L1316
	movslq	-564(%rbp),%r15
	salq	$3, %r15
	movl	8(%r12,%r15), %r9d
	movl	%r9d, 8(%r14,%r15)
	jmp	.L1440
.L1098:
	cmpl	$117, %eax
	jne	.L1316
	movslq	-564(%rbp),%rdi
	salq	$3, %rdi
	movq	8(%rdi,%r12), %r11
	movslq	8(%r11),%r10
	salq	$3, %r10
	addq	insn_map(%rip), %r10
	movq	(%r10), %rsi
	movq	%rsi, 8(%rdi,%r14)
	jmp	.L1440
.L1094:
	movslq	-564(%rbp),%rcx
	salq	$3, %rcx
	movq	8(%rcx,%r12), %rax
	movq	%rax, 8(%rcx,%r14)
	jmp	.L1440
.L1084:
	movslq	-564(%rbp),%rdx
	xorl	%eax, %eax
	salq	$3, %rdx
	movq	8(%rdx,%r12), %rdi
	leaq	8(%rdx,%r14), %r15
	call	copy_rtx_and_substitute
	movq	%rax, (%r15)
	jmp	.L1440
.L1066:
	movq	8(%r12), %rax
	cmpw	$34, (%rax)
	jne	.L1063
	cmpl	$14, 8(%rax)
	jne	.L1063
	movq	%r12, %rdi
	jmp	.L1553
	.p2align 6,,7
.L1060:
	cmpw	$44, (%r12)
	je	.L1768
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L1133:
	movq	-304(%rbp), %rdi
.L1564:
	movq	%rax, %rdx
	movl	%r13d, %esi
	xorl	%eax, %eax
	call	change_address
	jmp	.L1477
.L1768:
	movq	8(%r12), %rdx
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L1441
	movq	16(%r12), %rax
	cmpq	%rdi, %rax
	je	.L1769
	xorl	%eax, %eax
	movq	%r12, %rsi
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L1123
	movq	8(%r12), %rdi
	cmpw	$30, (%rdi)
	je	.L1770
	movq	16(%r12), %rsi
	cmpw	$30, (%rsi)
	je	.L1555
.L1131:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r12), %rdi
	movq	%rax, %r14
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%r14, %rdx
	movl	$44, %edi
	movzbl	2(%r12), %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1133
.L1555:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	16(%r12), %rax
.L1476:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1133
.L1770:
	movq	16(%r12), %rdi
.L1554:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	8(%r12), %rax
	jmp	.L1476
	.p2align 6,,7
.L1123:
	movq	16(%r12), %rax
	cmpw	$30, (%rax)
	je	.L1772
	movq	8(%r12), %rdi
	cmpw	$30, (%rdi)
	jne	.L1131
	movq	%rax, %rdi
	jmp	.L1554
.L1772:
	movq	8(%r12), %rdi
	jmp	.L1555
	.p2align 6,,7
.L1769:
	cmpq	%rdi, %rdx
	je	.L1104
	cmpq	arg_pointer_rtx(%rip), %rdx
	je	.L1104
	movq	%rdx, %r12
.L1105:
	cmpw	$30, (%r12)
	je	.L1774
.L1106:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	fp_delta(%rip), %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	plus_constant
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L1133
.L1774:
	cmpq	arg_pointer_rtx(%rip), %rdi
	movl	8(%r12), %ebx
	je	.L1775
.L1107:
	movl	%ebx, %edx
	movl	$30, %edi
	movl	$4, %esi
	addl	fp_delta(%rip), %edx
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address_p
	testl	%eax, %eax
	jne	.L1106
	movq	inline_fp_rtx(%rip), %rdi
	movl	%ebx, %esi
.L1593:
	xorl	%eax, %eax
	call	plus_constant
.L1592:
	movl	$37, %edi
	movl	%r13d, %esi
	movq	%rax, %rdx
	jmp	.L1563
.L1775:
	movl	first_parm_offset(%rip), %r9d
	cmpl	%r9d, %ebx
	movl	%r9d, %edi
	jl	.L1107
	cmpl	$-1, %ebx
	leal	3(%rbx), %r10d
	movl	%ebx, %r8d
	cmovle	%r10d, %r8d
	movq	parm_map(%rip), %r14
	movl	%ebx, %esi
	sarl	$2, %r8d
	leal	0(,%r8,4), %r12d
	movslq	%r8d,%rax
	subl	%r12d, %esi
	movq	%r14, %rdx
	cmpq	$0, (%r14,%rax,8)
	jne	.L1382
	leal	3(%r9), %ecx
.L1115:
	decl	%r8d
	movl	%edi, %r11d
	cmpl	$-1, %edi
	cmovle	%ecx, %r11d
	sarl	$2, %r11d
	cmpl	%r11d, %r8d
	jl	.L1316
	movslq	%r8d,%rax
	addl	$4, %esi
	cmpq	$0, (%rdx,%rax,8)
	je	.L1115
.L1382:
	movq	(%rdx,%rax,8), %rbx
	movzbl	2(%rbx), %edi
	movzbl	%dil, %r15d
	movslq	%r15d,%rax
	movl	mode_size(,%rax,4), %ecx
	cmpl	$3, %ecx
	leal	-4(%rcx,%rsi), %r9d
	cmovle	%r9d, %esi
	cmpl	%r13d, %r15d
	je	.L1017
	testb	%dil, %dil
	je	.L1017
	movzwl	(%rbx), %eax
	cmpw	$37, %ax
	je	.L1776
	cmpw	$34, %ax
	jne	.L1316
	movslq	%r13d,%rdx
	addl	mode_size(,%rdx,4), %esi
	cmpl	%ecx, %esi
	jne	.L1316
	movl	$35, %edi
	movl	%r13d, %esi
	movq	%rbx, %rdx
	jmp	.L1556
.L1776:
	movq	8(%rbx), %rdi
	xorl	%eax, %eax
	call	plus_constant
	movq	%rbx, %rdi
	jmp	.L1564
	.p2align 6,,7
.L1104:
	movq	%rdx, %rdi
	movq	%rax, %r12
	jmp	.L1105
.L1441:
	movq	16(%r12), %rax
	jmp	.L1104
.L1762:
	movq	stack_pointer_rtx(%rip), %rdx
	cmpq	%rdx, 8(%r12)
	jne	.L1059
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	jmp	.L1592
.L1058:
	movl	fp_delta(%rip), %esi
	jmp	.L1593
.L1027:
	movl	$38, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	-304(%rbp), %r12
	movb	%r13b, 2(%rax)
	movq	%rax, %rbx
	movq	8(%r12), %r14
	movslq	32(%r14),%r15
	salq	$3, %r15
	addq	label_map(%rip), %r15
	movq	(%r15), %r9
	movq	%r9, 8(%rax)
	jmp	.L1017
.L1038:
	movq	-304(%rbp), %rdx
	movq	frame_pointer_rtx(%rip), %rdi
	movq	8(%rdx), %rax
	cmpq	%rdi, %rax
	je	.L1437
	movq	16(%rdx), %rdx
	cmpq	%rdi, %rdx
	je	.L1777
	movq	-304(%rbp), %rsi
	xorl	%eax, %eax
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L1048
	movq	-304(%rbp), %rsi
	xorl	%eax, %eax
	movl	%r13d, %edi
	call	memory_address_p
	testl	%eax, %eax
	je	.L1048
	movq	-304(%rbp), %rsi
	movq	8(%rsi), %rdi
	cmpw	$30, (%rdi)
	je	.L1778
	movq	-304(%rbp), %rax
	movq	16(%rax), %r9
	cmpw	$30, (%r9)
	je	.L1779
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	-304(%rbp), %r12
	movq	%rax, %r15
	xorl	%eax, %eax
	movq	16(%r12), %rdi
	call	copy_rtx_and_substitute
	movq	%r15, %rdx
	movl	$44, %edi
	movq	-304(%rbp), %r14
	movq	%rax, %rcx
	xorl	%eax, %eax
	movzbl	2(%r14), %esi
	call	gen_rtx
.L1051:
	movq	%rax, %rsi
	movl	%r13d, %edi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L1477
.L1779:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	-304(%rbp), %rcx
	movq	%rax, %rdi
	movq	16(%rcx), %rax
.L1474:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1051
.L1778:
	movq	16(%rsi), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	-304(%rbp), %r11
	movq	%rax, %rdi
	movq	8(%r11), %rax
	jmp	.L1474
	.p2align 6,,7
.L1048:
	movq	-304(%rbp), %rbx
	xorl	%eax, %eax
	movq	8(%rbx), %rdi
	call	copy_rtx_and_substitute
	movq	-304(%rbp), %r8
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	16(%r8), %rdi
	call	copy_rtx_and_substitute
	movl	$44, %edi
	movq	-304(%rbp), %r13
	movq	%rax, %rcx
	movzbl	2(%r13), %esi
	jmp	.L1591
.L1777:
	cmpq	%rdi, %rax
	je	.L1042
	cmpq	arg_pointer_rtx(%rip), %rax
	je	.L1042
	movq	%rax, %rdi
.L1043:
	cmpw	$30, (%rdi)
	je	.L1781
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	%r13d, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	%r13d, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	force_reg
	movq	%rax, %rdi
	jmp	.L1557
.L1781:
	movl	8(%rdi), %edx
	testl	%edx, %edx
	jle	.L1045
	cmpl	$-1, %edx
	leal	3(%rdx), %r10d
	cmovle	%r10d, %edx
	sarl	$2, %edx
	movslq	%edx,%rsi
	salq	$3, %rsi
	addq	parm_map(%rip), %rsi
	movq	(%rsi), %rdx
	movq	8(%rdx), %rbx
	jmp	.L1017
.L1045:
	addl	fp_delta(%rip), %edx
	movl	$30, %edi
	movl	$4, %esi
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	%r13d, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	jmp	.L1560
	.p2align 6,,7
.L1042:
	movq	%rdx, %rdi
	jmp	.L1043
.L1437:
	movq	-304(%rbp), %rdi
	movq	16(%rdi), %rdx
	jmp	.L1042
	.p2align 6,,7
.L1162:
	xorl	%eax, %eax
	call	emit_barrier
.L1478:
	movq	%rax, -112(%rbp)
	jmp	.L332
	.p2align 6,,7
.L1161:
	movq	-472(%rbp), %rax
	movslq	32(%rax),%rsi
	xorl	%eax, %eax
	salq	$3, %rsi
	addq	label_map(%rip), %rsi
	movq	(%rsi), %rdi
	call	emit_label
	movq	%rax, -112(%rbp)
	jmp	.L1480
	.p2align 6,,7
.L1163:
	movq	-472(%rbp), %rbx
	movl	40(%rbx), %esi
	cmpl	$-6, %esi
	je	.L1164
	movq	32(%rbx), %rdi
	xorl	%eax, %eax
	call	emit_note
	jmp	.L1478
.L1164:
	movq	$0, -112(%rbp)
	jmp	.L332
.L1601:
	movq	-64(%rbp), %r12
	movzbl	56(%r12), %eax
	testb	%al, %al
	je	.L323
	movq	-48(%rbp), %r14
	cmpq	$0, -616(%rbp)
	movzbl	%al, %ebx
	movq	88(%r14), %rdi
	movzbl	56(%rdi), %r12d
	je	.L325
	movq	-616(%rbp), %rax
	cmpw	$34, (%rax)
	je	.L1782
.L325:
	movl	%ebx, %edi
	xorl	%eax, %eax
	call	gen_reg_rtx
	movq	%rax, -616(%rbp)
	movq	%rax, inline_target(%rip)
.L326:
	cmpl	%ebx, %r12d
	je	.L324
	movq	-616(%rbp), %rdx
	movl	$35, %edi
	movl	%r12d, %esi
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	call	gen_rtx
	movq	%rax, inline_target(%rip)
	jmp	.L324
.L1782:
	movzbl	2(%rax), %esi
	cmpl	%ebx, %esi
	jne	.L325
	movq	-616(%rbp), %rcx
	movq	%rcx, inline_target(%rip)
	jmp	.L326
	.p2align 6,,7
.L1600:
	movslq	8(%rax),%r13
	movq	-96(%rbp), %r14
	movslq	%ecx,%rdi
	movq	(%r14,%rdi,8), %r12
	salq	$3, %r13
	addq	reg_map(%rip), %r13
	movq	%r12, (%r13)
	jmp	.L290
	.p2align 6,,7
.L292:
	movq	120(%rsi), %rax
	xorl	%edi, %edi
	movzwl	(%rax), %edx
	cmpw	$37, %dx
	je	.L1783
	cmpw	$34, %dx
	je	.L294
	jmp	.L1316
	.p2align 6,,7
.L1783:
	movq	8(%rax), %rax
	cmpw	$44, (%rax)
	je	.L1784
.L296:
	testq	%rdi, %rdi
	je	.L1316
	movl	8(%rdi), %eax
	cmpl	$-1, %eax
	leal	3(%rax), %r9d
	cmovle	%r9d, %eax
	sarl	$2, %eax
	cltq
	jmp	.L1456
.L1784:
	movq	8(%rax), %rdx
	movq	frame_pointer_rtx(%rip), %r8
	cmpq	%r8, %rdx
	je	.L1785
	movq	16(%rax), %rax
.L297:
	cmpq	%r8, %rax
	jne	.L296
	cmpw	$30, (%rdx)
	cmove	%rdx, %rdi
	jmp	.L296
.L1785:
	movq	16(%rax), %rax
	cmpw	$30, (%rax)
	jne	.L297
	movq	%rax, %rdi
	jmp	.L296
	.p2align 6,,7
.L281:
	movq	$0, parm_map(%rip)
	jmp	.L313
.L1599:
	movq	-72(%rbp), %rsi
	movl	$4, %edi
	xorl	%eax, %eax
	call	force_reg
	movq	%rax, -448(%rbp)
	jmp	.L275
	.p2align 6,,7
.L273:
	movq	64(%rbx), %rsi
	movq	16(%rbx), %rdx
	movl	$43, %edi
	xorl	%eax, %eax
	call	build_decl
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	pushdecl
	movslq	%r12d,%r11
	incl	%r12d
	orb	$-128, 26(%rax)
	movq	-96(%rbp), %r13
	movq	(%r13,%r11,8), %r10
	movq	%r10, 120(%rax)
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L273
	jmp	.L1338
	.p2align 6,,7
.L268:
	movq	16(%rbx), %rsi
	movq	96(%rbx), %rdx
	xorl	%eax, %eax
	movq	40(%r15), %r13
	movzbl	56(%rsi), %ecx
	movzbl	56(%rdx), %r14d
	movl	%ecx, -100(%rbp)
	movl	40(%rbx), %esi
	movq	32(%rbx), %rdi
	call	emit_note
	testb	$2, 26(%rbx)
	jne	.L1786
	movzbl	25(%rbx), %edi
	andb	$40, %dil
	cmpb	$32, %dil
	je	.L264
	movl	%r14d, %edi
	xorl	%eax, %eax
	call	gen_reg_rtx
.L1485:
	movq	%rax, %r12
.L1455:
	movq	%r13, %rdi
	movq	%r12, %rsi
	xorl	%edx, %edx
	xorl	%eax, %eax
	call	store_expr
.L263:
	cmpl	-100(%rbp), %r14d
	je	.L267
	movl	-100(%rbp), %edi
	movq	%r12, %rsi
	xorl	%eax, %eax
	call	convert_to_mode
	movq	%rax, %r12
.L267:
	movslq	-436(%rbp),%r9
	movq	-96(%rbp), %r14
	movq	%r12, (%r14,%r9,8)
	movq	8(%r15), %r15
	movq	8(%rbx), %rbx
	incl	-436(%rbp)
	testq	%rbx, %rbx
	jne	.L268
	movq	-48(%rbp), %r15
	movq	96(%r15), %rax
	jmp	.L1336
	.p2align 6,,7
.L264:
	xorl	%esi, %esi
	movl	%r14d, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	movq	%r13, %rdi
	call	expand_expr
	movzwl	(%rax), %edx
	movq	%rax, %r12
	cmpw	$34, %dx
	je	.L263
	leal	-38(%rdx), %r8d
	cmpw	$1, %r8w
	jbe	.L263
	cmpw	$30, %dx
	je	.L263
	cmpw	$32, %dx
	je	.L263
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	copy_to_reg
	movq	%rax, %r12
	jmp	.L263
	.p2align 6,,7
.L1786:
	movq	16(%rbx), %rdi
	xorl	%eax, %eax
	call	int_size_in_bytes
	movl	%r14d, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	call	assign_stack_local
	movl	56(%rbx), %edi
	movq	8(%rax), %rsi
	movq	%rax, %r12
	xorl	%eax, %eax
	call	memory_address_p
	testl	%eax, %eax
	jne	.L1455
	movq	8(%r12), %rdi
	xorl	%eax, %eax
	call	copy_rtx
	xorl	%esi, %esi
	movq	%r12, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	change_address
	jmp	.L1485
	.p2align 6,,7
.L1598:
	cmpq	16(%rcx), %rdi
	je	.L252
	jmp	.L1454
.L1316:
	xorl	%eax, %eax
	call	abort
.LFE3:
.Lfe3:
	.size	expand_inline_function,.Lfe3-expand_inline_function
	.align 2
	.p2align 4,,15
.globl output_inline_function
	.type	output_inline_function,@function
output_inline_function:
.LFB4:
	pushq	%rbp
.LCFI19:
	xorl	%eax, %eax
	pushq	%rbx
.LCFI20:
	movq	%rdi, %rbx
	subq	$8, %rsp
.LCFI21:
	movq	136(%rdi), %rbp
	call	temporary_allocation
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movq	%rbx, current_function_decl(%rip)
	call	expand_function_start
	xorl	%eax, %eax
	movl	128(%rbx), %esi
	movl	$26, %edi
	call	assign_stack_local
	xorl	%eax, %eax
	movq	32(%rbp), %rdi
	call	restore_reg_data
	xorl	%eax, %eax
	movl	40(%rbx), %esi
	movq	32(%rbx), %rdi
	call	expand_function_end
	movq	24(%rbp), %rsi
	movq	%rbp, %rdx
	testq	%rsi, %rsi
	je	.L2309
	.p2align 4,,7
.L2307:
	movq	24(%rsi), %rcx
	movq	%rsi, %rdx
	testq	%rcx, %rcx
	movq	%rcx, %rsi
	jne	.L2307
.L2309:
	movq	32(%rbp), %rdi
	movq	%rdx, %rsi
	xorl	%eax, %eax
	call	set_new_first_and_last_insn
	xorl	%eax, %eax
	movq	%rbx, %rdi
	call	rest_of_compilation
	xorl	%eax, %eax
	movq	$0, current_function_decl(%rip)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	permanent_allocation
.LFE4:
.Lfe4:
	.size	output_inline_function,.Lfe4-output_inline_function
	.local	inline_target
	.comm	inline_target,8,8
	.local	inline_fp_rtx
	.comm	inline_fp_rtx,8,8
	.local	parm_map
	.comm	parm_map,8,8
	.local	fp_addr_p
	.comm	fp_addr_p,8,8
	.local	fp_delta
	.comm	fp_delta,4,4
	.local	orig_asm_operands_vector
	.comm	orig_asm_operands_vector,8,8
	.local	copy_asm_operands_vector
	.comm	copy_asm_operands_vector,8,8
	.align 2
	.p2align 4,,15
	.type	copy_rtx_and_substitute,@function
copy_rtx_and_substitute:
.LFB5:
	pushq	%r15
.LCFI22:
	pushq	%r14
.LCFI23:
	pushq	%r13
.LCFI24:
	pushq	%r12
.LCFI25:
	pushq	%rbp
.LCFI26:
	pushq	%rbx
.LCFI27:
	xorl	%ebx, %ebx
	subq	$72, %rsp
.LCFI28:
	testq	%rdi, %rdi
	movq	%rdi, 64(%rsp)
	je	.L1953
	movq	64(%rsp), %rdx
	movq	64(%rsp), %rbx
	movzwl	(%rdx), %eax
	movl	%eax, 60(%rsp)
	subl	$17, %eax
	movzbl	2(%rbx), %edx
	cmpl	$27, %eax
	movzbl	%dl, %ebp
	ja	.L1955
	mov	%eax, %ecx
	jmp	*.L2073(,%rcx,8)
	.section	.rodata
	.align 8
	.align 4
.L2073:
	.quad	.L1963
	.quad	.L1955
	.quad	.L1955
	.quad	.L1955
	.quad	.L1955
	.quad	.L1970
	.quad	.L1955
	.quad	.L1955
	.quad	.L1955
	.quad	.L1955
	.quad	.L1955
	.quad	.L1972
	.quad	.L2092
	.quad	.L1969
	.quad	.L1969
	.quad	.L1955
	.quad	.L1969
	.quad	.L1956
	.quad	.L1955
	.quad	.L1955
	.quad	.L1994
	.quad	.L1964
	.quad	.L1969
	.quad	.L1969
	.quad	.L1955
	.quad	.L1955
	.quad	.L1955
	.quad	.L1975
	.text
.L1956:
	movq	64(%rsp), %rsi
	movl	8(%rsi), %eax
	cmpl	$55, %eax
	jg	.L1957
	testb	$64, 3(%rsi)
	je	.L1958
	movq	inline_target(%rip), %rdx
	testq	%rdx, %rdx
	je	.L2092
	movzbl	2(%rdx), %esi
	movq	%rdx, %rbx
	cmpl	%esi, %ebp
	jne	.L2341
	.p2align 4,,7
.L1953:
	addq	$72, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L2341:
	movl	$35, %edi
	movl	%ebp, %esi
.L2335:
	addq	$72, %rsp
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	gen_rtx
.L1958:
	cmpl	$14, %eax
	je	.L2342
.L1969:
	movq	64(%rsp), %rbx
	jmp	.L1953
.L2342:
	movq	64(%rsp), %rdi
.L2334:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	plus_constant
.L1957:
	movq	reg_map(%rip), %rdx
	cltq
	leaq	0(,%rax,8), %rbx
	cmpq	$0, (%rdx,%rbx)
	je	.L2343
.L1962:
	movq	(%rdx,%rbx), %rbx
	jmp	.L1953
.L2343:
	movl	%ebp, %edi
	xorl	%eax, %eax
	call	gen_reg_rtx
	movq	reg_map(%rip), %rdx
	movq	%rax, (%rdx,%rbx)
	jmp	.L1962
.L1963:
	movq	64(%rsp), %rax
	movslq	32(%rax),%rdi
	salq	$3, %rdi
	addq	label_map(%rip), %rdi
	movq	(%rdi), %rbx
	jmp	.L1953
.L1970:
	movq	64(%rsp), %r11
	movq	32(%r11), %rbx
	cmpq	%rbx, orig_asm_operands_vector(%rip)
	je	.L2344
	.p2align 4,,7
.L1955:
	movl	60(%rsp), %edi
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	call	rtx_alloc
	movq	64(%rsp), %rcx
	movb	%bpl, 2(%rax)
	movzbl	3(%rax), %r11d
	movzwl	(%rax), %edx
	movq	%rax, %r12
	movzbl	3(%rcx), %ebx
	andb	$-17, %r11b
	movzwl	%dx, %ebp 
	andb	$16, %bl
	orb	%bl, %r11b
	movb	%r11b, 3(%rax)
	andb	$-9, %r11b
	movzbl	3(%rcx), %r8d
	andb	$8, %r8b
	orb	%r8b, %r11b
	movb	%r11b, 3(%rax)
	andb	$-5, %r11b
	movzbl	3(%rcx), %edi
	andb	$4, %dil
	orb	%dil, %r11b
	movb	%r11b, 3(%rax)
	cmpl	rtx_length(,%rbp,4), %r13d
	movq	rtx_format(,%rbp,8), %r14
	jge	.L2316
	.p2align 4,,7
.L2096:
	movsbl	(%r14),%eax
	incq	%r14
	cmpl	$101, %eax
	je	.L2081
	cmpl	$101, %eax
	jg	.L2094
	cmpl	$48, %eax
	je	.L2077
	cmpl	$69, %eax
	jne	.L2092
	movq	64(%rsp), %r8
	movslq	%r13d,%r15
	leaq	0(,%r15,8), %rbx
	leaq	8(%rbx,%r12), %rbp
	addq	$8, %r8
	leaq	(%r8,%rbx), %rdi
	movq	%r8, 32(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, (%rbp)
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L2325
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L2346
	.p2align 4,,7
.L2325:
	movzwl	(%r12), %edx
.L2077:
	movzwl	%dx, %ebx 
	incl	%r13d
	cmpl	rtx_length(,%rbx,4), %r13d
	jl	.L2096
.L2316:
	cmpl	$22, 60(%rsp)
	je	.L2347
.L2097:
	movq	%r12, %rbx
	jmp	.L1953
.L2347:
	cmpq	$0, orig_asm_operands_vector(%rip)
	jne	.L2097
	movq	64(%rsp), %r9
	movq	32(%r12), %r13
	movq	32(%r9), %r14
	movq	%r13, copy_asm_operands_vector(%rip)
	movq	%r14, orig_asm_operands_vector(%rip)
	jmp	.L2097
.L2346:
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	call	rtvec_alloc
	movq	%rax, (%rbp)
	cmpl	(%rax), %r15d
	jae	.L2325
	movq	%rbx, 24(%rsp)
	.p2align 4,,7
.L2089:
	movq	32(%rsp), %rax
	movq	24(%rsp), %rdx
	movslq	%r15d,%r10
	salq	$3, %r10
	movq	(%rbp), %rsi
	incl	%r15d
	movq	(%rax,%rdx), %r9
	xorl	%eax, %eax
	addq	$8, %rsi
	leaq	(%rsi,%r10), %rbx
	addq	$8, %r9
	movq	(%r9,%r10), %rdi
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	(%rbp), %rbx
	cmpl	(%rbx), %r15d
	jb	.L2089
	jmp	.L2325
	.p2align 6,,7
.L2094:
	cmpl	$115, %eax
	je	.L2091
	cmpl	$115, %eax
	jg	.L2095
	cmpl	$105, %eax
	jne	.L2092
	movq	64(%rsp), %rdi
	movslq	%r13d,%rbp
	salq	$3, %rbp
	movl	8(%rdi,%rbp), %r11d
	movl	%r11d, 8(%r12,%rbp)
	jmp	.L2325
	.p2align 6,,7
.L2095:
	cmpl	$117, %eax
	jne	.L2092
	movq	64(%rsp), %r11
	movslq	%r13d,%r10
	salq	$3, %r10
	movq	8(%r10,%r11), %rbp
	movslq	8(%rbp),%rsi
	salq	$3, %rsi
	addq	insn_map(%rip), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, 8(%r10,%r12)
	jmp	.L2325
	.p2align 6,,7
.L2091:
	movq	64(%rsp), %r15
	movslq	%r13d,%rcx
	salq	$3, %rcx
	movq	8(%rcx,%r15), %r8
	movq	%r8, 8(%rcx,%r12)
	jmp	.L2325
	.p2align 6,,7
.L2081:
	movq	64(%rsp), %rax
	movslq	%r13d,%r9
	salq	$3, %r9
	leaq	8(%r9,%r12), %r15
	movq	8(%r9,%rax), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, (%r15)
	jmp	.L2325
.L2344:
	movl	$22, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	copy_asm_operands_vector(%rip), %r14
	movq	64(%rsp), %r13
	movq	%rax, %rbx
	movq	8(%r13), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r13), %r15
	movq	%r15, 16(%rax)
	movl	24(%r13), %eax
	movq	%r14, 32(%rbx)
	movl	%eax, 24(%rbx)
	movq	40(%r13), %r12
	movq	%r12, 40(%rbx)
	jmp	.L1953
.L1972:
	movl	optimize(%rip), %eax
	testl	%eax, %eax
	je	.L1974
	movl	flag_no_function_cse(%rip), %eax
	testl	%eax, %eax
	je	.L1955
.L1974:
	movq	64(%rsp), %rax
	movzbl	%dl, %ebx
	movq	8(%rax), %rsi
	xorl	%eax, %eax
	movq	8(%rsi), %rdi
	call	copy_rtx_and_substitute
	movq	64(%rsp), %r8
	movq	%rax, %rdx
	xorl	%eax, %eax
	movq	8(%r8), %rdi
	movzbl	2(%rdi), %esi
	movl	$37, %edi
	call	gen_rtx
	movq	64(%rsp), %rcx
	movq	%rax, %rbp
	xorl	%eax, %eax
	movq	16(%rcx), %rdi
	call	copy_rtx_and_substitute
	movq	%rbp, %rdx
	movl	%ebx, %esi
	movq	%rax, %rcx
	movl	$28, %edi
.L2333:
	addq	$72, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	gen_rtx
.L1994:
	movq	64(%rsp), %r10
	movq	frame_pointer_rtx(%rip), %rdi
	movq	8(%r10), %r12
	cmpq	%rdi, %r12
	je	.L1996
	cmpq	arg_pointer_rtx(%rip), %r12
	je	.L1996
	cmpw	$63, (%r12)
	je	.L2350
.L1997:
	xorl	%eax, %eax
	movl	%ebp, %edi
	movq	%r12, %rsi
	call	memory_address_p
	testl	%eax, %eax
	jne	.L1998
	movzwl	(%r12), %edi
	movzbl	2(%r12), %ebx
	leal	-17(%rdi), %eax
	cmpl	$27, %eax
	ja	.L2001
	mov	%eax, %r13d
	jmp	*.L2014(,%r13,8)
	.section	.rodata
	.align 8
	.align 4
.L2014:
	.quad	.L2008
	.quad	.L2001
	.quad	.L2001
	.quad	.L2001
	.quad	.L2001
	.quad	.L2001
	.quad	.L2001
	.quad	.L2001
	.quad	.L2001
	.quad	.L2001
	.quad	.L2001
	.quad	.L2001
	.quad	.L2001
	.quad	.L2000
	.quad	.L2000
	.quad	.L2001
	.quad	.L2000
	.quad	.L2002
	.quad	.L2001
	.quad	.L2001
	.quad	.L2006
	.quad	.L2008
	.quad	.L2000
	.quad	.L2000
	.quad	.L2001
	.quad	.L2001
	.quad	.L2001
	.quad	.L2004
	.text
.L2002:
	cmpl	$14, 8(%r12)
	je	.L2351
.L2008:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L2327:
	movq	%rax, %r12
.L2000:
	movl	$37, %edi
	movl	%ebp, %esi
	movq	%r12, %rdx
.L2332:
	addq	$72, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	gen_rtx
.L2351:
	movq	frame_pointer_rtx(%rip), %rdi
.L2336:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L2327
.L2006:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	copy_to_reg
	jmp	.L2327
.L2001:
	xorl	%eax, %eax
	call	rtx_alloc
	movb	%bl, 2(%rax)
	movzbl	3(%rax), %r15d
	movzwl	(%rax), %edx
	movzbl	3(%r12), %r8d
	xorl	%ebx, %ebx
	movq	%rax, %r13
	andb	$-17, %r15b
	movzwl	%dx, %r14d 
	andb	$16, %r8b
	orb	%r8b, %r15b
	movb	%r15b, 3(%rax)
	andb	$-9, %r15b
	movzbl	3(%r12), %ecx
	andb	$8, %cl
	orb	%cl, %r15b
	movb	%r15b, 3(%rax)
	andb	$-5, %r15b
	movzbl	3(%r12), %edi
	andb	$4, %dil
	orb	%dil, %r15b
	movb	%r15b, 3(%rax)
	cmpl	rtx_length(,%r14,4), %ebx
	movl	$0, 20(%rsp)
	movq	rtx_format(,%r14,8), %r15
	jge	.L2311
.L2037:
	movsbl	(%r15),%eax
	incq	%r15
	cmpl	$101, %eax
	je	.L2022
	cmpl	$101, %eax
	jg	.L2035
	cmpl	$48, %eax
	je	.L2018
	cmpl	$69, %eax
	jne	.L2092
	movslq	20(%rsp),%r14
	leaq	8(%r12), %r8
	movq	%r8, 48(%rsp)
	leaq	0(,%r14,8), %rbx
	leaq	(%r8,%rbx), %rdi
	leaq	8(%rbx,%r13), %r14
	movq	(%rdi), %rcx
	movq	%rcx, (%r14)
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L2321
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L2353
.L2321:
	movzwl	(%r13), %edx
.L2018:
	incl	20(%rsp)
	movzwl	%dx, %r14d 
	movl	20(%rsp), %ebx
	cmpl	rtx_length(,%r14,4), %ebx
	jl	.L2037
.L2311:
	movq	%r13, %r12
	jmp	.L2000
.L2353:
	xorl	%eax, %eax
	call	rtvec_alloc
	xorl	%r8d, %r8d
	movq	%rax, (%r14)
	cmpl	(%rax), %r8d
	jae	.L2321
	movq	%rbx, 40(%rsp)
.L2030:
	movq	48(%rsp), %rax
	movq	40(%rsp), %rsi
	movslq	%r8d,%rdx
	salq	$3, %rdx
	movq	(%r14), %r10
	movq	(%rax,%rsi), %r9
	xorl	%eax, %eax
	addq	$8, %r10
	leaq	(%r10,%rdx), %rbx
	addq	$8, %r9
	movq	(%r9,%rdx), %rdi
	movl	%r8d, 8(%rsp)
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	(%r14), %rbx
	movl	8(%rsp), %r8d
	incl	%r8d
	cmpl	(%rbx), %r8d
	jb	.L2030
	jmp	.L2321
	.p2align 6,,7
.L2035:
	cmpl	$115, %eax
	je	.L2032
	cmpl	$115, %eax
	jg	.L2036
	cmpl	$105, %eax
	jne	.L2092
	movslq	20(%rsp),%r11
	salq	$3, %r11
	movl	8(%r12,%r11), %edi
	movl	%edi, 8(%r13,%r11)
	jmp	.L2321
.L2036:
	cmpl	$117, %eax
	jne	.L2092
	movslq	20(%rsp),%rsi
	salq	$3, %rsi
	movq	8(%rsi,%r12), %r11
	movslq	8(%r11),%r10
	salq	$3, %r10
	addq	insn_map(%rip), %r10
	movq	(%r10), %r9
	movq	%r9, 8(%rsi,%r13)
	jmp	.L2321
.L2032:
	movslq	20(%rsp),%rcx
	salq	$3, %rcx
	movq	8(%rcx,%r12), %r8
	movq	%r8, 8(%rcx,%r13)
	jmp	.L2321
.L2022:
	movslq	20(%rsp),%rdx
	xorl	%eax, %eax
	salq	$3, %rdx
	movq	8(%rdx,%r12), %rdi
	leaq	8(%rdx,%r13), %r14
	call	copy_rtx_and_substitute
	movq	%rax, (%r14)
	jmp	.L2321
.L2004:
	movq	8(%r12), %rax
	cmpw	$34, (%rax)
	jne	.L2001
	cmpl	$14, 8(%rax)
	jne	.L2001
	movq	%r12, %rdi
	jmp	.L2336
	.p2align 6,,7
.L1998:
	cmpw	$44, (%r12)
	je	.L2356
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L2071:
	movq	64(%rsp), %rdi
.L2331:
	addq	$72, %rsp
	movl	%ebp, %esi
	movq	%rax, %rdx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	xorl	%eax, %eax
	jmp	change_address
.L2356:
	movq	8(%r12), %rdx
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L2322
	movq	16(%r12), %rax
	cmpq	%rdi, %rax
	je	.L2357
	xorl	%eax, %eax
	movq	%r12, %rsi
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L2061
	movq	8(%r12), %rdi
	cmpw	$30, (%rdi)
	je	.L2358
	movq	16(%r12), %rsi
	cmpw	$30, (%rsi)
	je	.L2340
.L2069:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r12), %rdi
	movq	%rax, %r14
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%r14, %rdx
	movl	$44, %edi
	movzbl	2(%r12), %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L2071
.L2340:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	16(%r12), %rax
.L2328:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L2071
.L2358:
	movq	16(%r12), %rdi
.L2339:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	8(%r12), %rax
	jmp	.L2328
.L2061:
	movq	16(%r12), %rax
	cmpw	$30, (%rax)
	je	.L2360
	movq	8(%r12), %rdi
	cmpw	$30, (%rdi)
	jne	.L2069
	movq	%rax, %rdi
	jmp	.L2339
.L2360:
	movq	8(%r12), %rdi
	jmp	.L2340
	.p2align 6,,7
.L2357:
	cmpq	%rdi, %rdx
	je	.L2042
	cmpq	arg_pointer_rtx(%rip), %rdx
	je	.L2042
	movq	%rdx, %r12
.L2043:
	cmpw	$30, (%r12)
	je	.L2362
.L2044:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	fp_delta(%rip), %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	plus_constant
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L2071
.L2362:
	cmpq	arg_pointer_rtx(%rip), %rdi
	movl	8(%r12), %ebx
	je	.L2363
.L2045:
	movl	%ebx, %edx
	movl	$30, %edi
	movl	$4, %esi
	addl	fp_delta(%rip), %edx
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address_p
	testl	%eax, %eax
	jne	.L2044
	movq	inline_fp_rtx(%rip), %rdi
	movl	%ebx, %esi
.L2337:
	xorl	%eax, %eax
	call	plus_constant
.L2338:
	movl	$37, %edi
	movl	%ebp, %esi
	movq	%rax, %rdx
	jmp	.L2332
.L2363:
	movl	first_parm_offset(%rip), %edi
	cmpl	%edi, %ebx
	jl	.L2045
	cmpl	$-1, %ebx
	leal	3(%rbx), %r13d
	movl	%ebx, %ecx
	cmovle	%r13d, %ecx
	movq	parm_map(%rip), %rdx
	movl	%ebx, %esi
	sarl	$2, %ecx
	leal	0(,%rcx,4), %r12d
	movslq	%ecx,%rax
	subl	%r12d, %esi
	cmpq	$0, (%rdx,%rax,8)
	jne	.L2314
	leal	3(%rdi), %r8d
.L2053:
	decl	%ecx
	movl	%edi, %r15d
	cmpl	$-1, %edi
	cmovle	%r8d, %r15d
	sarl	$2, %r15d
	cmpl	%r15d, %ecx
	jl	.L2092
	movslq	%ecx,%rax
	addl	$4, %esi
	cmpq	$0, (%rdx,%rax,8)
	je	.L2053
.L2314:
	movq	(%rdx,%rax,8), %rbx
	movzbl	2(%rbx), %edi
	movzbl	%dil, %r9d
	movslq	%r9d,%r10
	movl	mode_size(,%r10,4), %ecx
	cmpl	$3, %ecx
	leal	-4(%rcx,%rsi), %eax
	cmovle	%eax, %esi
	cmpl	%ebp, %r9d
	je	.L1953
	testb	%dil, %dil
	je	.L1953
	movzwl	(%rbx), %eax
	cmpw	$37, %ax
	je	.L2364
	cmpw	$34, %ax
	jne	.L2092
	movslq	%ebp,%rdx
	addl	mode_size(,%rdx,4), %esi
	cmpl	%ecx, %esi
	jne	.L2092
	movl	$35, %edi
	movl	%ebp, %esi
	movq	%rbx, %rdx
	jmp	.L2335
.L2364:
	movq	8(%rbx), %rdi
	xorl	%eax, %eax
	call	plus_constant
	movq	%rbx, %rdi
	jmp	.L2331
	.p2align 6,,7
.L2042:
	movq	%rdx, %rdi
	movq	%rax, %r12
	jmp	.L2043
.L2322:
	movq	16(%r12), %rax
	jmp	.L2042
.L2350:
	movq	stack_pointer_rtx(%rip), %r11
	cmpq	%r11, 8(%r12)
	jne	.L1997
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	jmp	.L2338
.L1996:
	movl	fp_delta(%rip), %esi
	jmp	.L2337
.L1964:
	movl	$38, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	64(%rsp), %r10
	movb	%bpl, 2(%rax)
	movq	%rax, %rbx
	movq	8(%r10), %r9
	movslq	32(%r9),%r8
	salq	$3, %r8
	addq	label_map(%rip), %r8
	movq	(%r8), %rbp
	movq	%rbp, 8(%rax)
	jmp	.L1953
.L1975:
	movq	64(%rsp), %rdx
	movq	frame_pointer_rtx(%rip), %rdi
	movq	8(%rdx), %rax
	cmpq	%rdi, %rax
	je	.L2318
	movq	16(%rdx), %rdx
	cmpq	%rdi, %rdx
	je	.L2365
	movq	64(%rsp), %rsi
	xorl	%eax, %eax
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L1986
	movq	64(%rsp), %rsi
	xorl	%eax, %eax
	movl	%ebp, %edi
	call	memory_address_p
	testl	%eax, %eax
	je	.L1987
	movq	64(%rsp), %rax
	movq	8(%rax), %rdi
	cmpw	$30, (%rdi)
	je	.L2366
	movq	64(%rsp), %rdx
	movq	16(%rdx), %r15
	cmpw	$30, (%r15)
	je	.L2367
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	64(%rsp), %rcx
	movq	%rax, %r12
	xorl	%eax, %eax
	movq	16(%rcx), %rdi
	call	copy_rtx_and_substitute
	movq	%r12, %rdx
	movq	64(%rsp), %rdi
	movq	%rax, %rcx
	xorl	%eax, %eax
	movzbl	2(%rdi), %esi
	movl	$44, %edi
	call	gen_rtx
.L1989:
	movq	%rax, %rsi
	movl	%ebp, %edi
	xorl	%eax, %eax
	call	memory_address
.L2330:
	movq	%rax, %rbx
	jmp	.L1953
.L2367:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	64(%rsp), %rbx
	movq	%rax, %rdi
	movq	16(%rbx), %rax
.L2326:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1989
.L2366:
	movq	16(%rax), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	64(%rsp), %r14
	movq	%rax, %rdi
	movq	8(%r14), %rax
	jmp	.L2326
.L1987:
	movq	64(%rsp), %r8
	xorl	%eax, %eax
	movq	8(%r8), %rdi
	call	copy_rtx_and_substitute
	movq	64(%rsp), %rbp
	movq	%rax, %rbx
	movq	16(%rbp), %rdi
.L2329:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rbx, %rdx
	movl	$44, %edi
	movq	64(%rsp), %r9
	movq	%rax, %rcx
	xorl	%eax, %eax
	movzbl	2(%r9), %esi
	call	gen_rtx
	jmp	.L2330
.L1986:
	movq	64(%rsp), %rax
	movq	8(%rax), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	64(%rsp), %rsi
	movq	%rax, %rbx
	movq	16(%rsi), %rdi
	jmp	.L2329
.L2365:
	cmpq	%rdi, %rax
	je	.L1979
	cmpq	arg_pointer_rtx(%rip), %rax
	je	.L1979
	movq	%rax, %rdi
.L1980:
	cmpw	$30, (%rdi)
	jne	.L1981
	movl	8(%rdi), %edx
	testl	%edx, %edx
	jle	.L1982
	cmpl	$-1, %edx
	leal	3(%rdx), %r13d
	cmovle	%r13d, %edx
	sarl	$2, %edx
	movslq	%edx,%r12
	salq	$3, %r12
	addq	parm_map(%rip), %r12
	movq	(%r12), %r11
	movq	8(%r11), %rbx
	jmp	.L1953
.L1982:
	addl	fp_delta(%rip), %edx
	movl	$30, %edi
	movl	$4, %esi
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	%ebp, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	jmp	.L2333
.L1981:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	%ebp, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	%ebp, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	force_reg
	movq	%rax, %rdi
	jmp	.L2334
.L1979:
	movq	%rdx, %rdi
	jmp	.L1980
.L2318:
	movq	64(%rsp), %r10
	movq	16(%r10), %rdx
	jmp	.L1979
.L2092:
	xorl	%eax, %eax
	call	abort
.LFE5:
.Lfe5:
	.size	copy_rtx_and_substitute,.Lfe5-copy_rtx_and_substitute
	.align 2
	.p2align 4,,15
	.type	copy_decl_tree,@function
copy_decl_tree:
.LFB6:
	pushq	%r15
.LCFI29:
	xorl	%eax, %eax
	pushq	%r14
.LCFI30:
	pushq	%r13
.LCFI31:
	pushq	%r12
.LCFI32:
	pushq	%rbp
.LCFI33:
	pushq	%rbx
.LCFI34:
	subq	$120, %rsp
.LCFI35:
	movq	%rdi, 112(%rsp)
	movl	%esi, 108(%rsp)
	xorl	%edi, %edi
	call	pushlevel
	movq	112(%rsp), %rdx
	movq	56(%rdx), %rbp
	testq	%rbp, %rbp
	jne	.L1946
.L2370:
	movq	112(%rsp), %rbp
	movq	48(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L2380
	movl	108(%rsp), %ebp
	incl	%ebp
	.p2align 4,,7
.L1952:
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movl	%ebp, %esi
	call	copy_decl_tree
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L1952
.L2380:
	movl	108(%rsp), %eax
	testl	%eax, %eax
	setg	%r12b
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	xorl	%esi, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	movzbl	%r12b, %edi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	poplevel
	.p2align 6,,7
.L1946:
	movzbl	24(%rbp), %edi
	movq	16(%rbp), %rdx
	xorl	%eax, %eax
	movq	64(%rbp), %rsi
	call	build_decl
	movq	120(%rbp), %r14
	movq	32(%rbp), %rdx
	movq	%rax, %r12
	movl	40(%rbp), %eax
	testq	%r14, %r14
	movq	%rdx, 32(%r12)
	movl	%eax, 40(%r12)
	je	.L1798
	cmpw	$37, (%r14)
	je	.L2408
.L1799:
	leaq	120(%r12), %rax
	xorl	%ebx, %ebx
	testq	%r14, %r14
	movq	%rax, 96(%rsp)
	je	.L1803
	movzwl	(%r14), %esi
	movl	%esi, %eax
	movl	%esi, 92(%rsp)
	movzbl	2(%r14), %r15d
	subl	$17, %eax
	cmpl	$27, %eax
	ja	.L1804
	mov	%eax, %edi
	jmp	*.L1921(,%rdi,8)
	.section	.rodata
	.align 8
	.align 4
.L1921:
	.quad	.L1812
	.quad	.L1804
	.quad	.L1804
	.quad	.L1804
	.quad	.L1804
	.quad	.L1819
	.quad	.L1804
	.quad	.L1804
	.quad	.L1804
	.quad	.L1804
	.quad	.L1804
	.quad	.L1821
	.quad	.L1940
	.quad	.L1818
	.quad	.L1818
	.quad	.L1804
	.quad	.L1818
	.quad	.L1805
	.quad	.L1804
	.quad	.L1804
	.quad	.L1842
	.quad	.L1813
	.quad	.L1818
	.quad	.L1818
	.quad	.L1804
	.quad	.L1804
	.quad	.L1804
	.quad	.L1824
	.text
.L1805:
	movl	8(%r14), %eax
	cmpl	$55, %eax
	jg	.L1806
	testb	$64, 3(%r14)
	je	.L1807
	movq	inline_target(%rip), %rdx
	testq	%rdx, %rdx
	je	.L1940
	movzbl	2(%rdx), %r8d
	movq	%rdx, %rbx
	cmpl	%r8d, %r15d
	je	.L1803
	movl	$35, %edi
	movl	%r15d, %esi
.L2396:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	call	gen_rtx
.L2392:
	movq	%rax, %rbx
	.p2align 4,,7
.L1803:
	movq	96(%rsp), %r13
	movq	%rbx, (%r13)
.L1798:
	movzbl	25(%rbp), %r9d
	movzbl	25(%r12), %esi
	movzbl	26(%r12), %r11d
	andb	$1, %r9b
	andb	$-2, %sil
	orb	%r9b, %sil
	andb	$-3, %r11b
	movb	%sil, 25(%r12)
	andb	$-5, %sil
	movzbl	25(%rbp), %r8d
	andb	$4, %r8b
	orb	%r8b, %sil
	movb	%sil, 25(%r12)
	andb	$-3, %sil
	movzbl	25(%rbp), %edi
	andb	$2, %dil
	orb	%dil, %sil
	movq	%r12, %rdi
	movb	%sil, 25(%r12)
	andb	$-65, %sil
	movzbl	25(%rbp), %ebx
	andb	$64, %bl
	orb	%bl, %sil
	movb	%sil, 25(%r12)
	andb	$-33, %sil
	movzbl	26(%rbp), %r15d
	andb	$2, %r15b
	orb	%r15b, %r11b
	movb	%r11b, 26(%r12)
	orb	$-128, %r11b
	movzbl	25(%rbp), %ecx
	andb	$32, %cl
	orb	%cl, %sil
	movb	%sil, 25(%r12)
	andb	$-9, %sil
	movzbl	25(%rbp), %eax
	movb	%r11b, 26(%r12)
	andb	$8, %al
	orb	%al, %sil
	xorl	%eax, %eax
	movb	%sil, 25(%r12)
	call	pushdecl
	movq	8(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L1946
	jmp	.L2370
.L1807:
	cmpl	$14, %eax
	movq	%r14, %rdi
	je	.L2397
.L1818:
	movq	%r14, %rbx
	jmp	.L1803
.L2397:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L2392
.L1806:
	movq	reg_map(%rip), %rdx
	cltq
	leaq	0(,%rax,8), %rbx
	cmpq	$0, (%rdx,%rbx)
	je	.L2409
.L1811:
	movq	(%rdx,%rbx), %rbx
	jmp	.L1803
.L2409:
	movl	%r15d, %edi
	xorl	%eax, %eax
	call	gen_reg_rtx
	movq	reg_map(%rip), %rdx
	movq	%rax, (%rdx,%rbx)
	jmp	.L1811
.L1812:
	movslq	32(%r14),%r9
	salq	$3, %r9
	addq	label_map(%rip), %r9
	movq	(%r9), %rbx
	jmp	.L1803
.L1819:
	movq	32(%r14), %rdx
	cmpq	%rdx, orig_asm_operands_vector(%rip)
	je	.L2410
.L1804:
	movl	92(%rsp), %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	rtx_alloc
	movb	%r15b, 2(%rax)
	movzbl	3(%rax), %r10d
	movzwl	(%rax), %edx
	movzbl	3(%r14), %r8d
	movq	%rax, %r13
	andb	$-17, %r10b
	movzwl	%dx, %r15d 
	andb	$16, %r8b
	orb	%r8b, %r10b
	movb	%r10b, 3(%rax)
	andb	$-9, %r10b
	movzbl	3(%r14), %r11d
	andb	$8, %r11b
	orb	%r11b, %r10b
	movb	%r10b, 3(%rax)
	andb	$-5, %r10b
	movzbl	3(%r14), %edi
	andb	$4, %dil
	orb	%dil, %r10b
	movb	%r10b, 3(%rax)
	cmpl	rtx_length(,%r15,4), %ebx
	movl	$0, 12(%rsp)
	movq	rtx_format(,%r15,8), %rcx
	movq	%rcx, 16(%rsp)
	jge	.L2377
	.p2align 4,,7
.L1944:
	movq	16(%rsp), %r9
	movsbl	(%r9),%eax
	incq	%r9
	movq	%r9, 16(%rsp)
	cmpl	$101, %eax
	je	.L1929
	cmpl	$101, %eax
	jg	.L1942
	cmpl	$48, %eax
	je	.L1925
	cmpl	$69, %eax
	jne	.L1940
	movslq	12(%rsp),%r9
	leaq	8(%r14), %r8
	movq	%r8, 48(%rsp)
	leaq	0(,%r9,8), %rbx
	leaq	(%r8,%rbx), %rdi
	leaq	8(%rbx,%r13), %r15
	movq	(%rdi), %r11
	movq	%r11, (%r15)
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L2388
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L2412
	.p2align 4,,7
.L2388:
	movzwl	(%r13), %edx
.L1925:
	incl	12(%rsp)
	movzwl	%dx, %r9d 
	movl	12(%rsp), %r10d
	cmpl	rtx_length(,%r9,4), %r10d
	jl	.L1944
.L2377:
	cmpl	$22, 92(%rsp)
	je	.L2413
.L1945:
	movq	%r13, %rbx
	jmp	.L1803
.L2413:
	cmpq	$0, orig_asm_operands_vector(%rip)
	jne	.L1945
	movq	32(%r14), %rdx
	movq	32(%r13), %r14
	movq	%rdx, orig_asm_operands_vector(%rip)
	movq	%r14, copy_asm_operands_vector(%rip)
	jmp	.L1945
.L2412:
	xorl	%eax, %eax
	call	rtvec_alloc
	xorl	%r8d, %r8d
	movq	%rax, (%r15)
	cmpl	(%rax), %r8d
	jae	.L2388
	movq	%rbx, 40(%rsp)
.L1937:
	movq	48(%rsp), %rax
	movq	40(%rsp), %rsi
	movslq	%r8d,%r11
	salq	$3, %r11
	movq	(%r15), %rcx
	movq	(%rax,%rsi), %r10
	xorl	%eax, %eax
	addq	$8, %rcx
	leaq	(%rcx,%r11), %rbx
	addq	$8, %r10
	movq	(%r10,%r11), %rdi
	movl	%r8d, (%rsp)
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	(%r15), %rdx
	movl	(%rsp), %r8d
	incl	%r8d
	cmpl	(%rdx), %r8d
	jb	.L1937
	jmp	.L2388
	.p2align 6,,7
.L1942:
	cmpl	$115, %eax
	je	.L1939
	cmpl	$115, %eax
	jg	.L1943
	cmpl	$105, %eax
	jne	.L1940
	movslq	12(%rsp),%r15
	salq	$3, %r15
	movl	8(%r14,%r15), %ebx
	movl	%ebx, 8(%r13,%r15)
	jmp	.L2388
.L1943:
	cmpl	$117, %eax
	jne	.L1940
	movslq	12(%rsp),%rsi
	salq	$3, %rsi
	movq	8(%rsi,%r14), %r10
	movslq	8(%r10),%rcx
	salq	$3, %rcx
	addq	insn_map(%rip), %rcx
	movq	(%rcx), %rbx
	movq	%rbx, 8(%rsi,%r13)
	jmp	.L2388
.L1939:
	movslq	12(%rsp),%rdi
	salq	$3, %rdi
	movq	8(%rdi,%r14), %r8
	movq	%r8, 8(%rdi,%r13)
	jmp	.L2388
.L1929:
	movslq	12(%rsp),%rdx
	xorl	%eax, %eax
	salq	$3, %rdx
	movq	8(%rdx,%r14), %rdi
	leaq	8(%rdx,%r13), %r15
	call	copy_rtx_and_substitute
	movq	%rax, (%r15)
	jmp	.L2388
.L2410:
	movl	$22, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	copy_asm_operands_vector(%rip), %rcx
	movq	8(%r14), %rdi
	movq	%rax, %rbx
	movq	%rdi, 8(%rax)
	movq	16(%r14), %rsi
	movq	%rsi, 16(%rax)
	movl	24(%r14), %eax
	movq	%rcx, 32(%rbx)
	movl	%eax, 24(%rbx)
	movq	40(%r14), %r15
	movq	%r15, 40(%rbx)
	jmp	.L1803
.L1821:
	movl	optimize(%rip), %eax
	testl	%eax, %eax
	je	.L1823
	movl	flag_no_function_cse(%rip), %eax
	testl	%eax, %eax
	je	.L1804
.L1823:
	movq	8(%r14), %r8
	xorl	%eax, %eax
	movq	8(%r8), %rdi
	call	copy_rtx_and_substitute
	movl	$37, %edi
	movq	8(%r14), %rbx
	movq	%rax, %rdx
	xorl	%eax, %eax
	movzbl	2(%rbx), %esi
	call	gen_rtx
	movq	16(%r14), %rdi
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movl	$28, %edi
	movzbl	2(%r14), %esi
	movq	%rax, %rcx
.L2405:
	movq	%rbx, %rdx
.L2400:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L2392
.L1842:
	movq	8(%r14), %r13
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %r13
	je	.L1844
	cmpq	arg_pointer_rtx(%rip), %r13
	je	.L1844
	cmpw	$63, (%r13)
	je	.L2416
.L1845:
	xorl	%eax, %eax
	movl	%r15d, %edi
	movq	%r13, %rsi
	call	memory_address_p
	testl	%eax, %eax
	jne	.L1846
	movzwl	(%r13), %edi
	movzbl	2(%r13), %ebx
	leal	-17(%rdi), %eax
	cmpl	$27, %eax
	ja	.L1849
	mov	%eax, %ecx
	jmp	*.L1862(,%rcx,8)
	.section	.rodata
	.align 8
	.align 4
.L1862:
	.quad	.L1856
	.quad	.L1849
	.quad	.L1849
	.quad	.L1849
	.quad	.L1849
	.quad	.L1849
	.quad	.L1849
	.quad	.L1849
	.quad	.L1849
	.quad	.L1849
	.quad	.L1849
	.quad	.L1849
	.quad	.L1849
	.quad	.L1848
	.quad	.L1848
	.quad	.L1849
	.quad	.L1848
	.quad	.L1850
	.quad	.L1849
	.quad	.L1849
	.quad	.L1854
	.quad	.L1856
	.quad	.L1848
	.quad	.L1848
	.quad	.L1849
	.quad	.L1849
	.quad	.L1849
	.quad	.L1852
	.text
.L1850:
	cmpl	$14, 8(%r13)
	je	.L2417
.L1856:
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L2390:
	movq	%rax, %r13
.L1848:
	movl	$37, %edi
	movl	%r15d, %esi
	movq	%r13, %rdx
.L2403:
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L2392
.L2417:
	movq	frame_pointer_rtx(%rip), %rdi
.L2393:
	movl	fp_delta(%rip), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L2390
.L1854:
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	copy_to_reg
	jmp	.L2390
.L1849:
	xorl	%eax, %eax
	call	rtx_alloc
	movb	%bl, 2(%rax)
	movzwl	(%rax), %edx
	movq	%rax, %r14
	movzbl	3(%rax), %ebx
	movzbl	3(%r13), %r10d
	movzwl	%dx, %edi 
	andb	$16, %r10b
	andb	$-17, %bl
	orb	%r10b, %bl
	movb	%bl, 3(%rax)
	andb	$-9, %bl
	movzbl	3(%r13), %r9d
	andb	$8, %r9b
	orb	%r9b, %bl
	movb	%bl, 3(%rax)
	andb	$-5, %bl
	movzbl	3(%r13), %r8d
	andb	$4, %r8b
	orb	%r8b, %bl
	movb	%bl, 3(%rax)
	xorl	%eax, %eax
	movl	$0, 28(%rsp)
	cmpl	rtx_length(,%rdi,4), %eax
	movq	rtx_format(,%rdi,8), %rsi
	movq	%rsi, 32(%rsp)
	jge	.L2372
.L1885:
	movq	32(%rsp), %r11
	movsbl	(%r11),%eax
	incq	%r11
	movq	%r11, 32(%rsp)
	cmpl	$101, %eax
	je	.L1870
	cmpl	$101, %eax
	jg	.L1883
	cmpl	$48, %eax
	je	.L1866
	cmpl	$69, %eax
	jne	.L1940
	movslq	28(%rsp),%rdx
	leaq	8(%r13), %r11
	movq	%r11, 72(%rsp)
	leaq	0(,%rdx,8), %rbx
	leaq	8(%rbx,%r14), %r9
	leaq	(%r11,%rbx), %r8
	movq	%r9, 80(%rsp)
	movq	(%r8), %r10
	movq	%r10, (%r9)
	movq	(%r8), %rax
	testq	%rax, %rax
	je	.L2384
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L2419
.L2384:
	movzwl	(%r14), %edx
.L1866:
	incl	28(%rsp)
	movzwl	%dx, %r10d 
	movl	28(%rsp), %edi
	cmpl	rtx_length(,%r10,4), %edi
	jl	.L1885
.L2372:
	movq	%r14, %r13
	jmp	.L1848
.L2419:
	xorl	%eax, %eax
	call	rtvec_alloc
	xorl	%r8d, %r8d
	movq	80(%rsp), %rdx
	movq	%rax, (%rdx)
	cmpl	(%rax), %r8d
	jae	.L2384
	movq	%rbx, 64(%rsp)
	movq	%rdx, 56(%rsp)
.L1878:
	movq	72(%rsp), %rdi
	movq	64(%rsp), %r11
	movslq	%r8d,%r10
	movq	56(%rsp), %rbx
	salq	$3, %r10
	xorl	%eax, %eax
	movq	(%rdi,%r11), %r9
	movq	(%rbx), %rsi
	addq	$8, %r9
	movq	(%r9,%r10), %rdi
	addq	$8, %rsi
	movl	%r8d, (%rsp)
	leaq	(%rsi,%r10), %rbx
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	movq	56(%rsp), %rax
	movl	(%rsp), %r8d
	movq	(%rax), %rcx
	incl	%r8d
	cmpl	(%rcx), %r8d
	jb	.L1878
	jmp	.L2384
	.p2align 6,,7
.L1883:
	cmpl	$115, %eax
	je	.L1880
	cmpl	$115, %eax
	jg	.L1884
	cmpl	$105, %eax
	jne	.L1940
	movslq	28(%rsp),%r8
	salq	$3, %r8
	movl	8(%r13,%r8), %ecx
	movl	%ecx, 8(%r14,%r8)
	jmp	.L2384
.L1884:
	cmpl	$117, %eax
	jne	.L1940
	movslq	28(%rsp),%rcx
	salq	$3, %rcx
	movq	8(%rcx,%r13), %rbx
	movslq	8(%rbx),%rsi
	salq	$3, %rsi
	addq	insn_map(%rip), %rsi
	movq	(%rsi), %rdi
	movq	%rdi, 8(%rcx,%r14)
	jmp	.L2384
.L1880:
	movslq	28(%rsp),%r9
	salq	$3, %r9
	movq	8(%r9,%r13), %rax
	movq	%rax, 8(%r9,%r14)
	jmp	.L2384
.L1870:
	movslq	28(%rsp),%rdx
	xorl	%eax, %eax
	salq	$3, %rdx
	movq	8(%rdx,%r13), %rdi
	leaq	8(%rdx,%r14), %rbx
	call	copy_rtx_and_substitute
	movq	%rax, (%rbx)
	jmp	.L2384
.L1852:
	movq	8(%r13), %rax
	cmpw	$34, (%rax)
	jne	.L1849
	cmpl	$14, 8(%rax)
	jne	.L1849
	movq	%r13, %rdi
	jmp	.L2393
	.p2align 6,,7
.L1846:
	cmpw	$44, (%r13)
	je	.L2422
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
.L1919:
	movq	%r14, %rdi
.L2404:
	movq	%rax, %rdx
	movl	%r15d, %esi
	xorl	%eax, %eax
	call	change_address
	jmp	.L2392
.L2422:
	movq	8(%r13), %rdx
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %rdx
	je	.L2385
	movq	16(%r13), %rax
	cmpq	%rdi, %rax
	je	.L2423
	xorl	%eax, %eax
	movq	%r13, %rsi
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L1909
	movq	8(%r13), %rdi
	cmpw	$30, (%rdi)
	je	.L2424
	movq	16(%r13), %rsi
	cmpw	$30, (%rsi)
	je	.L2395
.L1917:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r13), %rdi
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rbx, %rdx
	movl	$44, %edi
	movzbl	2(%r13), %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	gen_rtx
	jmp	.L1919
.L2395:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	16(%r13), %rax
.L2391:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1919
.L2424:
	movq	16(%r13), %rdi
.L2394:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	8(%r13), %rax
	jmp	.L2391
.L1909:
	movq	16(%r13), %rax
	cmpw	$30, (%rax)
	je	.L2426
	movq	8(%r13), %rdi
	cmpw	$30, (%rdi)
	jne	.L1917
	movq	%rax, %rdi
	jmp	.L2394
.L2426:
	movq	8(%r13), %rdi
	jmp	.L2395
	.p2align 6,,7
.L2423:
	cmpq	%rdi, %rdx
	je	.L1890
	cmpq	arg_pointer_rtx(%rip), %rdx
	je	.L1890
	movq	%rdx, %r13
.L1891:
	cmpw	$30, (%r13)
	je	.L2428
.L1892:
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	fp_delta(%rip), %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	plus_constant
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L1919
.L2428:
	cmpq	arg_pointer_rtx(%rip), %rdi
	movl	8(%r13), %ebx
	je	.L2429
.L1893:
	movl	%ebx, %edx
	movl	$30, %edi
	movl	$4, %esi
	addl	fp_delta(%rip), %edx
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	$4, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	$4, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	memory_address_p
	testl	%eax, %eax
	jne	.L1892
	movq	inline_fp_rtx(%rip), %rdi
	movl	%ebx, %esi
.L2407:
	xorl	%eax, %eax
	call	plus_constant
.L2406:
	movl	$37, %edi
	movl	%r15d, %esi
	movq	%rax, %rdx
	jmp	.L2403
.L2429:
	movl	first_parm_offset(%rip), %edi
	cmpl	%edi, %ebx
	jl	.L1893
	cmpl	$-1, %ebx
	leal	3(%rbx), %r13d
	movl	%ebx, %ecx
	cmovle	%r13d, %ecx
	movq	parm_map(%rip), %rdx
	movl	%ebx, %esi
	sarl	$2, %ecx
	leal	0(,%rcx,4), %r14d
	movslq	%ecx,%rax
	subl	%r14d, %esi
	cmpq	$0, (%rdx,%rax,8)
	jne	.L2375
	leal	3(%rdi), %r8d
.L1901:
	decl	%ecx
	movl	%edi, %r11d
	cmpl	$-1, %edi
	cmovle	%r8d, %r11d
	sarl	$2, %r11d
	cmpl	%r11d, %ecx
	jl	.L1940
	movslq	%ecx,%rax
	addl	$4, %esi
	cmpq	$0, (%rdx,%rax,8)
	je	.L1901
.L2375:
	movq	(%rdx,%rax,8), %rbx
	movzbl	2(%rbx), %edi
	movzbl	%dil, %r8d
	movslq	%r8d,%rax
	movl	mode_size(,%rax,4), %ecx
	cmpl	$3, %ecx
	leal	-4(%rcx,%rsi), %r9d
	cmovle	%r9d, %esi
	cmpl	%r15d, %r8d
	je	.L1803
	testb	%dil, %dil
	je	.L1803
	movzwl	(%rbx), %eax
	cmpw	$37, %ax
	je	.L2430
	cmpw	$34, %ax
	jne	.L1940
	movslq	%r15d,%rdx
	addl	mode_size(,%rdx,4), %esi
	cmpl	%ecx, %esi
	jne	.L1940
	movl	$35, %edi
	movl	%r15d, %esi
	movq	%rbx, %rdx
	jmp	.L2396
.L2430:
	movq	8(%rbx), %rdi
	xorl	%eax, %eax
	call	plus_constant
	movq	%rbx, %rdi
	jmp	.L2404
	.p2align 6,,7
.L1890:
	movq	%rdx, %rdi
	movq	%rax, %r13
	jmp	.L1891
.L2385:
	movq	16(%r13), %rax
	jmp	.L1890
.L2416:
	movq	stack_pointer_rtx(%rip), %rdx
	cmpq	%rdx, 8(%r13)
	jne	.L1845
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	jmp	.L2406
.L1844:
	movl	fp_delta(%rip), %esi
	jmp	.L2407
.L1813:
	movl	$38, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movb	%r15b, 2(%rax)
	movq	%rax, %rbx
	movq	8(%r14), %r13
	movslq	32(%r13),%r11
	salq	$3, %r11
	addq	label_map(%rip), %r11
	movq	(%r11), %r10
	movq	%r10, 8(%rax)
	jmp	.L1803
.L1824:
	movq	8(%r14), %rax
	movq	frame_pointer_rtx(%rip), %rdi
	cmpq	%rdi, %rax
	je	.L2381
	movq	16(%r14), %rdx
	cmpq	%rdi, %rdx
	je	.L2431
	xorl	%eax, %eax
	movq	%r14, %rsi
	call	reg_mentioned_p
	testl	%eax, %eax
	je	.L1834
	xorl	%eax, %eax
	movl	%r15d, %edi
	movq	%r14, %rsi
	call	memory_address_p
	testl	%eax, %eax
	je	.L1834
	movq	8(%r14), %rdi
	cmpw	$30, (%rdi)
	je	.L2432
	movq	16(%r14), %r11
	cmpw	$30, (%r11)
	je	.L2433
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r14), %rdi
	movq	%rax, %r13
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%r13, %rdx
	movl	$44, %edi
	movzbl	2(%r14), %esi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	gen_rtx
.L1837:
	movq	%rax, %rsi
	movl	%r15d, %edi
	xorl	%eax, %eax
	call	memory_address
	jmp	.L2392
.L2433:
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	16(%r14), %rax
.L2389:
	movl	8(%rax), %esi
	xorl	%eax, %eax
	call	plus_constant
	jmp	.L1837
.L2432:
	movq	16(%r14), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	%rax, %rdi
	movq	8(%r14), %rax
	jmp	.L2389
.L1834:
	movq	8(%r14), %rdi
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	16(%r14), %rdi
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movl	$44, %edi
	movzbl	2(%r14), %esi
	movq	%rax, %rcx
	jmp	.L2405
.L2431:
	cmpq	%rdi, %rax
	je	.L1828
	cmpq	arg_pointer_rtx(%rip), %rax
	je	.L1828
	movq	%rax, %rdi
.L1829:
	cmpw	$30, (%rdi)
	je	.L2435
	xorl	%eax, %eax
	call	copy_rtx_and_substitute
	movq	frame_pointer_rtx(%rip), %rdx
	movl	%r15d, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	xorl	%eax, %eax
	call	gen_rtx
	movl	%r15d, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	force_reg
	movq	%rax, %rdi
	jmp	.L2397
.L2435:
	movl	8(%rdi), %edx
	testl	%edx, %edx
	jle	.L1831
	cmpl	$-1, %edx
	leal	3(%rdx), %r10d
	cmovle	%r10d, %edx
	sarl	$2, %edx
	movslq	%edx,%r9
	salq	$3, %r9
	addq	parm_map(%rip), %r9
	movq	(%r9), %r14
	movq	8(%r14), %rbx
	jmp	.L1803
.L1831:
	addl	fp_delta(%rip), %edx
	movl	$30, %edi
	movl	$4, %esi
	xorl	%eax, %eax
	call	gen_rtx
	movq	frame_pointer_rtx(%rip), %rdx
	movl	%r15d, %esi
	movq	%rax, %rcx
	movl	$44, %edi
	jmp	.L2400
	.p2align 6,,7
.L1828:
	movq	%rdx, %rdi
	jmp	.L1829
.L2381:
	movq	16(%r14), %rdx
	jmp	.L1828
	.p2align 6,,7
.L2408:
	movq	8(%r14), %rbx
	movzwl	(%rbx), %edx
	leal	-38(%rdx), %ecx
	cmpw	$1, %cx
	jbe	.L1800
	cmpw	$30, %dx
	je	.L1800
	cmpw	$32, %dx
	jne	.L1799
.L1800:
	movq	%r14, 120(%r12)
	jmp	.L1798
.L1940:
	xorl	%eax, %eax
	call	abort
.LFE6:
.Lfe6:
	.size	copy_decl_tree,.Lfe6-copy_decl_tree
	.local	reg_map
	.comm	reg_map,8,8
	.local	label_map
	.comm	label_map,8,8
	.local	insn_map
	.comm	insn_map,8,8
	.local	parmdecl_map
	.comm	parmdecl_map,8,8
	.local	max_parm_reg
	.comm	max_parm_reg,4,4
	.local	first_parm_offset
	.comm	first_parm_offset,4,4
	.align 2
	.p2align 4,,15
	.type	copy_for_inline,@function
copy_for_inline:
.LFB7:
	pushq	%r15
.LCFI36:
	pushq	%r14
.LCFI37:
	pushq	%r13
.LCFI38:
	movq	%rdi, %r13
	pushq	%r12
.LCFI39:
	pushq	%rbp
.LCFI40:
	pushq	%rbx
.LCFI41:
	movq	%rdi, %rbx
	subq	$40, %rsp
.LCFI42:
	testq	%rdi, %rdi
	je	.L198
	movzwl	(%rdi), %eax
	movl	%eax, 36(%rsp)
	subl	$22, %eax
	cmpl	$19, %eax
	ja	.L200
	mov	%eax, %edx
	jmp	*.L222(,%rdx,8)
	.section	.rodata
	.align 8
	.align 4
.L222:
	.quad	.L207
	.quad	.L200
	.quad	.L200
	.quad	.L220
	.quad	.L200
	.quad	.L200
	.quad	.L200
	.quad	.L200
	.quad	.L198
	.quad	.L198
	.quad	.L200
	.quad	.L198
	.quad	.L217
	.quad	.L200
	.quad	.L200
	.quad	.L209
	.quad	.L216
	.quad	.L198
	.quad	.L198
	.quad	.L198
	.text
.L207:
	movq	32(%rdi), %rax
	cmpq	%rax, orig_asm_operands_vector(%rip)
	je	.L2440
	.p2align 4,,7
.L200:
	movl	36(%rsp), %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	%r13, %rsi
	movslq	36(%rsp),%r14
	movq	%rax, (%rsp)
	movq	(%rsp), %rdi
	cld
	leaq	0(,%r14,4), %rdx
	movl	rtx_length(%rdx), %eax
	incl	%eax
	cltq
	salq	$2, %rax
	movq	%rax, %rcx
	shrq	$3, %rcx
	testl	$4, %eax 
	rep
	movsq
	je	.L226
	movl	(%rsi), %eax
	movl	%eax, (%rdi)
.L226:
	xorl	%r12d, %r12d
	movq	rtx_format(,%r14,8), %rbp
	cmpl	rtx_length(%rdx), %r12d
	jge	.L2437
	movq	(%rsp), %r15
	addq	$8, %r15
	movq	%r15, 24(%rsp)
	movq	%r15, 16(%rsp)
	.p2align 4,,7
.L245:
	movsbl	(%rbp),%eax
	incq	%rbp
	cmpl	$101, %eax
	je	.L232
	cmpl	$101, %eax
	jg	.L244
	cmpl	$69, %eax
	je	.L235
.L229:
	incl	%r12d
	cmpl	rtx_length(,%r14,4), %r12d
	jl	.L245
.L2437:
	cmpl	$22, 36(%rsp)
	je	.L2441
.L246:
	movq	(%rsp), %r13
.L198:
	addq	$40, %rsp
	movq	%r13, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L2441:
	cmpq	$0, orig_asm_operands_vector(%rip)
	jne	.L246
	movq	(%rsp), %r12
	movq	32(%r13), %r15
	movq	32(%r12), %rbp
	movq	%r15, orig_asm_operands_vector(%rip)
	movq	%rbp, copy_asm_operands_vector(%rip)
	jmp	.L246
	.p2align 6,,7
.L235:
	movq	(%rsp), %rdi
	movslq	%r12d,%rdx
	leaq	8(%rdi,%rdx,8), %rbx
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L229
	movl	(%rax), %edi
	testl	%edi, %edi
	je	.L229
	leaq	8(%rax), %rsi
	xorl	%r15d, %r15d
	xorl	%eax, %eax
	call	gen_rtvec_v
	movq	%rax, (%rbx)
	cmpl	(%rax), %r15d
	jae	.L229
	movq	%rbx, 8(%rsp)
	.p2align 4,,7
.L241:
	movq	8(%rsp), %r11
	movslq	%r15d,%r9
	xorl	%eax, %eax
	incl	%r15d
	movq	(%r11), %r10
	addq	$8, %r10
	leaq	(%r10,%r9,8), %rbx
	movq	(%rbx), %rdi
	call	copy_for_inline
	movq	%rax, (%rbx)
	movq	8(%rsp), %r8
	movq	(%r8), %rbx
	cmpl	(%rbx), %r15d
	jb	.L241
	jmp	.L229
	.p2align 6,,7
.L244:
	cmpl	$117, %eax
	jne	.L229
	movq	16(%rsp), %rsi
	movslq	%r12d,%r14
	movq	(%rsi,%r14,8), %r13
	movslq	8(%r13),%rax
	salq	$3, %rax
	addq	insn_map(%rip), %rax
.L2439:
	movq	(%rax), %r13
	jmp	.L198
	.p2align 6,,7
.L232:
	movq	24(%rsp), %rcx
	movslq	%r12d,%rax
	leaq	(%rcx,%rax,8), %r15
	xorl	%eax, %eax
	movq	(%r15), %rdi
	call	copy_for_inline
	movq	%rax, (%r15)
	jmp	.L229
.L2440:
	movl	$22, %edi
	xorl	%eax, %eax
	call	rtx_alloc
	movq	copy_asm_operands_vector(%rip), %rcx
	movq	8(%rbx), %rdi
	movq	%rax, %r13
	movq	%rdi, 8(%rax)
	movq	16(%rbx), %rsi
	movq	%rsi, 16(%rax)
	movl	24(%rbx), %eax
	movq	%rcx, 32(%r13)
	movl	%eax, 24(%r13)
	movq	40(%rbx), %rdx
	movq	%rdx, 40(%r13)
	jmp	.L198
.L220:
	movq	8(%rdi), %rax
	cmpw	$34, (%rax)
	jne	.L200
	movl	8(%rax), %eax
	cmpl	max_parm_reg(%rip), %eax
	jge	.L200
	cmpl	$55, %eax
	jle	.L200
	cltq
	salq	$3, %rax
	addq	parmdecl_map(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L200
	andb	$-33, 25(%rax)
	jmp	.L200
	.p2align 6,,7
.L217:
	movl	8(%rdi), %eax
	cmpl	$55, %eax
	jle	.L198
	cltq
	salq	$3, %rax
	addq	reg_map(%rip), %rax
	jmp	.L2439
.L209:
	movq	8(%rdi), %rcx
	movzwl	(%rcx), %edx
	leal	-38(%rdx), %ebx
	cmpw	$1, %bx
	jbe	.L198
	cmpw	$30, %dx
	je	.L198
	cmpw	$32, %dx
	je	.L198
	cmpw	$44, %dx
	jne	.L200
	movq	8(%rcx), %rax
	cmpw	$34, (%rax)
	jne	.L200
	cmpl	$14, 8(%rax)
	jne	.L200
	movq	16(%rcx), %r8
	movzwl	(%r8), %edx
	leal	-38(%rdx), %ebp
	cmpw	$1, %bp
	jbe	.L213
	cmpw	$30, %dx
	je	.L213
	cmpw	$32, %dx
	jne	.L200
.L213:
	cmpw	$34, (%rcx)
	jne	.L200
	cmpl	$14, 8(%rcx)
	jne	.L200
	movq	16(%r13), %r10
	movzwl	(%r10), %edx
	leal	-38(%rdx), %r9d
	cmpw	$1, %r9w
	jbe	.L198
	cmpw	$30, %dx
	je	.L198
	cmpw	$32, %dx
	jne	.L200
	jmp	.L198
	.p2align 6,,7
.L216:
	movq	8(%rdi), %r12
	movzbl	2(%rdi), %esi
	xorl	%eax, %eax
	movl	$38, %edi
	movslq	32(%r12),%r11
	salq	$3, %r11
	addq	label_map(%rip), %r11
	movq	(%r11), %rdx
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	gen_rtx
.LFE7:
.Lfe7:
	.size	copy_for_inline,.Lfe7-copy_for_inline
	.section	.eh_frame,"aw",@progbits
.Lframe1:
	.long	.LECIE1-.LSCIE1
.LSCIE1:
	.long	0x0
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -8
	.byte	0x10
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.byte	0x90
	.uleb128 0x1
	.align 8
.LECIE1:
.LSFDE1:
	.long	.LEFDE1-.LASFDE1
.LASFDE1:
	.long	.LASFDE1-.Lframe1
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.byte	0x4
	.long	.LCFI0-.LFB1
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x20
	.byte	0x83
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x8c
	.uleb128 0x2
	.align 8
.LEFDE1:
.LSFDE3:
	.long	.LEFDE3-.LASFDE3
.LASFDE3:
	.long	.LASFDE3-.Lframe1
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.byte	0x4
	.long	.LCFI3-.LFB2
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI10-.LCFI4
	.byte	0x83
	.uleb128 0x7
	.byte	0x8c
	.uleb128 0x6
	.byte	0x8d
	.uleb128 0x5
	.byte	0x8e
	.uleb128 0x4
	.byte	0x8f
	.uleb128 0x3
	.align 8
.LEFDE3:
.LSFDE5:
	.long	.LEFDE5-.LASFDE5
.LASFDE5:
	.long	.LASFDE5-.Lframe1
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.byte	0x4
	.long	.LCFI11-.LFB3
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0x8f
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI18-.LCFI13
	.byte	0x83
	.uleb128 0x7
	.byte	0x8c
	.uleb128 0x6
	.byte	0x8d
	.uleb128 0x5
	.byte	0x8e
	.uleb128 0x4
	.align 8
.LEFDE5:
.LSFDE7:
	.long	.LEFDE7-.LASFDE7
.LASFDE7:
	.long	.LASFDE7-.Lframe1
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.byte	0x4
	.long	.LCFI19-.LFB4
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x20
	.align 8
.LEFDE7:
.LSFDE9:
	.long	.LEFDE9-.LASFDE9
.LASFDE9:
	.long	.LASFDE9-.Lframe1
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.byte	0x4
	.long	.LCFI22-.LFB5
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.long	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.long	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.long	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x38
	.byte	0x83
	.uleb128 0x7
	.byte	0x86
	.uleb128 0x6
	.byte	0x8c
	.uleb128 0x5
	.byte	0x8d
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x3
	.byte	0x8f
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x80
	.align 8
.LEFDE9:
.LSFDE11:
	.long	.LEFDE11-.LASFDE11
.LASFDE11:
	.long	.LASFDE11-.Lframe1
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.byte	0x4
	.long	.LCFI29-.LFB6
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI30-.LCFI29
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.long	.LCFI32-.LCFI31
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.long	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.long	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.long	.LCFI35-.LCFI34
	.byte	0xe
	.uleb128 0xb0
	.byte	0x83
	.uleb128 0x7
	.byte	0x86
	.uleb128 0x6
	.byte	0x8c
	.uleb128 0x5
	.byte	0x8d
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x3
	.byte	0x8f
	.uleb128 0x2
	.align 8
.LEFDE11:
.LSFDE13:
	.long	.LEFDE13-.LASFDE13
.LASFDE13:
	.long	.LASFDE13-.Lframe1
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.byte	0x4
	.long	.LCFI36-.LFB7
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI38-.LCFI37
	.byte	0xe
	.uleb128 0x20
	.byte	0x8d
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x3
	.byte	0x8f
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI39-.LCFI38
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.long	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.long	.LCFI41-.LCFI40
	.byte	0xe
	.uleb128 0x38
	.byte	0x83
	.uleb128 0x7
	.byte	0x86
	.uleb128 0x6
	.byte	0x8c
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0x60
	.align 8
.LEFDE13:
	.ident	"GCC: (GNU) 3.2"
