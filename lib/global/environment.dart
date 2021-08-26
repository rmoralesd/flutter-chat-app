import 'dart:io';

class Environment {
  static String apiURL = Platform.isAndroid
      ? 'http://192.168.0.113:3000/api'
      : 'http://192.168.0.113:3000/api';

  static String socketUrl = Platform.isAndroid
      ? 'http://192.168.0.113:3000'
      : 'http://192.168.0.113:3000';
}