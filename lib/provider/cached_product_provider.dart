import 'package:flutter/cupertino.dart';
import 'package:netflix/models/hive_product_model.dart';
import 'package:netflix/services/cache_fetch_products.dart';

class CachedProductProvider with ChangeNotifier {
  List<HiveProduct> _products = [];
  bool isLoading = false;
  final _fetch = CacheFetchProducts();
  List<HiveProduct> get products => _products;

  Future<void> prepareAllProducts() async {
    isLoading = true;
    notifyListeners();

    final response = await _fetch.getAllProducts();
    _products =  response.map((p) => p as HiveProduct).toList();

    isLoading = false;
    notifyListeners();
  }
}
