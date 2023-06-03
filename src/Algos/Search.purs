module Algos.Search
  ( linearSearch
  )
  where

import Prelude
import Data.List (List(..), (:))


-- | Recursive linear search.
linearSearchRec :: forall a. Eq a => List a -> a -> Int -> Int
linearSearchRec Nil _ _ = -1
linearSearchRec (x : xs) val n 
  | x == val  = n
  | otherwise = linearSearchRec xs val (n + 1)

-- | linearSearch function uses linearSearchRec with initial index as 0.
linearSearch :: forall a. Eq a => List a -> a ->  Int
linearSearch xs val = linearSearchRec xs val 0
