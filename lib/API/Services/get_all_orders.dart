import '../Models/orders_model.dart';
import '../helper.dart';

class AllUsers {
  Future<List<OrdersModel>> getAllUsers() async {
    List<dynamic> data = await Helper()
        .get(url: 'https://fake-store-api.mock.beeceptor.com/api/orders');
    List<OrdersModel> orderslist = [];

    for (int i = 0; i < data.length; i++) {
      orderslist.add(OrdersModel.fromJson(data[i]));
    }
    return orderslist;
}
}
