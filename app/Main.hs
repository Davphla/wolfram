module Main where

import Lib ( display )
import Option ( Options (Options,
    rule, move, window, nbLines, start), defaultOptions )
import System.Environment ( getArgs )
import System.Exit ( exitSuccess, exitWith, ExitCode(ExitFailure) )
import Data.Maybe ( fromMaybe )
import Text.Read ( readMaybe )
import Control.Monad ()


main :: IO ()
main = getArgs >>= \args -> case parse args $Just defaultOptions of
    Nothing -> usage >> exitWith (ExitFailure 84)
    Just args' -> display args'

readInput :: String -> Int
readInput y = fromMaybe 0 (readMaybe y :: Maybe Int)

parse :: [String] -> Maybe Options -> Maybe Options
parse ("--rule":y:ys) (Just (Options _ start nbLines window move )) =
    parse ys $Just (Options (readInput y) start nbLines window move )
parse ("--move":y:ys) (Just (Options rule start nbLines window _ )) =
    parse ys $Just (Options rule start nbLines window (readInput y) )
parse ("--window":y:ys) (Just (Options rule start nbLines _ move )) =
    parse ys $Just (Options rule start nbLines  (readInput y) move)
parse ("--lines":y:ys) (Just (Options rule start _ window move )) =
    parse ys $Just (Options rule start (readInput y) window move )
parse ("--start":y:ys) (Just (Options rule _ nbLines window move )) =
    parse ys $Just (Options rule (readInput y) nbLines window move )
parse [] options = options
parse _ _ = Nothing

usage :: IO ()
usage = putStrLn"Usage: ./wolfram (--rule)(--move)(--window)(--lines)(--start)"

exit :: IO a
exit = exitSuccess
