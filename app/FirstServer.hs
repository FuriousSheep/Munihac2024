{-# LANGUAGE OverloadedRecordDot #-}
 
module FirstServer where
   
import Data.Aeson
import Day
import Servant 
import Data.Text

  
proxy :: Proxy MyServantAPI
proxy = Proxy

server :: Server MyServantAPI   
server = pure availabilities   

type MyServantAPI = "api" :> Get '[JSON] [Availability] 
-- http GET localhost:8000/api
-- 

data Availability = Availability 
  { day :: Day
  , hours :: Text
  }

instance ToJSON Availability where
  toJSON availability = 
    object 
      [ "day" .= toJSON availability.day
      , "hours" .= toJSON availability.hours
      ]

availabilities :: [Availability]
availabilities =
  [ Availability Monday "8am-12pm 14pm-18pm" 
  , Availability Tuesday "8am-12pm 14pm-18pm" 
  , Availability Wednesday "8am-12pm 14pm-18pm" 
  , Availability Thursday "8am-12pm 14pm-18pm" 
  , Availability Friday "8am-12pm 14pm-18pm"   
  ]