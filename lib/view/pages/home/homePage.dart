import 'package:animate_do/animate_do.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_travel_app/base/base_view.dart';
import 'package:rental_travel_app/core/constants/PMconst.dart';
import 'package:rental_travel_app/core/constants/colorConst.dart';
import 'package:rental_travel_app/extension/size_extension.dart';
import 'package:rental_travel_app/view/pages/home/home_cubit/homeCubit.dart';
import 'package:rental_travel_app/view/state/myState.dart';
import 'package:rental_travel_app/widgets/CategoryWidget.dart';
import 'package:rental_travel_app/widgets/ProductMostWidget.dart';
import 'package:rental_travel_app/widgets/ProductWidget.dart';
import 'package:rental_travel_app/widgets/myDropDown.dart';
import 'package:rental_travel_app/widgets/searchBar.dart';

import '../../../widgets/myRowWidget.dart';

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
      body: BaseView(
        viewModel: HomePage,
        onPageBuilder: (context, value) => BlocConsumer<HomeCubit, MyState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is HomeState) {
                var data = context.watch<HomeCubit>();
                var info = state.data;
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      snap: true,
                      floating: true,
                      toolbarHeight: context.h * 0.3 + 50,
                      flexibleSpace: SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      ColorConst.black.withOpacity(0.5),
                                      BlendMode.darken),
                                  image:
                                      const AssetImage('assets/images/room.jpg'),
                                  fit: BoxFit.fill)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: PMconst.medium,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                child: const MyDropDown()),
                                          ],
                                        ),
                                        SizedBox(
                                          height: context.h * 0.040,
                                        ),
                                        Text(
                                          "hi".tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                        Text(
                                          'find'.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                        SizedBox(
                                          height: context.h * 0.040,
                                        ),
                                        SearchBar(
                                          context: context,
                                        ),
                                      ])),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.h * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    categoryWidget(
                                      text: 'Home',
                                      index: 0,
                                      onTap: () {
                                        context
                                            .read<HomeCubit>()
                                            .categoryChange();
                                      },
                                    ),
                                    categoryWidget(
                                      text: 'Apartment',
                                      index: 1,
                                      onTap: () {
                                        context
                                            .read<HomeCubit>()
                                            .categoryChange();
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: data.temp.toList().isEmpty
                          ? SizedBox(
                              height: 700,
                              child: Padding(
                                padding: PMconst.medium,
                                child: Column(
                                  children: [
                                    MyRowWidget(
                                      viewall: 'near',
                                      onPressed: () {},
                                    ),
                                    SizedBox(height: context.h * 0.020),
                                    Container(
                                      alignment: Alignment.center,
                                      height: context.h * 0.3 + 50,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              state.data![data.i_catog].length,
                                          itemBuilder: (_, __) {
                                            return FadeInDownBig(
                                              child: ProductWidget(
                                                room: state.data![data.i_catog]
                                                        [__]['room']
                                                    .toString(),
                                                bathroom: state
                                                    .data![data.i_catog][__]
                                                        ['bathroom']
                                                    .toString(),
                                                bedroom: state.data![data.i_catog]
                                                        [__]['bedroom']
                                                    .toString(),
                                                name: state.data![data.i_catog]
                                                        [__]['name']
                                                    .toString(),
                                                price: state.data![data.i_catog]
                                                        [__]['cost']
                                                    .toString(),
                                                pic: state.data![data.i_catog][__]
                                                        ['pic']
                                                    .toString(),
                                                wifi: true,
                                              ),
                                            );
                                          }),
                                    ),
                                    SizedBox(height: context.h * 0.020),
                                    MyRowWidget(
                                      viewall: 'most',
                                      onPressed: () {},
                                    ),
                                    SizedBox(height: context.h * 0.020),
                                    SizedBox(
                                      height: context.h * 0.150,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_, __) {
                                          return FadeInDownBig(
                                            child: ProductMostWidget(
                                              wifi: true,
                                              bathroom: info![data.i_catog][__]
                                                      ['bathroom']
                                                  .toString(),
                                              bedroom: info[data.i_catog][__]
                                                      ['bedroom']
                                                  .toString(),
                                              name: info[data.i_catog][__]
                                                  ['name'],
                                              pic: info[data.i_catog][__]['pic'],
                                              price: info[data.i_catog][__]
                                                      ['cost']
                                                  .toString(),
                                              room: info[data.i_catog][__]['room']
                                                  .toString(),
                                              location: info[data.i_catog][__]
                                                  ['location'],
                                            ),
                                          );
                                        },
                                        itemCount: info![data.i_catog].length,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: PMconst.medium,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${data.temp.length} items found"),
                                  SizedBox(
                                    width: context.w * 0.9,
                                    height: context.h,
                                    child: ListView.builder(
                                        itemCount: data.temp.toList().length,
                                        itemBuilder: (_, __) {
                                          return SizedBox(
                                            width: context.w * 0.6,
                                            child: ProductWidget(
                                              room: data.temp
                                                  .toList()[__]['room']
                                                  .toString(),
                                              bathroom: data.temp
                                                  .toList()[__]['bathroom']
                                                  .toString(),
                                              bedroom: data.temp
                                                  .toList()[__]['bedroom']
                                                  .toString(),
                                              name: data.temp
                                                  .toList()[__]['name']
                                                  .toString(),
                                              price: data.temp
                                                  .toList()[__]['cost']
                                                  .toString(),
                                              pic: data.temp
                                                  .toList()[__]['pic']
                                                  .toString(),
                                              wifi: true,
                                            ),
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
      ),
    );
  }
}
