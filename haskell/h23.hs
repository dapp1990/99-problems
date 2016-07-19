-- Extract a given number of randomly selected elements from a list.
-- xs !!
import System.Random

rnd_select :: (Show a) => [a] -> Int -> IO ()
rnd_select xs 0 = return ()
rnd_select xs i = do
                    r <- randomRIO(0, (length xs)-1)
                    putStrLn . show $ xs !! r 
                    rnd_select ((take (r-1) xs) ++ (drop (r+1) xs)) (i-1)