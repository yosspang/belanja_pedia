import 'dart:convert';

import 'package:http/http.dart' show Client, Response;

class UserApiProvider {
  Client client = Client();
  Response response;
  Future postLogin(String email, String password) async {
    response = await client
        .post('http://belanja-pedia-api.herokuapp.com/api/login', body: {
      'email': email,
      'password': password,
    });
    print(response.body);
    if (response.statusCode != 500) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post');
    }
  }

  Future postRegister(String email, String password, String firstName,
      String lastName, String address) async {
    response = await client
        .post("http://belanja-pedia-api.herokuapp.com/api/register", body: {
      "email": email,
      "password": password,
      "first_name": firstName,
      "last_name": lastName,
      "address": address
    });
    print(response.body);
    if (response.statusCode != 500) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post');
    }
  }
}
