import 'package:flutter/material.dart';

import 'features/Home/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather Demo',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
