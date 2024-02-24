org 100h

.data
result dw ?

.code
main proc
    mov al,30
    add al,15
    
    mov bx,575
    sub bx,225
    
    mul bx
    add ax,210
    
    mov result,ax   
    
main endp
end main
re