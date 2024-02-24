org 100h

.data  
cel dw 260
far dw ?   

.code
main proc
    mov al,10
    mov cl,5 
    div cl
    
    mul cel
    
    add ax,32
    sub ax,1
       
    mov far,ax
    hlt   
            
main endp
end main
ret