module Option
    (Options(Options, rule, move, window, nbLines, start), defaultOptions)
    where

data Options = Options {
    rule :: Int,
    start :: Int,
    nbLines :: Int,
    window :: Int,
    move :: Int
}

defaultOptions :: Options
defaultOptions = Options {
    rule = -1,
    start = 0,
    nbLines = 1000000000,
    window = 80,
    move = 0
}
