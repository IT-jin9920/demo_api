import 'package:flutter/material.dart';

import 'api_post.dart';
import 'post_modal.dart';


class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  late Future<List<PostsModal>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = ApiService().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostsModal>>(
      future: futurePosts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No Posts Available'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              PostsModal post = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  print('Tapped on: Index: $index, ID: ${post.id}, Title: ${post.title}');
                },
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(
                      'Index: $index, ID: ${post.id}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title: ${post.title}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Body: ${post.body}', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
