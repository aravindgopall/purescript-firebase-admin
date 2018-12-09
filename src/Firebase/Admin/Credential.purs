module Firebase.Admin.Credential (
  Certificate,
  RefreshToken,
  credentialCertPath,
  credentialCert,
  credentialRefreshTokenPath,
  credentialRefreshToken,
  credentialDefault
) where

import Prelude

import Data.Bifunctor (lmap)
import Data.Either (Either(..))
import Data.Function.Uncurried (Fn3, runFn3)
import Effect (Effect)
import Effect.Uncurried (EffectFn3, runEffectFn3)
import Firebase.Admin.Error (AppError, FirebaseError, appError)
import Firebase.Admin.Types (Credential)

type Path = String 
type CredentialFE = Either FirebaseError Credential

type Certificate =
  { projectId :: String 
  , privateKey :: String 
  , clientEmail :: String 
  }

type RefreshToken = 
  { clientId :: String
  , clientSecret :: String
  , refreshToken :: String
  , type :: String
  }


foreign import credentialCertPathImpl 
  :: forall a e
  . EffectFn3 Path (a -> CredentialFE) (e -> CredentialFE) CredentialFE

foreign import credentialCertImpl 
  :: forall a e
  . Fn3 Certificate (a -> CredentialFE) (e -> CredentialFE) CredentialFE

foreign import credentialRefreshTokenPathImpl 
  :: forall a e
  . EffectFn3 Path (a -> CredentialFE) (e -> CredentialFE) CredentialFE

foreign import credentialRefreshTokenImpl
  :: forall a e
  . Fn3 RefreshToken (a -> CredentialFE) (e -> CredentialFE) CredentialFE

foreign import credentialDefaultImpl :: Effect Credential 

-- | Returns a credential created from the provided service account that grants admin access to Firebase services.
credentialCertPath :: Path -> Effect (Either AppError Credential)
credentialCertPath path = 
  lmap appError <$> runEffectFn3 credentialCertPathImpl path Right Left

-- | Returns a credential created from the provided service account that grants admin access to Firebase services.
credentialCert :: Certificate -> Either AppError Credential
credentialCert cert = 
  lmap appError $ runFn3 credentialCertImpl cert Right Left
  
-- | Returns a credential created from the provided refresh token that grants admin access to Firebase services.
credentialRefreshTokenPath :: Path -> Effect (Either AppError Credential)
credentialRefreshTokenPath path = 
  lmap appError <$> runEffectFn3 credentialRefreshTokenPathImpl path Right Left

-- | Returns a credential created from the provided refresh token that grants admin access to Firebase services.
credentialRefreshToken :: RefreshToken -> Either AppError Credential
credentialRefreshToken token = 
  lmap appError $ runFn3 credentialRefreshTokenImpl token Right Left

-- | Returns a credential created from the Google Application Default Credentials that grants admin access to Firebase services. This credential can be used in the call to initializeDefaultApp.
credentialDefault :: Effect Credential
credentialDefault = credentialDefaultImpl

