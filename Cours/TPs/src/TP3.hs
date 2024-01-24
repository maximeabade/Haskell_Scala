module TP3 where
--exercice 1 : recherche par dichotomie
dichotomy :: Double -> (Double -> Double) -> Double -> Double -> Maybe Double
dichotomy eps f a b
  | (f a) * (f b) > 0 = Nothing
  | (b - a) < eps     = Just m -- ou Just a ou Just b 
  | (f a) * (f m) < 0 = dichotomy eps f a m
  | otherwise         = dichotomy eps f m b
    where m = (a + b) / 2


--exercice 2 : 
--modif de artihExpr pour que ArithExpr soit une instance des classes de type Num Eq et Ord
