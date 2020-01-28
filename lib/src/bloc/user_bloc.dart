import 'dart:convert';

import 'package:belanja_pedia/src/resources/repository.dart';
import 'package:crypto/crypto.dart';

class UserBloc {
  final _repository = Repository();

  loginUser(String email, password) {
    final _byte = utf8.encode(password);
    final _passwordmd5 = md5.convert(_byte).toString();
    final response = _repository.loginUser(email, _passwordmd5);
    return response;
  }
}
