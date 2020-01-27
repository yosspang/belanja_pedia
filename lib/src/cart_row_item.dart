import 'package:flutter/material.dart';
import 'model/product.dart';
import 'styles.dart';

class CartRow extends StatefulWidget{
  const CartRow({
    this.index,
    this.product,
    this.lastItem
  });

  final product;
  final int index;
  final bool lastItem;


  @override
  CartRowState createState() {
    return new CartRowState();
  }
}

class CartRowState extends State<CartRow> {
  List<int> number = List();
  List<int> quantityState = List();

  quantity() {
    setState(() {
      quantityState[widget.index] = widget.product.quantity;
    });
    return quantityState[widget.index];
  }

  void increment(int index, stok) {
    if(quantityState[index] == stok) {
      setState(() {
        quantityState[index] = stok;
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
      setState(() {
        quantityState[index]++;
      });
      // bloc.currentQty(index, bloc.currentQuantity[index]);
      print(quantityState[index]);
    }
  }

  void decrement(int index) {
      if(quantityState[index] == 1) {
        setState(() {
          quantityState[index] = 1;
        });
      // bloc.currentQty(index, bloc.currentQuantity[index]);
      } else {
        setState(() {
          quantityState[index]--;
        });
        // bloc.currentQty(index, bloc.currentQuantity[index]);
      }
      
      print(quantityState);
  }

  @override
  Widget build(BuildContext context) {
    print('ada di cart row');
    final color = const Color(0xFF50B154);
    final row = SafeArea(
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
              'http://belanja-pedia-api.herokuapp.com/api/products/image/${widget.product.image}',
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
                    widget.product.name,
                    style: Styles.productRowItemName,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  Text(
                    '\$${widget.product.price}',
                    style: Styles.productRowItemPrice,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          decrement(widget.index);
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
                          '$quantity()',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 15)),
                      InkWell(
                        onTap: () {
                          increment(widget.index, widget.product.stock);
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
                        (widget.product.stock <= 10) ? 'Sisa ${widget.product.stock} buah' : '',
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

    Widget buy() {
      print('ada di buy');
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
            child: SizedBox(
              width: 300,
              height: 300,
              child: row,
            ),
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