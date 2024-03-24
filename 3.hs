import Data.Set (Set)
import qualified Data.Set as Set
import Data.Map (Map)
import qualified Data.Map as Map

type State = Int
type Alphabet = Char
type Transition = (State, Alphabet)

data Automaton = Automaton {
    alphabet :: Set Alphabet,
    states :: Set State,
    initialState :: State,
    finalStates :: Set State,
    transitions :: Map Transition State
} deriving (Show)

reachableStates :: Automaton -> Set State
reachableStates automaton = reachableFrom (initialState automaton) where
    reachableFrom state = foldr go (Set.singleton state) (Map.elems connectedStates) where
        connectedStates = Map.filterWithKey (\(s, _) _ -> s == state) (transitions automaton)
        go s acc
            | s `Set.member` acc = acc
            | otherwise = s `Set.insert` (reachableFrom s `Set.union` acc)
            
unreachableStates :: Automaton -> Set State
unreachableStates automaton = states automaton `Set.difference` reachableStates automaton

readTransitions :: Int -> Map.Map (Int, Char) Int -> IO (Map.Map (Int, Char) Int)
readTransitions 0 acc = return acc
readTransitions n acc = do
    transition <- getLine
    let [state1, symbol, state2] = words transition
    let newState1 = read state1 :: Int
    let newSymbol = head symbol
    let newState2 = read state2 :: Int
    let newAcc = Map.insert (newState1, newSymbol) newState2 acc
    readTransitions (n-1) newAcc

main :: IO ()
main = do
    input1 <- getLine
    let list1 = map read (words input1) :: [Char]
    let alphabet = Set.fromList list1
    
    input2 <- getLine
    let list2 = map read (words input2) :: [Int]
    let states = Set.fromList list2
    
    input3 <- getLine
    let initialState = (read input3 :: Int)
    
    input4 <- getLine
    let list4 = map read (words input4) :: [Int]
    let finalStates = Set.fromList list4
    
    input5 <- getLine
    let transitionsNumber = (read input5 :: Int)
    transitions <- readTransitions transitionsNumber Map.empty
    
    let automaton = Automaton alphabet states initialState finalStates transitions
    
    let result = Set.toList $ reachableStates automaton
    let result2 = Set.toList $ unreachableStates automaton
    putStrLn "Досяжні стани:"
    print $ result
    putStrLn "Недосяжні стани:"
    print $ result2
