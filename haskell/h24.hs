-- Lotto: Draw N different random numbers from the set 1..M.

import System.Random

diff_select :: Int -> Int -> IO [Int]
diff_select i limit = helper i [1..limit]
                    where
                       helper 0 _ = return []
                       helper i xs = do 
                                      x <- randomRIO(0, (length xs)-1)
                                      rest <- helper (i-1) ((take (x-1) xs) ++ (drop (x+1) xs))
                                      return $ (xs !! x) : rest