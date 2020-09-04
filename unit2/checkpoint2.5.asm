//*****************************
//Name : KickCSource
//Purpuse: Is a source file that provides data structures for the 
//SYSCALL/trap table
//******************************
  .file [name="checkpoint2.5.bin", type="bin", segments="XMega65Bin"]
.segmentdef XMega65Bin [segments="Syscall, Code, Data, Stack, Zeropage"]
.segmentdef Syscall [start=$8000, max=$81ff]
.segmentdef Code [start=$8200, min=$8200, max=$bdff]
.segmentdef Data [startAfter="Code", min=$8200, max=$bdff]
.segmentdef Stack [min=$be00, max=$beff, fill]
.segmentdef Zeropage [min=$bf00, max=$bfff, fill]
  .label VIC_MEMORY = $d018
  .label SCREEN = $400
  .label COLS = $d800
  .const GREEN = 5
  .const CYAN = 3
  //To save writing 0x4C and 0xEA all the time, we define them as constants 
  .const JMP = $4c
  .const NOP = $ea
.segment Code
main: {
    rts
}
CPUKIL: {
    jsr exit_hypervisor
    rts
}
exit_hypervisor: {
    // Trigger exit from Hypervisor mode
    lda #1
    sta $d67f
    rts
}
RESERVED: {
    jsr exit_hypervisor
    rts
}
VF011WR: {
    jsr exit_hypervisor
    rts
}
VF011RD: {
    jsr exit_hypervisor
    rts
}
ALTTABKEY: {
    jsr exit_hypervisor
    rts
}
RESTORKEY: {
    jsr exit_hypervisor
    rts
}
PAGFAULT: {
    jsr exit_hypervisor
    rts
}
syscall3F: {
    jsr exit_hypervisor
    rts
}
syscall3E: {
    jsr exit_hypervisor
    rts
}
syscall3D: {
    jsr exit_hypervisor
    rts
}
syscall3C: {
    jsr exit_hypervisor
    rts
}
syscall3B: {
    jsr exit_hypervisor
    rts
}
syscall3A: {
    jsr exit_hypervisor
    rts
}
syscall39: {
    jsr exit_hypervisor
    rts
}
syscall38: {
    jsr exit_hypervisor
    rts
}
syscall37: {
    jsr exit_hypervisor
    rts
}
syscall36: {
    jsr exit_hypervisor
    rts
}
syscall35: {
    jsr exit_hypervisor
    rts
}
syscall34: {
    jsr exit_hypervisor
    rts
}
syscall33: {
    jsr exit_hypervisor
    rts
}
syscall32: {
    jsr exit_hypervisor
    rts
}
syscall31: {
    jsr exit_hypervisor
    rts
}
syscall30: {
    jsr exit_hypervisor
    rts
}
syscall2F: {
    jsr exit_hypervisor
    rts
}
syscall2E: {
    jsr exit_hypervisor
    rts
}
syscall2D: {
    jsr exit_hypervisor
    rts
}
syscall2C: {
    jsr exit_hypervisor
    rts
}
syscall2B: {
    jsr exit_hypervisor
    rts
}
syscall2A: {
    jsr exit_hypervisor
    rts
}
syscall29: {
    jsr exit_hypervisor
    rts
}
syscall28: {
    jsr exit_hypervisor
    rts
}
syscall27: {
    jsr exit_hypervisor
    rts
}
syscall26: {
    jsr exit_hypervisor
    rts
}
syscall25: {
    jsr exit_hypervisor
    rts
}
syscall24: {
    jsr exit_hypervisor
    rts
}
syscall23: {
    jsr exit_hypervisor
    rts
}
syscall22: {
    jsr exit_hypervisor
    rts
}
syscall21: {
    jsr exit_hypervisor
    rts
}
syscall20: {
    jsr exit_hypervisor
    rts
}
syscall1F: {
    jsr exit_hypervisor
    rts
}
syscall1D: {
    jsr exit_hypervisor
    rts
}
syscall1C: {
    jsr exit_hypervisor
    rts
}
syscall1B: {
    jsr exit_hypervisor
    rts
}
syscall1A: {
    jsr exit_hypervisor
    rts
}
syscall19: {
    jsr exit_hypervisor
    rts
}
syscall18: {
    jsr exit_hypervisor
    rts
}
syscall17: {
    jsr exit_hypervisor
    rts
}
syscall16: {
    jsr exit_hypervisor
    rts
}
syscall15: {
    jsr exit_hypervisor
    rts
}
syscall14: {
    jsr exit_hypervisor
    rts
}
syscall13: {
    jsr exit_hypervisor
    rts
}
securexit: {
    jsr exit_hypervisor
    rts
}
securentr: {
    jsr exit_hypervisor
    rts
}
syscall10: {
    jsr exit_hypervisor
    rts
}
syscall0F: {
    jsr exit_hypervisor
    rts
}
syscall0E: {
    jsr exit_hypervisor
    rts
}
syscall0D: {
    jsr exit_hypervisor
    rts
}
syscall0C: {
    jsr exit_hypervisor
    rts
}
syscall0B: {
    jsr exit_hypervisor
    rts
}
syscall0A: {
    jsr exit_hypervisor
    rts
}
syscall09: {
    jsr exit_hypervisor
    rts
}
syscall08: {
    jsr exit_hypervisor
    rts
}
syscall07: {
    jsr exit_hypervisor
    rts
}
syscall06: {
    jsr exit_hypervisor
    rts
}
syscall05: {
    jsr exit_hypervisor
    rts
}
syscall04: {
    jsr exit_hypervisor
    rts
}
syscall03: {
    jsr exit_hypervisor
    rts
}
syscall02: {
    jsr exit_hypervisor
    rts
}
syscall01: {
    jsr exit_hypervisor
    rts
}
//Here a couple sample SYSCALL handlers that just display a character on the screen 
/*void syscall0() {
    *(SCREEN+79) = ')';
}
*/
syscall00: {
    jsr exit_hypervisor
    rts
}
RESET: {
    .label sc = $10
    .label msg = $e
    .label i = 2
    .label i1 = $c
    .label sc_3 = 6
    .label msg_3 = 4
    .label i2 = 8
    .label i3 = $a
    .label msg_6 = 4
    .label sc_5 = 6
    //Initialize screen memory, and select correct font
    lda #$14
    sta VIC_MEMORY
  __b1:
    ldx #'*'
    lda #<SCREEN
    sta.z memset.str
    lda #>SCREEN
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    ldx #GREEN
    lda #<COLS
    sta.z memset.str
    lda #>COLS
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    lda #<SCREEN+$28
    sta.z sc
    lda #>SCREEN+$28
    sta.z sc+1
    lda #<MESSAGE
    sta.z msg
    lda #>MESSAGE
    sta.z msg+1
  //A simple copy routime to copy the string
  __b2:
    ldy #0
    lda (msg),y
    cmp #0
    beq !__b3+
    jmp __b3
  !__b3:
    tya
    sta.z i
    sta.z i+1
  __b4:
    lda #<$7530
    cmp.z i
    lda #>$7530
    sbc.z i+1
    bvc !+
    eor #$80
  !:
    bpl !b2+
    jmp b2
  !b2:
    ldx #'+'
    lda #<SCREEN
    sta.z memset.str
    lda #>SCREEN
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    ldx #CYAN
    lda #<COLS
    sta.z memset.str
    lda #>COLS
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    lda #<SCREEN+$28
    sta.z sc_5
    lda #>SCREEN+$28
    sta.z sc_5+1
    lda #<MESSAGE
    sta.z msg_6
    lda #>MESSAGE
    sta.z msg_6+1
  //A simple copy routime to copy the string
  __b9:
    ldy #0
    lda (msg_6),y
    cmp #0
    bne __b10
    tya
    sta.z i2
    sta.z i2+1
  __b11:
    lda #<$7530
    cmp.z i2
    lda #>$7530
    sbc.z i2+1
    bvc !+
    eor #$80
  !:
    bmi b1
    jmp __b1
  b1:
    lda #<0
    sta.z i3
    sta.z i3+1
  __b12:
    lda.z i3
    cmp #<5+1
    lda.z i3+1
    sbc #>5+1
    bvc !+
    eor #$80
  !:
    bpl __b14
    inc.z i2
    bne !+
    inc.z i2+1
  !:
    jmp __b11
  __b14:
    inc.z i3
    bne !+
    inc.z i3+1
  !:
    jmp __b12
  __b10:
    ldy #0
    lda (msg_6),y
    sta (sc_5),y
    inc.z sc_3
    bne !+
    inc.z sc_3+1
  !:
    inc.z msg_3
    bne !+
    inc.z msg_3+1
  !:
    jmp __b9
  b2:
    lda #<0
    sta.z i1
    sta.z i1+1
  __b6:
    lda.z i1
    cmp #<5+1
    lda.z i1+1
    sbc #>5+1
    bvc !+
    eor #$80
  !:
    bpl __b8
    inc.z i
    bne !+
    inc.z i+1
  !:
    jmp __b4
  __b8:
    inc.z i1
    bne !+
    inc.z i1+1
  !:
    jmp __b6
  __b3:
    ldy #0
    lda (msg),y
    sta (sc),y
    inc.z sc
    bne !+
    inc.z sc+1
  !:
    inc.z msg
    bne !+
    inc.z msg+1
  !:
    jmp __b2
}
// Copies the character c (an unsigned char) to the first num characters of the object pointed to by the argument str.
// memset(void* zeropage($10) str, byte register(X) c, word zeropage($e) num)
memset: {
    .label end = $e
    .label dst = $10
    .label num = $e
    .label str = $10
    lda.z num
    bne !+
    lda.z num+1
    beq __breturn
  !:
    lda.z end
    clc
    adc.z str
    sta.z end
    lda.z end+1
    adc.z str+1
    sta.z end+1
  __b2:
    lda.z dst+1
    cmp.z end+1
    bne __b3
    lda.z dst
    cmp.z end
    bne __b3
  __breturn:
    rts
  __b3:
    txa
    ldy #0
    sta (dst),y
    inc.z dst
    bne !+
    inc.z dst+1
  !:
    jmp __b2
}
.segment Data
  //Some text to display
  MESSAGE: .text "checkpoint 2.5 by gall0165"
  .byte 0
