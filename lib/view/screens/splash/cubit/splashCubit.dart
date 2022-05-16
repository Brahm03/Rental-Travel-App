import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_travel_app/view/state/myState.dart';

class SplashCubit extends Cubit<MyState> {
  int i = 0;

  List<String> pics = [
    "assets/images/girl.jpg",
    "assets/images/boy.jpg",
    "assets/images/kids.jpg",
  ];

   void changeState(BuildContext context){
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    emit(HomeState(data: []));
  }

  void changeIndex() {
    i++;
    debugPrint(i.toString());
    if (i == 3) {
      debugPrint('if');
      i = 0;
    } else {
      debugPrint('else');
    }
    emit(SplashState(current: i));
  }

  SplashCubit() : super(SplashState(current: 0));
}
