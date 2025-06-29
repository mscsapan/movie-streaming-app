import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Account',isLeading: false),
    );
  }
}
