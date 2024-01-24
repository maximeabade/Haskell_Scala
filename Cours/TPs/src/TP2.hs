module TP2 where


f1 = (+)
-- f1 x y = x + y

f2 f = f (f 0)

f3 x y z = x + y + z

f4 x f = f (f (x + 0) )

f4 x f = x + f (f 0)

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
  | n         <  0 = 1 / fastPow (-n) x
  | n         == 0 = 1 
  | n `mod` 2 == 0 = let halfPow = fastPow (n `div` 2) x in halfPow * halfPow 
  | otherwise      = x * (fastPow (n-1) x)
  
-- Exercice 4.a
-- on veut ecrire la fonction recursive terminale fixed :: (a->a) ->a -> Int -> a 

fixed :: (a -> a) -> a -> Int -> a
fixed next initial times | times <= 0 = initial
fixed next initial times              = fixed next (next initial) (times - 1)



-- Exercice 4.b
whilst :: (a->a) -> a -> (a->Bool) -> a
whilst f x p = if p x then whilst f (f x) p else x



  
  

