splitList :: [a] -> [[a]]
splitList xs = go xs 0
  where
    go [] _ = []
    go xs n = take (2^n) xs : go (drop (2^n) xs) (n+1)

main :: IO ()
main = do
  putStrLn "Введіть список цілих чисел через пpобіл:"
  input <- getLine
  let numbers = map read (words input) :: [Int]
      result = splitList numbers
  putStrLn "Результат: "
  print result