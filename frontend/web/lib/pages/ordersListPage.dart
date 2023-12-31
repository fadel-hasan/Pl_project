import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderedItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 247, 247),
      appBar: AppBar(
        backgroundColor: Color(0xff17A4A1),
        title: Text('Ordered Items'),
      ),
      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, child) {
          List<Order> orders = orderProvider.orders;
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item: ${orders[index].itemName}'),
                subtitle: Row(
                  children: [
                    Text('Quantity: ${orders[index].quantity}'),
                    SizedBox(width: 8),
                    DropdownButton<String>(
                      value: orders[index].status,
                      items: <String>['In Preparation', 'Sent', 'Received']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newStatus) {
                        if (newStatus != null) {
                          orderProvider.updateOrderStatus(index, newStatus);
                        }
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        orderProvider.togglePaymentStatus(index);
                      },
                      child: Text(orders[index].isPaid ? 'Not paid' : 'Paid'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class OrderProvider with ChangeNotifier {
  List<Order> orders = [
    Order(
        itemName: 'Item 1',
        quantity: 2,
        status: 'In Preparation',
        isPaid: false),
    Order(itemName: 'Item 2', quantity: 3, status: 'Received', isPaid: true),
    // Add more orders as needed
  ];

  void updateOrderStatus(int index, String newStatus) {
    orders[index].status = newStatus;
    notifyListeners();
  }

  void togglePaymentStatus(int index) {
    orders[index].isPaid = !orders[index].isPaid;
    notifyListeners();
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
