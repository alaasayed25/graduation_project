import 'package:flutter/material.dart';
import 'package:untitled1/utils/AppColor.dart';

class AppTheme{
 static ThemeData mode=ThemeData(
    scaffoldBackgroundColor: AppColor.black,
    primaryColor: Color(0xffF6BD00),
    iconTheme: IconThemeData(
      color: Color(0xffFFFFFF)
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.black,
    secondary: AppColor.black,
    ),
    textTheme: TextTheme(
      displayMedium:TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w500,
        color: AppColor.white
      ),
      displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColor.white
      ),
      headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColor.white
      ),
      headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColor.black
      ),
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColor.white
      ),
    )
  );
}