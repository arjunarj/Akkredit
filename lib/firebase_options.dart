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
    apiKey: 'AIzaSyB6QfNZ7KondMvP14LGlrDPTvksfkw7pAE',
    appId: '1:1049537020338:web:3519ec3716ba82a64ea4ab',
    messagingSenderId: '1049537020338',
    projectId: 'akkredit-6f58d',
    authDomain: 'akkredit-6f58d.firebaseapp.com',
    storageBucket: 'akkredit-6f58d.appspot.com',
    measurementId: 'G-4HQSP9DV0S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnuupx6drpk_rq69hoS1lJP_CSqOfuCeI',
    appId: '1:1049537020338:android:753284482ba072cb4ea4ab',
    messagingSenderId: '1049537020338',
    projectId: 'akkredit-6f58d',
    storageBucket: 'akkredit-6f58d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAj8GFt-WOTnVfc3h83014AWgb5YGg5v28',
    appId: '1:1049537020338:ios:183bbd7ee6c28e9a4ea4ab',
    messagingSenderId: '1049537020338',
    projectId: 'akkredit-6f58d',
    storageBucket: 'akkredit-6f58d.appspot.com',
    iosClientId: '1049537020338-j46t3a5crr794bfjgp5rfe8lqqj3e5ta.apps.googleusercontent.com',
    iosBundleId: 'com.akkredit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAj8GFt-WOTnVfc3h83014AWgb5YGg5v28',
    appId: '1:1049537020338:ios:2228cb58e912c9564ea4ab',
    messagingSenderId: '1049537020338',
    projectId: 'akkredit-6f58d',
    storageBucket: 'akkredit-6f58d.appspot.com',
    iosClientId: '1049537020338-qormj4ebovik0l0ldtle7t4625ed02dr.apps.googleusercontent.com',
    iosBundleId: 'com.example.akkredit',
  );
}
