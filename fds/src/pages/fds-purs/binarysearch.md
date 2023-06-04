---
layout: ../../layouts/BlogPost.astro
---

# Binary Search: A Comprehensive Guide

Binary search is a fast search algorithm that finds the position of a target value within a sorted array. It halves the search space effectively at each step instead of searching all the elements.

## Algorithm

Binary search compares the target value to the middle element of the array. Here are the steps:

1. If they are not equal, the half in which the target cannot lie is eliminated, and the search continues for the remaining half until it succeeds.
2. If the search ends with the remaining half being empty, the target is not in the array.

Binary search runs in logarithmic time in the worst case, making O(log n) comparisons, where n is the number of elements in the array.

## Pseudocode

Here's a simple pseudocode representation of binary search:

```
function binary_search(A, n, T) is
    L := 0
    R := n − 1
    while L ≤ R do
        m := floor((L + R) / 2)
        if A[m] < T then
            L := m + 1
        else if A[m] > T then
            R := m - 1
        else:
            return m
    return unsuccessful
```

In this pseudocode:

- A represents the sorted array.
- n represents the size of the array.
- T is the target value you're searching for.
- L and R represent the "Left" and "Right" bounds of the search.

## Implementation in PureScript

Here is how the algorithm can be implemented in PureScript:

```purescript
binarySearch :: Array Int -> Int -> Maybe Int
binarySearch xs x = go 0 (length xs - 1)
  where
    go :: Int -> Int -> Maybe Int
    go lo hi
      | lo > hi = Nothing
      | xs ! mid < x = go (mid + 1) hi
      | xs ! mid > x = go lo (mid - 1)
      | otherwise = Just mid
      where
        mid = lo + ((hi - lo) / 2)
```

## Advantages of Binary Search

- It has a better time complexity than linear search algorithms: O(log n) compared to O(n).
- It is a good option when the data is large and sorted.

## Disadvantages of Binary Search

- The main disadvantage is that the array must be sorted to apply binary search.
- Binary search is not efficient when the array is small. In such cases, other search algorithms like linear search or hash tables can be used.

## Summary

Binary search is an efficient algorithm for finding an item from a sorted list of items. It works by repeatedly dividing in half the portion of the list that could contain the item until you've narrowed down the possible locations to just one.