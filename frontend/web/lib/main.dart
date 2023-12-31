import 'package:flutter/material.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/my_drawer_header.dart';
import 'package:project/pages/ordersListPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          OrderProvider(), // Create an instance of your provider
      child: PharmacyApp(),
    ),
  );
}

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      routes: {
        'LoginPage': (context) => LoginPage(),
        'MyDrawerHeader': (context) => MyHeaderDrawer(),
        'OrderedItemsPage': (context) => OrderedItemsPage(),
      },
      initialRoute: 'LoginPage',
    );
  }
}
