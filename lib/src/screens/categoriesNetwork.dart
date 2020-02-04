import 'package:belanja_pedia/src/bloc/products_bloc.dart';
import 'package:belanja_pedia/src/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categories.dart';

class CategoriesNetwork extends StatelessWidget {
  CategoriesNetwork({this.categories, this.user});
  final categories;
  final user;
  @override
  Widget build(BuildContext context) {
    ProductsBloc productsBloc = ProductsBloc();
    Stream products = productsBloc.getProductByCategories(categories);
    print('email di categories network $user');

    return StreamBuilder<List<Products>>(
      stream: products,
      builder: (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
            return Categories(categories: snapshot.data, length: snapshot.data.length, type: categories, user: user);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
      },
    );
  }
}
