module Tree where

import Prelude
import Set

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
    Leaf -> Set.empty
    Node left value right ->
      let set1 = Set.insert value (setTree left)
      in Set.union set1 (setTree right)

-- bst :: forall a. Ord a => Tree a -> Boolean
-- bst tree =
--   case tree of
--     Leaf -> true
--     Node left value right ->
--       let lt x = x <= value
--           gt x = x >= value
--           allSet f set = Set.all f set
--       in allSet lt (setTree left) && allSet gt (setTree right) && bst left && bst right

-- data MTree a
--   = Leaf 
--   | Node (MTree a) a a (MTree a)

-- setMTree :: forall a. Ord a => MTree a -> Set a
-- setMTree tree =
--   case tree of
--     Leaf -> Set.empty
--     Node left _ value right ->
--       let subset1 = Set.insert value (setMTree left)
--           subset2 = setMTree right
--       in Set.union subset1 subset2
