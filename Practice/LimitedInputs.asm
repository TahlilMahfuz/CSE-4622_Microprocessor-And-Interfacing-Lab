org 100h

.data
    message DB 'Enter decimal numbers (0~5) separated by spaces, press Enter when done: $' 
    arr db 100 DUP (?)  ; reserve space for input (assuming maximum of 100 characters)
.code

main proc
    mov ah,9
    lea dx,message
    int 21h   
    
    mov ax,@data
    mov ds,ax
    mov si,offset arr
    
    mov cx,100 ; maximum characters to read
input_loop:
    mov ah,01h       ; function 01h reads a character from standard input, AL will contain the input character
    int 21h
    cmp al, 13       ; check if Enter key is pressed
    je input_done    ; if Enter key is pressed, finish input
    cmp al, ' '      ; check if space character is entered
    je skip_space    ; if space character, skip storing it
    sub al, '0'      ; convert ASCII character to its numeric value
    mov [si], al     ; store the numeric value into the array
    inc si           ; move to the next element in the array
    loop input_loop

skip_space:
    loop input_loop  ; continue reading until Enter key is pressed

input_done:
    ; Print the contents of the array
    mov cx,100  ; assuming maximum characters read
    mov si,offset arr
print_loop:
    mov dl,[si]
    test dl, dl   ; check if end of input (null terminator)
    jz print_done
    add dl, '0'   ; convert numeric value to ASCII character
    mov ah,02h
    int 21h
    inc si        ; move to the next element in the array
    loop print_loop

print_done:
    mov ah,4Ch       ; Exit program
    int 21h
main endp 

end main
