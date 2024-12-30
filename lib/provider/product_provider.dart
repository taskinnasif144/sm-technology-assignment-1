import 'package:flutter/cupertino.dart';
import 'package:netflix/services/fetch_products.dart';
import '../models/products_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool isLoading = false;
  final _fetch = FetchProduct();
  List<Product> get products => _products;

  Future<void> prepareAllProducts() async {
    isLoading = true;
    notifyListeners();

    final response = await _fetch.getAllProducts();
    _products = response;
    isLoading = false;
    notifyListeners();
  }
}
