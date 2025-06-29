import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';
import 'main_controller.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MainController();
    return Container(
      height: Platform.isAndroid ? 80 : 100,
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          )),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: StreamBuilder(
          initialData: 0,
          stream: controller.naveListener.stream,
          builder: (_, AsyncSnapshot<int> index) {
            int selectedIndex = index.data ?? 0;
            return BottomNavigationBar(
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedLabelStyle:
                  const TextStyle(fontSize: 14, color: blackColor),
              unselectedLabelStyle:
                  const TextStyle(fontSize: 14, color: grayColor),
              items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  tooltip: 'Home',
                  icon: _navIcon(KImages.homeIcon),
                  activeIcon: _navIcon(KImages.homeActiveIcon),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  tooltip: 'Favorite',
                  icon: _navIcon(KImages.favoriteIcon),
                  activeIcon: _navIcon(KImages.favoriteActiveIcon),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  tooltip: 'Search',
                  icon: _navIcon(KImages.searchIcon),
                  activeIcon: _navIcon(KImages.searchActiveIcon),
                  label: 'Search',
                ),
                const BottomNavigationBarItem(
                  tooltip: 'Account',
                  activeIcon: CustomImage(path: KImages.account,height: 40.0,width: 40.0,fit: BoxFit.cover,),
                  icon: CustomImage(path: KImages.account,height: 40.0,width: 40.0,fit: BoxFit.cover,),
                  label: 'Account',
                ),
              ],
              // type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              onTap: (int index) {
                controller.naveListener.sink.add(index);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _navIcon(String path) => Padding(
      padding: Utils.symmetric(v: 8.0, h: 0.0), child: SvgPicture.asset(path));
}
