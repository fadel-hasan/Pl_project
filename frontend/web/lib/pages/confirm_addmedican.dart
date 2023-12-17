import 'package:flutter/material.dart';

import 'medican.dart';

class ConfirmationPage extends StatelessWidget {
  final Medicine medicine;

  ConfirmationPage({required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Medicine Added')),
      body: Center(
        child: Text('Medicine ${medicine.scientificName} added successfully.'),
      ),
    );
  }
}
