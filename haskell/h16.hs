-- Drop every N'th element from a list.
module H16 where

dropEvery :: [a] -> Int -> [a]
dropEvery = helper 1
            where
                helper _ [] _ = []
                helper c (x:xs) i | c == i = helper 1 xs i
                                  | otherwise = x:helper (c+1) xs i