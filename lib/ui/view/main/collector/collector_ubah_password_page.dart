import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/collector_profile_provider.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class OperatorChangePasswordPage extends StatefulWidget {
  final CollectorProfileProvider provider;

  OperatorChangePasswordPage(this.provider);

  @override
  _OperatorChangePasswordPageState createState() =>
      _OperatorChangePasswordPageState();
}

class _OperatorChangePasswordPageState
    extends State<OperatorChangePasswordPage> {
  bool _isObscure = false;
  bool _isObscurenew = false;
  bool _isObscurecfm = false;

  @override
  void initState() {
    _isObscure = false;
    _isObscurenew = false;
    _isObscurecfm = false;
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 24,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Ganti Password",
                        style:
                            AppTextStyle.boldTextStyle.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.whiteColor, AppColors.whiteColor]),
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: Form(
              key: widget.provider.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 18),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: widget.provider.oldPasswordController,
                          // initialValue: password,
                          obscureText: !_isObscure,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            labelText: 'Password Lama',
                            hintText: 'Cth: xxxx xxxx',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Silahkan input kata sandi';
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 18),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: widget.provider.newPasswordController,
                          obscureText: !_isObscurenew,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscurenew
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onPressed: () {
                                  setState(() {
                                    _isObscurenew = !_isObscurenew;
                                  });
                                }),
                            labelText: 'Password Baru',
                            hintText: 'Cth: xxxx xxxx',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Silahkan input kata sandi';
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 18),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: widget.provider.cfmPasswordController,
                          obscureText: !_isObscurecfm,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscurecfm
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscurecfm = !_isObscurecfm;
                                  });
                                }),
                            labelText: 'Konfirmasi Password Baru',
                            hintText: 'Cth: xxxx xxxx',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Silahkan input kata sandi';
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onPressed: () async {
                        widget.provider.changePassword();
                      },
                      color: AppColors.mainColor,
                      textColor: AppColors.whiteColor,
                      padding:
                          const EdgeInsets.fromLTRB(25.0, 17.0, 25.0, 17.0),
                      child: Text("Ganti Password".toUpperCase(),
                          style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
