import 'package:belanja_pedia/src/model/product.dart';

import 'package:http/http.dart' as http;

class ProductApiProvider {
  Future fetchProducts() async {
    http.Response response =
        await http.get("http://belanja-pedia-api.herokuapp.com/api/products");
    String products = response.body;
    final productsList = productsFromJson(products);
    return productsList;
  }
}
