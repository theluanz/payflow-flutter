import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'package:payflow/modules/splash/splash_page.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      home: const LoginPage(),
    );
  }
}
