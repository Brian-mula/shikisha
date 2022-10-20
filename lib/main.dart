import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/views/home_screen.dart';
import 'package:shikisha/views/login_page.dart';
import 'package:shikisha/views/product_details.dart';
import 'package:shikisha/views/products.dart';
import 'package:shikisha/views/seller/product_upload.dart';
import 'package:shikisha/views/seller/product_view.dart';
import 'package:shikisha/views/signup.dart';

void main() {
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
      initialRoute: '/',
      // onGenerateRoute: ShikishaRoutes.generateRoute,
      routes: {
        '/': (context) => const LoginPage(),
        '/signUp': (context) => const SignUp(),
        '/home': (context) => const HomeScreen(),
        '/products': (context) => const Products(),
        '/product_details': (context) => const ProductDetails(),
        '/product_upload': (context) => const ProductUpload(),
        '/product_view': (context) => const ProductView()
      },
    );
  }
}
