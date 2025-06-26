import 'package:flutter/material.dart';

import '../utils/constraints.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.isLeading,
    this.actions,
  });

  final String title;
  final bool? isLeading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isLeading ?? true,
      title: CustomText(
        text: title,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        color: whiteColor,
      ),
      actions: actions,
      // actions: [
      //   CustomText(
      //     text: title,
      //     fontSize: 14.0,
      //     color: grayColor50,
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
