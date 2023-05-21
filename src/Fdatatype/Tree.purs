module Fdatatype.Tree
  ( Tree(..)
  , bst
  , setTree
  )
  where

import Prelude
import Fdatatype.Set (Set, empty, insert, union,all)

data Tree a
  = Leaf 
  | Node (Tree a) a (Tree a)

-- listTree :: forall a. Tree a -> List a
-- listTree tree = 
--   case tree of
--     Leaf -> Nil
--     Node left value right ->
--       let leftList = listTree left
--           rightList = listTree right
--       in concat List(leftList, singleton value, rightList)

setTree :: forall a. Ord a => Tree a -> Set a
setTree tree = 
  case tree of
    Leaf -> empty :: Set a
    Node left value right ->
      let set1 = insert (setTree left) value
      in union set1 (setTree right)

bst :: forall a. Ord a => Tree a -> Boolean
bst tree =
  case tree of
    Leaf -> true
    Node left value right ->
      let lt x = x <= value
          gt x = x >= value
      in all lt (setTree left) && all gt (setTree right) && bst left && bst right

