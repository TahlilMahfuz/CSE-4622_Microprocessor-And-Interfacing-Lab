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
    mov dh, 0
    mov dl, cl               
    
    hlt
main endp
end main
ret