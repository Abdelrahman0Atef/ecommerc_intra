import 'dart:async';
import 'dart:developer';

import '../Models/products_model.dart';
import '../helper.dart';

class AllProducts {
  Future<List<ProductsModel>> getAllProducts() async {
      List<dynamic> data = await Helper()
          .get(url: 'https://fake-store-api.mock.beeceptor.com/api/products');
      List<ProductsModel> productslist = [];

      for (int i = 0; i < data.length; i++) {
        productslist.add(ProductsModel.fromJson(data[i]));
      }
      return productslist;
    }
  }