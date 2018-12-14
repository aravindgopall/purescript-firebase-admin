module Test.Firebase.Admin.Common where

import Prelude

import Data.Maybe (fromMaybe)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Firebase.Admin (Firebase, defaultAppName, initializeApp)
import Firebase.Admin.Credential (credentialCert)
import Node.Process (lookupEnv)


getApp :: Aff Firebase
getApp = do 
  projectId <- liftEffect $ fromMaybe "" <$> lookupEnv "PROJECT_ID"
  privateKey <- liftEffect $ fromMaybe "" <$> lookupEnv "PRIVATE_KEY"
  clientEmail <- liftEffect $ fromMaybe "" <$> lookupEnv "CLIENT_EMAIL"
  credential <- credentialCert { projectId, privateKey, clientEmail }
  initializeApp { credential } defaultAppName
