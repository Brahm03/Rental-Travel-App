import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_travel_app/core/constants/RadiusConst.dart';
import 'package:rental_travel_app/core/constants/colorConst.dart';
import 'package:rental_travel_app/core/constants/iconConst.dart';
import 'package:rental_travel_app/extension/size_extension.dart';
import 'package:rental_travel_app/view/pages/home/home_cubit/homeCubit.dart';
import 'package:rental_travel_app/widgets/ProductWidget.dart';

class SearchBar extends StatelessWidget {
  final BuildContext context;
  const SearchBar({
    required this.context,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: ColorConst.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(RadiusConst.medium),
                  bottomLeft: Radius.circular(RadiusConst.medium))),
          height: context.h * 0.060,
          width: context.w * 0.6,
          child: TextField(
            onChanged: (value) {
              context.read<HomeCubit>().search(value);
            },
            decoration: InputDecoration(
                hintText: 'hint'.tr(), border: InputBorder.none),
            autocorrect: true,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: ColorConst.kPrimaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(RadiusConst.medium),
                  bottomRight: Radius.circular(RadiusConst.medium))),
          height: context.h * 0.060,
          width: context.w * 0.150,
          child: IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelgate());
              },
              icon: IconConst.filter),
        )
      ],
    );
  }
}

class CustomSearchDelgate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    Set temp = {};

    return ListView.builder(
        itemCount: temp.toList().length,
        itemBuilder: (_, __) {
          return SizedBox(
            width: context.w * 0.6,
            child: ProductWidget(
              room: temp.toList()[__]['room'].toString(),
              bathroom: temp.toList()[__]['bathroom'].toString(),
              bedroom: temp.toList()[__]['bedroom'].toString(),
              name: temp.toList()[__]['name'].toString(),
              price: temp.toList()[__]['cost'].toString(),
              pic: temp.toList()[__]['pic'].toString(),
              wifi: true,
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Set temp = {};

    return ListView.builder(
        itemCount: temp.toList().length,
        itemBuilder: (_, __) {
          return SizedBox(
            width: context.w * 0.6,
            child: ProductWidget(
              room: temp.toList()[__]['room'].toString(),
              bathroom: temp.toList()[__]['bathroom'].toString(),
              bedroom: temp.toList()[__]['bedroom'].toString(),
              name: temp.toList()[__]['name'].toString(),
              price: temp.toList()[__]['cost'].toString(),
              pic: temp.toList()[__]['pic'].toString(),
              wifi: true,
            ),
          );
        });
  }
}
