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
      backgroundColor: Color.fromARGB(255, 227, 247, 247),
      appBar: AppBar(
          backgroundColor: Color(0xff17A4A1), title: Text('Add Medicine')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildTextFormField(
                controller: scientificNameController,
                label: 'Scientific Name',
              ),
              SizedBox(height: 15),
              _buildTextFormField(
                controller: commercialNameController,
                label: 'Commercial Name',
              ),
              SizedBox(height: 15),
              _buildTextFormField(
                controller: categoryController,
                label: 'Category',
              ),
              SizedBox(height: 15),
              _buildTextFormField(
                controller: manufacturerController,
                label: 'Manufacture Company',
              ),
              SizedBox(height: 15),
              _buildTextFormField(
                controller: quantityController,
                label: 'Quantity Available',
              ),
              SizedBox(height: 15),
              _buildTextFormField(
                controller: expiryDateController,
                label: 'Expiration Date',
              ),
              SizedBox(height: 15),
              _buildTextFormField(
                controller: priceController,
                label: 'Price',
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save the form and add the new medicine
                    addMedicine();
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(
                      0xff17A4A1), // Change this color to your desired color
                ),
                child: Text(
                  'Add Medicine',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}
