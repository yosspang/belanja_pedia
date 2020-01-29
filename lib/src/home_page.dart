import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import './products_list_tab.dart';
import './searchBar.dart';
import './card.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  CarouselSlider carouselSlider;
  int currentSlide = 0;
  int quantity;
  List images = [
    "assets/ads-asus.jpg", 
    "assets/ads-furniture.jpg",
    "assets/ads-indomie.png",
    "assets/ads-shopee.jpg",
    "assets/ads-zalora.jpeg"
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for(var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {

    Widget ads() {
      return Column(
        children: <Widget>[
          CarouselSlider(
            height: 150,
            initialPage: 0,
            // enlargeCenterPage: true,
            autoPlay: true,
            // reverse: false,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 2000),
            pauseAutoPlayOnTouch: Duration(seconds: 10),
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                currentSlide = index;
              });
            },
            items: images.map((imgUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.green
                    ),
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList()
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(images, (index, url) {
              return Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentSlide == index ? Colors.redAccent : Colors.green
                ),
              );
            }),
          ),
        ],
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: 10),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Column(
                    children: <Widget>[
                      
                      Image.asset(
                        "assets/women-fashion.png",
                        height: 35,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Fashion')
                    ],
                  ),
                ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: 20),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Column(
                    children: <Widget>[
                      
                      Image.asset(
                        "assets/basket.png",
                        height: 35,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Groceries')
                    ],
                  ),
                ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: 20),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Column(
                    children: <Widget>[
                      
                      Image.asset(
                        "assets/otomotive.png",
                        height: 35,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Otomotive')
                    ],
                  ),
                ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: 20),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Column(
                    children: <Widget>[
                      
                      Image.asset(
                        "assets/sports.png",
                        height: 35,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Sports')
                    ],
                  ),
                ),
            ),
          ],
        ),
      );
    }

    Widget flashSale() {
      return Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Image.asset(
              "assets/sale.jpeg",
              height: 200,
            ),
          ),
        ],
      );
    }
    

    return Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            Search(),
            SizedBox(
              height: 40,
            ),
            ads(),
            SizedBox(
              height: 40,
            ),
            categories(),
            flashSale(),
            Center(
              child: Text(
                'Product',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ProductListTab(),
          ],
        )
    );
    // );
  }
}