import 'package:flutter/material.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/pages/medicine_page.dart';
import 'package:project/pages/wephome_page.dart';

void main() {
  runApp(PharmacyApp());
}

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      debugShowCheckedModeBanner: false,
      routes: {
        'LoginPage': (context) => LoginPage(),
        'Medicine': (context) => WepHomePage(),
      },
      initialRoute: 'LoginPage',
    );
  }
}
