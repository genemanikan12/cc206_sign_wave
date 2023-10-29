import 'package:flutter/material.dart';
import 'package:cc206_sign_wave/features/sms.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',

      home: const sms(),
      );
  }
}