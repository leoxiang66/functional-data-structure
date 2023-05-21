module Main where

import Prelude
import Effect.Console (log)
import Set as Set

main = do
  let set1 = Set.make [1, 2, 3, 4]
      set2 = Set.make [3, 4, 5, 6]
      unionSet = Set.union set1 set2
  log $ "Union of set1 and set2: " <> show unionSet
