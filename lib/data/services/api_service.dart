import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception("Server Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }
}
