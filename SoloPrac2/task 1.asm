#NAME : GEORGE TAN JUAN SHENG
#ID : 30884128
#GLOBAL VARIABLE : strLabel
#This program prints "I am really enjoying MIPS"


#print ("I am really enjoying MIPS")
.data 
strLabel: .asciiz "I am really enjoying MIPS"

.text
la $a0, strLabel		#Store address of strLabel to $a0
addi $v0, $0, 4			#Call code print string
syscall

#Exit
addi $v0, $0, 10		#Exit
syscall