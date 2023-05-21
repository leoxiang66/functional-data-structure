module Main where

import Prelude
import Effect (Effect)
import Effect.Console (logShow)
import Set (Set, empty)
import Tree(Tree(..),bst)

main :: Effect Unit
main = do
  let tr = Node Leaf 5 (Node Leaf 3 Leaf)
  logShow (bst tr)

  let tr = Node Leaf 5 (Node Leaf 3 Leaf)
  logShow (bst tr)