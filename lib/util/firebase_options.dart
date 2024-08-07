// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```ClientProfileEditPage.dart
/// import 'firebase_options.ClientProfileEditPage.dart';
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
    apiKey: 'AIzaSyCqwsS11zTuFGy57Ja-E_XmrhvyEef9VKw',
    appId: '1:692724012595:web:0987a41f27d60ff2cd7546',
    messagingSenderId: '692724012595',
    projectId: 'e-bike-b6281',
    authDomain: 'e-bike-b6281.firebaseapp.com',
    databaseURL:
        'https://e-bike-b6281-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'e-bike-b6281.appspot.com',
    measurementId: 'G-836ERZTQBK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZlDu16U1L9KR_hior94Wdt6NGAdW_5lU',
    appId: '1:692724012595:android:523c727df333c827cd7546',
    messagingSenderId: '692724012595',
    projectId: 'e-bike-b6281',
    databaseURL:
        'https://e-bike-b6281-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'e-bike-b6281.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATTCtPjlLNeIQWOGMyumzZUhi_-bstgrI',
    appId: '1:692724012595:ios:0747d2b2ab80f5fdcd7546',
    messagingSenderId: '692724012595',
    projectId: 'e-bike-b6281',
    databaseURL:
        'https://e-bike-b6281-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'e-bike-b6281.appspot.com',
    iosClientId:
        '692724012595-ia52mjht0sn3c9o1f3bvhqf79pvd0si2.apps.googleusercontent.com',
    iosBundleId: 'com.xdev.ebike.ebike',
  );
}
