## Module Firebase.Admin.Utils

#### `liftEitherEffect`

``` purescript
liftEitherEffect :: forall e a m. MonadEffect m => Effect (Either e a) -> m a
```

#### `liftEiher`

``` purescript
liftEiher :: forall m e a. Monad m => Either e a -> m a
```


