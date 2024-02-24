org 100h

.data
result dw ?

.code
main proc        
    mov al,0bh
    
    mov bx,200
    sub bx,225
    
    mul bx
    
    add ax,127 
    
    mov result,ax 
    hlt
    
main endp
end main
ret