import 'package:flutter/material.dart';
import 'package:frontend/pages/medicine_details_page.dart';

class MedicineListByCategoryPage extends StatelessWidget {
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

  final String category;
  final List<String> medicineNames;
  final List<String> sientificNames;
  final List<String> medicineCategories;
  final List<String> medicineImages;
  final List<String> manufactureCompanies;
  final List<String> expirationDates;

  MedicineListByCategoryPage({
    required this.category,
    required this.medicineNames,
    required this.sientificNames,
    required this.medicineCategories,
    required this.medicineImages,
    required this.manufactureCompanies,
    required this.expirationDates,
  });

  @override
  Widget build(BuildContext context) {
    // Filter the medicines based on the selected category
    List<String> medicinesInCategory = medicineNames
        .where((name) =>
            medicineCategories[medicineNames.indexOf(name)] == category)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Medicines'),
      ),
      body: ListView.builder(
        itemCount: medicinesInCategory.length,
        itemBuilder: (context, index) {
          String medicineName = medicinesInCategory[index];
          String scientificName = sientificNames[index];
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
                category,
                manufactureCompany,
                expirationDate,
              );
            },
          );
        },
      ),
    );
  }
}
