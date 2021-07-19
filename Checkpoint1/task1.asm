#NAME : GEORGE TAN JUAN SHENG
#ID : 30884128
#GLOBAL VARIABLE : first, second, result, firstprompt, secondprompt, resultprompt, newline
#Gets two input integers from user and print the result after some calculations are carried out according to the value of both integers

.data
first: .word 0
second: .word 0
result: .word 0
firstprompt: .asciiz "Enter first: "
secondprompt: .asciiz "Enter second: "
resultprompt: .asciiz "Result: "
newline: .asciiz "\n"

.text
#Prints "Enter first: " 
la $a0, firstprompt
addi $v0,$0,4
syscall

addi $v0,$0,5		#Asks for user input and store it in first
syscall
sw $v0,first

#Prints "Enter second: "
la $a0, secondprompt
addi $v0,$0,4
syscall

addi $v0,$0,5		#Asks for user input and store it in second
syscall
sw $v0,second

#If first > 0 
lw $t0, first
lw $t1, second
slt $t0, $0,$t0		
beq $t0,$0,elif_fst_eq_scd	#Branch to elif if not 0 < first

#If second >=0
lw $t1, second
slt $t1, $t1,$0		
bne $t1,$0,elif_fst_eq_scd	#Branch to elif if second < 0 

#Store the result of the division of second by first 
lw $t0, first
lw $t1, second
div $t1,$t0
mflo $t1
sw $t1, result		
j endif

elif_fst_eq_scd: 
#if first == second 
lw $t0, first
lw $t1, second
bne $t0, $t1, check_first_smaller_second	#Branch to check if first is smaller than second if first is not equal to second

#Store product of first and second into result
lw $t0, first
lw $t1, second
mult $t0, $t1		
mflo $t0
sw $t0, result		
j endif

#if first < second
check_first_smaller_second:
lw $t0, first		
lw $t1, second
slt $t0, $t0, $t1	
beq $t0, $0, else_rslt_eq_scd_mtply_two	#If first is not smaller than second, branch to else

lw $t0, first
lw $t1, second
mult $t0, $t1
mflo $t0
sw $t0, result		#Store product of first and second into result
j endif

else_rslt_eq_scd_mtply_two:
#Store the product of second and 2 into result
lw $t0, second
addi $t1, $0, 2
mult $t0,$t1
mflo $t0
sw $t0,result		

endif:
#Print "Result: + "
la $a0, resultprompt	
addi $v0, $0, 4
syscall

#Print integer result
lw $a0, result
addi $v0, $0, 1		
syscall 

#Print newline
la $a0, newline
addi $v0, $0, 4		
syscall

#Exit program
addi $v0, $0, 10		
syscall




