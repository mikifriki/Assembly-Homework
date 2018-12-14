; ===== STARTS THE CODE  =============================

         CLO		; Closes all windows for the beginning
         MOV BL, A0	; Move value to top left


; ===== Gathers and stores the inputs until enter is pressed   =============================
Idle:
	IN 00		; Wait for key press - Store in AL.
	MOV [BL], AL	; Move value held in BL memory location into Display location
	INC BL		; Increment BL
	CMP AL, 0D	; Compare -- was the Enter key pressed? 
	JNZ Idle	; If No then Jump back IF Yes then end.
	MOV CL, C0	; Start of Virtual Display
	MOV AL, A0      ; Stored character pointer to AL


; ===== If enter is pressed it will display the stored characters  =============================

Display:   
	MOV DL, [AL]	; Get stored character
        MOV [CL], DL	; Put on Virtual Display
        INC CL          ; Next char. on Virtual Display
        INC AL          ; Next stored character
        CMP CL, 00      ; End of Virtual Display memory?
	JNZ Display	; No, loop

 END

