#NAME : GEORGE TAN JUAN SHENG
#ID : 30884128
#GLOBAL VARIABLE :newline,space
#GLOBAL FUNCTION: bubble_sort
#Applies bubble sort to a list and prints out the sorted list

.globl bubble_sort

.data
space: .asciiz " "
newline: .asciiz "\n"

.text
main:
#Set $fp to $sp
addi $fp, $sp 0

#Create array and store address of first element of list as local variable
addi $a0,$0, 20			#Allocate 20 bytes(16 byes for 4 elements and 4 bytes for length of list) for array the_list
addi $v0,$0,9
syscall

#Set first element of list to 4
addi $t0,$0,4			#Store length of the_list as first element
sw $t0, 0($v0)

#the_list[0] = 4
addi $t0,$0,4			#Store 4 as the_list[0]
sw $t0, 4($v0)

#the_list[1] = -2
addi $t0,$0,-2			#Store -2 as the_list[1]
sw $t0, 8($v0)

#the_list[2] = 6
addi $t0,$0,6			#Store 6 as the_list[2]
sw $t0, 12($v0)

#the_list[3] = 7
addi $t0,$0,7			#Store 7 as the_list[3]
sw $t0, 16($v0)

#Store address of the_list into stack
addi $sp,$sp, -4
sw $v0, 0($sp)

#Store local variable i in stack and initialise it to 0
addi $sp, $sp, -4
sw $0, 0($sp)

#Pass the_list as argument 
addi $sp,$sp,-4
lw $t0, -4($fp)			#Load address of first element of list
sw $t0, 0($sp)			#Pass it as argument

jal bubble_sort			#Jump to execute function bubble_sort

addi $sp,$sp,4			#Clear argument off stack

sw $0,-8($fp)			#Load 0 to i

#For i in range(len(the_list))
main_for_loop:
lw $t0,-8($fp)			#Load i
lw $t1,-4($fp)			#Load address of first element of list
lw $t2,($t1)			#Load first element of list, which is length of the list
slt $t2,$t0,$t2			#Check if i is smaller than len(the_list)
beq $t2,$0,exit_main_for_loop

lw $t0,-8($fp)			#Load i
lw $t1,-4($fp)			#Load address of first element of the_list
sll $t0,$t0,2			#Multiply i by 4
add $t1,$t0,$t1			#Add i*4 to address of first element of the_list
lw $a0,4($t1)			#Store the_list[i] in $a0
addi $v0,$0,1			#Call code to print integer
syscall

#Call code to print space " "
la $a0,space		
addi $v0,$0,4			#Call code to print string
syscall

#Increment i by 1
lw $t0,-8($fp)			#Load i
addi $t0,$t0,1		
sw $t0,0($sp)			#Add 1 to i and store it back in i
j main_for_loop


exit_main_for_loop:
#Call code to print string newline
la $a0,newline
addi $v0, $0, 4			#Call code to print string
syscall 

addi $v0,$0, 10			#Exit program
syscall


bubble_sort:
#Save $fp and $ra on stack
addi $sp, $sp, -8		#Allocate space on stack for $fp and $ra
sw $fp, 0($sp)			#Store $fp on stack
sw $ra, 4($sp)			#Store $ra on stacl
addi $fp,$sp,0			#Copy $sp to $fp

#Allocate local variables on stack
addi $sp,$sp,-20		
sw $0,0($sp)			#Store n on stack and set to 0
sw $0,4($sp)			#Store a on stack and set to 0
sw $0,8($sp)			#Store i on stack and set to 0
sw $0,12($sp)			#Store item on stack and set to 0
sw $0,16($sp)			#Store item_to_right on stack and set to 0

#Set n to len(the_list)
lw $t0, 8($fp)		
lw $t1, ($t0)			#Access the_list and store the len of list in $t1
sw $t1, 0($sp)			#Store the length of list into n

