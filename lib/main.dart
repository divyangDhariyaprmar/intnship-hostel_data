
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData.dark(),
      home: MYhomepage(),
    );
  }
}
