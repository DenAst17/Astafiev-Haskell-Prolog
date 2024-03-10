divideByFour :: [Int] -> ([Int], [Int], [Int], [Int])
divideByFour [] = ([], [], [], [])
divideByFour (x:xs)
    | x `mod` 4 == 0 = (x : a, b, c, d)
    | x `mod` 4 == 1 = (a, x : b, c, d)
    | x `mod` 4 == 2 = (a, b, x : c, d)
    | otherwise      = (a, b, c, x : d)
  where
    (a, b, c, d) = divideByFour xs

main :: IO ()
main = do
  putStrLn "Введіть список цілих чисел через пpобіл:"
  input <- getLine
  let numbers = map read (words input) :: [Int]
      result = divideByFour numbers
  putStrLn $ "Список 1: " ++ show (fst4 result)
  putStrLn $ "Список 2: " ++ show (snd4 result)
  putStrLn $ "Список 3: " ++ show (thrd4 result)
  putStrLn $ "Список 4: " ++ show (frth4 result)

fst4 :: (a, b, c, d) -> a
fst4 (x, _, _, _) = x

snd4 :: (a, b, c, d) -> b
snd4 (_, x, _, _) = x

thrd4 :: (a, b, c, d) -> c
thrd4 (_, _, x, _) = x

frth4 :: (a, b, c, d) -> d
frth4 (_, _, _, x) = x