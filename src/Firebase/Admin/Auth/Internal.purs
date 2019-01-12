module Firebase.Admin.Auth.Internal (
  createUser,
  createUser',
  deleteUser,
  updateUser,
  updateUser',

  getUser,
  getUser',
  getUserByEmail,
  getUserByEmail',
  getUserByPhoneNumber,

  getUserByPhoneNumber',
  listUsers,
  listUsers',
  listCustomUsers,
  listCustomUsers',

  verifyIdToken,
  verifyIdToken',
  createCustomToken,
  createCustomToken',
  createSessionCookie,

  generateEmailVerificationLink,
  generateEmailVerificationLink',
  generatePasswordResetLink,
  generatePasswordResetLink',
  generateSignInWithEmailLink,

  revokeRefreshTokens,
  setCustomUserClaims,
  deleteCustomUserClaims,
  verifySessionCookie
) where
  
import Prelude

import Control.Promise (Promise, toAff)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, runEffectFn1, runEffectFn2, runEffectFn3)
import Firebase.Admin.Auth.Types (CreateRequest, CreateRequest_r, DecodedIdToken, FirebaseAuth, ListUsersResult, SessionCookieOptions, UpdateRequest, UpdateRequest_r, UserRecord, ActionCodeSettings_r, actionCodeSettings, createUserRequest, updateUserRequest)
import Firebase.Admin.Unsafe (unsafeDecodeForeign)
import Foreign (Foreign)
import Foreign.Class (class Decode, class Encode, encode)
import Prim.Row (class Union, class Nub)
  
-- | Creates a new user with optional record
createUser :: forall r1 r2
            . Union r1 CreateRequest_r r2 
            => Nub r2 CreateRequest_r
            => FirebaseAuth -> Record r1 -> Aff (UserRecord Unit)
createUser auth r = do 
  p <- liftEffect $ runEffectFn2 _createUser auth (encode $ createUserRequest r)
  unsafeDecodeForeign <$> toAff p

-- | Creates a new user.
createUser' :: FirebaseAuth -> CreateRequest -> Aff (UserRecord Unit)
createUser' auth r = do 
  p <- liftEffect $ runEffectFn2 _createUser auth (encode r)
  unsafeDecodeForeign <$> toAff p

-- | Deletes an existing user.
deleteUser :: FirebaseAuth -> String -> Aff Unit
deleteUser auth uid = do 
  p <- liftEffect $ runEffectFn2 _deleteUser auth uid
  toAff p

-- | Updates an existing user with optional record.
updateUser :: forall r1 r2
            . Union r1 UpdateRequest_r r2 
            => Nub r2 UpdateRequest_r
            => FirebaseAuth -> String -> Record r1 -> Aff (UserRecord Unit)
updateUser auth uid r = do 
  p <- liftEffect $ runEffectFn3 _updateUser auth uid (encode $ updateUserRequest r)
  unsafeDecodeForeign <$> toAff p

-- | Updates an existing user.
updateUser' :: FirebaseAuth -> String -> UpdateRequest -> Aff (UserRecord Unit)
updateUser' auth uid r = do 
  p <- liftEffect $ runEffectFn3 _updateUser auth uid (encode r)
  unsafeDecodeForeign <$> toAff p

-- | Gets the user data for the user corresponding to a given uid.
getUser :: FirebaseAuth -> String -> Aff (UserRecord Foreign)
getUser auth uid = do 
  p <- liftEffect $ runEffectFn2 _getUser auth uid
  unsafeDecodeForeign <$> toAff p

-- | Gets the user data for the user corresponding to a given uid.
getUser' :: forall a. Decode a => FirebaseAuth -> String -> Aff (UserRecord a)
getUser' auth uid = do 
  p <- liftEffect $ runEffectFn2 _getUser auth uid
  unsafeDecodeForeign <$> toAff p

-- | Gets the user data for the user corresponding to a given email.
getUserByEmail :: FirebaseAuth -> String -> Aff (UserRecord Foreign)
getUserByEmail auth email = do 
  p <- liftEffect $ runEffectFn2 _getUserByEmail auth email
  unsafeDecodeForeign <$> toAff p

