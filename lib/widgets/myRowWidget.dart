import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rental_travel_app/core/constants/RadiusConst.dart';
import 'package:rental_travel_app/core/constants/iconConst.dart';

class MyRowWidget extends StatelessWidget {
  final String viewall;
  final VoidCallback onPressed;
  const MyRowWidget({
    required this.onPressed,
    required this.viewall,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          viewall.tr(),
          style: Theme.of(context).textTheme.headline6,
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              'view all'.tr(),
              style: Theme.of(context).textTheme.headline6,
            ),
            IconButton(
                splashRadius: RadiusConst.small,
                onPressed: onPressed,
                icon: IconConst.arrowRight)
          ],
        ),
      ],
    );
  }
}
