module Base where

data Option a 
  = None 
  | Some a

data Result a b
  = Ok a 
  | Error b
