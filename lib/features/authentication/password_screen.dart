import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/authentication/view_models/sign_up_view_model.dart';
import 'package:twitter/features/onboarding/interest_screen.dart';
import 'package:twitter/features/navigation/widgets/app_bar.dart';

class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({super.key});

  @override
  PasswordScreenState createState() => PasswordScreenState();
}

class PasswordScreenState extends ConsumerState<PasswordScreen> {
  final _passwordController = TextEditingController();

  bool _isObsecure = true;
  String _password = "";

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleObsecureText() {
    _isObsecure = !_isObsecure;
    setState(() {});
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length >= 8;
  }

  void _onNextTab() {
    if (_isPasswordValid()) {
      final state = ref.read(signUpForm.notifier).state;
      ref.read(signUpForm.notifier).state = {
        ...state,
        'password': _password,
      };
      ref.read(signUpProvider.notifier).signUp();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const InterestScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const AppBarWidget(leadingType: LeadingType.none),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v20,
              const Text(
                "You'll need a password",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: Sizes.size28,
                ),
              ),
              Gaps.v16,
              const Text(
                "Make sure it's 8 characters or more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.v32,
              TextField(
                obscureText: _isObsecure,
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _toggleObsecureText,
                        child: FaIcon(
                          _isObsecure
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          size: Sizes.size20,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Gaps.h16,
                      FaIcon(
                        FontAwesomeIcons.solidCircleCheck,
                        size: _isPasswordValid() ? Sizes.size20 : 0,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: _isPasswordValid() ? Colors.black : Colors.grey,
              borderRadius: BorderRadius.circular(Sizes.size24),
            ),
            child: TextButton(
              onPressed: _onNextTab,
              child: const Text(
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: Sizes.size16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
