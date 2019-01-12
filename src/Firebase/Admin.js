'use strict';

const admin = require('firebase-admin');

exports.initializeDefaultAppImpl = function (left, right) {
  try {
    return right(admin.initializeApp());
  } catch (e) {
    return left(e.toJSON ? e.toJSON() : e);
  }
}

exports.initializeAppImpl = function (options, appName, right, left) {
  try {
    return right(admin.initializeApp(options, appName));
  } catch (e) {
    return left(e.toJSON ? e.toJSON() : e);
  }
}

exports.appImpl = function (appName, right, left) {
  try {
    return right(admin.app(appName));
  } catch (e) {
    return left(e.toJSON())
  }
}

exports.getAppNameImpl = function (app, right, left) {
  try {
    return right(app.name);
  } catch (e) {
    return left(e.toJSON())
  }
}

exports.getAppOptionsImpl = function (app, right, left) {
  try {
    return right(app.options);
  } catch (e) {
    return left(e.toJSON())
  }
}

exports.deleteAppImpl = function (app) {
  return app.delete();
}

exports.authImpl = function (firebaseApp) {
  return firebaseApp.auth();
}

exports.storageImpl = function (firebaseApp) {
  return firebaseApp.storage();
}
