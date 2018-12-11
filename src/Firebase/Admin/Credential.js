'use strict';
const admin = require('firebase-admin');

exports.credentialCertImpl = function (obj, right, left) {
  try {
    return right(admin.credential.cert({
      projectId: obj.projectId,
      privateKey: obj.privateKey.replace(/\\n/g, '\n'),
      clientEmail: obj.clientEmail
    }));
  } catch (e) {
    return left(e.toJSON())
  }
}

exports.credentialCertPathImpl = function (path, right, left) {
  try {
    return right(admin.credential.cert(path));
  } catch (e) {
    return left(e.toJSON())
  }
}


exports.credentialRefreshTokenImpl = function (obj, right, left) {
  try {
    return right(admin.credential.refreshToken(obj));
  } catch (e) {
    return left(e.toJSON())
  }
}

exports.credentialRefreshTokenPathImpl = function (path, right, left) {
  try {
    return right(admin.credential.refreshToken(path));
  } catch (e) {
    return left(e.toJSON())
  }
}

exports.credentialDefaultImpl = function () {
  return admin.credential.applicationDefault();
}
