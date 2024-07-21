import 'package:flutter/material.dart';
import 'package:untitled/API/Models/orders_model.dart';
import 'package:untitled/API/Models/products_model.dart';
import 'package:untitled/Screens/update_order_screen.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product,});

  ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, UpdateOrderScreen.id,);
      },
      child: Card(
            elevation: 15,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/smrtphone.png',
                    ),
                    //Image.network('https://fake-store-api.mock.beeceptor.com/images/smartphone.jpg'),
                  ),
                  Text(
                    product.name,
                    style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$ ' '${product.price.toString()}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        product.rating.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
            )),
    );
  }
}
