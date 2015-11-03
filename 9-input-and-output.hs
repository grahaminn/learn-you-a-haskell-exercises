{-
 - Lets implement the UNIX echo command
 - The program arguments are simply printed to the standard output.
 - If the first argument is -n, this argument is not printed, and no trailing newline is printed
 -}

import Data.List
import System.Environment
import System.Random

main :: IO ()
main = do
	x <- getArgs
	if x !! 0 == "-n"
		then do putStr (unwords(drop 1 x))
		else do putStrLn (unwords x)	

{- Write a lottery number picker
 - This function should take a StdGen instance, and produce a list of six unique numbers between 1 and 49, in numerical order
 -}
lottery :: StdGen -> [Int]
lottery gen = undefined
