import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_travel_app/core/components/boxdecorations.dart';
import 'package:rental_travel_app/core/constants/colorConst.dart';
import 'package:rental_travel_app/extension/size_extension.dart';
import 'package:rental_travel_app/view/pages/home/home_cubit/homeCubit.dart';

class categoryWidget extends StatelessWidget {
  final int index;
  final String text;
  final VoidCallback onTap;
  const categoryWidget({required this.text,required this.index, required this.onTap, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: context.w * 0.4,
        height: context.h * 0.040,
        decoration:
            BoxDecorations.boxTopdecorations(color: index != context.watch<HomeCubit>().i_catog ? ColorConst.kPrimaryColor : Colors.transparent),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
