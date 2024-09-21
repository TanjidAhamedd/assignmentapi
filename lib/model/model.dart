// class Product {
//   final String id;
//   final String productName;
//   final String productCode;
//   final String productImage;
//   final String unitPrice;
//   final String quantity;
//   final String totalPrice;
//
//   final String createdAt;
//
//   Product({required this.id,
//     required this.productName,
//     required this.productCode,
//     required this.productImage,
//     required this.unitPrice,
//     required this.quantity,
//     required this.totalPrice,
//     required this.createdAt});
// }
//
//
class Product {
  final String id;
  final String productName;
  final String productCode;
  final String productImage;
  final String unitPrice;
  final String quantity;
  final String totalPrice;

  final DateTime createdAt; // Changed from String to DateTime

  Product({
    required this.id,
    required this.productName,
    required this.productCode,
    required this.productImage,
    required this.unitPrice,
    required this.quantity,
    required this.totalPrice,
    required this.createdAt,  // Use DateTime directly
  });

  // Factory constructor to parse from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      productName: json['ProductName'] ?? 'Unknown',
      productCode: json['ProductCode'] ?? 'Unknown',
      productImage: json['ProductImage'] ?? 'default_image_url',
      unitPrice: json['UnitPrice']?.toString() ?? '0',
      quantity: json['Qty'] != null ? json['Qty'].toString() : '0',
      totalPrice: json['TotalPrice']?.toString() ?? '0',
      createdAt: DateTime.parse(json['CreateDate'] ?? DateTime.now().toIso8601String()), // Parse to DateTime
    );
  }
}
