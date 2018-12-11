module Test.Main where

import Prelude

import Data.Either (Either(..))
import Effect (Effect)
import Firebase.Admin (initializeApp')
import Firebase.Admin.Credential (credentialCertPath)
import Test.Firebase.Admin.Auth (testFirebaseAuth)
import Test.Unit (failure, test)
import Test.Unit.Main (runTest)

main :: Effect Unit
main = do 
  cert <- credentialCertPath "cert.json"
  let eApp = (\credential -> initializeApp' { credential }) =<< cert
  runTest $ case eApp of 
    Left err -> test "inititalize Firebase" $ failure (show err)
    Right app -> testFirebaseAuth app

