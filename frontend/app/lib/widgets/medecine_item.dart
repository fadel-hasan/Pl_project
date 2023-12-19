import 'package:flutter/material.dart';

class MedicineItem extends StatelessWidget {
  final String imagePath;
  final String medicineName;
  final String sientificName;
  final String manufactureCompany;
  final String quantity;
  final String expirationDate;
  final String price;
  String medicineCategories;

  final VoidCallback? onPressed;
  final String text;

  MedicineItem({
    required this.imagePath,
    required this.medicineName,
    required this.sientificName,
    required this.medicineCategories,
    required this.manufactureCompany,
    required this.quantity,
    required this.expirationDate,
    required this.price,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Sientific Name:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff17A4A1),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Medecine Name:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff17A4A1),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Medicine Category:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff17A4A1),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Manufacture Company:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff17A4A1),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Quantity:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff17A4A1),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Expiration Date:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff17A4A1),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Price:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff17A4A1),
                ),
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                medicineName,
                style: TextStyle(fontSize: 16, color: Color(0xff17A4A1)),
              ),
              SizedBox(height: 8),
              Text(
                sientificName,
                style: TextStyle(fontSize: 16, color: Color(0xff17A4A1)),
              ),
              SizedBox(height: 8),
              Text(
                medicineCategories,
                style: TextStyle(fontSize: 16, color: Color(0xff17A4A1)),
              ),
              SizedBox(height: 8),
              Text(
                manufactureCompany,
                style: TextStyle(fontSize: 16, color: Color(0xff17A4A1)),
              ),
              SizedBox(height: 8),
              Text(
                quantity,
                style: TextStyle(fontSize: 16, color: Color(0xff17A4A1)),
              ),
              SizedBox(height: 8),
              Text(expirationDate,
                  style: TextStyle(fontSize: 16, color: Color(0xff17A4A1))),
              SizedBox(height: 8),
              Text(price,
                  style: TextStyle(fontSize: 16, color: Color(0xff17A4A1))),
            ],
          ),
          Spacer(flex: 10),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(text),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: Color(0xff1DC2D6),
                maximumSize: Size(150, 60)),
          ),
          Spacer(
            flex: 1,
          ),
          Image.asset(imagePath,
              width: 100, height: 100), // This is the image widget
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
