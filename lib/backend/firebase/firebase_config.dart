import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCuTZUbqJ0zbSJydxpxhOTJnTKasYOzqOA",
            authDomain: "poultry-food-supply-mob-rjp557.firebaseapp.com",
            projectId: "poultry-food-supply-mob-rjp557",
            storageBucket: "poultry-food-supply-mob-rjp557.appspot.com",
            messagingSenderId: "81103611317",
            appId: "1:81103611317:web:1f38bd8baf97b420a2a5fc"));
  } else {
    await Firebase.initializeApp();
  }
}
