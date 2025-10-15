import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return android;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return ios;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkeGu8K9Sq4dgDPelR7DTBDBNaiAEs0mM',
    appId: '1:666698748473:android:1bee8cc43a36f002bef3e8',
    messagingSenderId: '666698748473',
    projectId: 'kaspa-38f73',
    // databaseURL: 'YOUR_DATABASE_URL',
    storageBucket: 'kaspa-38f73.firebasestorage.app',
  ); 

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDP9Gmds6IngAiQDcUeS5C7wCRBMiDe-ck',
    appId: '1:666698748473:ios:583f1aaf53c69580bef3e8',
    messagingSenderId: '666698748473',
    projectId: 'kaspa-38f73',
    // databaseURL: 'YOUR_DATABASE_URL',
    storageBucket: 'kaspa-38f73.firebasestorage.app',
    iosBundleId: 'com.kaspa.kaspa',
  );
}
