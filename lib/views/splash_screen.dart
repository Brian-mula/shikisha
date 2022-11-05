import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/views/auth_checker.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SplashScreenView(
      navigateRoute: const AuthChecker(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "assets/images/shikishika_logo.jpeg",
      text: "Shikisha",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(fontSize: 40.0),
      colors: const [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );
  }
}
