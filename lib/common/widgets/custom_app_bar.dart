import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/size_constants.dart';
import '../providers/theme_provider.dart';
import 'package:bazaar_app/common/models/theme_model.dart';
import '../../core/card/bloc/card_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool withModeButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.withModeButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: context.themeColors.themeColor1,
      backgroundColor: context.themeColors.themeColor1,
      title: Text(
        title,
        style: TextStyle(
          fontSize: Sizes.xxLargeFontSize,
          fontFamily: 'Biro Script',
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: context.themeColors.themeColor2),
      ),
      leading:
          !withModeButton
              ? IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.pop(context);
                  context.read<CardProductBloc>().add(CardProductFetched());
                },
              )
              : null,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: Sizes.smallPadding),
          child:
              withModeButton
                  ? IconButton(
                    icon: Icon(
                      Provider.of<ThemeProvider>(context).isDarkMode
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    ),
                    onPressed: () {
                      Provider.of<ThemeProvider>(
                        context,
                        listen: false,
                      ).toggleTheme();
                    },
                  )
                  : null,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
