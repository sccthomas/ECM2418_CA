-- any imports go here
import Data.Char
import Data.List


{-Begin Question 2.1-}
number :: [Int] -> Int
number x 
  = read (map intToDigit x)
{-End Question 2.1-}

{-Begin Question 2.2-}

splits :: [a] -> [([a],[a])]
splits xs
  = [splitAt n xs | n <- [1..((length xs)-1)]]
  
possibles :: [([Int],[Int])]
possibles = permsMerge(splitsAt(permutations [1..9]))

splitsAt :: [[a]] -> [[([a],[a])]]
splitsAt [] = []
splitsAt (x:xs)
    = splits x : splitsAt xs

permsMerge :: [[([a],[a])]] -> [([a],[a])]
permsMerge [] = []
permsMerge (x:xs)
    = x ++ permsMerge xs

{-End Question 2.2-}

{-Begin Question 2.3-}

digits :: Int -> [Int]
digits = map digitToInt . show

isAcceptable :: ([Int],[Int]) -> Bool
isAcceptable (xs,ys)
  |(reversed == mult) && (ends3 == 3) && (starts4 == 4) = True 
  |otherwise = False 
   where
      numXS = number xs
      numYS = number ys 
      mult = numXS * numYS
      reversed = number (reverse (digits mult))
      ends3 = last (digits(smallest numXS numYS))
      starts4 = head (digits mult) 

smallest :: Int -> Int -> Int
smallest x y 
  | x<y = x
  | otherwise = y

acceptables :: [([Int],[Int])]
acceptables = consumer possibles

consumer :: [([Int],[Int])] -> [([Int],[Int])]
consumer = filter isAcceptable

{-End Question 2.3-}

-- any main functions for testing goes here

main = putStrLn(show(acceptables))


