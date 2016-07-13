-- Flatten a nested list structure.
{-
Transform a list, possibly holding lists as elements into a `flat' list by 
replacing each list with its elements (recursively).
-}
data NestedList a = Elem a | List [NestedList a]

myflatten :: NestedList a -> [a]
myflatten (Elem a) = [a]
myflatten (List []) = []
myflatten (List (a:as)) = (myflatten a) ++ myflatten (List as)