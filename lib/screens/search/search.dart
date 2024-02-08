import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:threadsfire/model/suggested_follower.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search",
                  style: GoogleFonts.manrope(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const Gap(10),
                Container(
                  width: double.infinity,
                  height: 44,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Gap(20),
                ...suggestedFollowers.map((follower) {
                  return SuggestedFollowerWidget(follower: follower);
                }).toList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Class for suggested profiles to follow
class SuggestedFollowerWidget extends StatelessWidget {
  const SuggestedFollowerWidget({super.key, required this.follower});

  // Creating and instance of the suggested follower
  final SuggestedFollower follower;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://avatars.dicebear.com/api/avataaars/${follower.username}.png',
                  ),
                  backgroundColor: Colors.white,
                ),
                const Gap(10),
                const Column(
                  children: [Text("John Doe"), Text("@johndoe")],
                )
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6)),
              child: const Text("Follow"),
            )
          ],
        ),
        const Gap(10),
        const Divider(),
        const Gap(10),
      ],
    );
  }
}
