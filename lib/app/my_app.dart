
import 'package:ecommercefrutes/core/helper_functions/on_generate_route.dart';
import 'package:ecommercefrutes/core/utiles/app_colors.dart';
import 'package:ecommercefrutes/views/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.PrimaryColor),
       fontFamily: 'Cairo'
             ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
       localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale('ar'),
    );
  }
}
