module Domain.AvailabilityV3 where

import Data.Aeson
import Domain.Day
import GHC.Generics

data AvailabilityV3 = AvailabilityV3 
  { day :: Day
  , workedHours :: List Int
  } 

instance ToJSON AvailabilityV3 where
  toJson x = undefined -- define me!
  -- in order to do so, check:
  -- https://hackage.haskell.org/package/aeson
  -- the module Data.Aeson contains a quick tutorial and example

availabilities :: [AvailabilityV3]
availabilities =
  let 
    hours = $ [8 .. 12] <> [14 .. 18]
  in
  (flip AvailabilityV3 hours) 
    <$> [Monday, Tuesday, Wednesday, Thursday, Friday]
    -- "smart" isn't always readable
    {- 
    [ AvailabilityV3 Monday hours
    , AvailabilityV3 Tuesday hours
    , AvailabilityV3 Wednesday hours
    , AvailabilityV3 Thursday hours
    , AvailabilityV3 Friday hours
    ]
    -}