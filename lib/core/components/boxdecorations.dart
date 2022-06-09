import 'package:flutter/material.dart';
import 'package:rental_travel_app/core/constants/RadiusConst.dart';
import 'package:rental_travel_app/core/constants/colorConst.dart';

class BoxDecorations {
  static boxALLdecorations(Color color) {
    return BoxDecoration(boxShadow: [
      BoxShadow(
          color: ColorConst.grey.withOpacity(0.5),
          blurRadius: 30,
          spreadRadius: 2,
          offset: Offset(10, 5))
    ], color: color, borderRadius: BorderRadius.circular(RadiusConst.medium));
  }

  static boxBottomdecarions(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(RadiusConst.medium),
            bottomRight: Radius.circular(RadiusConst.medium)));
  }

  static boxTopdecorations({required Color color}) {
    return  BoxDecoration(
      color: color,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(RadiusConst.medium),
            topRight: Radius.circular(RadiusConst.medium)));
  }
}
