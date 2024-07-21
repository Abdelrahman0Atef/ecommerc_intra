import 'package:flutter/material.dart';

class OrdersModel {
  final int? order_id;
  final int? user_id;
  final List<Items>? items;
  final double? total_price;
  final String? status;
  final String? message;

  OrdersModel(
      {@required this.order_id,
      @required this.user_id,
      @required this.items,
      @required this.total_price,
      @required this.status,
      @required this.message});

  factory OrdersModel.fromJson(jsonData) {
    return OrdersModel(
        order_id: jsonData['order_id'],
        user_id: jsonData['user_id'],
        items: jsonData['items'] == null ? null : (jsonData['items'] as List).map((e) => Items.fromJson(e))
            .toList(),
        total_price: jsonData['total_price'],
        status: jsonData['status'],
        message: jsonData['message']);
  }
}

class Items {
  final int? product_id;
  final int? quantity;

  Items({@required this.product_id, @required this.quantity});

  factory Items.fromJson(jsonData) {
    return Items(
        product_id: jsonData['product_id'], quantity: jsonData['quantity']);
  }
}
