import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rental_travel_app/core/components/boxdecorations.dart';
import 'package:rental_travel_app/core/constants/PMconst.dart';
import 'package:rental_travel_app/core/constants/RadiusConst.dart';
import 'package:rental_travel_app/core/constants/colorConst.dart';
import 'package:rental_travel_app/extension/size_extension.dart';

class ProductMostWidget extends StatelessWidget {
  final bool wifi;
  final String name;
  final String bedroom;
  final String bathroom;
  final String room;
  final String pic;
  final String price;
  final String location;
  const ProductMostWidget({required this.location,required this.wifi, required this.bathroom, required this.bedroom, required this.name, required this.pic, required this.price,required this.room,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h * 0.160,
      width: context.w * 0.7,
      child: Row(
        children: [
          SizedBox(
            width: context.w * 0.3,
            child: ClipRRect(
                  borderRadius: BorderRadius.circular(RadiusConst.medium),
                  child: FadeInImage(
                      height: context.h,
                      fadeInCurve: Curves.bounceIn,
                      fit: BoxFit.cover,
                      placeholder: const AssetImage('assets/images/plane.gif'),
                      image: CachedNetworkImageProvider(pic))),
          ),
          Padding(
            padding: PMconst.extraSmall,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hotel'),
                Text(name, style: Theme.of(context).textTheme.headline6,),
                SizedBox(
                  height:  context.h * 0.040,
                  child: FittedBox(
                    child: Text(location,),
                  ),
                ),
                SizedBox(height: context.h * 0.007,),
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
          )
        ],
      ),
    );
  }
}
