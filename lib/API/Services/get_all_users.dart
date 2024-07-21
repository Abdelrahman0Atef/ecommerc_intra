import '../Models/users_model.dart';
import '../helper.dart';

class AllUsers {
  Future<List<UsersModel>> getAllUsers() async {
    List<dynamic> data = await Helper()
        .get(url: 'https://fake-store-api.mock.beeceptor.com/api/users');

    List<UsersModel> userslist = [];
    for (int i = 0; i < data.length; i++) {
      userslist.add(UsersModel.fromJson(data[i]));
    }
    return userslist;
  }
}
