import 'package:flutter/cupertino.dart';
import '../../common/constants/color_constants.dart';
import '../../common/constants/padding_constants.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../common/widgets/divider_line.dart';
import '../../router/routing_const.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        border: Border(),
        middle: Text('Авторизация'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomTextField(
              placeholder: 'Логин или почта',
            ),
            const DividerLine(),
            const CustomTextField(
              placeholder: 'Пароль',
            ),
            const SizedBox(height: 32),
            Padding(
              padding: AppPaddings.horizontal,
              child: CupertinoButton(
                padding: AppPaddings.vertical,
                color: AppColors.main,
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
              padding: AppPaddings.horizontal,
              child: CupertinoButton(
                padding: AppPaddings.vertical,
                color: AppColors.main,
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
