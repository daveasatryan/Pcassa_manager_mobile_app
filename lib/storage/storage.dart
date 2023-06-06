import 'package:secure_shared_preferences/secure_shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Cleare Storage
class StorageUtil {
  static Future<void> clearStorage() async {
    final prefs = await SecureSharedPref.getInstance();
    await prefs.clearAll();
  }
}
