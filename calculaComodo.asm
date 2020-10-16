%include "io.inc"
extern  scanf 
extern	printf

section .data
invalido db "Valor Inválido",0
fms db "%lu", 0
msgin DB "%f", 0dh,0ah,0
tipoComodo DD 12,15,18,20,22
wats DD 60
mWrite DB "%lf",0dh,0ah,0

section .bss
tipo resd 1
largura resd 1
comprimento resd 1
resultado resq 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    enter 0,0
ciclo:
    
    push tipo
    push fms
    call scanf
    add  esp, 8
    
    push largura
    push msgin
    call scanf
    add  esp, 8

    push comprimento
    push msgin
    call scanf
    add  esp, 8
    
    cmp DWORD[largura],0
    jl ValorInvalido
    cmp DWORD[comprimento],0
    jl ValorInvalido
    
    mov eax, [tipo]        
    cmp eax,0
    jl FIM
    
    ;comodo tipo 0
    cmp eax, 0
    je TIPO0
    ;comodo tipo 1
    cmp eax, 1
    je TIPO1
    ;comodo tipo 2
    cmp eax, 2
    je TIPO2
    ;comodo tipo 3
    cmp eax, 3
    je TIPO3
    ;comodo tipo 4
    cmp eax, 4
    je TIPO4
        
    
FIM:
    leave
    xor eax, eax
    ret

ValorInvalido:
    push invalido             ; valor do resultado salvo em eax
    call printf             ; chamada da funcao C printf
    add  esp, 4             ; desempilha 2 valores de 4 bytes empilhados pela instrução push
    jmp FIM


TIPO0:
    ;Recebe a largura e o comprimento
    
    finit
    fld dword[largura]
    fmul dword[comprimento]
    fmul dword[tipoComodo]
    fdiv dword[wats]
    fstp qword[resultado]
    
    jmp PRINT 

TIPO1:
    
    finit
    fld dword[largura]
    fmul dword[comprimento]
    fmul dword[tipoComodo+4]
    fdiv dword[wats]
    fstp qword[resultado]
  
    jmp PRINT
    
TIPO2:
    
    finit
    fld dword[largura]
    fmul dword[comprimento]
    fmul dword[tipoComodo+8]
    fdiv dword[wats]
    fstp qword[resultado]

    jmp PRINT
    
TIPO3:
    
    finit
    fld dword[largura]
    fmul dword[comprimento]
    fmul dword[tipoComodo+12]
    fdiv dword[wats]
    fstp qword[resultado]

    jmp PRINT
    
TIPO4:
    
    finit
    fld dword[largura]
    fmul dword[comprimento]
    fmul dword[tipoComodo+16]
    fdiv dword[wats]
    fstp qword[resultado]
    
    jmp PRINT
    
PRINT:
    push dword[resultado+4]
    push dword[resultado]
    push mWrite
    call printf
    add esp, 12
    jmp ciclo