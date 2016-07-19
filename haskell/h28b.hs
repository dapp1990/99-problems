-- Sorting a list of lists according to length of sublists
{-
Again, we suppose that a list contains elements that are lists themselves. But 
this time the objective is to sort the elements of this list according to their 
length frequency; i.e., in the default, where sorting is done ascendingly, lists 
with rare lengths are placed first, others with a more frequent length come later.
-}

lfsort :: [[a]] -> [[a]]
lfsort xs = mersh_sort (frequency xs) [[x]| x<-xs]

frequency :: [[a]] -> [(Int,Int)]
frequency = helper []
            where
               helper r [] = r
               helper r (x:xs) = helper (insert r (length x)) xs

insert :: (Eq a) => [(a,Int)] -> a -> [(a,Int)]
insert [] k = [(k,1)]
insert ((k,v):xs) i | k == i =  ((k,v+1):xs)
                    | otherwise = (k,v) : insert xs i

lookup' :: (Eq a) => [(a,Int)] -> a ->  Int
lookup' [] _ = 0
lookup' ((k,v):xs) i | k == i =  v
                    | otherwise = lookup' xs i

mersh_sort :: [(Int,Int)] -> [[[a]]] -> [[a]]
mersh_sort fs [x] = x
mersh_sort fs (x:xs)= mersh_sort fs $ tail xs ++ [helper fs x (head xs)]
                     where
                        helper _ [] r = r
                        helper _ r [] = r
                        helper fs (a:as) (b:bs) | lookup' fs (length a) < lookup' fs (length b) = a : (helper fs as (b:bs))
                                                | otherwise = b : (helper fs (a:as) bs)