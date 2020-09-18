//*****************************
//Name : Work Unit 3 Hardware Bringup
//Checkpoint: 3.4 Detect More Devices 
//Purpuse: Function that detects other devices on the Mega65
//Description:  
//******************************
  .file [name="checkpoint3.4.bin", type="bin", segments="XMega65Bin"]
.segmentdef XMega65Bin [segments="Syscall, Code, Data, Stack, Zeropage"]
.segmentdef Syscall [start=$8000, max=$81ff]
.segmentdef Code [start=$8200, min=$8200, max=$bdff]
.segmentdef Data [startAfter="Code", min=$8200, max=$bdff]
.segmentdef Stack [min=$be00, max=$beff, fill]
.segmentdef Zeropage [min=$bf00, max=$bfff, fill]
  .label VIC_MEMORY = $d018
  .label SCREEN = $400
  .label COLS = $d800
  .const WHITE = 1
  .label DEVICE_START = $d000
  //To save writing 0x4C and 0xEA all the time, we define them as constants 
  .const JMP = $4c
  .const NOP = $ea
  .label current_screen_line = 8
  .label current_screen_x = $c
.segment Code
main: {
    rts
}
CPUKIL: {
    jsr exit_hypervisor
    rts
}
exit_hypervisor: {
    lda #1
    sta $d67f
    rts
}
undefined_trap: {
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
SYSCALL3F: {
    jsr exit_hypervisor
    rts
}
SYSCALL3E: {
    jsr exit_hypervisor
    rts
}
SYSCALL3D: {
    jsr exit_hypervisor
    rts
}
SYSCALL3C: {
    jsr exit_hypervisor
    rts
}
SYSCALL3B: {
    jsr exit_hypervisor
    rts
}
SYSCALL3A: {
    jsr exit_hypervisor
    rts
}
SYSCALL39: {
    jsr exit_hypervisor
    rts
}
SYSCALL38: {
    jsr exit_hypervisor
    rts
}
SYSCALL37: {
    jsr exit_hypervisor
    rts
}
SYSCALL36: {
    jsr exit_hypervisor
    rts
}
SYSCALL35: {
    jsr exit_hypervisor
    rts
}
SYSCALL34: {
    jsr exit_hypervisor
    rts
}
SYSCALL33: {
    jsr exit_hypervisor
    rts
}
SYSCALL32: {
    jsr exit_hypervisor
    rts
}
SYSCALL31: {
    jsr exit_hypervisor
    rts
}
SYSCALL30: {
    jsr exit_hypervisor
    rts
}
SYSCALL2F: {
    jsr exit_hypervisor
    rts
}
SYSCALL2E: {
    jsr exit_hypervisor
    rts
}
SYSCALL2D: {
    jsr exit_hypervisor
    rts
}
SYSCALL2C: {
    jsr exit_hypervisor
    rts
}
SYSCALL2B: {
    jsr exit_hypervisor
    rts
}
SYSCALL2A: {
    jsr exit_hypervisor
    rts
}
SYSCALL29: {
    jsr exit_hypervisor
    rts
}
SYSCALL28: {
    jsr exit_hypervisor
    rts
}
SYSCALL27: {
    jsr exit_hypervisor
    rts
}
SYSCALL26: {
    jsr exit_hypervisor
    rts
}
SYSCALL25: {
    jsr exit_hypervisor
    rts
}
SYSCALL24: {
    jsr exit_hypervisor
    rts
}
SYSCALL23: {
    jsr exit_hypervisor
    rts
}
SYSCALL22: {
    jsr exit_hypervisor
    rts
}
SYSCALL21: {
    jsr exit_hypervisor
    rts
}
SYSCALL20: {
    jsr exit_hypervisor
    rts
}
SYSCALL1F: {
    jsr exit_hypervisor
    rts
}
SYSCALL1E: {
    jsr exit_hypervisor
    rts
}
SYSCALL1D: {
    jsr exit_hypervisor
    rts
}
SYSCALL1C: {
    jsr exit_hypervisor
    rts
}
SYSCALL1B: {
    jsr exit_hypervisor
    rts
}
SYSCALL1A: {
    jsr exit_hypervisor
    rts
}
SYSCALL19: {
    jsr exit_hypervisor
    rts
}
SYSCALL18: {
    jsr exit_hypervisor
    rts
}
SYSCALL17: {
    jsr exit_hypervisor
    rts
}
SYSCALL16: {
    jsr exit_hypervisor
    rts
}
SYSCALL15: {
    jsr exit_hypervisor
    rts
}
SYSCALL14: {
    jsr exit_hypervisor
    rts
}
SYSCALL13: {
    jsr exit_hypervisor
    rts
}
SECUREXIT: {
    jsr exit_hypervisor
    rts
}
SECURENTR: {
    jsr exit_hypervisor
    rts
}
SYSCALL10: {
    jsr exit_hypervisor
    rts
}
SYSCALL0F: {
    jsr exit_hypervisor
    rts
}
SYSCALL0E: {
    jsr exit_hypervisor
    rts
}
SYSCALL0D: {
    jsr exit_hypervisor
    rts
}
SYSCALL0C: {
    jsr exit_hypervisor
    rts
}
SYSCALL0B: {
    jsr exit_hypervisor
    rts
}
SYSCALL0A: {
    jsr exit_hypervisor
    rts
}
SYSCALL09: {
    jsr exit_hypervisor
    rts
}
SYSCALL08: {
    jsr exit_hypervisor
    rts
}
SYSCALL07: {
    jsr exit_hypervisor
    rts
}
SYSCALL06: {
    jsr exit_hypervisor
    rts
}
SYSCALL05: {
    jsr exit_hypervisor
    rts
}
SYSCALL04: {
    jsr exit_hypervisor
    rts
}
SYSCALL03: {
    jsr exit_hypervisor
    rts
}
SYSCALL02: {
    jsr exit_hypervisor
    rts
}
SYSCALL01: {
    jsr exit_hypervisor
    rts
}
SYSCALL00: {
    jsr exit_hypervisor
    rts
}
RESET: {
    lda #$14
    sta VIC_MEMORY
    ldx #' '
    lda #<SCREEN
    sta.z memset.str
    lda #>SCREEN
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    ldx #WHITE
    lda #<COLS
    sta.z memset.str
    lda #>COLS
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    lda #<message1
    sta.z print_to_screen.msg
    lda #>message1
    sta.z print_to_screen.msg+1
    lda #0
    sta.z current_screen_x
    lda #<$400
    sta.z current_screen_line
    lda #>$400
    sta.z current_screen_line+1
    jsr print_to_screen
    jsr print_newline
    lda #<message2
    sta.z print_to_screen.msg
    lda #>message2
    sta.z print_to_screen.msg+1
    lda #0
    sta.z current_screen_x
    jsr print_to_screen
    jsr print_newline
    jsr detect_devices
    jsr exit_hypervisor
    rts
  .segment Data
    message1: .text "gall0165 operating system starting..."
    .byte 0
    message2: .text "testing hardware"
    .byte 0
}
.segment Code
//Begginig of Function Definition call detect_devices
detect_devices: {
    .label result = 6
    .label i = $d
    .label count = 2
    .label num = $1d
    .label j = $a
    .label result_4 = $18
    .label i1 = 4
    lda #<0
    sta.z count
    sta.z count+1
    sta.z current_screen_x
    lda #<1
    sta.z i
    lda #>1
    sta.z i+1
  //the num of the address of the device ocupied
  __b2:
    lda.z i+1
    cmp #>$ff1
    bcs !__b3+
    jmp __b3
  !__b3:
    bne !+
    lda.z i
    cmp #<$ff1
    bcs !__b3+
    jmp __b3
  !__b3:
  !:
    lda #<1
    sta.z i1
    lda #>1
    sta.z i1+1
  __b7:
    lda.z i1+1
    cmp #>$ff1
    bcc __b8
    bne !+
    lda.z i1
    cmp #<$ff1
    bcc __b8
  !:
    lda.z count
    bne __b1
    lda.z count+1
    bne __b1
    lda #<message1
    sta.z print_to_screen.msg
    lda #>message1
    sta.z print_to_screen.msg+1
    jsr print_to_screen
    jsr print_newline
    lda #0
    sta.z current_screen_x
  __b1:
    lda #<message
    sta.z print_to_screen.msg
    lda #>message
    sta.z print_to_screen.msg+1
    jsr print_to_screen
    jsr print_newline
    rts
  __b8:
    lda.z i1+1
    cmp #>$801
    bne __b10
    lda.z i1
    cmp #<$801
    bne __b10
    lda #<$c01
    sta.z i1
    lda #>$c01
    sta.z i1+1
  __b10:
    lda #<DEVICE_START-1
    sta.z num
    lda #>DEVICE_START-1
    sta.z num+1
    lda #<0
    sta.z j
    sta.z j+1
  __b11:
    lda.z j+1
    cmp.z i1+1
    bcc __b12
    bne !+
    lda.z j
    cmp.z i1
    bcc __b12
  !:
    jsr print_hex
    jsr detect_mos6526
    lda.z result_4
    bne !+
    lda.z result_4+1
    beq __b15
  !:
    inc.z count
    bne !+
    inc.z count+1
  !:
  __b15:
    lda.z i1
    clc
    adc.z result_4
    sta.z i1
    lda.z i1+1
    adc.z result_4+1
    sta.z i1+1
    lda #$10
    clc
    adc.z i1
    sta.z i1
    bcc !+
    inc.z i1+1
  !:
    lda #0
    sta.z current_screen_x
    jmp __b7
  __b12:
    inc.z num
    bne !+
    inc.z num+1
  !:
    inc.z j
    bne !+
    inc.z j+1
  !:
    jmp __b11
  __b3:
    lda.z i+1
    cmp #>$801
    bne __b4
    lda.z i
    cmp #<$801
    bne __b4
    lda #<$c01
    sta.z i
    lda #>$c01
    sta.z i+1
  __b4:
    jsr detect_vicii
    lda.z result
    bne !+
    lda.z result+1
    beq __b5
  !:
    inc.z count
    bne !+
    inc.z count+1
  !:
  __b5:
    lda.z i
    clc
    adc.z result
    sta.z i
    lda.z i+1
    adc.z result+1
    sta.z i+1
    lda #$10
    clc
    adc.z i
    sta.z i
    bcc !+
    inc.z i+1
  !:
    jmp __b2
  .segment Data
    message: .text "finished probing for devices"
    .byte 0
    message1: .text "no device found"
    .byte 0
}
.segment Code
// detect vicii
// detect_vicii(word zeropage($d) address)
detect_vicii: {
    .label __11 = $18
    .label __19 = $1a
    .label address = $d
    .label return = 6
    .label p = $15
    .label j = 4
    .label v1 = $1c
    .label i = $a
    .label v2 = $17
    .label i_4 = $1d
    .label i_7 = $1d
    lda #<0
    sta.z p
    sta.z p+1
    lda #<DEVICE_START-1
    sta.z p
    lda #>DEVICE_START-1
    sta.z p+1
    lda #<0
    sta.z j
    sta.z j+1
  __b3:
    lda.z j+1
    cmp.z address+1
    bcs !__b4+
    jmp __b4
  !__b4:
    bne !+
    lda.z j
    cmp.z address
    bcs !__b4+
    jmp __b4
  !__b4:
  !:
    ldy #$12
    lda (p),y
    sta.z v1
    lda #<1
    sta.z i
    lda #>1
    sta.z i+1
  __b6:
    lda.z i+1
    cmp #>$3e8
    bcs !__b8+
    jmp __b8
  !__b8:
    bne !+
    lda.z i
    cmp #<$3e8
    bcs !__b8+
    jmp __b8
  !__b8:
  !:
    ldy #$12
    lda (p),y
    //vic-ii offset $12 from its address
    cmp.z v1
    beq !+
    bcc !__b1+
    jmp __b1
  !__b1:
  !:
    cmp.z v1
    bcc __b2
  b1:
    lda #<0
    sta.z return
    sta.z return+1
    rts
  __b2:
    ldy #$12
    lda (p),y
    tax
    lda #<1
    sta.z i_7
    lda #>1
    sta.z i_7+1
  __b10:
    lda.z i_7+1
    cmp #>$3e8
    bcc __b12
    bne !+
    lda.z i_7
    cmp #<$3e8
    bcc __b12
  !:
    ldy #$12
    lda (p),y
    sta.z v2
    cpx.z v2
    bcc __b13
    jmp b1
  __b13:
    lda #<message
    sta.z print_to_screen.msg
    lda #>message
    sta.z print_to_screen.msg+1
    jsr print_to_screen
    lda.z p
    sta.z print_hex.value
    lda.z p+1
    sta.z print_hex.value+1
    jsr print_hex
    lda #<message1
    sta.z print_to_screen.msg
    lda #>message1
    sta.z print_to_screen.msg+1
    jsr print_to_screen
    lda #$80
    clc
    adc.z p
    sta.z __11
    lda #0
    adc.z p+1
    sta.z __11+1
    lda.z __11
    sta.z p
    lda.z __11+1
    sta.z p+1
    lda.z p
    sta.z print_hex.value
    lda.z p+1
    sta.z print_hex.value+1
    jsr print_hex
    jsr print_newline
    lda #0
    sta.z current_screen_x
    lda #<$80
    sta.z return
    lda #>$80
    sta.z return+1
    rts
  __b12:
    inc.z i_4
    bne !+
    inc.z i_4+1
  !:
    jmp __b10
  __b1:
    lda #<message
    sta.z print_to_screen.msg
    lda #>message
    sta.z print_to_screen.msg+1
    jsr print_to_screen
    lda.z p
    sta.z print_hex.value
    lda.z p+1
    sta.z print_hex.value+1
    jsr print_hex
    lda #<message1
    sta.z print_to_screen.msg
    lda #>message1
    sta.z print_to_screen.msg+1
    jsr print_to_screen
    lda #$80
    clc
    adc.z p
    sta.z __19
    lda #0
    adc.z p+1
    sta.z __19+1
    lda.z __19
    sta.z p
    lda.z __19+1
    sta.z p+1
    lda.z p
    sta.z print_hex.value
    lda.z p+1
    sta.z print_hex.value+1
    jsr print_hex
    jsr print_newline
    lda #0
    sta.z current_screen_x
    lda #<$70
    sta.z return
    lda #>$70
    sta.z return+1
    rts
  __b8:
    inc.z i
    bne !+
    inc.z i+1
  !:
    jmp __b6
  __b4:
    inc.z p
    bne !+
    inc.z p+1
  !:
    inc.z j
    bne !+
    inc.z j+1
  !:
    jmp __b3
  .segment Data
    message: .text "vic-ii detected at "
    .byte 0
}
.segment Code
print_newline: {
    lda #$28
    clc
    adc.z current_screen_line
    sta.z current_screen_line
    bcc !+
    inc.z current_screen_line+1
  !:
  __b1:
    lda.z current_screen_line+1
    cmp #>SCREEN+$28*$19
    bcc !+
    bne __b2
    lda.z current_screen_line
    cmp #<SCREEN+$28*$19
    bcs __b2
  !:
    rts
  __b2:
    jsr clean
    lda.z current_screen_line
    sec
    sbc #<$19
    sta.z current_screen_line
    lda.z current_screen_line+1
    sbc #>$19
    sta.z current_screen_line+1
    jmp __b1
}
clean: {
    ldx #' '
    lda #<SCREEN
    sta.z memset.str
    lda #>SCREEN
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    ldx #WHITE
    lda #<COLS
    sta.z memset.str
    lda #>COLS
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    rts
}
// Copies the character c (an unsigned char) to the first num characters of the object pointed to by the argument str.
// memset(void* zeropage($a) str, byte register(X) c, word zeropage(6) num)
memset: {
    .label end = 6
    .label dst = $a
    .label num = 6
    .label str = $a
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
// print hex
// print_hex(word zeropage($1d) value)
print_hex: {
    .label __3 = $18
    .label __6 = $1a
    .label value = $1d
    ldx #0
  __b1:
    cpx #4
    bcc __b2
    lda #0
    sta hex+4
    lda #<hex
    sta.z print_to_screen.msg
    lda #>hex
    sta.z print_to_screen.msg+1
    jsr print_to_screen
    rts
  __b2:
    lda.z value+1
    cmp #>$a000
    bcc __b4
    bne !+
    lda.z value
    cmp #<$a000
    bcc __b4
  !:
    ldy #$c
    lda.z value
    sta.z __3
    lda.z value+1
    sta.z __3+1
    cpy #0
    beq !e+
  !:
    lsr.z __3+1
    ror.z __3
    dey
    bne !-
  !e:
    lda.z __3
    sec
    sbc #9
    sta hex,x
  __b5:
    asl.z value
    rol.z value+1
    asl.z value
    rol.z value+1
    asl.z value
    rol.z value+1
    asl.z value
    rol.z value+1
    inx
    jmp __b1
  __b4:
    ldy #$c
    lda.z value
    sta.z __6
    lda.z value+1
    sta.z __6+1
    cpy #0
    beq !e+
  !:
    lsr.z __6+1
    ror.z __6
    dey
    bne !-
  !e:
    lda.z __6
    clc
    adc #'0'
    sta hex,x
    jmp __b5
  .segment Data
    hex: .fill 5, 0
}
.segment Code
print_to_screen: {
    .label sc = $18
    .label msg = $a
    lda.z current_screen_x
    clc
    adc.z current_screen_line
    sta.z sc
    lda #0
    adc.z current_screen_line+1
    sta.z sc+1
  __b1:
    ldy #0
    lda (msg),y
    cmp #0
    bne __b2
  __b3:
    lda.z current_screen_x
    cmp #$28
    bcs __b4
    rts
  __b4:
    lax.z current_screen_x
    axs #$28
    stx.z current_screen_x
    inc.z current_screen_line
    bne !+
    inc.z current_screen_line+1
  !:
    jmp __b3
  __b2:
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
    inc.z current_screen_x
    jmp __b1
}
// start Declaration of the function that detect MOS 6526 
// detect_mos6526(word zeropage(4) address)
detect_mos6526: {
    .label __12 = $1d
    .label address = 4
    .label return = $18
    .label p = $13
    .label j = $d
    .label v1 = $1c
    .label i = $f
    lda #<0
    sta.z p
    sta.z p+1
    lda #<DEVICE_START-1
    sta.z p
    lda #>DEVICE_START-1
    sta.z p+1
    lda #<0
    sta.z j
    sta.z j+1
  __b1:
    lda.z j+1
    cmp.z address+1
    bcs !__b2+
    jmp __b2
  !__b2:
    bne !+
    lda.z j
    cmp.z address
    bcs !__b2+
    jmp __b2
  !__b2:
  !:
    ldy #$b
    lda (p),y
    cmp #1
    bcc b1
    lda (p),y
    cmp #$23+1
    bcs b1
    ldy #9
    lda (p),y
    sta.z v1
    lda #1
    sta.z i
    lda #0
    sta.z i+1
    sta.z i+2
    sta.z i+3
  //validation of detection in a valid hour seconds byte in $09 ticks ref.esp
  __b5:
    lda.z i+3
    cmp #>$1e8480>>$10
    bcc __b6
    bne !+
    lda.z i+2
    cmp #<$1e8480>>$10
    bcc __b6
    bne !+
    lda.z i+1
    cmp #>$1e8480
    bcc __b6
    bne !+
    lda.z i
    cmp #<$1e8480
    bcc __b6
  !:
  b1:
    lda #<0
    sta.z return
    sta.z return+1
    rts
  __b6:
    //loop that checks that second register has changed up to ___ before giving up should suffice 
    ldy #9
    lda (p),y
    cmp.z v1
    beq __b7
    lda #<message
    sta.z print_to_screen.msg
    lda #>message
    sta.z print_to_screen.msg+1
    lda #0
    sta.z current_screen_x
    jsr print_to_screen
    lda.z p
    sta.z print_hex.value
    lda.z p+1
    sta.z print_hex.value+1
    jsr print_hex
    lda #<message1
    sta.z print_to_screen.msg
    lda #>message1
    sta.z print_to_screen.msg+1
    jsr print_to_screen
    lda #$ff
    clc
    adc.z p
    sta.z __12
    lda #0
    adc.z p+1
    sta.z __12+1
    lda.z __12
    sta.z p
    lda.z __12+1
    sta.z p+1
    lda.z p
    sta.z print_hex.value
    lda.z p+1
    sta.z print_hex.value+1
    jsr print_hex
    jsr print_newline
    lda #<$f0
    sta.z return
    lda #>$f0
    sta.z return+1
    rts
  __b7:
    inc.z i
    bne !+
    inc.z i+1
    bne !+
    inc.z i+2
    bne !+
    inc.z i+3
  !:
    jmp __b5
  __b2:
    inc.z p
    bne !+
    inc.z p+1
  !:
    inc.z j
    bne !+
    inc.z j+1
  !:
    jmp __b1
  .segment Data
    message: .text "mos6526 detected at "
    .byte 0
}
  message1: .text " --  "
  .byte 0
.segment Syscall
  //Now we can have a nice table of up to 64 SYSCALL handlers expressed
  //in fairly readeable and easy format.
  //Each line is an instance of the struct Syscall from above, with the JMP
  //opcode value, the address of the handler routine and the NOP opcode value.
  SYSCALLS: .byte JMP
  .word SYSCALL00
  .byte NOP, JMP
  .word SYSCALL01
  .byte NOP, JMP
  .word SYSCALL02
  .byte NOP, JMP
  .word SYSCALL03
  .byte NOP, JMP
  .word SYSCALL04
  .byte NOP, JMP
  .word SYSCALL05
  .byte NOP, JMP
  .word SYSCALL06
  .byte NOP, JMP
  .word SYSCALL07
  .byte NOP, JMP
  .word SYSCALL08
  .byte NOP, JMP
  .word SYSCALL09
  .byte NOP, JMP
  .word SYSCALL0A
  .byte NOP, JMP
  .word SYSCALL0B
  .byte NOP, JMP
  .word SYSCALL0C
  .byte NOP, JMP
  .word SYSCALL0D
  .byte NOP, JMP
  .word SYSCALL0E
  .byte NOP, JMP
  .word SYSCALL0F
  .byte NOP, JMP
  .word SYSCALL10
  .byte NOP, JMP
  .word SECURENTR
  .byte NOP, JMP
  .word SECUREXIT
  .byte NOP, JMP
  .word SYSCALL13
  .byte NOP, JMP
  .word SYSCALL14
  .byte NOP, JMP
  .word SYSCALL15
  .byte NOP, JMP
  .word SYSCALL16
  .byte NOP, JMP
  .word SYSCALL17
  .byte NOP, JMP
  .word SYSCALL18
  .byte NOP, JMP
  .word SYSCALL19
  .byte NOP, JMP
  .word SYSCALL1A
  .byte NOP, JMP
  .word SYSCALL1B
  .byte NOP, JMP
  .word SYSCALL1C
  .byte NOP, JMP
  .word SYSCALL1D
  .byte NOP, JMP
  .word SYSCALL1E
  .byte NOP, JMP
  .word SYSCALL1F
  .byte NOP, JMP
  .word SYSCALL20
  .byte NOP, JMP
  .word SYSCALL21
  .byte NOP, JMP
  .word SYSCALL22
  .byte NOP, JMP
  .word SYSCALL23
  .byte NOP, JMP
  .word SYSCALL24
  .byte NOP, JMP
  .word SYSCALL25
  .byte NOP, JMP
  .word SYSCALL26
  .byte NOP, JMP
  .word SYSCALL27
  .byte NOP, JMP
  .word SYSCALL28
  .byte NOP, JMP
  .word SYSCALL29
  .byte NOP, JMP
  .word SYSCALL2A
  .byte NOP, JMP
  .word SYSCALL2B
  .byte NOP, JMP
  .word SYSCALL2C
  .byte NOP, JMP
  .word SYSCALL2D
  .byte NOP, JMP
  .word SYSCALL2E
  .byte NOP, JMP
  .word SYSCALL2F
  .byte NOP, JMP
  .word SYSCALL30
  .byte NOP, JMP
  .word SYSCALL31
  .byte NOP, JMP
  .word SYSCALL32
  .byte NOP, JMP
  .word SYSCALL33
  .byte NOP, JMP
  .word SYSCALL34
  .byte NOP, JMP
  .word SYSCALL35
  .byte NOP, JMP
  .word SYSCALL36
  .byte NOP, JMP
  .word SYSCALL37
  .byte NOP, JMP
  .word SYSCALL38
  .byte NOP, JMP
  .word SYSCALL39
  .byte NOP, JMP
  .word SYSCALL3A
  .byte NOP, JMP
  .word SYSCALL3B
  .byte NOP, JMP
  .word SYSCALL3C
  .byte NOP, JMP
  .word SYSCALL3D
  .byte NOP, JMP
  .word SYSCALL3E
  .byte NOP, JMP
  .word SYSCALL3F
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
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word CPUKIL
  .byte NOP
