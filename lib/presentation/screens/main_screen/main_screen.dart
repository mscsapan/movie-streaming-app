import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'component/bottom_navigation_bar.dart';
import 'component/main_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _homeController = MainController();
  late List<Widget> screenList;

  @override
  void initState() {
    super.initState();
    screenList = [
      // const DashboardScreen(),
      // const MyShopScreen(),
      // const SellerAllOrderScreen(),
      // const WithdrawScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // final dCubit = context.read<DashboardCubit>();
    return WillPopScope(
      onWillPop: () async {
        Utils.exitFromAppDialog(context);
        return true;
      },
      child: Scaffold(
        body: StreamBuilder<int>(
          initialData: 0,
          stream: _homeController.naveListener.stream,
          builder: (context, AsyncSnapshot<int> snapshot) {
            int item = snapshot.data ?? 0;
            return screenList[item];
          },
        ),
        bottomNavigationBar: const MyBottomNavigationBar(),
        // bottomNavigationBar: BlocBuilder<DashboardCubit, DashboardState>(
        //   builder: (context, state) {
        //     if (state is DashboardStateLoaded) {
        //       return const MyBottomNavigationBar();
        //     }
        //     if (dCubit.dashboardModel != null) {
        //       return const MyBottomNavigationBar();
        //     } else {
        //       return const SizedBox.shrink();
        //     }
        //   },
        // ),
      ),
    );
  }
}
