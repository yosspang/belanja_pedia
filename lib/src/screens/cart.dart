import 'package:belanja_pedia/src/bloc/products_bloc.dart';
import 'package:belanja_pedia/src/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart_row_item.dart';
import 'dart:async';

class Cart extends StatelessWidget {
  const Cart({this.user});

  final user;
  @override
  Widget build(BuildContext context) {
    ProductsBloc productsBloc = ProductsBloc();
    Stream products = productsBloc.cartList(user);

    return StreamBuilder<List<Products>>(
        stream: products,
        builder:
            (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {
          if (snapshot.hasData) {
            return CartRow(
                user: user, product: snapshot, length: snapshot.data.length);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
