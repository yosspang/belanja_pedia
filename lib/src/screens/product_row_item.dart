import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc/products_bloc.dart';
import './detail_product.dart';

class ProductRowItem extends StatefulWidget {
  const ProductRowItem({this.product, this.length});

  final product;
  final length;

  @override
  ProductRowItemState createState() => ProductRowItemState();
}

class ProductRowItemState extends State<ProductRowItem> {
  addToCart(index, int productId, context) async {
    ProductsBloc productsBloc = ProductsBloc();
    await productsBloc.addToCart(productId);
  }

  @override
  Widget build(BuildContext context) {
    Widget products(data) {
      return Card(
          elevation: 1.5,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProduct(),
                  settings: RouteSettings(arguments: data),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Image.network(
                  'http://belanja-pedia-api.herokuapp.com/api/products/image/${data.image}',
                  width: 130,
                  height: 150,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          data.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Rp',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red),
                                ),
                                Text(
                                  data.price.toString(),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/dots.png",
                              height: 25,
                              color: Colors.green,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
    }

    return GridView.count(
      primary: true,
      crossAxisCount: 2,
      childAspectRatio: 0.65,
      shrinkWrap: true,
      children: List.generate(widget.length, (index) {
        return products(widget.product[index]);
      }),
    );
    // );
  }
}
