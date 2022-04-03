import 'package:get/get.dart';
import 'package:test_code_generator/model/post.dart';

class PostListController extends GetxController{
  Rx<bool> loading = false.obs;
  Rx<bool> fake = false.obs;
  RxList<Post> posts = <Post>[].obs;
}