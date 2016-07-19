-- Generate the combinations of K distinct objects chosen from the N 
-- elements of a list

import Debug.Trace
import Data.List

combinations :: (Show a) => Int -> [a] -> [[a]]
combinations a b | trace ("-> combinations " ++ show a ++ " " ++ show b) False = undefined
combinations 0 _  = [[]]
combinations n xs = [ y:ys | y:xs' <- tails xs
                             , ys <- combinations (n-1) xs']

--test = [x:[[]] | x <- [1,2,3,99]]tails

combinations a b | trace ("-> combinations " ++ show a ++ " " ++ show b) False = undefined
combinations 0 _  = [[]]
combinations n xs = [ y:ys | y:xs' <- tails xs
                             , ys <- combinations (n-1) xs']
