import '../../common/constants/base_constants.dart';
import 'widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'widgets/product_categories.dart';
import '../../../core/card/bloc/card_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/custom_app_bar.dart';
import '../../../core/product/models/product.dart';
import '../../common/constants/size_constants.dart';
import 'package:bazaar_app/common/models/theme_model.dart';
import '../../../core/card/models/card_actions/add_card.dart';

class ProductViewScreen extends StatefulWidget {
  final Product product;
  const ProductViewScreen({super.key, required this.product});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  late final ValueNotifier<int> quantity;

  @override
  void initState() {
    super.initState();
    quantity = ValueNotifier(1);
  }

  @override
  void dispose() {
    quantity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Product product = widget.product;

    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProductInfo(product: product, quantity: quantity),
            ProductCategories(),
          ],
        ),
      ),
      bottomSheet: ElevatedButton(
        onPressed: () {
          final addCard = AddCard(
            name: product.name,
            image: product.image,
            category: product.category,
            price: product.price,
            brand: product.brand,
            quantity: quantity.value,
            username: BaseInfo.username,
          );

          context.read<CardAddBloc>().add(
            CardAddEvent(addCard, context.read<CardProductBloc>()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: context.themeColors.themeColor3,
          elevation: 0,
          minimumSize: Size(double.infinity, 70),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        child: Text(
          "Add to Card",
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
