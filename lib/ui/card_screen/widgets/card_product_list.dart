import 'card_product_list_item.dart';
import 'package:flutter/material.dart';
import '../../../core/card/bloc/card_bloc.dart';
import '../../../common/constants/size_constants.dart';
import 'package:bazaar_app/common/models/theme_model.dart';

class CardProductList extends StatelessWidget {
  final CardProductState state;

  const CardProductList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    var response = state.response;

    switch (state.status) {
      case CardStatus.failure:
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(Sizes.largePadding),
            child: Text(
              'There is no product in your card...',
              textAlign: TextAlign.center,
            ),
          ),
        );
      case CardStatus.initial:
        return Center(
          child: CircularProgressIndicator(
            color: context.themeColors.themeColor8,
            padding: EdgeInsets.all(Sizes.mediumPadding),
          ),
        );
      case CardStatus.success:
        return ListView.builder(
          itemCount: response.cardProducts.length,
          itemBuilder: (context, index) {
            return CardProductListItem(
              cardProduct: response.cardProducts[index],
            );
          },
        );
    }
  }
}
