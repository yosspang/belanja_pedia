import 'dart:convert';

import 'package:belanja_pedia/src/model/product.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Client, Response;

class ProductApiProvider {
  Client client = Client();

  Future fetchProducts() async {
    http.Response response =
        await http.get("http://belanja-pedia-api.herokuapp.com/api/products");
    String products = response.body;
    final productsList = productsFromJson(products);
    return productsList;
  }

  Future addToCart(int productId) async {
    final id = productId.toString();
    print('di product api provider $id');
    Response response;
    response = await client.post("http://belanja-pedia-api.herokuapp.com/api/cart", body: {
      "email": "test@mail.com",
      "product_id": id
    });
    final res = jsonDecode(response.body);
    final resp = new Map();
    resp['body'] = res;
    resp['statusCode'] = response.statusCode;
    print('response di api provider $resp');
    return resp;
  }

  Future getCart(String email) async {
    http.Response response = await client.get("http://belanja-pedia-api.herokuapp.com/api/cart/$email");

    String carts = response.body;
    final cartList = cartsFromJson(carts);
    return cartList;
  }

  Future updateQuantity(int id, String counter) async {
    print('id $id dan counter $counter di api provider');
    final productId = id.toString();
    Response response;
    response = await client.put("http://belanja-pedia-api.herokuapp.com/api/cart", body: {
      "product_id": productId,
      "counter": counter
    });
    final res = jsonDecode(response.body);
    print(res);
    return res;
  }
}
