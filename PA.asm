%include "io.inc"
extern	printf
extern  scanf

section .data
fms db "%lu", 0             ; formato do printf/scanf de 32 bits, '0'
fmt db "%llu", 0            ; formato do printf/scanf de 64 bits, '0'

section .bss
valorInicial resd 1
constanteR resd 1
n resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    push ebp
    mov  ebp,esp
    
    ;scanf("%d", &valorInicial)
    push valorInicial
    push fms
    call scanf
    add esp, 8
    
    ;scanf("%d", &constanteR)
    push constanteR
    push fms
    call scanf
    add  esp, 4
    
    ;scanf("%d", &n)
    push n
    push fms
    call scanf
    
    mov eax, 0
    mov ecx, [n]                ;quantidade de interações    
    mov eax, [valorInicial]     ;inicializando o acumulador com o numero inicial
    mov ebx, eax                ;inicializando o result usando o ebx como acumulador auxiliar
l1:
    add eax, [constanteR]
    add ebx, eax
loop l1
    mov eax, ebx
    
    push eax                    ; valor do resultado salvo em eax
    push dword fms	       ; endereco da string de controle do printf/scanf
    call printf                 ; chamada da funcao C printf
    add  esp, 8		       ; desempilha 2 valores de 4 bytes empilhados pela instrução push
    mov  esp, ebp	       ; recupera o ponto de entrada da pilha desfazendo a modificação da linha 17
    pop  ebp		       ; mesmo que a operacao "leave" desempilha o inicio da pilha, voltando ao mesmo ponto da linha 16
    mov	 eax,0		       ; valor de retorno normal, retorno sem erro 
    
    
    
    xor eax, eax
    ret