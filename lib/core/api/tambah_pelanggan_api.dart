import 'dart:convert';
import 'dart:io';

import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'base_url.dart';
import 'package:dio/dio.dart';

class TambahPelangganApi {
  static String formHelper = 'api/v1/mobile/tambah-pelanggan/helper';
  static String saveTambahPelanggan = 'api/v1/mobile/tambah-pelanggan/store';

  static getFormHelper() async {
    String url = BaseUrl.baseUrl + formHelper;
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
    String nama_lengkap,
    String jenis_kelamin,
    String tanggal_lahir,
    String no_handphone,
    String alamat_email,
    String regional_id,
    String provinsi_id,
    String provinsi,
    String kota,
    String kelurahan,
    String alamat_lengkap,
    File foto_customer,
    File foto_e_ktp,
    String status
  }) async {
    String url = BaseUrl.baseUrl + saveTambahPelanggan;
    Dio dio = new Dio();
    String token = FlutterNoSql.getToken();
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';

    String foto_customer_name = foto_customer.path;
    String foto_e_ktp_name = foto_customer.path;

    FormData formData = FormData.fromMap({
      'nama_lengkap': nama_lengkap,
      'jenis_kelamin': jenis_kelamin,
      'tanggal_lahir': tanggal_lahir,
      'no_handphone': no_handphone,
      'alamat_email': alamat_email,
      'regional_id': regional_id,
      'provinsi_id': provinsi_id,
      'provinsi': provinsi,
      'kota': kota,
      'kelurahan': kelurahan,
      'alamat_lengkap': alamat_lengkap,
      'foto_customer': await MultipartFile.fromFile(foto_customer.path, filename: foto_customer_name,),
      'foto_e_ktp': await MultipartFile.fromFile(foto_e_ktp.path, filename: foto_e_ktp_name,),
      'status': status,
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
