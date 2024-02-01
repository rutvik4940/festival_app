import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    void initState() {
      super.initState();
      Future.delayed( const Duration(seconds:3),() => Navigator.pushReplacementNamed(context, 'home'));
   }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/logo/logo1.png",
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("assets/logo/splash.png"),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                const Center(
                  child: Text(
                    "INDIAN FESTIVAL",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20,fontFamily: "rutvik"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
