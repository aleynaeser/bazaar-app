import '../../main_screen/index.dart';
import 'package:flutter/material.dart';
import '../../../common/constants/size_constants.dart';
import 'package:bazaar_app/common/models/theme_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreenBottomSheet extends StatelessWidget {
  final PageController controller;

  const SplashScreenBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.themeColors.themeColor1,
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: Sizes.mediumPadding),
            Center(
              child: SmoothPageIndicator(
                count: 2,
                controller: controller,
                effect: WormEffect(
                  spacing: 16,
                  activeDotColor: context.themeColors.themeColor3,
                ),
                onDotClicked:
                    (index) => controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
              ),
            ),
            ElevatedButton(
              onPressed:
                  () => {
                    if (controller.page == 1)
                      {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        ),
                      }
                    else
                      {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                      },
                  },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(120, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
              child: Text(
                "Skip",
                style: TextStyle(fontSize: Sizes.largeFontSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
