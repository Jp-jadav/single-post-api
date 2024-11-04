import 'dart:convert';

import 'package:single_api/models/post.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Post> fetchPost() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

    if (response.statusCode == 200) {
      Post data = Post.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
