


import 'package:flutter/material.dart';

import 'api_call/screens/APIDataFetchingScreens/Albums/AlbumsScreen.dart';
import 'api_call/screens/APIDataFetchingScreens/posts/posts_screen.dart';
import 'api_call/screens/APIDataFetchingScreens/user/user_screen.dart';

import 'api_call/screens/APIDataFetchingScreens/userr/userrs_screen.dart';
import 'api_call/screens/dashboard_screen.dart';
import 'api_call/screens/forgot_password_screen.dart';
import 'api_call/screens/login_screen.dart';
import 'api_call/screens/onboarding_screen.dart';
import 'api_call/screens/signup_screen.dart';
import 'api_call/screens/splash_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => Login(),
        '/signup': (context) => SignupScreen(),
        '/Register': (context) => Register(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/dashboard': (context) {
          final Map args = ModalRoute.of(context)!.settings.arguments as Map;
          final String email = args['email'];
          return DashboardScreen(email: email);
        },
         '/posts': (context) => Posts(),
        // '/comments': (context) => CommentsScreen(),
         '/albums': (context) => AlbumsScreen(),
        // '/photos': (context) => PhotosScreen(),
        // '/todos': (context) => TodosScreen(),
         '/users': (context) => UsersScreen(),
         '/usersr': (context) => UserrsScreen(),

      },
    );
  }
}
