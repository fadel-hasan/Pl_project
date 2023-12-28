import 'package:flutter/material.dart';
import 'package:project/pages/wepadd_medican2.dart';
import 'package:project/pages/medicine_list.dart';

class WepHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff17A4A1),
        title: Text('Available medicine'),
      ),
      body: MedicineListPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMedicinePage()),
          );
        },
        backgroundColor: Color(0xff17A4A1), // Set the background color to blue
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}
