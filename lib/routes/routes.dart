import 'package:flutter/material.dart';
import 'package:shikisha/views/home_screen.dart';
import 'package:shikisha/views/login_page.dart';
import 'package:shikisha/views/product_details.dart';
import 'package:shikisha/views/products.dart';
import 'package:shikisha/views/signup.dart';
import 'package:shikisha/widgets/text_widget.dart';

class ShikishaRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => const SignUp());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/products':
        return MaterialPageRoute(builder: (_) => const Products());
      case '/product_details':
        return MaterialPageRoute(builder: (_) => const ProductDetails());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: TextWidget(
                          text: "No route defined for ${settings.name}")),
                ));
    }
  }
}
