import Data.List
import System.IO

sumOfNums = sum [1..1000]
-- sumOfNums est une constante qui prend en valeur la somme des entiers de 1 à 1000 par la fonction SUM qui prend comme parametre une liste d'entiers. Ici la liste est definie par [1..1000] qui est une liste d'entiers de 1 à 1000.

sumOfNums2 = sum [1,2,3,4,5] 
-- De maniere generale, une liste s esxprimera toujours avec des valeurs entre crochets et separées par des virgules.

sumOfNums3 = sum (1:2:3:4:5:[])
-- Ici on a exprimé la liste de la somme des entiers de 1 à 5 de maniere differente.
-- On a utilisé le symbole ":" qui permet de concatener des elements à une liste.
-- On a donc concaténé 1 à la liste [2,3,4,5] puis 2 à la liste [3,4,5] etc... jusqu'à obtenir la liste [1,2,3,4,5].
-- On a ensuite appliqué la fonction SUM à cette liste.

addEx = 5 + 4 :: Int
subEx = 5 - 4 :: Int
multEx = 5 * 4 :: Int
divEx = 5 / 4 :: Double

addEx2 = 5 + 4.0 :: Double --it is possible to add an integer and a float but the result will be a float. The cast is automatic

modEx = mod 5 4
-- mod is a prefix parameter function. It takes two parameters and returns the remainder of the division of the first parameter by the second one.
modEx2 = 5 `mod` 4
-- The backticks allow us to use a prefix parameter function as an infix parameter function.

negNumEx = 5 + (-4)


num9 = 9 :: Int
sqrtOf9 = sqrt (fromIntegral num9)
sqrt9 = 9 ** 0.5 -- ** is the power operator, so to avoid using fromIntegral we can use the power operator to get the square root of a number.
-- the ** operator will automatically cast the result to a float


-- Built in maths functions
piVal = pi
ePow9 = exp 9
logOf9 = log 9
squared9 = 9 ** 2
truncateVal = truncate 9.999
roundVal = round 9.999
ceilingVal = ceiling 9.999
floorVal = floor 9.999
sinVal = sin 9
cosVal = cos 9
tanVal = tan 9
asinVal = asin 0.5
atanVal = atan 0.5
atan2Val = atan2 9 2
sinhVal = sinh 9
tanhVal = tanh 9
coshVal = cosh 9
asinhVal = asinh 9
acoshVal = acosh 9
atanhVal = atanh 0.5

trueAndFalse = True && False
trueOrFalse = True || False
notTrue = not(True)

primeNumbers = [3,5,7,11]
morePrimes = primeNumbers ++ [13,17,19,23,29] -- ++ is the concatenation operator
evenMorePrimes = 2 : morePrimes -- : is the concatenation operator but it adds an element at the beginning of the list
testPrimes = primeNumbers ++ 2 : morePrimes -- we can use the concatenation operator to add an element in the middle of a list

favNums = 2 : 7 : 21 : 66 : [] -- we can also use the concatenation operator to create a list
--dont forget it is recursive, meaning that it is operated this way : 
-- 2 : (7 : (21 : (66 : []))) ==> 2:7:21:[66] ==> 2:7:[21,66] ==> 2:[7,21,66] ==> [2,7,21,66]
--the : operator is placing the first parameter at the begining of the list and the second parameter is the list itself so
-- a:[b] is [a,b] 

list1 = [1,2,3]
list2 = [4,5,6]
list3 = list1 ++ list2
-- list4 = list1 : list2 ==> this is not a valid operation because the : operator is used to add an element at the beginning of a list and not to concatenate two lists
-- list5 = 5 ++ [1,2,3] ==> this is not a valid operation because the ++ operator is used to concatenate two lists and not to add an element at the beginning of a list


-- appel composé
myPrime = [3,5,7,11]
plusDePrimes = myPrime ++ [13,17,19,23,29] --this calls myPrime      (up)
encorePlusDePrimes = 2 : plusDePrimes --this calls plusDePrimes      (up)
lenPrime = length encorePlusDePrimes --this calls encorePlusDePrimes (up) ==> fonction longueur de la liste

revMyPrime = reverse myPrime -- reverse is a function that takes a list as a parameter and returns the reverse of this list

