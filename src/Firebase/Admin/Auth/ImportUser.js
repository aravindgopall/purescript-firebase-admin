'use strict';

exports.importUsersImpl = function (auth, records, options) {
  return function () {
    return auth.importUsers(records, options);
  }
}

exports.importUsersImpl_ = function (auth, records) {
  return function () {
    return auth.importUsers(records);
  }
}
