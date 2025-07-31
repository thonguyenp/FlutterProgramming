import 'package:flutter/material.dart';
import 'myWidget01/MyScaffold.dart';
import 'myWidget01/AppBar.dart';
import 'myWidget02_Form/f7_form_scrollView.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FormBasicDemo(),
    );
  }
}
