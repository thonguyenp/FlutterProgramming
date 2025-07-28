import 'package:flutter/material.dart';
import 'MyScaffold.dart';
import 'AppBar.dart';
import 'MyText.dart';
import 'MyContainer.dart';
import 'MyColumnAndRow.dart';
import 'MyButton.dart';
import 'MyButton_2.dart';

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
      home: const MyButton_2(),
    );
  }
}
