import 'package:flutter/material.dart';
import 'package:untitled/Widgest/custom_container.dart';

import '../API/Models/products_model.dart';
import '../API/Services/get_all_products.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  static String id = 'ProductDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Product Details',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: FutureBuilder<List<ProductsModel>>(
          future: AllProducts().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductsModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return CustomContainer(product: products[index],);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator(backgroundColor: Colors.deepPurpleAccent,strokeWidth: 10,));
            }
          },
        ));
  }
}
