-- Remove the K'th element from a list.

removeAt :: Int -> [a] -> (a,[a])
removeAt = helper []
         where 
            helper xs 1 (y:ys) = (y,xs ++ ys)
            helper xs i (y:ys) = helper (xs ++ [y]) (i-1) (ys)