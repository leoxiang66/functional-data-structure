module Fdatatype.LTree where

import Prelude


data LTree a = Leaf a | Node (LTree a) (LTree a)

inorder:: forall a. LTree a -> Array a
inorder (Leaf x) = [x]
inorder (Node l r) = inorder l <> inorder r 