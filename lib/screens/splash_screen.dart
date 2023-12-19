import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:threadsfire/wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  route() {
    Navigator.of(context).pushReplacement(
      PageTransition(
        child: const Wrapper(),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade600,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Fakye",
                  style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 32)),
            ),
          ],
        ),
      ),
    );
  }
}
