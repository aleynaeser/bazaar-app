import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseInfo {
  static const String appName = 'Bazaar App';
  static const String version = '1.0.0';
  static const String packageName = 'com.example.bazaar_app';
  static const String buildNumber = '1';

  static String apiUrl = dotenv.env['API_URL'] ?? '';
  static String imageUrl = dotenv.env['IMAGE_URL'] ?? '';
}
