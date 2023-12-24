import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screens/auth/login_screen.dart';
import 'firebase_options.dart';

late Size mq;
const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');

// class PlatformChecker {
//   static bool isDesktop() {
//     return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
//   }
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  if (kIsWeb) {
    _initializeFirebaseWeb();
  } else {
    _initializeFirebase();
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 19),
          backgroundColor: Colors.white,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

_initializeFirebaseWeb() async {
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBNDPOzKnqX21P23WDyDgbaPcDXi2sB910",
          authDomain: "chat-app-3838d.firebaseapp.com",
          projectId: "chat-app-3838d",
          storageBucket: "chat-app-3838d.appspot.com",
          messagingSenderId: "274329392507",
          appId: "1:274329392507:web:1fb09e964a1150acdd99de",
          measurementId: "G-5S2YZQX70G"));
}
