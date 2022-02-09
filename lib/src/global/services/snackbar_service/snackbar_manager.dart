import 'package:flutter/material.dart';

class SnackbarManager {
  SnackBar getSuccessSnackbar(
    String content,
    double fontSize,
    Duration duration,
  ) {
    return SnackBar(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      backgroundColor: Colors.green,
      elevation: 10,
      content: Text(
        content,
        style: TextStyle(fontSize: fontSize),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: duration,
    );
  }

  SnackBar showError({
    required String content,
    double fontSize = 16,
    Duration duration = const Duration(seconds: 5),
  }) {
    return SnackBar(
      padding: const EdgeInsets.all(8.0),
      backgroundColor: Colors.red,
      content: Text(
        content,
        style: TextStyle(fontSize: fontSize, color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: duration,
    );
  }

  // SnackBar getInternetConnectionLost(
  //     String content, double fontSize, Duration duration) {
  //   return SnackBar(
  //     elevation: 10,
  //     action: SnackBarAction(
  //         label: 'Wifi Settings',
  //         onPressed: () async {
  //           await AppSettings.openWIFISettings();
  //         }),
  //     content: GestureDetector(
  //       behavior: HitTestBehavior.opaque,
  //       child: Text(
  //         content,
  //         style: TextStyle(fontSize: fontSize),
  //       ),
  //     ),
  //     behavior: SnackBarBehavior.floating,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //     duration: duration,
  //   );
  // }
}
