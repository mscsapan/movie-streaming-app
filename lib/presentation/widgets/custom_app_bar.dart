import 'package:flutter/material.dart';

import '../utils/constraints.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.isLeading,
    this.actions, this.onTap,
  });

  final String title;
  final bool? isLeading;
  final List<Widget>? actions;
  final VoidCallback ? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //automaticallyImplyLeading: isLeading ?? true,
      leading: isLeading ?? true? GestureDetector(
          onTap: onTap ?? () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back, color: whiteColor, size: 20.0)):const SizedBox.shrink(),
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
