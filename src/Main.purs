module Main where

import Data.List
import Prelude

import Algos.Search (linearSearch)
import Algos.Sort (insort, quicksort, sel_sort)
import Data.Array (toUnfoldable)
import Effect (Effect)
import Effect.Console (logShow)
import Fdatatype.Tree (Tree(..), bst, buildBST, preorder, setTree)
import Fdatatype.Tree (inorder)
import Partial.Unsafe (unsafePartial)


main :: Effect Unit
main = do
  -- let tr = Node Leaf 5 (Node Leaf 3 Leaf)
  -- logShow (bst tr)

  -- let tr = Node Leaf 5 (Node Leaf 3 Leaf)
  -- logShow (bst tr)

  -- let tr = (Node (Leaf 3) (Leaf 5)) :: LTree Int
  -- logShow(inorder tr)

  -- let niubi = buildBST myList
  -- logShow(myList)
  -- logShow(bst niubi)
  -- logShow(preorder niubi)
  -- logShow(inorder niubi)

  let arr = fromFoldable [12, 25, 8, 10, 32]
  let x = 8
  let result = linearSearch arr x
  logShow(result)
  logShow (unsafePartial (sel_sort arr))
  logShow (insort arr)
  logShow (quicksort arr)