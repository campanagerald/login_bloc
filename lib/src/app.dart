import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'providers/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: new MaterialApp(
        title: 'Log Me In!',
        home: new Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
