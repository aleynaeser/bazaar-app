import 'package:flutter/material.dart';
import '../../../core/product/models/product.dart';
import '../../../common/constants/base_constants.dart';
import '../../../common/constants/size_constants.dart';
import 'package:bazaar_app/common/models/theme_model.dart';

class ProductGridItem extends StatelessWidget {
  final Product product;
  final bool isLastInRow;

  const ProductGridItem({
    super.key,
    required this.product,
    this.isLastInRow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.smallPadding),
      decoration: BoxDecoration(
        color: context.themeColors.themeColor2,
        border: Border(
          right:
              isLastInRow
                  ? BorderSide.none
                  : BorderSide(
                    color: context.themeColors.themeColor1,
                    width: 1,
                  ),
          bottom: BorderSide(color: context.themeColors.themeColor1, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.network(
              "${BaseInfo.imageUrl}/${product.image}",
              fit: BoxFit.contain,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(Sizes.smallPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: product.name,
                        style: TextStyle(
                          height: 1.6,
                          fontSize: Sizes.largeFontSize,
                          fontWeight: FontWeight.bold,
                          color: context.themeColors.themeColor5,
                        ),
                      ),
                      TextSpan(
                        text: ", provided by ${product.brand} brand",
                        style: TextStyle(
                          height: 1.6,
                          fontSize: Sizes.mediumFontSize,
                          color: context.themeColors.themeColor5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Sizes.mediumSizedBox),

                Row(
                  children: [
                    Text(
                      '${product.price}',
                      style: TextStyle(
                        fontSize: Sizes.largeFontSize,
                        fontWeight: FontWeight.bold,
                        color: context.themeColors.themeColor4,
                        height: 1.6,
                      ),
                    ),
                    Text(" TL"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
