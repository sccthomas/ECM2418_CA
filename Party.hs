-- any imports go here
import Data.Char

{-Begin Question 1.1-}
digits :: Int -> [Int]
digits = map digitToInt . show
{-End Question 1.1-}

{-Begin Question 1.2-}
contains :: [Int] -> Int -> Bool
contains [] e
  = False
contains (x:xs) w
  | x == w = True 
  | otherwise = contains xs w 

set :: [Int] -> Bool
set [] 
  = True
set (x:xs)
  | contains xs x = False 
  | otherwise = set xs 

isPar :: Int -> Bool
isPar 0
 = False
isPar x
  |(bs `mod` as == 0) && set d && (contains0==False) = True 
  |otherwise = False
   where 
      d = digits x 
      p = splitAt 2 d
      as = arrayToInt (fst p)
      bs = arrayToInt (snd p)
      contains0 = contains d 0
      
arrayToInt :: [Int] -> Int
arrayToInt x 
  = read (map intToDigit x)

pars :: [Int]
pars = parConsumer parProducer

parProducer :: [Int] 
parProducer = [1111..9999]

parConsumer :: [Int] -> [Int]
parConsumer = filter isPar

{-End Question 1.2-}

{-Begin Question 1.3-}

missingVal :: [Int] -> Int
missingVal xs
  = 45 - sum xs

isParty :: (Int, Int) -> Bool
isParty (xs,ys)
  | isSet && xsPar && ysPar && (xs `mod` missing == 0) && (ys `mod` missing == 0) = True
  | otherwise = False
   where 
   xsDigits = digits xs
   ysDigits = digits ys
   isSet = set (xsDigits ++ ysDigits)
   missing = missingVal (xsDigits ++ ysDigits)
   xsPar = isPar xs
   ysPar = isPar ys

partys :: [(Int, Int)]
partys = partysConsumer partysProducer

partysProducer :: [(Int, Int)]
partysProducer = [(a,b) | a <- pars, b <- pars]
 
partysConsumer :: [(Int, Int)] -> [(Int, Int)]
partysConsumer = filter isParty

{-End Question 1.3-}

-- any main functions for testing goes here
main = putStrLn (show(partys))
