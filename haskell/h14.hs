-- Duplicate the elements of a list.
module H14 where

dupli :: [a] -> [a]
dupli = foldr (\x y -> x:x:y) [] 