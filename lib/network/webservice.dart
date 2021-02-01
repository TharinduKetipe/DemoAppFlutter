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
      final http.Response response = await http.post(global.POSTS,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params));
      var responseBody = json.decode(response.body);
      if (response.statusCode == 201) {
        return Post.fromJson(responseBody);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  } else {
    return null;
  }
}

Future<Post> updatePost(BuildContext context, body, title, userId, id) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var params = {"title": title, "body": body, "userId": userId};
      final http.Response response = await http.put(global.POSTS + "/$id",
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params));
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return Post.fromJson(responseBody);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  } else {
    return null;
  }
}

Future<Post> updatePostContent(BuildContext context, body, id) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var params = {"body": body};
      final http.Response response = await http.patch(global.POSTS + "/$id",
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params));
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return Post.fromJson(responseBody);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  } else {
    return null;
  }
}

Future<Post> getPost(BuildContext context, String id) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      final http.Response response = await http.get(global.POSTS + "/$id",
          headers: {"Content-Type": "application/json"});
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return Post.fromJson(responseBody);
      } else if (response.statusCode == 403) {
        print("Unauthorized");
        return null;
      } else {
        print("Error");
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  } else {
    return null;
  }
}

Future<PostsResponse> getPosts(BuildContext context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      final http.Response response = await http
          .get(global.POSTS, headers: {"Content-Type": "application/json"});
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return PostsResponse.fromJson(responseBody);
      } else if (response.statusCode == 403) {
        print("Unauthorized");
        return null;
      } else {
        print("Error");
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  } else {
    return null;
  }
}
