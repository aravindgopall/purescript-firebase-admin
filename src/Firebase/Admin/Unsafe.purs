module Firebase.Admin.Unsafe where

import Prelude

import Control.Monad.Except (runExcept)
import Data.Either (Either, fromRight)
import Effect (Effect)
import Effect.Class (class MonadEffect, liftEffect)
import Foreign (Foreign)
import Foreign.Class (class Decode, decode)
import Partial.Unsafe (unsafePartial)

-- Unsafely lift either effect to monad
liftEitherEffect :: forall e a m. MonadEffect m => Effect (Either e a) -> m a 
liftEitherEffect = liftEffect <<< map (unsafePartial fromRight)

-- Unsafely lift either to monad
liftEiher :: forall m e a. Monad m => Either e a -> m a 
liftEiher = pure <<< unsafePartial fromRight

unsafeDecodeForeign :: forall a. Decode a => Foreign -> a 
unsafeDecodeForeign = unsafePartial fromRight <<< runExcept <<< decode
