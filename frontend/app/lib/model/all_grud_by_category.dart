class AllGrudsByCategoryModel {
  final int id;
  final String name;
  final String scName;
  final String manName;
  final String price;
  final String quantity;
  final bool isfav;
  final String nameCompany;
  final String nameCategory;
  final dynamic date;

  AllGrudsByCategoryModel(
      {required this.id,
      required this.name,
      required this.scName,
      required this.manName,
      required this.price,
      required this.quantity,
      required this.isfav,
      required this.nameCompany,
      required this.nameCategory,
      required this.date});

  factory AllGrudsByCategoryModel.fromJson(Map<String, dynamic> json) {
    return AllGrudsByCategoryModel(
        id: json['id'],
        name: json['name'],
        scName: json['scientific_name'],
        manName: json['manufacturer_name'],
        price: json['price'],
        quantity: json['quantity'],
        isfav: json['isFavorite'],
        nameCompany: json['company']['name'],
        nameCategory: json['category']['name'],
        date: json['expire_date']);
  }
}
