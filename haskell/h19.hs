-- Rotate a list N places to the left.
{-
Hint: Use the predefined functions length and (++).
-}

rotate :: [a] -> Int -> [a]
rotate xs 0 = xs
rotate (x:xs) i | i > 0 = rotate (xs ++ [x]) (i-1)
                | i < 0 = rotate (last (x:xs) : init (x:xs)) (i+1)