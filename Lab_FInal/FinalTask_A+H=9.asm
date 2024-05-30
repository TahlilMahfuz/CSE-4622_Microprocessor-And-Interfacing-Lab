org 100h

.data
    message DB 'Enter 2 Characters: $'
    output DB 'Output is: $'
    answer DB 0 
.code

main proc
    mov ah,9
    lea dx,message
    int 21h   
    
    mov cx,2
    xor bx,bx
loop1:
    mov ah,01h       
    int 21h
    sub al,40h
    add bl,al
    loop loop1
    
    ;Print
    mov dl,bl 
    add dl, 30h         
    mov ah, 02h         
    int 21h
    
    
    hlt
main endp 

end main
