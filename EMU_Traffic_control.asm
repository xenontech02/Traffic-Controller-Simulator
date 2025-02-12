#start=Traffic_Lights.exe#
;Red is the least significant of each consecutive 3 bits : 0,3,6,9
;Yellow is the middle significant of each 3 consecutive bits: 1,4,7,A
;Green is the most significant of each 3 consecutive bits: 2,5,8,B
;the last 4 bits are unused C,D,E,F

name "traffic"
mov ax, 249h  ; 249h means all are red 0,3,6,9 bits are all ones
out 4, ax     ;4 is the output number for the traffic (built-in)

; wait 2 seconds for the initial movement
call delay_2_seconds

lop:
    mov ax, transition1   ;1st iteration
    out 4, ax
    call delay_1_minute

    mov ax, transition2   ;2nd iteration
    out 4, ax
    call delay_30_seconds

    mov ax, transition3   ;3rd iteration
    out 4, ax
    call delay_1_minute

    mov ax, transition4   ;4th iteration
    out 4, ax
    call delay_30_seconds

    mov ax, 249h  ; 249h means all are red 0,3,6,9 bits are all ones
    out 4, ax     ;4 is the output number for the traffic (built-in)
    call delay_2_seconds

jmp lop

; Subroutine to delay 2 seconds
delay_2_seconds:
    mov     cx, 0018h    ;    00186A00h = 2,000,000 microseconds
    mov     dx, 6A00h
    mov     ah, 86h         ;ah is loaded with 86 (maps to interrupt 15 so it's constant) is needed for interrupt 15
    int     15h         ;interrupt 15 checks cx:dx and is used to delay
    ret

; Subroutine to delay 30 seconds
delay_30_seconds:
    mov     cx, 01E8h    ;    01E84800h = 30,000,000 microseconds
    mov     dx, 4800h
    mov     ah, 86h
    int     15h
    ret

; Subroutine to delay 1 minute
delay_1_minute:
    call delay_30_seconds
    call delay_30_seconds
    ret

;                                 FEDC_BA98_7654_3210
transition1               equ     0000_0011_0000_1100b ;2 Red and 2 Green(north and south are green)
transition2               equ     0000_0111_1001_1110b ;all 4 are Yellow (two will begin to move soon and two will stop moving soon) and the red and green remain)
transition3               equ     0000_1000_0110_0001b ;2 Red and 2 Green(east and west are green)
transition4               equ     0000_1100_1111_0011b ;all 4 are Yellow (two will begin to move soon and two will stop moving soon) and the red and green remain)