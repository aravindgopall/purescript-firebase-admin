## Module Firebase.Admin.Types

#### `Firebase`

``` purescript
data Firebase :: Type
```

#### `Credential`

``` purescript
data Credential :: Type
```

#### `FirebaseAppOptions_r`

``` purescript
type FirebaseAppOptions_r = (credential :: Credential, databaseURL :: String, serviceAccountId :: String, storageBucket :: String, projectId :: String)
```

#### `FirebaseAppOptions`

``` purescript
type FirebaseAppOptions = {  | FirebaseAppOptions_r }
```

#### `defaultAppName`

``` purescript
defaultAppName :: String
```

#### `firebaseConfigVar`

``` purescript
firebaseConfigVar :: String
```


