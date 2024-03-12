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
    apiKey: 'AIzaSyClZw0glFZ0rsK47Nm6vmtVBlWGlHHQCMI',
    appId: '1:829138435676:web:e7523fed84220dd32eb099',
    messagingSenderId: '829138435676',
    projectId: 'waiver-driver-9584e',
    authDomain: 'waiver-driver-9584e.firebaseapp.com',
    storageBucket: 'waiver-driver-9584e.appspot.com',
    measurementId: 'G-F8X7RN7D5T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLzRD7VULLb323vCcsG5QdTvbJdLhDbrw',
    appId: '1:829138435676:android:afe885c7906cad562eb099',
    messagingSenderId: '829138435676',
    projectId: 'waiver-driver-9584e',
    storageBucket: 'waiver-driver-9584e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdZqKq8sfuPLYpzhdXLW_B-C9rubin1O4',
    appId: '1:829138435676:ios:418636f1721f780f2eb099',
    messagingSenderId: '829138435676',
    projectId: 'waiver-driver-9584e',
    storageBucket: 'waiver-driver-9584e.appspot.com',
    iosBundleId: 'com.waiver.driver',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdZqKq8sfuPLYpzhdXLW_B-C9rubin1O4',
    appId: '1:829138435676:ios:b2ab526e0826d7c12eb099',
    messagingSenderId: '829138435676',
    projectId: 'waiver-driver-9584e',
    storageBucket: 'waiver-driver-9584e.appspot.com',
    iosBundleId: 'com.waiver.driver.waiverDriver.RunnerTests',
  );
}