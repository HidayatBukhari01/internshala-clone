import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala_clone/res/colors.dart';

import '../routes/route_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const duration = Duration(seconds: 3);
    Timer(duration, () {
      Navigator.of(context).pushNamedAndRemoveUntil(RouteName.homeScreenRoute, (route) => false);
    });
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: [
          Expanded(
              child: Center(
                  child: Image.asset(
            "assets/images/logo.jpeg",
            width: 150,
          ))),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/trustIcon.jpeg",
                  width: 50,
                ),
                Text(
                  "Trusted by over 21 million\n College students & Graduates",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
