import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'base_url.dart';
import 'package:dio/dio.dart';

class RiwayatPenagihanDetailApi {
  static String detailUrl = 'api/v1/mobile/riwayat-penagihan-detail';

  // static String saveRincianPenagihan = 'api/v1/mobile/jadwal-penagihan/store';

  static getRiwayatPenagihanDetail(String id) async {
    String url = BaseUrl.baseUrl + detailUrl + '?transaksi_penagihan_id=' + id;
    Dio dio = new Dio();
    String token = FlutterNoSql.getToken();
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';

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
