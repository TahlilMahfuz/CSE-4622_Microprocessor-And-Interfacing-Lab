org 100h

.data
    message DB 'Enter 5 decimal numbers(0~5): ','$'
    largest_prompt DB 'The largest number entered is: $' 
    smallest_prompt DB 'The smallest number entered is: $' 
    average_prompt DB 'The average number entered is: $' 
    average_test DB 'The sum is: $'
    
    num_largest db 0
    num_smallest db 9
    num_average db 0
    num_of_numbers db 5
.code




main proc
    xor cx,cx
    add cx,5   
    xor bh,bh
    ; Print the string
    mov ah, 9
    lea dx, message
    int 21h
    
    loop1:
        ;input a number
        mov ah,1
        int 21h
        
        ;input saved to al auto..save in bl
        mov bl,al  
        sub bl,30h
        call LARGEST ; value saved to num_largest 
        call SMALLEST; value saved to num_smallest
        call Calculate_Average  
        
        
     
        loop loop1
                     
                                            
    ; Print the largest number in the prompt message
    mov ah, 09h
    lea dx, largest_prompt
    int 21h

    mov dl, num_largest ; Load the largest number into DL
    add dl, 30h         ; Convert decimal number to ASCII character
    mov ah, 02h         ; DOS function to print character
    int 21h 
    
    ; Print the smallest number in the prompt message
    mov ah, 09h
    lea dx, smallest_prompt
    int 21h

    mov dl, num_smallest 
    add dl, 30h         
    mov ah, 02h         
    int 21h
    
    ; Print the average number in the prompt message
    mov ah, 09h
    lea dx, average_prompt
    int 21h

    mov dl, num_average 
    add dl, 30h         
    mov ah, 02h         
    int 21h
    
    
                    
    hlt
main endp    


LARGEST proc
    cmp bl,num_largest
    jle larg_label
    mov num_largest,bl
    ret
    larg_label:
    ret    
LARGEST endp

SMALLEST proc
    cmp bl,num_smallest
    jge small_label
    mov num_smallest,bl
    ret
    small_label:
    ret
SMALLEST endp 

Calculate_Average proc
    add bh,bl
    cmp cx,1
    jne avg_label
    xor ax,ax
    mov al,bh
    mov bh,5
    div bh   ; Divide AX register with BH
    mov bh,al   
    mov num_average,bh
    ret
    avg_label:
    ret
Calculate_Average endp



end main
ret
          
          
          