import 'package:flutter/cupertino.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF3F4F6),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border(),
        middle: Text('Регистрация'),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 32),
            const CupertinoTextField(
              placeholder: 'Логин',
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
              placeholder: 'Телефон',
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
              placeholder: 'Почта',
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
            CupertinoTextField(
              obscureText: obscureText,
              placeholder: 'Пароль',
              decoration: const BoxDecoration(
                color: CupertinoColors.white,
              ),
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
              suffix: CupertinoButton(
                child: Icon(
                  obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                  color: CupertinoColors.black,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
            ),
            const SizedBox(height: 250),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: const Color(0xFF4631D2),
                child: const Text(
                  'Создать аккаунт',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
