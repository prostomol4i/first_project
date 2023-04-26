import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/screens/register_screen.dart';

import '../../router/routing_const.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border(),
        middle: Text('Авторизация'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CupertinoTextField(
              placeholder: 'Логин или почта',
              decoration: BoxDecoration(
                color: CupertinoColors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            ),
            Container(
              height: 1,
              color: const Color(0xFFE0E6ED),
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            const CupertinoTextField(
              placeholder: 'Пароль',
              decoration: BoxDecoration(
                color: CupertinoColors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: const Color(0xFF4631D2),
                child: const Text(
                  'Войти',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 19),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: const Color(0xFF4631D2),
                child: const Text(
                  'Зарегистрироваться',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RegisterRoute);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
