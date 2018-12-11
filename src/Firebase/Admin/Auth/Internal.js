'use strict';


function _listUsers(auth, maxResults, pageToken, nothing, just) {
  return auth.listUsers(maxResults, pageToken)
    .then(function (result) {
      return {
        users: result.users,
        nextPageToken: result.nextPageToken 
          ? just(result.nextPageToken) : nothing()
      };
    });
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

exports.__listUsers = function (auth, nothing, just) {
  return _listUsers(auth, undefined, undefined, nothing, just);
}

exports._ListFirstUsers = function (auth, maxResults) {
  return _listUsers(auth, maxResults, undefined, nothing, just);
}

