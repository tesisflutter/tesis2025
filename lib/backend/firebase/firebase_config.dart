import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDLIF9jCU8idHl1mYGBbtr9rKPTfcEw-UU",
            authDomain: "tesishors-v1.firebaseapp.com",
            projectId: "tesishors-v1",
            storageBucket: "tesishors-v1.appspot.com",
            messagingSenderId: "543201618558",
            appId: "1:543201618558:web:c7a7b0606f1a42fa0e462f",
            measurementId: "G-JWSBVPTPPS"));
  } else {
    await Firebase.initializeApp();
  }
}
