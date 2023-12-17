class Medicine {
  final String scientificName;
  final String commercialName;
  final String category;
  final String manufacturer;
  final int quantity;
  final String expiryDate;
  final double price;

  Medicine({
    required this.scientificName,
    required this.commercialName,
    required this.category,
    required this.manufacturer,
    required this.quantity,
    required this.expiryDate,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'scientific_name': scientificName,
      'commercial_name': commercialName,
      'category': category,
      'manufacturer': manufacturer,
      'quantity': quantity,
      'expiry_date': expiryDate,
      'price': price,
    };
  }
}
