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
      builder: (context, snapshot) {
        if(snapshot.hasError) print(snapshot.error);
        return snapshot.hasData 
          ? new ProductRowItem(product: snapshot.data, length: snapshot.data.length)
          : new Center(child: CircularProgressIndicator(backgroundColor: Colors.green,));

      },
    );
  }
}
