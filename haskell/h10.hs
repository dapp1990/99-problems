-- Run-length encoding of a list. Use the result of problem P09 to implement 
-- the so-called run-length encoding data compression method. Consecutive 
-- duplicates of elements are encoded as lists (N E) where N is the number of 
-- duplicates of the element E.
import H09

encode :: (Eq a) => [a] -> [(Int,a)]
encode as = [(length xs, head xs)| xs <- pack as]