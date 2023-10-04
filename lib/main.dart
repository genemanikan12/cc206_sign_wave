import 'package:flutter/material.dart';
import 'package:cc206_sign_wave/features/exercise_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(115, 31, 31, 31)),
        useMaterial3: true,
      ),
      home: exercise(),
    );
  }
}
//haha ily
