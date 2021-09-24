import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'pages/champion_details.dart';
import 'pages/home_page.dart';
import 'services/global.dart';
import 'services/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => Global().inicia());
  await Get.putAsync(() => Utils().inicia());

  runApp(
    GetMaterialApp(
      getPages: [
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/championDetails', page: () => ChampionPage()),
      ],
      theme: ThemeData.dark().copyWith(
        //primaryColor: Colors.teal.shade300,
        primaryColor: Colors.grey[800],
        backgroundColor: Colors.grey,
        colorScheme: ColorScheme.dark().copyWith(
          primary: Colors.black,
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      locale: Get.deviceLocale,
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
    ),
  );
}
