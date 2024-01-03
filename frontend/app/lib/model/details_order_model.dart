class DetailsOrderModel {
  final int id;
  final String name;
  final String type;
  final int quantity;

  DetailsOrderModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.type,
  });

  factory DetailsOrderModel.fromJson(Map<String, dynamic> json) {
    return DetailsOrderModel(
      id: json['id'],
      name: json['medicine_name'],
      quantity: json['quantity'],
      type: json['category']['name']
    );
  }
}
