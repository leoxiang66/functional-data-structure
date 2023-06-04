---
layout: ../../layouts/BlogPost.astro
---

# Binary Search Trees in PureScript: A Comprehensive Guide

In this article, we will take a deep dive into the world of Binary Search Trees (BST) and their implementation in PureScript.

## What is a Binary Search Tree?

A Binary Search Tree (BST) is a tree data structure in which each node has at most two children, referred to as the left child and the right child. For each node, all elements in the left subtree are less than the node, and all elements in the right subtree are greater.

## PureScript Implementation

In PureScript, we can define a binary tree as a custom data type `Tree`, which is either a `Leaf` (an empty tree) or a `Node` that contains a value and two subtrees (left and right).

```purescript
data Tree a = Leaf | Node (Tree a) a (Tree a)
```

Here `a` is a type variable, indicating that our tree can store elements of any type.

### Inserting Elements

We can insert elements into the BST using the `insertElement` function:

```purescript
insertElement:: forall a. Ord a => a -> Tree a -> Tree a
insertElement x Leaf = Node Leaf x Leaf
insertElement x (Node l a r) 
  | x < a = Node (insertElement x l) a r
  | otherwise = Node l a (insertElement x r)
```

This function inserts a new value into the correct position in the tree to maintain the BST property.

### Building a BST

We can build a BST from a list of elements using the `buildBST` function:

```purescript
buildBST :: forall a. Ord a => List a -> Tree a
buildBST Nil = Leaf
buildBST (Cons x xs) = insertElement x (buildBST xs)
```

This function constructs a BST by inserting each element of the list into the tree one by one.

### Traversals

We can traverse the BST in different orders. For instance, `preorder` and `inorder` functions are implemented as follows:

```purescript
preorder :: forall a. Ord a => Tree a -> Array a
preorder Leaf = []
preorder (Node l a r) = concat [[a], preorder l,  preorder r]

inorder :: forall a. Ord a => Tree a -> Array a
inorder Leaf = []
inorder (Node l a r) = concat [preorder l, [a], preorder r]
```

- Preorder traversal visits the current node before its child nodes.
- Inorder traversal visits the left child, then the current node, and finally, the right child. This will return the values in a sorted order for a BST.

### Validating a BST

We can check if a tree is a valid BST using the `bst` function:

```purescript
bst :: forall a. Ord a => Tree a -> Boolean
bst tree =
  case tree of
    Leaf -> true
    Node left value right ->
      let lt x = x <= value
          gt x = x >= value
      in all lt (setTree left) && all gt (setTree right) && bst left && bst right
```

This function checks if all elements in the left subtree are less than the node and all elements in the right subtree are greater. It does this check recursively for all nodes.

## Conclusion

Binary Search Trees are powerful data structures that allow fast lookup, addition, and removal of items, and can be used to implement ordered collections of items. PureScript provides a type-safe and functional way to implement and work with BSTs.
