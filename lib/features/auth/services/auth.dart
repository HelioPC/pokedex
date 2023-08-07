import 'dart:async';
import 'dart:convert';

import 'package:pokedex/common/data/local_storage.dart';
import 'package:pokedex/common/env/env_keys.dart';
import 'package:pokedex/common/exceptions/auth_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  final firebaseWebApi = EnvKeys.firebaseWebApi;
  String? _token;
  String? _email;
  String? _uid;
  DateTime? _expirationDate;
  Timer? _timer;

  bool get isAuth {
    final isValid = _expirationDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  String? get email {
    return isAuth ? _email : null;
  }

  String? get uid {
    return isAuth ? _uid : null;
  }

  Future<void> _authenticate(String email, String password, String type) async {
    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:$type?key='
        '$firebaseWebApi';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(key: body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['email'];
      _uid = body['localId'];
      _expirationDate = DateTime.now().add(
        Duration(
          seconds: int.parse(body['expiresIn']),
        ),
      );

      LocalStorage.saveMap('userData', {
        'token': _token,
        'email': _email,
        'uid': _uid,
        'expirationDate': _expirationDate!.toIso8601String(),
      });

      _autoLogout();

      notifyListeners();
    }
  }

  Future<void> signup(String email, String password) async {
    return await _authenticate(email, password, 'signUp');
  }

  Future<void> signIn(String email, String password) async {
    return await _authenticate(email, password, 'signInWithPassword');
  }

  Future<void> tryAutoLogin() async {
    if (isAuth) {
      return;
    }

    final userData = await LocalStorage.getMap('userData');

    if (userData.isEmpty) {
      return;
    }

    final expirationDate = DateTime.parse(userData['expirationDate']);

    if (expirationDate.isBefore(DateTime.now())) {
      return;
    }

    _token = userData['token'];
    _email = userData['email'];
    _uid = userData['uid'];
    _expirationDate = expirationDate;

    _autoLogout();
    notifyListeners();
  }

  void logout() {
    _token = null;
    _email = null;
    _expirationDate = null;
    _uid = null;
    _clearAutoLogout();
    LocalStorage.remove('userData').then((value) => notifyListeners());
  }

  void _clearAutoLogout() {
    _timer?.cancel();
    _timer = null;
  }

  void _autoLogout() {
    _clearAutoLogout();
    final seconds = _expirationDate?.difference(DateTime.now()).inSeconds;
    _timer = Timer(Duration(seconds: seconds ?? 0), logout);
  }
}
