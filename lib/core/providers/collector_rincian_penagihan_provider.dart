import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/api/rincian_penagihan_api.dart';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/models/rincian_penagihan_model.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/router/dialog_router.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/collector/print_riwayat_penagihan_page.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'base_provider.dart';

class CollectorRincianPenagihanProvider extends BaseProvider {
  bool loading = true;
  CollectorRincianPenagihanProvider(BuildContext context, String id)
      : super(context) {
    this.id = id;
    getDataCollectorRincianPenagihan();
  }

  getDataCollectorRincianPenagihan() async {
    loading = true;
    await getDataCollectorRincianPenagihanData();
    await getSupervisorLoginData();
    notifyListeners();
    loading = false;
  }

  // bool loading = true;
  String id;
  LoginModel loginModel;
  RincianPenagihanModelData rincianPenagihanModelData;

  getDataCollectorRincianPenagihanData() async {
    var data = await RincianPenagihanApi.getRincianPenagihan(id);
    if (data['error'] == "AuthenticationException") {
      AppRouter.navToLoginPage(context);
      FlutterToast.showSuccess(context: context, message: 'Unauthorized!');
      FlutterNoSql.clearToken();
      // FlutterNoSql.clearProjectId();
      FlutterNoSql.clearJsonString(key: NoSqlKey.loginApiKey);
    }
    if (data == null) return;
    if (data['success'] == true) {
      rincianPenagihanModelData =
          RincianPenagihanModelData.fromJson(data['data']);
      // L.log('data project_id: '+project_id.toString());
      notifyListeners();
    }
  }

  getSupervisorLoginData() async {
    loginModel = LoginModel.fromJson(
        json.decode(FlutterNoSql.getJsonString(key: NoSqlKey.loginApiKey)));
  }

  String jadwal_penagihan_id;
  String tanggal_penagihan;
  String tanggal_penagihan_ulang;
  String status_bayar;
  String jumlah_bayar;
  String aktivitas_kolektor;
  String keterangan;

  String strTanggalPenagihanUlang = '';

  savePenagihan() async {
    if (jadwal_penagihan_id == null) {
      FlutterToast.showErrorToast(
          context: context, message: 'Please enter name');
      return;
    }

    if (tanggal_penagihan == null) {
      FlutterToast.showErrorToast(
          context: context, message: 'Please enter name');
      return;
    }

    if (status_bayar == null) {
      FlutterToast.showErrorToast(
          context: context, message: 'Please enter name');
      return;
    }

    if (aktivitas_kolektor == null) {
      FlutterToast.showErrorToast(
          context: context, message: 'Please enter name');
      return;
    }
    if (tanggal_penagihan_ulang != "" && tanggal_penagihan_ulang != null) {
      DateTime tempDate = DateTime.parse(tanggal_penagihan_ulang);
      var outputFormat = DateFormat("yyyy-MM-dd");
      strTanggalPenagihanUlang = outputFormat.format(tempDate);
    }

    DialogRouter.displayProgressDialog(context);
    var data = await RincianPenagihanApi.saveDatas(
      jadwal_penagihan_id: jadwal_penagihan_id,
      tanggal_penagihan: tanggal_penagihan,
      tanggal_penagihan_ulang: strTanggalPenagihanUlang,
      status_bayar: status_bayar,
      jumlah_bayar: jumlah_bayar,
      aktivitas_kolektor: aktivitas_kolektor,
      keterangan: keterangan,
    );
    DialogRouter.closeProgressDialog(context);
    if (data == null) return;
    if (data['success'] == true) {
      FlutterToast.showSuccess(context: context, message: data['message']);
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PrintRiwayatPenagihanPage(data['data']['id'].toString()),
          ),
        );
      });
    } else {
      FlutterToast.showErrorToast(context: context, message: data['message']);
    }
    // if (data == null) return;
    // if (data['success'] == true) {
    //   FlutterToast.showSuccess(context: context, message: data['message']);
    //   Future.delayed(const Duration(seconds: 2), () {
    //     AppRouter.navToMainCollector(context, 1);
    //   });
    // } else {
    //   FlutterToast.showErrorToast(context: context, message: data['message']);
    // }
  }
}
