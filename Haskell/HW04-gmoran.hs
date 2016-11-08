-- a) splitList n xs: splits a list xs in to a tuple of two lists based on the provided index n.
splitList :: Int -> [a] -> ([a], [a])
splitList _ [] = ([], [])
splitList n xs = (take n xs, drop n xs)

-- b) notEmpty xs: checks if the list xs is not empty. Make sure it works on infinite lists

notEmpty :: [a] -> Bool
notEmpty xs = not (null xs)

-- c) longEnough n xs: checks if a list has more than n elements.

longEnough :: Int -> [a] -> Bool
longEnough n xs = not (null (drop n xs))

-- d) palindrome xs: checks if xs forms a palindrome.

palindrome :: String -> Bool
palindrome xs = xs == reverse xs

-- e) palindrome2 xs: same as the function palindrome, but using the functions head and last (plus other functions you might need).

palindrome2 :: (Eq a) => [a] -> Bool
palindrome2 [] = True
palindrome2 [_] = True
palindrome2 xs = (head xs == last xs) && (palindrome2 (init (tail xs)))

-- f) formPalindrome xs: forms the smallest palindrome from the list xs

formPalindrome :: String -> String
formPalindrome xs | palindrome xs = xs
                  | otherwise = xs ++ reverse (init xs)
