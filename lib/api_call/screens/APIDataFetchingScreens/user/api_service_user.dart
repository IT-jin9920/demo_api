import 'dart:convert';
import 'package:http/http.dart' as http;

import 'userModal.dart';


class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<userModal>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        List<userModal> users = body.map((dynamic item) => userModal.fromJson(item)).toList();
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error fetching users');
    }
  }
}
