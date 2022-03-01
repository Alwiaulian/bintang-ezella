import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/api/riwayat_surveyor_api.dart';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/models/riwayat_surveyor_model.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:flutter/material.dart';

import 'base_provider.dart';

class SurveyorRiwayatProvider extends BaseProvider {
  bool loading = true;
  String search;
  SurveyorRiwayatProvider(BuildContext context, this.search) : super(context) {
    getDataSurveyor();
  }

  getDataSurveyor() async {
    loading = true;
    await getSurveyorRiwayatData();
    await getSurveyorLoginData();
    notifyListeners();
    loading = false;
  }

  RiwayatSurveyorModelData riwayatSurveyorModelData;
  LoginModel loginModel;

  getSurveyorRiwayatData() async {
    var data = await RiwayatSurveyorApi.getDataRiwayatSurveyor(search);
    if (data['error'] == "AuthenticationException") {
      AppRouter.navToLoginPage(context);
      FlutterToast.showSuccess(context: context, message: 'Unauthorized!');
      FlutterNoSql.clearToken();
      // FlutterNoSql.clearProjectId();
      FlutterNoSql.clearJsonString(key: NoSqlKey.loginApiKey);
    }
    if (data == null) return;
    if (data['success'] == true) {
      riwayatSurveyorModelData =
          RiwayatSurveyorModelData.fromJson(data['data']);
      // L.log('data project_id: '+project_id.toString());
      notifyListeners();
    }
  }

  getSurveyorLoginData() async {
    loginModel = LoginModel.fromJson(
        json.decode(FlutterNoSql.getJsonString(key: NoSqlKey.loginApiKey)));
  }
}
