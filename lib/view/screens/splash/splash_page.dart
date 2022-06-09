import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_travel_app/base/base_view.dart';
import 'package:rental_travel_app/core/constants/PMconst.dart';
import 'package:rental_travel_app/extension/size_extension.dart';
import 'package:rental_travel_app/view/screens/splash/cubit/splashCubit.dart';
import 'package:rental_travel_app/view/state/myState.dart';
import 'package:rental_travel_app/widgets/myButton.dart';
import 'package:rental_travel_app/widgets/mydevider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(viewModel: SplashPage, onPageBuilder: (context, widget) => BlocProvider(
        create: ((context) => SplashCubit()), child: splash(context)));
  }

  Scaffold splash(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, MyState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return SafeArea(
            bottom: false,
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: PMconst.large,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: context.h * 0.003,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (_, __) {
                                    return MyDivider(
                                      index: __,
                                    );
                                  }),
                            ),
                            Text(
                              'lets'.tr(),
                              style: Theme.of(context).textTheme.headline3,
                            )
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 9,
                    child: Column(
                      children: [
                        Stack(
                          children:[ SizedBox(
                            height: context.h * 1 - 208,
                            child: InkWell(
                              onTap: context.read<SplashCubit>().changeIndex,
                              child: FadeInLeftBig(
                                child: SizedBox(
                                    child: FadeInImage(fit: BoxFit.cover,placeholder: const AssetImage('assets/images/plane.gif'), image: AssetImage(context.watch<SplashCubit>().pics[context.watch<SplashCubit>().i])),
                                ),
                              ),
                            ),
                          ),
                           Positioned(
                             right: context.w * 0.030,
                             left: context.w * 0.030,
                             bottom: context.h * 0.040,
                             child: MyButton(
                              text: 'submit'.tr(),
                              onpressed: (){
                                context.read<SplashCubit>().changeState(context);
                              }),
                           )
                       ] ),
                       
                      ],
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
