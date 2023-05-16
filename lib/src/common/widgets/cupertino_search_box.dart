import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
import '../constants/padding_constants.dart';

class CupertinoSearchBox extends StatelessWidget {
  const CupertinoSearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      padding: AppPaddings.vertical,
      placeholder: 'Поиск',
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
