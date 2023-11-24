import 'package:flutter/material.dart';
import 'package:cc206_sign_wave/features/sms.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: sms(),
    );
  }
}
