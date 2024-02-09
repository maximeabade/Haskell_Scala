module TD4 where

import Data.Char (isUpper)

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

-- Exercice 3.a
data Document = Document { title :: String, keywords :: [String] }
-- ou : type Document = (String, [String])

-- Exercice 3.b.i
searchByKeyword :: String -> [Document] -> [Document]
searchByKeyword kw = filter (\doc -> kw `elem` (keywords doc))

-- Exercice 3.b.ii
searchByKeywords :: [String] -> [Document] -> [Document]
searchByKeywords kws = filter (\doc -> (keywords doc) `includes` kws)
--searchByKeywords kws = filter (\doc -> all (\w -> w `elem` (keywords doc))) kws

-- Exercice 3.c
relevance :: [String] -> Document -> Int
relevance kws doc = length $ filter (\kw -> kw `elem` (keywords doc)) kws
--relevance kws doc = foldl (\z kw -> if searchByKeyword kw doc then (z + 1) else z) 0 kws

-- Exercice 4.a
my_sum :: [Integer] -> Integer
my_sum = foldl (+) 0
--my_sum l = foldl (\z x -> z + x) 0 l

-- Exercice 4.b
my_max :: Ord a => [a] -> Maybe a
my_max      [] = Nothing
my_max (h : t) = Just (foldl max h t)
--my_max (h:t) = Just (foldl (\m e -> if e > m then e else m) h t)

-- Exercice 4.c
maxIndex :: Ord a => [a] -> Maybe Int
maxIndex [] = Nothing
maxIndex l@(h : t) =


-- Exercice 5.a
data Pupil = Pupil { nom :: String, prenom :: String, notes :: [Double] } -- data Pupil = Pupil String String [Double]
data ReportCard = ReportCard { nomcpt :: String, moyenne :: Double }

-- Exercice 5.b
reports :: [Pupil] -> [ReportCard]
reports = map (\(Pupil n p ns) -> ReportCard (n ++ p) ((foldl (+) 0 ns) / (fromIntegral(length ns))))
--type Pupil = (string, string, [double])
--type ReportCard = (string, string, double)

