import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Client, Response;

class UserApiProvider {
  Client client = Client();
  Future postLogin(String email, String password) async {
    print(email);
    print(password);
    Response response;
    response = await client
        .post("http://belanja-pedia-api.herokuapp.com/api/login", body: {
      "email": email,
      "password": password,
    });
    print(response.body);
    if (response.statusCode != 500) {
      print('login initiated');
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post');
    }
  }
}
