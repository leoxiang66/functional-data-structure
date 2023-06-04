module Algos.Sort
  ( insort
  , sel_sort
  )
  where

import Prelude

import Data.List (List(..), (:))
import Data.Tuple (Tuple(..))



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

