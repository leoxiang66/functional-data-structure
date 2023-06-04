---
layout: ../../layouts/BlogPost.astro
---

# QuickSelect Algorithm 

The QuickSelect algorithm is a very efficient method to find the k-th smallest (or largest) element in an unordered list. It was developed by Tony Hoare, who also created the QuickSort algorithm. It's a "selection" algorithm, meaning it's used for selecting a specific item from a data structure.

## Basic Idea

QuickSelect uses a "divide and conquer" strategy similar to QuickSort. It starts by choosing a "pivot" from the list. The list is then partitioned into two sub-lists, one with elements less than the pivot and one with elements greater than the pivot. This is done in linear time using the Lomuto or Hoare partitioning scheme.

However, unlike QuickSort, which recursively processes both sub-lists, QuickSelect only processes the sub-list that the k-th element is in. This is what gives QuickSelect its average time complexity of O(n), making it faster than sorting the list and picking the k-th element (which would take O(n log n) time).

## The Algorithm

Here is a simplified implementation of QuickSelect in Purescript:

```
module QuickSelect where

import Prelude
import Data.List (List(..), filter, length)
import Data.Maybe (Maybe(..))

quickselect :: forall a. Ord a => List a -> Int -> Maybe a
quickselect Nil _ = Nothing
quickselect (x : xs) k =
  let
    xs1 = filter (_ < x) xs
    xs2 = filter (_ >= x) xs
  in
    if k < length xs1 then quickselect xs1 k
    else if k == length xs1 then Just x
    else quickselect xs2 (k - length xs1 - 1)
```

This version of QuickSelect uses the "list comprehension" feature in Python to create the left, middle, and right lists. It assumes a function `selectPivot` is available to choose a pivot from the list.

## Complexity Analysis

The average time complexity of QuickSelect is O(n), but its worst-case time complexity is O(n^2). The worst-case scenario occurs when the pivot chosen is the smallest or largest element in the list, leading to very unbalanced partitions.

Many methods exist to select a "good" pivot, such as choosing the median of the list, choosing a random element, or using the "median of medians" algorithm. A good pivot is one that gives roughly equal-sized partitions, which is what gives QuickSelect its average-case time complexity of O(n).

The space complexity of QuickSelect is O(n) because it needs to create new lists for each recursive call. However, this can be reduced to O(1) by doing the partitioning in-place (i.e., modifying the original list).

## Usage

QuickSelect is often used in scenarios where only a specific element of a list is needed, rather than the entire sorted list. Examples include finding the median of a list, finding the most common element (mode), or finding the element with a certain rank in a list of scores. It's also used as a building block in other algorithms, such as QuickSort.

In conclusion, QuickSelect is a powerful algorithm that can be very efficient for certain selection tasks. Its average-case efficiency, combined with its relative simplicity, makes it a valuable tool for any programmer's toolkit.