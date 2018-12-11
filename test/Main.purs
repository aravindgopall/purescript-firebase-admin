module Test.Main where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (fromMaybe)
import Effect (Effect)
import Firebase.Admin (AppError, Firebase, initializeApp')
import Firebase.Admin.Credential (credentialCert)
import Node.Process (lookupEnv)
import Test.Firebase.Admin.Auth (testFirebaseAuth)
import Test.Unit (failure, test)
import Test.Unit.Main (runTest)


getApp :: Effect (Either AppError Firebase) 
getApp = do 
  projectId <- fromMaybe "" <$> lookupEnv "PROJECT_ID"
  privateKey <- fromMaybe "" <$> lookupEnv "PRIVATE_KEY"
  clientEmail <- fromMaybe "" <$> lookupEnv "CLIENT_EMAIL"
  let cred = credentialCert { projectId, privateKey, clientEmail }
  pure $ (\credential -> initializeApp' { credential }) =<< cred

main :: Effect Unit
main = do 
  eApp <- getApp
  runTest $ case eApp of 
    Left err -> test "inititalize Firebase" $ failure (show err)
    Right app -> testFirebaseAuth app

