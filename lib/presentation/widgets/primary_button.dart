import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constraints.dart';
import '../utils/utils.dart';
import 'custom_text.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.maximumSize = const Size(double.infinity, 48.0),
    required this.text,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w400,
    required this.onPressed,
    this.textColor = whiteColor,
    this.bgColor = primaryColor,
    this.borderColor = primaryColor,
    this.minimumSize = const Size(double.infinity, 48.0),
    this.borderRadiusSize = 4.0,
    this.buttonType = ButtonType.elevated,
    this.padding,
    this.icon,
  });

  final VoidCallback? onPressed;

  final String text;
  final Size maximumSize;
  final Size minimumSize;
  final double fontSize;
  final double borderRadiusSize;
  final Color textColor;
  final Color bgColor;
  final Color borderColor;
  final ButtonType buttonType;
  final EdgeInsets? padding;
  final Widget? icon;
  final FontWeight fontWeight;


  @override
  Widget build(BuildContext context) {
    final tempIcon = icon ?? const Icon(Icons.add);
    final borderRadius = BorderRadius.circular(borderRadiusSize);
    if (buttonType == ButtonType.iconButton) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(bgColor),
          splashFactory: NoSplash.splashFactory,
          shadowColor: WidgetStateProperty.all(transparent),
          overlayColor: WidgetStateProperty.all(transparent),
          elevation: WidgetStateProperty.all(0.0),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius)),
          side: WidgetStateProperty.all(BorderSide(color: borderColor, width: 1.0)),
          minimumSize: WidgetStateProperty.all(minimumSize),
          maximumSize: WidgetStateProperty.all(maximumSize),
        ),
        icon: Padding(
          padding: padding ?? Utils.all(value: 0.0),
          child: tempIcon,
        ),
        label: CustomText(
          text: text,
          color: textColor,
          fontSize: fontSize.sp,
          height: 1.4,
          fontWeight: fontWeight,
          textAlign: TextAlign.center,
        ),
      );
    } else if (buttonType == ButtonType.outlined) {
      return Padding(
        padding: padding ?? Utils.all(value: 0.0),
        child: OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(bgColor),
            splashFactory: NoSplash.splashFactory,
            shadowColor: WidgetStateProperty.all(transparent),
            overlayColor: WidgetStateProperty.all(transparent),
            elevation: WidgetStateProperty.all(0.0),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: borderRadius,
                side: BorderSide(color: borderColor))),
            minimumSize: WidgetStateProperty.all(minimumSize),
            maximumSize: WidgetStateProperty.all(maximumSize),
          ),
          child: Padding(
            padding: Utils.only(bottom: 0.0),
            child: CustomText(
              text: text,
              color: textColor,
              fontSize: fontSize.sp,
              height: 1.4,
              fontWeight: fontWeight,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: padding ?? Utils.all(value: 0.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(bgColor),
            splashFactory: NoSplash.splashFactory,
            shadowColor: WidgetStateProperty.all(transparent),
            overlayColor: WidgetStateProperty.all(transparent),
            elevation: WidgetStateProperty.all(0.0),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius)),
            minimumSize: WidgetStateProperty.all(minimumSize),
            maximumSize: WidgetStateProperty.all(maximumSize),
          ),
          child: Padding(
            padding: padding ?? Utils.all(value: 0.0),
            child: CustomText(
              text: text,
              color: textColor,
              fontSize: fontSize,
              height: 1.4,
              fontWeight: fontWeight,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
  }
}

enum ButtonType { elevated, outlined, iconButton }
