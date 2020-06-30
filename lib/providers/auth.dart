import 'dart:convert';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;


class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  // String apiKey = DotEnv().env['API_KEY'];

  Future<void> _authenticate(String email, String password, String urlSegment) async {
    var apiKey = FlutterConfig.get('API_KEY');
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=$apiKey';
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}