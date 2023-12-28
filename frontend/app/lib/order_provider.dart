import 'package:flutter/material.dart';
import 'package:frontend/pages/OrderedItemsPage.dart';

class OrderProvider with ChangeNotifier {
  List<Order> orders = [];

  void addOrder(Order order) {
    orders.add(order);
    notifyListeners();
  }
}
