import 'package:belanja_pedia/src/bloc/products_bloc.dart';
import 'package:belanja_pedia/src/model/user.dart';
import 'package:belanja_pedia/src/screens/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentNetwork extends StatelessWidget {
  const PaymentNetwork({this.user, this.sum, this.productId, this.items});
  final user;
  final sum;
  final productId;
  final items;

  @override
  Widget build(BuildContext context) {
    ProductsBloc userBloc = ProductsBloc();
    Stream users = userBloc.userInfo(user);

    return StreamBuilder<Users>(
        stream: users,
        builder: (BuildContext context, AsyncSnapshot<Users> snapshot) {
          if (snapshot.hasData) {
            print('has data');
            print(items);
            return Payment(
                user: snapshot.data,
                sum: sum,
                productId: productId,
                items: items);
          } else if (snapshot.hasError) {
            print('error');
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
