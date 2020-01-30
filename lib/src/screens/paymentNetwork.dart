import 'package:belanja_pedia/src/bloc/productsBloc.dart';
import 'package:belanja_pedia/src/model/user.dart';
import 'package:belanja_pedia/src/screens/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentNetwork extends StatelessWidget {
  const PaymentNetwork({this.sum, this.productId});

  final sum;
  final productId;

  @override
  Widget build(BuildContext context) {
    ProductsBloc userBloc = ProductsBloc();
    Stream users = userBloc.userInfo;

    return StreamBuilder<Users>(
      stream: users,
      builder: (BuildContext context, AsyncSnapshot<Users> snapshot) {
        if (snapshot.hasData) {
            print('has data');
            return Payment(user: snapshot.data, sum: sum, productId: productId);
          } else if (snapshot.hasError) {
            print('error');
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

