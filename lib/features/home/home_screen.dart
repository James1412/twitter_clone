import 'package:flutter/material.dart';
import 'package:twitter/features/home/widgets/post.dart';
import '../../constants/sizes.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/';
  static String routeUrl = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.size10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Post(
              isVerified: true,
              repliesLikes: "361 replies • 391 likes",
              time: "2m",
              images: [
                "https://images.unsplash.com/photo-1608229191360-7064b0afa639?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTcwMTgwNjEyMg&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1900",
                "https://images.unsplash.com/photo-1608229191360-7064b0afa639?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTcwMTgwNjEyMg&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1900",
              ],
              name: "James",
              text:
                  "my phone feels like a vibrator with all these notifications rn",
            ),
            Divider(),
            Post(
              isVerified: false,
              repliesLikes: "36 replies • 3 likes",
              time: "2h",
              images: [],
              name: "Kevin",
              text:
                  "my phone feels like a vibrator with all these notifications rn. my phone feels like a vibrator with all these notifications rn",
            ),
            Divider(),
            Post(
              isVerified: true,
              repliesLikes: "6 replies • 391 likes",
              time: "2s",
              images: [],
              name: "Robert",
              text:
                  "my phone feels like a vibrator with all these notifications rn",
            ),
            Divider(),
            Post(
              isVerified: true,
              repliesLikes: "36 replies • 31 likes",
              time: "10m",
              images: [
                "https://images.unsplash.com/photo-1608229191360-7064b0afa639?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTcwMTgwNjEyMg&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1900",
                "https://images.unsplash.com/photo-1608229191360-7064b0afa639?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=800&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTcwMTgwNjEyMg&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1900",
              ],
              name: "James",
              text:
                  "my phone feels like a vibrator with all these notifications rn",
            ),
          ],
        ),
      ),
    );
  }
}
