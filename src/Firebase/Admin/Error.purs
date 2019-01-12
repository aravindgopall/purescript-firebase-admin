module Firebase.Admin.Error where
  
import Prelude

import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Foreign.Class (class Decode)
import Foreign.Generic (defaultOptions, genericDecode)

type FirebaseError = 
  { code :: String
  , message :: String  
  }

data FirebaseArrayIndexError = FirebaseArrayIndexError
  { index :: Int 
  , error :: FirebaseError
  }

derive instance genericFirebaseArrayIndexError :: Generic FirebaseArrayIndexError _

instance showFirebaseArrayIndexError :: Show FirebaseArrayIndexError where
  show = genericShow

instance decodeFirebaseArrayIndexError :: Decode FirebaseArrayIndexError where
   decode x = genericDecode (defaultOptions { unwrapSingleConstructors = true }) x


-- | App client error codes and their default messages.  
data AppErrorCode 
  = AppDeleted  
  | DuplicateApp 
  | InternalError
  | InvalidAppName
  | InvalidAppOptions
  | InvalidCredential
  | NetworkError 
  | NetworkTimeout
  | NoApp
  | UnableToParseResponse
  | UnknownAppError

-- | App client error
data AppError = AppError 
  { code :: AppErrorCode
  , message :: String 
  }

instance showAppError :: Show AppError where
  show (AppError { code, message }) = show code <> " - " <> message

-- | Create App Error from FirebaseError
appError :: FirebaseError -> AppError 
appError err = AppError 
  { code: appErrorCode err.code 
  , message: err.message 
  } 

instance showAppErrorCode :: Show AppErrorCode where
  show AppDeleted = "app/app-deleted"
  show DuplicateApp = "app/duplicate-app"
  show InternalError = "app/internal-error"
  show InvalidAppName = "app/invalid-app-name"
  show InvalidAppOptions = "app/invalid-app-options"
  show InvalidCredential = "app/invalid-credential"
  show NetworkError = "app/network-error"
  show NetworkTimeout = "app/network-timeout"
  show NoApp = "app/no-app"
  show UnableToParseResponse = "app/unable-to-parse-response"
  show UnknownAppError = "app/unknown-error"
  
-- | Create App Error Code from string
appErrorCode :: String -> AppErrorCode
appErrorCode "app/app-deleted" = AppDeleted
appErrorCode "app/duplicate-app" = DuplicateApp
appErrorCode "app/internal-error" = InternalError
appErrorCode "app/invalid-app-name" = InvalidAppName
appErrorCode "app/invalid-app-options" = InvalidAppOptions
appErrorCode "app/invalid-credential" = InvalidCredential
appErrorCode "app/network-error" = NetworkError
appErrorCode "app/network-timeout" = NetworkTimeout
appErrorCode "app/no-app" = NoApp
appErrorCode "app/unable-to-parse-response" = UnableToParseResponse
appErrorCode _ = UnknownAppError
