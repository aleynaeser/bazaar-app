import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/models/theme_model.dart';
import 'splash_screen_bottom_sheet.dart';

class SplashScreenView extends StatefulWidget {
  final PageController controller;

  const SplashScreenView({super.key, required this.controller});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: widget.controller,
            children: <Widget>[
              SplashScreenPageView(
                animation: "assets/animations/splash_screen_1.json",
                title: "Start to Add",
                description:
                    "Discover unique products from local sellers. Browse items, add to cart, and enjoy secure payments with fast delivery.",
              ),
              SplashScreenPageView(
                animation: "assets/animations/splash_screen_2.json",
                title: "Let's Shopping",
                description:
                    "Turn your items into opportunities! Create listings, set prices, and connect with buyers in your neighborhood.",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SplashScreenPageView extends StatelessWidget {
  final String animation;
  final String title;
  final String description;

  const SplashScreenPageView({
    super.key,
    required this.animation,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(animation),
        const SizedBox(height: 64),
        Text(
          title,
          style: TextStyle(
            fontSize: Sizes.xLargeTextSize,
            fontWeight: FontWeight.bold,
            color: context.themeColors.themeColor3,
          ),
        ),
        const SizedBox(height: Sizes.smallSizedBox),
        Container(
          padding: const EdgeInsets.all(Sizes.mediumPadding),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.8,
              fontSize: Sizes.mediumTextSize,
              color: context.themeColors.themeColor6,
            ),
          ),
        ),
      ],
    );
  }
}
