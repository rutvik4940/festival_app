
import 'package:flutter/cupertino.dart';

import '../screen/festival/festival_screen.dart';
import '../screen/home /home_screen.dart';
import '../screen/splash/splash_screen.dart';


Map<String,WidgetBuilder>app_routes=
{
  "/":(context) => SplashScreen(),
  "home":(context) => HomeScreen(),
  "festival":(context) => FestivalScreen(),

};
