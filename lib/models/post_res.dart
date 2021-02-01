import 'package:ServiceDemo/models/post.dart';

class PostsResponse {
  List<Post> posts;

  PostsResponse({this.posts});

  PostsResponse.fromJson(List<dynamic> json) {
    posts = new List<Post>();
    for (final post in json) {
      posts.add(new Post.fromJson(post));
    }
  }
}
