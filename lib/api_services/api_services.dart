import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class ProductService {
  static Future<List<Product>> getProductList() async {
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        List<Product> productList = [];
        for (var item in jsonResponse['data']) {
          Product product = Product.fromJson(item);
          productList.add(product);
        }
        return productList;
      } else {
        print('Failed to load products. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching product list: $e');
      return [];
    }
  }

  // Post method for creating or editing product
  static Future<bool> postProduct(Product product) async {
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');

    try {
      // Build the product data to send in the body
      Map<String, dynamic> productData = {
        "ProductName": product.productName,
        "ProductCode": product.productCode,
        "ProductImage": product.productImage,
        "UnitPrice": product.unitPrice,
        "Qty": product.quantity,
        "TotalPrice": product.totalPrice,
        "CreateDate": product.createdAt.toIso8601String()  // Convert DateTime to string
      };

      // Send POST request
      http.Response response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
        body: jsonEncode(productData),
      );

      if (response.statusCode == 200) {
        print('Product successfully created/edited.');
        return true;
      } else {
        print('Failed to create/edit product. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error creating/editing product: $e');
      return false;
    }
  }

  static Future<bool> deleteProduct(String id) async {
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/$id');

    try {
      http.Response response = await http.delete(uri);

      if (response.statusCode == 200) {
        print('Product successfully deleted.');
        return true;
      } else {
        print('Failed to delete product. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error deleting product: $e');
      return false;
    }
  }
}



