import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:ServiceDemo/commons/globals.dart' as global;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ServiceDemo/models/post.dart';
import 'package:ServiceDemo/models/post_res.dart';

Future<Post> createPost(BuildContext context, body, title, userId) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var params = {"title": title, "body": body, "userId": userId};
      var url = Uri.parse(global.POSTS);
      final http.Response response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params));
      var responseBody = json.decode(response.body);
      if (response.statusCode == 201) {
        return Post.fromJson(responseBody);
      } else {
        return Post(title: "title", body: "body", userId: 0, id: 0);
      }
    } catch (e) {
      return Post(title: "title", body: "body", userId: 0, id: 0);
    }
  } else {
    return Post(title: "title", body: "body", userId: 0, id: 0);
  }
}

Future<Post> updatePost(BuildContext context, body, title, userId, id) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var params = {"title": title, "body": body, "userId": userId};
      var url = Uri.parse(global.POSTS + "/$id");
      final http.Response response = await http.put(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params));
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return Post.fromJson(responseBody);
      } else {
        return Post(title: "title", body: "body", userId: 0, id: 0);
      }
    } catch (e) {
      return Post(title: "title", body: "body", userId: 0, id: 0);
    }
  } else {
    return Post(title: "title", body: "body", userId: 0, id: 0);
  }
}

Future<Post> updatePostContent(BuildContext context, body, id) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var params = {"body": body};
      var url = Uri.parse(global.POSTS + "/$id");
      final http.Response response = await http.patch(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params));
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return Post.fromJson(responseBody);
      } else {
        return Post(title: "title", body: "body", userId: 0, id: 0);
      }
    } catch (e) {
      return Post(title: "title", body: "body", userId: 0, id: 0);
    }
  } else {
    return Post(title: "title", body: "body", userId: 0, id: 0);
  }
}

Future<Post> getPost(BuildContext context, String id) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var url = Uri.parse(global.POSTS + "/$id");
      final http.Response response =
          await http.get(url, headers: {"Content-Type": "application/json"});
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return Post.fromJson(responseBody);
      } else if (response.statusCode == 403) {
        print("Unauthorized");
        return Post(title: "title", body: "body", userId: 0, id: 0);
      } else {
        print("Error");
        return Post(title: "title", body: "body", userId: 0, id: 0);
      }
    } catch (e) {
      print(e);
      return Post(title: "title", body: "body", userId: 0, id: 0);
    }
  } else {
    return Post(title: "title", body: "body", userId: 0, id: 0);
  }
}

Future<PostsResponse> getPosts(BuildContext context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var url = Uri.parse(global.POSTS);
      final http.Response response =
          await http.get(url, headers: {"Content-Type": "application/json"});
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return PostsResponse.fromJson(responseBody);
      } else if (response.statusCode == 403) {
        print("Unauthorized");
        return PostsResponse(posts: new List<Post>.empty());
      } else {
        print("Error");
        return PostsResponse(posts: new List<Post>.empty());
      }
    } catch (e) {
      print(e);
      return PostsResponse(posts: new List<Post>.empty());
    }
  } else {
    return PostsResponse(posts: new List<Post>.empty());
  }
}
