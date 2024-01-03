import 'package:flutter/material.dart';
import 'package:frontend/order_provider.dart';
import 'package:frontend/pages/OrderedItemsPage.dart';
import 'package:provider/provider.dart';

class MedicineDetailsPage extends StatefulWidget {
  final String medicineName;
  final String sientificName;
  final String medicineCategory;
  final String manufactureCompany;
  final String quantity;
  final String expirationDate;
  final String price;
  final String imagePath;

  MedicineDetailsPage({
    required this.medicineName,
    required this.sientificName,
    required this.medicineCategory,
    required this.manufactureCompany,
    required this.quantity,
    required this.expirationDate,
    required this.price,
    required this.imagePath,
  });
  @override
  _MedicineDetailsPageState createState() => _MedicineDetailsPageState();
}

class _MedicineDetailsPageState extends State<MedicineDetailsPage> {
  int items = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Details'),
        backgroundColor: Color(0xff17A4A1),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/photo_2023-12-29_17-37-32.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(
                    255, 220, 240, 246), // Set the background color to white
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.asset(
                    widget.imagePath, // Make sure imagePath is defined
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(width: 16),
                  buildText('Scientific Name:   ', widget.sientificName),
                  buildText('Medicine Name:   ', widget.medicineName),
                  buildText('Medicine Category:   ', widget.medicineCategory),
                  buildText(
                      'Manufacture Company:   ', widget.manufactureCompany),
                  buildText('Quantity:   ',widget.quantity),
                  buildText('Expiration Date:   ', widget.expirationDate),
                  buildText('Price:   ', widget.price),
                  ElevatedButton(
                    onPressed: () {
                      String itemName = widget.medicineName;
                      int orderedQuantity = 50 - items;
                      String status = 'In Preparation';
                      bool isPaid =
                          false; // Replace false with your actual payment status

                      Order order = Order(
                        itemName: itemName,
                        quantity: orderedQuantity,
                        status: status,
                        isPaid: isPaid,
                      );

                      final orderProvider =
                          Provider.of<OrderProvider>(context, listen: false);
                      orderProvider.addOrder(order);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderedItemsPage()),
                      );

                      setState(() {
                        items--;
                      });
                      print(items);
                    },
                    child: Text('Order One Item'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      backgroundColor: Color(0xff1DC2D6),
                      maximumSize: Size(150, 60),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildText(String label, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      SizedBox(height: 16),
      Expanded(
        child: Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff17A4A1), // Set the color of the value text
          ),
        ),
      ),
    ],
  );
}
