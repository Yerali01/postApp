import 'package:blogs_comments/features/blog/data/models/comment_model.dart';
import 'package:blogs_comments/features/blog/data/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract interface class RemoteDatasource {
  Future<List<PostModel>> getAllPosts();

  Future<List<CommentModel>> getAllComments(int postId);
}

class RemoteDataSourceImplementation implements RemoteDatasource {
  final String mainUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      final postsResponse = await http.get(Uri.parse("${mainUrl}/posts"));
      final photosResponse = await http.get(Uri.parse("${mainUrl}/photos"));

      List<dynamic> dataPosts = convert.jsonDecode(postsResponse.body);
      List<dynamic> dataPhotos = convert.jsonDecode(photosResponse.body);

      List<PostModel> posts =
          dataPosts.map((json) => PostModel.fromJson(json)).toList();
      List<String> photos =
          dataPhotos.map((json) => json['url'] as String).toList();

      for (int i = 0; i < posts.length; i++) {
        posts[i].imageUrl = photos[i % photos.length];
      }

      return posts;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<CommentModel>> getAllComments(int postId) async {
    try {
      final comments =
          await http.get(Uri.parse("${mainUrl}/posts/${postId}/comments"));

      List<dynamic> data = await convert.jsonDecode(comments.body);
      return data.map((json) => CommentModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
