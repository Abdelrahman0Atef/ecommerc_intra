import '../Models/status_model.dart';
import '../helper.dart';

class AllUsers {
  Future<List<StatusModel>> getAllUsers({required int order_id}) async {
    List<dynamic> data = await Helper().get(
        url:
            'https://fake-store-api.mock.beeceptor.com/api/orders/status/$order_id');

    List<StatusModel> statuslist = [];
    for (int i = 0; i < data.length; i++) {
      statuslist.add(StatusModel.fromJson(data[i]));
    }
    return statuslist;
  }
}
