import 'package:flutter/material.dart';
import 'package:project/widgets/medicine_item.dart';

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
  int items2 = 50;

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
          medicineName: '',
          sientificName: '',
          medicineCategories: '',
          manufactureCompany: '',
          quantity: '$items1',
          expirationDate: '',
          price: '',
          imagePath: '',
          onPressed: () {
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
