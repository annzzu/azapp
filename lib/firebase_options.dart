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
    apiKey: 'AIzaSyDYGapQjPn_g4RYqM1hWJgZ4ben6oUO3YE',
    appId: '1:801308662327:web:c08a6b2e3ad2f27da53db2',
    messagingSenderId: '801308662327',
    projectId: 'azapp-9e58f',
    authDomain: 'azapp-9e58f.firebaseapp.com',
    storageBucket: 'azapp-9e58f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHo1u58WMkIWX9kPneooCOCpFw3SXUWTk',
    appId: '1:801308662327:android:794d31d14a66de4aa53db2',
    messagingSenderId: '801308662327',
    projectId: 'azapp-9e58f',
    storageBucket: 'azapp-9e58f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDiNcynaRNXSOm52ckMc8ydRdMc5xOazuk',
    appId: '1:801308662327:ios:6907bc22c767fc1ea53db2',
    messagingSenderId: '801308662327',
    projectId: 'azapp-9e58f',
    storageBucket: 'azapp-9e58f.appspot.com',
    iosClientId: '801308662327-smfdq0br61ck30jv9jhleueif74h5ehc.apps.googleusercontent.com',
    iosBundleId: 'com.example.azapp',
  );
}