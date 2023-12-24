import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepository {
  // Initialize firebase authentication
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user => _firebaseAuth.currentUser;
  bool get isLoggedIn => user != null;

  // Stream is like event listener, it's always listening for a change
  // Here, we use it to check if a user is logging out
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<void> signUp(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

final authRepo = Provider((ref) => AuthenticationRepository());
final authStateStream = StreamProvider((ref) {
  final repo = ref.read(authRepo);
  return repo.authStateChanges();
});
