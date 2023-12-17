import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/widgets/custom_button.dart';

class Medicine extends StatefulWidget {
  Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  int items = 50;

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
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Row(
            children: [
              Spacer(
                flex: 1,
              ),
              Text(
                'Sientific Name:\n'
                'Medecine Name:\n'
                'Medicine Category:\n'
                'Manufacture Company:\n'
                'Quantity:\n'
                'Expiration Date:\n'
                'Price:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff17A4A1),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                '\n'
                'Panadol\n'
                'Setamol\n'
                'PainKiller\n'
                'EbnAlhaethem\n'
                '$items\n'
                '10/10/2026\n'
                '1000 syp\n',
                style: TextStyle(fontSize: 16, color: Color(0xff17A4A1)),
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
      ),
    );
  }
}
