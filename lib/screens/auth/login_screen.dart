import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/api/apis.dart';
import 'package:flutter_chat_app/helper/dialogs.dart';
import 'package:flutter_chat_app/main.dart';
import 'package:flutter_chat_app/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  _handleGoogleBtnClick() {
    Dialogs.showProgressBar(context);
    log('$kIsWeb');
    if (kIsWeb) {
      signInWithGoogleWeb().then((user) async {
        Navigator.pop(context);
        print('\nUser: ${user!.user}');
        print('\n\nUserAdditionalInfo: ${user.additionalUserInfo}');
        if ((await APIs.userExists())) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const SplashScreen()),
          );
        } else {
          await APIs.createUser().then((value) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const SplashScreen()),
            );
          });
        }
      });
    } else {
      signInWithGoogle().then((user) async {
        Navigator.pop(context);
        print('\nUser: ${user!.user}');
        print('\n\nUserAdditionalInfo: ${user.additionalUserInfo}');
        if ((await APIs.userExists())) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const SplashScreen()),
          );
        } else {
          await APIs.createUser().then((value) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const SplashScreen()),
            );
          });
        }
      });
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      Dialogs.showSnackbar(context, 'Kiểm tra kết nối Internet!');
    }
    return null;
  }

  Future<UserCredential?> signInWithGoogleWeb() async {
    try {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithPopup(googleProvider);

      // Or use signInWithRedirect
      // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
    } catch (e) {
      Dialogs.showSnackbar(context, 'Kiểm tra kết nối Internet!');
      // return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to We Chat'),
      ),
      body: Stack(children: [
        Positioned(
          top: mq.height * .15,
          left: mq.width * 0.25,
          width: mq.width * 0.5,
          child: Image.asset('images/icon_app.png'),
        ),
        Positioned(
          bottom: mq.height * .15,
          height: mq.height * .07,
          left: mq.width * 0.1,
          width: mq.width * .8,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 119, 185, 255),
                shape: const StadiumBorder(),
                elevation: 1),
            onPressed: () {
              _handleGoogleBtnClick();
            },
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'images/google.png',
                height: mq.height * .06,
              ),
            ),
            label: RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.white, fontSize: 19),
                children: [
                  TextSpan(text: 'Sign In with'),
                  TextSpan(
                      text: ' Google',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
