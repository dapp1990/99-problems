-- Decode a run-length encoded list.
module H12 where

import H11

decodeModified :: [Encode a] -> [a]
decodeModified [] = []
decodeModified ((Multiple n a):as) = myRepeat n a ++ decodeModified as
                                    where
                                        myRepeat 0 _ = []
                                        myRepeat n a = a : myRepeat (n-1) a
decodeModified ((Single a):as) = a : decodeModified as