import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseInfo {
  static const String appName = 'Bazaar App';
  static const String version = '1.0.0';
  static const String packageName = 'com.example.bazaar_app';
  static const String buildNumber = '1';

  static String apiUrl = dotenv.env['NEWS_API_URL'] ?? '';

  static const String avatarUrl = "https://avatar.iran.liara.run/public";
}
