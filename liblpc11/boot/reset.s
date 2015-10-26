/* Reset code for ARM Simulator
 *
 * Version: Sourcery CodeBench 2012.09-85
 * Support: https://support.codesourcery.com/GNUToolchain/
 *
 * Copyright (c) 2007-2010 CodeSourcery, Inc.
 * Copyright (c) 2010-2012 Mentor Graphics, Inc.
 *
 * The authors hereby grant permission to use, copy, modify, distribute,
 * and license this software and its documentation for any purpose, provided
 * that existing copyright notices are retained in all copies and that this
 * notice is included verbatim in any distributions.  No written agreement,
 * license, or royalty fee is required for any of the authorized uses.
 * Modifications to this software may be copyrighted by their authors
 * and need not follow the licensing terms described here, provided that
 * the new terms are clearly indicated on the first page of each file where
 * they apply.
 */

	.thumb
	.thumb_func
	.section .cs3.reset,"ax",%progbits
	.globl __cs3_reset
	.type	__cs3_reset, %function
__cs3_reset:
	ldr	r0,=__cs3_start_asm
	bx	r0
	.pool
	.size	__cs3_reset,.-__cs3_reset
