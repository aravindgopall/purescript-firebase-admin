module Firebase.Admin.Auth.Internal (
  createUser,
  deleteUser,
  updateUser,
  getUser,
  getUserByEmail,
  getUserByPhoneNumber,
  listUsers,
  listUsers',
  listFirstUsers
) where
  
import Prelude

import Control.Promise (Promise, toAff)
import Data.Maybe (Maybe(..))
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Uncurried (EffectFn2, EffectFn3, EffectFn4, EffectFn5, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5)
import Firebase.Admin.Auth.Types (CreateRequest_r, FirebaseAuth, UpdateRequest_r, UserRecord, ListUsersResult)
import Prim.Row (class Union)
  
-- | Creates a new user.
createUser :: forall r1 r2 
           . Union r1 r2 CreateRequest_r
           => FirebaseAuth -> Record r1 -> Aff UserRecord
createUser auth r = do 
  p <- liftEffect $ runEffectFn2 _createUser auth r
  toAff p

-- | Deletes an existing user.
deleteUser :: FirebaseAuth -> String -> Aff Unit
deleteUser auth uid = do 
  p <- liftEffect $ runEffectFn2 _deleteUser auth uid
  toAff p

-- | Updates an existing user.
updateUser ::forall r1 r2 
           . Union r1 r2 UpdateRequest_r
           => FirebaseAuth -> String -> Record r1 -> Aff UserRecord
updateUser auth uid r = do 
  p <- liftEffect $ runEffectFn3 _updateUser auth uid r
  toAff p

-- | Gets the user data for the user corresponding to a given uid.
getUser :: FirebaseAuth -> String -> Aff UserRecord
getUser auth uid = do 
  p <- liftEffect $ runEffectFn2 _getUser auth uid
  toAff p

-- | Gets the user data for the user corresponding to a given email.
getUserByEmail :: FirebaseAuth -> String -> Aff UserRecord
getUserByEmail auth email = do 
  p <- liftEffect $ runEffectFn2 _getUserByEmail auth email
  toAff p

-- | Gets the user data for the user corresponding to a given phone number. The phone number has to conform to the E.164 specification.
getUserByPhoneNumber :: FirebaseAuth -> String -> Aff UserRecord
getUserByPhoneNumber auth phoneNumber = do 
  p <- liftEffect $ runEffectFn2 _getUserByPhoneNumber auth phoneNumber
  toAff p

-- | Retrieves a list of users (single batch only) with a size of maxResults and starting from the offset as specified by pageToken. This is used to retrieve all the users of a specified project in batches.
listUsers :: FirebaseAuth -> Int -> String -> Aff ListUsersResult
listUsers auth maxResults pageToken = do 
  p <- liftEffect $ runEffectFn5 _listUsers auth maxResults pageToken (const Nothing) Just
  toAff p

-- | Retrieves a list of users (single batch only) from beginning, with maximum 1000 results
listUsers' :: FirebaseAuth -> Aff ListUsersResult
listUsers' auth = do 
  p <- liftEffect $ runEffectFn3 __listUsers auth (const Nothing) Just
  toAff p

-- | Retrieves a list of users (single batch only) from beginning with page size
listFirstUsers :: FirebaseAuth -> Int -> Aff ListUsersResult
listFirstUsers auth maxResults = do 
  p <- liftEffect $ runEffectFn4 _ListFirstUsers auth maxResults (const Nothing) Just
  toAff p

-- foreign functions 
foreign import _createUser 
  :: forall r
  . EffectFn2 
      FirebaseAuth 
      (Record r) 
      (Promise UserRecord)

foreign import _deleteUser 
  :: EffectFn2 
      FirebaseAuth 
      String 
      (Promise Unit)

foreign import _updateUser 
  :: forall r
  . EffectFn3 
      FirebaseAuth 
      String 
      (Record r) 
      (Promise UserRecord)

foreign import _getUser 
  :: EffectFn2 
      FirebaseAuth 
      String 
      (Promise UserRecord)
foreign import _getUserByEmail 
  :: EffectFn2 
      FirebaseAuth 
      String 
      (Promise UserRecord)
foreign import _getUserByPhoneNumber 
  :: EffectFn2 
      FirebaseAuth 
      String 
      (Promise UserRecord)

foreign import _listUsers 
  :: forall a
    . EffectFn5
        FirebaseAuth 
        Int 
        String 
        (Unit -> Maybe a) 
        (a -> Maybe a)
        (Promise ListUsersResult)
 
foreign import __listUsers 
  :: forall a
    . EffectFn3
        FirebaseAuth 
        (Unit -> Maybe a) 
        (a -> Maybe a)
        (Promise ListUsersResult)
 
foreign import _ListFirstUsers 
  :: forall a
    . EffectFn4
        FirebaseAuth 
        Int 
        (Unit -> Maybe a) 
        (a -> Maybe a)
        (Promise ListUsersResult)
 
