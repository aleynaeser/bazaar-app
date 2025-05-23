import '../card_screen/index.dart';
import 'widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/custom_app_bar.dart';
import '../../core/product/bloc/product_bloc.dart';
import '../../core/card/bloc/card_bloc.dart';
import '../../common/constants/size_constants.dart';
import 'package:bazaar_app/common/models/theme_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Bazaar", withModeButton: true),
      body: BlocProvider(
        create: (context) => ProductBloc()..add(ProductFetched()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return ProductGrid(state: state);
          },
        ),
      ),
      floatingActionButton: BlocBuilder<CardProductBloc, CardProductState>(
        builder: (context, state) {
          final cartCount = state.response?.cardProducts.length ?? 0;

          return Stack(
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardScreen()),
                  );
                },
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: Sizes.largeIconSize,
                ),
              ),
              if (cartCount > 0)
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: context.themeColors.themeColor1,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: context.themeColors.themeColor3,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      cartCount.toString(),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: context.themeColors.themeColor3,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
