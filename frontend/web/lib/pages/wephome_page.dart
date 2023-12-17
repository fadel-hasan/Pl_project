import 'package:flutter/material.dart';
import 'package:project/pages/wepadd_medican2.dart';

class WepHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          Center(
            child: TextButton(
              child: Text('Add Medican'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddMedicinePage()),
                );
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          child: TextButton(
            child: Text('Add Medican'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMedicinePage()),
              );
            },
          ),
        ),
      ),
    );
  }
}
