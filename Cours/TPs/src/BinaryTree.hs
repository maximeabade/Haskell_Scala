module BinaryTree where
-- Exercice 4.a
data BinaryTree a = Empty | Node (BinaryTree a) a (BinaryTree a)

-- Exercice 4.b
size :: BinaryTree a -> Integer
size Empty = 0
size (Node left _ right) = 1 + size left + size right

height :: BinaryTree a -> Integer
height Empty = 0
height (Node left _ right) = 1 + max (height left) (height right)

elemNode :: Eq a => a -> BinaryTree a -> Bool
elemNode _ Empty = False
elemNode x (Node left y right) = x == y || elemNode x left || elemNode x right

-- Exercice 4.c
fold :: b -> (b -> a -> b -> b) -> BinaryTree a -> b
fold z _   Empty              = z
fold z op (Node left x right) = op (fold z op left) x (fold z op right)


size' :: BinaryTree a -> Int
size' = fold 0 (\lv _ rv -> 1 + lv + rv)
--size' bt = fold 0 (\l _ r -> 1 + l + r) bt

height' :: BinaryTree a -> Int
height' = fold 0 (\lv _ rv -> 1 + max lv rv)
-- height' bt = fold 0 (\lv _ rv -> 1 + max lv rv) bt

elemNode' :: Eq a => a -> BinaryTree a -> Bool
elemNode' x = fold False (\lv y rv -> x == y || lv || rv) 
-- elemNode' x bt = fold False (\lv y rv -> x == y || lv || rv) bt

