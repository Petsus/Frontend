import 'package:flutter/material.dart';
import 'package:petsus/util/resources/app_color.dart';

enum Side { left, right }

class SideSheet {

  static Future<dynamic> open({
    required Widget body,
    required Side side,
    required BuildContext context,
    double? width,
    Color? sheetColor,
    Color? barrierColor,
    double? proportional,
    String barrierLabel = '',
    double sheetBorderRadius = 0,
    bool barrierDismissible = true,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) async {
    return await _showSheetSide(
      body: body,
      width: width,
      context: context,
      proportional: proportional,
      barrierLabel: barrierLabel,
      rightSide: side == Side.right,
      sheetBorderRadius: sheetBorderRadius,
      transitionDuration: transitionDuration,
      barrierDismissible: barrierDismissible,
      sheetColor: sheetColor ?? ColorApp.surface.color,
      barrierColor: barrierColor ?? ColorApp.surface.color.withOpacity(0.8),
    );
  }

  static _showSheetSide({
    double? width,
    double? proportional,
    required Widget body,
    required bool rightSide,
    required BuildContext context,
    required String barrierLabel,
    required bool barrierDismissible,
    required Color barrierColor,
    required double sheetBorderRadius,
    required Color sheetColor,
    required Duration transitionDuration,
  }) {
    BorderRadius borderRadius = BorderRadius.only(
      topLeft: rightSide ? Radius.circular(sheetBorderRadius) : Radius.zero,
      bottomLeft: rightSide ? Radius.circular(sheetBorderRadius) : Radius.zero,
      topRight: !rightSide ? Radius.circular(sheetBorderRadius) : Radius.zero,
      bottomRight: !rightSide ? Radius.circular(sheetBorderRadius) : Radius.zero,
    );

    return showGeneralDialog(
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment: (rightSide ? Alignment.centerRight : Alignment.centerLeft),
          child: Material(
            elevation: 8,
            color: Colors.transparent,
            borderRadius: borderRadius,
            child: Container(
              decoration: BoxDecoration(color: sheetColor, borderRadius: borderRadius),
              height: double.infinity,
              width: width ?? MediaQuery.of(context).size.width /  (proportional ?? 1.4),
              child: body,
            ),
          ),
        );
      },
      transitionBuilder: (context, animation1, animation2, child) {
        return SlideTransition(
          position: Tween(begin: Offset((rightSide ? 1 : -1), 0), end: const Offset(0, 0)).animate(animation1),
          child: child,
        );
      },
    );
  }
}
