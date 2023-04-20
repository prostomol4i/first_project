import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/screens/auth/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: AuthScreen(),
    );
  }
}