-- | Gets the user data for the user corresponding to a given email.
getUserByEmail' :: forall a. Decode a => FirebaseAuth -> String -> Aff (UserRecord a)
getUserByEmail' auth email = do 
  p <- liftEffect $ runEffectFn2 _getUserByEmail auth email
  unsafeDecodeForeign <$> toAff p

-- | Gets the user data for the user corresponding to a given phone number. The phone number has to conform to the E.164 specification.
getUserByPhoneNumber :: FirebaseAuth -> String -> Aff (UserRecord Foreign)
getUserByPhoneNumber auth phoneNumber = do 
  p <- liftEffect $ runEffectFn2 _getUserByPhoneNumber auth phoneNumber
  unsafeDecodeForeign <$> toAff p

-- | Gets the user data for the user corresponding to a given phone number. The phone number has to conform to the E.164 specification.
getUserByPhoneNumber' :: forall a. Decode a => FirebaseAuth -> String -> Aff (UserRecord a)
getUserByPhoneNumber' auth phoneNumber = do 
  p <- liftEffect $ runEffectFn2 _getUserByPhoneNumber auth phoneNumber
  unsafeDecodeForeign <$> toAff p
  
-- | Retrieves a list of users (single batch only) with a size of maxResults and starting from the offset as specified by pageToken. This is used to retrieve all the users of a specified project in batches.
listUsers :: FirebaseAuth -> Int -> String -> Aff (ListUsersResult Foreign)
listUsers auth maxResults pageToken = do 
  p <- liftEffect $ runEffectFn3 _listUsers auth maxResults pageToken
  unsafeDecodeForeign <$> toAff p

-- | Retrieves a list of users (single batch only) from beginning, with maximum 1000 results
listUsers' :: FirebaseAuth -> Aff (ListUsersResult Foreign)
listUsers' auth = do 
  p <- liftEffect $ runEffectFn1 __listUsers auth
  unsafeDecodeForeign <$> toAff p

-- | Retrieves a list of users (single batch only) with a size of maxResults and starting from the offset as specified by pageToken. This is used to retrieve all the users of a specified project in batches.
listCustomUsers :: forall a. Decode a => FirebaseAuth -> Int -> String -> Aff (ListUsersResult a)
listCustomUsers auth maxResults pageToken = do 
  p <- liftEffect $ runEffectFn3 _listUsers auth maxResults pageToken
  unsafeDecodeForeign <$> toAff p

-- | Retrieves a list of users (single batch only) from beginning, with maximum 1000 results
listCustomUsers' :: forall a. Decode a => FirebaseAuth -> Aff (ListUsersResult a)
listCustomUsers' auth = do 
  p <- liftEffect $ runEffectFn1 __listUsers auth
  unsafeDecodeForeign <$> toAff p
  

-- | Verifies a JWT auth token. Returns a Promise with the tokens claims. If checkRevoked is set to true, verifies if the session corresponding to the ID token was revoked. If the corresponding user's session was invalidated, an auth/id-token-revoked error is thrown. If not specified the check is not applied.
verifyIdToken :: FirebaseAuth 
              -> String 
              -> Boolean 
              -> Aff (DecodedIdToken Foreign)
verifyIdToken auth idToken checkRevoked = do 
  p <- liftEffect $ runEffectFn3 _verifyIdToken auth idToken checkRevoked
  unsafeDecodeForeign <$> toAff p


-- | Verifies a JWT auth token. Ignored provider vendor data
verifyIdToken' :: forall a
              . Decode a 
              => FirebaseAuth 
              -> String 
              -> Boolean 
              -> Aff (DecodedIdToken a) 
verifyIdToken' auth idToken checkRevoked = do 
  p <- liftEffect $ runEffectFn3 _verifyIdToken auth idToken checkRevoked
  unsafeDecodeForeign <$> toAff p

-- | Creates a new Firebase custom token (JWT) that can be sent back to a client device to use to sign in with the client SDKs' signInWithCustomToken() methods.
createCustomToken :: forall r. FirebaseAuth -> String -> Record r -> Aff String 
createCustomToken auth uid developerClaims = do 
  p <- liftEffect $ runEffectFn3 _createCustomToken auth uid developerClaims
  toAff p

