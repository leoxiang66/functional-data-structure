---
layout: ../../layouts/BlogPost.astro
---

# Merge Sort: A Comprehensive Guide

Merge Sort is a powerful and efficient sorting algorithm that employs a divide-and-conquer strategy. It breaks down the array into smaller subarrays, sorts them individually, and then merges them back together.

## Algorithm

Merge sort works as follows:

1. **Divide:** If the list is of length 0 or 1, then it is already sorted. Otherwise, divide the unsorted list into two sublists, each about half the size.
2. **Conquer:** Recursively sort both sublists.
3. **Combine:** Merge the two sorted sublists back into one sorted list.

## Pseudocode

Here's a simple pseudocode representation of the merge sort algorithm:

```
function mergeSort(arr)
  if length(arr) <= 1
    return arr
  mid := length(arr) / 2
  left := mergeSort(arr[0..mid])
  right := mergeSort(arr[mid+1..end])
  return merge(left, right)
```

In this pseudocode:

- `arr` represents the array to be sorted.
- `mergeSort` is a recursive function, calling itself for the `left` and `right` halves of the array.
- The `merge` function is used to merge two sorted arrays into one.

## Implementation in PureScript

Here is how the algorithm can be implemented in PureScript:

```purescript
mergeSort :: forall a. Ord a => List a -> List a
mergeSort Nil = Nil 
mergeSort (x:Nil) = x:Nil
mergeSort arr = 
  let 
      mid_id = length arr `div` 2
      left = take mid_id arr 
      right = drop mid_id arr 
    in 
    merge (mergeSort left) (mergeSort right)



merge :: forall a. Ord a => List a -> List a -> List a
merge Nil Nil = Nil 
merge (x:xs) Nil = x:xs 
merge Nil (y:ys) = y:ys
merge (x:xs) (y:ys)
  | x <= y = x :  merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys
```


## Advantages of Merge Sort

- Merge sort has a worst-case time complexity of O(n log n), which is one of the best among comparison-based sorting algorithms.
- It is a stable sorting algorithm, which means it maintains the relative order of equal elements.

## Disadvantages of Merge Sort

- Merge sort requires additional space equivalent to the size of the input. This can be a problem for large arrays.
- It involves a good number of data movement, which can affect performance on modern architectures, where read/write operations are slower.

## Summary

Merge sort is an efficient, stable, and comparison-based sorting algorithm. While it uses extra space and isn't the best for small data sets, it scales well with large data sets and has a consistent performance characteristic of O(n log n). It's a good general-purpose sort and is a good choice for applications where stability is important.