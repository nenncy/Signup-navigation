import 'package:flutter/material.dart';
import 'Signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'User detail',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Signup());
  }
}
