import 'dart:convert';
import 'dart:io';

import 'package:bintang_ezella_mobile_app/core/api/rincian_surveyor_api.dart';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/models/rincian_surveyor_model.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/router/dialog_router.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/surveyor/print_riwayat_surveyor_page.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'base_provider.dart';

class RincianSurveyorProvider extends BaseProvider {
  bool loading = true;
  RincianSurveyorProvider(BuildContext context, String id) : super(context) {
    this.id = id;
    getDataCollectorRincianPenagihanDetail();
  }

  getDataCollectorRincianPenagihanDetail() async {
    loading = true;
    await getDataRincianSurveyorData();
    await getSupervisorLoginData();
    notifyListeners();
    loading = false;
  }

  // bool loading = true;
  String id;
  LoginModel loginModel;
  RincianSurveyorModelData rincianSurveyorModelData;

  getDataRincianSurveyorData() async {
    var data = await RincianSurveyorApi.getRincianSurveyor(id);
    if (data['error'] == "AuthenticationException") {
      AppRouter.navToLoginPage(context);
      FlutterToast.showSuccess(context: context, message: 'Unauthorized!');
      FlutterNoSql.clearToken();
      // FlutterNoSql.clearProjectId();
      FlutterNoSql.clearJsonString(key: NoSqlKey.loginApiKey);
    }
    if (data == null) return;
    if (data['success'] == true) {
      rincianSurveyorModelData =
          RincianSurveyorModelData.fromJson(data['data']);
      // L.log('data project_id: '+project_id.toString());
      notifyListeners();
    }
  }

  getSupervisorLoginData() async {
    loginModel = LoginModel.fromJson(
        json.decode(FlutterNoSql.getJsonString(key: NoSqlKey.loginApiKey)));
  }

  String status;
  String status_pembelian;
  String harga_barang;
  String keterangan;
  String lama_cicilan;
  String dp_cicilan;
  String cicilan_per_bulan;
  String status_batal;
  String tanggal_survey_baru;
  String strTanggalSurveyBaru = '';
  File bukti_foto_batal;

  saveSurveyor() async {
    if (tanggal_survey_baru != "" && tanggal_survey_baru != null) {
      DateTime tempDate = DateTime.parse(tanggal_survey_baru);
      var outputFormat = DateFormat("yyyy-MM-dd");
      strTanggalSurveyBaru = outputFormat.format(tempDate);
    }

    DialogRouter.displayProgressDialog(context);
    var data = await RincianSurveyorApi.saveData(
        jadwal_surveyor_id: id,
        status: status,
        status_pembelian: status_pembelian,
        harga_barang: harga_barang,
        keterangan: keterangan,
        lama_cicilan: lama_cicilan,
        dp_cicilan: dp_cicilan,
        cicilan_per_bulan: cicilan_per_bulan,
        status_batal: status_batal,
        tanggal_survey_baru: strTanggalSurveyBaru,
        bukti_foto_batal: bukti_foto_batal);
    DialogRouter.closeProgressDialog(context);
    if (data == null) return;
    if (data['success'] == true) {
      FlutterToast.showSuccess(context: context, message: data['message']);
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PrintRiwayatPage(data['data']['id'].toString()),
          ),
        );
      });
    } else {
      FlutterToast.showErrorToast(context: context, message: data['message']);
    }
  }
}
