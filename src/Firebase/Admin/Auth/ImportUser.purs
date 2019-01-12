module Firebase.Admin.Auth.ImportUser (
  HashAlgorithmType,
  UserImportHashOptions,
  UserImportOptions,
  UserImportRecord,
  UserImportResult,
  UserImportHashOptions_r,
  UserImportRecord_r,
  importUsers,
  importUsers'
) where

import Prelude

import Control.Promise (Promise, toAff)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Firebase.Admin.Auth.Types (UserInfo, UserMetadata, FirebaseAuth)
import Firebase.Admin.Error (FirebaseArrayIndexError)
import Firebase.Admin.Unsafe (unsafeDecodeForeign)
import Foreign (Foreign)
import Foreign.Class (class Decode)
import Foreign.Generic (defaultOptions, genericDecode)
import Node.Buffer (Buffer)
import Prim.Row (class Union)

-- | Firebase Auth supported hashing algorithms for import operations.
data HashAlgorithmType = 
    SCRYPT 
  | STANDARD_SCRYPT 
  | HMAC_SHA512 
  | HMAC_SHA256 
  | HMAC_SHA1 
  | HMAC_MD5 
  | MD5 
  | PBKDF_SHA1 
  | BCRYPT 
  | PBKDF2_SHA256 
  | SHA512 
  | SHA256 
  | SHA1

type UserImportHashOptions_r = 
  ( algorithm :: HashAlgorithmType
  , key :: Buffer
  , saltSeparator :: Buffer
  , rounds :: Number
  , memoryCost :: Number
  , parallelization :: Number 
  , blockSize :: Number 
  , derivedKeyLength :: Number 
  )

type UserImportHashOptions = { | UserImportHashOptions_r }

-- | User import options for bulk account imports. 
type UserImportOptions = { hash :: UserImportHashOptions }

type UserImportRecord_r =
  ( uid :: String 
  , displayName :: String 
  , email :: String 
  , emailVerified :: Boolean
  , phoneNumber :: String 
  , photoURL :: String
  , disabled :: Boolean
  , metadata :: UserMetadata
  , providerData :: Array UserInfo
  , passwordHash :: Buffer
  , passwordSalt :: Buffer
  )

type UserImportRecord = { | UserImportRecord_r }

data UserImportResult = UserImportResult
  { failureCount :: Int 
  , successCount :: Int
  , errors :: Array FirebaseArrayIndexError 
  }


derive instance genericUserImportResult :: Generic UserImportResult _

instance showUserImportResult :: Show UserImportResult where
  show = genericShow

instance decodeUserImportResult :: Decode UserImportResult where
   decode x = genericDecode (defaultOptions { unwrapSingleConstructors = true }) x
 
-- | Imports the list of users provided to Firebase Auth. This is useful when migrating from an external authentication system without having to use the Firebase CLI SDK.
-- | At most, 1000 users are allowed to be imported one at a time. When importing a list of password users, UserImportOptions are required to be specified.
importUsers 
  :: forall u1 u2 u3 ho1 ho2
  . Union ( uid :: String ) u1 u2
  => Union u2 u3 UserImportRecord_r
  => Union ho1 ho2 UserImportHashOptions_r
  => FirebaseAuth
  -> (Array (Record u2)) 
  -> ({ hash :: Record ho1 })  
  -> Aff UserImportResult
importUsers auth users options = do 
  p <- liftEffect $ runEffectFn3 importUsersImpl auth users options
  unsafeDecodeForeign <$> toAff p


-- | Imports the list of users provided to Firebase Auth without options
importUsers' 
  :: forall u1 u2 u3
  . Union ( uid :: String ) u1 u2
  => Union u2 u3 UserImportRecord_r
  => FirebaseAuth
  -> (Array (Record u2))  
  -> Aff UserImportResult
importUsers' auth users = do 
  p <- liftEffect $ runEffectFn2 importUsersImpl_ auth users
  unsafeDecodeForeign <$> toAff p


foreign import importUsersImpl :: 
  forall ur hor
  . EffectFn3
    FirebaseAuth 
    (Array (Record ur)) 
    (Record hor)
    (Promise Foreign)

foreign import importUsersImpl_ 
  :: forall ur 
  . EffectFn2
    FirebaseAuth
    (Array (Record ur)) 
    (Promise Foreign)
