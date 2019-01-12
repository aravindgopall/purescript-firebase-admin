module Test.Main where

import Prelude

import Effect (Effect)
import Firebase.Admin (defaultAppName, deleteApp, getAppName)
import Test.Firebase.Admin.Auth (testFirebaseAuth)
import Test.Firebase.Admin.Common (getApp)
import Test.Unit (test)
import Test.Unit.Assert (assert)
import Test.Unit.Main (runTest)
 
main :: Effect Unit
main = 
  runTest $ do
      testFirebaseAuth
        
      test "Firebase App Information" do 
        app <- getApp
        name <- getAppName app
        assert "get name success" $ defaultAppName == name
        _ <- deleteApp app
        assert "" true
