-- Replicate the elements of a list a given number of times.
module H15 where

repli :: [a] -> Int -> [a]
repli ys i = foldr (\x xs -> myRepeat x i ++ xs) [] ys
            where
                myRepeat _ 0 = []
                myRepeat a n = a : (myRepeat a $ n-1)