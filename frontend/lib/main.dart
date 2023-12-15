import 'package:flutter/material.dart';
import 'package:frontend/pages/login_page.dart';
import 'package:frontend/pages/medicineCategories.dart';
import 'package:frontend/pages/register_page.dart';

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
        'RegisterPage': (context) => RegisterPage(),
        'MedicineCategory': (context) => MedicineCategory()
      },
      initialRoute: 'LoginPage',
    );
  }
}
