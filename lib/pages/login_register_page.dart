import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app_project/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //error message
  String? errorMessage = '';

  //to check if user in login or not
  bool isLogin = true;

//email controller
  final TextEditingController _emailController = TextEditingController();
  //password controller
  final TextEditingController _passwordController = TextEditingController();

  //sign in with email & password
  Future<void> signInWithEmailPassword() async {
    try {
      await Auth().signInWithEmailPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  //create user with email & password
  Future<void> createUserWithEmailPassword() async {
    try {
      await Auth().createUserWithEmailPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  //title
  Widget _title() {
    return const Text('Firebase Auth');
  }

//text field
  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
      ),
    );
  }

  //error message method
  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  //submit button
  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailPassword : createUserWithEmailPassword,
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

//login or register button instead
  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login In instead'),
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
            _entryField('Email', _emailController),
            _entryField('Password', _passwordController),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),
          ],
        ),
      ),
    );
  }
}
