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
///  options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsGB8sI60o7_3-7pGThi9uHhQ9ceb7_YU',
    appId: '1:368535210344:android:9c818c88ca189a723a2edd',
    messagingSenderId: '368535210344',
    projectId: 'banseo-youth',
    storageBucket: 'banseo-youth.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEHh3fTK1n1J27tzOo_ii9-b6_E1OvTOc',
    appId: '1:368535210344:ios:f7207d2897ecc6a33a2edd',
    messagingSenderId: '368535210344',
    projectId: 'banseo-youth',
    storageBucket: 'banseo-youth.appspot.com',
    androidClientId: '368535210344-2flvrfccvhlblanqt4mdt8mie0g5ke18.apps.googleusercontent.com',
    iosClientId: '368535210344-24g72u8pequq1dip52j9vfakseq8cavo.apps.googleusercontent.com',
    iosBundleId: 'com.banseo.youth.youthchurch',
  );
}
