import 'dart:async';

import 'package:belanja_pedia/src/resources/product_api_provider.dart';
import 'package:belanja_pedia/src/resources/user_api_provider.dart';

class Repository {
  final userApiProvider = UserApiProvider();
  final productApiProvider = ProductApiProvider();

  Future fetchProducts() => productApiProvider.fetchProducts();
  Future getProductByCategories(String type) => productApiProvider.getProductByCategories(type);
  Future addToCart(String email, int productId) => productApiProvider.addToCart(email, productId);
  Future getCarts(String email) => productApiProvider.getCart(email);
  Future updateQuantity(String user, int id, String counter) =>
      productApiProvider.updateQuantity(user, id, counter);
  Future getInfoUser(String email) => productApiProvider.getInfoUser(email);
  Future loginUser(String email, String password) =>
      userApiProvider.postLogin(email, password);
  Future registerUser(String email, String password, String firstName,
          String lastName, String address) =>
      userApiProvider.postRegister(
          email, password, firstName, lastName, address);
}
