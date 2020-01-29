import 'dart:async';

import 'package:belanja_pedia/src/resources/product_api_provider.dart';
import 'package:belanja_pedia/src/resources/user_api_provider.dart';

class Repository {
  final userApiProvider = UserApiProvider();
  final productApiProvider = ProductApiProvider();

  Future fetchProducts() => productApiProvider.fetchProducts();
  Future addToCart(int productId) => productApiProvider.addToCart(productId);
  Future getCarts(String email) => productApiProvider.getCart(email);
  Future loginUser(String email, String password) =>
      userApiProvider.postLogin(email, password);
  Future registerUser(String email, String password, String firstName,
          String lastName, String address) =>
      userApiProvider.postRegister(
          email, password, firstName, lastName, address);
}
