-- Pack consecutive duplicates of list elements into sublists. If a list 
-- contains repeated elements they should be placed in separate sublists.
module H09 where

pack :: (Eq a) => [a] -> [[a]]
pack (a:as) = helper [[a]] as

helper :: (Eq a) => [[a]] -> [a] -> [[a]]
helper xss [] = reverse xss
helper (xs:xss) (a:as) | a == head xs = helper ((a:xs):xss) as
                       | otherwise = helper ([a]:(xs:xss)) as