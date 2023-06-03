module Algos.Sort
  ( sel_sort
  )
  where

import Prelude

import Data.List (List(..),(:))
import Data.Tuple (Tuple(..))


findMin :: forall a. Ord a => Partial => List a -> Tuple a (List a)
findMin (x : Nil) = Tuple x Nil
findMin (x : xs) =  let Tuple y ys = findMin xs 
    in if x < y then Tuple x xs else Tuple y (x : ys)


sel_sort :: forall a. Ord a =>Partial => List a -> List a 
sel_sort Nil = Nil
sel_sort xs = let Tuple m ms = findMin xs in (m : (sel_sort ms)) 

