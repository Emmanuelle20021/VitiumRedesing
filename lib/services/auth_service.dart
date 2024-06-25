import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';

class AuthService {
  User? firebaseUser = firebaseInstance.currentUser;

  void signIn({required String email, required String password}) async {
    final userCredential = await firebaseInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    firebaseUser = userCredential.user;
  }

  void signOut() async {
    await firebaseInstance.signOut();
  }

  void signUp({required String email, required String password}) async {
    final userCredential =
        await firebaseInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    firebaseUser = userCredential.user;
  }

  void updateEmail({required String email}) async {
    await firebaseUser!.verifyBeforeUpdateEmail(email);
  }

  void updatePassword({required String password}) async {
    await firebaseUser!.updatePassword(password);
  }

  void sendPasswordResetEmail({required String email}) async {
    await firebaseInstance.sendPasswordResetEmail(email: email);
  }

  void delete() async {
    //TODO: Add a confirmation dialog before deleting the user
    await firebaseUser!.delete();
    firebaseUser = null;
  }

  void reload() async {
    await firebaseUser!.reload();
  }
}
