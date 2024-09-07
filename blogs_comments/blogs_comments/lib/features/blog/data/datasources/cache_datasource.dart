import 'package:blogs_comments/features/blog/data/models/comment_model.dart';
import 'package:blogs_comments/features/blog/data/models/post_model.dart';
import 'package:hive/hive.dart';

abstract interface class CacheDatasource {
  void uploadToLocalPosts({
    required List<PostModel> posts,
  });

  void uploadToLocalComments({
    required int postId,
    required List<CommentModel> comments,
  });

  Future<List<CommentModel>> getFromLocalComments(int postId);

  Future<List<PostModel>> getFromLocalPosts();
}

class CacheDatasourceImplementation implements CacheDatasource {
  static const String postsBox = 'posts';
  static const String commentsBoxOne = 'comments';

  @override
  Future<List<PostModel>> getFromLocalPosts() async {
    List<PostModel> posts = [];

    Box box = await Hive.openBox(postsBox);
    for (int i = 0; i < box.length; i++) {
      posts.add(
        PostModel.fromJson(
          box.get(
            i.toString(),
          ),
        ),
      );
    }
    return posts;
  }

  @override
  void uploadToLocalPosts({required List<PostModel> posts}) async {
    Box box = await Hive.openBox(postsBox);
    box.clear();

    for (int i = 0; i < posts.length; i++) {
      box.put(i.toString(), posts[i].toJson());
    }
  }

  @override
  Future<List<CommentModel>> getFromLocalComments(int postId) async {
    List<CommentModel> comments = [];

    Box box = await Hive.openBox("${commentsBoxOne}-${postId}");
    for (int i = 0; i < box.length; i++) {
      CommentModel commentSingle = CommentModel.fromJson(
        box.get(
          i.toString(),
        ),
      );
      comments.add(commentSingle);
    }

    return comments;
  }

  @override
  void uploadToLocalComments({
    required int postId,
    required List<CommentModel> comments,
  }) async {
    Box box = await Hive.openBox("${commentsBoxOne}-${postId}");
    box.clear();
    for (int i = 0; i < comments.length; i++) {
      box.put(i.toString(), comments[i].toJson());
    }
  }
}
