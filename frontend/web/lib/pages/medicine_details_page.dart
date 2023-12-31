import 'package:flutter/material.dart';

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
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 600,
                    height: 800,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 220, 240, 246),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          widget.imagePath,
                          width: 200,
                          height: 200,
                        ),
                        SizedBox(height: 16),
                        buildText('Scientific Name:', widget.sientificName),
                        buildText('Medicine Name:', widget.medicineName),
                        buildText(
                            'Medicine Category:', widget.medicineCategory),
                        buildText(
                            'Manufacture Company:', widget.manufactureCompany),
                        buildText('Quantity:', items.toString()),
                        buildText('Expiration Date:', widget.expirationDate),
                        buildText('Price:', widget.price),
                        SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              items++;
                            });
                            print(items);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff17A4A1),
                            ), // Set the background color to blue
                          ),
                          child: Text('Add One Item'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildText(String label, String value) {
  return Column(
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
      Text(
        value,
        style: TextStyle(
          fontSize: 16,
          color: Color(0xff17A4A1),
        ),
      ),
    ],
  );
}
