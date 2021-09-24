import 'package:firebase_auth/firebase_auth.dart';
import 'package:devpagemoritz/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  MyUsers? _userFromFirebaseUser(User? user) {
    if (user != null) {
      return user != null ? MyUsers(uid: user.uid) : null;
    } else {
      return null;
    }
  }

  // auth change user stream
  Stream<MyUsers?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sigin whit email

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
