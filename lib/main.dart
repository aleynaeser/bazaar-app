import 'ui/main_screen/index.dart';
import 'ui/splash_screen/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/configs/theme_config.dart';
import 'common/providers/theme_provider.dart';
import 'common/constants/base_constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  await dotenv.load(fileName: ".env");

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: BazaarApp(showHome: showHome),
    ),
  );
}

class BazaarApp extends StatelessWidget {
  const BazaarApp({super.key, required this.showHome});

  final bool showHome;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: BaseInfo.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeConfig.getTheme(themeProvider.isDarkMode),
          home: showHome ? const MainScreen() : const SplashScreen(),
        );
      },
    );
  }
}
