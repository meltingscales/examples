-- https://learnyouahaskell.com/starting-out

-- run ghci
-- run :l baby
-- then run whatever vars/functions are defined

-- succ (succ 5) 
-- 7

-- min 9 10 
-- 9

-- min (min 1 2) (min 3 4)
-- 1

-- max 100 200
-- 200

doubleMe x = x + x
-- (defines a function)

doubleUs x y = doubleMe x + doubleMe y


doubleSmallNumber x = (if x > 100
                        then x
                        else x*2) + 1


lostNumbers = [3, 50, 14, 22]

moreNumbers = [1, 2, 3, 4]

-- show ( [1,2,3] ++ [4,5,6] )
-- "[1,2,3,4,5,6]"

-- ['w','o'] ++ ['o','t']
-- "woot"

-- notice how the quotes are different. This `:` is the `cons` operator, just like in Lisp.
smallCat = 'A' : " SMALL CAT"

