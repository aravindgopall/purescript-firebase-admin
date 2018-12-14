## Module Firebase.Admin.Auth.Internal

#### `createUser`

``` purescript
createUser :: forall r1 r2. Union r1 r2 CreateRequest_r => FirebaseAuth -> {  | r1 } -> Aff UserRecord
```

Creates a new user.

#### `deleteUser`

``` purescript
deleteUser :: FirebaseAuth -> String -> Aff Unit
```

Deletes an existing user.

#### `updateUser`

``` purescript
updateUser :: forall r1 r2. Union r1 r2 UpdateRequest_r => FirebaseAuth -> String -> {  | r1 } -> Aff UserRecord
```

Updates an existing user.

#### `getUser`

``` purescript
getUser :: FirebaseAuth -> String -> Aff UserRecord
```

Gets the user data for the user corresponding to a given uid.

#### `getUserByEmail`

``` purescript
getUserByEmail :: FirebaseAuth -> String -> Aff UserRecord
```

Gets the user data for the user corresponding to a given email.

#### `getUserByPhoneNumber`

``` purescript
getUserByPhoneNumber :: FirebaseAuth -> String -> Aff UserRecord
```

Gets the user data for the user corresponding to a given phone number. The phone number has to conform to the E.164 specification.

#### `listUsers`

``` purescript
listUsers :: FirebaseAuth -> Int -> String -> Aff ListUsersResult
```

Retrieves a list of users (single batch only) with a size of maxResults and starting from the offset as specified by pageToken. This is used to retrieve all the users of a specified project in batches.

#### `listUsers'`

``` purescript
listUsers' :: FirebaseAuth -> Aff ListUsersResult
```

Retrieves a list of users (single batch only) from beginning, with maximum 1000 results

#### `listFirstUsers`

``` purescript
listFirstUsers :: FirebaseAuth -> Int -> Aff ListUsersResult
```

Retrieves a list of users (single batch only) from beginning with page size


