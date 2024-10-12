module Domain.Availability where

import Data.Aeson
import Data.Text
import Domain.Day
import GHC.Generics

data Availability = Availability 
  { day :: Day
  , hours :: Text
  } deriving Generic

-- you can generate an instance
instance ToJSON Availability where
  toEncoding = genericToEncoding defaultOptions 
  -- defaultOptions can be changed if you have some generic change to apply
  -- to the encoding
  -- for more: see Data.Aeson on hackage.haskell.org

-- you can write an instance
-- instance ToJSON Availability where
--   toJSON availability = 
--     object 
--       [ "day" .= toJSON availability.day
--       , "hours" .= toJSON availability.hours
--       ]                            {- ^ what is this? -}

-- or you can use DeriveAnyClass to gain space

availabilities :: [Availability]
availabilities =
  [ Availability Monday "8am-12pm 14pm-18pm" 
  , Availability Tuesday "8am-12pm 14pm-18pm" 
  , Availability Wednesday "8am-12pm 14pm-18pm" 
  , Availability Thursday "8am-12pm 14pm-18pm" 
  , Availability Friday "8am-12pm 14pm-18pm"   
  ]