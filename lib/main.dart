import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/settings_controller.dart';
import 'controllers/todo_controller.dart';
import 'views/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SettingsController(),
        ),
        ChangeNotifierProvider(
          create: (_) => TodoViewModel(),
        ),
      ],
      child: MaterialApp(
        home: HomeScreen(),

      ),
    );
  }
}
