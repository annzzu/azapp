import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.pets_rounded,
              size: 200,
              color: AppColors.mainRed,
            ),
            const SizedBox(height: 20),
            Text(
              'AZAPP',
              style: Theme.of(context).textTheme.headline1,
            )
          ],
        ),
      ),
    );
  }
}
