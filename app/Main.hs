module Main where

import Servant
import Network.Wai.Handler.Warp (run)
import FirstServer (proxy, server)

main :: IO ()
main = do
  putStrLn "Running on 8000"
  run 8000 app
  putStrLn "Stopping the server..."

app :: Application
app = serve proxy server
