import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/views/auth_checker.dart';
import 'package:shikisha/views/cart_screen.dart';
import 'package:shikisha/views/home_screen.dart';
import 'package:shikisha/views/login_page.dart';
import 'package:shikisha/views/payments.dart';
import 'package:shikisha/views/product_details.dart';
import 'package:shikisha/views/products.dart';
import 'package:shikisha/views/signup.dart';
import 'package:shikisha/views/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash_screen',
      // onGenerateRoute: ShikishaRoutes.generateRoute,
      routes: {
        '/': (context) => const AuthChecker(),
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUp(),
        '/home': (context) => const HomeScreen(),
        '/products': (context) => const Products(),
        '/product_details': (context) => const ProductDetails(),
        '/cart': (context) => const CartScreen(),
        '/payments': (context) => const Payments(),
        '/splash_screen': (context) => const SplashScreen()
      },
    );
  }
}
