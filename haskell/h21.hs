-- Insert an element at a given position into a list.

insertAt :: a -> [a] -> Int -> [a]
insertAt e xs 1 = e:xs
insertAt e (x:xs) i = x:insertAt e xs (i-1)