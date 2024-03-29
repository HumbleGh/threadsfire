// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart'; // Make sure you have the import for Gap
import 'package:google_fonts/google_fonts.dart';
import 'package:threadsfire/model/thread_message.dart';

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
                const Center(
                  child: Image(
                    image: AssetImage("assets/images/logo.png"),
                    height: 30,
                  ),
                ),
                const Gap(20),
                ListView.builder(
                    shrinkWrap: true,
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
                  "https://api.dicebear.com/7.x/adventurer/${message.senderName}.png"),
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
                        message.senderName,
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _getTimeDifference(message.timestamp),
                        style: GoogleFonts.manrope(fontSize: 10),
                      ),
                      const Gap(6),
                      const Icon(Icons.more_horiz),
                    ],
                  ),
                  Text(
                    message.message,
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

  // Creating a function to get time difference (returns a string)

  String _getTimeDifference(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return "Just now";
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} min';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} hr';
    } else {
      return '${difference.inDays} day';
    }
  }
}
