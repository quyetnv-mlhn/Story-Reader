import 'package:flutter/material.dart';
import 'package:story_reader/gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({super.key, this.height = kToolbarHeight});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Image.asset(
        Assets.images.logo.path,
        fit: BoxFit.contain,
      ),
      centerTitle: true,
      // title: ,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
