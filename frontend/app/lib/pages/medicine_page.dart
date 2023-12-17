import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/pages/login_page.dart';
import 'package:frontend/widgets/custom_button.dart';

class Medicine extends StatefulWidget {
  Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  List<String> medicineCategories = [
    'Pain Relief',
    'Antibiotics',
    'Allergy Medications',
    'Digestive Health',
  ];
  int items = 50;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 247, 247),
      appBar: AppBar(
        backgroundColor: Color(0xff17A4A1),
        title: Text('Available Medicine'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search for a category...',
              ),
            ),
            Container(
              width: double.infinity,
              height: 170,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sientific Name:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff17A4A1),
                        ),
                      ),
                      Text(
                        'Medecine Name:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff17A4A1),
                        ),
                      ),
                      Text(
                        'Medicine Category:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff17A4A1),
                        ),
                      ),
                      Text(
                        'Manufacture Company:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff17A4A1),
                        ),
                      ),
                      Text(
                        'Quantity:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff17A4A1),
                        ),
                      ),
                      Text(
                        'Expiration Date:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff17A4A1),
                        ),
                      ),
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
                    children: [
                      Text(
                        'Panadol',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff17A4A1)),
                      ),
                      Text(
                        'Setamol',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff17A4A1)),
                      ),
                      Text(
                        medicineCategories[0],
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff17A4A1)),
                      ),
                      Text(
                        'EbnAlhaethem',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff17A4A1)),
                      ),
                      Text(
                        '$items',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff17A4A1)),
                      ),
                      Text(
                        '10/10/2026',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff17A4A1)),
                      ),
                      Text(
                        '1000 syp',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff17A4A1)),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        items--;
                      });
                      print(items);
                    },
                    child: Text('Order One item'),
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
                  Image(
                    image: AssetImage('assets/photo_2023-12-16_16-31-43.jpg'),
                  ),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
