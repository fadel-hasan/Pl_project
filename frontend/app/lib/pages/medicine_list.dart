import 'package:flutter/material.dart';
import 'package:frontend/order_provider.dart';
import 'package:frontend/pages/FavoritesPage.dart';
import 'package:frontend/pages/logout_page.dart';
import 'package:frontend/pages/OrderedItemsPage.dart';
import 'package:frontend/pages/medicine_details_page.dart';
import 'package:frontend/my_drawer_header.dart';
import 'package:provider/provider.dart';

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
    'assets/photo_2023-12-26_12-21-33.jpg',
    'assets/photo_2023-12-26_12-21-37.jpg',
    'assets/photo_2023-12-26_12-21-44.jpg',
    'assets/photo_2023-12-26_12-21-49.jpg',
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
                delegate: MySearchDelegate(
                  medicineNames: medicineNames,
                  medicineCategories: medicineCategories,
                ),
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
              trailing: IconButton(
                icon: Icon(
                  Provider.of<FavoritesProvider>(context)
                          .favoriteMedicines
                          .contains(medicineNames[index])
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {
                  var favoritesProvider =
                      Provider.of<FavoritesProvider>(context, listen: false);

                  if (favoritesProvider.favoriteMedicines
                      .contains(medicineNames[index])) {
                    favoritesProvider.removeFromFavorites(medicineNames[index]);
                  } else {
                    favoritesProvider.addToFavorites(medicineNames[index]);
                  }
                },
              ),
              onTap: () {
                _navigateToMedicineDetailsPage(context, medicineNames[index],
                    medicineCategories[index], medicineImages[index]);
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

  void _navigateToMedicineDetailsPage(BuildContext context, String medicineName,
      String medicineCategory, String medicineImage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MedicineDetailsPage(
          medicineName: medicineName,
          medicineCategory: medicineCategory,
          medicineImage: medicineImage,
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  final List<String>? medicineNames;
  final List<String>? medicineCategories;
  TextEditingController searchController = TextEditingController();

  MySearchDelegate({
    required this.medicineNames,
    required this.medicineCategories,
  });

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
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MedicineDetailsPage(
                  medicineName: searchByName ? results[index] : '',
                  medicineCategory: searchByName ? '' : results[index],
                  medicineImage: searchByName ? '' : results[index],
                  // Add additional parameters if needed
                ),
              ),
            );
          },
        );
      },
    );
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
          menuItem("Favorites Page", () {
            // Navigate to Notifications page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritesPage()),
            );
          }),
          menuItem("Ordered Items", () {
            // Navigate to Notifications page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderedItemsPage()),
            );
          }),
          menuItem("Log Out", () {
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
