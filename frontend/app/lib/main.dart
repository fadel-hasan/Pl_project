import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/cubit/cubit.dart';
import 'package:frontend/order_provider.dart';
import 'package:frontend/pages/OrderedItemsPage.dart';
import 'package:frontend/pages/login_page.dart';
import 'package:frontend/pages/logout_page.dart';
import 'package:frontend/pages/medicine_list.dart';
import 'package:frontend/pages/register_page.dart';
import 'package:frontend/pages/settingsScreen.dart';
import 'package:provider/provider.dart';
import 'package:frontend/my_drawer_header.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: PharmacyApp(),
    ),
  );
}

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getAllGrud()..getAllCategory()..getAllOrder(),
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
              theme: themeProvider.isDarkModeEnabled
                  ? ThemeData.dark()
                  : ThemeData.light(),
              debugShowCheckedModeBanner: false,
              routes: {
                'LoginPage': (context) => LoginPage(),
                'RegisterPage': (context) => RegisterPage(),
                'Medicine': (context) => MedicineListPage(),
                'SettingsScreen': (context) => SettingsScreen(),
                'MyDrawerHeader': (context) => MyHeaderDrawer(),
                'log out': (context) => LogOut(),
                'Ordered Items': (context) => OrderedItemsPage()
              },
              initialRoute: 'LoginPage',
            );
          },
        ),
      ),
    );
  }
}
