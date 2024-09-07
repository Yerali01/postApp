class PostEntity {
  final int userId;
  final int id;
  final String title;
  final String body;
  String? imageUrl;

  PostEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    this.imageUrl,
  });
}
