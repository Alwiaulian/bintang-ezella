import 'dart:convert';
import 'dart:io';

import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'base_url.dart';
import 'package:dio/dio.dart';

class RincianSurveyorApi {
  static String rincianSurveyorUrl = 'api/v1/mobile/jadwal-survey/detail';
  static String saveRincianSurveyor = 'api/v1/mobile/jadwal-survey/store';

  static getRincianSurveyor(String id) async {
    String url =
        BaseUrl.baseUrl + rincianSurveyorUrl + '?jadwal_surveyor_id=' + id;
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

  static saveData({
    String jadwal_surveyor_id,
    String status,
    String status_pembelian,
    String harga_barang,
    String keterangan,
    String lama_cicilan,
    String dp_cicilan,
    String cicilan_per_bulan,
    String status_batal,
    String tanggal_survey_baru,
    File bukti_foto_batal,
  }) async {
    String url = BaseUrl.baseUrl + saveRincianSurveyor;
    Dio dio = new Dio();
    String token = FlutterNoSql.getToken();
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';

    String bukti_foto_batal_name = (bukti_foto_batal != null) ? bukti_foto_batal.path : '';

    FormData formData = FormData.fromMap({
      'jadwal_surveyor_id': jadwal_surveyor_id,
      'status': status,
      'status_pembelian': status_pembelian,
      'harga_barang': harga_barang,
      'keterangan': keterangan,
      'lama_cicilan': lama_cicilan,
      'dp_cicilan': dp_cicilan,
      'cicilan_per_bulan': cicilan_per_bulan,
      'status_batal': status_batal,
      'tanggal_survey_baru': tanggal_survey_baru,
      'bukti_foto_batal': (status_pembelian == 'Batal') ? await MultipartFile.fromFile(bukti_foto_batal.path, filename: bukti_foto_batal_name,) : null,
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
