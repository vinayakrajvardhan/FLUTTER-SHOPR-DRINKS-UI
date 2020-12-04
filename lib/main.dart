import 'package:flutter/material.dart';
import './page/chart_page.dart';
import './provider/shop_provider.dart';
import 'package:provider/provider.dart';
import './page/product_page.dart';
import '';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final state = ShopProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => state,
      child: MaterialApp(
        title: 'Shop UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepOrangeAccent,
          primaryColorDark: Colors.white,
        ),
        //home: CartPage(),
        home: ProductsPage(),
      ),
    );
  }
}
