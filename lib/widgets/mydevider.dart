import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_travel_app/core/constants/colorConst.dart';
import 'package:rental_travel_app/extension/size_extension.dart';
import 'package:rental_travel_app/view/screens/splash/cubit/splashCubit.dart';

class MyDivider extends StatelessWidget {
  final int index;
  const MyDivider({required this.index,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.h * 0.005),
      child: Container(
        height: context.h * 0.005,
        width: context.w * 0.3,
        color: index == context.watch<SplashCubit>().i ? ColorConst.kPrimaryColor : ColorConst.grey,
      ),
    );
  }
}
