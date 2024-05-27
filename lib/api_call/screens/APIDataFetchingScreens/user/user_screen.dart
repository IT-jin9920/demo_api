import 'package:flutter/material.dart';

import 'api_service_user.dart';
import 'userModal.dart';
import 'user_details_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late Future<List<userModal>> futureUsers;

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
      body: FutureBuilder<List<userModal>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Users Available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                userModal user = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    print('Tapped on: User ID: ${user.id}, Name: ${user.name}');
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
                      title: Text(user.name ?? ''),
                      subtitle: Text('Username: ${user.username}\nEmail: ${user.email}'),
                      leading: Icon(Icons.person),
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
