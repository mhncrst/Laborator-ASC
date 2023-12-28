.data
    lines: .long 3
    columns: .long 4
    lineIndex: .space 4
    columnIndex: .space 4
    matrix: .long 10, 20, 30, 40
            .long 50, 60, 70, 80
            .long 90, 15, 25, 35
    formatString: .asciz "%d "
    newline: .asciz "\n"
.text
.global main
main:
lea matrix, %edi
movl $0, lineIndex 
for_lines:
    movl lineIndex, %ecx
    cmp %ecx, lines
    je et_exit
    movl $0, columnIndex
for_columns:
    movl columnIndex, %ecx
    cmp %ecx, columns
    je for_lines_cont
    
    movl lineIndex, %eax
    mull columns
    addl columnIndex, %eax
    movl (%edi, %eax, 4), %ebx
    
    pushl %ebx
    pushl $formatString
    call printf
    pop %ebx
    pop %ebx
    
    pushl $0
    call fflush
    pop %ebx
    
    addl $1, columnIndex
    jmp for_columns
for_lines_cont:
    mov $4, %eax
    mov $1, %ebx
    mov $newline, %ecx
    mov $2, %edx
    int $0x80
    
    addl $1, lineIndex
    jmp for_lines

et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80