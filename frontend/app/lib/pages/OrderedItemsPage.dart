import 'package:flutter/material.dart';
import 'package:frontend/order_provider.dart';
import 'package:frontend/pages/medicine_details_page.dart';
import 'package:provider/provider.dart';

class OrderedItemsPage extends StatefulWidget {
  const OrderedItemsPage({super.key});

  @override
  State<OrderedItemsPage> createState() => _OrderedItemsPageState();
}

class _OrderedItemsPageState extends State<OrderedItemsPage> {
  List<Order> orders = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 227, 247, 247),
        appBar: AppBar(
          backgroundColor: Color(0xff17A4A1),
          title: Text('Ordered Items'),
        ),
        body: Consumer<OrderProvider>(builder: (context, orderProvider, child) {
          List<Order> orders = orderProvider.orders;
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item: ${orders[index].itemName}'),
                subtitle: Text('Quantity: ${orders[index].quantity}'),
              );
            },
          );
        }));
  }
}

class Order {
  final String itemName;
  final int quantity;

  Order({required this.itemName, required this.quantity});
}
