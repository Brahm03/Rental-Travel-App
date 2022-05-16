import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_travel_app/base/base_view.dart';
import 'package:rental_travel_app/core/constants/PMconst.dart';
import 'package:rental_travel_app/core/constants/colorConst.dart';
import 'package:rental_travel_app/core/constants/iconConst.dart';
import 'package:rental_travel_app/extension/size_extension.dart';
import 'package:rental_travel_app/view/pages/home/home_cubit/homeCubit.dart';
import 'package:rental_travel_app/view/state/myState.dart';
import 'package:rental_travel_app/widgets/ProductWidget.dart';
import 'package:rental_travel_app/widgets/myDropDown.dart';
import 'package:rental_travel_app/widgets/searchBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomePage,
      onPageBuilder: ((context, value) {
        return BlocProvider(
            create: (_) {
              var cubit = HomeCubit();
              cubit.getData();
              return cubit;
            },
            child: home());
      }),
    );
  }

  Scaffold home() {
    return Scaffold(
      body: BlocConsumer<HomeCubit, MyState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeState) {
              var data = context.watch<HomeCubit>();
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    snap: true,
                    floating: true,
                    toolbarHeight: context.h * 0.3 + 20,
                    flexibleSpace: Container(
                      padding: PMconst.medium,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  ColorConst.black.withOpacity(0.5),
                                  BlendMode.darken),
                              image: const AssetImage('assets/images/room.jpg'),
                              fit: BoxFit.fill)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Spacer(),
                              BlurryContainer(
                                  blur: 5,
                                  width: context.h * 0.070,
                                  height: context.h * 0.070,
                                  elevation: 0,
                                  color: Colors.transparent,
                                  padding: const EdgeInsets.all(8),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: const MyDropDown()),
                            ],
                          ),
                          SizedBox(
                            height: context.h * 0.040,
                          ),
                          Text(
                            "hi".tr(),
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            'find'.tr(),
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(
                            height: context.h * 0.040,
                          ),
                          SearchBar(
                            context: context,
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: data.getTemp.isEmpty
                        ? SizedBox(
                            height: 900,
                            child: Padding(
                              padding: PMconst.medium,
                              child: Column(
                                children: [
                                  const MyRowWidget(viewall: 'near'),
                                  SizedBox(height: context.h * 0.020),
                                  Container(
                                    alignment: Alignment.center,
                                    height: context.h * 0.3 + 50,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: state.data![0].length,
                                        itemBuilder: (_, __) {
                                          return ProductWidget(
                                            room: state.data![0][__]['room']
                                                .toString(),
                                            bathroom: state.data![0][__]
                                                    ['bathroom']
                                                .toString(),
                                            bedroom: state.data![0][__]
                                                    ['bedroom']
                                                .toString(),
                                            name: state.data![0][__]['name']
                                                .toString(),
                                            price: state.data![0][__]['cost']
                                                .toString(),
                                            pic: state.data![0][__]['pic']
                                                .toString(),
                                            wifi: true,
                                          );
                                        }),
                                  ),
                                  SizedBox(height: context.h * 0.020),
                                  const MyRowWidget(
                                    viewall: 'most',
                                  ),
                                  SizedBox(height: context.h * 0.020),
                                  Container(
                                    height: context.h * 0.2,
                                    color: ColorConst.kPrimaryColor,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Padding(
                          padding: PMconst.medium,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${data.getTemp.length} items found"),
                              SizedBox(
                                  height: 900,
                                  child: ListView.builder(
                                      itemCount: state.data![0].length,
                                      itemBuilder: (_, __) {
                                        return ProductWidget(
                                          room: state.data![0][__]['room'].toString(),
                                          bathroom: state.data![0][__]['bathroom']
                                              .toString(),
                                          bedroom: state.data![0][__]['bedroom']
                                              .toString(),
                                          name: state.data![0][__]['name'].toString(),
                                          price:
                                              state.data![0][__]['cost'].toString(),
                                          pic: state.data![0][__]['pic'].toString(),
                                          wifi: true,
                                        );
                                      }),
                                ),
                            ],
                          ),
                        ),
                  )
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }
}

class MyRowWidget extends StatelessWidget {
  final String viewall;
  const MyRowWidget({
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
            IconButton(onPressed: () {}, icon: IconConst.arrowRight)
          ],
        ),
      ],
    );
  }
}
