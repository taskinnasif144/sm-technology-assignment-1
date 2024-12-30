import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/products_model.dart';

class FetchProduct {
  Future<List<Product>> getAllProducts() async {
    const url = "https://fakestoreapi.com/products";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;

      final products = json.map((p) {
        return Product(
            id: p["id"],
            title: p["title"],
            price: p["price"].toDouble(),
            description: p["description"],
            category: p["category"],
            image: p["image"],
            rating: p['rating']);
      }).toList();

      return products;
    }
    return [];
  }
}
