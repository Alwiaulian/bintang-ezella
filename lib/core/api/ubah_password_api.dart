import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'base_url.dart';
import 'package:dio/dio.dart';

class ChangePasswordApi {
  static String changePasswordurl = 'api/v1/mobile/change-password';

  static postChangePassword(
      {String oldPassword, String newPassword, String confirmPassword}) async {
    String url = BaseUrl.baseUrl + changePasswordurl;

    Dio dio = new Dio();

    String token = FlutterNoSql.getToken();
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';
    Map<String, dynamic> mp = new Map();

    mp['old_password'] = oldPassword;
    mp['password'] = newPassword;
    mp['password_confirmation'] = confirmPassword;
    Response response;

    try {
      response = await dio.post(url, data: mp);
      return response.data;
    } catch (e) {
      L.error(e.toString());
      return null;
    }
  }
}
