class UsersModel {
  late final String user_id;
  late final String username;
  late final String email;
  late final String password;


  UsersModel({
    required this.user_id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory UsersModel.fromJson(jsonData) {
    return UsersModel(
      user_id: jsonData['user_id'],
      username: jsonData['username'],
      email: jsonData['email'],
      password: jsonData['password'],
    );
  }
}
