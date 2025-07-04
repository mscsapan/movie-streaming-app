import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_image.dart';
import '../widgets/custom_text.dart';
import '../widgets/primary_button.dart';
import 'constraints.dart';

class Utils {
  static final _selectedDate = DateTime.now();

  static final _initialTime = TimeOfDay.now();

  // static Future<bool> getStoragePermission(BuildContext context) async {
  //   var status = await Permission.storage.status;
  //   if (!status.isGranted) {
  //     // print('permission denied');
  //     status = await Permission.storage.request();
  //   }
  //   return status.isGranted;
  // }

  // static Future<bool> _requestPermissions() async {
  //   var status = await Permission.storage.status;
  //   if (status.isDenied) {
  //     status = await Permission.storage.request();
  //   }
  //   return status.isGranted;
  // }

  // static Future<String> getDir() async {
  //   if (Platform.isAndroid) {
  //     Directory? directory;
  //     if (await _requestPermissions()) {
  //       if (Platform.version.compareTo('29') >= 0) {
  //         directory = await getExternalStorageDirectory();
  //       } else {
  //         directory = Directory('/storage/emulated/0/Download');
  //       }
  //       await directory?.create(recursive: true);
  //     }
  //     return directory?.path ?? '';
  //   } else {
  //     throw UnsupportedError('Unsupported platform');
  //   }
  // }

  static String convertToSlug(String input) {
    return input.toLowerCase().replaceAll(RegExp(r'[^a-zA-Z\d]+'), '-');
  }

  static Size mediaQuery(BuildContext context) => MediaQuery.of(context).size;

