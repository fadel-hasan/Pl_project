import 'package:flutter/material.dart';
import 'package:project/pages/listSearchByCategoryPage.dart';
import 'package:project/pages/logout_page.dart';

import 'package:project/pages/medicine_details_page.dart';

import 'package:project/my_drawer_header.dart';
import 'package:project/pages/notificationPage.dart';
import 'package:project/pages/ordersListPage.dart';
import 'package:project/pages/webadd_medican.dart';

class MedicineListPage extends StatelessWidget {
  final List<String> medicineNames = [
    'Panadol',
    'Clarentien',
    'Augmantin',
    'B-complex'
  ];
  final List<String> sientificNames = [
    'painKiller',
    'clarentien',
    'augmantien',
    'b-complex'
  ];
  final List<String> medicineCategories = [
    'Pain Relief',
    'Allergy Medications',
    'Antibiotics',
    'Digestive Health'
  ];
  final List<String> medicineImages = [
    'assets/photo_2023-12-26_12-21-33.jpg',
    'assets/photo_2023-12-26_12-21-37.jpg',
    'assets/photo_2023-12-26_12-21-44.jpg',
    'assets/photo_2023-12-26_12-21-49.jpg',
  ];
  final List<String> manufactureCompanies = [
    'MASSOUD GROUP',
    'unipharma',
    'EbnAlhaethem',
    'unipharma'
  ];
  final List<String> expirationDates = [
    '2/2/2024',
    '5/10/2024',
    '25/6/2024',
    '4/4/2025'
  ];
  void _navigateToMedicineDetailsPage(
    BuildContext context,
    String medicineName,
    String imagePath,
    String scientificName,
    String medicineCategory,
    String manufactureCompany,
    String expirationDate,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MedicineDetailsPage(
          medicineName: medicineName,
          sientificName: scientificName,
          medicineCategory: medicineCategory,
          manufactureCompany: manufactureCompany,
          quantity: '1', // You can replace with actual quantity value
          expirationDate: expirationDate,
          price: '10.0', // You can replace with actual price value
          imagePath: imagePath,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 247, 247),
      appBar: AppBar(
        backgroundColor: Color(0xff17A4A1),
        title: Text('Available Medecine'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
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
                _navigateToMedicineDetailsPage(
                    context,
                    medicineNames[index],
                    medicineImages[index],
                    sientificNames[index],
                    medicineCategories[index],
                    manufactureCompanies[index],
                    expirationDates[index]);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMedicinePage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff17A4A1),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  void _navigateToMedicineDetailsPage(
    BuildContext context,
    String medicineName,
    String imagePath,
    String scientificName,
    String medicineCategory,
    String manufactureCompany,
    String expirationDate,
  ) {
    int index = medicineNames.indexOf(medicineName);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MedicineDetailsPage(
          medicineName: medicineNames[index],
          sientificName: sientificNames[index],
          medicineCategory: medicineCategories[index],
          manufactureCompany: manufactureCompanies[index],
          quantity: '1', // You can replace with actual quantity value
          expirationDate: expirationDates[index],
          price: '10.0', // You can replace with actual price value
          imagePath: medicineImages[index],
        ),
      ),
    );
  }

  final List<String> medicineNames = [
    'Panadol',
    'Clarentien',
    'Augmantin',
    'B-complex'
  ];
  final List<String> sientificNames = [
    'painKiller',
    'clarentien',
    'augmantien',
    'b-complex'
  ];
  final List<String> medicineCategories = [
    'Pain Relief',
    'Allergy Medications',
    'Antibiotics',
    'Digestive Health'
  ];
  final List<String> medicineImages = [
    'assets/photo_2023-12-26_12-21-33.jpg',
    'assets/photo_2023-12-26_12-21-37.jpg',
    'assets/photo_2023-12-26_12-21-44.jpg',
    'assets/photo_2023-12-26_12-21-49.jpg',
  ];
  final List<String> manufactureCompanies = [
    'MASSOUD GROUP',
    'unipharma',
    'EbnAlhaethem',
    'unipharma'
  ];
  final List<String> expirationDates = [
    '2/2/2024',
    '5/10/2024',
    '25/6/2024',
    '4/4/2025'
  ];
  TextEditingController searchController = TextEditingController();

  bool searchByName = true;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
            searchController.clear();
          }
        },
      ),
      IconButton(
        icon: const Icon(Icons.swap_horiz),
        onPressed: () {
          // Switch between searching by name and category
          searchByName = !searchByName;
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return TextField(
      controller: searchController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search',
        border: InputBorder.none,
        prefixIcon: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            close(context, null);
          },
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> results = (searchByName ? medicineNames : medicineCategories)!
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    query = searchController.text;

    // Check if a single category is found
    if (results.length == 1 && !searchByName) {
      // Navigate to MedicineListByCategoryPage with the selected category
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MedicineListByCategoryPage(
              category: results[0],
              medicineNames: medicineNames,
              sientificNames: sientificNames,
              medicineCategories: medicineCategories,
              medicineImages: medicineImages,
              manufactureCompanies: manufactureCompanies,
              expirationDates: expirationDates,
            ),
          ),
        );
      });
    } else {
      // Continue with the original code for displaying medicine details
      return results.isNotEmpty
          ? ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                String medicineName = results[index];
                String scientificName = sientificNames[index];
                String medicineCategory = medicineCategories[index];
                String imagePath = medicineImages[index];
                String manufactureCompany = manufactureCompanies[index];
                String expirationDate = expirationDates[index];
                return ListTile(
                  title: Text(medicineName),
                  onTap: () {
                    _navigateToMedicineDetailsPage(
                      context,
                      medicineName,
                      imagePath,
                      scientificName,
                      medicineCategory,
                      manufactureCompany,
                      expirationDate,
                    );
                  },
                );
              },
            )
          : Center(
              child: Text('No results found'),
            );
    }

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions =
        (searchByName ? medicineNames : medicineCategories)!
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            searchController.text = suggestion;
            showResults(context);
          },
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
          menuItem("Orders List", Icons.local_hospital, () {
            // Navigate to Notifications page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderedItemsPage()),
            );
          }),
          menuItem("Log Out", Icons.logout, () {
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

  Widget menuItem(String title, IconData icon, VoidCallback onPressed) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(
                icon, // Display the provided icon
                color: Colors.black,
              ),
              SizedBox(width: 10),
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
