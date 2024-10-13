{-# LANGUAGE OverloadedRecordDot #-}

module Servers.SecondServer where
   
import Data.Aeson
import Data.Text
import Domain.Availability
import Domain.Day
import GHC.Generics
import Servant 

type AvailabilityApiV2 = "api" :> "v2" :> Get '[JSON] [AvailabilityV2]                                                

app :: Application
app = serve proxy server

proxy :: Proxy AvailabilityApiV2
proxy = Proxy

server :: Server AvailabilityApiV2
server = pure availabilities
