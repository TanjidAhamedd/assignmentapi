import 'package:assignmentapi/UI/update_product.dart';
import 'package:assignmentapi/model/model.dart';
import 'package:flutter/material.dart';

import '../api_services/api_services.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({
    super.key,
    required this.product, required this.onDelete,
  });
  final Product product;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product id: ${product.id}'),
          Text('Product Code: ${product.productCode}'),
          Text('Unit Price: ${product.unitPrice}'),
          Text('Product quantity: ${product.quantity}'),
          Text('Total Price: ${product.totalPrice}'),
          Text('Create Date: ${product.createdAt}'),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateProductScreen()),
                    );
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit')),
              TextButton.icon(
                  onPressed: () async {
                    bool success =
                        await ProductService.deleteProduct(product.id);
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Product deleted successfully!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to delete product.')),
                      );
                    }
                  },
                  icon: const Icon(Icons.delete),
                  label: const Text('delete')),
            ],
          )
        ],
      ),
    );
  }
}
