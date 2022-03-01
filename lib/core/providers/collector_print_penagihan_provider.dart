import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/api/check_counter_print_api.dart';
import 'package:bintang_ezella_mobile_app/core/api/riwayat_penagihan_detail_api.dart';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/models/check_counter_print_model.dart';
import 'package:bintang_ezella_mobile_app/models/riwayat_penagihan_detail_model.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/router/dialog_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'base_provider.dart';

class CollectorPrintPenagihanProvider extends BaseProvider {
  bool loading = true;
  CollectorPrintPenagihanProvider(BuildContext context, String id)
      : super(context) {
    this.id = id;
    getDataCollecotrPrintPenagihan();
  }

  getDataCollecotrPrintPenagihan() async {
    loading = true;
    await getDataCollecotrPrintPenagihanData();
    await getSupervisorLoginData();
    notifyListeners();
    loading = false;
  }

  // bool loading = true;
  String id;
  LoginModel loginModel;
  RiwayatPenagihanDetailModelData riwayatPenagihanDetailModelData;
  CheckCounterPrintModelData checkCounterPrintModelData;

  getDataCollecotrPrintPenagihanData() async {
    var data = await RiwayatPenagihanDetailApi.getRiwayatPenagihanDetail(id);
    if (data['error'] == "AuthenticationException") {
      AppRouter.navToLoginPage(context);
      FlutterToast.showSuccess(context: context, message: 'Unauthorized!');
      FlutterNoSql.clearToken();
      // FlutterNoSql.clearProjectId();
      FlutterNoSql.clearJsonString(key: NoSqlKey.loginApiKey);
    }
    if (data == null) return;
    if (data['success'] == true) {
      riwayatPenagihanDetailModelData =
          RiwayatPenagihanDetailModelData.fromJson(data['data']);
      // L.log('data project_id: '+project_id.toString());
      notifyListeners();
    }
  }

  getSupervisorLoginData() async {
    loginModel = LoginModel.fromJson(
        json.decode(FlutterNoSql.getJsonString(key: NoSqlKey.loginApiKey)));
  }

  checkCounterPrint(String transaksiId) async {
    DialogRouter.displayProgressDialog(context);
    var data = await CheckCounterPrintApi.getCheckCounterPrint(transaksiId);
    if (data == null) return;
    if (data['success'] == true) {
      checkCounterPrintModelData = CheckCounterPrintModelData.fromJson(data['data']);
    }
    Future.delayed(Duration(seconds: 2))
        .then((value) => DialogRouter.closeProgressDialog(context));
  }
}
