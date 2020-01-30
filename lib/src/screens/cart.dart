import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc/productsBloc.dart';
import 'cart_row_item.dart';
import '../model/product.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductsBloc productsBloc = ProductsBloc();
    Stream products = productsBloc.cartList;

    return StreamBuilder<List<Products>>(
        stream: products,
        builder:
            (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {
          if (snapshot.hasData) {
            return CartRow(
              product: snapshot,
              length: snapshot.data.length);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
