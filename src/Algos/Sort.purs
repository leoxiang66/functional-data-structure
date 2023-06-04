module Algos.Sort
  ( insort
  , quickselect
  , sel_sort
  )
  where

import Prelude

import Data.List (List(..), (:), filter, length)
import Data.Tuple (Tuple(..))
import Data.Maybe (Maybe(..))



-- Selection Sort

findMin :: forall a. Ord a => Partial => List a -> Tuple a (List a)
findMin (x : Nil) = Tuple x Nil
findMin (x : xs) =  let Tuple y ys = findMin xs 
    in if x < y then Tuple x xs else Tuple y (x : ys)


sel_sort :: forall a. Ord a =>Partial => List a -> List a 
sel_sort Nil = Nil
sel_sort xs = let Tuple m ms = findMin xs in (m : (sel_sort ms)) 

-- Insertion Sort

-- insert an element while keeping the list ordered
insert_ :: forall a. Ord a => a -> List a  -> List a 
insert_ x Nil = x:Nil
insert_ x (y:ys) 
  | x <= y = (x:y:ys)
  | otherwise = (y: (insert_ x ys))


insort :: forall a. Ord a => List a -> List a
insort Nil = Nil
insort (x:xs) = insert_ x (insort xs)


-- Quick Select
-- Find the k-smallest number in a given list, without actually sorting the list
quickselect :: forall a. Ord a => List a -> Int -> Maybe a
quickselect Nil _ = Nothing
quickselect (x : xs) k =
  let
    xs1 = filter (_ < x) xs
    xs2 = filter (_ >= x) xs
  in
    if k < length xs1 then quickselect xs1 k
    else if k == length xs1 then Just x
    else quickselect xs2 (k - length xs1 - 1)
