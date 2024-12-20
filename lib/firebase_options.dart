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
        return macos;
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
    apiKey: 'AIzaSyBpnDCpVge60B9ILyQWGs-b6GL3qZy7jcc',
    appId: '1:559493696484:web:daed79804c99bb6a8115f1',
    messagingSenderId: '559493696484',
    projectId: 'furnitureapp-67db7',
    authDomain: 'furnitureapp-67db7.firebaseapp.com',
    databaseURL:
        'https://furnitureapp-67db7-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'furnitureapp-67db7.appspot.com',
    measurementId: 'G-0D00MJB7GD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5tywAzggd25mCCcIBOLQB5gyjG_SuR4I',
    appId: '1:559493696484:android:44f96bf909870ad58115f1',
    messagingSenderId: '559493696484',
    projectId: 'furnitureapp-67db7',
    databaseURL:
        'https://furnitureapp-67db7-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'furnitureapp-67db7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcVAT4Ofj-s4sZjpfxaPu0edhFeNBb6Uo',
    appId: '1:559493696484:ios:f24f83d96047e0858115f1',
    messagingSenderId: '559493696484',
    projectId: 'furnitureapp-67db7',
    databaseURL:
        'https://furnitureapp-67db7-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'furnitureapp-67db7.appspot.com',
    iosBundleId: 'com.yaroslavfurnitureapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcVAT4Ofj-s4sZjpfxaPu0edhFeNBb6Uo',
    appId: '1:559493696484:ios:6f7f7f4a8fc5c9898115f1',
    messagingSenderId: '559493696484',
    projectId: 'furnitureapp-67db7',
    databaseURL:
        'https://furnitureapp-67db7-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'furnitureapp-67db7.appspot.com',
    iosBundleId: 'com.example.furnitureAppFlutter.RunnerTests',
  );
}
