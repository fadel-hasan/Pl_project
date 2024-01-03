import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/cubit/cubit.dart';
import 'package:frontend/cubit/states.dart';
import 'package:frontend/order_provider.dart';
import 'package:frontend/pages/FavoritesPage.dart';
import 'package:frontend/pages/all_order/all_order.dart';
import 'package:frontend/pages/listSearchByCategoryPage.dart';
import 'package:frontend/pages/logout_page.dart';
import 'package:frontend/pages/OrderedItemsPage.dart';
import 'package:frontend/pages/medicine_details_page.dart';
import 'package:frontend/my_drawer_header.dart';
import 'package:frontend/pages/search/search_page.dart';
import 'package:provider/provider.dart';

import 'all_gruds_category/all_grud_category.dart';

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
      String medicineCategory,
      String imagePath,
      String scientificName,
      String manufactureCompany,
      String expirationDate) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MedicineDetailsPage(
          medicineName: medicineName,
          sientificName: scientificName,
          medicineCategory: medicineCategory,
          manufactureCompany: manufactureCompany,
          quantity: '1',
          // You can replace with actual quantity value
          expirationDate: expirationDate,
          price: '10.0',
          // You can replace with actual price value
          imagePath: imagePath,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      var list = AppCubit.get(context).list;
      var list2 = AppCubit.get(context).categoryList;
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 227, 247, 247),
        appBar: AppBar(
          backgroundColor: Color(0xff17A4A1),
          title: Text('ِAvailable Medecine'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllOrder(),
            ),
            );
          },
          child: Icon(Icons.menu),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: 80,
                width: double.infinity,
                color:  Color.fromARGB(255, 227, 247, 247),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      AppCubit.get(context).getGrudByCategory(list2[index].id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllGrudsCategory(
                            name: list2[index].name,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 90,
                      height: 60,
                      decoration: BoxDecoration(
                          color:  Colors.blue,
                          border: Border.all(color: Colors.black, width: 1.0),// border: Border.all(),
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(list2[index].name),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 60,
                  ),
                  itemCount: list2.length,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MedicineDetailsPage(
                              medicineName: list[index].name,
                              sientificName: list[index].scName,
                              medicineCategory: list[index].nameCategory,
                              manufactureCompany: list[index].manName,
                              quantity: list[index].quantity,
                              expirationDate: list[index].date,
                              price: list[index].price,
                              imagePath: 'assets/photo_2023-12-26_12-21-33.jpg',
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(
                              'assets/photo_2023-12-26_12-21-33.jpg',
                            ),
                          ),
                          title: Text(list[index].name),
                          subtitle: Text(list[index].nameCategory),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: list[index].isfav == true
                                  ? Colors.red
                                  : Colors.white,
                            ),
                            onPressed: () {
                              // var favoritesProvider =
                              //     Provider.of<FavoritesProvider>(context,
                              //         listen: false);
                              //
                              // if (favoritesProvider.favoriteMedicines
                              //     .contains(medicineNames[index])) {
                              //   favoritesProvider
                              //       .removeFromFavorites(medicineNames[index]);
                              // } else {
                              //   favoritesProvider
                              //       .addToFavorites(medicineNames[index]);
                              // }
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
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
    });
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
          quantity: '1',
          // You can replace with actual quantity value
          expirationDate: expirationDates[index],
          price: '10.0',
          // You can replace with actual price value
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
          menuItem("Favorites Page", Icons.favorite, () {
            // Navigate to Favorites page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritesPage()),
            );
          }),
          menuItem("Ordered Items", Icons.local_hospital, () {
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
