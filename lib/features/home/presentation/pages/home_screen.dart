import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  static const routeName = '/home';
  final UserCredential userCredential;

  const HomeScreen({super.key, required this.userCredential});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome'),),
      body: Center(
        child: Text('Excellent Start Point'),
      )
    );
  }
}
