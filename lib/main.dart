// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metaville/screens/constants.dart';
import 'package:metaville/screens/loginscreen.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: Size(375, 812),
    builder: () => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Basics',
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Login(),
    ),
  ));
}