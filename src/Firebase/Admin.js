'use strict';

const admin = require('firebase-admin');

exports.initializeDefaultAppImpl = function () {
  return admin.initializeApp();
}

exports.initializeAppImpl = function (options, appName, right, left) {
  try {
    return right(admin.initializeApp(options, appName));
  } catch (e) {
    return left(e.toJSON())
  }
}

exports.initializeAppImpl_ = function (options, right, left) {
  try {
    return right(admin.initializeApp(options));
  } catch (e) {
    return left(e.toJSON())
  }
}

exports.defaultAppImpl = function (right, left) {
  try {
    return right(admin.app());
  } catch (e) {
    return left(e.toJSON())
  }
}

exports.appImpl = function (appName, right, left) {
  try {
    return right(admin.app(appName));
  } catch (e) {
    return left(e.toJSON())
  }
}

exports.removeAppImpl = function (appName, left, right) {
  try {
    return right(admin.removeApp(appName));
  } catch (e) {
    return left(e.toJSON())
  }
}

exports.defaultAuthImpl = function (left, right) {
  try {
    return right(admin.auth());
  } catch (e) {
    return left(e.toJSON());
  }
}

exports.authImpl = function (firebaseApp) {
  return firebaseApp.auth();
}
