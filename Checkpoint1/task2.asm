#NAME : GEORGE TAN JUAN SHENG
#ID : 30884128
#GLOBAL VARIABLE : arrayprompt,enternumprompt,minelementprompt,newline, min_item,size, the_list, i
#Creates a list containing integers input by user and outputs the minimum element in the list

.data
arrayprompt: .asciiz "Array length: "
enternumprompt: .asciiz "Enter num: "
minelementprompt: .asciiz "The minimum element in this list is "
newline: .asciiz "\n"
min_item: .word 0
size: .word 0
the_list: .word 0
i: .word 0

.text
#Print "Array length: "
la $a0, arrayprompt
addi $v0, $0, 4
syscall

#Store input integer into size
addi $v0, $0, 5
syscall
sw $v0, size

#Create array the_list
lw $t0, size
sll $t0, $t0, 2
addi $a0,$t0, 4
addi $v0, $0, 9		#Size*4 + 4 bytes = memory allocated for array
syscall
sw $v0, the_list		#Store address of first element of list into the_list

#Store the size of list as the first element of the array
lw $t0, size
sw $t0,($v0)


#for i in range(len(the_list)):
while_i_lt_size:
#Check if i<len(the_list)
lw $t0, i
lw $t1, the_list		
lw $t1,($t1)		#Load the first element of the array(length of list)
slt $t0, $t0, $t1		
beq $t0,$0,exit_loop	#Exit for loop if i >= len(the_list)

#Print "Enter num: "
la $a0, enternumprompt
addi $v0, $0, 4
syscall

#Read input integer and store it in the_list[i]
lw $t0,i
lw $t1, the_list
sll $t0,$t0,2
add $t2, $t1,$t0		#$t2 will be the address of the_list[i-1]		
addi $v0, $0, 5
syscall
sw $v0,4($t2)		#Store input integer into the_list[i]

#If i==0 or min_item > the_list[i]
lw $t0, i
bne $t0,$0,check_min_item_lt_the_list_item	#Branch to check if min_item > the_list[i] if i!=0
lw $t0,min_item
lw $t1,i
lw $t2,the_list
sll $t1,$t1,2
add $t1,$t1,$t2
lw $t1,4($t1)
sw $t1,min_item
j end_of_loop

#If min_item > the_list[i]
check_min_item_lt_the_list_item:
lw $t0, min_item
lw $t1, i
lw $t2, the_list
sll $t1,$t1,2
add $t2,$t1,$t2
lw $t1, 4($t2)
slt $t1,$t1,$t0		#$t1 will be set to 1 if the_list[i] < min_item 
beq $t1,$0,end_of_loop	#If the_list[i] >= min_item, branch to end_of_loop

#Set min_item = the_list[i]
lw $t0,min_item
lw $t1,i
lw $t2,the_list
sll $t1,$t1,2
add $t1,$t1,$t2
lw $t1,4($t1)
sw $t1,min_item		#Store the_list[i] into min_item

#Increment i by 1
end_of_loop:
lw $t0, i
addi $t0, $t0, 1
sw $t0, i
j while_i_lt_size

#Print "The minimum element in this list is "
exit_loop:
la $a0, minelementprompt
addi $v0,$0,4
syscall

#Print the integer min_item
lw $a0, min_item
addi $v0, $0, 1
syscall 

#Print a new line
la $a0, newline
addi $v0, $0, 4
syscall

#Exit program
addi $v0, $0, 10
syscall 




