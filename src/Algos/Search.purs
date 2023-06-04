module Algos.Search
  ( binarySearch
  , linearSearch
  )
  where

import Prelude

import Data.List (List(..), (:), (!!), length,take, drop)
import Data.Maybe (fromMaybe)


-- | Recursive linear search.
linearSearchRec :: forall a. Eq a => List a -> a -> Int -> Int
linearSearchRec Nil _ _ = -1
linearSearchRec (x : xs) val n 
  | x == val  = n
  | otherwise = linearSearchRec xs val (n + 1)

-- | linearSearch function uses linearSearchRec with initial index as 0.
linearSearch :: forall a. Eq a => List a -> a ->  Int
linearSearch xs val = linearSearchRec xs val 0


binarySearch :: forall a. Ord a => List a -> a -> Int
binarySearch Nil _ = -1
binarySearch (x:Nil) val
  | x == val = 0
  |otherwise = -1
binarySearch (x:y:Nil) val
  | x == val = 0
  | y == val = 1
  |otherwise = -1
binarySearch (x:xs) val = 
  let mid_id = (length (x:xs) `div` 2) in 
  let mid = fromMaybe (x) ((x:xs) !!  mid_id) in 
    if (val == mid) then mid_id 
    else if (val < mid) then (binarySearch (take mid_id (x:xs)) val) 
    else let tmp = binarySearch (drop (mid_id+1) (x:xs)) val in 
      if tmp == -1 then -1
      else mid_id + 1 + tmp
