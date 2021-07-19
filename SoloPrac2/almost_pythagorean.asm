#NAME : GEORGE TAN JUAN SHENG
#ID : 30884128
#GLOBAL VARIABLE : nprompt, mprompt, rprompt, n, m, a, b, c, two, space
#This program prints the (almost) Pythagorean triple

.data
nprompt: .asciiz "Please enter integer n: "
mprompt: .asciiz "Please enter integer m: "
rprompt: .asciiz "The almost pythagorean triple is "
n: .word 0
m: .word 0
a: .word 0
b: .word 0 
c: .word 0
two: .word 2
space: .asciiz " "

.text
#Print "Please enter integer n: " and enter integer n
la $a0, nprompt		#Load nprompt into register $a0
addi $v0, $0, 4		#Call code to print string
syscall 

addi $v0, $0, 5		#Call code to input string
syscall
sw $v0, n		#Store input into n


#Print "Please enter integer m: " and enter integer m
la $a0, mprompt		#Load mprompt into register $a0
addi $v0, $0, 4		#Call code to print string
syscall 

addi $v0, $0, 5		#Call code to input string
syscall
sw $v0, m		#Store input into m


#Calculate value a
lw $t1, m		#Load m into $t1
mult $t1,$t1
mflo $t1			#Square m and store it in $t1

lw $t0, n		#Load n into $t0
mult $t0,$t0		
mflo $t0			#Square n and store it in $t0

sub $t2, $t1, $t0	#Subtract n square from m square and store it in $t2
sw $t2, a		#Store $t2 into a


#Calculate value b
lw $t0, n		#Load n into $t0
lw $t1, m		#Load m into $t1
lw $t2, two		#Load two into $t2

mult $t2,$t0		
mflo $t0			#Multiply $t2 with $t0 and store it in $t0	
mult $t0, $t1
mflo $t0			#Multiply $t0 with $t1 and store it in $t0
sw $t0, b		#Store $t0 into b


#Calculate value c
lw $t1, m		#Load m into $t1
mult $t1,$t1
mflo $t1			#Square m and store it in $t1

lw $t0, n		#Load n into $t0
mult $t0,$t0		
mflo $t0			#Square n and store it in $t0

add $t2, $t1, $t0	#Add $t1 with $t0 and store it in $t2
sw $t2, c		#Store $t2 into c


#Print ("The almost pythagorena triple is ") + str(a) + str(b) + str(c)
la $a0, rprompt		#Load rprompt into $a0
addi $v0, $0, 4		#Call code to print string
syscall 

lw $a0, a		#Load word a into $a0
addi $v0, $0, 1		#Call code to print integer
syscall 

la $a0, space		#Load address space into $a0
addi $v0, $0, 4		#Call code to print string
syscall 

lw $a0, b		#Load word b into $a0	
addi $v0, $0, 1		#Call code to print integer
syscall 

la $a0, space		#Load address space into $a0
addi $v0, $0, 4		#Call code to print string
syscall 

lw $a0, c		#Load word c into $a0	
addi $v0, $0, 1		#Call code to print integer
syscall 

#Exit
addi $v0, $0,10		#Exit
syscall








