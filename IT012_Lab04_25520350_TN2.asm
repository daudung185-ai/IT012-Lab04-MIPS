# Đậu Anh Dũng | MSSV 25520350 | TN2 - Lenh dieu khien: Phan bac dien nang
# Ke hoach thanh ghi:
# $s0: dien nang tieu thu nhap tu ban phim (kWh)
# $s1: bac gia dien (1..4)
# $t0: thanh ghi tam luu ket qua so sanh slti
# $a0, $v0: tham so va ma lenh syscall

.data
prompt: .asciiz "Nhap dien nang (kWh): "
msg:    .asciiz "Bac: "
nl:     .asciiz "\n"

.text
.globl main
main:
  # In chuoi thong bao nhap
  li  $v0, 4
  la  $a0, prompt
  syscall

  # Doc so nguyen kWh tu ban phim
  li  $v0, 5
  syscall
  add $s0, $v0, $zero   # $s0 = dien nang (kWh)

  # Xac dinh bac theo Bang 6:
  # Bac 1: tu 0 den 100 kWh (kWh < 101)
  slti $t0, $s0, 101
  bne  $t0, $zero, Bac1

  # Bac 2: tu 101 den 150 kWh (kWh < 151)
  slti $t0, $s0, 151
  bne  $t0, $zero, Bac2

  # Bac 3: tu 151 den 200 kWh (kWh < 201)
  slti $t0, $s0, 201
  bne  $t0, $zero, Bac3

  # Bac 4: tu 201 tro len
  j    Bac4

Bac1:
  addi $s1, $zero, 1
  j    InKetQua

Bac2:
  addi $s1, $zero, 2
  j    InKetQua

Bac3:
  addi $s1, $zero, 3
  j    InKetQua

Bac4:
  addi $s1, $zero, 4
  j    InKetQua

InKetQua:
  # In chuoi "Bac: "
  li  $v0, 4
  la  $a0, msg
  syscall

  # In gia tri bac ($s1)
  li  $v0, 1
  add $a0, $s1, $zero
  syscall

  # In dau xuong dong
  li  $v0, 4
  la  $a0, nl
  syscall

  # Thoat chuong trinh
  li  $v0, 10
  syscall
