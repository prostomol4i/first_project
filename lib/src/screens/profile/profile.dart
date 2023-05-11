import 'package:flutter/cupertino.dart';
import '../../common/constants/color_constants.dart';

class ProfileScreen extends StatelessWidget {
 const ProfileScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        border: Border(),
        middle: Text('Профиль'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              CupertinoIcons.profile_circled,
              size: 100,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
