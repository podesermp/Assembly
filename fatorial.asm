%include "io.inc"

extern	printf
extern  scanf 

section .data
fms db "%lu", 0

section .bss
fatorial resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    ;Inicializar pilha
    push ebp
    mov ebp, esp
    
    push fatorial
    push fms
    call scanf
    add esp, 4
    
    mov ecx, [fatorial]
    mov eax, 1
l1:
    
    mul ecx
    
loop l1

    push eax
    push dword fms
    call printf
    add  esp, 8
    mov  esp, ebp
    pop  ebp
    mov	 eax,0
        
    xor eax, eax
    ret