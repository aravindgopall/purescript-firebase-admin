module Firebase.Admin.Auth.Types where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Foreign (readString)
import Foreign.Class (class Decode, class Encode)
import Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Prim.Row (class Union, class Nub)
import Record (merge)

foreign import data FirebaseAuth :: Type

-- | The ID of the provider used to sign in the user.
data SignInProvider = Anonymous 
                    | Password 
                    | Facebook 
                    | Github 
                    | Google 
                    | Twitter 
                    | Custom

instance showSignInProvider :: Show SignInProvider where
  show Anonymous = "anonymous"
  show Password = "password"
  show Facebook = "facebook.com"
  show Github = "github.com"
  show Google = "google.com"
  show Twitter = "twitter.com"
  show Custom = "custom"

toSignInProvider :: String -> SignInProvider
toSignInProvider "anonymous" = Anonymous
toSignInProvider "password" = Password
toSignInProvider "facebook.com" = Facebook
toSignInProvider "github.com" = Github
toSignInProvider "google.com" = Google
toSignInProvider "twitter.com" = Twitter
toSignInProvider _ = Custom

instance decodeSignInProvider :: Decode SignInProvider where
  decode = map toSignInProvider <<< readString

-- | Parameters for update user operation 
newtype UpdateRequest = UpdateRequest { | UpdateRequest_r }

type UpdateRequest_r = 
  ( displayName :: Maybe String 
  , email :: Maybe String 
  , emailVerified :: Boolean
  , phoneNumber :: Maybe String 
  , photoURL :: Maybe String
  , disabled :: Boolean
  , password :: Maybe String
  )

derive instance genericUpdateRequest :: Generic UpdateRequest _

instance showUpdateRequest :: Show UpdateRequest where
  show = genericShow

instance encodeUpdateRequest :: Encode UpdateRequest where
   encode x = genericEncode (defaultOptions { unwrapSingleConstructors = true }) x

type CreateRequest_r = 
  ( uid :: Maybe String 
  | UpdateRequest_r
  )

-- | Parameters for create user operation 
newtype CreateRequest = CreateRequest { | CreateRequest_r }

derive instance genericCreateRequest :: Generic CreateRequest _

instance showCreateRequest :: Show CreateRequest where
  show = genericShow

instance encodeCreateRequest :: Encode CreateRequest where
   encode x = genericEncode (defaultOptions { unwrapSingleConstructors = true }) x

type UserMetadata = 
  { creationTime :: Maybe String 
  , lastSignInTime :: Maybe String 
  }

defaultUpdateRequest :: Record UpdateRequest_r
defaultUpdateRequest = { displayName: Nothing 
                        , email: Nothing 
                        , emailVerified: false
                        , phoneNumber: Nothing 
                        , photoURL: Nothing
                        , disabled: false
                        , password: Nothing 
                        }

-- | Create UpdateRequest data from record 
updateUserRequest :: forall r1 r2
                     . Union r1 UpdateRequest_r r2
                     => Nub r2 UpdateRequest_r
                     => Record r1 -> UpdateRequest
updateUserRequest r1 = UpdateRequest $ merge r1 defaultUpdateRequest
  

defaultCreateRequest :: Record CreateRequest_r
defaultCreateRequest = { uid: Nothing
                      , displayName: Nothing 
                      , email: Nothing 
                      , emailVerified: false
                      , phoneNumber: Nothing 
                      , photoURL: Nothing
                      , disabled: false
                      , password: Nothing 
                      }

-- | Create UpdateRequest data from record 
createUserRequest :: forall r1 r2
                     . Union r1 CreateRequest_r r2
                     => Nub r2 CreateRequest_r
                     => Record r1 -> CreateRequest
createUserRequest r1 = CreateRequest $ merge r1 defaultCreateRequest

-- | User info class that provides provider user information for different Firebase providers like google.com, facebook.com, password, etc.
data UserInfo = UserInfo
  { uid :: String 
  , displayName :: Maybe String 
  , email :: Maybe String
  , photoURL :: Maybe String
  , providerId :: String 
  , phoneNumber :: Maybe String 
  }

derive instance genericUserInfo :: Generic UserInfo _

instance showUserInfo :: Show UserInfo where
  show = genericShow

instance decodeUserInfo :: Decode UserInfo where
   decode x = genericDecode (defaultOptions { unwrapSingleConstructors = true }) x

-- | Interface representing a user.
data UserRecord a = UserRecord
  { uid :: String 
  , displayName :: Maybe String 
  , email :: Maybe String 
  , emailVerified :: Boolean
  , phoneNumber :: Maybe String 

  , photoURL :: Maybe String
  , disabled :: Boolean
  , metadata :: UserMetadata
  , providerData :: Array UserInfo
  , passwordHash :: Maybe String

  , passwordSalt :: Maybe String 
  , tokensValidAfterTime :: Maybe String  
  , customClaims :: Maybe a 
  }


derive instance genericUserRecord :: Generic (UserRecord a) _

instance showUserRecord :: Show a => Show (UserRecord a) where
  show = genericShow

instance decodeUserRecord :: Decode a => Decode (UserRecord a) where
   decode x = genericDecode (defaultOptions { unwrapSingleConstructors = true }) x

