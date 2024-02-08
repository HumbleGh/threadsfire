import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Gap(20),
                const SuggestedFollower(),
                const SuggestedFollower(),
                const SuggestedFollower(),
                const SuggestedFollower(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Class for suggested profiles to follow
class SuggestedFollower extends StatelessWidget {
  const SuggestedFollower({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Row(
              children: [
                CircleAvatar(),
                Gap(10),
                Column(
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
