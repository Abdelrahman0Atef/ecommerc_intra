import 'package:flutter/cupertino.dart';
import 'package:untitled/API/helper.dart';
import '../Models/orders_model.dart';

class UpdateOrder {
  Future<OrdersModel> updateorder(
      {required order_id,
        required status,
        required message,
        @required token}) async {
    Map<String, dynamic> data = await Helper().put(
        url: 'https://fake-store-api.mock.beeceptor.com/api/orders',
        body: {'order_id': order_id, 'status': status, 'message': message},
        token: token);
    return OrdersModel.fromJson(data);
  }
}
