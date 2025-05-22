import 'package:flutter/material.dart';
import 'widgets/card_payment_info.dart';
import 'widgets/card_product_list.dart';
import '../../core/card/bloc/card_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/custom_app_bar.dart';
import '../../common/constants/size_constants.dart';
import 'package:bazaar_app/common/models/theme_model.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeColors.themeColor1,
      appBar: CustomAppBar(title: "Card"),
      body: BlocBuilder<CardProductBloc, CardProductState>(
        builder: (context, state) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: CardProductList(state: state),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 70,
                child: CardPaymentInfo(state: state),
              ),
            ],
          );
        },
      ),
      bottomSheet: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: context.themeColors.themeColor3,
          elevation: 0,
          minimumSize: Size(double.infinity, 70),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        child: Text(
          "Confirm Card",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.xLargeFontSize,
            color: context.themeColors.themeColor2,
          ),
        ),
      ),
    );
  }
}
