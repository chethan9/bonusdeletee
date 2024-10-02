import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDhyJLQxvQcFjRNhukHEQr71v8QiBJE_EE",
            authDomain: "bonus-academy.firebaseapp.com",
            projectId: "bonus-academy",
            storageBucket: "bonus-academy.appspot.com",
            messagingSenderId: "1021620493475",
            appId: "1:1021620493475:web:fa76081866700701373316",
            measurementId: "G-9YSZK35TP0"));
  } else {
    await Firebase.initializeApp();
  }
}
