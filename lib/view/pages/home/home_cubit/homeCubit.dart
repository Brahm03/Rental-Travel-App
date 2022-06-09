import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rental_travel_app/view/state/myState.dart';
import 'package:flutter/services.dart' as bundle;

class HomeCubit extends Cubit<MyState> {
  HomeCubit() : super(HomeState(data: []));

  GetStorage storage = GetStorage();

  static List? globalData;

  final Set temp = {};

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

  final Map<String, List<String>> searched = {};

  readFromStorage() async {
    debugPrint(globalData![i_catog][0]['name'].toString());
    var er = await storage.read(globalData![i_catog][1]['name']);
    debugPrint(er);
  }

  writeToStorage(int i, String al) async {
    await storage.write(globalData![i_catog][i]['name'], al);
  }

  search(String text) {
    for (var i = 0; i < globalData![i_catog].length; i++) {
      if (text.isEmpty) {
        temp.clear();
        readFromStorage();
        emit(HomeState(data: globalData));
      } else if (globalData![i_catog][i]['name']
          .toString()
          .toLowerCase()
          .contains(text.toString().toLowerCase())) {
        try {
          temp.add(globalData![i_catog][i]);
          searched.addAll({globalData![i_catog][i]['name']: []});
          debugPrint(searched.length.toString());
          emit(HomeState(data: globalData));
          int al = 0;

          for (var j = 0; j < searched.keys.length; j++) {
            debugPrint(searched.keys.last);
            debugPrint("Searched >> ${searched.keys}");

            if (searched.containsKey(globalData![i_catog][i]['name'])) {
              al++;
              List<String> temp = [];
              temp.add(al.toString());
              searched.addAll({
                globalData![i_catog]['name']: temp
              });
              debugPrint("al >>>> ${al.toString()}");
              debugPrint("SEARCHED  >>>> ${searched.values}");
            }
          }
          return temp.toList();
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    }
  }

  Set mostSearched = {};

  int i_catog = 0;

  categoryChange() {
    i_catog++;
    if (i_catog == 2) {
      i_catog = 0;
    }
    debugPrint(i_catog.toString());
    emit(HomeState(data: globalData));
    debugPrint(globalData![i_catog].toString());
  }
}
