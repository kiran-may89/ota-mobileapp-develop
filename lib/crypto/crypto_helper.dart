import 'dart:convert';
import 'package:crypto/crypto.dart' as crypt;
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart' as Key;
import 'package:encrypt/encrypt.dart';

String _getSha256Timestamp(String timeStamp) {
  // step 1 -> get timestamp (milliseconds since epoch - jan 1 1970)


  // step2 -> compute the sha256 for the above timeStamp
  var timeStampBytes = utf8.encode(timeStamp);
  var timeStampHash = sha256.convert(timeStampBytes);
  // step3 -> convert the timeStampHash bytes to base64 and return it.
  var timeStampBase64 = base64.encode(timeStampHash.bytes);
  return timeStampBase64;
}


List<int> getKeyForEncryptionOrDecryption(String authorizationToken,String timeStamp) {
  var tStampB64 = _getSha256Timestamp(timeStamp);
  // Step 1 -> concat the base64 of timestamp sha256 to authorization token
  var baseForKeyGeneration = authorizationToken + tStampB64;
  // Step 2 -> compute the sha256 hash for above concatenated string
  var baseForKeyGenerationBytes = utf8.encode(baseForKeyGeneration);
  var baseForKeyGenerationSha256 = sha256.convert(baseForKeyGenerationBytes);
  return baseForKeyGenerationSha256.bytes;
}

// encrypt function
String doEncrypt(String plainText, String authorizationToken,String timeStamp) {
  // Step 1 -> get key for encryption

  var keyBytes = getKeyForEncryptionOrDecryption(authorizationToken,timeStamp.toString());
  // this should be exactly 32 bytes - if not there is something wrong with the library
  print(keyBytes.length);
  // extract the first 16 bytes to form iv
  var ivBytes = keyBytes.sublist(0, 16);
  var key = encrypt.Key.fromBase64(base64.encode(keyBytes));
  var iv = encrypt.IV.fromBase64(base64.encode(ivBytes));
  // Step 2 -> prepare the aes encrypter
  var encrypter =
  encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
  // Step 3 -> encrypt the plainText
  var encryptedData = encrypter.encrypt(plainText, iv: iv);
  return encryptedData.base64;
}

// decrypt function
String doDecrypt(String encryptedText, String authorizationToken,String timeStamp) {
  // Step 1 -> get key for encryption
  var keyBytes = getKeyForEncryptionOrDecryption(authorizationToken,timeStamp);
  var ivBytes = keyBytes.sublist(0, 16);
  var key = encrypt.Key.fromBase64(base64.encode(keyBytes));
  var iv = encrypt.IV.fromBase64(base64.encode(ivBytes));
  // Step 2 -> prepare the aes encrypter
  var decrypter =
  encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
  // Step 3 -> encrypt the plainText
  var decryptedData  = decrypter.decrypt(encrypt.Encrypted.fromBase64(encryptedText), iv: iv);
  return decryptedData;
}