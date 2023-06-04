---
layout: ../../layouts/BlogPost.astro
---
Insertion sort is the sorting mechanism where the sorted array is built having one item at a time. The array elements are compared with each other sequentially and then arranged simultaneously in some particular order.

## Explanation

The first element of the array forms the sorted subarray while the rest create the unsorted subarray from which we choose an element one by one and **insert** the same in the sorted subarray. The same procedure is followed until we reach the end of the array.

In each iteration, we extend the sorted subarray while shrinking the unsorted subarray. The array is searched sequentially and unsorted items are moved and inserted into the sorted sub-list (in the same array).

* If it is the first element, it is already sorted. return 1;
* Pick next element
* Compare with all elements in the sorted sub-list
* Shift all the elements in the sorted sub-list that is greater than the value to be sorted
* Insert the value
* Repeat until list is sorted

## Pseudocode
```pseudocode
procedure insertionSort( A : array of items )
   int holePosition
   int valueToInsert
	
   for i = 1 to length(A) inclusive do:
	
      /* select value to be inserted */
      valueToInsert = A[i]
      holePosition = i
      
      /*locate hole position for the element to be inserted */
		
      while holePosition > 0 and A[holePosition-1] > valueToInsert do:
         A[holePosition] = A[holePosition-1]
         holePosition = holePosition -1
      end while
		
      /* insert the number at hole position */
      A[holePosition] = valueToInsert
      
   end for
	
end procedure
```



## Complexity analysis

Insertion sort runs in *O*(*n*) time in its best case and runs in *O*(*n*²) in its worst and average cases.

### Best case

Insertion sort performs two operations: it scans through the list, comparing each pair of elements, and it swaps elements if they are out of order. Each operation contributes to the running time of the algorithm. If the input array is already in sorted order, insertion sort compares *O*(*n*) elements and performs no swaps. Therefore, in the best case, insertion sort runs in O(*n*) time.

### Worst case

The worst case for insertion sort will occur when the input list is in decreasing order. To insert the last element, we need at most *n*−1 comparisons and at most *n*−1 swaps. To insert the second to last element, we need at most *n*−2 comparisons and at most *n*−2 swaps, and so on. The number of operations needed to perform insertion sort is therefore: 2 × (1+2+⋯+*n* −2+*n* −1) . This is in the order of sum of first n-1 numbers which is quadratic in nature. therefore, in the worst case, insertion sort runs in O(*n*²) time.



> The average case and the worst case have the same time complexity. Try to think why is this happening.



## Code Implementation

```purescript
-- insert an element while keeping the list ordered
insert_ :: forall a. Ord a => a -> List a  -> List a 
insert_ x Nil = x:Nil
insert_ x (y:ys) 
  | x <= y = (x:y:ys)
  | otherwise = (y: (insert_ x ys))


insort :: forall a. Ord a => List a -> List a
insort Nil = Nil
insort (x:xs) = insert_ x (insort xs)
```



## Advantages

- Simple and easy to understand implementation
- Efficient for small data
- If the input list is sorted beforehand (partially) then insertions sort takes `**O(n+d)**` where d is the number of inversions
- Chosen over bubble sort and selection sort, although all have worst case time complexity as `**O(n^2)**`
- Maintains relative order of the input data in case of two equal values (stable)
- It requires only a constant amount `**O(1)**` of additional memory space (in-place Algorithm)



## Applications

- It could be used in sorting small lists.
- It could be used in sorting "almost sorted" lists.
- It could be used to sort smaller sub problem in Quick Sort.



