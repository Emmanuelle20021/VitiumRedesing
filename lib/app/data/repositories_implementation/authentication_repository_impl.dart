import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;

  AuthenticationRepositoryImpl(this._firebaseAuth);

  @override
  Future<bool> get isSignedIn {
    final isSigned = _firebaseAuth.currentUser != null ? true : false;
    return Future.value(isSigned);
  }

  @override
  Future<User?> get userData {
    return Future.value(FirebaseAuth.instance.currentUser);
  }
}
