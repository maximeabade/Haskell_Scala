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