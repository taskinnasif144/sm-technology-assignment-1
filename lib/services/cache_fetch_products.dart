import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/models/hive_product_model.dart';

class CacheFetchProducts {
  Future<List<Object>> getAllProducts() async {
    const url = "https://fakestoreapi.com/products";
    final uri = Uri.parse(url);
    var productBox = await Hive.openBox('products');

    List<HiveProduct> products = [];

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        await productBox.clear();
        final json = jsonDecode(response.body) as List;
        final products = json.map((p) async {
          final product = HiveProduct(
              id: p["id"],
              title: p["title"],
              price: p["price"].toDouble(),
              description: p["description"],
              category: p["category"],
              image: p["image"],
              rating: p['rating']);

          await productBox.add(product);
          return product;
        }).toList();
        return await Future.wait(products);
      }
    } catch (e) {
      products = productBox.values.map((p) => p as HiveProduct).toList();
    }

    return products;
  }
}
