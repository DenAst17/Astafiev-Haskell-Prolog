import Data.List

filterDuplicates :: Eq a => [a] -> [a]
filterDuplicates xs = [x | x <- nub xs, length (elemIndices x xs) == 2]

removeNotInList :: Eq a => [a] -> [a] -> [a]
removeNotInList list1 list2 = list1 `intersect` list2

main :: IO ()
main = do
  putStrLn "Введіть список цілих чисел через пpобіл:"
  input <- getLine
  let numbers = map read (words input) :: [Int]
      toKeep = filterDuplicates numbers
      result = removeNotInList numbers toKeep
  putStrLn $ "Результат: " ++ unwords (map show result)