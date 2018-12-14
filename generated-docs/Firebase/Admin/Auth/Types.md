## Module Firebase.Admin.Auth.Types

#### `FirebaseAuth`

``` purescript
data FirebaseAuth :: Type
```

#### `UpdateRequest_r`

``` purescript
type UpdateRequest_r = (displayName :: String, email :: String, emailVerified :: Boolean, phoneNumber :: String, photoURL :: String, disabled :: Boolean, password :: String)
```

#### `UpdateRequest`

``` purescript
type UpdateRequest = {  | UpdateRequest_r }
```

Parameters for update user operation 

#### `CreateRequest_r`

``` purescript
type CreateRequest_r = (uid :: String | UpdateRequest_r)
```

#### `CreateRequest`

``` purescript
type CreateRequest = {  | CreateRequest_r }
```

Parameters for create user operation 

#### `UserMetadata`

``` purescript
type UserMetadata = { creationTime :: String, lastSignInTime :: String }
```

#### `UserInfo`

``` purescript
type UserInfo = { uid :: String, displayName :: String, email :: String, photoURL :: String, providerId :: String, phoneNumber :: String }
```

User info class that provides provider user information for different Firebase providers like google.com, facebook.com, password, etc.

#### `UserRecord`

``` purescript
type UserRecord = { uid :: String, displayName :: String, email :: String, emailVerified :: Boolean, phoneNumber :: String, photoURL :: String, disabled :: Boolean, metadata :: UserMetadata, providerData :: Array UserInfo, passwordHash :: Maybe String, passwordSalt :: Maybe String, tokensValidAfterTime :: Maybe String }
```

#### `ListUsersResult`

``` purescript
type ListUsersResult = { pageToken :: Maybe String, users :: Array UserRecord }
```


