import 'package:flutter/material.dart';
import 'package:therapistschedules/src/screen/login_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Login App',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: LoginForm(),
    );
  }
}
