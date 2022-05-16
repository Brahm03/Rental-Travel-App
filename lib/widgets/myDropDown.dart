import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_travel_app/view/pages/home/home_cubit/homeCubit.dart';

class MyDropDown extends StatelessWidget {
  const MyDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
          elevation: 0,
          iconSize: 15,
          icon: SvgPicture.asset('assets/icons/Category.svg'),
          items: const [
            DropdownMenuItem(
                value: 'en',
                child: Text(
                  "EN",
                )),
            DropdownMenuItem(
                value: 'es',
                child: Text(
                  "ES",
                )),
          ],
          onChanged: (v) async {
            context.read<HomeCubit>().changeLange(v.toString(), context);
          }),
    );
  }
}
