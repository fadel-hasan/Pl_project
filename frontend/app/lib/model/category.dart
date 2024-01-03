class CategoryModel {
  final int id;

  final String name;

  final String desc;

  CategoryModel({required this.id, required this.name, required this.desc});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
    );
  }
}
