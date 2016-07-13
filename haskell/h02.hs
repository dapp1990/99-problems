-- Find the last but one element of a list.
penultimate :: [a] -> a
penultimate [a,_] = a
penultimate (_:as) = penultimate as