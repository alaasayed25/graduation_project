import 'package:flutter/material.dart';
import 'package:untitled1/ui/screens/OnBoarding/onboarding_screen.dart';
import 'package:untitled1/utils/AppAssets.dart';

class Splash extends StatefulWidget{
  static String routeName="SplashScreen";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),
          () {
        Navigator.pushNamed(context, Onboarding.routeName);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Image.asset(AppAssets.splashScreen,fit: BoxFit.cover,)),
        ],
      ),
    );
  }
}