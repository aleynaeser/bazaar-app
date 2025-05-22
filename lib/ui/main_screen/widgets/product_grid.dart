import 'product_grid_item.dart';
import 'package:flutter/material.dart';
import '../../../core/product/bloc/product_bloc.dart';
import '../../../common/constants/size_constants.dart';
import 'package:bazaar_app/common/models/theme_model.dart';

class ProductGrid extends StatelessWidget {
  final ProductState state;

  const ProductGrid({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    var response = state.response;

    switch (state.status) {
      case ProductStatus.failure:
        return const Center(child: Text('Failed to fetch products...'));
      case ProductStatus.initial:
        return Center(
          child: CircularProgressIndicator(
            color: context.themeColors.themeColor8,
            padding: EdgeInsets.all(Sizes.mediumPadding),
          ),
        );
      case ProductStatus.success:
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemCount: response.products.length,
          itemBuilder: (context, index) {
            final isLastInRow = index % 2 == 1;
            return ProductGridItem(
              product: response.products[index],
              isLastInRow: isLastInRow,
            );
          },
        );
    }
  }
}
