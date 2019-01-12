module Test.Firebase.Admin.Auth where
  
import Prelude

import Control.Monad.Free (Free)
import Data.Array (length)
import Data.Either (either, isLeft)
import Data.Maybe (Maybe(..))
import Effect.Aff (attempt)
import Firebase.Admin (deleteApp, firebaseAuth)
import Firebase.Admin.Auth (ListUsersResult(..), UserRecord(..), createCustomToken', createUser, deleteUser, getUser, getUserByEmail, listUsers', updateUser, verifyIdToken, generateEmailVerificationLink)
import Firebase.Admin.Auth.Internal (deleteCustomUserClaims)
import Test.Firebase.Admin.Common (getApp)
import Test.Unit (TestF, test)
import Test.Unit.Assert (assert)
  
testEmail :: String 
testEmail = "test-user@gmail.com"

testFirebaseAuth :: Free TestF Unit
testFirebaseAuth = do 
  test "CRUD test" do 
    app <- getApp
    let auth = firebaseAuth app
    -- clear user if exists
    eOldUser <- attempt $ getUserByEmail auth testEmail
    _ <- either (pure <<< const unit) (\(UserRecord u) -> deleteUser auth u.uid) eOldUser

    (ListUsersResult { users }) <- listUsers' auth 
    assert "list empty users" (length users >= 0)

    (UserRecord createdUser) <- createUser auth { email: Just testEmail }
    assert "create user success" (createdUser.email == Just testEmail) 

    (UserRecord user) <- getUser auth createdUser.uid
    assert "get user success" (createdUser.uid == user.uid) 

    (UserRecord updatedUser) <- updateUser auth user.uid { displayName: Just "Test" }
    assert "update user success" (updatedUser.displayName == Just "Test") 

    token <- createCustomToken' auth user.uid 
    assert "create custom token successfully" (token /= "")
    
    idToken <- attempt $ verifyIdToken auth token false
    assert "Can't verify custom token" (isLeft idToken)

    link <- generateEmailVerificationLink auth testEmail { url: "http://localhost" }
    assert "Can get verification email url" (link /= "")

    deleteCustomUserClaims auth user.uid
    assert "Can delete custoemr user claims" true
    
    deleteUser auth user.uid
    assert "Delete user success" true 
    deleteApp app 
     