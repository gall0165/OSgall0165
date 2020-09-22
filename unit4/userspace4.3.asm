.pc = $801 "Basic"
:BasicUpstart(main)
.pc = $80d "Program"
main: {
    jsr call_syscall00
    jsr call_syscall01
  __b1:
    jmp __b1
}
//Function that triggers SYSCALL $01 similar like SYSCALL $00
call_syscall01: {
    jsr enable_syscalls
    lda #0
    sta $d641
    nop
    rts
}
//Function that tells the MEGA65 retro computer to allow system calls to be made 
enable_syscalls: {
    lda #$47
    sta $d02f
    lda #$53
    sta $d02f
    rts
}
//Function that triggers SYSCALL $00
call_syscall00: {
    jsr enable_syscalls
    lda #0
    sta $d640
    //writing any value
    nop
    rts
}
