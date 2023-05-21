module Fdatatype.MTree
  ( MTree(..)
  , setMTree
  )
  where

import Prelude
import Fdatatype.Set(empty,insert,union,Set)

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