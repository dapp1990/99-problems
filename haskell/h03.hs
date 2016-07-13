-- Find the K'th element of a list. The first element in the list is number 1.
elementAt :: [a] -> Int -> a
elementAt (a:_) 1 = a
elementAt (_:as) n = elementAt as $ n-1