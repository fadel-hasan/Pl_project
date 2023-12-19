import 'package:flutter/material.dart';
import 'package:frontend/widgets/medecine_item.dart';

class medicine extends StatefulWidget {
  const medicine({super.key});

  @override
  State<medicine> createState() => _medicinDetailsState();
}

class _medicinDetailsState extends State<medicine> {
  List<String> medicineCategories = [
    'Pain Relief',
    'Antibiotics',
    'Allergy Medications',
    'Digestive Health',
  ];
  int items1 = 50;
  int items2 = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 247, 247),
      appBar: AppBar(
        backgroundColor: Color(0xff17A4A1),
        title: Text('Available Medicine'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(medicineCategories),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: ListView(padding: EdgeInsets.all(16), children: [
        MedicineItem(
          medicineName: 'Panado',
          sientificName: 'setamol',
          medicineCategories: medicineCategories[0],
          manufactureCompany: 'EbnAlhaethem',
          quantity: '$items1',
          expirationDate: '2/2/2024',
          price: '1000 syp',
          imagePath: 'assets/photo_2023-12-16_16-31-43.jpg',
          onPressed: () {
            setState(() {
              items1--;
            });
            print(items1);
          },
          text: 'Order One item',
        ),
        SizedBox(height: 16),
        MedicineItem(
          medicineName: 'clarentien',
          sientificName: 'alergy',
          medicineCategories: medicineCategories[2],
          manufactureCompany: 'EbnAlhaethem',
          quantity: '$items2',
          expirationDate: '2/2/2024',
          price: '1000 syp',
          imagePath: 'assets/photo_2023-12-16_16-31-43.jpg',
          onPressed: () {
            setState(() {
              items2--;
            });
            print(items2);
          },
          text: 'Order One item',
        ), // Add some space between the MedicineItem and the ElevatedButton
      ]),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<String> medicineCategories;

  CustomSearchDelegate(this.medicineCategories);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var category in medicineCategories) {
      if (category.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(category);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var category in medicineCategories) {
      if (category.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(category);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