  static List<TextInputFormatter> inputFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}$'))
  ];

  static String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  static String priceSeparator(int value, {String locale = 'en_US', String symbol = '', int radix = 0}) {
    try {
      final formatter = NumberFormat.currency(
        locale: locale,
        symbol: symbol,
        decimalDigits: radix,
      );
      return formatter.format(value);
    } catch (e) {
      return value.toStringAsFixed(radix);
    }
  }

  static String translatedText(BuildContext context, String key,
      [bool lower = false]) {
    return key;
    // final webSetting = context.read<AppSettingCubit>().settingModel;
    // if (lower == true) {
    //   if (webSetting != null && webSetting.lang![key] != null) {
    //     return webSetting.lang![key]!.toLowerCase();
    //   } else {
    //     return key.toLowerCase();
    //   }
    // } else {
    //   if (webSetting != null && webSetting.lang![key] != null) {
    //     return '${webSetting.lang![key]}';
    //   } else {
    //     return key;
    //   }
    // }
  }

  // static String convertCurrency(
  //     var price, BuildContext context, CurrenciesModel c,
  //     [int radix = 1]) {
  //   String afterPrice = 'right';
  //   String afterPriceWithSpace = 'after_price_with_space';
  //   if (c.status == 1 && (c.currencyPosition.toLowerCase() == afterPrice)) {
  //     if (price is double) {
  //       // debugPrint('double-price $price');
  //       final result = price * c.currencyRate;
  //       return '${result.toStringAsFixed(radix)}${c.currencyIcon}';
  //     }
  //     if (price is String) {
  //       // debugPrint('String-price $price');
  //       final r = double.tryParse(price) ?? 0.0;
  //       final p = r * c.currencyRate;
  //       return '${p.toStringAsFixed(radix)}${c.currencyIcon}';
  //     }
  //     if (price is int) {
  //       // debugPrint('int-price $price');
  //       final p = price * c.currencyRate;
  //       return '${p.toStringAsFixed(radix)}${c.currencyIcon}';
  //     } else {
  //       // debugPrint('other-price $price');
  //       return '${price * c.currencyRate.toStringAsFixed(radix)}${c.currencyIcon}';
  //     }
  //   } else {
  //     if (price is double) {
  //       final result = price * c.currencyRate;
  //       return '${c.currencyIcon}${result.toStringAsFixed(radix)}';
  //     }
  //     if (price is String) {
  //       final r = double.tryParse(price) ?? 0.0;
  //       final p = r * c.currencyRate;
  //       return '${c.currencyIcon}${p.toStringAsFixed(radix)}';
  //     }
  //     if (price is int) {
  //       // debugPrint('int-price $price');
  //       final p = price * c.currencyRate;
  //       return '${c.currencyIcon}${p.toStringAsFixed(radix)}';
  //     }
  //     return '${c.currencyIcon}${price * c.currencyRate.toStringAsFixed(radix)}';
  //   }
  // }

  // static String formatAmount(BuildContext context, var price, [int radix = 1]) {
  //   final cCubit = context.read<CurrencyCubit>();
  //   final sCubit = context.read<SettingCubit>();
  //   if (cCubit.state.currencies.isNotEmpty) {
  //     return Utils.convertCurrency(
  //         price, context, cCubit.state.currencies.first, radix);
  //   } else {
  //     if (sCubit.settingModel != null &&
  //         sCubit.settingModel!.setting.currencyIcon.isNotEmpty) {
  //       String currency = sCubit.settingModel!.setting.currencyIcon;
  //       final p = price.toString();
  //       return '$currency$p';
  //     } else {
  //       final p = price.toString();
  //       return '\$$p';
  //     }
  //   }
  // }

  static Widget prefixIcon(String path,[Color color = whiteColor]) {
    return Padding(
      padding: Utils.all(value: 12.0),
      child: CustomImage(path: path,color: color,height: 20.0,width: 20.0),
    );
  }

  static String imageContent(BuildContext context, String key) {
    // final webSetting = context.read<AppSettingCubit>().settingModel;
    // if (webSetting != null && webSetting.imageContent![key] != null) {
    //   return RemoteUrls.imageUrl(webSetting.imageContent![key]!);
    // } else {
    return key;
    //}
  }



  //
  // static Future<String?> pickSingleImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     return image.path;
  //   }
  //   return null;
  // }
  //
  // static Future<List<String?>> pickMultipleImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final List<String> imageList = [];
  //   final List<XFile?> images = await picker.pickMultiImage();
  //   if (images.isNotEmpty) {
  //     for (var i in images) {
  //       imageList.add(i!.path.toString());
  //     }
  //     debugPrint('picked images: ${imageList.length}');
  //     return imageList;
  //   }
  //   return [];
  // }
  //
  // static Future<String?> pickSingleFile([bool isResume = false]) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: isResume == true
  //         ? ['mp4', 'mpeg4', 'flv', 'wmv', 'avi']
  //         : ['jpg', 'jpeg', 'png', 'gif'],
  //   );
  //   if (result != null &&
  //       result.files.single.path != null &&
  //       result.files.single.path!.isNotEmpty) {
  //     File file = File(result.files.single.path!);
  //     debugPrint('file-path ${file.path}');
  //     return file.path;
  //   } else {
  //     debugPrint('file path not found');
  //     return '';
  //   }
  // }
  //
  // static Future<List<String>> pickMultipleFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['mp4', 'jpg', 'jpeg', 'zip', 'pdf', 'png'],
  //       allowMultiple: true);
  //   final List<String> fileList = [];
  //   if (result != null && result.files.isNotEmpty) {
  //     for (var file in result.files) {
  //       if (file.path != null && file.path!.isNotEmpty) {
  //         fileList.add(file.path!);
  //       }
  //     }
  //   }
  //   debugPrint('pickMultipleFile $fileList');
  //   return fileList;
  // }

  static String timeWithData(String data, [bool timeAndDate = true]) {
    if (timeAndDate) {
      DateTime dateTime = DateTime.parse(data);
      String formattedDate =
          DateFormat('h:mm a - MMM d, yyyy').format(dateTime);
      return formattedDate;
    } else {
      DateTime dateTime = DateTime.parse(data);
      String formattedDate = DateFormat('MMM d, yyyy').format(dateTime);
      return formattedDate;
    }
  }

  static String formatDate(var date) {
    late DateTime dateTime;
    if (date is String) {
      dateTime = DateTime.parse(date);
    } else {
      dateTime = date;
    }

    // return DateFormat.MMMEd().format(_dateTime.toLocal());
    return DateFormat.yMMMMd().format(dateTime.toLocal());
  }

  static String timeAgo(var date) {
    late DateTime dateTime;
    if (date is String) {
      dateTime = DateTime.now();
    } else {
      dateTime = date;
    }

    // return DateFormat.MMMEd().format(_dateTime.toLocal());
    return DateFormat.jm().format(dateTime);
  }

  static List<dynamic> parseJsonToString(String? text, [bool isTags = true]) {
    List tags = [];

    if (text != null && text.isNotEmpty && text.toLowerCase() != 'null') {
      try {
        List<dynamic> parsedJson = jsonDecode(text.replaceAll('&quot;', '"'));
        if (isTags) {
          tags = parsedJson.map((tag) => tag['value']).toList();
          //print('values-tag $tags');
        } else {
          tags = parsedJson.map((tag) => tag).toList();
          //print('list-tag $tags');
        }
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    }

    return tags;
  }

  static String convertToAgo(String? time) {
    Duration diff = DateTime.now().difference(DateTime.parse(time!));
    try {
      if (diff.inDays >= 1) {
        return '${diff.inDays} days ago';
      } else if (diff.inHours >= 1) {
        return '${diff.inHours} hours ago';
      } else if (diff.inMinutes >= 1) {
        return '${diff.inMinutes} minutes ago';
      } else if (diff.inSeconds >= 1) {
        return '${diff.inSeconds} seconds ago';
      } else {
        return 'Just Now';
      }
    } catch (e) {
      return '';
    }
  }

  static Widget verticalSpace(double size) {
    return SizedBox(height: size.h);
  }

  static Widget horizontalSpace(double size) {
    return SizedBox(width: size.w);
  }

  static double hSize(double size) {
    return size.w;
  }

  static double vSize(double size) {
    return size.h;
  }

  static EdgeInsets symmetric({double h = 24.0, v = 0.0}) {
    return EdgeInsets.symmetric(
        horizontal: Utils.hPadding(size: h), vertical: Utils.vPadding(size: v));
  }

  static double radius(double radius) {
    return radius.sp;
  }

  static BorderRadius borderRadius({double r = 4.0}) {
    return BorderRadius.circular(Utils.radius(r));
  }

  static EdgeInsets all({double value = 0.0}) {
    return EdgeInsets.all(value.dm);
  }

  static EdgeInsets only({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return EdgeInsets.only(
        left: left.w, top: top.h, right: right.w, bottom: bottom.h);
  }

  static double vPadding({double size = 20.0}) {
    return size.h;
  }

  static double hPadding({double size = 20.0}) {
    return size.w;
  }

  static double toDouble(String? number) {
    try {
      if (number == null) return 0;
      return double.tryParse(number) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  static double toInt(String? number) {
    try {
      if (number == null) return 0;
      return double.tryParse(number) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  static Future<DateTime?> selectDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1990, 1),
        lastDate: DateTime(2050),
      );

  static Future<TimeOfDay?> selectTime(BuildContext context) =>
      showTimePicker(context: context, initialTime: _initialTime);

  static void closeKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static loadingDialog(
    BuildContext context, {
    bool barrierDismissible = false,
  }) {
    //closeDialog(context);
    showCustomDialog(
      context,
      child: Container(
        height: Utils.vSize(120.0),
        padding: Utils.all(value: 20.0),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: primaryColor),
              Utils.horizontalSpace(15.0),
              const CustomText(text: 'Please wait a moment')
            ],
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static bool _isDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  static void closeDialog(BuildContext context) {
    if (_isDialogShowing(context)) {
      Navigator.of(context).pop(true);
    }
  }

  static Future showCustomDialog(
    BuildContext context, {
    Widget? child,
    bool barrierDismissible = false,
    Color bgColor = whiteColor,
    EdgeInsets? padding,
    double? radius,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        final p = padding ?? Utils.symmetric();
        final r = radius ?? 6.0;
        return Dialog(
          backgroundColor: bgColor,
          insetPadding: p,
          shape: RoundedRectangleBorder(
            borderRadius: Utils.borderRadius(r: Utils.radius(r)),
          ),
          child: child,
        );
      },
    );
  }

  static void errorSnackBar(BuildContext context, String errorMsg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(errorMsg, style: const TextStyle(color: Colors.red)),
        ),
      );
  }

  static void showSnackBar(BuildContext context, String msg,
      [Color textColor = whiteColor, int time = 1000]) {
    final snackBar = SnackBar(
        duration: Duration(milliseconds: time),
        content: Text(msg, style: TextStyle(color: textColor)));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void serviceUnAvailable(BuildContext context, String msg,
      [Color textColor = Colors.white]) {
    final snackBar = SnackBar(
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 500),
        content: Text(msg, style: TextStyle(color: textColor)));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showSnackBarWithAction(
      BuildContext context, String msg, VoidCallback onPress,
      [Color textColor = primaryColor]) {
    final snackBar = SnackBar(
      content: Text(msg, style: TextStyle(color: textColor)),
      action: SnackBarAction(
        label: 'Active',
        onPressed: onPress,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static exitFromAppDialog(BuildContext context) {
    return Utils.showCustomDialog(
      context,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomImage(path: 'KImages.exitApp'),
            Utils.verticalSpace(8.0),
            const CustomText(
              text: 'Are you sure',
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
              color: blackColor,
              fontSize: 24.0,
            ),
            Utils.verticalSpace(4.0),
            const CustomText(
              text: 'You want to Exit?',
              fontWeight: FontWeight.w500,
              color: grayColor,
              fontSize: 16.0,
            ),
            Utils.verticalSpace(16.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  text: 'Exit',
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  minimumSize: const Size(125.0, 45.0),
                ),
                const SizedBox(width: 12.0),
                PrimaryButton(
                  text: 'Cancel',
                  onPressed: () => Navigator.pop(context),
                  bgColor: redColor,
                  textColor: whiteColor,
                  minimumSize: const Size(125.0, 45.0),
                ),
              ],
            ),
            Utils.verticalSpace(14.0),
          ],
        ),
      ),
    );
  }
}
