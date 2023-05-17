import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/models/tokens_model.dart';
import 'package:flutter_application_1/src/common/models/user_model.dart';
import 'package:hive/hive.dart';
import '../../common/constants/color_constants.dart';
import '../../common/constants/padding_constants.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../common/widgets/divider_line.dart';
import '../../router/routing_const.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Dio dio = Dio();
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
            CustomTextField(
              controller: emailController,
              placeholder: 'Логин или почта',
            ),
            const DividerLine(),
            CustomTextField(
              controller: passwordController,
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
                onPressed: () async {
                  Box tokensBox = Hive.box('tokens');
                  Box userBox = Hive.box('user');
                  try {
                    Response response = await dio.post(
                      'http://45.10.110.181:8080/api/v1/auth/login',
                      data: {
                        "email": emailController.text,
                        "password": passwordController.text,
                      },
                    );
                    UserModel userModel = UserModel.fromJson(
                      response.data['user'],
                    );
                    userBox.put('id', userModel.id);
                    userBox.put('email', userModel.email);
                    userBox.put('nickname', userModel.nickname);
                    
                    TokensModel tokensModel = TokensModel.fromJson(
                     response.data['tokens'],
                    );
                    tokensBox.put('access', tokensModel.access);
                    tokensBox.put('refresh', tokensModel.refresh);
                    Navigator.pushReplacementNamed(context, MainRoute);
                  } on DioError catch (e) {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text('Ошибка'),
                          content: const Text('Неправильный логин или пароль!'),
                          actions: [
                            CupertinoButton(
                              child: const Text('OK'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                    rethrow;
                  }
                },
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
