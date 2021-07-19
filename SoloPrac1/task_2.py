""" Menu to read items into a list , print the list , and reverse it."""

__author__ = 'George Tan Juan Sheng'
from typing import List , TypeVar #imports some types you may need

T = TypeVar('T') # creates a type variable which you may need

def print_menu() -> None:
    print('\nMenu:')
    print('1. Decimal to Binary')
    print('2. Decimal to Hexadecimal')
    print('3. Convert Decimal to other Base')
    print('4. Quit')

def dectobin(decimal:int) -> str:
    """ Converts the input decimal value into binary representation and 
    returns the binary value
    """
    if decimal == 0:
        return '0'
    value = decimal
    temp_res = ''
    res = ''
    while value != 0:
        remainder = value%2
        temp_res = temp_res + (str(remainder))
        value = value // 2
    
    for i in range(len(temp_res)-1,-1,-1):
        res += temp_res[i]
    return res

def dectohex(decimal:int) -> str:
    """ Converts the input decimal value into hexadecimal representation
    and returns the hexadecimal number.
    """
    if decimal == 0:
        return '0'
    value = decimal
    temp_res = ''
    res = ''
    while value != 0:
        remainder = value%16
        if remainder >=10:
            if remainder == 10:
                remainder ='A'
            elif remainder == 11:
                remainder ='B'
            elif remainder == 12:
                remainder ='C'
            elif remainder == 13:
                remainder ='D'
            elif remainder == 14:
                remainder ='E'
            elif remainder == 15:
                remainder ='F'
            temp_res = temp_res + remainder
            value = value //16
            
        else:
            temp_res = temp_res + (str(remainder))
            value = value // 16
    for i in range(len(temp_res)-1,-1,-1):
        res += temp_res[i]
    return res

def dectobase(decimal:int,base:int) -> str:
    """ Converts the input decimal value into the input base number 
    and returns the number in that specific base representation.
    """
    if decimal == 0:
        return '0'
    value = decimal
    temp_res = ''
    res = ''
    while value != 0:
        remainder = value%base
        if remainder >=10:
            if remainder == 10:
                remainder ='A'
            elif remainder == 11:
                remainder ='B'
            elif remainder == 12:
                remainder ='C'
            elif remainder == 13:
                remainder ='D'
            elif remainder == 14:
                remainder ='E'
            elif remainder == 15:
                remainder ='F'
            temp_res = temp_res + remainder
            value = value //base
            
        else:
            temp_res = temp_res + (str(remainder))
            value = value // base
    for i in range(len(temp_res)-1,-1,-1):
        res += temp_res[i]
    return res

my_list = []
selected_quit = False
input_line = None

while not selected_quit:
    print_menu()
    command = int(input("\nEnter command: "))
    if command == 1:
        decimal = input("Enter number to be converted ")
        print(dectobin(decimal))
    elif command == 2:
        decimal = input("Enter number to be converted ")
        print(dectohex(decimal))
    elif command == 3:
        decimal = input("Enter number to be converted ")
        base = input("Enter base to be converted to")
        print(dectobase(decimal,base))
    elif command == 4:
        selected_quit = True
        