import 'package:flutter/material.dart';

import 'userModal.dart';


class UserDetailsScreen extends StatelessWidget {
  final userModal user;

  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? 'User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${user.username}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Phone: ${user.phone}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Website: ${user.website}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            if (user.address != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Address:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Street: ${user.address!.street}', style: TextStyle(fontSize: 16)),
                  Text('Suite: ${user.address!.suite}', style: TextStyle(fontSize: 16)),
                  Text('City: ${user.address!.city}', style: TextStyle(fontSize: 16)),
                  Text('Zipcode: ${user.address!.zipcode}', style: TextStyle(fontSize: 16)),
                ],
              ),
            SizedBox(height: 8),
            if (user.company != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Company:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Name: ${user.company!.name}', style: TextStyle(fontSize: 16)),
                  Text('CatchPhrase: ${user.company!.catchPhrase}', style: TextStyle(fontSize: 16)),
                  Text('BS: ${user.company!.bs}', style: TextStyle(fontSize: 16)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
