import 'package:dio/dio.dart';

class ApiService {
  hello() async {
    Dio dio = new Dio();
    return await dio.get("http://trying-travis1.herokuapp.com/").then((res) {
      print(res.data);
      return res.data;
    }).catchError((err) => err);
  }
}
