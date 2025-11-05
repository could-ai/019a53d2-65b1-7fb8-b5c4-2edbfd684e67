import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/board_screen.dart';
import 'screens/task_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClickUp Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/board': (context) => const BoardScreen(),
        '/task_detail': (context) => const TaskDetailScreen(),
      },
    );
  }
}