isListEmpty = null myPrime -- null is a function that takes a list as a parameter and returns True if the list is empty and False if it is not
isEmpty2 = null [] -- this will return True
-- isEmptyTest = null 5 -- this will return an error because 5 is not a list

secondPrime = encorePlusDePrimes !! 0 -- !! est l operateur d index qui permet de recuperer un element d une liste en fonction de son index, donc ici en fait ca sera encorePlusDePrimes[0] en C
-- attention les index commencent à 0!  

firstPrime = head encorePlusDePrimes -- head is a function that takes a list as a parameter and returns the first element of this list
lastPrime = last encorePlusDePrimes -- last is a function that takes a list as a parameter and returns the last element of this list

primeInit = init encorePlusDePrimes -- init is a function that takes a list as a parameter and returns the list without the last element

listChecker = encorePlusDePrimes == [2,3,5,7,11,13,17,19,23] ++ [last encorePlusDePrimes] -- this will return True because encorePlusDePrimes is equal to [2,3,5,7,11,13,17,19,23] ++ [last encorePlusDePrimes]

first3Primes = take 3 encorePlusDePrimes -- take is a function that takes a list and an integer as parameters and returns a list with the first n elements of the list where n is the integer given as a parameter

removedPrimes = drop 3 encorePlusDePrimes -- drop is a function that takes a list and an integer as parameters and returns a list without the first n elements of the list where n is the integer given as a parameter

is7InList = 7 `elem` encorePlusDePrimes -- elem is a function that takes an element and a list as parameters and returns True if the element is in the list and False if it is not
is7InList2 = elem 7 encorePlusDePrimes -- elem is a function that takes an element and a list as parameters and returns True if the element is in the list and False if it is not

maxPrime = maximum encorePlusDePrimes -- maximum is a function that takes a list as a parameter and returns the maximum value of this list
minPrime = minimum encorePlusDePrimes -- minimum is a function that takes a list as a parameter and returns the minimum value of this list

multiList = [[1,2,3],[4,5,6]] -- this is a list of lists

prodList = [2,5,6]
prodList2 = product prodList -- product is a function that takes a list as a parameter and returns the product of all the elements of this list

listDePairs = [2,4..20] -- this is a list of pairs from 2 to 20. Ici on commence par indiquer le pas (4-2=2) puis on indique la borne superieure (20)
listDImpairs=[1,3..20] -- pour ma liste d impairs, si je finis par un pair, il s arrete a l impair precedent

letterList = ['A','C'..'Z'] -- this is a list of letters from A to Z. Ici on commence par indiquer le pas (C-A=2) puis on indique la borne superieure (Z)

infinPow10 = [10,20..] -- this is a list of powers of 10. Ici on commence par indiquer le pas (20-10=10) puis on indique la borne superieure (infini)

many2s = take 10 (repeat 2) -- repeat is a function that takes an element as a parameter and returns a list with this element repeated an infinite number of times. Here we used the take function to get the first 10 elements of this list
--the output will be [2,2,2,2,2,2,2,2,2,2]

many3s = replicate 10 3 -- replicate is a function that takes an integer and an element as parameters and returns a list with this element repeated the number of times indicated by the integer given as a parameter

cycleList = take 10 (cycle [1,2,3,4,5]) -- cycle is a function that takes a list as a parameter and returns a list with the elements of the list given as a parameter repeated an infinite number of times. Here we used the take function to get the first 10 elements of this list

listTimes2 = [x * 2 | x <- [1..10], x*2<16]
-- ici on a pris pour chaque x dans la liste [1..10] la valeur x*2 et stockée la valeur dans une liste avec a chaque fois la verification de la condition x*2<16
--donc ici listTimes2 sera une liste qui contient les valeurs de la table de 2 inférieures à 16

divisBy9N13 = [x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0] -- on veut que chaque x dans [1..500] soit divisible par 13 et par 9. donc on a juste rajouté une condition

sortedList = sort [9,1,8,3,4,7,6] -- sort is a function that takes a list as a parameter and returns the sorted version of this list

sumOfLists = zipWith (+) [1,2,3,4,5] [6,7,8,9,10] -- zipWith is a function that takes a function and two lists as parameters and returns a list with the result of the function applied to the elements of the two lists given as parameters. Here we used the + function as a parameter of zipWith to get the sum of the elements of the two lists given as parameters
-- the output will be [7,9,11,13,15]

