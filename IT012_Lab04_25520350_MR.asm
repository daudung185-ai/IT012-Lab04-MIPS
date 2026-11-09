# Đậu Anh Dũng | MSSV 25520350 | MR - Dem so thang theo bac dien
# $s0/$s1: nen reading/usage; $s2: chi so; $s3: so thang.
# $s4: nen cnt; $s5: so bac. $t1: offset; $t2/$t6: dia chi phan tu.
# $t3/$t4: chi so cong to; $t5: kWh; $t7: so sanh; $t0: bac (0..3).
# $a0/$v0: tham so/ma syscall.
.data
prefix: .asciiz "Bac "
sep: .asciiz ": "
nl: .asciiz "\n"
.align 2
reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995
usage:   .space 48
cnt: .word 0, 0, 0, 0

.text
.globl main
main:
  la $s0, reading
  la $s1, usage
  addi $s2, $zero, 0
  addi $s3, $zero, 12
Loop:
  beq $s2, $s3, InitCount
  sll $t1, $s2, 2
  add $t2, $s0, $t1
  lw $t3, 0($t2)
  lw $t4, 4($t2)
  sub $t5, $t4, $t3
  add $t6, $s1, $t1
  sw $t5, 0($t6)
  addi $s2, $s2, 1
  j Loop
InitCount:
  la $s4, cnt
  addi $s5, $zero, 4
  addi $s2, $zero, 0
CountLoop:
  beq $s2, $s3, InitPrint
  sll $t1, $s2, 2
  add $t6, $s1, $t1
  lw $t5, 0($t6)
  addi $t0, $zero, 0
  slti $t7, $t5, 101
  bne $t7, $zero, CountMonth
  addi $t0, $zero, 1
  slti $t7, $t5, 151
  bne $t7, $zero, CountMonth
  addi $t0, $zero, 2
  slti $t7, $t5, 201
  bne $t7, $zero, CountMonth
  addi $t0, $zero, 3
CountMonth:
  sll $t1, $t0, 2
  add $t2, $s4, $t1
  lw $t3, 0($t2)
  addi $t3, $t3, 1
  sw $t3, 0($t2)
  addi $s2, $s2, 1
  j CountLoop
InitPrint:
  addi $s2, $zero, 0
PrintLoop:
  beq $s2, $s5, Done
  li $v0, 4
  la $a0, prefix
  syscall
  addi $a0, $s2, 1
  li $v0, 1
  syscall
  li $v0, 4
  la $a0, sep
  syscall
  sll $t1, $s2, 2
  add $t2, $s4, $t1
  lw $t3, 0($t2)
  li $v0, 1
  add $a0, $t3, $zero
  syscall
  li $v0, 4
  la $a0, nl
  syscall
  addi $s2, $s2, 1
  j PrintLoop
Done:
  li $v0, 10
  syscall
