import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.placeholder = 'Логин',
    this.obscureText = false,
    this.suffix,
  });
  final String placeholder;
  final bool obscureText;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholder,
      obscureText: obscureText,
      suffix: suffix,
      decoration: const BoxDecoration(
        color: CupertinoColors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
    );
  }
}
