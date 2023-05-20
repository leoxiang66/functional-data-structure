module Base where

data Number 
  = Int Int 
  | Float Float 

data Option a 
  = None 
  | Some a

data Result a b
  = Ok a 
  | Error b
