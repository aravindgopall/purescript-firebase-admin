exports._defaultBucket = function (storage) {
  return storage.bucket();
}

exports._bucket = function (storage, bucketName) {
  return storage.bucket(bucketName);
}
