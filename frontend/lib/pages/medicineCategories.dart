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
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:
                            AssetImage('assets/photo_2023-12-04_12-24-38.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 10), // Add some space between the image and text
                  Text(
                    'Your Text Here',
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
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:
                            AssetImage('assets/photo_2023-12-04_12-24-38.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 10), // Add some space between the image and text
                  Text(
                    'Your Text Here',
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
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:
                            AssetImage('assets/photo_2023-12-04_12-24-38.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 10), // Add some space between the image and text
                  Text(
                    'Your Text Here',
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
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:
                            AssetImage('assets/photo_2023-12-04_12-24-38.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 10), // Add some space between the image and text
                  Text(
                    'Your Text Here',
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
