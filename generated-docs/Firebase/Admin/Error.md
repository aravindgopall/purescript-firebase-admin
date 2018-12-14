## Module Firebase.Admin.Error

#### `FirebaseError`

``` purescript
type FirebaseError = { code :: String, message :: String }
```

#### `FirebaseArrayIndexError`

``` purescript
type FirebaseArrayIndexError = { index :: Number, error :: FirebaseError }
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

#### `appError`

``` purescript
appError :: FirebaseError -> AppError
```

Create App Error from FirebaseError

#### `appErrorCode`

``` purescript
appErrorCode :: String -> AppErrorCode
```

Create App Error Code from string