-- | Creates a new Firebase custom token (JWT) without developerClaims
createCustomToken' :: FirebaseAuth -> String -> Aff String 
createCustomToken' auth uid = do 
  p <- liftEffect $ runEffectFn2 __createCustomToken auth uid
  toAff p

-- | Creates a new Firebase session cookie with the specified options. The created JWT string can be set as a server-side session cookie with a custom cookie policy, and be used for session management. The session cookie JWT will have the same payload claims as the provided ID token.
createSessionCookie :: FirebaseAuth -> String -> SessionCookieOptions -> Aff String 
createSessionCookie auth idToken sessionCookieOptions = do 
  p <- liftEffect $ runEffectFn3 _createSessionCookie auth idToken sessionCookieOptions
  toAff p
  
  
-- | Generates the out of band email action link to verify the user's ownership of the specified email. The ActionCodeSettings object provided as an argument to this method defines whether the link is to be handled by a mobile app or browser along with additional state information to be passed in the deep link, etc.
generateEmailVerificationLink :: forall r1 r2 r3
                           . Union ( url :: String ) r1 r2 
                           => Union r2 ActionCodeSettings_r r3 
                           => Nub r3 ActionCodeSettings_r
                           => FirebaseAuth
                           -> String 
                           -> Record r2 -> Aff String 
generateEmailVerificationLink auth email settings = do 
  p <- liftEffect $ runEffectFn3 _generateEmailVerificationLink auth email fSettings
  toAff p   
  where
    fSettings = (encode $ actionCodeSettings settings)

-- | Generates the out of band email action link to verify the user's ownership of the specified email.
generateEmailVerificationLink' :: FirebaseAuth -> String -> Aff String 
generateEmailVerificationLink' auth email = do 
  p <- liftEffect $ runEffectFn2 __generateEmailVerificationLink auth email
  toAff p   
  
  
-- | Generates the out of band email action link to reset a user's password. The link is generated for the user with the specified email address. The optional ActionCodeSettings object defines whether the link is to be handled by a mobile app or browser and the additional state information to be passed in the deep link, etc.
generatePasswordResetLink :: forall r1 r2 r3
                           . Union ( url :: String ) r1 r2 
                           => Union r2 ActionCodeSettings_r r3 
                           => Nub r3 ActionCodeSettings_r
                           => FirebaseAuth
                           -> String 
                           -> Record r2 -> Aff String 
generatePasswordResetLink auth email settings = do 
  p <- liftEffect $ runEffectFn3 _generatePasswordResetLink auth email fSettings
  toAff p   
  where
    fSettings = (encode $ actionCodeSettings settings)

-- | Generates the out of band email action link to reset a user's password. The link is generated for the user with the specified email address.
generatePasswordResetLink' :: FirebaseAuth -> String -> Aff String 
generatePasswordResetLink' auth email = do 
  p <- liftEffect $ runEffectFn2 __generatePasswordResetLink auth email
  toAff p   

-- | Generates the out of band email action link to sign in or sign up the owner of the specified email. The ActionCodeSettings object provided as an argument to this method defines whether the link is to be handled by a mobile app or browser along with additional state information to be passed in the deep link, etc.
generateSignInWithEmailLink :: forall r1 r2 r3
                           . Union ( url :: String ) r1 r2 
                           => Union r2 ActionCodeSettings_r r3 
                           => Nub r3 ActionCodeSettings_r
                           => FirebaseAuth
                           -> String 
                           -> Record r2 -> Aff String 
generateSignInWithEmailLink auth email settings = do 
  p <- liftEffect $ runEffectFn3 _generateSignInWithEmailLink auth email fSettings
  toAff p   
  where
    fSettings = (encode $ actionCodeSettings settings)


-- | Revokes all refresh tokens for an existing user.
revokeRefreshTokens :: FirebaseAuth -> String -> Aff Unit 
revokeRefreshTokens auth uid = do 
  p <- liftEffect $ runEffectFn2 _revokeRefreshTokens auth uid
  toAff p   