listBiggerThan5 = filter (>5) morePrimes -- filter is a function that takes a function and a list as parameters and returns a list with the elements of the list given as a parameter that satisfy the condition of the function given as a parameter. Here we used the > function as a parameter of filter to get the elements of morePrimes that are bigger than 5
-- the output will be [7,11,13,17,19,23,29]

evensUpTo20 = takeWhile (<=20) [2,4..] -- takeWhile is a function that takes a function and a list as parameters and returns a list with the elements of the list given as a parameter that satisfy the condition of the function given as a parameter. Here we used the <= function as a parameter of takeWhile to get the elements of [2,4..] that are smaller or equal to 20

multOfList = foldl (*) 1 [2,3,4,5] -- foldl is a function that takes a function, an element and a list as parameters and returns the result of the function applied to the element and the first element of the list, then the result of the function applied to the result of the previous operation and the second element of the list, etc... Here we used the * function as a parameter of foldl to get the product of the elements of the list given as a parameter
-- ici ca nous donne la factorielle de 5

pow3List = [3^n | n <- [1..10]] -- ici on a pris pour chaque n dans la liste [1..10] la valeur 3^n et stockée la valeur dans une liste
pow3List2 = [3^n | n <- [1..10], 3^n <730 ]  -- ici on a pris pour chaque n dans la liste [1..10] la valeur 3^n et stockée la valeur dans une liste avec a chaque fois la verification de la condition 3^n<730

myVariousList=[1,2.5,3,5,7,8,9.7,10]
myIntegersList = [x | x<-myVariousList, fromIntegral (round x) - x == 0] 


times4 :: Int -> Int -- ici on a defini une fonction ! le :: permet de definir le type de la fonction et le -> donne le type du retour de la fonction
times4 x = x * 4 -- ici on a defini la fonction times4 qui prend un entier en parametre et retourne cet entier multiplié par 4

listTimes4 = map times4 [1,2,3,4,5] -- sans le map il y a une erreur de type ; en effet Int et [Int] ne sont pas du meme type

multBy4 :: [Int] -> [Int]
multBy4 [] = [] -- ici on a defini une fonction qui prend une liste d entiers en parametre et retourne une liste d entiers
multBy4 (x:xs) = times4 x : multBy4 xs -- ici dans (x:xs) le x est la tete de la liste et xs le reste

areStringsEq :: [Char] -> [Char] -> Bool -- ici on a defini une fonction qui prend deux listes de caracteres en parametre et retourne un booleen
areStringsEq [] [] = True -- ici on a defini le cas de base de la fonction
areStringsEq (x:xs) (y:ys) = x == y && areStringsEq xs ys -- ici on a defini la fonction recursive
areStringsEq _ _ = False -- ici on a defini le cas par defaut de la fonction

doMult :: (Int -> Int) -> Int -- ici on a defini une fonction qui prend une fonction en parametre et retourne un entier
doMult func = func 3 -- ici on a defini la fonction doMult qui prend une fonction en parametre et retourne le resultat de l application de cette fonction au parametre 3
num3Times4 = doMult times4 -- ici on a appliqué la fonction doMult à la fonction times4

getAddFunc :: Int -> (Int -> Int) -- ici on a defini une fonction qui prend un entier en parametre et retourne une fonction qui prend un entier en parametre et retourne un entier
getAddFunc x y = x + y -- ici on a defini la fonction getAddFunc qui prend un entier en parametre et retourne une fonction qui prend un entier en parametre et retourne la somme de ces deux entiers
adds3 = getAddFunc 3 -- ici on a appliqué la fonction getAddFunc à l entier 3
fourPlus3 = adds3 4 -- ici on a appliqué la fonction adds3 à l entier 4 (on recompose tout le chemin vers le haut)

threePlusList = map adds3 [1,2,3,4,5] -- ici on a appliqué la fonction adds3 à chaque element de la liste [1,2,3,4,5]

dbl1To10 = map (\x -> x * 2) [1..10] -- ici on a appliqué la fonction (\x -> x * 2) à chaque element de la liste [1..10]


--REPRENDRE A 54 MIN DE LA VIDEO, SUR LES LAMBDAS FONCTIONS
