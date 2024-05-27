import 'dart:convert';
import 'package:http/http.dart' as http;

import 'albumModal.dart';


class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/albums';

  Future<List<Album>> fetchAlbums() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        List<Album> albums = body.map((dynamic item) => Album.fromJson(item)).toList();
        return albums;
      } else {
        throw Exception('Failed to load albums');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error fetching albums');
    }
  }
}
