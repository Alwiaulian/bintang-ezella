import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/api/daftar_produk_api.dart';
import 'package:bintang_ezella_mobile_app/core/api/transaksi_penjualan_api.dart';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/models/tambah_transaksi_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/dialog_router.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/supervisor/print_transaksi_page.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/supervisor/riwayat_transaksi_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'base_provider.dart';

class SupervisorTambahTransaksiProvider extends BaseProvider {
  bool loading = true;
  SupervisorTambahTransaksiProvider(BuildContext context, String produkId) : super(context) {
    this.produk_id = produkId;
    getDataSupervisorTambahTransaksi();
  }

  getDataSupervisorTambahTransaksi() async {
    loading = true;
    await getSupervisorTambahTransaksiData();
    await getSupervisorLoginData();
    notifyListeners();
    loading = false;
  }

  LoginModel loginModel;
  TambahTransaksiModelData tambahTransaksiModelData;

  getSupervisorTambahTransaksiData() async {
    var data = await TransaksiPenjualanApi.getFormHelper(produk_id);
    if (data['error'] == "AuthenticationException") {
      AppRouter.navToLoginPage(context);
      FlutterToast.showSuccess(context: context, message: 'Unauthorized!');
      FlutterNoSql.clearToken();
      // FlutterNoSql.clearProjectId();
      FlutterNoSql.clearJsonString(key: NoSqlKey.loginApiKey);
    }
    if (data == null) return;
    if (data['success'] == true) {
      tambahTransaksiModelData = TambahTransaksiModelData.fromJson(data['data']);
      // L.log('data project_id: '+project_id.toString());
      notifyListeners();
    }
  }

  getSupervisorLoginData() async {
    loginModel = LoginModel.fromJson(
        json.decode(FlutterNoSql.getJsonString(key: NoSqlKey.loginApiKey)));
  }

  String customer_id;
  String status_penjualan;
  String lama_angsuran;
  String uang_muka;
  String angsuran_per_bulan;
  String tanggal_jatuh_tempo;
  String keterangan;
  String sales_id;
  String demo_broker_id;
  String produk_id;
  String nama_produk;
  String nama_merk;
  String nama_kategori_produk;
  String total_amount_penjualan;
  String strTanggalJatuhTempo = '';

  upload() async {
    if (lama_angsuran == null) {
      FlutterToast.showErrorToast(
          context: context, message: 'Please enter name');
      return;
    }

    if (keterangan == null) {
      FlutterToast.showErrorToast(
          context: context, message: 'Please leave a note');
      return;
    }

    if (tanggal_jatuh_tempo != "") {
      DateTime tempDate = DateTime.parse(tanggal_jatuh_tempo);
      var outputFormat = DateFormat("yyyy-MM-dd");
      strTanggalJatuhTempo = outputFormat.format(tempDate);
    }
    DialogRouter.displayProgressDialog(context);
    var data = await TransaksiPenjualanApi.saveData(
      customer_id: customer_id,
      status_penjualan: status_penjualan,
      lama_angsuran: lama_angsuran,
      uang_muka: uang_muka,
      angsuran_per_bulan: angsuran_per_bulan,
      tanggal_jatuh_tempo: strTanggalJatuhTempo,
      keterangan: keterangan,
      sales_id: sales_id,
      demo_broker_id: demo_broker_id,
      produk_id: produk_id,
      nama_produk: nama_produk,
      nama_merk: nama_merk,
      nama_kategori_produk: nama_kategori_produk,
      total_amount_penjualan: total_amount_penjualan,
    );

    DialogRouter.closeProgressDialog(context);

    if (data == null) return;
    if (data['success'] == true) {
      FlutterToast.showSuccess(context: context, message: data['message']);
      new Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PrintTransaksiPage(data['data'].toString()),
          ),
        );
      });
    } else {
      FlutterToast.showErrorToast(context: context, message: data['message']);
    }
  }
}
