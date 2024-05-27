import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_modal.dart';

class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostsModal>> fetchPosts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<PostsModal> posts = body.map((dynamic item) => PostsModal.fromJson(item)).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
