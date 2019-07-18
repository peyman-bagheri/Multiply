stseg	segment
	db 64 dup (?)
stseg	ends
;--------------------------------------------------

dtseg  segment 
        num1     db 9,9,9,9,9
        num2     db 9,9,9,9,9
        answer   db 0,0,0,0,0,0,0,0,0,0
        counter1  db 0
        counter2  db 0
        extra     db 0
        result    db 0
        
dtseg	ends
;--------------------------------------------------
cdseg	segment
main    proc     far
	assume	cs:cdseg,ds:dtseg,ss:stseg 
        mov     ax,dtseg
        mov     ds,ax

   For1: 
            
            mov     al,counter1
            mov     ah,0
            mov     di,ax
            and     ax,0

            mov     al,counter2
            mov     ah,0
            mov     si,ax
            and     ax,0

            mov     al,num1[di]
            mov     bl,num2[si]
            mul     bl
            aam
            mov     extra,ah
            mov     result,al
            and     ax,0

            mov     al,counter1
            add     al,counter2
            mov     ah,0
            mov     di,ax
            and     ax,0

            mov     al,answer[di]
            add     al,result 
	    aam  
            mov     answer[di],al
            add     di,1
            
            add     ah,answer[di]
            mov     answer[di],ah
            mov     al,extra
            add     al,answer[di]
            mov     answer[di],al 
            
                   ;start loop 1
                    inc     counter1
      		    mov     al,counter1
                    cmp     al,5
                    jne     For1

                      ;end loop1

                   ;start loop 2
                    mov     counter1,0
                    inc     counter2
                    mov     al,counter2
                    cmp     al,5
                    jne     For1
                    
                       ;end loop 2
        
        mov ax,4C00h
        int 21h
main    endp
cdseg   ends  
             end      main