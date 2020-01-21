import 'dart:async';
import 'package:http/http.dart' as http;

class ApiService {
  Future hello() async {
    http.Response response =
        await http.get("http://trying-travis1.herokuapp.com");
    String res = response.body;
    return res;
  }
}
