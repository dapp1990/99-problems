-- Extract a slice from a list.
{-
Given two indices, i and k, the slice is the list containing the elements
between the i'th and k'th element of the original list (both limits
included). Start counting the elements with 1.
-}
module H18 where

slice :: [a] -> Int -> Int -> [a]
slice = helper [] 1
        where
            helper r i (x:xs) mi ma | i > ma = r
                                    | i >= mi && i <= ma = helper (r++[x]) (i+1) xs mi ma
                                    | otherwise = helper r (i+1) xs mi ma