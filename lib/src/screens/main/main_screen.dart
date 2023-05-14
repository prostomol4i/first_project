import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/screens/auth/auth_screen.dart';
import 'package:flutter_application_1/src/screens/home/home_screen.dart';
import 'package:flutter_application_1/src/screens/profile/profile.dart';
import 'package:flutter_application_1/src/screens/register/register_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.map)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return const HomeScreen();
                case 1:
                  return const RegisterScreen();
                case 2:
                  return const AuthScreen();
                case 3:
                  return const ProfileScreen();
                default:
                  return const HomeScreen();
              }
            },
          );
        },
      ),
    );
  }
}
