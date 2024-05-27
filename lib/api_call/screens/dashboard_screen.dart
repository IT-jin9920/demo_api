import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String email;

  // Corrected constructor name to match the class name
  DashboardScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/posts');
              },
              child: Text('Posts'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).pushNamed('/comments');
            //   },
            //   child: Text('Comments'),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/albums');
              },
              child: Text('Albums'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).pushNamed('/photos');
            //   },
            //   child: Text('Photos'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).pushNamed('/todos');
            //   },
            //   child: Text('Todos'),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/users');
              },
              child: Text('Users-jsonplaceholder'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/usersr');
              },
              child: Text('Users-reqres'),
            ),
          ],
        ),
      ),
    );
  }
}
