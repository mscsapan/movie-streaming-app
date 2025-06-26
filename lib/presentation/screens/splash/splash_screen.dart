import 'package:flutter/material.dart';


import '../../utils/constraints.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        height: Utils.mediaQuery(context).height,
        width: Utils.mediaQuery(context).width,
        child: const Stack(
          fit: StackFit.expand,
          children: [
            CustomImage(path: KImages.splashBg,fit: BoxFit.cover),
            Positioned(child: Center(child: CustomImage(path: KImages.appLogo))),
            Positioned(
              bottom: 24.0,
              left: 0.0,
              right: 0.0,
              child: CustomText(
                text: 'version 2.04.3.1',
                textAlign: TextAlign.center,
                fontSize: 12.0,
                height: 1.0,
                color: grayColor,),),
          ],
        ),
      ),
    );
  }
}
