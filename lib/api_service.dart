import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future hello() async {
    http.Response response =
        await http.get("http://belanja-pedia-api.herokuapp.com");
    String res = response.body;
    return res;
  }

  Future register(email, password, firstName, lastName, address) async {
    var response = await http
        .post("http://belanja-pedia-api.herokuapp.com/api/register", body: {
      "email": email,
      "password": password,
      "first_name": firstName,
      "last_name": lastName,
      "address": address
    });
    print(response.body);
    return jsonDecode(response.body);
  }
}
