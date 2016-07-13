-- Find the number of elements of a list.
myLength :: [a] -> Int
myLength as = sum [1| _ <-as]