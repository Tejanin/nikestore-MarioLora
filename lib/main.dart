import 'package:flutter/material.dart';
import 'package:nikestore/screens/landing_screen.dart';
import 'package:provider/provider.dart';
import 'screens/shop_screen.dart';
import 'screens/cart_screen.dart';
import 'models/cart_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nike Shop',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/shop': (context) => ShopScreen(),
        '/cart': (context) => CartScreen(),
        '/home': (context) => HomeScreen()
      },
    );
  }
}
