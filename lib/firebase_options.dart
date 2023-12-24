// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBNDPOzKnqX21P23WDyDgbaPcDXi2sB910',
    appId: '1:274329392507:web:1fb09e964a1150acdd99de',
    messagingSenderId: '274329392507',
    projectId: 'chat-app-3838d',
    authDomain: 'chat-app-3838d.firebaseapp.com',
    storageBucket: 'chat-app-3838d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANa5_q-ZVEU01OcJVyRVtcexCjIsq5AZI',
    appId: '1:274329392507:android:fbc497d1fc52571ddd99de',
    messagingSenderId: '274329392507',
    projectId: 'chat-app-3838d',
    storageBucket: 'chat-app-3838d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCf0RCfH4jIAD142pU2Oo75xHZei6Cp8hU',
    appId: '1:274329392507:ios:e53a7749d20f0da2dd99de',
    messagingSenderId: '274329392507',
    projectId: 'chat-app-3838d',
    storageBucket: 'chat-app-3838d.appspot.com',
    androidClientId: '274329392507-1al4nb7qo5kfho6fednlavrdnbhb8023.apps.googleusercontent.com',
    iosClientId: '274329392507-uuoc3iamu5d829fsiqc6ci5mha6uad1c.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterChatApp',
  );
}
