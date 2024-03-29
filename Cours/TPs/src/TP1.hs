module TP1 where


{- ING2 GSI - Programmation fonctionnelle 
   TD 1 : Éléments de base du langage Haskell
-}

-- Exercice 1.a

triangleArea :: Double -> Double -> Double -> Double
triangleArea a b c =
  let p = 0.5 * (a + b + c) in
    sqrt (p * (p - a) * (p - b) * (p - c)) 


-- Exercice 1.b

isLeap :: Int -> Bool
isLeap y = ((y `mod` 4 == 0) && (y `mod` 100 /= 0)) || (y `mod` 400 == 0)
-- aussi ecrivable mod y 4     

-- Exercice 2.a

-- tuple (Int, Int, Int) 
type Date = (Int, Int, Int)



-- Exercice 2.b.i

ageXMas2023_noPM :: Date -> Int
ageXMas2023_noPM (y, m, d) = 
  if (m, d) <= (12, 25) then age else age - 1
	  where age = 2023 - y
-- let age = 2023 - y in
--   if m == 12 && d <= 25 then age else age - 1

-- Exercice 2.b.ii
ageXMas2023 :: Date -> Int
ageXMas2023 date = case date of
  (y, 12, d) | d > 25 -> 2023 - y - 1
  (y, _ , _)          -> 2023 - y

{-  EVITER LES IF
isLeap :: Int -> Bool
isLeap year
    | (year `mod` 400 == 0) = True  -- multiple de 400
    | (year `mod` 100 == 0) = False -- multiple de 100 mais pas de 400
    | (year `mod`   4 == 0) = True  -- multiple de 4 mais ni de 400 ni de 100
    | otherwise             = False -- ni multiple de 4, de 400 ou de 100
  
-}



-- On veut creer un tableau de taille 10 * 10 qui contient des 1, des 0 et des  2 . Les 2 sont sur la diagonale principale. Affiche ce tableau grace a une fonction haskell
createMatrix :: [[Int]]
createMatrix = [[if i == j then 2 else if i + j == 9 then 0 else 1 | j <- [0..9]] | i <- [0..9]]

printMatrix :: [[Int]] -> IO ()
printMatrix matrix = mapM_ (\row -> putStrLn (unwords (map show row)) >> putStrLn "") matrix

main :: IO ()
main = printMatrix createMatrix
-- Exercice 3.a

-- On veut creer un tableau de taille 10 * 10 qui contient des 1, des 0 et des  2 . Les 2 sont sur la diagonale principale.
-- Exercice 3.a
