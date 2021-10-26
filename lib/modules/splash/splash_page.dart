import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AnimatedCard(
        direction: AnimatedCardDirection.top,
        child: Stack(
          children: [
            Center(
              child: Image.asset(AppImages.union),
            ),
            Center(
              child: Image.asset(AppImages.logoFull),
            ),
          ],
        ),
      ),
    );
  }
}
