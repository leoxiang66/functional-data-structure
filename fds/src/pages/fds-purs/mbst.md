---
layout: ../../layouts/BlogPost.astro
---

# MTree in PureScript: A Detailed Overview

In this article, we'll examine the concept of MTree, a specialized tree structure, and demonstrate how it's implemented in PureScript. 

## What is an MTree?

An MTree is a type of binary tree where each node carries an additional piece of information: the maximum value found in that tree. This includes the node's value itself and all values in its left and right child subtrees.

```purescript
data MTree a
  = Leaf 
  | Node (MTree a) a a (MTree a) -- l max value r
```

## PureScript Implementation

### Building an MTree

An MTree is defined recursively. An MTree is either a `Leaf` or a `Node` which consists of a left MTree, the maximum value within that node's tree, the node's value, and the right MTree.

### Operations on MTree

#### Set Creation

A set representation of an MTree can be created using the `setMTree` function. This function traverses the MTree and adds all node values to a Set.

```purescript
setMTree :: forall a. Ord a => MTree a -> Set a
setMTree tree =
  case tree of
    Leaf -> empty::Set a
    Node left _ value right ->
      let subset1 = insert (setMTree left) value
          subset2 = setMTree right
      in union subset1 subset2
```

#### Maximum Binary Search Tree Validation

To check if an MTree maintains the properties of a Maximum Binary Search Tree (MBST), we use the `mbst` function. This function validates three conditions:

- The subtrees `l` and `r` should themselves be valid MBSTs.
- The node's value `a` should be greater than all elements in the left subtree and less than all elements in the right subtree.
- The maximum value `m` for the node should be greater than all values in the tree rooted at the node and also be present in the tree rooted at the node.

```purescript
mbst :: forall a. Ord a => MTree a -> Boolean
mbst tree = 
  case tree of 
    Leaf -> true
    Node l m a r -> (mbst l) && (mbst r) && 
      (all (lessThan a) (setMTree r)) &&
      (all (greaterThan a) (setMTree l)) &&
      (all (greaterThan m) (setMTree (Node Leaf m a r))) &&
      (belongsto m (setMTree (Node Leaf m a r)))
```

## Conclusion

MTree is a valuable variation of the binary tree that can allow for more efficient processing of certain tree operations, like retrieving the maximum value in a tree. Its implementation in PureScript demonstrates the flexibility and power of the PureScript type system, as well as its capacity for effectively modeling and solving complex data structures and problems.