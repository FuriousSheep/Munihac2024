module Domain.AvailabilityV2 where

import Data.Aeson
import Domain.Day
import GHC.Generics

data AvailabilityV2 = AvailabilityV2 
  { day :: Day
  , morningStartHour :: Int
  , morningEndHour :: Int
  , eveningStartHour :: Int
  , eveningEndHour :: Int
  } deriving (Generic, ToJSON, FromJSON)

availabilities :: [AvailabilityV2]
availabilities =
  [ AvailabilityV2 Monday 8 12 14 18 
  , AvailabilityV2 Tuesday 8 12 14 18 
  , AvailabilityV2 Wednesday 8 12 14 18 
  , AvailabilityV2 Thursday 8 12 14 18 
  , AvailabilityV2 Friday 8 12 14 18   
  ]