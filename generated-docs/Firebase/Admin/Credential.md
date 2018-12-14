## Module Firebase.Admin.Credential

#### `Certificate`

``` purescript
type Certificate = { projectId :: String, privateKey :: String, clientEmail :: String }
```

#### `RefreshToken`

``` purescript
type RefreshToken = { clientId :: String, clientSecret :: String, refreshToken :: String, "type" :: String }
```

#### `credentialCertPath`

``` purescript
credentialCertPath :: Path -> Aff Credential
```

Returns an unsafe Aff Credential created from the provided service account that grants admin access to Firebase services.

#### `credentialCertPath'`

``` purescript
credentialCertPath' :: Path -> Effect (Either AppError Credential)
```

Returns a credential created from the provided service account that grants admin access to Firebase services.

#### `credentialCert`

``` purescript
credentialCert :: Certificate -> Aff Credential
```

Returns an unsafe Aff Credential created from the provided service account that grants admin access to Firebase services.

#### `credentialCert'`

``` purescript
credentialCert' :: Certificate -> Either AppError Credential
```

Returns a credential created from the provided service account that grants admin access to Firebase services.

#### `credentialRefreshTokenPath`

``` purescript
credentialRefreshTokenPath :: Path -> Aff Credential
```

Returns an unsafe Aff credential created from the provided refresh token that grants admin access to Firebase services.

#### `credentialRefreshTokenPath'`

``` purescript
credentialRefreshTokenPath' :: Path -> Effect (Either AppError Credential)
```

Returns a credential created from the provided refresh token that grants admin access to Firebase services.

#### `credentialRefreshToken`

``` purescript
credentialRefreshToken :: RefreshToken -> Aff Credential
```

Returns an unsafe Aff Credential created from the provided refresh token that grants admin access to Firebase services.

#### `credentialRefreshToken'`

``` purescript
credentialRefreshToken' :: RefreshToken -> Either AppError Credential
```

Returns a credential created from the provided refresh token that grants admin access to Firebase services.

#### `credentialDefault`

``` purescript
credentialDefault :: Aff Credential
```

Returns an unsafe Aff Credential created from the Google Application Default Credentials that grants admin access to Firebase services. This credential can be used in the call to initializeDefaultApp.

#### `credentialDefault'`

``` purescript
credentialDefault' :: Effect (Either AppError Credential)
```

Returns a credential created from the Google Application Default Credentials that grants admin access to Firebase services. This credential can be used in the call to initializeDefaultApp.


