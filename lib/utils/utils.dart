import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {
  static Map<String, double> getDimensions(BuildContext context, bool includeAppBarHeight) {
    final appBarHeight = includeAppBarHeight ? AppBar().preferredSize.height : 0;
    final deviceHeight = MediaQuery.of(context).size.height -
        appBarHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final deviceWidth = MediaQuery.of(context).size.width;
    return {"height": deviceHeight, "width": deviceWidth};
  }

  static void flushBarErrorMessage(String title, String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        title: title,
        message: message,
        backgroundColor: Theme.of(context).primaryColor,
        duration: const Duration(seconds: 8),
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        flushbarPosition: FlushbarPosition.TOP,
      )..show(context),
    );
  }
}
