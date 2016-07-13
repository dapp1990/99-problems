-- Find the last element of a list.
last' :: [a] -> a
last' [a] = a
last' (_:as) = last' as