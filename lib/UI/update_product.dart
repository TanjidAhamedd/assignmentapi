import 'package:flutter/material.dart';



class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _productNameTEController =
  TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: AddNewProductForm(),
    );
  }
  Widget  AddNewProductForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _productNameTEController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                hintText: 'Name',
                labelText: 'Product Name',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _unitPriceTEController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                hintText: 'Unit Price',
                labelText: 'Unit Price',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _totalPriceTEController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                hintText: 'Total Price',
                labelText: 'Total Price',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _imageTEController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                hintText: 'Product Image',
                labelText: 'Product Image',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _codeTEController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                hintText: 'Code',
                labelText: 'Product Code',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _quantityTEController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                hintText: 'Quantity',
                labelText: 'Product Quanity',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size.fromWidth(double.maxFinite),backgroundColor: Colors.blue),
                onPressed: (){}, child: const Text('ADD', style: TextStyle(color: Colors.black),))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _productNameTEController.dispose();
    _quantityTEController.dispose();
    _totalPriceTEController.dispose();
    _unitPriceTEController.dispose();
    _imageTEController.dispose();
    _codeTEController.dispose();
    super.dispose();
  }
}
