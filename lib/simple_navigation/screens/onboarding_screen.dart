import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: PageView(
        children: [
          _buildPage(context, 'assets/image/image1.jpg', 'Title 1', 'Description 1'),
          _buildPage(context, 'assets/image/image2.jpg', 'Title 2', 'Description 2'),
          _buildPage(context, 'assets/image/image3.jpg', 'Title 3', 'Description 3'),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context, String imagePath, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        SizedBox(height: 20),
        Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            // Navigate to Login
            Navigator.of(context).pushReplacementNamed('/login');
          },
          child: Text('skip'),
        ),
      ],
    );
  }
}
