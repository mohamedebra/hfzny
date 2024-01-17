import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled2/feature/onborading/ui/on_boarding_screen.dart';

import '../../../core/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Colors.white,
        splashIconSize: 250,
        duration: 3000,
        animationDuration: const Duration(seconds: 1),
        splash: Lottie.asset('assets/icons/splash.json'),
        nextScreen: const OnBoardingScreen());
  }
}
