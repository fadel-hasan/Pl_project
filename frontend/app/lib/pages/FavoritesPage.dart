import 'package:flutter/material.dart';
import 'package:frontend/order_provider.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Medicines'),
        backgroundColor: Color(0xff17A4A1),
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          List<String> favoriteMedicines = favoritesProvider.favoriteMedicines;

          return ListView.builder(
            itemCount: favoriteMedicines.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(favoriteMedicines[index]),
                // Add more details if needed
              );
            },
          );
        },
      ),
    );
  }
}
