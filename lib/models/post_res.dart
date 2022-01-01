import 'package:ServiceDemo/models/post.dart';

class PostsResponse {
  late List<Post> posts;

  PostsResponse({required this.posts});

  PostsResponse.fromJson(List<dynamic> json) {
    posts = <Post>[];
    for (final post in json) {
      posts.add(new Post.fromJson(post));
    }
  }
}
