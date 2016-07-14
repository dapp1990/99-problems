-- Modified run-length encoding.
{-
Modify the result of problem 10 in such a way that if an element has no 
duplicates it is simply copied into the result list. Only elements with 
duplicates are transferred as (N E) lists.
-}
module H11 where

import H10

data Encode a = Multiple Int a | Single a 
     deriving Show

encodeModified :: (Eq a) => [a] -> [Encode a]
encodeModified = map convertData . encode
                where
                    convertData (1, a) = Single a
                    convertData (i, a) = Multiple i a