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
    apiKey: 'AIzaSyAreoLvFvUiVEjQ7HpiNYrvBBFkD7WW0Yc',
    appId: '1:194982679213:web:11386726303b0e8d92ac24',
    messagingSenderId: '194982679213',
    projectId: 'code-exp-b7ff3',
    authDomain: 'code-exp-b7ff3.firebaseapp.com',
    storageBucket: 'code-exp-b7ff3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBaji7OSEdEUKOOB_fe7oE_XBRgeI8RUE8',
    appId: '1:194982679213:android:8d694349edfd87ad92ac24',
    messagingSenderId: '194982679213',
    projectId: 'code-exp-b7ff3',
    storageBucket: 'code-exp-b7ff3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5fqGsqJUmkjdHSZhQ8DBY9y0Bvd4IPis',
    appId: '1:194982679213:ios:e94fa50b93feecbd92ac24',
    messagingSenderId: '194982679213',
    projectId: 'code-exp-b7ff3',
    storageBucket: 'code-exp-b7ff3.appspot.com',
    iosClientId: '194982679213-0vl2padjjl93u8s7i6q9o4600ej9h1es.apps.googleusercontent.com',
    iosBundleId: 'com.example.codeExp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5fqGsqJUmkjdHSZhQ8DBY9y0Bvd4IPis',
    appId: '1:194982679213:ios:e94fa50b93feecbd92ac24',
    messagingSenderId: '194982679213',
    projectId: 'code-exp-b7ff3',
    storageBucket: 'code-exp-b7ff3.appspot.com',
    iosClientId: '194982679213-0vl2padjjl93u8s7i6q9o4600ej9h1es.apps.googleusercontent.com',
    iosBundleId: 'com.example.codeExp',
  );
}
