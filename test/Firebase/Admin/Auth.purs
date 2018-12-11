module Test.Firebase.Admin.Auth where
  
import Prelude

import Control.Monad.Free (Free)
import Data.Array (length)
import Firebase.Admin (Firebase, firebaseAuth)
import Firebase.Admin.Auth (createUser, deleteUser, getUser, listUsers', updateUser)
import Test.Unit (TestF, test)
import Test.Unit.Assert (assert)
  
testEmail :: String 
testEmail = "test-user@gmail.com"

testFirebaseAuth :: Firebase -> Free TestF Unit
testFirebaseAuth firebase = do 
  let auth = firebaseAuth firebase 
  test "list empty users" do 
    lst <- listUsers' auth
    assert "list empty users" (0 == length lst.users)
  test "CRUD test" do 
    createdUser <- createUser auth { email: testEmail }
    assert "create user success" (createdUser.email == testEmail) 
    user <- getUser auth createdUser.uid
    assert "get user success" (createdUser.uid == user.uid) 
    updatedUser <- updateUser auth user.uid { displayName: "Test" }
    assert "update user success" (updatedUser.displayName == "Test") 

    deleteUser auth user.uid
    assert "Delete user success" true 
    