import 'package:flutter/material.dart';

class MedicineCategory extends StatelessWidget {
  const MedicineCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 247, 247),
      appBar: AppBar(
        backgroundColor: Color(0xff17A4A1),
        title: Text('Medicine Categories'),
      ),
      body: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 5,
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        AssetImage('assets/photo_2023-12-15_18-32-05.jpg'),
                  ),
                  SizedBox(
                      height: 10), // Add some space between the image and text
                  Text(
                    'Vitamens',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 2,
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        AssetImage('assets/photo_2023-12-15_17-46-46.jpg'),
                  ),
                  SizedBox(
                      height: 10), // Add some space between the image and text
                  Text(
                    'Heart Medications',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 5,
              )
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 5,
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        AssetImage('assets/photo_2023-12-15_17-25-40.jpg'),
                  ),
                  SizedBox(
                      height: 10), // Add some space between the image and text
                  Text(
                    'Neurological Medications',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 2,
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        AssetImage('assets/photo_2023-12-15_18-32-10.jpg'),
                  ),

                  SizedBox(
                      height: 10), // Add some space between the image and text
                  Text(
                    'PainKillers',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 5,
              )
            ],
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
