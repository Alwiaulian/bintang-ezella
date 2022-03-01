import '../base_url.dart';
import 'package:dio/dio.dart';

class LoginApi {
  static String loginUrl = 'api/v1/mobile/login';
  
  static postLogin({String username, String password}) async {
    String url = BaseUrl.baseUrl + loginUrl;

    Dio dio = new Dio();

    dio.options.headers['Accept'] = 'application/json';
    Map<String, dynamic> mp = new Map();

    mp['email'] = username;
    mp['password'] = password;
    
    Response response;

    try {
      response = await dio.post(url, data: mp);
      print(response);
      return response.data;
    } catch (e) {
      // L.error(e.toString());
      return null;
    }
  }
}