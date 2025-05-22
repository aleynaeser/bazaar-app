import 'package:flutter/material.dart';
import '../../../core/product/models/product.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/constants/base_constants.dart';
import '../../../common/widgets/quantity_buttons.dart';
import 'package:bazaar_app/common/models/theme_model.dart';

class ProductInfo extends StatefulWidget {
  final Product product;
  final ValueNotifier<int> quantity;
  const ProductInfo({super.key, required this.product, required this.quantity});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenWidth = screenInfo.size.width;
    final double screenHeight = screenInfo.size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: screenHeight * 0.6,
          width: screenWidth,
          decoration: BoxDecoration(color: context.themeColors.themeColor2),
          child: Image.network(
            "${BaseInfo.imageUrl}/${widget.product.image}",
            fit: BoxFit.contain,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(Sizes.largePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.product.name,
                      style: TextStyle(
                        height: 1.6,
                        fontSize: Sizes.xLargeFontSize,
                        fontWeight: FontWeight.bold,
                        color: context.themeColors.themeColor5,
                      ),
                    ),
                    TextSpan(
                      text: ", provided by ${widget.product.brand} brand",
                      style: TextStyle(
                        height: 1.6,
                        fontSize: Sizes.largeFontSize,
                        color: context.themeColors.themeColor5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Sizes.mediumSizedBox),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '${widget.product.price}',
                        style: TextStyle(
                          height: 1.6,
                          fontSize: Sizes.xxLargeFontSize,
                          fontWeight: FontWeight.bold,
                          color: context.themeColors.themeColor4,
                        ),
                      ),
                      Text(
                        " ₺",
                        style: TextStyle(
                          fontSize: Sizes.largeFontSize,
                          fontWeight: FontWeight.w600,
                          color: context.themeColors.themeColor4,
                        ),
                      ),
                    ],
                  ),

                  QuantityButtons(quantity: widget.quantity),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
