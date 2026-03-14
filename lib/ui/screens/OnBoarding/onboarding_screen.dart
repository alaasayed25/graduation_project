import 'package:flutter/material.dart';
import 'package:untitled1/model/onboardingDM.dart';
import 'package:untitled1/widget/onboardingWidget.dart';

class Onboarding extends StatefulWidget {
  static String routeName="onboarding";
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children:[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(OnboardingDM.onboardingList[staticIndex].image),fit: BoxFit.cover
                ),

              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient:   LinearGradient(colors: [
                    Color(0x08425000),
                    OnboardingDM.onboardingList[staticIndex].color
                  ],
                      begin:Alignment.topCenter,
                      end: Alignment.bottomCenter
                  )
              ),
            ),
            Column(
                children: [
                  Spacer(),
                  OnboardingWidget(setState: SetState)
                ]
            ),
          ]
      ),
    );
  }
  void SetState(){
    setState(() {

    });
  }
}
