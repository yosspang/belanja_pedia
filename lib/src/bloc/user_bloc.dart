import 'dart:convert';

import 'package:belanja_pedia/src/resources/repository.dart';
import 'package:crypto/crypto.dart';

convertMD5(input) {
  return md5.convert(utf8.encode(input)).toString();
}

class UserBloc {
  final _repository = Repository();

  loginUser(String email, String password) {
    final _passwordmd5 = convertMD5(password);
    final response = _repository.loginUser(email, _passwordmd5);
    return response;
  }

  registerUser(String email, String password, String firstName, String lastName,
      String address) {
    final _passwordmd5 = convertMD5(password);
    final response = _repository.registerUser(
        email, _passwordmd5, firstName, lastName, address);
    return response;
  }
}
