module Main where

import Network.Wai.Handler.Warp (run)
import Servers.FirstServer (app)

main :: IO ()
main = do
  putStrLn "Running on 8000"
  run 8000 app
  putStrLn "Stopping the server..."

