import 'package:cybdom_hotel/global.dart';
import 'package:cybdom_hotel/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          fillColor: MyColors.lightBlue,
          filled: true,
        ),
      ),
      home: AuthScreen(
        authType: AuthType.login,
      ),
      routes: {
        'intro': (context) => IntroScreen(),
        'home': (context) => HomeScreen(),
        'login': (context) => AuthScreen(
              authType: AuthType.login,
            ),
        'signup': (context) => AuthScreen(
              authType: AuthType.signup,
            ),
      },
    );
  }
}
