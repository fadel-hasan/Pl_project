import 'package:flutter/material.dart';
import 'package:frontend/pages/logout_page.dart';
import 'package:frontend/pages/medicationOrder.dart';
import 'package:frontend/pages/medicine_details_page.dart';
import 'package:frontend/pages/settingsScreen.dart';
import 'package:frontend/my_drawer_header.dart';
import 'package:frontend/pages/notificationPage.dart';

class MedicineListPage extends StatelessWidget {
  final List<String> medicineNames = [
    'Panadol',
    'Clarentien',
    'Augmantin',
    'B-complex'
  ];
  final List<String> medicineCategories = [
    'Pain Relief',
    'Allergy Medications',
    'Antibiotics',
    'Digestive Health'
  ];
  final List<String> medicineImages = [
    'assets/images.jpg',
    'assets/images (2).jpg',
    'assets/download.jpg',
    'assets/a38891.jpg',
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
        ],
      ),
      body: ListView.builder(
        itemCount: medicineNames.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(medicineImages[index]),
              ),
              title: Text(medicineNames[index]),
              subtitle: Text(medicineCategories[index]),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedicineDetailsPage(),
                  ),
                );
              },
            ),
          );
        },
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
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

class MyDrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem("Notifications", () {
            // Navigate to Notifications page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationsPage()),
            );
          }),
          menuItem("Settings", () {
            // Navigate to Settings page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          }),
          menuItem("Medication Orders", () {
            // Navigate to Medication Orders page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MedicationOrders()),
            );
          }),
          menuItem("log out", () {
            // Navigate to Medication Orders page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogOut()),
            );
          }),
        ],
      ),
    );
  }

  Widget menuItem(String title, VoidCallback onPressed) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