#for a in range(n-1)
outer_while_a_lt_n_minus_one:
lw $t0, -16($fp)			#Load a
lw $t1, -20($fp)			#Load n
addi $t1,$t1,-1			#Store n-1 in $t1

slt $t2,$t0,$t1			#Check if a < n-1
beq $t2,$0,exit_outer_loop	#If a>=n-1, branch to exit_outer_loop

#for i in range(n-1)
inner_while_i_lt_n_minus_one:
lw $t0, -12($fp)			#Load i
lw $t1,-20($fp)			#Load n
addi $t1,$t1,-1			#Store n-1 in $t1

slt $t2,$t0,$t1			#Check if i < n-1
beq $t2,$0,exit_inner_loop	#If i>=n-1, branch to exit_inner_loop

#Assign item to the_list[i]
lw $t0, 8($fp)			#Load address of first element of the_list
lw $t1, -12($fp)			#Load i
sll $t1,$t1,2			#Multiply i by 4
add $t2,$t0,$t1			#Address of first element plus i*4
lw $t2,4($t2)			#Load value of the_list[i]
sw $t2,12($sp)			#Store the_list[i] into item

#Assign item_to_right to the_list[i+1]
lw $t0, 8($fp)			#Load address of first element of the_list
lw $t1, -12($fp)			#Load i
addi $t1,$t1,1			#Add 1 to i
sll $t1,$t1,2			#Multiply (i+1) by 4
add $t2,$t0,$t1			#Address of first element plus (i+1)*4
lw $t2,4($t2)			#Load value of the_list[i+1]
sw $t2,16($sp)			#Store the_list[i] into item_to_right

#Check if item>item_to_right
lw $t0, -8($fp)			#Load item
lw $t1, -4($fp)			#Load item_to_right
slt $t2, $t1,$t0			#Check if item_to_right < item
beq $t2,$0,end_inner_for_loop	#If item_to_right >= item, branch to end_inner_for_loop

#Assign the_list[i] to item_to_right
lw $t0,-4($fp)			#Load item_to_right
lw $t1,-12($fp)			#Load i
lw $t2, 8($fp)			#Load address of first element of the_list
sll $t1,$t1,2			#Multiply i by 4
add $t2,$t1,$t2			#Add i*4 to address of first element of the_list
sw $t0,4($t2)			#Store item_to_right in the_list[i]

#Assign the_list[i+1] to item
lw $t0, -8($fp)			#Load item
lw $t1,-12($fp)			#Load i
addi $t1,$t1,1			#Add 1 to i
lw $t2,8($fp)			#Load address of first element of list
sll $t1,$t1,2			#Multiply (i+1) by 4
add $t2,$t1,$t2			#Add (i+1)*4 to address of first element of list 
sw $t0,4($t2)			#Store item to the_list[i+1]

#Increment i by 1 and continue looping
end_inner_for_loop:
lw $t0,-12($fp)			#Load i
addi $t0,$t0,1			#Add 1 to i
sw $t0, 8($sp)			#Store i+1 to i
j inner_while_i_lt_n_minus_one	#Continue inner loop again

exit_inner_loop:
j end_outer_for_loop

#Increment a by 1 and reset i to 0 then continue looping
end_outer_for_loop:
#Increment a by 1
lw $t0, -16($fp)			#Load a
addi $t0, $t0,1			#Add 1 to a
sw $t0, 4($sp)			#Store a+1 to a

#Reset i to 0
sw $0, 8($sp)
j outer_while_a_lt_n_minus_one	#Continue outer loop again


exit_outer_loop:
#Clear local variables off stack
addi $sp,$sp,20			#20 because there is 5 variables,5x4= 20

#Restore $fp and $ra off stack
lw $fp,0($sp)			#Restore $fp
lw $ra,4($sp)			#Restore $ra

addi $sp,$sp,8			#Clear $fp and $ra off stack

jr $ra				#Jump back to caller
















