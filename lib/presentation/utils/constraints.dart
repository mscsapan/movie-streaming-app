import 'package:flutter/material.dart';

const primaryColor = Color(0xFF298CFF);
const blackColor = Color(0xFF0A0A0A);
const whiteColor = Color(0xFFFFFFFF);
const grayColor = Color(0xFF757575);
const grayColor50 = Color(0xFFC2C2C2);
const grayColor60 = Color(0xFF9E9E9E);

const secondaryColor = Color(0xFFFE9900);
Color hintTextColor = const Color(0xFF000000).withOpacity(0.2);

const greenColor = Color(0xFF22C55E);
const blueColor = Color(0xFF3266CC);
const redColor = Color(0xFFFE2C55);

const scaffoldBgColor = Color(0xFF0A0A0A);
const grayBackgroundColor = Color(0xFFF3F3F3);
const Color borderColor = Color(0xFFE2E8F0);

const kDuration = Duration(microseconds: 300);

const Color transparent = Colors.transparent;
const double dialogHeight = 270.0;

///custom fonts
const String bold400 = 'Regular400';
const String bold500 = 'Regular500';
const String bold700 = 'Bold700';


const String fontFamily = 'HelveticaNeueMedium';

///gradient colors
const buttonGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [Color(0xFF885DF1), Color(0xFF6610F2)],
);

const activeTabButtonGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [Color(0xFFFFC107), Color(0xFFFD7E14)],
);
const inactiveTabButtonGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [Colors.white, whiteColor],
);

const dialogCircleGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [Color(0xFFFFC107), Color(0xFFFD7E14)],
);
