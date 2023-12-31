import 'package:flutter/material.dart';

class MedicineItem extends StatelessWidget {
  final int index;
  final String imagePath;
  final String medicineName;
  final String sientificName;
  final String manufactureCompany;
  final String quantity;
  final String expirationDate;
  final String price;
  String medicineCategories;

  MedicineItem({
    required this.index,
    required this.imagePath,
    required this.medicineName,
    required this.sientificName,
    required this.medicineCategories,
    required this.manufactureCompany,
    required this.quantity,
    required this.expirationDate,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Column(
                children: [
                  buildText('Scientific Name:', sientificName),
                  buildText('Medicine Name:', medicineName),
                  buildText('Medicine Category:', medicineCategories),
                  buildText('Manufacture Company:', manufactureCompany),
                  buildText('Quantity:', quantity),
                  buildText('Expiration Date:', expirationDate),
                  buildText('Price:', price),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              Image.asset(
                imagePath,
                width: 100,
                height: 100,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildText(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xff17A4A1),
          ),
        ),
        SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(fontSize: 12, color: Color(0xff17A4A1)),
        ),
        SizedBox(height: 2),
      ],
    );
  }
}
