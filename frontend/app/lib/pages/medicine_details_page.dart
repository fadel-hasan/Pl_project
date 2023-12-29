import 'package:flutter/material.dart';
import 'package:frontend/Components/medecine_item.dart';
import 'package:frontend/order_provider.dart';
import 'package:frontend/pages/OrderedItemsPage.dart';
import 'package:provider/provider.dart';

class MedicineDetailsPage extends StatefulWidget {
  final String medicineName;
  final String medicineCategory;
  final String medicineImage;

  const MedicineDetailsPage({
    Key? key,
    required this.medicineName,
    required this.medicineCategory,
    required this.medicineImage,
  }) : super(key: key);
  @override
  State<MedicineDetailsPage> createState() => _MedicineDetailsPageState();
}

class _MedicineDetailsPageState extends State<MedicineDetailsPage> {
  List<String> medicineCategories = [
    'Pain Relief',
    'Antibiotics',
    'Allergy Medications',
    'Digestive Health',
  ];
  int items1 = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 247, 247),
      appBar: AppBar(
        backgroundColor: Color(0xff17A4A1),
        title: Text('Medicine Details'),
      ),
      body: ListView(padding: EdgeInsets.all(16), children: [
        MedicineItem(
          medicineName: widget.medicineName,
          sientificName: '',
          medicineCategories: '',
          manufactureCompany: '',
          quantity: '$items1',
          expirationDate: '',
          price: '',
          imagePath: 'assets/photo_2023-12-16_16-31-43.jpg',
          onPressed: () {
            String itemName =
                widget.medicineName; // Use widget.medicineName here
            int orderedQuantity = 50 - items1;
            String status = 'In Preparation';

            Order order = Order(
              itemName: itemName,
              quantity: orderedQuantity,
              status: status,
            );

            final orderProvider =
                Provider.of<OrderProvider>(context, listen: false);
            orderProvider.addOrder(order);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderedItemsPage()),
            );

            setState(() {
              items1--;
            });
            print(items1);
          },
          text: 'Order One item',
        ),
      ]),
    );
  }
}