-- | Interface representing a resulting object returned from a listUsers operation containing the list of users for the current batch and the next page token if available.
newtype ListUsersResult a = ListUsersResult
  { pageToken :: Maybe String 
  , users :: Array (UserRecord a)
  }

derive instance genericListUsersResult :: Generic (ListUsersResult a) _

instance showListUsersResult :: Show a => Show (ListUsersResult a) where
  show = genericShow

instance decodeListUsersResult :: Decode a => Decode (ListUsersResult a) where
   decode x = genericDecode (defaultOptions { unwrapSingleConstructors = true }) x

-- | Interface representing the session cookie options.
type SessionCookieOptions =  { expiresIn :: Int }

-- | Interface representing a decoded ID token
newtype DecodedIdToken a = DecodedIdToken 
  { aud :: String 
  , auth_time :: Int 
  , exp :: Int 
  , email :: Maybe String 
  , email_verified :: Maybe Boolean
  , firebase :: { sign_in_provider :: SignInProvider
                , identities :: a
                }
  , iat :: Int 
  , iss :: String 
  , name :: Maybe String 
  , phone_number :: Maybe String
  , picture :: Maybe String
  , sub :: String 
  , uid :: String
  }

derive instance genericDecodedIdToken :: Generic (DecodedIdToken a) _

instance showDecodedIdToken :: Show a => Show (DecodedIdToken a) where
  show = genericShow

instance decodeDecodedIdToken :: Decode a => Decode (DecodedIdToken a) where
   decode x = genericDecode (defaultOptions { unwrapSingleConstructors = true }) x

-- | Defines the Android related settings corresponding to the action code if it is to be handled in an Android app.
data AndroidActionCodeSettings
  = AndroidActionCodeSettings { | AndroidActionCodeSettings_r }

type AndroidActionCodeSettings_r = ( installApp :: Maybe Boolean
                                  , minimumVersion :: Maybe String 
                                  , packageName :: String 
                                  )
derive instance genericAndroidActionCodeSettings :: Generic AndroidActionCodeSettings _

instance showAndroidActionCodeSettings :: Show AndroidActionCodeSettings where
  show = genericShow

instance encodeAndroidActionCodeSettings :: Encode AndroidActionCodeSettings where
   encode x = genericEncode (defaultOptions { unwrapSingleConstructors = true }) x

-- | Android Action Code Settings contructor
androidActionCodeSettings :: forall r1 r2 r3
                           . Union ( packageName :: String ) r1 r2 
                           => Union r2 AndroidActionCodeSettings_r r3 
                           => Nub r3 AndroidActionCodeSettings_r
                           => Record r2 -> AndroidActionCodeSettings
androidActionCodeSettings r = AndroidActionCodeSettings $ merge r defaultRecord
  where
    defaultRecord :: Record AndroidActionCodeSettings_r
    defaultRecord = { installApp: Nothing 
                    , minimumVersion: Nothing  
                    , packageName: ""
                    }

-- | Defines the iOS related settings corresponding to the action code if it is to be handled in an iOS app.
data IOSActionCodeSettings = IOSActionCodeSettings { | IOSActionCodeSettings_r }

type IOSActionCodeSettings_r = ( bundleId :: String )

derive instance genericIOSActionCodeSettings :: Generic IOSActionCodeSettings _

instance showIOSActionCodeSettings :: Show IOSActionCodeSettings where
  show = genericShow

instance encodeIOSActionCodeSettings :: Encode IOSActionCodeSettings where
   encode x = genericEncode (defaultOptions { unwrapSingleConstructors = true }) x

iosActionCodeSettings :: { | IOSActionCodeSettings_r } -> IOSActionCodeSettings
iosActionCodeSettings = IOSActionCodeSettings

type ActionCodeSettings_r = ( android :: Maybe AndroidActionCodeSettings 
                            , dynamicLinkDomain :: Maybe String
                            , handleCodeInApp :: Boolean
                            , iOS :: Maybe IOSActionCodeSettings
                            , url :: String 
                            ) 

-- | This is the interface that defines the required continue/state URL with optional Android and iOS bundle identifiers.                  
data ActionCodeSettings = ActionCodeSettings { | ActionCodeSettings_r }
  
derive instance genericActionCodeSettings :: Generic ActionCodeSettings _

instance showActionCodeSettings :: Show ActionCodeSettings where
  show = genericShow

instance encodeActionCodeSettings :: Encode ActionCodeSettings where
   encode x = genericEncode (defaultOptions { unwrapSingleConstructors = true }) x

-- | Android Action Code Settings contructor
actionCodeSettings :: forall r1 r2
                           . Union r1 ActionCodeSettings_r r2
                           => Nub r2 ActionCodeSettings_r
                           => Record r1 -> ActionCodeSettings
actionCodeSettings r = ActionCodeSettings $ merge r defaultRecord
  where
    defaultRecord :: Record ActionCodeSettings_r
    defaultRecord = { android: Nothing
                    , dynamicLinkDomain: Nothing 
                    , handleCodeInApp: false
                    , iOS: Nothing  
                    , url: ""
                    }
