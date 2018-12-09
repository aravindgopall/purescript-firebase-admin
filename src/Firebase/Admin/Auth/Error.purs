module Firebase.Admin.Auth.Error where

import Prelude
-- | Auth client error code
data AuthErrorCode 
  = ClaimsTooLarge  
  | IdTokenExpired 
  | InvalidArgument
  | EmailAlreadyExists
  | ForbiddenClaim
  | InvalidIdToken
  | IdTokenRevoked 
  | InternalError
  | InvalidClaims
  | InvalidContinueURI
  | InvalidCreationTime
  | InvalidCredential
  | InvalidDisabledField 
  | InvalidDisplayName
  | InvalidDynamicLinkDomain 
  | InvalidEmailVerified
  | InvalidEmail 
  | InvalidHashAlgorithm 
  | InvalidHashBlockSize 
  | InvalidHashDerivedKeyLength
  | InvalidHashKey 
  | InvalidHashMemoryCost 
  | InvalidHashParallelization 
  | InvalidHashRounds 
  | InvalidHashSaltSeparator
  | InvalidLastSignInTime 
  | InvalidPageToken 
  | InvalidPassword 
  | InvalidPasswordHash
  | InvalidPasswordSalt 
  | InvalidPhoneNumber 
  | InvalidPhotoURL 
  | InvalidProviderData 
  | InvalidProviderId 
  | InvalidSessionCookieDuration 
  | InvalidUID 
  | InvalidUserImport 
  | InvalidTokensValidAfterTime 
  | MissingAndroidPackageName 
  | MissingContinueURI 
  | MissingIOSBundleId 
  | MissingHashAlgorithrm
  | MaximumUserCountExceeded 
  | MissingUID 
  | OperationNotAllow 
  | PhoneNumberAlreadyExists 
  | ProjectNotFound 
  | InsufficientPermission 
  | SessionCookieRevoked 
  | UIDAlreadyExists 
  | AuthorizedDomain 
  | UserNotFound 
  | UnknownAuthError

-- | Auth client error
data AuthError = AuthError 
  { code :: AuthErrorCode
  , message :: String 
  }

instance showAuthError :: Show AuthError where
  show (AuthError { code, message }) = show code <> " - " <> message

-- | Create Auth Error from FirebaseError
authError :: { code :: String, message :: String }  -> AuthError 
authError err = AuthError 
  { code: authErrorCode err.code 
  , message: err.message 
  } 

instance showAuthErrorCode :: Show AuthErrorCode where
  show ClaimsTooLarge = "auth/claims-too-large"
  show IdTokenExpired = "auth/id-token-expired"
  show InvalidArgument = "auth/argument-error"
  show EmailAlreadyExists = "auth/email-already-exists"
  show ForbiddenClaim = "auth/reserved-claim"
  show InvalidIdToken = "auth/invalid-id-token"
  show IdTokenRevoked = "auth/id-token-revoked"
  show InternalError = "auth/internal-error"
  show InvalidClaims = "auth/invalid-claims"
  show InvalidContinueURI = "auth/invalid-continue-uri"
  show InvalidCreationTime = "auth/invalid-creation-time"
  show InvalidCredential = "auth/invalid-credential"
  show InvalidDisabledField = "auth/invalid-disabled-field"
  show InvalidDisplayName = "auth/invalid-display-name"
  show InvalidDynamicLinkDomain = "auth/invalid-dynamic-link-domain"
  show InvalidEmailVerified = "auth/invalid-email-verified"
  show InvalidEmail = "auth/invalid-email"
  show InvalidHashAlgorithm = "auth/invalid-hash-algorithm"
  show InvalidHashBlockSize = "auth/invalid-hash-block-size"
  show InvalidHashDerivedKeyLength = "auth/invalid-hash-derived-key-length"
  show InvalidHashKey = "auth/invalid-hash-key"
  show InvalidHashMemoryCost = "auth/invalid-hash-memory-cost"
  show InvalidHashParallelization = "auth/invalid-hash-parallelization"
  show InvalidHashRounds = "auth/invalid-hash-rounds"
  show InvalidHashSaltSeparator = "auth/invalid-hash-salt-separator"
  show InvalidLastSignInTime = "auth/invalid-last-sign-in-time"
  show InvalidPageToken = "auth/invalid-page-token"
  show InvalidPassword = "auth/invalid-password"
  show InvalidPasswordHash = "auth/invalid-password-hash"
  show InvalidPasswordSalt = "auth/invalid-password-salt"
  show InvalidPhoneNumber = "auth/invalid-phone-number"
  show InvalidPhotoURL = "auth/invalid-photo-url"
  show InvalidProviderData = "auth/invalid-provider-data"
  show InvalidProviderId = "auth/invalid-provider-id"
  show InvalidSessionCookieDuration = "auth/invalid-session-cookie-duration"
  show InvalidUID = "auth/invalid-uid"
  show InvalidUserImport = "auth/invalid-user-import"
  show InvalidTokensValidAfterTime = "auth/invalid-tokens-valid-after-time"
  show MissingAndroidPackageName = "auth/missing-android-pkg-name"
  show MissingContinueURI = "auth/missing-continue-uri"
  show MissingIOSBundleId = "auth/missing-ios-bundle-id"
  show MissingHashAlgorithrm = "auth/missing-hash-algorithm"
  show MaximumUserCountExceeded = "auth/maximum-user-count-exceeded"
  show MissingUID = "auth/missing-uid"
  show OperationNotAllow = "auth/operation-not-allowed"
  show PhoneNumberAlreadyExists = "auth/phone-number-already-exists"
  show ProjectNotFound = "auth/project-not-found"
  show InsufficientPermission = "auth/insufficient-permission"
  show SessionCookieRevoked = "auth/session-cookie-revoked"
  show UIDAlreadyExists = "auth/uid-already-exists"
  show AuthorizedDomain = "auth/unauthorized-continue-uri"
  show UserNotFound = "auth/user-not-found"
  show UnknownAuthError = "auth/unknown-error"

