{-# LANGUAGE OverloadedRecordDot #-}

module Servers.ThirdServer where
   
import Data.Aeson
import Domain.Availability
import Domain.Day
import GHC.Generics
import Servant 
import qualified Servers.FirstServer as FirstServer
import qualified Servers.SecondServer as SecondServer

type AllAvailabilitiesAPI = AvailabilityApi :<|> AvailabilityApiV2                             

app :: Application
app = serve proxy server

proxy :: Proxy AllAvailabilitiesAPI
proxy = Proxy

server :: Server AllAvailabilitiesAPI
server = FirstServer.server :<|> SecondServer.server
