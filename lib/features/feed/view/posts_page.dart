import 'package:flutter/material.dart';
import 'package:husam4alabs/features/feed/view/posts_view.dart';

///
/// This page required in case of wraping the main feature page with:
/// 1- custom widgets
/// 2- custom providers
/// 3- else
///
class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PostsView();
  }
}
