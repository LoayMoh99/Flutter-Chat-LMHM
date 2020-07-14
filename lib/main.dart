import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/screens/chat_Screen.dart';
import 'package:flutter_chat_ui_starter/screens/login_screen.dart';
import 'package:flutter_chat_ui_starter/screens/menu_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LoA'a Chat",
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Color(0xFFFEF9EB),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/chat': (context) => ChatScreen(),
        '/home': (context) => ResideMenuPage(),
      },
    );
  }
}
