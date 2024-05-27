import 'package:flutter/material.dart';
import 'package:demo_api/api_call/screens/APIDataFetchingScreens/userr/user_model.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.firstName} ${user.lastName}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.avatar!),
            ),
            SizedBox(height: 20),
            Text(
              'Name: ${user.firstName} ${user.lastName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Email: ${user.email}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'ID: ${user.id}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
