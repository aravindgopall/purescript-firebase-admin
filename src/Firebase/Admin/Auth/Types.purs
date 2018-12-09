module Firebase.Admin.Auth.Types where

import Prelude

import Data.Maybe (Maybe)

foreign import data FirebaseAuth :: Type

type UpdateRequest_r = 
  ( displayName :: String 
  , email :: String 
  , emailVerified :: Boolean
  , phoneNumber :: String 
  , photoURL :: String
  , disabled :: Boolean
  , password :: String
  )

-- | Parameters for update user operation 
type UpdateRequest = { | UpdateRequest_r }

type CreateRequest_r = 
  ( uid :: String 
  | UpdateRequest_r 
  )

-- | Parameters for create user operation 
type CreateRequest = { | CreateRequest_r }

type UserMetadata = 
  { creationTime :: String 
  , lastSignInTime :: String 
  }

-- | User info class that provides provider user information for different Firebase providers like google.com, facebook.com, password, etc.
type UserInfo = 
  { uid :: String 
  , displayName :: String 
  , email :: String
  , photoURL :: String
  , providerId :: String 
  , phoneNumber :: String 
  }

type UserRecord =
  { uid :: String 
  , displayName :: String 
  , email :: String 
  , emailVerified :: Boolean
  , phoneNumber :: String 
  , photoURL :: String
  , disabled :: Boolean
  , metadata :: UserMetadata
  , providerData :: Array UserInfo
  , passwordHash :: Maybe String
  , passwordSalt :: Maybe String 
  , tokensValidAfterTime :: Maybe String 
  }

