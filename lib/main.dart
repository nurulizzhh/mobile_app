import 'package:flutter/material.dart';
import 'package:mobile_app/pages/onboarding_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SafeArea(
        child: SplashScreen(),) 
    );
  }
}

