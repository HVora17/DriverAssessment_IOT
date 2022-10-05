import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/database_service.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn(
    scopes: [
    'email',
  ],
  );

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;
  

  Future googleLogin() async {
    print("login") ; 
    final googleUser = await googleSignIn.signIn();
    print("login") ; 

    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);


    if (userCredential.user != null) {
      DatabaseService(uid: userCredential.user!.uid)
          .addUser(userCredential.user);
    }

    notifyListeners();
  }
}
