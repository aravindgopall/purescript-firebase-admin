module Firebase.Admin.Types where

foreign import data Firebase :: Type
foreign import data Credential :: Type

type FirebaseAppOptions_r = 
  ( credential :: Credential
  , databaseURL :: String
  , serviceAccountId :: String
  , storageBucket :: String 
  , projectId :: String
  )

type FirebaseAppOptions = { | FirebaseAppOptions_r }

defaultAppName :: String 
defaultAppName = "[DEFAULT]"

firebaseConfigVar :: String 
firebaseConfigVar = "FIREBASE_CONFIG"
