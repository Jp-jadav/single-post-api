import 'package:get/get.dart';
import 'package:single_api/models/post.dart';
import 'package:single_api/services/api_service.dart';

class PostController extends GetxController {
  var post = Post().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPost();
  }

  void fetchPost() async {
    try {
      isLoading(true);
      var fetchedPost = await ApiService().fetchPost();
      post.value = fetchedPost;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
