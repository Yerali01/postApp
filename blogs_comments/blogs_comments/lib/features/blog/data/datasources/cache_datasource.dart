// import 'package:blogs_comments/features/blog/data/models/post_model.dart';
// import 'package:hive/hive.dart';

// abstract interface class PostCacheDatasource {
//   void uploadCachePosts({
//     required List<PostModel> posts,
//   });

//   List<PostModel> loadPosts();
// }

// class PostCacheDatasourceImplementation implements PostCacheDatasource {
//   final Box box;

//   PostCacheDatasourceImplementation(this.box);

//   @override
//   List<PostModel> loadPosts() {
//     List<PostModel> posts = [];
//     box.read(() {
//       for (int i = 0; i < box.length; i++) {
//         posts.add(PostModel.fromJson(box.get(i.toString())));
//       }
//     });

//     // box.get(() {
//     //   for (int i = 0; i < box.length; i++) {
//     //     posts.add(PostModel.fromJson(box.get(i.toString())));
//     //   }
//     // });

//     return posts;
//   }

//   @override
//   void uploadCachePosts({required List<PostModel> posts}) {
//     box.clear();
//     box.write(() {
//       for (int i = 0; i < posts.length; i++) {
//         box.put(i.toString(), posts[i].toJson());
//       }
//     });
//   }
// }
