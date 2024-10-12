{-# LANGUAGE OverloadedRecordDot #-}

module Servers.FirstServer where
   
import Data.Aeson
import Data.Text
import Domain.Availability
import Domain.Day
import GHC.Generics
import Servant 

-- | This is the description of the http api 
--
-- type: it's a type alias
-- |
-- |      The internal name you give to the api
-- |      | 
-- |      |                The actual type
-- |      |                          |
-- |      |                          v
-- v      v         {*********************************}
type MyServantAPI = "api" :> Get '[JSON] [Availability] 
--                    ^   ^    ^     ^         ^
-- (Symbol)           |   |    |     |         |
-- this endpoint      |   |    |     |    What content is returned from the
-- starts with "/api"     |    |     |    http request.
--                        |    |     |             
-- a type operator to     |    |     The list of types used in the Accept HTTP headers             
-- combine the types together  |     
-- don't worry about it        |                   
--                             The accepted HTTP verb for this endpoint
--                             Available verbs: Post Put Get Head Option ...
--                             iywtkm: look for http on https://developer.mozilla.org      
                                               

-- And this is your application!
app :: Application
app = serve proxy server

-- `Proxy a` is a parametrized type with a single constructor
-- It's used to carry the type of the API into the server
-- If you want to ask why: too bad! 
-- (But you can check out servant's documentation)
proxy :: Proxy MyServantAPI
proxy = Proxy

-- The description of how routes are handled.
-- Here we have a single route, so we can handle all of them with a constant.
server :: Server MyServantAPI
server = pure availabilities
