module ArithExpr(ArithExpr, fromNum, eval) where

data ArithExpr a = Value a
                 | Plus  (ArithExpr a) (ArithExpr a)
                 | Minus (ArithExpr a) (ArithExpr a)
                 | Times (ArithExpr a) (ArithExpr a)
  deriving (Eq, Ord)

fromNum :: a -> ArithExpr a
fromNum = Value

instance Show a => Show (ArithExpr a) where
  show (Value x) = show x
  show (Plus  e1 e2) = "(" ++ show e1 ++ ") + (" ++ show e2 ++ ")"
  show (Minus e1 e2) = "(" ++ show e1 ++ ") - (" ++ show e2 ++ ")"
  show (Times e1 e2) = "(" ++ show e1 ++ ") * (" ++ show e2 ++ ")"

eval :: Num a => ArithExpr a -> a
eval (Value x) = x
eval (Plus  e1 e2) = (eval e1) + (eval e2)
eval (Minus e1 e2) = (eval e1) - (eval e2)
eval (Times e1 e2) = (eval e1) * (eval e2)
                 
instance (Num a, Ord a) => Num (ArithExpr a) where
  (+) = Plus
  (-) = Minus
  (*) = Times
  abs    e
    | (eval e) > 0 =  e
    | otherwise    = -e
  signum e
    | (eval e) > 0 = Value ( 1)
    | (eval e) < 0 = Value (-1)
    | otherwise    = Value   0
  fromInteger = Value . Prelude.fromInteger

-- Exercice 5.d
(<=>) :: FirstOrderPredicate -> FirstOrderPredicate -> Bool
(<=>) p q = (evaluate T p == evaluate T q) && (evaluate F p == evaluate F q)
-- p <=> q = ...
-- Exercice 5.e
simplify :: FirstOrderPredicate -> FirstOrderPredicate
simplify (Not (Not p)) = simplify p
simplify (Not p) = Not (simplify p)
simplify (And T p) = simplify p
simplify (And p T) = simplify p
simplify (And F p) = F
simplify (And p F) = F
simplify (And p q) = And (simplify p) (simplify q)
simplify (Or  F p) = simplify p
simplify (Or  p F) = simplify p
simplify (Or  T p) = T
simplify (Or  p T) = T
simplify (Or  p q) = Or (simplify p) (simplify q)
simplify p = p

simplify p = snd $ simplify' p
simplify' :: FirstOrderPredicate -> (Bool, FirstOrderPredicate)
-- Rajouter les simplifications précédentes
simplify' p@(Not p') = let (sp, p'') = simplify' p in
                      if sp then simplify' p else (False, p)
simplify' p@(And p' q') = let (sp, p'') = simplify' p
                          and (sq, q'') = simplify' q in
                             if (sp || sq) simplify' p else (False, p)
simplify' p@(Or  p' q') = let (sp, p'') = simplify' p
                          and (sq, q'') = simplify' q in
                             if (sp || sq) simplify' p else (False, p)
simplify' p = (False, p)



-- Exercice 1.a
my_all :: (a -> Bool) -> [a] -> Bool
my_all p = not . (any (not . p))
--my_all p l = not (any (not . p) l)
-- Rem: not . p = \x -> not (p x)

-- Exercice 1.b
my_elem :: Eq a => a -> [a] -> Bool
my_elem e = any (== e)
--my_elem e l = any (== e) l

-- Exercice 2.a
uppers :: [Char] -> [Char] -- ou String -> String
uppers = filter isUpper -- import Data.Char
--uppers = filter (\c -> c >= 'A' && c <= 'Z')
--uppers = filter (elem ['A'..'Z'])

-- Exercice 2.b
includes :: Eq a => [a] -> [a] -> Bool
includes l1 = all (`elem` l1)
-- l1 `includes` l2 = all (\x -> x `elem` l1) l2


