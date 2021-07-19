__author__ = "George Tan Juan Sheng (30884128)"

from typing import List


def bubble_sort(the_list: List[int]) -> None:
    """Sorts the input list using bubble sort.

    :pre: The list must contain elements.
    :invariant: The largest element will always be at the rightmost position.
    :post: The list will be sorted in ascending order.
    :complexity: The computational complexity is O(n^2) regardless for both best and worst case. This is due to the dominant line
    which is the inner loop, which has a computational complexity of O(n^2). The complexity is same for both best and worst case 
    as the outer and inner loops are executed regardless.
    """
    n = len(the_list)                       #n is the number of elements in the input list
    for a in range(n-1):                    #a is only used to traverse through the elements of the input list
        for i in range(n-1):                #i is used as an index to access the elements of the list
            item =  the_list[i]             #item is set to the element at i index of the_list
            item_to_right = the_list[i+1]   #item_to_right is set to the element after item, which is the element at i+1 index of the_list
            if item > item_to_right:        #Check if item is larger than item_to_right, which is the element after item             
                #If item > item_to_right
                the_list[i] = item_to_right 
                the_list[i+1] = item        #Swap position of both elements, element i will be assigned to item_to_right and element i+1 will be assigned to item


def main() -> None:
    "Used to call the function bubble-sort and prints the sorted the_list"
    the_list = [4, -2, 6, 7]
    bubble_sort(the_list)

    for i in range(len(the_list)):          #i is used to access through the index of elements of the list
        # Print the item without a newline character
        print(the_list[i], end='')          #Prints the element of the list at i index without having the next output at the next line
        print(' ', end='')                  #Prints a space and the next line of output will not be at the next line
    print()                                 #Print a newline


main()