import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bloc/productsBloc.dart';
import 'model/product.dart';
import 'styles.dart';
import './cart.dart';

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
  PageController pageController;
  int currentSlide = 1;
  int quantity;
  final images = ["assets/ads-asus.jpg", "ads-furniture.jpg", "ads-indomie.png", "ads-shopee.jpg", "ads-zalora.jpeg"];

  @override
  void initState() {
    pageController = PageController(
      initialPage: currentSlide, //SLIDE YANG AKAN DISOROT BERDASARKAN VALUE DARI CURRENT SLIDE
      keepPage: false,
      viewportFraction: 0.5,
    );
    super.initState();
  }

  addToCart(index, int productId, context) async {
    ProductsBloc productsBloc = ProductsBloc();
    await productsBloc.addToCart(productId);
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

    Widget slideShow(int index) {
      return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              images[index]
            )
          )
        ),
      );
    }

    Widget ads() {
      return SafeArea(
        child: Expanded(
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentSlide = value;
              });
            },
            itemBuilder: (BuildContext context, int index) => slideShow(index),
            itemCount: 4,
          ),
        ),
      );
    }

    

    return Column(
      children: <Widget>[
        ads(),
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
