	.thumb
	.thumb_func
	.section .cs3.reset,"ax",%progbits
	.globl __cs3_start_asm_generic
	.type	__cs3_start_asm_generic, %function
__cs3_start_asm_generic:
	ldr	r0,=__cs3_start_c
	bx	r0
	.pool
	.size	__cs3_start_asm_generic,.-__cs3_start_asm_generic
