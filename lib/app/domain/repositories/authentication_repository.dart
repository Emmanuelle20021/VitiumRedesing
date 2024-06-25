import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<bool> get isSignedIn;
  Future<User?> get userData;
}
