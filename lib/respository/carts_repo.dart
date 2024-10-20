import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_project/models/cart_models.dart';

class CartRepo {
  Future<Cart?> fetchCart(int userId) async {
    final response = await http.get(Uri.parse('https://dummyjson.com/carts/$userId'));

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      return Cart.fromJson(decodedResponse);
    } else {
      return null; 
    }
  }
}
