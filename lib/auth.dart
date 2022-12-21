import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  //instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //current user
  User? get currentUser => _firebaseAuth.currentUser;

  //auth state changes monitor
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  //sign in with email & password
  Future<void> signInWithEmailPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //create user with email & password
  Future<void> createUserWithEmailPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //sign out user
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
