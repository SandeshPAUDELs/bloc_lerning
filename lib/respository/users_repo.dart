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
}
