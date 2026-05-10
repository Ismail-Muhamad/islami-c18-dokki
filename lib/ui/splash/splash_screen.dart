import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_c18_dokki/ui/intro/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, IntroScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/mosque.png",
                    width: width * 0.7,
                  ).zoomIn(duration: const Duration(milliseconds: 600)),
                  Image.asset(
                    "assets/images/branding.png",
                    width: width * 0.5,
                  ).zoomIn(duration: const Duration(milliseconds: 600)),
                ],
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/islami_logo.png",
              width: width * 0.4,
            ).zoomIn(duration: const Duration(milliseconds: 600)),
          ),
          Positioned(
            right: width * 0.02,
            child: Image.asset("assets/images/candle.png").slideDown(),
          ),
          Positioned(
            left: 0,
            top: height * 0.2,
            child: Image.asset("assets/images/left_shape.png").slideInLeft(),
          ),
          Positioned(
            right: 0,
            bottom: height * 0.2,
            child: Image.asset("assets/images/right_shape.png").slideInRight(),
          ),
        ],
      ),
    );
  }
}
