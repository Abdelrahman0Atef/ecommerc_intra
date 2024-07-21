import 'package:flutter/material.dart';
import 'package:untitled/API/Models/products_model.dart';
import 'package:untitled/API/Services/get_all_products.dart';
import '../Widgest/custom_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
              ))
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: FutureBuilder<List<ProductsModel>>(
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
                      return CustomCard(product: products[index],);
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator(backgroundColor: Colors.deepPurpleAccent,strokeWidth: 10,));
                }
              },
            )),
      ),
    );
  }
}
