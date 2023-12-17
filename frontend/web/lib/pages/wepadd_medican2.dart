import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/pages/confirm_addmedican.dart';
import 'medican.dart';

class AddMedicinePage extends StatefulWidget {
  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController scientificNameController =
      TextEditingController();
  final TextEditingController commercialNameController =
      TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController manufacturerController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  Future<void> addMedicine() async {
    final medicine = Medicine(
      scientificName: scientificNameController.text,
      commercialName: commercialNameController.text,
      category: categoryController.text,
      manufacturer: manufacturerController.text,
      quantity: int.parse(quantityController.text),
      expiryDate: expiryDateController.text,
      price: double.parse(priceController.text),
    );

    final response = await http.post(
      Uri.parse('your_add_medicine_endpoint'),
      body: medicine.toJson(),
    );

    if (response.statusCode == 200) {
      print('Medicine added successfully.');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ConfirmationPage(medicine: medicine)),
      );
    } else {
      throw Exception('Failed to add medicine.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Medicine')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: scientificNameController,
                decoration: InputDecoration(
                  labelText: 'Scientific Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the scientific name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: commercialNameController,
                decoration: InputDecoration(
                  labelText: 'Commercial Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the commercial name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(
                  labelText: 'Category',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the category';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: manufacturerController,
                decoration: InputDecoration(
                  labelText: 'Manufacture Company',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the manufacture company';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: quantityController,
                decoration: InputDecoration(
                  labelText: 'Quantity Available',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the quantity available';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: expiryDateController,
                decoration: InputDecoration(
                  labelText: 'Expiration Date',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the expiration date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save the form and add the new medicine
                  }
                },
                child: Text('Add Medicine'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
