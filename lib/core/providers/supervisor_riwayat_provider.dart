import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/api/riwayat_transaksi_api.dart';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/models/riwayat_transaksi_model.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:flutter/material.dart';

import 'base_provider.dart';

class SupervisorTransaksiProvider extends BaseProvider {
  bool loading = true;
  String search;
  SupervisorTransaksiProvider(BuildContext context, this.search)
      : super(context) {
    getDataSupervisor();
  }

  getDataSupervisor() async {
    loading = true;
    await getSupervisorTransaksiData();
    await getSupervisorLoginData();
    notifyListeners();
    loading = false;
  }

  // JadwalPenjualanModel daftarProdukModel;
  LoginModel loginModel;
  List<RiwayatTransaksiModelData> riwayatTransaksiModelData = new List();

  getSupervisorTransaksiData() async {
    var data = await RiwayatTransaksiApi.getDataTransaksi(search);
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
        riwayatTransaksiModelData
            .add(RiwayatTransaksiModelData.fromJson(element));
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
