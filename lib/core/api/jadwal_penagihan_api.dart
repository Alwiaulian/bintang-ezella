import 'dart:convert';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'base_url.dart';
import 'package:dio/dio.dart';

class JadwalPenagihanApi {
  static String jadwalPenagihanUrl = 'api/v1/mobile/jadwal-penagihan';

  static getDataJadwalPenagihan(String search) async {
    String url;
    if (search != '' && search != null) {
      url = BaseUrl.baseUrl + jadwalPenagihanUrl + '?search=' + search;
    } else {
      url = BaseUrl.baseUrl + jadwalPenagihanUrl;
    }
    Dio dio = new Dio();
    String token = FlutterNoSql.getToken();
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';
    print(token);

    Response response;
    try {
      response = await dio.get(url);
      L.map(response.data);
      return response.data;
    } catch (e) {
      L.error(e.toString());
      return null;
    }
  }
}
