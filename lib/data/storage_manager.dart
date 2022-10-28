import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/login_model.dart';

class StorageManager {
  final storage =LocalStorage('local_data.json');

  Future<bool> ensureStorageReady() async {
    return await storage.ready;
  }

  Future<LoginModel?> getLoginState() async {
    try {
      bool isStorageReady = await storage.ready;
      debugPrint('storage ready? $isStorageReady');
      if (isStorageReady){
        Map<String, dynamic> data = storage.getItem('auth_result');
        LoginModel auth = LoginModel.fromJson(data);
        debugPrint('Already Login');
        return auth;
      } else {
        return null;
      }
    } catch(e) {
      debugPrint('error get login state: $e');
      return null;
    }
  }

  Future saveAuthResponse(LoginModel? loginModel) async {
    try {
      bool isStorageReady = await storage.ready;
      if(isStorageReady) {
        await storage.setItem('auth_result', loginModel?.toJson());
      }
    }catch (e) {
      debugPrint('error save login state : $e');
    }
  }

  Future deleteAuthResponse() async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.deleteItem('auth_result');
      }
    } catch (e) {
      debugPrint('error save login state: $e');
    }
  }

  String? getAccessToken() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      return auth.data?.token;
    } catch (e) {
      debugPrint("Error while load access token: $e");
      return null;
    }
  }

  String? getCurrentUserId() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      return auth.data?.user?.id.toString();
    } catch (e) {
      debugPrint("Error while load user_id: $e");
      return 'user_id_not_loaded';
    }
  }

  String? getCurrentUsername() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      print(auth.data?.user?.name);
      print(auth.data?.token);
      return auth.data?.user?.name.toString();
    } catch (e) {
      debugPrint("Error while load user_name: $e");
      return 'User';
    }
  }

  Future saveObject(dynamic object, String key) async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.setItem(key, object);
      }
    } catch (e) {
      debugPrint('error save$key : $e');
      rethrow;
    }
  }

  Future removeObject(String key) async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.deleteItem(key);
      }
    } catch (e) {
      debugPrint('error removing$key : $e');
      rethrow;
    }
  }


  /// JAngAN GANTI

  static Future<bool?> getIsOpen() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("is_open")) {
      return prefs.getBool("is_open");
    }
    return null;
  }

  static void setIsOpen(bool isOpen) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("is_open", isOpen);
  }

  static Future<bool> isfirstOpen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("is_open");
  }

}





// import 'package:shared_preferences/shared_preferences.dart';
//
// class StorageManager {
//   static Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (prefs.containsKey("token")) {
//       return prefs.getString("token");
//     }
//     return null;
//   }
//
//   static void setToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString("token", token);
//   }
//
//   static Future<String?> getLoggedName() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (prefs.containsKey("name")) {
//       return prefs.getString("name");
//     }
//     return null;
//   }
//
//   static void setLoggedName(String name) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString("name", name);
//   }
//
//   static void deleteToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.remove("token");
//   }
//
//   static Future<bool?> getIsOpen() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (prefs.containsKey("is_open")) {
//       return prefs.getBool("is_open");
//     }
//     return null;
//   }
//
//   static void setIsOpen(bool isOpen) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool("is_open", isOpen);
//   }
//
//   static Future<bool> isfirstOpen() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.containsKey("is_open");
//   }
// }
