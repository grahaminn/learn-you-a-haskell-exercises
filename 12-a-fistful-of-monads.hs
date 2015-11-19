{-
 - Create a type called Validation
 - The type constructor takes one parameter
 - There are two Values: 
 -   Success, which takes that parameter and
 -   Fail String, which represents a failure, and a reason for that failure
 -}
data Validation a = Success a | Fail String deriving Show 

-- Make the Validation a Monad
instance Monad Validation where
	return a = Success a
	Success a >>= f = f a
	Fail a >>= f = Fail a
	fail message = Fail message

{-
 - Create a function, positiveCheck, which takes a number and returns a successful Validation if it's positive, 
 - and a failed Validation with a String message if not.
 -}
positiveCheck :: (Num a, Ord a) => a -> Validation a
positiveCheck x | x < 0 = fail "x is negative"
		| x >= 0 = return x 

{-
 - Create a function, evenCheck, which returns a successful Validation if it's even,
 - and a failed Validation with a string message if it's odd
 -}
evenCheck :: (Integral a)  =>  a -> Validation a
evenCheck x | mod x 2 == 0 = return x
	    | mod x 2 == 1 = fail "x is an odd number"

{-
 - Write a function which uses positiveCheck and evenCheck to make sure a number is both positive and even
 -}
positiveAndEvenCheck :: (Num a, Ord a, Integral a) => a -> Validation a
positiveAndEvenCheck x = (evenCheck x)  >>= positiveCheck
