'use strict';

exports.importUsersImpl = function (auth, records, options) {
  return auth.importUsers(records, options);
}

exports.importUsersImpl_ = function (auth, records) {
  return auth.importUsers(records);
}
