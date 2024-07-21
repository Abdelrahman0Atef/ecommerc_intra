class StatusModel {
  late final int order_id;
  late final int user_id;
  late final String status;
  late final double total_price;
  late final Items items;


  StatusModel({
    required this.order_id,
    required this.user_id,
    required this.status,
    required this.total_price,
    required this.items,
  });

  factory StatusModel.fromJson(jsonData) {
    return StatusModel(
        order_id: jsonData['order_id'],
        user_id: jsonData['user_id'],
        status: jsonData['status'],
        total_price: jsonData['total_price'],
        items: Items.fromJson(jsonData['items'])
    );
  }
}

class Items {
  late final int product_id;
  late final int quantity;

  Items({required this.product_id,required this.quantity});

  factory Items.fromJson(jsonData) {
    return Items(product_id: jsonData['product_id'], quantity: jsonData['quantity']);
  }
}