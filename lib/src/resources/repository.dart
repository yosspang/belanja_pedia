import 'dart:async';

import 'package:belanja_pedia/src/resources/product_api_provider.dart';

class Repository {
  final productApiProvider = ProductApiProvider();

  Future fetchProducts() => productApiProvider.fetchProducts();
}
