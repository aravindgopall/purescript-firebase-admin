module Firebase.Admin (
  module Types,
  module FE,
  initializeDefaultApp,
  initializeApp,
  initializeApp',
  removeFirebaseApp,

  firebaseApp,
  firebaseApp',

  firebaseAuth,
  firebaseAuth'
) where

import Prelude

import Data.Bifunctor (lmap)
import Data.Either (Either(..))
import Data.Function.Uncurried (Fn1, Fn2, Fn3, Fn4, runFn1, runFn2, runFn3, runFn4)
import Effect (Effect)
import Firebase.Admin.Auth (FirebaseAuth)
import Firebase.Admin.Auth.Error (AuthError, authError)
import Firebase.Admin.Error (AppError(..), AppErrorCode(..), FirebaseError, appError, appErrorCode) as FE
import Firebase.Admin.Error (AppError, FirebaseError, appError)
import Firebase.Admin.Types (Credential, Firebase, defaultAppName, firebaseConfigVar) as Types
import Firebase.Admin.Types (Firebase, Credential, FirebaseAppOptions_r)
import Prim.Row (class Union)

type FirebaseFE = Either FirebaseError Firebase
 
foreign import initializeDefaultAppImpl :: Effect Firebase
foreign import initializeAppImpl 
  :: forall r a e
  . Fn4 
      (Record r) 
      String 
      (a -> FirebaseFE) 
      (e -> FirebaseFE)
      FirebaseFE

foreign import initializeAppImpl_
  :: forall r a e
  . Fn3 
      (Record r) 
      (a -> FirebaseFE) 
      (e -> FirebaseFE)
      FirebaseFE

foreign import authImpl :: Fn1 Firebase FirebaseAuth
foreign import defaultAuthImpl 
  :: forall a e
  . Fn2 
      (a -> FirebaseFE) 
      (e -> FirebaseFE) 
      (Either FirebaseError FirebaseAuth)

foreign import appImpl 
  :: forall a e
  . Fn3 
      String 
      (a -> FirebaseFE) 
      (e -> FirebaseFE) 
      FirebaseFE

foreign import defaultAppImpl 
  :: forall a e
  . Fn2 (a -> FirebaseFE) (e -> FirebaseFE) FirebaseFE

foreign import removeAppImpl 
  :: forall a e
  . Fn3 String (a -> FirebaseFE) (e -> FirebaseFE) (Either FirebaseError Unit)

-- | Initializes the FirebaseApp instance. The SDK uses Google Application Default Credentials and reads options from the FIREBASE_CONFIG environment variable.
initializeDefaultApp :: Effect Firebase
initializeDefaultApp = initializeDefaultAppImpl

-- | Initializes the FirebaseApp instance with name and options
initializeApp 
  :: forall o1 o2 o3 
  . Union ( credential :: Credential ) o1 o2
  => Union o2 o3 FirebaseAppOptions_r
  => Record o2 -> String -> Either AppError Firebase
initializeApp options appName = 
  lmap appError $ runFn4 initializeAppImpl options appName Right Left

-- | Initializes default FirebaseApp instance with options only
initializeApp'
  :: forall o1 o2 o3 
  . Union ( credential :: Credential ) o1 o2
  => Union o2 o3 FirebaseAppOptions_r
  => Record o2 -> Either AppError Firebase
initializeApp' options = 
  lmap appError $ runFn3 initializeAppImpl_ options Right Left


-- | Removes the specified FirebaseApp instance.
removeFirebaseApp :: String -> Either AppError Unit
removeFirebaseApp name = 
  lmap appError $ runFn3 removeAppImpl name Right Left

-- | Returns the FirebaseApp instance with the provided name.
firebaseApp :: String -> Either AppError Firebase
firebaseApp name = lmap appError $ runFn3 appImpl name Right Left

-- | Returns default FirebaseApp instance.
firebaseApp' :: Either AppError Firebase
firebaseApp' = lmap appError $ runFn2 defaultAppImpl Right Left

-- | Gets the `Auth` service namespace from explicitly specified app.
firebaseAuth :: Firebase -> FirebaseAuth
firebaseAuth = runFn1 authImpl

-- | Gets the `Auth` service namespace from default app.
firebaseAuth' :: Either AuthError FirebaseAuth
firebaseAuth' = lmap authError $ runFn2 defaultAuthImpl Right Left
