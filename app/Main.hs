module Main where

import Network.Wai.Handler.Warp (run)
import Servers.FirstServer (app)

-- To run the examples:
-- replace the import of Server.FirstServer (app) by the module containing the 
-- APIs of your choice

main :: IO ()
main = do
  putStrLn "Running on 8000"
  run 8000 app
  putStrLn "Stopping the server..."

