-- Run-length encoding of a list (direct solution).
module H13 where

data Encode a = Multiple Int a | Single a 
     deriving Show

encodeDirect :: (Eq a) => [a] -> [Encode a]
encodeDirect (a:as) = map convertData $ helper [(1,a)] as
            where
                helper r [] = reverse r
                helper ((i,x):xs) (y:ys) | x == y = helper (((i+1),x):xs) ys
                                         | otherwise = helper ((1,y):((i,x):xs)) ys
                convertData (1, a) = Single a
                convertData (i, a) = Multiple i a