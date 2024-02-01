import 'package:festival/festival/festival_screen.dart';
import 'package:flutter/cupertino.dart';

import '../home /home_screen.dart';
import '../splash/splash_screen.dart';

Map<String,WidgetBuilder>app_routes=
{
  "/":(context) => SplashScreen(),
  "home":(context) => HomeScreen(),
  "festival":(context) => FestivalScreen(),

};
