{-# LANGUAGE OverloadedRecordDot #-}

module Servers.SecondServer where
   
import Domain.AvailabilityV2
import GHC.Generics
import Servant 
import Control.Monad.IO.Class

type AvailabilityApiV2 = "api" :> "v2" :> Get '[JSON] [AvailabilityV2]

app :: Application
app = serve proxy server

proxy :: Proxy AvailabilityApiV2
proxy = Proxy

server :: Server AvailabilityApiV2
server = do
  liftIO $ putStrLn "Log: queried v2" 
  -- ^ use an actual logging library in production please
  -- unknowingly, you were in a Monad Transformer Stack all along!
  pure availabilities
