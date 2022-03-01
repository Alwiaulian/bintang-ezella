import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/api/riwayat_penagihan_api.dart';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/models/riwayat_penagihan_model.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:flutter/material.dart';

import 'package:bintang_ezella_mobile_app/ui/router/dialog_router.dart';
import 'package:intl/intl.dart';
import 'base_provider.dart';

class CollectorRiwayatProvider extends BaseProvider {
  bool loading = true;
  String search;
  CollectorRiwayatProvider(BuildContext context, this.search) : super(context) {
    getDataCollector();
  }

  getDataCollector() async {
    loading = true;
    await getCollectorRiwayatData();
    await getCollectorLoginData();
    notifyListeners();
    loading = false;
  }

  RiwayatPenagihanModelData riwayatPenagihanModelData;
  LoginModel loginModel;

  getCollectorRiwayatData() async {
    var data = await RiwayatPenagihanApi.getDataRiwayatPenagihan(search);
    if (data['error'] == "AuthenticationException") {
      AppRouter.navToLoginPage(context);
      FlutterToast.showSuccess(context: context, message: 'Unauthorized!');
      FlutterNoSql.clearToken();
      // FlutterNoSql.clearProjectId();
      FlutterNoSql.clearJsonString(key: NoSqlKey.loginApiKey);
    }
    if (data == null) return;
    if (data['success'] == true) {
      riwayatPenagihanModelData =
          RiwayatPenagihanModelData.fromJson(data['data']);
      // L.log('data project_id: '+project_id.toString());
      notifyListeners();
    }
  }

  getCollectorLoginData() async {
    loginModel = LoginModel.fromJson(
        json.decode(FlutterNoSql.getJsonString(key: NoSqlKey.loginApiKey)));
  }
}
