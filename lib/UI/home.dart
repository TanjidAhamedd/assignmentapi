import 'dart:convert';

import 'package:assignmentapi/UI/Add_New_Product_Screen.dart';


import 'package:flutter/material.dart';
import 'package:http/http.dart';


import '../api_services/api_services.dart';
import '../model/model.dart';
import '../widgets/product_item_widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  List<Product> productList = [];

  @override
  void initState() {
    loadProductList();
    super.initState();
  }

  Future<void> loadProductList() async {
    productList = await ProductService.getProductList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductItems(product: productList[index], onDelete: () { setState(() {
              productList.removeAt(index);
            }); },);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 16,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddNewProductScreen()),
        );
      }, child: const Icon(Icons.add),),
    );
  }





  // Future<void> getProductList() async {
  //   print('Requesting product list...');
  //   Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
  //   try {
  //     Response response = await get(uri);
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> jsonResponse = jsonDecode(response.body);
  //       productList.clear();  // Clear the list to avoid duplicate entries
  //       for (var item in jsonResponse['data']) {
  //         Product product =
  //             Product.fromJson(item);
  //
  //         productList.add(product);
  //       }
  //       setState(() {});  // Refresh the UI
  //     } else {
  //       print('Failed to load products. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error fetching product list: $e');
  //   }
  // }
  //
  //
  //
  //







}
