import 'package:flutter/material.dart';
import '../constants/size_constants.dart';
import 'package:bazaar_app/common/models/theme_model.dart';

class QuantityButtons extends StatefulWidget {
  final ValueNotifier<int> quantity;
  const QuantityButtons({super.key, required this.quantity});

  @override
  State<QuantityButtons> createState() => _QuantityButtonsState();
}

class _QuantityButtonsState extends State<QuantityButtons> {
  void _increment() {
    widget.quantity.value++;
  }

  void _decrement() {
    if (widget.quantity.value > 1) {
      widget.quantity.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: widget.quantity,
      builder: (context, value, child) {
        return Row(
          children: [
            Container(
              width: Sizes.xLargeIconSize,
              height: Sizes.xLargeIconSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.themeColors.themeColor6,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: _decrement,
                icon: Icon(
                  Icons.remove,
                  size: Sizes.smallIconSize,
                  color: context.themeColors.themeColor2,
                ),
              ),
            ),
            const SizedBox(width: Sizes.smallSizedBox),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: Sizes.largeFontSize,
                fontWeight: FontWeight.bold,
                color: context.themeColors.themeColor4,
              ),
            ),
            const SizedBox(width: Sizes.smallSizedBox),
            Container(
              width: Sizes.xLargeIconSize,
              height: Sizes.xLargeIconSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.themeColors.themeColor6,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: _increment,
                icon: Icon(
                  Icons.add,
                  size: Sizes.smallIconSize,
                  color: context.themeColors.themeColor2,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
