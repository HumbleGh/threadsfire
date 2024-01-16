import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:threadsfire/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();

  Future<void> signup() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection("users").doc(userId).set({
        'name': fullNameController.text,
        'username': userNameController.text
      });
    } catch (e) {
      print("Error: ${e.toString}");
      return;
    }
    if (mounted) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 60,
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: fullNameController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                hintText: "Enter your full name",
                hintStyle: GoogleFonts.manrope(
                    fontSize: 14, color: Colors.grey.shade600),
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: userNameController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                hintText: "Enter a username",
                hintStyle: GoogleFonts.manrope(
                    fontSize: 14, color: Colors.grey.shade600),
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: emailController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                hintText: "Enter your email",
                hintStyle: GoogleFonts.manrope(
                    fontSize: 14, color: Colors.grey.shade600),
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                hintText: "Create your password",
                hintStyle: GoogleFonts.manrope(
                    fontSize: 14, color: Colors.grey.shade600),
              ),
            ),
            const Gap(10),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     GestureDetector(
            //         onTap: () {}, child: const Text("Forgot Passsword"))
            //   ],
            // ),
            const Gap(30),
            GestureDetector(
              onTap: signup,
              child: Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Create account",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: GoogleFonts.manrope(fontSize: 14, color: Colors.black),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
