import Control.Applicative
import Data.Monoid

-- We can use the following type to simulate our own list
data List a = Empty | Value a (List a) deriving (Show)

-- Make the list a Functor
instance Functor List where
	fmap f Empty = Empty
	fmap f (Value a l) = Value (f a ) (fmap f l)

-- Write a function which appends one list on to another
combineLists:: List a -> List a -> List a
combineLists Empty b = b
combineLists a Empty = a
combineLists (Value a l) b = Value a (combineLists l b) 

-- Make our list a Monoid
instance Monoid (List a) where
	mempty = Empty
	mappend a b = combineLists a b

-- Make our list an Applicative
instance Applicative List where
	pure x = (Value x) Empty
	Empty <*> ls = Empty
	(Value f fs) <*> ls = mappend (fmap f ls) (fs <*> ls)

-- Make sure that the List obeys the laws for Applicative and Monoid

-- Create some lists of numbers of different lengths such as:
twoValueList = Value 10 $ Value 20 Empty
fourValueList = Value 4 $ Value 17 $ Value 5 $ Value 8 Empty

-- Use <$> on the lists with a single-parameter function, such as:
plusTwo = (+2) <$> fourValueList

-- Use <$> and <*> on the lists with a binary function
addOne = (+1) <$> fourValueList
timesTwo = (Value (*2) Empty) <*> twoValueList

-- Create some lists of binary functions

ops = (Value (+) (Value (*) (Value (/) Empty)))

-- Use <*> on the binary functions list and the number lists

testOps = ops <*> twoValueList <*> fourValueList

