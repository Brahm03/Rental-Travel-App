import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rental_travel_app/config/theme/app_theme.dart';
import 'package:rental_travel_app/routes/myRoute.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale("en", "US"),
        Locale("es", "ES"),
      ],
      fallbackLocale: Locale("es", "ES"),
      path: 'assets/lang',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Travel app',
      theme: AppTheme.light,
      initialRoute: '/splash',
      onGenerateRoute: (s) => MyRoutes.instance.ongenerateRoute(s),
    );
  }
}
