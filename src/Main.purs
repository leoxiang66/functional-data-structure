module Main where

import Prelude

import Effect (Effect)
import Effect.Console (logShow)
import Fdatatype.LTree (LTree(..), inorder)
-- import Fdatatype.Set (Set, empty)
-- import Fdatatype.Tree (Tree(..), bst)

main :: Effect Unit
main = do
  -- let tr = Node Leaf 5 (Node Leaf 3 Leaf)
  -- logShow (bst tr)

  -- let tr = Node Leaf 5 (Node Leaf 3 Leaf)
  -- logShow (bst tr)

  let tr = (Node (Leaf 3) (Leaf 5)) :: LTree Int
  logShow(inorder tr)
  