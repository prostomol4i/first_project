import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
import 'package:flutter_application_1/src/router/router.dart';
import 'package:flutter_application_1/src/screens/auth/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      home: AuthScreen(),
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      ),
    );
  }
}