-- | Create Auth Error Code from string
authErrorCode :: String -> AuthErrorCode
authErrorCode "auth/claims-too-large" = ClaimsTooLarge
authErrorCode "auth/id-token-expired" = IdTokenExpired
authErrorCode "auth/argument-error" = InvalidArgument
authErrorCode "auth/email-already-exists" = EmailAlreadyExists
authErrorCode "auth/reserved-claim" = ForbiddenClaim
authErrorCode "auth/invalid-id-token" = InvalidIdToken
authErrorCode "auth/id-token-revoked" = IdTokenRevoked
authErrorCode "auth/internal-error" = InternalError
authErrorCode "auth/invalid-claims" = InvalidClaims
authErrorCode "auth/invalid-continue-uri" = InvalidContinueURI
authErrorCode "auth/invalid-creation-time" = InvalidCreationTime
authErrorCode "auth/invalid-credential" = InvalidCredential
authErrorCode "auth/invalid-disabled-field" = InvalidDisabledField
authErrorCode "auth/invalid-display-name" = InvalidDisplayName
authErrorCode "auth/invalid-dynamic-link-domain" = InvalidDynamicLinkDomain
authErrorCode "auth/invalid-email-verified" = InvalidEmailVerified
authErrorCode "auth/invalid-email" = InvalidEmail
authErrorCode "auth/invalid-hash-algorithm" = InvalidHashAlgorithm
authErrorCode "auth/invalid-hash-block-size" = InvalidHashBlockSize
authErrorCode "auth/invalid-hash-derived-key-length" = InvalidHashDerivedKeyLength
authErrorCode "auth/invalid-hash-key" = InvalidHashKey
authErrorCode "auth/invalid-hash-memory-cost" = InvalidHashMemoryCost
authErrorCode "auth/invalid-hash-parallelization" = InvalidHashParallelization
authErrorCode "auth/invalid-hash-rounds" = InvalidHashRounds
authErrorCode "auth/invalid-hash-salt-separator" = InvalidHashSaltSeparator
authErrorCode "auth/invalid-last-sign-in-time" = InvalidLastSignInTime
authErrorCode "auth/invalid-page-token" = InvalidPageToken
authErrorCode "auth/invalid-password" = InvalidPassword
authErrorCode "auth/invalid-password-hash" = InvalidPasswordHash
authErrorCode "auth/invalid-password-salt" = InvalidPasswordSalt
authErrorCode "auth/invalid-phone-number" = InvalidPhoneNumber
authErrorCode "auth/invalid-photo-url" = InvalidPhotoURL
authErrorCode "auth/invalid-provider-data" = InvalidProviderData
authErrorCode "auth/invalid-provider-id" = InvalidProviderId
authErrorCode "auth/invalid-session-cookie-duration" = InvalidSessionCookieDuration
authErrorCode "auth/invalid-uid" = InvalidUID
authErrorCode "auth/invalid-user-import" = InvalidUserImport
authErrorCode "auth/invalid-tokens-valid-after-time" = InvalidTokensValidAfterTime
authErrorCode "auth/missing-android-pkg-name" = MissingAndroidPackageName
authErrorCode "auth/missing-continue-uri" = MissingContinueURI
authErrorCode "auth/missing-ios-bundle-id" = MissingIOSBundleId
authErrorCode "auth/missing-hash-algorithm" = MissingHashAlgorithrm
authErrorCode "auth/maximum-user-count-exceeded" = MaximumUserCountExceeded
authErrorCode "auth/missing-uid" = MissingUID
authErrorCode "auth/operation-not-allowed" = OperationNotAllow
authErrorCode "auth/phone-number-already-exists" = PhoneNumberAlreadyExists
authErrorCode "auth/project-not-found" = ProjectNotFound
authErrorCode "auth/insufficient-permission" = InsufficientPermission
authErrorCode "auth/session-cookie-revoked" = SessionCookieRevoked
authErrorCode "auth/uid-already-exists" = UIDAlreadyExists
authErrorCode "auth/unauthorized-continue-uri" = AuthorizedDomain
authErrorCode "auth/user-not-found" = UserNotFound
authErrorCode _ = UnknownAuthError
