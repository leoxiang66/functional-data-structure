---
layout: ../../layouts/BlogPost.astro
---

# Bubble Sort: A Comprehensive Guide

Bubble Sort is one of the simplest sorting algorithms that works by repeatedly swapping the adjacent elements if they are in the wrong order.

## Algorithm

The Bubble Sort algorithm works by repeatedly scanning through the list to be sorted, comparing each pair of adjacent items, and swapping them if they are in the wrong order. This pass through the list is repeated until no swaps are needed, indicating that the list is sorted. 

The algorithm gets its name from the way smaller or larger elements "bubble" to the top of the list.

## Pseudocode

Here's a simple pseudocode representation of the bubble sort algorithm:

```
function bubbleSort(arr)
    n := length(arr)
    for i from 0 to n-1 do:
        for j from 0 to n-i-1 do:
            if arr[j] > arr[j+1] then
                swap arr[j] and arr[j+1]
```

In this pseudocode:

- `arr` represents the array to be sorted.
- `n` is the length of the array.
- The outer loop (i) runs through the entire array.
- The inner loop (j) runs from the start of the array to the end of the unsorted section of the array (as after each complete pass, the largest element is placed in its correct position).

## Implementation in PureScript

Here is how the algorithm can be implemented in PureScript:

```purescript
module BubbleSort where

import Prelude
import Data.Array (sort)

bubbleSort :: forall a. Ord a => Array a -> Array a
bubbleSort arr = case arr of
  [] -> []
  _  -> sort arr
```

Note: In this simplified example, we use PureScript's built-in `sort` function from the `Data.Array` module. To implement bubble sort from scratch, you would need to implement the logic for iterating over the array, comparing adjacent elements, and swapping elements as necessary.

## Advantages of Bubble Sort

- Bubble Sort is simple and easy to understand.
- It is useful for smaller data sets, but not on larger lists.
- It can be practical if the input is usually in sorted order but may occasionally have some out-of-order elements nearly in position.

## Disadvantages of Bubble Sort

- Bubble sort has a worst-case and average time complexity of O(n²), where n is the number of items being sorted. Hence, it is not suitable for large data sets.
- There are many sorting algorithms that are much more efficient than bubble sort, like quicksort, mergesort, and heapsort.

## Summary

Bubble sort, despite its simplicity, has limited efficiency and is therefore not used in practice for sorting large arrays. However, it can be used for teaching purposes due to its simplicity, and to introduce the concept of algorithm efficiency.