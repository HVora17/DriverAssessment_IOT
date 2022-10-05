import 'package:alcohol_cabs/ui/home_screen.dart';
import 'package:alcohol_cabs/ui/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasData) {
              print("Provider Login Data ");
              return HomeScreen();
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return const Center(child: Text('Something went wrong'));
            } else {
              return const SignupandLoginScreen();
            }
          }),
    );
  }
}
