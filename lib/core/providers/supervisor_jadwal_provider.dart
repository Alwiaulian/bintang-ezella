import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/api/jadwal_penjualan_api.dart';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/models/jadwal_penjualan_model.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:flutter/material.dart';

import 'base_provider.dart';

class SupervisorJadwalProvider extends BaseProvider {
  bool loading = true;
  String search;
  SupervisorJadwalProvider(BuildContext context, this.search) : super(context) {
    getDataSupervisor();
  }

  getDataSupervisor() async {
    loading = true;
    await getSupervisorLoginData();
    await getSupervisorJadwalData();
    notifyListeners();
    loading = false;
  }

  // JadwalPenjualanModel daftarProdukModel;
  LoginModel loginModel;
  List<JadwalPenjualanModelData> jadwalPenjualanModelData = new List();

  getSupervisorJadwalData() async {
    var data = await JadwalPenjualanApi.getDataJadwal(search);
    if (data['error'] == "AuthenticationException") {
      AppRouter.navToLoginPage(context);
      FlutterToast.showSuccess(context: context, message: 'Unauthorized!');
      FlutterNoSql.clearToken();
      // FlutterNoSql.clearProjectId();
      FlutterNoSql.clearJsonString(key: NoSqlKey.loginApiKey);
    }
    // if (data == null) return;
    if (data['success'] == true) {
      List dataList = data['data'];
      dataList.forEach((element) {
        jadwalPenjualanModelData
            .add(JadwalPenjualanModelData.fromJson(element));
      });
      // L.log('data project_id: '+project_id.toString());
      notifyListeners();
    }
  }

  getSupervisorLoginData() async {
    loginModel = LoginModel.fromJson(
        json.decode(FlutterNoSql.getJsonString(key: NoSqlKey.loginApiKey)));
  }
}
