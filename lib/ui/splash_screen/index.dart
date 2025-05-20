import 'package:flutter/material.dart';
import 'widgets/splash_screen_view.dart';
import 'widgets/splash_screen_bottom_sheet.dart';
import '../../common/constants/size_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(Sizes.mediumPadding),
        child: SplashScreenView(controller: controller),
      ),
      bottomSheet: SplashScreenBottomSheet(controller: controller),
    );
  }
}
