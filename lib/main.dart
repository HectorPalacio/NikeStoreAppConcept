import 'package:flutter/material.dart';
import 'package:nike_store_concept/src/pages/nike_shoes_store_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nike Store App Concept',
      theme: ThemeData.light(),
      home: NikeShoesStoreHome(),
    );
  }
}
