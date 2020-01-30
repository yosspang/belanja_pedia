import 'package:belanja_pedia/src/screens/payment.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';
import 'paymentNetwork.dart';
import '../screens/styles.dart';
import '../bloc/productsBloc.dart';

class CartRow extends StatefulWidget {
  const CartRow({this.product, this.length});

  final product;
  final int length;

  @override
  CartRowState createState() {
    return new CartRowState();
  }
}

class CartRowState extends State<CartRow> {
  final color = const Color(0xFF50B154);
  int sum = 0;
  List productId = [];

  void increment(int id, stok) async{
    if (bloc.currentQuantity == stok) {
      setState(() {
        bloc.currentQuantity = stok;
      });
      // bloc.currentQty(index, bloc.currentQuantity[index]);
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
      await bloc.updateQuantity(id, "plus");
    }
  }

  void decrement(int id) async{
    print(widget.product.data);

    await bloc.updateQuantity(id, "minus");
  }

  @override
  Widget build(BuildContext context) {
    
    Widget row() {
      
      return ListView.builder(
          itemCount: widget.length,
          itemBuilder: (BuildContext context, int index) {
            Products product = widget.product.data[index];
            int quantity = product.quantity;
            int id = product.id;
            int price = product.price * quantity;
            productId.add(id);
            bloc.currentQuantity = quantity;

            return SafeArea(
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
                      'http://belanja-pedia-api.herokuapp.com/api/products/image/${product.image}',
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
                            product.name,
                            style: Styles.productRowItemName,
                          ),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          Text(
                            'Rp${product.price}',
                            style: Styles.productRowItemPrice,
                          ),
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  decrement(product.id);
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
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      ),
                                    )),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 15)),
                              Center(
                                child: Text(
                                  '${bloc.currentQuantity}',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 15)),
                              InkWell(
                                onTap: () {
                                  increment(product.id, product.stock);
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
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      ),
                                    )),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 10)),
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Total $price',
                                    style: TextStyle(color: Colors.red)
                                  ),
                                  Text(
                                      (product.stock <= 10)
                                          ? 'Sisa ${product.stock} buah'
                                          : '',
                                      style: TextStyle(color: Colors.red)),
                                ],
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
          });
    }

    Widget buy() {
      widget.product.data.forEach((doc) => sum += (doc.price * doc.quantity));
      return Column(
        children: <Widget>[
          Container(
            width: 450,
            decoration: BoxDecoration(
              border: Border(
              top: BorderSide(width: 1.0, color: color),
            )),
          ),
          Container(
            margin: EdgeInsets.only(right: 10, top: 10, left: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Total: ',
                      style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Rp$sum ',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      child: Text(
                        "Checkout",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                        context,
                          MaterialPageRoute(
                            builder: (context) => PaymentNetwork(sum: sum, productId: productId, items: widget.length),
                            // settings: RouteSettings(arguments: sum),
                          ),
                        );
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      splashColor: Colors.grey,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)))),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('My Carts(${widget.length})'),
          backgroundColor: color,
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 20)),
            Expanded(
              flex: 1,
              child: row(),
            ),
            buy(),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
          ],
        ));
  }
}
