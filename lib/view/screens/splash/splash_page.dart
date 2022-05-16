import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_travel_app/core/constants/FontSizeConst.dart';
import 'package:rental_travel_app/core/constants/PMconst.dart';
import 'package:rental_travel_app/core/constants/colorConst.dart';
import 'package:rental_travel_app/extension/size_extension.dart';
import 'package:rental_travel_app/view/pages/home/home_cubit/homeCubit.dart';
import 'package:rental_travel_app/view/screens/splash/cubit/splashCubit.dart';
import 'package:rental_travel_app/view/state/myState.dart';
import 'package:rental_travel_app/widgets/myButton.dart';
import 'package:rental_travel_app/widgets/mydevider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: ((context) => SplashCubit()), child: Splash(context));
  }

  Scaffold Splash(BuildContext context) {
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
                              height: context.h * 0.005,
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
                              style: const TextStyle(
                                  fontFamily: "Circular Std",
                                  fontWeight: FontWeight.w100,
                                  fontSize: FontSizeConst.huge),
                            )
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        Stack(
                          children:[ SizedBox(
                            height: context.h * 1 - 208,
                            child: InkWell(
                              onTap: context.read<SplashCubit>().changeIndex,
                              child: FadeInLeftBig(
                                child: Container(
                                  decoration: BoxDecoration(
                                      backgroundBlendMode: BlendMode.colorDodge,
                                      color: ColorConst.black.withOpacity(0.5),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(context
                                                  .watch<SplashCubit>()
                                                  .pics[context.read<SplashCubit>().i]),
                                          colorFilter: ColorFilter.mode(
                                              ColorConst.black.withOpacity(0.4),
                                              BlendMode.darken))),
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
