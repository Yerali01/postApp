import 'package:blogs_comments/core/theme/app_pallete.dart';
import 'package:blogs_comments/features/blog/domain/entities/post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostDetailsContainer extends StatelessWidget {
  final PostEntity post;
  PostDetailsContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Expanded(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                height: 300,
                width: deviceWidth,
                imageUrl: post.imageUrl!,
                placeholder: (context, url) => Container(
                  margin: const EdgeInsets.all(25),
                  child: const CircularProgressIndicator(
                    color: AppPallete.white,
                    strokeWidth: 3,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: AppPallete.errorColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                post.title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                post.body,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
