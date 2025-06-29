import 'package:flutter/material.dart';


import '../utils/constraints.dart';
import '../utils/utils.dart';
import 'custom_text.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key, this.padding, required this.title, this.viewText, this.onTap,this.isShowMoreText,this.headerColor});
  final EdgeInsets ? padding;
  final String title;
  final String? viewText;
  final VoidCallback ? onTap;
  final bool ? isShowMoreText;
  final Color ? headerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding??Utils.symmetric(h: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: CustomText(text: title,fontWeight: FontWeight.w700,fontSize: 16.0,maxLine: 1,color: headerColor?? whiteColor)),
          if(isShowMoreText??true)...[
            Flexible(child: GestureDetector(onTap: onTap??(){}, child: CustomText(text: viewText?? 'View All',fontWeight: FontWeight.w400,fontSize: 14.0,maxLine: 1,color: grayColor50))),
          ],
        ],
      ),
    );
  }
}
