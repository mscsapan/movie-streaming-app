import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Search',isLeading: false),
    );
  }
}
