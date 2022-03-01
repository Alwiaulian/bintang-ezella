import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FlutterNoSql extends Object {
  static bool _isInitial = false;
  static String _boxName = 'FlutterNoSqlMTA';
  static String _errorMessage = 'FlutterNoSql is not initial...\nplease call FlutterNoSql.initFlutter() before CURD data';


  static Future initFlutter() async {
    await Hive.initFlutter();
    await Hive.openBox('$_boxName');
    _isInitial = true;
  }

  static bool _checkInitial() {
    if (!_isInitial) print(_errorMessage);
    return _isInitial;
  }

  static saveToken(String token) async{
    if (_checkInitial() == false) return;
    var box = Hive.box('$_boxName');
    box.put('token', '$token');
  }

  static String getToken() {
    if (_checkInitial() == false) return null;
    var box = Hive.box('$_boxName');
    return box.get('token');
  }

  static void clearToken() {
    if (_checkInitial() == false) return null;
    var box = Hive.box('$_boxName');
    box.delete("token");
  }


  static saveJsonString({String key, String json}) async{
    assert(key != null && json != null);
    if (_checkInitial() == false) return;
    var box = Hive.box('$_boxName');
    box.put('$key', '$json');
  }

  static String getJsonString({String key}) {
    assert(key != null);
    if (_checkInitial() == false) return null;
    var box = Hive.box('$_boxName');
    String res = box.get('$key');
    return res;
  }

  static void clearJsonString({String key}) {
    if (_checkInitial() == false) return null;
    var box = Hive.box('$_boxName');
    box.delete('$key');
  }



  // static saveStartWorkingJsonString({String key, String json}) {
  //   assert(key != null && json != null);
  //   if (_checkInitial() == false) return;
  //   var box = Hive.box('$_boxName');
  //   box.put('$key', '$json');
  // }

  // static String getStartWorkingJsonString({String key}) {
  //   assert(key != null);
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   String res = box.get('$key');
  //   return res;
  // }

  // static void clearStartWorkingJsonString({String key}) async{
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   box.delete('$key');
  // }

  // static saveOperatorHomeJsonString({String key, String json}) {
  //   assert(key != null && json != null);
  //   if (_checkInitial() == false) return;
  //   var box = Hive.box('$_boxName');
  //   box.put('$key', '$json');
  // }

  // static String getOperatorHomeJsonString({String key}) {
  //   assert(key != null);
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   String res = box.get('$key');
  //   return res;
  // }

  // static void clearOperatorHomeJsonString({String key}) async{
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   box.delete('$key');
  // }

  // static saveUsernamePassword(String username, String password) async{
  //   if (_checkInitial() == false) return;
  //   var box = Hive.box('$_boxName');
  //   box.put('username', '$username');
  //   box.put('password', '$password');
  // }

  // static String getUsername(){
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   return box.get('username');
  // }

  // static String getPassword(){
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   return box.get('password');
  // }

  // static bool getIsRememberMe(){
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   return box.get('isRemember')==null?false:(box.get('isRemember')=='true');
  // }

  // static saveIsRememberMe(bool isRemember) async{
  //   if (_checkInitial() == false) return;
  //   var box = Hive.box('$_boxName');
  //   box.put('isRemember', '$isRemember');
  // }
  // static saveProjectId(int projectId) async{
  //   if (_checkInitial() == false) return;
  //   var box = Hive.box('$_boxName');
  //   box.put('projectId', '$projectId');
  // }
  // static int getProjectId(){
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   return int.parse(box.get('projectId'));
  // }

  // static void clearProjectId() {
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   box.delete("projectId");
  // }

  // static saveVersion(String version) async{
  //   if (_checkInitial() == false) return;
  //   var box = Hive.box('$_boxName');
  //   box.put('version', '$version');
  // }
  // static String getVersion(){
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   return box.get('version');
  // }

  // static void clearVersion() {
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   box.delete("version");
  // }

  // static bool getIsOnlineMode(){
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   return box.get('isOnlineMode')==null?true:(box.get('isOnlineMode')=='true');
  // }
  // static saveIsOnlineMode(bool isOnlineMode) async{
  //   if (_checkInitial() == false) return;
  //   var box = Hive.box('$_boxName');
  //   box.put('isOnlineMode', '$isOnlineMode');
  // }

  // static saveDataJamKerjaJsonString({String key, String json}) {
  //   assert(key != null && json != null);
  //   if (_checkInitial() == false) return;
  //   var box = Hive.box('$_boxName');
  //   box.put('$key', '$json');
  // }

  // static String getDataJamKerjaJsonString({String key}) {
  //   assert(key != null);
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   String res = box.get('$key');
  //   return res;
  // }

  // static void clearDataJamKerjaJsonString({String key}) async{
  //   if (_checkInitial() == false) return null;
  //   var box = Hive.box('$_boxName');
  //   box.delete('$key');
  // }
}