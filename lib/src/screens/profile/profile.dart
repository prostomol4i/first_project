import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:hive_flutter/adapters.dart';
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
            CupertinoButton(
              child: const Text('Шыгу'),
              onPressed: () {
                Hive.box('tokens').clear();
                Navigator.of(context, rootNavigator: true).pushReplacementNamed(AuthRoute);
              },
            ),  
          ],
        ),
      ),
    );
  }
}
