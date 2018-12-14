## Module Firebase.Admin.Auth.ImportUser

#### `HashAlgorithmType`

``` purescript
data HashAlgorithmType
```

Firebase Auth supported hashing algorithms for import operations.

#### `UserImportHashOptions`

``` purescript
type UserImportHashOptions = {  | UserImportHashOptions_r }
```

#### `UserImportOptions`

``` purescript
type UserImportOptions = { hash :: UserImportHashOptions }
```

User import options for bulk account imports. 

#### `UserImportRecord`

``` purescript
type UserImportRecord = {  | UserImportRecord_r }
```

#### `UserImportResult`

``` purescript
type UserImportResult = { failureCount :: Number, successCount :: Number, errors :: Array FirebaseArrayIndexError }
```

#### `UserImportHashOptions_r`

``` purescript
type UserImportHashOptions_r = (algorithm :: HashAlgorithmType, key :: Buffer, saltSeparator :: Buffer, rounds :: Number, memoryCost :: Number, parallelization :: Number, blockSize :: Number, derivedKeyLength :: Number)
```

#### `UserImportRecord_r`

``` purescript
type UserImportRecord_r = (uid :: String, displayName :: String, email :: String, emailVerified :: Boolean, phoneNumber :: String, photoURL :: String, disabled :: Boolean, metadata :: UserMetadata, providerData :: Array UserInfo, passwordHash :: Buffer, passwordSalt :: Buffer)
```

#### `importUsers`

``` purescript
importUsers :: forall u1 u2 u3 ho1 ho2. Union (uid :: String) u1 u2 => Union u2 u3 UserImportRecord_r => Union ho1 ho2 UserImportHashOptions_r => FirebaseAuth -> (Array ({  | u2 })) -> ({ hash :: {  | ho1 } }) -> Aff UserImportResult
```

Imports the list of users provided to Firebase Auth. This is useful when
migrating from an external authentication system without having to use the Firebase CLI SDK.
At most, 1000 users are allowed to be imported one at a time.
When importing a list of password users, UserImportOptions are required to be specified.

#### `importUsers'`

``` purescript
importUsers' :: forall u1 u2 u3. Union (uid :: String) u1 u2 => Union u2 u3 UserImportRecord_r => FirebaseAuth -> (Array ({  | u2 })) -> Aff UserImportResult
```

Imports the list of users provided to Firebase Auth without options


