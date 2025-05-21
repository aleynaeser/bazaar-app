import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/size_constants.dart';
import '../providers/theme_provider.dart';
import 'package:bazaar_app/common/models/theme_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: context.themeColors.themeColor1,
      backgroundColor: context.themeColors.themeColor1,
      title: Text(
        "Bazaar",
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
      actions: [
        Padding(
          padding: EdgeInsets.only(right: Sizes.smallPadding),
          child: IconButton(
            icon: Icon(
              Provider.of<ThemeProvider>(context).isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
