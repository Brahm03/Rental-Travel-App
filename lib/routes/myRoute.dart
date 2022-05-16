import 'package:flutter/material.dart';
import 'package:rental_travel_app/view/pages/home/homePage.dart';
import 'package:rental_travel_app/view/screens/splash/splash_page.dart';

class MyRoutes {
  static final MyRoutes _instance = MyRoutes.init();
  static MyRoutes get instance => _instance;
  MyRoutes.init();

  Route? ongenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/splash':
        return pageReturner(const SplashPage());
       case '/':
        return pageReturner(const HomePage());  
    }
  }

  pageReturner(Widget page) => MaterialPageRoute(builder: (_) => page);
}
