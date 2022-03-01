import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/login_provider.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/collector/dashboard_collector_container.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/supervisor/dashboard_supervisor_container.dart';

import 'package:bintang_ezella_mobile_app/ui/view/main/surveyor/dashboard_surveyor_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
// import 'package:keyboard_avoider/keyboard_avoider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ScrollController _scrollController = ScrollController();
  bool isChecked = false;
  String username = null;
  String password = null;

  bool _isObscure = false;
  @override
  void initState() {
    _isObscure = false;
  }

  @override
  // Widget buildLogo() {
  //   Container(
  //     child: Column(
  //       children: [
  //         SizedBox(
  //           height: 80,
  //         ),
  //         Image.asset(
  //           'assets/images/logo.png',
  //           width: 185,
  //           height: 90,
  //         ),
  //         SizedBox(
  //           height: 80,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget buildUsernameField(BuildContext context) {
  //   return ListenerProvider<LoginProvider>(
  //     model: LoginProvider(context),
  //     builder: (LoginProvider provider) {
  //       return Container(
  //         margin: EdgeInsets.only(top: 40),
  //         child: Column(
  //           children: [
  //             TextFormField(
  //               keyboardType: TextInputType.emailAddress,
  //               // controller: provider.usernameController,
  //               initialValue: username,
  //               decoration: InputDecoration(
  //                 labelText: 'Email',
  //                 hintText: 'Cth: andi@email.com',
  //               ),
  //               validator: (value) {
  //                 if (value.isEmpty) {
  //                   return 'Silahkan input nama user';
  //                 }
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget buildPasswordField(BuildContext context) {
  //   return ListenerProvider<LoginProvider>(
  //     model: LoginProvider(context),
  //     builder: (LoginProvider provider) {
  //       return Container(
  //         margin: EdgeInsets.only(top: 18),
  //         child: Column(
  //           children: [
  //             TextFormField(
  //               keyboardType: TextInputType.visiblePassword,
  //               // controller: provider.passwordController,
  //               initialValue: password,
  //               obscureText: !_isObscure,
  //               decoration: InputDecoration(
  //                 suffixIcon: IconButton(
  //                     icon: Icon(_isObscure
  //                         ? Icons.visibility_outlined
  //                         : Icons.visibility_off_outlined),
  //                     onPressed: () {
  //                       setState(() {
  //                         _isObscure = !_isObscure;
  //                       });
  //                     }),
  //                 labelText: 'Password',
  //                 hintText: 'Cth: xxxx xxxx',
  //               ),
  //               validator: (value) {
  //                 if (value.isEmpty) {
  //                   return 'Silahkan input kata sandi';
  //                 }
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget buildLoginButton(BuildContext context) {
  //   return ListenerProvider<LoginProvider>(
  //     model: LoginProvider(context),
  //     builder: (LoginProvider provider) {
  //       return Container(
  //         margin: EdgeInsets.only(top: 8),
  //         width: double.infinity,
  //         child: RaisedButton(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(12),
  //           ),
  //           onPressed: () {
  //             provider.login(isChecked);
  //           },
  //           color: AppColors.blueColor,
  //           textColor: AppColors.whiteColor,
  //           padding: const EdgeInsets.fromLTRB(25.0, 17.0, 25.0, 17.0),
  //           child: Text("Masuk".toUpperCase(), style: TextStyle(fontSize: 18)),
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget build(BuildContext context) {
    return ListenerProvider<LoginProvider>(
      model: LoginProvider(context),
      builder: (LoginProvider provider) {
        // return Scaffold(
        //   backgroundColor: Colors.blue.shade600,
        //   body: Center(
        //     child: SingleChildScrollView(
        //       reverse: true,
        //       padding: EdgeInsets.all(32),
        //       child: Column(
        //         children: <Widget>[
        //           buildLogo(),
        //           SizedBox(height: 32),
        //           buildUsernameField(context),
        //           SizedBox(height: 16),
        //           buildPasswordField(context),
        //           SizedBox(height: 32),
        //           buildLoginButton(context),
        //         ],
        //       ),
        //     ),
        //   ),
        // );

        return Scaffold(
          backgroundColor: AppColors.lightGrayColor,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        width: 185,
                        height: 90,
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 24,
                        top: 24,
                        right: 24,
                        bottom: 24,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 2),
                            // margin: EdgeInsets.all(16),
                            child: Center(
                              child: Text(
                                'Login',
                                style: AppTextStyle.boldTextStyle.copyWith(
                                  color: AppColors.bodyTextColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // padding: EdgeInsets.only(bottom: 10),
                            child: Form(
                              key: provider.formKey,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 0),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller:
                                              provider.usernameController,
                                          initialValue: username,
                                          decoration: InputDecoration(
                                            labelText: 'Email',
                                            hintText: 'Cth: andi@email.com',
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Silahkan input nama user';
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 18),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          controller:
                                              provider.passwordController,
                                          initialValue: password,
                                          obscureText: !_isObscure,
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                icon: Icon(_isObscure
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined),
                                                onPressed: () {
                                                  setState(() {
                                                    _isObscure = !_isObscure;
                                                  });
                                                }),
                                            labelText: 'Password',
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
                                  // Container(
                                  //   child: Align(
                                  //     alignment: Alignment.centerRight,
                                  //     child: Text(
                                  //       "Lupa Kata Sandi?",
                                  //       style: AppTextStyle.regularTextStyle
                                  //           .copyWith(
                                  //               color: AppColors.bodyTextColor
                                  //                   .withOpacity(0.5),
                                  //               fontSize: 13),
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    width: double.infinity,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      onPressed: () {
                                        provider.login(isChecked);
                                      },
                                      color: AppColors.blueColor,
                                      textColor: AppColors.whiteColor,
                                      padding: const EdgeInsets.fromLTRB(
                                          25.0, 17.0, 25.0, 17.0),
                                      child: Text("Masuk".toUpperCase(),
                                          style: TextStyle(fontSize: 18)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    bottom: 24,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Aplikasi Versi 1.0.4',
                      style: AppTextStyle.regularTextStyle.copyWith(
                          color: AppColors.blackColor.withOpacity(0.7),
                          fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
