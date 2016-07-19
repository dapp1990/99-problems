-- Generate a random permutation of the elements of a list.

import System.Random

rnd_permu :: [a] -> IO [a]
rnd_permu [] = return []
rnd_permu xs = do
                select <- randomRIO(1, length xs)
                rest <- rnd_permu $ (take (select-1) xs) ++ (drop select xs)
                return $ xs !! (select-1) : rest