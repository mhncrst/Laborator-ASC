.data
    matrix: .space 1600
    columnIndex: .space 0
    lineIndex: .space 0
    m: .space 4
    n: .space 4
    p: .space 4
    k: .space 4
    u: .long 0
    formatScanf: .asciz "%d"
    formatString: .asciz "%d "
    newline: .asciz "\n"
.text

.global main

main:
    pushl $m
    pushl $formatScanf
    call scanf              
    popl %ebx
    popl %ebx

    addl $2, m

    pushl $n
    pushl $formatScanf
    call scanf              
    popl %ebx
    popl %ebx

    addl $2, n
   
    pushl $p
    pushl $formatScanf      
    call scanf
    popl %ebx
    popl %ebx

    lea matrix, %edi
    movl $0,  %ecx

for_celule_vii:
    movl u, %ecx
    cmp %ecx, p
    je for_lines
    movl $0, lineIndex
    pushl $lineIndex
    pushl $formatScanf
    call scanf
    popl %ebx
    popl %ebx
    addl $1, lineIndex


    pushl $columnIndex
    pushl $formatScanf
    call scanf
    popl %ebx
    popl %ebx



    addl $1, columnIndex

    movl lineIndex, %eax
    mull n
    addl columnIndex, %eax
    movl $1, (%edi, %eax, 4)


    addl $1, u
    jmp for_celule_vii

    movl $0, lineIndex
    movl $5, m

for_lines:
    movl lineIndex, %ecx
        movl $2, %ebx
        pushl %ebx
        pushl $formatString
        call printf
        popl %ebx
        popl %ebx
    cmp %ecx, m
    je et_exit
    movl $5, m
    movl $0, columnIndex
    for_columns:
        movl columnIndex, %ecx
        cmp %ecx, n
        je for_lines_cont
        
        movl lineIndex, %eax
        mull n
        addl columnIndex, %eax
        movl (%edi, %eax, 4), %ebx
    
        
        pushl %ebx
        pushl $formatString
        call printf
        popl %ebx
        popl %ebx
        
        pushl $0
        call fflush
        popl %ebx
        
        addl $1, columnIndex
        jmp for_columns
for_lines_cont:
    movl $4, %eax
    movl $1, %ebx
    movl $newline, %ecx
    movl 2, %edx
    int $0x80
    
    addl $1, lineIndex
    jmp for_lines



et_exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80