import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as bundle;

class GetJsonData {
  static Future<List> getData() async {
    final data = await bundle.rootBundle.loadString('lib/mock/data.json');
    final list = jsonDecode(data) as List;
    debugPrint(list.toString());
    return list;
  }
}
