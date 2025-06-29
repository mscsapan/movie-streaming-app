import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Favorite',isLeading: false),
    );
  }
}
