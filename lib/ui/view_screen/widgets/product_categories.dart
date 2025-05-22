import 'package:flutter/material.dart';
import '../../../common/constants/size_constants.dart';
import 'package:bazaar_app/common/models/theme_model.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.mediumPadding,
        vertical: 8,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildCategoryItem(Icons.verified, 'Successful Seller', context),
            const SizedBox(width: Sizes.smallSizedBox),
            _buildCategoryItem(Icons.local_shipping, 'Free Delivery', context),
            const SizedBox(width: Sizes.smallSizedBox),
            _buildCategoryItem(Icons.group, 'Buy Together Save', context),
            const SizedBox(width: Sizes.smallSizedBox),
            _buildCategoryItem(Icons.video_library, 'Video Product', context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String text, BuildContext context) {
    final themeColors = Theme.of(context).extension<CustomThemeModel>();
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: Sizes.smallPadding,
      ),
      decoration: BoxDecoration(
        color: themeColors?.themeColor2,
        borderRadius: BorderRadius.circular(Sizes.largeBorderRadius),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: Sizes.smallIconSize,
            color: themeColors?.themeColor3,
          ),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(fontSize: Sizes.xSmallFontSize)),
        ],
      ),
    );
  }
}
