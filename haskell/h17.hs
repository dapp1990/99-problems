-- Split a list into two parts; the length of the first part is given.
{-
Do not use any predefined predicates.
-}
module H17 where

split :: [a] -> Int -> ([a],[a])
split = helper []
       where
            helper xs [] _ = (xs, [])
            helper xs ys 0 = (xs, ys)
            helper xs (y:ys) i = helper (xs ++ [y]) ys (i-1)