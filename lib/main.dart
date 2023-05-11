import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
import 'package:flutter_application_1/src/router/router.dart';
import 'package:flutter_application_1/src/screens/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      localizationsDelegates: [
        DefaultCupertinoLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      home: MainScreen(),
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      ),
    );
  }
}
