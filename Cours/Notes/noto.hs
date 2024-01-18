-- TD n°2 - Fonctions
--
--
x-- Exercice 1.a.i
-- (a -> a) -> a -> a

-- Exercice 1.a.ii
-- Num a => a -> a

-- Exercice 1.a.iii
-- Num a => a

--- Exercice 1.b

f1 = (+)
-- f1 x y = x + y

f2 f = f (f 0)

f3 x y z = x + y + z

f4 x f = f (f (x + 0) )

f4 x f = x + f (f 0)

f5 f x = f (f (x + 0))

f5 = flip f4
-- f5 f x = f4 x f

f6 f = f (f 0 0) (f 0 0)

f6 f = f (f 0 0) 0 -- incomplet

-- Exercice 1.c

g1 x = x
	
g2 x y = True
  where z = if True then x else y
-- g2 = (==) produit la contrainte de classe Eq a =>
  
g3 x y = x

g4 f x = f x

g5 f g x = g (f x)

g6 f g x y = g2 (f x) (g y)
 --
g7 f g x = f x (g x)

-- Exercice 2.a
rateOfChange :: Double -> (Double -> Double) -> Double -> Double
rateOfChange h f x = (f (x + h) - f x) / h

-- Exercice 2.b
derivative :: (Double -> Double) -> Double -> Double
derivative = rateOfChange 1e-12	
-- derivative f x = rateOfChange 1e-12 f x

-- Exercice 3.a
fastPow :: Int -> Double -> Double
fastPow n x
  | n         <  0 = 1 / fastPow (-n) x -- ou : fastPow (-n) (1.0 / x)
  | n         == 0 = 1 
  | n `mod` 2 == 0 = let halfPow = fastPow (n `div` 2) x in halfPow * halfPow 
  | otherwise      = x * (fastPow (n-1) x)
fastPow' n x
  | n  <  0   = fastPow' (-n) (1 / x)
  | n  == 0   = 1  
  | otherwise = halfPow * halfPow * (if n `mod` 2 == 0 then 1 else x)
     where halfPow = fastPow' (n `div` 2) x






