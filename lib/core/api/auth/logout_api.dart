import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:dio/dio.dart';

import '../base_url.dart';

class LogoutApi{
  static String logoutUrl = 'api/v1/mobile/logout';

  static postLogout() async {
    String url = BaseUrl.baseUrl + logoutUrl;

    Dio dio = new Dio();

    String token = FlutterNoSql.getToken();
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';
    Map<String, dynamic> mp = new Map();
    Response response;

    try {
      response = await dio.post(url, data: mp);
      return response.data;
    } catch (e) {
      // L.error(e.toString());
      return null;
    }
  }
}
