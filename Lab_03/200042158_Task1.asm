org 100h

.data
    test_string DB 'We are IUT students', 0Dh, 0Ah, '$'
.code
main proc
    ; Print the string
    mov ah, 9
    lea dx, test_string
    int 21h
    
    ; Count the number of characters
    mov si, 0                  
    mov cx, 0                  
    
count_loop:
    mov al, test_string[si]    
    cmp al, '$'                
    je end_counting            
    add cx, 1                     
    add si, 1                     
    jmp count_loop           

end_counting:
    mov dl, cl               
    
    ; Print the count
    mov ax,si
    mov dx,0
    mov bx,10
    mov cx,0
    Loop_1:
        div bx
        push dx
        mov ah,0
        mov dx,0
        add cx,1
        cmp ax,0
        jne Loop_1
        mov ah,02h
    Loop_2:
        pop dx
        add dx, '0'
        int 21h
        loop Loop_2
    
    hlt
main endp
end main
ret
          
          
          