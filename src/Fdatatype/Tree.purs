module Fdatatype.Tree
  ( Tree(..)
  , bst
  , buildBST
  , inorder
  , insertElement
  , preorder
  , setTree
  )
  where

import Prelude

import Data.Array (concat)
import Data.List (List(..))
import Fdatatype.Set (Set, empty, insert, union, all)

data Tree a
  = Leaf 
  | Node (Tree a) a (Tree a)


setTree :: forall a. Ord a => Tree a -> Set a
setTree tree = 
  case tree of
    Leaf -> empty :: Set a
    Node left value right ->
      let set1 = insert (setTree left) value
      in union set1 (setTree right)

preorder :: forall a. Ord a => Tree a -> Array a
preorder Leaf = []
preorder (Node l a r) = concat [[a], preorder l,  preorder r]

inorder :: forall a. Ord a => Tree a -> Array a
inorder Leaf = []
inorder (Node l a r) = concat [preorder l, [a], preorder r]

bst :: forall a. Ord a => Tree a -> Boolean
bst tree =
  case tree of
    Leaf -> true
    Node left value right ->
      let lt x = x <= value
          gt x = x >= value
      in all lt (setTree left) && all gt (setTree right) && bst left && bst right


insertElement:: forall a. Ord a => a -> Tree a -> Tree a
insertElement x Leaf = Node Leaf x Leaf
insertElement x (Node l a r) 
  | x < a = Node (insertElement x l) a r
  | otherwise = Node l a (insertElement x r)


buildBST :: forall a. Ord a => List a -> Tree a
buildBST Nil = Leaf
buildBST (Cons x xs) = insertElement x (buildBST xs)


