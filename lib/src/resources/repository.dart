import 'dart:async';

import 'package:belanja_pedia/src/resources/product_api_provider.dart';

class Repository {
  final productApiProvider = ProductApiProvider();

  Future fetchProducts() => productApiProvider.fetchProducts();
  Future addToCart(int productId) => productApiProvider.addToCart(productId);
  Future getCarts(String email) => productApiProvider.getCart(email);
  Future updateQuantity(int id, String counter) => productApiProvider.updateQuantity(id, counter);
}
