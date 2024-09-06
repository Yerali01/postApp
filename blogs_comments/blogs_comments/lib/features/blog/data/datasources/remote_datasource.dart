import 'package:blogs_comments/features/blog/data/models/comment_model.dart';
import 'package:blogs_comments/features/blog/data/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract interface class RemoteDatasource {
  Future<List<PostModel>> getAllPosts();

  Future<List<CommentModel>> getAllComments(int postId);
}

class RemoteDataSourceImplementation implements RemoteDatasource {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      final posts = await http.get(Uri.parse("${baseUrl}/posts"));

      List<dynamic> data = await convert.jsonDecode(posts.body);
      return data.map((json) => PostModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<CommentModel>> getAllComments(int postId) async {
    try {
      final comments =
          await http.get(Uri.parse("${baseUrl}/posts/${postId}/comments"));

      List<dynamic> data = await convert.jsonDecode(comments.body);
      return data.map((json) => CommentModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