-- | Sets additional developer claims on an existing user identified by the provided uid, typically used to define user roles and levels of access. These claims should propagate to all devices where the user is already signed in (after token expiration or when token refresh is forced) and the next time the user signs in. If a reserved OIDC claim name is used (sub, iat, iss, etc), an error is thrown. They are set on the authenticated user's ID token JWT.
setCustomUserClaims :: forall a. Encode a => FirebaseAuth -> String -> a -> Aff Unit 
setCustomUserClaims auth uid customUserClaims = do 
  p <- liftEffect $ runEffectFn3 _setCustomUserClaims auth uid (encode customUserClaims)
  toAff p   

-- | Delete existing custom user claims
deleteCustomUserClaims :: FirebaseAuth -> String -> Aff Unit
deleteCustomUserClaims auth uid = do 
  p <- liftEffect $ runEffectFn2 _deleteCustomUserClaims auth uid
  toAff p   


-- | Verifies a Firebase session cookie. Returns a Promise with the cookie claims. Rejects the promise if the cookie could not be verified. If checkRevoked is set to true, verifies if the session corresponding to the session cookie was revoked. If the corresponding user's session was revoked, an auth/session-cookie-revoked error is thrown. If not specified the check is not performed.
verifySessionCookie :: forall a
              . Decode a 
              => FirebaseAuth 
              -> String 
              -> Boolean 
              -> Aff (DecodedIdToken a) 
verifySessionCookie auth sessionCookie checkRevoked = do 
  p <- liftEffect $ runEffectFn3 _verifySessionCookie auth sessionCookie checkRevoked
  unsafeDecodeForeign <$> toAff p

-- foreign functions 
foreign import _createUser 
  :: EffectFn2 
      FirebaseAuth 
      Foreign
      (Promise Foreign)

foreign import _deleteUser 
  :: EffectFn2 
      FirebaseAuth 
      String 
      (Promise Unit)

foreign import _updateUser 
  :: EffectFn3 
      FirebaseAuth 
      String 
      Foreign
      (Promise Foreign)

foreign import _getUser 
  :: EffectFn2 
      FirebaseAuth 
      String 
      (Promise Foreign)
foreign import _getUserByEmail 
  :: EffectFn2 
      FirebaseAuth 
      String 
      (Promise Foreign)
foreign import _getUserByPhoneNumber 
  :: EffectFn2 
      FirebaseAuth 
      String 
      (Promise Foreign)

foreign import _listUsers 
  :: EffectFn3
        FirebaseAuth 
        Int 
        String 
        (Promise Foreign)
 
foreign import __listUsers 
  :: EffectFn1
        FirebaseAuth 
        (Promise Foreign)
 
foreign import _verifyIdToken
  :: EffectFn3
      FirebaseAuth 
      String 
      Boolean
      (Promise Foreign)

foreign import _createCustomToken
  :: forall r. EffectFn3
      FirebaseAuth 
      String 
      (Record r)
      (Promise String)

foreign import __createCustomToken
  :: EffectFn2
      FirebaseAuth 
      String 
      (Promise String)

foreign import _createSessionCookie
  :: EffectFn3
      FirebaseAuth 
      String 
      SessionCookieOptions
      (Promise String)

foreign import __generateEmailVerificationLink
  :: EffectFn2
      FirebaseAuth
      String 
      (Promise String)

foreign import _generateEmailVerificationLink
  :: EffectFn3
      FirebaseAuth
      String 
      Foreign
      (Promise String)


foreign import __generatePasswordResetLink
  :: EffectFn2
      FirebaseAuth
      String 
      (Promise String)

foreign import _generatePasswordResetLink
  :: EffectFn3
      FirebaseAuth
      String 
      Foreign
      (Promise String)

foreign import _generateSignInWithEmailLink
  :: EffectFn3
      FirebaseAuth
      String 
      Foreign
      (Promise String)

foreign import _revokeRefreshTokens
  :: EffectFn2
      FirebaseAuth
      String 
      (Promise Unit)

foreign import _setCustomUserClaims
  :: EffectFn3
      FirebaseAuth
      String 
      Foreign
      (Promise Unit)

foreign import _deleteCustomUserClaims
  :: EffectFn2
      FirebaseAuth
      String 
      (Promise Unit)

foreign import _verifySessionCookie
  :: EffectFn3
      FirebaseAuth
      String 
      Boolean
      (Promise Foreign)
