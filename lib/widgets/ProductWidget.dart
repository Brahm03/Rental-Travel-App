import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rental_travel_app/core/components/boxdecorations.dart';
import 'package:rental_travel_app/core/constants/colorConst.dart';
import 'package:rental_travel_app/extension/size_extension.dart';

class ProductWidget extends StatelessWidget {
  final bool wifi;
  final String name;
  final String bedroom;
  final String bathroom;
  final String room;
  final String pic;
  final String price;
  const ProductWidget(
      {required this.price,required this.room,
      required this.bathroom,
      required this.bedroom,
      required this.name,
      required this.pic,
      required this.wifi,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.h * 0.040,top: context.h * 0.040,left: context.w * 0.050),
      width: context.w * 0.75,
      height: context.h * 0.25,
      // color: Colors.yellow,
      decoration: BoxDecorations.boxALLdecorations(ColorConst.white),
      child: Column(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                  decoration: BoxDecorations.boxTopdecorations(
                      color: ColorConst.kPrimaryColor,
                      image: 'https://source.unsplash.com/random'))),
          Expanded(
            flex: 4,
            child: Container(
              width: context.w,
              padding: const EdgeInsets.only(left: 15.0),
              decoration: BoxDecorations.boxBottomdecarions(Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: ColorConst.kPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "$room ${"room".tr()} - $bedroom ${"bedroom".tr()} - $bathroom ${"bathroom".tr()}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  Row(
                    children: [
                       Text(
                        "$price \$",
                        style: const TextStyle(
                            color: ColorConst.kPrimaryColor, fontSize: 18.0),
                      ),
                      Text(
                        "/${"night".tr()}",
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
