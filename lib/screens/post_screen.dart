import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:single_api/controllers/post_controller.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: Obx(
        () {
          if (postController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(postController.post.value.title.toString(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(postController.post.value.body.toString())
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
