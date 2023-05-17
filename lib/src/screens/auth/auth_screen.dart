import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/screens/auth/bloc/log_in_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              child: BlocConsumer<LogInBloc, LogInState>(
                listener: (context, state) {
                  if (state is LogInLoaded) {
                    Navigator.pushReplacementNamed(context, MainRoute);
                  } else if (state is LogInFailed) {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (contex) {
                        return CupertinoAlertDialog(
                          title: const Text('Ошибка'),
                          content: Text(state.message ?? ''),
                          actions: [
                            CupertinoButton(
                              child: const Text('OK'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LogInLoading) {
                    return const CupertinoActivityIndicator();
                  }
                  return CupertinoButton(
                    padding: AppPaddings.vertical,
                    color: AppColors.main,
                    onPressed: state is LogInLoading
                        ? null
                        : () async {
                            context.read<LogInBloc>().add(
                                  LogInPressed(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          },
                    child: const Text(
                      'Войти',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
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
