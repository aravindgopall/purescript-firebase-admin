'use strict';


function _listUsers(auth, maxResults, pageToken) {
  return auth.listUsers(maxResults, pageToken);
}

exports._createUser = function (auth, properties) {
  return auth.createUser(properties);
}

exports._deleteUser = function (auth, uid) {
  return auth.deleteUser(uid);
}

exports._updateUser = function (auth, uid, properties) {
  return auth.updateUser(uid, properties);
}

exports._getUser = function (auth, uid) {
  return auth.getUser(uid);
}

exports._getUserByEmail = function (auth, email) {
  return auth.getUserByEmail(email);
}

exports._getUserByPhoneNumber = function (auth, phoneNumber) {
  return auth.getUserByPhoneNumber(phoneNumber);
}

exports._listUsers = _listUsers;

exports.__listUsers = function (auth) {
  return _listUsers(auth);
}

exports._verifyIdToken = function (auth, idToken, checkRevoked) {
  return auth.verifyIdToken(idToken, checkRevoked);
}

exports._createCustomToken = function (auth, uid, developerClaims) {
  return auth.createCustomToken(uid, developerClaims);
}

exports.__createCustomToken = function (auth, uid) {
  return auth.createCustomToken(uid);
}

exports._createSessionCookie = function (auth, idToken, sessionCookieOptions) {
  return auth.createSessionCookie(idToken, sessionCookieOptions);
}

exports.__generateEmailVerificationLink = function (auth, email) {
  return auth.generateEmailVerificationLink(email);
}

exports._generateEmailVerificationLink = function (auth, email, actionCodeSettings) {
  return auth.generateEmailVerificationLink(email, actionCodeSettings);
}

exports.__generatePasswordResetLink = function (auth, email) {
  return auth.generatePasswordResetLink(email);
}

exports._generatePasswordResetLink = function (auth, email, actionCodeSettings) {
  return auth.generatePasswordResetLink(email, actionCodeSettings);
}

exports._generateSignInWithEmailLink = function (auth, email, actionCodeSettings) {
  return auth.generateSignInWithEmailLink(email, actionCodeSettings);
}

exports._revokeRefreshTokens = function (auth, uid) {
  return auth.revokeRefreshTokens(uid);
}

exports._setCustomUserClaims = function (auth, uid, customUserClaims) {
  return auth.setCustomUserClaims(uid, customUserClaims);
}

exports._deleteCustomUserClaims = function (auth, uid) {
  return auth.setCustomUserClaims(uid, null);
}

exports._verifySessionCookie = function (auth, sessionCookie, checkRevoked) {
  return auth.verifySessionCookie(sessionCookie, checkRevoked);
}
