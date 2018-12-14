## Module Firebase.Admin.Auth.Error

#### `AuthErrorCode`

``` purescript
data AuthErrorCode
  = ClaimsTooLarge
  | IdTokenExpired
  | InvalidArgument
  | EmailAlreadyExists
  | ForbiddenClaim
  | InvalidIdToken
  | IdTokenRevoked
  | InternalError
  | InvalidClaims
  | InvalidContinueURI
  | InvalidCreationTime
  | InvalidCredential
  | InvalidDisabledField
  | InvalidDisplayName
  | InvalidDynamicLinkDomain
  | InvalidEmailVerified
  | InvalidEmail
  | InvalidHashAlgorithm
  | InvalidHashBlockSize
  | InvalidHashDerivedKeyLength
  | InvalidHashKey
  | InvalidHashMemoryCost
  | InvalidHashParallelization
  | InvalidHashRounds
  | InvalidHashSaltSeparator
  | InvalidLastSignInTime
  | InvalidPageToken
  | InvalidPassword
  | InvalidPasswordHash
  | InvalidPasswordSalt
  | InvalidPhoneNumber
  | InvalidPhotoURL
  | InvalidProviderData
  | InvalidProviderId
  | InvalidSessionCookieDuration
  | InvalidUID
  | InvalidUserImport
  | InvalidTokensValidAfterTime
  | MissingAndroidPackageName
  | MissingContinueURI
  | MissingIOSBundleId
  | MissingHashAlgorithrm
  | MaximumUserCountExceeded
  | MissingUID
  | OperationNotAllow
  | PhoneNumberAlreadyExists
  | ProjectNotFound
  | InsufficientPermission
  | SessionCookieRevoked
  | UIDAlreadyExists
  | AuthorizedDomain
  | UserNotFound
  | UnknownAuthError
```

Auth client error code

##### Instances
``` purescript
Show AuthErrorCode
```

#### `AuthError`

``` purescript
data AuthError
  = AuthError { code :: AuthErrorCode, message :: String }
```

Auth client error

##### Instances
``` purescript
Show AuthError
```

#### `authError`

``` purescript
authError :: { code :: String, message :: String } -> AuthError
```

Create Auth Error from FirebaseError

#### `authErrorCode`

``` purescript
authErrorCode :: String -> AuthErrorCode
```

Create Auth Error Code from string


