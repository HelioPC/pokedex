import 'package:flutter_config/flutter_config.dart';

class EnvKeys {
  static String googleApi = FlutterConfig.get('GOOGLE_MAPS_API_KEY') as String;
  static String firebaseWebApi =
      FlutterConfig.get('FIREBASE_WEB_API_KEY') as String;
}
