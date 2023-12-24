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
    apiKey: 'AIzaSyABCsuyknJsD5X75Zvx_Wc_GUC2-IZEwpQ',
    appId: '1:25487893224:web:fb4737a91b6840a1d91f5d',
    messagingSenderId: '25487893224',
    projectId: 'twitter-clone-nomad10weeks',
    authDomain: 'twitter-clone-nomad10weeks.firebaseapp.com',
    storageBucket: 'twitter-clone-nomad10weeks.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNvItraihfTUuMTQGh-tUQXznutzDBkyY',
    appId: '1:25487893224:android:6fea313f93f7c0f2d91f5d',
    messagingSenderId: '25487893224',
    projectId: 'twitter-clone-nomad10weeks',
    storageBucket: 'twitter-clone-nomad10weeks.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBw1oq7i7DM-9BmnO551eeegkMgq8U6IGQ',
    appId: '1:25487893224:ios:e2cff6dd145e72fdd91f5d',
    messagingSenderId: '25487893224',
    projectId: 'twitter-clone-nomad10weeks',
    storageBucket: 'twitter-clone-nomad10weeks.appspot.com',
    iosBundleId: 'com.tistory.jastory.twitterCloneChallenge',
  );
}