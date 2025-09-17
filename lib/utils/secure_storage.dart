import 'package:flutter_secure_storage/flutter_secure_storage.dart';  

class SecureStorage {  
  final _storage =  FlutterSecureStorage(aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ) );  
  final String authKey = "AUTHKEY"; 
  final String xapiKey = "X-APIKEY";  
  final String mail = "EMAILID";

  Future<void> setAuthKey(String value) async {  
    try {  
      await _storage.write(key: authKey, value:value);  
 
    } catch (e) {  
    }  
  }  
    Future<void> setXApiKey(String value) async {  
    try {  
      await _storage.write(key: xapiKey, value: value);  
 
    } catch (e) {  
    }  
  } 
      Future<void> setMail(String value) async {  
    try {  
      await _storage.write(key: mail, value: value);  
 
    } catch (e) {  
    }  
  } 

  Future<String?> getAuthKey() async {  
    try {  
      return await _storage.read(key: authKey);  
    } catch (e) {  
      return null;  
    }  
  }  
    Future<String?> getXApiKey() async {  
    try {  
      return await _storage.read(key: xapiKey);  
    } catch (e) {  
      return null;  
    }  
  }  
      Future<String?> getMail() async {  
    try {  
      return await _storage.read(key: mail);  
    } catch (e) {  
      return null;  
    }  
  } 

  Future<void> clearStorage() async {  
    try {  
      await _storage.deleteAll();  
   
    } catch (e) {  
    }  
  }  
}