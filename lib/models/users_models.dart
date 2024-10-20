class AddUsersModels{
  String? email;
  String? username;
  String? password;
  String? phone;
  AddUsersModels({this.email, this.username, this.password, this.phone});
  AddUsersModels.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    password = json['password'];
    phone = json['phone'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['phone'] = phone;
    return data;
  }


}
  // for login
  class AuthenticatedUser {
    final String username;
    final String accessToken;
    final int userId;
    AuthenticatedUser({required this.username, required this.accessToken, required this.userId});
    factory AuthenticatedUser.fromJson(Map<String, dynamic> json) {
      return AuthenticatedUser(
        username: json['username'],
        accessToken: json['accessToken'],
        userId: json['id'],
      );
    }
  }