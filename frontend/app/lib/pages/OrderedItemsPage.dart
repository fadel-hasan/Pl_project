import 'package:flutter/material.dart';
import 'package:frontend/order_provider.dart';
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
              String status =
                  orders[index].status; // Get the status of the order
              IconData statusIcon = Icons.check_circle; // Default status icon

              if (status == 'In Preparation') {
                statusIcon =
                    Icons.access_time; // Icon for "In Preparation" status
              } else if (status == 'Sent') {
                statusIcon = Icons.send; // Icon for "Sent" status
              } else if (status == 'Received') {
                statusIcon = Icons.done; // Icon for "Received" status
              }

              return ListTile(
                title: Text('Item: ${orders[index].itemName}'),
                subtitle: Row(
                  children: [
                    Text('Quantity: ${orders[index].quantity}'),
                    SizedBox(width: 8),
                    Icon(statusIcon), // Display the status icon
                    Icon(
                      orders[index].isPaid
                          ? Icons.check_circle
                          : Icons
                              .cancel, // Use check or cancel icon based on isPaid
                      color: orders[index].isPaid
                          ? Colors.green
                          : Colors.red, // Use green for paid, red for not paid
                    ),
                  ],
                ),
              );
            },
          );
        }));
  }
}

class Order {
  final String itemName;
  final int quantity;
  String status;
  bool isPaid;

  Order({
    required this.itemName,
    required this.quantity,
    required this.status,
    required this.isPaid,
  });
}
