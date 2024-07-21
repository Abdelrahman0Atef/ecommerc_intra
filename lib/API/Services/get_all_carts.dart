import 'dart:convert';
import 'package:untitled/API/helper.dart';
import '../Models/carts_model.dart';
import 'package:http/http.dart' as http;

class AllUsers {
  Future<List<CartsModel>> getAllUsers() async {
    List<dynamic> data = await Helper()
        .get(url: 'https://fake-store-api.mock.beeceptor.com/api/carts');
    List<CartsModel> cartslist = [];
      for (int i = 0; i < data.length; i++) {
        cartslist.add(CartsModel.fromJson(data[i]));
      }
      return cartslist;
  }
}
