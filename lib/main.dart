import 'package:flutter/material.dart';
import 'package:store_app/screens/homePage.dart';
import 'package:store_app/screens/updateProductPage.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpadetProductPage.id: (context) => UpadetProductPage(),
        UpadetProductPage.id: (context) => UpadetProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
