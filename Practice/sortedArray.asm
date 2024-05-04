org 100h

.data
    message DB 'Enter 5 decimal numbers(0~5): $' 
    arr db 5 dup(?)  ; reserve space for 5 decimal numbers
.code

main proc
    mov ah,9
    lea dx,message
    int 21h   
    
    mov ax,@data
    mov ds,ax
    mov si,offset arr
    
    mov cx,5
    loop1:
        mov ah,01h       ; function 01h reads a character from standard input, AL will contain the input character
        int 21h
        sub al, '0'      ; convert ASCII character to its numeric value
        mov [si], al     ; store the numeric value into the array
        inc si           ; move to the next element in the array
        loop loop1
    
    
    
    
    ;sort the array
    mov cx,5
    dec cx
    
    outerLoop:
        mov bx,cx
        mov si,0
        compLoop:
            mov al,arr[si]
            mov dl,arr[si+1]
            cmp al,dl
            jl noSwap         ;jl for ascending order ;jg for descending order
            mov arr[si],dl
            mov arr[si+1],al
            noSwap:
            inc si
            dec bx
            jnz compLoop
            loop outerLoop 
    
    
    
    
    
    ; Print the contents of the array
    mov cx,5
    mov si,offset arr
loop2:
    mov dl,[si]
    add dl, '0'      ; convert numeric value to ASCII character
    mov ah,02h
    int 21h
    inc si           ; move to the next element in the array
    loop loop2
    
    mov ah,4Ch       ; Exit program
    int 21h
main endp 

end main
