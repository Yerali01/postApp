import 'package:blogs_comments/core/utils/connection_checker.dart';
import 'package:blogs_comments/features/blog/data/datasources/cache_datasource.dart';
import 'package:blogs_comments/features/blog/data/datasources/remote_datasource.dart';
import 'package:blogs_comments/features/blog/data/repositories/repository_implementation.dart';
import 'package:blogs_comments/features/blog/domain/repositories/post_repo.dart';
import 'package:blogs_comments/features/blog/domain/usecases/get_all_comments.dart';
import 'package:blogs_comments/features/blog/domain/usecases/get_all_posts.dart';
import 'package:blogs_comments/features/blog/presentation/bloc/comment_bloc.dart';
import 'package:blogs_comments/features/blog/presentation/bloc/post_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path_provider/path_provider.dart';

part 'init_dependencies.main.dart';
