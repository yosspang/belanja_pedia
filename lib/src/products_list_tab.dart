import 'package:belanja_pedia/src/bloc/productsBloc.dart';
import 'package:belanja_pedia/src/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'product_row_item.dart';

class ProductListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductsBloc productsBloc = ProductsBloc();
    Stream products = productsBloc.productsList;
    return StreamBuilder<List<Products>>(
        stream: products,
        builder:
            (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {
          if (snapshot.hasData) {
            return CustomScrollView(
              semanticChildCount: snapshot.data.length,
              slivers: <Widget>[
                SliverSafeArea(
                  top: false,
                  minimum: const EdgeInsets.only(top: 8),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index < snapshot.data.length) {
                          return ProductRowItem(
                            index: index,
                            product: snapshot.data[index],
                            lastItem: index == snapshot.data.length - 1,
                            length: snapshot.data.length
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
