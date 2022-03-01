import 'package:bintang_ezella_mobile_app/core/providers/collector_profile_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/supervisor_profile_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/surveyor_profile_provider.dart';
import 'package:bintang_ezella_mobile_app/ui/view/auth/login_page.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/collector/collector_ubah_password_page.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/collector/dashboard_collector_container.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/supervisor/dashboard_supervisor_container.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/supervisor/ubah_password_page.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/surveyor/dashboard_surveyor_container.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/surveyor/ubah_password_page.dart';
import 'package:bintang_ezella_mobile_app/ui/widget/take_picture_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static navToLoginPage(BuildContext context) {
    return Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
          type: PageTransitionType.scale,
          alignment: Alignment.bottomCenter,
          child: LoginPage()),
      (Route<dynamic> route) => false,
      // ModalRoute.withName('/'),
    );
  }

  static navToMainSupervisor(
      BuildContext context, int indexCounter, String search) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
          type: PageTransitionType.scale,
          alignment: Alignment.bottomCenter,
          child: DashboardSupervisorContainer(indexCounter, search)),
      (Route<dynamic> route) => false,
    );
  }

  static navToMainCollector(
      BuildContext context, int indexCounter, String search) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
          type: PageTransitionType.scale,
          alignment: Alignment.bottomCenter,
          child: DashboardCollectorContainer(indexCounter, search)),
      (Route<dynamic> route) => false,
    );
  }

  static navToMainSurveyor(
      BuildContext context, int indexCounter, String search) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
          type: PageTransitionType.scale,
          alignment: Alignment.bottomCenter,
          child: DashboardSurveyorContainer(indexCounter, search)),
      (Route<dynamic> route) => false,
    );
  }

  static navToTakePictureScreen(BuildContext context) async {
    return Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.scale,
        alignment: Alignment.bottomCenter,
        child: TakePictureScreen(),
      ),
    );
  }

  static navToChangePasswordScreen(
      BuildContext context, final CollectorProfileProvider provider) async {
    return Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.scale,
        alignment: Alignment.bottomCenter,
        child: OperatorChangePasswordPage(provider),
      ),
    );
  }

  static navToChangePasswordScreenSurveyor(
      BuildContext context, final SurveyorProfileProvider provider) async {
    return Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.scale,
        alignment: Alignment.bottomCenter,
        child: SurveyorOperatorChangePasswordPage(provider),
      ),
    );
  }

  static navToChangePasswordScreenSupervisor(
      BuildContext context, final SupervisorProfileProvider provider) async {
    return Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.scale,
        alignment: Alignment.bottomCenter,
        child: SupervisorOperatorChangePasswordPage(provider),
      ),
    );
  }
}
