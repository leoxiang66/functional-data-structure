module Fdatatype.MTree
  ( MTree(..)
  , mbst
  , setMTree
  )
  where

import Prelude

import Data.Ord (greaterThan, lessThan)
import Fdatatype.Set (Set, all, belongsto, empty, insert, union)

data MTree a
  = Leaf 
  | Node (MTree a) a a (MTree a) -- l max value r

setMTree :: forall a. Ord a => MTree a -> Set a
setMTree tree =
  case tree of
    Leaf -> empty::Set a
    Node left _ value right ->
      let subset1 = insert (setMTree left) value
          subset2 = setMTree right
      in union subset1 subset2

mbst :: forall a. Ord a => MTree a -> Boolean
mbst tree = 
  case tree of 
    Leaf -> true
    Node l m a r -> (mbst l) && (mbst r) && 
      (all (lessThan a) (setMTree r)) &&
      (all (greaterThan a) (setMTree l)) &&
      (all (greaterThan m) (setMTree (Node Leaf m a r))) &&
      (belongsto m (setMTree (Node Leaf m a r)))




