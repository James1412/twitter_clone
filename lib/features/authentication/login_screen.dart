import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/authentication/create_account_screen.dart';
import 'package:twitter/features/authentication/login_form_screen.dart';
import 'package:twitter/util.dart';

import '../../constants/gaps.dart';
import '../navigation/widgets/app_bar.dart';
import 'widgets/auth_button.dart';
import 'widgets/google_logo.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = isDarkMode(ref);
    return Scaffold(
      appBar: const AppBarWidget(
        leadingType: LeadingType.none,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "See what's happening",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Text(
              "in the world right now.",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v96,
            Gaps.v24,
            AuthButton(
              customPaint: CustomPaint(
                painter: GoogleLogoPainter(),
                size: const Size.square(Sizes.size16),
              ),
              text: "Continue with Google",
            ),
            Gaps.v12,
            const AuthButton(
              icon: FaIcon(FontAwesomeIcons.apple),
              text: "Continue with Apple",
            ),
            Gaps.v12,
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text("or"),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ),
              ],
            ),
            Gaps.v12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthButton(
                  isDark: true,
                  onTap: (context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginFormScreen(),
                      ),
                    );
                  },
                  text: "Log in",
                ),
                Gaps.v24,
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: isDark
                            ? Colors.grey.shade200
                            : Colors.grey.shade900,
                        fontSize: Sizes.size16,
                      ),
                      children: const [
                        TextSpan(
                          text: "Sign up",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
