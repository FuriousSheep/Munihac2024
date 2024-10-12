module Domain.Day where

import Data.Aeson (FromJSON,ToJSON)
import GHC.Generics (Generic)

data Day 
  = Monday 
  | Tuesday
  | Wednesday  
  | Thursday 
  | Friday 
  | Saturday 
  | Sunday
  deriving (Show, Eq, Generic, FromJSON , ToJSON)