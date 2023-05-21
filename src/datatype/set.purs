module Set where

import Prelude
import Data.Array as Array
import Data.Foldable (foldl)


type Set a = Array a

empty :: forall a. Set a
empty = []

insert :: forall a. Eq a =>  Set a -> a  -> Set a
insert set item = 
  if item `Array.elem` set 
    then set 
    else Array.snoc set item

make :: forall a. Eq a => Array a -> Set a
make arr = foldl insert arr empty


contains :: forall a. Eq a => a -> Set a -> Boolean
contains item set = item `Array.elem` set

remove :: forall a. Eq a => a -> Set a -> Set a
remove item set = Array.filter (notEq item) set

union :: forall a. Eq a => Set a -> Set a -> Set a
union set1 set2 = foldl insert set1 set2
