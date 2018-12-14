## Module Firebase.Admin.Auth


### Re-exported from Firebase.Admin.Auth.ImportUser:

#### `UserImportResult`

``` purescript
type UserImportResult = { failureCount :: Number, successCount :: Number, errors :: Array FirebaseArrayIndexError }
```

#### `UserImportRecord_r`

``` purescript
type UserImportRecord_r = (uid :: String, displayName :: String, email :: String, emailVerified :: Boolean, phoneNumber :: String, photoURL :: String, disabled :: Boolean, metadata :: UserMetadata, providerData :: Array UserInfo, passwordHash :: Buffer, passwordSalt :: Buffer)
```

#### `UserImportRecord`

``` purescript
type UserImportRecord = {  | UserImportRecord_r }
```

#### `UserImportOptions`

``` purescript
type UserImportOptions = { hash :: UserImportHashOptions }
```

User import options for bulk account imports. 

#### `UserImportHashOptions_r`

``` purescript
type UserImportHashOptions_r = (algorithm :: HashAlgorithmType, key :: Buffer, saltSeparator :: Buffer, rounds :: Number, memoryCost :: Number, parallelization :: Number, blockSize :: Number, derivedKeyLength :: Number)
```

#### `UserImportHashOptions`

``` purescript
type UserImportHashOptions = {  | UserImportHashOptions_r }
```

#### `HashAlgorithmType`

``` purescript
data HashAlgorithmType
```

Firebase Auth supported hashing algorithms for import operations.

#### `importUsers'`

``` purescript
importUsers' :: forall u1 u2 u3. Union (uid :: String) u1 u2 => Union u2 u3 UserImportRecord_r => FirebaseAuth -> (Array ({  | u2 })) -> Aff UserImportResult
```

Imports the list of users provided to Firebase Auth without options

#### `importUsers`

``` purescript
importUsers :: forall u1 u2 u3 ho1 ho2. Union (uid :: String) u1 u2 => Union u2 u3 UserImportRecord_r => Union ho1 ho2 UserImportHashOptions_r => FirebaseAuth -> (Array ({  | u2 })) -> ({ hash :: {  | ho1 } }) -> Aff UserImportResult
```

Imports the list of users provided to Firebase Auth. This is useful when
migrating from an external authentication system without having to use the Firebase CLI SDK.
At most, 1000 users are allowed to be imported one at a time.
When importing a list of password users, UserImportOptions are required to be specified.

### Re-exported from Firebase.Admin.Auth.Internal:

#### `updateUser`

``` purescript
updateUser :: forall r1 r2. Union r1 r2 UpdateRequest_r => FirebaseAuth -> String -> {  | r1 } -> Aff UserRecord
```

Updates an existing user.

#### `listUsers'`

``` purescript
listUsers' :: FirebaseAuth -> Aff ListUsersResult
```

Retrieves a list of users (single batch only) from beginning, with maximum 1000 results

#### `listUsers`

``` purescript
listUsers :: FirebaseAuth -> Int -> String -> Aff ListUsersResult
```

Retrieves a list of users (single batch only) with a size of maxResults and starting from the offset as specified by pageToken. This is used to retrieve all the users of a specified project in batches.

#### `listFirstUsers`

``` purescript
listFirstUsers :: FirebaseAuth -> Int -> Aff ListUsersResult
```

Retrieves a list of users (single batch only) from beginning with page size

#### `getUserByPhoneNumber`

``` purescript
getUserByPhoneNumber :: FirebaseAuth -> String -> Aff UserRecord
```

Gets the user data for the user corresponding to a given phone number. The phone number has to conform to the E.164 specification.

#### `getUserByEmail`

``` purescript
getUserByEmail :: FirebaseAuth -> String -> Aff UserRecord
```

Gets the user data for the user corresponding to a given email.

#### `getUser`

``` purescript
getUser :: FirebaseAuth -> String -> Aff UserRecord
```

Gets the user data for the user corresponding to a given uid.

#### `deleteUser`

``` purescript
deleteUser :: FirebaseAuth -> String -> Aff Unit
```

Deletes an existing user.

#### `createUser`

``` purescript
createUser :: forall r1 r2. Union r1 r2 CreateRequest_r => FirebaseAuth -> {  | r1 } -> Aff UserRecord
```

Creates a new user.

### Re-exported from Firebase.Admin.Auth.Types:

#### `UserRecord`

``` purescript
type UserRecord = { uid :: String, displayName :: String, email :: String, emailVerified :: Boolean, phoneNumber :: String, photoURL :: String, disabled :: Boolean, metadata :: UserMetadata, providerData :: Array UserInfo, passwordHash :: Maybe String, passwordSalt :: Maybe String, tokensValidAfterTime :: Maybe String }
```

#### `UserMetadata`

``` purescript
type UserMetadata = { creationTime :: String, lastSignInTime :: String }
```

#### `UserInfo`

``` purescript
type UserInfo = { uid :: String, displayName :: String, email :: String, photoURL :: String, providerId :: String, phoneNumber :: String }
```

User info class that provides provider user information for different Firebase providers like google.com, facebook.com, password, etc.

#### `UpdateRequest_r`

``` purescript
type UpdateRequest_r = (displayName :: String, email :: String, emailVerified :: Boolean, phoneNumber :: String, photoURL :: String, disabled :: Boolean, password :: String)
```

#### `UpdateRequest`

``` purescript
type UpdateRequest = {  | UpdateRequest_r }
```

Parameters for update user operation 

#### `ListUsersResult`

``` purescript
type ListUsersResult = { pageToken :: Maybe String, users :: Array UserRecord }
```

#### `FirebaseAuth`

``` purescript
data FirebaseAuth :: Type
```

#### `CreateRequest_r`

``` purescript
type CreateRequest_r = (uid :: String | UpdateRequest_r)
```

#### `CreateRequest`

``` purescript
type CreateRequest = {  | CreateRequest_r }
```

Parameters for create user operation 

