import 'package:flutter/material.dart';

import 'post_list.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: PostList()),
        ],
      ),
    );
  }
}
