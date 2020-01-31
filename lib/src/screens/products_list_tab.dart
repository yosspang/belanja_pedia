import 'package:belanja_pedia/src/bloc/products_bloc.dart';
import 'package:belanja_pedia/src/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/product_row_item.dart';

class ProductListTab extends StatelessWidget {
  const ProductListTab({this.user});

  final user;
  @override
  Widget build(BuildContext context) {
    ProductsBloc productsBloc = ProductsBloc();
    Stream products = productsBloc.productsList;
    return StreamBuilder<List<Products>>(
      stream: products,
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? new ProductRowItem(
                user: user,
                product: snapshot.data,
                length: snapshot.data.length)
            : new Center(
                child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
              ));
      },
    );
  }
}
