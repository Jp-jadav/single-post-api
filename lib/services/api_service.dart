import 'package:get/get.dart';
import 'package:single_api/models/post.dart';

class ApiService extends GetConnect {
  Future<Post> fetchPost() async {
    final response = await get("https://jsonplaceholder.typicode.com/posts/1");

    if (response.statusCode == 200) {
      Post data = Post.fromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
