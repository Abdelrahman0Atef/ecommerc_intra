class CartsModel {
  late final int cart_id;
  late final String user_id;
  late final Items items;


  CartsModel({
    required this.cart_id,
    required this.user_id,
    required this.items,
  });

  factory CartsModel.fromJson(jsonData) {
    return CartsModel(
      cart_id: jsonData['cart_id'],
      user_id: jsonData['user_id'],
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