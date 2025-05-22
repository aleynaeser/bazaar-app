import 'package:bazaar_app/common/models/theme_model.dart';
import 'package:flutter/material.dart';
import '../../../common/constants/size_constants.dart';
import '../../../core/card/bloc/card_bloc.dart';

class CardPaymentInfo extends StatelessWidget {
  final CardProductState state;

  const CardPaymentInfo({super.key, required this.state});

  int totalPrice() {
    if (state.response.cardProducts.isEmpty) return 0;

    var total = 0;
    for (var product in state.response.cardProducts) {
      total += product.price * product.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    print("state.response.cardProducts: ${state.response.cardProducts.length}");

    return Container(
      padding: EdgeInsets.all(Sizes.mediumPadding),
      decoration: BoxDecoration(
        color: context.themeColors.themeColor2,
        border: Border(
          top: BorderSide(color: context.themeColors.themeColor1, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total Price:"),
          Text(
            "${totalPrice()}₺",
            style: TextStyle(
              fontSize: Sizes.largeFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
