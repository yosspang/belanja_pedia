import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bloc/productsBloc.dart';
import 'model/product.dart';
import 'styles.dart';
import './detail_product.dart';

class ProductRowItem extends StatefulWidget {
  const ProductRowItem({this.index, this.product, this.lastItem, this.length});

  final product;
  final int index;
  final bool lastItem;
  final int length;

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

    Widget row() {
      return SafeArea(
        top: false,
        bottom: false,
        minimum: const EdgeInsets.only(
          left: 16,
          top: 8,
          bottom: 8,
          right: 8,
        ),
        child: InkWell(
          onTap: () {
            print(widget.product.categories);
            Navigator.push(
            context,
              MaterialPageRoute(
                builder: (context) => DetailProduct(),
                settings: RouteSettings(arguments: widget.product),
              ),
            );
          },
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
        )
      );
    }

    // if (widget.lastItem) {
    //   return row();
    // }

    return Container(
        // margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: row()
      );
    // );
  }
}
