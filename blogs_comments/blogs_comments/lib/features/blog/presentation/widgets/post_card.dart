import 'package:blogs_comments/core/theme/app_pallete.dart';
import 'package:blogs_comments/features/blog/domain/entities/post.dart';
import 'package:blogs_comments/features/blog/presentation/pages/post_details_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final PostEntity post;
  PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PostDetailsPage.route(post),
        );
      },
      child: Container(
        width: deviceWidth,
        margin: const EdgeInsets.all(20).copyWith(top: 0, bottom: 25),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppPallete.lightPurpleCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: deviceWidth / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: AppPallete.white,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    width: 100,
                    height: 100,
                    imageUrl: post.imageUrl!,
                    placeholder: (context, url) => Container(
                      margin: const EdgeInsets.all(25),
                      child: const CircularProgressIndicator(
                        color: AppPallete.white,
                        strokeWidth: 3,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
