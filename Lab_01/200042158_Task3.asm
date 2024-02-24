org 100h

.data
result dw ?

.code
main proc
    mov ax,0fffh
    mov bx,10h
    
    mul bx
    
    add ax,1111b
    
    mov result,ax 
    hlt 
    
main endp
end main
ret