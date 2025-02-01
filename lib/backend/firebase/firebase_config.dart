import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDlgkciwJt0qlHU31k7g5_OAAPoYCdlqpM",
            authDomain: "gvc-2025.firebaseapp.com",
            projectId: "gvc-2025",
            storageBucket: "gvc-2025.firebasestorage.app",
            messagingSenderId: "223848942861",
            appId: "1:223848942861:web:b88f0f25906903b4dd7444",
            measurementId: "G-FHEHQ865W2"));
  } else {
    await Firebase.initializeApp();
  }
}
