import 'package:flutter_influencerindex/model/posts_list.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class PostsRepo {
  Future<List<Post>> getPostList();
}

class PostServices implements PostsRepo {
  //
  static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _get_posts = '/posts';

  @override
  Future<List<Post>> getPostList() async {
    Uri uri = Uri.https(_baseUrl, _get_posts);
    Response response = await http.get(uri);
    List<Post> Posts = PostFromJson(response.body);
    return Posts;
  }
}
