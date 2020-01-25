import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bloc/productsBloc.dart';
import 'model/product.dart';
import 'styles.dart';

class Cart extends StatefulWidget {
  @override
  CartState createState() {
    return new CartState();
  }
}

class CartState extends State<Cart> {

  // int number = 0;
  // int stok = 0;

  List<int> number = List();
  // List<int> stok = List();

  void increment(int index, stok) {
    if(number[index] == stok) {
      setState(() {
        number[index] = stok;
      });
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert Dialog"),
          content: Text("Sorry, quantity can not be more than stok"),
          actions: [
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
    } else {
      setState(() {
        number[index]++;
      });
      print(number[index]);
    }
  }

  void decrement(int index) {
    if(number[index] == 0) {
      setState(() {
        number[index] = 0;
      });
    }else{
      setState(() {
        number[index]--;
      });
      print(number[index]);

    }
  }

  @override
  Widget build(BuildContext context) {
    final color = const Color(0xFF50B154);
    // final Products listProduct = ModalRoute.of(context).settings.arguments;
    ProductsBloc productsBloc = ProductsBloc();
    Stream products = productsBloc.productsList;

    Widget row(int index,  product, bool lastItem) {
      // stok = product[index].stock;

      if(number.length < product.length){
        number.add(0);
      }

      return  SafeArea(
      top: false,
      bottom: false,
      minimum: const EdgeInsets.only(
        left: 10,
        top: 10,
        bottom: 8,
        // right: 8,
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              'http://belanja-pedia-api.herokuapp.com/api/products/image/${product[index].image}',
              width: 76,
              height: 76,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product[index].name,
                    style: Styles.productRowItemName,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  Text(
                    '\$${product[index].price}',
                    style: Styles.productRowItemPrice,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          decrement(index);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: new BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '-',
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          )
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 15)),
                      Center(
                        child: Text(
                          '${number[index]}',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 15)),
                      InkWell(
                        onTap: () {
                          increment(index, product[index].stock);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: new BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '+',
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          )
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 10)),
                      Text(
                        (product[index].stock <= 10) ? 'Sisa ${product[index].stock} buah' : '',
                        style: TextStyle(color: Colors.red)
                      ),
                      
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
    }

    Widget buy() {
      return Align(
        alignment: Alignment.bottomRight,
        child: RaisedButton(
          child: Text(
            "Buy",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {},
          color: Colors.green,
          textColor: Colors.white,
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
          splashColor: Colors.grey,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)))
      );
    }

    Widget getapi() {
      return StreamBuilder<List<Products>>(
        stream: products,
        
        builder:
            (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: CustomScrollView(
              semanticChildCount: snapshot.data.length,
              slivers: <Widget>[
                SliverSafeArea(
                  top: false,
                  // minimum: const EdgeInsets.only(top: 8),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index < snapshot.data.length) {
                          return row(
                            index,
                            snapshot.data,
                            index == snapshot.data.length - 1,
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                )
              ],
            ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('My Carts'),
        backgroundColor: color,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 20)),
          Expanded(
            flex: 1,
            child: getapi(),
          ),
          buy(),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
        ],
      )
    );
  }
}