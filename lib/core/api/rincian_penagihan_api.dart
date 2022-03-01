import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'base_url.dart';
import 'package:dio/dio.dart';

class RincianPenagihanApi {
  static String rincianUrl = 'api/v1/mobile/jadwal-penagihan/detail-helper';

  static String saveRincianPenagihan = 'api/v1/mobile/jadwal-penagihan/store';

  static getRincianPenagihan(String id) async {
    String url = BaseUrl.baseUrl + rincianUrl + '?jadwal_penagihan_id=' + id;
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

  static saveDatas({
    String jadwal_penagihan_id,
    String tanggal_penagihan,
    String tanggal_penagihan_ulang,
    String status_bayar,
    String jumlah_bayar,
    String aktivitas_kolektor,
    String keterangan,
  }) async {
    String url = BaseUrl.baseUrl + saveRincianPenagihan;
    Dio dio = new Dio();
    String token = FlutterNoSql.getToken();
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';

    FormData formData = FormData.fromMap({
      'jadwal_penagihan_id': jadwal_penagihan_id,
      'tanggal_penagihan': tanggal_penagihan,
      'tanggal_penagihan_ulang': tanggal_penagihan_ulang,
      'status_bayar': status_bayar,
      'jumlah_bayar': jumlah_bayar,
      'aktivitas_kolektor': aktivitas_kolektor,
      'keterangan': keterangan,
    });

    Response response;
    try {
      response = await dio.post(url, data: formData);
      // L.map(response.data);
      return response.data;
    } catch (e) {
      L.error(e.toString());
      return null;
    }
  }
}
