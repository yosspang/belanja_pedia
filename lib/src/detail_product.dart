import 'package:flutter/material.dart';

import 'model/product.dart';

class DetailProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Products listProduct = ModalRoute.of(context).settings.arguments;
    String name = listProduct.name;
    int price = listProduct.price;
    String image = listProduct.image;
    String description = listProduct.description;
    String categories = listProduct.categories;

    Widget body() {
      return Column(
        children: <Widget>[
          Container(
            // padding: EdgeInsets.fromLTRB(0,10,0,0),
            height: 350,
            width: double.maxFinite,
            child: Card(
              elevation: 3,
              child: Column(
                children: <Widget>[
                  Image.network(
                    'http://belanja-pedia-api.herokuapp.com/api/products/image/$image',
                    height: 250,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Rp$price',
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                            Image.asset("assets/love.png", height: 35,)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              name,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              categories,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0,10,0,0),
            height: 150,
            width: double.maxFinite,
            child: Card(
              elevation: 3,
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Description',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          description,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          body(),
        ],
      ),
    );
  }
}