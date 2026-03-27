import 'package:ecommercefrutes/core/utiles/app_enum.dart';
import 'package:ecommercefrutes/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefranceRepo {

SharedPreferences pref = prefs;

  //!--- Keys
  String PREF_FIRST_LUNCH = 'first_lunch';
  String PREF_IS_LOGGED = 'is_logged';
  String PREF_LOGGIN_INFO = 'loggin_info';
  String PREF_TOKEN_INFO = 'token_info';
  String PREF_APP_LANG = 'app_language';



  //First-Lunch(set)
   void setFirstLunch(bool value) {
    setPrefrnce(
      type: DataType.BOOL,
      key: PREF_FIRST_LUNCH,
      value: value,
    );
  }

  //First-Lunch(get)
 bool getFirstLunch() {
    if (pref.containsKey(PREF_FIRST_LUNCH))
      return getPrefrnce(PREF_FIRST_LUNCH);
    else
      return true;
  }
































    setPrefrnce({
    required DataType type,
    required String key,
    required dynamic value,
  }) async {
    switch (type) {
      case DataType.STRING:
        await prefs.setString(key, value);
        break;
      case DataType.INT:
        await prefs.setInt(key, value);
        break;
      case DataType.BOOL:
        await prefs.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await prefs.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await prefs.setStringList(key, value);
        break;
    }
  }
  dynamic getPrefrnce(String key) {
    return pref.get(key);
  }
}