---
layout: ../../layouts/BlogPost.astro
---

# Sets in PureScript: A Comprehensive Guide

In this article, we delve into the concept of Sets, their properties, and how to implement them in PureScript.

## What is a Set?

In mathematics, a set is a collection of distinct elements. Each element can only occur once in a set. Operations such as union, intersection, and difference are commonly performed on sets.

## PureScript Implementation

In PureScript, a `Set` is implemented as an array that enforces the property of containing unique elements. This property is enforced by the `insert` function, which only adds an element to the set if it does not already exist in the set.

```purescript
type Set a = Array a
```

### Creating a Set

A new empty set can be created using the `empty` function, which simply returns an empty array.

```purescript
empty :: forall a. Set a
empty = []
```

A set can also be created from an array of elements using the `make` function, which folds over the array, inserting each element into an initially empty set.

```purescript
make :: forall a. Eq a => Array a -> Set a
make arr = foldl insert arr empty
```

### Adding Elements

Elements can be added to a set using the `insert` function. It first checks whether the element is already present in the set, and if not, it adds it.

```purescript
insert :: forall a. Eq a =>  Set a -> a  -> Set a
insert set item = 
  if item `Array.elem` set 
    then set 
    else Array.snoc set item
```

### Checking Membership

We can check if an element belongs to a set using the `contains` function, which returns true if the element is in the set and false otherwise.

```purescript
contains :: forall a. Eq a => a -> Set a -> Boolean
contains item set = item `Array.elem` set
```

### Removing Elements

Elements can be removed from a set using the `remove` function, which filters out the specified element from the set.

```purescript
remove :: forall a. Eq a => a -> Set a -> Set a
remove item set = Array.filter (notEq item) set
```

### Set Union

The union of two sets can be found using the `union` function, which folds over the first set, inserting each element into the second set.

```purescript
union :: forall a. Eq a => Set a -> Set a -> Set a
union set1 set2 = foldl insert set1 set2
```

### Checking a Predicate on all Elements

We can check if a predicate holds for all elements in a set using the `all` function.

```purescript
all :: forall a. Eq a => (a -> Boolean) -> Set a -> Boolean
all pred set = foldl (\acc x -> acc && (pred x)) true set 
```

## Conclusion

Sets are powerful constructs that allow us to deal with unique collections of elements. PureScript provides an easy and functional way to work with them while ensuring type safety.
