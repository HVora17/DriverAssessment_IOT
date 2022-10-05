import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/google_sign_in_provider.dart';
import '../widgets/glassmorphism.dart';


class SignupandLoginScreen extends StatefulWidget {
  const SignupandLoginScreen({Key? key}) : super(key: key);

  @override
  _SignupandLoginScreenState createState() => _SignupandLoginScreenState();
}

class _SignupandLoginScreenState extends State<SignupandLoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        color: Colors.lightBlue,
      ),
      child: SizedBox(
          height: size.height,
          width: size.width,
          child: Center(
            child: GlassMorphism(
              opacity: .2,
              blur: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric( vertical: 30.0 , horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Cabs',
                      style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Drive Safely',
                      style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          HapticFeedback.heavyImpact();
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(Icons.search) , 
                            const SizedBox(
                              width: 20,
                            ),
                            Text("Signup With Google",
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                        style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => Colors.orange),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white))),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: size.width / 1.4,
                        child: const Divider(
                          thickness: 3,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                           HapticFeedback.heavyImpact();
                           print("login") ; 
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                              print("login") ; 
                          provider.googleLogin();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(Icons.abc),
                            const SizedBox(
                              width: 20,
                            ),
                            Text("Login With Google",
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white))),
                  ],
                ),
              ),
            ),
          )),
    ));
  }
}
