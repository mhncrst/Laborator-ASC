.data
    matrix: .space 1600
    matrix2: .space 1600
    columnIndex: .space 4
    lineIndex: .space 4
    m: .space 4
    n: .space 4
    p: .space 4
    k: .space 4
    u: .space 4
    e: .long 0
    i: .space 4
    j: .space 4
    v: .space 4
    unu: .long 1
    doi: .long 2
    trei: .long 3
    mvechi: .space 4
    nvechi: .space 4
    liniiplus: .space 4
    coloaneplus: .space 4
    liniiminus: .space 4
    coloaneminus: .space 4
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
    movl m, %ebx
    movl %ebx, mvechi

    pushl $n
    pushl $formatScanf
    call scanf              
    popl %ebx
    popl %ebx

    addl $2, n
    movl n, %ebx
    movl %ebx, nvechi

    pushl $p
    pushl $formatScanf      
    call scanf
    popl %ebx
    popl %ebx

    lea matrix, %edi
    lea matrix2, %esi
    movl $0, u

for_celule_vii:
    movl u, %ecx
    cmp %ecx, p
    je main_cont

    pushl $lineIndex
    pushl $formatScanf      
    call scanf
    popl %ebx
    popl %ebx

   

    pushl $columnIndex
    pushl $formatScanf      
    call scanf
    popl %ebx
    popl %ebx

    addl $1, lineIndex
    addl $1, columnIndex

    movl lineIndex, %eax
    mull n
    addl columnIndex, %eax
    movl $1, (%edi, %eax, 4)
    movl $1, (%esi, %eax, 4)

    addl $1, u
    jmp for_celule_vii
    

main_cont:
    pushl $k
    pushl $formatScanf
    call scanf              
    popl %ebx
    popl %ebx

    
    subl $1, m
    subl $1, n
for_evolutii:
    movl e, %ecx
    cmp %ecx, k
    je printare
    movl $1, lineIndex
   
    linii:
        movl lineIndex, %ecx
    
        cmp %ecx, m
        je intoarcere_evolutii
        movl $1, columnIndex
        coloane:
            movl columnIndex, %ecx
            cmp %ecx, n
            je intoarcere_linii

            

            movl lineIndex, %eax
            mull nvechi
            addl columnIndex, %eax
            movl (%edi, %eax, 4), %ebx



            cmp %ebx, unu
            je et_1
            jmp et_0

            et_1:
                movl lineIndex, %ebx
                movl %ebx, liniiplus
                addl $2, liniiplus

                movl columnIndex, %ebx
                movl %ebx, coloaneplus
                addl $2, coloaneplus

                movl lineIndex, %ebx
                movl %ebx, liniiminus
                subl $1, liniiminus

                movl columnIndex, %ebx
                movl %ebx, coloaneminus
                subl $1, coloaneminus

                movl liniiminus, %ebx 
                movl %ebx, i 
                movl coloaneminus, %ebx 
                movl %ebx, j 
 
                for_i:
                    movl coloaneminus , %ebx 
                    movl %ebx , j
                    movl i, %ecx
                    cmp %ecx, liniiplus
                    je modif_matrix
                   

                    for_j: 
                        movl j, %ecx
                        cmp %ecx, coloaneplus
                        je for_i_cont

                        movl i, %eax
                        mull nvechi
                        addl j, %eax
                        movl (%edi, %eax, 4), %ebx

                        addl $1, j
                        
                        
                        cmp %ebx, unu 
                        je inc_v 
                        jmp for_j
                        inc_v:
                            addl $1, v
                            jmp for_j



                for_i_cont:
                    addl $1, i
                    jmp for_i

                modif_matrix:
                    subl $1, v

                    
                    movl v, %ecx
                    cmp doi, %ecx
                    jl put_zero
                    jmp daca_3

                    put_zero:
                        movl lineIndex, %eax
                        mull nvechi
                        addl columnIndex, %eax
                        movl $0 , (%esi, %eax, 4)
                        jmp cont_after_modif

                    daca_3:
                        movl v, %ecx
                        cmp trei, %ecx
                        jg put_zero
                        jmp cont_after_modif



                cont_after_modif:
                    movl $0 , v
                    addl $1, columnIndex
                    jmp coloane

            et_0:
                movl lineIndex, %ebx
                movl %ebx, liniiplus
                addl $2, liniiplus

                movl columnIndex, %ebx
                movl %ebx, coloaneplus
                addl $2, coloaneplus

                movl lineIndex, %ebx
                movl %ebx, liniiminus
                subl $1, liniiminus

                movl columnIndex, %ebx
                movl %ebx, coloaneminus
                subl $1, coloaneminus

                movl liniiminus, %ebx 
                movl %ebx, i 
                movl coloaneminus, %ebx 
                movl %ebx, j 
  
               
                for_i0:
                    movl coloaneminus , %ebx 
                    movl %ebx , j
                    movl i, %ecx
                    cmp %ecx, liniiplus
                    je modif_matrix0

                    for_j0: 
                        movl j, %ecx
                        cmp %ecx, coloaneplus
                        je for_i_cont0

                        movl i, %eax
                        mull nvechi
                        addl j, %eax
                        movl (%edi, %eax, 4), %ebx
                        
                        addl $1, j
                        cmp %ebx, unu 
                        je inc_v0
                        jmp for_j0
                        inc_v0:
                            addl $1, v
                            jmp for_j0



                for_i_cont0:
                    addl $1, i
                    jmp for_i0

                modif_matrix0:
                    
                    movl v, %ecx
                    cmp trei, %ecx
                    je put_unu
                    jmp cont_after_modif2
                    put_unu:
                        movl lineIndex, %eax
                        mull nvechi
                        addl columnIndex, %eax
                        movl $1 , (%esi, %eax, 4)
                        jmp cont_after_modif2

                    
                    
                    



                cont_after_modif2:
                    movl $0, v
                    addl $1, columnIndex
                    jmp coloane
        
            
              
    intoarcere_linii:
  

        addl $1, lineIndex
        jmp linii

intoarcere_evolutii:
    movl $0, lineIndex
    linii_noi:
        movl lineIndex, %ecx
        cmp %ecx, m
        je cont_intoarcere_evolutii
        movl $1, columnIndex
        coloane_noi:
            movl columnIndex, %ecx
            cmp %ecx, n
            je cont_linii_noi

            movl lineIndex, %eax
            mull nvechi
            addl columnIndex, %eax
            movl (%esi, %eax, 4), %ebx
            movl %ebx, (%edi, %eax, 4)

            
            addl $1, columnIndex
            jmp coloane_noi
    cont_linii_noi:
   
        addl $1, lineIndex
        jmp linii_noi

    cont_intoarcere_evolutii:
        addl $1, e
        jmp for_evolutii












printare:
    movl $1, lineIndex
for_lines:
    movl lineIndex, %ecx
    cmp %ecx, m
    je et_exit
    movl $1, columnIndex
    for_columns:
        movl columnIndex, %ecx
        cmp %ecx, n
        je for_lines_cont

        movl lineIndex, %eax
        mull nvechi
        addl columnIndex, %eax
        movl (%esi, %eax, 4), %ebx

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
    movl $2, %edx
    int $0x80

    addl $1, lineIndex
    jmp for_lines
et_exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80

    