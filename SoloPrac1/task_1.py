""" Menu to read items into a list , print the list , and reverse it."""

__author__ = 'George Tan Juan Sheng'
from typing import List , TypeVar #imports some types you may need

T = TypeVar('T') # creates a type variable which you may need

def print_menu() -> None:
    print('\nMenu:')
    print('1. append')
    print('2. reverse')
    print('3. print')
    print('4. last')
    print('5. count')
    print('6. quit')

def reverse(my_list:list):
    """ Reverses the elements of the input list.

    :pre: The list must contains elements.
    :post: The list is reversed.
    :complexity: The computational complexity is O(n), where n is the size of the input list 
    as the function iterates through half of the list.

    """
    length = len(my_list)
    for i in range(length//2):
        temp = my_list[i]
        my_list[i] = my_list[length -i-1]
        my_list[length -i-1]=temp

def last(my_list:list) -> int:
    """ Returns a new list with the last element of the input list removed
    after printing the last element of the input list.
    
    :pre: The list must contain elements.
    :post: The list will not be modified
    :complexity: The computational complexity is O(n), where n is the size of the input list 
    as the function iterates through the list until the second last element.
    """

    print(my_list[len(my_list)-1])
    temp_list = []
    for i in range(len(my_list)-1):
        temp_list.append(my_list[i])
    my_list = temp_list

def count(my_list:list,item:int) -> int:
    """ Counts the number of times the input item appears in the input list.

    :pre: The list must contain elements
    :post: The list will not be modified
    :complexity: The computational complexity is O(n), where n is the size of the input list 
    as the function iterates through the list and adds 1 to count if the item appears once. 
    
    """
    item2 = str(item)
    count = 0 
    for value in my_list:
        if value == item2:
            count += 1
    return count

my_list = []
selected_quit = False
input_line = None

while not selected_quit:
    print_menu()
    command = int(input("\nEnter command: "))
    if command == 1:
        item = input("Item? ")
        my_list.append(item)
    elif command == 2:
        reverse(my_list)
    elif command == 3:
        print(my_list)
    elif command == 4:
        print(last(my_list))
    elif command == 5:
        item = input("Item?")
        print(count(my_list,item))
    elif command == 6:
        selected_quit = True


        


