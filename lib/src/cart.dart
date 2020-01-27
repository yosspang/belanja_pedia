import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bloc/productsBloc.dart';
import 'cart_row_item.dart';
import 'model/product.dart';

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
                          print('ada di cart');
                          return CartRow(
                            index: index,
                            product: snapshot.data[index],
                            lastItem: index == snapshot.data.length - 1,
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