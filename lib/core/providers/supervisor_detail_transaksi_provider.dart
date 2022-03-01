import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/api/detail_transaksi_api.dart';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/models/detail_transaksi_model.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:flutter/material.dart';

import 'base_provider.dart';

class SupervisorDetailTransaksiProvider extends BaseProvider {
  SupervisorDetailTransaksiProvider(BuildContext context, String id) : super(context) {
    this.id = id;
    getDataSupervisorDetailTransaksi();
  }

  getDataSupervisorDetailTransaksi() async {
    loading = true;
    await getDataSupervisorDetailTransaksiData();
    await getSupervisorLoginData();
    notifyListeners();
    loading = false;
  }

  bool loading = true;
  String id;
  LoginModel loginModel;
  DetailTransaksiModelData detailTransaksiModelData;

  getDataSupervisorDetailTransaksiData() async {
    var data = await DetailTransaksiApi.getDetailTransaksi(id);
    if (data['error'] == "AuthenticationException") {
      AppRouter.navToLoginPage(context);
      FlutterToast.showSuccess(context: context, message: 'Unauthorized!');
      FlutterNoSql.clearToken();
      // FlutterNoSql.clearProjectId();
      FlutterNoSql.clearJsonString(key: NoSqlKey.loginApiKey);
    }
    // if (data == null) return;
    if (data['success'] == true) {
      detailTransaksiModelData = DetailTransaksiModelData.fromJson(data['data']);
      // L.log('data project_id: '+project_id.toString());
      notifyListeners();
    }
  }

  getSupervisorLoginData() async {
    loginModel = LoginModel.fromJson(
        json.decode(FlutterNoSql.getJsonString(key: NoSqlKey.loginApiKey)));
  }
}
