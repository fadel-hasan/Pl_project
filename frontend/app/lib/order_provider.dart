import 'package:flutter/material.dart';
import 'package:frontend/pages/OrderedItemsPage.dart';

class OrderProvider with ChangeNotifier {
  List<Order> orders = [];

  void addOrder(Order order) {
    orders.add(order);
    notifyListeners();
  }
}

class FavoritesProvider extends ChangeNotifier {
  List<String> _favoriteMedicines = [];

  List<String> get favoriteMedicines => _favoriteMedicines;

  void addToFavorites(String medicineName) {
    _favoriteMedicines.add(medicineName);
    notifyListeners();
  }

  void removeFromFavorites(String medicineName) {
    _favoriteMedicines.remove(medicineName);
    notifyListeners();
  }
}
