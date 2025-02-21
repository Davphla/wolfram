module Lib
    (display, defaultOptions
    ) where
import Data.Bits ( Bits((.&.), shiftR) )
import Control.Monad ()
import Option (Options (Options,
    rule, move, window, nbLines, start), defaultOptions)
import GHC.IO.Exception ( ExitCode(ExitFailure) )
import System.Exit ( exitWith )


data Cell = Dead | Alive deriving (Enum)

instance Show Cell where
    show Dead = " "
    show Alive = "*"


getState :: Int -> Int-> Int
getState state rule = shiftR rule state .&. 1

calculSide :: [Int] -> Bool -> Int -> [Int]
calculSide (x:y:z:s) True rule =
    getState (x * 4 + y * 2 + z) rule : calculSide (y:z:s) True rule
calculSide (z:y:x:s) False rule =
    getState (x * 4 + y * 2 + z) rule : calculSide (y:x:s) False rule
calculSide _ _ _ = []

loop :: [Int] -> [Int] -> Int -> Int -> [[Char]]
loop (l:ls) (r:rs) size rule = ((\x -> if x == 0 then ' ' else '*') <$>
    (reverse (take (size `div` 2 + 1) (l:ls)) ++
    take (size `div` 2 - 1 + size `mod` 2) (r:rs))) :
    loop(calculSide (r:l:ls) False rule)
    (calculSide (l:r:rs)True rule) size rule
loop _ _ _ _ = []


display :: Options -> IO ()
display Options {rule = -1} = exitWith (ExitFailure 84)
display Options {
    rule = rule,
    move = move,
    window = window,
    nbLines = nbLines,
    start = start
} = mapM_ putStrLn $take nbLines $drop start (loop
    (1 : repeat 0) (repeat 0) window rule)
