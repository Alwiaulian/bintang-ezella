import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'base_url.dart';
import 'package:dio/dio.dart';

class TransaksiPenjualanApi {
  static String formHelper = 'api/v1/mobile/tambah-transaksi-penjualan/helper';
  static String saveTransaksiPenjualan = 'api/v1/mobile/tambah-transaksi-penjualan/store';

  static getFormHelper(String produkId) async {
    String url = BaseUrl.baseUrl + formHelper + '?produk_id=' + produkId;
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
    String customer_id,
    String status_penjualan,
    String lama_angsuran,
    String uang_muka,
    String angsuran_per_bulan,
    String tanggal_jatuh_tempo,
    String keterangan,
    String sales_id,
    String demo_broker_id,
    String produk_id,
    String nama_produk,
    String nama_merk,
    String nama_kategori_produk,
    String total_amount_penjualan
  }) async {
    String url = BaseUrl.baseUrl + saveTransaksiPenjualan;
    Dio dio = new Dio();
    String token = FlutterNoSql.getToken();
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';

    FormData formData = FormData.fromMap({
      'customer_id': customer_id,
      'status_penjualan': status_penjualan,
      'lama_angsuran': lama_angsuran,
      'uang_muka': uang_muka,
      'angsuran_per_bulan': angsuran_per_bulan,
      'tanggal_jatuh_tempo': tanggal_jatuh_tempo,
      'keterangan': keterangan,
      'sales_id': sales_id,
      'demo_broker_id': demo_broker_id,
      'produk_id': produk_id,
      'nama_produk': nama_produk,
      'nama_merk': nama_merk,
      'nama_kategori_produk': nama_kategori_produk,
      'total_amount_penjualan': total_amount_penjualan,
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
