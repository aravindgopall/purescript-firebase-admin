## Module Firebase.Admin

#### `initializeDefaultApp`

``` purescript
initializeDefaultApp :: Aff Firebase
```

Initializes the FirebaseApp instance. The SDK uses Google Application Default Credentials and reads options from the FIREBASE_CONFIG environment variable. Return Aff 

#### `initializeDefaultApp'`

``` purescript
initializeDefaultApp' :: Effect (Either AppError Firebase)
```

Initializes the FirebaseApp instance. The SDK uses Google Application Default Credentials and reads options from the FIREBASE_CONFIG environment variable.

#### `initializeApp`

``` purescript
initializeApp :: forall o1 o2 o3. Union (credential :: Credential) o1 o2 => Union o2 o3 FirebaseAppOptions_r => {  | o2 } -> String -> Aff Firebase
```

Initializes the FirebaseApp instance with name and options. Return Aff

#### `initializeApp'`

``` purescript
initializeApp' :: forall o1 o2 o3. Union (credential :: Credential) o1 o2 => Union o2 o3 FirebaseAppOptions_r => {  | o2 } -> String -> Either AppError Firebase
```

Initializes the FirebaseApp instance with name and options

#### `getAppName`

``` purescript
getAppName :: Firebase -> Aff String
```

Returns unsafe name of the FirebaseApp instance as Aff.

#### `getAppOptions`

``` purescript
getAppOptions :: Firebase -> Aff FirebaseAppOptions
```

Returns unsafe Aff options for the FirebaseApp instance

#### `deleteApp`

``` purescript
deleteApp :: Firebase -> Aff Unit
```

Deletes the FirebaseApp instance.

#### `firebaseApp`

``` purescript
firebaseApp :: String -> Aff Firebase
```

Returns unsafe Aff FirebaseApp instance with the provided name.

#### `firebaseApp'`

``` purescript
firebaseApp' :: String -> Either AppError Firebase
```

Returns the FirebaseApp instance with the provided name.

#### `firebaseAuth`

``` purescript
firebaseAuth :: Firebase -> FirebaseAuth
```

Gets the `Auth` service namespace from explicitly specified app.


### Re-exported from Firebase.Admin.Error:

#### `FirebaseError`

``` purescript
type FirebaseError = { code :: String, message :: String }
```

#### `AppErrorCode`

``` purescript
data AppErrorCode
  = AppDeleted
  | DuplicateApp
  | InternalError
  | InvalidAppName
  | InvalidAppOptions
  | InvalidCredential
  | NetworkError
  | NetworkTimeout
  | NoApp
  | UnableToParseResponse
  | UnknownAppError
```

App client error codes and their default messages.  

##### Instances
``` purescript
Show AppErrorCode
```

#### `AppError`

``` purescript
data AppError
  = AppError { code :: AppErrorCode, message :: String }
```

App client error

##### Instances
``` purescript
Show AppError
```

#### `appErrorCode`

``` purescript
appErrorCode :: String -> AppErrorCode
```

Create App Error Code from string

#### `appError`

``` purescript
appError :: FirebaseError -> AppError
```

Create App Error from FirebaseError

### Re-exported from Firebase.Admin.Types:

#### `FirebaseAppOptions_r`

``` purescript
type FirebaseAppOptions_r = (credential :: Credential, databaseURL :: String, serviceAccountId :: String, storageBucket :: String, projectId :: String)
```

#### `FirebaseAppOptions`

``` purescript
type FirebaseAppOptions = {  | FirebaseAppOptions_r }
```

#### `Firebase`

``` purescript
data Firebase :: Type
```

#### `Credential`

``` purescript
data Credential :: Type
```

#### `firebaseConfigVar`

``` purescript
firebaseConfigVar :: String
```

#### `defaultAppName`

``` purescript
defaultAppName :: String
```