.segment Syscall
  //Now we can have a nice table of up to 64 SYSCALL handlers expressed
  //in fairly readeable and easy format.
  //Each line is an instance of the struct Syscall from above, with the JMP
  //opcode value, the address of the handler routine and the NOP opcode value.
  SYSCALLS: .byte JMP
  .word syscall00
  .byte NOP, JMP
  .word syscall01
  .byte NOP, JMP
  .word syscall02
  .byte NOP, JMP
  .word syscall03
  .byte NOP, JMP
  .word syscall04
  .byte NOP, JMP
  .word syscall05
  .byte NOP, JMP
  .word syscall06
  .byte NOP, JMP
  .word syscall07
  .byte NOP, JMP
  .word syscall08
  .byte NOP, JMP
  .word syscall09
  .byte NOP, JMP
  .word syscall0A
  .byte NOP, JMP
  .word syscall0B
  .byte NOP, JMP
  .word syscall0C
  .byte NOP, JMP
  .word syscall0D
  .byte NOP, JMP
  .word syscall0E
  .byte NOP, JMP
  .word syscall0F
  .byte NOP, JMP
  .word syscall10
  .byte NOP, JMP
  .word securentr
  .byte NOP, JMP
  .word securexit
  .byte NOP, JMP
  .word syscall13
  .byte NOP, JMP
  .word syscall14
  .byte NOP, JMP
  .word syscall15
  .byte NOP, JMP
  .word syscall16
  .byte NOP, JMP
  .word syscall17
  .byte NOP, JMP
  .word syscall18
  .byte NOP, JMP
  .word syscall19
  .byte NOP, JMP
  .word syscall1A
  .byte NOP, JMP
  .word syscall1B
  .byte NOP, JMP
  .word syscall1C
  .byte NOP, JMP
  .word syscall1D
  .byte NOP, JMP
  .word syscall1F
  .byte NOP, JMP
  .word syscall20
  .byte NOP, JMP
  .word syscall21
  .byte NOP, JMP
  .word syscall22
  .byte NOP, JMP
  .word syscall23
  .byte NOP, JMP
  .word syscall24
  .byte NOP, JMP
  .word syscall25
  .byte NOP, JMP
  .word syscall26
  .byte NOP, JMP
  .word syscall27
  .byte NOP, JMP
  .word syscall28
  .byte NOP, JMP
  .word syscall29
  .byte NOP, JMP
  .word syscall2A
  .byte NOP, JMP
  .word syscall2B
  .byte NOP, JMP
  .word syscall2C
  .byte NOP, JMP
  .word syscall2D
  .byte NOP, JMP
  .word syscall2E
  .byte NOP, JMP
  .word syscall2F
  .byte NOP, JMP
  .word syscall30
  .byte NOP, JMP
  .word syscall31
  .byte NOP, JMP
  .word syscall32
  .byte NOP, JMP
  .word syscall33
  .byte NOP, JMP
  .word syscall34
  .byte NOP, JMP
  .word syscall35
  .byte NOP, JMP
  .word syscall36
  .byte NOP, JMP
  .word syscall37
  .byte NOP, JMP
  .word syscall38
  .byte NOP, JMP
  .word syscall39
  .byte NOP, JMP
  .word syscall3A
  .byte NOP, JMP
  .word syscall3B
  .byte NOP, JMP
  .word syscall3C
  .byte NOP, JMP
  .word syscall3D
  .byte NOP, JMP
  .word syscall3E
  .byte NOP, JMP
  .word syscall3F
  .byte NOP
  //In this example we had only two SYSCALLs defined, so rather than having
  //another 62 lines, we can just ask KickC to make the TRAP table begin
  //at the next multiple of $100, i.e., at $8100.
  .align $100
  TRAPS: .byte JMP
  .word RESET
  .byte NOP, JMP
  .word PAGFAULT
  .byte NOP, JMP
  .word RESTORKEY
  .byte NOP, JMP
  .word ALTTABKEY
  .byte NOP, JMP
  .word VF011RD
  .byte NOP, JMP
  .word VF011WR
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word RESERVED
  .byte NOP, JMP
  .word CPUKIL
  .byte NOP
