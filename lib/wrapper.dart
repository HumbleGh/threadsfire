import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:threadsfire/home/home.dart';
import 'package:threadsfire/screens/splash_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: Hive.box("application").listenable(),
      builder: (context, Box box, child) {
        bool signedIn = box.get('signedIn', defaultValue: false);
        if (!signedIn) {
          return const SplashScreen();
        } else {
          return const HomeScreen();
        }
      },
    ));
  }
}
