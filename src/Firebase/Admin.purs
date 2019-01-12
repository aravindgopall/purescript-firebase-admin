module Firebase.Admin (
  module Types,
  module FE,
  initializeDefaultApp,
  initializeDefaultApp',
  initializeApp,
  initializeApp',
  getAppName,
  getAppOptions,
  deleteApp,

  firebaseApp,
  firebaseApp',

  firebaseAuth,
  firebaseStorage
) where

import Prelude

import Control.Promise (Promise, toAffE)
import Data.Bifunctor (lmap)
import Data.Either (Either(..))
import Data.Function.Uncurried (Fn1, Fn3, Fn4, runFn1, runFn3, runFn4)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Firebase.Admin.Auth (FirebaseAuth)
import Firebase.Admin.Error (AppError(..), AppErrorCode(..), FirebaseError, appError, appErrorCode) as FE
import Firebase.Admin.Error (AppError, FirebaseError, appError)
import Firebase.Admin.Storage.Types (FirebaseStorage)
import Firebase.Admin.Types (Credential, Firebase, FirebaseAppOptions, FirebaseAppOptions_r, defaultAppName, firebaseConfigVar) as Types
import Firebase.Admin.Types (Credential, Firebase, FirebaseAppOptions_r, FirebaseAppOptions)
import Firebase.Admin.Unsafe (liftEiher, liftEitherEffect)
import Prim.Row (class Union)

type FirebaseFE = Either FirebaseError Firebase
 

-- | Initializes the FirebaseApp instance. The SDK uses Google Application Default Credentials and reads options from the FIREBASE_CONFIG environment variable. Return Aff 
initializeDefaultApp :: Aff Firebase
initializeDefaultApp = liftEitherEffect initializeDefaultApp'
  

-- | Initializes the FirebaseApp instance. The SDK uses Google Application Default Credentials and reads options from the FIREBASE_CONFIG environment variable.
initializeDefaultApp' :: Effect (Either AppError Firebase)
initializeDefaultApp' = 
  lmap appError <$> runEffectFn2 initializeDefaultAppImpl Right Left

-- | Initializes the FirebaseApp instance with name and options. Return Aff
initializeApp 
  :: forall o1 o2 o3 
  . Union ( credential :: Credential ) o1 o2
  => Union o2 o3 FirebaseAppOptions_r
  => Record o2 -> String -> Aff Firebase
initializeApp options appName = liftEiher eApp
  where
    eApp = lmap appError $ runFn4 initializeAppImpl options appName Right Left

-- | Initializes the FirebaseApp instance with name and options
initializeApp'
  :: forall o1 o2 o3 
  . Union ( credential :: Credential ) o1 o2
  => Union o2 o3 FirebaseAppOptions_r
  => Record o2 -> String -> Either AppError Firebase
initializeApp' options appName = 
  lmap appError $ runFn4 initializeAppImpl options appName Right Left

-- | Returns unsafe name of the FirebaseApp instance as Aff.
getAppName :: Firebase -> Aff String 
getAppName = liftEiher <<< getAppName'

-- | Returns the name of the FirebaseApp instance.
getAppName' :: Firebase -> Either AppError String 
getAppName' app = runFn3 getAppNameImpl app Right Left

-- | Returns unsafe Aff options for the FirebaseApp instance
getAppOptions :: Firebase -> Aff FirebaseAppOptions 
getAppOptions = liftEiher <<< getAppOptions'

-- | Returns the options for the FirebaseApp instance.
getAppOptions' :: Firebase -> Either AppError FirebaseAppOptions 
getAppOptions' app = runFn3 getAppOptionsImpl app Right Left

-- | Deletes the FirebaseApp instance.
deleteApp :: Firebase -> Aff Unit
deleteApp = toAffE <<< runEffectFn1 deleteAppImpl

-- | Returns unsafe Aff FirebaseApp instance with the provided name.
firebaseApp :: String -> Aff Firebase
firebaseApp = liftEiher <<< firebaseApp'

-- | Returns the FirebaseApp instance with the provided name.
firebaseApp' :: String -> Either AppError Firebase
firebaseApp' name = lmap appError $ runFn3 appImpl name Right Left

-- | Gets the `Auth` service namespace from explicitly specified app.
firebaseAuth :: Firebase -> FirebaseAuth
firebaseAuth = runFn1 authImpl

-- | Gets the `Auth` service namespace from explicitly specified app.
firebaseStorage :: Firebase -> FirebaseStorage
firebaseStorage = runFn1 storageImpl

-- Foreign functions 
foreign import initializeDefaultAppImpl 
  :: forall a e
  . EffectFn2 
      (a -> FirebaseFE) 
      (e -> FirebaseFE)
      FirebaseFE

foreign import initializeAppImpl 
  :: forall r a e
  . Fn4 
      (Record r) 
      String 
      (a -> FirebaseFE) 
      (e -> FirebaseFE)
      FirebaseFE

foreign import authImpl :: Fn1 Firebase FirebaseAuth
foreign import storageImpl :: Fn1 Firebase FirebaseStorage

foreign import appImpl 
  :: forall a e
  . Fn3 
      String 
      (a -> FirebaseFE) 
      (e -> FirebaseFE) 
      FirebaseFE

foreign import getAppNameImpl :: forall e
                              . Fn3   
                                  Firebase 
                                  (String -> Either AppError String) 
                                  (e -> Either AppError String) 
                                  (Either AppError String)

foreign import getAppOptionsImpl :: forall e a
                              . Fn3   
                                  Firebase 
                                  (a -> Either AppError FirebaseAppOptions) 
                                  (e -> Either AppError FirebaseAppOptions) 
                                  (Either AppError FirebaseAppOptions)

foreign import deleteAppImpl :: EffectFn1 Firebase (Promise Unit)
  