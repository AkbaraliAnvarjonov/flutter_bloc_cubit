import 'package:flutter/material.dart';
import 'package:flutter_bloc_cubit/ui/textfield_page/textfield_page.dart';

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
      
        primarySwatch: Colors.blueGrey,
      ),
      home: const TextFieldPage(),
    );
  }
}