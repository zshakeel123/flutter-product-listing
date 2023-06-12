import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_listing/models/Product.dart';

class ApiService {
  final String baseUrl = 'https://dummyjson.com/products';

  Future<List<Product>> getProducts({int skip = 0, int limit = 10}) async {
    final url = Uri.parse('$baseUrl?skip=$skip&limit=$limit');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var  jsonList = json.decode(response.body);
        final List<Product> products = productFromJson(jsonEncode(jsonList['products']));

        return products;
      } else {
        throw Exception('Failed to retrieve products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}