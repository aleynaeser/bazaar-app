import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/card/bloc/card_bloc.dart';
import '../../../core/card/models/card-product.dart';
import '../../../common/constants/base_constants.dart';
import '../../../common/constants/size_constants.dart';
import 'package:bazaar_app/common/models/theme_model.dart';
import '../../../core/card/models/card_actions/delete_card.dart';

class CardProductListItem extends StatefulWidget {
  final CardProduct cardProduct;
  const CardProductListItem({super.key, required this.cardProduct});

  @override
  State<CardProductListItem> createState() => _CardProductListItemState();
}

class _CardProductListItemState extends State<CardProductListItem> {
  @override
  Widget build(BuildContext context) {
    final CardProduct cardProduct = widget.cardProduct;

    return Container(
      padding: const EdgeInsets.all(Sizes.smallPadding),
      decoration: BoxDecoration(
        color: context.themeColors.themeColor2,
        border: Border(
          bottom: BorderSide(color: context.themeColors.themeColor1, width: 1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              "${BaseInfo.imageUrl}/${cardProduct.image}",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.smallPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: cardProduct.name,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: Sizes.largeFontSize,
                            fontWeight: FontWeight.bold,
                            color: context.themeColors.themeColor5,
                          ),
                        ),
                        TextSpan(
                          text: ", provided by ${cardProduct.brand} brand",
                          style: TextStyle(
                            height: 1.6,
                            fontSize: Sizes.mediumFontSize,
                            color: context.themeColors.themeColor5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Sizes.smallSizedBox),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Adet: ',
                                style: TextStyle(
                                  height: 1.6,
                                  fontSize: Sizes.mediumFontSize,
                                  color: context.themeColors.themeColor6,
                                ),
                              ),
                              Text(
                                '${cardProduct.quantity}',
                                style: TextStyle(
                                  fontSize: Sizes.mediumFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: context.themeColors.themeColor4,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Fiyat: ',
                                style: TextStyle(
                                  height: 1.6,
                                  fontSize: Sizes.mediumFontSize,
                                  color: context.themeColors.themeColor6,
                                ),
                              ),
                              Text(
                                '${cardProduct.price}₺',
                                style: TextStyle(
                                  fontSize: Sizes.mediumFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: context.themeColors.themeColor4,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          size: Sizes.mediumIconSize,
                          color: context.themeColors.themeColor4,
                        ),
                        onPressed: () {
                          final deleteCard = DeleteCard(
                            cardId: cardProduct.cardId,
                            username: BaseInfo.username,
                          );

                          context.read<CardDeleteBloc>().add(
                            CardDeleteEvent(
                              deleteCard,
                              context.read<CardProductBloc>(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
