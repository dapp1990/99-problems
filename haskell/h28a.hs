-- Sorting a list of lists according to length of sublists
{-
We suppose that a list contains elements that are lists themselves. The objective
is to sort the elements of this list according to their length. E.g. short lists 
first, longer lists later, or vice versa.
-}

lsort xs = mersh_sort [[x]| x<-xs]

mersh_sort :: [[[a]]] -> [[a]]
mersh_sort [x] = x
mersh_sort (x:xs) = mersh_sort $ tail xs ++ [helper x (head xs)]
                     where
                        helper [] r = r
                        helper r [] = r
                        helper (a:as) (b:bs) | length a <= length b = a : (helper as (b:bs))
                                             | otherwise = b : (helper (a:as) bs)