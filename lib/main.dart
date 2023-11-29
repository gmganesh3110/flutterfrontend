// import 'package:client/pages/dashboard.dart';
import 'package:client/pages/homepage.dart';
import 'package:client/pages/loginpage.dart';
import 'package:client/pages/productdetails.dart';
import 'package:client/pages/productspage.dart';
import 'package:client/pages/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget _defaulHome = const LoginPage();

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: _defaulHome,
      routes: <String, WidgetBuilder>{
        "/": (context) => _defaulHome,
        "/register": (BuildContext context) => const RegisterPage(),
        "/login": (BuildContext context) => const LoginPage(),
        "/home": (BuildContext context) => const HomePage(),
        '/products': (BuildContext context) => const ProductsPage(),
        '/product-details': (BuildContext context) => const ProductDetails()
      },
    );
  }
}
