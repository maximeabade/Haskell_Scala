module FirstOrderPredicate where

data FirstOrderPredicate = X | T | F 
  | Not FirstOrderPredicate 
  | And FirstOrderPredicate FirstOrderPredicate
  | Or  FirstOrderPredicate FirstOrderPredicate
  deriving Eq -- Exercice 5.b

-- Exercice 5.c
evaluate :: Bool -> FirstOrderPredicate -> Bool
evaluate x X = x
evaluate _ T = True
evaluate _ F = False
evaluate x (Not a) = not (evaluate x a)
evaluate x (And a b) = (evaluate x a) && (evaluate x b)
evaluate x (Or  a b) = (evaluate x a) || (evaluate x b)




