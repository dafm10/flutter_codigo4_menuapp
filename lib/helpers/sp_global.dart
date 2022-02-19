
import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal{

  static final SPGlobal _instance = SPGlobal._();

  SPGlobal._();

  factory SPGlobal(){
    return _instance;
  }

  late SharedPreferences _prefs;

  Future initShared() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // cambiamos a los valores que queremmos almacenar
  set isAdmin(bool value){
    _prefs.setBool("isAdmin", value);
  }

  bool get isAdmin{
    return _prefs.getBool("isAdmin") ?? false;
  }

  set isCustomer(bool value){
    _prefs.setBool("isCustomer", value);
  }

  bool get isCustomer{
    return _prefs.getBool("isCustomer") ?? false;
  }

}