import 'dart:convert';
import 'package:bloc_project/models/products_models.dart';
import 'package:http/http.dart' as http;

class ProductsRepo {
  Future<List<Products>?> getProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        if (decodedResponse is List) {
          List<Products> products =
              decodedResponse.map((json) => Products.fromJson(json)).toList();
          return products;
        } else {
          print("Fetching is not successful");
          return null;
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error during fetching products: $e');
      return null;
    }
  }

  // code for gettting single product
  static Future<Products?> getProduct(int id) async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));
      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        if (decodedResponse is Map<String, dynamic>) {
          return Products.fromJson(decodedResponse);
        } else {
          print("Fetching is not successful");
          return null;
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error during fetching products: $e');
      return null;
    }
  }
  
}
