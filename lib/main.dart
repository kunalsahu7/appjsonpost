import 'package:appjsonpost/screens/Product/Provider/ProductModel.dart';
import 'package:appjsonpost/screens/Product/View/ProductScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => ProductScreen(),
        },
      ),
    ),
  );
}
