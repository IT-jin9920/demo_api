import 'package:demo_api/api_call/screens/APIDataFetchingScreens/userr/user_model.dart';
import 'package:flutter/material.dart';

import 'api_service_userr.dart';
import 'userr_details_screen.dart';


class UserrsScreen extends StatefulWidget {
  const UserrsScreen({Key? key}) : super(key: key);

  @override
  _UserrsScreenState createState() => _UserrsScreenState();
}

class _UserrsScreenState extends State<UserrsScreen> {
  late Future<UserResponse> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = ApiService().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
      ),
      body: FutureBuilder<UserResponse>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
            return Center(child: Text('No Users Available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                User user = snapshot.data!.data![index];
                return GestureDetector(
                  onTap: () {
                    print('Tapped on: User ID: ${user.id}, Name: ${user.firstName} ${user.lastName}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailsScreen(user: user),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar!),
                      ),
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text(user.email!),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
