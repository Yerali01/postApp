import 'package:blogs_comments/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppPallete.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppPallete.background,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
}
