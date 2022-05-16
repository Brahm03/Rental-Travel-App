import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_travel_app/view/state/myState.dart';
import 'package:flutter/services.dart' as bundle;

class HomeCubit extends Cubit<MyState> {
  HomeCubit() : super(HomeState(data: []));

  static List? globalData;

  Set _temp = {};

  changeLange(String lang, BuildContext context) {
    if (lang == 'en') {
      context.setLocale(Locale(lang, "US"));
    } else {
      context.setLocale(Locale(lang, lang.toUpperCase()));
    }
    emit(HomeState(data: globalData));
  }

  Future<List> getData() async {
    try {
      emit(LoadingState());
      final data = await bundle.rootBundle.loadString('lib/mock/data.json');
      final list = jsonDecode(data) as List;
      debugPrint(list.toString());
      emit(HomeState(data: list));
      globalData = list;
      return list;
    } catch (e) {
      debugPrint('error');
      return [];
    }
  }

  search(String text) {
    _temp.clear();
    for (var i = 0; i < globalData![0].length; i++) {
      if (text.isEmpty) {
        _temp.clear();
        debugPrint('if');
        emit(HomeState(data: globalData));
      } else if (globalData![0][i]['name']
          .toString()
          .toLowerCase()
          .contains(text.toString().toLowerCase())) {
        debugPrint(globalData![0][i]['name']);
        _temp.add(globalData![0][i]);
        emit(HomeState(data: globalData));
      }
    }
  }
}
