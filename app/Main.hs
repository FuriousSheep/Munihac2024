 {-# LANGUAGE OverloadedRecordDot #-}

module Main where

import Servant
import Data.Text
import Day
import Network.Wai.Handler.Warp (run)
import Data.Aeson


main :: IO ()
main = do
  putStrLn "Running on 8000"
  run 8000 app
  putStrLn "Stopping the server..."

app :: Application
app = serve proxy server1

proxy :: Proxy MyServantAPI
proxy = Proxy

server1 :: Server MyServantAPI   
server1 = pure availabilities   

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