import 'dart:convert';
import 'package:bintang_ezella_mobile_app/core/api/auth/logout_api.dart';
import 'package:bintang_ezella_mobile_app/core/api/ubah_password_api.dart';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/dialog_router.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:flutter/material.dart';
import 'base_provider.dart';

class SurveyorProfileProvider extends BaseProvider {
  bool loading = true;

  SurveyorProfileProvider(BuildContext context) : super(context) {
    getChekerProfileData();
  }

  getChekerProfileData() async {
    loading = true;
    await getLoginData();
    notifyListeners();
    loading = false;
  }

  LoginModel loginModel;
  final formKey = GlobalKey<FormState>();

  TextEditingController oldPasswordController = new TextEditingController();
  TextEditingController newPasswordController = new TextEditingController();
  TextEditingController cfmPasswordController = new TextEditingController();

  getLoginData() async {
    loginModel = LoginModel.fromJson(
        json.decode(FlutterNoSql.getJsonString(key: NoSqlKey.loginApiKey)));
  }

  logout() async {
    DialogRouter.displayProgressDialog(context);

    var data = await LogoutApi.postLogout();
    DialogRouter.closeProgressDialog(context);
    if (data == null) {
      FlutterToast.showErrorToast(
          context: context, message: 'connection failed.');
      return;
    } else {
      if (data['success'] == true) {
        FlutterToast.showSuccess(
            context: context, message: data['message'].toString());
        FlutterNoSql.clearToken();
        // FlutterNoSql.clearProjectId();
        FlutterNoSql.clearJsonString(key: NoSqlKey.loginApiKey);
        DialogRouter.closeProgressDialog(context);
        AppRouter.navToLoginPage(context);
      } else {
        // L.error(data);
        FlutterToast.showErrorToast(
            context: context, message: data['message'].toString());
      }
    }
  }

  changePassword() async {
    if (formKey.currentState.validate()) {
      if (newPasswordController.text.trim() !=
          cfmPasswordController.text.trim()) {
        FlutterToast.showErrorToast(
            context: context, message: 'password konfirmasi tidak sama');
        return;
      }
      DialogRouter.displayProgressDialog(context);

      var data = await ChangePasswordApi.postChangePassword(
          oldPassword: oldPasswordController.text.trim(),
          newPassword: newPasswordController.text.trim(),
          confirmPassword: cfmPasswordController.text.trim());
      DialogRouter.closeProgressDialog(context);
      if (data == null) {
        FlutterToast.showErrorToast(
            context: context, message: 'connection failed.');
        return;
      } else {
        if (data['success'] == true) {
          FlutterToast.showSuccess(
              context: context, message: data['message'].toString());
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () {
                  return Future.value(false);
                },
                child: AlertDialog(
                  title: new Text('Logout Otomatis'),
                  content: new Text(data['message'].toString()),
                  actions: <Widget>[
                    new GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        return logout();
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
          return;
        } else {
          L.error(data);
          FlutterToast.showErrorToast(
              context: context, message: data['message'].toString());
        }
      }
    }
  }
}
