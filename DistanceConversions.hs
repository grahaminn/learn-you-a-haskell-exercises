module DistanceConversions
( yardsToFeet
, feetToInches
, inchesToCentimetres
, chainsToYards
, centimetresToMetres
, chainsToMetres
) where

-- Define yards to feet
yardsToFeet ::  Float -> Float
yardsToFeet y = y * 3.0

-- Define feet to inches
feetToInches :: Float -> Float
feetToInches f = f * 12

-- Define inches to centimetres
inchesToCentimetres :: Float -> Float
inchesToCentimetres i = i * 2.54

-- Define chains to yards
chainsToYards :: Float -> Float
chainsToYards i = i * 22

-- Define centimetres to metres
centimetresToMetres :: Float -> Float
centimetresToMetres i = i / 100.0

-- Define chains to metres
chainsToMetres :: Float -> Float
chainsToMetres i = centimetresToMetres.inchesToCentimetres.feetToInches.yardsToFeet.chainsToYards $ i
