import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/api/auth/login_api.dart';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:flutter/material.dart';

import 'base_provider.dart';

class LoginProvider extends BaseProvider {
  LoginProvider(BuildContext context) : super(context);

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String username = "";
  String password = "";
  final formKey = GlobalKey<FormState>();

  login(bool isChecked) async {
    if (formKey.currentState.validate()) {
      var data = await LoginApi.postLogin(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (data == null) {
        return;
      } else {
        if (data['success'] == true) {
          LoginModel model = LoginModel.fromJson(data);

          await FlutterNoSql.saveToken(model.data.apiToken);
          await FlutterNoSql.saveJsonString(
              key: NoSqlKey.loginApiKey, json: json.encode(model.toJson()));
          // await FlutterNoSql.saveProjectId(0);

          // if (isChecked){
          //   await FlutterNoSql.saveUsernamePassword(usernameController.text.trim(), passwordController.text.trim());
          //   await FlutterNoSql.saveIsRememberMe(true);
          // }else{
          //   await FlutterNoSql.saveUsernamePassword("", "");
          //   await FlutterNoSql.saveIsRememberMe(false);
          // }
          FlutterToast.showSuccess(
              context: context, message: data['message'].toString());

          // AppRouter.navToSelfieScreen(context, model);
          // print(model.data.namaJabatan.toUpperCase());
          if (model.data.namaJabatan.toUpperCase() == "SUPERVISOR") {
            AppRouter.navToMainSupervisor(context, 0, '');
          } else if (model.data.namaJabatan.toUpperCase() == "SURVEYOR") {
            AppRouter.navToMainSurveyor(context, 0, '');
          } else {
            AppRouter.navToMainCollector(context, 0, '');
          }
        } else {
          // L.error(data);
          FlutterToast.showErrorToast(
              context: context, message: data['message'].toString());
        }
      }
    }
  }
}
