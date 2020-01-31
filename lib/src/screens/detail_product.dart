import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../bloc/products_bloc.dart';
import '../model/product.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({this.user});

  final user;
  @override
  Widget build(BuildContext context) {
    final Products listProduct = ModalRoute.of(context).settings.arguments;
    int id = listProduct.id;
    String name = listProduct.name;
    int price = listProduct.price;
    String image = listProduct.image;
    String description = listProduct.description;
    String categories = listProduct.categories;
    print(name.length);

    Widget body() {
      return Column(
        children: <Widget>[
          Container(
            // padding: EdgeInsets.fromLTRB(0,10,0,0),
            height: 350,
            width: double.maxFinite,
            child: Card(
              elevation: 1,
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
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Image.asset("assets/love.png", height: 30)
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
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
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
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            height: 80,
            width: double.maxFinite,
            child: Card(
                elevation: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Shipping',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'JNE',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      )
                    ],
                  ),
                )),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            height: 200,
            width: double.maxFinite,
            child: Card(
                elevation: 1,
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            categories,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                          child: SizedBox(
                            width: 270,
                            height: 100,
                            child: AutoSizeText(
                              description,
                              style: TextStyle(fontSize: 18),
                              minFontSize: 10,
                              stepGranularity: 10,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ],
      );
    }

    Widget action() {
      return Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        height: 90,
        width: double.maxFinite,
        child: Card(
          elevation: 1,
          child: Center(
            child: RaisedButton(
                child: Text(
                  "Add To Cart",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  final result = await bloc.addToCart(user, id);
                  if (result['statusCode'] != 200) {
                    print('failed');
                  } else {
                    Navigator.pop(context);
                  }
                },
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                splashColor: Colors.grey,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          ),
        ),
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
            Expanded(
              flex: 1,
              child: ListView(
                children: <Widget>[body()],
              ),
            ),
            action()
          ],
        ));
  }
}
