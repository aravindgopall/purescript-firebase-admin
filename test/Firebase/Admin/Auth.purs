module Test.Firebase.Admin.Auth where
  
import Prelude

import Control.Monad.Free (Free)
import Data.Array (length)
import Firebase.Admin (deleteApp, firebaseAuth)
import Firebase.Admin.Auth (createUser, deleteUser, getUser, listUsers', updateUser)
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
    lst <- listUsers' auth
    assert "list empty users" (0 == length lst.users)
    createdUser <- createUser auth { email: testEmail }
    assert "create user success" (createdUser.email == testEmail) 
    user <- getUser auth createdUser.uid
    assert "get user success" (createdUser.uid == user.uid) 
    updatedUser <- updateUser auth user.uid { displayName: "Test" }
    assert "update user success" (updatedUser.displayName == "Test") 

    deleteUser auth user.uid
    assert "Delete user success" true 
    deleteApp app
     