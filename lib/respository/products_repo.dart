// import 'dart:convert';
// import 'package:bloc_project/models/products_models.dart';
// import 'package:http/http.dart' as http;

// class ProductsRepo {
//   Future<List<Products?>> getProducts() async {
//     try {
//       final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
//       if (response.statusCode == 200) {
//         var decodedResponse = json.decode(response.body);
//         if (decodedResponse is List) {
//           List<Products?> products = decodedResponse.map((json) => Products.fromJson(json)).toList();
//           return products;
//         } else {
//           print("Fetching is not successful");
//           return [];
//         }
//       } else {
//         throw Exception('Failed to load products');
//       }
//     } catch (e) {
//       print('Error during fetching products: $e');
//       return [];
//     }
//   }
// }
import 'dart:convert';
import 'package:bloc_project/models/products_models.dart';
import 'package:http/http.dart' as http;

class ProductsRepo {
  Future<List<Products>> getProducts() async {
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        if (decodedResponse is List) {
          List<Products> products = decodedResponse.map((json) => Products.fromJson(json)).where((product) => product != null).toList();
          return products;
        } else {
          print("Fetching is not successful");
          return [];
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error during fetching products: $e');
      return [];
    }
  }
}
