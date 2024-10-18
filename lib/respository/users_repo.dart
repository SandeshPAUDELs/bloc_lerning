import 'dart:convert';
import'package:http/http.dart' as http;
import 'package:bloc_project/models/users_models.dart';

class UsersRepo {
  static Future<List<AddUsersModels>> addUsers(AddUsersModels users) async {
    try {
      var url = Uri.parse('https://fakestoreapi.com/users');
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(users.toJson()),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData is List) {
          return List<AddUsersModels>.from(
              responseData.map((x) => AddUsersModels.fromJson(x)));
        } else if (responseData is Map<String, dynamic>) {
          return [AddUsersModels.fromJson(responseData)];
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error during fetching users: $e');
      throw Exception('Failed to load users');
    }
  }

  static Future<AuthenticatedUser?> login(String username, String password) async {
  try {
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      // Ensure correct key parsing
      if (decodedResponse is Map<String, dynamic> && decodedResponse.containsKey('token')) {
        AuthenticatedUser user = AuthenticatedUser(
          username: username,
          token: decodedResponse['token'],
        );
        return user;
      } else {
        throw Exception('Token not found in response');
      }
    } else {
      print('Login failed with status: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error during login: $e');
    return null;
  }
}


}
