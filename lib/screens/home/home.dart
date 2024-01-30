// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart'; // Make sure you have the import for Gap
import 'package:google_fonts/google_fonts.dart';
import 'package:threadsfire/model/thread_message.dart';
import 'package:threadsfire/screens/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key})
      : super(key: key); // Removed const and added Key?

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomNavBar()));
                  },
                  child: const Center(
                    child: Image(
                      image: AssetImage("assets/images/logo.png"),
                      height: 40,
                    ),
                  ),
                ),
                const Gap(20),
                ListView.builder(
                    itemCount: threadMessages.length,
                    itemBuilder: (context, index) {
                      return ThreadMessageWidget(
                        message: threadMessages[index],
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThreadMessageWidget extends StatelessWidget {
  const ThreadMessageWidget({
    super.key,
    required this.message,
  });

  // Creating instance of the thread message module
  final ThreadMessage message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://avatars.dicebear.com/api/avataaars/${message.senderName}.png"),
              backgroundColor: Colors.white,
            ),
            const Gap(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Humble",
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "5mins",
                        style: GoogleFonts.manrope(fontSize: 10),
                      ),
                      const Gap(6),
                      const Icon(Icons.more_horiz),
                    ],
                  ),
                  Text(
                    "Hey man do well to call me as soon as possible"
                    "so we can discuss your future",
                    style: GoogleFonts.manrope(fontSize: 14),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/heart.svg",
                        width: 18,
                        color: Colors.black,
                      ),
                      const Gap(10),
                      SvgPicture.asset(
                        "assets/icons/comment.svg",
                        width: 16,
                      ),
                      const Gap(10),
                      SvgPicture.asset(
                        "assets/icons/repeat.svg",
                        width: 18,
                      ),
                      const Gap(10),
                      SvgPicture.asset(
                        "assets/icons/send.svg",
                        width: 16,
                      ),
                      const Gap(10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(10),
        Divider(
          color: Colors.grey.shade300,
        ),
        const Gap(10)
      ],
    );
  }
}
