import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ui/view/auth/login_page.dart';

void main() {
  runApp(MyApp());
  Future.delayed(Duration(seconds: 0), () async {
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterNoSql.initFlutter();
    WidgetsFlutterBinding.ensureInitialized();
    // await checkToken();
  });
}

// bool validToken = true;
// checkToken() async {
//   PackageInfo packageInfo = await PackageInfo.fromPlatform();
//   String version = packageInfo.version;
//   String code = packageInfo.buildNumber;
//   FlutterNoSql.saveVersion(version);

//   var data = await CheckTokenApi.postCheckToken();
//   if (data == null) {
//     validToken = false;
//     // return;
//   } else {
//     if (data['success'] == true) {
//       CheckTokenResult model = CheckTokenResult.fromJson(data);
//       if (model.data == null) {
//         validToken = false;
//       } else {
//         validToken = true;
//       }
//     } else {
//       validToken = false;
//       // L.error(data);
//     }
//   }

//   // Than we setup preferred orientations,
//   // and only after it finished we run our app
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//       .then((value) => runApp(MyApp()));
//   // runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: AppColors.mainColor,
        fontFamily: AppFontName.PoppinsRegular,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      next();
    });
  }

  LoginModel loginModel;

  void next() async {
    // FlutterNoSql.clearToken();
    // FlutterNoSql.clearJsonString(key: NoSqlKey.loginApiKey);

    String loginToken = FlutterNoSql.getToken();

    // if (validToken == false){
    // FlutterNoSql.clearToken();
    // FlutterNoSql.clearJsonString(key: NoSqlKey.loginApiKey);
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) =>  LoginPage(),
    //   ));
    // }
    Future.delayed(Duration(seconds: 0)).then(
      (value) async {
        if (loginToken == null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
        } else {
          await getLoginData();

          if (loginModel.data.namaJabatan.toUpperCase() == "SUPERVISOR") {
            AppRouter.navToMainSupervisor(context, 0, '');
          } else if (loginModel.data.namaJabatan.toUpperCase() == "SURVEYOR") {
            AppRouter.navToMainSurveyor(context, 0, '');
          } else {
            AppRouter.navToMainCollector(context, 0, '');
          }
        }
      },
    );
  }

  getLoginData() async {
    loginModel = LoginModel.fromJson(
      json.decode(FlutterNoSql.getJsonString(key: NoSqlKey.loginApiKey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Text(
              'Bintang Ezella',
              style: AppTextStyle.regularTextStyle.copyWith(
                fontSize: 28,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
            // child: SvgPicture.asset('assets/svg/up_arrow.svg'),
          ),
        ),
      ),
    );
  }
}
