class GetAllOrderModel {
  final int id;

  final dynamic date;
  final String status;
  final String payment;
  GetAllOrderModel({
    required this.id,
    required this.date,
    required this.status,
    required this.payment
  });

  factory GetAllOrderModel.fromJson(Map<String, dynamic> json) {
    return GetAllOrderModel(
      id: json['id'],
      date: json['created_at'],
      status: json['status'],
      payment: json['payment_status']
    );
  }
}
