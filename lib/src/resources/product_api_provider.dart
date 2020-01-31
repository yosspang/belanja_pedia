import 'dart:convert';
import 'package:belanja_pedia/src/model/product.dart';
import 'package:belanja_pedia/src/model/user.dart';

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

  Future addToCart(String email, int productId) async {
    final id = productId.toString();
    print('di product api provider $id email $email');
    Response response;
    response = await client.post(
        "http://belanja-pedia-api.herokuapp.com/api/cart",
        body: {"email": email, "product_id": id});
    final res = jsonDecode(response.body);
    final resp = new Map();
    resp['body'] = res;
    resp['statusCode'] = response.statusCode;
    print('response di api provider $resp');
    return resp;
  }

  Future getCart(String email) async {
    http.Response response = await client
        .get("http://belanja-pedia-api.herokuapp.com/api/cart/$email");

    String carts = response.body;
    final cartList = cartsFromJson(carts);
    print('cart list $cartList');
    return cartList;
  }

  Future updateQuantity(String user, int id, String counter) async {
    print('user $user id $id dan counter $counter di api provider');
    final productId = id.toString();
    Response response;
    response = await client.put(
        "http://belanja-pedia-api.herokuapp.com/api/cart",
        body: {"email": user, "product_id": productId, "counter": counter});
    final res = jsonDecode(response.body);
    print(res);
    return res;
  }

  Future getInfoUser(String email) async {
    print('di provider');
    Response response;
    response = await client
        .get("http://belanja-pedia-api.herokuapp.com/api/user/$email");
    String user = response.body;
    final userInfo = usersFromJson(user);
    return userInfo;
  }
}
