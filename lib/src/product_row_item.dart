import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bloc/productsBloc.dart';
import 'model/product.dart';
import 'styles.dart';
import './cart.dart';

class ProductRowItem extends StatefulWidget {
  const ProductRowItem({
    this.index,
    this.product,
    this.lastItem,
    this.length
  });

  final Products product;
  final int index;
  final bool lastItem;
  final int length;

  @override
  ProductRowItemState createState() => ProductRowItemState();
}

class ProductRowItemState extends State<ProductRowItem> {

  int quantity;

  addToCart(index, int productId, context) async{
    print(productId);
    ProductsBloc productsBloc = ProductsBloc();
    final response = await productsBloc.addToCart(productId);
    print(response['statusCode']);
    print('quantity dari bloc ${response['body']['quantity']}');
    
    print('quantity $quantity');
    if(response['statusCode'] == 200) {
      // bloc.createList(index, widget.length);
      // int quantity = bloc.currentQuantity[index];
      // print('current $quantity');
      // await bloc.currentQty(index, quantity+1);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cart()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final row = SafeArea(
      top: false,
      bottom: false,
      minimum: const EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 8,
        right: 8,
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
                  )
                ],
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              addToCart(widget.index, widget.product.id, context);
            },
            child: const Icon(
              CupertinoIcons.plus_circled,
              semanticLabel: 'Add',
              color: Colors.green,
            ),
          ),
        ],
      ),
    );

    if (widget.lastItem) {
      return row;
    }

    return Column(
      children: <Widget>[
        row,
        Padding(
          padding: const EdgeInsets.only(
            left: 100,
            right: 16,
          ),
          child: Container(
            height: 1,
            color: Styles.productRowDivider,
          ),
        ),
      ],
    );
  }
}
