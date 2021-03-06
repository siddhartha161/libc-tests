/*
 * Copyright (c) 2013 The Native Client Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#define STORE_MASK $t7
#define JUMP_MASK $t6

        .p2align 4
        .globl try_operations_with_snans
try_operations_with_snans:
        addiu $sp, $sp, -8
        and   $sp, $sp, STORE_MASK
        li $v0, 0x7fc00000
        sw $v0, 0($sp)

        lwc1 $f1, 0($sp)
        lwc1 $f0, 0($sp)
        add.s $f2, $f1, $f0
        sub.s $f2, $f1, $f0

        mul.s $f2, $f1, $f0
        div.s $f2, $f1, $f0
        addiu $sp, $sp, 8
        and   $sp, $sp, STORE_MASK

        and $ra, $ra, JUMP_MASK
        jr $ra
        nop
