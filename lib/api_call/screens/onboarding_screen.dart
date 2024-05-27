import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildPage('assets/image/image1.jpg', 'Title 1', 'Description 1'),
              _buildPage('assets/image/image2.jpg', 'Title 2', 'Description 2'),
              _buildPage('assets/image/image3.jpg', 'Title 3', 'Description 3'),
              _buildPage('assets/image/image4.jpg', 'Title 4', 'Description 4'),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: Text('Skip'),
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 4,
                    effect: WormEffect(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage < 3) {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      } else {
                        // Navigate to the next screen after onboarding
                        // For example, you can navigate to the login screen
                        Navigator.of(context).pushReplacementNamed('/login');
                      }
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String imagePath, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 300),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
