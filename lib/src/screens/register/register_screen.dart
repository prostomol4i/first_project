import 'package:flutter/cupertino.dart';
import '../../common/constants/color_constants.dart';
import '../../common/constants/padding_constants.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../common/widgets/divider_line.dart';

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
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        border: Border(),
        middle: Text('Регистрация'),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 32),
            const CustomTextField(),
            const DividerLine(),
            const CustomTextField(
              placeholder: 'Телефон',
            ),
            const DividerLine(),
            const CustomTextField(
              placeholder: 'Почта',
            ),
            const DividerLine(),
            CustomTextField(
              obscureText: obscureText,
              placeholder: 'Пароль',
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
              padding: AppPaddings.horizontal,
              child: CupertinoButton(
                padding: AppPaddings.vertical,
                color: AppColors.main,
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
