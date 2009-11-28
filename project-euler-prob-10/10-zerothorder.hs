primes :: [Integer]
primes = 2 : filter isPrime [3, 5 ..]
    where
        -- only check divisibility of the numbers less than the square root of n
        isPrime n = all (not . divides n) $ takeWhile (\p -> p*p <= n) primes
        divides n p = n `mod` p == 0
 
result = sum $ takeWhile (< 2000000) primes
 
main = do putStrLn( show result )


