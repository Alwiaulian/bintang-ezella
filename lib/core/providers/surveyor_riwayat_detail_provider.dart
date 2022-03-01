import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/api/riwayat_surveyor_detail_api.dart';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/models/riwayat_surveyor_detail_model.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/router/dialog_router.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'base_provider.dart';

class RiwayatSurveyorDetailProvider extends BaseProvider {
  bool loading = true;
  RiwayatSurveyorDetailProvider(BuildContext context, String id)
      : super(context) {
    this.id = id;
    getDataCollectorRiwayatSurveyorDetail();
  }

  getDataCollectorRiwayatSurveyorDetail() async {
    loading = true;
    await getDataRiwayatSurveyorModelData();
    await getSupervisorLoginData();
    notifyListeners();
    loading = false;
  }

  // bool loading = true;
  String id;
  LoginModel loginModel;
  RiwayatSurveyorDetailModelData riwayatSurveyorDetailModelData;

  getDataRiwayatSurveyorModelData() async {
    var data = await RiwayatSurveyorDetailApi.getRiwayatSurveyorDetail(id);
    if (data['error'] == "AuthenticationException") {
      AppRouter.navToLoginPage(context);
      FlutterToast.showSuccess(context: context, message: 'Unauthorized!');
      FlutterNoSql.clearToken();
      // FlutterNoSql.clearProjectId();
      FlutterNoSql.clearJsonString(key: NoSqlKey.loginApiKey);
    }
    if (data == null) return;
    if (data['success'] == true) {
      riwayatSurveyorDetailModelData =
          RiwayatSurveyorDetailModelData.fromJson(data['data']);
      // L.log('data project_id: '+project_id.toString());
      notifyListeners();
    }
  }

  getSupervisorLoginData() async {
    loginModel = LoginModel.fromJson(
        json.decode(FlutterNoSql.getJsonString(key: NoSqlKey.loginApiKey)));
  }

  // String status;
  // String status_pembelian;
  // String harga_barang;
  // String keterangan;
  // String lama_cicilan;
  // String dp_cicilan;
  // String cicilan_per_bulan;
  // String status_batal;
  // String tanggal_survey_baru;
  // String strTanggalSurveyBaru = '';
  // String bukti_foto_batal = '';
}
