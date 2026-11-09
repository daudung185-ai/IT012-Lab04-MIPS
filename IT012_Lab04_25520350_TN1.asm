# Đậu Anh Dũng | MSSV 25520350 | TN1 - Bo nho va mang: Tinh dien nang 3 thang dau
# Ke hoach thanh ghi:
# $s0: dia chi nen cua mang reading
# $s1: dia chi nen cua mang usage
# $t0: reading[i] (chi so thang dau ky)
# $t1: reading[i+1] (chi so thang cuoi ky)
# $t2: dien nang thang (reading[i+1] - reading[i])
# $v0: ma lenh syscall

.data
reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995
usage:   .space 48

.text
.globl main
main:
  la  $s0, reading      # $s0 = dia chi nen cua reading
  la  $s1, usage        # $s1 = dia chi nen cua usage

  # Thang 1: usage[0] = reading[1] - reading[0]
  lw  $t0, 0($s0)       # $t0 = reading[0] = 1000
  lw  $t1, 4($s0)       # $t1 = reading[1] = 1095
  sub $t2, $t1, $t0     # $t2 = 1095 - 1000 = 95
  sw  $t2, 0($s1)       # usage[0] = 95

  # Thang 2: usage[1] = reading[2] - reading[1]
  lw  $t0, 4($s0)       # $t0 = reading[1] = 1095
  lw  $t1, 8($s0)       # $t1 = reading[2] = 1205
  sub $t2, $t1, $t0     # $t2 = 1205 - 1095 = 110
  sw  $t2, 4($s1)       # usage[1] = 110

  # Thang 3: usage[2] = reading[3] - reading[2]
  lw  $t0, 8($s0)       # $t0 = reading[2] = 1205
  lw  $t1, 12($s0)      # $t1 = reading[3] = 1345
  sub $t2, $t1, $t0     # $t2 = 1345 - 1205 = 140
  sw  $t2, 8($s1)       # usage[2] = 140

  li  $v0, 10           # Thoat chuong trinh
  syscall
