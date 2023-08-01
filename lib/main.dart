import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taibaa/app/intial_bindings/intial_binding.dart';
import 'package:taibaa/app/routes/app_pages.dart';
import 'package:taibaa/global/consts/color_constant.dart';
import 'package:taibaa/global/consts/constant.dart';

Future<void> main() async {
  runApp(const TaibaaApp());
}

class TaibaaApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  const TaibaaApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: kTransparentColor,
      ),
    );
    return GetCupertinoApp(
      key: TaibaaApp.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Tibaa App',

      defaultTransition: Transition.cupertino,
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: kRedColor,
        scaffoldBackgroundColor: kWhiteColor,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: kFontFamily,
            color: kBlackColor,
          ),
        ),
      ),
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
      ],
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: InitialBindings(),
      // home: const MyHomePage(),
    );
  }
}
