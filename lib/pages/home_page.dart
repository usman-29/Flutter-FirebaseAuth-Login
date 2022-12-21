import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app_project/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //current user
  final User? user = Auth().currentUser;

  //sign out user
  Future<void> signOut() async {
    await Auth().signOut();
  }

  //title
  Widget _title() {
    return const Text('Firebase Auth');
  }

  //user email
  Widget _userID() {
    return Text(user?.email ?? 'Email');
  }

  //signOut button
  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _userID(),
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}
