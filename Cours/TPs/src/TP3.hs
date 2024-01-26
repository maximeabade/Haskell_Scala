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

  --exo3:
  --isLeapYear en utilisant les retours maybe 
      
  isLeap :: Int -> Maybe Bool
  isLeap year
    | year < 1582    = Nothing
    | year `mod` 400 == 0 = Just True
    | year `mod` 100 == 0 = Just False
    | year `mod`   4 == 0 = Just True
    | otherwise           = Just False

  dayCnt :: Int -> Bool -> Maybe Int
  dayCnt month leap
    | month < 1 || month > 12 = Nothing
    | month == 2              = if leap then Just 29 else Just 28
    | month == 4 || month == 6 || month == 9 || month == 11 = Just 30
    | otherwise               = Just 31
    
    
  dayCount :: Int-> Int -> Maybe Int
  --dayCount year month = (isLeap year) >>= (dayCnt month)
  dayCount year month = (isLeap year) >>= (\leap -> dayCnt month leap)


  
  
  
   