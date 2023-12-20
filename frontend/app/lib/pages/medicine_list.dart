import 'package:flutter/material.dart';
import 'package:frontend/pages/logout_page.dart';
import 'package:frontend/pages/medicationOrder.dart';
import 'package:frontend/pages/medicine_details_page.dart';
import 'package:frontend/pages/settingsScreen.dart';

class MedicineListPage extends StatelessWidget {
  final List<String> medicineNames = ['Panado', 'Clarentien'];
  final List<String> medicineCategories = [
    'Pain Relief',
    'Allergy Medications'
  ];

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
              icon: const Icon(Icons.search)),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
              if (value == 'Settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SettingsScreen()), // Navigate to SettingsScreen
                );
              } else if (value == 'Log Out') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogOut()),
                );
              } else if (value == 'Medication Orders') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicationOrders()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return ['Settings', 'Log Out', 'Medication Orders']
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: medicineNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(medicineNames[index]),
            subtitle: Text(medicineCategories[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicineDetailsPage(),
                ),
              );
            },
          );
        },
      ),
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
