import 'dart:convert';
import 'package:demo_api/api_call/screens/APIDataFetchingScreens/userr/user_model.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static const String url = 'https://reqres.in/api/users?page=2';

  Future<UserResponse> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return UserResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error fetching users');
    }
  }
}
