#NAME : GEORGE TAN JUAN SHENG
#ID : 30884128
#GLOBAL VARIABLE : input1,input2,integer1,integer2,quotient,remainder,qprompt,rprompt,newline
#Prints the quotient and remainder of the two input integers entered


.data
input1: .asciiz "Please enter the first integer:"
input2: .asciiz "Please enter the second integer:"
integer1: .word 0
integer2: .word 0
quotient: .word 0
remainder: .word 0
qprompt: .asciiz "The quotient is "
rprompt: .asciiz "The remainder is "
newline: .asciiz "\n"

.text
#Print "Please enter the first integer:":
la $a0,input1		#Load address of input 1 to $a0
addi $v0, $0,4		#Call code to print string
syscall


#Input integer 1
addi $v0, $0, 5		#Call code to input integers
syscall
sw $v0, integer1		#Store word integer1 value


#Print "Please enter the second integer:":
la $a0,input2		#Load address of input 2 to $a0
addi $v0, $0,4		#Call code to print string
syscall


#Input integer 2
addi $v0, $0, 5		#Call code to input integers
syscall
sw $v0, integer2		#Store word integer2 value


#Get quotient value
lw $t0,integer1		#Load integer 1 into $t0
lw $t1, integer2		#Load integer 2 into $t1
div $t0, $t1		#$t1 = integer1/integer2
mflo $t1
sw $t1,quotient		#Get the quotient and store word in quotient


#Get remainder value
lw $t0,integer1		#Load integer 1 into $t0
lw $t1, integer2		#Load integer 2 into $t1
div $t0, $t1		#$t1 = integer1/integer2
mfhi $t1		
sw $t1,remainder		#Get the remainder and store word in remainder


#Print "The quotient is " + str(quotient)
la $a0,qprompt		#Load address of qprompt into $a0
addi $v0, $0,4		#Call code to print string
syscall

lw $a0,quotient		#Load word quotient into $a0
addi $v0,$0,1		#Call code to print integer
syscall	

la $a0, newline		#Load address of newline into $a0
addi $v0, $0, 4		#Call code to print string
syscall

#Print "The Remainder is " + str(remainder)
la $a0,rprompt		#Load address of rprompt into $a0
addi $v0, $0,4		#Call code to print string
syscall

lw $a0,remainder		#Load word remainder into $a0
addi $v0,$0,1		#Call code to print integer
syscall	

la $a0, newline		#Load address of newline into $a0
addi $v0, $0, 4		#Call code to print string
syscall

#Exit
addi $v0, $0, 10		#Exit
syscall



