import 'package:flutter/material.dart';
import 'package:cc206_sign_wave/features/exercise_page.dart';
import 'package:cc206_sign_wave/features/lesson_page.dart';
import 'package:cc206_sign_wave/features/sms.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(115, 31, 31, 31)),
        useMaterial3: true,
      ),

      navigatorKey: navigatorKey,
      initialRoute: '/lessons', 
      routes: {
        '/exercise': (context) => Exercise(),
        '/lessons': (context) => Lessons(),
        '/chat': (context) => Sms(),
      },
    );
  }
}
