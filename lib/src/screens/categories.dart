import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc/products_bloc.dart';
import './detail_product.dart';

class Categories extends StatefulWidget {
  const Categories({this.categories, this.length, this.type, this.user});
  final categories;
  final length;
  final type;
  final user;

  @override
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  // addToCart(index, int productId, context) async {
  //   ProductsBloc productsBloc = ProductsBloc();
  //   await productsBloc.addToCart(widget.user, productId);
  // }

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
                  builder: (context) => DetailProduct(user: widget.user),
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

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          '${widget.type}',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[100],
      ),
      body: GridView.count(
        primary: true,
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        shrinkWrap: true,
        children: List.generate(widget.length, (index) {
            return products(widget.categories[index]);
        }),
      ),
    );
  }
}
