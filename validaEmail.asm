%include "io.inc"
extern  scanf 
extern	printf

section .data
invalido db "Invalido", 0
valido db "Valido", 0
dominio db "alu.br", 0
msgin DB "%c",0

section .bss
input resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    enter 0,0
    push input
    push msgin
    call scanf
    add  esp, 8
    cmp byte[input], 0x40               ;vê se é igual a @
    je INVALIDO
    cmp byte[input], 0x61               ;vê se é uma letra minuscula
    jb INVALIDO
    cmp byte[input], 0x7a               ;vê se é uma letra minuscula
    ja INVALIDO
    jmp UM
UM:
    push input
    push msgin
    call scanf
    add  esp, 8
    cmp byte[input], 0x40               ;vê se é igual a @
    je DOIS
    cmp byte[input], 0x61               ;vê se é uma letra minuscula
    jb INVALIDO
    cmp byte[input], 0x7a               ;vê se é uma letra minuscula
    ja INVALIDO
    jmp UM
    
DOIS:
    push input
    push msgin
    call scanf
    add  esp, 8
    cmp byte[input], 0x40               ;vê se é igual a @
    je INVALIDO
    cmp byte[input], 0x2e               ;verifica se é um ponto
    je TRES
    cmp byte[input], 0x61               ;vê se é uma letra minuscula
    jb INVALIDO
    cmp byte[input], 0x7a               ;vê se é uma letra minuscula
    ja INVALIDO
    jmp DOIS
    
TRES:
    push input
    push msgin
    call scanf
    add  esp, 8
    
    cmp byte[input], 0x40               ;vê se é igual a @
    je INVALIDO
    cmp byte[input], 0x61               ;vê se é uma letra minuscula
    jb INVALIDO
    cmp byte[input], 0x7a               ;vê se é uma letra minuscula
    ja INVALIDO
    
    jmp QUATRO
QUATRO:
    push input
    push msgin
    call scanf
    add  esp, 8
    
    cmp byte[input], 0x0a               ;vê se é igual a 'enter'
    je VALIDO
    cmp byte[input], 0x2e               ;verifica se é um ponto
    je CINCO 
    cmp byte[input], 0x40               ;vê se é igual a @
    je INVALIDO
    cmp byte[input], 0x61               ;vê se é uma letra minuscula
    jb INVALIDO
    cmp byte[input], 0x7a               ;vê se é uma letra minuscula
    ja INVALIDO
    jmp QUATRO

CINCO:
    push input
    push msgin
    call scanf
    add  esp, 8
    
    cmp byte[input], 0x0a               ;vê se é igual a 'r'
    je VALIDO
    cmp byte[input], 0x40               ;vê se é igual a @
    je INVALIDO
    cmp byte[input], 0x61               ;vê se é uma letra minuscula
    jb INVALIDO
    cmp byte[input], 0x7a               ;vê se é uma letra minuscula
    ja INVALIDO
    jmp CINCO  
FIM:
    leave
    xor eax, eax
    ret
    
INVALIDO:
    push invalido
    call printf
    add  esp, 4
    jmp FIM
VALIDO:
    push valido
    call printf
    add  esp, 4
    jmp FIM