-- Eliminate consecutive duplicates of list elements.
{-
If a list contains repeated elements they should be replaced with a single 
copy of the element. The order of the elements should not be changed.
-}
compress :: (Eq a) => [a] -> [a]
compress (a:as) = helper [a] as

helper :: (Eq a) => [a] -> [a] -> [a]
helper acc [] = reverse acc
helper acc (x:xs) | x == head acc = helper acc xs
                  | otherwise = helper (x:acc) xs