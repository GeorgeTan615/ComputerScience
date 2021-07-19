#NAME : GEORGE TAN JUAN SHENG
#ID : 30884128
#GLOBAL VARIABLE : min_elementprompt
#GLOBAL FUNCTION: get_minimum
#Prints the minimum element of my_list

.globl get_minimum

.data
min_elementprompt: .asciiz "The minimum element in this list is "

.text
main:
#Print "The minimum element in this list is "
la $a0, min_elementprompt	
addi $v0,$0,4
syscall

addi $fp,$sp,0			#Set $sp to $fp

#Create space for array my_list
addi $a0,$0,16			#16 because 3 elements plus first element as length of array
addi $v0, $0, 9			#Call code to allocate memory
syscall
addi $t0, $0,3		
sw $t0, ($v0)			#Set first element of list as length of list	
addi $t0, $0,2		
sw $t0, 4($v0)			#my_list[0] = 2
addi $t0, $0,4		
sw $t0, 8($v0)			#my_list[1] = 4
addi $t0, $0,-1
sw $t0, 12($v0)			#my_list[2] = -1

#Store array my_list as local variable
addi $sp, $sp, -4
sw $v0, 0($sp)

#Passing array my_list as argument my_list
addi $sp, $sp, -4
sw $v0, 0($sp)

jal get_minimum

#Clear argument my_list off stack
addi $sp,$sp,4		

#Print the return value of function get_minimum
addi $a0, $v0,0			#Store return value as argument in $a0
addi $v0, $0, 1			#Call code to print integer
syscall

addi $v0, $0,10			#Exit program
syscall


get_minimum:
#Save fp and ra
addi $sp, $sp, -8
sw $fp,0($sp)			#Store fp on stack
sw $ra,4($sp)			#Store ra on stack
addi $fp, $sp, 0			#Copy $sp to $fp

#Allocate local variables
#Store min_item, i and item in stack and initialise it to 0
addi $sp, $sp, -12
sw $0, 0($sp)			#Store min_item and set to 0
sw $0, 4($sp)			#Store i and set to 0
sw $0, 8($sp)			#Store item and set to 0

#Setting min_item to the_list[0], min_item = the_list[0]

lw $t0, 8($fp)			#Access argument my_list
lw $t1, 4($t0)			#Get first element of my_list
sw $t1, 0($sp)			#Store it in stack of local variable min_item

#Set i to 1 in stack
addi $t0,$0, 1
sw $t0, 4($sp)

#While i is lesser than len(the_list):
while_i_lt_len_lst:
lw $t0, -8($fp)			#Load i
lw $t1, 8($fp)
lw $t1, 0($t1)			#Load first element of array, which is length of list
slt $t2,$t0,$t1			#Check if i<len(list)
beq $t2,$0, exit_loop		#If i >= len(list), branch to exit loop

#Assign item to the_list[i], item = the_list[i]
lw $t0, -8($fp)			#Load i
sll $t0,$t0,2			#Multiply i by 4
lw $t1, 8($fp)			#Load address of first element of array the_list
add $t2, $t0,$t1
lw $t2, 4($t2)			#Load the_list[i]
sw $t2, 8($sp)			#Store the_list[i] in item

#Check if min_item > item:
lw $t0, -12($fp)			#Load min_item
lw $t1, -4($fp)			#Load item
slt $t2,$t1,$t0			#Check if item < min_item
beq $t2,$0,end_of_for_loop	#If min item <= item, branch to end_of_for_loop

#Assign min_item to item
lw $t0, -4($fp)
sw $t0, 0($sp)			#min_item = item

#Increment i by one
end_of_for_loop:
lw $t0, -8($fp)			#Load i
addi $t0, $t0, 1			#Add 1 to i
sw $t0, 4($sp)			#Store i + 1 back to i
j while_i_lt_len_lst

exit_loop:
lw $v0, -12($fp)			#Load return value,min_item to $v0

addi $sp, $sp, 12		#Clear local variable off stack

lw $fp, 0($sp)			#Restore $fp
lw $ra, 4($sp)			#Restore $ra

addi $sp, $sp, 8			#Clear $fp and $ra off stack
jr $ra				#Return to caller 







